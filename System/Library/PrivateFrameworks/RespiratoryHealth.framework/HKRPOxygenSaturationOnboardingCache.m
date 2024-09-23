@implementation HKRPOxygenSaturationOnboardingCache

- (HKRPOxygenSaturationOnboardingCache)initWithUserDefaults:(id)a3 userDefaultsSyncProvider:(id)a4
{
  id v7;
  id v8;
  HKRPOxygenSaturationOnboardingCache *v9;
  HKRPOxygenSaturationOnboardingCache *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKRPOxygenSaturationOnboardingCache;
  v9 = -[HKRPOxygenSaturationOnboardingCache init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_userDefaultsSyncProvider, a4);
  }

  return v10;
}

- (NSNumber)hasCompletedOnboarding
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("HasCompletedOnboarding"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSNumber *)v3;
}

- (void)setHasCompletedOnboarding:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKRPUserDefaultsSyncProviding *userDefaultsSyncProvider;
  void *v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)v10 = 138543618;
    *(_QWORD *)&v10[4] = objc_opt_class();
    *(_WORD *)&v10[12] = 2114;
    *(_QWORD *)&v10[14] = v4;
    v7 = *(id *)&v10[4];
    _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting has completed onboarding: %{public}@", v10, 0x16u);

  }
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("HasCompletedOnboarding"), *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("HasCompletedOnboarding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](userDefaultsSyncProvider, "synchronizeKeys:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsSyncProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
