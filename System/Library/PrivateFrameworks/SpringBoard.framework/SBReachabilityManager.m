@implementation SBReachabilityManager

- (void)deactivateReachability
{
  -[SBReachabilityManager _updateReachabilityModeActive:](self, "_updateReachabilityModeActive:", 0);
}

- (void)_updateReachabilityModeActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  SBFZStackParticipant *v12;
  SBFZStackParticipant *zStackParticipant;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  uint8_t buf[8];
  _QWORD v20[4];
  BOOL v21;

  if (self->_reachabilityModeActive != a3)
  {
    v4 = a4;
    v5 = a3;
    ++self->_reachabilityExtensionGenerationCount;
    self->_reachabilityModeActive = a3;
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke;
    v20[3] = &__block_descriptor_33_e5__8__0l;
    v21 = v5;
    objc_msgSend(v7, "logBlock:", v20);

    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "reachability activated", buf, 2u);
      }

      ADClientAddValueForScalarKey();
      -[SBReachabilityManager _setKeepAliveTimer](self, "_setKeepAliveTimer");
      -[SBWindowScene zStackResolver](self->_windowScene, "zStackResolver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acquireParticipantWithIdentifier:delegate:", 26, self);
      v12 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
      zStackParticipant = self->_zStackParticipant;
      self->_zStackParticipant = v12;

      v14 = 6;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "reachability deactivated", buf, 2u);
      }

      -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
      v11 = self->_zStackParticipant;
      self->_zStackParticipant = 0;
      v14 = 7;
    }

    -[SBReachabilityManager _setupReachabilityWindowIfNecessary](self, "_setupReachabilityWindowIfNecessary");
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "emitEvent:", v14);

    v16 = 0;
    if (v5)
      -[SBReachabilityManager reachabilityYOffset](self, "reachabilityYOffset", 0.0);
    if (v4)
      v17 = 3;
    else
      v17 = 2;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke_53;
    v18[3] = &unk_1E8E9E5D8;
    v18[4] = self;
    v18[5] = v16;
    -[SBReachabilityManager _updateReachabilityWindowForYOffset:mode:completion:](self, "_updateReachabilityWindowForYOffset:mode:completion:", v17, v18);
    -[SBReachabilityManager _notifyObserversReachabilityModeActive:](self, "_notifyObserversReachabilityModeActive:", self->_reachabilityModeActive);
  }
}

- (void)_updateReachabilityModeActive:(BOOL)a3
{
  -[SBReachabilityManager _updateReachabilityModeActive:animated:](self, "_updateReachabilityModeActive:animated:", a3, 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_token != -1)
    dispatch_once(&sharedInstance_token, &__block_literal_global_28);
  return (id)sharedInstance___sharedInstance;
}

- (double)effectiveReachabilityYOffset
{
  return self->_effectiveReachabilityYOffset;
}

- (id)ignoredWindows
{
  return -[NSHashTable allObjects](self->_ignoredWindows, "allObjects");
}

- (void)setReachabilityTemporarilyDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Adding temporary reason for disabling reachability: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[NSMutableSet addObject:](self->_temporaryDisabledReasons, "addObject:", v6);
  }
  else if (-[NSMutableSet containsObject:](self->_temporaryDisabledReasons, "containsObject:", v6))
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Removing temporary reason for disabling reachability: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_temporaryDisabledReasons, "removeObject:", v6);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  BOOL v4;
  id v5;
  uint64_t v6;
  void *v7;

  if (self->_reachabilityGestureRecognizer != a3)
    return 0;
  v5 = a4;
  v6 = objc_opt_class();
  SBSafeCast(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = !v7 || objc_msgSend(v7, "edges") != 1;
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  SBScreenEdgePanGestureRecognizer *v6;
  id v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;

  v6 = (SBScreenEdgePanGestureRecognizer *)a3;
  v7 = a4;
  if ((SBScreenEdgePanGestureRecognizer *)self->_dismissPanGestureRecognizer == v6
    || (SBScreenEdgePanGestureRecognizer *)self->_dismissTapGestureRecognizer == v6)
  {
    -[SBScreenEdgePanGestureRecognizer view](v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    v11 = v10;

    v8 = self->_reachabilityModeActive && v11 < self->_effectiveReachabilityYOffset;
  }
  else
  {
    v8 = self->_dismissEdgeGestureRecognizer != v6 || self->_reachabilityModeActive;
  }

  return v8;
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

+ (BOOL)reachabilitySupported
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;

  if (reachabilitySupported_token != -1)
    dispatch_once(&reachabilitySupported_token, &__block_literal_global_5);
  v3 = reachabilitySupported_useReachability;
  if (!reachabilitySupported_useReachability)
  {
    +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "allowOnAllDevices"))
    {
      LOBYTE(v6) = 0;
LABEL_8:

      return v6;
    }
  }
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "reallyDisableReachability") ^ 1;

  if (!v3)
    goto LABEL_8;
  return v6;
}

void __46__SBReachabilityManager_reachabilitySupported__block_invoke()
{
  void *v0;
  const void *v1;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    reachabilitySupported_useReachability = objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
}

uint64_t __39__SBReachabilityManager_sharedInstance__block_invoke()
{
  SBReachabilityManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBReachabilityManager);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBReachabilityManager)init
{
  SBReachabilityManager *v2;
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *temporaryDisabledReasons;
  uint64_t v8;
  NSHashTable *ignoredWindows;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityManager;
  v2 = -[SBReachabilityManager init](&v11, sel_init);
  if (v2 && objc_msgSend((id)objc_opt_class(), "reachabilitySupported"))
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_reachabilityModeEnabled = objc_msgSend(v4, "allowReachability");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleSignificantTimeChanged, CFSTR("SBSignificantTimeChangedNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__screenDidDim, *MEMORY[0x1E0DAC2F0], 0);
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    temporaryDisabledReasons = v2->_temporaryDisabledReasons;
    v2->_temporaryDisabledReasons = v6;

    v2->_effectiveReachabilityYOffset = 0.0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    ignoredWindows = v2->_ignoredWindows;
    v2->_ignoredWindows = (NSHashTable *)v8;

    -[SBReachabilityManager _setupGestureRecognizers](v2, "_setupGestureRecognizers");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_reachabilityGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_dismissEdgeGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_dismissPanGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", self->_dismissTapGestureRecognizer);

  v8.receiver = self;
  v8.super_class = (Class)SBReachabilityManager;
  -[SBReachabilityManager dealloc](&v8, sel_dealloc);
}

- (BOOL)reachabilityEnabled
{
  NSObject *v3;
  NSMutableSet *temporaryEnabledReasons;
  int v6;
  NSMutableSet *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableSet count](self->_temporaryEnabledReasons, "count"))
    return self->_reachabilityModeEnabled;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    temporaryEnabledReasons = self->_temporaryEnabledReasons;
    v6 = 138543362;
    v7 = temporaryEnabledReasons;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Allowing entering reachability mode temporarily for reasons: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (void)setReachabilityEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (+[SBReachabilityManager reachabilitySupported](SBReachabilityManager, "reachabilitySupported"))
  {
    ADClientSetValueForScalarKey();
    if (v3)
    {
      if (!self->_reachabilityModeEnabled)
      {
        self->_reachabilityModeEnabled = 1;
        +[SBDefaults localDefaults](SBDefaults, "localDefaults");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accessibilityDefaults");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = 1;
LABEL_13:
        objc_msgSend(v5, "setAllowReachability:", v7);

      }
    }
    else if (self->_reachabilityModeEnabled)
    {
      -[SBReachabilityManager deactivateReachability](self, "deactivateReachability");
      self->_reachabilityModeEnabled = 0;
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessibilityDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("disable");
      if (v3)
        v9 = CFSTR("enable");
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Can't %{public}@ reachability on an unsupported device!", buf, 0xCu);
    }

  }
}

- (double)reachabilityYOffset
{
  void *v2;
  double v3;
  double v4;

  +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yOffset");
  v4 = v3;

  return v4;
}

- (void)setReachabilityTemporarilyEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSMutableSet *temporaryEnabledReasons;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Adding temporary reason for enabling reachability: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    temporaryEnabledReasons = self->_temporaryEnabledReasons;
    if (!temporaryEnabledReasons)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v10 = self->_temporaryEnabledReasons;
      self->_temporaryEnabledReasons = v9;

      temporaryEnabledReasons = self->_temporaryEnabledReasons;
    }
    -[NSMutableSet addObject:](temporaryEnabledReasons, "addObject:", v6);
  }
  else if (-[NSMutableSet containsObject:](self->_temporaryEnabledReasons, "containsObject:", v6))
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Removing temporary reason for enabling reachability: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_temporaryEnabledReasons, "removeObject:", v6);
  }

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)toggleReachability
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_reachabilityModeActive)
  {
    ADClientAddValueForScalarKey();
    v7 = *MEMORY[0x1E0DABEA8];
    v8[0] = &unk_1E91CFC48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DA9D78];
    v5 = v3;
    objc_msgSend(v4, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emitEvent:withPayload:", 8, v5);

  }
  if (-[SBReachabilityManager canActivateReachability](self, "canActivateReachability"))
    -[SBReachabilityManager _toggleReachabilityMode](self, "_toggleReachabilityMode");
}

- (void)ignoreWindowForReachability:(id)a3
{
  UITransform *inverseReachabilityTransform;
  id v5;

  v5 = a3;
  if (!-[NSHashTable containsObject:](self->_ignoredWindows, "containsObject:"))
  {
    -[NSHashTable addObject:](self->_ignoredWindows, "addObject:", v5);
    inverseReachabilityTransform = self->_inverseReachabilityTransform;
    if (inverseReachabilityTransform)
      -[SBReachabilityManager _modifyDefaultPresentationContextHostTransformForWindow:fromTransform:toTransform:](self, "_modifyDefaultPresentationContextHostTransformForWindow:fromTransform:toTransform:", v5, inverseReachabilityTransform, self->_inverseReachabilityTransform);
  }

}

id __64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("[SBReachabilityManager _updateReachabilityModeActive:]");
  v5 = CFSTR("active");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

_BYTE *__64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke_53(uint64_t a1)
{
  _BYTE *result;

  result = (_BYTE *)BSFloatEqualToFloat();
  if ((_DWORD)result)
  {
    result = *(_BYTE **)(a1 + 32);
    if (!result[16])
      return (_BYTE *)objc_msgSend(result, "_tearDownReachabilityWindow");
  }
  return result;
}

- (void)_setKeepAliveTimer
{
  void *v3;
  double v4;
  double v5;

  ++self->_reachabilityExtensionGenerationCount;
  +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reachabilityInteractiveKeepAlive");
  v5 = v4;

  -[SBReachabilityManager _pingKeepAliveWithDuration:interactedBeforePing:initialKeepAliveTime:](self, "_pingKeepAliveWithDuration:interactedBeforePing:initialKeepAliveTime:", 0, v5, CACurrentMediaTime());
}

- (void)_pingKeepAliveWithDuration:(double)a3 interactedBeforePing:(BOOL)a4 initialKeepAliveTime:(double)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t reachabilityExtensionGenerationCount;
  CFTimeInterval v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[10];
  BOOL v19;

  +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reachabilityDefaultKeepAlive");
  v11 = v10;
  objc_msgSend(v9, "reachabilityInteractiveKeepAlive");
  v13 = v12;
  reachabilityExtensionGenerationCount = self->_reachabilityExtensionGenerationCount;
  v15 = CACurrentMediaTime();
  v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_get_global_queue(25, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke;
  block[3] = &unk_1E8E9E628;
  block[4] = self;
  block[5] = reachabilityExtensionGenerationCount;
  *(CFTimeInterval *)&block[6] = v15;
  *(double *)&block[7] = a5;
  v19 = a4;
  block[8] = v13;
  block[9] = v11;
  dispatch_after(v16, v17, block);

}

void __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  _QWORD v6[7];
  __int128 v7;
  char v8;
  char v9;

  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    BKSHIDServicesLastUserEventTime();
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(double *)(a1 + 48) < v2;
    v6[1] = 3221225472;
    v6[0] = MEMORY[0x1E0C809B0];
    v5 = v4;
    v6[2] = __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke_2;
    v6[3] = &unk_1E8E9E600;
    v6[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = *(_BYTE *)(a1 + 80);
    v6[5] = v3;
    *(double *)&v6[6] = v2;
    v7 = *(_OWORD *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

uint64_t __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke_2(uint64_t a1)
{
  double v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = CACurrentMediaTime() - *(double *)(a1 + 40);
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v28 = v4;
    v29 = 2114;
    v30 = v6;
    v31 = 2114;
    v32 = v7;
    v33 = 2048;
    v34 = v8;
    v35 = 2048;
    v36 = v2;
    v37 = 2048;
    v38 = v9;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%{public}@ interactedSinceScheduling: %{public}@, interactedBeforePing: %{public}@, lastUserEventTime: %g, timeSinceStart: %g, initialKeepAliveTime: %g", buf, 0x3Eu);

  }
  if (!*(_BYTE *)(a1 + 73))
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      v18 = *(double *)(a1 + 64);
      if (v2 > v18)
      {
        ADClientAddValueForScalarKey();
        v23 = *MEMORY[0x1E0DABEA8];
        v24 = &unk_1E91CFC60;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v24;
        v12 = &v23;
        goto LABEL_11;
      }
      v13 = *(void **)(a1 + 32);
      v14 = v18 - v2;
      if (*(double *)(a1 + 56) < v14)
        v14 = *(double *)(a1 + 56);
      v15 = *(double *)(a1 + 40);
      v16 = 0;
      return objc_msgSend(v13, "_pingKeepAliveWithDuration:interactedBeforePing:initialKeepAliveTime:", v16, v14, v15);
    }
LABEL_7:
    v13 = *(void **)(a1 + 32);
    v14 = *(double *)(a1 + 56);
    v15 = *(double *)(a1 + 40);
    v16 = 1;
    return objc_msgSend(v13, "_pingKeepAliveWithDuration:interactedBeforePing:initialKeepAliveTime:", v16, v14, v15);
  }
  if (*(_BYTE *)(a1 + 72))
    goto LABEL_7;
  ADClientAddValueForScalarKey();
  v25 = *MEMORY[0x1E0DABEA8];
  v26 = &unk_1E91CFC60;
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = &v26;
  v12 = &v25;
LABEL_11:
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v23, v24, v25, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DA9D78];
  v21 = v19;
  objc_msgSend(v20, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "emitEvent:withPayload:", 8, v21);

  return objc_msgSend(*(id *)(a1 + 32), "_updateReachabilityModeActive:", 0);
}

- (void)_toggleReachabilityMode
{
  -[SBReachabilityManager _updateReachabilityModeActive:](self, "_updateReachabilityModeActive:", !self->_reachabilityModeActive);
}

- (void)_notifyObserversReachabilityModeActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        SBLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v19 = v13;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "notifying observer of reachability state change: %{public}@", buf, 0xCu);

        }
        if (v3)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "handleReachabilityModeActivated");
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "handleReachabilityModeDeactivated");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (void)_notifyObserversReachabilityYOffsetDidChange
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        SBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v11;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "notifying observer of reachability yOffset change: %{public}@", buf, 0xCu);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "handleReachabilityYOffsetDidChange");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversWillBeginReachabilityAnimation
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        SBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v11;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "notifying observer of will begin reachability animation: %{public}@", buf, 0xCu);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "handleWillBeginReachabilityAnimation");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversDidEndReachabilityAnimation
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        SBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v11;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "notifying observer of did end reachability animation: %{public}@", buf, 0xCu);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "handleDidEndReachabilityAnimation");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (void)_invalidateJindoReason
{
  SAInvalidatable *jindoInertAssertion;
  SAInvalidatable *v4;
  BSContinuousMachTimer *jindoInertTimer;
  BSContinuousMachTimer *v6;

  jindoInertAssertion = self->_jindoInertAssertion;
  if (jindoInertAssertion)
  {
    -[SAInvalidatable invalidateWithReason:](jindoInertAssertion, "invalidateWithReason:", CFSTR("Reachability Complete"));
    v4 = self->_jindoInertAssertion;
    self->_jindoInertAssertion = 0;

  }
  jindoInertTimer = self->_jindoInertTimer;
  if (jindoInertTimer)
  {
    -[BSContinuousMachTimer invalidate](jindoInertTimer, "invalidate");
    v6 = self->_jindoInertTimer;
    self->_jindoInertTimer = 0;

  }
}

- (void)_screenDidDim
{
  -[SBReachabilityManager _updateReachabilityModeActive:animated:](self, "_updateReachabilityModeActive:animated:", 0, 0);
}

- (void)_handleSignificantTimeChanged
{
  void *v2;
  void *v3;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowReachability");

  ADClientSetValueForScalarKey();
}

- (BOOL)canActivateReachability
{
  NSObject *v3;
  NSMutableSet *temporaryDisabledReasons;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  NSMutableSet *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[SBReachabilityManager reachabilityEnabled](self, "reachabilityEnabled"))
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Can't enter reachability mode since it is disabled.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = &__block_literal_global_68;
    goto LABEL_13;
  }
  if (objc_msgSend((id)SBApp, "activeInterfaceOrientation") != 1)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "Can't enter reachability mode in a non-portrait orientation", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = &__block_literal_global_84;
LABEL_13:
    objc_msgSend(v7, "logBlock:", v9);

    return 0;
  }
  if (-[NSMutableSet count](self->_temporaryDisabledReasons, "count"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      temporaryDisabledReasons = self->_temporaryDisabledReasons;
      *(_DWORD *)buf = 138543362;
      v21 = temporaryDisabledReasons;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Can't enter reachability mode temporarily for these reasons: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__SBReachabilityManager_canActivateReachability__block_invoke_93;
    v19[3] = &unk_1E8E9E6B0;
    v19[4] = self;
    objc_msgSend(v5, "logBlock:", v19);

    return 0;
  }
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "application");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_msgSend(v14, "isReachabilitySupported") & 1) == 0)
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "Can't enter reachability mode because the app doesn't support reachability.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logBlock:", &__block_literal_global_99);

    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logBlock:", &__block_literal_global_108);

    v11 = 1;
  }

  return v11;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke()
{
  return &unk_1E91D2490;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke_83()
{
  return &unk_1E91D24E0;
}

id __48__SBReachabilityManager_canActivateReachability__block_invoke_93(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[3];
  _QWORD v5[3];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("[SBReachabilityManager canActivateReachability:]");
  v4[0] = CFSTR("result");
  v4[1] = CFSTR("reason");
  v5[0] = &unk_1E91CFC78;
  v5[1] = CFSTR("NoReachabilityTempDisabled");
  v4[2] = CFSTR("tempReasons");
  v5[2] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke_98()
{
  return &unk_1E91D2530;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke_2()
{
  return &unk_1E91D2580;
}

- (void)_setupGestureRecognizers
{
  SBReachabilityGestureRecognizer *v3;
  SBReachabilityGestureRecognizer *reachabilityGestureRecognizer;
  void *v5;
  SBScreenEdgePanGestureRecognizer *v6;
  SBScreenEdgePanGestureRecognizer *dismissEdgeGestureRecognizer;
  void *v8;
  void *v9;
  SBScreenEdgePanGestureRecognizer *v10;
  SBScreenEdgePanGestureRecognizer *v11;
  void *v12;
  UITapGestureRecognizer *v13;
  UITapGestureRecognizer *dismissTapGestureRecognizer;
  void *v15;
  UIPanGestureRecognizer *v16;
  UIPanGestureRecognizer *dismissPanGestureRecognizer;
  void *v18;

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v3 = -[SBReachabilityGestureRecognizer initWithTarget:action:]([SBReachabilityGestureRecognizer alloc], "initWithTarget:action:", self, sel__activateReachability_);
    reachabilityGestureRecognizer = self->_reachabilityGestureRecognizer;
    self->_reachabilityGestureRecognizer = v3;

    -[SBReachabilityGestureRecognizer setDelegate:](self->_reachabilityGestureRecognizer, "setDelegate:", self);
    -[SBReachabilityGestureRecognizer setAllowedTouchTypes:](self->_reachabilityGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CDF30);
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:withType:", self->_reachabilityGestureRecognizer, 61);

  }
  v6 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", self, sel__panToDeactivateReachability_);
  dismissEdgeGestureRecognizer = self->_dismissEdgeGestureRecognizer;
  self->_dismissEdgeGestureRecognizer = v6;

  -[UIScreenEdgePanGestureRecognizer setEdges:](self->_dismissEdgeGestureRecognizer, "setEdges:", 4);
  -[SBScreenEdgePanGestureRecognizer setDelegate:](self->_dismissEdgeGestureRecognizer, "setDelegate:", self);
  -[SBScreenEdgePanGestureRecognizer setAllowedTouchTypes:](self->_dismissEdgeGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CDF48);
  if ((_SBF_Private_IsD16() & 1) != 0
    || (_SBF_Private_IsD17() & 1) != 0
    || (_SBF_Private_IsD63() & 1) != 0
    || _SBF_Private_IsD64())
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coverSheetDismissGestureSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_dismissEdgeGestureRecognizer;
    objc_msgSend(v9, "edgeRegionSize");
    -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](v10, "_setEdgeRegionSize:");
    v11 = self->_dismissEdgeGestureRecognizer;
    objc_msgSend(v9, "edgeRegionSize");
    -[UIScreenEdgePanGestureRecognizer _setBottomEdgeRegionSize:](v11, "_setBottomEdgeRegionSize:");

  }
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addGestureRecognizer:withType:", self->_dismissEdgeGestureRecognizer, 62);

  v13 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__tapToDeactivateReachability_);
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v13;

  -[UITapGestureRecognizer _setRequiresSystemGesturesToFail:](self->_dismissTapGestureRecognizer, "_setRequiresSystemGesturesToFail:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_dismissTapGestureRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedTouchTypes:](self->_dismissTapGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CDF60);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addGestureRecognizer:withType:", self->_dismissTapGestureRecognizer, 64);

  v16 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__panToDeactivateReachability_);
  dismissPanGestureRecognizer = self->_dismissPanGestureRecognizer;
  self->_dismissPanGestureRecognizer = v16;

  -[UIPanGestureRecognizer setDelegate:](self->_dismissPanGestureRecognizer, "setDelegate:", self);
  -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_dismissPanGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CDF78);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addGestureRecognizer:withType:", self->_dismissPanGestureRecognizer, 63);

  -[SBScreenEdgePanGestureRecognizer setEnabled:](self->_dismissEdgeGestureRecognizer, "setEnabled:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_dismissTapGestureRecognizer, "setEnabled:", 0);
  -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGestureRecognizer, "setEnabled:", 0);
}

- (void)_setupReachabilityWindowIfNecessary
{
  void *v3;
  uint64_t v4;
  SBReachabilityWindow *reachabilityWindow;
  SBReachabilityWindow *v6;
  SBReachabilityWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  if (self->_reachabilityModeActive)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uiLockStateProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isUILocked") & 1) != 0)
      v4 = 0;
    else
      v4 = objc_msgSend(v12, "isDismissGestureActive") ^ 1;

    reachabilityWindow = self->_reachabilityWindow;
    if (!reachabilityWindow)
    {
      v6 = -[SBReachabilityWindow initWithWallpaperVariant:windowScene:]([SBReachabilityWindow alloc], "initWithWallpaperVariant:windowScene:", v4, self->_windowScene);
      v7 = self->_reachabilityWindow;
      self->_reachabilityWindow = v6;

      -[SBWindow setHidden:](self->_reachabilityWindow, "setHidden:", 0);
      -[SBReachabilityManager _sceneForWindow:](self, "_sceneForWindow:", self->_reachabilityWindow);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uiPresentationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__SBReachabilityManager__setupReachabilityWindowIfNecessary__block_invoke;
      v13[3] = &unk_1E8E9E758;
      v13[4] = self;
      objc_msgSend(v9, "modifyDefaultPresentationContext:", v13);

      reachabilityWindow = self->_reachabilityWindow;
    }
    -[SBReachabilityWindow view](reachabilityWindow, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWallpaperVariant:", v4);

    +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLockOverrideEnabled:forReason:", 1, CFSTR("Reachability"));

    -[SBScreenEdgePanGestureRecognizer setEnabled:](self->_dismissEdgeGestureRecognizer, "setEnabled:", 1);
    -[UITapGestureRecognizer setEnabled:](self->_dismissTapGestureRecognizer, "setEnabled:", 1);
    -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGestureRecognizer, "setEnabled:", 1);

  }
}

void __60__SBReachabilityManager__setupReachabilityWindowIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CEA930];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = a2;
  objc_msgSend(v2, "targetForUIWindow:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyLayerPresentationOverrideContextForLayerTarget:block:", v5, &__block_literal_global_140);

}

uint64_t __60__SBReachabilityManager__setupReachabilityWindowIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClippingDisabled:", 1);
}

- (void)_tearDownReachabilityWindow
{
  void *v3;
  void *v4;
  SBReachabilityWindow *reachabilityWindow;
  id v6;
  _QWORD v7[5];

  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLockOverrideEnabled:forReason:", 0, CFSTR("Reachability"));

  -[SBScreenEdgePanGestureRecognizer setEnabled:](self->_dismissEdgeGestureRecognizer, "setEnabled:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_dismissTapGestureRecognizer, "setEnabled:", 0);
  -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGestureRecognizer, "setEnabled:", 0);
  -[SBReachabilityManager _sceneForWindow:](self, "_sceneForWindow:", self->_reachabilityWindow);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SBReachabilityManager__tearDownReachabilityWindow__block_invoke;
  v7[3] = &unk_1E8E9E758;
  v7[4] = self;
  objc_msgSend(v4, "modifyDefaultPresentationContext:", v7);

  -[SBWindow setHidden:](self->_reachabilityWindow, "setHidden:", 1);
  reachabilityWindow = self->_reachabilityWindow;
  self->_reachabilityWindow = 0;

}

void __52__SBReachabilityManager__tearDownReachabilityWindow__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CEA930];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = a2;
  objc_msgSend(v2, "targetForUIWindow:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLayerPresentationOverrideForLayerTarget:", v5);

}

- (void)_modifyDefaultPresentationContextHostTransformForWindow:(id)a3 fromTransform:(id)a4 toTransform:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SBReachabilityManager *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBReachabilityManager _sceneForWindow:](self, "_sceneForWindow:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uiPresentationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke;
  v16[3] = &unk_1E8E9E7A8;
  v17 = v8;
  v18 = v10;
  v19 = self;
  v20 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v11, "modifyDefaultPresentationContext:", v16);

}

void __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0CEA930];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "targetForUIWindow:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke_2;
  v10[3] = &unk_1E8E9E780;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v5, "modifyLayerPresentationOverrideContextForLayerTarget:block:", v9, v10);

}

void __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "transformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = v8;
  if (!v8)
  {
    if (*(_QWORD *)(a1 + 32))
      v5 = objc_alloc_init(MEMORY[0x1E0CEA7A0]);
    else
      v5 = 0;
  }
  v9 = v5;
  objc_msgSend(*(id *)(a1 + 40), "_transitionWithTransformer:fromTransform:toTransform:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = v9;
  else
    v7 = 0;
  objc_msgSend(v3, "setTransformer:", v7);

}

- (void)_transitionWithTransformer:(id)a3 fromTransform:(id)a4 toTransform:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
    objc_msgSend(v9, "removeTransform:", v7);
  if (v8)
    objc_msgSend(v9, "addTransform:reason:", v8, CFSTR("reachability"));

}

- (void)_updateReachabilityWindowForYOffset:(double)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int64_t animationsInFlight;
  UITransform *v15;
  UITransform *v16;
  UITransform *inverseReachabilityTransform;
  UITransform *v18;
  UITransform *v19;
  UITransform *reachabilityTransform;
  void *v21;
  void *v22;
  void *v23;
  SAInvalidatable *v24;
  SAInvalidatable *jindoInertAssertion;
  BSContinuousMachTimer *v26;
  BSContinuousMachTimer *jindoInertTimer;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  UITransform *v39;
  UITransform *v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  BSContinuousMachTimer *v45;
  unsigned int v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  int64_t v52;
  _QWORD v53[5];
  UITransform *v54;
  UITransform *v55;
  id v56;
  double v57;
  _QWORD v58[4];
  id v59;
  id location;
  _QWORD v61[4];
  id v62;

  v8 = a5;
  v9 = v8;
  if (self->_effectiveReachabilityYOffset == a3)
  {
    if (v8)
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }
  else
  {
    -[SBReachabilityWindow view](self->_reachabilityWindow, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v12 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke;
    v61[3] = &unk_1E8E9DED8;
    v13 = v10;
    v62 = v13;
    objc_msgSend(v11, "performWithoutAnimation:", v61);
    animationsInFlight = self->_animationsInFlight;
    if (!animationsInFlight)
    {
      -[SBReachabilityManager _notifyObserversWillBeginReachabilityAnimation](self, "_notifyObserversWillBeginReachabilityAnimation");
      animationsInFlight = self->_animationsInFlight;
    }
    self->_animationsInFlight = animationsInFlight + 1;
    self->_effectiveReachabilityYOffset = a3;
    v15 = self->_inverseReachabilityTransform;
    if ((BSFloatIsZero() & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAB90], "translation:", 0.0, -a3);
      v16 = (UITransform *)objc_claimAutoreleasedReturnValue();
    }
    inverseReachabilityTransform = self->_inverseReachabilityTransform;
    self->_inverseReachabilityTransform = v16;

    v18 = self->_reachabilityTransform;
    if ((BSFloatIsZero() & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAB90], "translation:", 0.0, a3);
      v19 = (UITransform *)objc_claimAutoreleasedReturnValue();
    }
    v47 = v9;
    reachabilityTransform = self->_reachabilityTransform;
    self->_reachabilityTransform = v19;

    +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "animationSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 1);
    if (!self->_jindoInertAssertion)
    {
      objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "restrictSystemApertureToInertWithReason:", CFSTR("Reachability"));
      v24 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
      jindoInertAssertion = self->_jindoInertAssertion;
      self->_jindoInertAssertion = v24;

      v12 = MEMORY[0x1E0C809B0];
      if (a4 != 5 && !self->_jindoInertTimer)
      {
        v26 = (BSContinuousMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01720]), "initWithIdentifier:", CFSTR("com.apple.SBReachabilityManager.SystemApertureInertTimer"));
        jindoInertTimer = self->_jindoInertTimer;
        self->_jindoInertTimer = v26;

        objc_initWeak(&location, self);
        objc_msgSend(v22, "settlingDuration");
        v29 = v28;
        objc_msgSend(v21, "jindoInertDisableOffset");
        v31 = (double)((int)(v29 - v30) & ~((int)(v29 - v30) >> 31));
        v45 = self->_jindoInertTimer;
        v32 = MEMORY[0x1E0C80D38];
        v33 = MEMORY[0x1E0C80D38];
        v58[0] = v12;
        v58[1] = 3221225472;
        v58[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_2;
        v58[3] = &unk_1E8E9DD28;
        objc_copyWeak(&v59, &location);
        -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v45, "scheduleWithFireInterval:leewayInterval:queue:handler:", v32, v58, v31, 0.0);

        objc_destroyWeak(&v59);
        objc_destroyWeak(&location);
        v12 = MEMORY[0x1E0C809B0];
      }
    }
    v34 = (void *)MEMORY[0x1E0CEABB0];
    v53[0] = v12;
    v53[1] = 3221225472;
    v53[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_3;
    v53[3] = &unk_1E8E9E7D0;
    v53[4] = self;
    v54 = v18;
    v55 = v15;
    v35 = v13;
    v36 = v21;
    v37 = v12;
    v38 = v35;
    v56 = v35;
    v57 = a3;
    v50[0] = v37;
    v50[1] = 3221225472;
    v50[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_4;
    v50[3] = &unk_1E8E9E7F8;
    v50[4] = self;
    v52 = a4;
    v51 = v47;
    v39 = v15;
    v40 = v18;
    objc_msgSend(v34, "sb_animateWithSettings:mode:animations:completion:", v22, a4, v53, v50);
    v41 = 0.0;
    if (self->_reachabilityModeActive)
      v41 = 0.1;
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:delay:", 0.15, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x1E0D01908];
    v48[0] = v37;
    v48[1] = 3221225472;
    v48[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_5;
    v48[3] = &unk_1E8E9E820;
    v48[4] = self;
    v49 = v38;
    v44 = v38;
    objc_msgSend(v43, "animateWithSettings:actions:", v42, v48);
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v46);

    v9 = v47;
  }

}

uint64_t __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateJindoReason");
    WeakRetained = v2;
  }

}

void __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneTransformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_transitionWithTransformer:fromTransform:toTransform:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ignoredWindows", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_modifyDefaultPresentationContextHostTransformForWindow:fromTransform:toTransform:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 56), "setContainerViewYOffset:", *(double *)(a1 + 64));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = 0.0;
  if (*(_BYTE *)(v10 + 16))
  {
    if ((unint64_t)(objc_msgSend(*(id *)(v10 + 144), "state") - 1) <= 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "reachabilityYOffset");
      BSUIConstrainValueWithRubberBand();
      v11 = v12;
      if (v12 < -*(double *)(a1 + 64))
        v11 = -*(double *)(a1 + 64);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "setHomeGrabberAdditionalOffset:", v11);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversReachabilityYOffsetDidChange");

}

_QWORD *__77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  uint64_t v8;
  _QWORD *result;

  if (objc_msgSend(*(id *)(a1 + 32), "reachabilityModeActive"))
    objc_msgSend(*(id *)(a1 + 32), "reachabilityYOffset");
  v6 = BSFloatEqualToFloat();
  if (*(_QWORD *)(a1 + 48) != 5 && v6 != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateJindoReason");
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3);
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  result = *(_QWORD **)(a1 + 32);
  if (!result[13])
    return (_QWORD *)objc_msgSend(result, "_notifyObserversDidEndReachabilityAnimation");
  return result;
}

uint64_t __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.0;
  if (*(_BYTE *)(v2 + 16))
    v4 = 1.0;
  else
    v4 = 0.0;
  if (objc_msgSend(*(id *)(v2 + 152), "state") != 1
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "state") != 2)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "state") == 1
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "state") == 2)
    {
      v3 = v4;
      v4 = 0.0;
    }
    else
    {
      v3 = v4;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setHomeGrabberAlpha:", v3);
  return objc_msgSend(*(id *)(a1 + 40), "setChevronAlpha:", v4);
}

- (id)_sceneForWindow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "_scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_activateReachability:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    if (-[SBReachabilityManager canActivateReachability](self, "canActivateReachability"))
      -[SBReachabilityManager _updateReachabilityModeActive:](self, "_updateReachabilityModeActive:", 1);
  }
}

- (void)_tapToDeactivateReachability:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 3)
  {
    v8 = *MEMORY[0x1E0DABEA8];
    v9[0] = &unk_1E91CFCC0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DA9D78];
    v6 = v4;
    objc_msgSend(v5, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emitEvent:withPayload:", 8, v6);

    -[SBReachabilityManager deactivateReachability](self, "deactivateReachability");
  }
}

- (void)_panToDeactivateReachability:(id)a3
{
  UIPanGestureRecognizer *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 reachabilityModeActive;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  SBReachabilityManager *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = (UIPanGestureRecognizer *)a3;
  -[SBReachabilityManager reachabilityYOffset](self, "reachabilityYOffset");
  v6 = v5;
  -[UIPanGestureRecognizer view](v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIPanGestureRecognizer state](v4, "state");
  if ((unint64_t)(v8 - 1) > 1)
  {
    reachabilityModeActive = self->_reachabilityModeActive;
    if (v8 == 3)
    {
      -[UIPanGestureRecognizer velocityInView:](v4, "velocityInView:", v7);
      v14 = v13;
      -[UIPanGestureRecognizer locationInView:](v4, "locationInView:", v7);
      v16 = v15 + v14 * 0.15;
      -[SBReachabilityWindow bounds](self->_reachabilityWindow, "bounds");
      v18 = v17 + -100.0;
      if (self->_reachabilityModeActive)
      {
        v19 = 0.0;
        if (self->_dismissPanGestureRecognizer == v4)
          v19 = v6;
        v18 = v18 - v19;
      }
      if (v16 < v18)
      {
        v27 = *MEMORY[0x1E0DABEA8];
        v28[0] = &unk_1E91CFCD8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0DA9D78];
        v22 = v20;
        objc_msgSend(v21, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "emitEvent:withPayload:", 8, v22);

        reachabilityModeActive = 0;
      }
    }
    if (!reachabilityModeActive)
      v6 = 0.0;
    -[SBReachabilityManager _updateReachabilityModeActive:](self, "_updateReachabilityModeActive:", reachabilityModeActive);
    v24 = self;
    v10 = v6;
    v25 = 3;
  }
  else
  {
    -[UIPanGestureRecognizer translationInView:](v4, "translationInView:", v7);
    v10 = v6 + v9;
    if (v6 + v9 >= 0.0)
    {
      if (v10 > v6)
      {
        -[SBReachabilityWindow bounds](self->_reachabilityWindow, "bounds");
        BSUIConstrainValueWithRubberBand();
        v10 = v6 + v26;
      }
    }
    else
    {
      -[SBReachabilityWindow bounds](self->_reachabilityWindow, "bounds");
      BSUIConstrainValueWithRubberBand();
      v10 = -v11;
    }
    v24 = self;
    v25 = 5;
  }
  -[SBReachabilityManager _updateReachabilityWindowForYOffset:mode:completion:](v24, "_updateReachabilityWindowForYOffset:mode:completion:", v25, 0, v10);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBScreenEdgePanGestureRecognizer *v4;
  SBScreenEdgePanGestureRecognizer *v5;
  char v6;
  SBFZStackParticipant *zStackParticipant;

  v4 = (SBScreenEdgePanGestureRecognizer *)a3;
  v5 = v4;
  if ((SBScreenEdgePanGestureRecognizer *)self->_reachabilityGestureRecognizer == v4)
  {
    v6 = !self->_reachabilityModeActive;
  }
  else if (self->_dismissEdgeGestureRecognizer == v4 && (zStackParticipant = self->_zStackParticipant) != 0)
  {
    v6 = -[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture");
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return 0;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", 0);
  objc_msgSend(v4, "setHomeGestureConsumption:", 1);

}

- (SBReachabilityGestureRecognizer)reachabilityGestureRecognizer
{
  return self->_reachabilityGestureRecognizer;
}

- (BOOL)reachabilityModeActive
{
  return self->_reachabilityModeActive;
}

- (SBScreenEdgePanGestureRecognizer)dismissEdgeGestureRecognizer
{
  return self->_dismissEdgeGestureRecognizer;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissEdgeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_reachabilityGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_jindoInertTimer, 0);
  objc_storeStrong((id *)&self->_jindoInertAssertion, 0);
  objc_storeStrong((id *)&self->_ignoredWindows, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_inverseReachabilityTransform, 0);
  objc_storeStrong((id *)&self->_reachabilityTransform, 0);
  objc_storeStrong((id *)&self->_reachabilityWindow, 0);
  objc_storeStrong((id *)&self->_temporaryDisabledReasons, 0);
  objc_storeStrong((id *)&self->_temporaryEnabledReasons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
