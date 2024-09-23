@implementation SBIdleTimerGlobalStateMonitor

- (BOOL)isThermalBlocked
{
  return self->_thermalBlocked;
}

- (BOOL)dontLockEver
{
  return (*((uint64_t (**)(void))self->_dontLockEver + 2))();
}

- (BOOL)dontDimOrLockOnAC
{
  return (*((uint64_t (**)(void))self->_dontDimOrLockOnAC + 2))();
}

- (BOOL)isFaceDownOnTable
{
  return self->_faceDownOnTable;
}

- (BOOL)isBatterySaverModeActive
{
  return -[_SBIdleTimerGlobalBoolSettingMonitor BOOLValue](self->_batterySaverModeMonitor, "BOOLValue");
}

- (NSNumber)autoLockTimeout
{
  return -[_SBIdleTimerGlobalNumericSettingMonitor numericValue](self->_autoLockTimeoutMonitor, "numericValue");
}

- (SBIdleTimerAggregateClientConfiguration)aggregateClientConfiguration
{
  return self->_aggregateClientConfiguration;
}

- (BOOL)disableAttentionAwareness
{
  return (*((uint64_t (**)(void))self->_disableAttentionAwareness + 2))();
}

- (void)_updateObserversForReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_observerLock);
  os_unfair_lock_lock(&self->_observerLock);
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  os_unfair_lock_unlock(&self->_observerLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "idleTimerGlobalStateMonitor:changedForReason:", self, v4, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isAutoDimDisabled
{
  return self->_autoDimDisabled;
}

+ (SBIdleTimerGlobalStateMonitor)sharedInstance
{
  if (sharedInstance_onceToken_53 != -1)
    dispatch_once(&sharedInstance_onceToken_53, &__block_literal_global_351);
  return (SBIdleTimerGlobalStateMonitor *)(id)sharedInstance_monitor_1;
}

void __47__SBIdleTimerGlobalStateMonitor_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBIdleTimerGlobalStateMonitor _init]([SBIdleTimerGlobalStateMonitor alloc], "_init");
  v1 = (void *)sharedInstance_monitor_1;
  sharedInstance_monitor_1 = (uint64_t)v0;

}

- (id)_initWithLocalDefaults:(id)a3 profileConnection:(id)a4 pocketStateMonitor:(id)a5 uiController:(id)a6 idleTimerService:(id)a7 thermalBlockProvider:(id)a8 backlightController:(id)a9
{
  id v16;
  id v17;
  SBIdleTimerGlobalStateMonitor *v18;
  SBIdleTimerGlobalStateMonitor *v19;
  uint64_t v20;
  SBIdleTimerAggregateClientConfiguration *aggregateClientConfiguration;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id dontLockEver;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id dontDimOrLockOnAC;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id disableAttentionAwareness;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id minimumLockscreenIdleTime;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _SBIdleTimerGlobalBoolSettingMonitor *v48;
  _SBIdleTimerGlobalBoolSettingMonitor *batterySaverModeMonitor;
  _SBIdleTimerGlobalBoolSettingMonitor *v50;
  uint64_t v51;
  _SBIdleTimerGlobalBoolSettingMonitor *onACPowerMonitor;
  _SBIdleTimerGlobalNumericSettingMonitor *v53;
  uint64_t v54;
  uint64_t v55;
  _SBIdleTimerGlobalNumericSettingMonitor *autoLockTimeoutMonitor;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id location;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  objc_super v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v59 = a4;
  v61 = a5;
  v60 = a6;
  v16 = a7;
  v17 = a8;
  v58 = a9;
  v78.receiver = self;
  v78.super_class = (Class)SBIdleTimerGlobalStateMonitor;
  v18 = -[SBIdleTimerGlobalStateMonitor init](&v78, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_observerLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_backlightController, a9);
    -[SBBacklightController addObserver:](v19->_backlightController, "addObserver:", v19);
    objc_storeStrong((id *)&v19->_idleTimerService, a7);
    objc_msgSend(v16, "setDelegate:", v19);
    objc_msgSend(v16, "aggregateClientConfiguration");
    v20 = objc_claimAutoreleasedReturnValue();
    aggregateClientConfiguration = v19->_aggregateClientConfiguration;
    v19->_aggregateClientConfiguration = (SBIdleTimerAggregateClientConfiguration *)v20;

    objc_storeStrong((id *)&v19->_thermalBlockProvider, a8);
    objc_msgSend(v17, "addThermalObserver:", v19);
    v19->_thermalBlocked = objc_msgSend(v17, "isThermalBlocked");
    objc_storeStrong((id *)&v19->_localDefaults, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dontLockEver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "securityDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke;
    v76[3] = &unk_1E8EBD4D0;
    v25 = v62;
    v77 = v25;
    -[SBIdleTimerGlobalStateMonitor _BOOLMonitorForProperty:inDefaults:fetchingWith:](v19, "_BOOLMonitorForProperty:inDefaults:fetchingWith:", v22, v23, v76);
    v26 = objc_claimAutoreleasedReturnValue();
    dontLockEver = v19->_dontLockEver;
    v19->_dontLockEver = (id)v26;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dontDimOrLockWhileConnectedToPower");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "idleTimerDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v24;
    v74[1] = 3221225472;
    v74[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_2;
    v74[3] = &unk_1E8EBD4F8;
    v30 = v25;
    v75 = v30;
    -[SBIdleTimerGlobalStateMonitor _BOOLMonitorForProperty:inDefaults:fetchingWith:](v19, "_BOOLMonitorForProperty:inDefaults:fetchingWith:", v28, v29, v74);
    v31 = objc_claimAutoreleasedReturnValue();
    dontDimOrLockOnAC = v19->_dontDimOrLockOnAC;
    v19->_dontDimOrLockOnAC = (id)v31;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableAttentionAwareness");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "idleTimerDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v24;
    v72[1] = 3221225472;
    v72[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_3;
    v72[3] = &unk_1E8EBD4F8;
    v35 = v30;
    v73 = v35;
    -[SBIdleTimerGlobalStateMonitor _BOOLMonitorForProperty:inDefaults:fetchingWith:](v19, "_BOOLMonitorForProperty:inDefaults:fetchingWith:", v33, v34, v72);
    v36 = objc_claimAutoreleasedReturnValue();
    disableAttentionAwareness = v19->_disableAttentionAwareness;
    v19->_disableAttentionAwareness = (id)v36;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "minimumLockscreenIdleTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "idleTimerDefaults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v24;
    v70[1] = 3221225472;
    v70[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_4;
    v70[3] = &unk_1E8EBD520;
    v40 = v35;
    v71 = v40;
    -[SBIdleTimerGlobalStateMonitor _timeIntervalMonitorForProperty:inDefaults:fetchingWith:](v19, "_timeIntervalMonitorForProperty:inDefaults:fetchingWith:", v38, v39, v70);
    v41 = objc_claimAutoreleasedReturnValue();
    minimumLockscreenIdleTime = v19->_minimumLockscreenIdleTime;
    v19->_minimumLockscreenIdleTime = (id)v41;

    objc_initWeak(&location, v19);
    objc_msgSend(v40, "idleTimerDefaults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableAutoDim");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = MEMORY[0x1E0C80D38];
    v67[0] = v24;
    v67[1] = 3221225472;
    v67[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_5;
    v67[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v68, &location);
    v47 = (id)objc_msgSend(v43, "observeDefaults:onQueue:withBlock:", v45, MEMORY[0x1E0C80D38], v67);

    -[SBIdleTimerGlobalStateMonitor _updateAutoDimDisabled](v19, "_updateAutoDimDisabled");
    v48 = -[_SBIdleTimerGlobalBoolSettingMonitor initWithLabel:delegate:updatingForNotification:fetchingWith:]([_SBIdleTimerGlobalBoolSettingMonitor alloc], "initWithLabel:delegate:updatingForNotification:fetchingWith:", CFSTR("BatterySaverMode"), v19, CFSTR("SBBatterySaverModeDidChangeNotification"), &__block_literal_global_20_4);
    batterySaverModeMonitor = v19->_batterySaverModeMonitor;
    v19->_batterySaverModeMonitor = v48;

    v50 = [_SBIdleTimerGlobalBoolSettingMonitor alloc];
    v65[0] = v24;
    v65[1] = 3221225472;
    v65[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_7;
    v65[3] = &unk_1E8EA3E78;
    v66 = v60;
    v51 = -[_SBIdleTimerGlobalBoolSettingMonitor initWithLabel:delegate:updatingForNotification:fetchingWith:](v50, "initWithLabel:delegate:updatingForNotification:fetchingWith:", CFSTR("OnACPower"), v19, CFSTR("SBUIACStatusChangedNotification"), v65);
    onACPowerMonitor = v19->_onACPowerMonitor;
    v19->_onACPowerMonitor = (_SBIdleTimerGlobalBoolSettingMonitor *)v51;

    v53 = [_SBIdleTimerGlobalNumericSettingMonitor alloc];
    v54 = *MEMORY[0x1E0D46EC8];
    v63[0] = v24;
    v63[1] = 3221225472;
    v63[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_8;
    v63[3] = &unk_1E8EBD568;
    v64 = v59;
    v55 = -[_SBIdleTimerGlobalNumericSettingMonitor initWithLabel:delegate:updatingForNotification:fetchingWith:](v53, "initWithLabel:delegate:updatingForNotification:fetchingWith:", CFSTR("AutoLockTimeout"), v19, v54, v63);
    autoLockTimeoutMonitor = v19->_autoLockTimeoutMonitor;
    v19->_autoLockTimeoutMonitor = (_SBIdleTimerGlobalNumericSettingMonitor *)v55;

    objc_msgSend(v61, "addObserver:", v19);
    v19->_pocketState = objc_msgSend(v61, "pocketState");
    -[SBIdleTimerGlobalStateMonitor _updateFaceDownOnTable](v19, "_updateFaceDownOnTable");
    -[SBIdleTimerGlobalStateMonitor _addStateCaptureHandlers](v19, "_addStateCaptureHandlers");

    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);

  }
  return v19;
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "securityDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "dontLockEver");

  return v2;
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "idleTimerDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "dontDimOrLockWhileConnectedToPower");

  return v2;
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "idleTimerDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "disableAttentionAwareness");

  return v2;
}

double __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_4(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "idleTimerDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "minimumLockscreenIdleTime");
  v3 = v2;

  return v3;
}

void __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAutoDimDisabled");

}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_6()
{
  return objc_msgSend((id)SBApp, "isBatterySaverModeActive");
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isOnAC");
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveValueForSetting:", *MEMORY[0x1E0D46F68]);
}

- (id)_init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPocketStateMonitor sharedInstance](SBPocketStateMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIdleTimerService sharedInstance](SBIdleTimerService, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBThermalController sharedInstance](SBThermalController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIdleTimerGlobalStateMonitor _initWithLocalDefaults:profileConnection:pocketStateMonitor:uiController:idleTimerService:thermalBlockProvider:backlightController:](self, "_initWithLocalDefaults:profileConnection:pocketStateMonitor:uiController:idleTimerService:thermalBlockProvider:backlightController:", v3, v4, v5, v6, v7, v8, v9);

  return v10;
}

- (void)dealloc
{
  void *v3;
  BSInvalidatable *stateCaptureAssertion;
  BSInvalidatable *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    -[BSInvalidatable invalidate](stateCaptureAssertion, "invalidate");
    v5 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SBIdleTimerGlobalStateMonitor;
  -[SBIdleTimerGlobalStateMonitor dealloc](&v6, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_assert_not_owner(&self->_observerLock);
  os_unfair_lock_lock(&self->_observerLock);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_observerLock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;
  NSHashTable *observers;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_observerLock);
  os_unfair_lock_lock(p_observerLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
  os_unfair_lock_unlock(p_observerLock);
}

- (double)minimumLockscreenIdleTime
{
  double result;

  (*((void (**)(void))self->_minimumLockscreenIdleTime + 2))();
  return result;
}

- (BOOL)isOnACPower
{
  return -[_SBIdleTimerGlobalBoolSettingMonitor BOOLValue](self->_onACPowerMonitor, "BOOLValue");
}

- (void)idleTimerGlobalSettingMonitor:(id)a3 changedForReason:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalStateMonitor idleTimerGlobalSettingMonitor:changedForReason:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBIdleTimerGlobalStateMonitor.m"), 213, CFSTR("this call must be made on the main thread"));

  }
  -[SBIdleTimerGlobalStateMonitor _updateObserversForReason:](self, "_updateObserversForReason:", v7);

}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  BSDispatchMain();
}

uint64_t __90__SBIdleTimerGlobalStateMonitor_backlightController_didTransitionToBacklightState_source___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = SBBacklightStateIsActive(*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v3 + 137) != (_DWORD)result)
  {
    *(_BYTE *)(v3 + 137) = result;
    return objc_msgSend(*(id *)(a1 + 32), "_updateObserversForReason:", CFSTR("ScreenIsOnDidChange"));
  }
  return result;
}

- (void)pocketStateMonitor:(id)a3 pocketStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  BSDispatchMain();
}

uint64_t __80__SBIdleTimerGlobalStateMonitor_pocketStateMonitor_pocketStateDidChangeFrom_to___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;
  NSObject *v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  v3 = (id *)(result + 32);
  if (*(_QWORD *)(v1 + 112) != v2)
  {
    *(_QWORD *)(v1 + 112) = v2;
    SBLogIdleTimer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __80__SBIdleTimerGlobalStateMonitor_pocketStateMonitor_pocketStateDidChangeFrom_to___block_invoke_cold_1((uint64_t)v3, v4);

    return objc_msgSend(*v3, "_updateFaceDownOnTable");
  }
  return result;
}

- (void)idleTimerServiceTimeoutAssertionsDidChange:(id)a3 fromClient:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "aggregateClientConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v8;
  BSDispatchMain();

}

void __87__SBIdleTimerGlobalStateMonitor_idleTimerServiceTimeoutAssertionsDidChange_fromClient___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("IdleTimerServiceTimeoutAssertionsDidChange - client:"), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateObserversForReason:", v3);

}

- (void)thermalBlockStatusChanged:(id)a3
{
  objc_msgSend(a3, "isThermalBlocked");
  BSDispatchMain();
}

uint64_t __59__SBIdleTimerGlobalStateMonitor_thermalBlockStatusChanged___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 136) != v2)
  {
    *(_BYTE *)(v1 + 136) = v2;
    return objc_msgSend(*(id *)(result + 32), "_updateObserversForReason:", CFSTR("ThermalBlockedDidChange"));
  }
  return result;
}

- (void)_updateFaceDownOnTable
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v3 = self->_pocketState == 3;
  if (self->_faceDownOnTable != v3)
  {
    self->_faceDownOnTable = v3;
    SBLogIdleTimer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[SBIdleTimerGlobalStateMonitor _updateFaceDownOnTable] - faceDownOnTable: %d", (uint8_t *)v5, 8u);
    }

    -[SBIdleTimerGlobalStateMonitor _updateObserversForReason:](self, "_updateObserversForReason:", CFSTR("FaceDownOnTableChanged"));
  }
}

- (void)_updateAutoDimDisabled
{
  void *v3;
  int v4;

  -[SBLocalDefaults idleTimerDefaults](self->_localDefaults, "idleTimerDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableAutoDim");

  if (self->_autoDimDisabled != v4)
  {
    self->_autoDimDisabled = v4;
    -[SBIdleTimerGlobalStateMonitor _updateObserversForReason:](self, "_updateObserversForReason:", CFSTR("AutoDimDisable"));
  }
}

- (id)_BOOLMonitorForProperty:(id)a3 inDefaults:(id)a4 fetchingWith:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  id location;
  _QWORD v35[3];
  char v36;
  _QWORD v37[3];
  char v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke;
  v27[3] = &unk_1E8EBD590;
  v14 = v10;
  v30 = v14;
  v15 = v9;
  v28 = v15;
  v31 = v35;
  v32 = v37;
  v16 = v8;
  v29 = v16;
  objc_copyWeak(&v33, &location);
  v17 = (id)objc_msgSend(v15, "observeDefault:onQueue:withBlock:", v16, v11, v27);

  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke_52;
  v22[3] = &unk_1E8EBD5B8;
  v25 = v35;
  v26 = v37;
  v23 = v15;
  v24 = v14;
  v18 = v15;
  v19 = v14;
  v20 = (void *)MEMORY[0x1D17E5550](v22);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  return v20;
}

void __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id WeakRetained;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) || *(unsigned __int8 *)(v3 + 24) != v2)
  {
    *(_BYTE *)(v3 + 24) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    SBLogIdleTimer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v10 = 134218498;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBIdleTimerGlobalStateMonitor - setting changed - defaults: %p, property: %{public}@, setting: %{BOOL}u", (uint8_t *)&v10, 0x1Cu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_updateObserversForReason:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke_52(_QWORD *a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
}

- (id)_timeIntervalMonitorForProperty:(id)a3 inDefaults:(id)a4 fetchingWith:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  id location;
  _QWORD v35[3];
  char v36;
  _QWORD v37[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke;
  v27[3] = &unk_1E8EBD590;
  v14 = v10;
  v30 = v14;
  v15 = v9;
  v28 = v15;
  v31 = v35;
  v32 = v37;
  v16 = v8;
  v29 = v16;
  objc_copyWeak(&v33, &location);
  v17 = (id)objc_msgSend(v15, "observeDefault:onQueue:withBlock:", v16, v11, v27);

  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke_53;
  v22[3] = &unk_1E8EBD5E0;
  v25 = v35;
  v26 = v37;
  v23 = v15;
  v24 = v14;
  v18 = v15;
  v19 = v14;
  v20 = (void *)MEMORY[0x1D17E5550](v22);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  return v20;
}

void __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke(uint64_t a1)
{
  double v2;
  BOOL v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v3 = v2 == 0.0;
    v4 = 0.0;
    if (!v3)
      v4 = 1.0;
    goto LABEL_8;
  }
  v3 = v2 == 0.0;
  v4 = 0.0;
  if (!v3)
    v4 = 1.0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(double *)(v5 + 24) != v4)
  {
LABEL_8:
    *(double *)(v5 + 24) = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    SBLogIdleTimer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v12 = 134218498;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      v16 = 2048;
      v17 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBIdleTimerGlobalStateMonitor - setting changed - defaults: %p, property: %{public}@, setting: %g", (uint8_t *)&v12, 0x20u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v11 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_updateObserversForReason:", *(_QWORD *)(a1 + 40));

  }
}

double __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke_53(_QWORD *a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = (*(double (**)(void))(a1[5] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return *(double *)(*(_QWORD *)(a1[7] + 8) + 24);
}

- (void)_addStateCaptureHandlers
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *stateCaptureAssertion;
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v6, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = self->_stateCaptureAssertion;
  self->_stateCaptureAssertion = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

__CFString *__57__SBIdleTimerGlobalStateMonitor__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_stateCaptureDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E8EC7EC0;
  }

  return v3;
}

- (id)_stateCaptureDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  SBIdleTimerGlobalStateMonitor *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __57__SBIdleTimerGlobalStateMonitor__stateCaptureDescription__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__SBIdleTimerGlobalStateMonitor__stateCaptureDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isAutoDimDisabled"), CFSTR("DisableAutoDim"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dontLockEver"), CFSTR("DontLockEver"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dontDimOrLockOnAC"), CFSTR("DontDimOrLockOnAC"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "disableAttentionAwareness"), CFSTR("DisableAttentionAwareness"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "minimumLockscreenIdleTime");
  v7 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", CFSTR("MinimumLockscreenIdleTime"), 0);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "autoLockTimeout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v10 = (id)objc_msgSend(v8, "appendTimeInterval:withName:decomposeUnits:", CFSTR("AutoLockTimeout"), 0);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "aggregateClientConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:skipIfNil:", v12, CFSTR("ActiveClientConfiguration"), 1);

  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBatterySaverModeActive"), CFSTR("BatterySaverModeActive"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isOnACPower"), CFSTR("OnACPower"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "pocketState"), CFSTR("PocketState"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFaceDownOnTable"), CFSTR("FaceDownOnTable"));
}

- (int64_t)pocketState
{
  return self->_pocketState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_aggregateClientConfiguration, 0);
  objc_storeStrong((id *)&self->_onACPowerMonitor, 0);
  objc_storeStrong((id *)&self->_batterySaverModeMonitor, 0);
  objc_storeStrong((id *)&self->_autoLockTimeoutMonitor, 0);
  objc_storeStrong(&self->_minimumLockscreenIdleTime, 0);
  objc_storeStrong(&self->_disableAttentionAwareness, 0);
  objc_storeStrong(&self->_dontDimOrLockOnAC, 0);
  objc_storeStrong(&self->_dontLockEver, 0);
  objc_storeStrong((id *)&self->_thermalBlockProvider, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_idleTimerService, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __80__SBIdleTimerGlobalStateMonitor_pocketStateMonitor_pocketStateDidChangeFrom_to___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 112);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[SBIdleTimerGlobalStateMonitor pocketStateChanged] - _pocketState: %ld", (uint8_t *)&v3, 0xCu);
}

@end
