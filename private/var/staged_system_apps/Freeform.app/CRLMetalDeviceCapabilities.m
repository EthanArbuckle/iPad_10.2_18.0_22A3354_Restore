@implementation CRLMetalDeviceCapabilities

- (CRLMetalDeviceCapabilities)initWithDevice:(id)a3
{
  id v4;
  CRLMetalDeviceCapabilities *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLMetalDeviceCapabilities;
  v5 = -[CRLMetalDeviceCapabilities init](&v10, "init");
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B130);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2FA54();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B150);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalDeviceCapabilities initWithDevice:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMetalDeviceCapabilities.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 20, 0, "invalid nil value for '%{public}s'", "device");

    }
    objc_storeWeak((id *)&v5->_device, v4);
    v5->_deviceGPUFamily = -[CRLMetalDeviceCapabilities p_deviceGPUFamily](v5, "p_deviceGPUFamily");
    -[CRLMetalDeviceCapabilities p_assignFeatureSet](v5, "p_assignFeatureSet");
  }

  return v5;
}

- (int64_t)p_deviceGPUFamily
{
  MTLDevice **p_device;
  id WeakRetained;
  unsigned __int8 v4;
  id v6;
  unsigned __int8 v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  unsigned int v13;

  p_device = &self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v4 = objc_msgSend(WeakRetained, "supportsFamily:", 1005);

  if ((v4 & 1) != 0)
    return 5;
  v6 = objc_loadWeakRetained((id *)p_device);
  v7 = objc_msgSend(v6, "supportsFamily:", 1004);

  if ((v7 & 1) != 0)
    return 4;
  v8 = objc_loadWeakRetained((id *)p_device);
  v9 = objc_msgSend(v8, "supportsFamily:", 1003);

  if ((v9 & 1) != 0)
    return 3;
  v10 = objc_loadWeakRetained((id *)p_device);
  v11 = objc_msgSend(v10, "supportsFamily:", 1002);

  if ((v11 & 1) != 0)
    return 2;
  v12 = objc_loadWeakRetained((id *)p_device);
  v13 = objc_msgSend(v12, "supportsFamily:", 1001);

  return v13;
}

- (BOOL)supportsGPUFamily:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if ((unint64_t)(a3 - 6) > 0xFFFFFFFFFFFFFFFALL)
    return self->_deviceGPUFamily >= a3;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B170);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2FB00();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B190);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalDeviceCapabilities supportsGPUFamily:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMetalDeviceCapabilities.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 62, 0, "Can't compare iOS to macOS GPUs.");

  return 0;
}

- (void)p_assignFeatureSet
{
  double v3;

  self->_supportsFunctionBufferReadWrite = 0;
  self->_maximumTotalThreadgroupMemory = 16352.0;
  if (-[CRLMetalDeviceCapabilities supportsGPUFamily:](self, "supportsGPUFamily:", 5))
  {
    self->_supportsFunctionBufferReadWrite = 1;
    v3 = 65536.0;
LABEL_5:
    self->_maximumTotalThreadgroupMemory = v3;
    goto LABEL_6;
  }
  if (-[CRLMetalDeviceCapabilities supportsGPUFamily:](self, "supportsGPUFamily:", 4))
  {
    self->_supportsFunctionBufferReadWrite = 1;
    v3 = 32768.0;
    goto LABEL_5;
  }
  if (-[CRLMetalDeviceCapabilities supportsGPUFamily:](self, "supportsGPUFamily:", 3))
  {
    self->_maximumTotalThreadgroupMemory = 16384.0;
    self->_supportsFunctionBufferReadWrite = 1;
  }
LABEL_6:
  self->_isCoreImageMetalCapable = -[CRLMetalDeviceCapabilities supportsGPUFamily:](self, "supportsGPUFamily:", 1);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (BOOL)supportsFunctionBufferReadWrite
{
  return self->_supportsFunctionBufferReadWrite;
}

- (double)maximumTotalThreadgroupMemory
{
  return self->_maximumTotalThreadgroupMemory;
}

- (BOOL)isCoreImageMetalCapable
{
  return self->_isCoreImageMetalCapable;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
}

@end
