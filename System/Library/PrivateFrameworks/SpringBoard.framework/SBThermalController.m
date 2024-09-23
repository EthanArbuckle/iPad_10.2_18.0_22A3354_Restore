@implementation SBThermalController

- (BOOL)_isBlocked
{
  return -[SBSecurityDefaults isBlockedForThermal](self->_securityDefaults, "isBlockedForThermal");
}

- (int64_t)level
{
  return self->_level;
}

+ (SBThermalController)sharedInstance
{
  if (sharedInstance_onceToken_46 != -1)
    dispatch_once(&sharedInstance_onceToken_46, &__block_literal_global_317);
  return (SBThermalController *)(id)sharedInstance___sharedInstance_23;
}

uint64_t __53__SBThermalController_startListeningForThermalEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  result = notify_get_state(*(_DWORD *)(v2 + 16), (uint64_t *)(v2 + 24));
  if (v3 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    SBLogThermal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218240;
      v9 = v3;
      v10 = 2048;
      v11 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "hot condition changed from %llu to %llu", buf, 0x16u);
    }

    v7 = *(_QWORD **)(a1 + 32);
    if (v7[3] > 0x28uLL || v3 >= 0x29)
    {
      objc_msgSend((id)objc_opt_class(), "logThermalEvent:", CFSTR("ThermalLevel,%llu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v7 = *(_QWORD **)(a1 + 32);
    }
    return objc_msgSend(v7, "_respondToCurrentThermalCondition");
  }
  return result;
}

- (void)_updateThermalJetsamCPUSamplingState
{
  NSUUID *samplingToken;
  NSObject *v5;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  NSUUID *v9;
  NSObject *v10;
  NSUUID *v11;
  NSUUID *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_time_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  NSUUID *v22;
  SBThermalController *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  NSUUID *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBThermalController _updateThermalJetsamCPUSamplingState]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SBThermalController.m"), 278, CFSTR("this call must be made on the main thread"));

  }
  samplingToken = self->_samplingToken;
  if (self->_hotLevel > 0x27)
  {
    if (samplingToken)
      return;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v9 = self->_samplingToken;
    self->_samplingToken = v8;

    if (!self->_samplingToken)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBThermalController.m"), 293, CFSTR("failed to create a sampling token"));

    }
    SBLogThermal();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_samplingToken;
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Starting CPU usage sampling with token=%@.", buf, 0xCu);
    }

    v12 = self->_samplingToken;
    __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    v15 = v14;
    v16 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_2;
    block[3] = &unk_1E8EBB028;
    v22 = v12;
    v23 = self;
    v26 = v15;
    v24 = v13;
    v25 = &__block_literal_global_39_2;
    v17 = v13;
    v7 = v12;
    dispatch_after(v16, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (!samplingToken)
      return;
    SBLogThermal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_samplingToken;
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Canceling CPU usage sampling with token=%@.", buf, 0xCu);
    }

    v7 = self->_samplingToken;
    self->_samplingToken = 0;
  }

}

- (void)_setBlocked:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSHashTable *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (-[SBThermalController _isBlocked](self, "_isBlocked") != a3)
  {
    SBLogThermal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Will toggle bricked state to: %{public}@", buf, 0xCu);

    }
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Will toggle bricked state to: %{public}@", buf, 0xCu);

    }
    if (v3)
      v9 = CFSTR("ThermalUIAlertEnter");
    else
      v9 = CFSTR("ThermalUIAlertExit");
    +[SBThermalController logThermalEvent:](SBThermalController, "logThermalEvent:", v9);
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "_serverConnection"))
    {
      if (v3)
        v11 = _CTServerConnectionDisableRegistration();
      else
        v11 = _CTServerConnectionEnableRegistration();
      v14 = v11;
      if (HIDWORD(v11))
        objc_msgSend(v10, "_serverConnectionDidError:", v11);
    }
    else
    {
      SBLogThermal();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBThermalController _setBlocked:].cold.1(v12);

      SBLogStatusBarish();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "Unable to change CT registration status. _CTServerConnectionCreate() failed.", buf, 2u);
      }

    }
    if (v3)
    {
      +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "wiFiEnabled"))
      {
        objc_msgSend(v15, "setWiFiEnabled:", 0);
        -[SBThermalDefaults setWasConnectedToWiFiWhenBrickedForThermalConditions:](self->_thermalDefaults, "setWasConnectedToWiFiWhenBrickedForThermalConditions:", 1);
      }
      -[SBExternalWifiDefaults setWifiEnabled:](self->_networkDefaults, "setWifiEnabled:", 0);

    }
    else if (-[SBThermalDefaults wasConnectedToWiFiWhenBrickedForThermalConditions](self->_thermalDefaults, "wasConnectedToWiFiWhenBrickedForThermalConditions", v14))
    {
      +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWiFiEnabled:", 1);

      -[SBExternalWifiDefaults setWifiEnabled:](self->_networkDefaults, "setWifiEnabled:", 1);
      -[SBThermalDefaults setWasConnectedToWiFiWhenBrickedForThermalConditions:](self->_thermalDefaults, "setWasConnectedToWiFiWhenBrickedForThermalConditions:", 0);
    }
    -[SBSecurityDefaults setBlockedForThermal:](self->_securityDefaults, "setBlockedForThermal:", v3);
    -[SBSecurityDefaults synchronizeDefaults](self->_securityDefaults, "synchronizeDefaults");
    SBLogThermal();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Did toggle bricked state to: %{public}@", buf, 0xCu);

    }
    SBLogStatusBarish();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "Did toggle bricked state to: %{public}@", buf, 0xCu);

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = self->_observers;
    v22 = -[NSHashTable countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "thermalBlockStatusChanged:", self, (_QWORD)v26);
        }
        v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v23);
    }

  }
}

- (void)_respondToCurrentThermalCondition
{
  int64_t level;
  unint64_t hotLevel;
  int64_t v5;
  unint64_t coldLevel;
  uint64_t v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  _BOOL4 inSunlight;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBThermalController _respondToCurrentThermalCondition]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBThermalController.m"), 238, CFSTR("this call must be made on the main thread"));

  }
  level = self->_level;
  hotLevel = self->_hotLevel;
  if (hotLevel <= 0x27)
  {
    if (hotLevel <= 0x1D)
    {
      if (hotLevel <= 0x13)
      {
        coldLevel = self->_coldLevel;
        if (coldLevel <= 0x13)
          v7 = 0;
        else
          v7 = -1;
        if (coldLevel <= 0x1D)
          v5 = v7;
        else
          v5 = -2;
      }
      else
      {
        v5 = 1;
      }
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 3;
  }
  self->_level = v5;
  v8 = level;
  if (level != v5)
  {
    SBLogThermal();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBThermalLevel(self->_level);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_level;
      v16 = 138543618;
      v17 = v10;
      v18 = 1026;
      v19 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Thermal level changed to %{public}@ (%{public}d)", (uint8_t *)&v16, 0x12u);

    }
    v8 = self->_level;
  }
  inSunlight = self->_inSunlight;
  self->_inSunlight = self->_sunLevel != 0;
  -[SBThermalController _setBlocked:](self, "_setBlocked:", v8 == 3);
  if (level != self->_level || inSunlight != self->_inSunlight)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("SBThermalControllerStateDidChange"), self);

  }
  -[SBThermalController _updateThermalJetsamCPUSamplingState](self, "_updateThermalJetsamCPUSamplingState");
}

uint64_t __37__SBThermalController_sharedInstance__block_invoke()
{
  SBThermalController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBThermalController);
  v1 = (void *)sharedInstance___sharedInstance_23;
  sharedInstance___sharedInstance_23 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBThermalController)init
{
  SBThermalController *v2;
  void *v3;
  uint64_t v4;
  SBThermalDefaults *thermalDefaults;
  uint64_t v6;
  SBSecurityDefaults *securityDefaults;
  void *v8;
  uint64_t v9;
  SBExternalWifiDefaults *networkDefaults;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBThermalController;
  v2 = -[SBThermalController init](&v12, sel_init);
  if (v2)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thermalDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    thermalDefaults = v2->_thermalDefaults;
    v2->_thermalDefaults = (SBThermalDefaults *)v4;

    objc_msgSend(v3, "securityDefaults");
    v6 = objc_claimAutoreleasedReturnValue();
    securityDefaults = v2->_securityDefaults;
    v2->_securityDefaults = (SBSecurityDefaults *)v6;

    +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "networkDefaults");
    v9 = objc_claimAutoreleasedReturnValue();
    networkDefaults = v2->_networkDefaults;
    v2->_networkDefaults = (SBExternalWifiDefaults *)v9;

    v2->_hotToken = -1;
    v2->_coldToken = -1;
    v2->_sunToken = -1;

  }
  return v2;
}

- (void)dealloc
{
  int hotToken;
  int coldToken;
  int sunToken;
  objc_super v6;

  hotToken = self->_hotToken;
  if (hotToken != -1)
    notify_cancel(hotToken);
  coldToken = self->_coldToken;
  if (coldToken != -1)
    notify_cancel(coldToken);
  sunToken = self->_sunToken;
  if (sunToken != -1)
    notify_cancel(sunToken);
  v6.receiver = self;
  v6.super_class = (Class)SBThermalController;
  -[SBThermalController dealloc](&v6, sel_dealloc);
}

+ (void)logThermalEvent:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, &v8);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
  GetThermalState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  logEventForAppleCare();
}

- (void)startListeningForThermalEvents
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a2, a3, "notify_register(hot) failed : status=%i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

uint64_t __53__SBThermalController_startListeningForThermalEvents__block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  result = notify_get_state(*(_DWORD *)(v2 + 32), (uint64_t *)(v2 + 40));
  if (v3 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    SBLogThermal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v7 = 134218240;
      v8 = v3;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "cold condition changed from %llu to %llu", (uint8_t *)&v7, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_respondToCurrentThermalCondition");
  }
  return result;
}

uint64_t __53__SBThermalController_startListeningForThermalEvents__block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  result = notify_get_state(*(_DWORD *)(v2 + 48), (uint64_t *)(v2 + 56));
  if (v3 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    SBLogThermal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v7 = 134218240;
      v8 = v3;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "sunlight condition changed from %llu to %llu", (uint8_t *)&v7, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_respondToCurrentThermalCondition");
  }
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_samplingToken, CFSTR("samplingToken"), 1);
  NSStringFromSBThermalLevel(self->_level);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("ThermalLevel"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_inSunlight, CFSTR("inSunlight"));
  v7 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_hotLevel, CFSTR("hotLevel"));
  v8 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_coldLevel, CFSTR("coldLevel"));
  v9 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_sunLevel, CFSTR("sunLevel"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)addThermalObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeThermalObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

id __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allApplicationProcesses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPendingExit") & 1) == 0)
        {
          v8 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "elapsedCPUTime");
          objc_msgSend(v8, "numberWithDouble:");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "setObject:forKey:", v9, v7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return v0;
}

void __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  dispatch_time_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  _QWORD block[4];
  id v39;
  uint64_t v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    v4 = v3;
    v5 = *(double *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v7)
    {
      v8 = v7;
      v9 = v4 - v5;
      v10 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v18 = v15 - v17;

          v20 = v18 / v9 * 100.0;
          if (v20 > 30.0
            && __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_3(v19, v12))
          {
            SBLogThermal();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "bundleIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v12, "pid");
              *(_DWORD *)buf = 138544130;
              v55 = v22;
              v56 = 1026;
              v57 = v23;
              v58 = 2048;
              v59 = v20;
              v60 = 2048;
              v61 = v9;
              _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Thermal: Killing %{public}@(%{public}i), which used %.2f%% CPU over the past %.1f seconds.", buf, 0x26u);

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%CPU:                %.2f%% (sampled for %.1f s)"), *(_QWORD *)&v20, *(_QWORD *)&v9);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKey:", v24, v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      }
      while (v8);
    }

    v25 = v37;
    if (!objc_msgSend(v37, "count"))
    {
      +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_48;
      v46[3] = &unk_1E8EBB000;
      v47 = v37;
      v48 = &__block_literal_global_44_1;
      objc_msgSend(v26, "enumerateSceneManagersWithBlock:", v46);

    }
    if (objc_msgSend(v37, "count"))
    {
      v45 = 0u;
      v43 = 0u;
      v44 = 0u;
      v42 = 0u;
      v27 = v37;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v43 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_msgSend(v27, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_52;
            v41[3] = &unk_1E8E9E980;
            v41[4] = v32;
            objc_msgSend(v32, "killForReason:andReport:withDescription:completion:", 4, 1, v33, v41);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        }
        while (v29);
      }

      v25 = v37;
    }
    v34 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_54;
    block[3] = &unk_1E8E9E820;
    v35 = *(id *)(a1 + 32);
    v36 = *(_QWORD *)(a1 + 40);
    v39 = v35;
    v40 = v36;
    dispatch_after(v34, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  uint64_t v7;
  __int16 v9;
  __int16 v10;
  uint8_t buf[16];

  v2 = a2;
  if (objc_msgSend(v2, "isCurrentProcess"))
  {
    SBLogThermal();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Keeping ourselves alive since we can't reasonably exit", buf, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v2, "bundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.mobilephone")))
  {
    if (!-[NSObject isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.LoginUI")))
    {
      v7 = 1;
      goto LABEL_13;
    }
    SBLogThermal();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v9 = 0;
    v5 = "Keeping login window app alive since we can't reasonably exit it";
    v6 = (uint8_t *)&v9;
    goto LABEL_10;
  }
  SBLogThermal();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 0;
    v5 = "Keeping phone alive since we need them for emergency calls";
    v6 = (uint8_t *)&v10;
LABEL_10:
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }
LABEL_11:

LABEL_12:
  v7 = 0;
LABEL_13:

  return v7;
}

void __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_48(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a2, "externalForegroundApplicationSceneHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138543618;
    v15 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "scene", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientProcess");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
        {
          SBLogThermal();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "bundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v10, "pid");
            *(_DWORD *)buf = v15;
            v21 = v13;
            v22 = 1026;
            v23 = v14;
            _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Thermal: Killing %{public}@(%{public}i), which was topmost.", buf, 0x12u);

          }
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", CFSTR("Topmost application"), v10);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

}

void __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_52(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    SBLogThermal();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(*(id *)(a1 + 32), "pid");
      v6 = 138543618;
      v7 = v4;
      v8 = 1026;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Thermal: failed to kill %{public}@(%{public}i)", (uint8_t *)&v6, 0x12u);

    }
  }
}

uint64_t __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_54(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

    return objc_msgSend(*(id *)(a1 + 40), "_updateThermalJetsamCPUSamplingState");
  }
  return result;
}

- (BOOL)isInSunlight
{
  return self->_inSunlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityDefaults, 0);
  objc_storeStrong((id *)&self->_thermalDefaults, 0);
  objc_storeStrong((id *)&self->_networkDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_samplingToken, 0);
}

- (void)_setBlocked:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Unable to change CT registration status. _CTServerConnectionCreate() failed.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
