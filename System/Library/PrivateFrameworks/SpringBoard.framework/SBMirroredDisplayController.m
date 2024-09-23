@implementation SBMirroredDisplayController

- (SBMirroredDisplayController)initWithExternalDisplayDefaults:(id)a3
{
  id v5;
  SBMirroredDisplayController *v6;
  SBMirroredDisplayController *v7;
  id v8;
  uint64_t v9;
  BSInvalidatable *stateCaptureToken;
  id v12;
  id location;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBMirroredDisplayController;
  v6 = -[SBMirroredDisplayController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_externalDisplayDefaults, a3);
    objc_initWeak(&location, v7);
    v8 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v12, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v9 = objc_claimAutoreleasedReturnValue();
    stateCaptureToken = v7->_stateCaptureToken;
    v7->_stateCaptureToken = (BSInvalidatable *)v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __63__SBMirroredDisplayController_initWithExternalDisplayDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBMirroredDisplayController;
  -[SBMirroredDisplayController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  SBMirroredDisplayController *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayIdentity description](self->_displayIdentity, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__SBMirroredDisplayController_description__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", v4, 0, &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __42__SBMirroredDisplayController_description__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "hasControlOfDisplay"), CFSTR("hasControlOfDisplay"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(v3 + 24))
  {
    v5 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__SBMirroredDisplayController_description__block_invoke_2;
    v14[3] = &unk_1E8E9E820;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v15 = v6;
    v16 = v7;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("FBSDisplayConfiguration"), CFSTR("\t"), v14);

    v3 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v3 + 72))
  {
    v8 = *(void **)(a1 + 32);
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __42__SBMirroredDisplayController_description__block_invoke_3;
    v11[3] = &unk_1E8E9E820;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = v9;
    v13 = v10;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("CADisplay"), CFSTR("\t"), v11);

  }
}

void __42__SBMirroredDisplayController_description__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "bounds");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("bounds"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "pointScale");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("scale"), 2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "pixelSize");
  v7 = (id)objc_msgSend(v6, "appendSize:withName:", CFSTR("pixelSize"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "overscanCompensation");
  FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("overscanCompensation"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "currentMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("currentMode"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "identity");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "appendUInt64:withName:", objc_msgSend(v15, "connectionSeed"), CFSTR("connectionSeed"));

}

id __42__SBMirroredDisplayController_description__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "bounds");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("bounds"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "overscanAdjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("overscanAdjustment"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "logicalScale");
  v7 = (id)objc_msgSend(v6, "appendSize:withName:", CFSTR("activeLogicalScale"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "minimumLogicalScale");
  v9 = (id)objc_msgSend(v8, "appendDouble:withName:decimalPrecision:", CFSTR("minimumLogicalScale"), 2);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "maximumLogicalScale");
  v11 = (id)objc_msgSend(v10, "appendDouble:withName:decimalPrecision:", CFSTR("maximumLogicalScale"), 2);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "transportType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:", v13, CFSTR("transportType"));

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "currentMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "appendObject:withName:", v15, CFSTR("currentMode"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "seed"), CFSTR("seed"));
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8
{
  FBSDisplayIdentity *v13;
  FBSDisplayConfiguration *v14;
  OS_dispatch_queue *v15;
  SBDisplayAssertion *v16;
  FBSDisplayIdentity *displayIdentity;
  FBSDisplayIdentity *v18;
  id v19;
  FBSDisplayConfiguration *currentConfiguration;
  FBSDisplayConfiguration *v21;
  CADisplay *v22;
  CADisplay *caDisplay;
  SBDisplayAssertion *displayAssertion;
  SBDisplayAssertion *v25;
  void *v26;
  FBSDisplayLayoutPublishing *v27;
  FBSDisplayLayoutPublishing *layoutPublisher;
  OS_dispatch_queue *displayMutationQueue;

  v13 = (FBSDisplayIdentity *)a3;
  v14 = (FBSDisplayConfiguration *)a4;
  v15 = (OS_dispatch_queue *)a7;
  v16 = (SBDisplayAssertion *)a8;
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v13;
  v18 = v13;
  v19 = a5;

  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v14;
  v21 = v14;

  -[FBSDisplayConfiguration CADisplay](self->_currentConfiguration, "CADisplay");
  v22 = (CADisplay *)objc_claimAutoreleasedReturnValue();
  caDisplay = self->_caDisplay;
  self->_caDisplay = v22;

  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v16;
  v25 = v16;

  -[FBSDisplayIdentity rootIdentity](v18, "rootIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutPublisherForDisplay:", v26);
  v27 = (FBSDisplayLayoutPublishing *)objc_claimAutoreleasedReturnValue();

  layoutPublisher = self->_layoutPublisher;
  self->_layoutPublisher = v27;

  displayMutationQueue = self->_displayMutationQueue;
  self->_displayMutationQueue = v15;

  -[SBMirroredDisplayController _updateIdleSleepReason:](self, "_updateIdleSleepReason:", CFSTR("SBMirroredDisplayDisableIdleSleep"));
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  FBSDisplayConfiguration **p_currentConfiguration;
  FBSDisplayLayoutPublishing *layoutPublisher;
  uint64_t v8;
  FBSDisplayLayoutPublishing *v9;
  FBSDisplayLayoutPublishing *v10;
  FBSDisplayLayoutPublishing *v11;
  id v12;

  p_currentConfiguration = &self->_currentConfiguration;
  v12 = a4;
  if ((-[FBSDisplayConfiguration isEqual:](*p_currentConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentConfiguration, a4);
    if (-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
    {
      layoutPublisher = self->_layoutPublisher;
      v8 = objc_opt_class();
      v9 = layoutPublisher;
      if (v8)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v11 = v10;

      -[FBSDisplayLayoutPublishing setDisplayConfiguration:](v11, "setDisplayConfiguration:", *p_currentConfiguration);
    }
  }

}

- (void)displayIdentityDidDisconnect:(id)a3
{
  -[BSAtomicSignal signal](self->_lostControlOfDisplaySignal, "signal", a3);
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  BSAtomicSignal *v5;
  BSAtomicSignal *lostControlOfDisplaySignal;
  BSAtomicSignal *v7;
  FBSDisplayIdentity *v8;
  dispatch_time_t v9;
  FBSDisplayIdentity *v10;
  BSAtomicSignal *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(id *);
  void *v17;
  BSAtomicSignal *v18;
  FBSDisplayIdentity *v19;
  SBMirroredDisplayController *v20;
  SEL v21;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBMirroredDisplayController displayAssertionDidGainControlOfDisplay:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBMirroredDisplayController.m"), 138, CFSTR("this call must be made on the main thread"));

  }
  -[CADisplay addObserver:forKeyPath:options:context:](self->_caDisplay, "addObserver:forKeyPath:options:context:", self, CFSTR("preferences"), 0, self);
  v5 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
  lostControlOfDisplaySignal = self->_lostControlOfDisplaySignal;
  self->_lostControlOfDisplaySignal = v5;

  v7 = v5;
  v8 = self->_displayIdentity;
  -[SBMirroredDisplayController _updateIdleSleepReason:](self, "_updateIdleSleepReason:", CFSTR("SBMirroredDisplayDisableIdleSleep"));
  v9 = dispatch_time(0, 30000000000);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __71__SBMirroredDisplayController_displayAssertionDidGainControlOfDisplay___block_invoke;
  v17 = &unk_1E8EA0AC8;
  v18 = v7;
  v19 = v8;
  v20 = self;
  v21 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_after(v9, MEMORY[0x1E0C80D38], &v14);
  -[SBMirroredDisplayController _ensureCADisplayModeForMirroring](self, "_ensureCADisplayModeForMirroring", v14, v15, v16, v17);
  objc_msgSend(MEMORY[0x1E0CD28B0], "generateSeed");

}

uint64_t __71__SBMirroredDisplayController_displayAssertionDidGainControlOfDisplay___block_invoke(id *a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1[4], "hasBeenSignalled");
  if ((result & 1) == 0)
  {
    SBLogDisplayControlling();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(a1[5], a1[6]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing disable idle sleep reason after timeout", (uint8_t *)&v5, 0xCu);

    }
    return objc_msgSend(a1[6], "_updateIdleSleepReason:", 0);
  }
  return result;
}

- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4
{
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBMirroredDisplayController displayAssertion:didLoseControlOfDisplayForDeactivationReasons:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBMirroredDisplayController.m"), 159, CFSTR("this call must be made on the main thread"));

  }
  -[CADisplay removeObserver:forKeyPath:context:](self->_caDisplay, "removeObserver:forKeyPath:context:", self, CFSTR("preferences"), self);
  -[BSAtomicSignal signal](self->_lostControlOfDisplaySignal, "signal");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__SBMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = &unk_1E8E9DE88;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v6);
}

uint64_t __78__SBMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect CADisplay prefs change", (uint8_t *)&v5, 0xCu);

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hasControlOfDisplay");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_ensureCADisplayModeForMirroring");
  return result;
}

- (void)_ensureCADisplayModeForMirroring
{
  id v4;
  void *v5;
  void *v6;
  CADisplayMode *v7;
  CADisplayMode *requestedMode;
  NSString *v9;
  NSString *requestedOverscanAdjustment;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  BSAtomicSignal *v24;
  NSObject *displayMutationQueue;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  CGSize v30;
  _QWORD block[4];
  BSAtomicSignal *v32;
  id v33;
  id v34;
  SBMirroredDisplayController *v35;
  CGSize v36;
  uint64_t v37;
  SEL v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBMirroredDisplayController _ensureCADisplayModeForMirroring]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("SBMirroredDisplayController.m"), 180, CFSTR("this call must be made on the main thread"));

  }
  v4 = objc_alloc_init(MEMORY[0x1E0CD2738]);
  if (-[SBExternalDisplayDefaults chamois](self->_externalDisplayDefaults, "chamois"))
  {
    -[CADisplay nativeSize](self->_caDisplay, "nativeSize");
    objc_msgSend(v4, "setResolution:");
  }
  -[CADisplay preferredModeWithCriteria:](self->_caDisplay, "preferredModeWithCriteria:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_requestedMode)
  {
    -[CADisplay currentMode](self->_caDisplay, "currentMode");
    v7 = (CADisplayMode *)objc_claimAutoreleasedReturnValue();
    requestedMode = self->_requestedMode;
    self->_requestedMode = v7;

  }
  if (!self->_requestedOverscanAdjustment)
  {
    -[CADisplay overscanAdjustment](self->_caDisplay, "overscanAdjustment");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestedOverscanAdjustment = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v9;

  }
  if (BSSizeEqualToSize())
  {
    -[CADisplay logicalScale](self->_caDisplay, "logicalScale");
    self->_requestedLogicalScale.width = v11;
    self->_requestedLogicalScale.height = v12;
  }
  v13 = SBCADifferenceMaskCalculate(self->_caDisplay, v5, v6, 1);
  if (SBCADisplayDifferenceMaskHasDifference(v13))
  {
    SBLogDisplayControlling();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBCADisplayDifferenceMaskDescription(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v15;
      v41 = 2114;
      v42 = v16;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ we're in control of the display but our CADisplay needs updating: %{public}@", buf, 0x16u);

    }
    objc_storeStrong((id *)&self->_requestedMode, v5);
    v17 = (NSString *)objc_msgSend(v6, "copy");
    v18 = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v17;

    __asm { FMOV            V0.2D, #1.0 }
    v30 = _Q0;
    self->_requestedLogicalScale = _Q0;
    v24 = self->_lostControlOfDisplaySignal;
    displayMutationQueue = self->_displayMutationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke;
    block[3] = &unk_1E8EA5300;
    v32 = v24;
    v33 = v5;
    v34 = v6;
    v35 = self;
    v36 = v30;
    v37 = 1;
    v38 = a2;
    v26 = v24;
    dispatch_async(displayMutationQueue, block);

LABEL_18:
    goto LABEL_19;
  }
  if (v13 == -1)
  {
    SBLogDisplayControlling();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v27;
      v41 = 2114;
      v42 = v5;
      v43 = 2114;
      v44 = v6;
      _os_log_error_impl(&dword_1D0540000, v26, OS_LOG_TYPE_ERROR, "%{public}@ we're in control of the display but we can't tell if our CADisplay is up to date. is one of these nil? preferredMode:%{public}@; preferredOverscan:%{public}@",
        buf,
        0x20u);

    }
    goto LABEL_18;
  }
LABEL_19:

}

void __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CD2740]);
    objc_msgSend(v2, "setCurrentMode:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setOverscanAdjustment:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setConnectionSeed:", objc_msgSend(v3, "connectionSeed"));

    objc_msgSend(v2, "setLogicalScale:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(v2, "setPointScale:", *(_QWORD *)(a1 + 80));
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 72), "setDisplayProperties:", v2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2;
    block[3] = &unk_1E8EA0CC0;
    v10 = v4;
    v5 = *(_QWORD *)(a1 + 88);
    block[4] = *(_QWORD *)(a1 + 56);
    v9 = v5;
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  SBLogDisplayControlling();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v9 = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ display change successful : mode=%{public}@ overscan=%{public}@", (uint8_t *)&v9, 0x20u);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(a1, v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayAssertion");
}

- (void)_updateIdleSleepReason:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_idleSleepReason, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_idleSleepReason, a3);
    -[SBMirroredDisplayController _updateDisplayAssertion](self, "_updateDisplayAssertion");
  }

}

- (void)_updateDisplayAssertion
{
  void *v3;
  SBDisplayAssertionPreferences *v4;

  v4 = objc_alloc_init(SBDisplayAssertionPreferences);
  -[SBDisplayAssertionPreferences setWantsControlOfDisplay:](v4, "setWantsControlOfDisplay:", 1);
  -[SBDisplayAssertionPreferences setDisableSystemIdleSleepReason:](v4, "setDisableSystemIdleSleepReason:", self->_idleSleepReason);
  +[SBDisplayPowerLogEntry forDisplay:mode:zoom:](SBDisplayPowerLogEntry, "forDisplay:mode:zoom:", self->_currentConfiguration, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionPreferences setPowerLogEntry:](v4, "setPowerLogEntry:", v3);
  -[SBDisplayAssertionPreferences setCloneMirroringMode:](v4, "setCloneMirroringMode:", 1);
  -[SBDisplayAssertion updateWithPreferences:](self->_displayAssertion, "updateWithPreferences:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_requestedOverscanAdjustment, 0);
  objc_storeStrong((id *)&self->_requestedMode, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_displayMutationQueue, 0);
  objc_storeStrong((id *)&self->_idleSleepReason, 0);
  objc_storeStrong((id *)&self->_lostControlOfDisplaySignal, 0);
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_layoutPublisher, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
}

void __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "%{public}@ display change failed: is the connection seed out of date?", (uint8_t *)&v4, 0xCu);

}

@end
