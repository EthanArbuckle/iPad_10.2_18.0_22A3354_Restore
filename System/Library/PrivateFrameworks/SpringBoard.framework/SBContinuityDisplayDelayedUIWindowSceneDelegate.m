@implementation SBContinuityDisplayDelayedUIWindowSceneDelegate

- (SBContinuityDisplayDelayedUIWindowSceneDelegate)init
{
  SBContinuityDisplayDelayedUIWindowSceneDelegate *v2;
  SBTraitsWindowParticipantDelegate *v3;
  SBTraitsWindowParticipantDelegate *traitsWindowParticipantsDelegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
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
  if (_individuallyManagedRoles_onceToken_0 != -1)
    dispatch_once(&_individuallyManagedRoles_onceToken_0, &__block_literal_global_166);
  return (id)_individuallyManagedRoles__individuallyManagedRoles_0;
}

void __76__SBContinuityDisplayDelayedUIWindowSceneDelegate__individuallyManagedRoles__block_invoke()
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
  v1 = (void *)_individuallyManagedRoles__individuallyManagedRoles_0;
  _individuallyManagedRoles__individuallyManagedRoles_0 = v0;

}

- (id)_pipelineManager
{
  SBTraitsContinuityDisplayPipelineManager *traitsDisplayPipelineManager;
  SBTraitsContinuityDisplayPipelineManager *v4;
  void *v5;
  void *v6;
  SBTraitsContinuityDisplayPipelineManager *v7;
  SBTraitsContinuityDisplayPipelineManager *v8;

  traitsDisplayPipelineManager = self->_traitsDisplayPipelineManager;
  if (!traitsDisplayPipelineManager)
  {
    v4 = [SBTraitsContinuityDisplayPipelineManager alloc];
    +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInterfaceStyleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBTraitsPipelineManager initWithUserInterfaceStyleProvider:](v4, "initWithUserInterfaceStyleProvider:", v6);
    v8 = self->_traitsDisplayPipelineManager;
    self->_traitsDisplayPipelineManager = v7;

    traitsDisplayPipelineManager = self->_traitsDisplayPipelineManager;
  }
  return traitsDisplayPipelineManager;
}

- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!self->_continuitySession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 190, CFSTR("I should have a session by now"));

  }
  objc_msgSend(v5, "_sbDisplayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 192, CFSTR("missing display configuration"));

  }
  -[SBContinuitySession displayLayoutPublisher](self->_continuitySession, "displayLayoutPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 194, CFSTR("missing continuity display layout publisher"));

  }
  objc_msgSend(v7, "setDisplayConfiguration:", v6);

  return v7;
}

- (id)_sceneManagerForConnectingWindowScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneManagerForDisplayIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_configureNewPresentationBinderForWindowScene:(id)a3 sceneManager:(id)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  if (!self->_presentationBinderWindow)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 206, CFSTR("We don't have a presentation binder window"));

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%p"), v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA938]), "initWithIdentifier:priority:rootView:appearanceStyle:", v9, 0, self->_presentationBinderWindow, 0);
  objc_msgSend(v12, "updatePresentationBinder:", v10);

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BSInvalidatable *v16;
  BSInvalidatable *eventRoutingAssertion;
  SBSystemPointerInteractionManager *v18;
  void *v19;
  SBSystemPointerInteractionManager *v20;
  SBContinuityDisplaySystemGestureManager *v21;
  void *v22;
  void *v23;
  SBContinuityDisplaySystemGestureManager *v24;
  SBHomeScreenController *v25;
  SBHomeScreenController *homeScreenController;
  SBWindowSceneStatusBarSettingsAssertion *v27;
  SBWindowSceneStatusBarSettingsAssertion *showStatusBarAssertion;
  SBExternalDisplayWallpaperController *v29;
  SBExternalDisplayWallpaperController *wallpaperController;
  SBContinuityLockStateProvider *v31;
  SBContinuitySecureDisplayStateProvider *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SBSwitcherController *v38;
  void *v39;
  void *v40;
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
  void *v55;
  void *v56;
  SBRecordingIndicatorManager *v57;
  SBTransientUIInteractionManager *v58;
  SBModalUIFluidDismissGestureManager *v59;
  SBHomeAffordanceInteractionManager *v60;
  SBContinuityDisplaySystemGestureManager *v61;
  void *v62;
  objc_super v63;

  v6 = a3;
  v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
  -[SBAbstractWindowSceneDelegate _configureForConnectingWindowScene:windowSceneContext:](&v63, sel__configureForConnectingWindowScene_windowSceneContext_, v6, v7);
  objc_msgSend((id)SBApp, "windowSceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embeddedDisplayWindowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "layoutStateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBMainDisplayLayoutStateManager _initialLayoutStateWithDisplayOrdinal:isDisplayExternal:](SBMainDisplayLayoutStateManager, "_initialLayoutStateWithDisplayOrdinal:isDisplayExternal:", objc_msgSend(v11, "displayOrdinal"), objc_msgSend(v11, "isDisplayExternal"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutStateProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v12;
  objc_msgSend(v13, "setLayoutState:", v12);

  +[SBHIDEventDispatchController sharedInstance](SBHIDEventDispatchController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbDisplayConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureDispatchRootsForContinuityDisplay:", v15);
  v16 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  eventRoutingAssertion = self->_eventRoutingAssertion;
  self->_eventRoutingAssertion = v16;

  v18 = [SBSystemPointerInteractionManager alloc];
  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBSystemPointerInteractionManager initWithMultiDisplayUserInteractionCoordinator:](v18, "initWithMultiDisplayUserInteractionCoordinator:", v19);

  objc_msgSend(v7, "setSystemPointerInteractionManager:", v20);
  v21 = [SBContinuityDisplaySystemGestureManager alloc];
  objc_msgSend(v6, "screen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBContinuityDisplaySystemGestureManager initWithDisplayIdentity:](v21, "initWithDisplayIdentity:", v23);

  -[SBSystemGestureManager setSystemPointerInteractionDelegate:](v24, "setSystemPointerInteractionDelegate:", v20);
  objc_msgSend(v7, "setSystemGestureManager:", v24);
  v60 = -[SBHomeAffordanceInteractionManager initWithWindowScene:]([SBHomeAffordanceInteractionManager alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setHomeAffordanceInteractionManager:");
  v59 = -[SBModalUIFluidDismissGestureManager initWithWindowScene:systemGestureManager:]([SBModalUIFluidDismissGestureManager alloc], "initWithWindowScene:systemGestureManager:", v6, v24);
  objc_msgSend(v7, "setModalUIFluidDismissGestureManager:");
  v61 = v24;
  v58 = -[SBTransientUIInteractionManager initWithSystemGestureManager:]([SBTransientUIInteractionManager alloc], "initWithSystemGestureManager:", v24);
  objc_msgSend(v7, "setTransientUIInteractionManager:");
  v57 = -[SBRecordingIndicatorManager initWithWindowScene:]([SBRecordingIndicatorManager alloc], "initWithWindowScene:", v6);
  objc_msgSend(v7, "setRecordingIndicatorManager:");
  v25 = -[SBHomeScreenController initWithWindowScene:]([SBHomeScreenController alloc], "initWithWindowScene:", v6);
  homeScreenController = self->_homeScreenController;
  self->_homeScreenController = v25;

  objc_msgSend(v7, "setHomeScreenController:", self->_homeScreenController);
  -[SBHomeScreenController restoreContentAndUnscatterIconsAnimated:](self->_homeScreenController, "restoreContentAndUnscatterIconsAnimated:", 0);
  -[SBHomeScreenController createFloatingDockControllerForWindowScene:](self->_homeScreenController, "createFloatingDockControllerForWindowScene:", v6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFloatingDockController:");
  -[SBHomeScreenController createModalLibraryControllerForWindowScene:](self->_homeScreenController, "createModalLibraryControllerForWindowScene:", v6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalLibraryController:");
  -[SBHomeScreenController updateStatusBarLegibilityForWindowScene:](self->_homeScreenController, "updateStatusBarLegibilityForWindowScene:", v6);
  -[SBHomeScreenController createStatusBarVisibiltyAssertionForWindowScene:](self->_homeScreenController, "createStatusBarVisibiltyAssertionForWindowScene:", v6);
  v27 = (SBWindowSceneStatusBarSettingsAssertion *)objc_claimAutoreleasedReturnValue();
  showStatusBarAssertion = self->_showStatusBarAssertion;
  self->_showStatusBarAssertion = v27;

  -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_showStatusBarAssertion, "acquire");
  v29 = -[SBExternalDisplayWallpaperController initWithWindowScene:requiresTraitsParticipant:]([SBExternalDisplayWallpaperController alloc], "initWithWindowScene:requiresTraitsParticipant:", v6, 0);
  wallpaperController = self->_wallpaperController;
  self->_wallpaperController = v29;

  v31 = objc_alloc_init(SBContinuityLockStateProvider);
  objc_msgSend(v7, "setUILockStateProvider:", v31);

  v32 = objc_alloc_init(SBContinuitySecureDisplayStateProvider);
  objc_msgSend(v7, "setSecureDisplayStateProvider:", v32);

  objc_msgSend((id)SBApp, "authenticationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAuthenticationStatusProvider:", v34);

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "transientOverlayPresentationManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "windowSceneDidConnect:", v6);

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) == 0)
  {
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "windowSceneDidConnect:", v6);

    v38 = -[SBSwitcherController initWithWindowScene:debugName:]([SBSwitcherController alloc], "initWithWindowScene:debugName:", v6, CFSTR("Continuity"));
    objc_msgSend(v7, "setSwitcherController:", v38);
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "beginCoordinatingSwitcherController:options:", v38, 1);

  }
  objc_msgSend(v6, "pictureInPictureManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "windowSceneDidConnect:", v6);

  objc_msgSend((id)SBApp, "pictureInPictureCoordinator");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "controllerForType:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "movePIPContentToWindowScene:", v6);
  v42 = [SBAlertLayoutPresentationVerifier alloc];
  objc_msgSend(v6, "screen");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[SBAlertLayoutPresentationVerifier initWithScreen:](v42, "initWithScreen:", v43);

  v45 = [SBSharedModalAlertItemPresenter alloc];
  objc_msgSend((id)SBApp, "lockOutController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[SBSharedModalAlertItemPresenter initWithLockOutProvider:systemGestureManager:reachabilityManager:alertLayoutPresentationVerifier:windowScene:](v45, "initWithLockOutProvider:systemGestureManager:reachabilityManager:alertLayoutPresentationVerifier:windowScene:", v46, v61, v47, v44, v6);

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "windowSceneDidConnect:withSharedModalAlertItemPresenter:", v6, v48);

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSystemApertureController:", v50);
  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "windowSceneDidConnect:", v6);

  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "windowSceneDidConnect:", v6);

  objc_msgSend(v6, "statusBarManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "windowSceneDidConnect:", v6);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  UISceneSession *v10;
  UISceneConnectionOptions *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  SBWindowScene *v18;
  SBContinuityDisplayPresentationBinderWindow *v19;
  UIWindow *presentationBinderWindow;
  UIWindow *v21;
  void *v22;
  SBWindowScene *connectingScene;
  SBWindowScene *v24;
  UISceneSession *connectingSceneSession;
  UISceneSession *v26;
  UISceneConnectionOptions *connectingSceneConnectionOptions;
  UISceneConnectionOptions *v28;
  void *v29;
  BSInvalidatable *v30;
  BSInvalidatable *continuitySessionManagerRegistration;
  void *v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (UISceneSession *)a4;
  v11 = (UISceneConnectionOptions *)a5;
  SBLogContinuitySession();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "_sceneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v35 = v9;
    v36 = 2114;
    v37 = v13;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ willConnectToSession", buf, 0x16u);

  }
  -[UISceneSession role](v10, "role");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DAC9D8]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 325, CFSTR("unexpected role for SBContinuityDisplayDelayedUIWindowSceneDelegate"));

  }
  v15 = objc_opt_class();
  v16 = v9;
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 328, CFSTR("scene isn't correct type: %@"), objc_opt_class());

  }
  v19 = -[SBContinuityDisplayPresentationBinderWindow initWithWindowScene:]([SBContinuityDisplayPresentationBinderWindow alloc], "initWithWindowScene:", v18);
  presentationBinderWindow = self->_presentationBinderWindow;
  self->_presentationBinderWindow = &v19->super.super;

  -[UIWindow setWindowLevel:](self->_presentationBinderWindow, "setWindowLevel:", 1.79769313e308);
  v21 = self->_presentationBinderWindow;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setBackgroundColor:](v21, "setBackgroundColor:", v22);

  -[UIWindow setHidden:](self->_presentationBinderWindow, "setHidden:", 0);
  connectingScene = self->_connectingScene;
  self->_connectingScene = v18;
  v24 = v18;

  connectingSceneSession = self->_connectingSceneSession;
  self->_connectingSceneSession = v10;
  v26 = v10;

  connectingSceneConnectionOptions = self->_connectingSceneConnectionOptions;
  self->_connectingSceneConnectionOptions = v11;
  v28 = v11;

  +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerWindowScene:", v24);
  v30 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
  self->_continuitySessionManagerRegistration = v30;

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BSInvalidatable *continuitySessionManagerRegistration;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "_sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ didDisconnect", (uint8_t *)&v12, 0x16u);

  }
  -[BSInvalidatable invalidate](self->_continuitySessionManagerRegistration, "invalidate");
  continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
  self->_continuitySessionManagerRegistration = 0;

  v8 = objc_opt_class();
  v9 = v4;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  -[SBContinuitySession noteMainSceneDisconnected:](self->_continuitySession, "noteMainSceneDisconnected:", v11);
  -[SBContinuityDisplayDelayedUIWindowSceneDelegate _tearDownUIAndInvalidateIfNecessaryForReason:](self, "_tearDownUIAndInvalidateIfNecessaryForReason:", CFSTR("scene disconnected"));

}

- (void)sceneWillEnterForeground:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  SBLogContinuitySession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBContinuityDisplayDelayedUIWindowSceneDelegate sceneWillEnterForeground:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (SBContinuitySession)connectedSession
{
  return self->_continuitySession;
}

- (void)didConnectToSession:(id)a3
{
  id v6;
  SBContinuitySession **p_continuitySession;
  NSObject *v8;
  SBWindowScene *connectingScene;
  void *v10;
  SBWindowScene *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  SBWindowScene *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_continuitySession = &self->_continuitySession;
  if (self->_continuitySession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 371, CFSTR("Already have a session!!"));

  }
  SBLogContinuitySession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    connectingScene = self->_connectingScene;
    -[SBWindowScene _sceneIdentifier](connectingScene, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218498;
    v21 = connectingScene;
    v22 = 2114;
    v23 = v10;
    v24 = 2048;
    v25 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ connected to session <%p>", (uint8_t *)&v20, 0x20u);

  }
  objc_storeStrong((id *)&self->_continuitySession, a3);
  objc_msgSend(v6, "addStateObserver:", self);
  -[SBContinuitySession setOrientationDelegate:](*p_continuitySession, "setOrientationDelegate:", self);
  v11 = self->_connectingScene;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 380, CFSTR("_connectingScene is nil, this means we already setup the UI but we just got the scene!"));

    v11 = self->_connectingScene;
  }
  -[SBWindowScene _FBSScene](v11, "_FBSScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "continuitySessionParticipantClientComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 384, CFSTR("No SBUIContinuitySessionPartipantClientComponent"));

  }
  objc_msgSend(v13, "setContinuitySession:", v6);
  -[SBWindowScene _FBSScene](self->_connectingScene, "_FBSScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "continuityHostProxyClientComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 388, CFSTR("No SBContinuityHostProxyClientComponent"));

  }
  objc_msgSend(v6, "addScreenRecordingObserver:", v15);
  objc_msgSend(v15, "continuitySessionDidUpdateScreenRecordingState:", v6);
  -[SBContinuitySession noteMainSceneConnected:](*p_continuitySession, "noteMainSceneConnected:", self->_connectingScene);
  objc_msgSend(v6, "noteSceneHasValidDisplayUUID:", self->_connectingScene);
  -[SBContinuityDisplayDelayedUIWindowSceneDelegate continuitySessionDidUpdateState:](self, "continuitySessionDidUpdateState:", v6);

}

- (void)continuitySessionDidUpdateState:(id)a3
{
  SBWindowScene *connectingScene;
  SBWindowScene *v6;
  SBWindowScene *v7;
  SBContinuitySession *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  SEL v12;
  SBContinuityDisplayDelayedUIWindowSceneDelegate *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SBContinuitySession *v17;

  v17 = (SBContinuitySession *)a3;
  connectingScene = self->_connectingScene;
  if (connectingScene)
  {
    v6 = connectingScene;
  }
  else
  {
    -[SBAbstractWindowSceneDelegate windowScene](self, "windowScene");
    v6 = (SBWindowScene *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = v17;
  if (self->_continuitySession != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWindowScene _sceneIdentifier](v7, "_sceneIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 407, CFSTR("Main scene <%p>:%@ state update for session <%p> is not the one i'm tracking <%p>"), v7, v16, v17, self->_continuitySession);

    v8 = v17;
  }
  switch(-[SBContinuitySession state](v8, "state"))
  {
    case 1uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State is blocked but we already created UI");
        v12 = a2;
        v13 = self;
        v14 = 414;
        goto LABEL_26;
      }
      break;
    case 2uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State is preparingForRemoteUnlock but we already created UI");
        v12 = a2;
        v13 = self;
        v14 = 417;
        goto LABEL_26;
      }
      break;
    case 3uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State is waitingForRemoteUnlock but we already created UI");
        v12 = a2;
        v13 = self;
        v14 = 420;
        goto LABEL_26;
      }
      break;
    case 4uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State is waitingForScenes but we already created UI");
        v12 = a2;
        v13 = self;
        v14 = 423;
        goto LABEL_26;
      }
      break;
    case 5uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State is waitingForHIDServices but we already created UI");
        v12 = a2;
        v13 = self;
        v14 = 426;
        goto LABEL_26;
      }
      break;
    case 6uLL:
      -[SBContinuityDisplayDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:](self, "_initializeUIIfNecessaryForReason:", CFSTR("session state .activating"));
      break;
    case 7uLL:
      if (!self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State moved to updating active display but we haven't initialized the UI yet");
        v12 = a2;
        v13 = self;
        v14 = 433;
        goto LABEL_26;
      }
      break;
    case 8uLL:
      if (!self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State moved to launching but we haven't initialized the UI yet");
        v12 = a2;
        v13 = self;
        v14 = 436;
        goto LABEL_26;
      }
      break;
    case 9uLL:
      if (!self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State moved to flushing but we haven't initialized the UI yet");
        v12 = a2;
        v13 = self;
        v14 = 439;
        goto LABEL_26;
      }
      break;
    case 10uLL:
      if (!self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("State moved to active but we haven't initialized the UI yet");
        v12 = a2;
        v13 = self;
        v14 = 442;
LABEL_26:
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), v14, v11);

      }
      break;
    case 11uLL:
      -[SBContinuityDisplayDelayedUIWindowSceneDelegate _tearDownUIAndInvalidateIfNecessaryForReason:](self, "_tearDownUIAndInvalidateIfNecessaryForReason:", CFSTR("session state is .invalid"));
      break;
    default:
      break;
  }

}

- (void)continuitySession:(id)a3 didUpdateHostedInterfaceOrientation:(int64_t)a4
{
  if (BSInterfaceOrientationIsValid())
    -[SBTraitsContinuityDisplayPipelineManager setDeviceOrientation:](self->_traitsDisplayPipelineManager, "setDeviceOrientation:", a4);
}

- (void)setInterfaceOrientation:(int64_t)a3 supportedInterfaceOrientations:(unint64_t)a4
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBContinuitySession setInterfaceOrientation:supportedInterfaceOrientations:](self->_continuitySession, "setInterfaceOrientation:supportedInterfaceOrientations:", a3, a4);
}

- (void)_initializeUIIfNecessaryForReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  SBWindowScene *connectingScene;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SBWindowScene *v28;
  UISceneSession *connectingSceneSession;
  UISceneConnectionOptions *connectingSceneConnectionOptions;
  SBWindowScene *v31;
  UISceneSession *v32;
  UISceneConnectionOptions *v33;
  SBContinuitySession *continuitySession;
  void *v35;
  SBWindowScene *v36;
  SBContinuitySession *v37;
  __CFString *v38;
  objc_super v39;
  uint8_t buf[4];
  SBWindowScene *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_initializedUI)
  {
    -[SBAbstractWindowSceneDelegate windowScene](self, "windowScene");
    v5 = objc_claimAutoreleasedReturnValue();
    SBLogContinuitySession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject _sceneIdentifier](v5, "_sceneIdentifier");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v41 = (SBWindowScene *)v5;
      v42 = 2114;
      v43 = v7;
      v44 = 2114;
      v45 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ initializing UI if necessary - %{public}@ --> already initialized UI", buf, 0x20u);

    }
  }
  else
  {
    SBLogContinuitySession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      connectingScene = self->_connectingScene;
      -[SBWindowScene _sceneIdentifier](connectingScene, "_sceneIdentifier");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v41 = connectingScene;
      v42 = 2114;
      v43 = v10;
      v44 = 2114;
      v45 = v4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ initializing UI if necessary - %{public}@", buf, 0x20u);

    }
    v11 = -[SBContinuitySession state](self->_continuitySession, "state");
    SBLogContinuitySession();
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v11 == 6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SBContinuityDisplayDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);

      SBLogContinuitySession();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SBContinuityDisplayDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

      v28 = self->_connectingScene;
      connectingSceneSession = self->_connectingSceneSession;
      connectingSceneConnectionOptions = self->_connectingSceneConnectionOptions;
      v39.receiver = self;
      v39.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
      -[SBAbstractWindowSceneDelegate scene:willConnectToSession:options:](&v39, sel_scene_willConnectToSession_options_, v28, connectingSceneSession, connectingSceneConnectionOptions);
      v31 = self->_connectingScene;
      self->_connectingScene = 0;

      v32 = self->_connectingSceneSession;
      self->_connectingSceneSession = 0;

      v33 = self->_connectingSceneConnectionOptions;
      self->_connectingSceneConnectionOptions = 0;

      self->_initializedUI = 1;
      continuitySession = self->_continuitySession;
      -[SBAbstractWindowSceneDelegate windowScene](self, "windowScene");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBContinuitySession noteUIIsReady:](continuitySession, "noteUIIsReady:", v35);

      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject noteContinuityDisplayWindowSceneConnectionDidChange](v5, "noteContinuityDisplayWindowSceneConnectionDidChange");
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SBWindowScene _sceneIdentifier](self->_connectingScene, "_sceneIdentifier");
      v36 = (SBWindowScene *)(id)objc_claimAutoreleasedReturnValue();
      v37 = self->_continuitySession;
      if (v37)
      {
        NSStringFromSBContinuitySessionState(v11);
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = CFSTR(".unknown because we don't have a session yet!");
      }
      *(_DWORD *)buf = 138543618;
      v41 = v36;
      v42 = 2114;
      v43 = v38;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "scene %{public}@ refuses to initialize UI because the session state is %{public}@", buf, 0x16u);
      if (v37)

    }
  }

}

- (void)_tearDownUIAndInvalidateIfNecessaryForReason:(id)a3
{
  id v5;
  SBWindowScene *v6;
  SBWindowScene *connectingScene;
  SBWindowScene *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  SBContinuitySession *continuitySession;
  _BOOL4 initializedUI;
  NSObject *v15;
  _BOOL4 v16;
  BSInvalidatable *eventRoutingAssertion;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SBWindowSceneStatusBarSettingsAssertion *showStatusBarAssertion;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  uint8_t buf[4];
  SBWindowScene *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SBAbstractWindowSceneDelegate windowScene](self, "windowScene");
  v6 = (SBWindowScene *)objc_claimAutoreleasedReturnValue();
  connectingScene = v6;
  if (!v6)
    connectingScene = self->_connectingScene;
  v8 = connectingScene;

  SBLogContinuitySession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SBWindowScene _sceneIdentifier](v8, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v42 = v8;
    v43 = 2114;
    v44 = v10;
    v45 = 2114;
    v46 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ tear down UI and invalidate if necessary - %{public}@", buf, 0x20u);

  }
  if (-[SBAbstractWindowSceneDelegate isInvalidated](self, "isInvalidated"))
  {
    SBLogContinuitySession();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "--> already invalidated", buf, 2u);
    }
  }
  else
  {
    -[SBWindowScene _FBSScene](v8, "_FBSScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "continuityHostProxyClientComponent");
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayDelayedUIWindowSceneDelegate.m"), 506, CFSTR("No SBContinuityHostProxyClientComponent"));

    }
    -[SBContinuitySession removeScreenRecordingObserver:](self->_continuitySession, "removeScreenRecordingObserver:", v11);
    -[SBContinuitySession setOrientationDelegate:](self->_continuitySession, "setOrientationDelegate:", 0);
    -[SBContinuitySession removeStateObserver:](self->_continuitySession, "removeStateObserver:", self);
    continuitySession = self->_continuitySession;
    self->_continuitySession = 0;

    initializedUI = self->_initializedUI;
    SBLogContinuitySession();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (initializedUI)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "--> tearing down UI now...", buf, 2u);
      }

      -[BSDefaultObserver invalidate](self->_displayModeSettingsToken, "invalidate");
      -[BSInvalidatable invalidate](self->_eventRoutingAssertion, "invalidate");
      eventRoutingAssertion = self->_eventRoutingAssertion;
      self->_eventRoutingAssertion = 0;

      +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keyboardFocusController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWindowScene screen](v8, "screen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "displayIdentity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ - %@"), v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "suppressKeyboardFocusEvaluationForReason:", v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBWindowScene setInvalidating:](v8, "setInvalidating:", 1);
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWindowScene switcherController](v8, "switcherController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endCoordinatingSwitcherController:options:", v27, 1);

      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "windowSceneDidDisconnect:", v8);

      -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_showStatusBarAssertion, "invalidate");
      showStatusBarAssertion = self->_showStatusBarAssertion;
      self->_showStatusBarAssertion = 0;

      -[SBAbstractWindowSceneDelegate modalLibraryController](self, "modalLibraryController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "invalidate");

      -[SBAbstractWindowSceneDelegate homeScreenController](self, "homeScreenController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "invalidate");

      -[SBWindowScene systemGestureManager](v8, "systemGestureManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "invalidate");

      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "windowSceneDidDisconnect:", v8);

      +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "windowSceneDidDisconnect:", v8);

      objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "windowSceneDidDisconnect:", v8);

      v40.receiver = self;
      v40.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
      -[SBAbstractWindowSceneDelegate sceneDidDisconnect:](&v40, sel_sceneDidDisconnect_, v8);
      objc_msgSend(v39, "invalidate");
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "noteContinuityDisplayWindowSceneConnectionDidChange");

      -[SBAbstractWindowSceneDelegate sceneManager](self, "sceneManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "invalidate");

      -[SBWindowScene invalidate](v8, "invalidate");
      -[SBAbstractWindowSceneDelegate setInvalidated:](self, "setInvalidated:", 1);

    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "--> never initialized UI", buf, 2u);
      }

      -[SBWindowScene invalidate](v8, "invalidate");
      -[SBAbstractWindowSceneDelegate setInvalidated:](self, "setInvalidated:", 1);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuitySessionManagerRegistration, 0);
  objc_storeStrong((id *)&self->_continuitySession, 0);
  objc_storeStrong((id *)&self->_connectingSceneConnectionOptions, 0);
  objc_storeStrong((id *)&self->_connectingSceneSession, 0);
  objc_storeStrong((id *)&self->_connectingScene, 0);
  objc_storeStrong((id *)&self->_presentationBinderWindow, 0);
  objc_storeStrong((id *)&self->_eventRoutingAssertion, 0);
  objc_storeStrong((id *)&self->_displayModeSettingsToken, 0);
  objc_storeStrong((id *)&self->_showStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenController, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_traitsDisplayPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsWindowParticipantsDelegate, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)sceneWillEnterForeground:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "scene will enter foreground", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_initializeUIIfNecessaryForReason:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "--> initializing UI !!!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_initializeUIIfNecessaryForReason:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "--> state is .activating", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
