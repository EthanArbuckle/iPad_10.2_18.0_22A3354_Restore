@implementation VTBiometricMatchMonitor

- (VTBiometricMatchMonitor)init
{
  VTBiometricMatchMonitor *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  BKDevice *biometricDevice;
  NSObject *v12;
  id v14;
  objc_super v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)VTBiometricMatchMonitor;
  v2 = -[VTEventMonitor init](&v15, sel_init);
  if (v2)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v3 = (void *)getBKDeviceClass_softClass;
    v19 = getBKDeviceClass_softClass;
    if (!getBKDeviceClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v21 = __getBKDeviceClass_block_invoke;
      v22 = &unk_24C7F5000;
      v23 = &v16;
      __getBKDeviceClass_block_invoke((uint64_t)&buf);
      v3 = (void *)v17[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v16, 8);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v5 = (void *)getBKDeviceManagerClass_softClass;
    v19 = getBKDeviceManagerClass_softClass;
    if (!getBKDeviceManagerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v21 = __getBKDeviceManagerClass_block_invoke;
      v22 = &unk_24C7F5000;
      v23 = &v16;
      __getBKDeviceManagerClass_block_invoke((uint64_t)&buf);
      v5 = (void *)v17[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v16, 8);
    objc_msgSend(v6, "availableDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "deviceWithDescriptor:error:", v8, &v14);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v14;
    biometricDevice = v2->_biometricDevice;
    v2->_biometricDevice = (BKDevice *)v9;

    if (v10 || !v2->_biometricDevice)
    {
      v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_error_impl(&dword_20D965000, v12, OS_LOG_TYPE_ERROR, "Failed to create biometricdevice with error %@", (uint8_t *)&buf, 0xCu);
      }
    }

  }
  return v2;
}

- (void)startObserving
{
  BKDevice *biometricDevice;

  biometricDevice = self->_biometricDevice;
  if (biometricDevice)
    -[BKDevice setDelegate:](biometricDevice, "setDelegate:", self);
}

- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4
{
  BKDevice *biometricDevice;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x24BDAC8D0];
  biometricDevice = self->_biometricDevice;
  if (!biometricDevice)
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    v14 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR);
    if (!v14)
      return v14;
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20D965000, v15, OS_LOG_TYPE_ERROR, "ERR: Biometric device is nil - Bailing out", buf, 2u);
LABEL_15:
    LOBYTE(v14) = 0;
    return v14;
  }
  v17 = 0;
  -[BKDevice lastMatchEventWithError:](biometricDevice, "lastMatchEventWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = VTLogContextFacilityVoiceTrigger;
  v10 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v19 = v8;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "BiometricMatchEvents unavailable with error %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  if (v10)
  {
    v11 = v9;
    v12 = objc_msgSend(v7, "result");
    v13 = objc_msgSend(v7, "timeStamp");
    *(_DWORD *)buf = 67109376;
    v19[0] = v12;
    LOWORD(v19[1]) = 2048;
    *(_QWORD *)((char *)&v19[1] + 2) = v13;
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "BiometricMatchEvent: result = %u, timeStamp = %llu", buf, 0x12u);

  }
  if (a3)
    *a3 = objc_msgSend(v7, "result");
  if (a4)
    *a4 = objc_msgSend(v7, "timeStamp");

  LOBYTE(v14) = 1;
  return v14;
}

- (void)device:(id)a3 matchEventOccurred:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  VTBiometricMatchMonitorDelegate **p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v14[0] = 67109376;
    v14[1] = objc_msgSend(v7, "result");
    v15 = 2048;
    v16 = objc_msgSend(v7, "timeStamp");
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "BiometricMatchEventOccurred: result = %u, timeStamp = %llu", (uint8_t *)v14, 0x12u);

  }
  if (v7)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v13, "biometricMatchMonitorDidReceiveMatchAttempt:atTime:", objc_msgSend(v7, "result"), objc_msgSend(v7, "timeStamp"));

    }
  }

}

- (VTBiometricMatchMonitorDelegate)delegate
{
  return (VTBiometricMatchMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKDevice)biometricDevice
{
  return self->_biometricDevice;
}

- (void)setBiometricDevice:(id)a3
{
  objc_storeStrong((id *)&self->_biometricDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (VTBiometricMatchMonitor)sharedInstance
{
  if (sharedInstance_onceToken_6393 != -1)
    dispatch_once(&sharedInstance_onceToken_6393, &__block_literal_global_6394);
  return (VTBiometricMatchMonitor *)(id)sharedInstance_biometricMatchMonitor;
}

void __41__VTBiometricMatchMonitor_sharedInstance__block_invoke()
{
  VTBiometricMatchMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTBiometricMatchMonitor);
  v1 = (void *)sharedInstance_biometricMatchMonitor;
  sharedInstance_biometricMatchMonitor = (uint64_t)v0;

}

@end
