@implementation HKSPFeatureAvailabilityStore

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[HKSPFeatureAvailabilityStore _onboardingModelWithError:](self, "_onboardingModelWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPFeatureAvailabilityStore _isCurrentOnboardingVersionCompletedForOnboardingModel:](self, "_isCurrentOnboardingVersionCompletedForOnboardingModel:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) == 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletion:featureSettings:", 1, 0, 0);
  v21 = 0;
  -[HKSPFeatureAvailabilityStore _featureSettingsModelWithError:](self, "_featureSettingsModelWithError:", &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  v9 = v8;
  if (v7)
  {
    v20 = 0;
    -[HKSPFeatureAvailabilityStore _onboardingModelWithError:](self, "_onboardingModelWithError:", &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    v12 = v11;
    if (v10)
    {
      v13 = -[HKSPFeatureAvailabilityStore _onboardedCountrySupportedStateForOnboardingModel:](self, "_onboardedCountrySupportedStateForOnboardingModel:", v10);
      -[HKSPFeatureAvailabilityStore _onboardingCompletionForOnboardingModel:](self, "_onboardingCompletionForOnboardingModel:", v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[HKSPFeatureAvailabilityStore _featureSettingsForOnboardingModel:featureSettingsModel:](self, "_featureSettingsForOnboardingModel:featureSettingsModel:", v10, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletion:featureSettings:", v13, v14, v15);

LABEL_16:
      goto LABEL_17;
    }
    v19 = v11;
    v14 = v19;
    if (v19)
    {
      if (a3)
      {
        v14 = objc_retainAutorelease(v19);
        v16 = 0;
        *a3 = v14;
        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
    v16 = 0;
    goto LABEL_16;
  }
  v18 = v8;
  v12 = v18;
  if (!v18)
    goto LABEL_13;
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_13:
    v16 = 0;
    goto LABEL_17;
  }
  v12 = objc_retainAutorelease(v18);
  v16 = 0;
  *a3 = v12;
LABEL_17:

  return v16;
}

- (id)_onboardingModelWithError:(id *)a3
{
  void *v4;

  -[HKSPSleepOnboardingStore currentSleepEventRecordWithError:](self->_sleepStore, "currentSleepEventRecordWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPFeatureAvailabilityStore _updateCachedOnboardingModel:](self, "_updateCachedOnboardingModel:", v4);
  return v4;
}

- (id)_onboardingCompletionForOnboardingModel:(id)a3
{
  id v4;
  void *v5;
  int64_t feature;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSString *featureIdentifier;

  v4 = a3;
  v5 = v4;
  feature = self->_feature;
  if (feature == 2)
  {
    if (objc_msgSend(v4, "isCurrentSleepWindDownShortcutsOnboardingCompleted"))
    {
      v7 = objc_msgSend(v5, "sleepWindDownShortcutsOnboardingCompletedVersion");
      objc_msgSend(v5, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_16;
  }
  if (feature == 1)
  {
    if (objc_msgSend(v4, "isCurrentSleepTrackingOnboardingCompleted"))
    {
      v7 = objc_msgSend(v5, "sleepTrackingOnboardingCompletedVersion");
      objc_msgSend(v5, "sleepTrackingOnboardingFirstCompletedDate");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (feature)
  {
    v9 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  if (!objc_msgSend(v4, "isCurrentSleepCoachingOnboardingCompleted"))
    goto LABEL_11;
  v7 = objc_msgSend(v5, "sleepCoachingOnboardingCompletedVersion");
  objc_msgSend(v5, "sleepCoachingOnboardingFirstCompletedDate");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;
LABEL_13:
  v11 = objc_alloc(MEMORY[0x1E0CB6990]);
  featureIdentifier = self->_featureIdentifier;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)objc_msgSend(v11, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", featureIdentifier, v7, v9, 0, 0);

LABEL_16:
  return v10;
}

- (int64_t)_onboardedCountrySupportedStateForOnboardingModel:(id)a3
{
  if (-[HKSPFeatureAvailabilityStore _isCurrentOnboardingVersionCompletedForOnboardingModel:](self, "_isCurrentOnboardingVersionCompletedForOnboardingModel:", a3))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (id)_featureSettingsModelWithError:(id *)a3
{
  void *v4;

  -[HKSPSleepOnboardingStore currentSleepSettingsWithError:](self->_sleepStore, "currentSleepSettingsWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPFeatureAvailabilityStore _updateCachedFeatureSettingsModel:](self, "_updateCachedFeatureSettingsModel:", v4);
  return v4;
}

- (BOOL)_updateCachedFeatureSettingsModel:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__HKSPFeatureAvailabilityStore__updateCachedFeatureSettingsModel___block_invoke;
    v8[3] = &unk_1E4E3AF20;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    -[HKSPFeatureAvailabilityStore _withLock:](self, "_withLock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_featureSettingsForOnboardingModel:(id)a3 featureSettingsModel:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  int64_t feature;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[HKSPFeatureAvailabilityStore _isCurrentOnboardingVersionCompletedForOnboardingModel:](self, "_isCurrentOnboardingVersionCompletedForOnboardingModel:", a3);
  v8 = 0;
  if (v6)
  {
    if (v7)
    {
      v8 = 0;
      feature = self->_feature;
      if (feature)
      {
        if (feature != 2)
        {
          if (feature == 1)
            v10 = objc_msgSend(v6, "sleepTrackingFeatureEnabled");
          else
            v10 = 0;
          v11 = objc_alloc(MEMORY[0x1E0CB6720]);
          v15 = *MEMORY[0x1E0CB50C8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)objc_msgSend(v11, "initWithDictionary:", v13);

        }
      }
    }
  }

  return v8;
}

void __63__HKSPFeatureAvailabilityStore__onboardingModelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_updateCachedOnboardingModel:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__HKSPFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "_isCurrentOnboardingVersionCompletedForOnboardingModel:", a2));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v8, v7);

}

- (BOOL)_isCurrentOnboardingVersionCompletedForOnboardingModel:(id)a3
{
  id v4;
  void *v5;
  int64_t feature;
  char v7;

  v4 = a3;
  v5 = v4;
  feature = self->_feature;
  switch(feature)
  {
    case 2:
      v7 = objc_msgSend(v4, "isCurrentSleepWindDownShortcutsOnboardingCompleted");
      goto LABEL_7;
    case 1:
      v7 = objc_msgSend(v4, "isCurrentSleepTrackingOnboardingCompleted");
      goto LABEL_7;
    case 0:
      v7 = objc_msgSend(v4, "isCurrentSleepCoachingOnboardingCompleted");
LABEL_7:
      LOBYTE(self) = v7;
      break;
  }

  return self & 1;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HKSPFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v6[3] = &unk_1E4E3B700;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKSPFeatureAvailabilityStore _onboardingModelWithCompletion:](self, "_onboardingModelWithCompletion:", v6);

}

- (void)_onboardingModelWithCompletion:(id)a3
{
  id v4;
  HKSPSleepOnboardingStore *sleepStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sleepStore = self->_sleepStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HKSPFeatureAvailabilityStore__onboardingModelWithCompletion___block_invoke;
  v7[3] = &unk_1E4E3AD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKSPSleepOnboardingStore currentSleepEventRecordWithCompletion:](sleepStore, "currentSleepEventRecordWithCompletion:", v7);

}

- (HKSPFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 sleepStore:(id)a4
{
  id v6;
  id v7;
  HKSPPairedDeviceRegistryProvider *v8;
  HKSPFeatureAvailabilityStore *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HKSPPairedDeviceRegistryProvider);
  v9 = -[HKSPFeatureAvailabilityStore initWithFeatureIdentifier:sleepStore:pairedDeviceRegistry:](self, "initWithFeatureIdentifier:sleepStore:pairedDeviceRegistry:", v7, v6, v8);

  return v9;
}

- (HKSPFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 sleepStore:(id)a4 pairedDeviceRegistry:(id)a5
{
  id v10;
  id v11;
  id v12;
  HKSPFeatureAvailabilityStore *v13;
  HKSPFeatureAvailabilityStore *v14;
  HKSPObserverSet *v15;
  HKSPObserverSet *observers;
  uint64_t v17;
  void *v18;
  HKSPFeatureAvailabilityStore *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKSPFeatureAvailabilityStore;
  v13 = -[HKSPFeatureAvailabilityStore init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_featureIdentifier, a3);
    objc_storeStrong((id *)&v14->_sleepStore, a4);
    v15 = objc_alloc_init(HKSPObserverSet);
    observers = v14->_observers;
    v14->_observers = v15;

    objc_storeStrong((id *)&v14->_pairedDeviceRegistry, a5);
    v14->_deviceCharacteristicChangeNotifyToken = -1;
    v14->_modelLock._os_unfair_lock_opaque = 0;
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB5098]))
    {
      v14->_feature = 0;
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB50A0]))
      {
        v17 = 1;
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB5090]))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("HKSPFeatureAvailabilityStore.m"), 102, CFSTR("Unsupported feature identifier %@"), v10);

          goto LABEL_10;
        }
        v17 = 2;
      }
      v14->_feature = v17;
    }
LABEL_10:
    -[HKSPFeatureAvailabilityStore _registerForNotifications](v14, "_registerForNotifications");
    v19 = v14;
  }

  return v14;
}

- (BOOL)_updateCachedOnboardingModel:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__HKSPFeatureAvailabilityStore__updateCachedOnboardingModel___block_invoke;
    v8[3] = &unk_1E4E3AF20;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    -[HKSPFeatureAvailabilityStore _withLock:](self, "_withLock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_modelLock;
  void (**v4)(_QWORD);

  p_modelLock = &self->_modelLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_modelLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_modelLock);
}

void __61__HKSPFeatureAvailabilityStore__updateCachedOnboardingModel___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
    v3 = objc_msgSend(v2, "isEqualToOnboardingModel:", *(_QWORD *)(a1 + 40)) ^ 1;
  else
    LOBYTE(v3) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKSPObserverSet *observers;
  id v6;
  id v7;

  observers = self->_observers;
  v6 = a3;
  HKSPQueueBackedScheduler(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPObserverSet addObserver:callbackScheduler:](observers, "addObserver:callbackScheduler:", v6, v7);

}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  int *p_deviceCharacteristicChangeNotifyToken;
  const char *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[HKSPSleepOnboardingStore addObserver:](self->_sleepStore, "addObserver:", self);
  if (self->_pairedDeviceRegistry)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__pairedDeviceDidChange, *MEMORY[0x1E0D517A8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__pairedDeviceDidChange, *MEMORY[0x1E0D517C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__pairedDeviceDidChange, *MEMORY[0x1E0D517D0], 0);

    self->_deviceCharacteristicChangeNotifyToken = -1;
    p_deviceCharacteristicChangeNotifyToken = &self->_deviceCharacteristicChangeNotifyToken;
    objc_initWeak(&location, self);
    v7 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D517F0], "UTF8String");
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HKSPFeatureAvailabilityStore__registerForNotifications__block_invoke;
    v10[3] = &unk_1E4E3B6D8;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v7, p_deviceCharacteristicChangeNotifyToken, v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __66__HKSPFeatureAvailabilityStore__updateCachedFeatureSettingsModel___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
    v3 = objc_msgSend(v2, "isEqualToFeatureSettingsModel:", *(_QWORD *)(a1 + 40)) ^ 1;
  else
    LOBYTE(v3) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

}

- (void)dealloc
{
  int deviceCharacteristicChangeNotifyToken;
  objc_super v4;

  deviceCharacteristicChangeNotifyToken = self->_deviceCharacteristicChangeNotifyToken;
  if (deviceCharacteristicChangeNotifyToken != -1)
  {
    notify_cancel(deviceCharacteristicChangeNotifyToken);
    self->_deviceCharacteristicChangeNotifyToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HKSPFeatureAvailabilityStore;
  -[HKSPFeatureAvailabilityStore dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedFeatureSettingsModel, 0);
  objc_storeStrong((id *)&self->_cachedOnboardingModel, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

void __57__HKSPFeatureAvailabilityStore__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pairedDeviceDidChange");

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), self->_featureIdentifier);
}

- (unint64_t)_onboardingIneligibilityReasons
{
  void *v3;
  char v4;
  unint64_t v5;
  void *v6;
  void *v7;

  if (self->_feature != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if ((v4 & 1) != 0)
    return 0;
  -[HKSPFeatureAvailabilityPairedDeviceRegistry getActivePairedDevice](self->_pairedDeviceRegistry, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"));
    if (objc_msgSend(v6, "supportsCapability:", v7))
      v5 = 0;
    else
      v5 = 4;

  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (id)_defaultSleepTrackingRequirements
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", self->_featureIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", self->_featureIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_onboardSleepTrackingRequirements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[HKSPFeatureAvailabilityStore _defaultSleepTrackingRequirements](self, "_defaultSleepTrackingRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsNotPresentForFeatureWithIdentifier:", self->_featureIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7540]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_useSleepTrackingRequirements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[HKSPFeatureAvailabilityStore _defaultSleepTrackingRequirements](self, "_defaultSleepTrackingRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", self->_featureIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", self->_featureIdentifier, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_sleepTrackingRequirements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v10[0] = *MEMORY[0x1E0CB4EB8];
  -[HKSPFeatureAvailabilityStore _defaultSleepTrackingRequirements](self, "_defaultSleepTrackingRequirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E0CB4EB0];
  -[HKSPFeatureAvailabilityStore _onboardSleepTrackingRequirements](self, "_onboardSleepTrackingRequirements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = *MEMORY[0x1E0CB4ED0];
  -[HKSPFeatureAvailabilityStore _useSleepTrackingRequirements](self, "_useSleepTrackingRequirements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithRequirementsByContext:", v7);

  return v8;
}

- (id)_defaultRequirements
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v4 = *MEMORY[0x1E0CB4EB8];
  v13[0] = MEMORY[0x1E0C9AA60];
  v5 = *MEMORY[0x1E0CB4EB0];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsNotPresentForFeatureWithIdentifier:", self->_featureIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithRequirementsByContext:", v8);

  return v9;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HKSPFeatureAvailabilityStore featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[HKSPFeatureAvailabilityStore _onboardingModelWithError:](self, "_onboardingModelWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSPFeatureAvailabilityStore _onboardedCountrySupportedStateForOnboardingModel:](self, "_onboardedCountrySupportedStateForOnboardingModel:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  HKSPFeatureAvailabilityStore *v3;
  void *v4;
  void *v5;
  int64_t feature;
  uint64_t v7;

  v3 = self;
  -[HKSPFeatureAvailabilityStore _onboardingModelWithError:](self, "_onboardingModelWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    feature = v3->_feature;
    switch(feature)
    {
      case 2:
        objc_msgSend(v4, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 1:
        objc_msgSend(v4, "sleepTrackingOnboardingFirstCompletedDate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 0:
        objc_msgSend(v4, "sleepCoachingOnboardingFirstCompletedDate");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v3 = (HKSPFeatureAvailabilityStore *)v7;
        break;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSPFeatureAvailabilityPairedDeviceRegistry getActivePairedDevice](self->_pairedDeviceRegistry, "getActivePairedDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"));
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v3, "supportsCapability:", v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AAA0];
  }

  return v6;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HKSPFeatureAvailabilityStore _onboardingIneligibilityReasons](self, "_onboardingIneligibilityReasons", a3, a4) == 0);
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc(MEMORY[0x1E0CB66D0]);
  v6 = -[HKSPFeatureAvailabilityStore _onboardingIneligibilityReasons](self, "_onboardingIneligibilityReasons");
  objc_msgSend(MEMORY[0x1E0CB6AC8], "uncheckedAvailability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithIneligibilityReasons:countryAvailabilityVersion:", v6, v8);

  return v9;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 11, CFSTR("Feature attributes not applicable"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  return 0;
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  int64_t feature;
  const char *v4;

  feature = self->_feature;
  switch(feature)
  {
    case 2:
      goto LABEL_4;
    case 1:
      -[HKSPFeatureAvailabilityStore _sleepTrackingRequirements](self, "_sleepTrackingRequirements", a3);
      v4 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 0:
LABEL_4:
      -[HKSPFeatureAvailabilityStore _defaultRequirements](self, "_defaultRequirements", a3);
      v4 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      a2 = v4;
      break;
  }
  return (id)(id)a2;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6AC8], "uncheckedAvailability", a3);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int64_t feature;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int, void *);
  void *v23;
  HKSPFeatureAvailabilityStore *v24;
  id v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPFeatureAvailabilityStore.m"), 454, CFSTR("Specifying onboarded date is not supported for Sleep feature."));

  }
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __130__HKSPFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v23 = &unk_1E4E3B728;
  v24 = self;
  v16 = v15;
  v25 = v16;
  v17 = (void *)MEMORY[0x1A85ABD18](&v20);
  feature = self->_feature;
  switch(feature)
  {
    case 2:
      -[HKSPSleepOnboardingStore setSleepWindDownShortcutsOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepWindDownShortcutsOnboardingCompletedVersion:completion:", 2, v17, v20, v21, v22, v23, v24);
      break;
    case 1:
      -[HKSPSleepOnboardingStore setSleepTrackingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepTrackingOnboardingCompletedVersion:completion:", 3, v17, v20, v21, v22, v23, v24);
      break;
    case 0:
      -[HKSPSleepOnboardingStore setSleepCoachingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepCoachingOnboardingCompletedVersion:completion:", 3, v17, v20, v21, v22, v23, v24);
      break;
  }

}

void __130__HKSPFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "_onboardingModelWithError:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForDidUpdateOnboarding");
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  int v9;
  HKSPFeatureAvailabilityStore *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a5;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] HKOnboardingCompletion is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("HKOnboardingCompletion is not implemented for Sleep."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  int v9;
  HKSPFeatureAvailabilityStore *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a5;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Sleep."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  int v9;
  HKSPFeatureAvailabilityStore *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a5;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Sleep."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  int v9;
  HKSPFeatureAvailabilityStore *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a5;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Sleep."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  void *v7;
  int v8;
  HKSPFeatureAvailabilityStore *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, void *))a4;
  HKSPLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Sleep."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t feature;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, int, void *);
  void *v11;
  HKSPFeatureAvailabilityStore *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__HKSPFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke;
  v11 = &unk_1E4E3B728;
  v12 = self;
  v5 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x1A85ABD18](&v8);
  feature = self->_feature;
  switch(feature)
  {
    case 2:
      -[HKSPSleepOnboardingStore setSleepWindDownShortcutsOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepWindDownShortcutsOnboardingCompletedVersion:completion:", 0, v6, v8, v9, v10, v11, v12);
      break;
    case 1:
      -[HKSPSleepOnboardingStore setSleepTrackingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepTrackingOnboardingCompletedVersion:completion:", 0, v6, v8, v9, v10, v11, v12);
      break;
    case 0:
      -[HKSPSleepOnboardingStore setSleepCoachingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepCoachingOnboardingCompletedVersion:completion:", 0, v6, v8, v9, v10, v11, v12);
      break;
  }

}

void __62__HKSPFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "_onboardingModelWithError:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForDidUpdateOnboarding");
}

- (void)unregisterObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)_pairedDeviceDidChange
{
  NSObject *v3;
  HKSPObserverSet *observers;
  _QWORD v5[5];
  uint8_t buf[4];
  HKSPFeatureAvailabilityStore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of paired device changes", buf, 0xCu);
  }

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HKSPFeatureAvailabilityStore__pairedDeviceDidChange__block_invoke;
  v5[3] = &unk_1E4E3B750;
  v5[4] = self;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v5);
}

void __54__HKSPFeatureAvailabilityStore__pairedDeviceDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdatePairedDeviceCapability:", *(_QWORD *)(a1 + 32));

}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  if (-[HKSPFeatureAvailabilityStore _updateCachedOnboardingModel:](self, "_updateCachedOnboardingModel:", a4))
    -[HKSPFeatureAvailabilityStore _notifyObserversForDidUpdateOnboarding](self, "_notifyObserversForDidUpdateOnboarding");
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  if (-[HKSPFeatureAvailabilityStore _updateCachedFeatureSettingsModel:](self, "_updateCachedFeatureSettingsModel:", a4))
  {
    -[HKSPFeatureAvailabilityStore _notifyObserversForDidUpdateSettings](self, "_notifyObserversForDidUpdateSettings");
  }
}

- (void)_notifyObserversForDidUpdateOnboarding
{
  NSObject *v3;
  HKSPObserverSet *observers;
  _QWORD v5[5];
  uint8_t buf[4];
  HKSPFeatureAvailabilityStore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _notifyObserversForDidUpdateOnboarding", buf, 0xCu);
  }

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateOnboarding__block_invoke;
  v5[3] = &unk_1E4E3B750;
  v5[4] = self;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v5);
}

uint64_t __70__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateOnboarding__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversForDidUpdateSettings
{
  NSObject *v3;
  HKSPObserverSet *observers;
  _QWORD v5[5];
  uint8_t buf[4];
  HKSPFeatureAvailabilityStore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _notifyObserversForDidUpdateSettings", buf, 0xCu);
  }

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateSettings__block_invoke;
  v5[3] = &unk_1E4E3B750;
  v5[4] = self;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v5);
}

void __68__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

@end
