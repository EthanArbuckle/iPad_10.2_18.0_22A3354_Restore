@implementation _HKRPOxygenSaturationOnboardingManagerDataSource

- (_HKRPOxygenSaturationOnboardingManagerDataSource)init
{
  _HKRPOxygenSaturationOnboardingManagerDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKRPOxygenSaturationOnboardingManagerDataSource;
  result = -[_HKRPOxygenSaturationOnboardingManagerDataSource init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)isAgeGated
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x24BDD4550]);
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x24BDD4560]);

  return v4;
}

- (BOOL)shouldAdvertise
{
  void *v2;
  BOOL v3;

  -[_HKRPOxygenSaturationOnboardingManagerDataSource countryCodeFromCurrentLocale](self, "countryCodeFromCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HKRPOxygenSaturationAvailability isCountryAllowed:](HKRPOxygenSaturationAvailability, "isCountryAllowed:", v2);

  return v3;
}

- (NSString)countryCodeFromCurrentLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NRDevice)device
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activeDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NRDevice *)v5;
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProvider
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79___HKRPOxygenSaturationOnboardingManagerDataSource_featureAvailabilityProvider__block_invoke;
  v3[3] = &unk_24CD496E8;
  v3[4] = self;
  -[_HKRPOxygenSaturationOnboardingManagerDataSource _lazyPropertyWithLockedBlock:](self, "_lazyPropertyWithLockedBlock:", v3);
  return (HKFeatureAvailabilityProviding *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKRPOxygenSaturationSettings)oxygenSaturationSettings
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76___HKRPOxygenSaturationOnboardingManagerDataSource_oxygenSaturationSettings__block_invoke;
  v3[3] = &unk_24CD496E8;
  v3[4] = self;
  -[_HKRPOxygenSaturationOnboardingManagerDataSource _lazyPropertyWithLockedBlock:](self, "_lazyPropertyWithLockedBlock:", v3);
  return (HKRPOxygenSaturationSettings *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKRPOxygenSaturationOnboardingCache)onboardingCache
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67___HKRPOxygenSaturationOnboardingManagerDataSource_onboardingCache__block_invoke;
  v3[3] = &unk_24CD496E8;
  v3[4] = self;
  -[_HKRPOxygenSaturationOnboardingManagerDataSource _lazyPropertyWithLockedBlock:](self, "_lazyPropertyWithLockedBlock:", v3);
  return (HKRPOxygenSaturationOnboardingCache *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKRegulatoryDomainProvider)mobileCountryCodeManager
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76___HKRPOxygenSaturationOnboardingManagerDataSource_mobileCountryCodeManager__block_invoke;
  v3[3] = &unk_24CD496E8;
  v3[4] = self;
  -[_HKRPOxygenSaturationOnboardingManagerDataSource _lazyPropertyWithLockedBlock:](self, "_lazyPropertyWithLockedBlock:", v3);
  return (HKRegulatoryDomainProvider *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_lazyPropertyWithLockedBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);
  void *v5;

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, 0);
  objc_storeStrong((id *)&self->_onboardingCache, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationSettings, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationAvailability, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
}

@end
