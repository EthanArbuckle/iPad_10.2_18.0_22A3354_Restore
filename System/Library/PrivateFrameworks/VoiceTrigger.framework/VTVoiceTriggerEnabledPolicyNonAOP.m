@implementation VTVoiceTriggerEnabledPolicyNonAOP

- (VTVoiceTriggerEnabledPolicyNonAOP)init
{
  VTVoiceTriggerEnabledPolicyNonAOP *v2;
  VTVoiceTriggerEnabledPolicyNonAOP *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTVoiceTriggerEnabledPolicyNonAOP;
  v2 = -[VTPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[VTVoiceTriggerEnabledPolicyNonAOP _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[VTVoiceTriggerEnabledMonitor sharedInstance](VTVoiceTriggerEnabledMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  +[VTSiriEnabledMonitor sharedInstance](VTSiriEnabledMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  +[VTSpringboardStartMonitor sharedInstance](VTSpringboardStartMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  +[VTBatteryMonitor sharedInstance](VTBatteryMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  +[VTLockScreenMonitor sharedInstance](VTLockScreenMonitor, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  +[VTSiriRestrictionOnLockScreenMonitor sharedInstance](VTSiriRestrictionOnLockScreenMonitor, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  +[VTSoftwareUpdateCheckingMonitor sharedInstance](VTSoftwareUpdateCheckingMonitor, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_1125);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_10_1126);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_12_1127);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_14);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_16_1128);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_18);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_20);
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_19()
{
  void *v0;
  int v1;
  NSObject *v2;
  uint8_t v4[16];

  +[VTSoftwareUpdateCheckingMonitor sharedInstance](VTSoftwareUpdateCheckingMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSoftwareUpdateCheckingRunning");

  if (v1)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since Software Update Checking is running", v4, 2u);
    }
  }
  return v1 ^ 1u;
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_17()
{
  void *v0;
  int v1;
  void *v2;
  int v3;
  BOOL v4;
  NSObject *v6;
  uint8_t v7[16];

  +[VTLockScreenMonitor sharedInstance](VTLockScreenMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "lockScreenState");

  +[VTSiriRestrictionOnLockScreenMonitor sharedInstance](VTSiriRestrictionOnLockScreenMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestricted");

  if (v1)
    v4 = v1 == 3;
  else
    v4 = 1;
  if (v4)
    return 1;
  if (v3)
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since Siri is restricted on lock screen", v7, 2u);
    }
  }
  return v3 ^ 1u;
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_15()
{
  void *v0;
  char v1;
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t result;
  uint8_t v7[16];

  +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) != 0)
    return 1;
  +[VTBatteryMonitor sharedInstance](VTBatteryMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "batteryState");

  if (v3 != 2)
    return 1;
  v4 = VTLogContextFacilityVoiceTrigger;
  v5 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since device is on battery", v7, 2u);
    return 0;
  }
  return result;
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_13()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isFirstUnlocked");

  if ((v1 & 1) == 0)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since device is not unlocked after restart", v4, 2u);
    }
  }
  return v1;
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_11()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  +[VTSpringboardStartMonitor sharedInstance](VTSpringboardStartMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSpringboardStarted");

  if ((v1 & 1) == 0)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since SpringBoard is not started yet", v4, 2u);
    }
  }
  return v1;
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_9()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  +[VTSiriEnabledMonitor sharedInstance](VTSiriEnabledMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since Siri is disabled", v4, 2u);
    }
  }
  return v1;
}

uint64_t __70__VTVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  +[VTVoiceTriggerEnabledMonitor sharedInstance](VTVoiceTriggerEnabledMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since VoiceTrigger is disabled", v4, 2u);
    }
  }
  return v1;
}

@end
