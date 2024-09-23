void HKSPDecodeObjectWithCoder(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "allProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "decodeValueForObject:fromCoder:", v3, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void HKSPEncodeObjectWithCoder(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "allProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "encodeValueForObject:fromCoder:", v3, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void sub_1A4F112EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4F117E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HKSPLogForCategory(unint64_t a1)
{
  if (a1 >= 0x16)
    __assert_rtn("HKSPLogForCategory", "HKSPLogging.m", 69, "category < HKSPLogCount");
  if (HKSPLogForCategory_onceToken != -1)
    dispatch_once(&HKSPLogForCategory_onceToken, &__block_literal_global_3);
  return HKSPLogForCategory_logObjects[a1];
}

uint64_t HKSPSyncAnchorClass()
{
  return objc_opt_class();
}

void *HKSPSyncAnchorDefaultValue()
{
  return &unk_1E4E52D80;
}

id HKSPSleepEventRecordProperties()
{
  _HKSPObjectProperty *v0;
  _HKSPObjectProperty *v1;
  _HKSPObjectProperty *v2;
  _HKSPUnsignedIntegerProperty *v3;
  _HKSPObjectProperty *v4;
  _HKSPUnsignedIntegerProperty *v5;
  _HKSPObjectProperty *v6;
  _HKSPUnsignedIntegerProperty *v7;
  void *v8;
  void *v9;
  _HKSPObjectProperty *v11;
  _HKSPObjectProperty *v12;
  void *v13;
  _HKSPObjectProperty *v14;
  void *v15;
  _HKSPObjectProperty *v16;
  _HKSPUnsignedIntegerProperty *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v15 = (void *)MEMORY[0x1E0C99E60];
  v17 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPEventRecordVersion"), CFSTR("version"));
  v18[0] = v17;
  v16 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPEventRecordLastModifiedDate"), CFSTR("lastModifiedDate"), objc_opt_class());
  v18[1] = v16;
  v14 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPWakeUpEarlyNotificationConfirmedDate"), CFSTR("wakeUpEarlyNotificationConfirmedDate"), objc_opt_class());
  v18[2] = v14;
  _WakeUpConfirmedUntilDateProperty();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  v12 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPWakeUpAlarmDismissedDate"), CFSTR("wakeUpAlarmDismissedDate"), objc_opt_class());
  v18[4] = v12;
  v11 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPWakeUpOverriddenDate"), CFSTR("wakeUpOverriddenDate"), objc_opt_class());
  v18[5] = v11;
  v0 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPWakeUpAlarmSnoozedUntilDate"), CFSTR("wakeUpAlarmSnoozedUntilDate"), objc_opt_class());
  v18[6] = v0;
  v1 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPGoodMorningDismissedDate"), CFSTR("goodMorningDismissedDate"), objc_opt_class());
  v18[7] = v1;
  v2 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPSleepCoachingOnboardingFirstCompletedDate"), CFSTR("sleepCoachingOnboardingFirstCompletedDate"), objc_opt_class());
  v18[8] = v2;
  v3 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSleepCoachingOnboardingCompletedVersion"), CFSTR("sleepCoachingOnboardingCompletedVersion"));
  v18[9] = v3;
  v4 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPSleepTrackingOnboardingFirstCompletedDate"), CFSTR("sleepTrackingOnboardingFirstCompletedDate"), objc_opt_class());
  v18[10] = v4;
  v5 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSleepTrackingOnboardingCompletedVersion"), CFSTR("sleepTrackingOnboardingCompletedVersion"));
  v18[11] = v5;
  v6 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"), CFSTR("sleepWindDownShortcutsOnboardingFirstCompletedDate"), objc_opt_class());
  v18[12] = v6;
  v7 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSleepWindDownShortcutsOnboardingCompletedVersion"), CFSTR("sleepWindDownShortcutsOnboardingCompletedVersion"));
  v18[13] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

_HKSPObjectProperty *_WakeUpConfirmedUntilDateProperty()
{
  return -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPWakeUpConfirmedUntilDate"), CFSTR("wakeUpConfirmedUntilDate"), objc_opt_class());
}

void sub_1A4F12C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F12D48(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A4F13400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,id a27)
{
  id *v27;
  id *v28;
  id *v29;
  id *v30;
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1A4F136E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4F13854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *HKSPLogCategoryForCategory(unint64_t a1)
{
  if (a1 >= 0x16)
    __assert_rtn("HKSPLogCategoryForCategory", "HKSPLogging.m", 38, "category < HKSPLogCount");
  if (a1 - 1 > 0x14)
    return "default";
  else
    return off_1E4E3B028[a1 - 1];
}

id HKSPSleepSettingsProperties()
{
  _HKSPBoolProperty *v0;
  _HKSPBoolProperty *v1;
  _HKSPBoolProperty *v2;
  _HKSPBoolProperty *v3;
  _HKSPBoolProperty *v4;
  _HKSPBoolProperty *v5;
  _HKSPBoolProperty *v6;
  _HKSPBoolProperty *v7;
  void *v8;
  void *v9;
  _HKSPUnsignedIntegerProperty *v11;
  _HKSPBoolProperty *v12;
  _HKSPBoolProperty *v13;
  void *v14;
  _HKSPObjectProperty *v15;
  _HKSPUnsignedIntegerProperty *v16;
  _QWORD v17[15];

  v17[13] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0C99E60];
  v16 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSettingsVersion"), CFSTR("version"));
  v17[0] = v16;
  v15 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPSettingsLastModifiedDate"), CFSTR("lastModifiedDate"), objc_opt_class());
  v17[1] = v15;
  v13 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPWatchSleepFeaturesEnabled"), CFSTR("watchSleepFeaturesEnabled"));
  v17[2] = v13;
  v12 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPScheduledSleepMode"), CFSTR("scheduledSleepMode"));
  v17[3] = v12;
  v11 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSleepModeOptions"), CFSTR("sleepModeOptions"));
  v17[4] = v11;
  v0 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPTimeInBedTracking"), CFSTR("timeInBedTracking"));
  v17[5] = v0;
  v1 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPWakeUpResults"), CFSTR("wakeUpResults"));
  v17[6] = v1;
  v2 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSleepTracking"), CFSTR("sleepTracking"));
  v17[7] = v2;
  v3 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPBedtimeReminders"), CFSTR("bedtimeReminders"));
  v17[8] = v3;
  v4 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPChargingReminders"), CFSTR("chargingReminders"));
  v17[9] = v4;
  v5 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPShareAcrossDevices"), CFSTR("shareAcrossDevices"));
  v17[10] = v5;
  v6 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSpringBoardGreetingDisabled"), CFSTR("springBoardGreetingDisabled"));
  v17[11] = v6;
  v7 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSpringBoardSuggestedPageCreated"), CFSTR("springBoardSuggestedPageCreated"));
  v17[12] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id NSStringFromHKSPSleepModeOptions(__int16 a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 0x4000) != 0)
    objc_msgSend(v2, "addObject:", CFSTR(".sleepScreen"));
  if ((a1 & 8) != 0)
    objc_msgSend(v3, "addObject:", CFSTR(".hideTime"));
  if ((a1 & 0x700) == 0)
    objc_msgSend(v3, "addObject:", CFSTR("!legacyOptions"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1A4F1475C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F14A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F14B04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id HKSPNilify(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  if ((v3 & 1) != 0)
    v4 = 0;
  else
    v4 = v1;

  return v4;
}

uint64_t HKSPObjectsAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPObjectsAreEqual_block_invoke;
  v7[3] = &unk_1E4E3D2B0;
  v8 = v3;
  v4 = v3;
  v5 = _HKSPEquateObjectsWithBlock(v4, a2, v7);

  return v5;
}

uint64_t _HKSPEquateObjectsWithBlock(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, id, id, void *);
  void *v8;
  uint64_t v9;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v5, v6, v8);
      v9 = objc_msgSend(v8, "isEqual");

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

_HKSPOrderPreservingScheduler *HKSPOrderPreservingScheduler(void *a1, void *a2)
{
  id v3;
  id v4;
  _HKSPOrderPreservingScheduler *v5;

  v3 = a2;
  v4 = a1;
  v5 = -[_HKSPOrderPreservingScheduler initWithScheduler:mutexProvider:]([_HKSPOrderPreservingScheduler alloc], "initWithScheduler:mutexProvider:", v4, v3);

  return v5;
}

id HKSPSleepServerInterface()
{
  if (qword_1ED05F220 != -1)
    dispatch_once(&qword_1ED05F220, &__block_literal_global_8);
  return (id)_MergedGlobals_12;
}

id HKSPSleepClientInterface()
{
  if (qword_1ED05F230 != -1)
    dispatch_once(&qword_1ED05F230, &__block_literal_global_272);
  return (id)qword_1ED05F228;
}

void sub_1A4F16FB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id HKSPCurrentDateProvider()
{
  if (qword_1ED05F1C0 != -1)
    dispatch_once(&qword_1ED05F1C0, &__block_literal_global_8);
  return (id)MEMORY[0x1A85ABD18](qword_1ED05F1B8);
}

void sub_1A4F1755C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F178E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1A4F17B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

_HKSPQueueBackedScheduler *HKSPQueueBackedScheduler(void *a1)
{
  id v1;
  _HKSPQueueBackedScheduler *v2;

  v1 = a1;
  v2 = -[_HKSPQueueBackedScheduler initWithQueue:]([_HKSPQueueBackedScheduler alloc], "initWithQueue:", v1);

  return v2;
}

_HKSPQueueBackedScheduler *HKSPMainQueueBackedScheduler()
{
  _HKSPQueueBackedScheduler *v0;

  v0 = [_HKSPQueueBackedScheduler alloc];
  return -[_HKSPQueueBackedScheduler initWithQueue:](v0, "initWithQueue:", MEMORY[0x1E0C80D38]);
}

void sub_1A4F17EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HKSPFeatureAvailabilityStore *getSleepFeatureAvailabilityProviding(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  HKSPFeatureAvailabilityStore *v9;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (qword_1ED05F210 != -1)
    dispatch_once(&qword_1ED05F210, &__block_literal_global_7);
  objc_msgSend((id)_MergedGlobals_11, "sleepStoreForIdentifier:healthStore:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[HKSPFeatureAvailabilityStore initWithFeatureIdentifier:sleepStore:]([HKSPFeatureAvailabilityStore alloc], "initWithFeatureIdentifier:sleepStore:", v7, v8);
  else
    v9 = 0;

  return v9;
}

id HKSPGenerateSleepStoreIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v3, v1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

id HKSPNullify(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

void sub_1A4F192F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F19DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4F19F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HKSPSleepScheduleDayOccurrenceProperties()
{
  void *v0;
  _HKSPUnsignedIntegerProperty *v1;
  _HKSPObjectProperty *v2;
  _HKSPObjectProperty *v3;
  _HKSPRelationshipProperty *v4;
  void *v5;
  _HKSPRelationshipProperty *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPDayOccurrenceVersion"), CFSTR("version"));
  v10[0] = v1;
  v2 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPDayOccurrenceWakeUpComponents"), CFSTR("wakeUpComponents"), objc_opt_class());
  v10[1] = v2;
  v3 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPDayOccurrenceBedtimeComponents"), CFSTR("bedtimeComponents"), objc_opt_class());
  v10[2] = v3;
  v4 = [_HKSPRelationshipProperty alloc];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v4, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPDayOccurrenceAlarm"), CFSTR("alarmConfiguration"), v5);

  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id HKSPSleepScheduleDayOccurrencePropertiesForEquivalency()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPDayOccurrenceVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepScheduleDayOccurrenceProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepScheduleDayOccurrencePropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *NSStringFromHKSPSleepWidgetState(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return off_1E4E3A650[a1];
}

BOOL HKSPWidgetStateShowsSleepData(uint64_t a1)
{
  return (unint64_t)(a1 - 6) < 0xFFFFFFFFFFFFFFFCLL;
}

void sub_1A4F1ABB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HKSPSleepScheduleProperties()
{
  _HKSPRelationshipProperty *v0;
  _HKSPRelationshipProperty *v1;
  _HKSPRelationshipProperty *v2;
  _HKSPRelationshipProperty *v3;
  _HKSPRelationshipProperty *v4;
  _HKSPRelationshipProperty *v5;
  _HKSPRelationshipProperty *v6;
  void *v7;
  _HKSPRelationshipProperty *v8;
  _HKSPRelationshipProperty *v9;
  void *v10;
  _HKSPRelationshipProperty *v11;
  _HKSPRelationshipProperty *v12;
  void *v13;
  _HKSPRelationshipProperty *v14;
  void *v15;
  void *v16;
  void *v18;
  _HKSPRelationshipProperty *v19;
  void *v20;
  _HKSPRelationshipProperty *v21;
  void *v22;
  _HKSPRelationshipProperty *v23;
  void *v24;
  _HKSPRelationshipProperty *v25;
  void *v26;
  _HKSPTimeIntervalProperty *v27;
  void *v28;
  _HKSPTimeIntervalProperty *v29;
  _HKSPBoolProperty *v30;
  _HKSPObjectProperty *v31;
  _HKSPUnsignedIntegerProperty *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[15];

  v41[13] = *MEMORY[0x1E0C80C00];
  v28 = (void *)MEMORY[0x1E0C99E60];
  v32 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPScheduleVersion"), CFSTR("version"));
  v41[0] = v32;
  v31 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPScheduleLastModifiedDate"), CFSTR("lastModifiedDate"), objc_opt_class());
  v41[1] = v31;
  v30 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPScheduleEnabled"), CFSTR("enabled"));
  v41[2] = v30;
  v29 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPTimeIntervalProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPWindDownTimeInterval"), CFSTR("windDownTime"));
  v41[3] = v29;
  v27 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPTimeIntervalProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPSleepDurationGoal"), CFSTR("sleepDurationGoal"));
  v41[4] = v27;
  v0 = [_HKSPRelationshipProperty alloc];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v0, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPMondayOccurrence"), CFSTR("mondayOccurrence"), v26);
  v41[5] = v25;
  v1 = [_HKSPRelationshipProperty alloc];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v1, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPTuesdayOccurrence"), CFSTR("tuesdayOccurrence"), v24);
  v41[6] = v23;
  v2 = [_HKSPRelationshipProperty alloc];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v2, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPWednesdayOccurrence"), CFSTR("wednesdayOccurrence"), v22);
  v41[7] = v21;
  v3 = [_HKSPRelationshipProperty alloc];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v3, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPThursdayOccurrence"), CFSTR("thursdayOccurrence"), v20);
  v41[8] = v19;
  v4 = [_HKSPRelationshipProperty alloc];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v4, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPFridayOccurrence"), CFSTR("fridayOccurrence"), v18);
  v41[9] = v5;
  v6 = [_HKSPRelationshipProperty alloc];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v6, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPSaturdayOccurrence"), CFSTR("saturdayOccurrence"), v7);
  v41[10] = v8;
  v9 = [_HKSPRelationshipProperty alloc];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v9, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPSundayOccurrence"), CFSTR("sundayOccurrence"), v10);
  v41[11] = v11;
  v12 = [_HKSPRelationshipProperty alloc];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v12, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPOverrideOccurrence"), CFSTR("overrideDayOccurrence"), v13);
  v41[12] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id HKSPSleepSchedulePropertiesForEquivalency()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPScheduleVersion");
  v9[1] = CFSTR("HKSPScheduleLastModifiedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepScheduleProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSchedulePropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HKSPSleepSchedulePropertiesForSignificance()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPScheduleVersion");
  v9[1] = CFSTR("HKSPScheduleLastModifiedDate");
  v9[2] = CFSTR("HKSPSleepDurationGoal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepScheduleProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSchedulePropertiesForSignificance_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t _handleLifeCycleNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveLifecycleNotification");
}

_HKSPDarwinNotificationHeartbeatListener *HKSPStandardHeartbeatListener(void *a1)
{
  id v1;
  _HKSPDarwinNotificationHeartbeatListener *v2;
  void *v3;
  _HKSPDarwinNotificationHeartbeatListener *v4;

  v1 = a1;
  v2 = [_HKSPDarwinNotificationHeartbeatListener alloc];
  objc_msgSend(v1, "lifecycleNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[_HKSPDarwinNotificationHeartbeatListener initWithLifecycleNotification:](v2, "initWithLifecycleNotification:", v3);
  return v4;
}

uint64_t HKSPIsCharging()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_sleepdUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("HKSPSimulatedOnCharger"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = IOPSDrawingUnlimitedPower();
  v3 = v2;

  return v3;
}

float HKSPBatteryLevel()
{
  void *v0;
  void *v1;
  float v2;
  float v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_sleepdUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("HKSPSimulatedBatteryLevel"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v1, "floatValue");
    v3 = v2;
  }
  else
  {
    IOPSGetPercentRemaining();
    v3 = (float)0 / 100.0;
  }

  return v3;
}

_HKSPDarwinNotificationHeartbeatGenerator *HKSPStandardHeartbeatGenerator(void *a1)
{
  id v1;
  _HKSPDarwinNotificationHeartbeatGenerator *v2;
  void *v3;
  _HKSPDarwinNotificationHeartbeatGenerator *v4;

  v1 = a1;
  v2 = [_HKSPDarwinNotificationHeartbeatGenerator alloc];
  objc_msgSend(v1, "lifecycleNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[_HKSPDarwinNotificationHeartbeatGenerator initWithLifecycleNotification:](v2, "initWithLifecycleNotification:", v3);
  return v4;
}

uint64_t HKSPAnalyticsEventsEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE790800)
    && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE790800))
  {
    objc_msgSend(v3, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      objc_msgSend(v3, "eventPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eventPayload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t HKSPAnalyticsEventHash(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  objc_msgSend(v1, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "hksp_hash") ^ v3;
  return v5;
}

uint64_t HKSPIsHomePod()
{
  if (qword_1ED05F1B0 != -1)
    dispatch_once(&qword_1ED05F1B0, &__block_literal_global_2);
  return _MergedGlobals_8;
}

id HKSPLocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = qword_1ED05F1D0;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_1ED05F1D0, &__block_literal_global_12);
  objc_msgSend((id)qword_1ED05F1C8, "localizedStringForKey:value:table:", v2, &stru_1E4E3E220, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t HKSPIsValidDate(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "isEqualToDate:", v2) & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v1, "isEqualToDate:", v4) ^ 1;

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id HKSPWatchKitApplicationLaunchURL(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
    v2 = v1;
  else
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v14 = CFSTR("uai");
  v15[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nonnull _serializeObject(id  _Nonnull __strong)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("HKSPUtilities.m"), 91, CFSTR("Failed to archive object. Got error %@, object: %@"), v5, v3);

    }
  }
  else
  {
    v4 = 0;
  }

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED05F1E0 != -1)
      dispatch_once(&qword_1ED05F1E0, &__block_literal_global_35);
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_1ED05F1D8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:///%@?userActivity=%@"), CFSTR("watchkit"), CFSTR("nativecomplication"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t HKSPAnalyticsSleepScheduleChangeApplicationFromValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
    if ((unint64_t)(v3 - 1) >= 4)
      v4 = 0;
    else
      v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id HKSPAnalyticsScheduleChangeContext(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("HKSPAnalyticsSleepScheduleChangeProvenanceInfo");
  v8[1] = CFSTR("HKSPAnalyticsSleepScheduleChangeApplication");
  v9[0] = a1;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1A4F238D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromHKSPSleepMode(unint64_t a1)
{
  if (a1 > 2)
    return &stru_1E4E3E220;
  else
    return off_1E4E3ADE8[a1];
}

const __CFString *NSStringFromHKSPSleepModeChangeReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return &stru_1E4E3E220;
  else
    return off_1E4E3AE00[a1 - 1];
}

uint64_t HKSPSleepModeChangeReasonTreatedAsUserRequested(unint64_t a1)
{
  return (a1 > 0xA) | (0x1F3u >> a1) & 1;
}

uint64_t HKSPSleepModeChangeReasonTreatedAsUserRequestedLocally(unint64_t a1)
{
  return (a1 > 0xA) | (0xC3u >> a1) & 1;
}

uint64_t HKSPSleepModeChangeReasonTreatedAsExpected(unint64_t a1)
{
  return (a1 > 0xA) | (5u >> a1) & 1;
}

uint64_t HKSPSleepModeChangeReasonTreatedAsAutomation(unint64_t a1)
{
  return (a1 > 0xA) | (0x181u >> a1) & 1;
}

void sub_1A4F24914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1A4F24B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F24C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F24D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPSerializableKeyForClass(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("$"), a1);
}

id _HKSPDeserializedObject(void *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  HKSPDictionaryDeserializer *v7;
  NSString *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v5, "hksp_isSerialized"))
  {
    v9 = v5;
LABEL_8:
    v9 = v9;
    v12 = v9;
    goto LABEL_9;
  }
  v7 = -[HKSPDictionaryDeserializer initWithAllowedClasses:serializedDictionary:serializationOptions:]([HKSPDictionaryDeserializer alloc], "initWithAllowedClasses:serializedDictionary:serializationOptions:", v6, v5, 0);
  objc_msgSend(v5, "hksp_serializedClassName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[HKSPDictionaryDeserializer deserializeObjectOfClass:error:](v7, "deserializeObjectOfClass:error:", NSClassFromString(v8), &v14);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (!v10)
  {

    goto LABEL_8;
  }
  HKSPLogForCategory(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_ERROR, "[HKSPObject] failed to deserialize %{public}@ with error %{public}@", buf, 0x16u);
  }

  *a3 = 1;
  v12 = 0;
LABEL_9:

  return v12;
}

HKSPChangeSet *HKSPGenerateChangeSetBetweenObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  HKSPDictionarySerializer *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HKSPDictionarySerializer *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKSPChangeSet *v25;
  HKSPChangeSet *v26;
  const char *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(id *, void *, void *, _BYTE *);
  void *v32;
  id v33;
  HKSPDictionarySerializer *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  HKSPDictionarySerializer *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3 || !v4)
  {
    HKSPLogForCategory(6uLL);
    v6 = (HKSPDictionarySerializer *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "[HKSPObject] objects must be non-nil";
      goto LABEL_26;
    }
LABEL_17:
    v26 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      HKSPLogForCategory(6uLL);
      v6 = (HKSPDictionarySerializer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v27 = "[HKSPObject] objects must be of the same class";
LABEL_26:
        _os_log_error_impl(&dword_1A4F0E000, &v6->super.super, OS_LOG_TYPE_ERROR, v27, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v6 = -[HKSPDictionarySerializer initWithSerializationOptions:]([HKSPDictionarySerializer alloc], "initWithSerializationOptions:", 0);
  v43 = 0;
  v7 = -[HKSPDictionarySerializer serialize:error:](v6, "serialize:error:", v3, &v43);
  v8 = v43;
  if (v8)
  {
    HKSPLogForCategory(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v45 = v3;
      v46 = 2114;
      v47 = v8;
      _os_log_error_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_ERROR, "[HKSPObject] failed to serialize %{public}@ with error %{public}@", buf, 0x16u);
    }

  }
  if (v7)
  {
    -[HKSPDictionarySerializer serializedDictionary](v6, "serializedDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hksp_serializedProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    v12 = -[HKSPDictionarySerializer serialize:error:](v6, "serialize:error:", v5, &v42);
    v8 = v42;
    if (v8)
    {
      HKSPLogForCategory(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v45 = v5;
        v46 = 2114;
        v47 = v8;
        _os_log_error_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_ERROR, "[HKSPObject] failed to serialize %{public}@ with error %{public}@", buf, 0x16u);
      }

    }
    if (v12)
    {
      -[HKSPDictionarySerializer serializedDictionary](v6, "serializedDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hksp_serializedProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend((id)objc_opt_class(), "allProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HKSPPropertiesByIdentifier(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __HKSPGenerateChangeSetBetweenObjects_block_invoke;
      v37[3] = &unk_1E4E3B148;
      v19 = v6;
      v38 = v19;
      v39 = v15;
      v20 = v18;
      v40 = v20;
      v21 = v16;
      v41 = v21;
      v22 = v15;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v37);
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __HKSPGenerateChangeSetBetweenObjects_block_invoke_2;
      v32 = &unk_1E4E3B148;
      v33 = v11;
      v34 = v19;
      v35 = v20;
      v36 = v21;
      v23 = v21;
      v24 = v20;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v29);
      v25 = [HKSPChangeSet alloc];
      v26 = -[HKSPChangeSet initWithChangeDictionary:](v25, "initWithChangeDictionary:", v23, v29, v30, v31, v32);

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

LABEL_24:
  return v26;
}

_HKSPDefaultScheduleProvider *HKSPDefaultScheduleProvider()
{
  return objc_alloc_init(_HKSPDefaultScheduleProvider);
}

void HKSPPowerLog(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  HKSPLogForCategory(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_INFO, "[HKSPPowerLog] eventName: %{public}@ eventData: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  PLLogRegisteredEvent();
}

void sub_1A4F27E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1A4F27FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F28148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id HKSPAlarmConfigurationProperties()
{
  void *v0;
  _HKSPUnsignedIntegerProperty *v1;
  _HKSPBoolProperty *v2;
  _HKSPBoolProperty *v3;
  _HKSPUnsignedIntegerProperty *v4;
  _HKSPObjectProperty *v5;
  _HKSPObjectProperty *v6;
  _HKSPObjectProperty *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPAlarmVersion"), CFSTR("version"));
  v2 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPAlarmEnabled"), CFSTR("enabled"), v1);
  v11[1] = v2;
  v3 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPAlarmAllowsSnooze"), CFSTR("allowsSnooze"));
  v11[2] = v3;
  v4 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPAlarmSilentModeOptions"), CFSTR("breaksThroughSilentModeOptions"));
  v11[3] = v4;
  v5 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPAlarmToneIdentifier"), CFSTR("toneIdentifier"), objc_opt_class());
  v11[4] = v5;
  v6 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPAlarmVibrationIdentifier"), CFSTR("vibrationIdentifier"), objc_opt_class());
  v11[5] = v6;
  v7 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClass:]([_HKSPObjectProperty alloc], "initWithIdentifier:propertyName:expectedValueClass:", CFSTR("HKSPAlarmSoundVolume"), CFSTR("soundVolume"), objc_opt_class());
  v11[6] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id HKSPAlarmConfigurationPropertiesForEquivalency()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPAlarmVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPAlarmConfigurationProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPAlarmConfigurationPropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HKSPAlarmConfigurationPropertiesForSignificance()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPAlarmEnabled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPAlarmConfigurationProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPAlarmConfigurationPropertiesForSignificance_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void *HKSPSleepEventComparator()
{
  return &__block_literal_global_5;
}

id HKSPSleepURLWithOptionsFromSource(void *a1, char a2, void *a3, void *a4)
{
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDeviceSupported");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isAppleWatch");

    if (v14)
    {
      objc_msgSend(v12, "setScheme:", CFSTR("nanosleep"));
      v15 = CFSTR("com.apple.NanoSleep.watchkitapp");
    }
    else
    {
      objc_msgSend(v12, "setScheme:", *MEMORY[0x1E0CB5118]);
      v15 = CFSTR("SleepHealthAppPlugin.healthplugin");
    }
    objc_msgSend(v12, "setHost:", v15);
    v17 = &stru_1E4E3E220;
    if (v7)
      v17 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPath:", v18);

    v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("source"), v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithArray:", v21);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("presentation"), v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v23);

    }
    v24 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("viewSchedule"));
    if ((a2 & 2) != 0 && v24)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("delayScrollToSchedule"), CFSTR("1"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v25);

    }
    v26 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v12, "setQueryItems:", v26);

    objc_msgSend(v12, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id HKSPSleepURL(void *a1, void *a2)
{
  return HKSPSleepURLWithOptionsFromSource(a1, 0, a2, 0);
}

id HKSPSleepURLWithOptions(void *a1, char a2, void *a3)
{
  return HKSPSleepURLWithOptionsFromSource(a1, a2, a3, 0);
}

id HKSPSleepURLWithProvenanceInfo(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a1;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepURLWithOptionsFromSource(v6, a2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t HKSPSleepFocusConfigurationURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "dnd_settingsURLWithModeIdentifier:", CFSTR("com.apple.sleep.sleep-mode"));
}

uint64_t HKSPSleepFocusOnboardingURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "dnd_setupURLWithSemanticType:", 1);
}

uint64_t HKSPSleepWatchAppURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("bridge:root=com.apple.NanoBedtimeBridgeSettings"));
}

uint64_t HKSPScreenTimeURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY/ALLOWED_APPS"));
}

uint64_t HKSPIsRemoveSpacesForTimeFormatEnabled()
{
  void *v0;
  uint64_t v1;

  HKSPLocalizedString(CFSTR("ENABLE_REMOVE_SPACES_FOR_TIME_FORMAT"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("1"));

  return v1;
}

const __CFString *NSStringFromHKSPDevice(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = CFSTR("Phone");
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("Watch");
      break;
    case 2:
      result = CFSTR("iPod");
      break;
    case 3:
      result = CFSTR("iPad");
      break;
    case 4:
      result = CFSTR("Mac");
      break;
    case 5:
      result = CFSTR("Reality");
      break;
    default:
      result = CFSTR("Other");
      break;
  }
  return result;
}

uint64_t HKSPIsUnitTesting()
{
  if (qword_1ED05F200 != -1)
    dispatch_once(&qword_1ED05F200, &__block_literal_global_6);
  return _MergedGlobals_10;
}

void __getSleepFeatureAvailabilityProviding_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[HKSPSleepStoreCache weakCache](HKSPSleepStoreCache, "weakCache");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v0;

}

id HKSPActivePairedDeviceApplicationsInstalledDistributedNotification()
{
  return (id)*MEMORY[0x1E0CF8838];
}

id HKSPActivePairedDeviceApplicationsUninstalledDistributedNotification()
{
  return (id)*MEMORY[0x1E0CF8840];
}

void sub_1A4F2EE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2F334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t HKSPSleepLockScreenServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A7DE8);
}

id HKSPSleepLockScreenClientInterface()
{
  if (qword_1ED05F240 != -1)
    dispatch_once(&qword_1ED05F240, &__block_literal_global_310);
  return (id)qword_1ED05F238;
}

id HKSPSleepLockScreenRemoteContentHostInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A7EA8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C812F8], sel_getContentBoundsWithReplyBlock_, 0, 1);
  return v0;
}

id HKSPSleepLockScreenRemoteContentServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A7F08);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2, v6, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_configureWithUserInfo_contentBounds_endpoint_, 0, 0);

  v4 = MEMORY[0x1E0C812F8];
  objc_msgSend(v0, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C812F8], sel_configureWithUserInfo_contentBounds_endpoint_, 1, 0);
  objc_msgSend(v0, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C81308], sel_configureWithUserInfo_contentBounds_endpoint_, 2, 0);
  objc_msgSend(v0, "setXPCType:forSelector:argumentIndex:ofReply:", v4, sel_getInlinePresentationContentFrameWithReplyBlock_, 0, 1);
  return v0;
}

void sub_1A4F32FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F34ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1A4F35000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id HKSPSleepScheduleWrapWithSyncAnchor(void *a1, uint64_t a2)
{
  if (a1)
    objc_msgSend(a1, "objectWithSyncAnchor:", a2);
  else
    +[HKSPSleepSchedule emptyScheduleWithSyncAnchor:](HKSPSleepSchedule, "emptyScheduleWithSyncAnchor:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HKSPSleepScheduleUnwrap(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEmptySleepSchedule"))
    v2 = 0;
  else
    v2 = v1;
  v3 = v2;

  return v3;
}

void sub_1A4F385EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A4F3924C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1A4F3A994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3B2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3B964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3C1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromHKSPAlarmSource(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Local");
  if (a1 == 1)
    v1 = CFSTR("NanoSync");
  if (a1 == 2)
    return CFSTR("CloudSync");
  else
    return v1;
}

void sub_1A4F466AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1A4F46BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F47658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F47718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ChronoServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CHSTimelineController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCHSTimelineControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHSTimelineControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HKSPSleepWidgetManager.m"), 20, CFSTR("Unable to find class %s"), "CHSTimelineController");

    __break(1u);
  }
}

void ChronoServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!ChronoServicesLibraryCore_frameworkLibrary)
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ChronoServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HKSPSleepWidgetManager.m"), 19, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getCHSWidgetServiceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ChronoServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CHSWidgetService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCHSWidgetServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHSWidgetServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HKSPSleepWidgetManager.m"), 21, CFSTR("Unable to find class %s"), "CHSWidgetService");

    __break(1u);
  }
}

_HKSPUserDefaultsStatePersistence *HKSPUserDefaultsStatePersistence()
{
  _HKSPUserDefaultsStatePersistence *v0;
  void *v1;
  _HKSPUserDefaultsStatePersistence *v2;

  v0 = [_HKSPUserDefaultsStatePersistence alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[_HKSPUserDefaultsStatePersistence initWithUserDefaults:](v0, "initWithUserDefaults:", v1);

  return v2;
}

void sub_1A4F4CA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HKSPSleepSettingsPropertiesForPersist()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  HKSPSleepSettingsProperties();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HKSPSleepSettingsPropertiesForPersist_block_invoke;
  v5[3] = &unk_1E4E3A630;
  v6 = v0;
  v2 = v0;
  objc_msgSend(v1, "na_filter:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HKSPSleepSettingsPropertiesForSync()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("HKSPShareAcrossDevices"));
  HKSPSleepSettingsPerGizmoProperties();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "unionSet:", v2);

  HKSPSleepSettingsPropertiesForPersist();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSettingsPropertiesForSync_block_invoke_2;
  v7[3] = &unk_1E4E3A630;
  v8 = v0;
  v4 = v0;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HKSPSleepSettingsPerGizmoProperties()
{
  void *v0;
  _HKSPBoolProperty *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPWatchSleepFeaturesEnabled"), CFSTR("watchSleepFeaturesEnabled"));
  objc_msgSend(v0, "setWithObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HKSPSleepSettingsPropertiesForEquivalency()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPSettingsVersion");
  v9[1] = CFSTR("HKSPSettingsLastModifiedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepSettingsProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSettingsPropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HKSPSleepSettingsPropertiesForSignificance()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isAppleWatch") & 1) != 0)
  {
    v10[0] = CFSTR("HKSPWatchSleepFeaturesEnabled");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v0, "setWithArray:", MEMORY[0x1E0C9AA60]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  HKSPSleepSettingsProperties();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __HKSPSleepSettingsPropertiesForSignificance_block_invoke;
  v8[3] = &unk_1E4E3A630;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HKSPSleepSettingsDefaultValues()
{
  _HKSPBoolProperty *v0;
  uint64_t v1;
  _HKSPBoolProperty *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPWatchSleepFeaturesEnabled"), CFSTR("watchSleepFeaturesEnabled"));
  v5[0] = v0;
  v1 = MEMORY[0x1E0C9AAB0];
  v6[0] = MEMORY[0x1E0C9AAB0];
  v2 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPBoolProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPShareAcrossDevices"), CFSTR("shareAcrossDevices"));
  v5[1] = v2;
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A4F4E0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1A4F4E254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4E4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4E680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4E924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4EAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4EDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4F0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4F3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1A4F514DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F51E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1A4F52370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F5248C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F52850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F530C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

_HKSPImmediateScheduler *HKSPImmediateScheduler()
{
  return objc_alloc_init(_HKSPImmediateScheduler);
}

_HKSPQueueBackedScheduler *HKSPSerialQueueBackedScheduler(void *a1)
{
  return HKSPSerialQueueBackedSchedulerWithQoS(a1, QOS_CLASS_UNSPECIFIED);
}

_HKSPQueueBackedScheduler *HKSPSerialQueueBackedSchedulerWithQoS(void *a1, dispatch_qos_class_t a2)
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  const char *v8;
  dispatch_queue_t v9;
  _HKSPQueueBackedScheduler *v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, a2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a1;

  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  v9 = dispatch_queue_create(v8, v5);
  v10 = -[_HKSPQueueBackedScheduler initWithQueue:]([_HKSPQueueBackedScheduler alloc], "initWithQueue:", v9);

  return v10;
}

id HKSPDispatchQueueName(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  int v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v15;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "isEqual:", v3);
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR(".");
    v11 = &stru_1E4E3E220;
    if (v4)
      v11 = v4;
    else
      v10 = &stru_1E4E3E220;
    if (v5)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.sleep.%@%@%@"), v8, v10, v11, v15);
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.sleep.%@%@%@.%p"), v8, v10, v11, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E4E3E220;
    if (v4)
      v12 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.sleep.%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void HKSPResetUserDefaults(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  objc_msgSend(v1, "hksp_dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hksp_removeObjectsForKeys:", v4);

  objc_msgSend(v1, "hksp_synchronize");
}

const __CFString *NSStringFromHKSPAlarmSilentModeOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return &stru_1E4E3E220;
  else
    return off_1E4E3CDE0[a1 - 1];
}

id HKSPSleepEventRecordPropertiesForEquivalency()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPEventRecordVersion");
  v9[1] = CFSTR("HKSPEventRecordLastModifiedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepEventRecordProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepEventRecordPropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HKSPSleepEventRecordPropertiesForSignificance()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E60];
  _WakeUpConfirmedUntilDateProperty();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

const __CFString *NSStringFromHKSPSleepLockScreenState(unint64_t a1)
{
  if (a1 > 3)
    return &stru_1E4E3E220;
  else
    return off_1E4E3CE70[a1];
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1A4F57B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F58FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

uint64_t HKSPWeekdaysFromDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9)
    return 0;
  else
    return qword_1A4F67120[a1 + 2];
}

uint64_t HKSPDayForWeekdays(uint64_t result)
{
  if (result > 15)
  {
    if (result <= 63)
    {
      if (result == 16)
        return 6;
      if (result == 32)
        return 7;
    }
    else
    {
      switch(result)
      {
        case 0x40:
          return 1;
        case 0x7FLL:
          return -1;
        case 0xFFFFFFFFLL:
          return -2;
      }
    }
    return 0;
  }
  else
  {
    switch(result)
    {
      case 0:
      case 4:
        return result;
      case 1:
        result = 2;
        break;
      case 2:
        result = 3;
        break;
      case 8:
        result = 5;
        break;
      default:
        return 0;
    }
  }
  return result;
}

void HKSPEnumerateWeekdays(uint64_t a1, void *a2)
{
  void (**v3)(id, unint64_t, _BYTE *);
  unint64_t i;
  char v5;

  v3 = a2;
  if (a1 != 0xFFFFFFFFLL)
  {
    v5 = 0;
    for (i = 1; ; i *= 2)
    {
      if ((i & a1) != 0)
      {
        v3[2](v3, i, &v5);
        if (i > 0x20 || v5)
          break;
      }
      else if (i > 0x20)
      {
        break;
      }
    }
  }

}

void HKSPWeekdaysEnumerateDays(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a2;
  objc_msgSend(v5, "hk_gregorianCalendar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  HKSPWeekdaysEnumerateDaysInCalendar(v7, a1, v6, a3);

}

void HKSPWeekdaysEnumerateDaysInCalendar(void *a1, uint64_t a2, void *a3, char a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v7 = a3;
  if (a2 != 0xFFFFFFFFLL)
  {
    v9[1] = 3221225472;
    v9[2] = __HKSPWeekdaysEnumerateDaysInCalendar_block_invoke;
    v9[3] = &unk_1E4E3D030;
    v11 = a2;
    v8 = v7;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v7;
    HKSPEnumerateDaysOfWeekInCalendar(a1, v9, a4);

    v7 = v8;
  }

}

void HKSPEnumerateDaysOfWeekInCalendar(void *a1, void *a2, char a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  if ((a3 & 2) != 0)
    v5 = objc_msgSend(a1, "firstWeekday");
  else
    v5 = objc_msgSend(a1, "hksp_firstNonWeekendDay");
  HKSPEnumerateDaysOfWeekStartingOnDay(v5, (uint64_t)v6, a3);

}

void HKSPEnumerateDaysOfWeek(void *a1, char a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a1;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  HKSPEnumerateDaysOfWeekInCalendar(v5, v4, a2);

}

uint64_t HKSPEnumerateDaysOfWeekStartingOnDay(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v9 = 0;
  v3 = *MEMORY[0x1E0CB4B98];
  if (*MEMORY[0x1E0CB4B98])
  {
    v5 = result;
    if ((a3 & 1) != 0)
      v6 = 1;
    else
      v6 = 7;
    if ((a3 & 1) != 0)
      v7 = -1;
    else
      v7 = 1;
    if ((a3 & 1) != 0)
      v8 = 7;
    else
      v8 = 1;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, v5, &v9);
      if (v9)
        break;
      if (v5 == v6)
        v5 = v8;
      else
        v5 += v7;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t HKSPPreviousDay(uint64_t a1)
{
  if (a1 == 1)
    return 7;
  else
    return a1 - 1;
}

uint64_t HKSPNextDay(uint64_t a1)
{
  if (a1 == 7)
    return 1;
  else
    return a1 + 1;
}

uint64_t HKSPPreviousDayInWeekdays(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = a1;
  if (a1 == 1)
    v2 = 7;
  else
    v2 = a1 - 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HKSPPreviousDayInWeekdays_block_invoke;
  v5[3] = &unk_1E4E3B7D8;
  v5[4] = &v6;
  v5[5] = a2;
  HKSPEnumerateDaysOfWeekStartingOnDay(v2, (uint64_t)v5, 1);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1A4F5A584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t HKSPWeekdaysShiftBackOneDay(unint64_t result)
{
  uint64_t v1;

  v1 = ((result & 1) << 6) | (result >> 1);
  if (result == 0xFFFFFFFF)
    v1 = 0xFFFFFFFFLL;
  if (result)
    return v1;
  return result;
}

__CFString *NSStringFromHKSPWeekdays(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 127:
      return CFSTR("Every Day");
    case 96:
      return CFSTR("Weekends");
    case 31:
      v1 = CFSTR("Weekdays");
      break;
    default:
      HKSPIdentifierStringForWeekdays(a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

id HKSPIdentifierStringForWeekdays(uint64_t a1)
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HKSPIdentifierStringForWeekdays_block_invoke;
  v5[3] = &unk_1E4E3A710;
  v3 = v2;
  v6 = v3;
  HKSPWeekdaysEnumerateDays(a1, v5, 0);

  return v3;
}

const __CFString *NSStringForHKSPDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9)
    return CFSTR("M");
  else
    return off_1E4E3D140[a1 + 2];
}

BOOL HKSPWeekdaysIsSingleDay(uint64_t a1)
{
  return a1 && (a1 & (a1 - 1)) == 0;
}

uint64_t NSGregorianCalendarDayForHKSPDay(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7)
    return 0;
  return result;
}

uint64_t HKSPDayForNSGregorianCalendarDay(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7)
    return 0;
  return result;
}

id NSGregorianCalendarDaysForWeekdays(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __NSGregorianCalendarDaysForWeekdays_block_invoke;
  v6[3] = &unk_1E4E3D058;
  v7 = v2;
  v3 = v2;
  HKSPEnumerateWeekdays(a1, v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id HKSPDaysForWeekdays(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPDaysForWeekdaysInCalendar(a1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HKSPDaysForWeekdaysInCalendar(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3788];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __HKSPDaysForWeekdaysInCalendar_block_invoke;
  v9[3] = &unk_1E4E3A710;
  v10 = v5;
  v6 = v5;
  HKSPWeekdaysEnumerateDaysInCalendar(v4, a1, v9, 0);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

BOOL HKSPWeekdaysAreConsecutive(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  void *v6;
  _BOOL8 v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HKSPWeekdaysAreConsecutiveInCalendar(v6, a1, a2, a3);

  return v7;
}

BOOL HKSPWeekdaysAreConsecutiveInCalendar(void *a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  id v7;
  void *v8;
  _BOOL8 v9;
  uint64_t *v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a1;
  v8 = v7;
  v9 = 0;
  if (a2 && a2 != 0xFFFFFFFFLL)
  {
    if (a2 == 127)
    {
      if (a3)
        *a3 = 0;
      if (a4)
        *a4 = 0;
LABEL_13:
      v9 = 1;
      goto LABEL_20;
    }
    if ((a2 & (a2 - 1)) == 0)
    {
      if (a3)
        *a3 = a2;
      if (a4)
        *a4 = a2;
      goto LABEL_13;
    }
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __HKSPWeekdaysAreConsecutiveInCalendar_block_invoke;
    v12[3] = &unk_1E4E3D080;
    v12[4] = &v17;
    v12[5] = &v13;
    v12[6] = &v21;
    v12[7] = a2;
    HKSPWeekdaysEnumerateDaysInCalendar(v7, a2, v12, 0);
    v10 = v22;
    if (*((_BYTE *)v22 + 24))
    {
      if (a3)
        *a3 = v18[3];
      if (a4)
        *a4 = v14[3];
    }
    v9 = *((unsigned __int8 *)v10 + 24) != 0;
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
LABEL_20:

  return v9;
}

void sub_1A4F5AB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F5AC20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPWeekdaysFromDays(void *a1)
{
  id v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __HKSPWeekdaysFromDays_block_invoke;
  v4[3] = &unk_1E4E3D0A8;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateIndexesUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A4F5AD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL NSDateIsOnHKSPDayInCalendar(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  if ((unint64_t)(a2 - 1) >= 7)
    v3 = 0;
  else
    v3 = a2;
  return v3 == objc_msgSend(a3, "component:fromDate:", 512, a1);
}

uint64_t HKSPWeekendDaysInCurrentCalendar()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = HKSPWeekendDaysInCalendar(v0);

  return v1;
}

uint64_t HKSPWeekendDaysInCalendar(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "hk_weekendDays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HKSPWeekendDaysInCalendar_block_invoke;
  v5[3] = &unk_1E4E3D0D0;
  v5[4] = &v6;
  objc_msgSend(v2, "na_each:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1A4F5AEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPWeekdayDaysInCurrentCalendar()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = ~HKSPWeekendDaysInCalendar(v0) & 0x7F;

  return v1;
}

uint64_t HKSPWeekdayDaysInCalendar(void *a1)
{
  return ~HKSPWeekendDaysInCalendar(a1) & 0x7F;
}

uint64_t HKSPCompareWeekdaysInCurrentCalendar(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HKSPCompareWeekdaysInCalendar(a1, a2, v4);

  return v5;
}

uint64_t HKSPCompareWeekdaysInCalendar(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __HKSPCompareWeekdaysInCalendar_block_invoke;
  v8[3] = &unk_1E4E3D0F8;
  v8[5] = a1;
  v8[6] = a2;
  v8[4] = &v9;
  HKSPEnumerateDaysOfWeekInCalendar(v5, v8, 0);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1A4F5B080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSleepScheduleWeekdaysFromHKSPWeekdays(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __HKSleepScheduleWeekdaysFromHKSPWeekdays_block_invoke;
  v3[3] = &unk_1E4E3D120;
  v3[4] = &v4;
  HKSPWeekdaysEnumerateDays(a1, v3, 0);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4F5B178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromHKSPSleepEventTimelineResultsSleepScheduleInvalidReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("None");
  else
    return off_1E4E3D190[a1 - 1];
}

void sub_1A4F5B488(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_HKSPUnfairLock *HKSPUnfairLock()
{
  return objc_alloc_init(_HKSPUnfairLock);
}

_HKSPSynchronized *HKSPSynchronized()
{
  return objc_alloc_init(_HKSPSynchronized);
}

_HKSPNoop *HKSPNoop()
{
  return objc_alloc_init(_HKSPNoop);
}

void *HKSPUnfairLockGenerator()
{
  return &__block_literal_global_21;
}

void *HKSPSynchronizedGenerator()
{
  return &__block_literal_global_56;
}

void *HKSPNoopGenerator()
{
  return &__block_literal_global_57;
}

void HKSPApplyChangesToObject(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKSPRelationshipChange *v22;
  void *v23;
  void *v24;
  HKSPRelationshipChange *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if ((HKSPIsUnitTesting() & 1) == 0)
  {
    HKSPLogForCategory(5uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v35 = v4;
      v36 = 2114;
      v37 = v3;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_INFO, "[HKSPObject] applying changeSet: %{public}@ to: %{public}@", buf, 0x16u);
    }

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "changes", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v28 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((HKSPIsUnitTesting() & 1) == 0)
        {
          HKSPLogForCategory(5uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v35 = v11;
            v36 = 2114;
            v37 = v3;
            _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_INFO, "[HKSPObject] applying change: %{public}@ to: %{public}@", buf, 0x16u);
          }

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v3;
          v14 = v11;
          if ((objc_msgSend(v14, "isAdd") & 1) != 0
            || (objc_msgSend(v14, "isRemove") & 1) != 0
            || (objc_msgSend(v14, "changedValue"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                v16 = objc_msgSend(v15, "conformsToProtocol:", &unk_1EE7969E8),
                v15,
                (v16 & 1) == 0))
          {
            objc_msgSend(v13, "changeSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addChange:", v14);
          }
          else
          {
            objc_msgSend(v14, "property");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "hksp_valueForProperty:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v18, "mutableCopy");

            objc_msgSend(v14, "changedValue");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "changeSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            HKSPApplyChangesToObject(v19, v21);

            v22 = [HKSPRelationshipChange alloc];
            objc_msgSend(v14, "property");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "originalValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[HKSPRelationshipChange initWithProperty:changedObject:originalObject:](v22, "initWithProperty:changedObject:originalObject:", v23, v19, v24);

            objc_msgSend(v13, "changeSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addChange:", v25);

            v6 = v28;
          }

        }
        else
        {
          objc_msgSend(v3, "changeSet");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addChange:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

}

uint64_t HKSPCanResolveChangesToObject(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a1, "changeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v31;
    v27 = v5;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v28)
        objc_enumerationMutation(v5);
      v7 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v6);
      v8 = v3;
      objc_msgSend(v7, "originalValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "changedValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "property");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hksp_valueForProperty:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      HKSPLogForCategory(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "property");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v14;
        v37 = 2114;
        v38 = v9;
        v39 = 2114;
        v40 = v10;
        v41 = 2114;
        v42 = v12;
        _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_INFO, "[HKSPObject] property: %{public}@, original value: %{public}@, changed value: %{public}@, saved value: %{public}@", buf, 0x2Au);

      }
      if (NAEqualObjects())
      {
        HKSPLogForCategory(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v16 = v15;
          v17 = "[HKSPObject] original value == saved value, allowing update";
LABEL_14:
          _os_log_impl(&dword_1A4F0E000, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
        }
      }
      else
      {
        if (!NAEqualObjects())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
          v18 = v3;
          HKSPLogForCategory(6uLL);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4F0E000, v19, OS_LOG_TYPE_INFO, "[HKSPObject] checking relationship change...", buf, 2u);
          }

          v20 = v7;
          objc_msgSend(v20, "changedValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v12;
          if (!objc_msgSend(v21, "conformsToProtocol:", &unk_1EE7969E8))
          {

            v3 = v18;
            v5 = v27;
LABEL_25:

LABEL_26:
            HKSPLogForCategory(6uLL);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v36 = v7;
              _os_log_impl(&dword_1A4F0E000, v25, OS_LOG_TYPE_DEFAULT, "[HKSPObject] can't resolve %{public}@", buf, 0xCu);
            }

            v24 = 0;
            goto LABEL_29;
          }
          v23 = HKSPCanResolveChangesToObject(v21, v22);

          v3 = v18;
          v5 = v27;
          if ((v23 & 1) == 0)
            goto LABEL_26;
          goto LABEL_21;
        }
        HKSPLogForCategory(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v16 = v15;
          v17 = "[HKSPObject] changed value == saved value, allowing update";
          goto LABEL_14;
        }
      }

LABEL_21:
      if (v29 == ++v6)
      {
        v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v29)
          goto LABEL_3;
        break;
      }
    }
  }
  v24 = 1;
LABEL_29:

  return v24;
}

uint64_t HKSPEvaluateChangesToObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EE7969E8)
    && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "significantProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "changeSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    objc_msgSend(v3, "changes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __HKSPEvaluateChangesToObject_block_invoke;
    v8[3] = &unk_1E4E3D210;
    v5 = v2;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

    v6 = v12[3];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void sub_1A4F5BE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPPropertyIdentifiersForProperties(void *a1, const char *a2)
{
  return objc_msgSend(a1, "na_map:", &__block_literal_global_22);
}

id HKSPPropertiesByIdentifier(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __HKSPPropertiesByIdentifier_block_invoke;
  v6[3] = &unk_1E4E3D238;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

id HKSPDefaultValuesByIdentifier(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __HKSPDefaultValuesByIdentifier_block_invoke;
  v6[3] = &unk_1E4E3D260;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

uint64_t HKSPObjectsAreEquivalent(void *a1, void *a2)
{
  return HKSPObjectsAreEquivalentWithTransformer(a1, a2, &__block_literal_global_286);
}

uint64_t HKSPObjectsAreEquivalentWithTransformer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a1;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __HKSPObjectsAreEquivalentWithTransformer_block_invoke;
  v11[3] = &unk_1E4E3D340;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _HKSPEquateObjectsWithBlock(v8, a2, v11);

  return v9;
}

uint64_t HKSPHashValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend((id)objc_opt_class(), "allProperties", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v1, "hksp_valueForProperty:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (id)objc_msgSend(v2, "appendObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    v10 = objc_msgSend(v2, "hash");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void HKSPCopyFromObject(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void HKSPCopyFromObject(id<HKSPObject>  _Nonnull __strong, id<HKSPObject>  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HKSPObject.m"), 197, CFSTR("objects must be subclasses"));

    }
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "allProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "copyValueFromObject:toObject:", v3, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

const __CFString *NSStringFromHKSPSleepFocusConfigurationState(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unconfigured");
  else
    return off_1E4E3D360[a1];
}

id HKSPSleepScheduleOccurrenceProperties()
{
  void *v0;
  _HKSPUnsignedIntegerProperty *v1;
  _HKSPRelationshipProperty *v2;
  void *v3;
  _HKSPRelationshipProperty *v4;
  _HKSPUnsignedIntegerProperty *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPOccurrenceVersion"), CFSTR("version"));
  v10[0] = v1;
  v2 = [_HKSPRelationshipProperty alloc];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](v2, "initWithIdentifier:propertyName:expectedValueClasses:", CFSTR("HKSPOccurrenceBackingOccurrence"), CFSTR("backingOccurrence"), v3, v9[0]);
  v10[1] = v4;
  v5 = -[HKSPProperty initWithIdentifier:propertyName:]([_HKSPUnsignedIntegerProperty alloc], "initWithIdentifier:propertyName:", CFSTR("HKSPOccurrenceWeekdays"), CFSTR("weekdays"));
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id HKSPSleepScheduleOccurrencePropertiesForEquivalency()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("HKSPOccurrenceVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPSleepScheduleOccurrenceProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepScheduleOccurrencePropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E4E3A630;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *NSStringFromHKSPSleepScheduleState(uint64_t a1)
{
  const __CFString *result;

  result = 0;
  switch(a1)
  {
    case 0:
      result = CFSTR("Disabled");
      break;
    case 1:
      result = CFSTR("WakeUp");
      break;
    case 2:
      result = CFSTR("Bedtime");
      break;
    case 3:
      result = CFSTR("WindDown");
      break;
    case 4:
    case 5:
      return result;
    case 6:
      result = CFSTR("DelayedWakeUp");
      break;
    default:
      if (a1 == 0xFFFFFFFFLL)
        result = CFSTR("None");
      else
        result = 0;
      break;
  }
  return result;
}

uint64_t NSStringFromHKSPSleepScheduleStateChangeReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return 0;
  else
    return (uint64_t)*(&off_1E4E3D418 + a1 - 1);
}

BOOL HKSPSleepScheduleStateIsForBedtime(uint64_t a1)
{
  return ((a1 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

BOOL HKSPSleepScheduleStateIsForWindDown(uint64_t a1)
{
  return a1 == 3;
}

BOOL HKSPSleepScheduleStateIsForSleep(uint64_t a1)
{
  return ((a1 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0 || a1 == 3;
}

uint64_t HKSPSleepScheduleStateChangeReasonIsExpected(unint64_t a1)
{
  return (a1 < 9) & (0x18Au >> a1);
}

const __CFString *NSStringFromHKSPAnalyticsSleepNotificationType(uint64_t a1)
{
  if (a1)
    return CFSTR("FocusIntroduction");
  else
    return CFSTR("BedtimeReminder");
}

const __CFString *NSStringFromHKSPAnalyticsSleepNotificationAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Fired");
  else
    return off_1E4E3D458[a1 - 1];
}

void sub_1A4F603C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t HKFeatureIdentifierIsProvidedBySleepDaemon()
{
  return MEMORY[0x1E0CB5050]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1E0CBB8A0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1E0D51970]();
}

uint64_t NAEqualObjects()
{
  return MEMORY[0x1E0D51978]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1E0CB71A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

