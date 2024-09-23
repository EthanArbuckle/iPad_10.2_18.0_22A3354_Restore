@implementation SBSoftLockoutController

- (SBSoftLockoutController)initWithBiometricLockoutState:(unint64_t)a3
{
  void *v5;
  SBSoftLockoutController *v6;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSoftLockoutController initWithBiometricLockoutState:lockScreenManager:](self, "initWithBiometricLockoutState:lockScreenManager:", a3, v5);

  return v6;
}

- (SBSoftLockoutController)initWithBiometricLockoutState:(unint64_t)a3 lockScreenManager:(id)a4
{
  id v7;
  SBSoftLockoutController *v8;
  SBSoftLockoutController *v9;
  void *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSoftLockoutController;
  v8 = -[SBSoftLockoutController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lockScreenManager, a4);
    v9->_desiredBiometricLockoutState = a3;
    -[SBLockScreenManager coverSheetViewController](v9->_lockScreenManager, "coverSheetViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerExternalLockProvider:", v9);
    objc_msgSend(v10, "addCoverSheetObserver:", v9);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBLockScreenManager coverSheetViewController](self->_lockScreenManager, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCoverSheetObserver:", self);
  objc_msgSend(v3, "unregisterExternalLockProvider:", self);
  -[SBSoftLockoutController _clearPasscodeRequiredAssertion](self, "_clearPasscodeRequiredAssertion");

  v4.receiver = self;
  v4.super_class = (Class)SBSoftLockoutController;
  -[SBSoftLockoutController dealloc](&v4, sel_dealloc);
}

- (void)reload
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "requiresLockout");

  if ((v4 & 1) == 0)
    -[SBSoftLockoutController _clearPasscodeRequiredAssertion](self, "_clearPasscodeRequiredAssertion");
}

- (BOOL)isLocked
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "requiresLockout");

  return v3;
}

- (BOOL)showPasscode
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "requiresLockout");

  return v3;
}

- (BOOL)unlockFromSource:(int)a3
{
  id WeakRetained;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(WeakRetained, "consumePendingUnlock") & 1) != 0
    || !objc_msgSend(WeakRetained, "requiresLockout"))
  {
    v5 = 1;
  }
  else
  {
    -[SBSoftLockoutController _createPasscodeRequiredAssertion](self, "_createPasscodeRequiredAssertion");
    -[SBLockScreenManager setPasscodeVisible:animated:](self->_lockScreenManager, "setPasscodeVisible:animated:", 1, 1);
    v5 = 0;
  }

  return v5;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (void)_createPasscodeRequiredAssertion
{
  unint64_t desiredBiometricLockoutState;
  objc_class *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *passcodeRequiredAssertion;
  id v8;

  if (!self->_passcodeRequiredAssertion)
  {
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    desiredBiometricLockoutState = self->_desiredBiometricLockoutState;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireSimulatedLockoutAssertionWithLockoutState:forReason:", desiredBiometricLockoutState, v5);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    passcodeRequiredAssertion = self->_passcodeRequiredAssertion;
    self->_passcodeRequiredAssertion = v6;

  }
}

- (void)_clearPasscodeRequiredAssertion
{
  BSInvalidatable *passcodeRequiredAssertion;
  BSInvalidatable *v4;

  passcodeRequiredAssertion = self->_passcodeRequiredAssertion;
  if (passcodeRequiredAssertion)
  {
    -[BSInvalidatable invalidate](passcodeRequiredAssertion, "invalidate");
    v4 = self->_passcodeRequiredAssertion;
    self->_passcodeRequiredAssertion = 0;

  }
}

- (SBSoftLockoutControllerDelegate)delegate
{
  return (SBSoftLockoutControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeRequiredAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end
