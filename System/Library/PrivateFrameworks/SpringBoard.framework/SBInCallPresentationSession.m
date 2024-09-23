@implementation SBInCallPresentationSession

- (SBInCallPresentationSession)initWithSceneHandle:(id)a3 workspace:(id)a4 bannerManager:(id)a5 lockScreenManager:(id)a6 deactivationManager:(id)a7 mainSwitcherCoordinator:(id)a8 backlightController:(id)a9 keyboardFocusController:(id)a10 springBoard:(id)a11 setupManager:(id)a12 uiController:(id)a13 pipCoordinator:(id)a14 lockoutStateProvider:(id)a15
{
  id v20;
  id v21;
  void *v22;
  SBInCallPresentationSession *v23;
  SBInCallPresentationSession *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BSEventQueue *localEventQueue;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BSInvalidatable *allowHiddenAppAssertion;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v53;
  id v54;
  id v55;
  id location;
  objc_super v57;

  v20 = a3;
  v51 = a4;
  v40 = a5;
  v21 = a5;
  v22 = v20;
  v50 = v21;
  v41 = a6;
  v49 = a6;
  v48 = a7;
  v53 = a8;
  v47 = a9;
  v46 = a10;
  v45 = a11;
  v44 = a12;
  v54 = a13;
  v43 = a14;
  v42 = a15;
  v57.receiver = self;
  v57.super_class = (Class)SBInCallPresentationSession;
  v23 = -[SBInCallPresentationSession init](&v57, sel_init);
  v24 = v23;
  if (v23)
  {
    -[SBInCallPresentationSession transitionToSceneHandleIfNeeded:](v23, "transitionToSceneHandleIfNeeded:", v20);
    objc_storeStrong((id *)&v24->_workspace, a4);
    objc_storeStrong((id *)&v24->_springBoard, a11);
    objc_storeStrong((id *)&v24->_bannerManager, v40);
    objc_storeStrong((id *)&v24->_lockScreenManager, v41);
    objc_storeStrong((id *)&v24->_deactivationManager, a7);
    objc_storeStrong((id *)&v24->_mainSwitcherCoordinator, a8);
    objc_storeStrong((id *)&v24->_backlightController, a9);
    objc_storeStrong((id *)&v24->_keyboardFocusCoordinator, a10);
    objc_storeStrong((id *)&v24->_setupManager, a12);
    objc_storeStrong((id *)&v24->_pipControllerCoordinator, a14);
    objc_storeStrong((id *)&v24->_lockoutStateProvider, a15);
    v25 = objc_alloc(MEMORY[0x1E0D01770]);
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[SBDeviceApplicationSceneHandle sceneIdentifier](v24->_sceneHandle, "sceneIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("SBInCallPresentationSession-%@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v25, "initWithName:onQueue:", v28, MEMORY[0x1E0C80D38]);
    localEventQueue = v24->_localEventQueue;
    v24->_localEventQueue = (BSEventQueue *)v29;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneHandle application](v24->_sceneHandle, "application");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneHandle sceneIdentifier](v24->_sceneHandle, "sceneIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBInCallPresentationSession - %@"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v32, "bundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "acquireAllowHiddenAppAssertionForBundleIdentifier:reason:", v35, v34);
      v36 = objc_claimAutoreleasedReturnValue();
      allowHiddenAppAssertion = v24->_allowHiddenAppAssertion;
      v24->_allowHiddenAppAssertion = (BSInvalidatable *)v36;

    }
    objc_msgSend(v31, "addObserver:selector:name:object:", v24, sel__uiLockStateDidChange_, *MEMORY[0x1E0DAC318], 0);
    -[SpringBoard addActiveOrientationObserver:](v24->_springBoard, "addActiveOrientationObserver:", v24);
    objc_storeStrong((id *)&v24->_uiController, a13);
    v24->_isAttachedToWindowedAccessory = -[SBUIController isConnectedToWindowedAccessory](v24->_uiController, "isConnectedToWindowedAccessory");
    objc_msgSend(v31, "addObserver:selector:name:object:", v24, sel__windowedAccessoryDidAttachOrDetach_, CFSTR("SBUIWindowedAccessoryDidAttachOrDetachNotification"), v54);
    objc_initWeak(&location, v24);
    objc_copyWeak(&v55, &location);
    v38 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

    v22 = v20;
  }

  return v24;
}

id __255__SBInCallPresentationSession_initWithSceneHandle_workspace_bannerManager_lockScreenManager_deactivationManager_mainSwitcherCoordinator_backlightController_keyboardFocusController_springBoard_setupManager_uiController_pipCoordinator_lockoutStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)transitionToSceneHandleIfNeeded:(id)a3
{
  SBDeviceApplicationSceneHandle *v5;
  SBDeviceApplicationSceneHandle *v6;
  SBDeviceApplicationSceneHandle *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BSInvalidatable *ignoreSuspendedUnderLockAssertion;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  BSInvalidatable *v33;
  BSInvalidatable *v34;
  SBInCallPresentationSceneUpdateContext *v35;
  void *v36;
  void *v37;
  SBInCallPresentationSceneUpdateContext *v38;
  _QWORD v39[5];

  v5 = (SBDeviceApplicationSceneHandle *)a3;
  v6 = self->_sceneHandle;
  v7 = v6;
  if (v6 != v5)
  {
    if (v6)
    {
      -[SBDeviceApplicationSceneHandle sceneIfExists](v5, "sceneIfExists");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationSceneHandle sceneIfExists](v7, "sceneIfExists");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v9)
      {
        SBLogInCallPresentation();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[SBInCallPresentationSession transitionToSceneHandleIfNeeded:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

      }
      -[SBApplicationSceneHandle removeSceneUpdateContributer:](v7, "removeSceneUpdateContributer:", self);
      -[SBDeviceApplicationSceneHandle removeActionConsumer:](v7, "removeActionConsumer:", self);
      -[SBDeviceApplicationSceneHandle removeObserver:](v7, "removeObserver:", self);
      -[SBDeviceApplicationSceneHandle statusBarStateProvider](v7, "statusBarStateProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeStatusBarObserver:", self);

      -[SBInCallPresentationSession _sceneManager](self, "_sceneManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_layoutStateTransitionCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "removeObserver:", self);
      -[BSInvalidatable invalidate](self->_ignoreSuspendedUnderLockAssertion, "invalidate");
      ignoreSuspendedUnderLockAssertion = self->_ignoreSuspendedUnderLockAssertion;
      self->_ignoreSuspendedUnderLockAssertion = 0;

    }
    objc_storeStrong((id *)&self->_sceneHandle, a3);
    objc_msgSend((id)SBApp, "windowSceneManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneHandle displayIdentity](v5, "displayIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "windowSceneForDisplayIdentity:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)&self->_windowScene, v24);
    -[SBApplicationSceneHandle addSceneUpdateContributer:](self->_sceneHandle, "addSceneUpdateContributer:", self);
    -[SBDeviceApplicationSceneHandle addActionConsumer:](self->_sceneHandle, "addActionConsumer:", self);
    -[SBDeviceApplicationSceneHandle addObserver:](self->_sceneHandle, "addObserver:", self);
    -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addStatusBarObserver:", self);

    -[SBInCallPresentationSession _sceneManager](self, "_sceneManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_layoutStateTransitionCoordinator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addObserver:", self);
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[SBInCallPresentationSession _sceneManager](self, "_sceneManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBInCallPresentationSession - %@"), v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBInCallPresentationSession _sceneManager](self, "_sceneManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier:reason:", v28, v31);
        v33 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        v34 = self->_ignoreSuspendedUnderLockAssertion;
        self->_ignoreSuspendedUnderLockAssertion = v33;

      }
    }
    v35 = [SBInCallPresentationSceneUpdateContext alloc];
    -[SBInCallPresentationSession _screen](self, "_screen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "fixedCoordinateSpace");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    v38 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v35, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", *MEMORY[0x1E0DAC7E8], &__block_literal_global_116);

    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v38, "setExecutionTarget:", 1);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __63__SBInCallPresentationSession_transitionToSceneHandleIfNeeded___block_invoke_2;
    v39[3] = &unk_1E8EA6C08;
    v39[4] = self;
    -[SBInCallPresentationSceneUpdateContext setValidatorHandler:](v38, "setValidatorHandler:", v39);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v38);

  }
}

uint64_t __63__SBInCallPresentationSession_transitionToSceneHandleIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_hasExistingSceneSettingsPresentationModeForLayoutState:", v4) ^ 1;

  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBInCallPresentationSession descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBInCallPresentationSession succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBInCallPresentationSession descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SBInCallPresentationSession *v14;
  BOOL v15;
  BOOL v16;

  v4 = a3;
  -[SBInCallPresentationSession succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_systemGestureSceneDeactivationAssertion != 0;
  v7 = self->_systemAnimationSceneDeactivationAssertion != 0;
  -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SBInCallPresentationSession_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E8EA9330;
  v9 = v5;
  v13 = v9;
  v14 = self;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", v8, v4, v12);

  v10 = v9;
  return v10;
}

id __69__SBInCallPresentationSession_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _BOOL8 v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 384), "persistenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("_sceneHandle.persistenceIdentifier"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("_requestedPresentationConfigurationIdentifier"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 208), CFSTR("_isInvalidated"), 1);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 91), CFSTR("hasReceivedFinalizeSceneDestructionRequest"), 1);
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 210), CFSTR("_isTransientOverlayPresentationActive"), 1);
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 209), CFSTR("_isNonModalPresentationActive"), 1);
  if (*(_BYTE *)(a1 + 48))
    v10 = 0;
  else
    v10 = *(_BYTE *)(a1 + 49) == 0;
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", v10, CFSTR("No deactivation assertions"), 1);
  if (*(_BYTE *)(a1 + 48))
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  else
    v12 = 0;
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v12, CFSTR("System Gesture Deactivation Reasons"));
  if (*(_BYTE *)(a1 + 49))
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  else
    v14 = 0;
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v14, CFSTR("System Animation Deactivation Reasons"));
}

- (void)invalidate
{
  SBInCallBannerPresentableViewController *bannerPresentableViewController;
  SBInCallTransientOverlayViewController *transientOverlayViewController;
  void *v5;
  BSInvalidatable *suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion;
  BSInvalidatable *ignoreSuspendedUnderLockAssertion;
  void *v8;
  BSInvalidatable *allowHiddenAppAssertion;
  SBWindowSceneStatusBarSettingsAssertion *appStatusBarSettingsAssertion;
  BSInvalidatable *preventKeyboardFocusAssertion;
  BSInvalidatable *hideSharePlayContentFromClonedDisplayAssertion;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  int v25;
  SBInCallPresentationSession *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_isInvalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInCallPresentationSession.m"), 328, CFSTR("Attempting to -invalidate twice; this is unsupported."));

  }
  self->_isInvalidated = 1;
  -[SBInCallPresentationSession _invalidateJindoElementIfNeeded](self, "_invalidateJindoElementIfNeeded");
  -[SpringBoard removeActiveOrientationObserver:](self->_springBoard, "removeActiveOrientationObserver:", self);
  -[SBInCallBannerPresentableViewController invalidate](self->_bannerPresentableViewController, "invalidate");
  bannerPresentableViewController = self->_bannerPresentableViewController;
  self->_bannerPresentableViewController = 0;

  -[SBInCallTransientOverlayViewController invalidate](self->_transientOverlayViewController, "invalidate");
  transientOverlayViewController = self->_transientOverlayViewController;
  self->_transientOverlayViewController = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC318], 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBUIWindowedAccessoryDidAttachOrDetachNotification"), self->_uiController);
  -[BSInvalidatable invalidate](self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion, "invalidate");
  suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion;
  self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = 0;

  -[BSInvalidatable invalidate](self->_ignoreSuspendedUnderLockAssertion, "invalidate");
  ignoreSuspendedUnderLockAssertion = self->_ignoreSuspendedUnderLockAssertion;
  self->_ignoreSuspendedUnderLockAssertion = 0;

  -[SBApplicationSceneHandle removeSceneUpdateContributer:](self->_sceneHandle, "removeSceneUpdateContributer:", self);
  -[SBDeviceApplicationSceneHandle removeActionConsumer:](self->_sceneHandle, "removeActionConsumer:", self);
  -[SBDeviceApplicationSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeStatusBarObserver:", self);

  -[BSInvalidatable invalidate](self->_allowHiddenAppAssertion, "invalidate");
  allowHiddenAppAssertion = self->_allowHiddenAppAssertion;
  self->_allowHiddenAppAssertion = 0;

  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_appStatusBarSettingsAssertion, "invalidate");
  appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
  self->_appStatusBarSettingsAssertion = 0;

  -[BSInvalidatable invalidate](self->_preventKeyboardFocusAssertion, "invalidate");
  preventKeyboardFocusAssertion = self->_preventKeyboardFocusAssertion;
  self->_preventKeyboardFocusAssertion = 0;

  -[BSInvalidatable invalidate](self->_hideSharePlayContentFromClonedDisplayAssertion, "invalidate");
  hideSharePlayContentFromClonedDisplayAssertion = self->_hideSharePlayContentFromClonedDisplayAssertion;
  self->_hideSharePlayContentFromClonedDisplayAssertion = 0;

  -[SBInCallPresentationSession _sceneManager](self, "_sceneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_layoutStateTransitionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "removeObserver:", self);
  -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_dataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeSceneStoreForIdentifier:", v15);

  }
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v21);

  -[SBInCallPresentationSession _updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:](self, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", 0, 0);
  SBLogInCallPresentation();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138543362;
    v26 = self;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Invalidated: %{public}@", (uint8_t *)&v25, 0xCu);
  }

}

- (BOOL)canHostAnApp
{
  return 1;
}

- (BOOL)isHostingAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  SBDeviceApplicationSceneHandle *sceneHandle;

  if (-[SBInCallPresentationSession isHostingAnApp](self, "isHostingAnApp"))
    sceneHandle = self->_sceneHandle;
  else
    sceneHandle = 0;
  return sceneHandle;
}

- (id)hostedAppSceneHandles
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[SBInCallPresentationSession isHostingAnApp](self, "isHostingAnApp"))
  {
    v5[0] = self->_sceneHandle;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInCallPresentationSession.m"), 407, CFSTR("%@ should never be called"), v5);

}

- (void)setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:(BOOL)a3
{
  self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings = a3;
  -[SBInCallTransientOverlayViewController setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:](self->_transientOverlayViewController, "setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:");
}

- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  _BOOL8 v14;
  id v15;

  v9 = a4;
  if (self->_sceneHandle == a3)
  {
    v15 = v9;
    v10 = a5;
    objc_msgSend(v10, "layoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBInCallPresentationSession _currentPresentationModeForLayoutState:](self, "_currentPresentationModeForLayoutState:", v11);

    objc_msgSend(v10, "layoutState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[SBInCallPresentationSession _systemControlsShouldPresentAsEmbeddedForLayoutState:](self, "_systemControlsShouldPresentAsEmbeddedForLayoutState:", v13);
    -[SBInCallPresentationSession _appendToMutableInCallSceneSettings:presentationMode:shouldPresentAsEmbedded:](self, "_appendToMutableInCallSceneSettings:presentationMode:shouldPresentAsEmbedded:", v15, v12, v14);
    v9 = v15;
  }

}

- (void)_appendToMutableInCallSceneSettings:(id)a3 presentationMode:(int64_t)a4 shouldPresentAsEmbedded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL8 v11;
  _BOOL4 isAttachedToWindowedAccessory;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  uint8_t buf[4];
  _DWORD v27[7];

  v5 = a5;
  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  SBLogInCallPresentation();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    SBSInCallPresentationModeDescription();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v27 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Setting presentation mode on scene settings: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v8, "setInterruptionPolicy:", 3);
  objc_msgSend(v8, "setInCallPresentationMode:", a4);
  if (a4)
    v11 = -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked");
  else
    v11 = 0;
  objc_msgSend(v8, "setBeingShownAboveCoverSheet:", v11);
  isAttachedToWindowedAccessory = self->_isAttachedToWindowedAccessory;
  -[SBUIController visibleScreenCoordinatesForWindowedAccessory](self->_uiController, "visibleScreenCoordinatesForWindowedAccessory");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  SBLogInCallPresentation();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)v25 = v14;
    *(double *)&v25[1] = v16;
    *(double *)&v25[2] = v18;
    *(double *)&v25[3] = v20;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v25, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v27[0] = isAttachedToWindowedAccessory;
    LOWORD(v27[1]) = 2114;
    *(_QWORD *)((char *)&v27[1] + 2) = v22;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Setting device attachedToWindowedAccessory: %{BOOL}u windowedAccessoryCutoutFrameInScreen: %{public}@", buf, 0x12u);

  }
  objc_msgSend(v8, "setAttachedToWindowedAccessory:", isAttachedToWindowedAccessory);
  objc_msgSend(v8, "setWindowedAccessoryCutoutFrameInScreen:", v14, v16, v18, v20);
  objc_msgSend(v8, "setScreenSharingPresentation:", self->_isScreenSharingPresentation);
  objc_msgSend(v8, "setRequestedPresentationConfigurationIdentifier:", self->_requestedPresentationConfigurationIdentifier);
  objc_msgSend(v8, "setSystemControlsShouldPresentAsEmbedded:", v5);
  if (a4 == 1)
  {
    v23 = objc_alloc(MEMORY[0x1E0D01730]);
    +[SBInCallBannerPresentableViewController cornerRadius](SBInCallBannerPresentableViewController, "cornerRadius");
    v24 = (void *)objc_msgSend(v23, "initWithCornerRadius:");
    objc_msgSend(v8, "setCornerRadiusConfiguration:", v24);

  }
  -[SBInCallPresentationSession _updateAmbientPresentationSettingsForInCallSettings:](self, "_updateAmbientPresentationSettingsForInCallSettings:", v8);

}

- (void)applicationSceneHandle:(id)a3 appendToTransitionContext:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  id v9;
  NSMutableArray *assertionAnalyticSources;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (self->_sceneHandle != a3)
    goto LABEL_12;
  assertionAnalyticSources = self->_assertionAnalyticSources;
  v11 = a4;
  -[NSMutableArray lastObject](assertionAnalyticSources, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v9, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "source");

    if ((unint64_t)(v14 - 11) >= 2)
    {
      if (v14 != 20)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v15 = (id *)MEMORY[0x1E0DAC7F0];
    }
    else
    {
      v15 = (id *)MEMORY[0x1E0DAC820];
    }
    v12 = *v15;
  }
LABEL_9:
  SBLogInCallPresentation();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = v12;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Setting analytics source on transition context: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(v11, "SBSUI_setInCallAnalyticsSource:", v12);
LABEL_12:

}

- (id)bannerUnfurlSourceContextForTransitionRequest:(id)a3
{
  void *v4;
  void *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isDeviceApplicationSceneEntity"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_entityToUnfurlSourceContext;
    v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "isAnalogousToEntity:", v5, (_QWORD)v14))
          {
            -[NSMapTable objectForKey:](self->_entityToUnfurlSourceContext, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_13:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)inCallBannerPresentableViewControllerDidCrossDefaultDraggingThreshold:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;

  v4 = -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked", a3);
  v5 = *MEMORY[0x1E0DAC7C0];
  if (v4)
    -[SBInCallPresentationSession _performBannerToTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:](self, "_performBannerToTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:", 1, v5, 0);
  else
    -[SBInCallPresentationSession _performBannerToFullScreenPresentationTransitionAnimated:analyticsSource:completion:](self, "_performBannerToFullScreenPresentationTransitionAnimated:analyticsSource:completion:", 1, v5, 0);
}

- (void)inCallBannerPresentableViewControllerDidReceiveTap:(id)a3
{
  -[SBInCallPresentationSession _performBannerToFullScreenPresentationTransitionAnimated:analyticsSource:completion:](self, "_performBannerToFullScreenPresentationTransitionAnimated:analyticsSource:completion:", 1, *MEMORY[0x1E0DAC7C8], 0);
}

- (void)inCallBannerPresentableViewControllerWillAppear:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  -[SBInCallPresentationSession _addSystemAnimationDeactivationReason:](self, "_addSystemAnimationDeactivationReason:", CFSTR("banner"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v5);

}

- (void)inCallBannerPresentableViewControllerDidAppear:(id)a3
{
  -[SBInCallPresentationSession _removeSystemAnimationDeactivationReason:](self, "_removeSystemAnimationDeactivationReason:", CFSTR("banner"));
}

- (void)inCallBannerPresentableViewController:(id)a3 willDisappearWithReason:(id)a4
{
  -[SBInCallPresentationSession _addSystemAnimationDeactivationReason:](self, "_addSystemAnimationDeactivationReason:", CFSTR("banner"), a4);
}

- (void)inCallBannerPresentableViewController:(id)a3 didDisappearWithReason:(id)a4
{
  SBInCallBannerPresentableViewController *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  SBMainWorkspace *workspace;
  void *v12;
  void *v13;
  SBDeviceApplicationSceneEntity *v14;
  uint64_t v15;
  SBDeviceApplicationSceneEntity *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SBInCallPresentationSceneUpdateContext *v26;
  uint64_t v27;
  id v28;
  SBInCallPresentationSceneUpdateContext *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  SBDeviceApplicationSceneEntity *v35;

  v6 = (SBInCallBannerPresentableViewController *)a3;
  v7 = a4;
  -[SBInCallPresentationSession _removeSystemAnimationDeactivationReason:](self, "_removeSystemAnimationDeactivationReason:", CFSTR("banner"));
  -[SBInCallBannerPresentableViewController invalidate](v6, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v10);

  if (self->_bannerPresentableViewController == v6)
  {
    self->_bannerPresentableViewController = 0;

  }
  -[SBInCallPresentationSession _setNonModalPresentationActive:](self, "_setNonModalPresentationActive:", 0);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("_SBInCallBannerRevocationReasonBannerUnfurl")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("_SBInCallBannerRevocationReasonSessionRequest")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("_SBInCallBannerRevocationReasonTransientOverlayPresentation")) & 1) == 0)
  {
    workspace = self->_workspace;
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](workspace, "createRequestWithOptions:displayConfiguration:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
    v15 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke;
    v34[3] = &unk_1E8E9EE50;
    v35 = v14;
    v16 = v14;
    objc_msgSend(v13, "modifyApplicationContext:", v34);
    objc_msgSend(v13, "finalize");
    objc_msgSend(v13, "applicationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frameForApplicationSceneEntity:", v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = [SBInCallPresentationSceneUpdateContext alloc];
    v27 = *MEMORY[0x1E0DAC7B8];
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_2;
    v32[3] = &unk_1E8E9EE78;
    v33 = v17;
    v28 = v17;
    v29 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v26, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v27, v32, v19, v21, v23, v25);
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_4;
    v30[3] = &unk_1E8EAAD78;
    v30[4] = self;
    v31 = WeakRetained;
    -[SBInCallPresentationSceneUpdateContext setPostSceneUpdateHandler:](v29, "setPostSceneUpdateHandler:", v30);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v29);

  }
}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setEntity:forLayoutRole:", v2, 1);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, 2);

}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_3;
  v3[3] = &unk_1E8E9EE50;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "modifyApplicationContext:", v3);

}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(v2, "interfaceOrientation"));

}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(id, _QWORD);
  char v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v5 = a3;
  v9 = v5;
  if ((_DWORD)a2)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_shouldExcludeFromSwitcherWhenDismissed");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "displayItemRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "switcherController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAppLayoutForDisplayItem:completion:", v7, 0);

      v5 = v9;
    }
  }
  if (v5)
  {
    v5[2](v5, a2);
    v5 = v9;
  }

}

- (void)inCallBannerPresentableViewControllerUserInteractionWillBegin:(id)a3
{
  -[SBInCallPresentationSession _addSystemGestureDeactivationReason:](self, "_addSystemGestureDeactivationReason:", CFSTR("banner"));
}

- (void)inCallBannerPresentableViewControllerUserInteractionDidEnd:(id)a3
{
  -[SBInCallPresentationSession _removeSystemGestureDeactivationReason:](self, "_removeSystemGestureDeactivationReason:", CFSTR("banner"));
}

- (void)inCallBannerPresentableViewControllerCallConnectedStatusChanged:(id)a3
{
  SBInCallPresentationSessionDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "inCallClientPresentationSession:callConnectedStatusChangedForPresentableViewController:", self, v5);

}

- (void)inCallTransientOverlayViewController:(id)a3 willAppearAnimated:(BOOL)a4
{
  -[SBInCallPresentationSession _addSystemAnimationDeactivationReason:](self, "_addSystemAnimationDeactivationReason:", CFSTR("transientOverlay"), a4);
}

- (void)inCallTransientOverlayViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  void *v5;
  SBBannerManager *bannerManager;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_preventsBannersWhenPresentedAsOverlay)
  {
    objc_msgSend(v8, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      bannerManager = self->_bannerManager;
      objc_msgSend(v8, "_sbWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBannerManager dismissAllBannersInWindowScene:animated:reason:](bannerManager, "dismissAllBannersInWindowScene:animated:reason:", v7, 1, CFSTR("SBInCallPresentationSession requests dismissall of all banners"));

    }
  }
  -[SBInCallPresentationSession _removeSystemAnimationDeactivationReason:](self, "_removeSystemAnimationDeactivationReason:", CFSTR("transientOverlay"));

}

- (void)inCallTransientOverlayViewController:(id)a3 willDisappearAnimated:(BOOL)a4
{
  -[SBInCallPresentationSession _addSystemAnimationDeactivationReason:](self, "_addSystemAnimationDeactivationReason:", CFSTR("transientOverlay"), a4);
}

- (void)inCallTransientOverlayViewController:(id)a3 didDisappearAnimated:(BOOL)a4
{
  SBInCallTransientOverlayViewController *v5;
  BSInvalidatable *suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion;
  SBInCallPresentationSceneUpdateContext *v7;
  void *v8;
  void *v9;
  SBInCallPresentationSceneUpdateContext *v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v5 = (SBInCallTransientOverlayViewController *)a3;
  -[SBInCallPresentationSession _removeSystemAnimationDeactivationReason:](self, "_removeSystemAnimationDeactivationReason:", CFSTR("transientOverlay"));
  -[SBInCallTransientOverlayViewController invalidate](v5, "invalidate");
  -[BSInvalidatable invalidate](self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion, "invalidate");
  suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion;
  self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = 0;

  if (self->_transientOverlayViewController == v5)
  {
    self->_transientOverlayViewController = 0;

  }
  if (self->_isTransientOverlayPresentationActive)
  {
    -[SBInCallPresentationSession _setTransientOverlayPresentationActive:](self, "_setTransientOverlayPresentationActive:", 0);
    v7 = [SBInCallPresentationSceneUpdateContext alloc];
    -[SBInCallPresentationSession _screen](self, "_screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fixedCoordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v7, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", *MEMORY[0x1E0DAC7E8], &__block_literal_global_70_0);

    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v10, "setExecutionTarget:", 1);
    v11 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_2;
    v13[3] = &unk_1E8EA6C08;
    v13[4] = self;
    -[SBInCallPresentationSceneUpdateContext setValidatorHandler:](v10, "setValidatorHandler:", v13);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v10);
    if (!self->_isHandlingTransientOverlayDismissalRequest
      && !-[SBInCallPresentationSession _shouldExcludeFromSwitcherWhenDismissed](self, "_shouldExcludeFromSwitcherWhenDismissed"))
    {
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_3;
      v12[3] = &unk_1E8EA0048;
      v12[4] = self;
      -[SBInCallPresentationSession _performBlockUsingMainEventQueueWithReason:handler:](self, "_performBlockUsingMainEventQueueWithReason:handler:", CFSTR("SBInCallPresentationSession - inCallTransientOverlayViewController:"), v12);
    }

  }
}

uint64_t __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_hasExistingSceneSettingsPresentationModeForLayoutState:", v4) ^ 1;

  return v5;
}

void __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "displayItemRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 392));
  objc_msgSend(WeakRetained, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_4;
  v8[3] = &unk_1E8EA4988;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "addAppLayoutForDisplayItem:completion:", v4, v8);

}

uint64_t __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)inCallTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  _QWORD v6[5];

  self->_isHandlingTransientOverlayDismissalRequest = 1;
  v4 = -[SBInCallPresentationSession _shouldExcludeFromSwitcherWhenDismissed](self, "_shouldExcludeFromSwitcherWhenDismissed", a3);
  v5 = *MEMORY[0x1E0DAC7E8];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SBInCallPresentationSession_inCallTransientOverlayViewControllerRequestsDismissal___block_invoke;
  v6[3] = &unk_1E8E9E980;
  v6[4] = self;
  -[SBInCallPresentationSession _performTransientOverlayDismissalTransitionAnimated:shouldInsertIntoSwitcherModel:analyticsSource:completion:](self, "_performTransientOverlayDismissalTransitionAnimated:shouldInsertIntoSwitcherModel:analyticsSource:completion:", 1, !v4, v5, v6);
}

uint64_t __85__SBInCallPresentationSession_inCallTransientOverlayViewControllerRequestsDismissal___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 213) = 0;
  return result;
}

- (BOOL)inCallTransientOverlayViewControllerShouldSupportAlwaysOnDisplay:(id)a3
{
  return !self->_isScreenSharingPresentation
      && -[SBInCallPresentationSession supportsBecomingVisibleWhenUnlockingFromSource:wakingDisplay:](self, "supportsBecomingVisibleWhenUnlockingFromSource:wakingDisplay:", 32, 1);
}

- (BOOL)inCallTransientOverlayViewControllerShouldPreventBannerPresentations:(id)a3
{
  return self->_preventsBannersWhenPresentedAsOverlay;
}

- (void)inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:(BOOL)a3 ambientDisplayStyle:(int64_t)a4
{
  NSObject *v5;
  _BOOL4 isAmbientPresented;
  int64_t ambientDisplayStyle;
  _DWORD v8[2];
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_isAmbientPresented = a3;
  self->_ambientDisplayStyle = a4;
  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    SBLogInCallPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      isAmbientPresented = self->_isAmbientPresented;
      ambientDisplayStyle = self->_ambientDisplayStyle;
      v8[0] = 67109376;
      v8[1] = isAmbientPresented;
      v9 = 2048;
      v10 = ambientDisplayStyle;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updating scene settings to ambient presentation change isAmbientPresented: %{BOOL}d ambientDisplayStyle: %lu", (uint8_t *)v8, 0x12u);
    }

    -[SBInCallPresentationSession _updateSceneSettingsForAmbientPresentationSettingsUpdate](self, "_updateSceneSettingsForAmbientPresentationSettingsUpdate");
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SBLayoutElement *preferredDismissalPrimaryElement;
  id v12;

  v5 = a4;
  v6 = objc_opt_class();
  objc_msgSend(v5, "fromLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v5, "toLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualObjects() & 1) == 0 && !self->_isPerformingSwitcherPresentation)
  {
    preferredDismissalPrimaryElement = self->_preferredDismissalPrimaryElement;
    self->_preferredDismissalPrimaryElement = 0;

  }
  -[SBInCallPresentationSession _updateKeyboardFocusPreventionAssertionWithLayoutState:](self, "_updateKeyboardFocusPreventionAssertionWithLayoutState:", v10);
  -[SBInCallPresentationSession _updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:](self, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", objc_msgSend(v10, "unlockedEnvironmentMode"), -[SBInCallPresentationSession _shouldConsiderScenePrimaryForLayoutState:](self, "_shouldConsiderScenePrimaryForLayoutState:", v10));

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SBInCallPresentationSceneUpdateContext *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  SBInCallPresentationSceneUpdateContext *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  objc_msgSend(v7, "fromLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  objc_msgSend(v7, "toLayoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = -[SBInCallPresentationSession _shouldConsiderScenePrimaryForLayoutState:](self, "_shouldConsiderScenePrimaryForLayoutState:", v10);
  v14 = -[SBInCallPresentationSession _shouldConsiderScenePrimaryForLayoutState:](self, "_shouldConsiderScenePrimaryForLayoutState:", v13);
  v15 = v14;
  if ((_DWORD)v12 && !v14)
  {
    -[SBInCallPresentationSession sceneHandle](self, "sceneHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "elementWithIdentifier:", v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneEntityFrameProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "workspaceEntity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sceneEntityFrameForWorkspaceEntity:inLayoutState:", v19, v10);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = [SBInCallPresentationSceneUpdateContext alloc];
    v29 = *MEMORY[0x1E0DAC818];
    v30 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
    v35[3] = &unk_1E8EA0260;
    v36 = v10;
    v37 = v17;
    v31 = v17;
    v32 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v28, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v29, v35, v21, v23, v25, v27);
    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v32, "setExecutionTarget:", 1);
    v34[0] = v30;
    v34[1] = 3221225472;
    v34[2] = __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3;
    v34[3] = &unk_1E8EA6C08;
    v34[4] = self;
    -[SBInCallPresentationSceneUpdateContext setValidatorHandler:](v32, "setValidatorHandler:", v34);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v32);

  }
  -[SBInCallPresentationSession _updateKeyboardFocusPreventionAssertionWithLayoutState:](self, "_updateKeyboardFocusPreventionAssertionWithLayoutState:", v13, v33);
  -[SBInCallPresentationSession _updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:](self, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", objc_msgSend(v13, "unlockedEnvironmentMode"), v15);
  -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v13);
  -[SBInCallPresentationSession _updateSceneHandleToObserveForSendingShowNoticeForSystemControlsAction:](self, "_updateSceneHandleToObserveForSendingShowNoticeForSystemControlsAction:", v13);
  -[SBInCallPresentationSession _updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:](self, "_updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:", v13);

}

void __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
  v4[3] = &unk_1E8E9ECA8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "modifyApplicationContext:", v4);

}

void __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v2, "layoutAttributesForElement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentOrientation");

  objc_msgSend(v6, "setInterfaceOrientation:", v5);
}

uint64_t __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_hasExistingSceneSettingsPresentationModeForLayoutState:", v4) ^ 1;

  return v5;
}

- (void)_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:(int64_t)a3 shouldConsiderPrimary:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id WeakRetained;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;

  v4 = a4;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "embeddedDisplayWindowScene");
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0CEB4B0];
  v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (a3 == 3 && v4)
  {
    -[SBPIPControllerCoordinator controllerForType:](self->_pipControllerCoordinator, "controllerForType:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPictureInPictureWindowVisibleOnWindowScene:", v37);

    if (v13)
    {
      -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_class();
      v17 = v15;
      if (v16)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v19 = v18;

      objc_msgSend(v19, "expanseHUDDodgingInsets");
      v8 = v20;
      v9 = v21;
      v10 = v22;
      v11 = v23;

    }
  }
  if (self->_preferredPIPDodgingInsets.left != v9
    || self->_preferredPIPDodgingInsets.top != v8
    || self->_preferredPIPDodgingInsets.right != v11
    || self->_preferredPIPDodgingInsets.bottom != v10)
  {
    self->_preferredPIPDodgingInsets.top = v8;
    self->_preferredPIPDodgingInsets.left = v9;
    self->_preferredPIPDodgingInsets.bottom = v10;
    self->_preferredPIPDodgingInsets.right = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "inCallClientPresentationSessionResolvedPIPDodgingInsets:", self);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    objc_msgSend(v37, "pictureInPictureManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "applyPictureInPictureInsets:forSource:", 8, v29, v31, v33, v35);

  }
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  SBInCallPresentationSceneUpdateContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  SBInCallPresentationSceneUpdateContext *v14;
  _QWORD v15[6];
  _QWORD v16[5];

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3, a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v9 = [SBInCallPresentationSceneUpdateContext alloc];
    -[SBInCallPresentationSession _screen](self, "_screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fixedCoordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = MEMORY[0x1E0C809B0];
    v13 = *MEMORY[0x1E0DAC800];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
    v16[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
    v16[4] = a3;
    v14 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v9, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v13, v16);

    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v14, "setExecutionTarget:", 1);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3;
    v15[3] = &unk_1E8EAADE0;
    v15[4] = self;
    v15[5] = a3;
    -[SBInCallPresentationSceneUpdateContext setValidatorHandler:](v14, "setValidatorHandler:", v15);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v14);

  }
}

uint64_t __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2;
  v3[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "modifyApplicationContext:", v3);
}

uint64_t __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
}

BOOL __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 210))
    v7 = 0;
  else
    v7 = *(_BYTE *)(v5 + 209) == 0;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 392));
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elementWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    return 0;
  if (v12)
    return 0;
  return v7;
}

- (BOOL)handleAccessoryAttachWithCompletion:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (self->_isAttachedToWindowedAccessory
    && !-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked")
    && -[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates")
    && !self->_isTransientOverlayPresentationActive
    && (-[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = *MEMORY[0x1E0DAC830];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke;
    v9[3] = &unk_1E8E9F1C0;
    v10 = v4;
    -[SBInCallPresentationSession _performTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:](self, "_performTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:", 0, v8, v9);

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke_2;
  block[3] = &unk_1E8E9E8D0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_windowedAccessoryDidAttachOrDetach:(id)a3
{
  SBDeviceApplicationSceneHandle *sceneHandle;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[8];
  char v21;
  _QWORD v22[4];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  sceneHandle = self->_sceneHandle;
  v5 = a3;
  -[SBDeviceApplicationSceneHandle sceneIfExists](sceneHandle, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("SBUIWindowedAccessoryAttachedKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  self->_isAttachedToWindowedAccessory = v9;
  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    -[SBUIController visibleScreenCoordinatesForWindowedAccessory](self->_uiController, "visibleScreenCoordinatesForWindowedAccessory");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    SBLogInCallPresentation();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22[0] = v11;
      v22[1] = v13;
      v22[2] = v15;
      v22[3] = v17;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v24 = v9;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Updating scene settings to attachedToWindowedAccessory: %{BOOL}u windowedAccessoryCutoutFrameInScreen: %{public}@", buf, 0x12u);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__SBInCallPresentationSession__windowedAccessoryDidAttachOrDetach___block_invoke;
    v20[3] = &__block_descriptor_65_e33_v16__0__FBSMutableSceneSettings_8l;
    v21 = v9;
    v20[4] = v11;
    v20[5] = v13;
    v20[6] = v15;
    v20[7] = v17;
    objc_msgSend(v6, "updateSettingsWithBlock:", v20);
  }

}

void __67__SBInCallPresentationSession__windowedAccessoryDidAttachOrDetach___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = a2;
  objc_msgSend(v4, "setAttachedToWindowedAccessory:", v3);
  objc_msgSend(v4, "setWindowedAccessoryCutoutFrameInScreen:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (void)_updateSceneDeactivationAssertions
{
  UIApplicationSceneDeactivationManager *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  char v9;
  UIApplicationSceneDeactivationAssertion *v10;
  UIApplicationSceneDeactivationAssertion *systemAnimationSceneDeactivationAssertion;
  UIApplicationSceneDeactivationAssertion *v12;
  UIApplicationSceneDeactivationAssertion *v13;
  uint64_t v14;
  char v15;
  UIApplicationSceneDeactivationAssertion *v16;
  UIApplicationSceneDeactivationAssertion *systemGestureSceneDeactivationAssertion;
  UIApplicationSceneDeactivationAssertion *v18;
  UIApplicationSceneDeactivationAssertion *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  UIApplicationSceneDeactivationAssertion *v30;
  _QWORD v31[4];
  UIApplicationSceneDeactivationAssertion *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  SBInCallPresentationSession *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = self->_deactivationManager;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isValid"))
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__37;
    v38 = __Block_byref_object_dispose__37;
    v6 = MEMORY[0x1E0C809B0];
    v39 = 0;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke;
    v33[3] = &unk_1E8EAAE28;
    v33[4] = &v34;
    v7 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v33);
    v8 = -[NSMutableSet count](self->_activeSystemAnimationDeactivationReasons, "count");
    v9 = (v8 != 0) ^ (self->_systemAnimationSceneDeactivationAssertion == 0);
    if ((v8 != 0) == (self->_systemAnimationSceneDeactivationAssertion == 0))
    {
      if (v8)
      {
        v10 = (UIApplicationSceneDeactivationAssertion *)-[UIApplicationSceneDeactivationManager newAssertionWithReason:](v3, "newAssertionWithReason:", 5);
        systemAnimationSceneDeactivationAssertion = self->_systemAnimationSceneDeactivationAssertion;
        self->_systemAnimationSceneDeactivationAssertion = v10;

        v12 = self->_systemAnimationSceneDeactivationAssertion;
        v31[0] = v6;
        v31[1] = 3221225472;
        v31[2] = __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_2;
        v31[3] = &unk_1E8EA3EA0;
        v32 = v5;
        -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](v12, "acquireWithPredicate:transitionContext:", v31, 0);
        v13 = v32;
      }
      else
      {
        v7[2](v7);
        v13 = self->_systemAnimationSceneDeactivationAssertion;
        self->_systemAnimationSceneDeactivationAssertion = 0;
      }

    }
    v14 = -[NSMutableSet count](self->_activeSystemGestureDeactivationReasons, "count");
    if ((v14 != 0) != (self->_systemGestureSceneDeactivationAssertion == 0))
    {
      v15 = v9 ^ 1;
    }
    else
    {
      if (v14)
      {
        v16 = (UIApplicationSceneDeactivationAssertion *)-[UIApplicationSceneDeactivationManager newAssertionWithReason:](v3, "newAssertionWithReason:", 0);
        systemGestureSceneDeactivationAssertion = self->_systemGestureSceneDeactivationAssertion;
        self->_systemGestureSceneDeactivationAssertion = v16;

        v18 = self->_systemGestureSceneDeactivationAssertion;
        v29[0] = v6;
        v29[1] = 3221225472;
        v29[2] = __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_3;
        v29[3] = &unk_1E8EA3EA0;
        v30 = v5;
        -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](v18, "acquireWithPredicate:transitionContext:", v29, 0);
        v19 = v30;
      }
      else
      {
        v7[2](v7);
        v19 = self->_systemGestureSceneDeactivationAssertion;
        self->_systemGestureSceneDeactivationAssertion = 0;
      }

      v15 = 1;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = (id)v35[5];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "relinquish", (_QWORD)v25);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
      }
      while (v21);

    }
    else
    {

      if ((v15 & 1) == 0)
      {
LABEL_25:

        _Block_object_dispose(&v34, 8);
        goto LABEL_26;
      }
    }
    SBLogInCallPresentation();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = self;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Updated deactivation assertions for session %{public}@", buf, 0xCu);
    }

    goto LABEL_25;
  }
LABEL_26:

}

void __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

uint64_t __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)inCallBannerPresentableViewController:(id)a3 viewWillTransitionSizeWithAnimationSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SBBannerManager *bannerManager;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  SBInCallPresentationSceneUpdateContext *v58;
  uint64_t v59;
  SBInCallPresentationSceneUpdateContext *v60;
  double v61;
  double v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;

  v6 = a4;
  if (self->_isNonModalPresentationActive)
  {
    v7 = a3;
    v8 = objc_msgSend(v7, "interfaceOrientation");
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v8)
      v11 = (v10 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    else
      v11 = 0;
    if (v11)
      v12 = v8;
    else
      v12 = 1;
    objc_msgSend(v7, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    bannerManager = self->_bannerManager;
    -[SBBannerManager windowSceneForPresentable:](bannerManager, "windowSceneForPresentable:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager layoutManagerInWindowScene:](bannerManager, "layoutManagerInWindowScene:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBInCallPresentationSession _screen](self, "_screen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18;
    v62 = v18;
    objc_msgSend(v25, "useableContainerFrameInContainerBounds:onScreen:", v26, v16, v18, v20, v22);
    v29 = v28;
    v61 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    -[SBInCallPresentationSession _screen](self, "_screen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scale");
    objc_msgSend(v25, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v33, v35, v29, v31, v33, v35, *(_QWORD *)&v16, *(_QWORD *)&v27, *(_QWORD *)&v20, *(_QWORD *)&v22, v37);
    v39 = v38;
    v41 = v40;

    objc_msgSend(v7, "preferredContentSizeWithPresentationSize:containerSize:", v39, v41, v20, v22);
    v43 = v42;
    v45 = v44;

    -[SBInCallPresentationSession _screen](self, "_screen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scale");
    objc_msgSend(v25, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v43, v45, v61, v31, v33, v35, *(_QWORD *)&v16, *(_QWORD *)&v62, *(_QWORD *)&v20, *(_QWORD *)&v22, v47);

    BSRectWithSize();
    -[SBInCallPresentationSession _screen](self, "_screen");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "fixedCoordinateSpace");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bounds");
    _UIWindowConvertRectFromOrientationToOrientation();
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    v58 = [SBInCallPresentationSceneUpdateContext alloc];
    v59 = *MEMORY[0x1E0DAC810];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke;
    v63[3] = &unk_1E8EAAE78;
    v65 = v12;
    v64 = v6;
    v60 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v58, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v59, v63, v51, v53, v55, v57);
    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v60, "setExecutionTarget:", 1);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v60);

  }
}

void __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2;
  v4[3] = &unk_1E8EAAE50;
  v3 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(a2, "modifyApplicationContext:", v4);

}

void __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", v3);
  objc_msgSend(v4, "setAnimationSettings:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setFencesAnimations:", 1);

}

- (void)_dispatchBlockToMainEventQueueWithReason:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SBInCallPresentationSession__dispatchBlockToMainEventQueueWithReason_block___block_invoke;
  v8[3] = &unk_1E8EAAEA0;
  v9 = v6;
  v7 = v6;
  -[SBInCallPresentationSession _performBlockUsingMainEventQueueWithReason:handler:](self, "_performBlockUsingMainEventQueueWithReason:handler:", a3, v8);

}

void __78__SBInCallPresentationSession__dispatchBlockToMainEventQueueWithReason_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v4[2]();

}

- (void)_performBlockUsingMainEventQueueWithReason:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[SBWorkspace eventQueue](self->_workspace, "eventQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  v9 = (void *)MEMORY[0x1E0D229B0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke;
  v16 = &unk_1E8EA0510;
  objc_copyWeak(&v19, &location);
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v9, "eventWithName:handler:", v10, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeOrAppendEvent:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBInCallPresentationSessionEvent-%@"), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "acquireLockForReason:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke_2;
    v8[3] = &unk_1E8E9E820;
    v9 = WeakRetained;
    v10 = v4;
    v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
    v7 = v4;
    v6(v5, v8);

  }
}

uint64_t __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquishLock:", *(_QWORD *)(a1 + 40));
}

- (void)inCallTransientOverlayViewController:(id)a3 viewWillTransitionSizeWithAnimationSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SBInCallPresentationSceneUpdateContext *v23;
  uint64_t v24;
  SBInCallPresentationSceneUpdateContext *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  if (self->_isTransientOverlayPresentationActive)
  {
    v7 = a3;
    v8 = objc_msgSend(v7, "interfaceOrientation");
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v8)
      v11 = (v10 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    else
      v11 = 0;
    if (!v11)
      v8 = 1;
    objc_msgSend(v7, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bounds");
    BSRectWithSize();
    -[SBInCallPresentationSession _screen](self, "_screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fixedCoordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    _UIWindowConvertRectFromOrientationToOrientation();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = [SBInCallPresentationSceneUpdateContext alloc];
    v24 = *MEMORY[0x1E0DAC810];
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke;
    v29 = &unk_1E8EAAE78;
    v31 = v8;
    v30 = v6;
    v25 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v23, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v24, &v26, v16, v18, v20, v22);
    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v25, "setExecutionTarget:", 1, v26, v27, v28, v29);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v25);

  }
}

void __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2;
  v4[3] = &unk_1E8EAAE50;
  v3 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(a2, "modifyApplicationContext:", v4);

}

void __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", v3);
  objc_msgSend(v4, "setAnimationSettings:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setFencesAnimations:", 1);

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id WeakRetained;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutState");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v8);
  -[SBInCallPresentationSession _updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:](self, "_updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:", v8);

}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v6;

  v6 = a4;
  if (objc_msgSend(a3, "isEqual:", self->_sceneHandle))
    objc_msgSend(v6, "addObserver:", self);

}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
  if (objc_msgSend(v10, "isEqual:", self->_sceneHandle))
  {
    -[SBInCallPresentationSession _inCallSceneClientSettingsDiffInspector](self, "_inCallSceneClientSettingsDiffInspector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inspectDiff:withContext:", v7, 0);

  }
  else if (WeakRetained && objc_msgSend(v10, "isEqual:", WeakRetained))
  {
    -[SBInCallPresentationSession _sendShowNoticeForSystemControlsActionIfNeeded](self, "_sendShowNoticeForSystemControlsActionIfNeeded");
  }

}

- (id)_inCallSceneClientSettingsDiffInspector
{
  SBSUIInCallSceneClientSettingsDiffInspector *inCallSceneClientSettingsDiffInspector;
  SBSUIInCallSceneClientSettingsDiffInspector *v4;
  SBSUIInCallSceneClientSettingsDiffInspector *v5;
  SBSUIInCallSceneClientSettingsDiffInspector *v6;
  uint64_t v7;
  SBSUIInCallSceneClientSettingsDiffInspector *v8;
  SBSUIInCallSceneClientSettingsDiffInspector *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  if (!inCallSceneClientSettingsDiffInspector)
  {
    v4 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0DAC4D0]);
    v5 = self->_inCallSceneClientSettingsDiffInspector;
    self->_inCallSceneClientSettingsDiffInspector = v4;

    objc_initWeak(&location, self);
    v6 = self->_inCallSceneClientSettingsDiffInspector;
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke;
    v15[3] = &unk_1E8EA2658;
    objc_copyWeak(&v16, &location);
    -[SBSUIInCallSceneClientSettingsDiffInspector observeExpanseHUDDodgingInsetsWithBlock:](v6, "observeExpanseHUDDodgingInsetsWithBlock:", v15);
    v8 = self->_inCallSceneClientSettingsDiffInspector;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_2;
    v13[3] = &unk_1E8EA2658;
    objc_copyWeak(&v14, &location);
    -[SBSUIInCallSceneClientSettingsDiffInspector observePrefersBannersHiddenFromClonedDisplayWithBlock:](v8, "observePrefersBannersHiddenFromClonedDisplayWithBlock:", v13);
    v9 = self->_inCallSceneClientSettingsDiffInspector;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_3;
    v11[3] = &unk_1E8EA2658;
    objc_copyWeak(&v12, &location);
    -[SBSUIInCallSceneClientSettingsDiffInspector observePrefersHiddenWhenDismissedWithBlock:](v9, "observePrefersHiddenWhenDismissedWithBlock:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  }
  return inCallSceneClientSettingsDiffInspector;
}

void __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "_sceneManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_layoutStateTransitionCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isTransitioning");

    WeakRetained = v8;
    if ((v4 & 1) == 0)
    {
      v5 = objc_loadWeakRetained(v8 + 49);
      objc_msgSend(v5, "layoutStateProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", objc_msgSend(v7, "unlockedEnvironmentMode"), objc_msgSend(v8, "_currentPresentationModeForLayoutState:", v7) == 2);
      WeakRetained = v8;
    }
  }

}

void __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id *v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(WeakRetained, "_clientSettingsIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "prefersBannersHiddenFromClonedDisplay");

    v2 = v12;
    v5 = v12[44];
    if (!v4)
    {
      objc_msgSend(v5, "invalidate");
      v6 = v12[44];
      v12[44] = 0;
      goto LABEL_6;
    }
    if (!v5)
    {
      v6 = objc_loadWeakRetained(v12 + 46);
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12[48], "sceneIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("SBInCallPresentationSession for %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inCallClientPresentationSession:acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:", v12, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v12[44];
      v12[44] = (id)v10;

LABEL_6:
      v2 = v12;
    }
  }

}

void __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_loadWeakRetained(WeakRetained + 49);
  objc_msgSend(v1, "layoutStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:", v3);

}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v6);

}

- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  SBInCallPresentationSession *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SBLogInCallPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBSUIInCallDestroySceneAction received for %{public}@", buf, 0xCu);
    }

    v7 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v7, "destructionReason");
    objc_msgSend(v7, "analyticsSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__SBInCallPresentationSession_sceneHandle_didReceiveAction___block_invoke;
    v14[3] = &unk_1E8E9E980;
    v15 = v7;
    v11 = v7;
    objc_msgSend(WeakRetained, "inCallClientPresentationSession:handleDestroySceneActionWithReason:analyticsSource:completion:", self, v9, v10, v14);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_9;
    }
    -[SBInCallPresentationSession _handleRequestInCallPresentationModeAction:](self, "_handleRequestInCallPresentationModeAction:", v5);
  }
  v12 = 1;
LABEL_9:

  return v12;
}

void __60__SBInCallPresentationSession_sceneHandle_didReceiveAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D016A8], "response");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendResponse:", v3);

  }
}

- (void)_handleRequestInCallPresentationModeAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  char v8;
  SBInCallBannerPresentableViewController *bannerPresentableViewController;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogInCallPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "requestedPresentationMode");
    SBSInCallPresentationModeDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Handling SBSUIInCallRequestPresentationModeAction with presentation mode: %{public}@", buf, 0xCu);

  }
  v7 = objc_msgSend(v4, "requestedPresentationMode");
  -[SBInCallPresentationSession setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:](self, "setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:", v7 == 3);
  v8 = 0;
  if (v7 == 3 && !self->_isScreenSharingPresentation)
    v8 = objc_msgSend(v4, "isUserInitiated", 0);
  self->_transientOverlayShouldAlwaysPreventHomeGestureDismissal = v8;
  -[SBInCallTransientOverlayViewController setShouldAlwaysPreventHomeGestureDismissal:](self->_transientOverlayViewController, "setShouldAlwaysPreventHomeGestureDismissal:");
  if (self->_isNonModalPresentationActive)
  {
    bannerPresentableViewController = self->_bannerPresentableViewController;
    if (bannerPresentableViewController)
    {
      if (!-[SBInCallBannerPresentableViewController isPresented](bannerPresentableViewController, "isPresented"))
      {
        objc_msgSend(v4, "analyticsSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBInCallPresentationSession _performBannerDismissalTransitionAnimated:analyticsSource:completion:](self, "_performBannerDismissalTransitionAnimated:analyticsSource:completion:", 0, v10, &__block_literal_global_94_1);

      }
    }
  }
  if (objc_msgSend(v4, "requestedPresentationMode") == 2
    && -[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive"))
  {
    objc_msgSend(v4, "sendCompletionResponseWithSuccess:", 0);
  }
  else
  {
    v11 = objc_msgSend(v4, "requestedPresentationMode");
    v12 = objc_msgSend(v4, "isUserInitiated");
    objc_msgSend(v4, "analyticsSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__SBInCallPresentationSession__handleRequestInCallPresentationModeAction___block_invoke_2;
    v14[3] = &unk_1E8E9E980;
    v15 = v4;
    -[SBInCallPresentationSession _performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:](self, "_performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:", v11, v12, 1, v13, v14);

  }
}

uint64_t __74__SBInCallPresentationSession__handleRequestInCallPresentationModeAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendCompletionResponseWithSuccess:", a2);
}

- (void)ensureInclusionInSwitcherForRestoreFromPIPWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = -[SBInCallPresentationSession _isInSwitcherModel](self, "_isInSwitcherModel");
  if (!-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates")
    || self->_isNonModalPresentationActive
    || self->_isTransientOverlayPresentationActive)
  {
    v4[2](v4, 0);
  }
  else if (v5)
  {
    v4[2](v4, 1);
  }
  else
  {
    v6 = *MEMORY[0x1E0DAC7D0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__SBInCallPresentationSession_ensureInclusionInSwitcherForRestoreFromPIPWithCompletion___block_invoke;
    v7[3] = &unk_1E8EA6C08;
    v7[4] = self;
    -[SBInCallPresentationSession _insertIntoSwitcherAsDismissedWithAnalyticsSource:transitionValidator:completion:](self, "_insertIntoSwitcherAsDismissedWithAnalyticsSource:transitionValidator:completion:", v6, v7, v4);
  }

}

uint64_t __88__SBInCallPresentationSession_ensureInclusionInSwitcherForRestoreFromPIPWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutStateForApplicationTransitionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (objc_msgSend(*(id *)(a1 + 32), "_isValidForSceneUpdates"))
    v10 = objc_msgSend(*(id *)(a1 + 32), "_isDismissedForLayoutState:", v9);
  else
    v10 = 0;

  return v10;
}

- (id)overrideAppSceneEntityForLaunchingApplication:(id)a3
{
  void *v4;
  SBInCallBannerPresentableViewController *bannerPresentableViewController;
  SBDeviceApplicationSceneEntity *v6;

  if (!objc_msgSend(a3, "isFaceTime")
    || !-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates")
    || self->_isScreenSharingPresentation)
  {
    goto LABEL_9;
  }
  -[SBInCallPresentationSession _clientSettingsIfExists](self, "_clientSettingsIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "shouldNeverBeShownWhenLaunchingFaceTime") & 1) != 0
    || (-[SBDeviceApplicationSceneHandle isContentReady](self->_sceneHandle, "isContentReady") & 1) == 0)
  {

    goto LABEL_9;
  }
  bannerPresentableViewController = self->_bannerPresentableViewController;

  if (bannerPresentableViewController)
  {
LABEL_9:
    v6 = 0;
    return v6;
  }
  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
  return v6;
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  SBInCallPresentationSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqual:", self->_sceneHandle, a4))
  {
    SBLogInCallPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "FBScene for %{public}@ was destroyed.", (uint8_t *)&v7, 0xCu);
    }

    if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "inCallClientPresentationSessionSceneWasDestroyed:", self);

    }
  }
}

- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4
{
  id v6;

  v6 = a4;
  if (-[SBDeviceApplicationSceneHandle isEqual:](self->_sceneHandle, "isEqual:", a3))
    -[SBInCallPresentationSession transitionToSceneHandleIfNeeded:](self, "transitionToSceneHandleIfNeeded:", v6);

}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStateForApplicationTransitionContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousLayoutStateForApplicationTransitionContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSMapTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMapTable *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect result;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationTransitionContext:frameForApplicationSceneEntity:", v6, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = self->_entityToSceneUpdateContext;
  v18 = -[NSMapTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v21);
      if ((objc_msgSend(v22, "isAnalogousToEntity:", v7, (_QWORD)v32) & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v19)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    -[NSMapTable objectForKey:](self->_entityToSceneUpdateContext, "objectForKey:", v22);
    v23 = (NSMapTable *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_13;
    -[NSMapTable referenceFrame](v23, "referenceFrame");
    v10 = v24;
    v12 = v25;
    v14 = v26;
    v16 = v27;
    v17 = v23;
  }
LABEL_12:

LABEL_13:
  v28 = v10;
  v29 = v12;
  v30 = v14;
  v31 = v16;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (unint64_t)_incrementPresentationModeRevisionIDWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t presentationModeRevisionID;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ++self->_presentationModeRevisionID;
  SBLogInCallPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_presentationModeRevisionID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInCallPresentationSession sceneHandle](self, "sceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistenceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "_incrementPresentationModeRevisionIDWithReason: %@ %{public}@ %{public}@", (uint8_t *)&v11, 0x20u);

  }
  presentationModeRevisionID = self->_presentationModeRevisionID;

  return presentationModeRevisionID;
}

- (void)_performSwitcherPresentationTransitionAnimated:(BOOL)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  SBDeviceApplicationSceneEntity *v15;
  uint64_t v16;
  SBDeviceApplicationSceneEntity *v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  SBMainWorkspace *workspace;
  id WeakRetained;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  SBInCallPresentationSceneUpdateContext *v45;
  SBInCallPresentationSceneUpdateContext *v46;
  _QWORD v47[4];
  void (**v48)(_QWORD);
  _QWORD v49[4];
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  _QWORD v56[5];
  SBDeviceApplicationSceneEntity *v57;
  BOOL v58;
  BOOL v59;

  v11 = a5;
  v12 = a6;
  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v13);

    v15 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
    v16 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke;
    v56[3] = &unk_1E8EAAF10;
    v56[4] = self;
    v17 = v15;
    v57 = v17;
    v58 = a3;
    v59 = a4;
    v51[0] = v16;
    v51[1] = 3221225472;
    v51[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_3;
    v51[3] = &unk_1E8EAAFB0;
    v51[4] = self;
    v55 = v14;
    v18 = (id)MEMORY[0x1D17E5550](v56);
    v53 = v18;
    v54 = v12;
    v19 = v11;
    v52 = v19;
    v20 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v51);
    if (-[SBDeviceApplicationSceneHandle contentState](self->_sceneHandle, "contentState"))
    {
      v20[2](v20);
    }
    else
    {
      workspace = self->_workspace;
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](workspace, "createRequestWithOptions:displayConfiguration:", 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v18 + 2))(v18, v35);
      objc_msgSend(v35, "finalize");
      objc_msgSend(v35, "applicationContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frameForApplicationSceneEntity:", v17);
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v45 = [SBInCallPresentationSceneUpdateContext alloc];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_7;
      v49[3] = &unk_1E8EA0DD0;
      v50 = v18;
      v46 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v45, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v19, v49, v38, v40, v42, v44);
      -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v46, "setExecutionTarget:", 1);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_8;
      v47[3] = &unk_1E8E9F1C0;
      v48 = v20;
      -[SBInCallPresentationSceneUpdateContext setCompletionHandler:](v46, "setCompletionHandler:", v47);
      -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v46);

    }
  }
  else
  {
    SBLogInCallPresentation();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SBInCallPresentationSession _performSwitcherPresentationTransitionAnimated:isUserInitiated:analyticsSource:completion:].cold.1((uint64_t)self, v21, v22, v23, v24, v25, v26, v27);

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "inCallPresentationDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "assertNoZombieInCallScenes");

    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInCallPresentationSession.m"), 1081, CFSTR("ICSZOMBIE: Found a zombie ICS presentation %@"), self);

    }
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "layoutMode") >= 2)
    objc_msgSend(v3, "setSource:", 61);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_2;
  v5[3] = &unk_1E8EAAEE8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "modifyApplicationContext:", v5);
  objc_msgSend(v3, "setShouldPreventEmergencyNotificationBannerDismissal:", *(_BYTE *)(a1 + 49) == 0);

}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  v9 = a2;
  v4 = objc_msgSend(v3, "currentInterfaceOrientation");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientationMode");

  if (v7 == 1)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "_bestSupportedInterfaceOrientationForOrientation:", v4);
  objc_msgSend(v9, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 40), 1);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntity:forLayoutRole:", v8, 2);

  objc_msgSend(v9, "setRequestedUnlockedEnvironmentMode:", 3);
  objc_msgSend(v9, "setInterfaceOrientation:", v4);
  objc_msgSend(v9, "setPrefersCrossfadeTransition:", 1);
  objc_msgSend(v9, "setAnimationDisabled:", *(_BYTE *)(a1 + 48) == 0);

}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 216) == *(_QWORD *)(a1 + 64))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__37;
    v18[4] = __Block_byref_object_dispose__37;
    v19 = 0;
    v3 = *(void **)(v2 + 144);
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 392));
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_4;
    v14[3] = &unk_1E8EAAF60;
    v15 = *(id *)(a1 + 48);
    v17 = v18;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v16 = v7;
    v14[4] = v8;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_6;
    v11[3] = &unk_1E8EAAF88;
    v11[4] = v8;
    v13 = v18;
    v12 = v9;
    objc_msgSend(v3, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v5, v14, v11);

    _Block_object_dispose(v18, 8);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }
}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_5;
  v7[3] = &unk_1E8EAAF38;
  v6 = *(_OWORD *)(a1 + 48);
  v4 = (id)v6;
  v8 = v6;
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v7);

}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_5(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invalidate");
  result = a1[5];
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  *(_BYTE *)(a1[4] + 212) = 0;
  return result;
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4
    || (objc_msgSend(v5, "isEqual:", v4) & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "_isValidForSceneUpdates"))
  {
    v13 = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 212) = 1;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 288))
    {
      objc_msgSend(v4, "elementWithRole:", 1);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 288);
      *(_QWORD *)(v8 + 288) = v7;

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_acquireAssertionForAnalyticsSource:", *(_QWORD *)(a1 + 40));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    v13 = 1;
  }

  return v13;
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_insertIntoSwitcherAsDismissedWithAnalyticsSource:(id)a3 transitionValidator:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  unint64_t v15;
  SBDeviceApplicationSceneEntity *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  SBMainWorkspace *workspace;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  SBInCallPresentationSceneUpdateContext *v34;
  SBInCallPresentationSceneUpdateContext *v35;
  SBDeviceApplicationSceneEntity *v36;
  _QWORD v37[4];
  void (**v38)(_QWORD);
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  unint64_t v46;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "switcherController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v14);

  v16 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke;
  v41[3] = &unk_1E8EAB050;
  v41[4] = self;
  v17 = v13;
  v42 = v17;
  v18 = v11;
  v44 = v18;
  v46 = v15;
  v19 = v10;
  v45 = v19;
  v20 = v9;
  v43 = v20;
  v21 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v41);
  if (-[SBDeviceApplicationSceneHandle contentState](self->_sceneHandle, "contentState"))
  {
    v21[2](v21);
  }
  else
  {
    workspace = self->_workspace;
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](workspace, "createRequestWithOptions:displayConfiguration:", 2, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "finalize");
    objc_msgSend(v24, "applicationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frameForApplicationSceneEntity:", v16);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v36 = v16;
    v34 = [SBInCallPresentationSceneUpdateContext alloc];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_5;
    v39[3] = &unk_1E8E9EE78;
    v40 = v17;
    v35 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v34, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v20, v39, v27, v29, v31, v33);
    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v35, "setExecutionTarget:", 1);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_7;
    v37[3] = &unk_1E8E9F1C0;
    v38 = v21;
    -[SBInCallPresentationSceneUpdateContext setCompletionHandler:](v35, "setCompletionHandler:", v37);
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v35);

    v16 = v36;
  }

}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__37;
  v17[4] = __Block_byref_object_dispose__37;
  v18 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 144);
  v13[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_2;
  v13[3] = &unk_1E8EAB000;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v16 = v17;
  v13[4] = v2;
  v14 = v3;
  v15 = *(id *)(a1 + 56);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_4;
  v8[3] = &unk_1E8EAB028;
  v7 = *(void **)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v8[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v10 = v7;
  v11 = v17;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "requestTransitionWithOptions:builder:validator:", 2, v13, v8);

  _Block_object_dispose(v17, 8);
}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_3;
  v7[3] = &unk_1E8EAAFD8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  v7[4] = v4;
  v7[1] = 3221225472;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v6 = (id)objc_msgSend(a2, "addCompletionHandler:", v7);

}

uint64_t __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate");
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "displayItemRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addAppLayoutForDisplayItem:completion:", v4, 0);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[27] == *(_QWORD *)(a1 + 64)
    && (objc_msgSend(v4, "_isInSwitcherModel") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "_isValidForSceneUpdates")
    && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_acquireAssertionForAnalyticsSource:", *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_6;
  v3[3] = &unk_1E8E9EE50;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "modifyApplicationContext:", v3);

}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(v2, "interfaceOrientation"));

}

uint64_t __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  SBMainWorkspace *workspace;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v5 = a3;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v6);

  workspace = self->_workspace;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__SBInCallPresentationSession__removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator___block_invoke;
  v10[3] = &unk_1E8EAB078;
  v11 = v5;
  v12 = v7;
  v10[4] = self;
  v9 = v5;
  -[SBMainWorkspace requestTransitionWithOptions:builder:validator:](workspace, "requestTransitionWithOptions:builder:validator:", 2, 0, v10);

}

uint64_t __93__SBInCallPresentationSession__removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = a1[4];
  if (a1[6] == *(_QWORD *)(v4 + 216)
    && (objc_msgSend(*(id *)(v4 + 152), "isAnySwitcherVisible") & 1) == 0
    && (*(unsigned int (**)(void))(a1[5] + 16))())
  {
    v5 = a1[4];
    v6 = *(void **)(v5 + 152);
    objc_msgSend(*(id *)(v5 + 384), "displayItemRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAppLayoutForDisplayItem:shouldDestroyScene:", v7, 0);

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_performTransientOverlayPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  SBMainWorkspace *workspace;
  id v15;
  id v16;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v11);

  v13 = v6 && -[SBBacklightController screenIsOn](self->_backlightController, "screenIsOn");
  workspace = self->_workspace;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke;
  v18[3] = &unk_1E8EAB0C8;
  v21 = v13;
  v19 = v9;
  v20 = v10;
  v18[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4;
  v17[3] = &unk_1E8EAADE0;
  v17[4] = self;
  v17[5] = v12;
  v15 = v9;
  v16 = v10;
  -[SBMainWorkspace requestTransitionWithOptions:builder:validator:](workspace, "requestTransitionWithOptions:builder:validator:", 0, v18, v17);

}

void __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  char v10;

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2;
  v9[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceTransientOverlayTransitionContext_8l;
  v10 = *(_BYTE *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "modifyTransientOverlayContext:", v9);
  v5 = (id)objc_msgSend(v4, "addCompletionHandler:", *(_QWORD *)(a1 + 48));
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3;
  v7[3] = &unk_1E8EAB0A0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v4, "setTransactionProvider:", v7);

}

uint64_t __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimated:", *(unsigned __int8 *)(a1 + 32));
}

SBInCallTransientOverlayPresentationWorkspaceTransaction *__113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SBInCallTransientOverlayPresentationWorkspaceTransaction *v4;

  v3 = a2;
  v4 = -[SBInCallTransientOverlayPresentationWorkspaceTransaction initWithTransitionRequest:sourcePresentationSession:analyticsSource:]([SBInCallTransientOverlayPresentationWorkspaceTransaction alloc], "initWithTransitionRequest:sourcePresentationSession:analyticsSource:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[27] != *(_QWORD *)(a1 + 40) || !objc_msgSend(v2, "_isValidForSceneUpdates"))
    return 0;
  v3 = *(void **)(a1 + 32);
  v4 = 1;
  objc_msgSend(v3, "_setTransientOverlayPresentationActive:", 1);
  return v4;
}

- (void)_performBannerToFullScreenPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  SBDeviceApplicationSceneEntity *v15;
  SBMainWorkspace *workspace;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  SBDeviceApplicationSceneEntity *v21;
  _QWORD v22[5];
  id v23;
  SBDeviceApplicationSceneEntity *v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD v27[5];
  SBDeviceApplicationSceneEntity *v28;
  id v29;
  _QWORD *v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;

  v9 = a4;
  v10 = a5;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v11);

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__37;
  v32[4] = __Block_byref_object_dispose__37;
  v33 = 0;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowSceneForSceneHandle:", self->_sceneHandle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
  workspace = self->_workspace;
  objc_msgSend(v14, "_sbDisplayConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke;
  v27[3] = &unk_1E8EAB118;
  v27[4] = self;
  v31 = a3;
  v28 = v15;
  v30 = v32;
  v19 = v10;
  v29 = v19;
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4;
  v22[3] = &unk_1E8EAB140;
  v25 = v32;
  v26 = v12;
  v22[4] = self;
  v20 = v9;
  v23 = v20;
  v21 = v28;
  v24 = v21;
  -[SBMainWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](workspace, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v17, v27, v22);

  _Block_object_dispose(v32, 8);
}

void __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  char v14;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 37);
  objc_msgSend(v3, "setBannerUnfurlSourceContextProvider:", *(_QWORD *)(a1 + 32));
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2;
  v12[3] = &unk_1E8E9F398;
  v13 = *(id *)(a1 + 40);
  v14 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v3, "modifyApplicationContext:", v12);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3;
  v9[3] = &unk_1E8EAB0F0;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v8 = *(_OWORD *)(a1 + 48);
  v6 = (id)v8;
  v11 = v8;
  v7 = (id)objc_msgSend(v3, "addCompletionHandler:", v9);

}

void __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10[0] = *(_QWORD *)(a1 + 32);
  v4 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntities:withPolicy:centerEntity:floatingEntity:", v5, 0, 0, 0);

  if (*(_BYTE *)(a1 + 40))
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bannerUnfurlSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dampingRatio");
    objc_msgSend(v8, "response");
    convertDampingRatioAndResponseToTensionAndFriction();
    objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 1.0, 0.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationSettings:", v9);

    objc_msgSend(v3, "setFencesAnimations:", 1);
    v4 = *(_BYTE *)(a1 + 40) == 0;
  }
  objc_msgSend(v3, "setAnimationDisabled:", v4);

}

uint64_t __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 136), "removeObjectForKey:", a1[5]);
  if (!objc_msgSend(*(id *)(a1[4] + 136), "count"))
  {
    v4 = a1[4];
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = 0;

  }
  *(_BYTE *)(a1[4] + 212) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "invalidate");
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  SBMutableBannerUnfurlSourceContext *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[27] == *(_QWORD *)(a1 + 64) && objc_msgSend(v4, "_isValidForSceneUpdates"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_acquireAssertionForAnalyticsSource:", *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v8 + 209))
    {
      *(_BYTE *)(v8 + 209) = 0;
      v9 = *(_QWORD **)(a1 + 32);
      v10 = (void *)v9[5];
      if (v10)
      {
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_screen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fixedCoordinateSpace");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "bounds");
        objc_msgSend(v11, "convertRect:toCoordinateSpace:", v13);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v22 = objc_alloc_init(SBMutableBannerUnfurlSourceContext);
        -[SBMutableBannerUnfurlSourceContext setReferenceFrame:](v22, "setReferenceFrame:", v15, v17, v19, v21);
        objc_msgSend(v13, "bounds");
        -[SBMutableBannerUnfurlSourceContext setReferenceCoordinateSpaceBounds:](v22, "setReferenceCoordinateSpaceBounds:");
        +[SBInCallBannerPresentableViewController cornerRadius](SBInCallBannerPresentableViewController, "cornerRadius");
        -[SBMutableBannerUnfurlSourceContext setCornerRadius:](v22, "setCornerRadius:");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "velocityInCoordinateSpace:", v13);
        -[SBMutableBannerUnfurlSourceContext setReferenceVelocity:](v22, "setReferenceVelocity:");
        v23 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(a1 + 32);
          v26 = *(void **)(v25 + 136);
          *(_QWORD *)(v25 + 136) = v24;

          v23 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
        }
        objc_msgSend(v23, "setObject:forKey:", v22, *(_QWORD *)(a1 + 48));
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(void **)(v27 + 64);
        objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", *(_QWORD *)(v27 + 40));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v28, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v29, CFSTR("_SBInCallBannerRevocationReasonBannerUnfurl"), 0, 0, 0, 0);

        objc_msgSend(*(id *)(a1 + 32), "_setNonModalPresentationActive:", 0);
        v9 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v3, "applicationContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_class();
      v34 = v32;
      if (v33)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;
      }
      else
      {
        v35 = 0;
      }
      v37 = v35;

      objc_msgSend(v9, "_updateAppStatusBarSettingsAssertionForLayoutState:", v37);
      v8 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v8 + 288))
      {
        objc_msgSend(v3, "applicationContext");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "previousLayoutState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "elementWithRole:", 1);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(a1 + 32);
        v42 = *(void **)(v41 + 288);
        *(_QWORD *)(v41 + 288) = v40;

        v8 = *(_QWORD *)(a1 + 32);
      }
    }
    v36 = 1;
    *(_BYTE *)(v8 + 212) = 1;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void)_performBannerToTransientOverlayPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  SBMainWorkspace *workspace;
  id v14;
  id v15;
  _QWORD v16[6];
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v9 = a4;
  v10 = a5;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v11);

  workspace = self->_workspace;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke;
  v17[3] = &unk_1E8EAB0C8;
  v20 = a3;
  v18 = v9;
  v19 = v10;
  v17[4] = self;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4;
  v16[3] = &unk_1E8EAADE0;
  v16[4] = self;
  v16[5] = v12;
  v14 = v9;
  v15 = v10;
  -[SBMainWorkspace requestTransitionWithOptions:builder:validator:](workspace, "requestTransitionWithOptions:builder:validator:", 0, v17, v16);

}

void __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  char v10;

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2;
  v9[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceTransientOverlayTransitionContext_8l;
  v10 = *(_BYTE *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "modifyTransientOverlayContext:", v9);
  v5 = (id)objc_msgSend(v4, "addCompletionHandler:", *(_QWORD *)(a1 + 48));
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3;
  v7[3] = &unk_1E8EAB0A0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v4, "setTransactionProvider:", v7);

}

uint64_t __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimated:", *(unsigned __int8 *)(a1 + 32));
}

SBInCallTransientOverlayPresentationWorkspaceTransaction *__121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SBInCallTransientOverlayPresentationWorkspaceTransaction *v4;

  v3 = a2;
  v4 = -[SBInCallTransientOverlayPresentationWorkspaceTransaction initWithTransitionRequest:sourcePresentationSession:analyticsSource:]([SBInCallTransientOverlayPresentationWorkspaceTransaction alloc], "initWithTransitionRequest:sourcePresentationSession:analyticsSource:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[27] != *(_QWORD *)(a1 + 40) || !objc_msgSend(v2, "_isValidForSceneUpdates"))
    return 0;
  v3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "_setTransientOverlayPresentationActive:", 1);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 209))
  {
    v5 = *(void **)(v4 + 64);
    objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", *(_QWORD *)(v4 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v6, CFSTR("_SBInCallBannerRevocationReasonTransientOverlayPresentation"), 0, 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "_setNonModalPresentationActive:", 0);
    return 1;
  }
  return v3;
}

- (void)_performBannerPresentationTransitionWithAnalyticsSource:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id WeakRetained;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  SBInCallPresentationSceneUpdateContext *v35;
  uint64_t v36;
  SBInCallPresentationSceneUpdateContext *v37;
  id v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];

  v7 = a3;
  v8 = a4;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v9);

  -[SBInCallPresentationSession _setNonModalPresentationActive:](self, "_setNonModalPresentationActive:", 1);
  -[SBInCallPresentationSession windowScene](self, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession _presentedBannerBoundsInWindowScene:](self, "_presentedBannerBoundsInWindowScene:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v39 = v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = objc_msgSend(WeakRetained, "inCallClientPresentationSessionInterfaceOrientationForBannerPresentation:", self);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v20)
    v23 = (v22 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  else
    v23 = 0;
  if (v23)
    v24 = v20;
  else
    v24 = 1;
  -[SBInCallPresentationSession _screen](self, "_screen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fixedCoordinateSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  _UIWindowConvertRectFromOrientationToOrientation();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = [SBInCallPresentationSceneUpdateContext alloc];
  v36 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke;
  v47[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v47[4] = v24;
  v37 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v35, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v7, v47, v28, v30, v32, v34);
  -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v37, "setExecutionTarget:", 1);
  v40[0] = v36;
  v40[1] = 3221225472;
  v40[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_3;
  v40[3] = &unk_1E8EAB168;
  v41 = v7;
  v42 = v10;
  v43 = v13;
  v44 = v15;
  v45 = v17;
  v46 = v39;
  v40[4] = self;
  v38 = v7;
  -[SBInCallPresentationSceneUpdateContext setPostSceneUpdateHandler:](v37, "setPostSceneUpdateHandler:", v40);
  -[SBInCallPresentationSceneUpdateContext setCompletionHandler:](v37, "setCompletionHandler:", v8);

  -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v37);
}

uint64_t __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_2;
  v3[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "modifyApplicationContext:", v3);
}

uint64_t __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
}

void __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  uint64_t v6;
  SBInCallBannerPresentableViewController *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, uint64_t);

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 216) == *(_QWORD *)(a1 + 48))
  {
    v6 = *(_QWORD *)(v5 + 40);
    if (!v6)
    {
      v7 = -[SBInCallBannerPresentableViewController initWithSceneHandle:]([SBInCallBannerPresentableViewController alloc], "initWithSceneHandle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384));
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setPreferredBannerContentSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 40);
    }
    if ((objc_msgSend(*(id *)(v5 + 64), "postPresentable:withOptions:userInfo:error:", v6, 1, 0, 0) & 1) != 0)
    {
      v4[2](v4, 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setNonModalPresentationActive:", 0);
      v12 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_4;
      v13[3] = &unk_1E8E9F1C0;
      v14 = v4;
      objc_msgSend(v12, "_performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:", 2, 0, 1, v11, v13);

    }
  }
  else
  {
    if (*(_BYTE *)(v5 + 209))
    {
      if (*(_QWORD *)(v5 + 40))
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend((id)v5, "_setNonModalPresentationActive:", 0);
        v10 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 209) != 0;
      }
    }
    else
    {
      v10 = 0;
    }
    v4[2](v4, v10);
  }

}

uint64_t __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setNonModalPresentationsSuppressed:(BOOL)a3
{
  SBSystemApertureSceneElement *jindoElement;
  SAInvalidatable *v5;
  SAInvalidatable *jindoInvalidatable;
  id v7;

  if (self->_nonModalPresentationsSuppressed != a3)
  {
    self->_nonModalPresentationsSuppressed = a3;
    if (!a3)
    {
      jindoElement = self->_jindoElement;
      if (jindoElement)
      {
        if (!self->_jindoInvalidatable
          && -[SBSystemApertureSceneElement isReadyForPresentation](jindoElement, "isReadyForPresentation")
          && !self->_isInvalidated)
        {
          objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "registerElement:", self->_jindoElement);
          v5 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
          jindoInvalidatable = self->_jindoInvalidatable;
          self->_jindoInvalidatable = v5;

        }
      }
    }
  }
}

- (void)_createJindoElementIfNeeded
{
  if (SBUIIsSystemApertureEnabled())
  {
    if (!self->_jindoElement)
      -[SBInCallPresentationSession _createJindoElement](self, "_createJindoElement");
  }
}

- (void)_createJindoElement
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBSystemApertureSceneElement *v12;
  id v13;
  SBSystemApertureSceneElement *v14;
  SBSystemApertureSceneElement *jindoElement;
  SBSystemApertureSceneElementConfiguration *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0DAC6D8]);
  v4 = (void *)MEMORY[0x1E0D87D70];
  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierWithPid:", objc_msgSend(v6, "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [SBSystemApertureSceneElement alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__SBInCallPresentationSession__createJindoElement__block_invoke;
  v17[3] = &unk_1E8EA3538;
  objc_copyWeak(&v19, &location);
  v13 = v11;
  v18 = v13;
  v14 = -[SBSystemApertureSceneElement initWithSceneSpecification:sceneClientIdentity:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v12, "initWithSceneSpecification:sceneClientIdentity:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v3, v10, v13, v17);
  jindoElement = self->_jindoElement;
  self->_jindoElement = v14;

  v16 = objc_alloc_init(SBSystemApertureSceneElementConfiguration);
  -[SBSystemApertureSceneElementConfiguration setEntersBackgroundWhenBacklightIsOff:](v16, "setEntersBackgroundWhenBacklightIsOff:", 1);
  -[SBSystemApertureSceneElementConfiguration setMinimalPresentationPossible:](v16, "setMinimalPresentationPossible:", 1);
  -[SBSystemApertureSceneElement setConfiguration:](self->_jindoElement, "setConfiguration:", v16);
  -[SBSystemApertureSceneElement setLaunchActionHandler:](self->_jindoElement, "setLaunchActionHandler:", self);
  -[SBSystemApertureSceneElement setAlwaysAllowTapToAppForBodyTaps:](self->_jindoElement, "setAlwaysAllowTapToAppForBodyTaps:", 1);
  -[SBSystemApertureSceneElement setAssociatedApplicationSceneHandle:](self->_jindoElement, "setAssociatedApplicationSceneHandle:", self->_sceneHandle);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __50__SBInCallPresentationSession__createJindoElement__block_invoke(uint64_t a1, void *a2, int a3)
{
  _QWORD *WeakRetained;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && a3 && (objc_msgSend(WeakRetained, "areNonModalPresentationsSuppressed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "registerElement:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6[7];
    v6[7] = v7;

  }
}

- (void)_activeJindoElementIfNeeded
{
  SBSystemApertureSceneElement *jindoElement;
  void *v4;
  id v5;

  jindoElement = self->_jindoElement;
  if (jindoElement)
  {
    if (!-[SBSystemApertureSceneElement isActivated](jindoElement, "isActivated"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
      -[SBApplicationSceneHandle persistenceIdentifier](self->_sceneHandle, "persistenceIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "SBUISA_setString:forSetting:", v4, 3213023);

      -[SBSystemApertureSceneElement activateWithInitialOtherClientSettings:](self->_jindoElement, "activateWithInitialOtherClientSettings:", v5);
    }
  }
}

- (void)_invalidateJindoElementIfNeeded
{
  SAInvalidatable *v3;
  SBSystemApertureSceneElement *jindoElement;
  SAInvalidatable *jindoInvalidatable;
  SBSystemApertureSceneElement *v6;

  v6 = self->_jindoElement;
  v3 = self->_jindoInvalidatable;
  jindoElement = self->_jindoElement;
  self->_jindoElement = 0;

  jindoInvalidatable = self->_jindoInvalidatable;
  self->_jindoInvalidatable = 0;

  if (-[SBSystemApertureSceneElement isActivated](v6, "isActivated")
    && !-[SBSystemApertureSceneElement isDeactivating](v6, "isDeactivating"))
  {
    -[SBSystemApertureSceneElement deactivateWhenRemovedWithHandler:](v6, "deactivateWhenRemovedWithHandler:", 0);
  }
  if (-[SAInvalidatable isValid](v3, "isValid"))
    -[SAInvalidatable invalidateWithReason:](v3, "invalidateWithReason:", CFSTR("SBInCallPresentationSession request"));

}

- (int64_t)sceneElement:(id)a3 decisionForLaunchActionOfAppWithBundleIdentifier:(id)a4 persistenceIdentifier:(id)a5
{
  id v7;
  SBDeviceApplicationSceneHandle *sceneHandle;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  int v17;

  v7 = a5;
  sceneHandle = self->_sceneHandle;
  v9 = a4;
  -[SBApplicationSceneHandle application](sceneHandle, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = BSEqualStrings();

  if ((v12 & 1) != 0
    || !v9
    && (-[SBApplicationSceneHandle persistenceIdentifier](self->_sceneHandle, "persistenceIdentifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v7, "isEqualToString:", v16),
        v16,
        v17))
  {
    v13 = objc_alloc(MEMORY[0x1E0DAC4C0]);
    v14 = 1;
    v15 = (void *)objc_msgSend(v13, "initWithRequestedPresentationMode:isUserInitiated:analyticsSource:responseHandler:", 2, 1, *MEMORY[0x1E0DAC7C8], &__block_literal_global_118);
    -[SBInCallPresentationSession _handleRequestInCallPresentationModeAction:](self, "_handleRequestInCallPresentationModeAction:", v15);

  }
  else
  {
    v14 = 2;
  }

  return v14;
}

- (void)_performBannerDismissalTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  NSMutableDictionary *bannerDidDisappearHandlerByUUID;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  SBBannerManager *bannerManager;
  void *v17;
  void *v18;
  void *v19;
  SBInCallBannerPresentableViewController *bannerPresentableViewController;
  void *v21;
  id v22;

  v6 = a3;
  v22 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (!self->_isNonModalPresentationActive)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInCallPresentationSession.m"), 1510, CFSTR("_performBannerDismissalTransitionAnimated without an active presentation"));

  }
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v10);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    bannerDidDisappearHandlerByUUID = self->_bannerDidDisappearHandlerByUUID;
    if (!bannerDidDisappearHandlerByUUID)
    {
      v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v14 = self->_bannerDidDisappearHandlerByUUID;
      self->_bannerDidDisappearHandlerByUUID = v13;

      bannerDidDisappearHandlerByUUID = self->_bannerDidDisappearHandlerByUUID;
    }
    v15 = (void *)MEMORY[0x1D17E5550](v9);
    -[NSMutableDictionary setObject:forKey:](bannerDidDisappearHandlerByUUID, "setObject:forKey:", v15, v11);

  }
  else
  {
    v11 = 0;
  }
  bannerManager = self->_bannerManager;
  objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", self->_bannerPresentableViewController);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](bannerManager, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v17, CFSTR("_SBInCallBannerRevocationReasonSessionRequest"), 0, v6, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (v11)
    {
      -[NSMutableDictionary objectForKey:](self->_bannerDidDisappearHandlerByUUID, "objectForKey:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_bannerDidDisappearHandlerByUUID, "removeObjectForKey:", v11);
        v9[2](v9, 0);
      }
    }
  }
  if (!v6
    || !-[SBInCallBannerPresentableViewController _appearState](self->_bannerPresentableViewController, "_appearState"))
  {
    bannerPresentableViewController = self->_bannerPresentableViewController;
    self->_bannerPresentableViewController = 0;

    -[SBInCallPresentationSession _setNonModalPresentationActive:](self, "_setNonModalPresentationActive:", 0);
  }

}

- (void)_performSwitcherDismissalTransitionAnimated:(BOOL)a3 shouldDestroyScene:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  SBMainWorkspace *workspace;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  unint64_t v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v12);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__37;
  v29[4] = __Block_byref_object_dispose__37;
  v30 = 0;
  if (v7)
    -[SBInCallPresentationSession _invalidateJindoElementIfNeeded](self, "_invalidateJindoElementIfNeeded");
  workspace = self->_workspace;
  -[SBInCallPresentationSession windowScene](self, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_fbsDisplayConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke;
  v25[3] = &unk_1E8EAB1D8;
  v28 = v7;
  v25[4] = self;
  v27 = v29;
  v18 = v11;
  v26 = v18;
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2_126;
  v20[3] = &unk_1E8EAB200;
  v22 = v29;
  v23 = v13;
  v24 = v7;
  v20[4] = self;
  v19 = v10;
  v21 = v19;
  -[SBMainWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](workspace, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v16, v25, v20);

  _Block_object_dispose(v29, 8);
}

void __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 69);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2;
  v12[3] = &unk_1E8EAAEE8;
  v5 = *(_QWORD *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 56);
  v12[4] = v5;
  v13 = v3;
  v6 = v3;
  objc_msgSend(v6, "modifyApplicationContext:", v12);
  objc_msgSend(v6, "setShouldPreventEmergencyNotificationBannerDismissal:", 1);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_125;
  v10[3] = &unk_1E8EAB1B0;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v11 = v9;
  v8 = (id)objc_msgSend(v6, "addCompletionHandler:", v10);

}

void __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;
  SBWorkspaceEntityRemovalContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  SBDeviceApplicationSceneEntity *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384));
  objc_msgSend(v3, "setDeactivatingEntity:", v4);
  objc_msgSend(v3, "setPrefersCrossfadeTransition:", 1);
  objc_msgSend(v3, "setAnimationDisabled:", 0);
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = -[SBWorkspaceEntityRemovalContext initWithAnimationStyle:removalActionType:]([SBWorkspaceEntityRemovalContext alloc], "initWithAnimationStyle:removalActionType:", 1, 1);
    objc_msgSend(v3, "setRemovalContext:forEntity:", v5, v4);

  }
  objc_msgSend(v3, "previousLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  SBSafeCast(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "unlockedEnvironmentMode") == 2)
    objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementWithRole:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (objc_msgSend(v11, "isEqualToString:", v9))
  {
    objc_msgSend(v6, "elementWithRole:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "workspaceEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceApplicationSceneEntity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sceneHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayItemRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "hasAppLayoutForDisplayItem:", v17) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 368));
    v19 = objc_msgSend(WeakRetained, "inCallClientPresentationSession:canRestoreToPreviousEntity:", *(_QWORD *)(a1 + 32), v14);

    if (v19)
    {
      SBLogInCallPresentation();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "setting preferredDismissalPrimaryElement %@", buf, 0xCu);
      }

      objc_msgSend(v3, "setActivatingEntity:", v14);
      objc_msgSend(v3, "setEntity:forLayoutRole:", v14, 1);
      objc_msgSend(*(id *)(a1 + 40), "workspace");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "canExecuteTransitionRequest:", *(_QWORD *)(a1 + 40));

      if ((v13 & ~v22 & 1) == 0)
        goto LABEL_20;
LABEL_16:
      if (objc_msgSend(v8, "unlockedEnvironmentMode") == 2)
      {
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEntity:forLayoutRole:", v23, 1);

      }
      else
      {
        +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setActivatingEntity:", v24);

        objc_msgSend(v3, "setEntity:forLayoutRole:", 0, 1);
      }
      goto LABEL_23;
    }
    if (v13)
      goto LABEL_16;
  }
  else if (v13)
  {
    goto LABEL_16;
  }
LABEL_20:
  objc_msgSend(v6, "elementWithIdentifier:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25 && objc_msgSend(v8, "unlockedEnvironmentMode") != 2)
    objc_msgSend(*(id *)(a1 + 40), "setShouldPreventDismissalOfUnrelatedTransientOverlays:", 1);
LABEL_23:

}

uint64_t __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_125(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2_126(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) != *(_QWORD *)(a1 + 56))
    return 0;
  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_4;
  }
  if (!*(_BYTE *)(a1 + 64))
  {

    v7 = 0;
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 152);
  objc_msgSend(*(id *)(v8 + 384), "displayItemRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "hasAppLayoutForDisplayItem:", v10);

  if ((v9 & 1) == 0)
    return 0;
LABEL_4:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_acquireAssertionForAnalyticsSource:", *(_QWORD *)(a1 + 40));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
    v7 = 1;
LABEL_11:

    return v7;
  }
  return 1;
}

- (void)_performTransientOverlayDismissalTransitionAnimated:(BOOL)a3 shouldInsertIntoSwitcherModel:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  SBWorkspaceTransientOverlay *v15;
  SBMainWorkspace *workspace;
  uint64_t v17;
  SBWorkspaceTransientOverlay *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v25[4];
  SBWorkspaceTransientOverlay *v26;
  SBInCallPresentationSession *v27;
  id v28;
  _QWORD *v29;
  BOOL v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;

  v11 = a5;
  v12 = a6;
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBInCallPresentationSession _incrementPresentationModeRevisionIDWithReason:](self, "_incrementPresentationModeRevisionIDWithReason:", v13);

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__37;
  v32[4] = __Block_byref_object_dispose__37;
  v33 = 0;
  v15 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", self->_transientOverlayViewController);
  workspace = self->_workspace;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke;
  v25[3] = &unk_1E8EAB270;
  v18 = v15;
  v30 = a3;
  v31 = a4;
  v26 = v18;
  v27 = self;
  v29 = v32;
  v19 = v12;
  v28 = v19;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_5;
  v21[3] = &unk_1E8EAB298;
  v23 = v32;
  v24 = v14;
  v21[4] = self;
  v20 = v11;
  v22 = v20;
  -[SBMainWorkspace requestTransitionWithOptions:builder:validator:](workspace, "requestTransitionWithOptions:builder:validator:", 0, v25, v21);

  _Block_object_dispose(v32, 8);
}

void __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  char v10;
  _QWORD v11[4];
  id v12;
  char v13;

  v3 = a2;
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("DismissInCallTransientOverlay(%llu) = %@"), ++_SBInCallPresentationDeactivationReasonTransientOverlay_block_invoke_uniqueEventKey, *(_QWORD *)(a1 + 32));
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_2;
  v11[3] = &unk_1E8E9F3E8;
  v12 = *(id *)(a1 + 32);
  v13 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v3, "modifyTransientOverlayContext:", v11);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_130);
  objc_msgSend(v3, "setShouldPreventEmergencyNotificationBannerDismissal:", 1);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_4;
  v8[3] = &unk_1E8EAB248;
  v10 = *(_BYTE *)(a1 + 65);
  v8[4] = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 48);
  v5 = (id)v7;
  v9 = v7;
  v6 = (id)objc_msgSend(v3, "addCompletionHandler:", v8);

}

void __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 1);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

uint64_t __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "displayItemRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 392));
    objc_msgSend(WeakRetained, "switcherController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAppLayoutForDisplayItem:completion:", v4, 0);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

BOOL __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = (_QWORD *)a1[4];
  v5 = v4[27];
  v6 = a1[7];
  if (v5 == v6 && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v4, "_acquireAssertionForAnalyticsSource:", a1[5]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return v5 == v6;
}

- (void)_performPresentationWithRequestedPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 animated:(BOOL)a5 analyticsSource:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  void (**v36)(_QWORD, _QWORD);
  _QWORD v37[4];
  void (**v38)(_QWORD, _QWORD);
  _QWORD v39[4];
  void (**v40)(_QWORD, _QWORD);
  _QWORD v41[4];
  void (**v42)(_QWORD, _QWORD);
  _QWORD v43[4];
  id v44;

  v8 = a5;
  v9 = a4;
  v12 = a6;
  v13 = a7;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  switch(a3)
  {
    case 0:
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke;
      v43[3] = &unk_1E8E9F1C0;
      v44 = v13;
      -[SBInCallPresentationSession dismissAnimated:shouldFinalizeSceneDestruction:analyticsSource:completion:](self, "dismissAnimated:shouldFinalizeSceneDestruction:analyticsSource:completion:", v8, 0, v12, v43);
      v15 = v44;
      goto LABEL_24;
    case 1:
      if (!-[SBInCallPresentationSession _allowsNonModalPresentation](self, "_allowsNonModalPresentation"))
        goto LABEL_9;
      if (!self->_jindoElement)
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_131;
        v41[3] = &unk_1E8E9F1C0;
        v42 = v14;
        -[SBInCallPresentationSession _performNonModalPresentationTransitionWithAnalyticsSource:completion:](self, "_performNonModalPresentationTransitionWithAnalyticsSource:completion:", v12, v41);
        v15 = v42;
        goto LABEL_24;
      }
      SBLogInCallPresentation();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SBInCallPresentationSession _performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:].cold.1((uint64_t)self, v16, v17, v18, v19, v20, v21, v22);

      if (!v14)
        goto LABEL_25;
      goto LABEL_14;
    case 2:
LABEL_9:
      if (self->_isScreenSharingPresentation
        && -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked"))
      {
        SBLogInCallPresentation();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[SBInCallPresentationSession _performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

LABEL_14:
        v14[2](v14, 0);
      }
      else
      {
        if (-[SBInCallPresentationSession _shouldUseTransientOverlayForFullScreenPresentation](self, "_shouldUseTransientOverlayForFullScreenPresentation"))
        {
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_132;
          v39[3] = &unk_1E8E9F1C0;
          v40 = v14;
          -[SBInCallPresentationSession _performTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:](self, "_performTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:", v8, v12, v39);
          v15 = v40;
        }
        else if (self->_isNonModalPresentationActive)
        {
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_2;
          v37[3] = &unk_1E8E9F1C0;
          v38 = v14;
          -[SBInCallPresentationSession _performBannerToFullScreenPresentationTransitionAnimated:analyticsSource:completion:](self, "_performBannerToFullScreenPresentationTransitionAnimated:analyticsSource:completion:", v8, v12, v37);
          v15 = v38;
        }
        else
        {
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_3;
          v35[3] = &unk_1E8E9F1C0;
          v36 = v14;
          -[SBInCallPresentationSession _performSwitcherPresentationTransitionAnimated:isUserInitiated:analyticsSource:completion:](self, "_performSwitcherPresentationTransitionAnimated:isUserInitiated:analyticsSource:completion:", v8, v9, v12, v35);
          v15 = v36;
        }
LABEL_24:

      }
LABEL_25:

      return;
    case 3:
      self->_hasAdoptedFullscreenOverlayAPI = 1;
      if (self->_isNonModalPresentationActive)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_4;
        v33[3] = &unk_1E8E9F1C0;
        v34 = v13;
        -[SBInCallPresentationSession _performBannerToTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:](self, "_performBannerToTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:", v8, v12, v33);
        v15 = v34;
      }
      else
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_5;
        v31[3] = &unk_1E8E9F1C0;
        v32 = v13;
        -[SBInCallPresentationSession _performTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:](self, "_performTransientOverlayPresentationTransitionAnimated:analyticsSource:completion:", v8, v12, v31);
        v15 = v32;
      }
      goto LABEL_24;
    default:
      goto LABEL_25;
  }
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_131(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_uiLockStateDidChange:(id)a3
{
  SBInCallPresentationSceneUpdateContext *v4;
  void *v5;
  void *v6;
  SBInCallPresentationSceneUpdateContext *v7;
  _QWORD v8[5];

  -[SBInCallPresentationSession _updateSceneDeactivationAssertions](self, "_updateSceneDeactivationAssertions", a3);
  v4 = [SBInCallPresentationSceneUpdateContext alloc];
  -[SBInCallPresentationSession _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fixedCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v4, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", *MEMORY[0x1E0DAC7D8], &__block_literal_global_133);

  -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v7, "setExecutionTarget:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SBInCallPresentationSession__uiLockStateDidChange___block_invoke_2;
  v8[3] = &unk_1E8EA6C08;
  v8[4] = self;
  -[SBInCallPresentationSceneUpdateContext setValidatorHandler:](v7, "setValidatorHandler:", v8);
  -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v7);
  -[SBInCallPresentationSession _updateSystemControlsShouldPresentAsEmbedded](self, "_updateSystemControlsShouldPresentAsEmbedded");
  if (self->_isTransientOverlayPresentationActive)
    -[SBTransientOverlayViewController setNeedsIdleTimerReset](self->_transientOverlayViewController, "setNeedsIdleTimerReset");

}

uint64_t __53__SBInCallPresentationSession__uiLockStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_hasExistingSceneSettingsPresentationModeForLayoutState:", v4) ^ 1;

  return v5;
}

- (void)presentWithRequestedConfiguration:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  char v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  SBInCallPresentationSession *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  SBLogInCallPresentation();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ handling presentation request with config %{public}@", buf, 0x16u);
  }

  self->_preventsBannersWhenPresentedAsOverlay = objc_msgSend(v10, "shouldPreventBannersWhenPresentedAsOverlay");
  self->_prefersContinuityDisplayForFullScreenPresentation = objc_msgSend(v10, "shouldPreferContinuityDisplayForFullScreenPresentation");
  if ((objc_msgSend(v10, "isScreenSharingPresentation") & 1) != 0
    || objc_msgSend(v10, "preferredPresentationMode") != 3)
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v10, "isUserInitiated");
  }
  self->_transientOverlayShouldAlwaysPreventHomeGestureDismissal = v14;
  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    v15 = MEMORY[0x1E0C809B0];
    self->_hasBegunHandlingPresentationRequest = 1;
    v16[0] = v15;
    v16[1] = 3221225472;
    v16[2] = __101__SBInCallPresentationSession_presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke;
    v16[3] = &unk_1E8EA02D8;
    v16[4] = self;
    v17 = v12;
    -[SBInCallPresentationSession _presentWithRequestedConfiguration:animated:analyticsSource:completion:](self, "_presentWithRequestedConfiguration:animated:analyticsSource:completion:", v10, v8, v11, v16);

  }
}

uint64_t __101__SBInCallPresentationSession_presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 90) = 1;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentWithRequestedConfiguration:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSUUID *v15;
  NSUUID *requestedPresentationConfigurationIdentifier;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "preferredPresentationMode");
  v14 = objc_msgSend(v10, "isUserInitiated");
  self->_isScreenSharingPresentation = objc_msgSend(v10, "isScreenSharingPresentation");
  objc_msgSend(v10, "identifier");
  v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  requestedPresentationConfigurationIdentifier = self->_requestedPresentationConfigurationIdentifier;
  self->_requestedPresentationConfigurationIdentifier = v15;

  if (-[SBInCallPresentationSession _isProximityReaderPresented](self, "_isProximityReaderPresented"))
    v13 = 0;
  if (objc_msgSend(v10, "supportsSystemAperture"))
  {
    -[SBInCallPresentationSession _createJindoElementIfNeeded](self, "_createJindoElementIfNeeded");
    if (v13 == 1)
    {
      if (!-[SBInCallPresentationSession _allowsNonModalPresentation](self, "_allowsNonModalPresentation"))
      {
        v13 = 1;
        if (!objc_msgSend(v10, "supportsAmbient"))
          goto LABEL_16;
        goto LABEL_8;
      }
      v13 = self->_jindoElement == 0;
    }
  }
  if ((objc_msgSend(v10, "supportsAmbient") & 1) == 0)
    goto LABEL_9;
LABEL_8:
  if (!-[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive"))
  {
LABEL_9:
    if (v13)
      goto LABEL_16;
  }
  if (-[SBInCallPresentationSession _allowsInitiallyDismissedPresentation](self, "_allowsInitiallyDismissedPresentation"))
  {
    objc_msgSend(v10, "requiresDismissedPresentationmode");
    goto LABEL_17;
  }
  SBLogInCallPresentation();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBInCallPresentationSession _presentWithRequestedConfiguration:animated:analyticsSource:completion:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  v13 = 2;
LABEL_16:
  if (!objc_msgSend(v10, "requiresDismissedPresentationmode"))
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_3;
    v28[3] = &unk_1E8EAAA98;
    v28[4] = self;
    v29 = v12;
    v27 = v12;
    -[SBInCallPresentationSession _performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:](self, "_performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:", v13, v14, v8, v11, v28);
    v26 = v29;
    goto LABEL_19;
  }
LABEL_17:
  -[SBInCallPresentationSession _activeJindoElementIfNeeded](self, "_activeJindoElementIfNeeded");
  v31 = v12;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke;
  v32[3] = &unk_1E8EA6C08;
  v32[4] = self;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_2;
  v30[3] = &unk_1E8E9F1C0;
  v25 = v12;
  -[SBInCallPresentationSession _insertIntoSwitcherAsDismissedWithAnalyticsSource:transitionValidator:completion:](self, "_insertIntoSwitcherAsDismissedWithAnalyticsSource:transitionValidator:completion:", v11, v32, v30);
  v26 = v31;
LABEL_19:

}

uint64_t __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isValidForSceneUpdates");
}

uint64_t __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_activeJindoElementIfNeeded");
}

- (void)dismissAndFinalizeSceneDestructionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  self->_hasReceivedFinalizeSceneDestructionRequest = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke;
  v12[3] = &unk_1E8EAB2E0;
  v15 = a3;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v10 = v8;
  v11 = v9;
  -[SBInCallPresentationSession _dispatchBlockToMainEventQueueWithReason:block:](self, "_dispatchBlockToMainEventQueueWithReason:block:", CFSTR("SBInCallPresentationSession - dismissAndFinalizeSceneDestructionAnimated"), v12);

}

void __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    v12 = v3;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ handling dismissAndFinalizeSceneDestructionAnimated %{BOOL}u", buf, 0x12u);
  }

  v5 = *(_BYTE **)(a1 + 32);
  if (v5[89])
  {
    v6 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke_136;
    v9[3] = &unk_1E8E9F1C0;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "dismissAnimated:shouldFinalizeSceneDestruction:analyticsSource:completion:", v6, 1, v7, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_destroySceneEntityIfExists");
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }
}

uint64_t __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke_136(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissAnimated:(BOOL)a3 shouldFinalizeSceneDestruction:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD *v29;
  _BYTE *v30;
  BOOL v31;
  _QWORD v32[3];
  char v33;
  _BYTE buf[24];
  uint64_t v35;
  uint64_t v36;

  v7 = a4;
  v8 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  SBLogInCallPresentation();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SBInCallPresentationSession dismissAnimated:shouldFinalizeSceneDestruction:analyticsSource:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v35 = 1;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 1;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke;
  v27[3] = &unk_1E8EAB330;
  v29 = v32;
  v30 = buf;
  v31 = v7;
  v27[4] = self;
  v14 = v11;
  v28 = v14;
  v15 = (void *)MEMORY[0x1D17E5550](v27);
  v16 = v15;
  if (self->_isTransientOverlayPresentationActive)
  {
    ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_3;
    v25[3] = &unk_1E8E9F1C0;
    v26 = v15;
    -[SBInCallPresentationSession _performTransientOverlayDismissalTransitionAnimated:shouldInsertIntoSwitcherModel:analyticsSource:completion:](self, "_performTransientOverlayDismissalTransitionAnimated:shouldInsertIntoSwitcherModel:analyticsSource:completion:", v8, 0, v10, v25);

  }
  if (self->_isNonModalPresentationActive)
  {
    ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_4;
    v23[3] = &unk_1E8E9F1C0;
    v24 = v16;
    -[SBInCallPresentationSession _performNonModalDismissalTransitionAnimated:analyticsSource:completion:](self, "_performNonModalDismissalTransitionAnimated:analyticsSource:completion:", v8, v10, v23);

  }
  ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_5;
  v19[3] = &unk_1E8EA0470;
  v19[4] = self;
  v22 = v8;
  v17 = v10;
  v20 = v17;
  v18 = v16;
  v21 = v18;
  -[SBInCallPresentationSession _performSwitcherDismissalTransitionAnimated:shouldDestroyScene:analyticsSource:completion:](self, "_performSwitcherDismissalTransitionAnimated:shouldDestroyScene:analyticsSource:completion:", v8, v7, v17, v19);
  (*((void (**)(id, uint64_t, _QWORD))v18 + 2))(v18, 1, 0);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(buf, 8);

}

void __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3;
  char v4;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  _QWORD v12[5];
  __int128 v13;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a2;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_2;
      v12[3] = &unk_1E8EAB308;
      v12[4] = *(_QWORD *)(a1 + 32);
      v11 = *(_OWORD *)(a1 + 40);
      v7 = (id)v11;
      v13 = v11;
      v8 = MEMORY[0x1D17E5550](v12);
      v9 = (void *)v8;
      if (a3)
        (*(void (**)(uint64_t))(v8 + 16))(v8);
      else
        objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockToMainEventQueueWithReason:block:", CFSTR("SBInCallPresentationSession - dismissAnimated:shouldFinalizeSceneDestruction:"), v8);

    }
    else
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    }
  }
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    v3 = *(_BYTE **)(a1 + 32);
    if (!v3[210] && !v3[209])
    {
      if (!objc_msgSend(v3, "_isInSwitcherModel"))
      {
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 392));
        objc_msgSend(WeakRetained, "layoutStateProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "layoutState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "elementWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12 == 0;

        goto LABEL_7;
      }
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_BYTE *)(v2 + 24) = 0;
  }
LABEL_7:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "sceneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "_destroySceneEntityIfExists");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  return result;
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_5(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[210])
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_6;
    v6[3] = &unk_1E8EAAA98;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v2, "_performTransientOverlayDismissalTransitionAnimated:shouldInsertIntoSwitcherModel:analyticsSource:completion:", v3, 0, v4, v6);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_isInSwitcherModel") ^ 1, 1);
  }
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if ((_DWORD)a2)
    a2 = objc_msgSend(*(id *)(a1 + 32), "_isInSwitcherModel") ^ 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, a2, 1);
}

- (BOOL)supportsHandlingDeviceLock
{
  return self->_isHandlingDeviceLock && !self->_hasReceivedFinalizeSceneDestructionRequest
      || -[SBInCallPresentationSession _sceneSupportsHandlingDeviceLock](self, "_sceneSupportsHandlingDeviceLock");
}

- (BOOL)disallowsLockHardwareButtonDoublePress
{
  _BOOL4 v3;

  v3 = -[SBInCallPresentationSession supportsHandlingDeviceLock](self, "supportsHandlingDeviceLock");
  if (v3)
    LOBYTE(v3) = !-[SBInCallPresentationSession _isCallConnectedForScene](self, "_isCallConnectedForScene");
  return v3;
}

- (BOOL)supportsBecomingVisibleWhenUnlockingFromSource:(int)a3 wakingDisplay:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a4;
  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v10 = 0;
LABEL_16:

      return v10;
    }
    objc_msgSend(v7, "clientSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive"))
      goto LABEL_4;
    if (a3 == 31)
    {
      v10 = 1;
      goto LABEL_15;
    }
    if (a3 == 32)
    {
      v10 = objc_msgSend(v9, "shouldBecomeVisibleWhenWakingDisplay");
      if ((v10 & 1) != 0 || !v4)
        goto LABEL_15;
    }
    else if (!v4)
    {
LABEL_4:
      v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v10 = objc_msgSend(v9, "shouldBecomeVisibleWhenWakingDisplay");
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 4;
  else
    v3 = 3;
  return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", v3);
}

- (void)handleDeviceLockFromSource:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  NSMutableArray *deviceLockHandlingCompletionHandlers;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  id v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!self->_isHandlingDeviceLock)
  {
    v16 = v6;
    if (-[SBInCallPresentationSession _sceneSupportsHandlingDeviceLock](self, "_sceneSupportsHandlingDeviceLock"))
    {
      self->_isHandlingDeviceLock = 1;
      v7 = v16;
      if (v16)
      {
        deviceLockHandlingCompletionHandlers = self->_deviceLockHandlingCompletionHandlers;
        if (!deviceLockHandlingCompletionHandlers)
        {
          v13 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v14 = self->_deviceLockHandlingCompletionHandlers;
          self->_deviceLockHandlingCompletionHandlers = v13;

          v7 = v16;
          deviceLockHandlingCompletionHandlers = self->_deviceLockHandlingCompletionHandlers;
        }
        v15 = (void *)MEMORY[0x1D17E5550](v7);
        -[NSMutableArray addObject:](deviceLockHandlingCompletionHandlers, "addObject:", v15);

        v7 = v16;
      }
      if ((_DWORD)v4 == 24)
        goto LABEL_16;
      -[SBInCallPresentationSession _notifySceneOfDeviceLockFromSource:completion:](self, "_notifySceneOfDeviceLockFromSource:completion:", v4, v16);
    }
    else
    {
      v7 = v16;
      if (!v16)
        goto LABEL_16;
      (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
    }
LABEL_15:
    v7 = v16;
    goto LABEL_16;
  }
  if (v6)
  {
    v8 = self->_deviceLockHandlingCompletionHandlers;
    v16 = v6;
    if (!v8)
    {
      v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v10 = self->_deviceLockHandlingCompletionHandlers;
      self->_deviceLockHandlingCompletionHandlers = v9;

      v7 = v16;
      v8 = self->_deviceLockHandlingCompletionHandlers;
    }
    v11 = (void *)MEMORY[0x1D17E5550](v7);
    -[NSMutableArray addObject:](v8, "addObject:", v11);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)handleRingerButtonDown
{
  void *v2;
  void *v3;
  id v4;

  if (!self->_isScreenSharingPresentation)
  {
    -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC4F0]), "initWithInfo:responder:", 0, 0);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sendActions:", v3);

    }
  }
}

- (void)_notifySceneOfDeviceLockFromSource:(int)a3 completion:(id)a4
{
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[5];
  SBInCallPresentationSession *v43;
  uint8_t buf[4];
  void *v45;
  _QWORD v46[9];

  v6 = a3 == 3;
  v46[7] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = 2 * v6;
  if (a3 == 1)
    v8 = 1;
  v30 = v7;
  v31 = v8;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pid");

  if ((_DWORD)v11 == -1)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CB0], "grantWithUserInteractivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v13;
    objc_msgSend(MEMORY[0x1E0D87D08], "grantWithForegroundPriority");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v14;
    objc_msgSend(MEMORY[0x1E0D87DE8], "withReason:", 10002);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v15;
    objc_msgSend(MEMORY[0x1E0D87CC8], "grant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v16;
    objc_msgSend(MEMORY[0x1E0D87D30], "grant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v17;
    objc_msgSend(MEMORY[0x1E0D87D08], "grantWithForegroundPriority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v18;
    objc_msgSend(MEMORY[0x1E0D87DD8], "grantWithResistance:", 40);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("SBInCallHandleDeviceLockAction"), v12, v20);
  }
  objc_msgSend(v21, "acquireWithError:", 0);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__37;
  v42[4] = __Block_byref_object_dispose__37;
  v43 = self;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__37;
  v40 = __Block_byref_object_dispose__37;
  v41 = 0;
  SBLogInCallPresentation();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v23;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Handing device lock to %{public}@", buf, 0xCu);

  }
  v24 = objc_alloc(MEMORY[0x1E0DAC480]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __77__SBInCallPresentationSession__notifySceneOfDeviceLockFromSource_completion___block_invoke;
  v32[3] = &unk_1E8EAB358;
  v34 = v42;
  v25 = v21;
  v33 = v25;
  v35 = &v36;
  v26 = objc_msgSend(v24, "initWithSourceType:timeout:withResponseHandler:", v31, v32, 5.0);
  v27 = (void *)v37[5];
  v37[5] = v26;

  -[SBDeviceApplicationSceneHandle scene](self->_sceneHandle, "scene");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v37[5]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sendActions:", v29);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);

}

void __77__SBInCallPresentationSession__notifySceneOfDeviceLockFromSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    *(_BYTE *)(v4 + 88) = 0;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 72), "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;

    if (v3)
    {
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v9 = 0;
      else
        v9 = objc_msgSend(v3, "deviceLockHandlingResult") == 1;

    }
    else
    {
      v9 = 0;
    }
    SBLogInCallPresentation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 384), "sceneIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 1024;
      v29 = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Response for device lock to %{public}@ %{BOOL}u", buf, 0x12u);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "invalidate", (_QWORD)v21);
  }
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = 0;

}

- (BOOL)isFullscreenCallInSwitcher
{
  BOOL v2;
  id WeakRetained;
  void *v5;
  void *v6;

  if (self->_isScreenSharingPresentation)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[SBInCallPresentationSession _isShowingFullScreenForLayoutState:](self, "_isShowingFullScreenForLayoutState:", v6)&& !self->_isTransientOverlayPresentationActive&& -[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates");

  return v2;
}

- (BOOL)disablesSystemVolumeHUDForCategory:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int64_t v11;
  char v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBInCallPresentationSession _clientSettingsIfExists](self, "_clientSettingsIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioCategoriesDisablingVolumeHUD");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "count") == 0;
  else
    v10 = 0;
  v11 = -[SBInCallPresentationSession _currentPresentationModeForLayoutState:](self, "_currentPresentationModeForLayoutState:", v7);
  v12 = v11 != 0;
  if (v11 && !v10)
    v12 = objc_msgSend(v9, "containsObject:", v4);

  return v12;
}

- (void)_prepareForTransientOverlayPresentationTransactionWithAnimation:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SBInCallPresentationSession *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  SBLogInCallPresentation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SBInCallPresentationSession _prepareForTransientOverlayPresentationTransactionWithAnimation:analyticsSource:completion:]";
    v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke;
  v18[3] = &unk_1E8EA04C0;
  v18[4] = self;
  v12 = v8;
  v19 = v12;
  v21 = a3;
  v13 = v9;
  v20 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v18);
  v15 = v14;
  if (self->_isNonModalPresentationActive)
  {
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_6;
    v16[3] = &unk_1E8E9F1C0;
    v17 = v14;
    -[SBInCallPresentationSession _performNonModalDismissalTransitionAnimated:analyticsSource:completion:](self, "_performNonModalDismissalTransitionAnimated:analyticsSource:completion:", 0, v12, v16);

  }
  else
  {
    v14[2](v14);
  }

}

void __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBInCallPresentationSceneUpdateContext *v20;
  uint64_t v21;
  uint64_t v22;
  SBInCallPresentationSceneUpdateContext *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int);
  void *v27;
  uint64_t v28;
  id v29;
  char v30;
  _QWORD v31[5];

  objc_msgSend(*(id *)(a1 + 32), "_setTransientOverlayPresentationActive:", 1);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createTransientOverlayViewController");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  v6 = objc_msgSend(v2, "preferredInterfaceOrientationForPresentation");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 368));
      v6 = objc_msgSend(WeakRetained, "inCallClientPresentationSessionInterfaceOrientationForTransientOverlayPresentation:", *(_QWORD *)(a1 + 32));

    }
    if (v6 <= 1)
      v6 = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "supportedInterfaceOrientations");
    if ((SBFInterfaceOrientationMaskContainsInterfaceOrientation() & 1) == 0)
      v6 = SBFFirstInterfaceOrientationInInterfaceOrientationMask();
  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fixedCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = [SBInCallPresentationSceneUpdateContext alloc];
  v21 = MEMORY[0x1E0C809B0];
  v22 = *(_QWORD *)(a1 + 40);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_2;
  v31[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v31[4] = v6;
  v23 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v20, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v22, v31, v13, v15, v17, v19);
  -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v23, "setExecutionTarget:", 2);
  v24 = v21;
  v25 = 3221225472;
  v26 = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_4;
  v27 = &unk_1E8EA6868;
  v28 = *(_QWORD *)(a1 + 32);
  v30 = *(_BYTE *)(a1 + 56);
  v29 = *(id *)(a1 + 48);
  -[SBInCallPresentationSceneUpdateContext setCompletionHandler:](v23, "setCompletionHandler:", &v24);
  objc_msgSend(*(id *)(a1 + 32), "_performSceneUpdateTransactionWithContext:", v23, v24, v25, v26, v27, v28);

}

uint64_t __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_3;
  v3[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "modifyApplicationContext:", v3);
}

uint64_t __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
}

void __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_4(uint64_t a1, int a2)
{
  SBWorkspaceTransientOverlay *v3;
  SBInCallTransientOverlayPresentationContext *v4;
  SBWorkspaceTransientOverlay *v5;
  SBInCallTransientOverlayPresentationContext *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  SBWorkspaceTransientOverlay *v10;
  id v11;
  char v12;
  id location;

  if (a2)
  {
    v3 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = [SBInCallTransientOverlayPresentationContext alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_5;
    v9[3] = &unk_1E8EAB380;
    objc_copyWeak(&v11, &location);
    v5 = v3;
    v10 = v5;
    v12 = *(_BYTE *)(a1 + 48);
    v6 = -[SBInCallTransientOverlayPresentationContext initWithRequestBuilder:](v4, "initWithRequestBuilder:", v9);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, SBInCallTransientOverlayPresentationContext *))(v7 + 16))(v7, 1, v6);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);
  }
}

void __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_configureTransitionRequest:forPresentingTransientOverlay:animated:", v4, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

uint64_t __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_clientSettingsIfExists
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (BOOL)_isInSwitcherModel
{
  SBMainSwitcherControllerCoordinator *mainSwitcherCoordinator;
  void *v3;

  mainSwitcherCoordinator = self->_mainSwitcherCoordinator;
  -[SBApplicationSceneHandle displayItemRepresentation](self->_sceneHandle, "displayItemRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mainSwitcherCoordinator) = -[SBMainSwitcherControllerCoordinator hasAppLayoutForDisplayItem:](mainSwitcherCoordinator, "hasAppLayoutForDisplayItem:", v3);

  return (char)mainSwitcherCoordinator;
}

- (BOOL)_isValidForSceneUpdates
{
  return !self->_isInvalidated && !self->_hasReceivedFinalizeSceneDestructionRequest;
}

- (id)_acquireAssertionForAnalyticsSource:(id)a3
{
  id v4;
  NSMutableArray *assertionAnalyticSources;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  if (v4)
  {
    assertionAnalyticSources = self->_assertionAnalyticSources;
    if (!assertionAnalyticSources)
    {
      v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v7 = self->_assertionAnalyticSources;
      self->_assertionAnalyticSources = v6;

      assertionAnalyticSources = self->_assertionAnalyticSources;
    }
    -[NSMutableArray addObject:](assertionAnalyticSources, "addObject:", v4);
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x1E0D01868]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__SBInCallPresentationSession__acquireAssertionForAnalyticsSource___block_invoke;
    v11[3] = &unk_1E8EA4CC0;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    v9 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBInCallPresentationSession"), v12, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __67__SBInCallPresentationSession__acquireAssertionForAnalyticsSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    v4 = objc_msgSend(v6[3], "count");
    v3 = v6;
    if (!v4)
    {
      v5 = v6[3];
      v6[3] = 0;

      v3 = v6;
    }
  }

}

- (BOOL)_allowsNonModalPresentation
{
  _BOOL4 v2;
  void *v4;
  void *v5;

  if (self->_isTransientOverlayPresentationActive)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    -[SBLockScreenManager lockScreenEnvironment](self->_lockScreenManager, "lockScreenEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behaviorSuppressor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "suppressesBanners") & 1) != 0)
      LOBYTE(v2) = 0;
    else
      v2 = !-[SBSetupManager isInSetupMode](self->_setupManager, "isInSetupMode");

  }
  return v2;
}

- (BOOL)_allowsInitiallyDismissedPresentation
{
  _BOOL4 v3;
  int v4;

  v3 = -[SBInCallPresentationSession _allowsNonModalPresentation](self, "_allowsNonModalPresentation");
  v4 = -[SBInCallPresentationSession _isProximityReaderPresented](self, "_isProximityReaderPresented") || v3;
  if (-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked") && !self->_jindoElement)
    LOBYTE(v4) = 0;
  return -[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive") | v4;
}

- (int64_t)_currentPresentationModeForLayoutState:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (self->_isTransientOverlayPresentationActive)
  {
    if (self->_hasAdoptedFullscreenOverlayAPI)
      v5 = 3;
    else
      v5 = 2;
  }
  else if (self->_isNonModalPresentationActive)
  {
    v5 = 1;
  }
  else if ((!-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked")
          || -[SBLockScreenManager isUIUnlocking](self->_lockScreenManager, "isUIUnlocking"))
         && v4
         && -[SBInCallPresentationSession _shouldConsiderScenePrimaryForLayoutState:](self, "_shouldConsiderScenePrimaryForLayoutState:", v4))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isShowingFullScreenForLayoutState:(id)a3
{
  return (-[SBInCallPresentationSession _currentPresentationModeForLayoutState:](self, "_currentPresentationModeForLayoutState:", a3) & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isDismissedForLayoutState:(id)a3
{
  id v4;
  BOOL v6;

  v4 = a3;
  if (*(_WORD *)&self->_isNonModalPresentationActive)
    v6 = 0;
  else
    v6 = -[SBInCallPresentationSession _currentPresentationModeForLayoutState:](self, "_currentPresentationModeForLayoutState:", v4) == 0;

  return v6;
}

- (void)_destroySceneEntityIfExists
{
  void *v3;
  NSObject *v4;
  SBDeviceApplicationSceneEntity *v5;
  int v6;
  SBInCallPresentationSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    SBLogInCallPresentation();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Destroying scene entity: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v5 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
    SBWorkspaceDestroyApplicationEntity(v5);

  }
}

- (BOOL)_hasExistingSceneSettingsPresentationModeForLayoutState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "inCallPresentationMode");
    v9 = v8 == -[SBInCallPresentationSession _currentPresentationModeForLayoutState:](self, "_currentPresentationModeForLayoutState:", v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_addSystemGestureDeactivationReason:(id)a3
{
  id v4;
  NSMutableSet *activeSystemGestureDeactivationReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  activeSystemGestureDeactivationReasons = self->_activeSystemGestureDeactivationReasons;
  v8 = v4;
  if (!activeSystemGestureDeactivationReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeSystemGestureDeactivationReasons;
    self->_activeSystemGestureDeactivationReasons = v6;

    v4 = v8;
    activeSystemGestureDeactivationReasons = self->_activeSystemGestureDeactivationReasons;
  }
  -[NSMutableSet addObject:](activeSystemGestureDeactivationReasons, "addObject:", v4);
  -[SBInCallPresentationSession _updateSceneDeactivationAssertions](self, "_updateSceneDeactivationAssertions");

}

- (void)_removeSystemGestureDeactivationReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_activeSystemGestureDeactivationReasons, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_activeSystemGestureDeactivationReasons, "removeObject:", v4);
    -[SBInCallPresentationSession _updateSceneDeactivationAssertions](self, "_updateSceneDeactivationAssertions");
  }

}

- (void)_addSystemAnimationDeactivationReason:(id)a3
{
  id v4;
  NSMutableSet *activeSystemAnimationDeactivationReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  activeSystemAnimationDeactivationReasons = self->_activeSystemAnimationDeactivationReasons;
  v8 = v4;
  if (!activeSystemAnimationDeactivationReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeSystemAnimationDeactivationReasons;
    self->_activeSystemAnimationDeactivationReasons = v6;

    v4 = v8;
    activeSystemAnimationDeactivationReasons = self->_activeSystemAnimationDeactivationReasons;
  }
  -[NSMutableSet addObject:](activeSystemAnimationDeactivationReasons, "addObject:", v4);
  -[SBInCallPresentationSession _updateSceneDeactivationAssertions](self, "_updateSceneDeactivationAssertions");

}

- (void)_removeSystemAnimationDeactivationReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_activeSystemAnimationDeactivationReasons, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_activeSystemAnimationDeactivationReasons, "removeObject:", v4);
    -[SBInCallPresentationSession _updateSceneDeactivationAssertions](self, "_updateSceneDeactivationAssertions");
  }

}

- (void)_configureTransitionRequest:(id)a3 forPresentingTransientOverlay:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  v7 = a4;
  v8 = a3;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventLabelWithFormat:", CFSTR("PresentInCallTransientOverlay = %@"), v10);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__SBInCallPresentationSession__configureTransitionRequest_forPresentingTransientOverlay_animated___block_invoke;
  v12[3] = &unk_1E8E9F3E8;
  v13 = v7;
  v14 = a5;
  v11 = v7;
  objc_msgSend(v8, "modifyTransientOverlayContext:", v12);
  objc_msgSend(v8, "modifyApplicationContext:", &__block_literal_global_162);

}

void __98__SBInCallPresentationSession__configureTransitionRequest_forPresentingTransientOverlay_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setShouldDismissSiriUponPresentation:", 0);
  objc_msgSend(v3, "setTransitionType:", 0);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __98__SBInCallPresentationSession__configureTransitionRequest_forPresentingTransientOverlay_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

- (id)_createTransientOverlayViewController
{
  SBInCallTransientOverlayViewController *v3;

  v3 = -[SBInCallTransientOverlayViewController initWithSceneHandle:shouldPreferContinuityDisplay:]([SBInCallTransientOverlayViewController alloc], "initWithSceneHandle:shouldPreferContinuityDisplay:", self->_sceneHandle, self->_prefersContinuityDisplayForFullScreenPresentation);
  -[SBInCallTransientOverlayViewController setDelegate:](v3, "setDelegate:", self);
  -[SBInCallTransientOverlayViewController setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:](v3, "setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:", self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings);
  -[SBInCallTransientOverlayViewController setShouldAlwaysPreventHomeGestureDismissal:](v3, "setShouldAlwaysPreventHomeGestureDismissal:", self->_transientOverlayShouldAlwaysPreventHomeGestureDismissal);
  return v3;
}

- (void)_performSceneUpdateTransactionWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  SBDeviceApplicationSceneEntity *v7;
  NSMapTable *entityToSceneUpdateContext;
  NSMapTable *v9;
  NSMapTable *v10;
  uint64_t v11;
  SBDeviceApplicationSceneEntity *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unsigned int (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  id WeakRetained;
  void *v21;
  BSEventQueue *v22;
  uint64_t v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  SBMainWorkspace *workspace;
  BSEventQueue *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  SBDeviceApplicationSceneEntity *v36;
  id v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  unsigned int (**v45)(_QWORD, _QWORD);
  __int128 *v46;
  _QWORD v47[4];
  BSEventQueue *v48;
  _QWORD v49[4];
  BSEventQueue *v50;
  SBInCallPresentationSession *v51;
  id v52;
  id v53;
  void (**v54)(_QWORD, _QWORD);
  unsigned int (**v55)(_QWORD, _QWORD);
  __int128 *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  SBInCallPresentationSession *v62;
  SBDeviceApplicationSceneEntity *v63;
  id v64;
  _QWORD v65[4];
  SBDeviceApplicationSceneEntity *v66;
  id v67;
  __int128 *p_buf;
  id v69;
  id location;
  __int128 buf;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogInCallPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "referenceFrame");
    BSNSStringFromCGRect();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updating scene update with frame: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v7 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
  entityToSceneUpdateContext = self->_entityToSceneUpdateContext;
  if (!entityToSceneUpdateContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_entityToSceneUpdateContext;
    self->_entityToSceneUpdateContext = v9;

    entityToSceneUpdateContext = self->_entityToSceneUpdateContext;
  }
  -[NSMapTable setObject:forKey:](entityToSceneUpdateContext, "setObject:forKey:", v4, v7);
  objc_msgSend(v4, "analyticsSource");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__37;
  v74 = __Block_byref_object_dispose__37;
  v75 = 0;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke;
  v65[3] = &unk_1E8EAB3C8;
  p_buf = &buf;
  objc_copyWeak(&v69, &location);
  v12 = v7;
  v66 = v12;
  v13 = v4;
  v67 = v13;
  v14 = (void *)MEMORY[0x1D17E5550](v65);
  v60[0] = v11;
  v60[1] = 3221225472;
  v60[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2_165;
  v60[3] = &unk_1E8E9F770;
  v15 = v13;
  v61 = v15;
  v62 = self;
  v36 = v12;
  v63 = v36;
  v37 = v14;
  v64 = v37;
  v39 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v60);
  objc_msgSend(v15, "validatorHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValidatorHandler:", 0);
  v57[0] = v11;
  v57[1] = 3221225472;
  v57[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_5;
  v57[3] = &unk_1E8EAB418;
  objc_copyWeak(&v59, &location);
  v17 = v16;
  v57[4] = self;
  v58 = v17;
  v18 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v57);
  v19 = objc_msgSend(v15, "executionTarget");
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v19)
  {
    case 0:
      workspace = self->_workspace;
      v47[0] = v11;
      v47[1] = 3221225472;
      v47[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_9;
      v47[3] = &unk_1E8EA0DD0;
      v48 = v39;
      v43[0] = v11;
      v43[1] = 3221225472;
      v43[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_10;
      v43[3] = &unk_1E8EAB490;
      v43[4] = self;
      v45 = v18;
      v46 = &buf;
      v44 = v38;
      -[SBMainWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](workspace, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v21, v47, v43);

      v22 = v48;
LABEL_15:

      break;
    case 1:
      v32 = self->_localEventQueue;
      v33 = (void *)MEMORY[0x1E0D01778];
      v49[0] = v11;
      v49[1] = 3221225472;
      v49[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_7;
      v49[3] = &unk_1E8EAB468;
      v22 = v32;
      v50 = v22;
      v51 = self;
      v52 = v21;
      v54 = v39;
      v55 = v18;
      v56 = &buf;
      v53 = v38;
      objc_msgSend(v33, "eventWithName:handler:", CFSTR("SceneUpdate"), v49);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSEventQueue executeOrInsertEvent:atPosition:](v22, "executeOrInsertEvent:atPosition:", v34, 1);

      goto LABEL_15;
    case 2:
      -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](self->_workspace, "createRequestWithOptions:displayConfiguration:", 0, v21);
      v22 = (BSEventQueue *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, BSEventQueue *))v39)[2](v39, v22);
      if (((unsigned int (**)(_QWORD, BSEventQueue *))v18)[2](v18, v22))
      {
        -[SBInCallPresentationSession _acquireAssertionForAnalyticsSource:](self, "_acquireAssertionForAnalyticsSource:", v38);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v23;

        -[BSEventQueue transactionProvider](v22, "transactionProvider");
        v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, BSEventQueue *))v25)[2](v25, v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v26;
        -[BSEventQueue completionBlock](v22, "completionBlock");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v11;
        v40[1] = 3221225472;
        v40[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_11;
        v40[3] = &unk_1E8E9F230;
        v29 = v27;
        v41 = v29;
        v30 = v28;
        v42 = v30;
        objc_msgSend(v29, "setCompletionBlock:", v40);
        objc_msgSend(v29, "begin");

      }
      else
      {
        -[BSEventQueue completionBlock](v22, "completionBlock");
        v35 = objc_claimAutoreleasedReturnValue();
        v29 = (id)v35;
        if (v35)
          (*(void (**)(uint64_t, _QWORD))(v35 + 16))(v35, 0);
      }

      goto LABEL_15;
  }

  objc_destroyWeak(&v59);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD, _QWORD);
  _QWORD v7[4];
  void (**v8)(_QWORD, _QWORD);
  char v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2;
  v10[3] = &unk_1E8EAB3C8;
  v13 = *(_QWORD *)(a1 + 48);
  objc_copyWeak(&v14, (id *)(a1 + 56));
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v10);
  objc_msgSend(*(id *)(a1 + 40), "postSceneUpdateHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setPostSceneUpdateHandler:", 0);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_164;
    v7[3] = &unk_1E8EAB3F0;
    v8 = v5;
    v9 = a2;
    ((void (**)(_QWORD, _QWORD, _QWORD *))v6)[2](v6, 0, v7);

  }
  else
  {
    v5[2](v5, a2);
  }

  objc_destroyWeak(&v14);
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  void (**v7)(_QWORD, _QWORD);
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Finished scene update with success %{BOOL}u", (uint8_t *)v8, 8u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[16], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "completionHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCompletionHandler:", 0);
    v7[2](v7, a2);
  }

}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_164(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 40))
    a2 = a2;
  else
    a2 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2_165(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transitionRequestBuilderBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_3;
  v10[3] = &unk_1E8E9EE50;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "modifyApplicationContext:", v10);
  objc_msgSend(*(id *)(a1 + 48), "setFlag:forActivationSetting:", objc_msgSend(*(id *)(a1 + 40), "_currentPresentationModeForLayoutState:", 0) == 1, 71);
  objc_msgSend(v3, "setSource:", 48);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_4;
  v7[3] = &unk_1E8EAB0A0;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setTransactionProvider:", v7);
  v6 = (id)objc_msgSend(v3, "addCompletionHandler:", *(_QWORD *)(a1 + 56));

}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

SBInCallSceneUpdateWorkspaceTransaction *__73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  SBInCallSceneUpdateWorkspaceTransaction *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = -[SBInCallSceneUpdateWorkspaceTransaction initWithApplicationSceneEntity:transitionRequest:]([SBInCallSceneUpdateWorkspaceTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", *(_QWORD *)(a1 + 32), v3);
  objc_msgSend(*(id *)(a1 + 40), "postSceneUpdateHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPostSceneUpdateHandler:", 0);
  -[SBInCallSceneUpdateWorkspaceTransaction setPostSceneUpdateHandler:](v4, "setPostSceneUpdateHandler:", v5);
  objc_msgSend(v3, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBInCallSceneUpdateWorkspaceTransaction setCompletionBlock:](v4, "setCompletionBlock:", v6);
  return v4;
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "_isValidForSceneUpdates")
    && ((v5 = *(_QWORD *)(a1 + 40)) == 0 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v3)))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_6;
    v8[3] = &unk_1E8E9EE50;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "modifyApplicationContext:", v8);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (!objc_msgSend(v6, "requestedUnlockedEnvironmentMode"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 392));
    objc_msgSend(WeakRetained, "layoutStateProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(v5, "unlockedEnvironmentMode"));

  }
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "acquireLockForReason:", CFSTR("Transaction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "createRequestWithOptions:displayConfiguration:", 0, *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 72) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 40), "_acquireAssertionForAnalyticsSource:", *(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(v3, "transactionProvider");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_8;
    v16 = &unk_1E8EAB440;
    v17 = v8;
    v20 = v9;
    v18 = *(id *)(a1 + 32);
    v19 = v2;
    v10 = v9;
    v11 = v8;
    objc_msgSend(v11, "setCompletionBlock:", &v13);
    objc_msgSend(v11, "begin", v13, v14, v15, v16);

  }
  else
  {
    objc_msgSend(v3, "completionBlock");
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = (id)v12;
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
    objc_msgSend(*(id *)(a1 + 32), "relinquishLock:", v2);
  }

}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v5 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  objc_msgSend(*(id *)(a1 + 40), "relinquishLock:", *(_QWORD *)(a1 + 48));

}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_10(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isValidForSceneUpdates");
    if ((_DWORD)result)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "_acquireAssertionForAnalyticsSource:", *(_QWORD *)(a1 + 40));
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v5 = *(void **)(v4 + 40);
        *(_QWORD *)(v4 + 40) = v3;

      }
      return 1;
    }
  }
  return result;
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_11(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = v4;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    v4 = v6;
  }

}

- (CGRect)_presentedBannerBoundsInWindowScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v38 = v6;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBBannerManager layoutManagerInWindowScene:](self->_bannerManager, "layoutManagerInWindowScene:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "useableContainerFrameInContainerBounds:onScreen:", v5, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[SBInCallPresentationSession preferredBannerHeight](self, "preferredBannerHeight");
  v25 = 106.0;
  if (v24 > 0.00000011920929)
    v25 = v24;
  objc_msgSend(v15, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v21, v25, v17, v19, v21, v23, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v12, *(_QWORD *)&v14, v38);
  BSRectWithSize();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v34 = v27;
  v35 = v29;
  v36 = v31;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (BOOL)_sceneSupportsHandlingDeviceLock
{
  void *v2;
  char v3;

  -[SBInCallPresentationSession _clientSettingsIfExists](self, "_clientSettingsIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDeviceLockActions");

  return v3;
}

- (BOOL)_isCallConnectedForScene
{
  void *v2;
  char v3;

  -[SBInCallPresentationSession _clientSettingsIfExists](self, "_clientSettingsIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCallConnected");

  return v3;
}

- (void)_setNonModalPresentationActive:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *bannerDidDisappearHandlerByUUID;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isNonModalPresentationActive != a3)
  {
    self->_isNonModalPresentationActive = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "layoutStateProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v7);
    -[SBInCallPresentationSession _updateKeyboardFocusPreventionAssertionWithLayoutState:](self, "_updateKeyboardFocusPreventionAssertionWithLayoutState:", v7);

  }
  if (!a3)
  {
    -[NSMutableDictionary allValues](self->_bannerDidDisappearHandlerByUUID, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    bannerDidDisappearHandlerByUUID = self->_bannerDidDisappearHandlerByUUID;
    self->_bannerDidDisappearHandlerByUUID = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)_setTransientOverlayPresentationActive:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  if (self->_isTransientOverlayPresentationActive != a3)
  {
    self->_isTransientOverlayPresentationActive = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "layoutStateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutState");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[SBInCallPresentationSession _updateAppStatusBarSettingsAssertionForLayoutState:](self, "_updateAppStatusBarSettingsAssertionForLayoutState:", v6);
    -[SBInCallPresentationSession _updateKeyboardFocusPreventionAssertionWithLayoutState:](self, "_updateKeyboardFocusPreventionAssertionWithLayoutState:", v6);

  }
}

- (BOOL)_shouldConsiderScenePrimaryForLayoutState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBInCallPresentationSession sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "elementWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    LOBYTE(v7) = objc_msgSend(v4, "unlockedEnvironmentMode") == 3;

  return (char)v7;
}

- (BOOL)_shouldUseTransientOverlayForFullScreenPresentation
{
  return -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked")
      || -[SBSetupManager isInSetupMode](self->_setupManager, "isInSetupMode");
}

- (BOOL)_isShowingInPIP
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = objc_opt_class();
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "pg_hasVisiblePIPContent");
  else
    v7 = 0;

  return v7;
}

- (void)_updateAppStatusBarSettingsAssertionForLayoutState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  SBInCallBannerPresentableViewController *bannerPresentableViewController;
  SBWindowSceneStatusBarSettingsAssertion *appStatusBarSettingsAssertion;
  void *v14;
  void *v15;
  char v16;
  id WeakRetained;
  void *v18;
  void *v19;
  SBMutableStatusBarSettings *v20;
  objc_class *v21;
  void *v22;
  SBWindowSceneStatusBarSettingsAssertion *v23;
  SBWindowSceneStatusBarSettingsAssertion *v24;
  SBWindowSceneStatusBarSettingsAssertion *v25;
  void *v26;
  NSObject *v27;
  SBWindowSceneStatusBarSettingsAssertion *v28;
  NSObject *v29;
  SBWindowSceneStatusBarSettingsAssertion *v30;
  SBWindowSceneStatusBarSettingsAssertion *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SBWindowSceneStatusBarSettingsAssertion *continuityDisplayAppStatusBarSettingsAssertion;
  void *v37;
  void *v38;
  char v39;
  SBMutableStatusBarSettings *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  SBWindowSceneStatusBarSettingsAssertion *v45;
  SBWindowSceneStatusBarSettingsAssertion *v46;
  int v47;
  SBWindowSceneStatusBarSettingsAssertion *v48;
  __int16 v49;
  SBInCallPresentationSession *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "preferredBackgroundActivitiesToSuppress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates")
    && (-[SBInCallPresentationSession _isShowingFullScreenForLayoutState:](self, "_isShowingFullScreenForLayoutState:", v4)|| self->_isNonModalPresentationActive&& ((bannerPresentableViewController = self->_bannerPresentableViewController) == 0|| -[SBInCallBannerPresentableViewController isPresented](bannerPresentableViewController, "isPresented"))|| -[SBInCallPresentationSession _isShowingInPIP](self, "_isShowingInPIP"))&& objc_msgSend(v11, "count"))
  {
    appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
    if (appStatusBarSettingsAssertion)
    {
      -[SBWindowSceneStatusBarSettingsAssertion settings](appStatusBarSettingsAssertion, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "backgroundActivitiesToSuppress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = BSEqualSets();

      if ((v16 & 1) != 0)
        goto LABEL_24;
      appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
    }
    -[SBWindowSceneStatusBarSettingsAssertion invalidate](appStatusBarSettingsAssertion, "invalidate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "statusBarManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "assertionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(SBMutableStatusBarSettings);
    -[SBMutableStatusBarSettings setBackgroundActivitiesToSuppress:](v20, "setBackgroundActivitiesToSuppress:", v11);
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v19, "newSettingsAssertionWithSettings:atLevel:reason:", v20, 7, v22);
    v24 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = v23;

    v25 = self->_appStatusBarSettingsAssertion;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](v25, "acquireWithAnimationParameters:", v26);

    SBLogInCallPresentation();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_appStatusBarSettingsAssertion;
      v47 = 138543618;
      v48 = v28;
      v49 = 2114;
      v50 = self;
      _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "Acquired app status bar settings assertion %{public}@  for %{public}@", (uint8_t *)&v47, 0x16u);
    }

  }
  else
  {
    if (!self->_appStatusBarSettingsAssertion)
      goto LABEL_24;
    SBLogInCallPresentation();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_appStatusBarSettingsAssertion;
      v47 = 138543618;
      v48 = v30;
      v49 = 2114;
      v50 = self;
      _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Invalidated app status bar settings assertion %{public}@  for %{public}@", (uint8_t *)&v47, 0x16u);
    }

    v31 = self->_appStatusBarSettingsAssertion;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion invalidateWithAnimationParameters:](v31, "invalidateWithAnimationParameters:", v32);

    v18 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = 0;
  }

LABEL_24:
  objc_msgSend((id)SBApp, "windowSceneManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "connectedWindowScenes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bs_firstObjectPassingTest:", &__block_literal_global_176);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  continuityDisplayAppStatusBarSettingsAssertion = self->_continuityDisplayAppStatusBarSettingsAssertion;
  if (!v35)
  {
    -[SBWindowSceneStatusBarSettingsAssertion invalidate](continuityDisplayAppStatusBarSettingsAssertion, "invalidate");
    v40 = (SBMutableStatusBarSettings *)self->_continuityDisplayAppStatusBarSettingsAssertion;
    self->_continuityDisplayAppStatusBarSettingsAssertion = 0;
    goto LABEL_28;
  }
  -[SBWindowSceneStatusBarSettingsAssertion settings](continuityDisplayAppStatusBarSettingsAssertion, "settings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "backgroundActivitiesToSuppress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = BSEqualSets();

  if ((v39 & 1) == 0)
  {
    v40 = objc_alloc_init(SBMutableStatusBarSettings);
    -[SBMutableStatusBarSettings setBackgroundActivitiesToSuppress:](v40, "setBackgroundActivitiesToSuppress:", v11);
    -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_continuityDisplayAppStatusBarSettingsAssertion, "invalidate");
    objc_msgSend(v35, "statusBarManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "assertionManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v42, "newSettingsAssertionWithSettings:atLevel:reason:", v40, 7, v44);
    v46 = self->_continuityDisplayAppStatusBarSettingsAssertion;
    self->_continuityDisplayAppStatusBarSettingsAssertion = v45;

    -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_continuityDisplayAppStatusBarSettingsAssertion, "acquire");
LABEL_28:

  }
}

uint64_t __82__SBInCallPresentationSession__updateAppStatusBarSettingsAssertionForLayoutState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isContinuityDisplayWindowScene");
}

- (void)_updateKeyboardFocusPreventionAssertionWithLayoutState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  SBKeyboardFocusControlling *keyboardFocusCoordinator;
  void *v12;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *preventKeyboardFocusAssertion;
  uint8_t buf[4];
  SBInCallPresentationSession *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*(_WORD *)&self->_isNonModalPresentationActive)
  {
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (self->_preventKeyboardFocusAssertion)
        goto LABEL_8;
      -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identityToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        SBLogInCallPresentation();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v18 = self;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring keyboard focus prevention assertion for session: %{public}@", buf, 0xCu);
        }

        keyboardFocusCoordinator = self->_keyboardFocusCoordinator;
        v12 = (void *)MEMORY[0x1E0CB3940];
        -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("SBInCallPresentationSession-%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBKeyboardFocusControlling preventFocusForSceneWithIdentityToken:reason:](keyboardFocusCoordinator, "preventFocusForSceneWithIdentityToken:reason:", v8, v14);
        v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        preventKeyboardFocusAssertion = self->_preventKeyboardFocusAssertion;
        self->_preventKeyboardFocusAssertion = v15;

      }
      goto LABEL_7;
    }
  }
  if (self->_preventKeyboardFocusAssertion)
  {
    SBLogInCallPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating keyboard focus prevention assertion for session: %{public}@", buf, 0xCu);
    }

    -[BSInvalidatable invalidate](self->_preventKeyboardFocusAssertion, "invalidate");
    v8 = self->_preventKeyboardFocusAssertion;
    self->_preventKeyboardFocusAssertion = 0;
LABEL_7:

  }
LABEL_8:

}

- (BOOL)_systemControlsShouldPresentAsEmbeddedForLayoutState:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  void *v8;
  void *v9;

  v4 = a3;
  if (self->_isScreenSharingPresentation
    || !-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    v5 = 0;
  }
  else if (-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked")
         || -[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive")
         || self->_isTransientOverlayPresentationActive)
  {
    v5 = 1;
  }
  else if (v4)
  {
    v5 = (-[SBInCallPresentationSession _currentPresentationModeForLayoutState:](self, "_currentPresentationModeForLayoutState:", v4) & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "layoutStateProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBInCallPresentationSession _isShowingFullScreenForLayoutState:](self, "_isShowingFullScreenForLayoutState:", v9);

  }
  return v5;
}

- (void)_updateSystemControlsShouldPresentAsEmbedded
{
  id v3;
  _QWORD v4[5];

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__SBInCallPresentationSession__updateSystemControlsShouldPresentAsEmbedded__block_invoke;
    v4[3] = &unk_1E8EA2A30;
    v4[4] = self;
    objc_msgSend(v3, "updateSettingsWithBlock:", v4);
  }

}

void __75__SBInCallPresentationSession__updateSystemControlsShouldPresentAsEmbedded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSystemControlsShouldPresentAsEmbedded:", objc_msgSend(v2, "_systemControlsShouldPresentAsEmbeddedForLayoutState:", 0));

}

- (void)_updateSceneHandleToObserveForSendingShowNoticeForSystemControlsAction:(id)a3
{
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !self->_isScreenSharingPresentation)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
    if (objc_msgSend(v17, "unlockedEnvironmentMode") == 3
      && (objc_msgSend(v17, "elements"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "count"),
          v7,
          v8 == 1))
    {
      objc_msgSend(v17, "elementWithRole:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entityGenerator");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_opt_class();
      v13 = v11;
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v16 = v14;

      objc_msgSend(v16, "sceneHandle");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isEqual:", self->_sceneHandle))
      {

        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    if (WeakRetained != v15)
    {
      objc_msgSend(WeakRetained, "removeObserver:", self);
      objc_storeWeak((id *)&self->_sceneHandleToObserveForShowSystemControlsAction, v15);
      objc_msgSend(v15, "addObserver:", self);
      -[SBInCallPresentationSession _sendShowNoticeForSystemControlsActionIfNeeded](self, "_sendShowNoticeForSystemControlsActionIfNeeded");
    }

  }
}

- (void)_sendShowNoticeForSystemControlsActionIfNeeded
{
  id WeakRetained;
  void *v4;
  int observedSceneHandlePrefersHomeIndicatorAutoHidden;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "uiClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  observedSceneHandlePrefersHomeIndicatorAutoHidden = self->_observedSceneHandlePrefersHomeIndicatorAutoHidden;
  if (observedSceneHandlePrefersHomeIndicatorAutoHidden != objc_msgSend(v4, "homeIndicatorAutoHidden"))
  {
    v6 = objc_msgSend(v4, "homeIndicatorAutoHidden");
    self->_observedSceneHandlePrefersHomeIndicatorAutoHidden = v6;
    if ((v6 & 1) == 0
      && !-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked")
      && (unint64_t)(-[SpringBoard activeInterfaceOrientation](self->_springBoard, "activeInterfaceOrientation")
                          - 3) <= 1)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC4E8]), "initWithInfo:responder:", 0, 0);
      -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendActions:", v9);

    }
  }

}

- (BOOL)_shouldExcludeFromSwitcherWhenDismissed
{
  void *v3;
  BOOL v4;
  id WeakRetained;

  if (!-[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates"))
    return 1;
  -[SBInCallPresentationSession _clientSettingsIfExists](self, "_clientSettingsIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "prefersHiddenWhenDismissed") & 1) != 0
    || -[SBSetupManager isInSetupMode](self->_setupManager, "isInSetupMode"))
  {
    v4 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (objc_msgSend(WeakRetained, "isContinuityDisplayWindowScene"))
      v4 = !self->_isScreenSharingPresentation;
    else
      v4 = 0;

  }
  return v4;
}

- (void)_updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  SBInCallPresentationSession *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBMainSwitcherControllerCoordinator isAnySwitcherVisible](self->_mainSwitcherCoordinator, "isAnySwitcherVisible")&& -[SBInCallPresentationSession _isDismissedForLayoutState:](self, "_isDismissedForLayoutState:", v4))
  {
    v5 = -[SBInCallPresentationSession _isInSwitcherModel](self, "_isInSwitcherModel");
    if (-[SBInCallPresentationSession _shouldExcludeFromSwitcherWhenDismissed](self, "_shouldExcludeFromSwitcherWhenDismissed"))
    {
      if ((v5 & 1) == 0)
        goto LABEL_9;
      v6 = 0;
    }
    else
    {
      v6 = -[SBInCallPresentationSession _isValidForSceneUpdates](self, "_isValidForSceneUpdates");
      if (v5 == v6)
        goto LABEL_9;
    }
    if (!self->_isNonModalPresentationActive
      && !self->_isTransientOverlayPresentationActive
      && self->_hasHandledInitialPresentationRequest)
    {
      SBLogInCallPresentation();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = CFSTR("removing from");
        if (v6)
          v8 = CFSTR("adding to");
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "_updateSwitcherVisibilityIfDismissed: %{public}@ %{public}@ switcher model", buf, 0x16u);
      }

      if (v6)
      {
        v9 = *MEMORY[0x1E0DAC7D0];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke;
        v11[3] = &unk_1E8EA6C08;
        v11[4] = self;
        -[SBInCallPresentationSession _insertIntoSwitcherAsDismissedWithAnalyticsSource:transitionValidator:completion:](self, "_insertIntoSwitcherAsDismissedWithAnalyticsSource:transitionValidator:completion:", v9, v11, &__block_literal_global_183);
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke_2;
        v10[3] = &unk_1E8EA6C08;
        v10[4] = self;
        -[SBInCallPresentationSession _removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator:](self, "_removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator:", v10);
      }
    }
  }
LABEL_9:

}

uint64_t __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isInSwitcherModel") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "_shouldExcludeFromSwitcherWhenDismissed") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "_isValidForSceneUpdates");
  }
  SBLogInCallPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_updateSwitcherVisibilityIfDismissed validated: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  return v2;
}

uint64_t __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isInSwitcherModel")
    && objc_msgSend(*(id *)(a1 + 32), "_shouldExcludeFromSwitcherWhenDismissed"))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "isAnySwitcherVisible") ^ 1;
  }
  else
  {
    v2 = 0;
  }
  SBLogInCallPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_updateSwitcherVisibilityIfDismissed validated: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (id)_sceneManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_screen
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateSceneSettingsForAmbientPresentationSettingsUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[SBInCallPresentationSession sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__SBInCallPresentationSession__updateSceneSettingsForAmbientPresentationSettingsUpdate__block_invoke;
  v5[3] = &unk_1E8EA2A30;
  v5[4] = self;
  objc_msgSend(v4, "updateSettingsWithBlock:", v5);

}

uint64_t __87__SBInCallPresentationSession__updateSceneSettingsForAmbientPresentationSettingsUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAmbientPresentationSettingsForInCallSettings:", a2);
}

- (void)_updateAmbientPresentationSettingsForInCallSettings:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToExtension:", objc_opt_class()))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setAmbientPresented:", -[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setAmbientDisplayStyle:", self->_ambientDisplayStyle);
  }

}

- (BOOL)_isAmbientPresentationActive
{
  SBInCallPresentationSession *v3;
  void *v4;

  if (self->_isAmbientPresented)
    return 1;
  v3 = self;
  -[SBInCallPresentationSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "inCallClientPresentationSessionAmbientPresentationActive:", v3);

  return (char)v3;
}

- (BOOL)_isProximityReaderPresented
{
  return -[SBFLockOutStatusProvider isProximityReaderBlocked](self->_lockoutStateProvider, "isProximityReaderBlocked");
}

- (SBInCallPresentationSessionDelegate)delegate
{
  return (SBInCallPresentationSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)preferredBannerHeight
{
  return self->_preferredBannerHeight;
}

- (void)setPreferredBannerHeight:(double)a3
{
  self->_preferredBannerHeight = a3;
}

- (BOOL)areNonModalPresentationsSuppressed
{
  return self->_nonModalPresentationsSuppressed;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BOOL)shouldIgnoreHomeIndicatorAutoHiddenClientSettings
{
  return self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings;
}

- (UIEdgeInsets)preferredPIPDodgingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredPIPDodgingInsets.top;
  left = self->_preferredPIPDodgingInsets.left;
  bottom = self->_preferredPIPDodgingInsets.bottom;
  right = self->_preferredPIPDodgingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hideSharePlayContentFromClonedDisplayAssertion, 0);
  objc_destroyWeak((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
  objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_preventKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_preferredDismissalPrimaryElement, 0);
  objc_storeStrong((id *)&self->_continuityDisplayAppStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_allowHiddenAppAssertion, 0);
  objc_storeStrong((id *)&self->_systemGestureSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_systemAnimationSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_deactivationManager, 0);
  objc_storeStrong((id *)&self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion, 0);
  objc_storeStrong((id *)&self->_bannerDidDisappearHandlerByUUID, 0);
  objc_storeStrong((id *)&self->_lockoutStateProvider, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_springBoard, 0);
  objc_storeStrong((id *)&self->_pipControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_mainSwitcherCoordinator, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_entityToUnfurlSourceContext, 0);
  objc_storeStrong((id *)&self->_entityToSceneUpdateContext, 0);
  objc_storeStrong((id *)&self->_transientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoordinator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_localEventQueue, 0);
  objc_storeStrong((id *)&self->_ignoreSuspendedUnderLockAssertion, 0);
  objc_storeStrong((id *)&self->_deviceLockHandlingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_jindoInvalidatable, 0);
  objc_storeStrong((id *)&self->_jindoElement, 0);
  objc_storeStrong((id *)&self->_bannerPresentableViewController, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_assertionAnalyticSources, 0);
  objc_storeStrong((id *)&self->_activeSystemAnimationDeactivationReasons, 0);
  objc_storeStrong((id *)&self->_activeSystemGestureDeactivationReasons, 0);
}

- (void)transitionToSceneHandleIfNeeded:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Can't update to scene handle for a different scene", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_performSwitcherPresentationTransitionAnimated:(uint64_t)a3 isUserInitiated:(uint64_t)a4 analyticsSource:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "ICSZOMBIE: Found a zombie ICS presentation %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_performPresentationWithRequestedPresentationMode:(uint64_t)a3 isUserInitiated:(uint64_t)a4 animated:(uint64_t)a5 analyticsSource:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Unexpected request for Banner presentation while system aperture element exists from %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_performPresentationWithRequestedPresentationMode:(uint64_t)a3 isUserInitiated:(uint64_t)a4 animated:(uint64_t)a5 analyticsSource:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Requested full screen transition while locked for screen sharing content", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_presentWithRequestedConfiguration:(uint64_t)a3 animated:(uint64_t)a4 analyticsSource:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SBSInCallPresentationModeDismissed requested in unsupported layout state. Showing full screen as fallback.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
