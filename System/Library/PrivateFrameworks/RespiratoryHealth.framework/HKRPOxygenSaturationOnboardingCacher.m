@implementation HKRPOxygenSaturationOnboardingCacher

- (HKRPOxygenSaturationOnboardingCacher)initWithFeatureAvailabilityProviding:(id)a3 userDefaults:(id)a4 userDefaultsSyncProvider:(id)a5
{
  return -[HKRPOxygenSaturationOnboardingCacher initWithFeatureAvailabilityProviding:userDefaults:userDefaultsSyncProvider:didStart:](self, "initWithFeatureAvailabilityProviding:userDefaults:userDefaultsSyncProvider:didStart:", a3, a4, a5, 0);
}

- (HKRPOxygenSaturationOnboardingCacher)initWithFeatureAvailabilityProviding:(id)a3 userDefaults:(id)a4 userDefaultsSyncProvider:(id)a5 didStart:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKRPOxygenSaturationOnboardingCacher *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  _QWORD v23[4];
  HKRPOxygenSaturationOnboardingCacher *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[HKRPOxygenSaturationOnboardingCacher init](self, "init");
  if (v15)
  {
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_featureAvailabilityProvider, a3);
    objc_storeStrong((id *)&v15->_userDefaults, a4);
    objc_storeStrong((id *)&v15->_userDefaultsSyncProvider, a5);
    -[HKFeatureAvailabilityProviding registerObserver:queue:](v15->_featureAvailabilityProvider, "registerObserver:queue:", v15, v15->_queue);
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      *(_DWORD *)buf = 138543362;
      v27 = (id)objc_opt_class();
      v20 = v27;
      _os_log_impl(&dword_212196000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered for feature availability changes", buf, 0xCu);

    }
    v21 = v15->_queue;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __124__HKRPOxygenSaturationOnboardingCacher_initWithFeatureAvailabilityProviding_userDefaults_userDefaultsSyncProvider_didStart___block_invoke;
    v23[3] = &unk_24CD49648;
    v24 = v15;
    v25 = v14;
    dispatch_async(v21, v23);

  }
  return v15;
}

uint64_t __124__HKRPOxygenSaturationOnboardingCacher_initWithFeatureAvailabilityProviding_userDefaults_userDefaultsSyncProvider_didStart___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_featureAvailabilityDidChange");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[HKFeatureAvailabilityProviding unregisterObserver:](self->_featureAvailabilityProvider, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HKRPOxygenSaturationOnboardingCacher;
  -[HKRPOxygenSaturationOnboardingCacher dealloc](&v3, sel_dealloc);
}

- (void)_queue_featureAvailabilityDidChange
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_212196000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Can't determine if the current onboarding version is compatible: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaultsSyncProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
}

@end
