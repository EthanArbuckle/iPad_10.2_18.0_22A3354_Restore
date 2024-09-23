@implementation HKRPOxygenSaturationOnboardingManager

- (HKRPOxygenSaturationOnboardingManager)init
{
  _HKRPOxygenSaturationOnboardingManagerDataSource *v3;
  HKRPOxygenSaturationOnboardingManager *v4;

  v3 = objc_alloc_init(_HKRPOxygenSaturationOnboardingManagerDataSource);
  v4 = -[HKRPOxygenSaturationOnboardingManager initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (HKRPOxygenSaturationOnboardingManager)initWithDataSource:(id)a3
{
  id v5;
  HKRPOxygenSaturationOnboardingManager *v6;
  HKRPOxygenSaturationOnboardingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRPOxygenSaturationOnboardingManager;
  v6 = -[HKRPOxygenSaturationOnboardingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (HKRPOxygenSaturationOnboardingManager)initWithDevice:(id)a3
{
  id v4;
  _HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource *v5;
  HKRPOxygenSaturationOnboardingManager *v6;

  v4 = a3;
  v5 = -[_HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource initWithDevice:]([_HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource alloc], "initWithDevice:", v4);

  v6 = -[HKRPOxygenSaturationOnboardingManager initWithDataSource:](self, "initWithDataSource:", v5);
  return v6;
}

- (BOOL)settingsShouldAppear
{
  return -[HKRPOxygenSaturationOnboardingManager bloodOxygenFeatureEnabled](self, "bloodOxygenFeatureEnabled")
      && -[HKRPOxygenSaturationOnboardingManager pairedDeviceIsAppropriate](self, "pairedDeviceIsAppropriate")
      && -[HKRPOxygenSaturationOnboardingManager ageIsAppropriate](self, "ageIsAppropriate");
}

- (BOOL)bloodOxygenFeatureEnabled
{
  int v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = -[HKRPOxygenSaturationOnboardingManagerDataSource isBloodOxygenSaturationEnabled](self->_dataSource, "isBloodOxygenSaturationEnabled");
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 1024;
    v10 = v2;
    v5 = v8;
    _os_log_impl(&dword_212196000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature is enabled: %d", (uint8_t *)&v7, 0x12u);

  }
  return v2;
}

- (BOOL)pairedDeviceIsAppropriate
{
  return !-[HKRPOxygenSaturationOnboardingManager _isAlternateDevice](self, "_isAlternateDevice")
      && -[HKRPOxygenSaturationOnboardingManager _currentDeviceHasCapability](self, "_currentDeviceHasCapability");
}

- (BOOL)_currentDeviceHasCapability
{
  void *v3;
  NSObject *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[HKRPOxygenSaturationOnboardingManagerDataSource skipHardwareCheck](self->_dataSource, "skipHardwareCheck"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      v18 = (id)objc_opt_class();
      v5 = v18;
      _os_log_impl(&dword_212196000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device check override is in place", buf, 0xCu);

    }
    return 1;
  }
  else
  {
    -[HKRPOxygenSaturationOnboardingManagerDataSource featureAvailabilityProvider](self->_dataSource, "featureAvailabilityProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3050];
    v11 = *MEMORY[0x24BDD3050];
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v10;
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2114;
        v20 = v8;
        v14 = v13;
        _os_log_impl(&dword_212196000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device check result: %{public}@", buf, 0x16u);

      }
      v6 = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[HKRPOxygenSaturationOnboardingManager _currentDeviceHasCapability].cold.1();
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)_isAlternateDevice
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HKRPOxygenSaturationOnboardingManagerDataSource device](self->_dataSource, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 1024;
      v16 = v5;
      v8 = v14;
      _os_log_impl(&dword_212196000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Alternate device check: alternate device flag: %d", (uint8_t *)&v13, 0x12u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v13 = 138543362;
      v14 = (id)objc_opt_class();
      v11 = v14;
      _os_log_impl(&dword_212196000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Alternate device check: active device is nil", (uint8_t *)&v13, 0xCu);

    }
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)ageIsAppropriate
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = -[HKRPOxygenSaturationOnboardingManagerDataSource isAgeGated](self->_dataSource, "isAgeGated") ^ 1;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_212196000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Age is appropriate for oxygen saturation: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  return v2;
}

- (BOOL)shouldAdvertise
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = -[HKRPOxygenSaturationOnboardingManagerDataSource shouldAdvertise](self->_dataSource, "shouldAdvertise");
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_212196000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should advertise onboarding of feature: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  return v2;
}

- (BOOL)onboardingShouldAppear
{
  _BOOL4 v3;

  v3 = -[HKRPOxygenSaturationOnboardingManager settingsShouldAppear](self, "settingsShouldAppear");
  if (v3)
    LOBYTE(v3) = !-[HKRPOxygenSaturationOnboardingManager onboardingComplete](self, "onboardingComplete");
  return v3;
}

- (BOOL)onboardingDuringPairingShouldAppear
{
  return -[HKRPOxygenSaturationOnboardingManager onboardingShouldAppear](self, "onboardingShouldAppear")
      && !-[HKRPOxygenSaturationOnboardingManager bloodOxygenRemoteDisabled](self, "bloodOxygenRemoteDisabled")
      && -[HKRPOxygenSaturationOnboardingManager shouldAdvertise](self, "shouldAdvertise");
}

- (BOOL)onboardingComplete
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKRPOxygenSaturationOnboardingManagerDataSource featureAvailabilityProvider](self->_dataSource, "featureAvailabilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "onboardedCountryCodeSupportedStateWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;

  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      v9 = v8;
      NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_212196000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completed state: %{public}@", buf, 0x16u);

    }
    if (v5 <= 5)
      v11 = (5u >> v5) & 1;
    else
      LOBYTE(v11) = 1;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
      -[HKRPOxygenSaturationOnboardingManager onboardingComplete].cold.1();
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)bloodOxygenRemoteDisabled
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  unint64_t v16;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HKRPOxygenSaturationOnboardingManagerDataSource featureAvailabilityProvider](self->_dataSource, "featureAvailabilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "onboardedCountryCodeSupportedStateWithError:", &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  if (!v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
      -[HKRPOxygenSaturationOnboardingManager bloodOxygenRemoteDisabled].cold.1();
    goto LABEL_13;
  }
  v6 = objc_msgSend(v4, "integerValue");
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3050];
  v8 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_212196000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completed state: %{public}@", buf, 0x16u);

  }
  if ((unint64_t)(v6 - 2) < 2 || v6 == 5)
  {
LABEL_13:
    LOBYTE(v16) = 0;
    goto LABEL_14;
  }
  if (v6 == 1)
  {

    -[HKRPOxygenSaturationOnboardingManagerDataSource featureAvailabilityProvider](self->_dataSource, "featureAvailabilityProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v14, "onboardingEligibilityForCountryCode:error:", 0, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v18;

    if (v15)
    {
      v16 = ((unint64_t)objc_msgSend(v15, "ineligibilityReasons") >> 6) & 1;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        -[HKRPOxygenSaturationOnboardingManager bloodOxygenRemoteDisabled].cold.2();
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 1;
  }
LABEL_14:

  return v16;
}

- (void)onboardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11[2];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to onboard feature, checking country code...", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[HKRPOxygenSaturationOnboardingManagerDataSource mobileCountryCodeManager](self->_dataSource, "mobileCountryCodeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke;
  v9[3] = &unk_24CD496C0;
  v11[1] = v5;
  v8 = v4;
  v9[4] = self;
  v10 = v8;
  objc_copyWeak(v11, (id *)buf);
  objc_msgSend(v7, "fetchMobileCountryCodeFromCellularWithCompletion:", v9);

  objc_destroyWeak(v11);
  objc_destroyWeak((id *)buf);

}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  os_log_t v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26[2];
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3050];
  v8 = *MEMORY[0x24BDD3050];
  v9 = *MEMORY[0x24BDD3050];
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v11 = v8;
      objc_msgSend(v5, "ISOCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v10;
      v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_212196000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting current onboarding version completed for %{public}@...", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureAvailabilityProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ISOCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v13, "canCompleteOnboardingForCountryCode:error:", v14, &v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v31;

    if (v15)
    {
      if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureAvailabilityProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ISOCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v5, "provenance");
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3;
        v23[3] = &unk_24CD49698;
        v26[1] = *(id *)(a1 + 56);
        v24 = v5;
        objc_copyWeak(v26, (id *)(a1 + 48));
        v25 = *(id *)(a1 + 40);
        objc_msgSend(v17, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v18, v19, 0, 0, v23);

        objc_destroyWeak(v26);
        v20 = &v24;
LABEL_15:

        goto LABEL_16;
      }
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_2;
      v27[3] = &unk_24CD49648;
      v22 = v27;
      v27[4] = v5;
      v28 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v27);

    }
    else
    {
      _HKInitializeLogging();
      v21 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_2(a1, v21, v5);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_190;
      v29[3] = &unk_24CD49648;
      v22 = v29;
      v29[4] = v5;
      v30 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v29);

    }
    v20 = (id *)(v22 + 4);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_185;
  block[3] = &unk_24CD49648;
  v33 = v6;
  v34 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v16 = v33;
LABEL_16:

}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_185(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:underlyingError:", 109, CFSTR("country code not found"), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_190(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "ISOCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Feature unavailable for country code %@ (error)"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "ISOCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Feature unavailable for country code %@"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
LABEL_7:
    v12 = 1;
    goto LABEL_18;
  }
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD2BE8];
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD2BE8]) & 1) != 0)
  {
    v9 = objc_msgSend(v6, "code");

    if (v9 == 115)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v26 = v11;
        _os_log_impl(&dword_212196000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] The user has previously onboarded this feature, ignoring feature availability store error", buf, 0xCu);
      }

      v6 = 0;
      goto LABEL_7;
    }
  }
  else
  {

  }
  v13 = v6;
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", v8) & 1) != 0)
  {
    v15 = objc_msgSend(v13, "code");

    if (v15 == 3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:underlyingError:", 110, CFSTR("Feature unavailable"), v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
        __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_1(a1, v16);
      v12 = 0;
      goto LABEL_18;
    }
  }
  else
  {

  }
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_2(a1, v17, (uint64_t)v13);
  v12 = 0;
  v6 = v13;
LABEL_18:
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_198;
  v20[3] = &unk_24CD49670;
  objc_copyWeak(&v23, (id *)(a1 + 48));
  v18 = *(id *)(a1 + 40);
  v24 = v12;
  v21 = v6;
  v22 = v18;
  v19 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

  objc_destroyWeak(&v23);
}

uint64_t __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_198(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cacheCompletedOnboardingStateIfNeeded");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cacheCompletedOnboardingStateIfNeeded
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_4();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_212196000, v4, v5, "[%{public}@] Unable to cache the fact that onboarding has completed: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (HKRPOxygenSaturationOnboardingManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)_currentDeviceHasCapability
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_4();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_212196000, v4, v5, "[%{public}@] Device check failed: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)onboardingComplete
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_4();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_212196000, v4, v5, "[%{public}@] On board check failed: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)bloodOxygenRemoteDisabled
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_4();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_212196000, v4, v5, "[%{public}@] Remote disabled check failed eligibility check with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_3(&dword_212196000, a3, (uint64_t)a3, "[%{public}@] Unable to onboard feature: %{public}@", (uint8_t *)&v4);
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = a2;
  objc_msgSend(a3, "ISOCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_212196000, v5, v7, "[%{public}@] Cannot onboard with country code %{public}@, it is not supported", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1();
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "ISOCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v2;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_212196000, v4, v6, "[%{public}@] Cannot onboard with country code %{public}@, it is not supported", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1();
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "ISOCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v4;
  OUTLINED_FUNCTION_7();
  v11 = v8;
  v12 = a3;
  _os_log_error_impl(&dword_212196000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to set current onboarding version completed for %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
