@implementation SBAmbientPresentationController

- (SBAmbientPresentationController)initWithWindowScene:(id)a3
{
  id v4;
  SBAmbientPresentationController *v5;
  SBAmbientPresentationController *v6;
  void *v7;
  uint64_t v8;
  AMAmbientDefaults *v9;
  AMAmbientDefaults *ambientDefaults;
  uint64_t v11;
  SBAmbientSettings *ambientSettings;
  SBAmbientTelemetryEmitter *v13;
  SBAmbientTelemetryEmitter *telemetryEmitter;
  AMAmbientPresentationTriggerManager *v15;
  AMAmbientPresentationTriggerManager *ambientTriggerManager;
  AMRedModeTriggerManager *v17;
  AMRedModeTriggerManager *redModeTriggerManager;
  uint64_t v19;
  SBAmbientMotionDetectionWakeAttributeMonitor *motionDetectionWakeAttributeMonitor;
  void *v21;
  uint64_t v22;
  SBLockScreenManager *lockScreenManager;
  uint64_t v24;
  SBSecureAppManager *secureAppManager;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  SBAmbientMainDisplayController *v33;
  SBAmbientMainDisplayController *mainDisplayController;
  SBAmbientIdleTimerController *v35;
  SBAmbientIdleTimerController *ambientIdleTimerController;
  void *v37;
  void *v38;
  uint64_t v39;
  SBLiftToWakeController *liftToWakeController;
  uint64_t v41;
  SBBacklightController *backlightController;
  SBAmbientScheduledAlarmObserver *v43;
  SBAmbientScheduledAlarmObserver *scheduledAlarmObserver;
  uint64_t v45;
  SBPocketStateMonitor *pocketStateMonitor;
  SBAmbientAuthenticationIdleTimer *v47;
  SBAmbientAuthenticationIdleTimer *authenticationIdleTimer;
  AMUIWidgetHostManager *v49;
  AMUIWidgetHostManager *widgetHostManager;
  AMUIWidgetHostManager *v51;
  SBAmbientWirelessChargingIdleTimer *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  SBAmbientWirelessChargingIdleTimer *wirelessChargingIdleTimer;
  void *v57;
  uint64_t v58;
  SBFMobileKeyBagState *lastKeyBagState;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)SBAmbientPresentationController;
  v5 = -[SBAmbientPresentationController init](&v61, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    if (_os_feature_enabled_impl())
    {
      if ((__sb__runningInSpringBoard() & 1) != 0)
      {
        if (SBFEffectiveDeviceClass() == 2)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "userInterfaceIdiom");

        if (v8 == 1)
          goto LABEL_15;
      }
      v9 = (AMAmbientDefaults *)objc_alloc_init(MEMORY[0x1E0CF78B0]);
      ambientDefaults = v6->_ambientDefaults;
      v6->_ambientDefaults = v9;

      -[SBAmbientPresentationController _observeAmbientUserSettingChanges](v6, "_observeAmbientUserSettingChanges");
      objc_msgSend(v4, "isMainDisplayWindowScene");
      IOPMUpdateDominoState();
      +[SBAmbientDomain rootSettings](SBAmbientDomain, "rootSettings");
      v11 = objc_claimAutoreleasedReturnValue();
      ambientSettings = v6->_ambientSettings;
      v6->_ambientSettings = (SBAmbientSettings *)v11;

      v13 = -[SBAmbientTelemetryEmitter initWithAmbientDefaults:]([SBAmbientTelemetryEmitter alloc], "initWithAmbientDefaults:", v6->_ambientDefaults);
      telemetryEmitter = v6->_telemetryEmitter;
      v6->_telemetryEmitter = v13;

      v15 = (AMAmbientPresentationTriggerManager *)objc_alloc_init(MEMORY[0x1E0CF78B8]);
      ambientTriggerManager = v6->_ambientTriggerManager;
      v6->_ambientTriggerManager = v15;

      -[AMAmbientPresentationTriggerManager setAmbientDefaults:](v6->_ambientTriggerManager, "setAmbientDefaults:", v6->_ambientDefaults);
      -[AMAmbientPresentationTriggerManager addObserver:](v6->_ambientTriggerManager, "addObserver:", v6);
      v17 = (AMRedModeTriggerManager *)objc_alloc_init(MEMORY[0x1E0CF78D0]);
      redModeTriggerManager = v6->_redModeTriggerManager;
      v6->_redModeTriggerManager = v17;

      -[AMRedModeTriggerManager addObserver:](v6->_redModeTriggerManager, "addObserver:", v6);
      +[SBAmbientMotionDetectionWakeAttributeMonitor sharedInstance](SBAmbientMotionDetectionWakeAttributeMonitor, "sharedInstance");
      v19 = objc_claimAutoreleasedReturnValue();
      motionDetectionWakeAttributeMonitor = v6->_motionDetectionWakeAttributeMonitor;
      v6->_motionDetectionWakeAttributeMonitor = (SBAmbientMotionDetectionWakeAttributeMonitor *)v19;

      -[SBAmbientMotionDetectionWakeAttributeMonitor addObserver:](v6->_motionDetectionWakeAttributeMonitor, "addObserver:", v6);
      objc_msgSend(MEMORY[0x1E0CF78E0], "prewarm");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel__lockStateDidChange_, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);
      objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel__carPlayPresentationDidChange_, CFSTR("SBNotificationCarPlayDestinationAvailabilityDidChange"), 0);
      objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel__isOnACDidChange_, CFSTR("SBUIACStatusChangedNotification"), 0);
      -[SBAmbientPresentationController _evaluateTriggerDetectionState](v6, "_evaluateTriggerDetectionState");
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v22 = objc_claimAutoreleasedReturnValue();
      lockScreenManager = v6->_lockScreenManager;
      v6->_lockScreenManager = (SBLockScreenManager *)v22;

      +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
      v24 = objc_claimAutoreleasedReturnValue();
      secureAppManager = v6->_secureAppManager;
      v6->_secureAppManager = (SBSecureAppManager *)v24;

      -[SBSecureAppManager addWakeDestinationProvider:](v6->_secureAppManager, "addWakeDestinationProvider:", v6);
      -[SBSecureAppManager addObserver:](v6->_secureAppManager, "addObserver:", v6);
      objc_msgSend((id)SBApp, "blshService");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "platformProvider");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_class();
      v29 = v27;
      if (v28)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
      }
      else
      {
        v30 = 0;
      }
      v31 = v30;

      objc_msgSend(v31, "alwaysOnPolicyCoordinator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "addExternalPolicy:", v6);
      objc_storeWeak((id *)&v6->_alwaysOnPolicyCoordinator, v32);
      if (objc_msgSend(v4, "isMainDisplayWindowScene"))
      {
        v33 = -[SBAmbientMainDisplayController initWithAmbientPresentationController:]([SBAmbientMainDisplayController alloc], "initWithAmbientPresentationController:", v6);
        mainDisplayController = v6->_mainDisplayController;
        v6->_mainDisplayController = v33;

      }
      v35 = -[SBAmbientIdleTimerController initWithWindowScene:]([SBAmbientIdleTimerController alloc], "initWithWindowScene:", v4);
      ambientIdleTimerController = v6->_ambientIdleTimerController;
      v6->_ambientIdleTimerController = v35;

      -[SBAmbientIdleTimerController addObserver:](v6->_ambientIdleTimerController, "addObserver:", v6);
      -[SBAmbientPresentationController windowScene](v6, "windowScene");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "coverSheetViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "startObservingAmbientPresentationForController:", v6);
      objc_msgSend(v38, "registerExternalEventHandler:", v6);
      +[SBLiftToWakeController sharedController](SBLiftToWakeController, "sharedController");
      v39 = objc_claimAutoreleasedReturnValue();
      liftToWakeController = v6->_liftToWakeController;
      v6->_liftToWakeController = (SBLiftToWakeController *)v39;

      -[SBLiftToWakeController addObserver:](v6->_liftToWakeController, "addObserver:", v6);
      +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
      v41 = objc_claimAutoreleasedReturnValue();
      backlightController = v6->_backlightController;
      v6->_backlightController = (SBBacklightController *)v41;

      -[SBBacklightController addObserver:](v6->_backlightController, "addObserver:", v6);
      v43 = objc_alloc_init(SBAmbientScheduledAlarmObserver);
      scheduledAlarmObserver = v6->_scheduledAlarmObserver;
      v6->_scheduledAlarmObserver = v43;

      -[SBAmbientScheduledAlarmObserver setDelegate:](v6->_scheduledAlarmObserver, "setDelegate:", v6);
      +[SBPocketStateMonitor sharedInstance](SBPocketStateMonitor, "sharedInstance");
      v45 = objc_claimAutoreleasedReturnValue();
      pocketStateMonitor = v6->_pocketStateMonitor;
      v6->_pocketStateMonitor = (SBPocketStateMonitor *)v45;

      -[SBPocketStateMonitor addObserver:](v6->_pocketStateMonitor, "addObserver:", v6);
      -[SBAmbientPresentationController _updateMotionDetection](v6, "_updateMotionDetection");
      -[SBAmbientPresentationController _updateViewObstructedSuppressionManager](v6, "_updateViewObstructedSuppressionManager");
      v47 = objc_alloc_init(SBAmbientAuthenticationIdleTimer);
      authenticationIdleTimer = v6->_authenticationIdleTimer;
      v6->_authenticationIdleTimer = v47;

      v49 = (AMUIWidgetHostManager *)objc_alloc_init(MEMORY[0x1E0CF78F8]);
      widgetHostManager = v6->_widgetHostManager;
      v6->_widgetHostManager = v49;
      v51 = v49;

      -[SBAmbientPresentationController _setupStateCaptureBlock](v6, "_setupStateCaptureBlock");
      v52 = [SBAmbientWirelessChargingIdleTimer alloc];
      objc_msgSend((id)SBApp, "screenSleepCoordinator");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[SBAmbientWirelessChargingIdleTimer initWithAmbientPresentationController:screenSleepCoordinator:uiController:](v52, "initWithAmbientPresentationController:screenSleepCoordinator:uiController:", v6, v53, v54);
      wirelessChargingIdleTimer = v6->_wirelessChargingIdleTimer;
      v6->_wirelessChargingIdleTimer = (SBAmbientWirelessChargingIdleTimer *)v55;

      -[SBAmbientWirelessChargingIdleTimer setEnabled:](v6->_wirelessChargingIdleTimer, "setEnabled:", 1);
      objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObserver:", v6);
      objc_msgSend(v57, "state");
      v58 = objc_claimAutoreleasedReturnValue();
      lastKeyBagState = v6->_lastKeyBagState;
      v6->_lastKeyBagState = (SBFMobileKeyBagState *)v58;

      -[SBAmbientPresentationController _fetchDefaultWidgetStacks](v6, "_fetchDefaultWidgetStacks");
    }
  }
LABEL_15:

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_alwaysOnPolicyCoordinator);
  objc_msgSend(WeakRetained, "removeExternalPolicy:", self);
  -[SBAmbientIdleTimerController removeObserver:](self->_ambientIdleTimerController, "removeObserver:", self);
  -[SBAmbientMotionDetectionWakeAttributeMonitor removeObserver:](self->_motionDetectionWakeAttributeMonitor, "removeObserver:", self);
  -[AMAmbientPresentationTriggerManager removeObserver:](self->_ambientTriggerManager, "removeObserver:", self);
  -[AMRedModeTriggerManager removeObserver:](self->_redModeTriggerManager, "removeObserver:", self);
  -[SBSecureAppManager removeWakeDestinationProvider:](self->_secureAppManager, "removeWakeDestinationProvider:", self);
  -[BSInvalidatable invalidate](self->_bumpToWakeAssertion, "invalidate");
  -[BLSAssertion invalidate](self->_enableIdleTimerAssertion, "invalidate");
  -[TRAParticipant invalidate](self->_traitsArbiterParticipant, "invalidate");
  -[BSInvalidatable invalidate](self->_disableIdleTimerAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_systemApertureLockElementSuppressionAssertion, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SBAmbientPresentationController;
  -[SBAmbientPresentationController dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)isPresentationRequested
{
  return self->_presentationRequested;
}

- (BOOL)presentIfAllowedAndLockWithCompletion:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;
  id buf[2];
  os_activity_scope_state_s state;

  v4 = a3;
  if (-[SBAmbientPresentationController isPresented](self, "isPresented"))
  {
    v5 = 0;
    if (!v4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v6 = _os_activity_create(&dword_1D0540000, "presentIfAllowedAndLockWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  SBLogAmbientPresentation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Requesting ambient presentation on device lock", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBAmbientPresentationController_presentIfAllowedAndLockWithCompletion___block_invoke;
  v10[3] = &unk_1E8EAFF98;
  v8 = v6;
  v11 = v8;
  objc_copyWeak(&v13, buf);
  v12 = v4;
  v5 = -[SBAmbientPresentationController _evaluatePresentationStateIgnoreLockState:animated:withCompletion:](self, "_evaluatePresentationStateIgnoreLockState:animated:withCompletion:", 1, 1, v10);
  self->_shouldSuppressTransientLockIfKeyBagLocks = v5;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__resetTransientLockSuppressionFlag, 0);
  -[SBAmbientPresentationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__resetTransientLockSuppressionFlag, 0, 5.0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
  os_activity_scope_leave(&state);

  if (v4)
  {
LABEL_7:
    if (!v5)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
LABEL_9:

  return v5;
}

void __73__SBAmbientPresentationController_presentIfAllowedAndLockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v8);
  SBLogAmbientPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "presentIfAllowedAndLockWithCompletion: completion called (finished: %{BOOL}u)", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if ((_DWORD)a2)
    objc_msgSend(WeakRetained, "_presentLockUIAnimated:withCompletion:", 0, 0);
  objc_msgSend(v6, "_evaluateTriggerDetectionState");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

  os_activity_scope_leave(&v8);
}

- (BOOL)suppressNotificationPresentation
{
  if ((-[AMAmbientDefaults isFirstPresentation](self->_ambientDefaults, "isFirstPresentation") & 1) != 0)
    return 1;
  else
    return -[AMAmbientDefaults notificationsEnabled](self->_ambientDefaults, "notificationsEnabled") ^ 1;
}

- (BOOL)notificationsPreviewOnTapOnly
{
  return -[AMAmbientDefaults notificationsPreviewOnTapOnlyEnabled](self->_ambientDefaults, "notificationsPreviewOnTapOnlyEnabled");
}

- (void)ambientPresentationManager:(id)a3 didUpdateTriggerState:(int64_t)a4 analogousTriggerEvents:(BOOL)a5
{
  -[SBAmbientPresentationController _updateAmbientTriggerState:analogousTriggerEvents:withReason:](self, "_updateAmbientTriggerState:analogousTriggerEvents:withReason:", a4, a5, CFSTR("SBAmbientPresentationReasonTriggerManagerObserver"));
}

- (void)ambientPresentationManager:(id)a3 didUpdateMountState:(int64_t)a4
{
  -[SBAmbientPresentationController _updateAmbientMountState:withReason:](self, "_updateAmbientMountState:withReason:", a4, CFSTR("SBAmbientPresentationReasonTriggerManagerObserver"));
}

- (BOOL)isAlwaysOnPolicyActive
{
  return 1;
}

- (NSString)analyticsPolicyName
{
  return (NSString *)CFSTR("ambient");
}

- (id)analyticsPolicyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableAlwaysOnAssertion != 0);
}

- (void)redModeTriggerManager:(id)a3 didUpdateRedModeTriggeredState:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v4 = a4;
  v8 = *MEMORY[0x1E0C80C00];
  SBLogAmbientPresentation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Trigger manager toggling ambient red mode [ enabled : %{BOOL}d ]", (uint8_t *)v7, 8u);
  }

  -[SBAmbientPresentationController _setAmbientDisplayStyle:forReason:](self, "_setAmbientDisplayStyle:forReason:", v4, CFSTR("Red Mode Trigger"));
}

- (void)ambientTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  -[SBAmbientPresentationController _setPresented:](self, "_setPresented:", 0);
}

- (void)ambientTransientOverlayViewController:(id)a3 viewDidDisappear:(BOOL)a4
{
  if (self->_transientOverlay == a3)
    -[SBAmbientPresentationController _setPresented:animated:](self, "_setPresented:animated:", 0, 0);
}

- (void)ambientTransientOverlayViewControllerWillBeginConfiguration:(id)a3
{
  if (-[SBAmbientPresentationController ambientDisplayStyle](self, "ambientDisplayStyle", a3) == 1)
    -[SBAmbientPresentationController _setAmbientDisplayStyle:forReason:](self, "_setAmbientDisplayStyle:forReason:", 0, CFSTR("Configuration"));
  -[SBAmbientPresentationController _evaluateRedModeTriggerDetectionState](self, "_evaluateRedModeTriggerDetectionState");
  -[SBAmbientPresentationController _evaluateAuthenticationIdleTimerEnablement](self, "_evaluateAuthenticationIdleTimerEnablement");
}

- (void)ambientTransientOverlayViewControllerWillEndConfiguration:(id)a3
{
  -[SBAmbientPresentationController _setAmbientDisplayStyle:forReason:](self, "_setAmbientDisplayStyle:forReason:", -[SBAmbientPresentationController _isRedModeTriggered](self, "_isRedModeTriggered", a3), CFSTR("Configuration"));
  -[SBAmbientPresentationController _evaluateRedModeTriggerDetectionState](self, "_evaluateRedModeTriggerDetectionState");
  -[SBAmbientPresentationController _evaluateAuthenticationIdleTimerEnablement](self, "_evaluateAuthenticationIdleTimerEnablement");
}

- (void)ambientTransientOverlayViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  -[SBAmbientPresentationController _setAmbientTransientOverlayIsShowingPasscode:](self, "_setAmbientTransientOverlayIsShowingPasscode:", a4);
}

- (id)widgetHostManagerForAmbientTransientOverlayViewController:(id)a3
{
  return self->_widgetHostManager;
}

- (id)ambientDefaultsForAmbientTransientOverlayViewController:(id)a3
{
  return self->_ambientDefaults;
}

- (void)ambientTransientOverlayViewController:(id)a3 didUpdateActiveConfiguration:(id)a4 withMetadata:(id)a5
{
  -[SBAmbientTelemetryEmitter logTelemetryForAmbientConfigurationUpdate:metadata:](self->_telemetryEmitter, "logTelemetryForAmbientConfigurationUpdate:metadata:", a4, a5);
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  SBAmbientTelemetryEmitter *telemetryEmitter;
  _BOOL8 presented;
  id v9;

  -[SBAmbientPresentationController _evaluateBumpToWakeEnablement](self, "_evaluateBumpToWakeEnablement", a3, a4, a5);
  -[SBAmbientPresentationController _evaluateAuthenticationIdleTimerEnablement](self, "_evaluateAuthenticationIdleTimerEnablement");
  telemetryEmitter = self->_telemetryEmitter;
  presented = self->_presented;
  -[SBAmbientTransientOverlayViewController activeConfiguration](self->_transientOverlay, "activeConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAmbientTelemetryEmitter logTelemetryForAmbientPresented:withBacklightState:screenOffWithConfiguration:](telemetryEmitter, "logTelemetryForAmbientPresented:withBacklightState:screenOffWithConfiguration:", presented, a4, v9);

}

- (SBWakeDestinationHandling)wakeDestinationHandler
{
  if (self->_presentationRequested)
    return (SBWakeDestinationHandling *)self;
  else
    return (SBWakeDestinationHandling *)0;
}

- (BOOL)wakeToContentForWakeDestination:(id)a3 unlockSource:(int)a4
{
  if (a4 == 32)
    return 0;
  -[SBAmbientPresentationController _evaluatePresentationStateIgnoreLockState:animated:withCompletion:](self, "_evaluatePresentationStateIgnoreLockState:animated:withCompletion:", 0, 0, 0);
  return -[SBAmbientPresentationController isPresented](self, "isPresented");
}

- (void)ambientIdleTimerController:(id)a3 didChangeIdleTimerBehavior:(id)a4
{
  id v6;

  v6 = a3;
  -[SBAmbientTransientOverlayViewController setAmbientIdleTimerBehaviorProvider:](self->_transientOverlay, "setAmbientIdleTimerBehaviorProvider:", a4);
  if (-[SBAmbientPresentationController isPresented](self, "isPresented"))
    -[SBAmbientTelemetryEmitter logTelemetryForSleepSuppressionActive:](self->_telemetryEmitter, "logTelemetryForSleepSuppressionActive:", objc_msgSend(v6, "isAmbientSuppressed"));

}

- (void)ambientIdleTimerControllerSuppressionDidEnd:(id)a3
{
  if (self->_presented || self->_presentationRequested)
    -[SBLockScreenManager requestUserAttentionScreenWakeFromSource:reason:](self->_lockScreenManager, "requestUserAttentionScreenWakeFromSource:reason:", 13, CFSTR("Ambient suppression ended"));
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "updateOrientationPreferencesWithBlock:", &__block_literal_global_347);
  objc_msgSend(v4, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_77_3);

}

void __75__SBAmbientPresentationController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setSupportedOrientations:", 24);
  objc_msgSend(v2, "setCanDetermineActiveOrientation:", 1);

}

uint64_t __75__SBAmbientPresentationController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", *MEMORY[0x1E0CEBBD0] + 5.0);
}

- (id)timeIntervalsWithReasonsForScheduledTimersForAmbientScheduledAlarmObserver:(id)a3
{
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("SBAmbientAlarmScheduledTimerReasonRedModeOverride");
  v4[1] = CFSTR("SBAmbientAlarmScheduledTimerReasonDisplayWake");
  v5[0] = &unk_1E91CFA38;
  v5[1] = &unk_1E91CFA38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)scheduledAlarmObserver:(id)a3 timerFiredForReason:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SBAmbientAlarmScheduledTimerReasonRedModeOverride")))
  {
    SBLogAmbientPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing ambient red mode for upcoming alarm", buf, 2u);
    }

    self->_suppressRedModeDisplayStyleForUpcomingAlarm = 1;
    -[SBAmbientPresentationController _setAmbientDisplayStyle:forReason:](self, "_setAmbientDisplayStyle:forReason:", 0, CFSTR("Alarm"));
    -[SBAmbientPresentationController _evaluateRedModeTriggerDetectionState](self, "_evaluateRedModeTriggerDetectionState");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SBAmbientAlarmScheduledTimerReasonDisplayWake"))
         && -[SBAmbientSettings enableSuppression](self->_ambientSettings, "enableSuppression"))
  {
    SBLogAmbientPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Waking up display for upcoming alarm", v8, 2u);
    }

    self->_suppressIdleTimerForUpcomingAlarm = 1;
    -[SBAmbientPresentationController _evaluateIdleTimerEnablement](self, "_evaluateIdleTimerEnablement");
    -[SBAmbientPresentationController _evaluateIdleTimerDisablement](self, "_evaluateIdleTimerDisablement");
    if (-[SBBacklightController shouldTurnOnScreenForBacklightSource:](self->_backlightController, "shouldTurnOnScreenForBacklightSource:", 42))
    {
      -[SBBacklightController setBacklightState:source:](self->_backlightController, "setBacklightState:source:", 1, 42);
    }
  }

}

- (void)secureAppOfTypeDidBegin:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[SBAmbientPresentationController isPresented](self, "isPresented"))
  {
    SBLogAmbientPresentation();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      secureAppTypeName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing Ambient for secure app %{public}@ begin", (uint8_t *)&v6, 0xCu);

    }
    -[SBAmbientPresentationController _setPresented:animated:](self, "_setPresented:animated:", 0, 1);
  }
}

- (void)pocketStateMonitor:(id)a3 pocketStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  if (!a4 || !a5)
    -[SBAmbientPresentationController _evaluatePresentationState](self, "_evaluatePresentationState", a3);
}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  if (a4 == 4)
    -[SBAmbientTelemetryEmitter logTelemetryForBumpEventIgnored:](self->_telemetryEmitter, "logTelemetryForBumpEventIgnored:", 0, 4, a5);
}

- (void)liftToWakeController:(id)a3 didIgnoreTransition:(int64_t)a4
{
  if (a4 == 4)
    -[SBAmbientTelemetryEmitter logTelemetryForBumpEventIgnored:](self->_telemetryEmitter, "logTelemetryForBumpEventIgnored:", 1);
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "type");
  v5 = 0;
  if (v4 == 9 || v4 == 25)
    goto LABEL_5;
  if (v4 == 36)
  {
    v5 = 1;
LABEL_5:
    -[SBAmbientPresentationController _setCoverSheetPresentedByUserGesture:](self, "_setCoverSheetPresentedByUserGesture:", v5);
  }
  return 0;
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

uint64_t __65__SBAmbientPresentationController_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayTransientLockElementIfNecessaryForKeyBagState:", *(_QWORD *)(a1 + 40));
}

- (void)_lockStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("SBAggregateLockStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 || !self->_presentationRequested)
    -[SBAmbientPresentationController _evaluateTriggerDetectionState](self, "_evaluateTriggerDetectionState");
  -[SBAmbientPresentationController _updateViewObstructedSuppressionManager](self, "_updateViewObstructedSuppressionManager");
}

- (void)_carPlayPresentationDidChange:(id)a3
{
  void *v4;
  int v5;

  if (-[SBAmbientPresentationController isPresented](self, "isPresented", a3))
  {
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCarDestinationActive");

    if (v5)
      -[SBAmbientPresentationController _evaluatePresentationState](self, "_evaluatePresentationState");
  }
}

- (BOOL)_isAmbientPresentationAllowedIgnoreLockState:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  int v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  int v27;
  NSObject *v28;
  _BOOL4 isViewObstructedSuppressionActive;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  _BOOL4 v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  int v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v3 = a3;
  v67 = *MEMORY[0x1E0C80C00];
  v5 = -[SBAmbientPresentationController _isAmbientModeUserSettingEnabled](self, "_isAmbientModeUserSettingEnabled");
  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "lockState");

  v9 = (v7 & 4) == 0 && v7 != 0;
  v36 = v9;
  objc_msgSend((id)SBApp, "authenticationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v10, "hasAuthenticatedAtLeastOnceSinceBoot");

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v11, "isCarDestinationActive");

  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v12, "isConnectedToWindowedAccessory");

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "coverSheetViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBSecureAppManager hasSecureApp](self->_secureAppManager, "hasSecureApp"))
    v32 = 1;
  else
    v32 = objc_msgSend(v14, "isHostingAnApp");
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v15, "isInSetupMode");

  v16 = -[SBPocketStateMonitor pocketState](self->_pocketStateMonitor, "pocketState");
  isViewObstructedSuppressionActive = self->_isViewObstructedSuppressionActive;
  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasBeenDismissedSinceKeybagLock");

  if (v18)
  {
    v19 = objc_msgSend(v14, "isInteractingWithNotificationList");
    v20 = -[SBAmbientPresentationController _isCoverSheetPresentedByUserGesture](self, "_isCoverSheetPresentedByUserGesture");
  }
  else
  {
    v19 = 0;
    v20 = 0;
  }
  objc_msgSend(v14, "coverSheetSpotlightPresenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isSpotlightPresented");

  v23 = objc_msgSend(v14, "isShowingTodayView");
  v24 = v23;
  v25 = v5;
  if (v5)
  {
    v26 = v3;
    if (!(((v36 || v3) & v35 ^ 1 | v34 | v33 | v32) & 1 | v31 & 1 | (v16 != 0) | isViewObstructedSuppressionActive | v19 & 1 | v20))
    {
      v27 = (v22 | v23) ^ 1;
      goto LABEL_18;
    }
  }
  else
  {
    v26 = v3;
  }
  v27 = 0;
LABEL_18:
  SBLogAmbientPresentation();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67112704;
    v38 = v27;
    v39 = 1024;
    v40 = v25;
    v41 = 1024;
    v42 = v36;
    v43 = 1024;
    v44 = v26;
    v45 = 1024;
    v46 = v35;
    v47 = 1024;
    v48 = v34;
    v49 = 1024;
    v50 = v33;
    v51 = 1024;
    v52 = v32;
    v53 = 1024;
    v54 = v31;
    v55 = 1024;
    v56 = v16 == 0;
    v57 = 1024;
    v58 = isViewObstructedSuppressionActive;
    v59 = 1024;
    v60 = v19;
    v61 = 1024;
    v62 = v20;
    v63 = 1024;
    v64 = v22;
    v65 = 1024;
    v66 = v24;
    _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Ambient presentation allowed = %{BOOL}d [ enabled:%{BOOL}d ; lockedButNotBlocked:%{BOOL}d ; ignoreLockState:%{BOOL"
      "}d ; unlockedSinceBoot:%{BOOL}d ; carplay:%{BOOL}d ; screenOccludingAccessory:%{BOOL}d ; hostingApp:%{BOOL}d ; isI"
      "nSetupMode:%{BOOL}d ; isOutOfPocket:%{BOOL}d ; isViewObstructed:%{BOOL}d ; listInteraction:%{BOOL}d ; pullDownCove"
      "rSheet:%{BOOL}d ; spotlight:%{BOOL}d ; todayView:%{BOOL}d ]",
      buf,
      0x5Cu);
  }

  return v27;
}

- (void)_updateAmbientTriggerState:(int64_t)a3 analogousTriggerEvents:(BOOL)a4 withReason:(id)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  SBLogAmbientPresentation();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    AMStringForAmbientTriggerState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2114;
    v14 = v8;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Updating ambient presentation trigger state to '%{public}@' with reason: '%{public}@' [ analogousTriggerEvents : %{BOOL}d ]", (uint8_t *)&v11, 0x1Cu);

  }
  self->_presentationRequested = a3 == 1;
  -[SBAmbientPresentationController _evaluatePresentationState](self, "_evaluatePresentationState");
  -[SBAmbientPresentationController _updateScheduledAlarmObserverForPresentationRequested:](self, "_updateScheduledAlarmObserverForPresentationRequested:", self->_presentationRequested);

}

- (void)_updateAmbientMountState:(int64_t)a3 withReason:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogAmbientPresentation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    AMStringForAmbientMountState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Updating ambient presentation mount state to '%{public}@' with reason: '%{public}@'", (uint8_t *)&v9, 0x16u);

  }
  -[SBAmbientPresentationController _updatePresentationPossibleForMountState:](self, "_updatePresentationPossibleForMountState:", a3);

}

- (void)_evaluateTriggerDetectionState
{
  -[SBAmbientPresentationController _evaluateTriggerDetectionStateIgnoreLockState:](self, "_evaluateTriggerDetectionStateIgnoreLockState:", 0);
}

- (void)_evaluateTriggerDetectionStateIgnoreLockState:(BOOL)a3
{
  _BOOL8 v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = -[SBAmbientPresentationController _isAmbientPresentationAllowedIgnoreLockState:](self, "_isAmbientPresentationAllowedIgnoreLockState:", a3);
  SBLogAmbientPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Evaluating trigger detection state [ shouldEnable : %{BOOL}d ]", (uint8_t *)v6, 8u);
  }

  -[AMAmbientPresentationTriggerManager setPresentationDetectionEnabled:](self->_ambientTriggerManager, "setPresentationDetectionEnabled:", v4);
  -[SBAmbientPresentationController _evaluateRedModeTriggerDetectionState](self, "_evaluateRedModeTriggerDetectionState");
}

- (void)_evaluateRedModeTriggerDetectionState
{
  uint64_t v3;
  SBAmbientTransientOverlayViewController *transientOverlay;

  if (-[AMAmbientPresentationTriggerManager isPresentationDetectionEnabled](self->_ambientTriggerManager, "isPresentationDetectionEnabled")&& -[SBAmbientPresentationController _isNightModeUserSettingEffectivelyEnabled](self, "_isNightModeUserSettingEffectivelyEnabled")&& !self->_suppressRedModeDisplayStyleForUpcomingAlarm)
  {
    transientOverlay = self->_transientOverlay;
    if (transientOverlay)
      v3 = -[SBAmbientTransientOverlayViewController isConfiguringUIVisible](transientOverlay, "isConfiguringUIVisible") ^ 1;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  -[AMRedModeTriggerManager setRedModeDetectionEnabled:](self->_redModeTriggerManager, "setRedModeDetectionEnabled:", v3);
}

- (BOOL)_evaluatePresentationState
{
  return -[SBAmbientPresentationController _evaluatePresentationStateIgnoreLockState:animated:withCompletion:](self, "_evaluatePresentationStateIgnoreLockState:animated:withCompletion:", 0, 1, 0);
}

- (BOOL)_evaluatePresentationStateIgnoreLockState:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _BOOL8 v9;
  BLSAssertion *disableAlwaysOnAssertion;
  void *v11;
  void *v12;
  void *v13;
  BLSAssertion *v14;
  BLSAssertion *v15;
  BLSAssertion *v16;
  _QWORD v18[2];

  v5 = a4;
  v6 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = self->_presentationRequested
    && -[SBAmbientPresentationController _isAmbientPresentationAllowedIgnoreLockState:](self, "_isAmbientPresentationAllowedIgnoreLockState:", v6);
  -[SBAmbientPresentationController _setPresented:animated:withCompletion:](self, "_setPresented:animated:withCompletion:", v9, v5, v8);
  disableAlwaysOnAssertion = self->_disableAlwaysOnAssertion;
  if (self->_presentationRequested)
  {
    if (!disableAlwaysOnAssertion)
    {
      v11 = (void *)MEMORY[0x1E0D00F48];
      objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acquireWithExplanation:observer:attributes:", CFSTR("ambient"), 0, v13);
      v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
      v15 = self->_disableAlwaysOnAssertion;
      self->_disableAlwaysOnAssertion = v14;

    }
  }
  else if (disableAlwaysOnAssertion)
  {
    -[BLSAssertion invalidate](disableAlwaysOnAssertion, "invalidate");
    v16 = self->_disableAlwaysOnAssertion;
    self->_disableAlwaysOnAssertion = 0;

  }
  -[SBAmbientPresentationController _updateSleepSuppression](self, "_updateSleepSuppression");
  -[SBAmbientPresentationController _evaluateBumpToWakeEnablement](self, "_evaluateBumpToWakeEnablement");
  -[SBAmbientPresentationController _updateMotionDetection](self, "_updateMotionDetection");
  -[SBAmbientPresentationController _evaluateIdleTimerEnablement](self, "_evaluateIdleTimerEnablement");
  -[SBAmbientPresentationController _evaluateTriggerDetectionStateIgnoreLockState:](self, "_evaluateTriggerDetectionStateIgnoreLockState:", v6);

  return v9;
}

- (void)_evaluateBumpToWakeEnablement
{
  NSObject *v3;
  BSInvalidatable *v4;
  BSInvalidatable *bumpToWakeAssertion;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (!-[SBBacklightController screenIsOn](self->_backlightController, "screenIsOn")
    && self->_presentationRequested
    && -[SBAmbientPresentationController _isBumpToWakeUserSettingEnabled](self, "_isBumpToWakeUserSettingEnabled"))
  {
    if (self->_bumpToWakeAssertion)
      return;
    SBLogAmbientPresentation();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Enabling bump-to-wake", buf, 2u);
    }

    -[SBLiftToWakeController acquireBumpToWakeEnableAssertionForReason:](self->_liftToWakeController, "acquireBumpToWakeEnableAssertionForReason:", CFSTR("Ambient"));
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    bumpToWakeAssertion = self->_bumpToWakeAssertion;
    self->_bumpToWakeAssertion = v4;
  }
  else
  {
    if (!self->_bumpToWakeAssertion)
      return;
    SBLogAmbientPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Disabling bump-to-wake", v7, 2u);
    }

    -[BSInvalidatable invalidate](self->_bumpToWakeAssertion, "invalidate");
    bumpToWakeAssertion = self->_bumpToWakeAssertion;
    self->_bumpToWakeAssertion = 0;
  }

}

- (void)_evaluateIdleTimerEnablement
{
  int v3;
  NSObject *v4;
  _BOOL4 presentationRequested;
  _BOOL4 suppressIdleTimerForUpcomingAlarm;
  _BOOL4 v7;
  _BOOL4 v8;
  BLSAssertion *enableIdleTimerAssertion;
  void *v10;
  void *v11;
  void *v12;
  BLSAssertion *v13;
  BLSAssertion *v14;
  void *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_presentationRequested && !self->_suppressIdleTimerForUpcomingAlarm)
    v3 = !-[SBAmbientPresentationController _isAmbientAlwaysOnUserSettingEnabled](self, "_isAmbientAlwaysOnUserSettingEnabled");
  else
    v3 = 0;
  SBLogAmbientPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    presentationRequested = self->_presentationRequested;
    suppressIdleTimerForUpcomingAlarm = self->_suppressIdleTimerForUpcomingAlarm;
    v7 = -[SBAmbientPresentationController _isAmbientAlwaysOnUserSettingEnabled](self, "_isAmbientAlwaysOnUserSettingEnabled");
    v8 = self->_enableIdleTimerAssertion != 0;
    *(_DWORD *)buf = 67110144;
    v17 = v3;
    v18 = 1024;
    v19 = presentationRequested;
    v20 = 1024;
    v21 = suppressIdleTimerForUpcomingAlarm;
    v22 = 1024;
    v23 = v7;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Evaluating idle timer enablement - Enable = %{BOOL}d [ presentationRequested:%{BOOL}d ; suppressForAlarm:%{BOOL}d "
      "; userSetting:%{BOOL}d ; assertion=%{BOOL}d ]",
      buf,
      0x20u);
  }

  enableIdleTimerAssertion = self->_enableIdleTimerAssertion;
  if (v3)
  {
    if (enableIdleTimerAssertion)
      return;
    v10 = (void *)MEMORY[0x1E0D00F48];
    objc_msgSend(MEMORY[0x1E0CF78A8], "allowAmbientIdleTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acquireWithExplanation:observer:attributes:", CFSTR("Ambient Always-On Setting"), 0, v12);
    v13 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    v14 = self->_enableIdleTimerAssertion;
    self->_enableIdleTimerAssertion = v13;

  }
  else
  {
    if (!enableIdleTimerAssertion)
      return;
    -[BLSAssertion invalidate](enableIdleTimerAssertion, "invalidate");
    v11 = self->_enableIdleTimerAssertion;
    self->_enableIdleTimerAssertion = 0;
  }

}

- (void)_evaluateIdleTimerDisablement
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 presentationRequested;
  _BOOL4 suppressIdleTimerForUpcomingAlarm;
  _BOOL4 v7;
  _BOOL4 v8;
  BSInvalidatable *disableIdleTimerAssertion;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = self->_presentationRequested
    && self->_suppressIdleTimerForUpcomingAlarm
    && -[SBAmbientSettings enableSuppression](self->_ambientSettings, "enableSuppression");
  SBLogAmbientPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    presentationRequested = self->_presentationRequested;
    suppressIdleTimerForUpcomingAlarm = self->_suppressIdleTimerForUpcomingAlarm;
    v7 = -[SBAmbientSettings enableSuppression](self->_ambientSettings, "enableSuppression");
    v8 = self->_disableIdleTimerAssertion != 0;
    v13[0] = 67110144;
    v13[1] = v3;
    v14 = 1024;
    v15 = presentationRequested;
    v16 = 1024;
    v17 = suppressIdleTimerForUpcomingAlarm;
    v18 = 1024;
    v19 = v7;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Evaluating idle timer disablement - Disable = %{BOOL}d [ presentationRequested:%{BOOL}d ; suppressForAlarm:%{BOOL}"
      "d ; suppressionEnabled:%{BOOL}d ; assertion=%{BOOL}d ]",
      (uint8_t *)v13,
      0x20u);
  }

  disableIdleTimerAssertion = self->_disableIdleTimerAssertion;
  if (v3)
  {
    if (disableIdleTimerAssertion)
      return;
    +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists](SBIdleTimerGlobalCoordinator, "sharedInstanceIfExists");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acquireIdleTimerDisableAssertionForReason:", CFSTR("Ambient Suppression"));
    v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_disableIdleTimerAssertion;
    self->_disableIdleTimerAssertion = v11;

  }
  else
  {
    if (!disableIdleTimerAssertion)
      return;
    -[BSInvalidatable invalidate](disableIdleTimerAssertion, "invalidate");
    v10 = self->_disableIdleTimerAssertion;
    self->_disableIdleTimerAssertion = 0;
  }

}

- (void)_evaluateAuthenticationIdleTimerEnablement
{
  -[SBAmbientAuthenticationIdleTimer setEnabled:](self->_authenticationIdleTimer, "setEnabled:", -[SBAmbientPresentationController isPresented](self, "isPresented") & -[SBBacklightController screenIsOn](self->_backlightController, "screenIsOn") & ((-[SBAmbientTransientOverlayViewController isConfiguringUIVisible](self->_transientOverlay, "isConfiguringUIVisible") | -[SBAmbientTransientOverlayViewController wantsIdleTimerDisabled](self->_transientOverlay, "wantsIdleTimerDisabled")) ^ 1));
}

- (void)_setSystemApertureProudLockElementHidden:(BOOL)a3
{
  BSInvalidatable *systemApertureLockElementSuppressionAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;

  systemApertureLockElementSuppressionAssertion = self->_systemApertureLockElementSuppressionAssertion;
  if (a3)
  {
    if (systemApertureLockElementSuppressionAssertion)
      return;
    -[SBLockScreenManager acquireSystemApertureLockElementSuppressionAssertionWithReason:](self->_lockScreenManager, "acquireSystemApertureLockElementSuppressionAssertionWithReason:", CFSTR("Ambient presented"));
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!systemApertureLockElementSuppressionAssertion)
      return;
    -[BSInvalidatable invalidate](systemApertureLockElementSuppressionAssertion, "invalidate");
    v5 = 0;
  }
  v6 = self->_systemApertureLockElementSuppressionAssertion;
  self->_systemApertureLockElementSuppressionAssertion = v5;

}

- (void)_displayTransientLockElementIfNecessaryForKeyBagState:(id)a3
{
  id v4;
  char v5;
  int v6;
  SBFMobileKeyBagState *lastKeyBagState;

  v4 = a3;
  v5 = -[SBFMobileKeyBagState isEffectivelyLocked](self->_lastKeyBagState, "isEffectivelyLocked");
  v6 = objc_msgSend(v4, "isEffectivelyLocked");
  if ((v5 & 1) == 0 && v6 && !self->_shouldSuppressTransientLockIfKeyBagLocks)
  {
    -[SBAmbientPresentationController _setSystemApertureProudLockElementHidden:](self, "_setSystemApertureProudLockElementHidden:", 0);
    if ((SBUIIsSystemApertureEnabled() & 1) == 0)
      -[SBAmbientTransientOverlayViewController displayTransientProudLock](self->_transientOverlay, "displayTransientProudLock");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideLockElement, 0);
    -[SBAmbientPresentationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideLockElement, 0, 2.0);
  }
  -[SBAmbientPresentationController _resetTransientLockSuppressionFlag](self, "_resetTransientLockSuppressionFlag");
  lastKeyBagState = self->_lastKeyBagState;
  self->_lastKeyBagState = (SBFMobileKeyBagState *)v4;

}

- (void)_hideLockElement
{
  if (self->_presented)
    -[SBAmbientPresentationController _setSystemApertureProudLockElementHidden:](self, "_setSystemApertureProudLockElementHidden:", 1);
}

- (void)_resetTransientLockSuppressionFlag
{
  if (self->_shouldSuppressTransientLockIfKeyBagLocks)
    self->_shouldSuppressTransientLockIfKeyBagLocks = 0;
}

- (void)_updateSleepSuppression
{
  SBAmbientIdleTimerController *ambientIdleTimerController;
  _BOOL8 v3;

  ambientIdleTimerController = self->_ambientIdleTimerController;
  v3 = self->_presentationRequested
    && -[SBAmbientPresentationController _shouldSuppressForSleep](self, "_shouldSuppressForSleep");
  -[SBAmbientIdleTimerController setSuppressForSleep:](ambientIdleTimerController, "setSuppressForSleep:", v3);
}

- (void)_setPresented:(BOOL)a3
{
  -[SBAmbientPresentationController _setPresented:animated:](self, "_setPresented:animated:", a3, 1);
}

- (void)_setPresented:(BOOL)a3 animated:(BOOL)a4
{
  -[SBAmbientPresentationController _setPresented:animated:withCompletion:](self, "_setPresented:animated:withCompletion:", a3, a4, 0);
}

- (void)_setPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _BOOL4 presented;
  SBAmbientTransientOverlayViewController *v20;
  SBAmbientTransientOverlayViewController *transientOverlay;
  SBAmbientTransientOverlayViewController *v22;
  void *v23;
  uint64_t v24;
  SBWorkspaceTransientOverlay *v25;
  void *v26;
  void *v27;
  SBWorkspaceTransientOverlay *v28;
  void *v29;
  SBWorkspaceTransientOverlay *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  SBWorkspaceTransientOverlay *v34;
  SBAmbientTransientOverlayViewController *v35;
  NSHashTable *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  _QWORD v50[4];
  SBWorkspaceTransientOverlay *v51;
  void (**v52)(_QWORD, _QWORD);
  unint64_t v53;
  BOOL v54;
  _QWORD v55[6];
  _QWORD v56[4];
  SBWorkspaceTransientOverlay *v57;
  SBAmbientPresentationController *v58;
  void (**v59)(_QWORD, _QWORD);
  unint64_t v60;
  BOOL v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  _BOOL4 v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  unint64_t v74;
  uint64_t v75;

  v6 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (self->_presented == v6)
  {
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }
  else
  {
    v42 = a4;
    v10 = self->_presentationGeneration + 1;
    self->_presentationGeneration = v10;
    -[SBAmbientPresentationController _updateTraitsArbiterParticipantForPresented:](self, "_updateTraitsArbiterParticipantForPresented:", v6);
    -[SBAmbientPresentationController _connectedChargerIdentifier](self, "_connectedChargerIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    SBLogAmbientPresentation();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v70 = v6;
      v71 = 2114;
      v72 = v11;
      v73 = 2048;
      v74 = v10;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Setting ambient overlay presented = %{BOOL}d with chargerId = %{public}@ (generation %lu)", buf, 0x1Cu);
    }

    self->_presented = v6;
    if (v6)
      -[SBAmbientPresentationController _updatePosterBoardWithChargerIdentifier:](self, "_updatePosterBoardWithChargerIdentifier:", v11);
    else
      -[SBAmbientPresentationController _setAmbientTransientOverlayIsShowingPasscode:](self, "_setAmbientTransientOverlayIsShowingPasscode:", 0);
    v43 = (void *)v11;
    -[SBAmbientPresentationController windowScene](self, "windowScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "isMainDisplayWindowScene"))
      -[SBAmbientPresentationController _setSystemApertureProudLockElementHidden:](self, "_setSystemApertureProudLockElementHidden:", v6);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v13 = self->_observers;
    v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "ambientPresentationController:willUpdatePresented:", self, self->_presented);
        }
        v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v15);
    }

    presented = self->_presented;
    -[SBAmbientPresentationController _dismissAllOtherAmbientTransientOverlays](self, "_dismissAllOtherAmbientTransientOverlays");
    if (presented)
    {
      -[SBAmbientPresentationController _setAmbientDisplayStyle:forReason:](self, "_setAmbientDisplayStyle:forReason:", -[SBAmbientPresentationController _isRedModeTriggered](self, "_isRedModeTriggered"), CFSTR("Presentation"));
      v20 = objc_alloc_init(SBAmbientTransientOverlayViewController);
      transientOverlay = self->_transientOverlay;
      self->_transientOverlay = v20;

      -[SBAmbientTransientOverlayViewController setDelegate:](self->_transientOverlay, "setDelegate:", self);
      v22 = self->_transientOverlay;
      -[SBAmbientIdleTimerController idleTimerBehaviorProvider](self->_ambientIdleTimerController, "idleTimerBehaviorProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAmbientTransientOverlayViewController setAmbientIdleTimerBehaviorProvider:](v22, "setAmbientIdleTimerBehaviorProvider:", v23);

      v24 = MEMORY[0x1E0C809B0];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke;
      v62[3] = &unk_1E8E9DED8;
      v62[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v62);
      v25 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", self->_transientOverlay);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "_sbDisplayConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v24;
      v56[1] = 3221225472;
      v56[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2;
      v56[3] = &unk_1E8EBD168;
      v60 = v10;
      v61 = v42;
      v57 = v25;
      v58 = self;
      v59 = v9;
      v55[0] = v24;
      v55[1] = 3221225472;
      v55[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_6;
      v55[3] = &unk_1E8EAADE0;
      v55[4] = self;
      v55[5] = v10;
      v28 = v25;
      objc_msgSend(v26, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v27, v56, v55);

    }
    else
    {
      +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "isPresented"))
        objc_msgSend(v29, "dismissAnimated:", 1);
      -[SBAmbientPresentationController _invalidateTransientOverlayWindowTraitsArbiterParticipantIfNeeded](self, "_invalidateTransientOverlayWindowTraitsArbiterParticipantIfNeeded");
      if (self->_transientOverlay)
      {
        v30 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", self->_transientOverlay);
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "_sbDisplayConfiguration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = MEMORY[0x1E0C809B0];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_112;
        v50[3] = &unk_1E8EBD1B0;
        v53 = v10;
        v51 = v30;
        v54 = v42;
        v52 = v9;
        v49[0] = v33;
        v49[1] = 3221225472;
        v49[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5_119;
        v49[3] = &unk_1E8EAADE0;
        v49[4] = self;
        v49[5] = v10;
        v34 = v30;
        objc_msgSend(v31, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v32, v50, v49);

      }
      else if (v9)
      {
        v9[2](v9, 0);
      }
      v35 = self->_transientOverlay;
      self->_transientOverlay = 0;

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v36 = self->_observers;
    v37 = -[NSHashTable countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v46 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v41, "ambientPresentationController:didUpdatePresented:", self, self->_presented);
        }
        v38 = -[NSHashTable countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
      }
      while (v38);
    }

    objc_msgSend(v44, "isMainDisplayWindowScene");
    IOPMUpdateDominoState();
    -[SBAmbientPresentationController _updateTelemetryIsPresented:](self, "_updateTelemetryIsPresented:", self->_presented);

  }
  -[SBAmbientPresentationController _evaluateAuthenticationIdleTimerEnablement](self, "_evaluateAuthenticationIdleTimerEnablement");

}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("PresentAmbientTransientOverlay(%llu)"), *(_QWORD *)(a1 + 56));
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_3;
  v11[3] = &unk_1E8E9F860;
  v5 = *(id *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  objc_msgSend(v3, "modifyTransientOverlayContext:", v11);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_108_0);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5;
  v9[3] = &unk_1E8E9F230;
  v7 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v8 = (id)objc_msgSend(v3, "addCompletionHandler:", v9);

}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 0);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v3, "setShouldDismissSiriUponPresentation:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "dismissesSiriForPresentation"));

}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "lockScreenEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passcodeViewPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isPasscodeLockVisible"))
    objc_msgSend(v4, "setPasscodeLockVisible:animated:", 0, 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);

}

BOOL __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
  if (v2 != v1)
  {
    SBLogAmbientPresentation();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
      v8 = 134218240;
      v9 = v6;
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Skipping superseded ambient overlay presentation (current generation %lu  request generation %lu)", (uint8_t *)&v8, 0x16u);
    }

  }
  return v2 == v1;
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = a2;
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("DismissAmbientTransientOverlay(%llu)"), *(_QWORD *)(a1 + 48));
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2_115;
  v8[3] = &unk_1E8E9F3E8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v3, "modifyTransientOverlayContext:", v8);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_117_1);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_4_118;
  v6[3] = &unk_1E8E9F1C0;
  v7 = *(id *)(a1 + 40);
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v6);

}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2_115(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 1);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_3_116(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_4_118(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5_119(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) != *(_QWORD *)(a1 + 40))
  {
    v3 = a2;
    SBLogAmbientPresentation();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
      v8 = 134218240;
      v9 = v6;
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Forcing superseded ambient overlay dismissal to be unanimated (current generation %lu  request generation %lu)", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v3, "modifyTransientOverlayContext:", &__block_literal_global_121_2);
  }
  return 1;
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_120(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimated:", 0);
}

- (void)_dismissAllOtherAmbientTransientOverlays
{
  void *v7;

  objc_msgSend(a2, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_fault_impl(&dword_1D0540000, a4, OS_LOG_TYPE_FAULT, "Found untracked transient overlay instance %@. Dismissing.", a1, 0xCu);

}

- (BOOL)_isRedModeTriggered
{
  int v3;

  v3 = -[SBAmbientPresentationController _isNightModeUserSettingEffectivelyEnabled](self, "_isNightModeUserSettingEffectivelyEnabled");
  if (v3)
    LOBYTE(v3) = -[AMRedModeTriggerManager isRedModeTriggered](self->_redModeTriggerManager, "isRedModeTriggered");
  return v3;
}

- (void)_setAmbientDisplayStyle:(int64_t)a3
{
  -[SBAmbientPresentationController _setAmbientDisplayStyle:forReason:](self, "_setAmbientDisplayStyle:forReason:", a3, CFSTR("Unknown"));
}

- (void)_setAmbientDisplayStyle:(int64_t)a3 forReason:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_ambientDisplayStyle != a3)
  {
    SBLogAmbientPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      AMUIAmbientDisplayStyleString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Setting ambient display style to %{public}@ for reason %{public}@", buf, 0x16u);

    }
    self->_ambientDisplayStyle = a3;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_observers;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "ambientPresentationController:didUpdateAmbientDisplayStyle:", self, a3, (_QWORD)v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (-[SBAmbientPresentationController isPresented](self, "isPresented"))
      -[SBAmbientTelemetryEmitter logTelemetryForAmbientPresented:displayStyle:](self->_telemetryEmitter, "logTelemetryForAmbientPresented:displayStyle:", self->_presented, self->_ambientDisplayStyle);
  }

}

- (void)_setAmbientTransientOverlayIsShowingPasscode:(BOOL)a3
{
  const __CFString *v4;
  id v5;

  if (self->_ambientTransientOverlayIsShowingPasscode != a3)
  {
    self->_ambientTransientOverlayIsShowingPasscode = a3;
    v4 = CFSTR("Dismissed");
    if (a3)
      v4 = CFSTR("Presented");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ambient Passcode %@"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager reevaluateSystemApertureLockElementSuppressionWithReason:](self->_lockScreenManager, "reevaluateSystemApertureLockElementSuppressionWithReason:", v5);

  }
}

- (void)_setCoverSheetPresentedByUserGesture:(BOOL)a3
{
  if (self->_coverSheetPresentedByUserGesture != a3)
  {
    self->_coverSheetPresentedByUserGesture = a3;
    -[SBAmbientPresentationController _evaluatePresentationState](self, "_evaluatePresentationState");
  }
}

- (void)_updatePresentationPossibleForMountState:(int64_t)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  dispatch_time_t v16;
  _QWORD v17[4];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_presentationPossible)
  {
    self->_presentationPossible = a3 == 1;
    if (!a3)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v4 = self->_observers;
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v25;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v25 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v9, "ambientPresentationControllerCancelledPossiblePresentation:", self);
            ++v8;
          }
          while (v6 != v8);
          v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v6);
      }

    }
  }
  else if (a3 == 1)
  {
    self->_presentationPossible = 1;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->_observers;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "ambientPresentationControllerWillPossiblyPresent:", self);
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v12);
    }

    if (!self->_presentationPossibleTimeoutConfigured)
    {
      self->_presentationPossibleTimeoutConfigured = 1;
      objc_initWeak(&location, self);
      v16 = dispatch_time(0, 5000000000);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__SBAmbientPresentationController__updatePresentationPossibleForMountState___block_invoke;
      v17[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v18, &location);
      dispatch_after(v16, MEMORY[0x1E0C80D38], v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __76__SBAmbientPresentationController__updatePresentationPossibleForMountState___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (*((_BYTE *)WeakRetained + 96))
  {
    *((_WORD *)WeakRetained + 48) = 0;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = WeakRetained[4];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "ambientPresentationControllerCancelledPossiblePresentation:", v2, (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)_updatePosterBoardWithChargerIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringToIndex:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogAmbientPresentation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushing chargerId '%@' to PosterBoard", buf, 0x16u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D7F710]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke;
    v11[3] = &unk_1E8EA9DF8;
    v12 = v6;
    v13 = v3;
    objc_msgSend(v8, "notifyActiveChargerIdentifierDidUpdate:completion:", v13, v11);

    v9 = v12;
  }
  else
  {
    SBLogAmbientPresentation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBAmbientPresentationController _updatePosterBoardWithChargerIdentifier:].cold.1((uint64_t)v6, v9, v10);
  }

}

void __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogAmbientPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully pushed charger update of '%@' to PosterBoard", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_updateMotionDetection
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  BSInvalidatable *v6;
  BSInvalidatable *motionToWakeEnableAssertion;
  SBAmbientTelemetryEmitter *telemetryEmitter;
  _BOOL8 v9;
  BSInvalidatable *v10;
  BSInvalidatable *v11;

  v3 = -[SBAmbientIdleTimerController isUserSleepPredicted](self->_ambientIdleTimerController, "isUserSleepPredicted");
  v4 = -[SBAmbientMotionDetectionWakeAttributeMonitor shouldEnableMotionDetectionWake](self->_motionDetectionWakeAttributeMonitor, "shouldEnableMotionDetectionWake");
  v5 = !self->_presentationRequested || !v3 && !v4;
  if (!v5
    && -[SBAmbientPresentationController _isMotionToWakePermitted](self, "_isMotionToWakePermitted")
    && -[SBAmbientPresentationController _isMotionToWakeUserSettingEnabled](self, "_isMotionToWakeUserSettingEnabled"))
  {
    if (self->_motionToWakeEnableAssertion)
      return;
    -[SBLockScreenManager acquireMotionDetectionWakeEnableAssertionWithReason:](self->_lockScreenManager, "acquireMotionDetectionWakeEnableAssertionWithReason:", CFSTR("Ambient Nighttime"));
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    motionToWakeEnableAssertion = self->_motionToWakeEnableAssertion;
    self->_motionToWakeEnableAssertion = v6;

    telemetryEmitter = self->_telemetryEmitter;
    v9 = self->_motionToWakeEnableAssertion != 0;
  }
  else
  {
    v10 = self->_motionToWakeEnableAssertion;
    if (!v10)
      return;
    -[BSInvalidatable invalidate](v10, "invalidate");
    v11 = self->_motionToWakeEnableAssertion;
    self->_motionToWakeEnableAssertion = 0;

    telemetryEmitter = self->_telemetryEmitter;
    v9 = 0;
  }
  -[SBAmbientTelemetryEmitter logTelemetryForMotionToWakeEnabled:](telemetryEmitter, "logTelemetryForMotionToWakeEnabled:", v9);
}

- (void)_updateTraitsArbiterParticipantForPresented:(BOOL)a3
{
  TRAParticipant *traitsArbiterParticipant;
  id WeakRetained;
  TRAParticipant *v6;
  TRAParticipant *v7;
  TRAParticipant *v8;
  void *v9;

  traitsArbiterParticipant = self->_traitsArbiterParticipant;
  if (a3)
  {
    if (!traitsArbiterParticipant)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(WeakRetained, "traitsArbiter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleAmbient"), self);
      v6 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
      v7 = self->_traitsArbiterParticipant;
      self->_traitsArbiterParticipant = v6;

      -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsArbiterParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("Ambient Presented"));
    }
  }
  else if (traitsArbiterParticipant)
  {
    -[TRAParticipant invalidate](traitsArbiterParticipant, "invalidate");
    v8 = self->_traitsArbiterParticipant;
    self->_traitsArbiterParticipant = 0;

  }
}

- (void)_invalidateTransientOverlayWindowTraitsArbiterParticipantIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;

  -[SBAmbientTransientOverlayViewController viewIfLoaded](self->_transientOverlay, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
  v11 = v7;

  v8 = -[SBAmbientTransientOverlayViewController isForegroundActive](self->_transientOverlay, "isForegroundActive");
  v9 = v11;
  if (v11 && v8)
  {
    objc_msgSend(v11, "traitsParticipant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    v9 = v11;
  }

}

- (void)_updateTelemetryIsPresented:(BOOL)a3
{
  _BOOL4 v3;
  SBAmbientTelemetryEmitter *telemetryEmitter;
  void *v6;
  void *v7;

  v3 = a3;
  if (a3)
    -[AMAmbientDefaults setLifetimePresentationCounter:](self->_ambientDefaults, "setLifetimePresentationCounter:", -[AMAmbientDefaults lifetimePresentationCounter](self->_ambientDefaults, "lifetimePresentationCounter") + 1);
  -[SBAmbientTelemetryEmitter logTelemetryForAmbientPresented:displayStyle:](self->_telemetryEmitter, "logTelemetryForAmbientPresented:displayStyle:", self->_presented, self->_ambientDisplayStyle);
  if (v3)
  {
    telemetryEmitter = self->_telemetryEmitter;
    -[SBAmbientTransientOverlayViewController activeConfiguration](self->_transientOverlay, "activeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAmbientTransientOverlayViewController activeConfigurationMetadata](self->_transientOverlay, "activeConfigurationMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAmbientTelemetryEmitter logTelemetryForAmbientConfigurationUpdate:metadata:](telemetryEmitter, "logTelemetryForAmbientConfigurationUpdate:metadata:", v6, v7);

    -[SBAmbientTelemetryEmitter logTelemetryForSleepSuppressionActive:](self->_telemetryEmitter, "logTelemetryForSleepSuppressionActive:", -[SBAmbientIdleTimerController isAmbientSuppressed](self->_ambientIdleTimerController, "isAmbientSuppressed"));
  }
}

- (void)_presentLockUIAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  SBLockScreenManager *lockScreenManager;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("SBUILockOptionsAnimateLockScreenActivationKey"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SBUILockOptionsPreserveTransientOverlaysKey"));
  lockScreenManager = self->_lockScreenManager;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SBAmbientPresentationController__presentLockUIAnimated_withCompletion___block_invoke;
  v11[3] = &unk_1E8E9F1C0;
  v12 = v6;
  v10 = v6;
  -[SBLockScreenManager lockUIFromSource:withOptions:completion:](lockScreenManager, "lockUIFromSource:withOptions:completion:", 13, v7, v11);

}

uint64_t __73__SBAmbientPresentationController__presentLockUIAnimated_withCompletion___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchDefaultWidgetStacks
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = self;
  objc_msgSend(v3, "performAfterFirstUnlockSinceBootUsingBlock:", v4);

}

void __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CF8D68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAmbientPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Fetching ambient default stacks from proactive after first unlock", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_149;
  v4[3] = &unk_1E8EBD1F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "fetchSmartStackOfVariant:completionHandler:", 3, v4);

}

void __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (unint64_t)objc_msgSend(v5, "count") > 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_widgetDescriptorsForATXStack:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_widgetDescriptorsForATXStack:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogAmbientPresentation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Setting ambient default proactive stacks: Leading:%@ Trailing:%@", buf, 0x16u);
    }

    if (v9 && v10)
    {
      v12 = *(void **)(a1 + 32);
      v14[0] = v9;
      v14[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDefaultWidgetStacks:", v13);

    }
  }
  else
  {
    SBLogAmbientPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_149_cold_1(v6, v7);
  }

}

- (id)_widgetDescriptorsForATXStack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "smallDefaultStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    SBLogAmbientPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBAmbientPresentationController _widgetDescriptorsForATXStack:].cold.1((uint64_t)v5, v6, v16);
    goto LABEL_20;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (!v7)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  v8 = v7;
  v18 = v5;
  v19 = v3;
  v9 = 0;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v12, "avocadoDescriptor", v18, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sanitizedDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!v9)
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v9, "addObject:", v14);
      }
      else
      {
        SBLogAmbientPresentation();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v12;
          _os_log_error_impl(&dword_1D0540000, v15, OS_LOG_TYPE_ERROR, "Widget in proactive default stack is missing a descriptor:%@", buf, 0xCu);
        }

      }
    }
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v8);
  v5 = v18;
  v3 = v19;
LABEL_21:

  return v9;
}

- (id)_connectedChargerIdentifier
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedWirelessChargerIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SBAmbientPresentationController _fetchConnectedWirelessChargerIdentifier](self, "_fetchConnectedWirelessChargerIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[SBAmbientPresentationController _fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails](self, "_fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
        v4 = (__CFString *)v5;
      else
        v4 = CFSTR("DefaultChargerIdentifier");
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SBAmbientChargerId"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fetchConnectedWirelessChargerIdentifier
{
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = IOPSCopyExternalPowerAdapterDetails();
  if (v3)
  {
    -[SBAmbientPresentationController _connectedWirelessChargerIdentifierForAdapterDetails:](self, "_connectedWirelessChargerIdentifierForAdapterDetails:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = (void *)objc_msgSend(v4, "copy");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails
{
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  void *CFProperty;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__106;
  v14 = __Block_byref_object_dispose__106;
  v15 = 0;
  v3 = IOServiceMatching("IOPMPowerSource");
  if (v3)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v3);
    v5 = MatchingService;
    if (MatchingService)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("AppleRawAdapterDetails"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __96__SBAmbientPresentationController__fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails__block_invoke;
      v9[3] = &unk_1E8EBD220;
      v9[4] = self;
      v9[5] = &v10;
      objc_msgSend(CFProperty, "enumerateObjectsUsingBlock:", v9);

    }
    IOObjectRelease(v5);
  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __96__SBAmbientPresentationController__fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_connectedWirelessChargerIdentifierForAdapterDetails:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    v7 = objc_msgSend(v6, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    *a4 = 1;
  }

}

- (id)_connectedWirelessChargerIdentifierForAdapterDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("FamilyCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAmbientPresentationController _isConnectedChargerInternalWirelessWithFamilyCode:](self, "_isConnectedChargerInternalWirelessWithFamilyCode:", objc_msgSend(v5, "intValue")))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = (void *)objc_msgSend(v6, "copy");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isConnectedChargerInternalWirelessWithFamilyCode:(int)a3
{
  return a3 == -536723450;
}

- (void)_observeAmbientUserSettingChanges
{
  AMAmbientDefaults *ambientDefaults;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  AMAmbientDefaults *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  AMAmbientDefaults *v14;
  void *v15;
  void *v16;
  id v17;
  AMAmbientDefaults *v18;
  void *v19;
  void *v20;
  id v21;
  AMAmbientDefaults *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  ambientDefaults = self->_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableAmbientMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke;
  v34[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v35, &location);
  v8 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](ambientDefaults, "observeDefaults:onQueue:withBlock:", v5, MEMORY[0x1E0C80D38], v34);

  v9 = self->_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nightModeEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysOnMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_2;
  v32[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v33, &location);
  v13 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](v9, "observeDefaults:onQueue:withBlock:", v12, MEMORY[0x1E0C80D38], v32);

  v14 = self->_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysOnMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_3;
  v30[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v31, &location);
  v17 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](v14, "observeDefaults:onQueue:withBlock:", v16, MEMORY[0x1E0C80D38], v30);

  v18 = self->_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bumpToWakeEnabled");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_4;
  v28[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v29, &location);
  v21 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](v18, "observeDefaults:onQueue:withBlock:", v20, MEMORY[0x1E0C80D38], v28);

  v22 = self->_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "motionToWakeEnabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_5;
  v26[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v27, &location);
  v25 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](v22, "observeDefaults:onQueue:withBlock:", v24, MEMORY[0x1E0C80D38], v26);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluatePresentationState");
  objc_msgSend(WeakRetained, "_updateViewObstructedSuppressionManager");

}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_isNightModeUserSettingEffectivelyEnabled") & 1) == 0)
    objc_msgSend(WeakRetained, "_setAmbientDisplayStyle:forReason:", 0, CFSTR("Settings Change"));
  objc_msgSend(WeakRetained, "_evaluateTriggerDetectionState");

}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateIdleTimerEnablement");
  objc_msgSend(WeakRetained, "_updateSleepSuppression");
  objc_msgSend(WeakRetained, "_updateMotionDetection");
  objc_msgSend(WeakRetained, "_evaluateRedModeTriggerDetectionState");

}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateBumpToWakeEnablement");

}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateMotionDetection");

}

- (BOOL)_isAmbientModeUserSettingEnabled
{
  return -[AMAmbientDefaults enableAmbientMode](self->_ambientDefaults, "enableAmbientMode");
}

- (int64_t)_effectiveAlwaysOnMode
{
  if (MGGetBoolAnswer())
    return -[AMAmbientDefaults alwaysOnMode](self->_ambientDefaults, "alwaysOnMode");
  else
    return 0;
}

- (BOOL)_isAmbientAlwaysOnUserSettingEnabled
{
  return -[SBAmbientPresentationController _effectiveAlwaysOnMode](self, "_effectiveAlwaysOnMode") != 0;
}

- (BOOL)_isNightModeUserSettingEnabled
{
  return -[AMAmbientDefaults nightModeEnabled](self->_ambientDefaults, "nightModeEnabled");
}

- (BOOL)_isNightModeSettingMandatory
{
  return -[SBAmbientPresentationController _effectiveAlwaysOnMode](self, "_effectiveAlwaysOnMode") == 2;
}

- (BOOL)_isNightModeUserSettingEffectivelyEnabled
{
  return -[SBAmbientPresentationController _isNightModeUserSettingEnabled](self, "_isNightModeUserSettingEnabled")
      || -[SBAmbientPresentationController _isNightModeSettingMandatory](self, "_isNightModeSettingMandatory");
}

- (BOOL)_isBumpToWakeUserSettingEnabled
{
  return -[AMAmbientDefaults bumpToWakeEnabled](self->_ambientDefaults, "bumpToWakeEnabled");
}

- (BOOL)_isMotionToWakeUserSettingEnabled
{
  return -[AMAmbientDefaults motionToWakeEnabled](self->_ambientDefaults, "motionToWakeEnabled");
}

- (BOOL)_shouldSuppressForSleep
{
  return -[SBAmbientPresentationController _effectiveAlwaysOnMode](self, "_effectiveAlwaysOnMode") == 1;
}

- (BOOL)_isMotionToWakePermitted
{
  return -[SBAmbientPresentationController _effectiveAlwaysOnMode](self, "_effectiveAlwaysOnMode") == 1;
}

- (void)_updateScheduledAlarmObserverForPresentationRequested:(BOOL)a3
{
  -[SBAmbientScheduledAlarmObserver setObservationEnabled:](self->_scheduledAlarmObserver, "setObservationEnabled:", self->_presentationRequested);
  if (!self->_presentationRequested)
    -[SBAmbientPresentationController _clearUpcomingAlarmSuppressionsIfNecessary](self, "_clearUpcomingAlarmSuppressionsIfNecessary");
}

- (void)_clearUpcomingAlarmSuppressionsIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (self->_suppressRedModeDisplayStyleForUpcomingAlarm)
  {
    SBLogAmbientPresentation();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Clearing ambient red mode suppression for upcoming alarm", buf, 2u);
    }

    self->_suppressRedModeDisplayStyleForUpcomingAlarm = 0;
    -[SBAmbientPresentationController _evaluateRedModeTriggerDetectionState](self, "_evaluateRedModeTriggerDetectionState");
  }
  if (self->_suppressIdleTimerForUpcomingAlarm)
  {
    SBLogAmbientPresentation();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Clearing idle timer suppression for upcoming alarm", v5, 2u);
    }

    self->_suppressIdleTimerForUpcomingAlarm = 0;
    -[SBAmbientPresentationController _evaluateIdleTimerEnablement](self, "_evaluateIdleTimerEnablement");
    -[SBAmbientPresentationController _evaluateIdleTimerDisablement](self, "_evaluateIdleTimerDisablement");
  }
}

- (void)_setupStateCaptureBlock
{
  id v2;
  id v3;
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v4, &location);
  v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

id __58__SBAmbientPresentationController__setupStateCaptureBlock__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(WeakRetained, "isPresented"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("presented"));
  if (objc_msgSend(WeakRetained, "isPresentationRequested"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("presentationRequested"));
  objc_msgSend(WeakRetained, "ambientDisplayStyle");
  AMUIAmbientDisplayStyleString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("displayStyle"));

  objc_msgSend(WeakRetained[3], "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "providerBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("activeFace"));

    objc_msgSend(v7, "descriptorIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("activeFaceDescriptor"));

  }
  objc_msgSend(WeakRetained[3], "activeConfigurationMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("activeFaceMetadata"));

  return v2;
}

- (void)_updateViewObstructedSuppressionManager
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  int v7;
  int v9;
  CMSuppressionManager *v11;
  CMSuppressionManager *suppressionManager;
  NSObject *v13;
  CMSuppressionManager *v14;
  void *v15;
  NSObject *v16;
  CMSuppressionManager *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];
  id location[2];

  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lockState");

  v5 = -[SBAmbientPresentationController _isAmbientModeUserSettingEnabled](self, "_isAmbientModeUserSettingEnabled");
  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOnAC");

  if (v5)
  {
    if ((v4 & 4) != 0 || v4 == 0)
      v7 = 0;
    v9 = objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable");
    if (v7 == 1 && v9 != 0)
    {
      if (!self->_suppressionManager)
      {
        v11 = (CMSuppressionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA56D8]), "initWithClientType:", 2);
        suppressionManager = self->_suppressionManager;
        self->_suppressionManager = v11;

        objc_initWeak(location, self);
        SBLogAmbientPresentation();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Starting view obstructed suppression monitoring", buf, 2u);
        }

        -[CMSuppressionManager startService](self->_suppressionManager, "startService");
        v14 = self->_suppressionManager;
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __74__SBAmbientPresentationController__updateViewObstructedSuppressionManager__block_invoke;
        v18[3] = &unk_1E8EBD248;
        objc_copyWeak(&v19, location);
        -[CMSuppressionManager startSuppressionUpdatesToQueue:withOptions:withHandler:](v14, "startSuppressionUpdatesToQueue:withOptions:withHandler:", v15, 1, v18);

        objc_destroyWeak(&v19);
        objc_destroyWeak(location);
      }
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable");
  }
  if (self->_suppressionManager)
  {
    SBLogAmbientPresentation();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Stopping view obstructed suppression monitoring", (uint8_t *)location, 2u);
    }

    -[CMSuppressionManager stopSuppressionUpdates](self->_suppressionManager, "stopSuppressionUpdates");
    -[CMSuppressionManager stopService](self->_suppressionManager, "stopService");
    v17 = self->_suppressionManager;
    self->_suppressionManager = 0;

    self->_isViewObstructedSuppressionActive = 0;
  }
}

void __74__SBAmbientPresentationController__updateViewObstructedSuppressionManager__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  _BYTE *v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained && (objc_msgSend(v3, "reason") & 1) != 0)
  {
    v6 = objc_msgSend(v3, "type");
    SBLogAmbientPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v6 == 1;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Received view obstructed suppression event [ isSuppressed:%{BOOL}d ]", (uint8_t *)v8, 8u);
    }

    v5[248] = v6 == 1;
    objc_msgSend(v5, "_evaluatePresentationState");
  }

}

- (BOOL)isPresented
{
  return self->_presented;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (BOOL)ambientTransientOverlayIsShowingPasscode
{
  return self->_ambientTransientOverlayIsShowingPasscode;
}

- (BOOL)_isCoverSheetPresentedByUserGesture
{
  return self->_coverSheetPresentedByUserGesture;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (AMUIWidgetHostManager)widgetHostManager
{
  return self->_widgetHostManager;
}

- (void)setWidgetHostManager:(id)a3
{
  objc_storeStrong((id *)&self->_widgetHostManager, a3);
}

- (NSArray)defaultWidgetStacks
{
  return self->_defaultWidgetStacks;
}

- (void)setDefaultWidgetStacks:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetStacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultWidgetStacks, 0);
  objc_storeStrong((id *)&self->_widgetHostManager, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_lastKeyBagState, 0);
  objc_storeStrong((id *)&self->_wirelessChargingIdleTimer, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_pocketStateMonitor, 0);
  objc_storeStrong((id *)&self->_telemetryEmitter, 0);
  objc_storeStrong((id *)&self->_systemApertureLockElementSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_disableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_ambientSettings, 0);
  objc_storeStrong((id *)&self->_scheduledAlarmObserver, 0);
  objc_storeStrong((id *)&self->_traitsArbiterParticipant, 0);
  objc_storeStrong((id *)&self->_authenticationIdleTimer, 0);
  objc_storeStrong((id *)&self->_enableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_motionToWakeEnableAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_bumpToWakeAssertion, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_redModeTriggerManager, 0);
  objc_storeStrong((id *)&self->_ambientIdleTimerController, 0);
  objc_storeStrong((id *)&self->_motionDetectionWakeAttributeMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayController, 0);
  objc_storeStrong((id *)&self->_disableAlwaysOnAssertion, 0);
  objc_destroyWeak((id *)&self->_alwaysOnPolicyCoordinator);
  objc_storeStrong((id *)&self->_secureAppManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_transientOverlay, 0);
  objc_storeStrong((id *)&self->_ambientTriggerManager, 0);
}

- (void)test_updateAmbientPresentationState:(int64_t)a3 withReason:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  if ((unint64_t)a3 <= 3)
  {
    v7 = qword_1D0E8B8A8[a3];
    v8 = qword_1D0E8B8C8[a3];
    v9 = v6;
    -[SBAmbientPresentationController _updateAmbientTriggerState:analogousTriggerEvents:withReason:](self, "_updateAmbientTriggerState:analogousTriggerEvents:withReason:", v7, 0, v6);
    -[SBAmbientPresentationController _updateAmbientMountState:withReason:](self, "_updateAmbientMountState:withReason:", v8, v9);
    v6 = v9;
  }

}

- (void)test_updateAmbientTriggerState:(int64_t)a3 withReason:(id)a4
{
  -[SBAmbientPresentationController _updateAmbientTriggerState:analogousTriggerEvents:withReason:](self, "_updateAmbientTriggerState:analogousTriggerEvents:withReason:", a3, 0, a4);
}

- (void)_updatePosterBoardWithChargerIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "(%{public}@) Failed; PosterBoard Services does not support this call.",
    (uint8_t *)&v3);
}

void __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to push charger update of '%@' to PosterBoard; error: %@",
    (uint8_t *)&v5,
    0x20u);
}

void __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_149_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Failed to fetch default proactive widget stacks with error:%@", (uint8_t *)&v5);

}

- (void)_widgetDescriptorsForATXStack:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "Proactive default stack:%@ is nil or empty", (uint8_t *)&v3);
}

@end
