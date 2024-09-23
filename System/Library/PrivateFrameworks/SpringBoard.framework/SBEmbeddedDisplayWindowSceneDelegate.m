@implementation SBEmbeddedDisplayWindowSceneDelegate

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

+ (id)_individuallyManagedRoles
{
  if (_individuallyManagedRoles_onceToken_1 != -1)
    dispatch_once(&_individuallyManagedRoles_onceToken_1, &__block_literal_global_312);
  return (id)_individuallyManagedRoles__individuallyManagedRoles_1;
}

- (SBEmbeddedDisplayWindowSceneDelegate)init
{
  SBEmbeddedDisplayWindowSceneDelegate *v2;
  SBTraitsWindowParticipantDelegate *v3;
  SBTraitsWindowParticipantDelegate *traitsWindowParticipantsDelegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEmbeddedDisplayWindowSceneDelegate;
  v2 = -[SBAbstractWindowSceneDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    traitsWindowParticipantsDelegate = v2->_traitsWindowParticipantsDelegate;
    v2->_traitsWindowParticipantsDelegate = v3;

  }
  return v2;
}

void __65__SBEmbeddedDisplayWindowSceneDelegate__individuallyManagedRoles__block_invoke()
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
  v2[16] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  v2[17] = CFSTR("SBTraitsParticipantRoleSubterraneanOverlayUI");
  v2[18] = CFSTR("SBTraitsParticipantRolePerfPowerHUD");
  v2[19] = CFSTR("SBTraitsParticipantRoleSecureApp");
  v2[20] = CFSTR("SBTraitsParticipantRoleSwitcherRaw");
  v2[21] = CFSTR("SBTraitsParticipantRoleSystemAperture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_individuallyManagedRoles__individuallyManagedRoles_1;
  _individuallyManagedRoles__individuallyManagedRoles_1 = v0;

}

+ (id)_windowWillBecomeHiddenExemptRoles
{
  if (_windowWillBecomeHiddenExemptRoles_onceToken != -1)
    dispatch_once(&_windowWillBecomeHiddenExemptRoles_onceToken, &__block_literal_global_7_3);
  return (id)_windowWillBecomeHiddenExemptRoles__windowWillBecomeHiddenExemptRoles;
}

void __74__SBEmbeddedDisplayWindowSceneDelegate__windowWillBecomeHiddenExemptRoles__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_windowWillBecomeHiddenExemptRoles__windowWillBecomeHiddenExemptRoles;
  _windowWillBecomeHiddenExemptRoles__windowWillBecomeHiddenExemptRoles = v0;

}

- (void)initializeProductivityGestureControllerIfNecessary
{
  SBProductivityGestureController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBProductivityGestureController *v9;
  SBProductivityGestureController *productivityGestureController;
  id v11;

  v3 = [SBProductivityGestureController alloc];
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardFocusController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gestureDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "productivityGestureEducationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBProductivityGestureController initWithSystemGestureManager:focusController:gestureDefaults:gestureEducationController:](v3, "initWithSystemGestureManager:focusController:gestureDefaults:gestureEducationController:", v11, v5, v7, v8);
  productivityGestureController = self->_productivityGestureController;
  self->_productivityGestureController = v9;

}

- (id)_pipelineManager
{
  SBTraitsEmbeddedDisplayPipelineManager *traitsEmbeddedPipelineManager;
  SBTraitsEmbeddedDisplayPipelineManager *v4;
  void *v5;
  SBTraitsEmbeddedDisplayPipelineManager *v6;
  SBTraitsEmbeddedDisplayPipelineManager *v7;

  traitsEmbeddedPipelineManager = self->_traitsEmbeddedPipelineManager;
  if (!traitsEmbeddedPipelineManager)
  {
    v4 = [SBTraitsEmbeddedDisplayPipelineManager alloc];
    objc_msgSend((id)SBApp, "userInterfaceStyleProviderForDisplay:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBTraitsPipelineManager initWithUserInterfaceStyleProvider:](v4, "initWithUserInterfaceStyleProvider:", v5);
    v7 = self->_traitsEmbeddedPipelineManager;
    self->_traitsEmbeddedPipelineManager = v6;

    traitsEmbeddedPipelineManager = self->_traitsEmbeddedPipelineManager;
  }
  return traitsEmbeddedPipelineManager;
}

- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance", a3);
}

- (BOOL)_shouldHandleWindowWillBecomeHiddenForRole:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_windowWillBecomeHiddenExemptRoles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  SBSystemPointerInteractionManager *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  SBSystemApertureController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBHomeScreenController *v23;
  SBHomeScreenController *homeScreenController;
  void *v25;
  void *v26;
  SBWindowSceneStatusBarSettingsAssertion *v27;
  SBWindowSceneStatusBarSettingsAssertion *showStatusBarAssertion;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SBEmbeddedDisplayUICommandValidator *v33;
  void *v34;
  SBEmbeddedDisplayUICommandValidator *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SBSwitcherController *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  SBCaptureButtonDispatchingDeferrer *v56;
  void *v57;
  void *v58;
  SBCaptureButtonDispatchingDeferrer *v59;
  SBCaptureButtonDispatchingDeferrer *captureButtonDispatchingDeferrer;
  SBHardwareButtonBezelEffectsCoordinator *v61;
  SBAmbientPresentationController *v62;
  SBRecordingIndicatorManager *v63;
  void (**v64)(_QWORD);
  SBSystemApertureController *v65;
  SBTransientUIInteractionManager *v66;
  SBModalUIFluidDismissGestureManager *v67;
  SBHomeAffordanceInteractionManager *v68;
  void *v69;
  objc_super v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  SBEmbeddedDisplayWindowSceneDelegate *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogStartup();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v72 = v9;
    v73 = 2114;
    v74 = v6;
    v75 = 2114;
    v76 = self;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] : %{public}@; %{public}@", buf, 0x20u);

  }
  v70.receiver = self;
  v70.super_class = (Class)SBEmbeddedDisplayWindowSceneDelegate;
  -[SBAbstractWindowSceneDelegate _configureForConnectingWindowScene:windowSceneContext:](&v70, sel__configureForConnectingWindowScene_windowSceneContext_, v6, v7);
  objc_msgSend(v6, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "SSKDisplayEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWantsControlOfDisplay:", 1);

  SBLogStartup();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v72 = v13;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting SBMainWindowScene", buf, 0xCu);

  }
  SBSetMainWindowScene(v6);
  -[SBTraitsEmbeddedDisplayPipelineManager startListeningForLockScreenUIPresentations](self->_traitsEmbeddedPipelineManager, "startListeningForLockScreenUIPresentations");
  v14 = [SBSystemPointerInteractionManager alloc];
  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBSystemPointerInteractionManager initWithMultiDisplayUserInteractionCoordinator:](v14, "initWithMultiDisplayUserInteractionCoordinator:", v15);

  objc_msgSend(v7, "setSystemPointerInteractionManager:", v16);
  +[SBMainDisplaySystemGestureManager sharedInstance](SBMainDisplaySystemGestureManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v16;
  objc_msgSend(v17, "setSystemPointerInteractionDelegate:", v16);
  objc_msgSend(v7, "setSystemGestureManager:", v17);
  v68 = -[SBHomeAffordanceInteractionManager initWithWindowScene:]([SBHomeAffordanceInteractionManager alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setHomeAffordanceInteractionManager:");
  v67 = -[SBModalUIFluidDismissGestureManager initWithWindowScene:systemGestureManager:]([SBModalUIFluidDismissGestureManager alloc], "initWithWindowScene:systemGestureManager:", v6, v17);
  objc_msgSend(v7, "setModalUIFluidDismissGestureManager:");
  v66 = -[SBTransientUIInteractionManager initWithSystemGestureManager:]([SBTransientUIInteractionManager alloc], "initWithSystemGestureManager:", v17);
  objc_msgSend(v7, "setTransientUIInteractionManager:");
  v18 = -[SBSystemApertureController initWithWindowScene:]([SBSystemApertureController alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setSystemApertureController:", v18);
  objc_msgSend(v6, "_FBSScene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureController createHighLevelWindowSceneWithDisplayConfiguration:](v18, "createHighLevelWindowSceneWithDisplayConfiguration:", v21);
  v65 = v18;
  -[SBSystemApertureController createSuperHighLevelCurtainWindowSceneWithDisplayConfiguration:](v18, "createSuperHighLevelCurtainWindowSceneWithDisplayConfiguration:", v21);
  objc_msgSend((id)SBApp, "_completeStartupAfterMainSceneConnect:", v6);
  v64 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWindowScene:", v6);

  v63 = -[SBRecordingIndicatorManager initWithWindowScene:]([SBRecordingIndicatorManager alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setRecordingIndicatorManager:");
  if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
  {
    v23 = -[SBHomeScreenController initWithWindowScene:]([SBHomeScreenController alloc], "initWithWindowScene:", v6);
    homeScreenController = self->_homeScreenController;
    self->_homeScreenController = v23;

    objc_msgSend(v7, "setHomeScreenController:", self->_homeScreenController);
    -[SBHomeScreenController createFloatingDockControllerForWindowScene:](self->_homeScreenController, "createFloatingDockControllerForWindowScene:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFloatingDockController:", v25);
    -[SBHomeScreenController createModalLibraryControllerForWindowScene:](self->_homeScreenController, "createModalLibraryControllerForWindowScene:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalLibraryController:", v26);
    -[SBHomeScreenController createStatusBarVisibiltyAssertionForWindowScene:](self->_homeScreenController, "createStatusBarVisibiltyAssertionForWindowScene:", v6);
    v27 = (SBWindowSceneStatusBarSettingsAssertion *)objc_claimAutoreleasedReturnValue();
    showStatusBarAssertion = self->_showStatusBarAssertion;
    self->_showStatusBarAssertion = v27;

    -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_showStatusBarAssertion, "acquire");
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createFloatingDockControllerForWindowScene:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFloatingDockController:", v26);
    objc_msgSend(v25, "createModalLibraryControllerForWindowScene:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalLibraryController:", v29);

  }
  objc_msgSend(v7, "lockScreenManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUILockStateProvider:", v30);

  objc_msgSend(v6, "pictureInPictureManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "windowSceneDidConnect:", v6);

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReachabilitySceneOffsetProvider:", v32);

  v33 = [SBEmbeddedDisplayUICommandValidator alloc];
  objc_msgSend(v7, "layoutStateProvider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[SBEmbeddedDisplayUICommandValidator initWithLayoutStateProvider:](v33, "initWithLayoutStateProvider:", v34);
  objc_msgSend(v7, "setCommandValidator:", v35);

  v62 = -[SBAmbientPresentationController initWithWindowScene:]([SBAmbientPresentationController alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setAmbientPresentationController:");
  -[SBTraitsEmbeddedDisplayPipelineManager startObservingAmbientPresentation](self->_traitsEmbeddedPipelineManager, "startObservingAmbientPresentation");
  -[SBTraitsEmbeddedDisplayPipelineManager startObservingLayoutStateTransitions](self->_traitsEmbeddedPipelineManager, "startObservingLayoutStateTransitions");
  +[SBPrototypeController sharedInstance](SBPrototypeController, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWindowScene:", v6);

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWindowScene:", v6);

  +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setWindowScene:", v6);

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "transientOverlayPresentationManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "windowSceneDidConnect:", v6);

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) == 0)
  {
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "windowSceneDidConnect:", v6);

    v42 = -[SBSwitcherController initWithWindowScene:debugName:]([SBSwitcherController alloc], "initWithWindowScene:debugName:", v6, CFSTR("EmbeddedDisplay"));
    objc_msgSend(v7, "setSwitcherController:", v42);
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "beginCoordinatingSwitcherController:", v42);

  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "createRequestWithOptions:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "finalize");
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "windowSceneDidConnect:", v6);

  objc_msgSend(v7, "pictureInPictureManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "configureInsetsForIconController:", v48);

  -[SBEmbeddedDisplayWindowSceneDelegate initializeProductivityGestureControllerIfNecessary](self, "initializeProductivityGestureControllerIfNecessary");
  objc_msgSend((id)SBApp, "proximityBacklightPolicy");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "windowSceneDidConnect:", v6);

  objc_msgSend((id)SBApp, "HUDController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "windowSceneDidConnect:", v6);

  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "windowSceneDidConnect:", v6);

  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "windowSceneDidConnect:", v6);

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v53, "deviceSupportsHWButtonBezelEffects") & 1) != 0)
  {
    v54 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v55, "BOOLForKey:", CFSTR("SBHardwareButtonHintDropletsEnabled"));

  }
  if ((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) != 0
    || +[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]())
  {
    v56 = [SBCaptureButtonDispatchingDeferrer alloc];
    objc_msgSend(v6, "zStackResolver");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "captureButtonRestrictionCoordinator");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[SBCaptureButtonDispatchingDeferrer initWithZStackResolver:restrictionCoordinator:](v56, "initWithZStackResolver:restrictionCoordinator:", v57, v58);
    captureButtonDispatchingDeferrer = self->_captureButtonDispatchingDeferrer;
    self->_captureButtonDispatchingDeferrer = v59;

  }
  if (!CAMIsCameraOverlayEnabled())
  {
    if (!v54)
      goto LABEL_22;
LABEL_21:
    v61 = -[SBHardwareButtonBezelEffectsCoordinator initWithWindowScene:]([SBHardwareButtonBezelEffectsCoordinator alloc], "initWithWindowScene:", v6);
    objc_msgSend(v7, "setHardwareButtonBezelEffectsCoordinator:", v61);

    goto LABEL_22;
  }
  if ((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) != 0
    || ((+[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]() | v54) & 1) != 0)
  {
    goto LABEL_21;
  }
LABEL_22:
  v64[2](v64);

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
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CEBE48]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBEmbeddedDisplayWindowSceneDelegate.m"), 306, CFSTR("unexpected role for SBMainWindowSceneDelegate"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBEmbeddedDisplayWindowSceneDelegate;
  -[SBAbstractWindowSceneDelegate scene:willConnectToSession:options:](&v14, sel_scene_willConnectToSession_options_, v9, v10, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenController, 0);
  objc_storeStrong((id *)&self->_captureButtonDispatchingDeferrer, 0);
  objc_storeStrong((id *)&self->_productivityGestureController, 0);
  objc_storeStrong((id *)&self->_traitsEmbeddedPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsWindowParticipantsDelegate, 0);
}

@end
