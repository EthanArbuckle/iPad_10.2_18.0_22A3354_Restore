@implementation RCManagedConfigurationHelper

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
    -[RCManagedConfigurationHelper _startObserving](self, "_startObserving");
  else
    -[RCManagedConfigurationHelper _stopObserving](self, "_stopObserving");
}

- (void)_startObserving
{
  id v3;

  if (!self->_observing)
  {
    self->_observing = 1;
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerObserver:", self);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[RCManagedConfigurationHelper _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)RCManagedConfigurationHelper;
  -[RCManagedConfigurationHelper dealloc](&v3, sel_dealloc);
}

- (void)_notifyDelegateOfChange
{
  id v2;

  -[RCManagedConfigurationHelper delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "managedConfigurationUpdated:", +[RCManagedConfigurationHelper cloudSyncIsAllowed](RCManagedConfigurationHelper, "cloudSyncIsAllowed"));

}

- (void)_stopObserving
{
  id v3;

  if (self->_observing)
  {
    self->_observing = 0;
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", self);

  }
}

+ (BOOL)cloudSyncIsAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudSyncAllowed:", CFSTR("com.apple.VoiceMemos"));

  return v3;
}

+ (BOOL)isProfanityFiltered
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F28]) == 1;

  return v3;
}

- (RCManagedConfigurationHelperDelegate)delegate
{
  return (RCManagedConfigurationHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
