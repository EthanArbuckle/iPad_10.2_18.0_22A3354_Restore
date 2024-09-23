@implementation VTVoiceTriggerEnabledPolicyHorseman

- (VTVoiceTriggerEnabledPolicyHorseman)init
{
  VTVoiceTriggerEnabledPolicyHorseman *v2;
  VTVoiceTriggerEnabledPolicyHorseman *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTVoiceTriggerEnabledPolicyHorseman;
  v2 = -[VTPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTVoiceTriggerEnabledPolicyHorseman _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[VTVoiceTriggerEnabledPolicyHorseman _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  id v3;

  +[VTVoiceTriggerEnabledMonitor sharedInstance](VTVoiceTriggerEnabledMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_4352);
}

uint64_t __72__VTVoiceTriggerEnabledPolicyHorseman__addVoiceTriggerEnabledConditions__block_invoke()
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
