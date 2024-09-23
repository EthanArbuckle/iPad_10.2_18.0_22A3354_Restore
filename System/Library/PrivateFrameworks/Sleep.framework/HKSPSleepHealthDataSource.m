@implementation HKSPSleepHealthDataSource

- (HKSPSleepHealthDataSource)initWithSleepStore:(id)a3 healthDataSource:(id)a4
{
  id v6;
  id v7;
  HKSPPairedDeviceRegistryProvider *v8;
  HKSPSleepHealthDataSource *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HKSPPairedDeviceRegistryProvider);
  v9 = -[HKSPSleepHealthDataSource initWithSleepStore:healthDataSource:pairedDeviceRegistry:](self, "initWithSleepStore:healthDataSource:pairedDeviceRegistry:", v7, v6, v8);

  return v9;
}

- (HKSPSleepHealthDataSource)initWithSleepStore:(id)a3 healthDataSource:(id)a4 pairedDeviceRegistry:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSPSleepHealthDataSource *v12;
  NSObject *v13;
  int v14;
  id *p_weakHealthDataSource;
  HKFeatureAvailabilityHealthDataSource *v16;
  HKFeatureAvailabilityHealthDataSource *strongHealthDataSource;
  HKSPSleepHealthDataSource *v18;
  objc_super v20;
  uint8_t buf[4];
  HKSPSleepHealthDataSource *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKSPSleepHealthDataSource;
  v12 = -[HKSPSleepHealthDataSource init](&v20, sel_init);
  if (v12)
  {
    HKSPLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v12->_sleepStore, a3);
    objc_storeStrong((id *)&v12->_pairedDeviceRegistry, a5);
    v14 = objc_msgSend(v10, "requiresWeakRetention");
    p_weakHealthDataSource = (id *)&v12->_weakHealthDataSource;
    if (v14)
    {
      objc_storeWeak(p_weakHealthDataSource, v10);
      v16 = 0;
    }
    else
    {
      objc_storeWeak(p_weakHealthDataSource, 0);
      v16 = (HKFeatureAvailabilityHealthDataSource *)v10;
    }
    strongHealthDataSource = v12->_strongHealthDataSource;
    v12->_strongHealthDataSource = v16;

    v18 = v12;
  }

  return v12;
}

- (HKFeatureAvailabilityHealthDataSource)healthDataSource
{
  HKFeatureAvailabilityHealthDataSource *WeakRetained;
  HKFeatureAvailabilityHealthDataSource *strongHealthDataSource;
  HKFeatureAvailabilityHealthDataSource *v5;
  NSObject *v7;
  int v8;
  HKSPSleepHealthDataSource *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  strongHealthDataSource = WeakRetained;
  if (WeakRetained || (strongHealthDataSource = self->_strongHealthDataSource) != 0)
  {
    v5 = strongHealthDataSource;
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "%{public}@ health data source is nil", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresWeakRetention
{
  return 0;
}

- (HKProfileIdentifier)profileIdentifier
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  HKSPSleepHealthDataSource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning profile identifier", (uint8_t *)&v7, 0xCu);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKProfileIdentifier *)v5;
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  id v4;
  int IsProvidedBySleepDaemon;
  NSObject *v6;
  _BOOL4 v7;
  HKSPFeatureAvailabilityStore *v8;
  void *v9;
  void *v10;
  HKSPFeatureAvailabilityStore *v11;
  int v13;
  HKSPSleepHealthDataSource *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IsProvidedBySleepDaemon = HKFeatureIdentifierIsProvidedBySleepDaemon();
  HKSPLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (IsProvidedBySleepDaemon)
  {
    if (v7)
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ returning sleep feature availability store for featureIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v8 = [HKSPFeatureAvailabilityStore alloc];
    -[HKSPSleepHealthDataSource sleepStore](self, "sleepStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepHealthDataSource pairedDeviceRegistry](self, "pairedDeviceRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKSPFeatureAvailabilityStore initWithFeatureIdentifier:sleepStore:pairedDeviceRegistry:](v8, "initWithFeatureIdentifier:sleepStore:pairedDeviceRegistry:", v4, v9, v10);

  }
  else
  {
    if (v7)
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ returning health feature availability store for featureIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureAvailabilityProvidingForFeatureIdentifier:", v4);
    v11 = (HKSPFeatureAvailabilityStore *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)sharedRequirementEvaluationDataSource
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  HKSPSleepHealthDataSource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ shared requirement evaluation data source", (uint8_t *)&v7, 0xCu);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedRequirementEvaluationDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)healthDataRequirementEvaluationProvider
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  HKSPSleepHealthDataSource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning health data requirement evaluation provider", (uint8_t *)&v7, 0xCu);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthDataRequirementEvaluationProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requirementSatisfactionOverridesDataSource
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  HKSPSleepHealthDataSource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning requirement satisfaction overrides data source", (uint8_t *)&v7, 0xCu);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requirementSatisfactionOverridesDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)watchLowPowerModeDataSource
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  HKSPSleepHealthDataSource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning watch low power mode data source", (uint8_t *)&v7, 0xCu);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchLowPowerModeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wristDetectionSettingManager
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  HKSPSleepHealthDataSource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning wrist detection manager", (uint8_t *)&v7, 0xCu);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wristDetectionSettingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)userCharacteristicForDataType:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  HKSPSleepHealthDataSource *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ returning user characteristics for datatype: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[HKSPSleepHealthDataSource healthDataSource](self, "healthDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userCharacteristicForDataType:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (HKSPFeatureAvailabilityPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (HKFeatureAvailabilityHealthDataSource)weakHealthDataSource
{
  return (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
}

- (HKFeatureAvailabilityHealthDataSource)strongHealthDataSource
{
  return self->_strongHealthDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongHealthDataSource, 0);
  objc_destroyWeak((id *)&self->_weakHealthDataSource);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

@end
