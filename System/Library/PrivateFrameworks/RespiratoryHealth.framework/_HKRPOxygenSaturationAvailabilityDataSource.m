@implementation _HKRPOxygenSaturationAvailabilityDataSource

- (_HKRPOxygenSaturationAvailabilityDataSource)initWithDevice:(id)a3
{
  id v5;
  _HKRPOxygenSaturationAvailabilityDataSource *v6;
  _HKRPOxygenSaturationAvailabilityDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKRPOxygenSaturationAvailabilityDataSource;
  v6 = -[_HKRPOxygenSaturationAvailabilityDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (BOOL)deviceIsSupported
{
  NRDevice *device;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  const char *v11;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  device = self->_device;
  if (device)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BD3A4341-7090-4622-9694-2AC0F536C478"));
    v5 = -[NRDevice supportsCapability:](device, "supportsCapability:", v4);

    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      v9 = CFSTR("false");
      if (v5)
        v9 = CFSTR("true");
      v20 = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v10 = v8;
      v11 = "[%{public}@] Paired device supports Scandium: %{public}@";
LABEL_11:
      _os_log_impl(&dword_212196000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isAppleWatch");

    if (v14)
    {
      v5 = MGGetBoolAnswer();
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v15;
        v16 = (void *)objc_opt_class();
        v17 = CFSTR("false");
        if (v5)
          v17 = CFSTR("true");
        v20 = 138543618;
        v21 = v16;
        v22 = 2114;
        v23 = v17;
        v10 = v16;
        v11 = "[%{public}@] Device supports Scandium: %{public}@";
        goto LABEL_11;
      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
        -[_HKRPWatchAppInstallabilityDataSource isDeviceSupported].cold.1(v18, (uint64_t)self, a2);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
