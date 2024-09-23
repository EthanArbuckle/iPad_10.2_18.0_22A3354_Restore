@implementation SBTipsHomeScreenUsageObserver

- (SBTipsHomeScreenUsageObserver)initWithIconManager:(id)a3
{
  id v4;
  SBTipsHomeScreenUsageObserver *v5;
  SBTipsHomeScreenUsageObserver *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTipsHomeScreenUsageObserver;
  v5 = -[SBTipsHomeScreenUsageObserver init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    objc_msgSend(v4, "setUsageMonitoringEnabled:", 1);
    objc_msgSend(v4, "usageMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v6);

  }
  return v6;
}

- (void)homeScreenUsageAggregatorDidNoteEditingModeEntered:(id)a3
{
  NSObject *v3;

  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_206);

}

void __84__SBTipsHomeScreenUsageObserver_homeScreenUsageAggregatorDidNoteEditingModeEntered___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D027B8], "discoverabilitySignal");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02618]), "initWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.springboard.homescreen.didEnterEditMode"), CFSTR("com.apple.springboard"), 0, 0);
  objc_msgSend(v0, "sendEvent:", v1);

}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconManager);
}

@end
