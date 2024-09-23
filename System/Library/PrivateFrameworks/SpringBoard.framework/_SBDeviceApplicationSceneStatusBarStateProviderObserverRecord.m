@implementation _SBDeviceApplicationSceneStatusBarStateProviderObserverRecord

- (SBDeviceApplicationSceneStatusBarStateObserver)observer
{
  return (SBDeviceApplicationSceneStatusBarStateObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (SBDeviceApplicationSceneStatusBarStateObserverFlags)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

- (_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord)initWithObserver:(id)a3 andFlags:(SBDeviceApplicationSceneStatusBarStateObserverFlags)a4
{
  id v6;
  _SBDeviceApplicationSceneStatusBarStateProviderObserverRecord *v7;
  _SBDeviceApplicationSceneStatusBarStateProviderObserverRecord *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord;
  v7 = -[_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_observer, v6);
    v8->_flags = a4;
  }

  return v8;
}

@end
