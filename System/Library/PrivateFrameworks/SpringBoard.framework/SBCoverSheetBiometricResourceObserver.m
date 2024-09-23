@implementation SBCoverSheetBiometricResourceObserver

- (SBCoverSheetBiometricResourceObserver)initWithBiometricResource:(id)a3
{
  id v4;
  SBCoverSheetBiometricResourceObserver *v5;
  SBCoverSheetBiometricResourceObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetBiometricResourceObserver;
  v5 = -[SBCoverSheetBiometricResourceObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SBCoverSheetBiometricResourceObserver setBiometricResource:](v5, "setBiometricResource:", v4);
    objc_msgSend(v4, "addObserver:", v6);
    -[SBCoverSheetBiometricResourceObserver reset](v6, "reset");
  }

  return v6;
}

- (void)reset
{
  -[SBCoverSheetBiometricResourceObserver setSeenMatchResultSinceScreenOn:](self, "setSeenMatchResultSinceScreenOn:", 0);
}

- (BOOL)pearlMatchEnabledAndPossible
{
  void *v2;
  int v3;
  uint64_t v4;
  char v5;
  int v6;
  char v7;
  BOOL v8;

  -[SBCoverSheetBiometricResourceObserver biometricResource](self, "biometricResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBiometricAuthenticationCapabilityEnabled");
  v4 = objc_msgSend(v2, "biometricLockoutState");
  v5 = objc_msgSend(v2, "isPearlDetectEnabled");
  v6 = MGGetBoolAnswer();
  if (v6)
    LOBYTE(v6) = objc_msgSend(v2, "isFingerDetectEnabled");
  v7 = v5 | v6;
  if (v4)
    v7 = 0;
  if (v3)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setSeenMatchResultSinceScreenOn:(BOOL)a3
{
  if (self->_seenMatchResultSinceScreenOn != a3)
    self->_seenMatchResultSinceScreenOn = a3;
}

- (void)setSeenMatchResultSinceScreenOn:(int)a3 notifyDelegate:
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  if (a1)
  {
    objc_msgSend(a1, "setSeenMatchResultSinceScreenOn:", a2);
    if (a3)
    {
      objc_msgSend(a1, "delegate");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
      {
        v8 = (void *)v5;
        v7 = objc_opt_respondsToSelector();
        v6 = v8;
        if ((v7 & 1) != 0)
        {
          objc_msgSend(v8, "pearlMatchingStateProviderStateChangedForMatchFailure:", a1);
          v6 = v8;
        }
      }

    }
  }
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 <= 0x1A)
  {
    v7 = v6;
    if (((1 << a4) & 0x6008E00) != 0)
    {
      -[SBCoverSheetBiometricResourceObserver setSeenMatchResultSinceScreenOn:notifyDelegate:](self, 1, 1);
LABEL_7:
      v6 = v7;
      goto LABEL_8;
    }
    if (((1 << a4) & 0x18) != 0 && self)
    {
      -[SBCoverSheetBiometricResourceObserver setSeenMatchResultSinceScreenOn:](self, "setSeenMatchResultSinceScreenOn:", 1);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (SBPearlMatchingStateProviderDelegate)delegate
{
  return (SBPearlMatchingStateProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)seenMatchResultSinceScreenOn
{
  return self->_seenMatchResultSinceScreenOn;
}

- (SBUIBiometricResource)biometricResource
{
  return (SBUIBiometricResource *)objc_loadWeakRetained((id *)&self->_biometricResource);
}

- (void)setBiometricResource:(id)a3
{
  objc_storeWeak((id *)&self->_biometricResource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_biometricResource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
