@implementation SBSOSClawGestureObserver

- (SBSOSClawGestureObserver)init
{
  void *v3;
  void *v4;
  SBSOSClawGestureObserver *v5;

  objc_msgSend(MEMORY[0x1E0D89860], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSOSClawGestureObserver _initWithSOSManager:workspace:](self, "_initWithSOSManager:workspace:", v3, v4);

  return v5;
}

- (id)_initWithSOSManager:(id)a3 workspace:(id)a4
{
  id v7;
  id v8;
  SBSOSClawGestureObserver *v9;
  SBSOSClawGestureObserver *v10;
  void *v11;
  uint64_t v12;
  SBSOSDefaults *sosDefaults;
  uint64_t v14;
  BSAbsoluteMachTimer *sosTriggerTimer;
  NSMutableSet *v16;
  NSMutableSet *activePressTypes;
  NSMutableDictionary *v18;
  NSMutableDictionary *activePressTypeToDownTimestamp;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBSOSClawGestureObserver;
  v9 = -[SBSOSClawGestureObserver init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sosManager, a3);
    objc_storeStrong((id *)&v10->_workspace, a4);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sosDefaults");
    v12 = objc_claimAutoreleasedReturnValue();
    sosDefaults = v10->_sosDefaults;
    v10->_sosDefaults = (SBSOSDefaults *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBSOSClawGestureObserver.sosTriggerTimer"));
    sosTriggerTimer = v10->_sosTriggerTimer;
    v10->_sosTriggerTimer = (BSAbsoluteMachTimer *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activePressTypes = v10->_activePressTypes;
    v10->_activePressTypes = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activePressTypeToDownTimestamp = v10->_activePressTypeToDownTimestamp;
    v10->_activePressTypeToDownTimestamp = v18;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sosEnabled)
    -[SOSManager removeObserver:](self->_sosManager, "removeObserver:", self);
  -[BSAbsoluteMachTimer invalidate](self->_sosTriggerTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSOSClawGestureObserver;
  -[SBSOSClawGestureObserver dealloc](&v3, sel_dealloc);
}

- (void)noteButtonPress:(int64_t)a3 isDown:(BOOL)a4
{
  unint64_t v5;
  _BOOL8 v6;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  SOSManager *sosManager;
  void *v36;
  BSAbsoluteMachTimer *sosTriggerTimer;
  id v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  _BYTE v51[10];
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 102;
  if ((unint64_t)(a3 - 102) >= 3)
  {
    SBLogButtonsCombo();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBSOSClawGestureObserver noteButtonPress:isDown:].cold.1(a3, v9);
  }
  else
  {
    v6 = a4;
    v8 = -[SBSOSClawGestureObserver _isClawGestureActive](self, "_isClawGestureActive");
    -[SBSOSClawGestureObserver activePressTypes](self, "activePressTypes");
    v9 = objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    -[SBSOSClawGestureObserver _updateActivePressesForPressType:down:timestamp:](self, "_updateActivePressesForPressType:down:timestamp:", a3, v6);
    -[NSObject allObjects](v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bs_map:", &__block_literal_global_57);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[SBSOSClawGestureObserver _isClawGestureActive](self, "_isClawGestureActive");
    SBLogButtonsCombo();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v5 > 2)
        v18 = CFSTR("<notSupported>");
      else
        v18 = off_1E8EA5970[v5];
      *(_DWORD *)buf = 138544386;
      v49 = v16;
      v50 = 2114;
      *(_QWORD *)v51 = v18;
      *(_WORD *)&v51[8] = 1024;
      v52 = v13;
      v53 = 1024;
      v54 = v6;
      v55 = 2114;
      v56 = v12;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - button press noted: %{public}@ down: %{BOOL}u active(%{BOOL}u): [%{public}@]", buf, 0x2Cu);

    }
    if (-[SBSOSClawGestureObserver isSOSEnabled](self, "isSOSEnabled"))
    {
      -[SBSOSClawGestureObserver delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v13 || !v8)
      {
        if (v13 && !v8)
        {
          SBLogButtonsCombo();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v22;
            if (v5 > 2)
              v24 = CFSTR("<notSupported>");
            else
              v24 = off_1E8EA5970[v5];
            *(_DWORD *)buf = 138543618;
            v49 = v22;
            v50 = 2114;
            *(_QWORD *)v51 = v24;
            _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Claw activated with press %{public}@", buf, 0x16u);

          }
          if (-[SBSOSClawGestureObserver _isSOSActivated](self, "_isSOSActivated"))
          {
            if (-[SBSOSClawGestureObserver _isAutomaticCallCountdownEnabled](self, "_isAutomaticCallCountdownEnabled")
              && -[SBSOSClawGestureObserver _wasSOSTriggeredByClaw](self, "_wasSOSTriggeredByClaw"))
            {
              SBLogButtonsCombo();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (objc_class *)objc_opt_class();
                NSStringFromClass(v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v49 = (uint64_t)v34;
                _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting SOS current interactive state to Starting due to claw activation", buf, 0xCu);

              }
              sosManager = self->_sosManager;
              -[SBSOSClawGestureObserver _currentSOSButtonPressState](self, "_currentSOSButtonPressState");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[SOSManager setCurrentSOSButtonPressState:](sosManager, "setCurrentSOSButtonPressState:", v36);

              -[SOSManager setCurrentSOSInteractiveState:](self->_sosManager, "setCurrentSOSInteractiveState:", 1);
              -[NSObject sosClawAutoCallInteractiveStateChanged:interacting:](v19, "sosClawAutoCallInteractiveStateChanged:interacting:", self, 1);
            }
            else
            {
              SBLogButtonsCombo();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = (objc_class *)objc_opt_class();
                NSStringFromClass(v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = -[SBSOSClawGestureObserver _isAutomaticCallCountdownEnabled](self, "_isAutomaticCallCountdownEnabled");
                v43 = -[SBSOSClawGestureObserver _wasSOSTriggeredByClaw](self, "_wasSOSTriggeredByClaw");
                *(_DWORD *)buf = 138543874;
                v49 = (uint64_t)v41;
                v50 = 1024;
                *(_DWORD *)v51 = v42;
                *(_WORD *)&v51[4] = 1024;
                *(_DWORD *)&v51[6] = v43;
                _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ - Claw has been activated, but claw for automatic call down requires automatic call down enabled: %{BOOL}u and SOS was triggered by claw: %{BOOL}u", buf, 0x18u);

              }
            }
          }
          else if (!-[BSAbsoluteMachTimer isScheduled](self->_sosTriggerTimer, "isScheduled"))
          {
            objc_initWeak((id *)buf, self);
            sosTriggerTimer = self->_sosTriggerTimer;
            v38 = MEMORY[0x1E0C80D38];
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __51__SBSOSClawGestureObserver_noteButtonPress_isDown___block_invoke_17;
            v46[3] = &unk_1E8E9EEC8;
            objc_copyWeak(&v47, (id *)buf);
            -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](sosTriggerTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v46, 1.1, 0.0);

            objc_destroyWeak(&v47);
            objc_destroyWeak((id *)buf);
          }
          objc_msgSend((id)SBApp, "volumeHardwareButton");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addVolumePressBandit:", self);

          +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "cancelVolumeEvent");

          -[NSObject sosClawDidBecomeActive:](v19, "sosClawDidBecomeActive:", self);
        }
      }
      else
      {
        SBLogButtonsCombo();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v5 > 2)
            v31 = CFSTR("<notSupported>");
          else
            v31 = off_1E8EA5970[v5];
          *(_DWORD *)buf = 138543618;
          v49 = v29;
          v50 = 2114;
          *(_QWORD *)v51 = v31;
          _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ - Claw deactivated with press %{public}@", buf, 0x16u);

        }
        -[SBSOSClawGestureObserver _cancelSOSActivity](self, "_cancelSOSActivity");
      }
    }
    else
    {
      SBLogButtonsCombo();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v26;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - SOS is disabled so nothing left to do", buf, 0xCu);

      }
    }

  }
}

const __CFString *__51__SBSOSClawGestureObserver_noteButtonPress_isDown___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if ((unint64_t)(v2 - 102) > 2)
    return CFSTR("<notSupported>");
  else
    return off_1E8EA5970[v2 - 102];
}

void __51__SBSOSClawGestureObserver_noteButtonPress_isDown___block_invoke_17(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isSOSEnabled"))
    objc_msgSend(v4, "_presentSOSInterface");
  objc_msgSend(v5, "cancel");

}

- (void)noteGestureReset
{
  -[NSMutableSet removeAllObjects](self->_activePressTypes, "removeAllObjects");
  if (-[SBSOSClawGestureObserver isSOSEnabled](self, "isSOSEnabled"))
    -[SBSOSClawGestureObserver _cancelSOSActivity](self, "_cancelSOSActivity");
}

- (void)setSOSEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_sosEnabled != a3)
  {
    v3 = a3;
    self->_sosEnabled = a3;
    -[NSMutableSet removeAllObjects](self->_activePressTypes, "removeAllObjects");
    SBLogButtonsCombo();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Set SOS Claw Gesture Enabled: %{BOOL}u", (uint8_t *)&v9, 0x12u);

    }
    if (v3)
    {
      +[SBSOSEventHandler sharedInstance](SBSOSEventHandler, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "run");

      -[SOSManager addObserver:queue:](self->_sosManager, "addObserver:queue:", self, MEMORY[0x1E0C80D38]);
    }
    else
    {
      -[SOSManager removeObserver:](self->_sosManager, "removeObserver:", self);
    }
  }
}

- (BOOL)isClawActivated
{
  _BOOL4 v3;

  v3 = -[SBSOSClawGestureObserver isSOSEnabled](self, "isSOSEnabled");
  if (v3)
    LOBYTE(v3) = -[SBSOSClawGestureObserver _isClawGestureActive](self, "_isClawGestureActive");
  return v3;
}

- (void)setSosTriggerTimer:(id)a3
{
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer **p_sosTriggerTimer;
  BSAbsoluteMachTimer *sosTriggerTimer;
  BSAbsoluteMachTimer *v9;

  v5 = (BSAbsoluteMachTimer *)a3;
  sosTriggerTimer = self->_sosTriggerTimer;
  p_sosTriggerTimer = &self->_sosTriggerTimer;
  v6 = sosTriggerTimer;
  if (sosTriggerTimer != v5)
  {
    v9 = v5;
    -[BSAbsoluteMachTimer invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_sosTriggerTimer, a3);
    v5 = v9;
  }

}

- (id)_currentSOSButtonPressState
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0D89858]);
  v4 = -[NSMutableSet containsObject:](self->_activePressTypes, "containsObject:", &unk_1E91D04E8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activePressTypeToDownTimestamp, "objectForKeyedSubscript:", &unk_1E91D04E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  v8 = -[NSMutableSet containsObject:](self->_activePressTypes, "containsObject:", &unk_1E91D0500);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activePressTypeToDownTimestamp, "objectForKeyedSubscript:", &unk_1E91D0500);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activePressTypeToDownTimestamp, "objectForKeyedSubscript:", &unk_1E91D0518);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = (void *)objc_msgSend(v3, "initWithVolumeUpPressed:Timestamp:VolumeDownPressed:Timestamp:LockPressedTimestamp:", v4, v8, v7, v11, v13);

  return v14;
}

- (void)_updateActivePressesForPressType:(int64_t)a3 down:(BOOL)a4 timestamp:(double)a5
{
  _BOOL4 v6;
  NSMutableSet *activePressTypes;
  NSMutableDictionary *activePressTypeToDownTimestamp;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  activePressTypes = self->_activePressTypes;
  if (v6)
  {
    -[NSMutableSet addObject:](activePressTypes, "addObject:", v11);
    activePressTypeToDownTimestamp = self->_activePressTypeToDownTimestamp;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](activePressTypeToDownTimestamp, "setObject:forKey:", v10, v11);

  }
  else
  {
    -[NSMutableSet removeObject:](activePressTypes, "removeObject:", v11);
    -[NSMutableDictionary removeObjectForKey:](self->_activePressTypeToDownTimestamp, "removeObjectForKey:", v11);
  }

}

- (BOOL)_isClawGestureActive
{
  void *v2;
  BOOL v3;

  -[SBSOSClawGestureObserver activePressTypes](self, "activePressTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", &unk_1E91D0518))
    v3 = (unint64_t)objc_msgSend(v2, "count") > 1;
  else
    v3 = 0;

  return v3;
}

- (void)_cancelSOSActivity
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[SBSOSClawGestureObserver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSOSClawGestureObserver sosTriggerTimer](self, "sosTriggerTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isScheduled"))
    objc_msgSend(v4, "cancel");
  if (-[SOSManager currentSOSInteractiveState](self->_sosManager, "currentSOSInteractiveState"))
  {
    SBLogButtonsCombo();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting SOS current interactive state to Stopping due to claw release.", (uint8_t *)&v9, 0xCu);

    }
    -[SOSManager setCurrentSOSInteractiveState:](self->_sosManager, "setCurrentSOSInteractiveState:", 0);
    objc_msgSend(v3, "sosClawAutoCallInteractiveStateChanged:interacting:", self, 0);
  }
  objc_msgSend((id)SBApp, "volumeHardwareButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeVolumePressBandit:", self);

  objc_msgSend(v3, "sosClawDidBecomeInactive:", self);
}

- (void)_presentSOSInterface
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend((id)SBApp, "HUDController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissHUDs:", 1);

  objc_msgSend((id)SBApp, "ringerControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRingerControl dismissRingerHUD]((uint64_t)v4);

  -[SBSOSClawGestureObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke;
  v6[3] = &unk_1E8E9E980;
  v6[4] = self;
  objc_msgSend(v5, "sosClawDidTriggerSOS:completion:", self, v6);

}

void __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;

  if (a2)
  {
    BSDispatchMain();
  }
  else
  {
    SBLogButtonsCombo();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke_cold_1(a1, v3);

  }
}

uint64_t __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setWasSOSTriggeredByClaw:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "isClawActivated");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isAutomaticCallCountdownEnabled");
    if ((_DWORD)result)
    {
      SBLogButtonsCombo();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = (objc_class *)objc_opt_class();
        NSStringFromClass(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting SOS current interactive state to Starting upon SOS presentation.", (uint8_t *)&v9, 0xCu);

      }
      v6 = *(_QWORD **)(a1 + 32);
      v7 = (void *)v6[1];
      objc_msgSend(v6, "_currentSOSButtonPressState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCurrentSOSButtonPressState:", v8);

      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCurrentSOSInteractiveState:", 1);
    }
  }
  return result;
}

- (BOOL)_isAutomaticCallCountdownEnabled
{
  void *v2;
  char v3;

  -[SBSOSClawGestureObserver sosDefaults](self, "sosDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomaticCallCountdownEnabled");

  return v3;
}

- (BOOL)_isSOSActivated
{
  return -[SOSManager currentSOSInitiationState](self->_sosManager, "currentSOSInitiationState") == 1;
}

- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3
{
  BSDispatchMain();
}

void __63__SBSOSClawGestureObserver_didUpdateCurrentSOSInitiationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogButtonsCombo();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "_isSOSActivated");
    v6 = 138543618;
    v7 = v4;
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - SOS UI initiation state changed. SOS activated: %{BOOL}u", (uint8_t *)&v6, 0x12u);

  }
  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_setWasSOSTriggeredByClaw:", 0);
}

- (NSMutableSet)activePressTypes
{
  return self->_activePressTypes;
}

- (void)setActivePressTypes:(id)a3
{
  objc_storeStrong((id *)&self->_activePressTypes, a3);
}

- (SBSOSClawGestureObserverDelegate)delegate
{
  return (SBSOSClawGestureObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSOSDefaults)sosDefaults
{
  return self->_sosDefaults;
}

- (void)_setSOSDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_sosDefaults, a3);
}

- (BOOL)isSOSEnabled
{
  return self->_sosEnabled;
}

- (BSAbsoluteMachTimer)sosTriggerTimer
{
  return self->_sosTriggerTimer;
}

- (BOOL)_wasSOSTriggeredByClaw
{
  return self->_wasSOSTiggeredByClaw;
}

- (void)_setWasSOSTriggeredByClaw:(BOOL)a3
{
  self->_wasSOSTiggeredByClaw = a3;
}

- (BOOL)isGestureLoggingEnabled
{
  return self->_gestureLoggingEnabled;
}

- (void)setGestureLoggingEnabled:(BOOL)a3
{
  self->_gestureLoggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosTriggerTimer, 0);
  objc_storeStrong((id *)&self->_sosDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activePressTypes, 0);
  objc_storeStrong((id *)&self->_activePressTypeToDownTimestamp, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_sosManager, 0);
}

- (void)noteButtonPress:(int)a1 isDown:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "must be a volume or lock button press, not %d", (uint8_t *)v2, 8u);
}

void __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "%{public}@ - Claw triggered SOS, but SOS responded without success.", (uint8_t *)&v5, 0xCu);

}

@end
