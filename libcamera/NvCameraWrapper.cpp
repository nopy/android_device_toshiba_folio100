/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "NvCameraWrapper"

#include <cmath>
#include <dlfcn.h>
#include <fcntl.h>
#include <linux/videodev2.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <camera/Camera.h>
#include "NvCameraWrapper.h"

namespace android {

extern "C" int HAL_getNumberOfCameras()
{
    return 1;
}

extern "C" void HAL_getCameraInfo(int cameraId, struct CameraInfo* cameraInfo)
{
    cameraInfo->facing = CAMERA_FACING_FRONT;
    cameraInfo->orientation = 0;
}

extern "C" sp<CameraHardwareInterface> HAL_openCameraHardware(int cameraId)
{
    LOGD("openCameraHardware: call createInstance");
    return NvCameraWrapper::createInstance(cameraId);
}

wp<CameraHardwareInterface> NvCameraWrapper::singleton;

static sp<CameraHardwareInterface>
openNvInterface(const char *libName, const char *funcName)
{
    sp<CameraHardwareInterface> interface;
    void *libHandle = ::dlopen(libName, RTLD_NOW);

    if (libHandle != NULL) {
        typedef sp<CameraHardwareInterface> (*OpenCamFunc)();
        OpenCamFunc func = (OpenCamFunc) ::dlsym(libHandle, funcName);
        if (func != NULL) {
            interface = func();
        } else {
            LOGE("Could not find library entry point!");
        }
    } else {
        LOGE("dlopen() error: %s\n", dlerror());
    }

    return interface;
}

sp<CameraHardwareInterface> NvCameraWrapper::createInstance(int cameraId)
{
    LOGV("%s :", __func__);
    if (singleton != NULL) {
        sp<CameraHardwareInterface> hardware = singleton.promote();
        if (hardware != NULL) {
            return hardware;
        }
    }

    sp<CameraHardwareInterface> nvInterface;
    sp<CameraHardwareInterface> hardware;

    nvInterface = openNvInterface("libnvcamera.so", "_ZN7android11NvUsbCamera14createInstanceEv") ;

    if (nvInterface != NULL) {
        hardware = new NvCameraWrapper(nvInterface);
        singleton = hardware;
    } else {
        LOGE("Could not open hardware interface");
    }

    return hardware;
}

NvCameraWrapper::NvCameraWrapper(sp<CameraHardwareInterface>& nvInterface) :
    mNvInterface(nvInterface),
    mVideoMode(false),
    mNotifyCb(NULL),
    mDataCb(NULL),
    mDataCbTimestamp(NULL),
    mCbUserData(NULL)
{
}

NvCameraWrapper::~NvCameraWrapper()
{
}

sp<IMemoryHeap>
NvCameraWrapper::getPreviewHeap() const
{
    return mNvInterface->getPreviewHeap();
}

sp<IMemoryHeap>
NvCameraWrapper::getRawHeap() const
{
    return mNvInterface->getRawHeap();
}

void
NvCameraWrapper::setCallbacks(notify_callback notify_cb,
                                  data_callback data_cb,
                                  data_callback_timestamp data_cb_timestamp,
                                  void* user)
{
    mNotifyCb = notify_cb;
    mDataCb = data_cb;
    mDataCbTimestamp = data_cb_timestamp;
    mCbUserData = user;

    if (mNotifyCb != NULL) {
        notify_cb = &NvCameraWrapper::notifyCb;
    }
    if (mDataCb != NULL) {
        data_cb = &NvCameraWrapper::dataCb;
    }
    if (mDataCbTimestamp != NULL) {
        data_cb_timestamp = &NvCameraWrapper::dataCbTimestamp;
    }

    mNvInterface->setCallbacks(notify_cb, data_cb, data_cb_timestamp, this);
}

void
NvCameraWrapper::notifyCb(int32_t msgType, int32_t ext1, int32_t ext2, void* user)
{
    NvCameraWrapper *_this = (NvCameraWrapper *) user;
    user = _this->mCbUserData;

    _this->mNotifyCb(msgType, ext1, ext2, user);
}

void
NvCameraWrapper::dataCb(int32_t msgType, const sp<IMemory>& dataPtr, void* user)
{
    NvCameraWrapper *_this = (NvCameraWrapper *) user;
    user = _this->mCbUserData;


    _this->mDataCb(msgType, dataPtr, user);
}

void
NvCameraWrapper::dataCbTimestamp(nsecs_t timestamp, int32_t msgType,
                                     const sp<IMemory>& dataPtr, void* user)
{
    NvCameraWrapper *_this = (NvCameraWrapper *) user;
    user = _this->mCbUserData;

    _this->mDataCbTimestamp(timestamp, msgType, dataPtr, user);
}

void
NvCameraWrapper::enableMsgType(int32_t msgType)
{
    mNvInterface->enableMsgType(msgType);
}

void
NvCameraWrapper::disableMsgType(int32_t msgType)
{
    mNvInterface->disableMsgType(msgType);
}

bool
NvCameraWrapper::msgTypeEnabled(int32_t msgType)
{
    return mNvInterface->msgTypeEnabled(msgType);
}

status_t
NvCameraWrapper::startPreview()
{
    return mNvInterface->startPreview();
}

bool
NvCameraWrapper::useOverlay()
{
    return mNvInterface->useOverlay();
}

status_t
NvCameraWrapper::setOverlay(const sp<Overlay> &overlay)
{
    return mNvInterface->setOverlay(overlay);
}

void
NvCameraWrapper::stopPreview()
{
    mNvInterface->stopPreview();
}

bool
NvCameraWrapper::previewEnabled()
{
    return mNvInterface->previewEnabled();
}

status_t
NvCameraWrapper::startRecording()
{
    return mNvInterface->startRecording();
}

void
NvCameraWrapper::stopRecording()
{
    mNvInterface->stopRecording();
}

bool
NvCameraWrapper::recordingEnabled()
{
    return mNvInterface->recordingEnabled();
}

void
NvCameraWrapper::releaseRecordingFrame(const sp<IMemory>& mem)
{
    return mNvInterface->releaseRecordingFrame(mem);
}

status_t
NvCameraWrapper::autoFocus()
{
    return mNvInterface->autoFocus();
}

status_t
NvCameraWrapper::cancelAutoFocus()
{
    return mNvInterface->cancelAutoFocus();
}

status_t
NvCameraWrapper::takePicture()
{
    return mNvInterface->takePicture();
}

status_t
NvCameraWrapper::cancelPicture()
{
    return mNvInterface->cancelPicture();
}

status_t
NvCameraWrapper::setParameters(const CameraParameters& params)
{
    CameraParameters pars(params.flatten());

    return mNvInterface->setParameters(pars);
}

CameraParameters
NvCameraWrapper::getParameters() const
{
    CameraParameters ret = mNvInterface->getParameters();
    ret.set( CameraParameters::KEY_SUPPORTED_PREVIEW_FPS_RANGE, "(45,45)") ;
    return ret;
}

status_t
NvCameraWrapper::sendCommand(int32_t cmd, int32_t arg1, int32_t arg2)
{
    return mNvInterface->sendCommand(cmd, arg1, arg2);
}

void
NvCameraWrapper::release()
{
    mNvInterface->release();
}

status_t
NvCameraWrapper::dump(int fd, const Vector<String16>& args) const
{
    return mNvInterface->dump(fd, args);
}

}; //namespace android
