@implementation SBStartupTransitionToLockOut

- (SBStartupTransitionToLockOut)initWithDestination:(unint64_t)a3 context:(id)a4
{
  SBStartupTransitionToLockOut *v4;
  uint64_t v5;
  SBLockScreenManager *lockScreenManager;
  uint64_t v7;
  SBFUserAuthenticationController *authController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBStartupTransitionToLockOut;
  v4 = -[SBBaseStartupTransition initWithDestination:context:](&v10, sel_initWithDestination_context_, a3, a4);
  if (v4)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    lockScreenManager = v4->_lockScreenManager;
    v4->_lockScreenManager = (SBLockScreenManager *)v5;

    objc_msgSend((id)SBApp, "authenticationController");
    v7 = objc_claimAutoreleasedReturnValue();
    authController = v4->_authController;
    v4->_authController = (SBFUserAuthenticationController *)v7;

  }
  return v4;
}

- (id)suggestedLockAnimationForTransitionRequest:(id)a3
{
  return 0;
}

- (void)performTransitionWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  SBStartupTransitionToLockOut *v7;
  uint64_t v8;
  SBStartupTransitionToLockOut *v9;
  void *v10;
  SBLockScreenManager *lockScreenManager;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  SBStartupTransitionToLockOut *v22;
  uint8_t buf[16];
  _QWORD v24[4];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToLockOut.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Passcode locking if necessary, because we're transitioning at boot to the lockscreen .", buf, 2u);
  }

  -[SBFUserAuthenticationController revokeAuthenticationImmediatelyIfNecessaryForPublicReason:](self->_authController, "revokeAuthenticationImmediatelyIfNecessaryForPublicReason:", CFSTR("StartupTransitionToLockOut"));
  v7 = self;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E8EB2C70;
  v22 = v7;
  v9 = v7;
  v10 = (void *)MEMORY[0x1D17E5550](v21);
  lockScreenManager = v9->_lockScreenManager;
  v24[0] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v24[1] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  v24[2] = CFSTR("SBUILockOptionsForceLockKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v14;
  v24[3] = CFSTR("SBUILockOptionsAnimationTransactionProviderKey");
  v15 = (void *)MEMORY[0x1D17E5550](v10);
  v25[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke_2;
  v19[3] = &unk_1E8E9F1C0;
  v20 = v5;
  v17 = v5;
  -[SBLockScreenManager lockUIFromSource:withOptions:completion:](lockScreenManager, "lockUIFromSource:withOptions:completion:", 16, v16, v19);

}

uint64_t __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "suggestedLockAnimationForTransitionRequest:", a2);
}

uint64_t __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end
