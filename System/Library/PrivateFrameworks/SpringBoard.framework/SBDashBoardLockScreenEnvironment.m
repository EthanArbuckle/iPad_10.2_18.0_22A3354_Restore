@implementation SBDashBoardLockScreenEnvironment

- (BOOL)isHostingAnApp
{
  return -[CSCoverSheetViewController isHostingAnApp](self->_coverSheetViewController, "isHostingAnApp");
}

- (UIViewController)rootViewController
{
  return (UIViewController *)self->_coverSheetViewController;
}

- (SBDashBoardLockScreenEnvironment)init
{
  SBDefaultCoverSheetContext *v3;
  void *v4;
  void *v5;
  SBDefaultCoverSheetContext *v6;
  id v7;
  void *v8;
  void *v9;
  SBDashBoardCameraPageViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  SBDashBoardCameraPageViewController *cameraPageViewController;
  SBDashBoardCameraPageViewController *v15;
  id v16;
  void *v17;
  void *v18;
  SBDashBoardLockScreenEnvironment *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = [SBDefaultCoverSheetContext alloc];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBDefaultCoverSheetContext initWithWindowScene:](v3, "initWithWindowScene:", v5);

  v7 = objc_alloc(MEMORY[0x1E0D1BBE8]);
  objc_msgSend((id)SBApp, "authenticationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithAuthenticationProvider:", v8);

  v10 = objc_alloc_init(SBDashBoardCameraPageViewController);
  -[SBDashBoardCameraPageViewController setCameraPageDelegate:](v10, "setCameraPageDelegate:", self);
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v21[0] = v9;
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  cameraPageViewController = self->_cameraPageViewController;
  self->_cameraPageViewController = v10;
  v15 = v10;

  v16 = objc_alloc(MEMORY[0x1E0D1BBA0]);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v16, "initWithPageViewControllers:mainPageContentViewController:context:", v17, v9, v6);
  v19 = -[SBDashBoardLockScreenEnvironment initWithCoverSheetViewController:](self, "initWithCoverSheetViewController:", v18);

  return v19;
}

- (SBDashBoardLockScreenEnvironment)initWithCoverSheetViewController:(id)a3
{
  id v5;
  SBDashBoardLockScreenEnvironment *v6;
  SBDashBoardLockScreenEnvironment *v7;
  CSCoverSheetViewController **p_coverSheetViewController;
  SBDashBoardAnalyticsEmitter *v9;
  SBDashBoardAnalyticsEmitter *analyticsEmitter;
  SBDashBoardOrientationController *v11;
  SBDashBoardOrientationController *orientationController;
  void *v13;
  uint64_t v14;
  SBDashBoardCaptureLaunchPolicy *captureLaunchPolicy;
  __objc2_class *v16;
  SBDashBoardCaptureLaunchPolicy *v17;
  SBDashBoardApplicationLauncher *v18;
  SBDashBoardApplicationLauncher *applicationLauncher;
  SBDashBoardApplicationLauncher *v20;
  void *v21;
  SBDashBoardWidgetURLHandler *v22;
  SBDashBoardWidgetURLHandler *widgetURLHandler;
  SBLockScreenActionManager *v24;
  SBLockScreenActionManager *lockScreenActionManager;
  SBDashBoardEmergencyDialerController *v26;
  SBDashBoardEmergencyDialerController *emergencyDialerController;
  SBDashBoardPluginController *v28;
  SBDashBoardPluginController *pluginController;
  SBLockScreenActionManager *v30;
  void *v31;
  void *v32;
  void *v33;
  SBDashBoardPolicyBasedBehaviorProvider *v34;
  SBDashBoardPolicyBasedBehaviorProvider *policyBasedBehaviorProvider;
  SBDashBoardSetupController *v36;
  CSCoverSheetViewController *coverSheetViewController;
  void *v38;
  uint64_t v39;
  SBDashBoardSetupController *setupController;
  SBDashBoardBiometricUnlockController *v41;
  SBDashBoardBiometricUnlockController *biometricUnlockController;
  SBDashBoardIdleTimerController *v43;
  SBDashBoardIdleTimerController *idleTimerController;
  SBCoverSheetSpotlightPresenter *v45;
  SBCoverSheetSpotlightPresenter *coverSheetSpotlightPresenter;
  void *v47;
  uint64_t v48;
  SBSearchGesture *v49;
  SBSearchGesture *searchGesture;
  void *v51;
  SBBacklightSignificantUserInteractionMonitor *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  objc_super v60;

  v5 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SBDashBoardLockScreenEnvironment;
  v6 = -[SBDashBoardLockScreenEnvironment init](&v60, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_23;
  p_coverSheetViewController = &v6->_coverSheetViewController;
  objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
  -[CSCoverSheetViewController addCoverSheetObserver:](v7->_coverSheetViewController, "addCoverSheetObserver:", v7);
  v9 = -[SBDashBoardAnalyticsEmitter initWithCoverSheetViewController:]([SBDashBoardAnalyticsEmitter alloc], "initWithCoverSheetViewController:", v7->_coverSheetViewController);
  analyticsEmitter = v7->_analyticsEmitter;
  v7->_analyticsEmitter = v9;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")) & 1) == 0)
  {
    v11 = objc_alloc_init(SBDashBoardOrientationController);
    orientationController = v7->_orientationController;
    v7->_orientationController = v11;

    -[CSCoverSheetViewController setOrientationUpdateController:](v7->_coverSheetViewController, "setOrientationUpdateController:", v7->_orientationController);
  }
  if (LCSFeatureEnabled())
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDashBoardExtensionWhileLockedCapturePolicy policyWithAuthenticationStatusProvider:](SBDashBoardExtensionWhileLockedCapturePolicy, "policyWithAuthenticationStatusProvider:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      captureLaunchPolicy = v7->_captureLaunchPolicy;
      v7->_captureLaunchPolicy = (SBDashBoardCaptureLaunchPolicy *)v14;

      goto LABEL_12;
    }
    if (_os_feature_enabled_impl())
      v16 = SBDashBoardExtensionAlwaysCapturePolicy;
    else
      v16 = SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy;
  }
  else
  {
    v16 = SBDashBoardCameraOnlyLaunchPolicy;
  }
  v17 = (SBDashBoardCaptureLaunchPolicy *)objc_alloc_init(v16);
  v13 = v7->_captureLaunchPolicy;
  v7->_captureLaunchPolicy = v17;
LABEL_12:

  -[SBDashBoardCaptureLaunchPolicy addLaunchPolicyObserver:](v7->_captureLaunchPolicy, "addLaunchPolicyObserver:", v7);
  v18 = objc_alloc_init(SBDashBoardApplicationLauncher);
  applicationLauncher = v7->_applicationLauncher;
  v7->_applicationLauncher = v18;

  -[SBDashBoardApplicationLauncher setCoverSheetViewController:](v7->_applicationLauncher, "setCoverSheetViewController:", v7->_coverSheetViewController);
  v20 = v7->_applicationLauncher;
  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardApplicationLauncher setSecureAppManager:](v20, "setSecureAppManager:", v21);

  -[SBDashBoardApplicationLauncher setCaptureLaunchPolicy:](v7->_applicationLauncher, "setCaptureLaunchPolicy:", v7->_captureLaunchPolicy);
  -[CSCoverSheetViewController setCameraPrewarmer:](v7->_coverSheetViewController, "setCameraPrewarmer:", v7->_applicationLauncher);
  -[CSCoverSheetViewController setApplicationLauncher:](v7->_coverSheetViewController, "setApplicationLauncher:", v7->_applicationLauncher);
  v22 = objc_alloc_init(SBDashBoardWidgetURLHandler);
  widgetURLHandler = v7->_widgetURLHandler;
  v7->_widgetURLHandler = v22;

  -[CSCoverSheetViewController setWidgetURLHandler:](v7->_coverSheetViewController, "setWidgetURLHandler:", v7->_widgetURLHandler);
  v24 = objc_alloc_init(SBLockScreenActionManager);
  lockScreenActionManager = v7->_lockScreenActionManager;
  v7->_lockScreenActionManager = v24;

  -[SBLockScreenActionManager registerLockScreenActionProvider:forSource:](v7->_lockScreenActionManager, "registerLockScreenActionProvider:forSource:", v7->_coverSheetViewController, 1);
  v26 = -[SBDashBoardEmergencyDialerController initWithCoverSheetViewController:]([SBDashBoardEmergencyDialerController alloc], "initWithCoverSheetViewController:", v7->_coverSheetViewController);
  emergencyDialerController = v7->_emergencyDialerController;
  v7->_emergencyDialerController = v26;

  -[CSCoverSheetViewController setEmergencyCaller:](v7->_coverSheetViewController, "setEmergencyCaller:", v7->_emergencyDialerController);
  v28 = -[SBDashBoardPluginController initWithCoverSheetViewController:]([SBDashBoardPluginController alloc], "initWithCoverSheetViewController:", v7->_coverSheetViewController);
  pluginController = v7->_pluginController;
  v7->_pluginController = v28;

  v30 = v7->_lockScreenActionManager;
  -[SBDashBoardPluginController lockScreenActionProvider](v7->_pluginController, "lockScreenActionProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenActionManager registerLockScreenActionProvider:forSource:](v30, "registerLockScreenActionProvider:forSource:", v31, 11);

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "policyAggregator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = -[SBDashBoardPolicyBasedBehaviorProvider initWithCoverSheetViewController:policyAggregator:]([SBDashBoardPolicyBasedBehaviorProvider alloc], "initWithCoverSheetViewController:policyAggregator:", v7->_coverSheetViewController, v33);
  policyBasedBehaviorProvider = v7->_policyBasedBehaviorProvider;
  v7->_policyBasedBehaviorProvider = v34;

  v36 = [SBDashBoardSetupController alloc];
  coverSheetViewController = v7->_coverSheetViewController;
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[SBDashBoardSetupController initWithCoverSheetViewController:setupManager:](v36, "initWithCoverSheetViewController:setupManager:", coverSheetViewController, v38);
  setupController = v7->_setupController;
  v7->_setupController = (SBDashBoardSetupController *)v39;

  v41 = -[SBDashBoardBiometricUnlockController initWithCoverSheetViewController:]([SBDashBoardBiometricUnlockController alloc], "initWithCoverSheetViewController:", v7->_coverSheetViewController);
  biometricUnlockController = v7->_biometricUnlockController;
  v7->_biometricUnlockController = v41;

  -[SBDashBoardBiometricUnlockController setBiometricUnlockBehaviorDelegate:](v7->_biometricUnlockController, "setBiometricUnlockBehaviorDelegate:", v7);
  v43 = -[SBDashBoardIdleTimerController initWithCoverSheetViewController:]([SBDashBoardIdleTimerController alloc], "initWithCoverSheetViewController:", v7->_coverSheetViewController);
  idleTimerController = v7->_idleTimerController;
  v7->_idleTimerController = v43;

  -[CSCoverSheetViewController setIdleTimerController:](v7->_coverSheetViewController, "setIdleTimerController:", v7->_idleTimerController);
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "userInterfaceIdiom");

    if (v48 != 1)
      goto LABEL_14;
LABEL_16:
    v49 = (SBSearchGesture *)objc_alloc_init(MEMORY[0x1E0DAA668]);
    searchGesture = v7->_searchGesture;
    v7->_searchGesture = v49;

    -[SBSearchGesture setDelegate:](v7->_searchGesture, "setDelegate:", v7->_coverSheetViewController);
    -[CSCoverSheetViewController setSearchGesture:](v7->_coverSheetViewController, "setSearchGesture:", v7->_searchGesture);
    goto LABEL_17;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_16;
LABEL_14:
  v45 = -[SBCoverSheetSpotlightPresenter initWithDelegate:]([SBCoverSheetSpotlightPresenter alloc], "initWithDelegate:", v7->_coverSheetViewController);
  coverSheetSpotlightPresenter = v7->_coverSheetSpotlightPresenter;
  v7->_coverSheetSpotlightPresenter = v45;

  -[CSCoverSheetViewController setCoverSheetSpotlightPresenter:](v7->_coverSheetViewController, "setCoverSheetSpotlightPresenter:", v7->_coverSheetSpotlightPresenter);
LABEL_17:
  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "registerBacklightSceneHostEnvironmentProvider:", *p_coverSheetViewController);
  v52 = objc_alloc_init(SBBacklightSignificantUserInteractionMonitor);
  -[SBBacklightSignificantUserInteractionMonitor setCoverSheetViewController:](v52, "setCoverSheetViewController:", *p_coverSheetViewController);
  objc_msgSend((id)SBApp, "blshService");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "platformProvider");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_opt_class();
  v56 = v54;
  if (v55)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = v56;
    else
      v57 = 0;
  }
  else
  {
    v57 = 0;
  }
  v58 = v57;

  objc_msgSend(v58, "setSignificantUserInteractionMonitor:", v52);
LABEL_23:

  return v7;
}

- (SBIdleTimerProviding)idleTimerProvider
{
  return (SBIdleTimerProviding *)self->_idleTimerController;
}

- (SBFScreenWakeAnimationTarget)screenWakeAnimationTarget
{
  return (SBFScreenWakeAnimationTarget *)-[CSCoverSheetViewController legacyWallpaperWakeAnimator](self->_coverSheetViewController, "legacyWallpaperWakeAnimator");
}

- (SBLockScreenApplicationLaunching)applicationLauncher
{
  return (SBLockScreenApplicationLaunching *)self->_applicationLauncher;
}

- (SBLockScreenCallHandling)callController
{
  return (SBLockScreenCallHandling *)self->_emergencyDialerController;
}

- (SBLockScreenIdleTimerControlling)idleTimerController
{
  return (SBLockScreenIdleTimerControlling *)self->_idleTimerController;
}

- (SBLockScreenPluginPresenting)pluginPresenter
{
  return (SBLockScreenPluginPresenting *)self->_pluginController;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return (SBSWidgetMetricsProviding *)-[CSCoverSheetViewController widgetMetricsProvider](self->_coverSheetViewController, "widgetMetricsProvider");
}

- (NSString)description
{
  return (NSString *)-[SBDashBoardLockScreenEnvironment descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDashBoardLockScreenEnvironment succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_coverSheetViewController, CFSTR("coverSheetViewController"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_orientationController, CFSTR("orientationController"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDashBoardLockScreenEnvironment descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultHostableEntityForActivationOfCamera:(id)a3
{
  SBDeviceApplicationSceneEntity *v4;
  void *v5;
  void *v6;
  SBDeviceApplicationSceneEntity *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;

  v4 = [SBDeviceApplicationSceneEntity alloc];
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v4, "initWithApplicationForMainDisplay:", v6);

  -[SBDashBoardCaptureLaunchPolicy resolveCameraDestinationLaunchOf:fromSource:](self->_captureLaunchPolicy, "resolveCameraDestinationLaunchOf:fromSource:", v7, SBDashBoardCaptureLaunchSourceCameraPage);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "placement"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", SBDashBoardCapturePlacementCameraPage),
        v10,
        (v11 & 1) == 0))
  {
    SBLogDashBoard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBDashBoardLockScreenEnvironment defaultHostableEntityForActivationOfCamera:].cold.1(v9, v13);

    v12 = 0;
  }
  else
  {
    objc_msgSend(v9, "entity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)captureLaunchPolicyDidUpdatePolicy:(id)a3
{
  -[SBDashBoardCameraPageViewController noteDefaultHostableEntityMayHaveChanged](self->_cameraPageViewController, "noteDefaultHostableEntityMayHaveChanged", a3);
}

- (BOOL)canHostAnApp
{
  return -[CSCoverSheetViewController canHostAnApp](self->_coverSheetViewController, "canHostAnApp");
}

- (id)hostedAppSceneHandle
{
  return (id)-[CSCoverSheetViewController hostedAppSceneHandle](self->_coverSheetViewController, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  return (id)-[CSCoverSheetViewController hostedAppSceneHandles](self->_coverSheetViewController, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  -[CSCoverSheetViewController hostedAppWillRotateToInterfaceOrientation:](self->_coverSheetViewController, "hostedAppWillRotateToInterfaceOrientation:", a3);
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  return -[CSCoverSheetViewController shouldAutoUnlockForSource:](self->_coverSheetViewController, "shouldAutoUnlockForSource:", *(_QWORD *)&a3);
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  -[CSCoverSheetViewController handleBiometricEvent:](self->_coverSheetViewController, "handleBiometricEvent:");
  -[SBDashBoardBiometricUnlockController handleBiometricEvent:](self->_biometricUnlockController, "handleBiometricEvent:", a3);
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[SBDashBoardLockScreenEnvironment biometricUnlockBehaviorDelegate](self, "biometricUnlockBehaviorDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "biometricUnlockBehavior:requestsFeedback:", self, v5);

  return (char)self;
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPoseidonSupport");

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = objc_msgSend(v11, "hasBeenDismissedSinceKeybagLockAndAuthenticated");
  else
    v13 = objc_msgSend(v11, "hasBeenDismissedSinceKeybagLock");
  v14 = v13;

  if ((v14 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    -[SBDashBoardLockScreenEnvironment biometricUnlockBehaviorDelegate](self, "biometricUnlockBehaviorDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "biometricUnlockBehavior:requestsUnlock:withFeedback:", self, v7, v8);

  }
  return v15;
}

- (BOOL)handleHomeButtonPress
{
  return -[CSCoverSheetViewController handleHomeButtonPress](self->_coverSheetViewController, "handleHomeButtonPress");
}

- (BOOL)handleHomeButtonDoublePress
{
  return -[CSCoverSheetViewController handleHomeButtonDoublePress](self->_coverSheetViewController, "handleHomeButtonDoublePress");
}

- (BOOL)handleHomeButtonLongPress
{
  return -[CSCoverSheetViewController handleHomeButtonLongPress](self->_coverSheetViewController, "handleHomeButtonLongPress");
}

- (BOOL)handleLockButtonPress
{
  -[SBDashBoardBiometricUnlockController noteLockButtonDown](self->_biometricUnlockController, "noteLockButtonDown");
  return -[CSCoverSheetViewController handleLockButtonPress](self->_coverSheetViewController, "handleLockButtonPress");
}

- (BOOL)handleVoiceCommandButtonPress
{
  return -[CSCoverSheetViewController handleVoiceCommandButtonPress](self->_coverSheetViewController, "handleVoiceCommandButtonPress");
}

- (BOOL)handleVolumeUpButtonPress
{
  return -[CSCoverSheetViewController handleVolumeUpButtonPress](self->_coverSheetViewController, "handleVolumeUpButtonPress");
}

- (BOOL)handleVolumeDownButtonPress
{
  return -[CSCoverSheetViewController handleVolumeDownButtonPress](self->_coverSheetViewController, "handleVolumeDownButtonPress");
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return -[CSCoverSheetViewController handleHeadsetButtonPress:](self->_coverSheetViewController, "handleHeadsetButtonPress:", a3);
}

- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4
{
  -[SBDashBoardLockScreenEnvironment _setExpectsFaceContact:](self, "_setExpectsFaceContact:", objc_msgSend(a4, "proximityDetectionMode", a3) == 2);
}

- (BOOL)isInScreenOffMode
{
  return -[CSCoverSheetViewController isInScreenOffMode](self->_coverSheetViewController, "isInScreenOffMode");
}

- (void)setInScreenOffMode:(BOOL)a3
{
  -[SBDashBoardLockScreenEnvironment setInScreenOffMode:forAutoUnlock:fromUnlockSource:](self, "setInScreenOffMode:forAutoUnlock:fromUnlockSource:", a3, 0, 0);
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
  -[SBDashBoardLockScreenEnvironment setInScreenOffMode:forAutoUnlock:fromUnlockSource:preservingCoverSheetPresentationState:](self, "setInScreenOffMode:forAutoUnlock:fromUnlockSource:preservingCoverSheetPresentationState:", a3, a4, *(_QWORD *)&a5, 0);
}

- (void)setInScreenOffMode:(BOOL)a3 preservingCoverSheetPresentationState:(BOOL)a4
{
  -[SBDashBoardLockScreenEnvironment setInScreenOffMode:forAutoUnlock:fromUnlockSource:preservingCoverSheetPresentationState:](self, "setInScreenOffMode:forAutoUnlock:fromUnlockSource:preservingCoverSheetPresentationState:", a3, 0, 0, a4);
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5 preservingCoverSheetPresentationState:(BOOL)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  int v21;
  _DWORD v22[2];
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance", a3, a4, *(_QWORD *)&a5, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forState:", 0, *MEMORY[0x1E0DAB708]);

    +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postEventToInterestedObservers:", *MEMORY[0x1E0DAB6F0]);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("SBLockScreenUndimmedNotification"), 0);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithAnimation:", &__block_literal_global_352);
  +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forState:", 1, *MEMORY[0x1E0DAB708]);

  +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postEventToInterestedObservers:", *MEMORY[0x1E0DAB6E8]);

  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("SBLockScreenDimmedNotification"), 0);

    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCoverSheetPresented:animated:withCompletion:", 1, 0, 0);
LABEL_5:

  }
  -[CSCoverSheetViewController setInScreenOffMode:forAutoUnlock:fromUnlockSource:](self->_coverSheetViewController, "setInScreenOffMode:forAutoUnlock:fromUnlockSource:", v8, v7, v6);
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "screenIsOn");
  v19 = v18 ^ 1;

  if ((v18 ^ 1) != v8
    || v18 == -[CSCoverSheetViewController isInScreenOffMode](self->_coverSheetViewController, "isInScreenOffMode"))
  {
    SBLogDashBoard();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v21 = -[CSCoverSheetViewController isInScreenOffMode](self->_coverSheetViewController, "isInScreenOffMode");
      v22[0] = 67109632;
      v22[1] = v19;
      v23 = 1024;
      v24 = v8;
      v25 = 1024;
      v26 = v21;
      _os_log_fault_impl(&dword_1D0540000, v20, OS_LOG_TYPE_FAULT, "Discontinuity in screenOffMode. BacklightController screenOff: %{BOOL}u. LockScreenEnvironment screenOffMode: %{BOOL}u. CoverSheet screenOffMode: %{BOOL}u.", (uint8_t *)v22, 0x14u);
    }

  }
}

void __124__SBDashBoardLockScreenEnvironment_setInScreenOffMode_forAutoUnlock_fromUnlockSource_preservingCoverSheetPresentationState___block_invoke()
{
  id v0;

  objc_msgSend((id)SBApp, "HUDController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissHUDs:", 1);

}

- (void)startLockScreenFadeInAnimationForSource:(int)a3
{
  -[CSCoverSheetViewController startLockScreenFadeInAnimationForSource:](self->_coverSheetViewController, "startLockScreenFadeInAnimationForSource:", *(_QWORD *)&a3);
}

- (int64_t)backlightLuminance
{
  return -[CSCoverSheetViewController backlightLuminance](self->_coverSheetViewController, "backlightLuminance");
}

- (double)backlightLevel
{
  double result;

  -[CSCoverSheetViewController backlightLevel](self->_coverSheetViewController, "backlightLevel");
  return result;
}

- (void)setBacklightLevel:(double)a3
{
  -[CSCoverSheetViewController setBacklightLevel:](self->_coverSheetViewController, "setBacklightLevel:", a3);
}

- (BOOL)shouldDisableALS
{
  return -[CSCoverSheetViewController shouldDisableALS](self->_coverSheetViewController, "shouldDisableALS");
}

- (BOOL)suppressesBanners
{
  return -[CSCoverSheetViewController suppressesBanners](self->_coverSheetViewController, "suppressesBanners");
}

- (BOOL)suppressesControlCenter
{
  return -[CSCoverSheetViewController suppressesControlCenter](self->_coverSheetViewController, "suppressesControlCenter");
}

- (BOOL)suppressesScreenshots
{
  return -[CSCoverSheetViewController suppressesScreenshots](self->_coverSheetViewController, "suppressesScreenshots");
}

- (void)noteDeviceBlockedStatusUpdated
{
  -[CSCoverSheetViewController noteDeviceBlockedStatusUpdated](self->_coverSheetViewController, "noteDeviceBlockedStatusUpdated");
}

- (void)noteResetRestoreStateUpdated
{
  -[CSCoverSheetViewController noteResetRestoreStateUpdated](self->_coverSheetViewController, "noteResetRestoreStateUpdated");
}

- (void)noteMenuButtonDown
{
  -[SBDashBoardBiometricUnlockController noteMenuButtonDown](self->_biometricUnlockController, "noteMenuButtonDown");
}

- (void)noteMenuButtonUp
{
  -[SBDashBoardBiometricUnlockController noteMenuButtonUp](self->_biometricUnlockController, "noteMenuButtonUp");
}

- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress
{
  return (id)-[CSCoverSheetViewController createHomeButtonShowPasscodeRecognizerForHomeButtonPress](self->_coverSheetViewController, "createHomeButtonShowPasscodeRecognizerForHomeButtonPress");
}

- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3
{
  return (id)-[CSCoverSheetViewController createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:](self->_coverSheetViewController, "createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:", *(_QWORD *)&a3);
}

- (BOOL)isMainPageVisible
{
  return -[CSCoverSheetViewController isMainPageVisible](self->_coverSheetViewController, "isMainPageVisible");
}

- (SBFLockScreenActionContext)_customLockScreenActionContext
{
  return (SBFLockScreenActionContext *)-[CSCoverSheetViewController _customLockScreenActionContext](self->_coverSheetViewController, "_customLockScreenActionContext");
}

- (void)setCustomLockScreenActionContext:(id)a3
{
  -[CSCoverSheetViewController setCustomLockScreenActionContext:](self->_coverSheetViewController, "setCustomLockScreenActionContext:", a3);
}

- (BOOL)isUnlockDisabled
{
  return -[CSCoverSheetViewController isUnlockDisabled](self->_coverSheetViewController, "isUnlockDisabled");
}

- (void)prepareForUIUnlock
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetIdleTimerForReason:", CFSTR("DB:PrepareForUIUnlock"));

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockScreenModalAlertItemPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenActionContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D1BC48]);
    objc_msgSend(v6, "setLockScreenActionContext:", v7);
    -[SBLockScreenActionManager registerLockScreenActionProvider:forSource:](self->_lockScreenActionManager, "registerLockScreenActionProvider:forSource:", v6, 2);

  }
  -[CSCoverSheetViewController prepareForUIUnlock](self->_coverSheetViewController, "prepareForUIUnlock");

}

- (void)prepareForUILock
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenIsOn");

  if (v4)
  {
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetIdleTimerForReason:", CFSTR("DB:PrepareForUILock"));

    -[SBDashBoardLockScreenEnvironment setInScreenOffMode:](self, "setInScreenOffMode:", 0);
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertUnlockedAlertsToLockedAlerts");

  -[CSCoverSheetViewController prepareForUILock](self->_coverSheetViewController, "prepareForUILock");
}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  return -[CSCoverSheetViewController willUIUnlockFromSource:](self->_coverSheetViewController, "willUIUnlockFromSource:", *(_QWORD *)&a3);
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  return -[CSCoverSheetViewController canBeDeactivatedForUIUnlockFromSource:](self->_coverSheetViewController, "canBeDeactivatedForUIUnlockFromSource:", *(_QWORD *)&a3);
}

- (void)finishUIUnlockFromSource:(int)a3
{
  -[CSCoverSheetViewController finishUIUnlockFromSource:](self->_coverSheetViewController, "finishUIUnlockFromSource:", *(_QWORD *)&a3);
  -[SBLockScreenActionManager runUnlockAction](self->_lockScreenActionManager, "runUnlockAction");
  -[SBLockScreenActionManager registerLockScreenActionProvider:forSource:](self->_lockScreenActionManager, "registerLockScreenActionProvider:forSource:", 0, 2);
}

- (BOOL)isAuthenticated
{
  return -[CSCoverSheetViewController isAuthenticated](self->_coverSheetViewController, "isAuthenticated");
}

- (void)setAuthenticated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBDashBoardBiometricUnlockController setAuthenticated:](self->_biometricUnlockController, "setAuthenticated:");
  -[CSCoverSheetViewController setAuthenticated:](self->_coverSheetViewController, "setAuthenticated:", v3);
}

- (BOOL)shouldUnlockUIOnKeyDownEvent
{
  return -[CSCoverSheetViewController shouldUnlockUIOnKeyDownEvent](self->_coverSheetViewController, "shouldUnlockUIOnKeyDownEvent");
}

- (void)jiggleLockIcon
{
  -[CSCoverSheetViewController jiggleLockIcon](self->_coverSheetViewController, "jiggleLockIcon");
}

- (BOOL)isShowingMediaControls
{
  return -[CSCoverSheetViewController isShowingMediaControls](self->_coverSheetViewController, "isShowingMediaControls");
}

- (void)setShowingMediaControls:(BOOL)a3
{
  -[CSCoverSheetViewController setShowingMediaControls:](self->_coverSheetViewController, "setShowingMediaControls:", a3);
}

- (BOOL)isPasscodeLockVisible
{
  return -[CSCoverSheetViewController isPasscodeLockVisible](self->_coverSheetViewController, "isPasscodeLockVisible");
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[CSCoverSheetViewController setPasscodeLockVisible:animated:](self->_coverSheetViewController, "setPasscodeLockVisible:animated:", a3, a4);
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[CSCoverSheetViewController setPasscodeLockVisible:animated:completion:](self->_coverSheetViewController, "setPasscodeLockVisible:animated:completion:", a3, a4, a5);
}

- (void)_setExpectsFaceContact:(BOOL)a3
{
  id v3;

  if (self->_expectsFaceContact != a3)
  {
    self->_expectsFaceContact = a3;
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateProximitySensorState");

  }
}

- (BOOL)shouldShowLockStatusBarTime
{
  return -[CSCoverSheetViewController shouldShowLockStatusBarTime](self->_coverSheetViewController, "shouldShowLockStatusBarTime");
}

- (void)updateStatusBarForLockScreenTeardown
{
  -[CSCoverSheetViewController updateStatusBarForLockScreenTeardown](self->_coverSheetViewController, "updateStatusBarForLockScreenTeardown");
}

- (void)updateStatusBarForLockScreenComeback
{
  -[CSCoverSheetViewController updateStatusBarForLockScreenComeback](self->_coverSheetViewController, "updateStatusBarForLockScreenComeback");
}

- (BOOL)shouldPresentOrDismissCoverSheetSpotlight
{
  return -[CSCoverSheetViewController shouldPresentOrDismissCoverSheetSpotlight](self->_coverSheetViewController, "shouldPresentOrDismissCoverSheetSpotlight");
}

- (void)presentOrDismissCoverSheetSpotlightAnimated:(BOOL)a3
{
  -[CSCoverSheetViewController presentOrDismissCoverSheetSpotlightAnimated:](self->_coverSheetViewController, "presentOrDismissCoverSheetSpotlightAnimated:", a3);
}

- (void)updateScaleViewWithScale:(double)a3 withDuration:(double)a4
{
  -[CSCoverSheetViewController updateScaleViewWithScale:withDuration:](self->_coverSheetViewController, "updateScaleViewWithScale:withDuration:", a3, a4);
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return self->_coverSheetViewController;
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  return (SBBiometricUnlockBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_biometricUnlockBehaviorDelegate, a3);
}

- (BOOL)expectsFaceContact
{
  return self->_expectsFaceContact;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_coverSheetSpotlightPresenter, 0);
  objc_storeStrong((id *)&self->_widgetURLHandler, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_storeStrong((id *)&self->_policyBasedBehaviorProvider, 0);
  objc_storeStrong((id *)&self->_pluginController, 0);
  objc_storeStrong((id *)&self->_orientationController, 0);
  objc_storeStrong((id *)&self->_idleTimerController, 0);
  objc_storeStrong((id *)&self->_emergencyDialerController, 0);
  objc_storeStrong((id *)&self->_lockScreenActionManager, 0);
  objc_storeStrong((id *)&self->_cameraPageViewController, 0);
  objc_storeStrong((id *)&self->_captureLaunchPolicy, 0);
  objc_storeStrong((id *)&self->_biometricUnlockController, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_analyticsEmitter, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

- (void)defaultHostableEntityForActivationOfCamera:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Unexpectedly received non-camera-page placement %@ for camera page launch source", (uint8_t *)&v4, 0xCu);

}

@end
