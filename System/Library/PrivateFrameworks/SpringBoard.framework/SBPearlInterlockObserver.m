@implementation SBPearlInterlockObserver

- (SBPearlInterlockObserver)initWithBiometricResource:(id)a3
{
  id v5;
  SBPearlInterlockObserver *v6;
  SBPearlInterlockObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPearlInterlockObserver;
  v6 = -[SBPearlInterlockObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_biometricResource, a3);

  return v7;
}

- (void)activate
{
  -[SBUIBiometricResource addObserver:](self->_biometricResource, "addObserver:", self);
  -[SBPearlInterlockObserver _checkForLockout](self, "_checkForLockout");
}

- (void)deactivate
{
  -[SBUIBiometricResource removeObserver:](self->_biometricResource, "removeObserver:", self);
}

- (void)_checkForLockout
{
  if (self->_didSuppressFire
    || -[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState") == 8)
  {
    -[SBPearlInterlockObserver _fire](self, "_fire");
  }
}

- (void)_fire
{
  void *v3;
  void *v4;
  SBPearlInterlockAlertItem *v5;

  if (!self->_fired)
  {
    +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      *(_WORD *)&self->_fired = 1;
      v5 = objc_alloc_init(SBPearlInterlockAlertItem);
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activateAlertItem:", v5);

    }
    else
    {
      self->_didSuppressFire = 1;
    }
  }
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 24 || self->_didSuppressFire)
  {
    v7 = v6;
    -[SBPearlInterlockObserver _fire](self, "_fire");
    v6 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

@end
