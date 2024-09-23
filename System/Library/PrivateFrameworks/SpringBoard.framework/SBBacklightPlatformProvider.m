@implementation SBBacklightPlatformProvider

- (SBBacklightPlatformProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBacklightPlatformProvider.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBBacklightPlatformProvider init]",
    v5);

  return 0;
}

- (SBBacklightPlatformProvider)initWithBacklightEnvironmentSessionProvider:(id)a3
{
  id v5;
  SBBacklightPlatformProvider *v6;
  SBBacklightPlatformProvider *v7;
  uint64_t v8;
  SBFWakeAnimationSettings *wakeAnimationSettings;
  void *v10;
  uint64_t v11;
  SBAlwaysOnDefaults *alwaysOnDefaults;
  SBAlwaysOnBrightnessCurveController *v13;
  SBAlwaysOnBrightnessCurveController *brightnessCurveController;
  SBAlwaysOnDefaults *v15;
  void *v16;
  void *v17;
  void *v18;
  SBBacklightPlatformProvider *v19;
  id v20;
  void *v21;
  void *v22;
  SBAveragePixelLuminanceLimitController *v23;
  SBAveragePixelLuminanceLimitController *aplLimitController;
  SBAlwaysOnTelemetryEmitter *v25;
  BLSHFlipbookTelemetry *telemetryEmitter;
  int v27;
  unint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  BLSHFlipbookSpecification *flipbookSpecification;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  SBBacklightPlatformProvider *v40;
  objc_super v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SBBacklightPlatformProvider;
  v6 = -[SBBacklightPlatformProvider init](&v41, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0DA9F60], "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    wakeAnimationSettings = v7->_wakeAnimationSettings;
    v7->_wakeAnimationSettings = (SBFWakeAnimationSettings *)v8;

    objc_storeStrong((id *)&v7->_sessionProvider, a3);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alwaysOnDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    alwaysOnDefaults = v7->_alwaysOnDefaults;
    v7->_alwaysOnDefaults = (SBAlwaysOnDefaults *)v11;

    if (-[SBAlwaysOnDefaults useAlwaysOnBrightnessCurve](v7->_alwaysOnDefaults, "useAlwaysOnBrightnessCurve"))
    {
      v13 = objc_alloc_init(SBAlwaysOnBrightnessCurveController);
      brightnessCurveController = v7->_brightnessCurveController;
      v7->_brightnessCurveController = v13;

    }
    -[SBBacklightPlatformProvider _updateAlwaysOnEnabled](v7, "_updateAlwaysOnEnabled");
    v15 = v7->_alwaysOnDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableAlwaysOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forceAndromedaSupport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __75__SBBacklightPlatformProvider_initWithBacklightEnvironmentSessionProvider___block_invoke;
    v39 = &unk_1E8E9DED8;
    v19 = v7;
    v40 = v19;
    v20 = (id)-[SBAlwaysOnDefaults observeDefaults:onQueue:withBlock:](v15, "observeDefaults:onQueue:withBlock:", v18, MEMORY[0x1E0C80D38], &v36);

    +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance", v36, v37, v38, v39);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootWindow");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(SBAveragePixelLuminanceLimitController);
    aplLimitController = v19->_aplLimitController;
    v19->_aplLimitController = v23;

    -[SBAveragePixelLuminanceLimitController setGlobalFilter:](v19->_aplLimitController, "setGlobalFilter:", 1);
    -[SBAveragePixelLuminanceLimitController setTargetView:](v19->_aplLimitController, "setTargetView:", v22);
    if (objc_msgSend((id)objc_opt_class(), "deviceSupportsAlwaysOn"))
      v25 = -[SBAlwaysOnTelemetryEmitter initWithBacklightEnvironmentSessionProvider:]([SBAlwaysOnTelemetryEmitter alloc], "initWithBacklightEnvironmentSessionProvider:", v7->_sessionProvider);
    else
      v25 = v19;
    telemetryEmitter = v19->_telemetryEmitter;
    v19->_telemetryEmitter = (BLSHFlipbookTelemetry *)v25;

    v27 = MGGetSInt32Answer();
    v28 = (unint64_t)(v27 & ~(v27 >> 31)) << 20;
    -[SBAlwaysOnDefaults maximumRenderInterval](v7->_alwaysOnDefaults, "maximumRenderInterval");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "doubleValue");
      v32 = v31;
    }
    else
    {
      v32 = 300.0;
    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01008]), "initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:", v28, 120, 120.0, 3.0, 0.028, 90.0, v32);
    flipbookSpecification = v19->_flipbookSpecification;
    v19->_flipbookSpecification = (BLSHFlipbookSpecification *)v33;

  }
  return v7;
}

uint64_t __75__SBBacklightPlatformProvider_initWithBacklightEnvironmentSessionProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAlwaysOnEnabled");
}

- (void)setSignificantUserInteractionMonitor:(id)a3
{
  SBBacklightSignificantUserInteractionMonitor *v5;
  SBBacklightSignificantUserInteractionMonitor *significantUserInteractionMonitor;
  SBBacklightSignificantUserInteractionMonitor *v7;

  v5 = (SBBacklightSignificantUserInteractionMonitor *)a3;
  significantUserInteractionMonitor = self->_significantUserInteractionMonitor;
  if (significantUserInteractionMonitor != v5)
  {
    v7 = v5;
    -[SBBacklightSignificantUserInteractionMonitor removeObserver:](significantUserInteractionMonitor, "removeObserver:", self);
    objc_storeStrong((id *)&self->_significantUserInteractionMonitor, a3);
    -[SBBacklightSignificantUserInteractionMonitor addObserver:](self->_significantUserInteractionMonitor, "addObserver:", self);
    v5 = v7;
  }

}

- (void)completeInitializationAfterBLSStartup
{
  SBAlwaysOnPolicyCoordinator *v3;
  SBAlwaysOnPolicyCoordinator *alwaysOnPolicyCoordinator;
  BLSHFlipbookTelemetry *telemetryEmitter;
  uint64_t v6;
  BLSHFlipbookTelemetry *v7;
  BLSHFlipbookTelemetry *v8;
  BLSHFlipbookTelemetry *v9;

  v3 = objc_alloc_init(SBAlwaysOnPolicyCoordinator);
  alwaysOnPolicyCoordinator = self->_alwaysOnPolicyCoordinator;
  self->_alwaysOnPolicyCoordinator = v3;

  -[SBAlwaysOnPolicyCoordinator activate](self->_alwaysOnPolicyCoordinator, "activate");
  telemetryEmitter = self->_telemetryEmitter;
  v6 = objc_opt_class();
  v7 = telemetryEmitter;
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
  v9 = v8;

  -[BLSHFlipbookTelemetry setAlwaysOnPolicyCoordinator:](v9, "setAlwaysOnPolicyCoordinator:", self->_alwaysOnPolicyCoordinator);
  -[BLSHFlipbookTelemetry completeIntializationAfterBLSStartup](v9, "completeIntializationAfterBLSStartup");

}

+ (BOOL)deviceSupportsAlwaysOn
{
  char v2;
  int has_internal_content;
  void *v4;
  void *v5;
  char v6;

  v2 = MGGetBoolAnswer();
  has_internal_content = os_variant_has_internal_content();
  if (!has_internal_content || (v2 & 1) != 0)
    return has_internal_content | v2;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alwaysOnDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceAndromedaSupport");

  return v6;
}

- (BOOL)isAlwaysOnEnabled
{
  SBBacklightPlatformProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)backlightFadeInDuration
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;

  +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "lastBacklightChangeSource");
  else
    v4 = 0;
  +[SBScreenWakeAnimationController backlightFadeDurationForSource:isWake:](SBScreenWakeAnimationController, "backlightFadeDurationForSource:isWake:", v4, 1);
  v6 = v5;

  return v6;
}

- (double)backlightFadeOutDuration
{
  double result;

  -[SBFWakeAnimationSettings backlightFadeDuration](self->_wakeAnimationSettings, "backlightFadeDuration");
  return result;
}

- (BLSHFlipbookSpecification)flipbookSpecification
{
  return self->_flipbookSpecification;
}

- (BLSHBacklightEnvironmentSessionProviding)sessionProvider
{
  return (BLSHBacklightEnvironmentSessionProviding *)self->_sessionProvider;
}

- (BOOL)suppressionSupported
{
  return 1;
}

- (BOOL)isShowingBlankingWindow
{
  SBBacklightPlatformProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_showingBlankingWindow;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)showBlankingWindow:(BOOL)a3 withFadeDuration:(double)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_showingBlankingWindow = a3;
  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

uint64_t __67__SBBacklightPlatformProvider_showBlankingWindow_withFadeDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBlankingWindowVisible:fadeDuration:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

- (BOOL)isUsingAlwaysOnBrightnessCurve
{
  return -[SBAlwaysOnBrightnessCurveController isUsingAlwaysOnBrightnessCurve](self->_brightnessCurveController, "isUsingAlwaysOnBrightnessCurve");
}

- (void)useAlwaysOnBrightnessCurve:(BOOL)a3 withRampDuration:(double)a4
{
  -[SBAlwaysOnBrightnessCurveController setUseAlwaysOnBrightnessCurve:withRampDuration:](self->_brightnessCurveController, "setUseAlwaysOnBrightnessCurve:withRampDuration:");
  BSDispatchMain();
}

uint64_t __75__SBBacklightPlatformProvider_useAlwaysOnBrightnessCurve_withRampDuration___block_invoke(uint64_t a1)
{
  double v1;
  _QWORD v3[5];
  char v4;

  v1 = *(double *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__SBBacklightPlatformProvider_useAlwaysOnBrightnessCurve_withRampDuration___block_invoke_2;
  v3[3] = &unk_1E8E9F508;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, v1);
}

uint64_t __75__SBBacklightPlatformProvider_useAlwaysOnBrightnessCurve_withRampDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  if (*(_BYTE *)(a1 + 40))
    v3 = objc_msgSend(*(id *)(v1 + 48), "enforceOverallAPLLimit");
  else
    v3 = 0;
  return objc_msgSend(v2, "setAplLimitsEnabled:", v3);
}

- (void)addObserver:(id)a3
{
  NSHashTable *lock_alwaysOnObservers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_alwaysOnObservers = self->_lock_alwaysOnObservers;
  if (!lock_alwaysOnObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lock_alwaysOnObservers;
    self->_lock_alwaysOnObservers = v5;

    lock_alwaysOnObservers = self->_lock_alwaysOnObservers;
  }
  -[NSHashTable addObject:](lock_alwaysOnObservers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_alwaysOnObservers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (float)backlightDimmedFactor
{
  return 0.05;
}

- (double)backlightDimmingDuration
{
  return 0.5;
}

- (BLSHFlipbookTelemetry)flipbookTelemetryDelegate
{
  return self->_telemetryEmitter;
}

- (void)_updateAlwaysOnEnabled
{
  int v3;
  uint64_t v4;
  int lock_alwaysOnEnabled;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
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
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "deviceSupportsAlwaysOn"))
    v3 = _os_feature_enabled_impl();
  else
    v3 = 0;
  v4 = -[SBAlwaysOnDefaults enableAlwaysOn](self->_alwaysOnDefaults, "enableAlwaysOn") & v3;
  os_unfair_lock_lock(&self->_lock);
  lock_alwaysOnEnabled = self->_lock_alwaysOnEnabled;
  self->_lock_alwaysOnEnabled = v4;
  -[NSHashTable allObjects](self->_lock_alwaysOnObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(&self->_lock);
  if (lock_alwaysOnEnabled != (_DWORD)v4)
  {
    SBLogBacklight();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "isAlwaysOnEnabled updated to new value:%{BOOL}u", buf, 8u);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
            objc_msgSend(v14, "platformProvider:didChangeAlwaysOnSetting:", self, v4, (_QWORD)v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)_notifyObserversOfSignificantUserInteraction
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_alwaysOnObservers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBBacklightPlatformProvider sending significant user interaction notice", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "platformProviderDidDetectSignificantUserInteraction:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

- (void)_setBlankingWindowVisible:(BOOL)a3 fadeDuration:(double)a4
{
  _BOOL4 v5;
  void *v7;
  NSObject *v8;
  SBBacklightBlankingWindow *v9;
  void *v10;
  SBBacklightBlankingWindow *blankingWindow;
  uint64_t v12;
  void (**v13)(_QWORD);
  _QWORD v14[5];
  BOOL v15;
  _QWORD v16[5];
  BOOL v17;
  uint8_t buf[4];
  _BOOL4 v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[SBBacklightPlatformProvider windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v19 = v5;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "making blanking window visible: %{BOOL}u duration: %f", buf, 0x12u);
  }

  if (v5 && !self->_blankingWindow)
  {
    v9 = -[SBBacklightBlankingWindow initWithWindowScene:]([SBBacklightBlankingWindow alloc], "initWithWindowScene:", v7);
    -[SBBacklightBlankingWindow setWindowLevel:](v9, "setWindowLevel:", *MEMORY[0x1E0CEB660] + 801.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBacklightBlankingWindow setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[SBBacklightBlankingWindow setAlpha:](v9, "setAlpha:", 0.0);
    -[SBFWindow setHidden:](v9, "setHidden:", 0);
    blankingWindow = self->_blankingWindow;
    self->_blankingWindow = v9;

  }
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke;
  v16[3] = &unk_1E8E9F508;
  v17 = v5;
  v16[4] = self;
  v13 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v16);
  if ((BSFloatIsZero() & 1) != 0)
  {
    v13[2](v13);
  }
  else
  {
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke_2;
    v14[3] = &unk_1E8EA52B0;
    v15 = v5;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v13, v14, a4);
  }
  objc_msgSend(v7, "_synchronizeDrawing");

}

uint64_t __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  double v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = 1.0;
  if (!v1)
    v3 = 0.0;
  return objc_msgSend(v2, "setAlpha:", v3);
}

void __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogBacklight();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "blanking window animation to visible %{BOOL}u completed", (uint8_t *)v6, 8u);
  }

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setHidden:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

  }
}

- (SBBacklightSignificantUserInteractionMonitor)significantUserInteractionMonitor
{
  return self->_significantUserInteractionMonitor;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator
{
  return self->_alwaysOnPolicyCoordinator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_significantUserInteractionMonitor, 0);
  objc_storeStrong((id *)&self->_lock_alwaysOnObservers, 0);
  objc_storeStrong((id *)&self->_alwaysOnPolicyCoordinator, 0);
  objc_storeStrong((id *)&self->_telemetryEmitter, 0);
  objc_storeStrong((id *)&self->_flipbookSpecification, 0);
  objc_storeStrong((id *)&self->_aplLimitController, 0);
  objc_storeStrong((id *)&self->_brightnessCurveController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_blankingWindow, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_wakeAnimationSettings, 0);
}

@end
