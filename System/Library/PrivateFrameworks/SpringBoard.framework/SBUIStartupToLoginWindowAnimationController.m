@implementation SBUIStartupToLoginWindowAnimationController

- (SBUIStartupToLoginWindowAnimationController)initWithTransitionContextProvider:(id)a3
{
  return -[SBUIStartupToLoginWindowAnimationController initWithTransitionContextProvider:overlay:](self, "initWithTransitionContextProvider:overlay:", a3, 0);
}

- (SBUIStartupToLoginWindowAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7;
  id v8;
  SBUIStartupToLoginWindowAnimationController *v9;
  SBUIStartupToLoginWindowAnimationController *v10;
  BSTransaction *v11;
  BSTransaction *waitForLoginAppToFinishLaunchingTransaction;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIStartupToLoginWindowAnimationController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBUIStartupToLoginWindowAnimationController;
  v9 = -[SBUIMainScreenAnimationController initWithTransitionContextProvider:](&v18, sel_initWithTransitionContextProvider_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentSnapshotOverlay, a4);
    v11 = (BSTransaction *)objc_alloc_init(MEMORY[0x1E0D01880]);
    waitForLoginAppToFinishLaunchingTransaction = v10->_waitForLoginAppToFinishLaunchingTransaction;
    v10->_waitForLoginAppToFinishLaunchingTransaction = v11;

    -[BSTransaction addMilestone:](v10->_waitForLoginAppToFinishLaunchingTransaction, "addMilestone:", CFSTR("WaitForLoginWindowToFinishLaunchingMilestone"));
    -[SBUIAnimationController delayAnimationUntilTransactionFinishes:](v10, "delayAnimationUntilTransactionFinishes:", v10->_waitForLoginAppToFinishLaunchingTransaction);
    -[BSTransaction begin](v10->_waitForLoginAppToFinishLaunchingTransaction, "begin");
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lockScreenEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addLoginObserver:", v10);
  }

  return v10;
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (id)_getTransitionWindow
{
  if (_getTransitionWindow___once_1 != -1)
    dispatch_once(&_getTransitionWindow___once_1, &__block_literal_global_340);
  return (id)_getTransitionWindow___instance_1;
}

uint64_t __67__SBUIStartupToLoginWindowAnimationController__getTransitionWindow__block_invoke()
{
  SBSecureWindow *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = [SBSecureWindow alloc];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBWindow initWithWindowScene:role:debugName:](v0, "initWithWindowScene:role:debugName:", v2, CFSTR("SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation"), CFSTR("BootToLoginWindow"));
  v4 = (void *)_getTransitionWindow___instance_1;
  _getTransitionWindow___instance_1 = v3;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation")))
  {
    v5 = (void *)_getTransitionWindow___instance_1;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v5, "setRootViewController:", v6);

  }
  objc_msgSend((id)_getTransitionWindow___instance_1, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 15.0);
  return objc_msgSend((id)_getTransitionWindow___instance_1, "setUserInteractionEnabled:", 0);
}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SBUIStartupToLoginWindowAnimationController _getTransitionWindow](self, "_getTransitionWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  v6.receiver = self;
  v6.super_class = (Class)SBUIStartupToLoginWindowAnimationController;
  -[SBUIAnimationController _setHidden:](&v6, sel__setHidden_, v3);
}

- (id)animationSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.5);
}

- (void)_startAnimation
{
  void *v3;
  void *v4;
  BKSDisplayRenderOverlay *persistentSnapshotOverlay;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];

  -[SBUIAnimationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  persistentSnapshotOverlay = self->_persistentSnapshotOverlay;
  -[SBUIStartupToLoginWindowAnimationController animationSettings](self, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSDisplayRenderOverlay dismissWithAnimation:](persistentSnapshotOverlay, "dismissWithAnimation:", v6);

  v7 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
}

uint64_t __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_2;
  v3[3] = &unk_1E8E9DED8;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_3;
  v2[3] = &unk_1E8E9E980;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 0.5);
}

void __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", 0);

}

uint64_t __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFinish");
}

- (void)_cleanupAnimation
{
  void *v3;
  void *v4;
  id v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeLoginObserver:", self);
}

- (void)loginAppDidFinishLaunching:(id)a3
{
  -[BSTransaction removeMilestone:](self->_waitForLoginAppToFinishLaunchingTransaction, "removeMilestone:", CFSTR("WaitForLoginWindowToFinishLaunchingMilestone"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForLoginAppToFinishLaunchingTransaction, 0);
  objc_storeStrong((id *)&self->_persistentSnapshotOverlay, 0);
  objc_storeStrong((id *)&self->_transitionWindow, 0);
}

@end
