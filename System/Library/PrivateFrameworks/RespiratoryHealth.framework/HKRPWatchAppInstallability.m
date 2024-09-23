@implementation HKRPWatchAppInstallability

- (HKRPWatchAppInstallability)init
{
  _HKRPWatchAppInstallabilityDataSource *v3;
  HKRPWatchAppInstallability *v4;

  v3 = objc_alloc_init(_HKRPWatchAppInstallabilityDataSource);
  v4 = -[HKRPWatchAppInstallability initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (HKRPWatchAppInstallability)initWithDevice:(id)a3
{
  id v4;
  _HKRPWatchAppInstallabilityDataSource *v5;
  HKRPWatchAppInstallability *v6;

  v4 = a3;
  v5 = -[_HKRPWatchAppInstallabilityDataSource initWithDevice:]([_HKRPWatchAppInstallabilityDataSource alloc], "initWithDevice:", v4);

  v6 = -[HKRPWatchAppInstallability initWithDataSource:](self, "initWithDataSource:", v5);
  return v6;
}

- (HKRPWatchAppInstallability)initWithDataSource:(id)a3
{
  id v5;
  HKRPWatchAppInstallability *v6;
  HKRPWatchAppInstallability *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRPWatchAppInstallability;
  v6 = -[HKRPWatchAppInstallability init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (BOOL)shouldInstallWatchApp
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  const char *v8;
  void *v9;
  _BOOL4 v10;
  char v11;
  char v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((-[HKRPWatchAppInstallabilityDataSource isBloodOxygenSaturationEnabled](self->_dataSource, "isBloodOxygenSaturationEnabled") & 1) != 0)
  {
    if (-[HKRPWatchAppInstallabilityDataSource isTinkerModeEnabled](self->_dataSource, "isTinkerModeEnabled"))
    {
      _HKInitializeLogging();
      v3 = (void *)*MEMORY[0x24BDD3050];
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (v4)
      {
        v6 = v3;
        v17 = 138543362;
        v18 = (id)objc_opt_class();
        v7 = v18;
        v8 = "[%{public}@] -> 0 (Not allowed in Satellite Pairing Mode)";
LABEL_7:
        _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, 0xCu);

        LOBYTE(v5) = 0;
      }
    }
    else
    {
      v11 = -[HKRPWatchAppInstallabilityDataSource isDeviceSupported](self->_dataSource, "isDeviceSupported");
      v12 = -[HKRPWatchAppInstallabilityDataSource shouldForceAppInstall](self->_dataSource, "shouldForceAppInstall");
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x24BDD3050];
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) == 0 && (v12 & 1) == 0)
      {
        if (!v5)
          return v5;
        v6 = v13;
        v17 = 138543362;
        v18 = (id)objc_opt_class();
        v7 = v18;
        v8 = "[%{public}@] -> 0 (Device hardware not supported)";
        goto LABEL_7;
      }
      if (v5)
      {
        v14 = v13;
        v17 = 138543362;
        v18 = (id)objc_opt_class();
        v15 = v18;
        _os_log_impl(&dword_212196000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] -> 1 (App installation not restricted)", (uint8_t *)&v17, 0xCu);

      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3050];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v5) = 0;
    if (v10)
    {
      v6 = v9;
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v7 = v18;
      v8 = "[%{public}@] -> 0 (Not allowed when feature is disabled)";
      goto LABEL_7;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
