@implementation SBNonInteractiveDisplayModeResolver

- (SBNonInteractiveDisplayModeResolver)initWithRootDisplay:(id)a3 applicationController:(id)a4 userAuthenticationProvider:(id)a5 monitoredWindowScene:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBNonInteractiveDisplayModeResolver *v16;
  SBNonInteractiveDisplayModeResolver *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((objc_msgSend(v12, "isRootIdentity") & 1) != 0)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolver.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplayIdentity isRootIdentity]"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolver.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userAuthenticationProvider"));

      if (v15)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolver.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationController"));

  if (!v14)
    goto LABEL_14;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolver.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitoredWindowScene"));

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)SBNonInteractiveDisplayModeResolver;
  v16 = -[SBNonInteractiveDisplayModeResolver init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_rootDisplayIdentity, a3);
    objc_storeStrong((id *)&v17->_applicationController, a4);
    objc_storeStrong((id *)&v17->_userAuthenticationProvider, a5);
    objc_storeStrong((id *)&v17->_monitoredWindowScene, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FBSDisplayIdentity _sb_requiresUserAuthenticationFirst](v17->_rootDisplayIdentity, "_sb_requiresUserAuthenticationFirst"))
    {
      objc_msgSend(v18, "addObserver:selector:name:object:", v17, sel__authenicationStateDidChange_, *MEMORY[0x1E0DAA248], 0);
    }
    if (-[FBSDisplayIdentity _sb_requiresAppRunningFirst](v17->_rootDisplayIdentity, "_sb_requiresAppRunningFirst"))
      objc_msgSend(v18, "addObserver:selector:name:object:", v17, sel__appProcessStateDidChange_, CFSTR("SBApplicationProcessStateDidChange"), 0);
    -[SBNonInteractiveDisplayModeResolver _evaluateAndNotifyOfStateChanges](v17, "_evaluateAndNotifyOfStateChanges");

  }
  return v17;
}

- (FBSDisplayIdentity)rootDisplayIdentity
{
  return self->_rootDisplayIdentity;
}

- (int64_t)displayWindowingMode
{
  return 2;
}

- (BOOL)isWindowingModeAvailable
{
  return self->_nonInteractiveModeAvailableOnPhysicalDisplay;
}

- (void)_authenicationStateDidChange:(id)a3
{
  if (-[SBFAuthenticationStatusProvider isAuthenticated](self->_userAuthenticationProvider, "isAuthenticated", a3))-[SBNonInteractiveDisplayModeResolver _evaluateAndNotifyOfStateChanges](self, "_evaluateAndNotifyOfStateChanges");
}

- (void)_appProcessStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("previousProcessState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "isRunning");
  if ((_DWORD)v6 != objc_msgSend(v7, "isRunning"))
    -[SBNonInteractiveDisplayModeResolver _evaluateAndNotifyOfStateChanges](self, "_evaluateAndNotifyOfStateChanges");

}

- (void)_evaluateAndNotifyOfStateChanges
{
  FBSDisplayIdentity *rootDisplayIdentity;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  FBSDisplayIdentity *v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  FBSDisplayIdentity *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_haveAuthenticatedOnce)
    self->_haveAuthenticatedOnce = -[SBFAuthenticationStatusProvider isAuthenticated](self->_userAuthenticationProvider, "isAuthenticated");
  rootDisplayIdentity = self->_rootDisplayIdentity;
  -[SBWindowScene switcherController](self->_monitoredWindowScene, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBSDisplayIdentity _sb_nonInteractiveAvailableWithSwitcher:applicationController:authenticationState:](rootDisplayIdentity, "_sb_nonInteractiveAvailableWithSwitcher:applicationController:authenticationState:", v4, self->_applicationController, self->_haveAuthenticatedOnce);

  if (self->_nonInteractiveModeAvailableOnPhysicalDisplay != v5)
  {
    self->_nonInteractiveModeAvailableOnPhysicalDisplay = v5;
    SBLogDisplayControlling();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_rootDisplayIdentity;
      v10 = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ change in availability for root display: %{public}@; available: %{BOOL}u",
        (uint8_t *)&v10,
        0x1Cu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "resolver:rootDisplay:didUpdateAvailability:", self);

  }
}

- (SBDisplayWindowingModeResolverDelegate)delegate
{
  return (SBDisplayWindowingModeResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_userAuthenticationProvider, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_rootDisplayIdentity, 0);
}

@end
