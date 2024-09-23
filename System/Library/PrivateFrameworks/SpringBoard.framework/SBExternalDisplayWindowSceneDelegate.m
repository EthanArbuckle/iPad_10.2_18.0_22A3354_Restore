@implementation SBExternalDisplayWindowSceneDelegate

- (SBExternalDisplayWindowSceneDelegate)init
{
  SBExternalDisplayWindowSceneDelegate *v2;
  SBTraitsWindowParticipantDelegate *v3;
  SBTraitsWindowParticipantDelegate *traitsWindowParticipantsDelegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  v2 = -[SBAbstractWindowSceneDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    traitsWindowParticipantsDelegate = v2->_traitsWindowParticipantsDelegate;
    v2->_traitsWindowParticipantsDelegate = v3;

  }
  return v2;
}

+ (id)_individuallyManagedRoles
{
  if (_individuallyManagedRoles_onceToken != -1)
    dispatch_once(&_individuallyManagedRoles_onceToken, &__block_literal_global_49);
  return (id)_individuallyManagedRoles__individuallyManagedRoles;
}

void __65__SBExternalDisplayWindowSceneDelegate__individuallyManagedRoles__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];

  v2[22] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("SBTraitsParticipantRoleAXAssistiveTouchUI");
  v2[1] = CFSTR("SBTraitsParticipantRoleAXFullKeyboardUI");
  v2[2] = CFSTR("SBTraitsParticipantRoleAXVoiceControlUI");
  v2[3] = CFSTR("SBTraitsParticipantRoleAXUIServer");
  v2[4] = CFSTR("SBTraitsParticipantRoleBanner");
  v2[5] = CFSTR("SBTraitsParticipantRoleCoverSheetCamera");
  v2[6] = CFSTR("SBTraitsParticipantRoleCoverSheetPosterSwitcher");
  v2[7] = CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay");
  v2[8] = CFSTR("SBTraitsParticipantRoleDruid");
  v2[9] = CFSTR("SBTraitsParticipantRoleEnsembleUI");
  v2[10] = CFSTR("SBTraitsParticipantRoleEyedropperUI");
  v2[11] = CFSTR("SBTraitsParticipantRoleInputUI");
  v2[12] = CFSTR("SBTraitsParticipantRoleInternalPerfPowerHUD");
  v2[13] = CFSTR("SBTraitsParticipantRoleLiveTranscriptionUI");
  v2[14] = CFSTR("SBTraitsParticipantRoleMedusaDrag");
  v2[15] = CFSTR("SBTraitsParticipantRoleMomentsUI");
  v2[16] = CFSTR("SBTraitsParticipantRolePerfPowerHUD");
  v2[17] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  v2[18] = CFSTR("SBTraitsParticipantRoleSubterraneanOverlayUI");
  v2[19] = CFSTR("SBTraitsParticipantRoleSecureApp");
  v2[20] = CFSTR("SBTraitsParticipantRoleSwitcherRaw");
  v2[21] = CFSTR("SBTraitsParticipantRoleSystemAperture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_individuallyManagedRoles__individuallyManagedRoles;
  _individuallyManagedRoles__individuallyManagedRoles = v0;

}

- (id)_pipelineManager
{
  SBTraitsExternalDisplayPipelineManager *traitsExternalPipelineManager;
  SBTraitsExternalDisplayPipelineManager *v4;
  void *v5;
  SBTraitsExternalDisplayPipelineManager *v6;
  SBTraitsExternalDisplayPipelineManager *v7;

  traitsExternalPipelineManager = self->_traitsExternalPipelineManager;
  if (!traitsExternalPipelineManager)
  {
    v4 = [SBTraitsExternalDisplayPipelineManager alloc];
    objc_msgSend((id)SBApp, "userInterfaceStyleProviderForDisplay:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBTraitsPipelineManager initWithUserInterfaceStyleProvider:](v4, "initWithUserInterfaceStyleProvider:", v5);
    v7 = self->_traitsExternalPipelineManager;
    self->_traitsExternalPipelineManager = v6;

    traitsExternalPipelineManager = self->_traitsExternalPipelineManager;
  }
  return traitsExternalPipelineManager;
}

- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3
{
  id v5;
  FBSDisplayLayoutPublisher *displayLayoutPublisher;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FBSDisplayLayoutPublisher *v11;
  FBSDisplayLayoutPublisher *v12;
  FBSDisplayLayoutPublisher *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v5 = a3;
  if (SBFIsShellSceneKitAvailable())
  {
    displayLayoutPublisher = self->_displayLayoutPublisher;
    if (!displayLayoutPublisher)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D230F8]);
      objc_msgSend(v7, "setDomainIdentifier:", CFSTR("com.apple.frontboard"));
      objc_msgSend(v5, "_sbDisplayConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInstanceIdentifier:", v10);

      objc_msgSend(MEMORY[0x1E0D230F0], "publisherWithConfiguration:", v7);
      v11 = (FBSDisplayLayoutPublisher *)objc_claimAutoreleasedReturnValue();
      v12 = self->_displayLayoutPublisher;
      self->_displayLayoutPublisher = v11;

      -[FBSDisplayLayoutPublisher activate](self->_displayLayoutPublisher, "activate");
      displayLayoutPublisher = self->_displayLayoutPublisher;
    }
    v13 = displayLayoutPublisher;
  }
  else
  {
    objc_msgSend(v5, "_FBSScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rootIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "layoutPublisherForPhysicalDisplay:", v17);
    v13 = (FBSDisplayLayoutPublisher *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayWindowSceneDelegate.m"), 158, CFSTR("failed to retrieve publisher for display: %@"), v17);

    }
  }

  return v13;
}

- (id)_traitsDelegateForWindowRole:(id)a3
{
  return self->_traitsWindowParticipantsDelegate;
}

- (BOOL)_shouldManageParticipantWithRole:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_individuallyManagedRoles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BSDefaultObserver *v14;
  BSDefaultObserver *displayModeSettingsToken;
  void *v16;
  void *v17;
  BSInvalidatable *v18;
  BSInvalidatable *eventRoutingAssertion;
  SBSystemPointerInteractionManager *v20;
  void *v21;
  SBSystemPointerInteractionManager *v22;
  SBExternalDisplaySystemGestureManager *v23;
  void *v24;
  void *v25;
  SBExternalDisplaySystemGestureManager *v26;
  void *v27;
  void *v28;
  SBWindowSceneStatusBarSettingsAssertion *v29;
  SBWindowSceneStatusBarSettingsAssertion *showStatusBarAssertion;
  SBExternalDisplayWallpaperController *v31;
  SBExternalDisplayWallpaperController *wallpaperController;
  SBExternalDisplayCoverSheetController *v33;
  SBExternalDisplayCoverSheetController *coverSheetController;
  SBExternalChamoisUICommandValidator *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SBSwitcherController *v40;
  void *v41;
  SBAlertLayoutPresentationVerifier *v42;
  void *v43;
  SBAlertLayoutPresentationVerifier *v44;
  SBSharedModalAlertItemPresenter *v45;
  void *v46;
  void *v47;
  SBSharedModalAlertItemPresenter *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  SBRecordingIndicatorManager *v55;
  SBTransientUIInteractionManager *v56;
  SBModalUIFluidDismissGestureManager *v57;
  SBHomeAffordanceInteractionManager *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  objc_super v63;

  v6 = a3;
  v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  -[SBAbstractWindowSceneDelegate _configureForConnectingWindowScene:windowSceneContext:](&v63, sel__configureForConnectingWindowScene_windowSceneContext_, v6, v7);
  if (SBFIsShellSceneKitAvailable())
  {
    objc_msgSend(v6, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SSKDisplayEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setWantsControlOfDisplay:", 1);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalDisplayDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __94__SBExternalDisplayWindowSceneDelegate__configureForConnectingWindowScene_windowSceneContext___block_invoke;
    v59[3] = &unk_1E8E9E270;
    v60 = v6;
    v61 = v11;
    v62 = v9;
    v12 = v9;
    v13 = v11;
    objc_msgSend(v13, "observeDisplayModeSettingsOnQueue:withBlock:", MEMORY[0x1E0C80D38], v59);
    v14 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
    displayModeSettingsToken = self->_displayModeSettingsToken;
    self->_displayModeSettingsToken = v14;

  }
  +[SBHIDEventDispatchController sharedInstance](SBHIDEventDispatchController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbDisplayConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configureDispatchRootsForChamoisDisplay:", v17);
  v18 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  eventRoutingAssertion = self->_eventRoutingAssertion;
  self->_eventRoutingAssertion = v18;

  v20 = [SBSystemPointerInteractionManager alloc];
  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SBSystemPointerInteractionManager initWithMultiDisplayUserInteractionCoordinator:](v20, "initWithMultiDisplayUserInteractionCoordinator:", v21);

  objc_msgSend(v7, "setSystemPointerInteractionManager:", v22);
  v23 = [SBExternalDisplaySystemGestureManager alloc];
  objc_msgSend(v6, "screen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "displayIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SBExternalDisplaySystemGestureManager initWithDisplayIdentity:](v23, "initWithDisplayIdentity:", v25);

  -[SBSystemGestureManager setSystemPointerInteractionDelegate:](v26, "setSystemPointerInteractionDelegate:", v22);
  objc_msgSend(v7, "setSystemGestureManager:", v26);
  v58 = -[SBHomeAffordanceInteractionManager initWithWindowScene:]([SBHomeAffordanceInteractionManager alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setHomeAffordanceInteractionManager:");
  v57 = -[SBModalUIFluidDismissGestureManager initWithWindowScene:systemGestureManager:]([SBModalUIFluidDismissGestureManager alloc], "initWithWindowScene:systemGestureManager:", v6, v26);
  objc_msgSend(v7, "setModalUIFluidDismissGestureManager:");
  v56 = -[SBTransientUIInteractionManager initWithSystemGestureManager:]([SBTransientUIInteractionManager alloc], "initWithSystemGestureManager:", v26);
  objc_msgSend(v7, "setTransientUIInteractionManager:");
  v55 = -[SBRecordingIndicatorManager initWithWindowScene:]([SBRecordingIndicatorManager alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setRecordingIndicatorManager:");
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateStatusBarLegibilityForWindowScene:", v6);
  objc_msgSend(v27, "iconController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "createFloatingDockControllerForWindowScene:", v6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFloatingDockController:");
  objc_msgSend(v28, "createModalLibraryControllerForWindowScene:", v6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalLibraryController:");
  objc_msgSend(v28, "createStatusBarVisibiltyAssertionForWindowScene:", v6);
  v29 = (SBWindowSceneStatusBarSettingsAssertion *)objc_claimAutoreleasedReturnValue();
  showStatusBarAssertion = self->_showStatusBarAssertion;
  self->_showStatusBarAssertion = v29;

  -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_showStatusBarAssertion, "acquire");
  v31 = -[SBExternalDisplayWallpaperController initWithWindowScene:requiresTraitsParticipant:]([SBExternalDisplayWallpaperController alloc], "initWithWindowScene:requiresTraitsParticipant:", v6, 1);
  wallpaperController = self->_wallpaperController;
  self->_wallpaperController = v31;

  v33 = -[SBExternalDisplayCoverSheetController initWithWindowScene:]([SBExternalDisplayCoverSheetController alloc], "initWithWindowScene:", v6);
  coverSheetController = self->_coverSheetController;
  self->_coverSheetController = v33;

  objc_msgSend(v7, "setUILockStateProvider:", self->_coverSheetController);
  v35 = objc_alloc_init(SBExternalChamoisUICommandValidator);
  objc_msgSend(v7, "setCommandValidator:", v35);

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "transientOverlayPresentationManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "windowSceneDidConnect:", v6);

  objc_msgSend(v6, "pictureInPictureManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "windowSceneDidConnect:", v6);

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) == 0)
  {
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "windowSceneDidConnect:", v6);

    v40 = -[SBSwitcherController initWithWindowScene:debugName:]([SBSwitcherController alloc], "initWithWindowScene:debugName:", v6, CFSTR("ExternalDisplay"));
    objc_msgSend(v7, "setSwitcherController:", v40);
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "beginCoordinatingSwitcherController:", v40);

  }
  v42 = [SBAlertLayoutPresentationVerifier alloc];
  objc_msgSend(v6, "screen");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[SBAlertLayoutPresentationVerifier initWithScreen:](v42, "initWithScreen:", v43);

  v45 = [SBSharedModalAlertItemPresenter alloc];
  objc_msgSend((id)SBApp, "lockOutController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[SBSharedModalAlertItemPresenter initWithLockOutProvider:systemGestureManager:reachabilityManager:alertLayoutPresentationVerifier:windowScene:](v45, "initWithLockOutProvider:systemGestureManager:reachabilityManager:alertLayoutPresentationVerifier:windowScene:", v46, v26, v47, v44, v6);

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "windowSceneDidConnect:withSharedModalAlertItemPresenter:", v6, v48);

  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "windowSceneDidConnect:", v6);

  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "windowSceneDidConnect:", v6);

  objc_msgSend(v6, "statusBarManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "windowSceneDidConnect:", v6);

}

void __94__SBExternalDisplayWindowSceneDelegate__configureForConnectingWindowScene_windowSceneContext___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  id v8;

  if (objc_msgSend(a1[4], "activationState") != -1)
  {
    objc_msgSend(a1[4], "_FBSScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "displayModeSettingsForDisplay:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA9D58], "withDisplay:useNativeSize:", v8, objc_msgSend(a1[5], "chamois"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0D23130]);
    objc_msgSend(v4, "overscanCompensation");
    objc_msgSend(v6, "setOverscanCompensation:", FBSDisplayOverscanCompensationForDisplayValue());
    objc_msgSend(v5, "logicalScaleForDisplayScale:", objc_msgSend(v4, "scale"));
    objc_msgSend(v6, "setLogicalScale:", v7, v7);
    objc_msgSend(a1[5], "contentsScale");
    objc_msgSend(v6, "setPointScale:");
    objc_msgSend(a1[6], "setDisplayConfigurationRequest:", v6);

  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "role");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SBWindowSceneSessionRoleExternalDisplay")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayWindowSceneDelegate.m"), 269, CFSTR("unexpected role for SBSystemShellExternalDisplayWindowSceneDelegate"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  -[SBAbstractWindowSceneDelegate scene:willConnectToSession:options:](&v14, sel_scene_willConnectToSession_options_, v9, v10, v11);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBWindowSceneStatusBarSettingsAssertion *showStatusBarAssertion;
  void *v22;
  BSInvalidatable *eventRoutingAssertion;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SBExternalDisplayCoverSheetController *coverSheetController;
  FBSDisplayLayoutPublisher *displayLayoutPublisher;
  objc_super v30;

  v4 = a3;
  -[BSDefaultObserver invalidate](self->_displayModeSettingsToken, "invalidate");
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardFocusController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ - %@"), v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suppressKeyboardFocusEvaluationForReason:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setInvalidating:", 1);
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endCoordinatingSwitcherController:", v19);

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "windowSceneDidDisconnect:", v8);

  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_showStatusBarAssertion, "invalidate");
  showStatusBarAssertion = self->_showStatusBarAssertion;
  self->_showStatusBarAssertion = 0;

  -[SBAbstractWindowSceneDelegate modalLibraryController](self, "modalLibraryController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "invalidate");

  -[BSInvalidatable invalidate](self->_eventRoutingAssertion, "invalidate");
  eventRoutingAssertion = self->_eventRoutingAssertion;
  self->_eventRoutingAssertion = 0;

  objc_msgSend(v8, "systemGestureManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "invalidate");

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "windowSceneDidDisconnect:", v8);

  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "windowSceneDidDisconnect:", v8);

  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "windowSceneDidDisconnect:", v8);

  -[SBExternalDisplayCoverSheetController invalidate](self->_coverSheetController, "invalidate");
  coverSheetController = self->_coverSheetController;
  self->_coverSheetController = 0;

  -[FBSDisplayLayoutPublisher invalidate](self->_displayLayoutPublisher, "invalidate");
  displayLayoutPublisher = self->_displayLayoutPublisher;
  self->_displayLayoutPublisher = 0;

  v30.receiver = self;
  v30.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  -[SBAbstractWindowSceneDelegate sceneDidDisconnect:](&v30, sel_sceneDidDisconnect_, v6);
  objc_msgSend(v17, "invalidate");
  objc_msgSend(v8, "invalidate");

  -[SBAbstractWindowSceneDelegate setInvalidated:](self, "setInvalidated:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_eventRoutingAssertion, 0);
  objc_storeStrong((id *)&self->_displayModeSettingsToken, 0);
  objc_storeStrong((id *)&self->_showStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_coverSheetController, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_traitsExternalPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsWindowParticipantsDelegate, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
