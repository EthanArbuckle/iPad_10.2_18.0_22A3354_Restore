@implementation SBLockScreenManager

+ (SBLockScreenManager)sharedInstance
{
  return (SBLockScreenManager *)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 1);
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  _QWORD v4[6];

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__SBLockScreenManager__sharedInstanceCreateIfNeeded___block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    v4[4] = a2;
    v4[5] = a1;
    if (_sharedInstanceCreateIfNeeded__onceToken_1 != -1)
      dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken_1, v4);
  }
  return (id)_sharedInstanceCreateIfNeeded____manager;
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 0);
}

- (BOOL)handleTransitionRequest:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;

  v4 = a3;
  if (!-[SBLockScreenManager willAttemptToHandleTransitionRequest:](self, "willAttemptToHandleTransitionRequest:", v4))
    goto LABEL_13;
  v5 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated");
  objc_msgSend(v4, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_404);

  if (!v5 || (v8 & 1) == 0)
  {
    -[SBLockScreenEnvironment applicationLauncher](self->_lockScreenEnvironment, "applicationLauncher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "handleTransitionRequest:", v4);

    if (v10)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 1;
      objc_msgSend(v11, "dismissAllTransientOverlayPresentationsAnimated:", 1);

      goto LABEL_14;
    }
  }
  if (!-[SBLockScreenManager _canHandleTransitionRequest:](self, "_canHandleTransitionRequest:", v4))
  {
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "externalLockProvidersRequireUnlock");

  if (!v14)
  {
    objc_msgSend(v4, "displayIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isMainDisplay");

    if (v17)
      objc_msgSend(v4, "setTransactionProvider:", &__block_literal_global_175_2);
    goto LABEL_13;
  }
  SBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SBLockScreenManager handleTransitionRequest:].cold.1(v15);

  v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_unlockWithRequest:(id)a3 cancelPendingRequests:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  SBFUserAuthenticationController *v13;
  SBFUserAuthenticationController *userAuthController;
  SBFUserAuthenticationController *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  char v20;
  SBFUserAuthenticationController *v21;
  char v22;
  void *v23;
  char v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  char v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  const char *v39;
  BOOL v40;
  BOOL v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  BOOL v55;
  SBLockScreenUnlockRequest *v56;
  SBLockScreenUnlockRequest *unlockRequest;
  id v58;
  id v59;
  id v60;
  void *v61;
  id unlockActionBlock;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void (**v71)(_QWORD, _QWORD);
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  void (**v79)(_QWORD, _QWORD);
  id v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  uint8_t buf[4];
  id v86;
  uint64_t v87;

  v6 = a4;
  v87 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v9;
  NSClassFromString(CFSTR("SBLockScreenUnlockRequest"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBLockScreenManager _unlockWithRequest:cancelPendingRequests:completion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0642D24);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:SBLockScreenUnlockRequestClass]"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBLockScreenManager _unlockWithRequest:cancelPendingRequests:completion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0642D88);
  }

  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticationStatusProvider");
  v13 = (SBFUserAuthenticationController *)objc_claimAutoreleasedReturnValue();
  userAuthController = v13;
  if (!v13)
    userAuthController = self->_userAuthController;
  v71 = (void (**)(_QWORD, _QWORD))v10;
  v15 = userAuthController;

  v16 = objc_msgSend(v11, "source");
  v17 = objc_msgSend(v11, "intent");
  v18 = -[SBFUserAuthenticationController isAuthenticated](v15, "isAuthenticated");
  if (v6)
  {
    -[SBLockScreenManager _runUnlockActionBlock:](self, "_runUnlockActionBlock:", 0);
  }
  else if (self->_unlockRequest)
  {
    +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasSecureApp");

    if ((v20 & 1) == 0)
    {
      SBLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        goto LABEL_45;
      *(_WORD *)buf = 0;
      v39 = "[Unlock Request] Previous request in place and cancellation not requested. Failing.";
      goto LABEL_44;
    }
  }
  v21 = v15;
  v22 = objc_msgSend(v12, "isContinuityDisplayWindowScene");
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "screenIsOn");

  if ((v24 & 1) == 0 && (v22 & 1) == 0)
  {
    SBLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v86 = v11;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_INFO, "[Unlock Request] Turning screen on for unlock request: %@", buf, 0xCu);
    }

    v83 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    v26 = MEMORY[0x1E0C9AAB0];
    v84 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v17 & 0xFFFFFFFE) == 2)
      v28 = v18;
    else
      v28 = 1;
    if ((v28 & 1) != 0)
    {
      if (objc_msgSend(v12, "isContinuityDisplayWindowScene"))
      {
        v81 = CFSTR("SBUIUnlockOptionsNoBacklightChangesKey");
        v82 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v29 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v29;
      }
    }
    else
    {
      -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 1, 0);
    }
    -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", v16, v27);

  }
  if (!(_DWORD)v16 || !(_DWORD)v17)
  {
    SBLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v32 = "[Unlock Request] Request had no source, or didn't want to actually unlock. Succeeding.";
    goto LABEL_31;
  }
  if ((_DWORD)v17 == 2)
    v30 = v18;
  else
    v30 = 0;
  v15 = v21;
  if (v30 == 1)
  {
    SBLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v32 = "[Unlock Request] AuthenticateOnly specified, and we are authenticated. Succeeding.";
    goto LABEL_31;
  }
  if ((_DWORD)v17 == 1)
    v34 = v18;
  else
    v34 = 1;
  if ((v34 & 1) == 0)
  {
    SBLogCommon();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v39 = "[Unlock Request] DismissOnly specified, but we are not authenticated. Failing.";
LABEL_44:
    _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_INFO, v39, buf, 2u);
LABEL_45:

    v33 = v71;
    if (v71)
      v71[2](v71, 0);
    goto LABEL_47;
  }
  objc_msgSend(v12, "uiLockStateProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v12, "uiLockStateProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isUILocked");

    v15 = v21;
  }
  else
  {
    v37 = -[SBLockScreenManager isUILocked](self, "isUILocked");
  }

  if ((v17 | 2) != 3)
    goto LABEL_59;
  if (((v18 ^ 1 | v37) & 1) != 0)
  {
    if ((v17 | 2) == 3)
    {
      v80 = 0;
      v42 = -[SBLockScreenManager _canAttemptRealUIUnlockIgnoringBacklightNonsenseWithReason:](self, "_canAttemptRealUIUnlockIgnoringBacklightNonsenseWithReason:", &v80);
      v43 = v80;
      if (!v42)
      {
        SBLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v43;
          _os_log_impl(&dword_1D0540000, v44, OS_LOG_TYPE_INFO, "[Unlock Request] Request to dismiss failed with reason: \"%@\". Failing.", buf, 0xCu);
        }

        v15 = v21;
        v33 = v71;
        if (v71)
          v71[2](v71, 0);
        v40 = 0;
LABEL_80:

        goto LABEL_48;
      }
LABEL_60:
      v45 = (void *)MEMORY[0x1E0D016E8];
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke;
      v78[3] = &unk_1E8EBC5D8;
      v79 = v71;
      objc_msgSend(v45, "sentinelWithQueue:signalHandler:", MEMORY[0x1E0C80D38], v78);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenEnvironment customActionStore](self->_lockScreenEnvironment, "customActionStore");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "_customLockScreenActionContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = v43;
      if (v47)
      {
        v48 = 0;
        v15 = v21;
        v33 = v71;
        v49 = MEMORY[0x1E0C809B0];
LABEL_72:
        v56 = (SBLockScreenUnlockRequest *)objc_msgSend(v11, "copy");
        unlockRequest = self->_unlockRequest;
        self->_unlockRequest = v56;

        v72[0] = v49;
        v72[1] = 3221225472;
        v72[2] = __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_297;
        v72[3] = &unk_1E8E9EEF0;
        v58 = v70;
        v73 = v58;
        v59 = v46;
        v74 = v59;
        v60 = v48;
        v75 = v60;
        v61 = (void *)objc_msgSend(v72, "copy");
        unlockActionBlock = self->_unlockActionBlock;
        self->_unlockActionBlock = v61;

        self->_handlingUnlockRequest = 1;
        SBLogCommon();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v63, OS_LOG_TYPE_INFO, "[Unlock Request] Attempting real UIUnlock...", buf, 2u);
        }

        self->_saveUnlockRequest = 0;
        v40 = -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", v16, 0);
        if (!v40)
        {
          self->_handlingUnlockRequest = 0;
          SBLogCommon();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v64, OS_LOG_TYPE_INFO, "[Unlock Request] Attempted UIUnlock failed :(", buf, 2u);
          }

          if (!self->_saveUnlockRequest)
            -[SBLockScreenManager _runUnlockActionBlock:](self, "_runUnlockActionBlock:", 0);
        }

        v43 = v69;
        goto LABEL_80;
      }
      v67 = v46;
      v48 = objc_alloc_init(MEMORY[0x1E0DA9EA0]);
      objc_msgSend(v11, "name");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setIdentifier:", v50);

      objc_msgSend(v48, "setIntent:", v17);
      objc_msgSend(v48, "setSource:", v16);
      objc_msgSend(v48, "setWantsBiometricPresentation:", objc_msgSend(v11, "wantsBiometricPresentation"));
      objc_msgSend(v48, "setConfirmedNotInPocket:", objc_msgSend(v11, "confirmedNotInPocket"));
      objc_msgSend(v11, "destinationApplication");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unlockDestination");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = v51;
      if (v52)
      {
        objc_msgSend(v11, "unlockDestination");
        v53 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v51)
        {
          v54 = 0;
          goto LABEL_69;
        }
        objc_msgSend(v51, "displayName");
        v53 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v53;
LABEL_69:
      v15 = v21;
      objc_msgSend(v48, "setUnlockDestination:", v54);
      v55 = (_DWORD)v17 == 2;
      v33 = v71;
      v49 = MEMORY[0x1E0C809B0];
      if (!v55)
      {
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_2;
        v76[3] = &unk_1E8E9DED8;
        v77 = v70;
        objc_msgSend(v48, "setAction:", v76);

      }
      v46 = v67;
      objc_msgSend(v67, "setCustomLockScreenActionContext:", v48);

      goto LABEL_72;
    }
LABEL_59:
    v43 = 0;
    goto LABEL_60;
  }
  SBLogCommon();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v32 = "[Unlock Request] Dismiss specified, and we are already UI-unlocked. Succeeding.";
LABEL_31:
    _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_INFO, v32, buf, 2u);
  }
LABEL_32:

  v33 = v71;
  if (v71)
    v71[2](v71, 1);
LABEL_47:
  v40 = 0;
LABEL_48:

  return v40;
}

- (void)_runUnlockActionBlock:(BOOL)a3
{
  _BOOL8 v3;
  SBLockScreenUnlockRequest *unlockRequest;
  int v6;
  const char **v7;
  void (**v8)(id, _BOOL8);
  id unlockActionBlock;
  void (**v10)(id, _BOOL8);

  v3 = a3;
  unlockRequest = self->_unlockRequest;
  if (unlockRequest)
  {
    self->_unlockRequest = 0;

    v6 = _runUnlockActionBlock__token;
    v7 = (const char **)MEMORY[0x1E0DAC1D8];
    if (_runUnlockActionBlock__token != -1
      || (notify_register_check((const char *)*MEMORY[0x1E0DAC1D8], &_runUnlockActionBlock__token),
          v6 = _runUnlockActionBlock__token,
          _runUnlockActionBlock__token != -1))
    {
      notify_set_state(v6, -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated"));
      notify_post(*v7);
    }
  }
  v8 = (void (**)(id, _BOOL8))MEMORY[0x1D17E5550](self->_unlockActionBlock, a2);
  if (v8)
  {
    unlockActionBlock = self->_unlockActionBlock;
    self->_unlockActionBlock = 0;
    v10 = v8;

    v10[2](v10, v3);
    v8 = v10;
  }

}

- (BOOL)unlockWithRequest:(id)a3 completion:(id)a4
{
  return -[SBLockScreenManager _unlockWithRequest:cancelPendingRequests:completion:](self, "_unlockWithRequest:cancelPendingRequests:completion:", a3, 1, a4);
}

uint64_t __53__SBLockScreenManager__sharedInstanceCreateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  SBLockScreenManager *v3;
  void *v4;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SBLockScreenManager.m"), 368, CFSTR("Unexpectedly created SBLockScreenManager before UIApplication instance was created."));

  }
  kdebug_trace();
  v3 = objc_alloc_init(SBLockScreenManager);
  v4 = (void *)_sharedInstanceCreateIfNeeded____manager;
  _sharedInstanceCreateIfNeeded____manager = (uint64_t)v3;

  return kdebug_trace();
}

- (SBLockScreenManager)init
{
  SBLockScreenManager *v2;
  SBLockScreenManager *v3;
  void *v4;
  SBLockScreenBiometricAuthenticationCoordinator *v5;
  SBLockScreenBiometricAuthenticationCoordinator *biometricAuthenticationCoordinator;
  SBCoverSheetBiometricResourceObserver *v7;
  SBCoverSheetBiometricResourceObserver *biometricResourceObserver;
  SBPearlInterlockObserver *v9;
  SBPearlInterlockObserver *pearlInterlockObserver;
  void *v11;
  uint64_t v12;
  SBLockScreenEnvironment *lockScreenEnvironment;
  void *v14;
  void *v15;
  SBLockScreenOrientationManager *v16;
  SBLockScreenOrientationManager *lockScreenOrientationManager;
  SBLockScreenBiometricAuthenticationCoordinator *v18;
  void *v19;
  void *v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v22;
  uint64_t v23;
  SBFLockOutStatusProvider *lockOutController;
  void *v25;
  SBLiftToWakeManager *v26;
  SBLiftToWakeManager *liftToWakeManager;
  SBTapToWakeController *v28;
  SBTapToWakeController *tapToWakeController;
  SBMotionDetectionWakeController *v30;
  SBMotionDetectionWakeController *motionDetectionWakeController;
  uint64_t v32;
  SBFMouseButtonDownGestureRecognizer *mouseButtonDownGesture;
  void *v34;
  SBLockScreenDisabledAssertionManager *v35;
  SBLockScreenDisabledAssertionManager *lockScreenDisabledAssertionManager;
  SBLockScreenAutoUnlockAggregateRule *v37;
  SBLockScreenAutoUnlockAggregateRule *autoUnlockRuleAggregator;
  SBLockScreenAutoUnlockAggregateRule *v39;
  void *v40;
  void *v41;
  SBLockScreenManager *v42;
  id v43;
  void *v44;
  void *v45;
  SBIdleTimerCoordinatorHelper *v46;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  UINotificationFeedbackGenerator *authenticationFeedbackGenerator;
  void *v54;
  uint64_t v55;
  SBTapToWakeController *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  BSCompoundAssertion *lockScreenPresentationPendingAssertions;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id location[5];
  SBLockScreenManager *v68;
  objc_super v69;

  v69.receiver = self;
  v69.super_class = (Class)SBLockScreenManager;
  v2 = -[SBLockScreenManager init](&v69, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_allowDisablePasscodeLockAssertion = 0;
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWalletPreArmController sharedInstance](SBWalletPreArmController, "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBLockScreenBiometricAuthenticationCoordinator initWithBiometricResource:walletPreArmController:]([SBLockScreenBiometricAuthenticationCoordinator alloc], "initWithBiometricResource:walletPreArmController:", v4, v64);
    biometricAuthenticationCoordinator = v3->_biometricAuthenticationCoordinator;
    v3->_biometricAuthenticationCoordinator = v5;

    -[SBLockScreenBiometricAuthenticationCoordinator setDelegate:](v3->_biometricAuthenticationCoordinator, "setDelegate:", v3);
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5F0]), "initWithBiometricResource:overrideMatchingAssertionFactory:", v4, v3->_biometricAuthenticationCoordinator);
    objc_msgSend(MEMORY[0x1E0DAC5F8], "setPasscodeBiometricResource:");
    v7 = -[SBCoverSheetBiometricResourceObserver initWithBiometricResource:]([SBCoverSheetBiometricResourceObserver alloc], "initWithBiometricResource:", v4);
    biometricResourceObserver = v3->_biometricResourceObserver;
    v3->_biometricResourceObserver = v7;

    v9 = -[SBPearlInterlockObserver initWithBiometricResource:]([SBPearlInterlockObserver alloc], "initWithBiometricResource:", v4);
    pearlInterlockObserver = v3->_pearlInterlockObserver;
    v3->_pearlInterlockObserver = v9;

    -[SBPearlInterlockObserver activate](v3->_pearlInterlockObserver, "activate");
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isInLostMode = objc_msgSend(v11, "lostModeIsActive");

    v12 = -[SBLockScreenManager _newLockScreenEnvironment](v3, "_newLockScreenEnvironment");
    lockScreenEnvironment = v3->_lockScreenEnvironment;
    v3->_lockScreenEnvironment = (SBLockScreenEnvironment *)v12;

    -[SBLockScreenManager rootViewController]((id *)&v3->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v14, "setDelegate:", v3);
    v62 = v14;
    -[SBLockScreenEnvironment screenWakeAnimationTarget](v3->_lockScreenEnvironment, "screenWakeAnimationTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateWakeEffectsForWake:", 0);

    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
    {
      v16 = objc_alloc_init(SBLockScreenOrientationManager);
      lockScreenOrientationManager = v3->_lockScreenOrientationManager;
      v3->_lockScreenOrientationManager = v16;

    }
    v18 = v3->_biometricAuthenticationCoordinator;
    -[SBLockScreenEnvironment biometricUnlockBehavior](v3->_lockScreenEnvironment, "biometricUnlockBehavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenBiometricAuthenticationCoordinator _setAutoUnlockBehavior:](v18, "_setAutoUnlockBehavior:", v19);

    -[SBLockScreenManager _reallySetUILocked:](v3, "_reallySetUILocked:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_activationChanged_, CFSTR("SBLockdownDeviceActivatedChangedNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__authenticationStateChanged_, *MEMORY[0x1E0DAA248], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__lockUI, CFSTR("SBLockScreenExternalPartyWantsUILockNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__deviceBlockedChanged_, *MEMORY[0x1E0DAA050], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__resetOrRestoreStateChanged_, CFSTR("SBResetOrRestoreStateDidChangeNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__lockScreenDimmed_, CFSTR("SBLockScreenDimmedNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__handleBacklightLevelWillChange_, *MEMORY[0x1E0DAC2F8], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__handleBacklightDidTurnOff_, *MEMORY[0x1E0DAC2F0], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__setupModeChanged, CFSTR("SBInBuddyModeDidChangeNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__activeCallStateChanged, *MEMORY[0x1E0DAC2B0], 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)LostModeStateChanged, (CFStringRef)*MEMORY[0x1E0D21398], 0, CFNotificationSuspensionBehaviorCoalesce);
    v22 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v22, v3, (CFNotificationCallback)LockScreenToggled, CFSTR("com.apple.springboard.toggleLockScreen"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend((id)SBApp, "lockOutController");
    v23 = objc_claimAutoreleasedReturnValue();
    lockOutController = v3->_lockOutController;
    v3->_lockOutController = (SBFLockOutStatusProvider *)v23;

    objc_msgSend((id)SBApp, "authenticationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager _setUserAuthController:](v3, "_setUserAuthController:", v25);

    v26 = objc_alloc_init(SBLiftToWakeManager);
    liftToWakeManager = v3->_liftToWakeManager;
    v3->_liftToWakeManager = v26;

    if (+[SBTapToWakeController isTapToWakeSupported](SBTapToWakeController, "isTapToWakeSupported"))
    {
      v28 = objc_alloc_init(SBTapToWakeController);
      tapToWakeController = v3->_tapToWakeController;
      v3->_tapToWakeController = v28;

      -[SBTapToWakeController setDelegate:](v3->_tapToWakeController, "setDelegate:", v3);
    }
    if (MGGetBoolAnswer())
    {
      v30 = objc_alloc_init(SBMotionDetectionWakeController);
      motionDetectionWakeController = v3->_motionDetectionWakeController;
      v3->_motionDetectionWakeController = v30;

      -[SBMotionDetectionWakeController setDelegate:](v3->_motionDetectionWakeController, "setDelegate:", v3);
    }
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E98]), "initWithTarget:action:", v3, sel__wakeScreenForMouseButtonDown_);
    mouseButtonDownGesture = v3->_mouseButtonDownGesture;
    v3->_mouseButtonDownGesture = (SBFMouseButtonDownGestureRecognizer *)v32;

    -[SBFMouseButtonDownGestureRecognizer setDelegate:](v3->_mouseButtonDownGesture, "setDelegate:", v3);
    +[SBMainDisplaySystemGestureManager sharedInstance](SBMainDisplaySystemGestureManager, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addGestureRecognizer:withType:", v3->_mouseButtonDownGesture, 68);

    v35 = objc_alloc_init(SBLockScreenDisabledAssertionManager);
    lockScreenDisabledAssertionManager = v3->_lockScreenDisabledAssertionManager;
    v3->_lockScreenDisabledAssertionManager = v35;

    v37 = -[SBLockScreenAutoUnlockAggregateRule initWithUserAuthenticationController:]([SBLockScreenAutoUnlockAggregateRule alloc], "initWithUserAuthenticationController:", v3->_userAuthController);
    autoUnlockRuleAggregator = v3->_autoUnlockRuleAggregator;
    v3->_autoUnlockRuleAggregator = v37;

    -[SBAutoUnlockComposableRule addAutoUnlockRule:](v3->_autoUnlockRuleAggregator, "addAutoUnlockRule:", v3->_lockScreenDisabledAssertionManager);
    v39 = v3->_autoUnlockRuleAggregator;
    -[SBLockScreenEnvironment autoUnlockRule](v3->_lockScreenEnvironment, "autoUnlockRule");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAutoUnlockComposableRule addAutoUnlockRule:](v39, "addAutoUnlockRule:", v40);

    -[SBLockScreenManager _evaluatePreArmDisabledAssertions](v3, "_evaluatePreArmDisabledAssertions");
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:forVariant:", v3, 0);
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = __27__SBLockScreenManager_init__block_invoke;
    location[4] = &unk_1E8E9E6B0;
    v42 = v3;
    v68 = v42;
    v43 = (id)BSLogAddStateCaptureBlockWithTitle();
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setLockScreenEnvironment:", v3->_lockScreenEnvironment);
    objc_msgSend(v44, "setUILockStateProvider:", v42);
    objc_msgSend(v44, "setDelegate:", v42);
    objc_msgSend(v44, "setPearlMatchingStateProvider:", v3->_biometricResourceObserver);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setMainWorkspace:", v45);

    v46 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v42);
    idleTimerCoordinatorHelper = v42->_idleTimerCoordinatorHelper;
    v42->_idleTimerCoordinatorHelper = v46;

    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager _setIdleTimerCoordinator:](v42, "_setIdleTimerCoordinator:", v48);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E91D22E8, &unk_1E91D2300, &unk_1E91D2318, &unk_1E91D2330, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_alloc(MEMORY[0x1E0CEA7D0]);
    objc_msgSend(MEMORY[0x1E0CEAE28], "privateConfigurationForTypes:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "initWithConfiguration:", v51);
    authenticationFeedbackGenerator = v42->_authenticationFeedbackGenerator;
    v42->_authenticationFeedbackGenerator = (UINotificationFeedbackGenerator *)v52;

    -[SBLockScreenManager _showSystemApertureProudLockElementIfSupportedWithReason:](v42, "_showSystemApertureProudLockElementIfSupportedWithReason:", CFSTR("Startup"));
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObserver:", v42);
    if ((objc_msgSend(v54, "isDigitizerDisabled") & 1) != 0)
    {
      v55 = objc_msgSend(v54, "isTapToWakeEnabled");
      -[SBTapToWakeController setDigitizerInTapToWakeMode:](v42->_tapToWakeController, "setDigitizerInTapToWakeMode:", v55);
      v56 = v42->_tapToWakeController;
      if ((_DWORD)v55)
        v57 = objc_msgSend(v54, "tapToWakeRequiresHitTestSuppression");
      else
        v57 = 0;
    }
    else
    {
      -[SBTapToWakeController setDigitizerInTapToWakeMode:](v42->_tapToWakeController, "setDigitizerInTapToWakeMode:", 0);
      v57 = 0;
      v56 = v42->_tapToWakeController;
    }
    -[SBTapToWakeController setDigitizerModeRequiresHitTestSuppression:](v56, "setDigitizerModeRequiresHitTestSuppression:", v57);
    objc_initWeak(location, v42);
    v58 = (void *)MEMORY[0x1E0D01718];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __27__SBLockScreenManager_init__block_invoke_147;
    v65[3] = &unk_1E8EA3688;
    objc_copyWeak(&v66, location);
    objc_msgSend(v58, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBLockScreenManager lockScreenPresentationPending"), v65);
    v59 = objc_claimAutoreleasedReturnValue();
    lockScreenPresentationPendingAssertions = v42->_lockScreenPresentationPendingAssertions;
    v42->_lockScreenPresentationPendingAssertions = (BSCompoundAssertion *)v59;

    if (objc_msgSend(v54, "screenIsOn"))
      objc_msgSend(v4, "noteScreenWillTurnOn");
    else
      objc_msgSend(v4, "noteScreenDidTurnOff");
    objc_destroyWeak(&v66);
    objc_destroyWeak(location);

  }
  return v3;
}

- (id)rootViewController
{
  if (a1)
  {
    objc_msgSend(a1[4], "rootViewController");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __27__SBLockScreenManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "description");
}

void __27__SBLockScreenManager_init__block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);

}

void __27__SBLockScreenManager_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coverSheetViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (id)_newLockScreenEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  SBLoginAppContainerViewController *v7;
  SBDashBoardLockScreenEnvironment *v8;
  void *v9;

  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLoginSession"))
  {

  }
  else
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "forceLoginWindow");

    if (!v6)
    {
      v8 = objc_alloc_init(SBDashBoardLockScreenEnvironment);
      -[SBDashBoardLockScreenEnvironment coverSheetViewController](v8, "coverSheetViewController");
      v7 = (SBLoginAppContainerViewController *)objc_claimAutoreleasedReturnValue();
      -[SBLoginAppContainerViewController setDelegate:](v7, "setDelegate:", self);
      goto LABEL_6;
    }
  }
  v7 = objc_alloc_init(SBLoginAppContainerViewController);
  v8 = -[SBLegacyLockScreenEnvironment initWithLockScreenViewController:]([SBLegacyLockScreenEnvironment alloc], "initWithLockScreenViewController:", v7);
LABEL_6:

  -[SBDashBoardLockScreenEnvironment idleTimerController](v8, "idleTimerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdleTimerCoordinator:", self);

  return v8;
}

- (BOOL)hasUIEverBeenLocked
{
  return self->_uiHasBeenLockedOnce;
}

- (BOOL)_shouldLockAfterEndingTelephonyCall
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v8;

  if (+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
  {
    goto LABEL_2;
  }
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "inCall"))
  {
    LOBYTE(v3) = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyCallIsEndpointOnCurrentDevice");

  if (v6 && !-[SBLockScreenManager isUILocked](self, "isUILocked"))
  {
    if ((SBWorkspaceSpringBoardIsActive() & 1) != 0)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transientOverlayPresentationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v8, "hasActivePresentation") ^ 1;

LABEL_9:
    return v3;
  }
LABEL_2:
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)_shouldLockAfterEndingFaceTimeCall
{
  int v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char IsActive;
  void *v9;
  void *v10;

  if (!+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
  {
    +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "inFaceTime");

    +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "inFaceTimeVideo");

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = 0;
    if (!v4 || (v6 & 1) != 0)
      goto LABEL_13;
    IsActive = SBWorkspaceSpringBoardIsActive();
    if ((IsActive & 1) != 0
      || (objc_msgSend(v7, "transientOverlayPresentationManager"),
          v6 = objc_claimAutoreleasedReturnValue(),
          (objc_msgSend((id)v6, "hasActivePresentation") & 1) == 0))
    {
      +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "faceTimeInvitationExists") & 1) != 0)
      {

        LOBYTE(v2) = 0;
        if ((IsActive & 1) != 0)
          goto LABEL_13;
      }
      else
      {
        objc_msgSend(v7, "pipControllerForType:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = objc_msgSend(v10, "isPictureInPictureWindowVisibleOnWindowScene:", 0) ^ 1;

        if ((IsActive & 1) != 0)
        {
LABEL_13:

          return v2;
        }
      }
    }
    else
    {
      LOBYTE(v2) = 0;
    }

    goto LABEL_13;
  }
  LOBYTE(v2) = 0;
  return v2;
}

- (BOOL)shouldLockUIAfterEndingCall
{
  if (+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
  {
    return 0;
  }
  if (-[SBLockScreenManager _shouldLockAfterEndingTelephonyCall](self, "_shouldLockAfterEndingTelephonyCall"))
    return 1;
  return -[SBLockScreenManager _shouldLockAfterEndingFaceTimeCall](self, "_shouldLockAfterEndingFaceTimeCall");
}

- (BOOL)shouldTapToWake
{
  void *v2;
  char v3;

  -[SBLockScreenManager _tapToWakeController](self, "_tapToWakeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldTapToWake");

  return v3;
}

- (BOOL)playLockSoundIfPermitted
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[SBLockScreenManager _shouldPlayLockSound](self, "_shouldPlayLockSound");
  if (v3)
  {
    self->_hasPlayedSoundForLock = 1;
    +[SBSoundController sharedInstance](SBSoundController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAC2A0], "soundWithFeedbackEventType:", 1002);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playSoundWithDefaultEnvironment:", v5);

  }
  return v3;
}

- (BOOL)_shouldPlayLockSound
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  uint8_t v8[16];

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  if (!v4
    || (v5 = -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet")) != 0
    && (v5 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated")) != 0)
  {
    if (self->_hasPlayedSoundForLock)
    {
      SBLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "didn't play lock sound, have already played sound for this locking", v8, 2u);
      }

      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)isLockScreenActive
{
  void *v2;
  BOOL v3;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_appearState") == 2 || objc_msgSend(v2, "_appearState") == 1;

  return v3;
}

- (BOOL)isLockScreenVisible
{
  _BOOL4 v2;

  v2 = -[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive");
  if (v2)
    LOBYTE(v2) = !+[SBAssistantController isVisible](SBAssistantController, "isVisible");
  return v2;
}

- (BOOL)isSupressingLockButton
{
  void *v2;
  char v3;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessoryAnimationPresenting");

  return v3;
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4
{
  -[SBLockScreenManager lockUIFromSource:withOptions:completion:](self, "lockUIFromSource:withOptions:completion:", *(_QWORD *)&a3, a4, 0);
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL8 v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  _QWORD v93[4];
  id v94;
  void (**v95)(_QWORD, _QWORD);
  _QWORD v96[5];
  id v97;
  _BYTE *v98;
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t v101[8];
  uint8_t *v102;
  uint64_t v103;
  char v104;
  _BYTE buf[24];
  char v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromLockSource();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "lockUIFromSource:%{public}@ options:%{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v106 = 0;
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke;
  v96[3] = &unk_1E8EC11B0;
  v98 = buf;
  v96[4] = self;
  v81 = v8;
  v97 = v81;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v96);
  if (self->_allowUILockUnlock)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsAnimateLockScreenActivationKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v66) = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsLockAutomaticallyKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsForceLockKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsAnimationTransactionProviderKey"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsForceBioLockoutKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsUseScreenOffModeKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v18;
    if (v18)
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = 1;
    v74 = objc_msgSend(v7, "bs_BOOLForKey:", CFSTR("SBUILockOptionsPreserveTransientOverlaysKey"), v66);
    objc_msgSend(v7, "objectForKey:", CFSTR("SBUILockOptionsIgnoreCallKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    v23 = !+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported")&& -[SBLockScreenManager shouldLockUIAfterEndingCall](self, "shouldLockUIAfterEndingCall");
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v24, "backlightState");

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_forceBioLockout");

      notify_post("com.apple.springboard.lock-with-force-biolockout");
    }
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cancelEventsWithName:", CFSTR("AttemptLock"));

    -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_sbWindowScene");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "switcherController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasSessionWithPendingButtonEvents:options:", 1, 0);

    if (v29)
    {
      v12[2](v12, 0);
LABEL_59:
      if ((v74 & 1) == 0)
      {
        if (v69 == 3)
        {
          *(_QWORD *)v101 = 0;
          v102 = v101;
          v103 = 0x2020000000;
          v104 = 0;
          -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "_sbWindowScene");
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "transientOverlayPresenter");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "presentedViewControllers");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_2;
          v92[3] = &unk_1E8EC11D8;
          v92[4] = v101;
          objc_msgSend(v75, "enumerateObjectsUsingBlock:", v92);
          if (v102[24])
          {
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v52 = v75;
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
            if (v53)
            {
              v54 = *(_QWORD *)v89;
              do
              {
                for (i = 0; i != v53; ++i)
                {
                  if (*(_QWORD *)v89 != v54)
                    objc_enumerationMutation(v52);
                  v56 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
                  if ((objc_msgSend(v56, "supportsAlwaysOnDisplay") & 1) == 0)
                  {
                    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "dismissTransientOverlayViewController:animated:completion:", v56, 0, 0);

                  }
                }
                v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
              }
              while (v53);
            }
          }
          else
          {
            +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
            v52 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "dismissAllTransientOverlayPresentationsAnimated:", 0);
          }

        }
        else
        {
          *(_QWORD *)v101 = 0;
          v102 = v101;
          v103 = 0x2020000000;
          v104 = 0;
          objc_msgSend(v80, "transientOverlayPresenter");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "presentedViewControllers");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_3;
          v87[3] = &unk_1E8EC11D8;
          v87[4] = v101;
          objc_msgSend(v76, "enumerateObjectsUsingBlock:", v87);
          if (v102[24])
          {
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v58 = v76;
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
            if (v59)
            {
              v60 = *(_QWORD *)v84;
              do
              {
                for (j = 0; j != v59; ++j)
                {
                  if (*(_QWORD *)v84 != v60)
                    objc_enumerationMutation(v58);
                  v62 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
                  if ((objc_msgSend(v62, "preventsDismissalOnLockForInactiveScreen") & 1) == 0)
                  {
                    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "dismissTransientOverlayViewController:animated:completion:", v62, 0, 0);

                  }
                }
                v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
              }
              while (v59);
            }
          }
          else
          {
            +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
            v58 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "dismissAllTransientOverlayPresentationsAnimated:", 0);
          }

        }
        _Block_object_dispose(v101, 8);
      }
      if ((a3 - 1) <= 1)
        objc_msgSend(MEMORY[0x1E0DBF730], "_stopAllAlerts");
      objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setValue:forPreferenceKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0DBDF98]);

      ((void (**)(_QWORD, BOOL))v12)[2](v12, -[SBLockScreenManager isUILocked](self, "isUILocked"));
      goto LABEL_96;
    }
    objc_msgSend(MEMORY[0x1E0DA9FC8], "sharedInstanceIfExists");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lockDidBegin");

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "inCallPresentationManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v22 | v71;
    if (((v22 | v71) & 1) != 0)
    {
      v34 = 0;
      v35 = a3;
    }
    else
    {
      v35 = a3;
      v34 = objc_msgSend(v32, "supportsHandlingDeviceLock");
    }
    switch((int)v35)
    {
      case 0:
        if ((v71 & 1) != 0)
          goto LABEL_35;
        SBLogCommon();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[SBLockScreenManager lockUIFromSource:withOptions:completion:].cold.1(v36);

        v37 = -[SBLockScreenManager isUILocked](self, "isUILocked");
        goto LABEL_87;
      case 1:
      case 3:
        if (+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
        {
          if (((!-[SBLockScreenManager isUILocked](self, "isUILocked") | v34) & 1) != 0)
            goto LABEL_35;
          goto LABEL_43;
        }
        if (-[SBLockScreenManager isUILocked](self, "isUILocked") && !v23)
          goto LABEL_43;
        goto LABEL_35;
      case 2:
      case 5:
        goto LABEL_28;
      case 4:
        goto LABEL_35;
      default:
        if ((_DWORD)v35 == 15)
        {
LABEL_28:
          if (!-[SBLockScreenManager isUILocked](self, "isUILocked"))
            goto LABEL_35;
        }
        else
        {
          if ((_DWORD)v35 != 24)
          {
LABEL_35:
            SBLogCommon();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = v32;
              +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "inCall");
              *(_DWORD *)v101 = 67109120;
              *(_DWORD *)&v101[4] = v41;
              _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "-[SBTelephonyManager inCall] %d", v101, 8u);

              v32 = v39;
            }

            if (((+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported") | v33) & 1) == 0)
            {
              if (a3 == 1 && v23)
              {
                +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "inCallTransientOverlayManager");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "presentTransientOverlayForUILock");

                goto LABEL_86;
              }
              -[SBLockScreenManager _disconnectActiveCallIfNeededFromSource:](self, "_disconnectActiveCallIfNeededFromSource:");
            }
            if (((v33 | v34 ^ 1) & 1) == 0)
            {
              SBLogInCallPresentation();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v101 = 0;
                _os_log_impl(&dword_1D0540000, v64, OS_LOG_TYPE_DEFAULT, "inCallPresentationManager handleDeviceLockFromSource", v101, 2u);
              }

              objc_msgSend(v32, "handleDeviceLockFromSource:", a3);
LABEL_86:
              v37 = 0;
LABEL_87:
              v12[2](v12, v37);

LABEL_96:
              goto LABEL_97;
            }
            SBLogCommon();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v101 = 0;
              _os_log_impl(&dword_1D0540000, v46, OS_LOG_TYPE_DEFAULT, "LockUI from source: Now locking", v101, 2u);
            }

            if (a3 == 15)
              v47 = 1;
            else
              v47 = v67;
            v93[0] = MEMORY[0x1E0C809B0];
            v93[1] = 3221225472;
            v93[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_167;
            v93[3] = &unk_1E8E9F230;
            v94 = v79;
            v95 = v12;
            -[SBLockScreenManager _activateLockScreenAnimated:animationProvider:automatically:inScreenOffMode:dismissNotificationCenter:completion:](self, "_activateLockScreenAnimated:animationProvider:automatically:inScreenOffMode:dismissNotificationCenter:completion:", v68, v78, v47, v19, a3 != 4, v93);
            -[SBLockScreenManager _clearAuthenticationLockAssertion](self, "_clearAuthenticationLockAssertion");
            if (v71)
            {
              objc_msgSend((id)SBApp, "authenticationController");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromLockSource();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "revokeAuthenticationImmediatelyForPublicReason:", v49);

            }
            if ((-[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet") & 1) == 0)
            {
              +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "noteDeviceDidLock");

            }
LABEL_58:

            goto LABEL_59;
          }
          if (!-[SBLockScreenManager isUILocked](self, "isUILocked"))
          {
            v34 = 0;
            goto LABEL_35;
          }
        }
LABEL_43:
        if (objc_msgSend(v79, "unlockedEnvironmentMode") != 3)
        {
          +[SBIconController sharedInstance](SBIconController, "sharedInstance");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "popToCurrentRootIconListWhenPossible");

          v35 = a3;
        }
        -[SBLockScreenManager _relockUIForButtonlikeSource:](self, "_relockUIForButtonlikeSource:", v35);
        goto LABEL_58;
    }
  }
  SBLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v101 = 0;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring lock attempt because we're still initializing ourselves at startup and we're not ready for this yet.", v101, 2u);
  }

  v12[2](v12, 0);
LABEL_97:

  _Block_object_dispose(buf, 8);
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 84) = 0;
    result = *(_QWORD *)(result + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_167(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "unlockedEnvironmentMode") != 3)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "popToCurrentRootIconListWhenPossible");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "supportsAlwaysOnDisplay");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "preventsDismissalOnLockForInactiveScreen");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  void *v2;
  id v3;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (CSCoverSheetViewController *)v3;
}

- (SBNotificationDestination)notificationDestination
{
  void *v2;
  void *v3;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBNotificationDestination *)v3;
}

- (id)biometricAuthenticationCoordinator
{
  return self->_biometricAuthenticationCoordinator;
}

- (BOOL)wouldAttemptToHandleATransitionRequest
{
  BOOL v3;
  int v4;
  void *v5;
  BOOL v6;

  v3 = -[SBLockScreenManager isUILocked](self, "isUILocked");
  LOBYTE(v4) = 0;
  if (-[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive") && !v3)
  {
    +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isAnyGestureActivelyRecognized") ^ 1;

  }
  v6 = self->_handlingUnlockRequest && -[SBLockScreenManager isUIUnlocking](self, "isUIUnlocking");
  if (v3)
    return 1;
  else
    return v4 | v6;
}

uint64_t __47__SBLockScreenManager_handleTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "activationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForActivationSetting:", 35) ^ 1;

  return v3;
}

SBCoverSheetToAppsWorkspaceTransaction *__47__SBLockScreenManager_handleTransitionRequest___block_invoke_173(uint64_t a1, void *a2)
{
  id v2;
  SBCoverSheetToAppsWorkspaceTransaction *v3;

  v2 = a2;
  v3 = -[SBCoverSheetToAppsWorkspaceTransaction initWithTransitionRequest:]([SBCoverSheetToAppsWorkspaceTransaction alloc], "initWithTransitionRequest:", v2);

  return v3;
}

- (BOOL)_canHandleTransitionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v9;
  unint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedActivatingWorkspaceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "source");

  if ((v6 <= 0x3D && ((1 << v6) & 0x2000C801004C2134) != 0 || v6 == 70 || v6 == 67)
    && (objc_msgSend(v4, "isBackground") & 1) == 0)
  {
    objc_msgSend(v4, "entities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v7 = 0;
    if (v10 <= 1 && v5)
    {
      if ((objc_msgSend(v5, "isApplicationSceneEntity") & 1) != 0)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isAppClipPlaceholderEntity");
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)bioAuthenticatedWhileMenuButtonDown
{
  return -[SBLockScreenBiometricAuthenticationCoordinator bioAuthenticatedWhileMenuButtonDown](self->_biometricAuthenticationCoordinator, "bioAuthenticatedWhileMenuButtonDown");
}

- (void)setBiometricAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mesaAutoUnlockingDisabledAssertions;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v7 = a4;
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 1000, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v7 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mesaAutoUnlockingDisabledAssertions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {

    if (!v9)
    {
      if (!self->_mesaAutoUnlockingDisabledAssertions)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        mesaAutoUnlockingDisabledAssertions = self->_mesaAutoUnlockingDisabledAssertions;
        self->_mesaAutoUnlockingDisabledAssertions = v10;

      }
      -[SBLockScreenBiometricAuthenticationCoordinator acquireDisableAutoUnlockAssertionForReason:](self->_biometricAuthenticationCoordinator, "acquireDisableAutoUnlockAssertionForReason:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mesaAutoUnlockingDisabledAssertions, "setObject:forKeyedSubscript:", v12, v14);
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v8, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->_mesaAutoUnlockingDisabledAssertions, "removeObjectForKey:", v14);
    if (!-[NSMutableDictionary count](self->_mesaAutoUnlockingDisabledAssertions, "count"))
    {
      v12 = self->_mesaAutoUnlockingDisabledAssertions;
      self->_mesaAutoUnlockingDisabledAssertions = 0;
LABEL_11:

    }
  }

}

- (void)loadViewsIfNeeded
{
  id v2;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadViewsIfNeeded");

}

- (BOOL)hasWakeToContentForInactiveDisplay
{
  return -[SBLockScreenManager _shouldWakeToInCallForUnlockSource:wakingTheDisplay:](self, "_shouldWakeToInCallForUnlockSource:wakingTheDisplay:", 32, 0)|| -[SBLockScreenManager _shouldWakeToOtherContentForUnlockSource:wakingTheDisplay:stopAfterWakeTo:](self, "_shouldWakeToOtherContentForUnlockSource:wakingTheDisplay:stopAfterWakeTo:", 32, 0, 1);
}

- (id)acquireLockScreenPresentationPendingAssertionWithReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_lockScreenPresentationPendingAssertions, "acquireForReason:", a3);
}

- (BOOL)isLockScreenPresentationPending
{
  return -[BSCompoundAssertion isActive](self->_lockScreenPresentationPendingAssertions, "isActive");
}

- (id)acquireMotionDetectionWakeEnableAssertionWithReason:(id)a3
{
  return -[SBMotionDetectionWakeController acquireMotionDetectionWakeAssertionForReason:](self->_motionDetectionWakeController, "acquireMotionDetectionWakeAssertionForReason:", a3);
}

- (id)acquireSystemApertureLockElementSuppressionAssertionWithReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *lockElementSuppressionAssertions;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_lockElementSuppressionAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      lockElementSuppressionAssertions = self->_lockElementSuppressionAssertions;
      self->_lockElementSuppressionAssertions = v5;

    }
    SBLogSystemApertureLockElement();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring system aperture lock element suppression assertion for reason: %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v8 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__SBLockScreenManager_acquireSystemApertureLockElementSuppressionAssertionWithReason___block_invoke;
    v13[3] = &unk_1E8E9E468;
    objc_copyWeak(&v14, (id *)buf);
    v11 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:invalidationBlock:", v10, v4, v13);

    -[NSHashTable addObject:](self->_lockElementSuppressionAssertions, "addObject:", v11);
    if (-[NSHashTable count](self->_lockElementSuppressionAssertions, "count") == 1)
      -[SBLockScreenManager reevaluateSystemApertureLockElementSuppressionWithReason:](self, "reevaluateSystemApertureLockElementSuppressionWithReason:", CFSTR("Lock element suppression assertion acquired"));
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __86__SBLockScreenManager_acquireSystemApertureLockElementSuppressionAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id *WeakRetained;
  id *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogSystemApertureLockElement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "System aperture lock element suppression assertion did invalidate with reason: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[40], "removeObject:", v3);
    if (!objc_msgSend(v7[40], "count"))
    {
      v8 = v7[40];
      v7[40] = 0;

      objc_msgSend(v7, "reevaluateSystemApertureLockElementSuppressionWithReason:", CFSTR("Last lock element suppression assertion invalidated"));
    }
  }

}

- (id)acquireSystemApertureLockElementBloomSuppressionAssertionWithReason:(id)a3
{
  id v4;
  BSCompoundAssertion *lockElementBloomSuppressionAssertions;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  lockElementBloomSuppressionAssertions = self->_lockElementBloomSuppressionAssertions;
  if (!lockElementBloomSuppressionAssertions)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __91__SBLockScreenManager_acquireSystemApertureLockElementBloomSuppressionAssertionWithReason___block_invoke;
    v16 = &unk_1E8EA3688;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("LockElementBloomSuppression"), &v13);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lockElementBloomSuppressionAssertions;
    self->_lockElementBloomSuppressionAssertions = v7;

    v9 = self->_lockElementBloomSuppressionAssertions;
    SBLogSystemApertureLockElement();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    lockElementBloomSuppressionAssertions = self->_lockElementBloomSuppressionAssertions;
  }
  -[BSCompoundAssertion acquireForReason:](lockElementBloomSuppressionAssertions, "acquireForReason:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __91__SBLockScreenManager_acquireSystemApertureLockElementBloomSuppressionAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBloomIfNeeded");

}

- (void)reevaluateSystemApertureLockElementSuppressionWithReason:(id)a3
{
  -[SBLockScreenManager _reevaluateSystemApertureLockElementSuppressionWithReason:](self, "_reevaluateSystemApertureLockElementSuppressionWithReason:", a3);
  -[SBLockScreenManager _updateBloomIfNeeded](self, "_updateBloomIfNeeded");
}

- (void)_reevaluateSystemApertureLockElementSuppressionWithReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SBLockScreenManager _shouldHideLockForElementSuppressionAssertion](self, "_shouldHideLockForElementSuppressionAssertion"))
  {
    -[SBLockScreenManager _setSystemApertureProudLockElementVisible:withReason:](self, "_setSystemApertureProudLockElementVisible:withReason:", 0, v4);
  }
  else
  {
    -[SBLockScreenManager _showSystemApertureProudLockElementIfSupportedWithReason:](self, "_showSystemApertureProudLockElementIfSupportedWithReason:", v4);
  }

}

- (void)lockScreenViewControllerWillPresent
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "lockScreenViewControllerWillPresent", v6, 2u);
  }

  -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager _hostingWindowScene](self, "_hostingWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBLockScreenUIWillPresentNotification"), v5);

}

- (void)lockScreenViewControllerDidPresent
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "lockScreenViewControllerDidPresent", buf, 2u);
  }

  -[SBLockScreenManager setUIUnlocking:](self, "setUIUnlocking:", 0);
  self->_handlingUnlockRequest = 0;
  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAnySwitcherVisible"))
    objc_msgSend(v6, "dismissMainAndFloatingSwitchersWithSource:animated:", 7, 0);
  if (objc_msgSend(v6, "isInAnyPeekState"))
    objc_msgSend(v6, "activateHomeScreenWithSource:animated:", 7, 0);
  v7 = -[SBLockScreenManager _lockUI](self, "_lockUI");
  -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuthenticated:", -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated"));

  -[SBLockScreenManager _statusBarLayoutManager](self, "_statusBarLayoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultWindowLevel:", *MEMORY[0x1E0CEBBD0] + 20.0);

  objc_msgSend((id)SBApp, "bannerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissAllBannersInAllWindowScenesAnimated:reason:", 0, CFSTR("SBBannerManagerDismissalReasonLock"));

  if (!self->_presentedPasscodeWhileUILocking)
    -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 0, 1);
  if (self->_isInLostMode)
    -[SBLockScreenManager enableLostModePlugin](self, "enableLostModePlugin");
  objc_msgSend((id)SBApp, "userSessionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isMultiUserSupported");

  v13 = SBFEffectiveHomeButtonType();
  if ((v12 & 1) == 0 && v13 != 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SBLockScreenManager_lockScreenViewControllerDidPresent__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    if (lockScreenViewControllerDidPresent_onceToken != -1)
      dispatch_once(&lockScreenViewControllerDidPresent_onceToken, block);
  }
  -[SBLockScreenManager _showSystemApertureProudLockElementIfSupportedWithReason:](self, "_showSystemApertureProudLockElementIfSupportedWithReason:", CFSTR("DidPresent"));
  objc_msgSend(v5, "homeScreenController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v17, "endRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("SBLockScreenUIDidLockNotification"), self);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager _hostingWindowScene](self, "_hostingWindowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:", CFSTR("SBLockScreenUIDidPresentNotification"), v20);

}

uint64_t __57__SBLockScreenManager_lockScreenViewControllerDidPresent__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 120))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 168), "isAuthenticated");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 168), "hasPasscodeSet");
      if ((_DWORD)result)
      {
        SBUIPrewarmKeyboard();
        return objc_msgSend(*(id *)(v2 + 32), "setPasscodeVisible:animated:", 1, 0);
      }
    }
  }
  return result;
}

- (void)lockScreenViewControllerWillDismiss
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Restoring Home screen icons for UI unlock", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

uint64_t __58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 1);
}

void __58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "modifyApplicationContext:", &__block_literal_global_208_0);
  objc_msgSend(v2, "setSource:", 11);
  objc_msgSend(v2, "setTransactionProvider:", &__block_literal_global_209_1);

}

void __58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAnimationDisabled:", 1);
  objc_msgSend(v2, "setWaitsForSceneUpdates:", 0);

}

SBCoverSheetToAppsWorkspaceTransaction *__58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SBCoverSheetToAppsWorkspaceTransaction *v3;

  v2 = a2;
  v3 = -[SBCoverSheetToAppsWorkspaceTransaction initWithTransitionRequest:]([SBCoverSheetToAppsWorkspaceTransaction alloc], "initWithTransitionRequest:", v2);

  return v3;
}

- (void)lockScreenViewControllerDidDismiss
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  dispatch_time_t v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  uint8_t buf[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "lockScreenViewControllerDidDismiss", buf, 2u);
  }

  -[SBLockScreenManager _statusBarLayoutManager](self, "_statusBarLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultWindowLevel:", *MEMORY[0x1E0CEBE30] + -1.0);

  -[SBLockScreenManager setUIUnlocking:](self, "setUIUnlocking:", 0);
  self->_handlingUnlockRequest = 0;
  -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode");
  -[SBLockScreenManager _setHomeButtonSuppressAfterUnlockRecognizer:](self, "_setHomeButtonSuppressAfterUnlockRecognizer:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBLockScreenManagerUnlockAnimationDidFinish"), self);

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertLockedAlertsToUnlockedAlerts");

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createRequestWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "finalize");
  objc_msgSend(v8, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationSceneEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  v12 = objc_opt_class();
  objc_msgSend(v8, "applicationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "unlockedEnvironmentMode");
  if (!v11 && v16 != 2)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transientOverlayPresentationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasActivePresentation");

    if ((v19 & 1) == 0)
    {
      +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "checkPasscodeCompliance");

    }
  }
  if (self->_proudLockAssertion)
  {
    SBLogSystemApertureLockElement();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "LockElement dismissal lost the race with didDismiss, trying a soft dismiss.", buf, 2u);
    }

    -[SBLockScreenManager _cleanupSystemApertureLockElementIfNecessaryWithReason:](self, "_cleanupSystemApertureLockElementIfNecessaryWithReason:", CFSTR("DidDismiss"));
    if (self->_proudLockAssertion)
    {
      SBLogSystemApertureLockElement();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "LockElement dismissal lost the race with didDismiss, starting a hard dismiss timer.", buf, 2u);
      }

      self->_ignoringDelayDismissalPending = 1;
      objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pearlSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "systemApertureDismissDelayDismissal");
      v26 = v25;

      v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__SBLockScreenManager_lockScreenViewControllerDidDismiss__block_invoke;
      block[3] = &unk_1E8E9DED8;
      block[4] = self;
      dispatch_after(v27, MEMORY[0x1E0C80D38], block);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager _hostingWindowScene](self, "_hostingWindowScene");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postNotificationName:object:", CFSTR("SBLockScreenUIDidDismissNotification"), v29);

}

uint64_t __57__SBLockScreenManager_lockScreenViewControllerDidDismiss__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 296))
  {
    if (*(_QWORD *)(result + 272))
      return objc_msgSend((id)result, "_cleanupSystemApertureLockElementIgnoringDelays:reason:", 1, CFSTR("DidDismissPlusDelay"));
  }
  return result;
}

- (id)_hostingWindowScene
{
  void *v2;
  void *v3;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)coverSheetPresentationManager:(id)a3 unlockWithRequest:(id)a4 completion:(id)a5
{
  -[SBLockScreenManager _unlockWithRequest:cancelPendingRequests:completion:](self, "_unlockWithRequest:cancelPendingRequests:completion:", a4, 0, a5);
}

- (void)lockScreenViewControllerRequestsUnlock
{
  -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 25, 0);
}

- (void)coverSheetViewControllerIrisPlayingDidFinish:(id)a3
{
  if (self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes)
    -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode", a3);
}

- (void)coverSheetViewController:(id)a3 requestsTouchIDDisabled:(BOOL)a4 forReason:(id)a5
{
  -[SBLockScreenManager setBiometricAutoUnlockingDisabled:forReason:](self, "setBiometricAutoUnlockingDisabled:forReason:", a4, a5);
}

- (void)coverSheetViewController:(id)a3 requestsPreArmDisabled:(BOOL)a4 forReason:(id)a5
{
  -[SBLockScreenManager _setWalletPreArmDisabled:forReason:](self, "_setWalletPreArmDisabled:forReason:", a4, a5);
}

- (void)coverSheetViewController:(id)a3 unlockWithRequest:(id)a4 completion:(id)a5
{
  -[SBLockScreenManager unlockWithRequest:completion:](self, "unlockWithRequest:completion:", a4, a5);
}

- (void)coverSheetViewControllerShouldDismissContextMenu:(id)a3
{
  void *v3;
  int v4;
  id v5;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areAnyIconViewContextMenusShowing");

  if (v4)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissAppIconForceTouchControllers:", 0);

  }
}

- (void)coverSheetWindowedAccessoryViewControllerDidDismiss:(id)a3
{
  id v3;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowedAccessoryDismissed");

}

- (void)coverSheetWindowedAccessoryViewControllerDidPresent:(id)a3
{
  id v3;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowedAccessoryPresented");

}

- (void)coverSheetViewControllerHandleUnlockAttemptSucceeded:(id)a3
{
  -[SBLockScreenManager _attemptUnlockWithPasscode:mesa:finishUIUnlock:completion:](self, "_attemptUnlockWithPasscode:mesa:finishUIUnlock:completion:", 0, 1, 0, 0);
}

- (void)coverSheetViewControllerWillPresentInlinePasscode:(id)a3
{
  id v4;

  -[SBLockScreenManager _updateBloomIfNeeded](self, "_updateBloomIfNeeded", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBLockScreenPasscodeUIVisibilityUpdatedNotification"), self);

}

- (void)coverSheetViewControllerDidDismissInlinePasscode:(id)a3
{
  id v4;

  -[SBLockScreenManager _updateBloomIfNeeded](self, "_updateBloomIfNeeded", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBLockScreenPasscodeUIVisibilityUpdatedNotification"), self);

}

- (void)coverSheetViewController:(id)a3 requestsTransientOverlaysDismissedAnimated:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasActivePresentation"))
  {
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers](SBTransientOverlayDismissalRequest, "dismissalRequestForAllViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performDismissalRequest:", v5);

  }
}

- (void)_updateBloomIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_proudLockAssertion)
    goto LABEL_5;
  SBLogSystemApertureLockElement();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] bloom update without a valid assertion causing reevaluation.", v4, 2u);
  }

  -[SBLockScreenManager _reevaluateSystemApertureLockElementSuppressionWithReason:](self, "_reevaluateSystemApertureLockElementSuppressionWithReason:", CFSTR("Bloom update without existing assertion"));
  if (self->_proudLockAssertion)
LABEL_5:
    -[SBLockElementViewProvider setBloomed:](self->_lockElement, "setBloomed:", -[SBLockScreenManager _shouldBloomForAnyReason](self, "_shouldBloomForAnyReason"));
}

- (BOOL)_shouldBloomForAnyReason
{
  void *v3;
  int v4;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInlinePasscodeLockVisible") & 1) != 0
    || -[SBLockScreenManager _isPasscodeVisible](self, "_isPasscodeVisible"))
  {
    v4 = -[BSCompoundAssertion isActive](self->_lockElementBloomSuppressionAssertions, "isActive") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)coverSheetViewController:(id)a3 setMesaUnlockingDisabled:(BOOL)a4 forReason:(id)a5
{
  -[SBLockScreenManager _setMesaUnlockingDisabled:forReason:](self, "_setMesaUnlockingDisabled:forReason:", a4, a5);
}

- (void)coverSheetViewController:(id)a3 startSpotlightInteractiveGestureTransactionForGesture:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "spotlightInteractiveGestureTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)SBApp;
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke;
    v13[3] = &unk_1E8EA3E78;
    v14 = v6;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2;
    v10[3] = &unk_1E8EA6660;
    v11 = v14;
    v12 = v5;
    objc_msgSend(v8, "beginInteractiveSpotlightTransientOverlayPresentationWithValidator:beginHandler:", v13, v10);

  }
}

uint64_t __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDragging");
}

void __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isDragging"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setSpotlightInteractiveGestureTransaction:", v3);
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_msgSend(v3, "completionBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3;
    v6[3] = &unk_1E8EA6638;
    v5 = v4;
    v7 = v5;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "setCompletionBlock:", v6);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v3, "noteGestureFinishedBeforeTransactionBegan");
  }

}

void __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setSpotlightInteractiveGestureTransaction:", 0);
    WeakRetained = v4;
  }

}

- (BOOL)coverSheetViewControllerHasSecureApp:(id)a3
{
  void *v3;
  char v4;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSecureApp");

  return v4;
}

- (BOOL)coverSheetViewControllerIsShowingSecureApp:(id)a3
{
  void *v3;
  char v4;

  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSecureApp");

  return v4;
}

- (BOOL)coverSheetViewControllerTraitsArbiterOrientationActuationEnabled:(id)a3
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet"));
}

- (BOOL)coverSheetViewControllerHasBeenDismissedSinceKeybagLock:(id)a3
{
  void *v3;
  char v4;

  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBeenDismissedSinceKeybagLock");

  return v4;
}

- (BOOL)coverSheetViewControllerShouldPreserveOrientationForExternalTransition:(id)a3
{
  return -[BSCompoundAssertion isActive](self->_lockScreenPresentationPendingAssertions, "isActive", a3);
}

- (id)averageColorForCurrentWallpaper
{
  void *v2;
  void *v3;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averageColorForVariant:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)averageColorForCurrentWallpaperInScreenRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "averageColorInRect:forVariant:", 0, x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)contrastForCurrentWallpaper
{
  void *v2;
  double v3;
  double v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contrastForVariant:", 0);
  v4 = v3;

  return v4;
}

- (id)newLegibilitySettingsProvider
{
  return -[SBWallpaperLegibilitySettingsProvider initWithVariant:]([SBWallpaperLegibilitySettingsProvider alloc], "initWithVariant:", 0);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SBLockScreenEnvironment idleTimerProvider](self->_lockScreenEnvironment, "idleTimerProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "coordinatorRequestedIdleTimerBehavior:", self);
  else
    +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", a4, a3, a5);
}

- (void)_wakeScreenForTapToWake
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "screenIsOn") & 1) == 0)
  {
    kdebug_trace();
    v7[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 17, v6);

  }
}

- (void)motionDetectionWakeController:(id)a3 motionDetectStateChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *motionDetectionIdleTimerAssertion;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[2];
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    if (!self->_motionDetectionIdleTimerAssertion)
    {
      SBLogBacklight();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Disabling idle timer because motion detected", v14, 2u);
      }

      +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists](SBIdleTimerGlobalCoordinator, "sharedInstanceIfExists");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acquireIdleTimerDisableAssertionForReason:", CFSTR("Motion-to-Wake"));
      v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      motionDetectionIdleTimerAssertion = self->_motionDetectionIdleTimerAssertion;
      self->_motionDetectionIdleTimerAssertion = v9;

    }
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "screenIsOn") & 1) == 0)
    {
      v15[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
      v15[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
      v16[0] = MEMORY[0x1E0C9AAB0];
      v16[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 38, v12);

    }
  }
  else
  {
    SBLogBacklight();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Ending idle timer disabling because no motion detected", v14, 2u);
    }

    -[BSInvalidatable invalidate](self->_motionDetectionIdleTimerAssertion, "invalidate");
    v11 = self->_motionDetectionIdleTimerAssertion;
    self->_motionDetectionIdleTimerAssertion = 0;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v9[16];

  if (self->_mouseButtonDownGesture != a3)
    return 1;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "screenIsOn");
  if (v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "_mouseButtonDownGesture: not receiving touch because screen is already on", v9, 2u);
    }

  }
  v4 = v6 ^ 1;

  return v4;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  SBSRemoteAlertHandle *v4;
  SBSRemoteAlertHandle *v5;
  _QWORD block[5];

  v4 = (SBSRemoteAlertHandle *)a3;
  v5 = v4;
  if (self->_alertLaunchFinish && self->_wakeToRemoteAlertHandle == v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SBLockScreenManager_remoteAlertHandleDidActivate___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __52__SBLockScreenManager_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)tapToWakeControllerDidRecognizePencilWakeGesture:(id)a3
{
  void *v4;
  void *v5;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationLauncher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchQuickNote");

  -[SBLockScreenManager _wakeScreenForTapToWake](self, "_wakeScreenForTapToWake");
}

- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsUnlockWithIntent:(int)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v6 = a3;
  if (self->_isUILocked)
  {
    if (a4 == 3)
    {
      if (-[SBLockScreenManager isLockScreenVisible](self, "isLockScreenVisible"))
      {
        a4 = 3;
      }
      else
      {
        SBLogLockScreenBiometricCoordinator();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Bio authentication request to dismiss denied because the lock-screen isn't currently visible -> swizzling unlock intent to authenticate only.", v11, 2u);
        }

        a4 = 2;
      }
    }
    -[SBFUserAuthenticationController createGracePeriodAssertionWithReason:](self->_userAuthController, "createGracePeriodAssertionWithReason:", CFSTR("Bio authentication attempt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activate");
    v7 = -[SBLockScreenManager _attemptUnlockWithPasscode:mesa:finishUIUnlock:](self, "_attemptUnlockWithPasscode:mesa:finishUIUnlock:", 0, 1, a4 == 3);
    objc_msgSend(v9, "invalidate");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsAuthenticationFeedback:(id)a4
{
  id v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  if (-[SBLockScreenManager isLockScreenVisible](self, "isLockScreenVisible"))
    v6 = !-[SBLockScreenManager _isPasscodeVisible](self, "_isPasscodeVisible");
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "biometricLockoutState");

  if (v6)
  {
    -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "phoneUnlockWithWatchEnabled")
      || !objc_msgSend(v9, "didDetectFaceRequirementsForPAU")
      || v8)
    {
      -[SBLockScreenManager _handleAuthenticationFeedback:](self, "_handleAuthenticationFeedback:", v5);
    }

  }
  return v6;
}

- (void)biometricAuthenticationCoordinator:(id)a3 handleIdentityMatchSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completePhoneAutoUnlockWithNotification:", !v4);

}

- (BOOL)biometricAuthenticationCoordinatorShouldWaitToInvalidateMatchingAssertion:(id)a3
{
  void *v3;
  char v4;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldCompletePhoneAutoUnlockWithNotification");

  return v4;
}

- (void)lostModeBiometricAuthenticationViewControllerDidSucceedAuthentication:(id)a3
{
  -[SBLockScreenManager _dismissLostModeBiometricAuthenticationTransientOverlay](self, "_dismissLostModeBiometricAuthenticationTransientOverlay", a3);
  -[SBLockScreenManager _dismissLockScreenForAuthenticationIfNecessary](self, "_dismissLockScreenForAuthenticationIfNecessary");
}

- (void)lostModeBiometricAuthenticationViewControllerDidTapEmergencyButton:(id)a3
{
  void *v4;
  id v5;

  -[SBLockScreenManager _relockUIForLostMode](self, "_relockUIForLostMode", a3);
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1BB48], "actionWithType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleAction:fromSender:", v4, 0);

}

- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 withReason:(id)a4 afterDelay:(double)a5
{
  id v8;
  id v9;
  void *v10;
  NSString *v11;
  NSString *delayedLockReason;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  SBLockScreenManager *v16;
  BOOL v17;

  v8 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__SBLockScreenManager__setSystemApertureProudLockElementVisible_withReason_afterDelay___block_invoke;
  v14[3] = &unk_1E8E9EE00;
  v15 = v8;
  v16 = self;
  v17 = a3;
  v9 = v8;
  v10 = (void *)MEMORY[0x1D17E5550](v14);
  v11 = (NSString *)objc_msgSend(v9, "copy");
  delayedLockReason = self->_delayedLockReason;
  self->_delayedLockReason = v11;

  v13 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  dispatch_after(v13, MEMORY[0x1E0C80D38], v10);

}

_QWORD *__87__SBLockScreenManager__setSystemApertureProudLockElementVisible_withReason_afterDelay___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *result;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288));
  result = *(_QWORD **)(a1 + 40);
  if (v2)
    return (_QWORD *)objc_msgSend(result, "_setSystemApertureProudLockElementVisible:withReason:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  if (!result[36])
  {
    SBLogSystemApertureLockElement();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "The dismiss reason has changed from reason:%{public}@ to nil", (uint8_t *)&v6, 0xCu);
    }

    return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "_setSystemApertureProudLockElementVisible:withReason:", objc_msgSend(*(id *)(a1 + 40), "_shouldBeShowingLockElement"), CFSTR("Collision cleanup"));
  }
  return result;
}

- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 withReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager _setSystemApertureProudLockElementVisible:backlightState:withReason:](self, "_setSystemApertureProudLockElementVisible:backlightState:withReason:", v4, objc_msgSend(v7, "backlightState"), v6);

}

- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 backlightState:(int64_t)a4 withReason:(id)a5
{
  _BOOL4 v6;
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL4 v10;
  int v11;
  NSString *delayedLockReason;
  SBLockElementViewProvider *lockElement;
  SBLockElementViewProvider *v14;
  SBLockElementViewProvider *v15;
  void *v16;
  SAInvalidatable *v17;
  SAInvalidatable *proudLockAssertion;
  NSString *v19;
  SAInvalidatable *v20;
  id v21;

  v6 = a3;
  v21 = a5;
  v8 = +[SBLockElementViewProvider deviceSupportsElement](SBLockElementViewProvider, "deviceSupportsElement");
  v9 = -[SBLockScreenManager _requiresEmptyLockElementForBacklightState:](self, "_requiresEmptyLockElementForBacklightState:", a4);
  v10 = -[SBLockScreenManager _shouldHideLockForElementSuppressionAssertion](self, "_shouldHideLockForElementSuppressionAssertion");
  v11 = -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet");
  if (v6)
  {
    if (v8 && v11 | v9 && !v10)
    {
      delayedLockReason = self->_delayedLockReason;
      self->_delayedLockReason = 0;

      if (!self->_proudLockAssertion)
      {
        lockElement = self->_lockElement;
        if (!lockElement)
        {
          v14 = objc_alloc_init(SBLockElementViewProvider);
          v15 = self->_lockElement;
          self->_lockElement = v14;

          lockElement = self->_lockElement;
        }
        -[SBLockElementViewProvider setEmpty:](lockElement, "setEmpty:", v9);
        -[SBLockElementViewProvider setAuthenticated:](self->_lockElement, "setAuthenticated:", -[SBFUserAuthenticationController isAuthenticatedCached](self->_userAuthController, "isAuthenticatedCached"));
        objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "registerElement:", self->_lockElement);
        v17 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
        proudLockAssertion = self->_proudLockAssertion;
        self->_proudLockAssertion = v17;

        -[SBLockScreenManager _updateBloomIfNeeded](self, "_updateBloomIfNeeded");
      }
    }
  }
  else
  {
    v19 = self->_delayedLockReason;
    self->_delayedLockReason = 0;

    -[SAInvalidatable invalidateWithReason:](self->_proudLockAssertion, "invalidateWithReason:", v21);
    v20 = self->_proudLockAssertion;
    self->_proudLockAssertion = 0;

  }
}

- (void)_cleanupSystemApertureLockElementIfNecessaryWithReason:(id)a3
{
  -[SBLockScreenManager _cleanupSystemApertureLockElementIgnoringDelays:reason:](self, "_cleanupSystemApertureLockElementIgnoringDelays:reason:", 0, a3);
}

- (void)_cleanupSystemApertureLockElementIgnoringDelays:(BOOL)a3 reason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_proudLockAssertion
    && !-[SBLockScreenManager _shouldBeShowingLockElement](self, "_shouldBeShowingLockElement"))
  {
    if (v4)
    {
      SBLogSystemApertureLockElement();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager dismissed lock element without delay with reason:%{public}@", (uint8_t *)&v9, 0xCu);
      }

      goto LABEL_11;
    }
    if (!self->_delayedLockReason)
    {
LABEL_11:
      self->_ignoringDelayDismissalPending = 0;
      -[SBLockScreenManager _setSystemApertureProudLockElementVisible:withReason:](self, "_setSystemApertureProudLockElementVisible:withReason:", 0, v6);
      goto LABEL_12;
    }
    SBLogSystemApertureLockElement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager tried to dismiss aperture forReason:%{public}@ but in delay", (uint8_t *)&v9, 0xCu);
    }

  }
LABEL_12:

}

- (void)_showSystemApertureProudLockElementIfSupportedWithReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SBLockScreenManager _shouldBeShowingLockElement](self, "_shouldBeShowingLockElement"))
    -[SBLockScreenManager _setSystemApertureProudLockElementVisible:withReason:](self, "_setSystemApertureProudLockElementVisible:withReason:", 1, v4);

}

- (void)_showSystemApertureProudLockElementForBacklightState:(int64_t)a3 WithReason:(id)a4
{
  id v6;

  v6 = a4;
  if (-[SBLockScreenManager _shouldBeShowingLockElementForBacklightState:](self, "_shouldBeShowingLockElementForBacklightState:", a3))
  {
    -[SBLockScreenManager _setSystemApertureProudLockElementVisible:backlightState:withReason:](self, "_setSystemApertureProudLockElementVisible:backlightState:withReason:", 1, a3, v6);
  }

}

- (BOOL)_shouldBeShowingLockElement
{
  void *v3;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBLockScreenManager _shouldBeShowingLockElementForBacklightState:](self, "_shouldBeShowingLockElementForBacklightState:", objc_msgSend(v3, "backlightState"));

  return (char)self;
}

- (BOOL)_shouldBeShowingLockElementForBacklightState:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive");
  v6 = v5;
  v7 = self->_isUILocked || v5;
  v8 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated");
  v9 = -[SBLockScreenManager _requiresEmptyLockElementForBacklightState:](self, "_requiresEmptyLockElementForBacklightState:", a3);
  v10 = v7 & (v8 ^ 1 | v9);
  if (v10 == 1)
  {
    v11 = v9;
    SBLogSystemApertureLockElement();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109632;
      v14[1] = v6;
      v15 = 1024;
      v16 = v8;
      v17 = 1024;
      v18 = v11;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] should show lock element. lockScreenActive: %{BOOL}u, authed: %{BOOL}u, empty: %{BOOL}u", (uint8_t *)v14, 0x14u);
    }

  }
  return v10;
}

- (BOOL)_requiresEmptyLockElementForBacklightState:(int64_t)a3
{
  int v4;

  v4 = -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet") ^ 1;
  if (a3 == 3)
    return v4;
  else
    return 0;
}

- (BOOL)_shouldHideLockForElementSuppressionAssertion
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ambientTransientOverlayIsShowingPasscode");

  LOBYTE(v3) = v6 | -[SBLockScreenManager isPasscodeEntryTransientOverlayVisible](self, "isPasscodeEntryTransientOverlayVisible");
  return -[SBLockScreenManager _hasValidLockElementSuppressionAssertion](self, "_hasValidLockElementSuppressionAssertion") & (v3 ^ 1);
}

- (BOOL)_hasValidLockElementSuppressionAssertion
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_lockElementSuppressionAssertions;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isValid", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)homeButtonShowPasscodeRecognizerRequestsPasscodeUIToBeShown:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_isScreenOn
    && -[SBLockScreenManager isUILocked](self, "isUILocked")
    && (-[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated") & 1) == 0
    && -[SBLockScreenManager isLockScreenVisible](self, "isLockScreenVisible")
    && !-[SBLockScreenManager _isPasscodeVisible](self, "_isPasscodeVisible"))
  {
    if (-[SBLockScreenManager _shouldEmulateInterstitialPresentationForAccessibility:](self, "_shouldEmulateInterstitialPresentationForAccessibility:", 1))
    {
      -[SBLockScreenManager _emulateInterstitialPasscodePresentationForAccessibility:](self, "_emulateInterstitialPasscodePresentationForAccessibility:", 1);
    }
    -[SBLockScreenManager _setPasscodeVisible:animated:](self, "_setPasscodeVisible:animated:", 1, 1);
  }
  -[SBLockScreenManager _setHomeButtonShowPasscodeRecognizer:](self, "_setHomeButtonShowPasscodeRecognizer:", 0);

}

- (void)homeButtonShowPasscodeRecognizerDidFailToRecognize:(id)a3
{
  -[SBLockScreenManager _setHomeButtonShowPasscodeRecognizer:](self, "_setHomeButtonShowPasscodeRecognizer:", 0);
}

- (void)_setIdleTimerCoordinator:(id)a3
{
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", a3);
}

- (void)_handleAuthenticationFeedback:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  UINotificationFeedbackGenerator *authenticationFeedbackGenerator;
  _QWORD v15[5];
  void (**v16)(_QWORD);
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  SBLockScreenManager *v20;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke;
  v18[3] = &unk_1E8E9E820;
  v6 = v4;
  v19 = v6;
  v20 = self;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v18);
  if (objc_msgSend(v6, "vibrate"))
  {
    v8 = objc_msgSend(v6, "result");
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasPearlSupport");
    v11 = v10;
    if (v8)
    {

      v12 = 1001;
      if (v11)
        v12 = 1015;
      goto LABEL_12;
    }
    if (v10)
    {
      v13 = _AXSPearlAuthenticationHapticsEnabled();

      if (v13)
      {
        v12 = 1014;
LABEL_12:
        authenticationFeedbackGenerator = self->_authenticationFeedbackGenerator;
        v15[0] = v5;
        v15[1] = 3221225472;
        v15[2] = __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_2;
        v15[3] = &unk_1E8EAAD08;
        v15[4] = self;
        v17 = v12;
        v16 = v7;
        -[UINotificationFeedbackGenerator activateWithCompletionBlock:](authenticationFeedbackGenerator, "activateWithCompletionBlock:", v15);

        goto LABEL_13;
      }
    }
    else
    {

    }
    v12 = 1000;
    goto LABEL_12;
  }
  v7[2](v7);
LABEL_13:

}

void __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "jiggleLock"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "lockController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "jiggleLockIcon");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "shake");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "showPasscode"))
  {
    +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "isLockScreenVisible"))
    {
      if ((objc_msgSend(v5, "isVisible") & 1) == 0)
      {
        v3 = *(void **)(a1 + 40);
        +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setPasscodeVisible:animated:", 1, objc_msgSend(v4, "screenIsOn"));

      }
    }

  }
}

void __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  dispatch_time_t v11;
  dispatch_time_t v12;
  _QWORD v13[6];
  char v14;

  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockJiggleHapticDelay");
  v6 = v5;
  objc_msgSend(v4, "lockJiggleAnimationDelay");
  v8 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_3;
  v13[3] = &unk_1E8EA5AD8;
  v14 = a2;
  v9 = *(_QWORD *)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v13);
  if ((BSFloatIsZero() & 1) != 0)
  {
    v10[2](v10);
  }
  else
  {
    v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_after(v11, MEMORY[0x1E0C80D38], v10);
  }
  if ((BSFloatIsZero() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    dispatch_after(v12, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
  }

}

uint64_t __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "_privateNotificationOccurred:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "deactivate");
}

- (void)_setWalletPreArmDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  NSMutableSet *mesaWalletPreArmDisabledReasons;
  NSMutableSet *v10;
  NSMutableSet *v11;
  NSObject *p_super;
  NSMutableSet *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSMutableDictionary *mesaWalletPreArmDisabledAssertions;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  _DWORD v25[7];

  v4 = a3;
  *(_QWORD *)&v25[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 1883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v25[0] = v4;
    LOWORD(v25[1]) = 2114;
    *(_QWORD *)((char *)&v25[1] + 2) = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager _setWalletPreArmDisabled:%{BOOL}u forReason:%{public}@]", buf, 0x12u);
  }

  mesaWalletPreArmDisabledReasons = self->_mesaWalletPreArmDisabledReasons;
  if (v4)
  {
    if (!mesaWalletPreArmDisabledReasons)
    {
      v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v11 = self->_mesaWalletPreArmDisabledReasons;
      self->_mesaWalletPreArmDisabledReasons = v10;

      mesaWalletPreArmDisabledReasons = self->_mesaWalletPreArmDisabledReasons;
    }
    if (-[NSMutableSet containsObject:](mesaWalletPreArmDisabledReasons, "containsObject:", v7))
    {
      SBLogCommon();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v25 = v7;
        _os_log_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Bailing early as we already acquired a wallet pre-arm disabled assertion for reason: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      -[NSMutableSet addObject:](self->_mesaWalletPreArmDisabledReasons, "addObject:", v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_mesaWalletPreArmDisabledAssertions, "objectForKeyedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_20;
      SBLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v25 = v7;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Acquiring a wallet pre-arm disable assertion for reason: %{public}@", buf, 0xCu);
      }

      -[SBLockScreenBiometricAuthenticationCoordinator acquireDisableWalletPreArmAssertionForReason:](self->_biometricAuthenticationCoordinator, "acquireDisableWalletPreArmAssertionForReason:", v7);
      p_super = objc_claimAutoreleasedReturnValue();
      if (p_super)
      {
        if (-[NSMutableSet containsObject:](self->_mesaWalletPreArmDisabledReasons, "containsObject:", v7))
        {
          mesaWalletPreArmDisabledAssertions = self->_mesaWalletPreArmDisabledAssertions;
          if (!mesaWalletPreArmDisabledAssertions)
          {
            v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v20 = self->_mesaWalletPreArmDisabledAssertions;
            self->_mesaWalletPreArmDisabledAssertions = v19;

            mesaWalletPreArmDisabledAssertions = self->_mesaWalletPreArmDisabledAssertions;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](mesaWalletPreArmDisabledAssertions, "setObject:forKeyedSubscript:", p_super, v7);
          SBLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v25 = v7;
            _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Added the wallet pre-arm disable assertion for reason: %{public}@", buf, 0xCu);
          }

        }
        else
        {
          SBLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v25 = v7;
            _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Due to a re-entrant call that re-enabled wallet pre-arm, invalidating a pre-arm disable assertion with reason: %{public}@", buf, 0xCu);
          }

          -[NSObject invalidate](p_super, "invalidate");
        }
      }
    }
    goto LABEL_18;
  }
  if (mesaWalletPreArmDisabledReasons)
  {
    -[NSMutableSet removeObject:](mesaWalletPreArmDisabledReasons, "removeObject:", v7);
    if (!-[NSMutableSet count](self->_mesaWalletPreArmDisabledReasons, "count"))
    {
      v13 = self->_mesaWalletPreArmDisabledReasons;
      self->_mesaWalletPreArmDisabledReasons = 0;

    }
  }
  SBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v25 = v7;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Removing a wallet pre-arm disable assertion for reason: %{public}@", buf, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mesaWalletPreArmDisabledAssertions, "objectForKeyedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  -[NSMutableDictionary removeObjectForKey:](self->_mesaWalletPreArmDisabledAssertions, "removeObjectForKey:", v7);
  if (!-[NSMutableDictionary count](self->_mesaWalletPreArmDisabledAssertions, "count"))
  {
    p_super = &self->_mesaWalletPreArmDisabledAssertions->super.super;
    self->_mesaWalletPreArmDisabledAssertions = 0;
LABEL_18:

  }
LABEL_20:

}

- (void)_setMesaCoordinatorDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mesaCoordinatorDisabledAssertions;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v7 = a4;
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 1939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v7 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mesaCoordinatorDisabledAssertions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {

    if (!v9)
    {
      if (!self->_mesaCoordinatorDisabledAssertions)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        mesaCoordinatorDisabledAssertions = self->_mesaCoordinatorDisabledAssertions;
        self->_mesaCoordinatorDisabledAssertions = v10;

      }
      -[SBLockScreenBiometricAuthenticationCoordinator acquireDisableCoordinatorAssertionForReason:](self->_biometricAuthenticationCoordinator, "acquireDisableCoordinatorAssertionForReason:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mesaCoordinatorDisabledAssertions, "setObject:forKeyedSubscript:", v12, v14);
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v8, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->_mesaCoordinatorDisabledAssertions, "removeObjectForKey:", v14);
    if (!-[NSMutableDictionary count](self->_mesaCoordinatorDisabledAssertions, "count"))
    {
      v12 = self->_mesaCoordinatorDisabledAssertions;
      self->_mesaCoordinatorDisabledAssertions = 0;
LABEL_11:

    }
  }

}

- (void)_setMesaAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPearlSupport");

  if ((v7 & 1) == 0)
    -[SBLockScreenManager setBiometricAutoUnlockingDisabled:forReason:](self, "setBiometricAutoUnlockingDisabled:forReason:", v4, v8);

}

- (void)_activateLockScreenAnimated:(BOOL)a3 animationProvider:(id)a4 automatically:(BOOL)a5 inScreenOffMode:(BOOL)a6 dismissNotificationCenter:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  BOOL v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  const __CFString *v34;
  _QWORD v35[2];

  v8 = a6;
  v9 = a5;
  v10 = a3;
  v35[1] = *MEMORY[0x1E0C80C00];
  v12 = a8;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = CFSTR("Animated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("SBLockScreenUIWillLockNotification"), self, v15);

  +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "incomingCallExists");
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (!v18 || v9)
    {
      if (v20)
      {
        *(_DWORD *)buf = 67109632;
        v29 = objc_msgSend(v17, "incomingCallExists");
        v30 = 1024;
        v31 = v9;
        v32 = 1024;
        v33 = v10;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "[[SBTelephonyManager sharedTelephonyManager] incomingCallExists] %d autoLock %d animate %d", buf, 0x14u);
      }

      if (!v8)
        goto LABEL_18;
    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "Disconnecting call", buf, 2u);
      }

      objc_msgSend(v17, "disconnectIncomingCall");
      if (!v8)
      {
LABEL_18:
        -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "activateMainPageWithCompletion:", 0);

        +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __136__SBLockScreenManager__activateLockScreenAnimated_animationProvider_automatically_inScreenOffMode_dismissNotificationCenter_completion___block_invoke;
        v25[3] = &unk_1E8EA8380;
        v25[4] = self;
        v27 = v10;
        v26 = v12;
        objc_msgSend(v24, "setCoverSheetPresented:animated:withCompletion:", 1, v10, v25);

        goto LABEL_19;
      }
    }
  }
  else
  {
    SBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "Telephony controller not checked in", buf, 2u);
    }

    if (!v8)
      goto LABEL_18;
  }
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
    -[SBLockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:animated:](self->_lockScreenOrientationManager, "updateInterfaceOrientationWithRequestedOrientation:animated:", 0, 0);
  -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInScreenOffMode:", 1);

  if (v12)
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
LABEL_19:
  -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode");

}

uint64_t __136__SBLockScreenManager__activateLockScreenAnimated_animationProvider_automatically_inScreenOffMode_dismissNotificationCenter_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "updateInterfaceOrientationWithRequestedOrientation:animated:", 0, *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)_shouldDisconnectCallWhenLockingForActiveAudioRoute
{
  char v2;
  void *v3;
  void *v4;

  if (+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
  {
    return 0;
  }
  +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAudioRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v2 = objc_msgSend(v4, "isEqual:", CFSTR("Receiver"));
  else
    v2 = 1;

  return v2;
}

- (void)_disconnectActiveCallIfNeededFromSource:(int)a3
{
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = +[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported");
  if (a3 == 3 && !v5)
  {
    +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "inFaceTime"))
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Terminating video call due to smart cover closure.", buf, 2u);
      }

      objc_msgSend(v6, "endFaceTime");
    }
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "inCall")
      && -[SBLockScreenManager _shouldDisconnectCallWhenLockingForActiveAudioRoute](self, "_shouldDisconnectCallWhenLockingForActiveAudioRoute"))
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Terminating telephony call due to smart cover closure.", v11, 2u);
      }

      +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "disconnectDisplayedCall");

    }
  }
}

- (void)_relockUIForButtonlikeSource:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  SBFUserAuthenticationController *userAuthController;
  void *v8;

  v3 = *(_QWORD *)&a3;
  if (-[SBLockScreenManager isPasscodeEntryTransientOverlayVisible](self, "isPasscodeEntryTransientOverlayVisible"))
  {
    -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 0, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SBLockScreenUIRelockedNotification"), self, 0);

    if (!+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))-[SBLockScreenManager _disconnectActiveCallIfNeededFromSource:](self, "_disconnectActiveCallIfNeededFromSource:", v3);
    -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInScreenOffMode:", 1);

    if (-[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet"))
    {
      userAuthController = self->_userAuthController;
      NSStringFromLockSource();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFUserAuthenticationController revokeAuthenticationIfNecessaryForPublicReason:](userAuthController, "revokeAuthenticationIfNecessaryForPublicReason:", v8);

    }
    if (self->_isInLostMode)
      -[SBLockScreenManager enableLostModePlugin](self, "enableLostModePlugin");
  }
}

- (void)_clearAuthenticationLockAssertion
{
  SBFAuthenticationAssertion *sustainAuthenticationWhileUIUnlockedAssertion;
  SBFAuthenticationAssertion *v4;

  sustainAuthenticationWhileUIUnlockedAssertion = self->_sustainAuthenticationWhileUIUnlockedAssertion;
  if (sustainAuthenticationWhileUIUnlockedAssertion)
  {
    -[SBFAuthenticationAssertion invalidate](sustainAuthenticationWhileUIUnlockedAssertion, "invalidate");
    v4 = self->_sustainAuthenticationWhileUIUnlockedAssertion;
    self->_sustainAuthenticationWhileUIUnlockedAssertion = 0;

  }
}

- (void)_createAuthenticationAssertion
{
  SBFAuthenticationAssertion *v3;
  SBFAuthenticationAssertion *sustainAuthenticationWhileUIUnlockedAssertion;

  if (!self->_sustainAuthenticationWhileUIUnlockedAssertion && self->_allowDisablePasscodeLockAssertion)
  {
    -[SBFUserAuthenticationController createKeybagUnlockAssertionWithReason:](self->_userAuthController, "createKeybagUnlockAssertionWithReason:", CFSTR("UI unlocked"));
    v3 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
    sustainAuthenticationWhileUIUnlockedAssertion = self->_sustainAuthenticationWhileUIUnlockedAssertion;
    self->_sustainAuthenticationWhileUIUnlockedAssertion = v3;

    -[SBFAuthenticationAssertion activate](self->_sustainAuthenticationWhileUIUnlockedAssertion, "activate");
  }
}

- (void)_setUILocked:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;

  v3 = a3;
  if (!self->_allowUILockUnlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 2105, CFSTR("Attempted to toggle lock state when we don't allow locking/unlocking."));

  }
  -[SBLockScreenManager _reallySetUILocked:](self, "_reallySetUILocked:", v3);
}

- (void)_reallySetUILocked:(BOOL)a3
{
  SBFUserAuthenticationController *userAuthController;
  NSObject *v7;
  _BOOL4 isUILocked;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  userAuthController = self->_userAuthController;
  if (userAuthController
    && !a3
    && (-[SBFUserAuthenticationController isAuthenticated](userAuthController, "isAuthenticated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 2111, CFSTR("Attempt made to UI-unlock while not authenticated"));

  }
  self->_isUILocked = a3;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    isUILocked = self->_isUILocked;
    v13[0] = 67109120;
    v13[1] = isUILocked;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "UILocked: %d", (uint8_t *)v13, 8u);
  }

  objc_msgSend((id)SBApp, "HIDUISensorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPocketTouchesExpected:", self->_isUILocked);

  +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFastDormancySuspended:", !self->_isUILocked);

  -[SBLockScreenManager _postLockCompletedNotification:](self, "_postLockCompletedNotification:", self->_isUILocked);
  if (self->_isUILocked)
  {
    -[SBLockScreenManager _setMesaCoordinatorDisabled:forReason:](self, "_setMesaCoordinatorDisabled:forReason:", 0, CFSTR("UI Unlocked"));
  }
  else
  {
    -[SBLockScreenBiometricAuthenticationCoordinator setAuthenticated:](self->_biometricAuthenticationCoordinator, "setAuthenticated:", -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated"));
    -[SBLockScreenManager _setMesaCoordinatorDisabled:forReason:](self, "_setMesaCoordinatorDisabled:forReason:", 1, CFSTR("UI Unlocked"));
    -[SBLockScreenManager _createAuthenticationAssertion](self, "_createAuthenticationAssertion");
    if (-[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet"))
      SBUICurrentPasscodeStyleForUser();
    ADClientSetValueForScalarKey();
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInUILockedMode:", self->_isUILocked);

}

- (void)_lockStateObservers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSHashTable copy](self->_lockStateObservers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "lockStateProvider:didUpdateIsUILocked:", self, 1, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_unlockStateObservers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSHashTable copy](self->_lockStateObservers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "lockStateProvider:didUpdateIsUILocked:", self, 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_lockUI
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBLockScreenManager isUILocked](self, "isUILocked") && self->_uiHasBeenLockedOnce)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "layoutStateApplicationSceneHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 2)
    {
      +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", CFSTR("SBSuppressKeyboardForUILock"), 0, v10);

    }
    -[SBLockScreenManager _setUILocked:](self, "_setUILocked:", 1);
    self->_uiHasBeenLockedOnce = 1;
    -[SBLockScreenManager _sendUILockStateChangedNotification](self, "_sendUILockStateChangedNotification");
    -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareForUILock");

    +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasAnyLockState");

    if (v13)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pipCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setPictureInPictureWindowsHidden:withReason:", 1, CFSTR("SBLockScreenPictureInPictureHiddenReason"));
    }
    -[SBLockScreenManager _lockStateObservers](self, "_lockStateObservers");
    v6 = 1;
  }

  return v6;
}

- (void)_sendUILockStateChangedNotification
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  char v11;
  char v12;

  if (-[SBLockScreenManager isUILocked](self, "isUILocked"))
  {
    -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldDisableALS");

    if (v4)
      BKSHIDServicesAmbientLightSensorDisableAutoBrightness();
  }
  v12 = 1;
  SBGetAggregatedLockStatus(&v12, 0);
  if (_sendUILockStateChangedNotification_token != -1
    || (notify_register_check((const char *)*MEMORY[0x1E0DAC070], &_sendUILockStateChangedNotification_token),
        _sendUILockStateChangedNotification_token != -1))
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SBLockScreenManager__sendUILockStateChangedNotification__block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v11 = v12;
    dispatch_async(v5, block);

  }
  v6 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBLockScreenManager isUILocked](self, "isUILocked"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0DAC420]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC318], 0, v8);

}

uint64_t __58__SBLockScreenManager__sendUILockStateChangedNotification__block_invoke(uint64_t a1)
{
  notify_set_state(_sendUILockStateChangedNotification_token, *(unsigned __int8 *)(a1 + 32));
  return notify_post((const char *)*MEMORY[0x1E0DAC070]);
}

- (BOOL)_canAttemptRealUIUnlockIgnoringBacklightNonsenseWithReason:(id *)a3
{
  __CFString *v5;
  BOOL result;

  if ((-[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked") & 1) != 0)
  {
    v5 = CFSTR("Device is blocked");
  }
  else
  {
    if (self->_allowUILockUnlock)
      return 1;
    v5 = CFSTR("Global 'allow UIUnlock' flag is set to NO");
  }
  result = 0;
  *a3 = v5;
  return result;
}

- (void)requestUserAttentionScreenWakeFromSource:(int)a3 reason:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v4 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  NSStringFromUnlockSource();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)SBApp, "caseIsEnabledAndLatched"))
  {
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject backlightState](v8, "backlightState");
    if (v9 >= 3)
    {
      if (v9 - 3 >= 2)
        goto LABEL_17;
      v14 = -[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive");
      SBLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v15)
        {
          SBBacklightStateDescription(v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v19 = v7;
          v20 = 2114;
          v21 = v6;
          v22 = 2114;
          v23 = v16;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) state:%{public}@ unlockUI", buf, 0x20u);

        }
        v26 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
        v27[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v12 = objc_claimAutoreleasedReturnValue();
        -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", v4, v12);
        goto LABEL_16;
      }
      if (!v15)
      {
LABEL_16:

        goto LABEL_17;
      }
      SBBacklightStateDescription(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SBSBacklightChangeSourceDescription(-[NSObject lastBacklightChangeSource](v8, "lastBacklightChangeSource"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v7;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) state:%{public}@ -- ignoring because screen is off, but UILocked is zero. Last known backlight change source:%{public}@.", buf, 0x2Au);

    }
    else
    {
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        SBBacklightStateDescription(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v7;
        v20 = 2114;
        v21 = v6;
        v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) state:%{public}@ resetIdleTimer", buf, 0x20u);

      }
      +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UserAttentionScreenWake|%@|"), v7, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject resetIdleTimerForReason:](v12, "resetIdleTimerForReason:", v13);
    }

    goto LABEL_16;
  }
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) -- ignoring because smart cover is closed", buf, 0x16u);
  }
LABEL_17:

}

- (BOOL)_shouldReactivateInCallWakingTheDisplay:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (!+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported")&& v3)
  {
    if (objc_msgSend(v4, "inCall"))
      v5 = objc_msgSend(v4, "isEndpointOnCurrentDevice");
    else
      v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldWakeToInCallForUnlockSource:(int)a3 wakingTheDisplay:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v6 = +[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported");
  if (v6)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inCallPresentationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "supportsBecomingVisibleWhenUnlockingFromSource:wakingDisplay:", v5, v4);
    LOBYTE(v6) = v9;
  }
  return v6;
}

- (BOOL)_shouldWakeToOtherContentForUnlockSource:(int)a3 wakingTheDisplay:(BOOL)a4 stopAfterWakeTo:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  _BOOL4 v9;
  char v10;
  char v11;
  void *v12;

  v5 = a5;
  v6 = a4;
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager", *(_QWORD *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBLockScreenManager _shouldReactivateInCallWakingTheDisplay:](self, "_shouldReactivateInCallWakingTheDisplay:", v6);
  if ((objc_msgSend(v8, "incomingCallExists") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_msgSend(v8, "outgoingCallExists");
    v10 = 0;
    if ((v6 || v5) && !v9 && (v11 & 1) == 0)
    {
      +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "hasWakeDestination");

    }
  }

  return v10;
}

- (BOOL)unlockUIFromSource:(int)a3 withOptions:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unsigned int (**v26)(void);
  SBSpuriousScreenUndimmingAssertion *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  SBSpuriousScreenUndimmingAssertion *v35;
  void *v36;
  void *v37;
  id v38;
  dispatch_time_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id alertLaunchFinish;
  void *v46;
  void *v47;
  SBSRemoteAlertHandle *v48;
  SBSRemoteAlertHandle *wakeToRemoteAlertHandle;
  dispatch_time_t v50;
  NSObject *v51;
  NSObject *v52;
  int v53;
  _BOOL8 v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  SBLockScreenUnlockRequest *unlockRequest;
  void *v71;
  char v72;
  SBFUserAuthenticationController **p_userAuthController;
  int v74;
  char v75;
  int v76;
  int v77;
  NSObject *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  void *v83;
  BOOL v84;
  void *v85;
  BOOL v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  int v92;
  int v93;
  unsigned int v94;
  uint64_t v95;
  unsigned __int8 v96;
  void *v97;
  int v98;
  unsigned int v99;
  void *v100;
  int v101;
  void *v102;
  os_log_t oslog;
  id v105;
  _QWORD v106[5];
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  int v112;
  uint8_t v113[16];
  _QWORD block[4];
  id v115;
  _QWORD v116[4];
  unsigned int (**v117)(void);
  _QWORD v118[4];
  id v119;
  int v120;
  _QWORD v121[4];
  SBSpuriousScreenUndimmingAssertion *v122;
  id v123;
  _BYTE *v124;
  id v125;
  int v126;
  id location;
  _QWORD v128[5];
  int v129;
  char v130;
  char v131;
  _BYTE buf[24];
  int v133;
  __int16 v134;
  void *v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v105 = a4;
  if (self->_allowUILockUnlock)
  {
    -[SBLockScreenEnvironment screenWakeAnimationTarget](self->_lockScreenEnvironment, "screenWakeAnimationTarget");
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v102, "screenIsOn");
    if (+[SBBacklightPlatformProvider deviceSupportsAlwaysOn](SBBacklightPlatformProvider, "deviceSupportsAlwaysOn"))
    {
      v96 = -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet") ^ 1;
    }
    else
    {
      v96 = 0;
    }
    objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsSuppressingWakeToKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsOnlyWakeToActionsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsNoBacklightChangesKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsStartFadeInAnimation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v13, "BOOLValue");

    v94 = objc_msgSend(v102, "shouldTurnOnScreenForBacklightSource:", SBUIConvertUnlockSourceToBacklightChangeSource()) & (v11 ^ 1);
    v14 = (v101 ^ 1) & v98 & v94;
    v15 = -[SBLockScreenManager _shouldReactivateInCallWakingTheDisplay:](self, "_shouldReactivateInCallWakingTheDisplay:", v14);
    v16 = -[SBLockScreenManager _shouldWakeToOtherContentForUnlockSource:wakingTheDisplay:stopAfterWakeTo:](self, "_shouldWakeToOtherContentForUnlockSource:wakingTheDisplay:stopAfterWakeTo:", a3, v14, v99);
    if ((objc_msgSend(v100, "isSleepAnimationInProgress") & 1) != 0)
      v93 = 1;
    else
      v93 = objc_msgSend(v100, "isWakeAnimationInProgress");
    objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsRequestedOrientationKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v17, "unsignedIntegerValue");

    if ((v101 & 1) == 0
      && -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet"))
    {
      -[SBLockScreenManager _setSystemApertureProudLockElementVisible:withReason:](self, "_setSystemApertureProudLockElementVisible:withReason:", 1, CFSTR("Screen On"));
    }
    -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "respondToUIUnlockFromSource:", a3);

    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromUnlockSource();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v105);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      BSDeviceOrientationDescription();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 1024;
      v133 = v101 ^ 1;
      v134 = 2114;
      v135 = v22;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "unlockUIFromSource:%{public}@ options:(%{public}@) screenWasOff:%{BOOL}u requestedOrientation:%{public}@", buf, 0x26u);

    }
    if (v15)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "inCallPresentationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "reactivateInCallForReason:", 2);

    }
    v25 = MEMORY[0x1E0C809B0];
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke;
    v128[3] = &unk_1E8EC12E0;
    v130 = v8 | v96;
    v128[4] = self;
    v129 = a3;
    v131 = v14;
    v26 = (unsigned int (**)(void))MEMORY[0x1D17E5550](v128);
    if (v26[2]())
    {
      if (a3 == 32)
        v27 = -[SBSpuriousScreenUndimmingAssertion initWithIdentifier:]([SBSpuriousScreenUndimmingAssertion alloc], "initWithIdentifier:", CFSTR("SBLockScreenManagerWakeToInactivePhone"));
      else
        v27 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v133) = 0;
      objc_initWeak(&location, self);
      v121[0] = v25;
      v121[1] = 3221225472;
      v121[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2;
      v121[3] = &unk_1E8EC1308;
      v124 = buf;
      v35 = v27;
      v122 = v35;
      objc_copyWeak(&v125, &location);
      v123 = v105;
      v126 = a3;
      v36 = (void *)MEMORY[0x1D17E5550](v121);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v25;
      v118[1] = 3221225472;
      v118[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_3;
      v118[3] = &unk_1E8EC1370;
      v120 = a3;
      v38 = v36;
      v119 = v38;
      v116[0] = v25;
      v116[1] = 3221225472;
      v116[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_7;
      v116[3] = &unk_1E8E9ECF8;
      v117 = v26;
      objc_msgSend(v37, "requestTransitionWithOptions:builder:validator:", 0, v118, v116);

      v39 = dispatch_time(0, 300000000);
      block[0] = v25;
      block[1] = 3221225472;
      block[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_8;
      block[3] = &unk_1E8E9E8D0;
      v40 = v38;
      v115 = v40;
      dispatch_after(v39, MEMORY[0x1E0C80D38], block);
      SBLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_DEFAULT, "Delaying unlockUIFromSource call to wake to InCall.", v113, 2u);
      }

      objc_destroyWeak(&v125);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_73;
    }
    if (!v16 || ((v8 | v96) & 1) != 0)
    {
LABEL_42:
      if (v99)
      {
        SBLogCommon();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_DEFAULT, "Aborting unlockUIFromSource after completing wake actions, as requested", buf, 2u);
        }

        -[NSObject updateWakeEffectsForWake:](oslog, "updateWakeEffectsForWake:", 1);
        goto LABEL_73;
      }
      v53 = -[SBFLockOutStatusProvider isLockedOut](self->_lockOutController, "isLockedOut");
      v54 = -[SBLockScreenAutoUnlockAggregateRule shouldAutoUnlockForSource:](self->_autoUnlockRuleAggregator, "shouldAutoUnlockForSource:", a3);
      v55 = v54 & ~v53;
      if ((v98 & v94) != 1)
      {
LABEL_53:
        if (((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) | v98 ^ 1 | v101 | v93) & 1) == 0)
          -[SBLockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:animated:](self->_lockScreenOrientationManager, "updateInterfaceOrientationWithRequestedOrientation:animated:", v95, 0);
        if ((v55 & 1) != 0)
        {
          v57 = 1;
        }
        else
        {
          objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsNoPasscodeAnimationKey"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "BOOLValue");

          v57 = v59 ^ 1u;
        }
        if (a3 == 15)
        {
          -[SBLockScreenEnvironment buttonObserver](self->_lockScreenEnvironment, "buttonObserver");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "noteMenuButtonDown");

          objc_msgSend((id)SBApp, "homeHardwareButton");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v106[0] = v25;
          v106[1] = 3221225472;
          v106[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_275;
          v106[3] = &unk_1E8E9DED8;
          v106[4] = self;
          objc_msgSend(v61, "performAfterMenuButtonUpIsHandledUsingBlock:", v106);

        }
        if ((v98 & v94) != 0)
        {
          if (-[SBLockScreenManager isUILocked](self, "isUILocked") & (!v54 | v53))
          {
            -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "isInScreenOffMode");

            if (v63)
            {
              objc_msgSend((id)SBApp, "statusBarStateAggregator");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "sendStatusBarActions:", 9);
              +[SBVideoOutController sharedInstance](SBVideoOutController, "sharedInstance");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "updateScreenSharingBackgroundActivityAssertion");

            }
          }
          -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setInScreenOffMode:forAutoUnlock:fromUnlockSource:", 0, v54, a3);

        }
        if (!(v98 ^ 1 | v54 & v94))
        {
          SBLogCommon();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&buf[4] = 1;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v54;
            *(_WORD *)&buf[14] = 1024;
            *(_DWORD *)&buf[16] = v94;
            _os_log_impl(&dword_1D0540000, v68, OS_LOG_TYPE_DEFAULT, "Bailing from UIUnlock because: turnOnScreenFirst = %d; autoUnlock = %d; shouldTurnOnScreen = %d",
              buf,
              0x14u);
          }

          goto LABEL_73;
        }
        if (-[SBLockScreenManager _isUnlockDisabled](self, "_isUnlockDisabled"))
        {
          SBLogCommon();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v67, OS_LOG_TYPE_DEFAULT, "Ignoring unlock attempt because unlock is disabled.", buf, 2u);
          }

          goto LABEL_73;
        }
        unlockRequest = self->_unlockRequest;
        if (!unlockRequest || -[SBLockScreenUnlockRequest intent](unlockRequest, "intent") != 2)
        {
          -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "willUIUnlockFromSource:", a3);

          if ((v72 & 1) == 0)
          {
            SBLogCommon();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = (objc_class *)objc_opt_class();
              NSStringFromClass(v80);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v81;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = a3;
              _os_log_impl(&dword_1D0540000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ said it can't UI-unlock for source %d", buf, 0x12u);

            }
            -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v82, "externalLockProvidersShowPasscode");

            if (v6)
            {
              LOBYTE(v6) = 0;
              self->_saveUnlockRequest = 1;
            }
            goto LABEL_74;
          }
        }
        if ((v101 & 1) != 0)
        {
          p_userAuthController = &self->_userAuthController;
          v74 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated");
          v75 = v74;
          if (v74 | !v54)
          {
            v76 = -[SBFUserAuthenticationController isAuthenticated](*p_userAuthController, "isAuthenticated");
            v77 = 0;
            if ((v75 & 1) != 0)
            {
              v55 = 1;
LABEL_96:
              if (v55 && v76)
              {
                v86 = -[SBLockScreenManager _finishUIUnlockFromSource:withOptions:](self, "_finishUIUnlockFromSource:withOptions:", a3, v105);
              }
              else
              {
                if (!v77)
                  goto LABEL_73;
                if (-[SBLockScreenManager _isPasscodeVisible](self, "_isPasscodeVisible"))
                {
                  LOBYTE(v6) = 1;
                  goto LABEL_74;
                }
                if (-[SBLockScreenManager _isPasscodeVisible](self, "_isPasscodeVisible"))
                  goto LABEL_73;
                if (a3 == 15)
                {
                  -[SBLockScreenEnvironment buttonObserver](self->_lockScreenEnvironment, "buttonObserver");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "createHomeButtonShowPasscodeRecognizerForHomeButtonPress");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v88)
                  {
                    -[SBLockScreenManager _setHomeButtonShowPasscodeRecognizer:](self, "_setHomeButtonShowPasscodeRecognizer:", v88);

LABEL_73:
                    LOBYTE(v6) = 0;
LABEL_74:

                    goto LABEL_75;
                  }
                }
                objc_msgSend(v105, "objectForKey:", CFSTR("SBUIUnlockOptionsSimulateSwipeToUnlock"));
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v89, "BOOLValue");

                if (v90
                  && -[SBLockScreenManager _shouldEmulateInterstitialPresentationForAccessibility:](self, "_shouldEmulateInterstitialPresentationForAccessibility:", 0))
                {
                  -[SBLockScreenManager _emulateInterstitialPasscodePresentationForAccessibility:](self, "_emulateInterstitialPasscodePresentationForAccessibility:", 0);
                  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:", 1);

                }
                v86 = -[SBLockScreenManager _setPasscodeVisible:animated:](self, "_setPasscodeVisible:animated:", 1, v57);
              }
              LOBYTE(v6) = v86;
              goto LABEL_74;
            }
            v55 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v85, "autoDismissUnlockedLockScreen");

            v76 = -[SBFUserAuthenticationController isAuthenticated](*p_userAuthController, "isAuthenticated");
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "hasBiometricAuthenticationCapabilityEnabled")
             && objc_msgSend(v83, "biometricLockoutState")
             && objc_msgSend(v83, "biometricLockoutState") != 1;

          p_userAuthController = &self->_userAuthController;
          v76 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated");
          if (!v84)
          {
            v77 = 0;
            goto LABEL_96;
          }
        }
        v77 = -[SBFUserAuthenticationController hasPasscodeSet](*p_userAuthController, "hasPasscodeSet") & (v76 ^ 1);
        goto LABEL_96;
      }
      if (((v92 ^ 1 | v55) & 1) == 0)
      {
        if (-[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive"))
        {
          -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "startLockScreenFadeInAnimationForSource:", a3);

LABEL_52:
          objc_msgSend(v102, "turnOnScreenFullyWithBacklightSource:", SBUIConvertUnlockSourceToBacklightChangeSource());
          goto LABEL_53;
        }
        if (!objc_msgSend(v100, "interruptSleepAnimationIfNeeded"))
          goto LABEL_52;
      }
      -[NSObject updateWakeEffectsForWake:](oslog, "updateWakeEffectsForWake:", 1);
      goto LABEL_52;
    }
    objc_msgSend(v97, "wakeDestination");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "type") == 1)
    {
      +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCoverSheetPresented:animated:withCompletion:", 0, 0, 0);

      if (!-[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated"))goto LABEL_41;
      -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "externalLockProvidersRequireUnlock");

      if ((v31 & 1) != 0)
        goto LABEL_41;
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "applicationWithBundleIdentifier:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      SBWorkspaceActivateApplication(v34);
    }
    else
    {
      v42 = objc_msgSend(v28, "type");
      if (a3 != 10 && v42 == 2)
      {
        if (!self->_alertLaunchFinish)
        {
          v43 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
          objc_msgSend(v43, "setReason:", *MEMORY[0x1E0DAB920]);
          objc_initWeak((id *)buf, self);
          v109[0] = v25;
          v109[1] = 3221225472;
          v109[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_272;
          v109[3] = &unk_1E8EB6E08;
          objc_copyWeak(&v111, (id *)buf);
          v110 = v105;
          v112 = a3;
          v44 = (void *)objc_msgSend(v109, "copy");
          alertLaunchFinish = self->_alertLaunchFinish;
          self->_alertLaunchFinish = v44;

          v46 = (void *)MEMORY[0x1E0DAAF88];
          objc_msgSend(v28, "remoteAlertDefinition");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (SBSRemoteAlertHandle *)objc_msgSend(v46, "newHandleWithDefinition:configurationContext:", v47, 0);
          wakeToRemoteAlertHandle = self->_wakeToRemoteAlertHandle;
          self->_wakeToRemoteAlertHandle = v48;

          -[SBSRemoteAlertHandle registerObserver:](self->_wakeToRemoteAlertHandle, "registerObserver:", self);
          v50 = dispatch_time(0, 500000000);
          v107[0] = v25;
          v107[1] = 3221225472;
          v107[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2_274;
          v107[3] = &unk_1E8E9DF28;
          objc_copyWeak(&v108, (id *)buf);
          dispatch_after(v50, MEMORY[0x1E0C80D38], v107);
          -[SBSRemoteAlertHandle activateWithContext:](self->_wakeToRemoteAlertHandle, "activateWithContext:", v43);
          objc_destroyWeak(&v108);

          objc_destroyWeak(&v111);
          objc_destroyWeak((id *)buf);

        }
        -[NSObject updateWakeEffectsForWake:](oslog, "updateWakeEffectsForWake:", 1);
        SBLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v51, OS_LOG_TYPE_DEFAULT, "Delaying unlockUIFromSource call to wake to remote alert.", buf, 2u);
        }

        goto LABEL_73;
      }
      if (objc_msgSend(v28, "type") != 3)
        goto LABEL_41;
      objc_msgSend(v28, "wakeHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "wakeToContentForWakeDestination:unlockSource:", v28, a3);
    }

LABEL_41:
    -[NSObject updateWakeEffectsForWake:](oslog, "updateWakeEffectsForWake:", 1);

    goto LABEL_42;
  }
  SBLogCommon();
  oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromUnlockSource();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_1D0540000, oslog, OS_LOG_TYPE_DEFAULT, "unlockUIFromSource:%{public}@ Ignoring unlock attempt because we're still initializing ourselves at startup and we're not ready for this yet.", buf, 0xCu);

  }
  LOBYTE(v6) = 0;
LABEL_75:

  return v6;
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 44))
    return 0;
  else
    return objc_msgSend(*(id *)(a1 + 32), "_shouldWakeToInCallForUnlockSource:wakingTheDisplay:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 45));
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id WeakRetained;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SBUIUnlockOptionsSuppressingWakeToKey"));
    objc_msgSend(WeakRetained, "unlockUIFromSource:withOptions:", *(unsigned int *)(a1 + 64), v3);

  }
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  int v9;

  v3 = a2;
  objc_msgSend(v3, "setTransactionProvider:", &__block_literal_global_267_1);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_5;
  v8[3] = &__block_descriptor_36_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v9 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "modifyApplicationContext:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_6;
  v6[3] = &unk_1E8E9F1C0;
  v7 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v6);

}

SBWakeToInCallWorkspaceTransaction *__54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SBWakeToInCallWorkspaceTransaction *v3;

  v2 = a2;
  v3 = -[SBMainWorkspaceTransaction initWithTransitionRequest:]([SBWakeToInCallWorkspaceTransaction alloc], "initWithTransitionRequest:", v2);

  return v3;
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRetainsSiri:", *(_DWORD *)(a1 + 32) == 12);
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_272(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained[18])
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SBUIUnlockOptionsSuppressingWakeToKey"));
    objc_msgSend(WeakRetained, "unlockUIFromSource:withOptions:", *(unsigned int *)(a1 + 48), v2);
    v3 = (void *)WeakRetained[18];
    WeakRetained[18] = 0;

    v4 = (void *)WeakRetained[19];
    WeakRetained[19] = 0;

  }
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2_274(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained[19])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[18], "invalidate");
    (*((void (**)(void))v2[19] + 2))();
    WeakRetained = v2;
  }

}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_275(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "buttonObserver");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "noteMenuButtonUp");

}

- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v5;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  SBLockScreenUnlockRequest *unlockRequest;
  SBLockScreenUnlockRequest *v22;
  void *v23;
  void *v24;
  SBCaptureApplicationLaunchRequest *v25;
  void *v26;
  id v27;
  BOOL v28;
  SBLockScreenUnlockRequest *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  SBCaptureApplicationLaunchRequest *v35;
  char v36;
  _QWORD v37[4];
  id v38;
  SBLockScreenManager *v39;
  void (**v40)(id, _QWORD);
  uint64_t v41;
  char v42;
  char v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v5 = *(_QWORD *)&a3;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a5;
  SBLogScreenWake();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromUnlockSource();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "_finishUIUnlockFromSource: %{public}@", buf, 0xCu);

  }
  if (-[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked"))
  {
    SBLogScreenWake();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Bailing out of _finishUIUnlockFromSource because the device is blocked.";
LABEL_21:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if ((-[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 2603, CFSTR("the new lock screen expects user authentication before unlock can happen"));

  }
  -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "canBeDeactivatedForUIUnlockFromSource:", v5);

  if (!v14)
  {
    SBLogScreenWake();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Lock screen REFUSED to be deactivated! NOT unlocking.";
      goto LABEL_21;
    }
LABEL_22:

    if (v8)
      v8[2](v8, 0);
    v28 = 0;
    goto LABEL_27;
  }
  -[SBLockScreenUnlockRequest destinationApplication](self->_unlockRequest, "destinationApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SBLockScreenUnlockRequest source](self->_unlockRequest, "source");
  v17 = 1;
  if (v16 != 34)
    v17 = 2;
  if (v15)
    v18 = v17;
  else
    v18 = 0;
  v19 = (v5 > 0x29) | (0x1FFFFFFDFF7uLL >> v5) & 1;
  if ((_DWORD)v5 == 33)
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:", 1);

  }
  unlockRequest = self->_unlockRequest;
  if ((v18 & 1) != 0 && unlockRequest)
  {
    v22 = unlockRequest;
    -[SBLockScreenUnlockRequest destinationApplication](v22, "destinationApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[SBCaptureApplicationLaunchRequest initWithCaptureApplicationBundleIdentifier:]([SBCaptureApplicationLaunchRequest alloc], "initWithCaptureApplicationBundleIdentifier:", v24);
    -[SBCaptureApplicationLaunchRequest setLaunchType:](v25, "setLaunchType:", 0);
    -[SBLockScreenUnlockRequest launchActions](v22, "launchActions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureApplicationLaunchRequest setLaunchActions:](v25, "setLaunchActions:", v26);

    -[SBCaptureApplicationLaunchRequest setPrewarmCamera:](v25, "setPrewarmCamera:", 1);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke;
    v37[3] = &unk_1E8EC1398;
    v38 = v24;
    v39 = self;
    v42 = v19;
    v41 = v18;
    v40 = v8;
    v43 = v14;
    v27 = v24;
    -[SBCaptureApplicationLaunchRequest setCompletionBlock:](v25, "setCompletionBlock:", v37);
    -[SBCaptureApplicationLaunchRequest initiate](v25, "initiate");

  }
  else
  {
    v29 = unlockRequest;
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "willUIUnlockWithPendingUnlockRequest:", self->_unlockRequest != 0);

    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_2;
    v34[3] = &unk_1E8EA0D88;
    v35 = v8;
    v36 = v14;
    objc_msgSend(v31, "setCoverSheetPresented:animated:options:withCompletion:", 0, v19, v18, v34);

    v25 = v35;
  }

  v28 = 1;
LABEL_27:

  return v28;
}

void __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  char v11;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_cold_1(a1, v3, v4);

  }
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willUIUnlockWithPendingUnlockRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) != 0);

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_280;
  v9[3] = &unk_1E8EA0D88;
  v8 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = *(_BYTE *)(a1 + 65);
  objc_msgSend(v6, "setCoverSheetPresented:animated:options:withCompletion:", 0, v7, v8, v9);

}

uint64_t __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_280(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4
{
  return -[SBLockScreenManager _finishUIUnlockFromSource:withOptions:completion:](self, "_finishUIUnlockFromSource:withOptions:completion:", *(_QWORD *)&a3, a4, 0);
}

- (void)addLockScreenDisableAssertion:(id)a3
{
  -[SBLockScreenDisabledAssertionManager addLockScreenDisableAssertion:](self->_lockScreenDisabledAssertionManager, "addLockScreenDisableAssertion:", a3);
}

- (void)removeLockScreenDisableAssertion:(id)a3
{
  -[SBLockScreenDisabledAssertionManager removeLockScreenDisableAssertion:](self->_lockScreenDisabledAssertionManager, "removeLockScreenDisableAssertion:", a3);
}

- (BOOL)isLockScreenDisabledForAssertion
{
  return -[SBLockScreenDisabledAssertionManager isLockScreenDisabledForAssertion](self->_lockScreenDisabledAssertionManager, "isLockScreenDisabledForAssertion");
}

- (BOOL)_isUnlockDisabled
{
  void *v4;
  char v5;

  if ((-[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked") & 1) != 0)
    return 1;
  -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUnlockDisabled");

  return v5;
}

- (BOOL)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v6;
  NSObject *v7;
  void *v8;
  SBPasscodeEntryTransientOverlayViewController *passcodeEntryTransientOverlayViewController;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  char v26;
  BOOL v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  SBPasscodeEntryTransientOverlayViewController *v33;
  void *v34;
  SBPasscodeEntryTransientOverlayViewController *v35;
  SBPasscodeEntryTransientOverlayViewController *v36;
  SBPasscodeEntryTransientOverlayViewController *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  SBLockScreenUnlockRequest *unlockRequest;
  SBPasscodeEntryTransientOverlayViewController *v42;
  void *v43;
  void *v44;
  SBPasscodeEntryTransientOverlayViewController *v45;
  BOOL v46;
  uint8_t v47[16];
  _QWORD v48[5];
  _QWORD v49[5];

  v4 = a4;
  if (!a3)
  {
    self->_presentedPasscodeWhileUILocking = 0;
    -[SBLockScreenManager _setMesaAutoUnlockingDisabled:forReason:](self, "_setMesaAutoUnlockingDisabled:forReason:", a3, CFSTR("SBApplicationRequestedDeviceUnlock"));
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] hiding passcode is about to update bloom, oddly enough...", v47, 2u);
    }

    -[SBLockScreenManager _updateBloomIfNeeded](self, "_updateBloomIfNeeded");
    if (self->_passcodeEntryTransientOverlayViewController)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, v4, 0);

      passcodeEntryTransientOverlayViewController = self->_passcodeEntryTransientOverlayViewController;
      self->_passcodeEntryTransientOverlayViewController = 0;

      -[SBLockScreenManager reevaluateSystemApertureLockElementSuppressionWithReason:](self, "reevaluateSystemApertureLockElementSuppressionWithReason:", CFSTR("Transient Passcode dismissed"));
    }
    -[SBLockScreenEnvironment passcodeViewPresenter](self->_lockScreenEnvironment, "passcodeViewPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPasscodeLockVisible:animated:completion:", 0, v4, 0);

    -[SBLockScreenManager _runUnlockActionBlock:](self, "_runUnlockActionBlock:", 0);
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBLockScreenPasscodeUIVisibilityUpdatedNotification"), self);

    return 1;
  }
  if (!-[SBLockScreenManager _isUnlockDisabled](self, "_isUnlockDisabled"))
  {
    if ((-[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet") & 1) == 0)
    {
      v6 = 1;
      -[SBLockScreenManager _runUnlockActionBlock:](self, "_runUnlockActionBlock:", 1);
      return v6;
    }
    -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attemptPhoneUnlockWithWatch");

    -[SBLockScreenManager _setMesaAutoUnlockingDisabled:forReason:](self, "_setMesaAutoUnlockingDisabled:forReason:", 1, CFSTR("SBApplicationRequestedDeviceUnlock"));
    if (-[SBLockScreenManager isUILocked](self, "isUILocked"))
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transientOverlayPresentationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasActivePresentation");

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bannerDestination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "notificationDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dashBoardDestination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "isPresentingBannerInLongLook") & 1) != 0)
      v21 = 1;
    else
      v21 = objc_msgSend(v20, "isPresentingNotificationInLongLook");
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isCoverSheetHostingAnApp");

    -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "_passcodePresentationMode");

    v27 = ((v16 | v21) & 1) != 0
       || -[SBLockScreenUnlockRequest forceAlertAuthenticationUI](self->_unlockRequest, "forceAlertAuthenticationUI")
       || -[SBLockScreenUnlockRequest source](self->_unlockRequest, "source") == 9
       || -[SBLockScreenUnlockRequest source](self->_unlockRequest, "source") == 4
       || -[SBLockScreenUnlockRequest source](self->_unlockRequest, "source") == 26
       || (-[SBLockScreenUnlockRequest source](self->_unlockRequest, "source") == 34 ? (v26 = 1) : (v26 = v23),
           (v26 & 1) != 0)
       || -[SBLockScreenManager _specifiesTransientPresentationForMode:](self, "_specifiesTransientPresentationForMode:", v25);
    -[SBLockScreenEnvironment customActionStore](self->_lockScreenEnvironment, "customActionStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_customLockScreenActionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = -[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive");
    v31 = v30;
    if (v27 || !v30)
    {
      if (!self->_passcodeEntryTransientOverlayViewController)
      {
        v33 = [SBPasscodeEntryTransientOverlayViewController alloc];
        objc_msgSend((id)SBApp, "authenticationController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[SBPasscodeEntryTransientOverlayViewController initWithAuthenticationController:](v33, "initWithAuthenticationController:", v34);
        v36 = self->_passcodeEntryTransientOverlayViewController;
        self->_passcodeEntryTransientOverlayViewController = v35;

        -[SBPasscodeEntryTransientOverlayViewController setDelegate:](self->_passcodeEntryTransientOverlayViewController, "setDelegate:", self);
        -[SBPasscodeEntryTransientOverlayViewController setUseBiometricPresentation:](self->_passcodeEntryTransientOverlayViewController, "setUseBiometricPresentation:", objc_msgSend(v29, "wantsBiometricPresentation"));
        v37 = self->_passcodeEntryTransientOverlayViewController;
        objc_msgSend(v29, "unlockDestination");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBPasscodeEntryTransientOverlayViewController setUnlockDestination:](v37, "setUnlockDestination:", v38);

        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "userInterfaceIdiom");

        if ((v40 & 0xFFFFFFFFFFFFFFFBLL) != 1)
          -[SBPasscodeEntryTransientOverlayViewController setOverridePresentationOrientation:](self->_passcodeEntryTransientOverlayViewController, "setOverridePresentationOrientation:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation"));
        unlockRequest = self->_unlockRequest;
        if (!unlockRequest || -[SBLockScreenUnlockRequest intent](unlockRequest, "intent") == 3)
        {
          v42 = self->_passcodeEntryTransientOverlayViewController;
          +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBPasscodeEntryTransientOverlayViewController setShowEmergencyCallButton:](v42, "setShowEmergencyCallButton:", objc_msgSend(v43, "emergencyCallSupported"));

        }
      }
      if (v25 == 2)
        -[SBPasscodeEntryTransientOverlayViewController setIntent:](self->_passcodeEntryTransientOverlayViewController, "setIntent:", 3);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = self->_passcodeEntryTransientOverlayViewController;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke;
      v49[3] = &unk_1E8E9DED8;
      v49[4] = self;
      objc_msgSend(v44, "presentTransientOverlayViewController:animated:completion:", v45, v4, v49);

      self->_passcodeEntryTransientOverlayViewControllerPresentedAnimated = v4;
    }
    else
    {
      -[SBLockScreenEnvironment passcodeViewPresenter](self->_lockScreenEnvironment, "passcodeViewPresenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke_283;
      v48[3] = &unk_1E8E9DED8;
      v48[4] = self;
      objc_msgSend(v32, "setPasscodeLockVisible:animated:completion:", 1, v4, v48);

    }
    -[SBLockScreenManager _runPreflightLocationBasedEvaluationToExitLostModeIfNecessary](self, "_runPreflightLocationBasedEvaluationToExitLostModeIfNecessary");
    if (v31)
      v46 = !-[SBLockScreenManager isUILocked](self, "isUILocked");
    else
      v46 = 0;
    self->_presentedPasscodeWhileUILocking = v46;

    goto LABEL_9;
  }
  return 0;
}

uint64_t __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] transient passcode overlay presentation is going to trigger bloom", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateBloomIfNeeded");
}

uint64_t __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke_283(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "coverSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanupRubberBandTransition");

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] changing passcode being visible is going to trigger bloom update", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateBloomIfNeeded");
}

- (BOOL)_specifiesTransientPresentationForMode:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (BOOL)isPasscodeEntryTransientOverlayVisible
{
  return self->_passcodeEntryTransientOverlayViewController != 0;
}

- (BOOL)_isPasscodeVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBLockScreenEnvironment passcodeViewPresenter](self->_lockScreenEnvironment, "passcodeViewPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPasscodeLockVisible") & 1) != 0
    || -[SBLockScreenManager isPasscodeEntryTransientOverlayVisible](self, "isPasscodeEntryTransientOverlayVisible"))
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "ambientTransientOverlayIsShowingPasscode");
  }

  return v7;
}

void __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isComplete"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      if (objc_msgSend(v5, "isFailed"))
      {
        (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      }
      else
      {
        objc_msgSend(v5, "context");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v4, "BOOLValue"));

      }
    }
  }

}

uint64_t __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "[Unlock Request] Performing action!", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "signalWithContext:", MEMORY[0x1E0C9AAB0]);
}

void __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_297(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if ((a2 & 1) == 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "[Unlock Request] Request failed.", buf, 2u);
    }

    v7 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C9AAA0];
    goto LABEL_9;
  }
  if (v5)
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "[Unlock Request] Request succeeded!", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C9AAB0];
LABEL_9:
    objc_msgSend(v7, "signalWithContext:", v8);
    v10 = *(void **)(a1 + 40);
    v9 = a1 + 40;
    objc_msgSend(v10, "_customLockScreenActionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(v9 + 8);

    if (v11 == v12)
      objc_msgSend(*(id *)v9, "setCustomLockScreenActionContext:", 0);
  }
}

- (void)updateSpringBoardStatusBarForLockScreenTeardown
{
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "statusBarStateAggregator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginCoalescentBlock");
  objc_msgSend(v4, "updateStatusBarItem:", 13);
  objc_msgSend(v4, "endCoalescentBlock");
  -[SBLockScreenEnvironment statusBarTransitionController](self->_lockScreenEnvironment, "statusBarTransitionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStatusBarForLockScreenTeardown");

}

- (void)_setUserAuthController:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_userAuthController, a3);
  v5 = a3;
  -[SBFUserAuthenticationController _addPrivateAuthenticationObserver:](self->_userAuthController, "_addPrivateAuthenticationObserver:", self);

}

- (void)_setHomeButtonShowPasscodeRecognizer:(id)a3
{
  SBHomeButtonShowPasscodeRecognizer *v5;
  SBHomeButtonShowPasscodeRecognizer *homeButtonShowPasscodeRecognizer;
  SBHomeButtonShowPasscodeRecognizer *v7;

  v5 = (SBHomeButtonShowPasscodeRecognizer *)a3;
  homeButtonShowPasscodeRecognizer = self->_homeButtonShowPasscodeRecognizer;
  if (homeButtonShowPasscodeRecognizer != v5)
  {
    v7 = v5;
    -[SBHomeButtonShowPasscodeRecognizer setDelegate:](homeButtonShowPasscodeRecognizer, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_homeButtonShowPasscodeRecognizer, a3);
    -[SBHomeButtonShowPasscodeRecognizer setDelegate:](self->_homeButtonShowPasscodeRecognizer, "setDelegate:", self);
    v5 = v7;
  }

}

- (void)_setHomeButtonSuppressAfterUnlockRecognizer:(id)a3
{
  SBHomeButtonSuppressAfterUnlockRecognizer *v5;
  SBHomeButtonSuppressAfterUnlockRecognizer *homeButtonSuppressAfterUnlockRecognizer;
  SBHomeButtonSuppressAfterUnlockRecognizer *v7;

  v5 = (SBHomeButtonSuppressAfterUnlockRecognizer *)a3;
  homeButtonSuppressAfterUnlockRecognizer = self->_homeButtonSuppressAfterUnlockRecognizer;
  if (homeButtonSuppressAfterUnlockRecognizer != v5)
  {
    v7 = v5;
    -[SBHomeButtonSuppressAfterUnlockRecognizer setDelegate:](homeButtonSuppressAfterUnlockRecognizer, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_homeButtonSuppressAfterUnlockRecognizer, a3);
    -[SBHomeButtonSuppressAfterUnlockRecognizer setDelegate:](self->_homeButtonSuppressAfterUnlockRecognizer, "setDelegate:", self);
    v5 = v7;
  }

}

- (void)_wakeScreenForMouseButtonDown:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "screenIsOn"))
  {
    SBLogBacklight();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      v7 = "_wakeScreenForMouseButtonDown: not waking because screen is on";
LABEL_7:
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, v7, v16, 2u);
    }
  }
  else
  {
    v8 = objc_msgSend((id)SBApp, "caseIsEnabledAndLatched");
    SBLogBacklight();
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        *(_WORD *)v16 = 0;
        v7 = "_wakeScreenForMouseButtonDown: not waking because smart cover closed";
        goto LABEL_7;
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "_wakeScreenForMouseButtonDown: waking", v16, 2u);
      }

      SBLogBacklight();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_signpost_id_make_with_pointer(v10, v4);

      SBLogBacklight();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "_wakeScreenForMouseButtonDown", (const char *)&unk_1D0E9B6CB, v16, 2u);
      }

      v17[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
      v17[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
      v18[0] = MEMORY[0x1E0C9AAB0];
      v18[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 17, v14);

      SBLogBacklight();
      v15 = objc_claimAutoreleasedReturnValue();
      v6 = v15;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_END, v11, "_wakeScreenForMouseButtonDown", (const char *)&unk_1D0E9B6CB, v16, 2u);
      }
    }
  }

}

- (id)_statusBarLayoutManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_dismissLockScreenForAuthenticationIfNecessary
{
  void *v3;
  int v4;

  -[SBLockScreenManager exitLostModeIfNecessaryFromRemoteRequest:](self, "exitLostModeIfNecessaryFromRemoteRequest:", 0);
  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoDismissUnlockedLockScreen");

  if (v4)
    -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 11, 0);
}

- (void)_evaluateWallpaperMode
{
  void *v3;
  int v4;

  if (self->_isScreenOn
    && (+[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "isPresented"), v3, v4))
  {
    -[SBLockScreenManager _prepareWallpaperForInteractiveMode](self, "_prepareWallpaperForInteractiveMode");
  }
  else
  {
    -[SBLockScreenManager _prepareWallpaperForStaticMode](self, "_prepareWallpaperForStaticMode");
  }
}

- (void)_prepareWallpaperForInteractiveMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes = 0;
  objc_msgSend(v6, "updateIrisWallpaperForInteractiveMode");
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "irisWallpaperPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIrisWallpaperPlayer:", v4);

  objc_msgSend(v6, "wallpaperGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWallpaperGestureRecognizer:", v5);

  objc_msgSend(v3, "setWallpaperColorProvider:", self);
}

- (void)_prepareWallpaperForStaticMode
{
  void *v3;
  char v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "updateIrisWallpaperForStaticMode");

  if ((v4 & 1) == 0)
    self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes = 1;
}

- (NSString)description
{
  return (NSString *)-[SBLockScreenManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SBLockScreenManager *v14;

  -[SBLockScreenManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isUILocked, CFSTR("UI Locked"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_allowDisablePasscodeLockAssertion, CFSTR("Allows DisablePasscodeLockAssertion"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_allowUILockUnlock, CFSTR("Allow Locking/Unlocking"));
  if (self->_isInLostMode)
    v8 = (id)objc_msgSend(v4, "appendBool:withName:", 1, CFSTR("inLostMode"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__SBLockScreenManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E8E9E820;
  v9 = v4;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v12);
  v10 = v9;

  return v10;
}

id __61__SBLockScreenManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("mesaCoordinator"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("lockScreenEnvironment"));
}

- (void)_noteStartupTransitionWillBegin
{
  void *v3;
  int v4;

  self->_allowUILockUnlock = 1;
  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMultiUserSupported");

  if (v4)
  {
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
      -[SBLockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:animated:](self->_lockScreenOrientationManager, "updateInterfaceOrientationWithRequestedOrientation:animated:", 0, 0);
  }
}

- (void)_noteStartupTransitionDidBegin
{
  self->_allowDisablePasscodeLockAssertion = 1;
  if (!self->_isUILocked)
    -[SBLockScreenManager _createAuthenticationAssertion](self, "_createAuthenticationAssertion");
}

- (void)_postLockCompletedNotification:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[4];
  BOOL v6;

  if (_postLockCompletedNotification__lockCompleteToken == -1)
  {
    notify_register_check("com.apple.springboard.lockcomplete", &_postLockCompletedNotification__lockCompleteToken);
    if (!_postLockCompletedNotification__lockCompleteToken)
      return;
  }
  else if (!_postLockCompletedNotification__lockCompleteToken)
  {
    return;
  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SBLockScreenManager__postLockCompletedNotification___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = a3;
  dispatch_async(v4, block);

}

uint64_t __54__SBLockScreenManager__postLockCompletedNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = notify_set_state(_postLockCompletedNotification__lockCompleteToken, *(unsigned __int8 *)(a1 + 32));
  if (*(_BYTE *)(a1 + 32))
    return notify_post("com.apple.springboard.lockcomplete");
  return result;
}

- (void)_setMesaUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mesaUnlockingDisabledAssertions;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v7 = a4;
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 3185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v7 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mesaUnlockingDisabledAssertions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {

    if (!v9)
    {
      if (!self->_mesaUnlockingDisabledAssertions)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        mesaUnlockingDisabledAssertions = self->_mesaUnlockingDisabledAssertions;
        self->_mesaUnlockingDisabledAssertions = v10;

      }
      -[SBLockScreenBiometricAuthenticationCoordinator acquireDisableUnlockAssertionForReason:](self->_biometricAuthenticationCoordinator, "acquireDisableUnlockAssertionForReason:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mesaUnlockingDisabledAssertions, "setObject:forKeyedSubscript:", v12, v14);
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v8, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->_mesaUnlockingDisabledAssertions, "removeObjectForKey:", v14);
    if (!-[NSMutableDictionary count](self->_mesaUnlockingDisabledAssertions, "count"))
    {
      v12 = self->_mesaUnlockingDisabledAssertions;
      self->_mesaUnlockingDisabledAssertions = 0;
LABEL_11:

    }
  }

}

- (BOOL)_attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4
{
  return -[SBLockScreenManager _attemptUnlockWithPasscode:mesa:finishUIUnlock:](self, "_attemptUnlockWithPasscode:mesa:finishUIUnlock:", a3, 0, a4);
}

- (BOOL)_attemptUnlockWithPasscode:(id)a3 mesa:(BOOL)a4 finishUIUnlock:(BOOL)a5
{
  return -[SBLockScreenManager _attemptUnlockWithPasscode:mesa:finishUIUnlock:completion:](self, "_attemptUnlockWithPasscode:mesa:finishUIUnlock:completion:", a3, a4, a5, 0);
}

- (BOOL)_attemptUnlockWithPasscode:(id)a3 mesa:(BOOL)a4 finishUIUnlock:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int);
  void *v27;
  id v28;
  SBLockScreenManager *v29;
  id v30;
  int v31;
  BOOL v32;
  BOOL v33;
  uint8_t buf[16];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (-[SBLockScreenManager isUILocked](self, "isUILocked") || self->_unlockRequest)
  {
    -[SBFUserAuthenticationController createGracePeriodAssertionWithReason:](self->_userAuthController, "createGracePeriodAssertionWithReason:", CFSTR("UI unlock attempt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activate");
    v13 = -[SBLockScreenUnlockRequest source](self->_unlockRequest, "source");
    -[SBLockScreenUnlockRequest process](self->_unlockRequest, "process");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = -[SBLockScreenUnlockRequest intent](self->_unlockRequest, "intent") == 2;
    else
      v15 = 0;

    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke;
    v27 = &unk_1E8EC1410;
    v30 = v11;
    v16 = v12;
    v28 = v16;
    v29 = self;
    v31 = v13;
    v32 = a5;
    v33 = v8;
    v17 = (void *)MEMORY[0x1D17E5550](&v24);
    v18 = objc_alloc(MEMORY[0x1E0DA9DA0]);
    if (v8)
      v19 = objc_msgSend(v18, "initForBiometricAuthenticationWithSource:handler:", v15, v17, v24, v25, v26, v27);
    else
      v19 = objc_msgSend(v18, "initForPasscode:source:handler:", v10, v15, v17, v24, v25, v26, v27);
    v20 = (void *)v19;
    -[SBFUserAuthenticationController processAuthenticationRequest:](self->_userAuthController, "processAuthenticationRequest:", v19);

    v21 = 1;
  }
  else
  {
    SBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, "Not locked so not unlocking", buf, 2u);
    }

    if (v11)
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    v21 = 0;
  }

  return v21;
}

void __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[5];
  int v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("no");
    if (a2)
      v5 = CFSTR("yes");
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Unlock attempt succeeded: %@", buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0D016E8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_318;
  v19[3] = &unk_1E8EC13C0;
  v21 = *(id *)(a1 + 48);
  v22 = a2;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v7, "sentinelWithCompletion:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_2;
    v17[3] = &unk_1E8EC13E8;
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = *(_DWORD *)(a1 + 56);
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v17);
    v10 = *(id **)(a1 + 40);
    if (*(_BYTE *)(a1 + 60))
    {
      if (objc_msgSend(v10[9], "source") == 13)
      {
        v11 = 13;
      }
      else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "source") == 34)
      {
        v11 = 34;
      }
      else if (*(_BYTE *)(a1 + 61))
      {
        v11 = 23;
      }
      else
      {
        v11 = 17;
      }
      v13 = *(void **)(a1 + 40);
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_4;
      v14[3] = &unk_1E8EA0D60;
      v14[4] = v13;
      v16 = v9;
      v15 = v8;
      objc_msgSend(v13, "_finishUIUnlockFromSource:withOptions:completion:", v11, 0, v14);

    }
    else
    {
      objc_msgSend(v10, "_runUnlockActionBlock:", 1);
      v9[2](v9, 1);
      objc_msgSend(v8, "signal");
    }

  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "isBlocked"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "passcodeViewPresenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPasscodeLockVisible:animated:", 0, 1);

    }
    objc_msgSend(v8, "signal");
  }

}

uint64_t __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_318(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "isComplete");
  if ((_DWORD)result)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 1, *(unsigned __int8 *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  return result;
}

void __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  int v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createAuthenticationAssertion");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_3;
    v5[3] = &unk_1E8EA1BB8;
    v6 = *(_DWORD *)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D229B0], "eventWithName:handler:", CFSTR("authenticateOnly"), v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeOrAppendEvent:", v3);

  }
}

uint64_t __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_3(uint64_t a1)
{
  void *v2;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationStateMayHaveChangedFromSource:", *(unsigned int *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setPasscodeVisible:animated:", 0, 1);
}

uint64_t __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_runUnlockActionBlock:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_lockFeaturesForRemoteLock:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "isPasscodeEntryTransientOverlayVisible"))
    objc_msgSend(*(id *)(a1 + 32), "setPasscodeVisible:animated:", 0, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "signal");
}

- (void)attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  SBLockScreenUnlockRequest *unlockRequest;
  _BOOL8 v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  v9 = objc_msgSend(v12, "length");
  if (v6)
  {
    unlockRequest = self->_unlockRequest;
    if (unlockRequest)
      v11 = -[SBLockScreenUnlockRequest intent](unlockRequest, "intent") == 3;
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  -[SBLockScreenManager _attemptUnlockWithPasscode:mesa:finishUIUnlock:completion:](self, "_attemptUnlockWithPasscode:mesa:finishUIUnlock:completion:", v12, v9 == 0, v11, v8);

}

- (void)attemptUnlockWithPasscode:(id)a3
{
  -[SBLockScreenManager attemptUnlockWithPasscode:finishUIUnlock:completion:](self, "attemptUnlockWithPasscode:finishUIUnlock:completion:", a3, 1, 0);
}

- (void)attemptUnlockWithMesa
{
  -[SBLockScreenManager attemptUnlockWithPasscode:](self, "attemptUnlockWithPasscode:", 0);
}

- (void)_evaluatePreArmDisabledAssertions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSetupMode");

  -[SBLockScreenManager _setWalletPreArmDisabled:forReason:](self, "_setWalletPreArmDisabled:forReason:", v4, CFSTR("Setup"));
  -[SBLockScreenManager _setWalletPreArmDisabled:forReason:](self, "_setWalletPreArmDisabled:forReason:", -[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked"), CFSTR("Device blocked"));
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "incomingCallExists");

  -[SBLockScreenManager _setWalletPreArmDisabled:forReason:](self, "_setWalletPreArmDisabled:forReason:", v6, CFSTR("Phone call"));
}

- (void)_authenticationStateChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  LAContext *lostModePreflightLocalAuthContext;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated", a3);
  if ((_DWORD)v4)
  {
    -[SBLockElementViewProvider setAuthenticated:](self->_lockElement, "setAuthenticated:", 1);
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pearlSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemApertureDismissDelayAuth");
    -[SBLockScreenManager _setSystemApertureProudLockElementVisible:withReason:afterDelay:](self, "_setSystemApertureProudLockElementVisible:withReason:afterDelay:", 0, CFSTR("Authenticated"));

    if (self->_isInLostMode
      && -[SBLockScreenManager _needsBiometricAuthenticationToExitLostMode](self, "_needsBiometricAuthenticationToExitLostMode"))
    {
      -[SBLockScreenManager _presentLostModeBiometricAuthenticationTransientOverlay](self, "_presentLostModeBiometricAuthenticationTransientOverlay");
    }
    else
    {
      -[SBLockScreenManager _dismissLockScreenForAuthenticationIfNecessary](self, "_dismissLockScreenForAuthenticationIfNecessary");
    }
    lostModePreflightLocalAuthContext = self->_lostModePreflightLocalAuthContext;
    self->_lostModePreflightLocalAuthContext = 0;

  }
  else
  {
    self->_ignoringDelayDismissalPending = 0;
    -[SBLockScreenManager _showSystemApertureProudLockElementIfSupportedWithReason:](self, "_showSystemApertureProudLockElementIfSupportedWithReason:", CFSTR("Unauthenticated"));
    -[SBLockElementViewProvider setAuthenticated:](self->_lockElement, "setAuthenticated:", 0);
    if (-[SBLockScreenManager isUILocked](self, "isUILocked")
      || -[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive")
      || -[BSCompoundAssertion isActive](self->_lockScreenPresentationPendingAssertions, "isActive"))
    {
      if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
        -[SBLockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:animated:](self->_lockScreenOrientationManager, "updateInterfaceOrientationWithRequestedOrientation:animated:", 0, 0);
      -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activateMainPageWithCompletion:", 0);
    }
    else
    {
      v16[0] = CFSTR("SBUILockOptionsForceLockKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v16[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      v16[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 11, v15);

    }
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isLockScreenControlCenterAllowed");

    if ((v9 & 1) == 0)
    {
      +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissAnimated:", 0);

    }
  }
  -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAuthenticated:", v4);

  -[SBLockScreenBiometricAuthenticationCoordinator setAuthenticated:](self->_biometricAuthenticationCoordinator, "setAuthenticated:", v4);
}

- (void)_deviceBlockedChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (-[SBLockScreenManager isUILocked](self, "isUILocked", a3))
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isInSecureApp"))
    {
      v5 = -[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked");

      if (!v5)
      {
LABEL_6:
        -[SBLockScreenEnvironment blockedStateObserver](self->_lockScreenEnvironment, "blockedStateObserver");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "noteDeviceBlockedStatusUpdated");
LABEL_9:

        goto LABEL_10;
      }
      +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCoverSheetPresented:animated:withCompletion:", 1, 1, 0);
    }

    goto LABEL_6;
  }
  if (-[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked"))
  {
    v10[0] = CFSTR("SBUILockOptionsForceLockKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v10[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    v10[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 19, v9);

    goto LABEL_9;
  }
LABEL_10:
  -[SBLockScreenManager _evaluatePreArmDisabledAssertions](self, "_evaluatePreArmDisabledAssertions");
}

- (void)_resetOrRestoreStateChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (-[SBLockScreenManager isUILocked](self, "isUILocked", a3))
  {
    -[SBLockScreenEnvironment blockedStateObserver](self->_lockScreenEnvironment, "blockedStateObserver");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "noteResetRestoreStateUpdated");

    return;
  }
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRestoring"))
  {

  }
  else
  {
    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isResetting");

    if (!v6)
      return;
  }
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBacklightState:source:", 3, 25);

  v17[0] = CFSTR("SBUILockOptionsForceLockKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v17[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 6, v11);

  v15 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 6, v13);

}

- (void)_handleBacklightLevelWillChange:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAC300]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v8 = BSFloatGreaterThanFloat();
  -[SBLockScreenEnvironment backlightController](self->_lockScreenEnvironment, "backlightController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBacklightLevel:", v7);

  if (self->_isScreenOn != v8)
  {
    self->_isScreenOn = v8;
    if (v8)
    {
      -[SBCoverSheetBiometricResourceObserver reset](self->_biometricResourceObserver, "reset");
      -[SBLockScreenManager _setMesaCoordinatorDisabled:forReason:](self, "_setMesaCoordinatorDisabled:forReason:", 0, CFSTR("Screen off"));
      objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "noteScreenWillTurnOn");

      -[SBFMouseButtonDownGestureRecognizer setEnabled:](self->_mouseButtonDownGesture, "setEnabled:", 0);
      -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode");
      +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "completeOngoingPresentationIfNeeded");
    }
    else
    {
      -[SBLockScreenManager _setHomeButtonShowPasscodeRecognizer:](self, "_setHomeButtonShowPasscodeRecognizer:", 0);
      -[SBLockScreenManager _setMesaCoordinatorDisabled:forReason:](self, "_setMesaCoordinatorDisabled:forReason:", 1, CFSTR("Screen off"));
      objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "noteScreenDidTurnOff");

      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:", 0);
    }

  }
}

- (void)_handleBacklightDidTurnOff:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAC2E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 0, 0);
  if (v6 != 13)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteScreenDidTurnOff");

  }
  -[SBFMouseButtonDownGestureRecognizer setEnabled:](self->_mouseButtonDownGesture, "setEnabled:", 1);
  -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode");
}

- (void)_lockScreenDimmed:(id)a3
{
  void *v4;

  objc_msgSend((id)SBApp, "bannerManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissAllBannersInAllWindowScenesAnimated:reason:", 0, CFSTR("SBBannerManagerDismissalReasonLock"));

  -[SBLockScreenManager _clearAuthenticationLockAssertion](self, "_clearAuthenticationLockAssertion");
}

- (void)noteMenuButtonSinglePress
{
  -[SBLockScreenBiometricAuthenticationCoordinator _noteMenuButtonSinglePress](self->_biometricAuthenticationCoordinator, "_noteMenuButtonSinglePress");
}

- (void)noteMenuButtonDoublePress
{
  -[SBLockScreenBiometricAuthenticationCoordinator _noteMenuButtonDoublePress](self->_biometricAuthenticationCoordinator, "_noteMenuButtonDoublePress");
}

- (void)homeButtonSuppressAfterUnlockRecognizerRequestsEndOfSuppression:(id)a3
{
  SBHomeButtonSuppressAfterUnlockRecognizer *v5;
  SBHomeButtonSuppressAfterUnlockRecognizer *homeButtonSuppressAfterUnlockRecognizer;
  void *v7;
  void *v8;
  void *v9;
  SBHomeButtonSuppressAfterUnlockRecognizer *v10;

  v5 = (SBHomeButtonSuppressAfterUnlockRecognizer *)a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 3511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognizer"));

    v5 = 0;
  }
  homeButtonSuppressAfterUnlockRecognizer = self->_homeButtonSuppressAfterUnlockRecognizer;
  if (!homeButtonSuppressAfterUnlockRecognizer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 3512, CFSTR("Unexpectedly received end of suppresion from a SBHomeButtonSuppressAfterUnlock recognizer but there is no active one"));

    v5 = v10;
    homeButtonSuppressAfterUnlockRecognizer = self->_homeButtonSuppressAfterUnlockRecognizer;
  }
  if (homeButtonSuppressAfterUnlockRecognizer != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 3513, CFSTR("Unexpectedly received end of suppression from a SBHomeButtonSuppressAfterUnlock recognizer but it is not the active one"));

  }
  -[SBLockScreenManager _setHomeButtonSuppressAfterUnlockRecognizer:](self, "_setHomeButtonSuppressAfterUnlockRecognizer:", 0);

}

- (BOOL)handlesHomeButtonSinglePresses
{
  return -[SBLockScreenManager isUILocked](self, "isUILocked")
      || -[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive")
      || self->_homeButtonSuppressAfterUnlockRecognizer != 0;
}

- (void)remoteLock:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if (a3
    && -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet"))
  {
    -[SBLockScreenManager _lockFeaturesForRemoteLock:](self, "_lockFeaturesForRemoteLock:", 1);
  }
  v8[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  v8[2] = CFSTR("SBUILockOptionsForceLockKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 21, v7);

}

- (void)_lockFeaturesForRemoteLock:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockScreenDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLimitFeaturesForRemoteLock:", v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DAC320];
  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0DAC438]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", v6, 0, v9);

}

- (void)activateLostModeForRemoteLock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *bannerSuppressionAssertion;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (!self->_isInLostMode)
  {
    v3 = a3;
    self->_isInLostMode = 1;
    objc_msgSend((id)SBApp, "userSessionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "canLogout"))
    {
      objc_msgSend(v5, "logout");
    }
    else
    {
      +[SBMediaController sharedInstance](SBMediaController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopForEventSource:", 5);

      +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "disconnectAllCalls");

      +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endFaceTime");

      if (!-[SBLockScreenManager isUILocked](self, "isUILocked"))
      {
        v17[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v9;
        v17[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v10;
        v17[2] = CFSTR("SBUILockOptionsForceLockKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 20, v12);

      }
      -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 0, 1);
      -[SBLockScreenManager enableLostModePlugin](self, "enableLostModePlugin");
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setForceAlertsToPend:forReason:", 1, CFSTR("SBLockScreenManagerPendAlertsForLostMode"));

      objc_msgSend((id)SBApp, "bannerManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acquireBannerSuppressionAssertionForReason:", CFSTR("SBLockScreenManagerBusyForLostMode"));
      v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
      self->_bannerSuppressionAssertion = v15;

      if (v3)
        SBWorkspaceTerminateAllApps(5, 0, CFSTR("entering lost mode"), 0);
    }

  }
}

- (void)exitLostModeIfNecessaryFromRemoteRequest:(BOOL)a3
{
  void *v4;
  void *v5;
  BSInvalidatable *bannerSuppressionAssertion;

  if (self->_isInLostMode)
  {
    self->_isInLostMode = 0;
    if (a3)
    {
      -[SBLockScreenManager _lockFeaturesForRemoteLock:](self, "_lockFeaturesForRemoteLock:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "disableLostMode");

    }
    -[SBLockScreenManager _maybeLaunchSetupForcingCheckIfNotBricked:](self, "_maybeLaunchSetupForcingCheckIfNotBricked:", 1);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForceAlertsToPend:forReason:", 0, CFSTR("SBLockScreenManagerPendAlertsForLostMode"));

    -[BSInvalidatable invalidate](self->_bannerSuppressionAssertion, "invalidate");
    bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
    self->_bannerSuppressionAssertion = 0;

  }
}

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (void)enableLostModePlugin
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location[2];

  if (self->_isInLostMode)
  {
    -[SBLockScreenEnvironment pluginPresenter](self->_lockScreenEnvironment, "pluginPresenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, v3);

    -[SBLockScreenEnvironment passcodeViewPresenter](self->_lockScreenEnvironment, "passcodeViewPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__SBLockScreenManager_enableLostModePlugin__block_invoke;
    v6[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v7, location);
    objc_msgSend(v4, "setPasscodeLockVisible:animated:completion:", 0, 0, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "We wanted to enable the lost mode plugin but we don't think we're in lost mode.", (uint8_t *)location, 2u);
    }

  }
}

void __43__SBLockScreenManager_enableLostModePlugin__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Enabling lost mode plugin since we are in lost mode.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", CFSTR("FindMyiPhoneLockScreen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "enableLockScreenPluginWithContext:", v4);

}

- (void)_presentLostModeBiometricAuthenticationTransientOverlay
{
  SBLostModeBiometricAuthenticationTransientOverlayViewController *v3;
  void *v4;
  SBLostModeBiometricAuthenticationTransientOverlayViewController *v5;
  SBLostModeBiometricAuthenticationTransientOverlayViewController *lostModeBiometricAuthenticationTransientOverlay;
  id v7;

  if (!self->_lostModeBiometricAuthenticationTransientOverlay)
  {
    v3 = [SBLostModeBiometricAuthenticationTransientOverlayViewController alloc];
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBLostModeBiometricAuthenticationTransientOverlayViewController initWithLockScreenManager:biometricResource:](v3, "initWithLockScreenManager:biometricResource:", self, v4);
    lostModeBiometricAuthenticationTransientOverlay = self->_lostModeBiometricAuthenticationTransientOverlay;
    self->_lostModeBiometricAuthenticationTransientOverlay = v5;

    -[SBLostModeBiometricAuthenticationTransientOverlayViewController setDelegate:](self->_lostModeBiometricAuthenticationTransientOverlay, "setDelegate:", self);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentTransientOverlayViewController:animated:completion:", self->_lostModeBiometricAuthenticationTransientOverlay, 1, 0);

  }
}

- (void)_dismissLostModeBiometricAuthenticationTransientOverlay
{
  void *v3;
  SBLostModeBiometricAuthenticationTransientOverlayViewController *lostModeBiometricAuthenticationTransientOverlay;

  if (self->_lostModeBiometricAuthenticationTransientOverlay)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissTransientOverlayViewController:animated:completion:", self->_lostModeBiometricAuthenticationTransientOverlay, 1, 0);

    lostModeBiometricAuthenticationTransientOverlay = self->_lostModeBiometricAuthenticationTransientOverlay;
    self->_lostModeBiometricAuthenticationTransientOverlay = 0;

  }
}

- (void)_relockUIForLostMode
{
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  -[SBLockScreenManager _dismissLostModeBiometricAuthenticationTransientOverlay](self, "_dismissLostModeBiometricAuthenticationTransientOverlay");
  v4[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  v4[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
  v5[0] = MEMORY[0x1E0C9AAA0];
  v5[1] = MEMORY[0x1E0C9AAB0];
  v4[2] = CFSTR("SBUILockOptionsForceLockKey");
  v4[3] = CFSTR("SBUILockOptionsForceBioLockoutKey");
  v5[2] = MEMORY[0x1E0C9AAB0];
  v5[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 20, v3);

}

- (BOOL)_needsBiometricAuthenticationToExitLostMode
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  BOOL v8;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 isInFamiliarLocationToExitLostMode;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEnrolledIdentities");

  v5 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0CC12C8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled");

  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  v10 = !v8 && v7 != 0 && !self->_isInFamiliarLocationToExitLostMode;
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    isInFamiliarLocationToExitLostMode = self->_isInFamiliarLocationToExitLostMode;
    v14[0] = 67110144;
    v14[1] = v10;
    v15 = 1024;
    v16 = v4;
    v17 = 1024;
    v18 = v5;
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = isInFamiliarLocationToExitLostMode;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[Lost Mode Exit] needsBioAuth: %{BOOL}u, bioIdentityEnrolled: %{BOOL}u, featureEnabled: %{BOOL}u, deviceProtectionEnabled: %{BOOL}u, isInFamiliarLocation: %{BOOL}u", (uint8_t *)v14, 0x20u);
  }

  return v10;
}

- (void)_runPreflightLocationBasedEvaluationToExitLostModeIfNecessary
{
  LAContext *v3;
  LAContext *lostModePreflightLocalAuthContext;
  LAContext *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (self->_isInLostMode && !self->_lostModePreflightLocalAuthContext)
  {
    v3 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    lostModePreflightLocalAuthContext = self->_lostModePreflightLocalAuthContext;
    self->_lostModePreflightLocalAuthContext = v3;

    objc_initWeak(&location, self);
    v5 = self->_lostModePreflightLocalAuthContext;
    v10[0] = &unk_1E91D2348;
    v10[1] = &unk_1E91D22E8;
    v11[0] = MEMORY[0x1E0C9AAB0];
    v11[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__SBLockScreenManager__runPreflightLocationBasedEvaluationToExitLostModeIfNecessary__block_invoke;
    v7[3] = &unk_1E8EC1438;
    objc_copyWeak(&v8, &location);
    -[LAContext evaluatePolicy:options:reply:](v5, "evaluatePolicy:options:reply:", 1025, v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __84__SBLockScreenManager__runPreflightLocationBasedEvaluationToExitLostModeIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[352] = a3 == 0;

}

- (void)activationChanged:(id)a3
{
  -[SBLockScreenManager _maybeLaunchSetupForcingCheckIfNotBricked:](self, "_maybeLaunchSetupForcingCheckIfNotBricked:", 0);
}

- (void)_maybeLaunchSetupForcingCheckIfNotBricked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t v28[8];
  _QWORD v29[4];
  _QWORD v30[5];

  v3 = a3;
  v30[4] = *MEMORY[0x1E0C80C00];
  +[SBLockdownManager sharedInstance](SBLockdownManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "brickedDevice");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelEventsWithName:", CFSTR("HandleActivationChanged"));

    +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupDefaults");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "setDeviceSetup:", 0);

    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v10, "updateInSetupMode");

    if ((v9 & 1) != 0)
    {
      SBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[SBLockScreenManager _maybeLaunchSetupForcingCheckIfNotBricked:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

      __65__SBLockScreenManager__maybeLaunchSetupForcingCheckIfNotBricked___block_invoke();
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setupDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInSetupModeForActivationChange:", 1);
    }
    else
    {
      if (-[SBLockScreenManager isUILocked](self, "isUILocked"))
        return;
      SBLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, "Locking the UI", v28, 2u);
      }

      +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "disconnectAllCalls");

      v29[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v19;
      v29[1] = CFSTR("SBUILockOptionsAnimateLockScreenActivationKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v20;
      v29[2] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v25;
      v29[3] = CFSTR("SBUILockOptionsForceLockKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenManager lockUIFromSource:withOptions:](self, "lockUIFromSource:withOptions:", 18, v27);

    }
  }
  else if (v3)
  {
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "updateInSetupMode");

    if (v22)
      __65__SBLockScreenManager__maybeLaunchSetupForcingCheckIfNotBricked___block_invoke();
  }
}

void __65__SBLockScreenManager__maybeLaunchSetupForcingCheckIfNotBricked___block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  BKSHIDServicesAmbientLightSensorEnableAutoBrightness();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setupApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Activating Setup because we think we're bricked.", v7, 2u);
  }

  SBWorkspaceActivateApplication(v1);
  objc_msgSend((id)SBApp, "bannerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuspended:forReason:", 1, CFSTR("com.apple.purplebuddy"));

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != 1)
  {
LABEL_7:
    objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", 1, 1, 0, CFSTR("Setting orientation to Portrait for unlock to Setup."));
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeferringDeviceOrientationUpdates:", 1);

  }
LABEL_8:

}

- (BOOL)_shouldBeInSetupMode
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  _BOOL4 v8;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isInSetupMode");
  objc_msgSend(v4, "setupDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "inSetupModeForActivationChange");

  if (!v5
    || (objc_msgSend((id)SBApp, "caseIsEnabledAndLatched") & 1) != 0
    || ((objc_msgSend(v3, "setupHasFinishedRestoringFromBackup") | v7) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = !-[SBLockScreenManager isInLostMode](self, "isInLostMode");
  }

  return v8;
}

- (BOOL)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  void *v4;
  uint64_t IntegerValue;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  if (a3)
  {
    BKSHIDEventGetBaseAttributes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "source") & 0xFFFFFFFD) == 1)
    {
      IntegerValue = IOHIDEventGetIntegerValue();
      if (-[SBLockScreenManager isUILocked](self, "isUILocked"))
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "transientOverlayPresentationManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hasActivePresentation");

      }
      else
      {
        v8 = 1;
      }
      v10 = -[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked");
      v9 = 0;
      if (!IntegerValue || (v8 & 1) != 0 || (v10 & 1) != 0)
        goto LABEL_15;
      if (-[SBLockScreenManager _shouldUnlockUIOnKeyDownEvent](self, "_shouldUnlockUIOnKeyDownEvent"))
      {
        -[SBLockScreenEnvironment customActionStore](self->_lockScreenEnvironment, "customActionStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_customLockScreenActionContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0DA9EA0]);
          objc_msgSend(v13, "setConfirmedNotInPocket:", 1);
          objc_msgSend(v11, "setCustomLockScreenActionContext:", v13);

        }
        -[SBLockScreenManager unlockUIFromSource:withOptions:](self, "unlockUIFromSource:withOptions:", 2, 0);

        v9 = 1;
        goto LABEL_15;
      }
    }
    v9 = 0;
LABEL_15:

    return v9;
  }
  return 0;
}

- (BOOL)_shouldUnlockUIOnKeyDownEvent
{
  void *v3;
  void *v4;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;

  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isShowingSystemModalAlert");

  v8 = +[SBAssistantController isVisible](SBAssistantController, "isVisible");
  +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isVisible");

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bannerDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPresentingBannerInLongLook");

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCoverSheetHostingAnApp");

  if (!-[SBLockScreenManager isUILocked](self, "isUILocked")
    || (v7 & 1) != 0
    || v8
    || (v10 & 1) != 0
    || (v13 & 1) != 0
    || (v15 & 1) != 0)
  {
    return 0;
  }
  -[SBLockScreenEnvironment lockController](self->_lockScreenEnvironment, "lockController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldUnlockUIOnKeyDownEvent");

  return v17;
}

- (void)addLockStateObserver:(id)a3
{
  id v5;
  NSHashTable *lockStateObservers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 3850, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  lockStateObservers = self->_lockStateObservers;
  if (!lockStateObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lockStateObservers;
    self->_lockStateObservers = v7;

    v5 = v10;
    lockStateObservers = self->_lockStateObservers;
  }
  -[NSHashTable addObject:](lockStateObservers, "addObject:", v5);
  if (-[SBLockScreenManager isUILocked](self, "isUILocked"))
    objc_msgSend(v10, "lockStateProvider:didUpdateIsUILocked:", self, 1);

}

- (void)removeLockStateObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenManager.m"), 3862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_lockStateObservers, "removeObject:", v5);

}

- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4
{
  id v6;
  id v7;
  SBLockScreenUnlockRequest *v8;
  uint64_t v9;
  SBLockScreenUnlockRequest *unlockRequest;

  v6 = a4;
  if (!self->_unlockRequest)
  {
    v7 = a3;
    v8 = objc_alloc_init(SBLockScreenUnlockRequest);
    -[SBLockScreenUnlockRequest setName:](v8, "setName:", CFSTR("Unlock For Passcode Entry Alert View Controller"));
    v9 = objc_msgSend(v7, "intent");

    -[SBLockScreenUnlockRequest setIntent:](v8, "setIntent:", v9);
    unlockRequest = self->_unlockRequest;
    self->_unlockRequest = v8;

  }
  -[SBLockScreenManager attemptUnlockWithPasscode:](self, "attemptUnlockWithPasscode:", v6);

  return 1;
}

- (void)passcodeEntryTransientOverlayViewControllerDidDisappear:(id)a3
{
  if (self->_passcodeEntryTransientOverlayViewController == a3)
    -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 0, 1);
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  id v4;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, self->_passcodeEntryTransientOverlayViewControllerPresentedAnimated, 0);

}

- (void)passcodeEntryTransientOverlayViewControllerRequestsEmergencyCall:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInSecureApp") ^ 1;

  -[SBLockScreenEnvironment callController](self->_lockScreenEnvironment, "callController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "launchEmergencyDialerAnimated:", v5);

  -[SBLockScreenManager setPasscodeVisible:animated:](self, "setPasscodeVisible:animated:", 0, 1);
}

- (BOOL)passcodeEntryTransientOverlayViewControllerDidDetectFaceOcclusionsSinceScreenOn:(id)a3
{
  void *v3;
  char v4;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didDetectFaceOcclusionsSinceScreenOn");

  return v4;
}

- (BOOL)passcodeEntryTransientOverlayViewControllerDidDetectBottomFaceOcclusionsSinceScreenOn:(id)a3
{
  void *v3;
  char v4;

  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didDetectBottomFaceOcclusionsSinceScreenOn");

  return v4;
}

- (id)passcodeEntryTransientOverlayViewControllerStatusText
{
  return -[SBLockScreenUnlockRequest title](self->_unlockRequest, "title");
}

- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText
{
  return -[SBLockScreenUnlockRequest subtitle](self->_unlockRequest, "subtitle");
}

- (void)extendedKeybagLockStateChanged:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3
    && !-[SBLockScreenManager isUILocked](self, "isUILocked")
    && !-[SBLockScreenManager isLockScreenActive](self, "isLockScreenActive")
    && (-[BSCompoundAssertion isActive](self->_lockScreenPresentationPendingAssertions, "isActive") & 1) == 0)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockUIFromSource:withOptions:", 11, v6);

  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (!a3)
    -[SBLockScreenManager _evaluateWallpaperMode](self, "_evaluateWallpaperMode");
}

- (void)hideDimmingLayerDidChange:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesDimmingLayer:", v3);

}

- (void)backlightController:(id)a3 didUpdateDigitizerDisabled:(BOOL)a4 tapToWakeEnabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  SBTapToWakeController *tapToWakeController;
  uint64_t v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  v8 = v6 & v5;
  -[SBTapToWakeController setDigitizerInTapToWakeMode:](self->_tapToWakeController, "setDigitizerInTapToWakeMode:", v8);
  tapToWakeController = self->_tapToWakeController;
  if ((_DWORD)v8 == 1)
    v10 = objc_msgSend(v11, "tapToWakeRequiresHitTestSuppression");
  else
    v10 = 0;
  -[SBTapToWakeController setDigitizerModeRequiresHitTestSuppression:](tapToWakeController, "setDigitizerModeRequiresHitTestSuppression:", v10);

}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  id v7;
  char v8;
  id v9;

  v7 = a3;
  if (a4 != 3)
  {
    v9 = v7;
    v8 = -[SBFUserAuthenticationController hasPasscodeSet](self->_userAuthController, "hasPasscodeSet");
    v7 = v9;
    if ((v8 & 1) == 0)
    {
      -[SBLockScreenManager _setSystemApertureProudLockElementVisible:backlightState:withReason:](self, "_setSystemApertureProudLockElementVisible:backlightState:withReason:", 0, a4, CFSTR("BacklightInactive"));
      v7 = v9;
    }
  }

}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (a4 == 3)
  {
    -[SBLockScreenManager _clearAuthenticationLockAssertion](self, "_clearAuthenticationLockAssertion", a3, 3, a5);
    if (-[SBLockScreenManager _requiresEmptyLockElementForBacklightState:](self, "_requiresEmptyLockElementForBacklightState:", 3))
    {
      -[SBLockElementViewProvider setEmpty:](self->_lockElement, "setEmpty:", 1);
    }
    -[SBLockScreenManager _showSystemApertureProudLockElementForBacklightState:WithReason:](self, "_showSystemApertureProudLockElementForBacklightState:WithReason:", 3, CFSTR("BacklightInactive"));
  }
}

- (BOOL)_shouldEmulateInterstitialPresentationForAccessibility:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v5 = UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSAssistiveTouchEnabled() != 0;
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v6 && (!v3 || v5))
    v7 = SBFEffectiveHomeButtonType() == 2;

  return v7;
}

- (void)_emulateInterstitialPasscodePresentationForAccessibility:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  -[SBLockScreenManager coverSheetViewController](self, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBLockScreenManager _shouldEmulateInterstitialPresentationForAccessibility:](self, "_shouldEmulateInterstitialPresentationForAccessibility:", v3))
  {
    objc_msgSend(v5, "prepareForInterstitialPresentation");
    objc_msgSend(v5, "updateInterstitialPresentationWithProgress:", 0.0);
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0CEABB0];
      v7 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke;
      v10[3] = &unk_1E8E9DED8;
      v11 = v5;
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke_2;
      v8[3] = &unk_1E8E9E980;
      v9 = v11;
      objc_msgSend(v6, "animateWithDuration:animations:completion:", v10, v8, 0.4);

    }
    else
    {
      objc_msgSend(v5, "cleanupInterstitialPresentationToPresented:inPlace:", 1, 0);
    }
  }

}

uint64_t __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInterstitialPresentationWithProgress:", 1.0);
}

uint64_t __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupInterstitialPresentationToPresented:inPlace:", 1, 0);
}

- (SBLockScreenEnvironment)lockScreenEnvironment
{
  return self->_lockScreenEnvironment;
}

- (BOOL)isUIUnlocking
{
  return self->_uiUnlocking;
}

- (void)setUIUnlocking:(BOOL)a3
{
  self->_uiUnlocking = a3;
}

- (SBFLockOutStatusProvider)_lockOutController
{
  return self->_lockOutController;
}

- (void)_setLockOutController:(id)a3
{
  objc_storeStrong((id *)&self->_lockOutController, a3);
}

- (SBFUserAuthenticationController)_userAuthController
{
  return self->_userAuthController;
}

- (SBLiftToWakeManager)_liftToWakeManager
{
  return self->_liftToWakeManager;
}

- (void)_setLiftToWakeManager:(id)a3
{
  objc_storeStrong((id *)&self->_liftToWakeManager, a3);
}

- (SBTapToWakeController)_tapToWakeController
{
  return self->_tapToWakeController;
}

- (void)_setTapToWakeController:(id)a3
{
  objc_storeStrong((id *)&self->_tapToWakeController, a3);
}

- (SBMotionDetectionWakeController)_motionDetectionWakeController
{
  return self->_motionDetectionWakeController;
}

- (void)_setMotionDetectionWakeController:(id)a3
{
  objc_storeStrong((id *)&self->_motionDetectionWakeController, a3);
}

- (SBLockScreenOrientationManager)lockScreenOrientationManager
{
  return self->_lockScreenOrientationManager;
}

- (BOOL)isWaitingToLockUI
{
  return self->_isWaitingToLockUI;
}

- (id)unlockActionBlock
{
  return self->_unlockActionBlock;
}

- (void)setUnlockActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockActionBlock, 0);
  objc_storeStrong((id *)&self->_lockScreenOrientationManager, 0);
  objc_storeStrong((id *)&self->_lostModePreflightLocalAuthContext, 0);
  objc_storeStrong((id *)&self->_lostModeBiometricAuthenticationTransientOverlay, 0);
  objc_storeStrong((id *)&self->_lockElementBloomSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_lockElementSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_motionDetectionIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenPresentationPendingAssertions, 0);
  objc_storeStrong((id *)&self->_delayedLockReason, 0);
  objc_storeStrong((id *)&self->_lockElement, 0);
  objc_storeStrong((id *)&self->_proudLockAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_authenticationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_mesaUnlockingDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_mesaAutoUnlockingDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_mesaWalletPreArmDisabledReasons, 0);
  objc_storeStrong((id *)&self->_mesaWalletPreArmDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_mesaCoordinatorDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_motionDetectionWakeController, 0);
  objc_storeStrong((id *)&self->_mouseButtonDownGesture, 0);
  objc_storeStrong((id *)&self->_tapToWakeController, 0);
  objc_storeStrong((id *)&self->_liftToWakeManager, 0);
  objc_storeStrong((id *)&self->_userAuthController, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong(&self->_alertLaunchFinish, 0);
  objc_storeStrong((id *)&self->_wakeToRemoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_autoUnlockRuleAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenDisabledAssertionManager, 0);
  objc_storeStrong((id *)&self->_sustainAuthenticationWhileUIUnlockedAssertion, 0);
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_unlockRequest, 0);
  objc_storeStrong((id *)&self->_lockStateObservers, 0);
  objc_storeStrong((id *)&self->_homeButtonSuppressAfterUnlockRecognizer, 0);
  objc_storeStrong((id *)&self->_homeButtonShowPasscodeRecognizer, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
  objc_storeStrong((id *)&self->_pearlInterlockObserver, 0);
  objc_storeStrong((id *)&self->_biometricResourceObserver, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationCoordinator, 0);
}

- (void)lockUIFromSource:(os_log_t)log withOptions:completion:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[SBLockScreenManager lockUIFromSource:withOptions:completion:]";
  v3 = 1024;
  v4 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "%s unknown lock source %d; ignoring.",
    (uint8_t *)&v1,
    0x12u);
}

- (void)handleTransitionRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "transition away from the lock screen requested, but an externalLockProvider still requires unlock. Dropping request.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "Error while launching capture application (%@): %@", (uint8_t *)&v6, 0x16u);

}

- (void)_unlockWithRequest:(const char *)a1 cancelPendingRequests:completion:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_20();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_maybeLaunchSetupForcingCheckIfNotBricked:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Launching buddy", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
