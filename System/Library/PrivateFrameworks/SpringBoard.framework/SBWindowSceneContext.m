@implementation SBWindowSceneContext

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(v4, "transientOverlayPresenterForWindowScene:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientOverlayPresenting *)v6;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return self->_layoutStateTransitionCoordinator;
}

- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController
{
  SBMedusaHostedKeyboardWindowController *medusaHostedKeyboardWindowController;
  SBMedusaHostedKeyboardWindowController *v4;
  id WeakRetained;
  SBMedusaHostedKeyboardWindowController *v6;
  SBMedusaHostedKeyboardWindowController *v7;

  medusaHostedKeyboardWindowController = self->_medusaHostedKeyboardWindowController;
  if (!medusaHostedKeyboardWindowController)
  {
    v4 = [SBMedusaHostedKeyboardWindowController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    v6 = -[SBMedusaHostedKeyboardWindowController initWithWindowScene:](v4, "initWithWindowScene:", WeakRetained);
    v7 = self->_medusaHostedKeyboardWindowController;
    self->_medusaHostedKeyboardWindowController = v6;

    medusaHostedKeyboardWindowController = self->_medusaHostedKeyboardWindowController;
  }
  return medusaHostedKeyboardWindowController;
}

- (SBFloatingDockController)floatingDockController
{
  return self->_floatingDockController;
}

- (SBSwitcherController)switcherController
{
  return self->_switcherController;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  return self->_layoutStateProvider;
}

- (SBWindowScenePIPManager)pictureInPictureManager
{
  return self->_pictureInPictureManager;
}

- (SBSceneManager)sceneManager
{
  SBSceneManager *sceneManager;
  void *v6;

  sceneManager = self->_sceneManager;
  if (!sceneManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneContext.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sceneManager"));

    sceneManager = self->_sceneManager;
  }
  return sceneManager;
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  return self->_recordingIndicatorManager;
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (SBModalLibraryController)modalLibraryController
{
  return self->_modalLibraryController;
}

- (SBMainDisplayLayoutStateManager)layoutStateManager
{
  return self->_layoutStateManager;
}

- (SBLockStateProviding)uiLockStateProvider
{
  return self->_uiLockStateProvider;
}

- (SBSystemPointerInteractionManager)systemPointerInteractionManager
{
  return self->_systemPointerInteractionManager;
}

- (SBLockScreenManager)lockScreenManager
{
  return +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
}

- (BNBannerController)bannerController
{
  BNBannerController *bannerController;
  void *v4;
  id WeakRetained;
  BNBannerController *v6;
  BNBannerController *v7;

  bannerController = self->_bannerController;
  if (!bannerController)
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    v6 = (BNBannerController *)objc_msgSend(v4, "newBannerControllerForWindowScene:", WeakRetained);
    v7 = self->_bannerController;
    self->_bannerController = v6;

    bannerController = self->_bannerController;
  }
  return bannerController;
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (SBSystemApertureController)systemApertureController
{
  return self->_systemApertureController;
}

- (SBWindowHidingManager)windowHidingManager
{
  return self->_windowHidingManager;
}

- (SBTraitsPipelineManager)traitsPipelineManager
{
  return self->_traitsPipelineManager;
}

- (TRAArbiter)traitsArbiter
{
  return self->_traitsArbiter;
}

- (SBWindowSceneContext)initWithScene:(id)a3
{
  id v5;
  SBWindowSceneContext *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneContext.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scene isKindOfClass:[SBWindowScene class]]"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBWindowSceneContext;
  v6 = -[SBWindowSceneContext init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_opt_class();
    SBSafeCast(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_sbWindowScene, v8);

  }
  return v6;
}

- (void)_setScene:(id)a3
{
  SBWindowScene **p_sbWindowScene;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  p_sbWindowScene = &self->_sbWindowScene;
  WeakRetained = objc_loadWeakRetained((id *)p_sbWindowScene);

  if (WeakRetained != v8)
  {
    v6 = objc_opt_class();
    SBSafeCast(v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_sbWindowScene, v7);

  }
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (SBAlertItemsController)alertItemsController
{
  return +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
}

- (SBDisplayAppInteractionEventSource)appInteractionEventSource
{
  void *v3;
  id WeakRetained;
  void *v5;

  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(v3, "eventSourceForWindowScene:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDisplayAppInteractionEventSource *)v5;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  SBFAuthenticationStatusProvider *authenticationStatusProvider;
  SBFAuthenticationStatusProvider *v4;
  SBFAuthenticationStatusProvider *v5;

  authenticationStatusProvider = self->_authenticationStatusProvider;
  if (!authenticationStatusProvider)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v4 = (SBFAuthenticationStatusProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_authenticationStatusProvider;
    self->_authenticationStatusProvider = v4;

    authenticationStatusProvider = self->_authenticationStatusProvider;
  }
  return authenticationStatusProvider;
}

- (SBControlCenterController)controlCenterController
{
  return +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
}

- (CSCoverSheetViewController)coverSheetViewController
{
  void *v2;
  void *v3;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSCoverSheetViewController *)v3;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  return (SBModalAlertPresentationCoordinator *)objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
}

- (SBFSecureDisplayStateProviding)secureDisplayStateProvider
{
  SBFSecureDisplayStateProviding *secureDisplayStateProvider;
  SBFSecureDisplayStateProviding *v4;
  SBFSecureDisplayStateProviding *v5;

  secureDisplayStateProvider = self->_secureDisplayStateProvider;
  if (!secureDisplayStateProvider)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v4 = (SBFSecureDisplayStateProviding *)objc_claimAutoreleasedReturnValue();
    v5 = self->_secureDisplayStateProvider;
    self->_secureDisplayStateProvider = v4;

    secureDisplayStateProvider = self->_secureDisplayStateProvider;
  }
  return secureDisplayStateProvider;
}

- (SBWallpaperController)wallpaperController
{
  return +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
}

- (SBAssistantSceneControlling)assistantController
{
  return self->_assistantController;
}

- (void)setAssistantController:(id)a3
{
  objc_storeStrong((id *)&self->_assistantController, a3);
}

- (void)setAuthenticationStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, a3);
}

- (void)setDisplayLayoutPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutPublisher, a3);
}

- (void)setFloatingDockController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockController, a3);
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  return self->_homeAffordanceInteractionManager;
}

- (void)setHomeAffordanceInteractionManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceInteractionManager, a3);
}

- (SBHomeScreenController)homeScreenController
{
  return self->_homeScreenController;
}

- (void)setHomeScreenController:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenController, a3);
}

- (void)setLayoutStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStateProvider, a3);
}

- (void)setLayoutStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStateManager, a3);
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, a3);
}

- (SBLockedPointerManager)lockedPointerManager
{
  return self->_lockedPointerManager;
}

- (void)setLockedPointerManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockedPointerManager, a3);
}

- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager
{
  return self->_modalUIFluidDismissGestureManager;
}

- (void)setModalUIFluidDismissGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_modalUIFluidDismissGestureManager, a3);
}

- (void)setPictureInPictureManager:(id)a3
{
  objc_storeStrong((id *)&self->_pictureInPictureManager, a3);
}

- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider
{
  return self->_reachabilitySceneOffsetProvider;
}

- (void)setReachabilitySceneOffsetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilitySceneOffsetProvider, a3);
}

- (void)setRecordingIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorManager, a3);
}

- (void)setSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManager, a3);
}

- (void)setSecureDisplayStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_secureDisplayStateProvider, a3);
}

- (void)setSystemApertureController:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureController, a3);
}

- (void)setSwitcherController:(id)a3
{
  objc_storeStrong((id *)&self->_switcherController, a3);
}

- (void)setSystemGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemGestureManager, a3);
}

- (void)setTraitsArbiter:(id)a3
{
  objc_storeStrong((id *)&self->_traitsArbiter, a3);
}

- (void)setTraitsPipelineManager:(id)a3
{
  objc_storeStrong((id *)&self->_traitsPipelineManager, a3);
}

- (void)setWindowHidingManager:(id)a3
{
  objc_storeStrong((id *)&self->_windowHidingManager, a3);
}

- (SBFZStackResolver)zStackResolver
{
  return self->_zStackResolver;
}

- (void)setZStackResolver:(id)a3
{
  objc_storeStrong((id *)&self->_zStackResolver, a3);
}

- (SBTransientUIInteractionManager)transientUIInteractionManager
{
  return self->_transientUIInteractionManager;
}

- (void)setTransientUIInteractionManager:(id)a3
{
  objc_storeStrong((id *)&self->_transientUIInteractionManager, a3);
}

- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator
{
  return self->_hardwareButtonBezelEffectsCoordinator;
}

- (void)setHardwareButtonBezelEffectsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonBezelEffectsCoordinator, a3);
}

- (SBAmbientPresentationController)ambientPresentationController
{
  return self->_ambientPresentationController;
}

- (void)setAmbientPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_ambientPresentationController, a3);
}

- (void)setModalLibraryController:(id)a3
{
  objc_storeStrong((id *)&self->_modalLibraryController, a3);
}

- (void)setUILockStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiLockStateProvider, a3);
}

- (void)setSystemPointerInteractionManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, a3);
}

- (SBUICommandValidating)commandValidator
{
  return self->_commandValidator;
}

- (void)setCommandValidator:(id)a3
{
  objc_storeStrong((id *)&self->_commandValidator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandValidator, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, 0);
  objc_storeStrong((id *)&self->_uiLockStateProvider, 0);
  objc_storeStrong((id *)&self->_modalLibraryController, 0);
  objc_storeStrong((id *)&self->_ambientPresentationController, 0);
  objc_storeStrong((id *)&self->_hardwareButtonBezelEffectsCoordinator, 0);
  objc_storeStrong((id *)&self->_transientUIInteractionManager, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_windowHidingManager, 0);
  objc_storeStrong((id *)&self->_traitsPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsArbiter, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_switcherController, 0);
  objc_storeStrong((id *)&self->_systemApertureController, 0);
  objc_storeStrong((id *)&self->_secureDisplayStateProvider, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorManager, 0);
  objc_storeStrong((id *)&self->_reachabilitySceneOffsetProvider, 0);
  objc_storeStrong((id *)&self->_pictureInPictureManager, 0);
  objc_storeStrong((id *)&self->_modalUIFluidDismissGestureManager, 0);
  objc_storeStrong((id *)&self->_lockedPointerManager, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_layoutStateManager, 0);
  objc_storeStrong((id *)&self->_layoutStateProvider, 0);
  objc_storeStrong((id *)&self->_homeScreenController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceInteractionManager, 0);
  objc_storeStrong((id *)&self->_floatingDockController, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_bannerController, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowController, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

@end
