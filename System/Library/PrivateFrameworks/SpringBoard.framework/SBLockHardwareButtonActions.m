@implementation SBLockHardwareButtonActions

- (SBLockHardwareButtonActions)initWithHomeButtonType:(int64_t)a3 proximitySensorManager:(id)a4
{
  id v7;
  SBLockHardwareButtonActions *v8;
  uint64_t v9;
  SBHardwareButtonService *hardwareButtonService;
  uint64_t v11;
  SBWalletPreArmController *walletPreArmController;
  SBProximitySensorManager **p_proximitySensorManager;
  uint64_t v14;
  SOSManager *sosManager;
  uint64_t v16;
  SBSiriHardwareButtonInteraction *siriButtonInteraction;
  uint64_t v18;
  SBHardwareButtonGestureParameters *siriGestureParameters;
  uint64_t v20;
  SBAccessibilityHardwareButtonInteraction *accessibilityButtonInteraction;
  uint64_t v22;
  SBHardwareButtonGestureParameters *accessibilityGestureParameters;
  SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *v24;
  SBHardwareButtonInteraction *proximitySensorButtonInteraction;
  uint64_t v26;
  SBHardwareButtonGestureParameters *proximitySensorGestureParameters;
  SBDoubleClickSleepWakeHardwareButtonInteraction *v28;
  SBRecalibrateProximitySensorHardwareButtonInteraction *v29;
  SBHardwareButtonInteraction *v30;
  uint64_t v31;
  SBHardwareButtonGestureParameters *v32;
  SBSleepWakeHardwareButtonInteraction *sleepWakeButtonInteraction;
  void *v34;
  objc_super v36;

  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)SBLockHardwareButtonActions;
  v8 = -[SBLockHardwareButtonActions init](&v36, sel_init);
  if (v8)
  {
    +[SBHardwareButtonService sharedInstance](SBHardwareButtonService, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    hardwareButtonService = v8->_hardwareButtonService;
    v8->_hardwareButtonService = (SBHardwareButtonService *)v9;

    +[SBWalletPreArmController sharedInstance](SBWalletPreArmController, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    walletPreArmController = v8->_walletPreArmController;
    v8->_walletPreArmController = (SBWalletPreArmController *)v11;

    p_proximitySensorManager = &v8->_proximitySensorManager;
    objc_storeStrong((id *)&v8->_proximitySensorManager, a4);
    objc_msgSend(MEMORY[0x1E0D89860], "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    sosManager = v8->_sosManager;
    v8->_sosManager = (SOSManager *)v14;

    v8->_homeButtonType = a3;
    v8->_sosTriggerMechanism = 0;
    if (v8->_homeButtonType == 2)
    {
      +[SBSiriHardwareButtonInteraction hardwareButtonInteractionForLockButton](SBSiriHardwareButtonInteraction, "hardwareButtonInteractionForLockButton");
      v16 = objc_claimAutoreleasedReturnValue();
      siriButtonInteraction = v8->_siriButtonInteraction;
      v8->_siriButtonInteraction = (SBSiriHardwareButtonInteraction *)v16;

      -[SBHardwareButtonGestureParametersProviderBase addHardwareButtonGestureParametersObserver:](v8->_siriButtonInteraction, "addHardwareButtonGestureParametersObserver:", v8);
      -[SBSiriHardwareButtonInteraction hardwareButtonGestureParameters](v8->_siriButtonInteraction, "hardwareButtonGestureParameters");
      v18 = objc_claimAutoreleasedReturnValue();
      siriGestureParameters = v8->_siriGestureParameters;
      v8->_siriGestureParameters = (SBHardwareButtonGestureParameters *)v18;

      +[SBAccessibilityHardwareButtonInteraction hardwareButtonInteractionForLockButton](SBAccessibilityHardwareButtonInteraction, "hardwareButtonInteractionForLockButton");
      v20 = objc_claimAutoreleasedReturnValue();
      accessibilityButtonInteraction = v8->_accessibilityButtonInteraction;
      v8->_accessibilityButtonInteraction = (SBAccessibilityHardwareButtonInteraction *)v20;

      -[SBHardwareButtonGestureParametersProviderBase addHardwareButtonGestureParametersObserver:](v8->_accessibilityButtonInteraction, "addHardwareButtonGestureParametersObserver:", v8);
      -[SBAccessibilityHardwareButtonInteraction hardwareButtonGestureParameters](v8->_accessibilityButtonInteraction, "hardwareButtonGestureParameters");
      v22 = objc_claimAutoreleasedReturnValue();
      accessibilityGestureParameters = v8->_accessibilityGestureParameters;
      v8->_accessibilityGestureParameters = (SBHardwareButtonGestureParameters *)v22;

      v24 = -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction initWithProximitySensorManager:]([SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction alloc], "initWithProximitySensorManager:", *p_proximitySensorManager);
      proximitySensorButtonInteraction = v8->_proximitySensorButtonInteraction;
      v8->_proximitySensorButtonInteraction = (SBHardwareButtonInteraction *)v24;

      -[SBHardwareButtonInteraction addHardwareButtonGestureParametersObserver:](v8->_proximitySensorButtonInteraction, "addHardwareButtonGestureParametersObserver:", v8);
      -[SBHardwareButtonInteraction hardwareButtonGestureParameters](v8->_proximitySensorButtonInteraction, "hardwareButtonGestureParameters");
      v26 = objc_claimAutoreleasedReturnValue();
      proximitySensorGestureParameters = v8->_proximitySensorGestureParameters;
      v8->_proximitySensorGestureParameters = (SBHardwareButtonGestureParameters *)v26;

      v28 = -[SBDoubleClickSleepWakeHardwareButtonInteraction initWithProximitySensorManager:]([SBDoubleClickSleepWakeHardwareButtonInteraction alloc], "initWithProximitySensorManager:", *p_proximitySensorManager);
    }
    else
    {
      v29 = -[SBRecalibrateProximitySensorHardwareButtonInteraction initWithProximitySensorManager:]([SBRecalibrateProximitySensorHardwareButtonInteraction alloc], "initWithProximitySensorManager:", *p_proximitySensorManager);
      v30 = v8->_proximitySensorButtonInteraction;
      v8->_proximitySensorButtonInteraction = (SBHardwareButtonInteraction *)v29;

      -[SBHardwareButtonInteraction addHardwareButtonGestureParametersObserver:](v8->_proximitySensorButtonInteraction, "addHardwareButtonGestureParametersObserver:", v8);
      -[SBHardwareButtonInteraction hardwareButtonGestureParameters](v8->_proximitySensorButtonInteraction, "hardwareButtonGestureParameters");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v8->_proximitySensorGestureParameters;
      v8->_proximitySensorGestureParameters = (SBHardwareButtonGestureParameters *)v31;

      v28 = objc_alloc_init(SBSleepWakeHardwareButtonInteraction);
    }
    sleepWakeButtonInteraction = v8->_sleepWakeButtonInteraction;
    v8->_sleepWakeButtonInteraction = &v28->super;

    -[SBHardwareButtonGestureParametersProviderBase addHardwareButtonGestureParametersObserver:](v8, "addHardwareButtonGestureParametersObserver:", v8->_sleepWakeButtonInteraction);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v8, sel__registeredLockButtonAppsDidChange_, CFSTR("SBApplicationsRegisteredForLockButtonEventsChangedNotification"), 0);

  }
  return v8;
}

- (BOOL)reverseFadeOutIfNeeded
{
  return -[SBSleepWakeHardwareButtonInteraction reverseSleepIfNeededAndPossible](self->_sleepWakeButtonInteraction, "reverseSleepIfNeededAndPossible");
}

- (void)performSOSGestureBeganActions
{
  -[SBSleepWakeHardwareButtonInteraction setSOSGestureActive:](self->_sleepWakeButtonInteraction, "setSOSGestureActive:", 1);
}

- (void)performSOSGestureEndedActions
{
  -[SBSleepWakeHardwareButtonInteraction setSOSGestureActive:](self->_sleepWakeButtonInteraction, "setSOSGestureActive:", 0);
}

- (void)performFinalButtonUpActions
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSiriHardwareButtonInteraction observeFinalPressUp](self->_siriButtonInteraction, "observeFinalPressUp");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSleepWakeHardwareButtonInteraction observeFinalPressUp](self->_sleepWakeButtonInteraction, "observeFinalPressUp");
}

- (void)performInitialButtonDownActions
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  const char *aSelector;
  void *v47;
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  SBSafeCast(v4, self->_siriButtonInteraction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "setInitialPressDownTime:", CFAbsoluteTimeGetCurrent());
  self->_isButtonDown = 1;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, &__block_literal_global_17);

  if ((objc_opt_respondsToSelector() & 1) == 0
    || !-[SBHardwareButtonInteraction consumeInitialPressDown](self->_proximitySensorButtonInteraction, "consumeInitialPressDown"))
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDisplayWindowScene");
    v7 = objc_claimAutoreleasedReturnValue();

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transientOverlayPresentationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transientOverlayPresenterForWindowScene:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "handleLockButtonPress"))
    {
      -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
      SBLogButtonsLock();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_44:

        goto LABEL_45;
      }
      NSStringFromSelector(a2);
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v14;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because the system aperture controller is handling it", buf, 0xCu);
LABEL_43:

      goto LABEL_44;
    }
    aSelector = a2;
    v47 = v5;
    objc_msgSend((id)SBApp, "bannerManager");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject bannerWindowInWindowScene:](v13, "bannerWindowInWindowScene:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowLevel");
    if ((-[NSObject hasPresentationAboveWindowLevel:](v8, "hasPresentationAboveWindowLevel:") & 1) != 0)
    {

    }
    else
    {
      v16 = -[NSObject handleLockButtonPress](v13, "handleLockButtonPress");

      if (v16)
      {
        -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
        SBLogButtonsLock();
        v14 = objc_claimAutoreleasedReturnValue();
        v5 = v47;
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        NSStringFromSelector(aSelector);
        v17 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v17;
        v18 = "%{public}@ result: ignoring lock down because a banner manager is handling it";
LABEL_18:
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

        goto LABEL_43;
      }
    }
    if (-[NSObject handleLockButtonPress](v8, "handleLockButtonPress"))
    {
      -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
      SBLogButtonsLock();
      v14 = objc_claimAutoreleasedReturnValue();
      v5 = v47;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      NSStringFromSelector(aSelector);
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v17;
      v18 = "%{public}@ result: ignoring lock down because a transient overlay is handling it";
      goto LABEL_18;
    }
    objc_msgSend((id)SBApp, "lockOutController");
    v14 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isProximityReaderBlocked](v14, "isProximityReaderBlocked"))
    {
      v44 = v9;
      objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject proximityReaderUISceneController](v19, "proximityReaderUISceneController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "handleLockButtonPress"))
      {
        v21 = v19;
        -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
        SBLogButtonsLock();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(aSelector);
          v23 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v23;
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because a proximity reader is handling it", buf, 0xCu);

        }
        v5 = v47;
        v24 = v21;
        v9 = v44;
        goto LABEL_42;
      }

      v9 = v44;
    }
    v42 = v8;
    v45 = v14;
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lockScreenEnvironment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "buttonEventsHandler");
    v27 = objc_claimAutoreleasedReturnValue();

    v43 = v27;
    if (-[NSObject handleLockButtonPress](v27, "handleLockButtonPress"))
    {
      SBLogButtonsLock();
      v28 = objc_claimAutoreleasedReturnValue();
      v24 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v29;
        v50 = 2114;
        v51 = v27;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because a lockscreen is handling it: %{public}@", buf, 0x16u);

      }
      v5 = v47;
      v14 = v45;
      v8 = v42;
      goto LABEL_42;
    }
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isSupressingLockButton");

    if (v31)
    {
      SBLogButtonsLock();
      v32 = objc_claimAutoreleasedReturnValue();
      v8 = v42;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v33 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v33;
        _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because lock button is supressed", buf, 0xCu);

      }
      -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
      v5 = v47;
      v24 = v43;
      v14 = v45;
      goto LABEL_42;
    }

    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "handleLockButtonPress");

    v8 = v42;
    if (v35)
    {
      -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
      SBLogButtonsLock();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v36 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v36;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because main switcher is handling it", buf, 0xCu);

      }
      v5 = v47;
    }
    else
    {
      v14 = v45;
      if (-[SBLockHardwareButtonActions _sendButtonDownToRegisteredApp](self, "_sendButtonDownToRegisteredApp"))
      {
        SBLogButtonsLock();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(aSelector);
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)SBApp, "appsRegisteredForLockButtonEvents");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v37;
          v50 = 2114;
          v51 = v39;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ result: registered app handled initial button down: %{public}@", buf, 0x16u);

          v14 = v45;
        }
        v5 = v47;
        goto LABEL_42;
      }
      v5 = v47;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[SBSiriHardwareButtonInteraction consumeInitialPressDown](self->_siriButtonInteraction, "consumeInitialPressDown"))
      {
        SBLogButtonsLock();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        NSStringFromSelector(aSelector);
        v40 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        v41 = "%{public}@ result: Siri handled it";
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || !-[SBSleepWakeHardwareButtonInteraction consumeInitialPressDown](self->_sleepWakeButtonInteraction, "consumeInitialPressDown"))
        {
          goto LABEL_43;
        }
        SBLogButtonsLock();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        NSStringFromSelector(aSelector);
        v40 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        v41 = "%{public}@ result: Sleep/wake interaction handled it";
      }
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);

    }
    v14 = v45;
LABEL_42:

    goto LABEL_43;
  }
  SBLogButtonsLock();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v8;
    v50 = 2114;
    v51 = (id)objc_opt_class();
    v9 = v51;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because %{public}@ handled it", buf, 0x16u);
LABEL_45:

  }
}

uint64_t __62__SBLockHardwareButtonActions_performInitialButtonDownActions__block_invoke()
{
  return +[SBMediaController sendResetPlaybackTimeoutCommand](SBMediaController, "sendResetPlaybackTimeoutCommand");
}

- (void)performInitialButtonUpActions
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBSleepWakeHardwareButtonInteraction consumeInitialPressUp](self->_sleepWakeButtonInteraction, "consumeInitialPressUp");
    SBLogButtonsLock();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: Sleep/wake interaction handled it", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)performSecondButtonDownActions
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBSleepWakeHardwareButtonInteraction consumeSecondPressDown](self->_sleepWakeButtonInteraction, "consumeSecondPressDown");
    SBLogButtonsLock();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: Sleep/wake interaction handled it", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)performLongPressActions
{
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_lastLockButtonEventRecipient)
  {
    SBLogButtonsLock();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: ignored because there's a lock button recipient waiting for an up event";
LABEL_13:
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v18, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (-[SBHardwareButtonService consumeLockButtonLongPressWithPriority:](self->_hardwareButtonService, "consumeLockButtonLongPressWithPriority:", 0))
  {
    SBLogButtonsLock();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: button consumer app handled it";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRestoring");

  if (v8)
  {
    SBLogButtonsLock();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: ignored because we're restoring";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isResetting");

  if (v10)
  {
    SBLogButtonsLock();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: ignored because we're resetting";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (self->_homeButtonType != 2)
  {
    objc_msgSend((id)SBApp, "homeHardwareButton");
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject isButtonDown](v3, "isButtonDown");
    SBLogButtonsLock();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignored because home button is down", (uint8_t *)&v18, 0xCu);

      }
    }
    else
    {
      if (v15)
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ result: showing power down transient overlay", (uint8_t *)&v18, 0xCu);

      }
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject presentPowerDownTransientOverlay](v14, "presentPowerDownTransientOverlay");
    }

    goto LABEL_14;
  }
  SBLogButtonsLock();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ result: sending to Siri", (uint8_t *)&v18, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSiriHardwareButtonInteraction consumeLongPress](self->_siriButtonInteraction, "consumeLongPress");
}

- (void)_showPowerDownTransientOverlayOnForceReset
{
  _BOOL4 isButtonDown;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isButtonDown = self->_isButtonDown;
  SBLogButtonsLock();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isButtonDown)
  {
    if (v5)
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: showing power down transient overlay now", (uint8_t *)&v8, 0xCu);

    }
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject presentPowerDownTransientOverlay](v4, "presentPowerDownTransientOverlay");
  }
  else if (v5)
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: button isn't down anymore, not showing power down transient overlay", (uint8_t *)&v8, 0xCu);

  }
}

- (void)performForceResetSequenceBeganActions
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogButtonsLock();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: showing power down transient overlay soon", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showPowerDownTransientOverlayOnForceReset, 0);
  -[SBLockHardwareButtonActions performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showPowerDownTransientOverlayOnForceReset, 0, 0.35);
}

- (void)performSinglePressDidFailActions
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSleepWakeHardwareButtonInteraction observeSinglePressDidFail](self->_sleepWakeButtonInteraction, "observeSinglePressDidFail");
}

- (BOOL)performButtonUpPreActions
{
  self->_isButtonDown = 0;
  -[SBLockHardwareButtonActions _sendButtonUpToRegisteredApp](self, "_sendButtonUpToRegisteredApp");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showPowerDownTransientOverlayOnForceReset, 0);
  return 1;
}

- (void)performSinglePressAction
{
  void *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSiriHardwareButtonInteraction observeFinalPressUp](self->_siriButtonInteraction, "observeFinalPressUp");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0DAC350], 0);

  if (-[SBLockHardwareButtonActions _sendButtonUpToRegisteredApp](self, "_sendButtonUpToRegisteredApp"))
  {
    SBLogButtonsLock();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543362;
      *(_QWORD *)&v17[4] = v6;
      v7 = "%{public}@ result: registered app handled it";
LABEL_21:
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, v7, v17, 0xCu);
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (-[SBLockHardwareButtonActions _isSOSActive](self, "_isSOSActive") && self->_sosTriggerMechanism == 3)
  {
    -[SOSManager dismissSOSWithCompletion:](self->_sosManager, "dismissSOSWithCompletion:", &__block_literal_global_64);
    SBLogButtonsLock();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543362;
      *(_QWORD *)&v17[4] = v6;
      v7 = "%{public}@ result: SOS dismiss handled it";
      goto LABEL_21;
    }
LABEL_23:

    v9 = 1;
    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[SBHardwareButtonInteraction consumeSinglePressUp](self->_proximitySensorButtonInteraction, "consumeSinglePressUp"))
  {
    SBLogButtonsLock();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = v6;
      *(_WORD *)&v17[12] = 2114;
      *(_QWORD *)&v17[14] = objc_opt_class();
      v8 = *(id *)&v17[14];
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ result: %{public}@ handled it", v17, 0x16u);

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (-[SBHardwareButtonService consumeLockButtonSinglePressUpWithPriority:](self->_hardwareButtonService, "consumeLockButtonSinglePressUpWithPriority:", 0))
  {
    SBLogButtonsLock();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543362;
      *(_QWORD *)&v17[4] = v6;
      v7 = "%{public}@ result: button consumer app handled it";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[SBSiriHardwareButtonInteraction consumeSinglePressUp](self->_siriButtonInteraction, "consumeSinglePressUp"))
  {
    SBLogButtonsLock();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543362;
      *(_QWORD *)&v17[4] = v6;
      v7 = "%{public}@ result: Siri handled it";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  v9 = 0;
LABEL_24:
  if (-[SBLockHardwareButtonActions _isSOSActive](self, "_isSOSActive", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18))
  {
    SBLogButtonsLock();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543362;
      *(_QWORD *)&v17[4] = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignored because _isSOSActive", v17, 0xCu);

    }
    v9 = 1;
  }
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPowerDownTransientOverlayTopmost");

  if (v13)
  {
    SBLogButtonsLock();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_32:

      return;
    }
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v17 = 138543362;
    *(_QWORD *)&v17[4] = v15;
    v16 = "%{public}@ result: ignored because power down alert is topmost";
LABEL_31:
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, v16, v17, 0xCu);

    goto LABEL_32;
  }
  if ((v9 & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && -[SBSleepWakeHardwareButtonInteraction consumeSinglePressUp](self->_sleepWakeButtonInteraction, "consumeSinglePressUp"))
  {
    SBLogButtonsLock();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v17 = 138543362;
    *(_QWORD *)&v17[4] = v15;
    v16 = "%{public}@ result: Sleep/wake interaction handled it";
    goto LABEL_31;
  }
}

- (void)performDoublePressActions
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSiriHardwareButtonInteraction observeFinalPressUp](self->_siriButtonInteraction, "observeFinalPressUp");
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported")|| !objc_msgSend(v5, "handleLockButtonPress"))
  {
    v8 = 0;
  }
  else
  {
    SBLogButtonsLock();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ result: transient overlay is handling it as a separate single press", (uint8_t *)&v18, 0xCu);

    }
    v8 = 1;
  }
  if (-[SBLockHardwareButtonActions _isSOSActive](self, "_isSOSActive"))
  {
    SBLogButtonsLock();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignored because SOS is active", (uint8_t *)&v18, 0xCu);

    }
    v8 = 1;
  }
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPowerDownTransientOverlayTopmost");

  if (v12)
  {
    SBLogButtonsLock();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      v15 = "%{public}@ result: ignored because power down alert is topmost";
LABEL_27:
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 0xCu);

      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CC12A0], "notifyEvent:", 0);
    if (-[SBHardwareButtonService consumeLockButtonDoublePressUpWithPriority:](self->_hardwareButtonService, "consumeLockButtonDoublePressUpWithPriority:", 0))
    {
      SBLogButtonsLock();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v14;
        v15 = "%{public}@ result: button consumer app handled it";
        goto LABEL_27;
      }
LABEL_28:

      goto LABEL_29;
    }
    if (!-[SBWalletPreArmController isPreArmTriggeredByLockButtonDoublePress](self->_walletPreArmController, "isPreArmTriggeredByLockButtonDoublePress")|| !-[SBWalletPreArmController isPreArmAllowed](self->_walletPreArmController, "isPreArmAllowed"))
    {
      SBLogButtonsLock();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v14;
        v15 = "%{public}@ result: ignored";
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    SBLogButtonsLock();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ result: presenting wallet pre-arm", (uint8_t *)&v18, 0xCu);

    }
    -[SBWalletPreArmController presentPreArmInterfaceForWalletConsumer](self->_walletPreArmController, "presentPreArmInterfaceForWalletConsumer");
  }
LABEL_29:

}

- (void)performTriplePressActions
{
  NSObject *v4;
  void *v5;
  const char *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSiriHardwareButtonInteraction observeFinalPressUp](self->_siriButtonInteraction, "observeFinalPressUp");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[SBAccessibilityHardwareButtonInteraction consumeTriplePressUp](self->_accessibilityButtonInteraction, "consumeTriplePressUp"))
  {
    SBLogButtonsLock();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      v6 = "%{public}@ result: accessibility handled it";
LABEL_9:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    SBLogButtonsLock();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      v6 = "%{public}@ result: ignored";
      goto LABEL_9;
    }
  }

}

- (void)performSOSActionsWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, _QWORD);
  int64_t v17;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  self->_sosTriggerMechanism = a4;
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasVisibleSuperModalAlert");

  if (v11)
  {
    SBLogButtonsLock();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBLockHardwareButtonActions performSOSActionsWithUUID:triggerMechanism:completion:].cold.1(v12);

    if (v9)
      v9[2](v9, 0);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke;
    v14[3] = &unk_1E8EA10F0;
    v14[4] = self;
    v15 = v8;
    v17 = a4;
    v16 = v9;
    dispatch_async(v13, v14);

  }
}

void __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D89860];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke_2;
  v5[3] = &unk_1E8EA10C8;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "triggerSOSWithUUID:triggerMechanism:completion:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    BSDispatchMain();

  }
}

uint64_t __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSOSDidTriggerActions");
}

- (void)performLongPressCancelledActions
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogButtonsLock();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Performing long press cancelled actions", v4, 2u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBSiriHardwareButtonInteraction observeLongPressCanceled](self->_siriButtonInteraction, "observeLongPressCanceled");
}

- (void)performTerminalLockLongPressActions
{
  -[SBSleepWakeHardwareButtonInteraction performSleepForReason:](self->_sleepWakeButtonInteraction, "performSleepForReason:", CFSTR("TerminalLock long press"));
}

- (void)performKeyboardShortcut
{
  -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 0);
  -[SBLockHardwareButtonActions performSinglePressAction](self, "performSinglePressAction");
}

- (BOOL)_shouldWaitForDoublePress
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  int v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[SBWalletPreArmController isPreArmTriggeredByLockButtonDoublePress](self->_walletPreArmController, "isPreArmTriggeredByLockButtonDoublePress");
  if (v3)
  {
    v4 = -[SBWalletPreArmController isPreArmAvailable](self->_walletPreArmController, "isPreArmAvailable");
    v5 = -[SBWalletPreArmController isPreArmExternallySuppressed](self->_walletPreArmController, "isPreArmExternallySuppressed");
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = -[SBHardwareButtonGestureParameters maximumPressCount](self->_accessibilityGestureParameters, "maximumPressCount");
  v7 = -[SBHardwareButtonService hasConsumersForLockButtonDoublePressUp](self->_hardwareButtonService, "hasConsumersForLockButtonDoublePressUp");
  v8 = v7;
  v9 = v4 || v5;
  if (v6 > 2)
    v9 = 1;
  v10 = v9 | v7;
  SBLogButtonsLock();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67110400;
    v13[1] = v10;
    v14 = 1024;
    v15 = v3;
    v16 = 1024;
    v17 = v4;
    v18 = 1024;
    v19 = v5;
    v20 = 1024;
    v21 = v6 > 2;
    v22 = 1024;
    v23 = v8;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Lock button single press should wait for double-press timeout: %{BOOL}u  (preArmDevice: %{BOOL}u preArmAvailable: %{BOOL}u preArmSuppressed: %{BOOL}u axTripleClickEnabled: %{BOOL}u buttonConsumer: %{BOOL}u)", (uint8_t *)v13, 0x26u);
  }

  return v10;
}

- (BOOL)disallowsSinglePressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SBHardwareButtonInteraction disallowsSinglePressForReason:](self->_proximitySensorButtonInteraction, "disallowsSinglePressForReason:", a3);
  else
    return 0;
}

- (BOOL)disallowsDoublePressForReason:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  __CFString *v8;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[SBHardwareButtonInteraction disallowsDoublePressForReason:](self->_proximitySensorButtonInteraction, "disallowsDoublePressForReason:", a3) & 1) == 0)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inCallPresentationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "disallowsLockHardwareButtonDoublePress");

    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("InCall handling all device lock button presses");
    }
    else
    {
      if (-[SBLockHardwareButtonActions _shouldWaitForDoublePress](self, "_shouldWaitForDoublePress"))
        return 0;
      v8 = CFSTR("nothing active wants it");
    }
    *a3 = v8;
  }
  return 1;
}

- (BOOL)disallowsTriplePressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[SBHardwareButtonInteraction disallowsTriplePressForReason:](self->_proximitySensorButtonInteraction, "disallowsTriplePressForReason:", a3) & 1) != 0)
  {
    return 1;
  }
  if (-[SBHardwareButtonGestureParameters maximumPressCount](self->_accessibilityGestureParameters, "maximumPressCount") <= 2)
  {
    *a3 = CFSTR("nothing active wants it");
    return 1;
  }
  return 0;
}

- (BOOL)disallowsLongPressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SBHardwareButtonInteraction disallowsLongPressForReason:](self->_proximitySensorButtonInteraction, "disallowsLongPressForReason:", a3);
  else
    return 0;
}

- (BOOL)shouldBeginDoublePressGestureWhileObjectWithinProximity
{
  if (self->_homeButtonType == 2)
    return 1;
  else
    return MGGetBoolAnswer() ^ 1;
}

- (id)hardwareButtonGestureParameters
{
  SBMutableHardwareButtonGestureParameters *v3;
  double v4;
  double v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  double v9;
  double v10;

  v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  if (-[SBLockHardwareButtonActions _usesLockButtonForSecureIntent](self, "_usesLockButtonForSecureIntent"))
  {
    -[SBHardwareButtonGestureParameters multiplePressTimeInterval](self->_accessibilityGestureParameters, "multiplePressTimeInterval");
    v5 = v4;
    -[SBLockHardwareButtonActions _foregroundAppRegisteredForLockButtonEvents](self, "_foregroundAppRegisteredForLockButtonEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 1;
    }
    else
    {
      v7 = -[SBHardwareButtonGestureParameters maximumPressCount](self->_accessibilityGestureParameters, "maximumPressCount");
      v8 = -[SBHardwareButtonGestureParameters maximumPressCount](self->_proximitySensorGestureParameters, "maximumPressCount");
      if (v8)
        v7 = v8;
    }

  }
  else
  {
    v7 = 1;
    v5 = 0.3;
  }
  v9 = 2.5;
  if (-[SBLockHardwareButtonActions _usesLockButtonForSiri](self, "_usesLockButtonForSiri"))
  {
    -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_siriGestureParameters, "longPressTimeInterval");
    if (v10 <= 0.0)
      v9 = 0.4;
    else
      v9 = v10;
  }
  -[SBMutableHardwareButtonGestureParameters setMaximumPressCount:](v3, "setMaximumPressCount:", v7);
  -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v3, "setMultiplePressTimeInterval:", v5);
  -[SBMutableHardwareButtonGestureParameters setLongPressTimeInterval:](v3, "setLongPressTimeInterval:", v9);
  return v3;
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  SBAccessibilityHardwareButtonInteraction *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = (SBAccessibilityHardwareButtonInteraction *)a3;
  v7 = a4;
  if (self->_accessibilityButtonInteraction == v6)
  {
    SBLogButtonsHome();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", buf, 2u);
    }

    objc_storeStrong((id *)&self->_accessibilityGestureParameters, a4);
  }
  if ((SBAccessibilityHardwareButtonInteraction *)self->_siriButtonInteraction == v6)
  {
    SBLogButtonsHome();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "reconfiguring due to Siri prefs change", v13, 2u);
    }

    objc_storeStrong((id *)&self->_siriGestureParameters, a4);
  }
  if ((SBAccessibilityHardwareButtonInteraction *)self->_proximitySensorButtonInteraction == v6)
  {
    SBLogButtonsHome();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "reconfiguring due to proximitySensor change", v12, 2u);
    }

    objc_storeStrong((id *)&self->_proximitySensorGestureParameters, a4);
  }
  -[SBLockHardwareButtonActions hardwareButtonGestureParameters](self, "hardwareButtonGestureParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", v11);

}

- (void)_performSOSDidTriggerActions
{
  if (-[SBLockHardwareButtonActions isButtonDown](self, "isButtonDown"))
    -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self->_sleepWakeButtonInteraction, "setInhibitNextSinglePressUp:", 1);
}

- (BOOL)_isSOSActive
{
  return -[SOSManager currentSOSInitiationState](self->_sosManager, "currentSOSInitiationState") == 1;
}

- (void)_registeredLockButtonAppsDidChange:(id)a3
{
  id v4;

  -[SBLockHardwareButtonActions hardwareButtonGestureParameters](self, "hardwareButtonGestureParameters", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", v4);

}

- (id)_foregroundAppRegisteredForLockButtonEvents
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "appsRegisteredForLockButtonEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v3))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_sendButtonUpToRegisteredApp
{
  SBApplication *lastLockButtonEventRecipient;
  SBApplication *v4;

  lastLockButtonEventRecipient = self->_lastLockButtonEventRecipient;
  if (lastLockButtonEventRecipient)
  {
    -[SBLockHardwareButtonActions _sendButtonEventToApp:down:](self, "_sendButtonEventToApp:down:", self->_lastLockButtonEventRecipient, 0);
    v4 = self->_lastLockButtonEventRecipient;
    self->_lastLockButtonEventRecipient = 0;

  }
  return lastLockButtonEventRecipient != 0;
}

- (BOOL)_sendButtonDownToRegisteredApp
{
  void *v3;

  -[SBLockHardwareButtonActions _foregroundAppRegisteredForLockButtonEvents](self, "_foregroundAppRegisteredForLockButtonEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_storeStrong((id *)&self->_lastLockButtonEventRecipient, v3);
    -[SBLockHardwareButtonActions _sendButtonEventToApp:down:](self, "_sendButtonEventToApp:down:", self->_lastLockButtonEventRecipient, 1);
  }

  return v3 != 0;
}

- (void)_sendButtonEventToApp:(id)a3 down:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "pid");
  SBLogButtonsLock();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ result: sending to %{public}@", (uint8_t *)&v12, 0x16u);

  }
  SBSendFakeButtonPressEventToApplication(v7, v9, 104, v4);

}

- (BOOL)_usesLockButtonForSecureIntent
{
  return MGGetBoolAnswer();
}

- (BOOL)_usesLockButtonForSiri
{
  return self->_homeButtonType == 2;
}

- (BOOL)isButtonDown
{
  return self->_isButtonDown;
}

- (SBSiriHardwareButtonInteraction)siriButtonInteraction
{
  return self->_siriButtonInteraction;
}

- (void)setSiriButtonInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_siriButtonInteraction, a3);
}

- (SBAccessibilityHardwareButtonInteraction)accessibilityButtonInteraction
{
  return self->_accessibilityButtonInteraction;
}

- (void)setAccessibilityButtonInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityButtonInteraction, a3);
}

- (SBSleepWakeHardwareButtonInteraction)sleepWakeButtonInteraction
{
  return self->_sleepWakeButtonInteraction;
}

- (void)setSleepWakeButtonInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_sleepWakeButtonInteraction, a3);
}

- (SBHardwareButtonInteraction)proximitySensorButtonInteraction
{
  return self->_proximitySensorButtonInteraction;
}

- (void)setProximitySensorButtonInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySensorButtonInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySensorButtonInteraction, 0);
  objc_storeStrong((id *)&self->_sleepWakeButtonInteraction, 0);
  objc_storeStrong((id *)&self->_accessibilityButtonInteraction, 0);
  objc_storeStrong((id *)&self->_siriButtonInteraction, 0);
  objc_storeStrong((id *)&self->_proximitySensorGestureParameters, 0);
  objc_storeStrong((id *)&self->_siriGestureParameters, 0);
  objc_storeStrong((id *)&self->_accessibilityGestureParameters, 0);
  objc_storeStrong((id *)&self->_sosManager, 0);
  objc_storeStrong((id *)&self->_walletPreArmController, 0);
  objc_storeStrong((id *)&self->_hardwareButtonService, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_lastLockButtonEventRecipient, 0);
}

- (void)performSOSActionsWithUUID:(os_log_t)log triggerMechanism:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SOS activation request rejected because there is a super modal alert visible.", v1, 2u);
}

@end
