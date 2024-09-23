@implementation VTAssetManagerEnablePolicy

- (VTAssetManagerEnablePolicy)init
{
  VTAssetManagerEnablePolicy *v2;
  VTAssetManagerEnablePolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTAssetManagerEnablePolicy;
  v2 = -[VTPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTAssetManagerEnablePolicy _addAssetManagerEnabledConditions](v2, "_addAssetManagerEnabledConditions");
    -[VTAssetManagerEnablePolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  id v3;

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VTPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

}

- (void)_addAssetManagerEnabledConditions
{
  -[VTPolicy addConditions:](self, "addConditions:", &__block_literal_global_1095);
}

uint64_t __63__VTAssetManagerEnablePolicy__addAssetManagerEnabledConditions__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isFirstUnlocked");

  return v1;
}

@end
