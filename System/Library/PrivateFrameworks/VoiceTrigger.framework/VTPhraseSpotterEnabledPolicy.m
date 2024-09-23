@implementation VTPhraseSpotterEnabledPolicy

- (VTPhraseSpotterEnabledPolicy)init
{
  VTPhraseSpotterEnabledPolicy *v2;
  VTPhraseSpotterEnabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTPhraseSpotterEnabledPolicy;
  v2 = -[VTPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTPhraseSpotterEnabledPolicy _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[VTPhraseSpotterEnabledPolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  id v4;

  +[VTSpringboardStartMonitor sharedInstance](VTSpringboardStartMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_382);
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_2);
}

uint64_t __65__VTPhraseSpotterEnabledPolicy__addVoiceTriggerEnabledConditions__block_invoke_2()
{
  void *v0;
  uint64_t v1;

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isFirstUnlocked");

  return v1;
}

uint64_t __65__VTPhraseSpotterEnabledPolicy__addVoiceTriggerEnabledConditions__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[VTSpringboardStartMonitor sharedInstance](VTSpringboardStartMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSpringboardStarted");

  return v1;
}

@end
