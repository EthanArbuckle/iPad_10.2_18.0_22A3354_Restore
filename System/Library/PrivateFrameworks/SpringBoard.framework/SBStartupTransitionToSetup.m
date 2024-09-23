@implementation SBStartupTransitionToSetup

- (SBStartupTransitionToSetup)initWithDestination:(unint64_t)a3 context:(id)a4 initialRestartState:(id)a5
{
  id v9;
  SBStartupTransitionToSetup *v10;
  uint64_t v11;
  SBBannerManager *bannerManager;
  uint64_t v13;
  SBLockScreenManager *lockScreenManager;
  uint64_t v15;
  SBFUserAuthenticationController *authController;
  uint64_t v17;
  SBApplicationController *appController;
  uint64_t v19;
  SBSetupManager *setupManager;
  objc_super v22;

  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBStartupTransitionToSetup;
  v10 = -[SBBaseStartupTransition initWithDestination:context:](&v22, sel_initWithDestination_context_, a3, a4);
  if (v10)
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v11 = objc_claimAutoreleasedReturnValue();
    bannerManager = v10->_bannerManager;
    v10->_bannerManager = (SBBannerManager *)v11;

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    lockScreenManager = v10->_lockScreenManager;
    v10->_lockScreenManager = (SBLockScreenManager *)v13;

    objc_msgSend((id)SBApp, "authenticationController");
    v15 = objc_claimAutoreleasedReturnValue();
    authController = v10->_authController;
    v10->_authController = (SBFUserAuthenticationController *)v15;

    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    appController = v10->_appController;
    v10->_appController = (SBApplicationController *)v17;

    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    setupManager = v10->_setupManager;
    v10->_setupManager = (SBSetupManager *)v19;

    objc_storeStrong((id *)&v10->_initialRestartState, a5);
  }

  return v10;
}

- (SBStartupTransitionToSetup)initWithDestination:(unint64_t)a3 context:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToSetup.m"), 55, CFSTR("use initWithDestination:context:initialRestartState:"));

  return 0;
}

- (void)performTransitionWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  SBLockScreenManager *lockScreenManager;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[16];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToSetup.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[SBBaseStartupTransition context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 1)
  {
LABEL_7:
    objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", 1, 1, 0, CFSTR("Setting orientation to Portrait for boot to Setup."));
    -[SBSetupManager setDeferringDeviceOrientationUpdates:](self->_setupManager, "setDeferringDeviceOrientationUpdates:", 1);
  }
LABEL_8:
  objc_msgSend(v6, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBBannerManager setSuspended:forReason:](self->_bannerManager, "setSuspended:forReason:", 1, CFSTR("com.apple.purplebuddy"));
  v10 = objc_msgSend(v6, "isLogin");
  v11 = -[SBInitialRestartState hasPasscodeSet](self->_initialRestartState, "hasPasscodeSet");
  v12 = objc_msgSend(v6, "fromUserPowerDown");
  objc_msgSend(MEMORY[0x1E0D4F8F8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v14 = objc_msgSend(v13, "needOwnershipWarning:", &v26);
  v15 = v26;

  if ((v10 & 1) != 0 || v9 || ((v11 | v12 ^ 1 | v14) & 1) == 0)
  {
    -[SBStartupTransitionToSetup _activateSetupWithCompletion:underLock:fromSnapshot:](self, "_activateSetupWithCompletion:underLock:fromSnapshot:", v5, 0, v9 != 0);
  }
  else
  {
    SBLogWorkspace();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Passcode locking if necessary, because we're transitioning at boot to Setup.", buf, 2u);
    }

    -[SBFUserAuthenticationController revokeAuthenticationImmediatelyIfNecessaryForPublicReason:](self->_authController, "revokeAuthenticationImmediatelyIfNecessaryForPublicReason:", CFSTR("StartupTransitionToSetup"));
    lockScreenManager = self->_lockScreenManager;
    v27[0] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v18;
    v27[1] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v19;
    v27[2] = CFSTR("SBUILockOptionsForceLockKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __67__SBStartupTransitionToSetup_performTransitionWithCompletionBlock___block_invoke;
    v23[3] = &unk_1E8E9F230;
    v23[4] = self;
    v24 = v5;
    -[SBLockScreenManager lockUIFromSource:withOptions:completion:](lockScreenManager, "lockUIFromSource:withOptions:completion:", 16, v21, v23);

  }
}

uint64_t __67__SBStartupTransitionToSetup_performTransitionWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateSetupWithCompletion:underLock:fromSnapshot:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_activateSetupWithCompletion:(id)a3 underLock:(BOOL)a4 fromSnapshot:(BOOL)a5
{
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  char v23;
  BOOL v24;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToSetup.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[SBBaseStartupTransition context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isLogin");
  -[SBApplicationController setupApplication](self->_appController, "setupApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBaseStartupTransition mainWorkspace](self, "mainWorkspace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke;
  v18[3] = &unk_1E8EC14D8;
  v22 = a4;
  v23 = v11;
  v19 = v12;
  v20 = v10;
  v24 = a5;
  v21 = v9;
  v14 = v9;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "requestTransitionWithOptions:builder:validator:", 0, v18, &__block_literal_global_405);

}

void __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;
  char v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 31);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_2;
  v10[3] = &unk_1E8E9F398;
  v11 = *(id *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v3, "modifyApplicationContext:", v10);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_3;
  v5[3] = &unk_1E8EC14B0;
  v8 = *(_BYTE *)(a1 + 57);
  v6 = *(id *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 58);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setTransactionConfigurator:", v5);

}

void __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SBDeviceApplicationSceneEntity *v5;

  v3 = a2;
  v5 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    -[SBWorkspaceEntity setFlag:forActivationSetting:](v5, "setFlag:forActivationSetting:", 1, 59);
    -[SBWorkspaceEntity setFlag:forActivationSetting:](v5, "setFlag:forActivationSetting:", 1, 1);
  }
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend((id)SBApp, "startupInterfaceOrientation"));
  objc_msgSend(v3, "setEntity:forLayoutRole:", v5, 1);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, 2);

}

void __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SBUIStartupToUserSetupAppZoomInAnimationController *v4;
  SBUIStartupFromOverlayAnimationController *v5;
  void *v6;
  SBUIStartupToUserSetupAppZoomInAnimationController *v7;
  SBUIStartupFromOverlayAnimationController *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = [SBUIStartupToUserSetupAppZoomInAnimationController alloc];
    objc_msgSend(v3, "transitionRequest");
    v5 = (SBUIStartupFromOverlayAnimationController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBUIStartupToUserSetupAppZoomInAnimationController initWithTransitionContextProvider:overlay:](v4, "initWithTransitionContextProvider:overlay:", v5, v6);

  }
  else
  {
    if (!*(_BYTE *)(a1 + 49))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v8 = [SBUIStartupFromOverlayAnimationController alloc];
    objc_msgSend(v3, "transitionRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBUIStartupFromOverlayAnimationController initWithTransitionContextProvider:overlay:](v8, "initWithTransitionContextProvider:overlay:", v9, v10);

    -[SBUIStartupFromOverlayAnimationController setWaitsForAppActivation:](v5, "setWaitsForAppActivation:", 1);
    -[SBUIStartupFromOverlayAnimationController setAnimationSettings:](v5, "setAnimationSettings:", 0);
    v7 = 0;
  }

LABEL_6:
  objc_msgSend(v3, "setSuggestedAnimationController:", v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_4;
  v11[3] = &unk_1E8E9F1C0;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setCompletionBlock:", v11);

}

uint64_t __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_5()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRestartState, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
}

@end
