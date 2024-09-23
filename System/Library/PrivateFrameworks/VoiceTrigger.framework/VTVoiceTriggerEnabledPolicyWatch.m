@implementation VTVoiceTriggerEnabledPolicyWatch

- (VTVoiceTriggerEnabledPolicyWatch)init
{
  VTVoiceTriggerEnabledPolicyWatch *v2;
  VTVoiceTriggerEnabledPolicyWatch *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTVoiceTriggerEnabledPolicyWatch;
  v2 = -[VTPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTVoiceTriggerEnabledPolicyWatch _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[VTVoiceTriggerEnabledPolicyWatch _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

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
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_396);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_6);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_8);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_10);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_12);
}

uint64_t __69__VTVoiceTriggerEnabledPolicyWatch__addVoiceTriggerEnabledConditions__block_invoke_11()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since Siri assertion is disabled", v4, 2u);
    }
  }
  return v1;
}

uint64_t __69__VTVoiceTriggerEnabledPolicyWatch__addVoiceTriggerEnabledConditions__block_invoke_9()
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

uint64_t __69__VTVoiceTriggerEnabledPolicyWatch__addVoiceTriggerEnabledConditions__block_invoke_7()
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
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "VoiceTrigger cannot be turned on since SpringBoard is not started", v4, 2u);
    }
  }
  return v1;
}

uint64_t __69__VTVoiceTriggerEnabledPolicyWatch__addVoiceTriggerEnabledConditions__block_invoke_5()
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

uint64_t __69__VTVoiceTriggerEnabledPolicyWatch__addVoiceTriggerEnabledConditions__block_invoke()
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
