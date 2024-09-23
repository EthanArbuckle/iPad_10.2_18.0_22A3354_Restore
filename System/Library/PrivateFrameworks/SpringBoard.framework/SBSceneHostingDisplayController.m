@implementation SBSceneHostingDisplayController

- (SBSceneHostingDisplayController)initWithWorkspaceEventQueue:(id)a3 policy:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBSceneHostingDisplayController *v11;
  SBSceneHostingDisplayController *v12;
  NSMutableArray *v13;
  NSMutableArray *pendingWork;
  id v15;
  uint64_t v16;
  BSInvalidatable *stateCaptureAssertion;
  BSAtomicSignal *v18;
  BSAtomicSignal *readyToTransformDisplaysSignal;
  void *v21;
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspaceEventQueue"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("policy"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)SBSceneHostingDisplayController;
  v11 = -[SBSceneHostingDisplayController init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workspaceEventQueue, a3);
    objc_storeStrong((id *)&v12->_policy, a4);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingWork = v12->_pendingWork;
    v12->_pendingWork = v13;

    objc_initWeak(&location, v12);
    v15 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v23, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v16 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v12->_stateCaptureAssertion;
    v12->_stateCaptureAssertion = (BSInvalidatable *)v16;

    v18 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
    readyToTransformDisplaysSignal = v12->_readyToTransformDisplaysSignal;
    v12->_readyToTransformDisplaysSignal = v18;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

id __70__SBSceneHostingDisplayController_initWithWorkspaceEventQueue_policy___block_invoke(uint64_t a1)
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

  -[BSInvalidatable invalidate](self->_stateCaptureAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSceneHostingDisplayController;
  -[SBSceneHostingDisplayController dealloc](&v3, sel_dealloc);
}

- (void)transformDisplayConfiguration:(id)a3 withBuilder:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  CGFloat size;
  void *sizea;
  void *size_8;
  void *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  double v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;
  CGSize v80;
  CGSize v81;
  CGSize v82;
  CGRect v83;
  CGRect v84;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayIdentity rootIdentity](self->_displayIdentity, "rootIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 185, CFSTR("being asked to transform a display config we know nothing about. _displayIdentity: %@; configuration: %@"),
      self->_displayIdentity,
      v7);

  }
  if (-[BSAtomicSignal hasBeenSignalled](self->_readyToTransformDisplaysSignal, "hasBeenSignalled"))
  {
    -[SBSceneHostingDisplayControllerPolicy displayPreferencesForDisplayController:](self->_policy, "displayPreferencesForDisplayController:", self);
    v13 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject keepOtherModes](v13, "keepOtherModes"))
    {
      objc_msgSend(v7, "availableModes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v7, "preferredMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v16);

      objc_msgSend(v7, "currentMode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v17);

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v7, "immutableCADisplay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject CADisplayModeCriteria](v13, "CADisplayModeCriteria");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredModeWithCriteria:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (double)(unint64_t)objc_msgSend(v21, "width");
    v58 = v21;
    v23 = (double)(unint64_t)objc_msgSend(v21, "height");
    v24 = 1.0;
    v25 = 1.0;
    if (objc_msgSend(v19, "displayType") != 2)
    {
      -[NSObject logicalScale](v13, "logicalScale");
      v27 = v26;
      v29 = v28;
      objc_msgSend(v19, "maximumLogicalScale");
      v25 = v30;
      objc_msgSend(v19, "minimumLogicalScale");
      if (v31 < v27)
        v31 = v27;
      if (v25 > v31)
        v25 = v31;
      objc_msgSend(v19, "maximumLogicalScale");
      v33 = v32;
      objc_msgSend(v19, "minimumLogicalScale");
      if (v34 < v29)
        v34 = v29;
      if (v33 <= v34)
        v24 = v33;
      else
        v24 = v34;
    }
    v35 = v25 * v22;
    -[NSObject contentsScale](v13, "contentsScale");
    v37 = v36;
    size = v22;
    v38 = v25 * v22 / v36;
    v39 = v24 * v23 / v36;
    objc_msgSend(v7, "currentMode");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "_copyWithOverrideSize:scale:", v38, v39, v37);

    objc_msgSend(v8, "setCurrentMode:preferredMode:otherModes:", v41, v41, v15);
    objc_msgSend(v8, "setPixelSize:nativeBounds:bounds:", v35, v24 * v23, 0.0, 0.0, v35, v24 * v23, 0, 0, *(_QWORD *)&v38, *(_QWORD *)&v39);
    -[NSObject displayConfigurationRequest](v13, "displayConfigurationRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "overscanCompensation");
    v57 = v15;
    v44 = (unint64_t)(v43 - 1) < 0xFFFFFFFFFFFFFFFELL;
    if ((unint64_t)(v43 - 1) >= 0xFFFFFFFFFFFFFFFELL)
      v45 = 0;
    else
      v45 = v43;
    objc_msgSend(v7, "safeOverscanRatio");
    objc_msgSend(v8, "setOverscanned:compensation:safeRatio:", v44, v45);
    SBLogDisplayTransforming();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      size_8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identity");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v80.width = size;
      v80.height = v23;
      NSStringFromCGSize(v80);
      sizea = (void *)objc_claimAutoreleasedReturnValue();
      v81.width = v38;
      v81.height = v39;
      NSStringFromCGSize(v81);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v83.origin.x = 0.0;
      v83.origin.y = 0.0;
      v83.size.width = v35;
      v83.size.height = v24 * v23;
      NSStringFromCGRect(v83);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v84.origin.x = 0.0;
      v84.origin.y = 0.0;
      v84.size.width = v38;
      v84.size.height = v39;
      NSStringFromCGRect(v84);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v82.width = v25;
      v82.height = v24;
      NSStringFromCGSize(v82);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      FBSDisplayOverscanCompensationDescription();
      *(_DWORD *)buf = 138545666;
      v60 = size_8;
      v61 = 2114;
      v62 = v53;
      v63 = 2114;
      v64 = sizea;
      v65 = 2114;
      v66 = v52;
      v67 = 2114;
      v68 = v51;
      v69 = 2114;
      v70 = v47;
      v71 = 2048;
      v72 = v37;
      v73 = 2114;
      v74 = v50;
      v75 = 2114;
      v76 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v76;
      v77 = 2114;
      v78 = v41;
      _os_log_debug_impl(&dword_1D0540000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ requesting %{public}@ be transformed to pixelSize: %{public}@; pointSize: %{public}@; nativeBounds: %"
        "{public}@; bounds: %{public}@; contentsScale: %.2f; logicalScale: %{public}@; overscan: %{public}@; currentMode: %{public}@",
        buf,
        0x66u);

    }
  }
  else
  {
    SBLogDisplayTransforming();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v18;
      _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ skipping transform", buf, 0xCu);

    }
  }

}

- (BOOL)isConnected
{
  return -[BSAtomicSignal hasBeenSignalled](self->_displayDisconnectedSignal, "hasBeenSignalled") ^ 1;
}

- (id)createTransactionForTransitionRequest:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = (objc_class *)objc_opt_class();
  _SBDisplayControllerTransactionLabel(v5, CFSTR("clientRequested"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneHostingDisplayController _createUpdateTransactionWithLabel:](self, "_createUpdateTransactionWithLabel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)requestUpdate:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  __CFString *v8;
  _BYTE *v9;
  uint8x8_t v10;
  int v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[3];
  char v19;
  char v20;
  _BYTE buf[24];
  void *v22;
  __CFString *v23;
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v19 = 1;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __SBSceneHostingDisplayControllerUpdateFlagsDescription_block_invoke;
      v22 = &unk_1E8EA1400;
      v24 = v18;
      v8 = v7;
      v23 = v8;
      v9 = buf;
      v20 = 0;
      v10 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
      v10.i16[0] = vaddlv_u8(v10);
      v11 = v10.i32[0];
      if (v10.i32[0])
      {
        v12 = 0;
        do
        {
          if (((1 << v12) & a3) != 0)
          {
            (*(void (**)(_BYTE *))&buf[16])(v9);
            if (v20)
              break;
            --v11;
          }
          if (v12 > 0x3E)
            break;
          ++v12;
        }
        while (v11 > 0);
      }

      _Block_object_dispose(v18, 8);
    }
    else
    {
      v8 = CFSTR(".None");
    }
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ asked to update for %{public}@", buf, 0x16u);

  }
  if ((a3 & 1) != 0)
  {
    -[SBSceneHostingDisplayController _createDisplayAssertionPreferences](self, "_createDisplayAssertionPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBDisplayAssertionPreferences isEqual:](self->_currentDisplayAssertionPreferences, "isEqual:", v13))
    {
      SBLogDisplayControlling();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "%{public}@ no change in preferences. not updating", buf, 0xCu);

      }
    }
    else
    {
      objc_storeStrong((id *)&self->_currentDisplayAssertionPreferences, v13);
      -[SBDisplayAssertion updateWithPreferences:](self->_displayAssertion, "updateWithPreferences:", self->_currentDisplayAssertionPreferences);
    }

  }
  if (!self->_connectionCompleted)
  {
    if ((a3 & 2) == 0)
      return;
    goto LABEL_25;
  }
  if ((a3 & 6) == 2)
  {
LABEL_25:
    -[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate](self, "_enqueueEvaluateAndApplyPresentationUpdate");
    return;
  }
  if ((a3 & 4) != 0)
  {
    v16 = (objc_class *)objc_opt_class();
    _SBDisplayControllerTransactionLabel(v16, CFSTR("policyRequested"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneHostingDisplayController _runRootUpdateTransactionWithLabel:completion:](self, "_runRootUpdateTransactionWithLabel:completion:", v17, 0);

  }
}

- (id)layoutPublisher
{
  return self->_layoutPublisher;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8
{
  id v15;
  id v16;
  SBDisplayAssertion *v17;
  CADisplay *v18;
  CADisplay *caDisplay;
  BSAtomicSignal *v20;
  BSAtomicSignal *displayDisconnectedSignal;
  void *v22;
  FBSDisplayLayoutPublishing *v23;
  FBSDisplayLayoutPublishing *layoutPublisher;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  SBDisplayAssertion *displayAssertion;
  SBDisplayAssertion *v30;
  SBDisplayManager *displayManager;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v39[6];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v37 = a5;
  v36 = a6;
  v35 = a7;
  v17 = (SBDisplayAssertion *)a8;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController connectToDisplayIdentity:configuration:displayManager:sceneManager:caDisplayQueue:assertion:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("SBSceneHostingDisplayController.m"), 279, CFSTR("this call must be made on the main thread"));

  }
  if (self->_displayIdentity)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 281, CFSTR("we're connecting to multiple displays and that seems bad. old display: %@; new display: %@"),
      self->_displayIdentity,
      v15);

  }
  objc_storeStrong((id *)&self->_displayIdentity, a3);
  objc_storeStrong((id *)&self->_displayManager, a5);
  objc_storeStrong((id *)&self->_currentConfiguration, a4);
  objc_storeStrong((id *)&self->_presentedConfiguration, self->_currentConfiguration);
  objc_storeStrong((id *)&self->_sceneManager, a6);
  objc_msgSend(v16, "CADisplay");
  v18 = (CADisplay *)objc_claimAutoreleasedReturnValue();
  caDisplay = self->_caDisplay;
  self->_caDisplay = v18;

  objc_storeStrong((id *)&self->_displayMutationQueue, a7);
  v20 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
  displayDisconnectedSignal = self->_displayDisconnectedSignal;
  self->_displayDisconnectedSignal = v20;

  objc_msgSend(v15, "rootIdentity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layoutPublisherForDisplay:", v22);
  v23 = (FBSDisplayLayoutPublishing *)objc_claimAutoreleasedReturnValue();
  layoutPublisher = self->_layoutPublisher;
  self->_layoutPublisher = v23;

  SBLogDisplayControlling();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SBDisplayAssertionLevelDescription(-[SBDisplayAssertion level](self->_displayAssertion, "level"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay");
    *(_DWORD *)buf = 138543874;
    v41 = v26;
    v42 = 2114;
    v43 = v27;
    v44 = 1024;
    v45 = v28;
    _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ connected to display. assertion level: %{public}@; in control: %{BOOL}u",
      buf,
      0x1Cu);

  }
  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v17;
  v30 = v17;

  -[SBSceneHostingDisplayControllerPolicy connectToDisplayController:displayConfiguration:](self->_policy, "connectToDisplayController:displayConfiguration:", self, self->_currentConfiguration);
  -[BSAtomicSignal signal](self->_readyToTransformDisplaysSignal, "signal");
  displayManager = self->_displayManager;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __127__SBSceneHostingDisplayController_connectToDisplayIdentity_configuration_displayManager_sceneManager_caDisplayQueue_assertion___block_invoke;
  v39[3] = &unk_1E8E9DE88;
  v39[4] = self;
  v39[5] = a2;
  -[SBDisplayManager updateTransformsWithCompletion:](displayManager, "updateTransformsWithCompletion:", v39);

}

void __127__SBSceneHostingDisplayController_connectToDisplayIdentity_configuration_displayManager_sceneManager_caDisplayQueue_assertion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "hasBeenSignalled");
  SBLogDisplayControlling();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated transforms but our display disconnected in the meantime. will not proceed", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated transforms upon display connect. updating assertion", (uint8_t *)&v12, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_createDisplayAssertionPreferences");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 112);
    *(_QWORD *)(v8 + 112) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "updateWithPreferences:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(*(_QWORD *)(a1 + 32) + 152));
    v10 = *(void **)(a1 + 32);
    v11 = (objc_class *)objc_opt_class();
    _SBDisplayControllerTransactionLabel(v11, CFSTR("displayConnect"));
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_runRootUpdateTransactionWithLabel:completion:", v3, 0);
  }

}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  _UIRootWindow *v29;
  _UIRootWindow *blankingWindow;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController displayIdentityDidUpdate:configuration:]");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("SBSceneHostingDisplayController.m"), 329, CFSTR("this call must be made on the main thread"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

LABEL_3:
  v9 = -[FBSDisplayConfiguration isEqual:](self->_currentConfiguration, "isEqual:", v8);
  SBLogDisplayControlling();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if ((v9 & 1) != 0)
  {
    if (v11)
      -[SBSceneHostingDisplayController displayIdentityDidUpdate:configuration:].cold.1((void **)&self->super.isa, (uint64_t)a2, v10);
LABEL_14:

    goto LABEL_15;
  }
  if (v11)
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v31;
    v37 = 2114;
    v38 = v7;
    _os_log_debug_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: identity=%{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_currentConfiguration, a4);
  if (-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    -[_UIRootWindow screen](self->_blankingWindow, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject bounds](v10, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[FBSDisplayConfiguration bounds](self->_currentConfiguration, "bounds");
    v41.origin.x = v21;
    v41.origin.y = v22;
    v41.size.width = v23;
    v41.size.height = v24;
    v40.origin.x = v14;
    v40.origin.y = v16;
    v40.size.width = v18;
    v40.size.height = v20;
    if (CGRectEqualToRect(v40, v41) && self->_blankingWindow)
    {
      SBLogDisplayControlling();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v26;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ recreating blanking window", buf, 0xCu);

      }
      -[_UIRootWindow windowLevel](self->_blankingWindow, "windowLevel");
      v28 = v27;
      -[SBSceneHostingDisplayController _createBlankingWindowWithConfiguration:](self, "_createBlankingWindowWithConfiguration:", self->_currentConfiguration);
      v29 = (_UIRootWindow *)objc_claimAutoreleasedReturnValue();
      blankingWindow = self->_blankingWindow;
      self->_blankingWindow = v29;

      -[_UIRootWindow setWindowLevel:](self->_blankingWindow, "setWindowLevel:", v28);
    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)displayIdentityDidDisconnect:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _UIRootWindow *blankingWindow;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController displayIdentityDidDisconnect:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBSceneHostingDisplayController.m"), 352, CFSTR("this call must be made on the main thread"));

  }
  SBLogDisplayControlling();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ told display did disconnect. beginning teardown transaction", (uint8_t *)&v15, 0xCu);

  }
  -[BSAtomicSignal signal](self->_displayDisconnectedSignal, "signal");
  -[SBSceneHostingDisplayControllerPolicy displayControllerWillDisconnect:sceneManager:](self->_policy, "displayControllerWillDisconnect:sceneManager:", self, self->_sceneManager);
  SBLogDisplayControlling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_DISCONNECT", "%{public}@", (uint8_t *)&v15, 0xCu);

  }
  -[SBSceneHostingDisplayControllerPolicy displayControllerDidDisconnect:sceneManager:](self->_policy, "displayControllerDidDisconnect:sceneManager:", self, self->_sceneManager);
  SBLogDisplayControlling();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ policy finished disconnect", (uint8_t *)&v15, 0xCu);

  }
  -[SBSceneManager invalidate](self->_sceneManager, "invalidate");
  -[_UIRootWindow setHidden:](self->_blankingWindow, "setHidden:", 1);
  blankingWindow = self->_blankingWindow;
  self->_blankingWindow = 0;

  SBLogDisplayControlling();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_DISCONNECT", "%{public}@", (uint8_t *)&v15, 0xCu);

  }
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  _UIRootWindow *v4;
  _UIRootWindow *blankingWindow;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController displayAssertionDidGainControlOfDisplay:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSceneHostingDisplayController.m"), 370, CFSTR("this call must be made on the main thread"));

  }
  -[CADisplay addObserver:forKeyPath:options:context:](self->_caDisplay, "addObserver:forKeyPath:options:context:", self, CFSTR("preferences"), 0, self);
  self->_currentDeactivationReasons = 0;
  -[SBSceneHostingDisplayController _createBlankingWindowWithConfiguration:](self, "_createBlankingWindowWithConfiguration:", self->_currentConfiguration);
  v4 = (_UIRootWindow *)objc_claimAutoreleasedReturnValue();
  blankingWindow = self->_blankingWindow;
  self->_blankingWindow = v4;

  -[SBSceneHostingDisplayController _sendBlankingWindowToFront:](self, "_sendBlankingWindowToFront:", 0);
  -[SBSceneHostingDisplayControllerPolicy displayController:didGainControlOfDisplayWithSceneManager:](self->_policy, "displayController:didGainControlOfDisplayWithSceneManager:", self, self->_sceneManager);
  -[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate](self, "_enqueueEvaluateAndApplyPresentationUpdate");
}

- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4
{
  _UIRootWindow *blankingWindow;
  void *v7;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController displayAssertion:didLoseControlOfDisplayForDeactivationReasons:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBSceneHostingDisplayController.m"), 381, CFSTR("this call must be made on the main thread"));

  }
  -[CADisplay removeObserver:forKeyPath:context:](self->_caDisplay, "removeObserver:forKeyPath:context:", self, CFSTR("preferences"), self);
  -[BSAtomicSignal signal](self->_presentationUpdateInvalidationSignal, "signal");
  self->_currentDeactivationReasons = a4;
  blankingWindow = self->_blankingWindow;
  self->_blankingWindow = 0;

  -[SBSceneManager updatePresentationBinder:](self->_sceneManager, "updatePresentationBinder:", 0);
  -[SBSceneHostingDisplayControllerPolicy displayController:sceneManager:didLoseControlOfDisplayWithDeactivationReasons:](self->_policy, "displayController:sceneManager:didLoseControlOfDisplayWithDeactivationReasons:", self, self->_sceneManager, a4);
  -[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate](self, "_enqueueEvaluateAndApplyPresentationUpdate");
}

- (void)displayAssertion:(id)a3 didReceiveNewDeactivationReasons:(unint64_t)a4
{
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController displayAssertion:didReceiveNewDeactivationReasons:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSceneHostingDisplayController.m"), 395, CFSTR("this call must be made on the main thread"));

  }
  self->_currentDeactivationReasons = a4;
  -[SBSceneHostingDisplayControllerPolicy displayController:sceneManager:didReceiveNewDeactivationReasons:](self->_policy, "displayController:sceneManager:didReceiveNewDeactivationReasons:", self, self->_sceneManager, a4);
  -[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate](self, "_enqueueEvaluateAndApplyPresentationUpdate");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__SBSceneHostingDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = &unk_1E8E9DE88;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v6);
}

uint64_t __82__SBSceneHostingDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect CADisplay prefs change", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueEvaluateAndApplyPresentationUpdate");
}

- (void)_ensureCADisplayUpToDate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  CADisplay *caDisplay;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  NSObject *v31;
  void *v32;
  SEL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *displayMutationQueue;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void (**v43)(_QWORD);
  _QWORD block[4];
  id v45;
  SBSceneHostingDisplayController *v46;
  id v47;
  id v48;
  void (**v49)(_QWORD);
  double v50;
  double v51;
  unint64_t v52;
  SEL v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;
  CGSize v67;
  CGRect v68;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController _ensureCADisplayUpToDate:completion:]");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("SBSceneHostingDisplayController.m"), 417, CFSTR("this call must be made on the main thread"));

  }
  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 418, CFSTR("we should not be updating the CADisplay if we don't have control over it"));

  }
  -[SBSceneHostingDisplayControllerPolicy displayPreferencesForDisplayController:](self->_policy, "displayPreferencesForDisplayController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  caDisplay = self->_caDisplay;
  objc_msgSend(v9, "CADisplayModeCriteria");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplay preferredModeWithCriteria:](caDisplay, "preferredModeWithCriteria:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayConfigurationRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "overscanCompensation");
  FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 1.0;
  v16 = 1.0;
  if (-[CADisplay displayType](self->_caDisplay, "displayType") != 2)
  {
    objc_msgSend(v9, "logicalScale");
    v18 = v17;
    v20 = v19;
    -[CADisplay maximumLogicalScale](self->_caDisplay, "maximumLogicalScale");
    v22 = v21;
    -[CADisplay minimumLogicalScale](self->_caDisplay, "minimumLogicalScale");
    if (v23 < v18)
      v23 = v18;
    if (v22 <= v23)
      v16 = v22;
    else
      v16 = v23;
    -[CADisplay maximumLogicalScale](self->_caDisplay, "maximumLogicalScale");
    v25 = v24;
    -[CADisplay minimumLogicalScale](self->_caDisplay, "minimumLogicalScale");
    if (v26 < v20)
      v26 = v20;
    if (v25 <= v26)
      v15 = v25;
    else
      v15 = v26;
  }
  objc_msgSend(v9, "contentsScale");
  v28 = (unint64_t)v27;
  v29 = SBCADifferenceMaskCalculate(self->_caDisplay, v12, v14, (unint64_t)v27);
  v30 = v29;
  if (SBCADisplayDifferenceMaskHasDifference(v29))
  {
    if ((v30 & 4) != 0)
    {
      SBLogDisplayControlling();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v32;
        _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ updating logicalScale. sending the blanking window front-most", buf, 0xCu);

      }
      -[SBSceneHostingDisplayController _sendBlankingWindowToFront:](self, "_sendBlankingWindowToFront:", 1);
    }
    v43 = v8;
    v33 = a2;
    SBLogDisplayControlling();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v42 = v7;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v67.width = v16;
      v67.height = v15;
      NSStringFromCGSize(v67);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplay bounds](self->_caDisplay, "bounds");
      NSStringFromCGRect(v68);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v35;
      v56 = 2114;
      v57 = v12;
      v58 = 2114;
      v59 = v14;
      v60 = 2114;
      v61 = v36;
      v62 = 2048;
      v63 = v28;
      v64 = 2114;
      v65 = v37;
      _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting display change: mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu (from)bounds=%{public}@", buf, 0x3Eu);

      v7 = v42;
    }

    displayMutationQueue = self->_displayMutationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SBSceneHostingDisplayController__ensureCADisplayUpToDate_completion___block_invoke;
    block[3] = &unk_1E8EA12E8;
    v45 = v7;
    v46 = self;
    v47 = v12;
    v48 = v14;
    v50 = v16;
    v51 = v15;
    v52 = v28;
    v53 = v33;
    v8 = v43;
    v49 = v43;
    dispatch_async(displayMutationQueue, block);

  }
  else
  {
    v8[2](v8);
  }

}

uint64_t __71__SBSceneHostingDisplayController__ensureCADisplayUpToDate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v37 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "connectionSeed");

    v2 = objc_alloc_init(MEMORY[0x1E0CD2740]);
    -[NSObject setCurrentMode:](v2, "setCurrentMode:", *(_QWORD *)(a1 + 48));
    -[NSObject setOverscanAdjustment:](v2, "setOverscanAdjustment:", *(_QWORD *)(a1 + 56));
    -[NSObject setConnectionSeed:](v2, "setConnectionSeed:", v10);
    -[NSObject setLogicalScale:](v2, "setLogicalScale:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    -[NSObject setPointScale:](v2, "setPointScale:", *(_QWORD *)(a1 + 88));
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setDisplayProperties:", v2);
    SBLogDisplayControlling();
    v12 = objc_claimAutoreleasedReturnValue();
    v3 = v12;
    if (v11)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "bounds");
      NSStringFromCGRect(v39);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      NSStringFromCGSize(*(CGSize *)(a1 + 72));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 88);
      v23 = 138544898;
      v24 = v13;
      v25 = 2114;
      v26 = v14;
      v27 = 2114;
      v28 = v15;
      v29 = 2114;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      v33 = 2048;
      v34 = v18;
      v35 = 1024;
      v36 = v10;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ display change successful: bounds=%{public}@ mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu connectionSeed=%u", (uint8_t *)&v23, 0x44u);
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "bounds");
      NSStringFromCGRect(v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(a1 + 56);
      NSStringFromCGSize(*(CGSize *)(a1 + 72));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 88);
      v23 = 138544898;
      v24 = v13;
      v25 = 2114;
      v26 = v14;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32 = v17;
      v33 = 2048;
      v34 = v22;
      v35 = 1024;
      v36 = v10;
      _os_log_error_impl(&dword_1D0540000, v3, OS_LOG_TYPE_ERROR, "%{public}@ display change failed: bounds=%{public}@ mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu connectionSeed=%u", (uint8_t *)&v23, 0x44u);
    }

    goto LABEL_9;
  }
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "bounds");
    NSStringFromCGRect(v38);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    NSStringFromCGSize(*(CGSize *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 88);
    v23 = 138544642;
    v24 = v3;
    v25 = 2114;
    v26 = v4;
    v27 = 2114;
    v28 = v5;
    v29 = 2114;
    v30 = v6;
    v31 = 2114;
    v32 = v7;
    v33 = 2048;
    v34 = v8;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (on-queue) skipping display change request as we were invalidated: bounds=%{public}@ mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu", (uint8_t *)&v23, 0x3Eu);

LABEL_9:
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_updatePolicyForPresentation:(id)a3
{
  id v5;
  SBSceneHostingDisplayControllerPolicy *policy;
  SBSceneManager *sceneManager;
  FBSDisplayConfiguration *presentedConfiguration;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 474, CFSTR("should only be calling this helper when we're in control of the display"));

  }
  policy = self->_policy;
  sceneManager = self->_sceneManager;
  presentedConfiguration = self->_presentedConfiguration;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__SBSceneHostingDisplayController__updatePolicyForPresentation___block_invoke;
  v11[3] = &unk_1E8EA1310;
  v12 = v5;
  v13 = a2;
  v11[4] = self;
  v9 = v5;
  -[SBSceneHostingDisplayControllerPolicy displayController:updatePresentationWithSceneManager:displayConfiguration:completion:](policy, "displayController:updatePresentationWithSceneManager:displayConfiguration:completion:", self, sceneManager, presentedConfiguration, v11);

}

uint64_t __64__SBSceneHostingDisplayController__updatePolicyForPresentation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ presentation update complete", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updatePresentationBinderIfNecessary
{
  NSObject *v4;
  void *v5;
  SBSceneManager *sceneManager;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 484, CFSTR("should only be calling this helper when we're in control of the display"));

  }
  SBLogDisplayControlling();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updating presentation binder's display configuration", (uint8_t *)&v9, 0xCu);

  }
  sceneManager = self->_sceneManager;
  -[SBSceneHostingDisplayController _createPresentationBinderWithConfiguration:](self, "_createPresentationBinderWithConfiguration:", self->_presentedConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager updatePresentationBinder:](sceneManager, "updatePresentationBinder:", v7);

}

- (void)_updateLayoutPublisherIfNecessary
{
  FBSDisplayLayoutPublishing *layoutPublisher;
  uint64_t v5;
  FBSDisplayLayoutPublishing *v6;
  FBSDisplayLayoutPublishing *v7;
  FBSDisplayLayoutPublishing *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 490, CFSTR("should only be calling this helper when we're in control of the display"));

  }
  layoutPublisher = self->_layoutPublisher;
  v5 = objc_opt_class();
  v6 = layoutPublisher;
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
  v8 = v7;

  if (v8)
  {
    -[FBSDisplayLayoutPublishing displayConfiguration](v8, "displayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", self->_presentedConfiguration);

    if ((v10 & 1) == 0)
    {
      SBLogDisplayControlling();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating layout publisher configuration", (uint8_t *)&v14, 0xCu);

      }
      -[FBSDisplayLayoutPublishing setDisplayConfiguration:](v8, "setDisplayConfiguration:", self->_presentedConfiguration);
    }
  }

}

- (void)_updateBlankingWindowIfNecessary
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL8 v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 499, CFSTR("should only be calling this helper when we're in control of the display"));

  }
  -[_UIRootWindow screen](self->_blankingWindow, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqual:", self->_presentedConfiguration) & 1) == 0)
  {
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[FBSDisplayConfiguration bounds](self->_presentedConfiguration, "bounds");
    v30.origin.x = v14;
    v30.origin.y = v15;
    v30.size.width = v16;
    v30.size.height = v17;
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    v18 = CGRectEqualToRect(v29, v30);
    SBLogDisplayControlling();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = CFSTR("back");
      if (v18)
        v22 = CFSTR("front");
      v24 = 138543618;
      v25 = v20;
      v26 = 2114;
      v27 = v22;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ sending blanking window to %{public}@", (uint8_t *)&v24, 0x16u);

    }
    -[SBSceneHostingDisplayController _sendBlankingWindowToFront:](self, "_sendBlankingWindowToFront:", v18);
  }

}

- (void)_enqueueEvaluateAndApplyPresentationUpdate
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBSceneHostingDisplayController.m"), 511, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_hasEnqueuedPresentationUpdate)
  {
    self->_hasEnqueuedPresentationUpdate = 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke;
    v6[3] = &unk_1E8E9DE88;
    v6[4] = self;
    v6[5] = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

void __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  __int128 v17;
  os_signpost_id_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "signal");
  v2 = objc_alloc_init(MEMORY[0x1E0D016C0]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

  v5 = v2;
  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v5);

  SBLogDisplayControlling();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SBSceneHostingDisplayController:Presentation", "%{public}@", buf, 0xCu);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "hasControlOfDisplay"))
  {
    v11 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_44;
    v15[3] = &unk_1E8EA1360;
    v16 = v5;
    v17 = *(_OWORD *)(a1 + 32);
    v18 = v7;
    objc_msgSend(v11, "_ensureCADisplayUpToDate:completion:", v16, v15);
    v12 = v16;
  }
  else
  {
    SBLogDisplayControlling();
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v12, OS_SIGNPOST_INTERVAL_END, v7, "SBSceneHostingDisplayController:Presentation", "FAILED; reason: not in control; %{public}@",
        buf,
        0xCu);

    }
  }

}

void __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "hasBeenSignalled") & 1) != 0)
  {
    SBLogDisplayControlling();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SBSceneHostingDisplayController:Presentation", "FAILED; reason: stale after updateCA; %{public}@",
        buf,
        0xCu);

    }
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_2;
    v8[3] = &unk_1E8EA1360;
    v9 = v6;
    v10 = *(_OWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "updateTransformsWithCompletion:", v8);
    v3 = v9;
  }

}

void __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate]_block_invoke_2");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBSceneHostingDisplayController.m"), 528, CFSTR("this call must be made on the main thread"));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "hasBeenSignalled") & 1) != 0)
  {
    SBLogDisplayControlling();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SBSceneHostingDisplayController:Presentation", "FAILED; reason: stale after updateTransforms; %{public}@",
        buf,
        0xCu);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 160), *(id *)(*(_QWORD *)(a1 + 40) + 152));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "transitionAssertionWithReason:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_updateBlankingWindowIfNecessary");
    objc_msgSend(*(id *)(a1 + 40), "_updateLayoutPublisherIfNecessary");
    objc_msgSend(*(id *)(a1 + 40), "_updatePresentationBinderIfNecessary");
    objc_msgSend(*(id *)(a1 + 40), "_createDisplayAssertionPreferences");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 112);
    *(_QWORD *)(v7 + 112) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "updateWithPreferences:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
    if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) != 0)
    {
      -[NSObject invalidate](v3, "invalidate");
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_3;
      v16[3] = &unk_1E8EA1338;
      v9 = *(void **)(a1 + 40);
      v10 = *(id *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v17 = v10;
      v18 = v11;
      v13 = *(_QWORD *)(a1 + 56);
      v20 = v12;
      v21 = v13;
      v3 = v3;
      v19 = v3;
      objc_msgSend(v9, "_updatePolicyForPresentation:", v16);

    }
  }

}

uint64_t __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate]_block_invoke_3");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBSceneHostingDisplayController.m"), 547, CFSTR("this call must be made on the main thread"));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "hasBeenSignalled") & 1) != 0)
  {
    SBLogDisplayControlling();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 64);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v5;
      v6 = "FAILED; reason: stale after policy; %{public}@";
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SBSceneHostingDisplayController:Presentation", v6, (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    SBLogDisplayControlling();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ god's in his heaven and all is right with the world. sending blanking window back-most just in case", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_sendBlankingWindowToFront:", 0);
    SBLogDisplayControlling();
    v9 = objc_claimAutoreleasedReturnValue();
    v3 = v9;
    v4 = *(_QWORD *)(a1 + 64);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v5;
      v6 = "SUCCESS; %{public}@";
      goto LABEL_13;
    }
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (id)_createUpdateTransactionWithLabel:(id)a3
{
  BSAtomicSignal *updateTransactionInvalidator;
  id v6;
  BSAtomicSignal *v7;
  BSAtomicSignal *v8;
  BSAtomicSignal *v9;
  BSAtomicSignal *v10;
  NSObject *v11;
  void *v12;
  id v13;
  BSAtomicSignal *v14;
  BSAtomicSignal *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *);
  void *v21;
  BSAtomicSignal *v22;
  BSAtomicSignal *v23;
  SBSceneHostingDisplayController *v24;
  SEL v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  updateTransactionInvalidator = self->_updateTransactionInvalidator;
  v6 = a3;
  -[BSAtomicSignal signal](updateTransactionInvalidator, "signal");
  v7 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
  v8 = self->_updateTransactionInvalidator;
  self->_updateTransactionInvalidator = v7;

  v9 = v7;
  v10 = self->_displayDisconnectedSignal;
  SBLogDisplayControlling();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v12;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_UPDATE_TX", "%{public}@", buf, 0xCu);

  }
  v13 = objc_alloc(MEMORY[0x1E0D016F0]);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __69__SBSceneHostingDisplayController__createUpdateTransactionWithLabel___block_invoke;
  v21 = &unk_1E8EA1388;
  v22 = v9;
  v23 = v10;
  v24 = self;
  v25 = a2;
  v14 = v10;
  v15 = v9;
  v16 = (void *)objc_msgSend(v13, "initWithBlock:", &v18);
  objc_msgSend(v16, "setDebugName:", v6, v18, v19, v20, v21);

  return v16;
}

void __69__SBSceneHostingDisplayController__createUpdateTransactionWithLabel___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0CB3978];
  v7 = a3;
  if ((objc_msgSend(v6, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneHostingDisplayController _createUpdateTransactionWithLabel:]_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBSceneHostingDisplayController.m"), 584, CFSTR("this call must be made on the main thread"));

  }
  if ((objc_msgSend(a1[4], "hasBeenSignalled") & 1) != 0 || (objc_msgSend(a1[5], "hasBeenSignalled") & 1) != 0)
  {
    SBLogDisplayControlling();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(*((void **)a1[6] + 1), a1[6]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping obselete update transaction", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*((id *)a1[6] + 3), "displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:", a1[6], v5, *((_QWORD *)a1[6] + 9), *((_QWORD *)a1[6] + 20), *((_QWORD *)a1[6] + 15));
    objc_msgSend(a1[6], "_createDisplayAssertionPreferences");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = a1[6];
    v12 = (void *)v11[14];
    v11[14] = v10;

    objc_msgSend(*((id *)a1[6] + 13), "updateWithPreferences:", *((_QWORD *)a1[6] + 14));
    objc_msgSend(a1[6], "_enqueueEvaluateAndApplyPresentationUpdate");
  }
  v7[2](v7, 1);

  SBLogDisplayControlling();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    _SBDisplayControllerLoggingProem(*((void **)a1[6] + 1), a1[6]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_UPDATE_TX", "%{public}@", (uint8_t *)&v17, 0xCu);

  }
}

- (id)_createBlankingWindowWithConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v3 = (objc_class *)MEMORY[0x1E0CEAE90];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDisplay:", v4);
  v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v4, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_msgSend(v6, "initWithFrame:", v8, v10, v12, v14);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  objc_msgSend(v15, "setOpaque:", 1);
  objc_msgSend(v15, "setAutoresizingMask:", 18);
  v17 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  objc_msgSend(v17, "setView:", v15);
  objc_msgSend(v5, "setRootViewController:", v17);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v18);

  objc_msgSend(v5, "setHidden:", 0);
  return v5;
}

- (void)_sendBlankingWindowToFront:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  int v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_enabled(v5);
  if (v3)
  {
    if (v6)
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_BLANK", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
    v8 = 0x7FEFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v6)
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_UNBLANK", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
    v8 = 0xFFEFFFFFFFFFFFFFLL;
  }
  v10 = *(double *)&v8;

  -[_UIRootWindow setWindowLevel:](self->_blankingWindow, "setWindowLevel:", v10);
}

- (id)_createPresentationBinderWithConfiguration:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  SBSceneHostingDisplayControllerRootSceneWindow *v8;
  SBRootWindowScenePresentationBinder *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[FBSDisplayIdentity description](self->_displayIdentity, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SBDisplayControllerTransactionLabel(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIRootSceneWindow initWithDisplayConfiguration:]([SBSceneHostingDisplayControllerRootSceneWindow alloc], "initWithDisplayConfiguration:", v4);
  v9 = -[SBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:]([SBRootWindowScenePresentationBinder alloc], "initWithIdentifier:priority:appearanceStyle:rootWindow:", v7, -10, 0, v8);

  return v9;
}

- (id)_createDisplayAssertionPreferences
{
  void *v5;

  if (!self->_displayIdentity)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHostingDisplayController.m"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_displayIdentity"));

  }
  return (id)-[SBSceneHostingDisplayControllerPolicy assertionPreferencesForDisplay:displayConfiguration:](self->_policy, "assertionPreferencesForDisplay:displayConfiguration:", self, self->_currentConfiguration);
}

- (void)_runRootTransaction:(id)a3 withLabel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  FBWorkspaceEventQueue *workspaceEventQueue;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  SBSceneHostingDisplayController *v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workspaceEventQueue = self->_workspaceEventQueue;
  v12 = (void *)MEMORY[0x1E0D229B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke;
  v20 = &unk_1E8EA13D8;
  v21 = v9;
  v22 = v8;
  v23 = self;
  v24 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v12, "eventWithName:handler:", v15, &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceEventQueue executeOrAppendEvent:](workspaceEventQueue, "executeOrAppendEvent:", v16, v17, v18, v19, v20);

}

void __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id location;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D229C0]), "initWithReason:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke_2;
  v7[3] = &unk_1E8EA13B0;
  objc_copyWeak(&v10, &location);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v7[4] = v5;
  v6 = v2;
  v8 = v6;
  objc_msgSend(v3, "setCompletionBlock:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "begin");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 48);
  v6 = WeakRetained;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    WeakRetained = v6;
  }
  if (WeakRetained)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "relinquish");

}

- (void)_runRootUpdateTransactionWithLabel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSceneHostingDisplayController _createUpdateTransactionWithLabel:](self, "_createUpdateTransactionWithLabel:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSceneHostingDisplayController _runRootTransaction:withLabel:completion:](self, "_runRootTransaction:withLabel:completion:", v8, v7, v6);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneHostingDisplayController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBSceneHostingDisplayController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSceneHostingDisplayController *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayIdentity description](self->_displayIdentity, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", v5, 0, v9);

  v7 = v6;
  return v7;
}

id __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "hasControlOfDisplay"), CFSTR("hasControlOfDisplay"));
  v3 = *(_QWORD **)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  if (v3[20])
  {
    v5 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v24[3] = &unk_1E8E9E820;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v25 = v6;
    v26 = v7;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("FBSDisplayConfiguration"), CFSTR("\t"), v24);

    v3 = *(_QWORD **)(a1 + 40);
  }
  if (v3[16])
  {
    v8 = *(void **)(a1 + 32);
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v21[3] = &unk_1E8E9E820;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v22 = v9;
    v23 = v10;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("CADisplay"), CFSTR("\t"), v21);

    v3 = *(_QWORD **)(a1 + 40);
  }
  if (v3[12])
  {
    v11 = *(void **)(a1 + 32);
    v15 = v4;
    v16 = 3221225472;
    v17 = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v18 = &unk_1E8E9E820;
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 40);
    v19 = v12;
    v20 = v13;
    objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Blanking Window"), CFSTR("\t"), &v15);

    v3 = *(_QWORD **)(a1 + 40);
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v3[3], CFSTR("policy"), v15, v16, v17, v18);
}

void __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "bounds");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("bounds"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "pointScale");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("scale"), 2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "pixelSize");
  v7 = (id)objc_msgSend(v6, "appendSize:withName:", CFSTR("pixelSize"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "overscanCompensation");
  FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("overscanCompensation"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "currentMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("currentMode"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "identity");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "appendUInt64:withName:", objc_msgSend(v15, "connectionSeed"), CFSTR("connectionSeed"));

}

id __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "bounds");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("bounds"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("deviceName"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("name"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "productName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("productName"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "overscanAdjustment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:", v11, CFSTR("overscanAdjustment"));

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "logicalScale");
  v13 = (id)objc_msgSend(v12, "appendSize:withName:", CFSTR("activeLogicalScale"));
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "minimumLogicalScale");
  v15 = (id)objc_msgSend(v14, "appendDouble:withName:decimalPrecision:", CFSTR("minimumLogicalScale"), 2);
  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "maximumLogicalScale");
  v17 = (id)objc_msgSend(v16, "appendDouble:withName:decimalPrecision:", CFSTR("maximumLogicalScale"), 2);
  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "transportType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendString:withName:", v19, CFSTR("transportType"));

  v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "displayType");
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", v20 == 2, CFSTR("isWireless"));
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", v20, CFSTR("displayType"));
  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "currentMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v23, "appendObject:withName:", v24, CFSTR("currentMode"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "seed"), CFSTR("seed"));
}

id __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "frame");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("frame"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "windowLevel");
  return (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("windowLevel"), 0);
}

- (id)signpostDescription
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@:%p>"), v4, self, objc_opt_class(), self->_policy);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDisconnectedSignal, 0);
  objc_storeStrong((id *)&self->_presentationUpdateInvalidationSignal, 0);
  objc_storeStrong((id *)&self->_presentedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_layoutPublisher, 0);
  objc_storeStrong((id *)&self->_displayMutationQueue, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_currentDisplayAssertionPreferences, 0);
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_blankingWindow, 0);
  objc_storeStrong((id *)&self->_readyToTransformDisplaysSignal, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_updateTransactionInvalidator, 0);
  objc_storeStrong((id *)&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_workspaceEventQueue, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

- (void)displayIdentityDidUpdate:(NSObject *)a3 configuration:.cold.1(void **a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBDisplayControllerLoggingProem(a1[1], a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ ignoring update", (uint8_t *)&v5, 0xCu);

}

@end
