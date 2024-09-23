@implementation TPSHealthKitDefines

+ (id)sharedHealthStore
{
  if (sharedHealthStore_onceToken != -1)
    dispatch_once(&sharedHealthStore_onceToken, &__block_literal_global_7);
  return (id)sharedHealthStore_s_healthStore;
}

void __40__TPSHealthKitDefines_sharedHealthStore__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getHKHealthStoreClass_softClass;
  v8 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getHKHealthStoreClass_block_invoke;
    v4[3] = &unk_1EA1DF510;
    v4[4] = &v5;
    __getHKHealthStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)sharedHealthStore_s_healthStore;
  sharedHealthStore_s_healthStore = (uint64_t)v2;

}

+ (id)identifierForFeature:(int64_t)a3
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  switch(a3)
  {
    case 1:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v3 = (id *)getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr;
      v14 = getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr;
      if (!getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr)
      {
        v4 = (void *)HealthKitLibrary();
        v3 = (id *)dlsym(v4, "HKFeatureIdentifierIrregularRhythmNotifications");
        v12[3] = (uint64_t)v3;
        getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr = (uint64_t)v3;
      }
      _Block_object_dispose(&v11, 8);
      if (v3)
        return *v3;
      -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
      goto LABEL_6;
    case 2:
LABEL_6:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v3 = (id *)getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr;
      v14 = getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr;
      if (!getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr)
      {
        v5 = (void *)HealthKitLibrary();
        v3 = (id *)dlsym(v5, "HKFeatureIdentifierSleepTracking");
        v12[3] = (uint64_t)v3;
        getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr = (uint64_t)v3;
      }
      _Block_object_dispose(&v11, 8);
      if (v3)
        return *v3;
      -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
LABEL_10:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v3 = (id *)getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr;
      v14 = getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr;
      if (!getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr)
      {
        v6 = (void *)HealthKitLibrary();
        v3 = (id *)dlsym(v6, "HKFeatureIdentifierAFibBurden");
        v12[3] = (uint64_t)v3;
        getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr = (uint64_t)v3;
      }
      _Block_object_dispose(&v11, 8);
      if (!v3)
      {
        -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
LABEL_14:
        v11 = 0;
        v12 = &v11;
        v13 = 0x2020000000;
        v3 = (id *)getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr;
        v14 = getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr;
        if (!getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr)
        {
          v7 = (void *)HealthKitLibrary();
          v3 = (id *)dlsym(v7, "HKFeatureIdentifierMenstrualCyclesWristTemperatureInput");
          v12[3] = (uint64_t)v3;
          getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr = (uint64_t)v3;
        }
        _Block_object_dispose(&v11, 8);
        if (!v3)
        {
          -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
LABEL_18:
          v11 = 0;
          v12 = &v11;
          v13 = 0x2020000000;
          v3 = (id *)getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr;
          v14 = getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr;
          if (!getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr)
          {
            v8 = (void *)HealthKitLibrary();
            v3 = (id *)dlsym(v8, "HKFeatureIdentifierSleepingWristTemperatureMeasurements");
            v12[3] = (uint64_t)v3;
            getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr = (uint64_t)v3;
          }
          _Block_object_dispose(&v11, 8);
          if (!v3)
          {
            v10 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState].cold.1();
            _Block_object_dispose(&v11, 8);
            _Unwind_Resume(v10);
          }
        }
      }
      return *v3;
    case 3:
      goto LABEL_10;
    case 4:
      goto LABEL_14;
    case 5:
      goto LABEL_18;
    default:
      return 0;
  }
}

+ (id)featureAvailabilityContextForStatusType:(int64_t)a3
{
  id *v3;
  void *v4;
  void *v5;
  id v6;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 == 2)
    goto LABEL_7;
  if (a3 != 1)
  {
    v6 = 0;
    return v6;
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (id *)getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr;
  v12 = getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr;
  if (!getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr)
  {
    v4 = (void *)HealthKitLibrary();
    v3 = (id *)dlsym(v4, "HKFeatureAvailabilityContextTipsAppVisibility");
    v10[3] = (uint64_t)v3;
    getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
    -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
LABEL_7:
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v3 = (id *)getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr;
    v12 = getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr;
    if (!getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr)
    {
      v5 = (void *)HealthKitLibrary();
      v3 = (id *)dlsym(v5, "HKFeatureAvailabilityContextTipsAppNotificationEligibility");
      v10[3] = (uint64_t)v3;
      getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v9, 8);
    if (!v3)
    {
      v8 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState].cold.1();
      _Block_object_dispose(&v9, 8);
      _Unwind_Resume(v8);
    }
  }
  v6 = *v3;
  return v6;
}

@end
