@implementation NFManagedConfigMonitor

- (void)dealloc
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = objc_msgSend(sub_10021828C(), "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)NFManagedConfigMonitor;
  -[NFManagedConfigMonitor dealloc](&v5, "dealloc");
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  id WeakRetained;

  if (self)
  {
    v5 = objc_msgSend(sub_10021828C(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    self->_isAllowed = objc_msgSend(v6, "isNFCAllowed");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "managedConfigChanged:", self->_isAllowed);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
