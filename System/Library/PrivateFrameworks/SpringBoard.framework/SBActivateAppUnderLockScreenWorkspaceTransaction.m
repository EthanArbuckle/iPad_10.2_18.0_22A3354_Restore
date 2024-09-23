@implementation SBActivateAppUnderLockScreenWorkspaceTransaction

- (SBActivateAppUnderLockScreenWorkspaceTransaction)initWithTransitionRequest:(id)a3 lockScreenEnvironment:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBActivateAppUnderLockScreenWorkspaceTransaction *v11;
  void *v13;
  objc_super v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "applicationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnimationDisabled:", 1);
  v14.receiver = self;
  v14.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  v11 = -[SBToAppsWorkspaceTransaction initWithTransitionRequest:](&v14, sel_initWithTransitionRequest_, v9);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_lockScreenEnvironment, a4);
    if (!v11->_lockScreenEnvironment)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBActivateAppUnderLockScreenWorkspaceTransaction.m"), 34, CFSTR("Must have a lock screen controller provided."));

    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SBDisableActiveInterfaceOrientationChangeAssertion invalidate](self->_disableActiveOrientationChangeAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldPerformToAppStateCleanupOnCompletion
{
  return 0;
}

- (BOOL)shouldPlaceOutgoingScenesUnderLockOnCompletion
{
  return 1;
}

- (void)_begin
{
  objc_super v3;

  -[SBActivateAppUnderLockScreenWorkspaceTransaction _activateLockScreen](self, "_activateLockScreen");
  v3.receiver = self;
  v3.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  -[SBActivateAppUnderLockScreenWorkspaceTransaction _begin](&v3, sel__begin);
}

- (void)_activateLockScreen
{
  void *v3;
  _QWORD v4[5];

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isUILocked") & 1) != 0)
  {
    -[SBActivateAppUnderLockScreenWorkspaceTransaction _lockScreenDidActivate](self, "_lockScreenDidActivate");
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__SBActivateAppUnderLockScreenWorkspaceTransaction__activateLockScreen__block_invoke;
    v4[3] = &unk_1E8E9E980;
    v4[4] = self;
    objc_msgSend(v3, "lockUIFromSource:withOptions:completion:", 0, 0, v4);
  }

}

uint64_t __71__SBActivateAppUnderLockScreenWorkspaceTransaction__activateLockScreen__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockScreenDidActivate");
}

- (void)_setupAndActivate
{
  SBDisableActiveInterfaceOrientationChangeAssertion *v3;
  SBDisableActiveInterfaceOrientationChangeAssertion *disableActiveOrientationChangeAssertion;

  v3 = -[SBDisableActiveInterfaceOrientationChangeAssertion initWithReason:nudgeOrientationOnInvalidate:]([SBDisableActiveInterfaceOrientationChangeAssertion alloc], "initWithReason:nudgeOrientationOnInvalidate:", CFSTR("LaunchUnderLock"), 1);
  disableActiveOrientationChangeAssertion = self->_disableActiveOrientationChangeAssertion;
  self->_disableActiveOrientationChangeAssertion = v3;

  -[SBToAppsWorkspaceTransaction activateApplications](self, "activateApplications");
}

- (void)_didComplete
{
  SBDisableActiveInterfaceOrientationChangeAssertion *disableActiveOrientationChangeAssertion;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _didComplete](&v4, sel__didComplete);
  -[SBDisableActiveInterfaceOrientationChangeAssertion invalidate](self->_disableActiveOrientationChangeAssertion, "invalidate");
  disableActiveOrientationChangeAssertion = self->_disableActiveOrientationChangeAssertion;
  self->_disableActiveOrientationChangeAssertion = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableActiveOrientationChangeAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
}

@end
