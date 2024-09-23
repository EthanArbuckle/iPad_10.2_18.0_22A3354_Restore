@implementation SBAssistantSession

- (SBAssistantSession)initWithWindowScene:(id)a3 operationQueue:(id)a4 gestureConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBAssistantSession *v11;
  SBAssistantSessionPresentationContext *v12;
  SBAssistantSessionPresentationContext *presentationContext;
  uint64_t v14;
  SBAssistantContext *context;
  void *v16;
  void *v17;
  uint64_t v18;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SBAssistantSession;
  v11 = -[SBAssistantSession init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(SBAssistantSessionPresentationContext);
    presentationContext = v11->_presentationContext;
    v11->_presentationContext = v12;

    objc_storeWeak((id *)&v11->_windowScene, v8);
    objc_storeStrong((id *)&v11->_operationQueue, a4);
    +[SBAssistantContext contextForWindowScene:](SBAssistantContext, "contextForWindowScene:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    context = v11->_context;
    v11->_context = (SBAssistantContext *)v14;

    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneDeactivationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "newAssertionWithReason:", 4);
    resignActiveAssertion = v11->_resignActiveAssertion;
    v11->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v18;

    objc_storeStrong((id *)&v11->_gestureConfiguration, a5);
  }

  return v11;
}

- (void)dealloc
{
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  void *v4;
  void *v5;
  void *v6;
  BSInvalidatable *displayLayoutAssertion;
  BSInvalidatable *suspendWallpaperAnimationAssertion;
  BSInvalidatable *hideApplicationModalAlertsAssertion;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  BSInvalidatable *traitsOrientationPolicySpecifier;
  objc_super v12;

  if (-[UIApplicationSceneDeactivationAssertion isAcquired](self->_resignActiveAssertion, "isAcquired"))
    -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
  resignActiveAssertion = self->_resignActiveAssertion;
  self->_resignActiveAssertion = 0;

  if (self->_hidingOtherWindows)
  {
    -[SBAssistantContext windowHidingManager](self->_context, "windowHidingManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopHidingWindowsForContext:", self);

    self->_hidingOtherWindows = 0;
  }
  if (self->_pendingAlerts)
  {
    -[SBAssistantContext alertItemsController](self->_context, "alertItemsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForceAlertsToPend:forReason:", 0, CFSTR("AssistantSession"));

    self->_pendingAlerts = 0;
  }
  if (self->_providingCoverSheetBehavior)
  {
    -[SBAssistantContext coverSheetViewController](self->_context, "coverSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterExternalBehaviorProvider:", self);

    self->_providingCoverSheetBehavior = 0;
  }
  -[BSInvalidatable invalidate](self->_displayLayoutAssertion, "invalidate");
  displayLayoutAssertion = self->_displayLayoutAssertion;
  self->_displayLayoutAssertion = 0;

  -[BSInvalidatable invalidate](self->_suspendWallpaperAnimationAssertion, "invalidate");
  suspendWallpaperAnimationAssertion = self->_suspendWallpaperAnimationAssertion;
  self->_suspendWallpaperAnimationAssertion = 0;

  -[BSInvalidatable invalidate](self->_hideApplicationModalAlertsAssertion, "invalidate");
  hideApplicationModalAlertsAssertion = self->_hideApplicationModalAlertsAssertion;
  self->_hideApplicationModalAlertsAssertion = 0;

  -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  self->_deferOrientationUpdatesAssertion = 0;

  -[BSInvalidatable invalidate](self->_traitsOrientationPolicySpecifier, "invalidate");
  traitsOrientationPolicySpecifier = self->_traitsOrientationPolicySpecifier;
  self->_traitsOrientationPolicySpecifier = 0;

  v12.receiver = self;
  v12.super_class = (Class)SBAssistantSession;
  -[SBAssistantSession dealloc](&v12, sel_dealloc);
}

- (SBAssistantRootViewController)assistantRootViewController
{
  void *v2;
  void *v3;

  -[SBAssistantSession assistantWindow](self, "assistantWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistantRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAssistantRootViewController *)v3;
}

- (SBAssistantSessionPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentationContext, a3);
    -[SBAssistantSession _didChangePresentationContext](self, "_didChangePresentationContext");
  }

}

- (void)assertWindowLevel:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %f", (uint8_t *)&v8, 0x16u);

  }
  -[SBAssistantSession assistantWindow](self, "assistantWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWindowLevel:", a3);

  -[SBAssistantSession _updateAssistantAccessoryWindowWindowLevel](self, "_updateAssistantAccessoryWindowWindowLevel");
}

- (BOOL)shouldAllowBiometricAutoUnlock
{
  void *v2;
  void *v3;
  char v4;

  -[SBAssistantSession presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriPresentationOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "shouldAllowBiometricAutoUnlock");
  else
    v4 = 0;

  return v4;
}

- (BOOL)contentObscuresScreen
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return -[SBAssistantSession isVisible](self, "isVisible");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1)
      return -[SBAssistantSession isVisible](self, "isVisible");
  }
  if (-[SBAssistantSession isVisible](self, "isVisible"))
  {
    -[SBAssistantSession gestureManager](self, "gestureManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "gesturesImplyFullscreenContent") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)noteKeyboardWillAppear
{
  void *v3;
  id v4;

  -[SBAssistantSession presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setKeyboardVisible:", 1);
  -[SBAssistantSession setPresentationContext:](self, "setPresentationContext:", v4);

}

- (void)noteKeyboardWillDisappear
{
  void *v3;
  id v4;

  -[SBAssistantSession presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setKeyboardVisible:", 0);
  -[SBAssistantSession setPresentationContext:](self, "setPresentationContext:", v4);

}

- (void)assistantGestureManagerDidRecognizeDismissGesture:(id)a3 preferredDismissalOptions:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBAssistantSession delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistantSession:requestsDismissalWithDismissalOptions:", self, v5);

}

- (void)presentSiriPresentationViewController:(id)a3 withAnimationFactory:(id)a4 siriPresentationOptions:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(id *);
  void *v25;
  SBAssistantSession *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  SEL v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke;
  v25 = &unk_1E8EADBA0;
  v30 = v14;
  v31 = a2;
  v26 = self;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v14;
  v19 = (void *)MEMORY[0x1D17E5550](&v22);
  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("Siri Content Presentation"), v19, v22, v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession operationQueue](self, "operationQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "executeOrInsertEvent:atPosition:", v20, 1);

}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  SBAssistantWindow *v8;
  id WeakRetained;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  SBAssistantGestureManager *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  double v34;
  BOOL v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  NSObject *v67;
  id v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  _QWORD v83[4];
  NSObject *v84;
  _QWORD v85[4];
  NSObject *v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  NSObject *v90;
  _QWORD v91[4];
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  BOOL v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  BOOL v108;
  const __CFString *v109;
  void *v110;
  uint8_t buf[4];
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v112 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(a1[4], "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isAssistantPresented"))
  {
    objc_msgSend(a1[4], "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquireLockForReason:", CFSTR("Siri Content Presentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)a1[4] + 6, a1[5]);
    v8 = [SBAssistantWindow alloc];
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 20);
    v10 = -[SBAssistantWindow initWithWindowScene:role:debugName:](v8, "initWithWindowScene:role:debugName:", WeakRetained, CFSTR("SBTraitsParticipantRoleAssistant"), CFSTR("Siri Content"));
    v11 = a1[4];
    v12 = (void *)v11[5];
    v11[5] = v10;

    objc_msgSend(*((id *)a1[4] + 5), "assistantRootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSiriPresentationViewController:", a1[5]);

    v14 = -[SBAssistantGestureManager initWithAssistantWindow:gestureConfiguration:context:]([SBAssistantGestureManager alloc], "initWithAssistantWindow:gestureConfiguration:context:", *((_QWORD *)a1[4] + 5), *((_QWORD *)a1[4] + 13), *((_QWORD *)a1[4] + 11));
    v15 = a1[4];
    v16 = (void *)v15[14];
    v15[14] = v14;

    objc_msgSend(*((id *)a1[4] + 14), "setDelegate:");
    objc_msgSend(a1[4], "assistantRootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "controlCenterController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lockScreenEnvironment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootViewController");
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "wallpaperController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = v19;
    v81 = objc_msgSend(v19, "isPresented");
    objc_msgSend(a1[4], "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "iconController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v25, "areAnyIconViewContextMenusShowing");

    objc_msgSend(a1[4], "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lockScreenManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)v22;
    if ((objc_msgSend(v27, "isUILocked") & 1) != 0)
    {
      objc_msgSend(a1[4], "context");
      v28 = v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "transientOverlayPresenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasActivePresentation");

      v7 = v28;
      v32 = (v22 != 0) & ~v31;
    }
    else
    {

      v32 = 0;
    }
    objc_msgSend(a1[5], "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "duration");
    v35 = fabs(v34) >= 2.22044605e-16;
    v36 = MEMORY[0x1E0C809B0];
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_50;
    v101[3] = &unk_1E8EACED0;
    v102 = v4;
    v37 = a1[7];
    v38 = a1[4];
    v103 = v37;
    v104 = v38;
    v108 = v35;
    v39 = v17;
    v105 = v39;
    v40 = v33;
    v106 = v40;
    v107 = a1[5];
    v41 = MEMORY[0x1D17E5550](v101);
    v94[0] = v36;
    v94[1] = 3221225472;
    v94[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_2;
    v94[3] = &unk_1E8EA0910;
    v95 = a1[5];
    v42 = v39;
    v43 = a1[4];
    v76 = v42;
    v96 = v42;
    v97 = v43;
    v100 = v35;
    v99 = a1[8];
    v75 = v7;
    v98 = v75;
    v44 = (void *)MEMORY[0x1D17E5550](v94);
    v45 = dispatch_group_create();
    v46 = (void *)MEMORY[0x1D17E5550](v44);
    UIKeyboardForceOrderOutAutomaticAnimated();
    v78 = v4;
    v74 = v44;
    if (((v81 | v80) & 1) == 0)
    {
      objc_msgSend(v82, "dismissAnimated:", 1);
      if (v32)
      {
        if (SBScreenIsBlanked())
        {
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(v79, "requireWallpaperWithReason:", CFSTR("AssistantSession"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
          objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
        }
        else
        {
          objc_msgSend(v79, "requireWallpaperWithReason:", CFSTR("AssistantSession"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_3;
        v91[3] = &unk_1E8E9F1E8;
        v93 = v44;
        v48 = v47;
        v92 = v48;
        v49 = MEMORY[0x1D17E5550](v91);

        v50 = a1[7];
        if (!v50 || objc_msgSend(v50, "wakeScreen"))
        {
          objc_msgSend(a1[4], "context");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "lockScreenManager");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v72 = v48;
          v53 = v49;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v54;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "unlockUIFromSource:withOptions:", 12, v55);

          v49 = v53;
          v48 = v72;

        }
        objc_msgSend(a1[4], "context");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "lockScreenManager");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setPasscodeVisible:animated:", 0, 1);

        v46 = (void *)v49;
      }
    }
    (*(void (**)(uint64_t))(v41 + 16))(v41);
    objc_msgSend(a1[4], "context");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "iconController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "iconManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = (void *)v41;
    if (((v81 | v80) & 1) != 0
      || objc_msgSend(v60, "areAnyIconShareSheetsShowing"))
    {
      objc_msgSend(v40, "setAlpha:", 0.0);
      if (!v81)
      {
        v61 = v77;
        if (v80)
        {
          objc_msgSend(a1[4], "context");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "iconController");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "dismissAppIconForceTouchControllers:", 0);

        }
        else if (objc_msgSend(v60, "areAnyIconShareSheetsShowing"))
        {
          objc_msgSend(v60, "dismissIconShareSheets");
        }
        goto LABEL_27;
      }
      dispatch_group_enter(v45);
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_4;
      v89[3] = &unk_1E8E9DED8;
      v90 = v45;
      objc_msgSend(v82, "dismissAnimated:completion:", 1, v89);

    }
    else
    {
      objc_msgSend(v40, "setAlpha:", 1.0);
    }
    v61 = v77;
LABEL_27:
    dispatch_group_enter(v45);
    v64 = (void *)MEMORY[0x1E0D01908];
    v65 = a1[6];
    v66 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_5;
    v87[3] = &unk_1E8E9DED8;
    v88 = v40;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_6;
    v85[3] = &unk_1E8E9E980;
    v67 = v45;
    v86 = v67;
    v68 = v40;
    objc_msgSend(v64, "animateWithFactory:actions:completion:", v65, v87, v85);
    dispatch_group_enter(v67);
    v70 = a1[5];
    v69 = a1[6];
    v83[0] = v66;
    v83[1] = 3221225472;
    v83[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_7;
    v83[3] = &unk_1E8E9E980;
    v84 = v67;
    v71 = v67;
    objc_msgSend(v70, "animatedAppearanceWithFactory:completion:", v69, v83);
    dispatch_group_notify(v71, MEMORY[0x1E0C80D38], v46);

    v4 = v78;
    goto LABEL_28;
  }
  SBLogSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Siri content presentation request received while already presented - ignoring", buf, 2u);
  }

  (*((void (**)(void))a1[8] + 2))();
LABEL_28:

}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_50(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  double v16;
  id v17;

  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v17, "setSiriPresentationOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v17, "setAssistantPresented:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setPresentationContext:", v17);
  objc_msgSend(*(id *)(a1 + 48), "_siriPresentationViewControllerWillAppear:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 56), "clippingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 160));
  objc_msgSend(WeakRetained, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 48), "assistantWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "interfaceOrientation") - 3;

  if (v15 >= 2)
    v16 = v11;
  else
    v16 = v13;
  if (v15 >= 2)
    v11 = v13;
  objc_msgSend(v2, "setFrame:", v7, v9, v16, v11);
  objc_msgSend(v3, "setFrame:", v7, v9, v16, v11);
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", v7, v9, v16, v11);
  objc_msgSend(*(id *)(a1 + 72), "beginAppearanceTransition:animated:", 1, *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 56), "addChildViewController:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v3, "addSubview:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "_setStatusBarHidden:animated:", 0, 0);

}

uint64_t __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "requestStatusBarVisible:animated:completion:", 1, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  objc_msgSend(*(id *)(a1 + 48), "_siriPresentationViewControllerDidAppear:", *(unsigned __int8 *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "relinquish");
}

uint64_t __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dismissSiriPresentationViewControllerWithAnimationFactory:(id)a3 siriDismissalOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__SBAssistantSession_dismissSiriPresentationViewControllerWithAnimationFactory_siriDismissalOptions_completion___block_invoke;
  v18[3] = &unk_1E8E9FBF0;
  v21 = v11;
  v22 = a2;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = (void *)MEMORY[0x1D17E5550](v18);
  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("Siri Content Dismissal"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession operationQueue](self, "operationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "executeOrInsertEvent:atPosition:", v16, 1);

}

uint64_t __112__SBAssistantSession_dismissSiriPresentationViewControllerWithAnimationFactory_siriDismissalOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_dismissPresentables:withAnimationFactory:siriDismissalOptions:completion:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)presentSiriEffectsViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke;
  v13[3] = &unk_1E8EA7D10;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1D17E5550](v13);
  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("Siri Effects Presentation"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession operationQueue](self, "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeOrInsertEvent:atPosition:", v11, 1);

}

void __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  SBAssistantAccessoryWindow *v5;
  id WeakRetained;
  SBAssistantAccessoryWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf[2];

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isAssistantAccessoryPresented"))
  {
    SBLogSiri();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Siri effects presentation request received while already presented - ignoring", (uint8_t *)buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v4, "setAssistantAccessoryPresented:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setPresentationContext:", v4);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
    v5 = [SBAssistantAccessoryWindow alloc];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
    v7 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v5, "initWithWindowScene:rootViewController:role:debugName:", WeakRetained, *(_QWORD *)(a1 + 40), CFSTR("SBTraitsParticipantRoleAssistantAccessory"), CFSTR("Siri Effects"));

    -[SBWindow setHidden:](v7, "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowHidingManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:forWindow:", v7, 1.0);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v7);
    objc_initWeak(buf, *(id *)(a1 + 32));
    v10 = (void *)MEMORY[0x1E0D01718];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke_66;
    v14[3] = &unk_1E8EA3688;
    objc_copyWeak(&v15, buf);
    objc_msgSend(v10, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("Elevated Siri Effects"), v14);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = v11;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);

  }
}

void __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke_66(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAssistantAccessoryWindowWindowLevel");

}

- (void)dismissSiriEffectsViewControllerWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__SBAssistantSession_dismissSiriEffectsViewControllerWithCompletion___block_invoke;
  v10[3] = &unk_1E8EA1310;
  v11 = v5;
  v12 = a2;
  v10[4] = self;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D17E5550](v10);
  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("Siri Effects Dismissal"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession operationQueue](self, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeOrInsertEvent:atPosition:", v8, 1);

}

uint64_t __69__SBAssistantSession_dismissSiriEffectsViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_dismissPresentables:withAnimationFactory:siriDismissalOptions:completion:", 2, 0, 0, *(_QWORD *)(a1 + 40));
}

- (id)acquireElevatedSiriEffectsViewControllerAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBAssistantSession elevatedSiriEffectsViewControllerAssertion](self, "elevatedSiriEffectsViewControllerAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)endWithAnimationFactory:(id)a3 siriDismissalOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SBAssistantSession_endWithAnimationFactory_siriDismissalOptions_completion___block_invoke;
  v17[3] = &unk_1E8E9FBF0;
  v20 = v11;
  v21 = a2;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = (void *)MEMORY[0x1D17E5550](v17);
  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("end Siri Session"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_operationQueue, "executeOrInsertEvent:atPosition:", v16, 1);

}

uint64_t __78__SBAssistantSession_endWithAnimationFactory_siriDismissalOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_dismissPresentables:withAnimationFactory:siriDismissalOptions:completion:", 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_operationQueue_dismissPresentables:(unint64_t)a3 withAnimationFactory:(id)a4 siriDismissalOptions:(id)a5 completion:(id)a6
{
  char v8;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  int v15;
  char v16;
  NSObject *v17;
  void *v18;
  SiriPresentationSpringBoardMainScreenViewController *v19;
  double v20;
  id v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  SiriPresentationSpringBoardMainScreenViewController *v25;
  void (**v26)(_QWORD);
  SiriPresentationSpringBoardMainScreenViewController *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD v35[4];
  SiriPresentationSpringBoardMainScreenViewController *v36;
  SBAssistantSession *v37;
  id v38;
  id v39;
  void (**v40)(_QWORD);
  char v41;
  BOOL v42;
  char v43;
  _QWORD v44[4];
  id v45;
  SBAssistantSession *v46;
  SiriPresentationSpringBoardMainScreenViewController *v47;
  char v48;
  char v49;
  BOOL v50;
  uint8_t buf[16];

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  -[SBAssistantSession presentationContext](self, "presentationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v8 & 1) != 0)
  {
    v15 = objc_msgSend(v13, "isAssistantPresented");
    if ((v8 & 2) != 0)
    {
LABEL_3:
      v16 = objc_msgSend(v14, "isAssistantAccessoryPresented");
      if ((v15 & 1) != 0)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  else
  {
    v15 = 0;
    if ((v8 & 2) != 0)
      goto LABEL_3;
  }
  v16 = 0;
  if ((v15 & 1) != 0)
  {
LABEL_11:
    -[SBAssistantSession operationQueue](self, "operationQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "acquireLockForReason:", CFSTR("Siri Dismissal"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_siriPresentationViewController;
    objc_msgSend(v10, "duration");
    v21 = v10;
    v22 = v11;
    v23 = fabs(v20) >= 2.22044605e-16;
    v24 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke;
    v44[3] = &unk_1E8EADBC8;
    v32 = v14;
    v48 = v15;
    v49 = v16;
    v45 = v14;
    v46 = self;
    v50 = v23;
    v25 = v19;
    v47 = v25;
    v26 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v44);
    v35[0] = v24;
    v35[1] = 3221225472;
    v35[2] = __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_2;
    v35[3] = &unk_1E8EADBF0;
    v41 = v15;
    v27 = v25;
    v36 = v27;
    v37 = self;
    v42 = v23;
    v11 = v22;
    v10 = v21;
    v38 = v11;
    v43 = v16;
    v40 = v12;
    v28 = v31;
    v39 = v28;
    v29 = (void *)MEMORY[0x1D17E5550](v35);
    v30 = dispatch_group_create();
    v26[2](v26);
    if (v15)
    {
      dispatch_group_enter(v30);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_3;
      v33[3] = &unk_1E8E9E980;
      v34 = v30;
      -[SiriPresentationSpringBoardMainScreenViewController animatedDisappearanceWithFactory:completion:](v27, "animatedDisappearanceWithFactory:completion:", v10, v33);

    }
    dispatch_group_notify(v30, MEMORY[0x1E0C80D38], v29);

    v14 = v32;
    goto LABEL_14;
  }
LABEL_7:
  if ((v16 & 1) != 0)
    goto LABEL_11;
  SBLogSiri();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Siri dismissal request received with nothing to dismiss - ignoring", buf, 2u);
  }

  v12[2](v12);
LABEL_14:

}

void __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v3 = v2;
  v4 = v2;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v2, "setSiriPresentationOptions:", 0);
    objc_msgSend(v4, "setAssistantPresented:", 0);
    v3 = v4;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(v3, "setAssistantAccessoryPresented:", 0);
    v3 = v4;
  }
  objc_msgSend(*(id *)(a1 + 40), "setPresentationContext:", v3);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "_siriPresentationViewControllerWillDisappear:", *(unsigned __int8 *)(a1 + 58));
    objc_msgSend(*(id *)(a1 + 48), "beginAppearanceTransition:animated:", 0, *(unsigned __int8 *)(a1 + 58));
    objc_msgSend(*(id *)(a1 + 48), "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_setStatusBarHidden:animated:", 1, 0);
  }

}

uint64_t __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
    objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
    objc_msgSend(*(id *)(a1 + 40), "_siriPresentationViewControllerDidDisappear:", *(unsigned __int8 *)(a1 + 73));
    v3 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v3, "dismissWithOptions:");
    else
      objc_msgSend(v3, "dismiss");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setHidden:", 1);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = 0;

  }
  if (*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setRootViewController:", 0);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 56);
    *(_QWORD *)(v8 + 56) = 0;

    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 64);
    *(_QWORD *)(v10 + 64) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "invalidate");
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "relinquish");
}

void __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_siriPresentationViewControllerWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *traitsOrientationPolicySpecifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v30, 0xCu);

  }
  -[SBAssistantSession _notifySiriPresentationViewControllerWillAppear](self, "_notifySiriPresentationViewControllerWillAppear");
  -[SBAssistantSession setVisible:](self, "setVisible:", 1);
  if (!self->_traitsOrientationPolicySpecifier)
  {
    v7 = -[SBAssistantSession _newTraitsOrientationPolicySpecifier](self, "_newTraitsOrientationPolicySpecifier");
    traitsOrientationPolicySpecifier = self->_traitsOrientationPolicySpecifier;
    self->_traitsOrientationPolicySpecifier = v7;

  }
  -[SBAssistantSession assistantWindow](self, "assistantWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowHidingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:forWindow:", v9, 1.0);

  objc_msgSend(v9, "setHidden:", 0);
  objc_msgSend(v9, "makeKeyAndVisible");
  -[SBAssistantSession presentationContext](self, "presentationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "siriPresentationOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldDeactivateScenesBelow");

  if (v14)
  {
    -[SBAssistantSession resignActiveAssertion](self, "resignActiveAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sb_acquireForDisplayIdentity:", v17);

  }
  -[SBAssistantSession _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 1);
  -[SBAssistantSession _updateOrientationLock](self, "_updateOrientationLock");
  -[SBAssistantSession siriPresentationViewController](self, "siriPresentationViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:forKeyPath:options:context:", self, CFSTR("supportedInterfaceOrientations"), 0, 0);

  -[SBAssistantSession _toggleModalAlertHidingAssertion:](self, "_toggleModalAlertHidingAssertion:", 1);
  -[SBAssistantSession context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "alertItemsController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setForceAlertsToPend:forReason:", 1, CFSTR("AssistantSession"));

  -[SBAssistantSession context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "alertItemsController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moveActiveUnlockedAlertsToPendingWithAnimation:completion:", v3, 0);

  -[SBAssistantSession setPendingAlerts:](self, "setPendingAlerts:", 1);
  -[SBAssistantSession context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coverSheetViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerExternalBehaviorProvider:", self);

  -[SBAssistantSession setProvidingCoverSheetBehavior:](self, "setProvidingCoverSheetBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatingDockController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__dockFrameDidChange_, CFSTR("SBFloatingDockControllerFrameDidChangeNotification"), v27);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession assistantRootViewController](self, "assistantRootViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__updateOrbLocation_, CFSTR("SBAssistantCanRepositionOrbIfNecessary"), v29);

  -[SBAssistantSession _updateOrbLocation:](self, "_updateOrbLocation:", 0);
}

- (void)_siriPresentationViewControllerDidAppear:(BOOL)a3
{
  NSObject *v4;
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
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v15, 0xCu);

  }
  -[SBAssistantSession context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertItemsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setForceAlertsToPend:forReason:", 0, CFSTR("AssistantSession"));

  -[SBAssistantSession context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orientationAccomodation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession siriPresentationViewController](self, "siriPresentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "noteInterfaceOrientationChanged:force:logMessage:", objc_msgSend(v10, "interfaceOrientation"), 0, CFSTR("Updating interface orientation to match Siri's activation orientation"));

  -[SBAssistantSession _notifySiriPresentationViewControllerDidAppear](self, "_notifySiriPresentationViewControllerDidAppear");
  -[SBAssistantSession gestureManager](self, "gestureManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSession context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transientOverlayPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topmostPresentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTopmostTransientViewControllerAtPresentation:", v14);

}

- (void)_siriPresentationViewControllerWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v18, 0xCu);

  }
  -[SBAssistantSession setVisible:](self, "setVisible:", 0);
  if (-[SBAssistantSession isHidingOtherWindows](self, "isHidingOtherWindows"))
  {
    -[SBAssistantSession context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowHidingManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopHidingWindowsForContext:", self);

    -[SBAssistantSession suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[SBAssistantSession setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", 0);
    -[SBAssistantSession setHidingOtherWindows:](self, "setHidingOtherWindows:", 0);
  }
  -[SBAssistantSession _notifySiriPresentationViewControllerWillDisappear](self, "_notifySiriPresentationViewControllerWillDisappear");
  -[SBAssistantSession _restoreOrientation](self, "_restoreOrientation");
  -[SBAssistantSession resignActiveAssertion](self, "resignActiveAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAcquired");

  if (v11)
  {
    -[SBAssistantSession resignActiveAssertion](self, "resignActiveAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relinquish");

  }
  -[SBAssistantSession context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alertItemsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setForceAlertsToPend:forReason:", 1, CFSTR("AssistantSession"));

  -[SBAssistantSession context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alertItemsController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moveActiveUnlockedAlertsToPendingWithAnimation:completion:", v3, 0);

  -[SBAssistantSession siriPresentationViewController](self, "siriPresentationViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("supportedInterfaceOrientations"));

}

- (void)_siriPresentationViewControllerDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *traitsOrientationPolicySpecifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v16, 0xCu);

  }
  -[SBAssistantSession assistantWindow](self, "assistantWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  objc_msgSend(v6, "resignAsKeyWindow");
  objc_msgSend(v6, "setHidden:", 1);
  -[SBAssistantSession deferOrientationUpdatesAssertion](self, "deferOrientationUpdatesAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[SBAssistantSession setDeferOrientationUpdatesAssertion:](self, "setDeferOrientationUpdatesAssertion:", 0);
  -[BSInvalidatable invalidate](self->_traitsOrientationPolicySpecifier, "invalidate");
  traitsOrientationPolicySpecifier = self->_traitsOrientationPolicySpecifier;
  self->_traitsOrientationPolicySpecifier = 0;

  if (-[SBAssistantSession isPendingAlerts](self, "isPendingAlerts"))
  {
    -[SBAssistantSession context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alertItemsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setForceAlertsToPend:forReason:", 0, CFSTR("AssistantSession"));

    -[SBAssistantSession setPendingAlerts:](self, "setPendingAlerts:", 0);
  }
  -[SBAssistantSession _toggleModalAlertHidingAssertion:](self, "_toggleModalAlertHidingAssertion:", 0);
  -[SBAssistantSession _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 0);
  if (-[SBAssistantSession isProvidingCoverSheetBehavior](self, "isProvidingCoverSheetBehavior"))
  {
    -[SBAssistantSession context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coverSheetViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unregisterExternalBehaviorProvider:", self);

    -[SBAssistantSession setProvidingCoverSheetBehavior:](self, "setProvidingCoverSheetBehavior:", 0);
  }
  -[SBAssistantSession _notifySiriPresentationViewControllerDidDisappear](self, "_notifySiriPresentationViewControllerDidDisappear");

}

- (void)_didChangePresentationContext
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[SBAssistantSession presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriPresentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hideOtherWindowsDuringAppearance");

  if (v5)
  {
    -[SBAssistantSession setHidingOtherWindows:](self, "setHidingOtherWindows:", 1);
    -[SBAssistantSession context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowHidingManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startHidingWindowsExclusivelyFromLevel:toLevel:forContext:reason:", self, CFSTR("AssistantSession"), *MEMORY[0x1E0CEBE28] + -3.0 + -1.0, *MEMORY[0x1E0CEBBD0] + 25.0);

    -[SBAssistantSession suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[SBAssistantSession context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wallpaperController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspendWallpaperAnimationForReason:", CFSTR("AssistantSession"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAssistantSession setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", v11);

  }
  else
  {
    -[SBAssistantSession setHidingOtherWindows:](self, "setHidingOtherWindows:", 0);
    -[SBAssistantSession context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowHidingManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopHidingWindowsForContext:", self);

    -[SBAssistantSession suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

    -[SBAssistantSession setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", 0);
  }
  -[SBAssistantSession _notifyDidChangePresentationContext](self, "_notifyDidChangePresentationContext");
}

- (void)_notifySiriPresentationViewControllerWillAppear
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBAssistantSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantSession:viewWillAppearInWindowScene:", self, WeakRetained);

  -[SBAssistantSession gestureManager](self, "gestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantSession:viewWillAppearInWindowScene:", self, WeakRetained);

}

- (void)_notifySiriPresentationViewControllerDidAppear
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBAssistantSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantSession:viewDidAppearInWindowScene:", self, WeakRetained);

  -[SBAssistantSession gestureManager](self, "gestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantSession:viewDidAppearInWindowScene:", self, WeakRetained);

}

- (void)_notifySiriPresentationViewControllerWillDisappear
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBAssistantSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantSession:viewWillDisappearInWindowScene:", self, WeakRetained);

  -[SBAssistantSession gestureManager](self, "gestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantSession:viewWillDisappearInWindowScene:", self, WeakRetained);

}

- (void)_notifySiriPresentationViewControllerDidDisappear
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBAssistantSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantSession:viewDidDisappearInWindowScene:", self, WeakRetained);

  -[SBAssistantSession gestureManager](self, "gestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantSession:viewDidDisappearInWindowScene:", self, WeakRetained);

}

- (void)_notifyDidChangePresentationContext
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBAssistantSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantSession:didChangePresentationInWindowScene:", self, WeakRetained);

  -[SBAssistantSession gestureManager](self, "gestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantSession:didChangePresentationInWindowScene:", self, WeakRetained);

}

- (void)_setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  if (a4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke;
    v6[3] = &unk_1E8E9F508;
    v6[4] = self;
    v7 = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v6, 0, 0.35, 0.0);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke_2;
    v4[3] = &unk_1E8E9F508;
    v4[4] = self;
    v5 = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
  }
}

void __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "siriPresentationViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestStatusBarVisible:animated:completion:", *(_BYTE *)(a1 + 40) == 0, 0, 0);

}

void __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "siriPresentationViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestStatusBarVisible:animated:completion:", *(_BYTE *)(a1 + 40) == 0, 0, 0);

}

- (void)_toggleModalAlertHidingAssertion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[SBAssistantSession hideApplicationModalAlertsAssertion](self, "hideApplicationModalAlertsAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBAssistantSession hideApplicationModalAlertsAssertion](self, "hideApplicationModalAlertsAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[SBAssistantSession setHideApplicationModalAlertsAssertion:](self, "setHideApplicationModalAlertsAssertion:", 0);
  }
  if (v3)
  {
    -[SBAssistantSession context](self, "context");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modalAlertPresentationCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hideApplicationModalAlertsForReason:", CFSTR("AssistantSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAssistantSession setHideApplicationModalAlertsAssertion:](self, "setHideApplicationModalAlertsAssertion:", v8);

  }
}

- (void)_updateOrbLocation:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SBAssistantSession context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockScreenFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SBAssistantSession _updateDockViewFrame:](self, "_updateDockViewFrame:", v7, v9, v11, v13);
}

- (void)_dockFrameDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBFloatingDockControllerFrame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SBAssistantSession _updateDockViewFrame:](self, "_updateDockViewFrame:", v7, v9, v11, v13);
}

- (void)_updateDockViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixedCoordinateSpace");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  -[SBAssistantSession siriPresentationViewController](self, "siriPresentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "convertRect:toCoordinateSpace:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SBAssistantSession context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "coverSheetPresentationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isPresented");

  -[SBAssistantSession siriPresentationViewController](self, "siriPresentationViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {
    v26 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v26 = v14;
    v27 = v16;
    v28 = v18;
    v29 = v20;
  }
  objc_msgSend(v24, "setDockFrame:", v26, v27, v28, v29);

}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutAssertion;
  id v5;
  void *v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v11 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0D22C88]);
      objc_msgSend(v11, "setLevel:", (uint64_t)(*MEMORY[0x1E0CEBBD0] + 25.0));
      objc_msgSend(v11, "setFillsDisplayBounds:", 1);
      objc_msgSend(v11, "setLayoutRole:", 4);
      -[SBAssistantSession context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayLayoutPublisher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addElement:", v11);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v8;

    }
  }
  else if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate");
    v10 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
}

- (id)_newTraitsOrientationPolicySpecifier
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "traitsPipelineManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SBAssistantSession__newTraitsOrientationPolicySpecifier__block_invoke;
  v7[3] = &unk_1E8EA7798;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v4, "newBlockBasedOrientationPolicySpecifier:forRole:", v7, CFSTR("SBTraitsParticipantRoleAssistant"));
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __58__SBAssistantSession__newTraitsOrientationPolicySpecifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "bs_firstObjectPassingTest:", &__block_literal_global_150);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "siriPresentationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rotationStyle");

    if (v7 == 1)
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientation");
    else
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoOrientationBelow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOrientationResolutionPolicyInfo:", v8);

    v3 = v9;
  }

}

uint64_t __58__SBAssistantSession__newTraitsOrientationPolicySpecifier__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBTraitsParticipantRoleAssistant"));

  return v3;
}

- (void)_updateOrientationLock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBAssistantSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockScreenManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUILocked") & 1) != 0)
  {
    -[SBAssistantSession context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverSheetViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBAssistantSession siriPresentationViewController](self, "siriPresentationViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v11, "shouldAutorotate") && objc_msgSend(v11, "supportedInterfaceOrientations") != 2)
  {
    -[SBAssistantSession deferOrientationUpdatesAssertion](self, "deferOrientationUpdatesAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[SBAssistantSession setDeferOrientationUpdatesAssertion:](self, "setDeferOrientationUpdatesAssertion:", 0);
  }
  else
  {
    -[SBAssistantSession deferOrientationUpdatesAssertion](self, "deferOrientationUpdatesAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[SBAssistantSession context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orientationAccomodation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("AssistantSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAssistantSession setDeferOrientationUpdatesAssertion:](self, "setDeferOrientationUpdatesAssertion:", v9);

  }
}

- (void)_restoreOrientation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  -[SBAssistantSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orientationAccomodation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "homeScreenRotationStyle");

  if (!v5)
  {
    -[SBAssistantSession context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orientationAccomodation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarOrientation:forEmbeddedDisplayAnimated:", 1, 0);

  }
  -[SBAssistantSession context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockScreenManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUILocked");

  -[SBAssistantSession context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "orientationAccomodation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "homeScreenRotationStyle");

    if (!v14)
    {
      -[SBAssistantSession context](self, "context");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "orientationAccomodation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("AssistantController restore orientation (locked)");
LABEL_16:
      objc_msgSend(v15, "noteInterfaceOrientationChanged:force:logMessage:", 1, 1, v17);
LABEL_17:

    }
  }
  else
  {
    objc_msgSend(v11, "switcherController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutStatePrimaryElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "workspaceEntity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "applicationSceneEntity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sceneHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAssistantSession context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      objc_msgSend(v23, "switcherController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layoutStatePrimaryElement");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "workspaceEntity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "applicationSceneEntity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sceneHandle");
      v38 = (id)objc_claimAutoreleasedReturnValue();

      if (v38)
        v29 = objc_msgSend(v38, "statusBarOrientation");
      else
        v29 = 1;
      -[SBAssistantSession context](self, "context");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "orientationAccomodation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "homeScreenRotationStyle");

      if (v34)
      {
        -[SBAssistantSession context](self, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "orientationAccomodation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "updateNativeOrientationWithOrientation:logMessage:", v29, CFSTR("AssistantController restore orientation (not locked, has app)"));

      }
      -[SBAssistantSession context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "orientationAccomodation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "noteInterfaceOrientationChanged:force:logMessage:", v29, 1, CFSTR("AssistantController restore orientation (not locked, has app)"));

      goto LABEL_17;
    }
    objc_msgSend(v23, "orientationAccomodation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "homeScreenRotationStyle");

    if (!v31)
    {
      -[SBAssistantSession context](self, "context");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "orientationAccomodation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("AssistantController restore orientation (not locked, no app)");
      goto LABEL_16;
    }
  }
}

- (void)_updateAssistantAccessoryWindowWindowLevel
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[SBAssistantSession elevatedSiriEffectsViewControllerAssertion](self, "elevatedSiriEffectsViewControllerAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  v5 = -0.5;
  if (v4)
    v5 = 0.5;
  v6 = *MEMORY[0x1E0CEBBD0] + 25.0 + v5 - (*MEMORY[0x1E0CEBBD0] + 25.0);
  -[SBAssistantSession assistantWindow](self, "assistantWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowLevel");
  v9 = v8;

  -[SBAssistantSession assistantAccessoryWindow](self, "assistantAccessoryWindow");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWindowLevel:", v6 + v9);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("supportedInterfaceOrientations"), a4, a5, a6))
    -[SBAssistantSession _updateOrientationLock](self, "_updateOrientationLock");
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[SBAssistantSession isVisible](self, "isVisible"))
    return 2;
  else
    return 1;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (SBAssistantWindow)assistantWindow
{
  return self->_assistantWindow;
}

- (void)setAssistantWindow:(id)a3
{
  objc_storeStrong((id *)&self->_assistantWindow, a3);
}

- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController
{
  return self->_siriPresentationViewController;
}

- (void)setSiriPresentationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_siriPresentationViewController, a3);
}

- (SBAssistantAccessoryWindow)assistantAccessoryWindow
{
  return self->_assistantAccessoryWindow;
}

- (void)setAssistantAccessoryWindow:(id)a3
{
  objc_storeStrong((id *)&self->_assistantAccessoryWindow, a3);
}

- (UIViewController)siriEffectsViewController
{
  return self->_siriEffectsViewController;
}

- (void)setSiriEffectsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_siriEffectsViewController, a3);
}

- (BSCompoundAssertion)elevatedSiriEffectsViewControllerAssertion
{
  return self->_elevatedSiriEffectsViewControllerAssertion;
}

- (void)setElevatedSiriEffectsViewControllerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_elevatedSiriEffectsViewControllerAssertion, a3);
}

- (BSEventQueue)operationQueue
{
  return self->_operationQueue;
}

- (SBAssistantContext)context
{
  return self->_context;
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (SBAssistantGestureConfiguration)gestureConfiguration
{
  return self->_gestureConfiguration;
}

- (void)setGestureConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_gestureConfiguration, a3);
}

- (SBAssistantGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureManager, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isHidingOtherWindows
{
  return self->_hidingOtherWindows;
}

- (void)setHidingOtherWindows:(BOOL)a3
{
  self->_hidingOtherWindows = a3;
}

- (BOOL)isPendingAlerts
{
  return self->_pendingAlerts;
}

- (void)setPendingAlerts:(BOOL)a3
{
  self->_pendingAlerts = a3;
}

- (BOOL)isProvidingCoverSheetBehavior
{
  return self->_providingCoverSheetBehavior;
}

- (void)setProvidingCoverSheetBehavior:(BOOL)a3
{
  self->_providingCoverSheetBehavior = a3;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, a3);
}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, a3);
}

- (BSInvalidatable)hideApplicationModalAlertsAssertion
{
  return self->_hideApplicationModalAlertsAssertion;
}

- (void)setHideApplicationModalAlertsAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hideApplicationModalAlertsAssertion, a3);
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, a3);
}

- (SBAssistantSessionDelegate)delegate
{
  return (SBAssistantSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_hideApplicationModalAlertsAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_elevatedSiriEffectsViewControllerAssertion, 0);
  objc_storeStrong((id *)&self->_siriEffectsViewController, 0);
  objc_storeStrong((id *)&self->_assistantAccessoryWindow, 0);
  objc_storeStrong((id *)&self->_siriPresentationViewController, 0);
  objc_storeStrong((id *)&self->_assistantWindow, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_traitsOrientationPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_fluidDismissalState, 0);
}

@end
