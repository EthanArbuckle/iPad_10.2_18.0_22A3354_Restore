@implementation SOSUtilities

+ (id)_userSOSDefaults
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SOS"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SOS"));
  }
  return v5;
}

+ (BOOL)kappaTriggersEmergencySOS
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSKappaTriggersEmergencySOSKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AAB0];
  if (objc_msgSend(v2, "BOOLValue"))
    v4 = _os_feature_enabled_impl();
  else
    v4 = 0;

  return v4;
}

+ (id)_sosPrefsValueForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.SOS"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (NSString)getKappaThirdPartyDisplayNameForApp
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "getKappaThirdPartyApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLocalizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (SABundleManagerApp)getKappaThirdPartyApp
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(getSABundleManagerClass(), "crashDetectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "approvedApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SABundleManagerApp *)v4;
}

+ (id)_SOSDomainAccessor
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D51610]);
  objc_msgSend(a1, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDomain:pairedDevice:", CFSTR("com.apple.SOS"), v4);

  return v5;
}

+ (id)_userFriendsDomainAccessor
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D51610]);
  objc_msgSend(a1, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDomain:pairedDevice:", CFSTR("com.apple.mobilephone"), v4);

  return v5;
}

+ (void)_setSOSPrefsValue:(id)a3 forKey:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.SOS"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (BOOL)_synchronizeSOSPrefs
{
  return CFPreferencesSynchronize(CFSTR("com.apple.SOS"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]) != 0;
}

+ (NSString)automaticDialingSectionDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WATCH_AUTO_DIAL_HEADER"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)holdSideButtonTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WATCH_LONG_PRESS_TRIGGERS_SOS_LABEL"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)holdSideButtonFooterDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WATCH_PRESS_AND_HOLD_FOOTER"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)longPressTriggersEmergencySOS
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_userFriendsDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SOSLongPressTriggersEmergencySOSKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AAB0];
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (void)setLongPressTriggersEmergencySOS:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v3 = a3;
  +[SOSCoreAnalyticsReporter reportSOSLongPressTriggersEmergencySOS:](SOSCoreAnalyticsReporter, "reportSOSLongPressTriggersEmergencySOS:");
  objc_msgSend(a1, "_userFriendsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("SOSLongPressTriggersEmergencySOSKey"));

  dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SOSUtilities_setLongPressTriggersEmergencySOS___block_invoke;
  block[3] = &unk_1E5F75E48;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

void __49__SOSUtilities_setLongPressTriggersEmergencySOS___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "synchronize");
  v3 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSLongPressTriggersEmergencySOSKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeNanoDomain:keys:", CFSTR("com.apple.mobilephone"), v2);

}

+ (NSString)fallDetectionTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_FALL_DETECTION_TITLE"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallDetectionAlwaysOnTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_NEWTON_MODE_ALWAYS_ON"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallDetectionOnlyDuringWorkoutsTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_NEWTON_MODE_WORKOUTS_ONLY"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallDetectionFooterDescription
{
  const __CFString *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "activeDeviceSupportsNewtonWorkoutsOnly"))
  {
    if (+[SOSUtilities newtonTriggersEmergencySOS](SOSUtilities, "newtonTriggersEmergencySOS"))
    {
      if (+[SOSUtilities newtonTriggersEmergencySOSWorkouts](SOSUtilities, "newtonTriggersEmergencySOSWorkouts"))
      {
        v2 = CFSTR("SOS_NEWTON_FOOTER_ENABLED_WORKOUTS_ONLY");
      }
      else
      {
        v2 = CFSTR("SOS_NEWTON_FOOTER_ENABLED_ALWAYS");
      }
    }
    else
    {
      v2 = CFSTR("SOS_NEWTON_FOOTER_DISABLED");
    }
  }
  else
  {
    v2 = CFSTR("SOS_NEWTON_FOOTER");
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E5F76FF8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (NSNumber)newtonTriggersEmergencySOSNumber
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_SOSDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SOSNewtonTriggersEmergencySOSKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (void)setNewtonTriggersEmergencySOSNumber:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "newton status change: %d", buf, 8u);
  }

  objc_msgSend(a1, "_SOSDomainAccessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SOSNewtonTriggersEmergencySOSKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v4) & 1) == 0)
  {
    +[SOSCoreAnalyticsReporter reportSOSAutomaticNewtonEnabled:](SOSCoreAnalyticsReporter, "reportSOSAutomaticNewtonEnabled:", objc_msgSend(v4, "BOOLValue"));
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("SOSNewtonTriggersEmergencySOSKey"));
    dispatch_get_global_queue(2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SOSUtilities_setNewtonTriggersEmergencySOSNumber___block_invoke;
    block[3] = &unk_1E5F75E48;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

void __52__SOSUtilities_setNewtonTriggersEmergencySOSNumber___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "synchronize");
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSNewtonTriggersEmergencySOSKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeNanoDomain:keys:", CFSTR("com.apple.SOS"), v3);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_1);
}

void __52__SOSUtilities_setNewtonTriggersEmergencySOSNumber___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSNewtonStateChangedNotification"), 0, 0, 1u);
}

+ (BOOL)shouldSkipNewtonCall
{
  void *v2;
  char v3;

  +[SOSUtilities _userSOSDefaults](SOSUtilities, "_userSOSDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SkipNewtonCall"));

  return v3;
}

+ (BOOL)shouldAllowSOSStatusReset
{
  void *v2;
  void *v3;
  char v4;

  +[SOSUtilities _sosPrefsValueForKey:](SOSUtilities, "_sosPrefsValueForKey:", CFSTR("AllowSOSStatusReset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (int64_t)SOSTriggerMechanismForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismThreeClicks")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismFiveClicks")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismVolumeLockHold")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismButtonTrigger")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismNewton")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismCinnamon")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismKappa")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismMandrake")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SOSTriggerMechanismUnknown")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSProgressionForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSProgressionUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSProgressionSOSTriggered")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSProgressionThirdParty")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SOSProgressionFlowStateUpdate")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSResolutionForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSResolutionNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSResolutionSystemCompleted")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSResolutionUserCompleted")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSResolutionUserDismissed")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SOSResolutionUserDisabled")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSFlowStateForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateUserCheckIn")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateCallCountdown")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateCallUserInitiated")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateCallAutoInitiated")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateContactCountdown")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateCancelled")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateDone")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateVoiceLoopTester")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateMedicalID")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateUnresponsiveResting")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateStewieResting")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateMotionCancelled")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateSliderView")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SOSFlowStateTriggered")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)newtonTriggersEmergencySOSWorkouts
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "_SOSDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SOSNewtonWorkoutTriggersEmergencySOSKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)hasNewtonTriggersEmergencySOSWorkoutsSetting
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_SOSDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SOSNewtonWorkoutTriggersEmergencySOSKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)setNewtonTriggersEmergencySOSWorkouts:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "newton workouts status change: %d", buf, 8u);
  }

  objc_msgSend(a1, "_SOSDomainAccessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SOSNewtonWorkoutTriggersEmergencySOSKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue") != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("SOSNewtonWorkoutTriggersEmergencySOSKey"));

    dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SOSUtilities_setNewtonTriggersEmergencySOSWorkouts___block_invoke;
    block[3] = &unk_1E5F75E48;
    v11 = v6;
    dispatch_async(v9, block);

  }
}

void __54__SOSUtilities_setNewtonTriggersEmergencySOSWorkouts___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "synchronize");
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSNewtonWorkoutTriggersEmergencySOSKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeNanoDomain:keys:", CFSTR("com.apple.SOS"), v3);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_379);
}

void __54__SOSUtilities_setNewtonTriggersEmergencySOSWorkouts___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSNewtonStateChangedNotification"), 0, 0, 1u);
}

+ (BOOL)newtonTriggersEmergencySOS
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "newtonTriggersEmergencySOSNumber");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setNewtonTriggersEmergencySOSNumber:", v4);

}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 doesNewtonRequireConfirmation:(BOOL)a5 presentConfirmationOnViewController:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id UIAlertControllerClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id UIAlertActionClass;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  BOOL v45;
  BOOL v46;

  v8 = a5;
  v10 = a3;
  v12 = a6;
  v13 = a7;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke;
  v41[3] = &unk_1E5F75EB8;
  v45 = v10;
  v46 = a4;
  v44 = a1;
  v14 = v13;
  v43 = v14;
  v15 = v12;
  v42 = v15;
  v16 = MEMORY[0x1B5DF84EC](v41);
  v17 = (void *)v16;
  if (v10 && v8)
  {
    UIAlertControllerClass = getUIAlertControllerClass();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_TITLE"), &stru_1E5F76FF8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_DETAIL"), &stru_1E5F76FF8, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(UIAlertControllerClass, "alertControllerWithTitle:message:preferredStyle:", v20, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    UIAlertActionClass = getUIAlertActionClass();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_CANCEL"), &stru_1E5F76FF8, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_3;
    v38[3] = &unk_1E5F75EE0;
    v40 = a1;
    v39 = v14;
    objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v26, 1, v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v28);

    v29 = getUIAlertActionClass();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_OK"), &stru_1E5F76FF8, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v27;
    v34 = 3221225472;
    v35 = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_4;
    v36 = &unk_1E5F75F08;
    v37 = v17;
    objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 0, &v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v32, v33, v34, v35, v36);

    objc_msgSend(v15, "presentViewController:animated:completion:", v23, 1, 0);
  }
  else
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }

}

void __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke(uint64_t a1)
{
  id UIAlertControllerClass;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id UIAlertActionClass;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  _QWORD v14[4];
  __int128 v15;
  char v16;

  if (*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    UIAlertControllerClass = getUIAlertControllerClass();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SOS_WRIST_DETECTION_OFF_TITLE"), &stru_1E5F76FF8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SOS_WRIST_DETECTION_OFF_DETAIL"), &stru_1E5F76FF8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(UIAlertControllerClass, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    UIAlertActionClass = getUIAlertActionClass();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SOS_WRIST_DETECTION_OK"), &stru_1E5F76FF8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_2;
    v14[3] = &unk_1E5F75E90;
    v16 = *(_BYTE *)(a1 + 56);
    v13 = *(_OWORD *)(a1 + 40);
    v11 = (id)v13;
    v15 = v13;
    objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v10, 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v12);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setNewtonTriggersEmergencySOS:", *(unsigned __int8 *)(a1 + 56) != 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setNewtonTriggersEmergencySOS:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setNewtonTriggersEmergencySOS:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)presentConfirmationOnViewController:(id)a3 title:(id)a4 message:(id)a5 cancelTitle:(id)a6 cancelHandler:(id)a7 confirmTitle:(id)a8 confirmHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id UIAlertActionClass;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v28 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a5;
  sos_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v15;
    _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "Presenting confirmation with title: %@", buf, 0xCu);
  }

  objc_msgSend(getUIAlertControllerClass(), "alertControllerWithTitle:message:preferredStyle:", v15, v19, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v16, "length");
  v23 = MEMORY[0x1E0C809B0];
  if (v22)
  {
    UIAlertActionClass = getUIAlertActionClass();
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke;
    v31[3] = &unk_1E5F75F08;
    v32 = v28;
    objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v16, 1, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v25);

  }
  if (objc_msgSend(v17, "length"))
  {
    v26 = getUIAlertActionClass();
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke_2;
    v29[3] = &unk_1E5F75F08;
    v30 = v18;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v17, 0, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v27);

  }
  objc_msgSend(v14, "presentViewController:animated:completion:", v21, 1, 0);

}

uint64_t __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (BOOL)newtonAlwaysOnRequiresConfirmationForEligibility:(unint64_t)a3
{
  return a3 != 0;
}

+ (BOOL)defaultToWorkoutsOnlyForEligibility:(unint64_t)a3
{
  return a3 == 4;
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 newtonTriggersEmergencySOSWorkoutsOnly:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a4;
  v5 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v5;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "setNewtonTriggersEmergencySOS:%d newtonTriggersEmergencySOSWorkoutsOnly:%d", (uint8_t *)v8, 0xEu);
  }

  objc_msgSend(a1, "setNewtonTriggersEmergencySOS:", v5);
  if (v5 && v4)
    objc_msgSend(a1, "setNewtonTriggersEmergencySOSWorkouts:", 1);
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 newtonEligibility:(unint64_t)a5 confirmationDelegate:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);
  _QWORD v34[4];
  id v35;
  id v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  BOOL v42;
  BOOL v43;
  char v44;
  uint8_t buf[4];
  _BYTE v46[10];
  _BYTE v47[10];
  __int16 v48;
  id v49;
  uint64_t v50;

  v9 = a4;
  v10 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  sos_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v46 = v10;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v9;
    *(_WORD *)v47 = 2048;
    *(_QWORD *)&v47[2] = a5;
    v48 = 2112;
    v49 = v12;
    _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "setNewtonTriggersEmergencySOS:%d isWristDetectionEnabled:%d newtonEligibility:%zd confirmationDelegate:%@", buf, 0x22u);
  }

  v15 = objc_msgSend(a1, "newtonTriggersEmergencySOSWorkouts");
  sos_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v46 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmation"
                     "Delegate:completion:]";
    *(_WORD *)&v46[8] = 1024;
    *(_DWORD *)v47 = v15;
    _os_log_impl(&dword_1AF4DC000, v16, OS_LOG_TYPE_DEFAULT, "%s - newtonTriggersEmergencySOSWorkoutsOnly:%d", buf, 0x12u);
  }

  if ((objc_msgSend(a1, "hasNewtonTriggersEmergencySOSWorkoutsSetting") & 1) == 0
    && objc_msgSend(a1, "activeDeviceSupportsNewtonWorkoutsOnly"))
  {
    v15 = objc_msgSend(a1, "defaultToWorkoutsOnlyForEligibility:", a5);
    sos_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v46 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmati"
                       "onDelegate:completion:]";
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v15;
      _os_log_impl(&dword_1AF4DC000, v17, OS_LOG_TYPE_DEFAULT, "%s - !hasNewtonTriggersEmergencySOSWorkoutsSetting, set default newtonTriggersEmergencySOSWorkoutsOnly:%d", buf, 0x12u);
    }

  }
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke;
  v38[3] = &unk_1E5F75F58;
  v42 = v10;
  v43 = v9;
  v18 = v12;
  v39 = v18;
  v41 = a1;
  v44 = v15;
  v19 = v13;
  v40 = v19;
  v20 = (void (**)(_QWORD))MEMORY[0x1B5DF84EC](v38);
  if (v10 && (v15 & 1) == 0 && objc_msgSend(a1, "newtonAlwaysOnRequiresConfirmationForEligibility:", a5))
  {
    sos_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v46 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmati"
                       "onDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v21, OS_LOG_TYPE_DEFAULT, "%s - presenting eligibility-related confirmation", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_TITLE"), &stru_1E5F76FF8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_DETAIL"), &stru_1E5F76FF8, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_CANCEL"), &stru_1E5F76FF8, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_396;
    v34[3] = &unk_1E5F75F80;
    v36 = a1;
    v37 = 0;
    v35 = v19;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_OK"), &stru_1E5F76FF8, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v25;
    v32[1] = 3221225472;
    v32[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_397;
    v32[3] = &unk_1E5F75FA8;
    v33 = v20;
    objc_msgSend(v18, "presentConfirmationWithTitle:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:", v29, v22, v24, v34, v27, v32);

  }
  else
  {
    sos_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v46 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmati"
                       "onDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v28, OS_LOG_TYPE_DEFAULT, "%s - no eligibility confirmation needed", buf, 0xCu);
    }

    v20[2](v20);
  }

}

void __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  char v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:"
            "completion:]_block_invoke";
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - presenting wrist detection notification", buf, 0xCu);
    }

    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SOS_WRIST_DETECTION_OFF_TITLE"), &stru_1E5F76FF8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SOS_WRIST_DETECTION_OFF_DETAIL"), &stru_1E5F76FF8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SOS_WRIST_DETECTION_OK"), &stru_1E5F76FF8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_395;
    v13[3] = &unk_1E5F75F30;
    v15 = *(_BYTE *)(a1 + 56);
    v16 = *(_BYTE *)(a1 + 58);
    v12 = *(_OWORD *)(a1 + 40);
    v11 = (id)v12;
    v14 = v12;
    objc_msgSend(v4, "presentConfirmationWithTitle:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:", v6, v8, 0, 0, v10, v13);

  }
  else
  {
    sos_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:"
            "completion:]_block_invoke";
      _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - no wrist detection notification needed", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "setNewtonTriggersEmergencySOS:newtonTriggersEmergencySOSWorkoutsOnly:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 58));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_395(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:com"
         "pletion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - ack'd", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setNewtonTriggersEmergencySOS:newtonTriggersEmergencySOSWorkoutsOnly:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_396(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:com"
         "pletion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setNewtonTriggersEmergencySOS:newtonTriggersEmergencySOSWorkoutsOnly:", 0, *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_397(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:com"
         "pletion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)setNewtonTriggersEmergencySOSWorkoutsOnly:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 newtonEligibility:(unint64_t)a5 confirmationDelegate:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v12;
  void (**v13)(id, uint64_t);
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(id, uint64_t);
  id v28;
  BOOL v29;
  _QWORD v30[4];
  void (**v31)(id, uint64_t);
  uint8_t buf[4];
  _BYTE v33[10];
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v9 = a4;
  v10 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = (void (**)(id, uint64_t))a7;
  sos_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v33 = v10;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v9;
    v34 = 2048;
    v35 = a5;
    v36 = 2112;
    v37 = v12;
    _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "setNewtonTriggersEmergencySOSWorkoutsOnly:%d isWristDetectionEnabled:%d newtonEligibility:%zd confirmationDelegate:%@", buf, 0x22u);
  }

  if (v10 || !objc_msgSend(a1, "newtonAlwaysOnRequiresConfirmationForEligibility:", a5))
  {
    sos_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v33 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibilit"
                       "y:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v21, OS_LOG_TYPE_DEFAULT, "%s - no eligibility confirmation needed", buf, 0xCu);
    }

    objc_msgSend(a1, "setNewtonTriggersEmergencySOSWorkouts:", v10);
    v13[2](v13, 1);
  }
  else
  {
    sos_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v33 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibilit"
                       "y:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "%s - presenting eligibility-related confirmation", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_TITLE"), &stru_1E5F76FF8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_DETAIL"), &stru_1E5F76FF8, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_CANCEL"), &stru_1E5F76FF8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke;
    v30[3] = &unk_1E5F75FA8;
    v31 = v13;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SOS_MODE_NEWTON_CONFIRM_OK"), &stru_1E5F76FF8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_398;
    v26[3] = &unk_1E5F75F80;
    v28 = a1;
    v29 = v10;
    v27 = v31;
    objc_msgSend(v12, "presentConfirmationWithTitle:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:", v23, v22, v17, v30, v20, v26);

  }
}

uint64_t __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibility:confirmation"
         "Delegate:completion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_398(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibility:confirmation"
         "Delegate:completion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setNewtonTriggersEmergencySOSWorkouts:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isSmallScreen
{
  if (isSmallScreen_onceToken != -1)
    dispatch_once(&isSmallScreen_onceToken, &__block_literal_global_399);
  return isSmallScreen_isSmallScreen;
}

void __29__SOSUtilities_isSmallScreen__block_invoke()
{
  double v0;
  double v1;
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(getUIScreenClass(), "mainScreen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nativeBounds");
  v1 = v0;
  objc_msgSend(v6, "scale");
  v3 = v2;
  objc_msgSend(v6, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5 && v1 / v3 == 568.0)
    isSmallScreen_isSmallScreen = 1;

}

+ (id)phoneAssetName
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  double v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  double v15;

  v3 = +[SOSUtilities canTriggerSOSWithVolumeLockHold](SOSUtilities, "canTriggerSOSWithVolumeLockHold");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (!v3)
  {
    if (objc_msgSend(a1, "isSmallScreen"))
      v13 = CFSTR("top_");
    else
      v13 = &stru_1E5F76FF8;
    v14 = objc_msgSend(a1, "SOSTriggerClickCount");
    objc_msgSend(getUIScreenClass(), "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("home_%@%ld@%dx"), v13, v14, (int)v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(getUIScreenClass(), "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("home_hold@%dx"), (int)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[SOSUtilities deviceHasHomeButton](SOSUtilities, "deviceHasHomeButton"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(a1, "deviceHasSlot"))
      v9 = CFSTR("slot_");
    else
      v9 = &stru_1E5F76FF8;
    objc_msgSend(getUIScreenClass(), "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@homeless_hold@%dx"), v9, (int)v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
LABEL_11:

  }
  return v7;
}

+ (void)getAssetViewForPhoneWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "phoneAssetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Loading SOSTriggerAnimation asset %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v5, CFSTR("caar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v9 = (void *)get_UICAPackageViewClass_softClass;
  v21 = get_UICAPackageViewClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!get_UICAPackageViewClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v23 = __get_UICAPackageViewClass_block_invoke;
    v24 = &unk_1E5F75CA8;
    v25 = &v18;
    __get_UICAPackageViewClass_block_invoke((uint64_t)&buf);
    v9 = (void *)v19[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v18, 8);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __51__SOSUtilities_getAssetViewForPhoneWithCompletion___block_invoke;
  v14[3] = &unk_1E5F75FF0;
  v16 = v4;
  v17 = a1;
  v15 = v5;
  v12 = v4;
  v13 = v5;
  objc_msgSend(v11, "loadPackageViewWithContentsOfURL:publishedObjectViewClassMap:completion:", v8, 0, v14);

}

void __51__SOSUtilities_getAssetViewForPhoneWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id UIImageClass;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  double v16;
  float v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    UIImageClass = getUIImageClass();
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(UIImageClass, "imageNamed:inBundle:withConfiguration:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v13 = (void *)getUIImageViewClass_softClass;
    v25 = getUIImageViewClass_softClass;
    if (!getUIImageViewClass_softClass)
    {
      *(_QWORD *)&v20.a = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v20.b = 3221225472;
      *(_QWORD *)&v20.c = __getUIImageViewClass_block_invoke;
      *(_QWORD *)&v20.d = &unk_1E5F75CA8;
      *(_QWORD *)&v20.tx = &v22;
      __getUIImageViewClass_block_invoke((uint64_t)&v20);
      v13 = (void *)v23[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v22, 8);
    v7 = (id)objc_msgSend([v14 alloc], "initWithImage:", v12);

  }
  objc_msgSend(getUIScreenClass(), "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v20.c = v18;
  *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v21, &v20, v17, v17);
  v19 = v21;
  objc_msgSend(v7, "setTransform:", &v19);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (NSString)phoneTriggerAnimationFooterDescription
{
  int v3;
  void *v4;
  const __CFString *v5;
  int64_t v6;
  void *v7;

  if (objc_msgSend(a1, "canTriggerSOSWithVolumeLockHold"))
  {
    v3 = objc_msgSend(a1, "autoCallRequiresSIM");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v5 = CFSTR("PHONE_TRIGGER_ANIMATION_VOLUME_LOCK_HOLD_FOOTER_REQUIRE_SIM");
    else
      v5 = CFSTR("PHONE_TRIGGER_ANIMATION_VOLUME_LOCK_HOLD_FOOTER");
  }
  else
  {
    v6 = +[SOSUtilities SOSSelectableTriggerMechanismCapability](SOSUtilities, "SOSSelectableTriggerMechanismCapability");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 2)
      v5 = CFSTR("PHONE_TRIGGER_ANIMATION_INDIA_CLICKS_FOOTER");
    else
      v5 = CFSTR("PHONE_TRIGGER_ANIMATION_FIVE_CLICKS_FOOTER");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (id)watchAssetNameWithCrownOrientationOnRightSide:(BOOL)a3 layoutLeftToRight:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("crownLeft");
  if (a3)
    v4 = CFSTR("crownRight");
  v5 = CFSTR("RTL");
  if (a4)
    v5 = CFSTR("LTR");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("watch"), v4, v5);
}

+ (id)getAssetViewForWatchWithCrownOrientationOnRightSide:(BOOL)a3 layoutLeftToRight:(BOOL)a4 tintColor:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  double v16;
  float v17;
  __int128 v18;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  objc_msgSend(a1, "watchAssetNameWithCrownOrientationOnRightSide:layoutLeftToRight:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getUIImageClass(), "imageNamed:inBundle:withConfiguration:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v12 = (void *)getSOSUIAnimatingSpriteImageViewClass_softClass;
  v26 = getSOSUIAnimatingSpriteImageViewClass_softClass;
  if (!getSOSUIAnimatingSpriteImageViewClass_softClass)
  {
    *(_QWORD *)&v21.a = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v21.b = 3221225472;
    *(_QWORD *)&v21.c = __getSOSUIAnimatingSpriteImageViewClass_block_invoke;
    *(_QWORD *)&v21.d = &unk_1E5F75CA8;
    *(_QWORD *)&v21.tx = &v23;
    __getSOSUIAnimatingSpriteImageViewClass_block_invoke((uint64_t)&v21);
    v12 = (void *)v24[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v23, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithFrame:", 0.0, 0.0, 320.0, 320.0);
  objc_msgSend(getUIScreenClass(), "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v21.c = v18;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v22, &v21, v17, v17);
  v20 = v22;
  objc_msgSend(v14, "setTransform:", &v20);
  objc_msgSend(v14, "setTintColor:", v8);
  objc_msgSend(v14, "setSpriteFrameCount:", 350);
  objc_msgSend(v14, "setSpriteColumnCount:", 18);
  objc_msgSend(v14, "setSpriteImage:", v11);
  objc_msgSend(v14, "startAnimating");

  return v14;
}

+ (NSString)watchTriggerAnimationFooterDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WATCH_TRIGGER_ANIMATION_FOOTER"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (int64_t)mostRecentlyUsedSOSTriggerMechanism
{
  void *v2;
  void *v3;
  int64_t v4;

  +[SOSUtilities mostRecentSOSStatus](SOSUtilities, "mostRecentSOSStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "trigger");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)autoCallRequiresSIM
{
  return objc_msgSend(a1, "isIndiaSKU") ^ 1;
}

+ (BOOL)isIndiaSKU
{
  void *v2;
  char v3;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("HN"));

  return v3;
}

+ (BOOL)supportsSOSWithSideButtonSelectableNumberOfClicks
{
  return (unint64_t)(+[SOSUtilities SOSSelectableTriggerMechanismCapability](SOSUtilities, "SOSSelectableTriggerMechanismCapability")- 2) < 3;
}

+ (BOOL)canTriggerSOSWithSideButton
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "currentSOSTriggerMechanism");
  if (v3 != 1)
    LOBYTE(v3) = objc_msgSend(a1, "currentSOSTriggerMechanism") == 2;
  return v3;
}

+ (int64_t)SOSTriggerClickCount
{
  uint64_t v2;
  int64_t v3;

  v2 = objc_msgSend(a1, "currentSOSTriggerMechanism");
  v3 = 5;
  if (v2 != 2)
    v3 = 0;
  if (v2 == 1)
    return 3;
  else
    return v3;
}

+ (NSString)callWithSideButtonTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CALL_WITH_SIDE_BUTTON"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)callWithSideButtonFooterDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (objc_msgSend(a1, "SOSSelectableTriggerMechanismCapability") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ALSO_WORKS_THREE_CLICKS_FOOTER");
  }
  else
  {
    if (objc_msgSend(a1, "SOSSelectableTriggerMechanismCapability") != 3)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ALSO_WORKS_FIVE_CLICKS_FOOTER");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)_potentialForAccessibilityConflict
{
  if ((objc_msgSend(a1, "deviceHasHomeButton") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "mustAllowThreeClickTrigger");
}

+ (BOOL)_hasAccessibilityConflict
{
  void *v2;
  BOOL v3;

  v2 = (void *)_AXSTripleClickCopyOptions();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (void)setCallWithSideButtonPresses:(BOOL)a3 presentErrorAlertOnViewController:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id UIAlertControllerClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id UIAlertActionClass;
  void *v17;
  void *v18;
  void (**v19)(id, uint64_t);
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  void (**v31)(id, uint64_t);
  id v32;
  BOOL v33;
  _QWORD v34[4];
  void (**v35)(id, uint64_t);

  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (!a3)
  {
    objc_msgSend(a1, "setCallWithSideButtonPressesEnabled:", 0);
    if (objc_msgSend(a1, "_potentialForAccessibilityConflict"))
    {
      v25 = a1;
      v26 = 3;
LABEL_9:
      objc_msgSend(v25, "setCurrentSOSTriggerMechanism:", v26);
    }
LABEL_10:
    v9[2](v9, 1);
    goto LABEL_11;
  }
  if (!objc_msgSend(a1, "_potentialForAccessibilityConflict")
    || !objc_msgSend(a1, "_hasAccessibilityConflict"))
  {
    objc_msgSend(a1, "setCallWithSideButtonPressesEnabled:", 1);
    if (objc_msgSend(a1, "_potentialForAccessibilityConflict"))
    {
      v25 = a1;
      v26 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  UIAlertControllerClass = getUIAlertControllerClass();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ACCESSIBILITY_TITLE"), &stru_1E5F76FF8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ACCESSIBILITY_MESSAGE"), &stru_1E5F76FF8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(UIAlertControllerClass, "alertControllerWithTitle:message:preferredStyle:", v12, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  UIAlertActionClass = getUIAlertActionClass();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ACCESSIBILITY_CANCEL"), &stru_1E5F76FF8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke;
  v34[3] = &unk_1E5F75F08;
  v19 = v9;
  v35 = v19;
  objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v18, 1, v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v20);

  v21 = getUIAlertActionClass();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ACCESSIBILITY_CONTINUE"), &stru_1E5F76FF8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke_2;
  v30 = &unk_1E5F75E90;
  v32 = a1;
  v33 = a3;
  v31 = v19;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v24, v27, v28, v29, v30);

  objc_msgSend(v8, "presentViewController:animated:completion:", v15, 1, 0);
LABEL_11:

}

uint64_t __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke_2(uint64_t a1)
{
  _AXSSetTripleClickOptions();
  objc_msgSend(*(id *)(a1 + 40), "setCallWithSideButtonPressesEnabled:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setCurrentSOSTriggerMechanism:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)setNumberOfSideButtonPresses:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (objc_msgSend(a1, "mustAllowThreeClickTrigger")
    && !objc_msgSend(a1, "isDeviceD2xOrNewer"))
  {
    if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(a1, "setCurrentSOSTriggerMechanism:", a3);
    }
    else
    {
      sos_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[SOSUtilities setNumberOfSideButtonPresses:].cold.2(a3, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  else
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SOSUtilities setNumberOfSideButtonPresses:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

+ (int64_t)currentSOSTriggerMechanism
{
  void *v3;
  int64_t v4;
  int v5;
  CFIndex AppIntegerValue;
  int64_t v7;
  void *v8;
  uint64_t v9;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSTriggerMechanismKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  switch(v4)
  {
    case 0:
      goto LABEL_9;
    case 1:
      if ((objc_msgSend(a1, "mustAllowThreeClickTrigger") & 1) != 0)
        return 1;
      v7 = 2;
      goto LABEL_22;
    case 2:
      if (objc_msgSend(a1, "mustAllowThreeClickTrigger"))
      {
        v5 = objc_msgSend(a1, "isDeviceD2xOrNewer");
        goto LABEL_18;
      }
      return 2;
    case 3:
      if ((objc_msgSend(a1, "isDeviceD2xOrNewer") & 1) == 0)
      {
LABEL_9:
        if (objc_msgSend(a1, "mustAllowThreeClickTrigger"))
        {
          keyExistsAndHasValidFormat = 0;
          AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("SBNumberOfPressesToTriggerSOS"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat);
          if (keyExistsAndHasValidFormat)
          {
            v7 = objc_msgSend(a1, "SOSTriggerMechanismForClickCount:", AppIntegerValue);
            if (objc_msgSend(a1, "isDeviceD2xOrNewer"))
            {
              objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSTriggerMechanismD2xKey"));
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v8, "integerValue");

              if (!v9)
              {
                objc_msgSend(a1, "_setSOSPrefsValue:forKey:", &unk_1E5F82D60, CFSTR("SOSTriggerMechanismD2xKey"));
                if (objc_msgSend(a1, "mustAllowThreeClickTrigger"))
                {
                  if (v7 == 2)
                  {
                    v7 = 1;
                    goto LABEL_21;
                  }
                }
              }
            }
            if (v7)
              goto LABEL_21;
          }
        }
        v7 = objc_msgSend(a1, "defaultSOSTriggerMechanism");
        goto LABEL_21;
      }
      if ((objc_msgSend(a1, "_potentialForAccessibilityConflict") & 1) != 0)
        return 3;
      v5 = objc_msgSend(a1, "mustAllowThreeClickTrigger");
LABEL_18:
      if (v5)
        v7 = 1;
      else
        v7 = 2;
LABEL_21:
      if (v4 != v7)
      {
LABEL_22:
        objc_msgSend(a1, "setCurrentSOSTriggerMechanism:", v7);
        return v7;
      }
      return v4;
    default:
      return v4;
  }
}

+ (void)setCurrentSOSTriggerMechanism:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v4, CFSTR("SOSTriggerMechanismKey"));

  +[SOSManager notifySOSTriggerMechanismChanged](SOSManager, "notifySOSTriggerMechanismChanged");
}

+ (int64_t)SOSTriggerMechanismForClickCount:(int64_t)a3
{
  if (a3 == 3)
    return 1;
  else
    return 2 * (a3 == 5);
}

+ (int64_t)defaultSOSTriggerMechanism
{
  if (objc_msgSend(a1, "mustAllowThreeClickTrigger"))
    return 1;
  else
    return 2;
}

+ (BOOL)deviceHasSlot
{
  if (deviceHasSlot_onceToken != -1)
    dispatch_once(&deviceHasSlot_onceToken, &__block_literal_global_460);
  return deviceHasSlot___supportsDynamicIsland;
}

uint64_t __29__SOSUtilities_deviceHasSlot__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  deviceHasSlot___supportsDynamicIsland = result;
  return result;
}

+ (BOOL)isDeviceD2xOrNewer
{
  __int128 v4;
  int v5;
  __int128 v6;
  int v7;
  __int128 v8;
  int v9;
  __int128 v10;
  int v11;
  __int128 v12;
  int v13;
  __int128 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = 414393924;
  v14 = xmmword_1AF513210;
  v13 = -996295886;
  v12 = xmmword_1AF513224;
  v11 = 897736383;
  v10 = xmmword_1AF513238;
  v9 = -453987047;
  v8 = xmmword_1AF51324C;
  v7 = -121925081;
  v6 = xmmword_1AF513260;
  v5 = -1431778695;
  v4 = xmmword_1AF513274;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "deviceHasHomeButton", &v12, &v10, &v8, &v6, &v4, 0) ^ 1;
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1)
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_468);
  return deviceHasHomeButton_deviceHasHomeButton;
}

uint64_t __35__SOSUtilities_deviceHasHomeButton__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceHasHomeButton_deviceHasHomeButton = (_DWORD)result != 2;
  return result;
}

+ (int64_t)SOSSelectableTriggerMechanismCapability
{
  int v3;
  int v4;
  int64_t v5;
  int64_t v6;

  v3 = objc_msgSend(a1, "mustAllowThreeClickTrigger");
  v4 = objc_msgSend(a1, "isDeviceD2xOrNewer");
  v5 = 1;
  if (v3)
    v5 = 2;
  v6 = 3;
  if (v3)
    v6 = 4;
  if (v4)
    return v6;
  else
    return v5;
}

+ (BOOL)shouldForceDisableAutoCallForClient:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.InCallService"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("shouldDisableSOSAutoCall"));

  if ((v6 & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else if (objc_msgSend(a1, "autoCallRequiresSIM"))
  {
    v7 = objc_msgSend(a1, "hasActiveSIMForClient:", v4) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)hasActiveSIMForClient:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  _BOOL4 v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v36 = 0;
  objc_msgSend(v3, "getSubscriptionInfoWithError:", &v36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v36;
  v6 = v5;
  if (v4)
  {

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "subscriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (!v7)
    {
      v24 = 0;
      goto LABEL_38;
    }
    v8 = v7;
    v27 = v4;
    v9 = 0;
    v10 = *(_QWORD *)v33;
    v29 = (void *)*MEMORY[0x1E0CA77F8];
    v28 = v3;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v31 = v9;
        objc_msgSend(v3, "getSIMStatus:error:", v12, &v31);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v31;

        if (v14)
        {
          sos_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v12;
            _os_log_error_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_ERROR, "Error retrieving SIM status for context: %@", buf, 0xCu);
          }
          v9 = v14;
        }
        else if (objc_msgSend(v29, "isEqualToString:", v13))
        {
          sos_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v12;
            _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "kCTSIMSupportSIMStatusNotInserted for context: %@", buf, 0xCu);
          }
          v9 = 0;
        }
        else
        {
          v30 = 0;
          objc_msgSend(v3, "getSimLabel:error:", v12, &v30);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v30;
          v9 = v16;
          if (v15)
            v17 = v16 == 0;
          else
            v17 = 0;
          if (v17)
          {
            v19 = v6;
            -[NSObject unique_id](v15, "unique_id");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("00000000-0000-0000-0000-000000000000"));

            sos_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            v22 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
            if ((v21 & 1) == 0)
            {
              if (v22)
              {
                -[NSObject unique_id](v15, "unique_id");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v38 = v25;
                v39 = 2112;
                v40 = v12;
                _os_log_impl(&dword_1AF4DC000, v18, OS_LOG_TYPE_DEFAULT, "Successfully retrieved SIM label %@ for context: %@", buf, 0x16u);

              }
              v24 = 1;
              v4 = v27;
              v6 = v19;
              v3 = v28;
              goto LABEL_36;
            }
            if (v22)
            {
              -[NSObject unique_id](v15, "unique_id");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v38 = v23;
              v39 = 2112;
              v40 = v12;
              _os_log_impl(&dword_1AF4DC000, v18, OS_LOG_TYPE_DEFAULT, "retrieved SIM label %@ for context: %@", buf, 0x16u);

            }
            v6 = v19;
            v3 = v28;
          }
          else
          {
            sos_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v12;
              _os_log_error_impl(&dword_1AF4DC000, v18, OS_LOG_TYPE_ERROR, "Error retrieving SIM label for context: %@", buf, 0xCu);
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v8)
        continue;
      break;
    }
    v24 = 0;
    v13 = v9;
    v4 = v27;
  }
  else
  {
    if (!v5)
    {
      v24 = 0;
      goto LABEL_39;
    }
    sos_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SOSUtilities hasActiveSIMForClient:].cold.1((uint64_t)v6, v13);
    v24 = 0;
  }
LABEL_36:

LABEL_38:
LABEL_39:

  return v24;
}

+ (BOOL)hasEmergencyContacts
{
  SOSContactsManager *v2;
  BOOL v3;

  v2 = objc_alloc_init(SOSContactsManager);
  v3 = -[SOSContactsManager SOSContactsExist](v2, "SOSContactsExist");

  return v3;
}

+ (NSString)emergencyContactsSectionDescription
{
  void *v2;
  __CFString *v3;

  if (objc_msgSend(a1, "hasEmergencyContacts"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACTS"), &stru_1E5F76FF8, 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = &stru_1E5F76FF8;
  }
  return (NSString *)v3;
}

+ (NSString)emergencyContactsEditDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "hasEmergencyContacts");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("OPEN_HEALTH_HAS_EMERGENCY_CONTACTS");
  else
    v5 = CFSTR("OPEN_HEALTH_NO_EMERGENCY_CONTACTS");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)emergencyContactsFooterDescription
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_msgSend(a1, "hasEmergencyContacts");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("SOS_PRIVACY_HAS_EMERGENCY_CONTACTS");
  else
    v6 = CFSTR("SOS_PRIVACY_NO_EMERGENCY_CONTACTS");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E5F76FF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "emergencyContactsFooterLinkTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (NSString)emergencyContactsFooterLinkTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_PRIVACY_LINK"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)openEmergencyContactsFooterLinkOnViewController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.emergencysos"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v3);

  objc_msgSend(v4, "present");
}

+ (NSString)callWithHoldTitleDescription
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(a1, "clawReleaseToCallSupport");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 <= 1.0)
    v6 = CFSTR("CALL_WITH_HOLD");
  else
    v6 = CFSTR("CALL_WITH_HOLD_AND_RELEASE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E5F76FF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (NSString)callWithHoldFooterDescription
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(a1, "clawReleaseToCallSupport");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 <= 1.0)
    v6 = CFSTR("CALL_WITH_HOLD_FOOTER");
  else
    v6 = CFSTR("CALL_WITH_HOLD_AND_RELESE_FOOTER");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E5F76FF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)isCallWithVolumeLockHoldEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSCallWithVolumeLockHoldKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else if (objc_msgSend(a1, "isDeviceD2xOrNewer"))
  {
    objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSAutomaticCallCountdownEnabledKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSAutoCallD2xKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      if (v8
        || (objc_msgSend(a1, "_setSOSPrefsValue:forKey:", &unk_1E5F82D60, CFSTR("SOSAutoCallD2xKey")),
            (objc_msgSend(a1, "mustAllowThreeClickTrigger") & 1) != 0)
        || (objc_msgSend(v6, "BOOLValue") & 1) != 0)
      {
        v5 = objc_msgSend(v6, "BOOLValue");
      }
      else
      {
        v5 = 1;
        objc_msgSend(a1, "setCallWithVolumeLockHoldEnabled:", 1);
      }
    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)setCallWithVolumeLockHoldEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[SOSCoreAnalyticsReporter reportSOSAutomaticCallCountdownEnabled:](SOSCoreAnalyticsReporter, "reportSOSAutomaticCallCountdownEnabled:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v5, CFSTR("SOSCallWithVolumeLockHoldKey"));

}

+ (double)clawReleaseToCallSupport
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSClawReleaseToCallSupportKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

+ (NSString)pressSelectionGroupTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NUMBER_OF_CLICKS"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)threePressesSelectionTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("THREE_CLICKS"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fivePressesSelectionTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FIVE_CLICKS"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)callWithPressesTitleDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (objc_msgSend(a1, "currentSOSTriggerMechanism") == 1
    || objc_msgSend(a1, "mustAllowThreeClickTrigger")
    && objc_msgSend(a1, "isDeviceD2xOrNewer"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CALL_WITH_THREE_PRESSES");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CALL_WITH_FIVE_PRESSES");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)callWithPressesFooterDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (objc_msgSend(a1, "currentSOSTriggerMechanism") == 1
    || objc_msgSend(a1, "mustAllowThreeClickTrigger")
    && objc_msgSend(a1, "isDeviceD2xOrNewer"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CALL_WITH_THREE_PRESSES_FOOTER");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CALL_WITH_FIVE_PRESSES_FOOTER");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)isCallWithSideButtonPressesEnabled
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = objc_msgSend(a1, "mustAllowThreeClickTrigger");
  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSCallWithSideButtonPressesKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSAutomaticCallCountdownEnabledKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "_potentialForAccessibilityConflict")
    || !objc_msgSend(a1, "_hasAccessibilityConflict"))
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      if (!v5)
        goto LABEL_9;
      v6 = v5;
    }
    v3 = objc_msgSend(v6, "BOOLValue");
    goto LABEL_9;
  }
  objc_msgSend(a1, "setCallWithSideButtonPressesEnabled:", 0);
  v3 = 0;
LABEL_9:
  if (objc_msgSend(a1, "isDeviceD2xOrNewer")
    && (objc_msgSend(a1, "mustAllowThreeClickTrigger") & 1) == 0
    && (objc_msgSend(a1, "hasMultiPressResetLogicRun") & 1) == 0)
  {
    objc_msgSend(a1, "setHasMultiPressResetLogicRun:", 1);
    if (v3)
    {
      objc_msgSend(a1, "setCallWithSideButtonPressesEnabled:", 0);
      v7 = 1;
    }
    else
    {
      v7 = 4;
    }
    objc_msgSend(a1, "setSettingsResetFollowUpState:", v7);
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (void)setCallWithSideButtonPressesEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v4, CFSTR("SOSCallWithSideButtonPressesKey"));

}

+ (NSString)autoCallTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AUTO_CALL"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)autoCallFooterDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "autoCallRequiresSIM");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("AUTO_CALL_FOOTER_REQUIRE_SIM");
  else
    v5 = CFSTR("AUTO_CALL_FOOTER");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)isAutomaticCallCountdownEnabled
{
  if (objc_msgSend(a1, "isDeviceD2xOrNewer"))
    return objc_msgSend(a1, "isCallWithVolumeLockHoldEnabled");
  else
    return objc_msgSend(a1, "isCallWithSideButtonPressesEnabled");
}

+ (void)setAutomaticCallCountdownEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (objc_msgSend(a1, "isDeviceD2xOrNewer"))
    objc_msgSend(a1, "setCallWithVolumeLockHoldEnabled:", v3);
  else
    objc_msgSend(a1, "setCallWithSideButtonPressesEnabled:", v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v5, CFSTR("SOSAutomaticCallCountdownEnabledKey"));

}

+ (NSString)countdownSoundTitleDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ALARM_SOUND"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)countdownSoundFooterDescription
{
  double v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(a1, "clawReleaseToCallSupport");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ALARM_SOUND_FOOTER");
  }
  else if (objc_msgSend(a1, "currentSOSTriggerMechanism") == 1
         || objc_msgSend(a1, "mustAllowThreeClickTrigger")
         && objc_msgSend(a1, "isDeviceD2xOrNewer"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ALARM_SOUND_RELEASE_TO_CALL_THREE_PRESSES_FOOTER");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ALARM_SOUND_RELEASE_TO_CALL_FIVE_PRESSES_FOOTER");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E5F76FF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)shouldPlayAudioDuringCountdown
{
  NSObject *v3;
  uint64_t v5;
  void *v6;
  char v7;
  uint8_t v8[16];

  if (objc_msgSend(a1, "shouldSilenceSOSFlow"))
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSUtilities,SOS flow is silenced so audio during countdown is off", v8, 2u);
    }

    return 0;
  }
  else
  {
    objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSPlayAudioDuringCountdownKey"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (void *)v5;
    else
      v6 = (void *)MEMORY[0x1E0C9AAB0];
    v7 = objc_msgSend(v6, "BOOLValue");

    return v7;
  }
}

+ (BOOL)setShouldPlayAudioDuringCountdown:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v5 = objc_msgSend(a1, "shouldSilenceSOSFlow");
  if (v5)
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SOSUtilities setShouldPlayAudioDuringCountdown:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(a1, "setPlayAudioDuringCountdown:", v3);
  }
  return v5 ^ 1;
}

+ (void)setPlayAudioDuringCountdown:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[SOSCoreAnalyticsReporter reportSOSShouldPlayAudioDuringCountdown:](SOSCoreAnalyticsReporter, "reportSOSShouldPlayAudioDuringCountdown:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v5, CFSTR("SOSPlayAudioDuringCountdownKey"));

}

+ (NSString)accidentalCallNotificationTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ACCIDENTAL_SOS_NOTIF_TITLE"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)accidentalCallNotificationBody
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  int v20;
  int v21;
  double v22;
  double v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setTimeStyle:", 1);
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(v6, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invertedSet");
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", &stru_1E5F76FF8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v12, "numberFromString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(a1, "mostRecentlyUsedSOSTriggerMechanism");
  v30 = v7;
  v31 = (void *)v9;
  v15 = v5;
  if (v14 == 1)
  {
    v20 = objc_msgSend(v13, "intValue");
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 == 1)
      v19 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_THREE_PRESSES_WITH_TIME_%@_SINGULAR");
    else
      v19 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_THREE_PRESSES_WITH_TIME_%@_PLURAL");
    goto LABEL_12;
  }
  if (v14 == 2)
  {
    v16 = objc_msgSend(v13, "intValue");
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == 1)
      v19 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_FIVE_PRESSES_WITH_TIME_%@_SINGULAR");
    else
      v19 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_FIVE_PRESSES_WITH_TIME_%@_PLURAL");
LABEL_12:
    objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_1E5F76FF8, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    objc_msgSend(v17, "stringWithFormat:", v26, v15);
    goto LABEL_18;
  }
  v21 = objc_msgSend(v13, "intValue");
  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  v23 = v22;
  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v24;
  if (v21 == 1)
  {
    if (v23 == 0.0)
      v25 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_CLAW_WITH_TIME_%@_SINGULAR");
    else
      v25 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_CLAW_RELEASE_WITH_TIME_%@_SINGULAR");
  }
  else if (v23 == 0.0)
  {
    v25 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_CLAW_WITH_TIME_%@_PLURAL");
  }
  else
  {
    v25 = CFSTR("ACCIDENTAL_SOS_NOTIF_BODY_CLAW_RELEASE_WITH_TIME_%@_PLURAL");
  }
  objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_1E5F76FF8, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", v26, v5);
LABEL_18:
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v27;
}

+ (void)setShortSOSNotificationDisplayTimestamp
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v3, CFSTR("SOSNotificationDisplayedTimestampKey"));

}

+ (double)getShortSOSNotificationDisplayTimestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSNotificationDisplayedTimestampKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

+ (NSString)accidentalCallFeedbackAssistantLegalText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ACCIDENTAL_SOS_FEEDBACK_ASSISTANT_LEGAL_TEXT"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)crashDetectionFeedbackAssistantLegalText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CRASHDETECTION_FEEDBACK_ASSISTANT_LEGAL_TEXT"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)hasMultiPressResetLogicRun
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSMultiPressResetKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "setHasMultiPressResetLogicRun:", 0);
    v5 = 0;
  }

  return v5;
}

+ (void)setHasMultiPressResetLogicRun:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v4, CFSTR("SOSMultiPressResetKey"));

}

+ (int64_t)getSettingsResetFollowUpState
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSSettingsResetFollowUpStateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (int)objc_msgSend(v3, "intValue");
  }
  else if (objc_msgSend(a1, "hasMultiPressResetLogicRun"))
  {
    v5 = 4;
    objc_msgSend(a1, "setSettingsResetFollowUpState:", 4);
  }
  else
  {
    objc_msgSend(a1, "setSettingsResetFollowUpState:", 0);
    v5 = 0;
  }

  return v5;
}

+ (void)setSettingsResetFollowUpState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSUtilities,setting FollowUp state to %ld", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v6, CFSTR("SOSSettingsResetFollowUpStateKey"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSSettingsResetFollowUpStateChangedNotification"), 0, 0, 1u);
}

+ (NSString)settingsResetFollowUpTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_SETTINGS_RESET_FOLLOW_UP_TITLE"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)settingsResetFollowUpBody
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_SETTINGS_RESET_FOLLOW_UP_BODY"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)settingsResetFollowUpRedirectActionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_SETTINGS_RESET_FOLLOW_UP_REDIRECT_ACTION_TITLE"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)settingsResetFollowUpClearActionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_SETTINGS_RESET_FOLLOW_UP_CLEAR_TITLE"), &stru_1E5F76FF8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)isAllowedToMessageSOSContacts
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  char v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSAllowedToMessageSOSContactsKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (objc_msgSend(a1, "isActivePairedDeviceTinker"))
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "This is Tinker config, allowing to message SOS contacts", (uint8_t *)v10, 2u);
    }

    v4 = (void *)MEMORY[0x1E0C9AAB0];
  }
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v4, "BOOLValue");
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "isAllowedToMessageSOSContacts: %d", (uint8_t *)v10, 8u);
  }

  v8 = objc_msgSend(v4, "BOOLValue");
  return v8;
}

+ (void)setAllowedToMessageSOSContacts:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "setAllowedToMessageSOSContacts: %d", (uint8_t *)v9, 8u);
  }

  if (objc_msgSend(a1, "isActivePairedDeviceTinker"))
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Tinker config, ignoring setAllowedToMessageSOSContacts", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v7, CFSTR("SOSAllowedToMessageSOSContactsKey"));

    objc_msgSend(a1, "_synchronizeSOSPrefs");
    v6 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSAllowedToMessageSOSContactsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject synchronizeUserDefaultsDomain:keys:](v6, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.SOS"), v8);

  }
}

+ (BOOL)shouldSilenceSOSFlow
{
  void *v3;
  char v4;

  if (!objc_msgSend((id)objc_opt_class(), "_isInternalDevice"))
    return 0;
  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSSilenceSOSFlowKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isActivePairedDeviceTinker
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x1E0D516D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)activeDeviceSupportsNewton
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("96B0DD78-1F0E-4F92-875F-DD6374FCCB10"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

+ (BOOL)activeDeviceSupportsNewtonWorkoutsOnly
{
  int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_msgSend(a1, "activeDeviceSupportsNewton");
  if (v3)
  {
    objc_msgSend(a1, "activeDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("98409C1B-D02D-400B-9F63-33784EFEDA85"));
    v6 = objc_msgSend(v4, "supportsCapability:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

+ (id)activeDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "activeDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D516E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

+ (NSString)stewieGroupTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("STEWIE_ANIMATION_GROUP"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (UIImage)stewieGroupAsset
{
  id UIImageClass;
  void *v3;
  void *v4;

  UIImageClass = getUIImageClass();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(UIImageClass, "imageNamed:inBundle:withConfiguration:", CFSTR("stewie-diagram"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (NSString)stewieDemoCellText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("STEWIE_DEMO_CELL_TEXT"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)stewieDemoButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("STEWIE_DEMO_BUTTON_TITLE"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)stewieFooterDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STEWIE_FOOTNOTE_DESCRIPTION_%@"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stewieFooterLinkTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (NSString)stewieFooterLinkTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("STEWIE_FOOTNOTE_LINK"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)isStewieVisible
{
  return _os_feature_enabled_impl();
}

+ (void)presentStewieDemoUnavailableAlertOnViewController:(id)a3 reason:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id UIAlertActionClass;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("STEWIE_DEMO_ERROR_ALERT_TITLE"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("STEWIE_DEMO_GENERIC_ERROR_ALERT_DESCRIPTION");
      goto LABEL_3;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("STEWIE_DEMO_NETWORK_ERROR_ALERT_DESCRIPTION");
      goto LABEL_3;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("STEWIE_DEMO_REGION_ERROR_ALERT_DESCRIPTION");
      goto LABEL_3;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("STEWIE_DEMO_AIRPLANE_MODE_ERROR_ALERT_DESCRIPTION");
LABEL_3:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v11 = 0;
      break;
  }
  objc_msgSend(getUIAlertControllerClass(), "alertControllerWithTitle:message:preferredStyle:", v17, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIAlertActionClass = getUIAlertActionClass();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("STEWIE_DEMO_ERROR_ALERT_OK"), &stru_1E5F76FF8, CFSTR("Localizable-stewie"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v15, 1, &__block_literal_global_592);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v16);

  objc_msgSend(v6, "presentViewController:animated:completion:", v12, 1, 0);
}

+ (void)presentStewieLearnMoreLinkOnViewController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.safetyFeatures"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v3);

  objc_msgSend(v4, "present");
}

+ (BOOL)isKappaVisible
{
  return _os_feature_enabled_impl();
}

+ (BOOL)kappaTriggersEmergencySOSTinker
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_SOSDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SOSKappaTriggersEmergencySOSKeyTinker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AAB0];
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = _os_feature_enabled_impl();
  else
    v5 = 0;

  return v5;
}

+ (void)_setKappaTriggersEmergencySOS:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "kappaTriggersEmergencySOS");
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "kappa status change: %d", buf, 8u);
  }

  if (v5 == v3)
  {
    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "new kappa status same as the current store kappa status: returning", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v7, CFSTR("SOSKappaTriggersEmergencySOSKey"));

    dispatch_get_global_queue(2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SOSUtilities__setKappaTriggersEmergencySOS___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v8, block);
  }

}

void __46__SOSUtilities__setKappaTriggersEmergencySOS___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeSOSPrefs");
  v1 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSKappaTriggersEmergencySOSKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.SOS"), v2);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_597);
}

void __46__SOSUtilities__setKappaTriggersEmergencySOS___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSKappaStateChangedNotification"), 0, 0, 1u);
}

+ (void)_setKappaTriggersEmergencySOSTinker:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "kappaTriggersEmergencySOSTinker");
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "kappa status change: %d", buf, 8u);
  }

  if (v5 == v3)
  {
    sos_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "new kappa status same as the current store kappa status: returning", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(a1, "_SOSDomainAccessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SOSKappaTriggersEmergencySOSKeyTinker"));

    dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SOSUtilities__setKappaTriggersEmergencySOSTinker___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v9, block);
  }

}

void __52__SOSUtilities__setKappaTriggersEmergencySOSTinker___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_SOSDomainAccessor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "synchronize");

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSKappaTriggersEmergencySOSKeyTinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeNanoDomain:keys:", CFSTR("com.apple.SOS"), v4);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_598);
}

void __52__SOSUtilities__setKappaTriggersEmergencySOSTinker___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSKappaStateChangedNotification"), 0, 0, 1u);
}

+ (void)setKappaTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 confirmationDelegate:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void (**v11)(id, uint64_t);
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD, _QWORD);
  void (**v27)(id, uint64_t);
  char v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD);
  void (**v31)(id, uint64_t);
  _QWORD v32[5];
  uint8_t buf[4];
  _BYTE v34[10];
  __int16 v35;
  id v36;
  uint64_t v37;

  v7 = a4;
  v8 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  sos_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v34 = v8;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v7;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "setKappaTriggersEmergencySOS:%d isWristDetectionEnabled:%d confirmationDelegate:%@", buf, 0x18u);
  }

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke;
  v32[3] = &__block_descriptor_40_e8_v12__0B8l;
  v32[4] = a1;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF84EC](v32);
  sos_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v15)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v34 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "%s - no confirmation needed", buf, 0xCu);
    }

    v13[2](v13, 1);
    v11[2](v11, 1);
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v34 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "%s - presenting 'are you sure?' confirmation", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_TITLE"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_DETAIL_WATCH"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_CANCEL"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_609;
    v29[3] = &unk_1E5F760F8;
    v30 = v13;
    v31 = v11;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_OK"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_612;
    v25[3] = &unk_1E5F76120;
    v26 = v30;
    v28 = 0;
    v27 = v31;
    objc_msgSend(v10, "presentConfirmationWithTitle:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:", v24, v23, v19, v29, v22, v25);

  }
}

uint64_t __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "isActivePairedDeviceTinker");
  v5 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v5, "_setKappaTriggersEmergencySOSTinker:", a2);
  else
    return objc_msgSend(v5, "_setKappaTriggersEmergencySOS:", a2);
}

uint64_t __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_609(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_612(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)setKappaTriggersEmergencySOS:(BOOL)a3 confirmationDelegate:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v6 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  sos_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v31 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "%s - presenting 'are you sure?' confirmation", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_TITLE"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v8;
    if (objc_msgSend(a1, "isKappaDetectionSupportedOnPhone")
      && objc_msgSend(a1, "isKappaDetectionSupportedOnActiveWatch"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("SOS_KAPPA_CONFIRM_DETAIL_BOTH");
    }
    else if (objc_msgSend(a1, "isKappaDetectionSupportedOnPhone"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("SOS_KAPPA_CONFIRM_DETAIL_PHONE");
    }
    else
    {
      if (!objc_msgSend(a1, "isKappaDetectionSupportedOnActiveWatch"))
      {
        v21 = &stru_1E5F76FF8;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("SOS_KAPPA_CONFIRM_DETAIL_WATCH");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_CANCEL"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke;
    v27[3] = &unk_1E5F76148;
    v29 = a1;
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONFIRM_OK"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke_617;
    v24[3] = &unk_1E5F76148;
    v26 = a1;
    v25 = v28;
    v8 = v23;
    objc_msgSend(v23, "presentConfirmationWithTitle:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:", v22, v21, v17, v27, v20, v24);

    goto LABEL_16;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]";
    _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "%s - no confirmation needed", buf, 0xCu);
  }

  objc_msgSend(a1, "_setKappaTriggersEmergencySOS:", 1);
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_16:

}

uint64_t __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_setKappaTriggersEmergencySOS:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke_617(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_setKappaTriggersEmergencySOS:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isKappaUnmasked
{
  return 1;
}

+ (BOOL)isKappaDetectionSupportedOnCurrentDevice
{
  if (isKappaDetectionSupportedOnCurrentDevice_onceToken != -1)
    dispatch_once(&isKappaDetectionSupportedOnCurrentDevice_onceToken, &__block_literal_global_618);
  return isKappaDetectionSupportedOnCurrentDevice___kappaDetectionAvailable;
}

void __56__SOSUtilities_isKappaDetectionSupportedOnCurrentDevice__block_invoke()
{
  int v0;
  int v1;
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  _BOOL4 v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((MGGetBoolAnswer() & 1) != 0 || (v0 = _os_feature_enabled_impl()) != 0)
  {
    LOBYTE(v0) = +[SOSUtilities isKappaVisible](SOSUtilities, "isKappaVisible");
    v1 = 1;
  }
  else
  {
    v1 = 0;
  }
  isKappaDetectionSupportedOnCurrentDevice___kappaDetectionAvailable = v0;
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109632;
    v3[1] = v1;
    v4 = 1024;
    v5 = +[SOSUtilities isKappaVisible](SOSUtilities, "isKappaVisible");
    v6 = 1024;
    v7 = isKappaDetectionSupportedOnCurrentDevice___kappaDetectionAvailable;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "_kappaDetectionAvailableOnCurrentDevice: deviceSupportsKappa:%{BOOL}d / isKappaVisible:%{BOOL}d => kappaDetectionAvailable:%{BOOL}d", (uint8_t *)v3, 0x14u);
  }

}

+ (BOOL)isKappaDetectionSupportedOnActiveWatch
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("891D0E88-9AB8-420F-8FB5-92A1D4C58DAE"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

+ (NSString)crashDetectionPhoneFooterDesription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_FOOTER_PHONE");
  else
    v5 = CFSTR("SOS_KAPPA_FOOTER_PHONE_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionPhoneWatchFooterDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_FOOTER_BOTH");
  else
    v5 = CFSTR("SOS_KAPPA_FOOTER_BOTH_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionTitleDescription
{
  void *v2;
  __CFString *v3;

  if (objc_msgSend(a1, "isKappaUnmasked"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_TITLE"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("Kappa");
  }
  return (NSString *)v3;
}

+ (NSString)crashDetectionSwitchDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_CELL_TITLE");
  else
    v5 = CFSTR("SOS_KAPPA_CELL_TITLE_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionWatchFooterDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_FOOTER_WATCH");
  else
    v5 = CFSTR("SOS_KAPPA_FOOTER_WATCH_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionFooterLinkDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_FOOTER_LINK");
  else
    v5 = CFSTR("SOS_KAPPA_FOOTER_LINK_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSURL)crashDetectionFooterLinkURL
{
  return 0;
}

+ (NSString)crashDetectionWristDetectionWarningDescription
{
  return (NSString *)&stru_1E5F76FF8;
}

+ (NSString)crashDetectionThirdPartyDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_CELL_TITLE");
  else
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_CELL_TITLE_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyCellTitle
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_CELL_TITLE");
  else
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_CELL_TITLE_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyNavigationTitle
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_NAVIGATION_TITLE");
  else
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_CELL_TITLE_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyAlertTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_THIRD_PARTY_ALERT_TITLE"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)crashDetectionThirdPartyFooterDescriptionPhone
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_FOOTER_PHONE");
  else
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_FOOTER_PHONE_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyFooterDescriptionWatch
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = objc_msgSend(a1, "isKappaUnmasked");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_FOOTER_WATCH");
  else
    v5 = CFSTR("SOS_KAPPA_THIRD_PARTY_FOOTER_WATCH_MASKED");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyShareDisableDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_THIRD_PARTY_SHARE_DISABLE"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)crashDetectionThirdPartyAppWithAccessDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_THIRD_PARTY_APP_WITH_ACCESS"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)crashDetectionThirdPartyStopSharingDescriptionPhoneWithAppName:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "isKappaUnmasked");
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = CFSTR("KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_PHONE");
  else
    v9 = CFSTR("KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_PHONE_MASKED");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)crashDetectionThirdPartyStopSharingDescriptionWatchWithAppName:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "isKappaUnmasked");
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = CFSTR("KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_WATCH");
  else
    v9 = CFSTR("KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_WATCH_MASKED");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)crashDetectionThirdPartyBundleId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(getSABundleManagerClass(), "crashDetectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "approvedApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)shouldShowCrashDetectionThirdPartySettingsForPairedDevice:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  id v14;

  if (!objc_msgSend(a1, "isDeviceWatchUsePairedDevice:", a3))
  {
    objc_msgSend(a1, "getKappaThirdPartyApp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;
    if (v12)
    {
      v11 = objc_msgSend(v12, "deviceType") == 0;
      goto LABEL_12;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(a1, "crashDetectionThirdPartyBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getACXDeviceConnectionClass(), "sharedDeviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v7, "getApplicationIsInstalled:withBundleID:onPairedDevice:error:", 0, v4, v6, &v14);
  v9 = v14;

  if (v9)
  {
    sos_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SOSUtilities shouldShowCrashDetectionThirdPartySettingsForPairedDevice:].cold.1((uint64_t)v4, (uint64_t)v9, v10);

  }
  if ((v8 & 1) == 0)
    goto LABEL_11;
  v11 = 1;
LABEL_12:

  return v11;
}

+ (void)thirdPartySettingsSpecifiersForRemoteDeviceWithTarget:(id)a3 forApp:(id)a4 disableAction:(SEL)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SEL v18;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__SOSUtilities_thirdPartySettingsSpecifiersForRemoteDeviceWithTarget_forApp_disableAction_withCompletion___block_invoke;
  v14[3] = &unk_1E5F76190;
  v15 = v10;
  v16 = v11;
  v17 = a1;
  v18 = a5;
  v12 = v10;
  v13 = v11;
  objc_msgSend(a4, "getLocalizedNameForPairedDeviceWithCompletion:", v14);

}

void __106__SOSUtilities_thirdPartySettingsSpecifiersForRemoteDeviceWithTarget_forApp_disableAction_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:", *(_QWORD *)(a1 + 32), a2, 1, *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

+ (id)thirdPartySettingsSpecifiersWithTarget:(id)a3 forApp:(id)a4 disableAction:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "getLocalizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:", v8, v9, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)thirdPartySettingsSpecifiersWithTarget:(id)a3 displayName:(id)a4 forPairedDevice:(BOOL)a5 disableAction:(SEL)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id PSSpecifierClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  _Unwind_Exception *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v7 = a5;
  v30 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  objc_msgSend(getPSSpecifierClass(), "groupSpecifierWithID:", CFSTR("SHARE_CRASH_EVENT_GROUP"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isDeviceWatchUsePairedDevice:", v7))
    +[SOSUtilities crashDetectionThirdPartyFooterDescriptionWatch](SOSUtilities, "crashDetectionThirdPartyFooterDescriptionWatch");
  else
    +[SOSUtilities crashDetectionThirdPartyFooterDescriptionPhone](SOSUtilities, "crashDetectionThirdPartyFooterDescriptionPhone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v14 = (_QWORD *)getPSFooterTextGroupKeySymbolLoc_ptr;
  v34 = getPSFooterTextGroupKeySymbolLoc_ptr;
  if (!getPSFooterTextGroupKeySymbolLoc_ptr)
  {
    v15 = (void *)PreferencesLibrary();
    v14 = dlsym(v15, "PSFooterTextGroupKey");
    v32[3] = (uint64_t)v14;
    getPSFooterTextGroupKeySymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v31, 8);
  if (!v14)
  {
    +[SOSUtilities thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:].cold.1();
LABEL_15:
    +[SOSUtilities thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:].cold.1();
    goto LABEL_16;
  }
  objc_msgSend(v12, "setProperty:forKey:", v13, *v14);

  objc_msgSend(v11, "addObject:", v12);
  PSSpecifierClass = getPSSpecifierClass();
  +[SOSUtilities crashDetectionThirdPartyAppWithAccessDescription](SOSUtilities, "crashDetectionThirdPartyAppWithAccessDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PSSpecifierClass, "groupSpecifierWithID:name:", CFSTR("SHARE_CRASH_APP_WITH_ACCESS_GROUP"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObject:", v18);
  objc_msgSend(getPSSpecifierClass(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, a1, 0, 0, 0, 3, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ps_addSpecifier:toGroup:", v19, v18);
  objc_msgSend(getPSSpecifierClass(), "groupSpecifierWithID:", CFSTR("SOS_KAPPA_THIRD_PARTY_APP_DISABLE_GROUP"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ps_addGroup:afterGroup:", v20, v18);
  v21 = getPSSpecifierClass();
  +[SOSUtilities crashDetectionThirdPartyShareDisableDescription](SOSUtilities, "crashDetectionThirdPartyShareDisableDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deleteButtonSpecifierWithName:target:action:", v22, v30, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v24 = (_QWORD *)getPSAllowMultilineTitleKeySymbolLoc_ptr;
  v34 = getPSAllowMultilineTitleKeySymbolLoc_ptr;
  if (!getPSAllowMultilineTitleKeySymbolLoc_ptr)
  {
    v25 = (void *)PreferencesLibrary();
    v24 = dlsym(v25, "PSAllowMultilineTitleKey");
    v32[3] = (uint64_t)v24;
    getPSAllowMultilineTitleKeySymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v31, 8);
  if (!v24)
    goto LABEL_15;
  objc_msgSend(v23, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v24);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v26 = (_QWORD *)getPSAlignmentKeySymbolLoc_ptr;
  v34 = getPSAlignmentKeySymbolLoc_ptr;
  if (!getPSAlignmentKeySymbolLoc_ptr)
  {
    v27 = (void *)PreferencesLibrary();
    v26 = dlsym(v27, "PSAlignmentKey");
    v32[3] = (uint64_t)v26;
    getPSAlignmentKeySymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v31, 8);
  if (!v26)
  {
LABEL_16:
    v29 = (_Unwind_Exception *)+[SOSUtilities thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:].cold.1();
    _Block_object_dispose(&v31, 8);
    _Unwind_Resume(v29);
  }
  objc_msgSend(v23, "setProperty:forKey:", &unk_1E5F82D60, *v26);
  objc_msgSend(v11, "ps_addSpecifier:toGroup:", v23, v20);

  return v11;
}

+ (__CFBundle)getKappaThirdPartyActiveAppBundle
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)TCCAccessCopyInformation();
  if (v2)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = v2;
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v20;
      v8 = (_QWORD *)MEMORY[0x1E0DB1098];
      v9 = (_QWORD *)MEMORY[0x1E0DB10A8];
      *(_QWORD *)&v5 = 138412546;
      v18 = v5;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", *v8, v18, (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        CFBundleGetIdentifier((CFBundleRef)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        sos_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v24 = v13;
          v25 = 1024;
          v26 = v15;
          _os_log_impl(&dword_1AF4DC000, v16, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,getKappaThirdPartyActiveAppBundle, bundleID:%@, grant status: %d", buf, 0x12u);
        }

        if (!v12)
          LOBYTE(v15) = 0;

        if ((v15 & 1) != 0)
          break;
        if (v6 == ++v10)
        {
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      v12 = 0;
    }

  }
  else
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,getKappaThirdPartyActiveAppBundle, No element registered for the service. Return nil app name", buf, 2u);
    }
    v12 = 0;
  }

  return (__CFBundle *)v12;
}

+ (void)setKappaThirdPartyActiveApp:(BOOL)a3 presentConfirmationOnViewController:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "getKappaThirdPartyApp");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setKappaThirdPartyActive:forApp:forPairedDevice:presentConfirmationOnViewController:completion:", v6, v10, 0, v9, v8);

}

+ (void)setKappaThirdPartyActive:(BOOL)a3 forApp:(id)a4 forPairedDevice:(BOOL)a5 presentConfirmationOnViewController:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(id, _QWORD);
  id v23;
  BOOL v24;
  uint8_t buf[16];

  v9 = a5;
  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  if (v10)
  {
    sos_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,setKappaThirdPartyActiveApp,the request is invalid", buf, 2u);
    }

    v14[2](v14, 0);
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke;
    v19[3] = &unk_1E5F761E0;
    v23 = a1;
    v24 = v9;
    v20 = v13;
    v22 = v14;
    v16 = v12;
    v21 = v16;
    v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF84EC](v19);
    if (v9)
    {
      objc_msgSend(v16, "getLocalizedNameForPairedDeviceWithCompletion:", v17);
    }
    else
    {
      objc_msgSend(v16, "getLocalizedName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v17)[2](v17, v18);

    }
  }

}

void __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = *(void **)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = a2;
  if ((objc_msgSend(v3, "isDeviceWatchUsePairedDevice:", v4) & 1) != 0)
    +[SOSUtilities crashDetectionThirdPartyStopSharingDescriptionWatchWithAppName:](SOSUtilities, "crashDetectionThirdPartyStopSharingDescriptionWatchWithAppName:", v5);
  else
    +[SOSUtilities crashDetectionThirdPartyStopSharingDescriptionPhoneWithAppName:](SOSUtilities, "crashDetectionThirdPartyStopSharingDescriptionPhoneWithAppName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 32);
  +[SOSUtilities crashDetectionThirdPartyAlertTitle](SOSUtilities, "crashDetectionThirdPartyAlertTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KAPPA_THIRD_PARTY_STOP_SHARING_CANCEL"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_2;
  v17[3] = &unk_1E5F75FA8;
  v18 = *(id *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("KAPPA_THIRD_PARTY_STOP_SHARING_CONTINUE"), &stru_1E5F76FF8, CFSTR("Localizable-kappa"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_688;
  v14[3] = &unk_1E5F761B8;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  +[SOSUtilities presentConfirmationOnViewController:title:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:](SOSUtilities, "presentConfirmationOnViewController:title:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:", v13, v7, v6, v9, v17, v12, v14);

}

uint64_t __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,setKappaThirdPartyActiveApp,No Selected on confirmation alert", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_688(uint64_t a1)
{
  SEL v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v9;
  BOOL v10;
  uint8_t buf[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = NSSelectorFromString(CFSTR("setAccess:forBundleId:"));
  getSAAuthorizationClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend(getSAAuthorizationClass(), "methodSignatureForSelector:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invocationWithMethodSignature:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setSelector:", v2);
    objc_msgSend(v5, "setTarget:", getSAAuthorizationClass());
    v9 = 0;
    objc_msgSend(*(id *)(a1 + 32), "bundleId");
    *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArgument:atIndex:", &v9, 2);
    objc_msgSend(v5, "setArgument:atIndex:", buf, 3);
    objc_msgSend(v5, "invoke");
    objc_msgSend(v5, "getReturnValue:", &v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = TCCAccessSetForBundleId() != 0;

  }
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,setKappaThirdPartyActiveApp,revoking the right to receive kappa data completed with status:%d", buf, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)isDeviceWatchUsePairedDevice:(BOOL)a3
{
  return a3;
}

+ (BOOL)activeDeviceSupportsMandrake
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4B46048D-CD7A-4E74-B615-D9376CBCBBFF"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

+ (BOOL)activeDeviceHasMandrake
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "activeDeviceSupportsMandrake"))
  {
    buf[0] = 0;
    objc_msgSend(getACXDeviceConnectionClass(), "sharedDeviceConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "activeDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v5 = objc_msgSend(v3, "getApplicationIsInstalled:withBundleID:onPairedDevice:error:", buf, CFSTR("com.apple.Mandrake"), v4, &v11);
    v6 = v11;

    if (!v5 || v6)
    {
      sos_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SOSUtilities activeDeviceHasMandrake].cold.1(v5, (uint64_t)v6, v8);

      v7 = 0;
    }
    else
    {
      v7 = buf[0] != 0;
    }

  }
  else
  {
    v7 = 0;
  }
  sos_mandrake_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v7;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "activeDeviceHasMandrake:%{BOOL}d", buf, 8u);
  }

  return v7;
}

+ (BOOL)longPressTriggersMandrake
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "_SOSDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SOSLongPressTriggersMandrakeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (void)setLongPressTriggersMandrake:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  objc_msgSend(a1, "_SOSDomainAccessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("SOSLongPressTriggersMandrakeKey"));

  dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SOSUtilities_setLongPressTriggersMandrake___block_invoke;
  block[3] = &unk_1E5F75E48;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

void __45__SOSUtilities_setLongPressTriggersMandrake___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "synchronize");
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSLongPressTriggersMandrakeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeNanoDomain:keys:", CFSTR("com.apple.SOS"), v3);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_696);
}

void __45__SOSUtilities_setLongPressTriggersMandrake___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSMandrakeStateChangedNotification"), 0, 0, 1u);
}

+ (BOOL)isSOSMessagesUrgentAlertingAvailable
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSOSMessagesUrgentAlertingEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!objc_msgSend(a1, "isSOSMessagesUrgentAlertingAvailable"))
    return 0;
  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSMessagesUrgentAlertingEnabledKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (void)setSOSMessagesUrgentAlertingEnabled:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v4, CFSTR("SOSMessagesUrgentAlertingEnabledKey"));

  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SOSUtilities_setSOSMessagesUrgentAlertingEnabled___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v5, block);

}

void __52__SOSUtilities_setSOSMessagesUrgentAlertingEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeSOSPrefs");
  v1 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSMessagesUrgentAlertingEnabledKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.SOS"), v2);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_699);
}

void __52__SOSUtilities_setSOSMessagesUrgentAlertingEnabled___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSMessagesUrgentAlertingStateChangedNotification"), 0, 0, 1u);
}

+ (BOOL)sosMessagesUrgentAlertingBypassesMute
{
  void *v3;
  void *v4;
  char v5;

  if (!objc_msgSend(a1, "isSOSMessagesUrgentAlertingAvailable"))
    return 0;
  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSMessagesUrgentAlertingBypassesMuteKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (void)setSOSMessagesUrgentAlertingBypassesMute:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v4, CFSTR("SOSMessagesUrgentAlertingBypassesMuteKey"));

  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SOSUtilities_setSOSMessagesUrgentAlertingBypassesMute___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v5, block);

}

void __57__SOSUtilities_setSOSMessagesUrgentAlertingBypassesMute___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeSOSPrefs");
  v1 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SOSMessagesUrgentAlertingBypassesMuteKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.SOS"), v2);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_700);
}

void __57__SOSUtilities_setSOSMessagesUrgentAlertingBypassesMute___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSMessagesUrgentAlertingStateChangedNotification"), 0, 0, 1u);
}

+ (id)sosLocationBundle
{
  if (sosLocationBundle_onceToken != -1)
    dispatch_once(&sosLocationBundle_onceToken, &__block_literal_global_701);
  return (id)sosLocationBundle___bundle;
}

void __33__SOSUtilities_sosLocationBundle__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 5, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "URLByAppendingPathComponent:", CFSTR("LocationBundles"), (_QWORD)v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Emergency SOS.bundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)sosLocationBundle___bundle;
      sosLocationBundle___bundle = v9;

      v11 = sosLocationBundle___bundle;
      if (v11)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (SOSStatus)currentDeviceSOSStatus
{
  return (SOSStatus *)+[SOSUtilities fetchSOSStatusWithKey:](SOSUtilities, "fetchSOSStatusWithKey:", CFSTR("SOSMostRecentSOSStatusKey"));
}

+ (void)setCurrentDeviceSOSStatus:(id)a3
{
  +[SOSUtilities setSOSStatus:withKey:](SOSUtilities, "setSOSStatus:withKey:", a3, CFSTR("SOSMostRecentSOSStatusKey"));
}

+ (SOSStatus)pairedDeviceSOSStatus
{
  return (SOSStatus *)+[SOSUtilities fetchSOSStatusWithKey:](SOSUtilities, "fetchSOSStatusWithKey:", CFSTR("SOSMostRecentPairedSOSStatusKey"));
}

+ (void)setPairedDeviceSOSStatus:(id)a3
{
  +[SOSUtilities setSOSStatus:withKey:](SOSUtilities, "setSOSStatus:withKey:", a3, CFSTR("SOSMostRecentPairedSOSStatusKey"));
}

+ (SOSStatus)mostRecentSOSStatus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v2, "timeOfDetection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v3;
    if (v5)
    {
      v4 = v2;
      if (v3)
      {
        objc_msgSend(v3, "timeOfDetection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v2;
        if (v6)
        {
          objc_msgSend(v2, "timeOfDetection");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSince1970");
          v9 = v8;
          objc_msgSend(v3, "timeOfDetection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeIntervalSince1970");
          v12 = v11;

          if (v9 >= v12)
            v4 = v2;
          else
            v4 = v3;
        }
      }
    }
  }
  v13 = v4;

  return (SOSStatus *)v13;
}

+ (BOOL)shouldBlockNonEmergencyCalls
{
  void *v2;
  void *v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[SOSUtilities mostRecentSOSStatus](SOSUtilities, "mostRecentSOSStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "shouldBlockNonEmergencyCalls"))
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSUtilities,should block non-emergency calls due to %@", (uint8_t *)&v7, 0xCu);
    }

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)fetchSOSStatusWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_sosPrefsValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);
    v17 = 0;
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    if (v10)
    {
      v12 = objc_msgSend(v10, "isValid");
      sos_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[SOSUtilities fetchSOSStatusWithKey:].cold.4();

        objc_msgSend(a1, "_setSOSPrefsValue:forKey:", 0, v4);
        v15 = 0;
        goto LABEL_15;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[SOSUtilities fetchSOSStatusWithKey:].cold.3();
    }
    else
    {
      sos_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[SOSUtilities fetchSOSStatusWithKey:].cold.2();
    }

    v15 = v10;
LABEL_15:

    goto LABEL_16;
  }
  sos_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[SOSUtilities fetchSOSStatusWithKey:].cold.1(v11);
  v15 = 0;
LABEL_16:

  return v15;
}

+ (void)setSOSStatus:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  sos_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[SOSUtilities setSOSStatus:withKey:].cold.2();

    objc_msgSend(a1, "_setSOSPrefsValue:forKey:", v8, v7);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SOSUtilities setSOSStatus:withKey:].cold.1();

  }
  dispatch_get_global_queue(2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__SOSUtilities_setSOSStatus_withKey___block_invoke;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = a1;
  dispatch_async(v12, v13);

}

uint64_t __37__SOSUtilities_setSOSStatus_withKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronizeSOSPrefs");
}

+ (BOOL)_isInternalDevice
{
  return os_variant_has_internal_diagnostics();
}

+ (BOOL)_isCarryDevice
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("walkabout"));

  return v3;
}

+ (id)_overrideForDefaultsKey:(id)a3 expectedClass:(Class)a4 defaultValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!objc_msgSend(a1, "_isInternalDevice"))
    goto LABEL_9;
  +[SOSUtilities _sosPrefsValueForKey:](SOSUtilities, "_sosPrefsValueForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  sos_config_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_debug_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEBUG, "#debugOverride - _overrideForDefaultsKey:%{public}@ (default %{public}@, testing %{public}@)", (uint8_t *)&v13, 0x20u);
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    v9 = v8;
    goto LABEL_10;
  }
  sos_config_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "#debugOverride - _overrideForDefaultsKey:%{public}@ (%{public}@ => %{public}@)", (uint8_t *)&v13, 0x20u);
  }

LABEL_10:
  return v9;
}

+ (id)numberOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_overrideForDefaultsKey:expectedClass:defaultValue:", v7, objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)BOOLOverrideForDefaultsKey:(id)a3 defaultValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "numberOverrideForDefaultsKey:defaultValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "BOOLValue");
  return (char)v6;
}

+ (id)stringOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_overrideForDefaultsKey:expectedClass:defaultValue:", v7, objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isMountStateTrackingEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSMountStateTrackingKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (double)mountProbabilityThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "_sosPrefsValueForKey:", CFSTR("SOSMountProbabilityThresholdKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.75;
  }

  return v5;
}

+ (void)setNumberOfSideButtonPresses:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "SOSUtilities,setting number of presses not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)setNumberOfSideButtonPresses:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "SOSUtilities,invalid trigger type (%d) for setting number of presses", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)hasActiveSIMForClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "Error retrieving subscription info: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

+ (void)setShouldPlayAudioDuringCountdown:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "SOSUtilities,attempted to set shouldPlayAudioDuringCountdown when SOS flow is silenced", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)shouldShowCrashDetectionThirdPartySettingsForPairedDevice:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_3_0(&dword_1AF4DC000, a3, (uint64_t)a3, "Unable to lookup remote app for fromBundleId: %@, error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

+ (uint64_t)thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:.cold.1()
{
  int v0;
  int v1;
  os_log_t v2;

  dlerror();
  v0 = abort_report_np();
  return +[SOSUtilities activeDeviceHasMandrake].cold.1(v0, v1, v2);
}

+ (void)activeDeviceHasMandrake
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = CFSTR("com.apple.Mandrake");
  v5 = 1024;
  v6 = a1 & 1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "Error looking up install status for: %@, success: %{BOOL}d, error: %@", (uint8_t *)&v3, 0x1Cu);
}

+ (void)fetchSOSStatusWithKey:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[SOSUtilities fetchSOSStatusWithKey:]";
  _os_log_debug_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_DEBUG, "%s - no SOS status found", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

+ (void)fetchSOSStatusWithKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_1AF4DC000, v0, v1, "%s - Unable to decode currentDeviceSOSStatus, error: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)fetchSOSStatusWithKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1AF4DC000, v0, v1, "%s - loaded SOS status, sosStatus: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)fetchSOSStatusWithKey:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_1AF4DC000, v0, v1, "%s - SOSStatus is invalid: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)setSOSStatus:withKey:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_ERROR, "%s - Unable to encode currentDeviceSOSStatus, currentDeviceSOSStatus: %@, error: %@", (uint8_t *)v3, 0x20u);
}

+ (void)setSOSStatus:withKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1AF4DC000, v0, v1, "%s - saving SOS status, sosStatus: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
