@implementation SBAssistantContext

+ (id)contextForWindowScene:(id)a3
{
  id v3;
  SBAssistantContext *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = objc_alloc_init(SBAssistantContext);
  objc_msgSend(v3, "traitsArbiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setTraitsArbiter:](v4, "setTraitsArbiter:", v5);

  objc_msgSend(v3, "coverSheetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setCoverSheetViewController:](v4, "setCoverSheetViewController:", v6);

  objc_msgSend(v3, "displayLayoutPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setDisplayLayoutPublisher:](v4, "setDisplayLayoutPublisher:", v7);

  objc_msgSend(v3, "lockScreenManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockScreenEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setLockScreenEnvironment:](v4, "setLockScreenEnvironment:", v9);

  objc_msgSend(v3, "alertItemsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setAlertItemsController:](v4, "setAlertItemsController:", v10);

  objc_msgSend(v3, "coverSheetPresentationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setCoverSheetPresentationManager:](v4, "setCoverSheetPresentationManager:", v11);

  objc_msgSend(v3, "floatingDockController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setFloatingDockController:](v4, "setFloatingDockController:", v12);

  objc_msgSend(v3, "zStackResolver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setZStackResolver:](v4, "setZStackResolver:", v13);

  objc_msgSend(v3, "systemApertureController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setSystemApertureController:](v4, "setSystemApertureController:", v14);

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setIconController:](v4, "setIconController:", v15);

  objc_msgSend(v3, "lockScreenManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setLockScreenManager:](v4, "setLockScreenManager:", v16);

  objc_msgSend(v3, "switcherController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setSwitcherController:](v4, "setSwitcherController:", v17);

  objc_msgSend(v3, "modalAlertPresentationCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setModalAlertPresentationCoordinator:](v4, "setModalAlertPresentationCoordinator:", v18);

  objc_msgSend(v3, "systemGestureManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setSystemGestureManager:](v4, "setSystemGestureManager:", v19);

  objc_msgSend(v3, "transientOverlayPresenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setTransientOverlayPresenter:](v4, "setTransientOverlayPresenter:", v20);

  objc_msgSend(v3, "wallpaperController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setWallpaperController:](v4, "setWallpaperController:", v21);

  objc_msgSend(v3, "windowHidingManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantContext setWindowHidingManager:](v4, "setWindowHidingManager:", v22);

  objc_msgSend(v3, "controlCenterController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAssistantContext setControlCenterController:](v4, "setControlCenterController:", v23);
  -[SBAssistantContext setOrientationAccomodation:](v4, "setOrientationAccomodation:", SBApp);
  return v4;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return self->_coverSheetViewController;
}

- (void)setCoverSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetViewController, a3);
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (void)setDisplayLayoutPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutPublisher, a3);
}

- (SBLockScreenEnvironment)lockScreenEnvironment
{
  return self->_lockScreenEnvironment;
}

- (void)setLockScreenEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenEnvironment, a3);
}

- (SBAlertItemsController)alertItemsController
{
  return self->_alertItemsController;
}

- (void)setAlertItemsController:(id)a3
{
  objc_storeStrong((id *)&self->_alertItemsController, a3);
}

- (SBControlCenterController)controlCenterController
{
  return self->_controlCenterController;
}

- (void)setControlCenterController:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterController, a3);
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return self->_coverSheetPresentationManager;
}

- (void)setCoverSheetPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, a3);
}

- (SBFloatingDockController)floatingDockController
{
  return self->_floatingDockController;
}

- (void)setFloatingDockController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockController, a3);
}

- (SBSystemApertureController)systemApertureController
{
  return self->_systemApertureController;
}

- (void)setSystemApertureController:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureController, a3);
}

- (TRAArbiter)traitsArbiter
{
  return self->_traitsArbiter;
}

- (void)setTraitsArbiter:(id)a3
{
  objc_storeStrong((id *)&self->_traitsArbiter, a3);
}

- (SBFZStackResolver)zStackResolver
{
  return self->_zStackResolver;
}

- (void)setZStackResolver:(id)a3
{
  objc_storeStrong((id *)&self->_zStackResolver, a3);
}

- (SBIconController)iconController
{
  return self->_iconController;
}

- (void)setIconController:(id)a3
{
  objc_storeStrong((id *)&self->_iconController, a3);
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenManager, a3);
}

- (SBSwitcherController)switcherController
{
  return self->_switcherController;
}

- (void)setSwitcherController:(id)a3
{
  objc_storeStrong((id *)&self->_switcherController, a3);
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  return self->_modalAlertPresentationCoordinator;
}

- (void)setModalAlertPresentationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_modalAlertPresentationCoordinator, a3);
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (void)setSystemGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemGestureManager, a3);
}

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  return self->_transientOverlayPresenter;
}

- (void)setTransientOverlayPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_transientOverlayPresenter, a3);
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (void)setWallpaperController:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperController, a3);
}

- (SBWindowHidingManager)windowHidingManager
{
  return self->_windowHidingManager;
}

- (void)setWindowHidingManager:(id)a3
{
  objc_storeStrong((id *)&self->_windowHidingManager, a3);
}

- (SBAssistantOrientationAccomodating)orientationAccomodation
{
  return self->_orientationAccomodation;
}

- (void)setOrientationAccomodation:(id)a3
{
  objc_storeStrong((id *)&self->_orientationAccomodation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationAccomodation, 0);
  objc_storeStrong((id *)&self->_windowHidingManager, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_transientOverlayPresenter, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_modalAlertPresentationCoordinator, 0);
  objc_storeStrong((id *)&self->_switcherController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_traitsArbiter, 0);
  objc_storeStrong((id *)&self->_systemApertureController, 0);
  objc_storeStrong((id *)&self->_floatingDockController, 0);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_controlCenterController, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end
