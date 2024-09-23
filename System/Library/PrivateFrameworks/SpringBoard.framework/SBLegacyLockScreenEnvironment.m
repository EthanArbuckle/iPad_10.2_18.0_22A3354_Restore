@implementation SBLegacyLockScreenEnvironment

- (SBLegacyLockScreenEnvironment)initWithLockScreenViewController:(id)a3
{
  id v5;
  SBLegacyLockScreenEnvironment *v6;
  SBLegacyLockScreenEnvironment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLegacyLockScreenEnvironment;
  v6 = -[SBLegacyLockScreenEnvironment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lockScreenViewController, a3);

  return v7;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)self->_lockScreenViewController;
}

- (SBAutoUnlockRule)autoUnlockRule
{
  return (SBAutoUnlockRule *)self->_lockScreenViewController;
}

- (SBBiometricUnlockBehavior)biometricUnlockBehavior
{
  return (SBBiometricUnlockBehavior *)self->_lockScreenViewController;
}

- (SBButtonEventsHandler)buttonEventsHandler
{
  return (SBButtonEventsHandler *)self->_lockScreenViewController;
}

- (SBApplicationHosting)applicationHoster
{
  return (SBApplicationHosting *)self->_lockScreenViewController;
}

- (SBIdleTimerProviding)idleTimerProvider
{
  return (SBIdleTimerProviding *)self->_lockScreenViewController;
}

- (SBFScreenWakeAnimationTarget)screenWakeAnimationTarget
{
  return -[SBLockScreenViewControllerBase legacyWallpaperWakeAnimator](self->_lockScreenViewController, "legacyWallpaperWakeAnimator");
}

- (SBLockScreenApplicationLaunching)applicationLauncher
{
  return 0;
}

- (SBLockScreenBacklightControlling)backlightController
{
  return (SBLockScreenBacklightControlling *)self->_lockScreenViewController;
}

- (SBLockScreenBehaviorSuppressing)behaviorSuppressor
{
  return (SBLockScreenBehaviorSuppressing *)self->_lockScreenViewController;
}

- (SBLockScreenBlockedStateObserving)blockedStateObserver
{
  return (SBLockScreenBlockedStateObserving *)self->_lockScreenViewController;
}

- (SBLockScreenButtonObserving)buttonObserver
{
  return (SBLockScreenButtonObserving *)self->_lockScreenViewController;
}

- (SBLockScreenCallHandling)callController
{
  return (SBLockScreenCallHandling *)self->_lockScreenViewController;
}

- (SBLockScreenContentStateProviding)contentStateProvider
{
  return (SBLockScreenContentStateProviding *)self->_lockScreenViewController;
}

- (SBLockScreenCustomActionStoring)customActionStore
{
  return (SBLockScreenCustomActionStoring *)self->_lockScreenViewController;
}

- (SBLockScreenIdleTimerControlling)idleTimerController
{
  return (SBLockScreenIdleTimerControlling *)self->_lockScreenViewController;
}

- (SBLockScreenLockingAndUnlocking)lockController
{
  return (SBLockScreenLockingAndUnlocking *)self->_lockScreenViewController;
}

- (SBLockScreenMediaControlsPresenting)mediaControlsPresenter
{
  return (SBLockScreenMediaControlsPresenting *)self->_lockScreenViewController;
}

- (SBLockScreenPasscodeViewPresenting)passcodeViewPresenter
{
  return (SBLockScreenPasscodeViewPresenting *)self->_lockScreenViewController;
}

- (SBLockScreenPluginPresenting)pluginPresenter
{
  return (SBLockScreenPluginPresenting *)self->_lockScreenViewController;
}

- (SBLockScreenProximityBehaviorProviding)proximityBehaviorProvider
{
  return (SBLockScreenProximityBehaviorProviding *)self->_lockScreenViewController;
}

- (SBLockScreenStatusBarTransitioning)statusBarTransitionController
{
  return (SBLockScreenStatusBarTransitioning *)self->_lockScreenViewController;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return 0;
}

- (SBLockScreenSpotlightPresenting)spotlightPresenter
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[SBLegacyLockScreenEnvironment descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLegacyLockScreenEnvironment succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_lockScreenViewController, CFSTR("lockScreenViewController"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLegacyLockScreenEnvironment descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenViewController, 0);
}

@end
