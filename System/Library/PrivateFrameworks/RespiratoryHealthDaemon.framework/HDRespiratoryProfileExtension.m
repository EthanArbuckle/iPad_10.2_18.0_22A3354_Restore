@implementation HDRespiratoryProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  HDFeatureAvailabilityExtension *v4;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDD2E48]))
    v4 = self->_featureAvailabilityManager;
  else
    v4 = 0;
  return v4;
}

- (HDRespiratoryProfileExtension)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HDRespiratoryProfileExtension *v8;

  v4 = a3;
  HDRPOxygenSaturationRecordingFeatureAvailabilityProvider(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBCF50]);
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x24BDD4550]);
  v8 = -[HDRespiratoryProfileExtension initWithProfile:featureAvailabilityManager:ageGatingDefaults:](self, "initWithProfile:featureAvailabilityManager:ageGatingDefaults:", v4, v5, v7);

  return v8;
}

- (HDRespiratoryProfileExtension)initWithProfile:(id)a3 featureAvailabilityManager:(id)a4 ageGatingDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDRespiratoryProfileExtension *v11;
  HDRespiratoryProfileExtension *v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  _QWORD *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  HKRPOxygenSaturationOnboardingCacher *onboardingCacher;
  void *v27;
  int v28;
  uint64_t v29;
  HDBackgroundFeatureDeliveryManager *featureDeliveryManager;
  HDRPRespiratoryDailyAnalytics *v31;
  HDRPRespiratoryDailyAnalytics *dailyAnalytics;
  id WeakRetained;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)HDRespiratoryProfileExtension;
  v11 = -[HDRespiratoryProfileExtension init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_featureAvailabilityManager, a4);
    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    _HKInitializeLogging();
    v15 = (_QWORD *)MEMORY[0x24BDD3050];
    v16 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      v19 = v18;
      _os_log_impl(&dword_21A8A8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);

    }
    objc_storeStrong((id *)&v12->_ageGatingDefaults, a5);
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isAppleWatch");

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "hkrp_respiratoryDefaults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x24BE808D8]);
      v24 = (void *)objc_msgSend(v23, "initWithUserDefaultsDomain:", *MEMORY[0x24BDD36F0]);
      v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE808B8]), "initWithFeatureAvailabilityProviding:userDefaults:userDefaultsSyncProvider:", v12->_featureAvailabilityManager, v22, v24);
      onboardingCacher = v12->_onboardingCacher;
      v12->_onboardingCacher = (HKRPOxygenSaturationOnboardingCacher *)v25;

    }
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isCompanionCapable");

    if (v28)
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x24BE40A48]), "initWithProfile:featureAvailabilityExtension:loggingCategory:", v8, v9, *v15);
      featureDeliveryManager = v12->_featureDeliveryManager;
      v12->_featureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v29;

      v31 = -[HDRPRespiratoryDailyAnalytics initWithProfile:featureAvailabilityProvider:]([HDRPRespiratoryDailyAnalytics alloc], "initWithProfile:featureAvailabilityProvider:", v8, v12->_featureAvailabilityManager);
      dailyAnalytics = v12->_dailyAnalytics;
      v12->_dailyAnalytics = v31;

    }
    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v12, v12->_queue);

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSUserDefaults removeObserver:forKeyPath:](self->_ageGatingDefaults, "removeObserver:forKeyPath:", self, *MEMORY[0x24BDD4560]);
  v3.receiver = self;
  v3.super_class = (Class)HDRespiratoryProfileExtension;
  -[HDRespiratoryProfileExtension dealloc](&v3, sel_dealloc);
}

- (void)startObservingAgeGatingDefaults
{
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_ageGatingDefaults, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x24BDD4560], 3, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  objc_super v14;
  _QWORD block[5];
  id v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD4560]))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__HDRespiratoryProfileExtension_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24DD42A30;
    block[4] = self;
    v16 = v10;
    v17 = v12;
    dispatch_async(queue, block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HDRespiratoryProfileExtension;
    -[HDRespiratoryProfileExtension observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __80__HDRespiratoryProfileExtension_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = *MEMORY[0x24BDD0E80];
    v8 = v4;
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_21A8A8000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", (uint8_t *)&v12, 0x2Au);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundRecordingSettings");
}

- (id)oxygenSaturationSessionWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  HLOxygenSaturationSession *v10;
  HLOxygenSaturationSession *v11;

  v6 = a3;
  v7 = a4;
  -[HDRespiratoryProfileExtension unitTesting_healthLiteSessionWithDelegateHandler](self, "unitTesting_healthLiteSessionWithDelegateHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    v10 = (HLOxygenSaturationSession *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[HLOxygenSaturationSession initWithDelegate:onQueue:]([HLOxygenSaturationSession alloc], "initWithDelegate:onQueue:", v6, v7);
  }
  v11 = v10;

  return v11;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCompanionCapable");

  if (v5)
  {
    -[HDRespiratoryProfileExtension _setupSettingsWithProfile:](self, "_setupSettingsWithProfile:", v6);
    -[HDRespiratoryProfileExtension _updateBackgroundRecordingSettings](self, "_updateBackgroundRecordingSettings");
  }
  -[HDFeatureAvailabilityExtension registerObserver:queue:](self->_featureAvailabilityManager, "registerObserver:queue:", self, self->_queue);
  -[HDRespiratoryProfileExtension startObservingAgeGatingDefaults](self, "startObservingAgeGatingDefaults");

}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  HDRespiratoryProfileExtension *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_21A8A8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notice of onboarding completion change", (uint8_t *)&v6, 0xCu);
  }
  -[HDRespiratoryProfileExtension _updateBackgroundRecordingSettings](self, "_updateBackgroundRecordingSettings");
  -[HDRespiratoryProfileExtension _setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:](self, "_setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:", v4);

}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  NSObject *v4;
  int v5;
  HDRespiratoryProfileExtension *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_21A8A8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notice of onboarding completion data becoming available", (uint8_t *)&v5, 0xCu);
  }
  -[HDRespiratoryProfileExtension _updateBackgroundRecordingSettings](self, "_updateBackgroundRecordingSettings");
}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  NSObject *v4;
  int v5;
  HDRespiratoryProfileExtension *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_21A8A8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notice of region list change", (uint8_t *)&v5, 0xCu);
  }
  -[HDRespiratoryProfileExtension _updateBackgroundRecordingSettings](self, "_updateBackgroundRecordingSettings");
}

- (void)_setupSettingsWithProfile:(id)a3
{
  id v4;
  void *v5;
  HKRPOxygenSaturationSettings *v6;
  HKRPOxygenSaturationSettings *settings;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "hkrp_respiratoryDefaults", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE808D8]);
  v5 = (void *)objc_msgSend(v4, "initWithUserDefaultsDomain:", *MEMORY[0x24BDD36F0]);
  v6 = (HKRPOxygenSaturationSettings *)objc_msgSend(objc_alloc(MEMORY[0x24BE808D0]), "initWithUserDefaults:userDefaultsSyncProvider:", v8, v5);
  settings = self->_settings;
  self->_settings = v6;

}

- (void)_setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  objc_msgSend(a3, "featureOnboardingRecordWithError:", &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isAppleInternalInstall"))
    {
      v7 = objc_msgSend(v4, "onboardingState");

      if (v7 == 1)
      {
        _HKInitializeLogging();
        v8 = (void *)*MEMORY[0x24BDD3050];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v21 = v10;
          v11 = v10;
          _os_log_impl(&dword_21A8A8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing user defaults settings", buf, 0xCu);

        }
        -[HKRPOxygenSaturationSettings reset](self->_settings, "reset");
        goto LABEL_16;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isCompanionCapable"))
    {
      v14 = objc_msgSend(v4, "onboardingState");

      if (v14 == 2)
      {
        _HKInitializeLogging();
        v15 = (void *)*MEMORY[0x24BDD3050];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          v17 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v21 = v17;
          v18 = v17;
          _os_log_impl(&dword_21A8A8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing defaults settings", buf, 0xCu);

        }
        -[HKRPOxygenSaturationSettings activateDefaultValuesIfNeeded](self->_settings, "activateDefaultValuesIfNeeded");
      }
    }
    else
    {

    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
      -[HDRespiratoryProfileExtension _setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:].cold.1(v12);
  }
LABEL_16:

}

- (void)_updateBackgroundRecordingSettings
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v5, v6, "[%{public}@] Failed to check if Blood Oxygen is supported with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDRPRespiratoryDailyAnalytics)dailyAnalytics
{
  return self->_dailyAnalytics;
}

- (id)unitTesting_healthLiteSessionWithDelegateHandler
{
  return self->_unitTesting_healthLiteSessionWithDelegateHandler;
}

- (void)setUnitTesting_healthLiteSessionWithDelegateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (HDFeatureAvailabilityExtension)featureAvailabilityManager
{
  return self->_featureAvailabilityManager;
}

- (void)setFeatureAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_featureAvailabilityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_healthLiteSessionWithDelegateHandler, 0);
  objc_storeStrong((id *)&self->_dailyAnalytics, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_ageGatingDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_onboardingCacher, 0);
  objc_storeStrong((id *)&self->_featureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

- (void)_setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v5, v6, "[%{public}@] Failed to remove user defaults settings with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
