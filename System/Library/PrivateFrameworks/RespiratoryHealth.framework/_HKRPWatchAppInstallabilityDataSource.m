@implementation _HKRPWatchAppInstallabilityDataSource

- (_HKRPWatchAppInstallabilityDataSource)init
{
  return -[_HKRPWatchAppInstallabilityDataSource initWithDevice:](self, "initWithDevice:", 0);
}

- (_HKRPWatchAppInstallabilityDataSource)initWithDevice:(id)a3
{
  id v5;
  _HKRPWatchAppInstallabilityDataSource *v6;
  uint64_t v7;
  NSUserDefaults *userDefaults;
  HKRPOxygenSaturationAvailability *v9;
  HKRPOxygenSaturationAvailability *availability;
  HKRPOxygenSaturationOnboardingCache *v11;
  HKRPOxygenSaturationOnboardingCache *onboardingCache;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HKRPWatchAppInstallabilityDataSource;
  v6 = -[_HKRPWatchAppInstallabilityDataSource init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hkrp_respiratoryDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v7;

    objc_storeStrong((id *)&v6->_device, a3);
    v9 = -[HKRPOxygenSaturationAvailability initWithDevice:]([HKRPOxygenSaturationAvailability alloc], "initWithDevice:", v5);
    availability = v6->_availability;
    v6->_availability = v9;

    v11 = -[HKRPOxygenSaturationOnboardingCache initWithUserDefaults:userDefaultsSyncProvider:]([HKRPOxygenSaturationOnboardingCache alloc], "initWithUserDefaults:userDefaultsSyncProvider:", v6->_userDefaults, 0);
    onboardingCache = v6->_onboardingCache;
    v6->_onboardingCache = v11;

  }
  return v6;
}

- (BOOL)isRunningStoreDemoMode
{
  return objc_msgSend(MEMORY[0x24BDD4198], "isRunningStoreDemoMode");
}

- (BOOL)shouldForceAppInstall
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("ShouldInstallOxygenSaturationWatchApp"));
}

- (BOOL)isTinkerModeEnabled
{
  NRDevice *device;
  void *v3;
  char v4;
  BOOL v5;

  device = self->_device;
  if (device)
  {
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tinkerModeEnabled");
  }
  v5 = v4;

  return v5;
}

- (BOOL)isDeviceSupported
{
  void *v4;
  int v5;
  void *v7;

  if (self->_device)
    return -[HKRPOxygenSaturationAvailability isDeviceSupported](self->_availability, "isDeviceSupported");
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");

  if (v5)
    return -[HKRPOxygenSaturationAvailability isDeviceSupported](self->_availability, "isDeviceSupported");
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    -[_HKRPWatchAppInstallabilityDataSource isDeviceSupported].cold.1(v7, (uint64_t)self, a2);
  return 0;
}

- (BOOL)hasCompletedOnboarding
{
  void *v2;
  char v3;

  -[HKRPOxygenSaturationOnboardingCache hasCompletedOnboarding](self->_onboardingCache, "hasCompletedOnboarding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)selectedCountry
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_onboardingCache, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)isDeviceSupported
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = (void *)objc_opt_class();
  v6 = v5;
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_212196000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ is unsupported on this platform", (uint8_t *)&v8, 0x16u);

}

@end
