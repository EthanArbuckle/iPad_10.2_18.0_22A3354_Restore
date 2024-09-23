@implementation SBLiftToWakeManager

- (SBLiftToWakeManager)init
{
  void *v3;
  SBLiftToWakeManager *v4;

  +[SBLiftToWakeController sharedController](SBLiftToWakeController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBLiftToWakeManager _initWithLiftToWakeController:](self, "_initWithLiftToWakeController:", v3);

  return v4;
}

- (id)_initWithLiftToWakeController:(id)a3
{
  id v5;
  SBLiftToWakeManager *v6;
  id *p_isa;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLiftToWakeManager;
  v6 = -[SBLiftToWakeManager init](&v10, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_liftToWakeController, a3);
    objc_msgSend(p_isa[1], "addObserver:", p_isa);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", p_isa, sel__backlightWillTurnOn_, *MEMORY[0x1E0DAC310], 0);

  }
  return p_isa;
}

- (void)dealloc
{
  objc_super v3;

  -[SBLiftToWakeManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBLiftToWakeManager;
  -[SBLiftToWakeManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_gestureWokeScreen, CFSTR("gestureWokeScreen"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLiftToWakeController isEnabled](self->_liftToWakeController, "isEnabled"), CFSTR("enabled"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_liftToWakeController, CFSTR("liftToWakeController"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_backlightWillTurnOn:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAC2E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 != 13)
    -[SBLiftToWakeManager _setGestureWokeScreen:](self, "_setGestureWokeScreen:", v6 == 20);
}

- (SBMainDisplayPolicyAggregator)_policyAggregator
{
  SBMainDisplayPolicyAggregator *accessor_policyAggregator;
  SBMainDisplayPolicyAggregator *v3;
  void *v4;

  accessor_policyAggregator = self->_accessor_policyAggregator;
  if (accessor_policyAggregator)
  {
    v3 = accessor_policyAggregator;
  }
  else
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "policyAggregator");
    v3 = (SBMainDisplayPolicyAggregator *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (SBLockScreenManager)_lockScreenManager
{
  SBLockScreenManager *accessor_lockScreenManager;

  accessor_lockScreenManager = self->_accessor_lockScreenManager;
  if (accessor_lockScreenManager)
    return accessor_lockScreenManager;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  return (SBLockScreenManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBBacklightController)_backlightController
{
  SBBacklightController *accessor_backlightController;

  accessor_backlightController = self->_accessor_backlightController;
  if (accessor_backlightController)
    return accessor_backlightController;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  return (SBBacklightController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBIdleTimerGlobalCoordinator)_idleTimerCoordinator
{
  SBIdleTimerGlobalCoordinator *accessor_idleTimerCoordinator;

  accessor_idleTimerCoordinator = self->_accessor_idleTimerCoordinator;
  if (accessor_idleTimerCoordinator)
    return accessor_idleTimerCoordinator;
  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  return (SBIdleTimerGlobalCoordinator *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isLockScreenMainPageVisible
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[SBLiftToWakeManager _lockScreenManager](self, "_lockScreenManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isLockScreenVisible") && objc_msgSend(v4, "isMainPageVisible"))
    v5 = objc_msgSend(v2, "isUIUnlocking") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)invalidate
{
  void *v3;
  id v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[SBLiftToWakeController removeObserver:](self->_liftToWakeController, "removeObserver:", self);
    -[SBLiftToWakeManager _lockScreenManager](self, "_lockScreenManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterExternalEventHandler:", self);

  }
}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  SBLiftToWakeManager *v16;
  int64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 significantUserInteractionOccuredSinceWake;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  _BYTE v50[10];
  __int16 v51;
  int v52;
  __int16 v53;
  _BOOL4 v54;
  _QWORD v55[3];
  _QWORD v56[4];

  v56[3] = *MEMORY[0x1E0C80C00];
  NSStringFromSBLiftToWakeTransition(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLiftToWake();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v50 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Transition received: %{public}@", buf, 0xCu);
  }

  if (!BKSHIDServicesProximityDetectionActive())
  {
    -[SBLiftToWakeManager _policyAggregator](self, "_policyAggregator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v12 = objc_msgSend(v11, "allowsCapability:explanation:", 24, &v48);
    v13 = v48;

    if ((v12 & 1) != 0)
    {
      switch(a4)
      {
        case 0:
          SBLogLiftToWake();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Unknown transition!", buf, 2u);
          }

          v16 = self;
          v17 = 0;
          goto LABEL_15;
        case 1:
        case 4:
          if (objc_msgSend((id)SBApp, "caseIsEnabledAndLatched"))
          {
            SBLogLiftToWake();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v50 = v8;
              _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@ because smart cover is locked", buf, 0xCu);
            }
LABEL_41:

            break;
          }
          -[SBLiftToWakeManager _lockScreenManager](self, "_lockScreenManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isUILocked");

          if (!v30)
          {
            SBLogLiftToWake();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v50 = v8;
              _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_DEFAULT, "Resetting idle timer for transition %{public}@", buf, 0xCu);
            }

            -[SBLiftToWakeManager _idleTimerCoordinator](self, "_idleTimerCoordinator");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LiftToWakeTransition:%@"), v8);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject resetIdleTimerForReason:](v14, "resetIdleTimerForReason:", v42);

            goto LABEL_41;
          }
          -[SBLiftToWakeManager _lockScreenManager](self, "_lockScreenManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "coverSheetViewController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "registerExternalEventHandler:", self);

          BKLogOrientationDevice();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            BSDeviceOrientationDescription();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v50 = v34;
            _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_INFO, "Waking with requested orientation %@", buf, 0xCu);

          }
          SBLogLiftToWake();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v50 = v8;
            _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "Attemping unlock for transition %{public}@", buf, 0xCu);
          }

          v55[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = v36;
          v55[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v56[1] = v37;
          v55[2] = CFSTR("SBUIUnlockOptionsRequestedOrientationKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v56[2] = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)(a4 - 1) > 3)
            v40 = 0;
          else
            v40 = dword_1D0E8B860[a4 - 1];
          -[SBLiftToWakeManager _lockScreenManager](self, "_lockScreenManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "unlockUIFromSource:withOptions:", v40, v39);

          self->_significantUserInteractionOccuredSinceWake = 0;
          break;
        case 2:
          SBLogLiftToWake();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "Resetting idle timer for transition wake -> wake", buf, 2u);
          }

          -[SBLiftToWakeManager _backlightController](self, "_backlightController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "screenIsDim");

          if (v27)
          {
            -[SBLiftToWakeManager _backlightController](self, "_backlightController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "_undimFromSource:", 20);

          }
          -[SBLiftToWakeManager _idleTimerCoordinator](self, "_idleTimerCoordinator");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject resetIdleTimerForReason:](v14, "resetIdleTimerForReason:", CFSTR("LiftToWakeTransition:wake -> wake"));
          goto LABEL_41;
        case 3:
          v19 = -[SBLiftToWakeManager _gestureWokeScreen](self, "_gestureWokeScreen");
          v20 = -[SBLiftToWakeManager _isLockScreenMainPageVisible](self, "_isLockScreenMainPageVisible");
          -[SBLiftToWakeManager _idleTimerCoordinator](self, "_idleTimerCoordinator");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isIdleTimerDisabled");

          if (!v19 || !v20 || (v22 & 1) != 0 || self->_significantUserInteractionOccuredSinceWake)
          {
            SBLogLiftToWake();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              significantUserInteractionOccuredSinceWake = self->_significantUserInteractionOccuredSinceWake;
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v50 = v19;
              *(_WORD *)&v50[4] = 1024;
              *(_DWORD *)&v50[6] = v20;
              v51 = 1024;
              v52 = v22 ^ 1;
              v53 = 1024;
              v54 = significantUserInteractionOccuredSinceWake;
              _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Not turning screen off for transition wake -> sleep because gestureWokeScreen: %d isLockScreenMainPageVisible: %d idleTimerRunning: %d significantUserInteractionOccuredSinceWake: %d", buf, 0x1Au);
            }

            v16 = self;
            v17 = 3;
            goto LABEL_15;
          }
          SBLogLiftToWake();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v44, OS_LOG_TYPE_DEFAULT, "Turning screen off for transition wake -> sleep", buf, 2u);
          }

          -[SBLiftToWakeManager _backlightController](self, "_backlightController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_startFadeOutAnimationFromLockSource:", 5);

          -[SBLiftToWakeManager _lockScreenManager](self, "_lockScreenManager");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "coverSheetViewController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "unregisterExternalEventHandler:", self);

          break;
        default:
          break;
      }
    }
    else
    {
      SBLogLiftToWake();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v50 = v13;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring transition - policy aggregator denied with with reason: %@", buf, 0xCu);
      }

      v16 = self;
      v17 = a4;
LABEL_15:
      -[SBLiftToWakeManager _ignoredTransition:](v16, "_ignoredTransition:", v17);
    }

    goto LABEL_43;
  }
  SBLogLiftToWake();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring transition -- prox is active", buf, 2u);
  }

  -[SBLiftToWakeManager _ignoredTransition:](self, "_ignoredTransition:", a4);
LABEL_43:

}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[SBLiftToWakeController isEnabled](self->_liftToWakeController, "isEnabled"))
    return 2;
  else
    return 1;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  char v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = v5 == 21 || v5 == 12;
  if (v6 && -[SBLiftToWakeManager _gestureWokeScreen](self, "_gestureWokeScreen"))
  {
    self->_significantUserInteractionOccuredSinceWake = 1;
    v7 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void)_setPolicyAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_accessor_policyAggregator, a3);
}

- (void)_setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessor_lockScreenManager, a3);
}

- (void)_setBacklightController:(id)a3
{
  objc_storeStrong((id *)&self->_accessor_backlightController, a3);
}

- (void)_setIdleTimerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_accessor_idleTimerCoordinator, a3);
}

- (BOOL)_gestureWokeScreen
{
  return self->_gestureWokeScreen;
}

- (void)_setGestureWokeScreen:(BOOL)a3
{
  self->_gestureWokeScreen = a3;
}

- (SBLiftToWakeController)_liftToWakeController
{
  return self->_liftToWakeController;
}

- (void)_setLiftToWakeController:(id)a3
{
  objc_storeStrong((id *)&self->_liftToWakeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessor_idleTimerCoordinator, 0);
  objc_storeStrong((id *)&self->_accessor_policyAggregator, 0);
  objc_storeStrong((id *)&self->_accessor_backlightController, 0);
  objc_storeStrong((id *)&self->_accessor_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
}

@end
