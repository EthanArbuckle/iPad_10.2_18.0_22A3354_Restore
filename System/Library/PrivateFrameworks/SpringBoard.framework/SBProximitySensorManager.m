@implementation SBProximitySensorManager

- (void)_updateProxState
{
  if (-[SBProximitySensorManager _clientsWantDetectionEnabled](self, "_clientsWantDetectionEnabled")
    && !-[SBProximitySensorManager isProximityDetectionEnabled](self, "isProximityDetectionEnabled"))
  {
    if ((unint64_t)(-[SpringBoard activeInterfaceOrientation](self->_interfaceOrientationProvider, "activeInterfaceOrientation")- 3) >= 2)-[SBProximitySensorManager _enableProx](self, "_enableProx");
  }
  else if (-[SBProximitySensorManager isProximityDetectionEnabled](self, "isProximityDetectionEnabled")
         && (!-[SBProximitySensorManager _clientsWantDetectionEnabled](self, "_clientsWantDetectionEnabled")
          || (unint64_t)(-[SpringBoard activeInterfaceOrientation](self->_interfaceOrientationProvider, "activeInterfaceOrientation")- 3) <= 1)&& !self->_objectInProximity)
  {
    -[SBProximitySensorManager _disableProx](self, "_disableProx");
  }
}

- (BOOL)isProximityDetectionEnabled
{
  return self->_proximityDetectionEnabled;
}

- (BOOL)_clientsWantDetectionEnabled
{
  return -[NSMutableSet count](self->_clientsWantingDetectionEnabled, "count") != 0;
}

- (void)processHIDEvent:(__IOHIDEvent *)a3
{
  unsigned int IntegerValue;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetType() != 14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBProximitySensorManager.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IOHIDEventGetType(event) == kIOHIDEventTypeProximity"));

  }
  IntegerValue = IOHIDEventGetIntegerValue();
  SBLogProximitySensor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BKSHIDEventGetConciseDescription();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "prox! %{public}@", buf, 0xCu);

  }
  BKSHIDEventGetProximityAttributes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "proximityDetectionMode");
  -[SBProximitySensorManager _setObjectInCrudeProximity:](self, "_setObjectInCrudeProximity:", (IntegerValue >> 10) & 1);
  -[SBProximitySensorManager _setObjectInProximity:detectionMode:](self, "_setObjectInProximity:detectionMode:", (IntegerValue >> 6) & 1, v9);

}

- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4 postToApps:(BOOL)a5
{
  uint64_t v5;
  _BOOL8 v6;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  _BOOL4 cf;
  CFTypeRef cfa;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  _BOOL4 v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  if (self->_objectInProximity != a3)
  {
    v5 = *(_QWORD *)&a4;
    v6 = a3;
    cf = a5;
    self->_objectInProximity = a3;
    self->_proximityDetectionMode = a4;
    SBLogProximitySensor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBKSHIDServicesProximityDetectionMode();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v47 = v6;
      v48 = 2114;
      v49 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "objectInProximity is now:%{BOOL}u mode:(%{public}@)", buf, 0x12u);

    }
    -[SBProximitySensorManager _updateProxState](self, "_updateProxState");
    v54 = *MEMORY[0x1E0DAC438];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_objectInProximity);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v11;
    objc_msgSend(v12, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC370], 0, v11);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v18, "proximitySensorManager:objectWithinProximityDidChange:detectionMode:", self, v6, v5);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v18, "proximitySensorManager:objectWithinProximityDidChange:", self, v6);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v15);
    }

    if (cf)
    {
      mach_absolute_time();
      cfa = (CFTypeRef)IOHIDEventCreateProximtyEvent();
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "externalForegroundApplicationSceneHandles");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "scene");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "uiClientSettings");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "proximityDetectionModes");

            if ((v28 & 2) != 0)
            {
              objc_msgSend(v26, "clientProcess");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "bundleIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "clientProcess");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "state");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "pid");

              SBLogProximitySensor();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109634;
                v47 = v6;
                v48 = 2114;
                v49 = v30;
                v50 = 1024;
                v51 = v33;
                _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "sending prox notification (object in proximity:%{BOOL}u) to %{public}@ (pid %d)", buf, 0x18u);
              }

              BKSHIDEventSendToProcess();
            }

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        }
        while (v23);
      }

      CFRelease(cfa);
    }

  }
}

- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4
{
  -[SBProximitySensorManager _setObjectInProximity:detectionMode:postToApps:](self, "_setObjectInProximity:detectionMode:postToApps:", a3, *(_QWORD *)&a4, 1);
}

- (void)_setObjectInCrudeProximity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (self->_objectInCrudeProximity != a3 || !a3)
  {
    self->_objectInCrudeProximity = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "proximitySensorManager:crudeProximityDidChange:", self, v3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (SBProximitySensorManager)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBProximitySensorManager *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  SBProximitySensorManager *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init not available"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("SBProximitySensorManager.m");
    v17 = 1024;
    v18 = 55;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBProximitySensorManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (SBProximitySensorManager)initWithHIDInterface:(id)a3 hardwareDefaults:(id)a4 interfaceOrientationProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBProximitySensorManager *v12;
  NSMutableSet *v13;
  NSMutableSet *clientsWantingDetectionEnabled;
  NSMutableSet *v15;
  NSMutableSet *clientsWantingGracePeriodDisabled;
  SBHardwareDefaults *hardwareDefaults;
  void *v18;
  SBProximitySensorManager *v19;
  id v20;
  _QWORD v22[4];
  SBProximitySensorManager *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBProximitySensorManager;
  v12 = -[SBProximitySensorManager init](&v24, sel_init);
  if (v12)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clientsWantingDetectionEnabled = v12->_clientsWantingDetectionEnabled;
    v12->_clientsWantingDetectionEnabled = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clientsWantingGracePeriodDisabled = v12->_clientsWantingGracePeriodDisabled;
    v12->_clientsWantingGracePeriodDisabled = v15;

    objc_storeStrong((id *)&v12->_hidInterface, a3);
    objc_storeStrong((id *)&v12->_hardwareDefaults, a4);
    objc_storeStrong((id *)&v12->_interfaceOrientationProvider, a5);
    hardwareDefaults = v12->_hardwareDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableProximitySensor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__SBProximitySensorManager_initWithHIDInterface_hardwareDefaults_interfaceOrientationProvider___block_invoke;
    v22[3] = &unk_1E8E9DED8;
    v19 = v12;
    v23 = v19;
    v20 = (id)-[SBHardwareDefaults observeDefault:onQueue:withBlock:](hardwareDefaults, "observeDefault:onQueue:withBlock:", v18, MEMORY[0x1E0C80D38], v22);

    -[SBProximitySensorManager _reloadDefaults](v19, "_reloadDefaults");
    -[SpringBoard addActiveOrientationObserver:](v12->_interfaceOrientationProvider, "addActiveOrientationObserver:", v19);

  }
  return v12;
}

uint64_t __95__SBProximitySensorManager_initWithHIDInterface_hardwareDefaults_interfaceOrientationProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDefaults");
}

- (void)dealloc
{
  objc_super v3;

  -[BSCompoundAssertion invalidate](self->_suppressBacklightChangesAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBProximitySensorManager;
  -[SBProximitySensorManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_proximityDetectionEnabled, CFSTR("_proximityDetectionEnabled"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_proximityDetectionPermitted, CFSTR("_proximityDetectionPermitted"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_objectInProximity, CFSTR("_objectInProximity"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_clientsWantingDetectionEnabled, CFSTR("_clientsWantingDetectionEnabled"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_clientsWantingGracePeriodDisabled, CFSTR("_clientsWantingGracePeriodDisabled"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isGracePeriodDisabled
{
  return -[NSMutableSet count](self->_clientsWantingGracePeriodDisabled, "count") != 0;
}

- (void)client:(id)a3 wantsProximityDetectionEnabled:(BOOL)a4
{
  -[SBProximitySensorManager client:wantsProximityDetectionEnabled:disableGracePeriod:](self, "client:wantsProximityDetectionEnabled:disableGracePeriod:", a3, a4, 0);
}

- (void)client:(id)a3 wantsProximityDetectionEnabled:(BOOL)a4 disableGracePeriod:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  NSMutableSet *clientsWantingDetectionEnabled;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBProximitySensorManager.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

  }
  SBLogProximitySensor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v14 = v9;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Client:%{public}@ wants active proximity sensor:%{BOOL}u disable grace period:%{BOOL}u", buf, 0x18u);
  }

  clientsWantingDetectionEnabled = self->_clientsWantingDetectionEnabled;
  if (v6)
  {
    -[NSMutableSet addObject:](clientsWantingDetectionEnabled, "addObject:", v9);
    if (v5)
      -[NSMutableSet addObject:](self->_clientsWantingGracePeriodDisabled, "addObject:", v9);
  }
  else
  {
    -[NSMutableSet removeObject:](clientsWantingDetectionEnabled, "removeObject:", v9);
    -[NSMutableSet removeObject:](self->_clientsWantingGracePeriodDisabled, "removeObject:", v9);
  }
  -[SBProximitySensorManager _updateProxState](self, "_updateProxState");

}

- (void)resetProximityCalibration
{
  ADClientAddValueForScalarKey();
  if (!-[SBProximitySensorManager isProximityDetectionEnabled](self, "isProximityDetectionEnabled"))
    ADClientAddValueForScalarKey();
  -[SBProximitySensorControlling resetProximityCalibration](self->_hidInterface, "resetProximityCalibration");
}

- (void)addObserver:(id)a3
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

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (id)suppressBacklightChangesForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *suppressBacklightChangesAssertion;
  BSCompoundAssertion *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  suppressBacklightChangesAssertion = self->_suppressBacklightChangesAssertion;
  if (!suppressBacklightChangesAssertion)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__SBProximitySensorManager_suppressBacklightChangesForReason___block_invoke;
    v12[3] = &unk_1E8EB3470;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SuppressProxBacklightChanges"), v12);
    v6 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suppressBacklightChangesAssertion;
    self->_suppressBacklightChangesAssertion = v6;

    v8 = self->_suppressBacklightChangesAssertion;
    SBLogProximitySensor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v8, "setLog:", v9);

    suppressBacklightChangesAssertion = self->_suppressBacklightChangesAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](suppressBacklightChangesAssertion, "acquireForReason:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __62__SBProximitySensorManager_suppressBacklightChangesForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "isActive");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "proximitySensorManager:shouldSuppressBacklightChanges:", *(_QWORD *)(a1 + 32), v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_setProximityDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_proximityDetectionEnabled != a3)
  {
    v3 = a3;
    self->_proximityDetectionEnabled = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "proximitySensorManager:proximityDetectionEnabledDidChange:", self, v3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)_setProximityDetectionPermitted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_proximityDetectionPermitted != a3)
  {
    v3 = a3;
    self->_proximityDetectionPermitted = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "proximitySensorManager:proximityDetectionPermittedDidChange:", self, v3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)_destroy
{
  -[SpringBoard removeActiveOrientationObserver:](self->_interfaceOrientationProvider, "removeActiveOrientationObserver:", self);
}

- (void)_reloadDefaults
{
  -[SBProximitySensorManager _setProximityDetectionPermitted:](self, "_setProximityDetectionPermitted:", -[SBHardwareDefaults disableProximitySensor](self->_hardwareDefaults, "disableProximitySensor") ^ 1);
}

- (void)_enableProx
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  _BOOL4 v14;
  NSMutableSet *clientsWantingDetectionEnabled;
  int v16;
  NSMutableSet *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SBProximitySensorManager isProximityDetectionPermitted](self, "isProximityDetectionPermitted"))
  {
    -[SBProximitySensorManager _setProximityDetectionEnabled:](self, "_setProximityDetectionEnabled:", 1);
    +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentTransaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v13 = v8;

    v14 = objc_msgSend(v13, "source") == 61;
    -[SBProximitySensorControlling setProximityDetectionEnabled:changeSource:](self->_hidInterface, "setProximityDetectionEnabled:changeSource:", 1, 4 * v14);
    SBLogProximitySensor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientsWantingDetectionEnabled = self->_clientsWantingDetectionEnabled;
      v16 = 138543362;
      v17 = clientsWantingDetectionEnabled;
      v10 = "Enabling proximity sensor detection for clients:%{public}@";
      v11 = v9;
      v12 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    SBLogProximitySensor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v10 = "Not enabling prox detection because prox isn't permitted on this device";
      v11 = v9;
      v12 = 2;
LABEL_11:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
    }
  }

}

- (void)_disableProx
{
  -[SBProximitySensorManager _setProximityDetectionEnabled:](self, "_setProximityDetectionEnabled:", 0);
  -[SBProximitySensorControlling setProximityDetectionEnabled:](self->_hidInterface, "setProximityDetectionEnabled:", 0);
}

- (BOOL)isObjectInProximity
{
  return self->_objectInProximity;
}

- (BOOL)isProximityDetectionPermitted
{
  return self->_proximityDetectionPermitted;
}

- (SpringBoard)_interfaceOrientationProvider
{
  return self->_interfaceOrientationProvider;
}

- (void)_setInterfaceOrientationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceOrientationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceOrientationProvider, 0);
  objc_storeStrong((id *)&self->_suppressBacklightChangesAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_hardwareDefaults, 0);
  objc_storeStrong((id *)&self->_hidInterface, 0);
  objc_storeStrong((id *)&self->_clientsWantingGracePeriodDisabled, 0);
  objc_storeStrong((id *)&self->_clientsWantingDetectionEnabled, 0);
}

@end
