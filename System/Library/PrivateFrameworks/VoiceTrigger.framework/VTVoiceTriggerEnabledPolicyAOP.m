@implementation VTVoiceTriggerEnabledPolicyAOP

- (VTVoiceTriggerEnabledPolicyAOP)init
{
  VTVoiceTriggerEnabledPolicyAOP *v2;
  VTVoiceTriggerEnabledPolicyAOP *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTVoiceTriggerEnabledPolicyAOP;
  v2 = -[VTPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[VTVoiceTriggerEnabledPolicyAOP _subscribeEventMonitors](v3, "_subscribeEventMonitors");
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
  id v8;

  +[VTVoiceTriggerEnabledMonitor sharedInstance](VTVoiceTriggerEnabledMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[VTSiriEnabledMonitor sharedInstance](VTSiriEnabledMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  +[VTSpringboardStartMonitor sharedInstance](VTSpringboardStartMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  +[VTLockScreenMonitor sharedInstance](VTLockScreenMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  +[VTSiriRestrictionOnLockScreenMonitor sharedInstance](VTSiriRestrictionOnLockScreenMonitor, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_5499);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_7);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_9);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_11);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_13);
}

uint64_t __67__VTVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_12()
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

uint64_t __67__VTVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_10()
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

uint64_t __67__VTVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_8()
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

uint64_t __67__VTVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_6()
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

uint64_t __67__VTVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke()
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
