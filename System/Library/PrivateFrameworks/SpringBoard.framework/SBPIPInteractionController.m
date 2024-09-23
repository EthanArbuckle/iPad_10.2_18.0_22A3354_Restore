@implementation SBPIPInteractionController

- (SBPIPInteractionController)initWithInteractionTargetView:(id)a3 preferredContentSize:(CGSize)a4 interactionSettings:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  SBPIPInteractionController *v18;
  SBPIPInteractionController *v19;
  uint64_t v20;
  SBWindowScene *targetWindowScene;
  uint64_t v22;
  SBPIPContentViewLayoutSettings *layoutSettings;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  UIView *v34;
  UIView *pointerHitTestBlocker;
  UIView *v36;
  void *v37;
  void *v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  __int128 *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v61;
  NSString *debugName;
  uint64_t v63;
  SBSystemGestureManager *systemGestureManagerForResizing;
  uint64_t v65;
  NSMutableArray *positionRegionComposers;
  const __CFString *v67;
  const __CFString *v68;
  uint64_t v69;
  NSString *shortDescription;
  NSObject *v71;
  NSString *v72;
  void *v73;
  uint64_t v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;
  uint8_t buf[4];
  NSString *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  height = a4.height;
  width = a4.width;
  v89 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (width <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredContentSize.width > 0"));

  }
  if (height <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredContentSize.height > 0"));

    if (v14)
    {
LABEL_5:
      if (v15)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if (v14)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionTargetView"));

  if (v15)
  {
LABEL_6:
    if (v16)
      goto LABEL_7;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

    if (v17)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionSettings"));

  if (!v16)
    goto LABEL_21;
LABEL_7:
  if (v17)
    goto LABEL_8;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_8:
  v82.receiver = self;
  v82.super_class = (Class)SBPIPInteractionController;
  v18 = -[SBPIPInteractionController init](&v82, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeWeak((id *)&v19->_dataSource, v16);
    objc_storeWeak((id *)&v19->_interactionTargetView, v14);
    objc_msgSend(v14, "_sbWindowScene");
    v20 = objc_claimAutoreleasedReturnValue();
    targetWindowScene = v19->_targetWindowScene;
    v19->_targetWindowScene = (SBWindowScene *)v20;

    objc_msgSend(v16, "layoutSettings");
    v22 = objc_claimAutoreleasedReturnValue();
    layoutSettings = v19->_layoutSettings;
    v19->_layoutSettings = (SBPIPContentViewLayoutSettings *)v22;

    if (-[SBWindowScene isMainDisplayWindowScene](v19->_targetWindowScene, "isMainDisplayWindowScene"))
    {
      objc_msgSend(v14, "superview");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      BSRectWithSize();
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      objc_msgSend(v14, "_sbWindowScene");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPInteractionController _updateGeometryContextUsingTargetViewBounds:orientation:](v19, "_updateGeometryContextUsingTargetViewBounds:orientation:", objc_msgSend(v33, "interfaceOrientation"), v26, v28, v30, v32);

    }
    else
    {
      -[SBPIPInteractionController _updateGeometryContextBoundsUsingMainDisplayWindowScene](v19, "_updateGeometryContextBoundsUsingMainDisplayWindowScene");
    }
    v34 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    pointerHitTestBlocker = v19->_pointerHitTestBlocker;
    v19->_pointerHitTestBlocker = v34;

    v36 = v19->_pointerHitTestBlocker;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v36, "setBackgroundColor:", v37);

    -[UIView layer](v19->_pointerHitTestBlocker, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setHitTestsAsOpaque:", 1);

    -[UIView layer](v19->_pointerHitTestBlocker, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAllowsHitTesting:", 1);

    objc_msgSend(v14, "addSubview:", v19->_pointerHitTestBlocker);
    objc_msgSend(v14, "sendSubviewToBack:", v19->_pointerHitTestBlocker);
    -[SBPIPContentViewLayoutSettings defaultContentViewSizeForAspectRatio:](v19->_layoutSettings, "defaultContentViewSizeForAspectRatio:", width, height);
    v19->_preferredContentSize.width = v40;
    v19->_preferredContentSize.height = v41;
    v19->_toBeAppliedPreferredContentSize = v19->_preferredContentSize;
    -[SBPIPContentViewLayoutSettings contentViewPadding](v19->_layoutSettings, "contentViewPadding");
    v43 = v42;
    -[SBPIPContentViewLayoutSettings contentViewPadding](v19->_layoutSettings, "contentViewPadding");
    v45 = v44;
    -[SBPIPContentViewLayoutSettings contentViewPadding](v19->_layoutSettings, "contentViewPadding");
    v47 = v46;
    -[SBPIPContentViewLayoutSettings contentViewPadding](v19->_layoutSettings, "contentViewPadding");
    v19->_geometryContext.minimumPadding.top = v43;
    v19->_geometryContext.minimumPadding.left = v45;
    v19->_geometryContext.minimumPadding.bottom = v47;
    v19->_geometryContext.minimumPadding.right = v48;
    -[SBPIPContentViewLayoutSettings contentViewPaddingWhileStashed](v19->_layoutSettings, "contentViewPaddingWhileStashed");
    v50 = v49;
    -[SBPIPContentViewLayoutSettings contentViewPaddingWhileStashed](v19->_layoutSettings, "contentViewPaddingWhileStashed");
    v19->_geometryContext.stashedMinimumPadding.top = v50;
    v19->_geometryContext.stashedMinimumPadding.left = 0.0;
    v19->_geometryContext.stashedMinimumPadding.bottom = v51;
    v52 = (__int128 *)MEMORY[0x1E0C9BAA8];
    v19->_geometryContext.stashedMinimumPadding.right = 0.0;
    v53 = *v52;
    v54 = v52[1];
    v55 = v52[2];
    *(_OWORD *)&v19->_stashTabCompensationTransform.c = v54;
    *(_OWORD *)&v19->_stashTabCompensationTransform.tx = v55;
    *(_OWORD *)&v19->_rotationTransform.a = v53;
    *(_OWORD *)&v19->_rotationTransform.c = v54;
    *(_OWORD *)&v19->_rotationTransform.tx = v55;
    __asm { FMOV            V1.2D, #0.5 }
    v19->_anchorPoint = _Q1;
    *(_OWORD *)&v19->_stashTabCompensationTransform.a = v53;
    objc_msgSend(v16, "debugName");
    v61 = objc_claimAutoreleasedReturnValue();
    debugName = v19->_debugName;
    v19->_debugName = (NSString *)v61;

    objc_msgSend(v16, "systemGestureManagerForInteractionControllerResizing:", v19);
    v63 = objc_claimAutoreleasedReturnValue();
    systemGestureManagerForResizing = v19->_systemGestureManagerForResizing;
    v19->_systemGestureManagerForResizing = (SBSystemGestureManager *)v63;

    objc_storeStrong((id *)&v19->_interactionSettings, a5);
    -[PTSettings addKeyPathObserver:](v19->_interactionSettings, "addKeyPathObserver:", v19);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v65 = objc_claimAutoreleasedReturnValue();
    positionRegionComposers = v19->_positionRegionComposers;
    v19->_positionRegionComposers = (NSMutableArray *)v65;

    -[SBPIPInteractionController _setupDefaultInteractorsAndHyperRegions](v19, "_setupDefaultInteractorsAndHyperRegions");
    -[SBPIPInteractionController _updateInteractorsAndCommit:](v19, "_updateInteractorsAndCommit:", 1);
    -[SBPIPInteractionController _setDefaults](v19, "_setDefaults");
    -[SBPIPInteractionController _setupForInitialFrame](v19, "_setupForInitialFrame");
    -[SBPIPInteractionController _setupStateCapture](v19, "_setupStateCapture");
    v67 = CFSTR("-");
    v68 = (const __CFString *)v19->_debugName;
    if (!v68)
    {
      v67 = &stru_1E8EC7EC0;
      v68 = &stru_1E8EC7EC0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p%@%@"), v19, v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    shortDescription = v19->_shortDescription;
    v19->_shortDescription = (NSString *)v69;

    SBLogPIP();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = v19->_shortDescription;
      NSStringFromCGRect(v19->_nonoperationalFrame);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = -[SBPIPInteractionController canonicalPosition](v19, "canonicalPosition");
      *(_DWORD *)buf = 138543874;
      v84 = v72;
      v85 = 2114;
      v86 = v73;
      v87 = 2048;
      v88 = v74;
      _os_log_impl(&dword_1D0540000, v71, OS_LOG_TYPE_DEFAULT, "[%{public}@] PIP Interaction controller was initialized. _nonoperationalFrame[%{public}@] canonicalPosition[%lu]", buf, 0x20u);

    }
  }

  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *shortDescription;
  id WeakRetained;
  SBSystemGestureManager *v6;
  SBSystemGestureManager *v7;
  SBSystemGestureManager *v8;
  SBPIPRotationGestureRecognizer *rotationGestureRecognizer;
  SBSystemGestureManager *v10;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogPIP();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    *(_DWORD *)buf = 138543362;
    v13 = shortDescription;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] PIP Interaction controller was deallocated.", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "window");
  v6 = (SBSystemGestureManager *)objc_claimAutoreleasedReturnValue();

  v7 = self->_systemGestureManagerForResizing;
  v8 = v7;
  if (v7)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](v7, "removeGestureRecognizer:", self->_panWhileResizingGestureRecognizer);
    -[SBSystemGestureManager removeGestureRecognizer:](v8, "removeGestureRecognizer:", self->_pinchGestureRecognizer);
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    v10 = v8;
  }
  else
  {
    -[SBSystemGestureManager removeGestureRecognizer:](v6, "removeGestureRecognizer:", self->_pinchGestureRecognizer);
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    v10 = v6;
  }
  -[SBSystemGestureManager removeGestureRecognizer:](v10, "removeGestureRecognizer:", rotationGestureRecognizer);
  -[SBSystemGestureManager removeGestureRecognizer:](v6, "removeGestureRecognizer:", self->_panGestureRecognizer);
  -[SBSystemGestureManager removeGestureRecognizer:](v6, "removeGestureRecognizer:", self->_edgeResizeGestureRecognizer);
  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  -[UIViewFloatAnimatableProperty invalidate](self->_layoutProgressProperty, "invalidate");

  v11.receiver = self;
  v11.super_class = (Class)SBPIPInteractionController;
  -[SBPIPInteractionController dealloc](&v11, sel_dealloc);
}

- (BOOL)_hasValidInteractionTargetView
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = v6 != *(double *)(MEMORY[0x1E0C9D820] + 8) || v5 != *MEMORY[0x1E0C9D820];

  if (WeakRetained)
    v8 = v3 == 0;
  else
    v8 = 1;
  v9 = !v8 && v7;
  if (!v9)
  {
    SBLogPIP();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109632;
      v12[1] = WeakRetained != 0;
      v13 = 1024;
      v14 = v3 != 0;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_1D0540000, v10, OS_LOG_TYPE_ERROR, "Interaction target view is not valid for reason: interactionTargetView is != nil? %{BOOL}u — interactionContainerView is != nil? %{BOOL}u — container size is CGSizeZero? %{BOOL}u", (uint8_t *)v12, 0x14u);
    }

  }
  return v9;
}

- (void)_setupStateCapture
{
  void *v3;
  id v4;
  BSInvalidatable *v5;
  BSInvalidatable *stateCaptureInvalidatable;
  id v7;
  id location;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PictureInPicture - SBPIPInteractionController - %p(%@)"), self, self->_debugName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v7, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v5;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __48__SBPIPInteractionController__setupStateCapture__block_invoke(uint64_t a1)
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

- (NSString)description
{
  __CFString *WeakRetained;
  const __CFString *debugName;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  UIPanGestureRecognizer *panGestureRecognizer;
  const __CFString *v15;
  UIPanGestureRecognizer *panWhileResizingGestureRecognizer;
  const __CFString *v17;
  SBPIPPinchGestureRecognizer *pinchGestureRecognizer;
  const __CFString *v19;
  _UIHyperInteractor *positionInteractor;
  const __CFString *v21;
  SBPIPRotationGestureRecognizer *rotationGestureRecognizer;
  const __CFString *v23;
  _UIHyperInteractor *rotationInteractor;
  __CFString *v25;
  _UIHyperInteractor *scaleInteractor;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  _UIHyperInteractor *v44;
  SBPIPPinchGestureRecognizer *v45;
  UIPanGestureRecognizer *v46;
  UIPanGestureRecognizer *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  void *v66;
  objc_super v67;
  _QWORD v68[31];
  _QWORD v69[33];
  NSPoint v70;
  NSSize v71;
  NSSize v72;
  CGRect v73;

  v69[31] = *MEMORY[0x1E0C80C00];
  WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v58 = (id)MEMORY[0x1E0CB3940];
  v67.receiver = self;
  v67.super_class = (Class)SBPIPInteractionController;
  -[SBPIPInteractionController description](&v67, sel_description);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  debugName = (const __CFString *)self->_debugName;
  if (!debugName)
    debugName = &stru_1E8EC7EC0;
  v68[0] = CFSTR("Debug Name");
  v68[1] = CFSTR("Enabled");
  if (self->_enabled)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v69[0] = debugName;
  v69[1] = v5;
  v68[2] = CFSTR("Frame");
  v65 = WeakRetained;
  if (WeakRetained)
  {
    -[__CFString frame](WeakRetained, "frame");
    NSStringFromCGRect(v73);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v7 = WeakRetained;
  }
  else
  {
    v6 = CFSTR("null");
    v7 = CFSTR("nil");
  }
  v42 = (__CFString *)v6;
  v69[2] = v6;
  v68[3] = CFSTR("Anchor Point");
  NSStringFromPoint(self->_anchorPoint);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v64;
  v68[4] = CFSTR("Container Bounds");
  NSStringFromCGRect(self->_geometryContext.containerBounds);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v63;
  v68[5] = CFSTR("Orientation");
  SBFStringForBSInterfaceOrientation();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v69[5] = v62;
  v68[6] = CFSTR("Current Position");
  -[SBPIPInteractionController _currentPositionForLayoutReason:](self, "_currentPositionForLayoutReason:", 1024);
  NSStringFromPoint(v70);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v69[6] = v61;
  v68[7] = CFSTR("Current Rotation");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SBPIPInteractionController _currentRotation](self, "_currentRotation");
  objc_msgSend(v8, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v69[7] = v60;
  v68[8] = CFSTR("Current Scale");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SBPIPInteractionController _currentScale](self, "_currentScale");
  objc_msgSend(v9, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v69[8] = v57;
  v68[9] = CFSTR("Current Normalized Scale");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SBPIPInteractionController currentNormalizedScale](self, "currentNormalizedScale");
  objc_msgSend(v10, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v56;
  v68[10] = CFSTR("Preferred Normalized Scale");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[SBPIPInteractionController preferredNormalizedScale](self, "preferredNormalizedScale");
  objc_msgSend(v11, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v69[10] = v55;
  v68[11] = CFSTR("Current Size");
  -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:", 1024);
  NSStringFromSize(v71);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69[11] = v54;
  v68[12] = CFSTR("Edge Insets");
  NSStringFromUIEdgeInsets(self->_geometryContext.edgeInsets);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69[12] = v53;
  v68[13] = CFSTR("Initial Frame");
  NSStringFromCGRect(self->_nonoperationalFrame);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v69[13] = v52;
  v69[14] = v7;
  v68[14] = CFSTR("Interaction Target View");
  v68[15] = CFSTR("Is Changing Size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isChangingSize);
  v12 = objc_claimAutoreleasedReturnValue();
  if (self->_systemGestureManagerForResizing)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v51 = (void *)v12;
  v69[15] = v12;
  v69[16] = v13;
  v68[16] = CFSTR("Use System Gestures For Resizing");
  v68[17] = CFSTR("Last Steady Size");
  -[SBPIPInteractionController _lastSteadySize](self, "_lastSteadySize");
  NSStringFromSize(v72);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v69[17] = v50;
  v68[18] = CFSTR("In Flight Animations Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_inFlightAnimatedLayouts);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stringValue");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v69[18] = v48;
  v68[19] = CFSTR("Pan Gesture Recognizer");
  panGestureRecognizer = self->_panGestureRecognizer;
  v47 = panGestureRecognizer;
  if (panGestureRecognizer)
  {
    -[UIPanGestureRecognizer debugDescription](panGestureRecognizer, "debugDescription");
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("nil");
  }
  v41 = (__CFString *)v15;
  v69[19] = v15;
  v68[20] = CFSTR("Two touches Pan Gesture Recognizer");
  panWhileResizingGestureRecognizer = self->_panWhileResizingGestureRecognizer;
  v46 = panWhileResizingGestureRecognizer;
  if (panWhileResizingGestureRecognizer)
  {
    -[UIPanGestureRecognizer debugDescription](panWhileResizingGestureRecognizer, "debugDescription");
    v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("nil");
  }
  v40 = (__CFString *)v17;
  v69[20] = v17;
  v68[21] = CFSTR("Pinch Gesture Recognizer");
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  v45 = pinchGestureRecognizer;
  if (pinchGestureRecognizer)
  {
    -[SBPIPPinchGestureRecognizer debugDescription](pinchGestureRecognizer, "debugDescription");
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("nil");
  }
  v39 = (__CFString *)v19;
  v69[21] = v19;
  v68[22] = CFSTR("Position Interactor");
  positionInteractor = self->_positionInteractor;
  v44 = positionInteractor;
  if (positionInteractor)
  {
    -[_UIHyperInteractor debugDescription](positionInteractor, "debugDescription");
    v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("nil");
  }
  v38 = (__CFString *)v21;
  v69[22] = v21;
  v68[23] = CFSTR("Preferred Content Size");
  NSStringFromSize(self->_preferredContentSize);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v69[23] = v43;
  v68[24] = CFSTR("Rotation Gesture Recognizer");
  rotationGestureRecognizer = self->_rotationGestureRecognizer;
  if (rotationGestureRecognizer)
  {
    -[SBPIPRotationGestureRecognizer debugDescription](self->_rotationGestureRecognizer, "debugDescription");
    v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("nil");
  }
  v37 = (__CFString *)v23;
  v69[24] = v23;
  v68[25] = CFSTR("Rotation Interactor");
  rotationInteractor = self->_rotationInteractor;
  if (rotationInteractor)
  {
    -[_UIHyperInteractor debugDescription](self->_rotationInteractor, "debugDescription");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = CFSTR("nil");
  }
  v69[25] = v25;
  v68[26] = CFSTR("Scale Interactor");
  scaleInteractor = self->_scaleInteractor;
  if (scaleInteractor)
  {
    -[_UIHyperInteractor debugDescription](self->_scaleInteractor, "debugDescription");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = CFSTR("nil");
  }
  v69[26] = v27;
  v68[27] = CFSTR("Stash progress");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[SBPIPInteractionController stashProgress](self, "stashProgress");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v69[27] = v29;
  v68[28] = CFSTR("Should stash");
  BSSettingFlagDescription();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (self->_didLastSettleInStashedState)
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  v69[28] = v30;
  v69[29] = v32;
  v68[29] = CFSTR("Did last settle in stashed state");
  v68[30] = CFSTR("To Be Applied Preferred Content Size");
  NSStringFromSize(self->_toBeAppliedPreferredContentSize);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69[30] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "description");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "stringWithFormat:", CFSTR("%@\n%@"), v66, v35);
  v59 = (id)objc_claimAutoreleasedReturnValue();

  if (scaleInteractor)
  if (rotationInteractor)

  if (rotationGestureRecognizer)
  if (v44)

  if (v45)
  if (v46)

  if (v47)
  if (v65)

  return (NSString *)v59;
}

- (void)_setupForInitialFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize v9;

  if (-[SBPIPInteractionController _hasValidInteractionTargetView](self, "_hasValidInteractionTargetView"))
  {
    -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 1);
    -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:", 0);
    v4 = v3;
    v6 = v5;
    -[SBPIPInteractionController _currentPositionForLayoutReason:](self, "_currentPositionForLayoutReason:", 0);
    self->_nonoperationalFrame.origin.x = v7 - v4 * 0.5;
    self->_nonoperationalFrame.origin.y = v8 - v6 * 0.5;
    self->_nonoperationalFrame.size.width = v4;
    self->_nonoperationalFrame.size.height = v6;
  }
  else
  {
    v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_nonoperationalFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_nonoperationalFrame.size = v9;
  }
}

- (void)_setupGestureRecognizers
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *edgeResizeGestureRecognizer;
  SBPIPPinchGestureRecognizer *v7;
  SBPIPPinchGestureRecognizer *pinchGestureRecognizer;
  SBPIPRotationGestureRecognizer *v9;
  SBPIPRotationGestureRecognizer *rotationGestureRecognizer;
  UIPanGestureRecognizer *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  UIPanGestureRecognizer *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  SBPIPPinchGestureRecognizer *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  SBPIPRotationGestureRecognizer *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  SBSystemGestureManager *v32;
  UIPanGestureRecognizer *v33;
  UIPanGestureRecognizer *panWhileResizingGestureRecognizer;
  UIPanGestureRecognizer *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  id v40;

  if (-[SBPIPInteractionController _hasValidInteractionTargetView](self, "_hasValidInteractionTargetView"))
  {
    v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_handlePanGesture_);
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v3;

    v5 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_handleEdgeResizeGesture_);
    edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
    self->_edgeResizeGestureRecognizer = v5;

    v7 = -[SBPIPPinchGestureRecognizer initWithTarget:action:]([SBPIPPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel_handlePinchGesture_);
    pinchGestureRecognizer = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = v7;

    v9 = -[SBPIPRotationGestureRecognizer initWithTarget:action:]([SBPIPRotationGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleRotationGesture_);
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    self->_rotationGestureRecognizer = v9;

    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_panGestureRecognizer, "setAllowedScrollTypesMask:", 3);
    v11 = self->_panGestureRecognizer;
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-Pan"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer setName:](v11, "setName:", v15);

    v16 = self->_edgeResizeGestureRecognizer;
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-EdgeResize"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer setName:](v16, "setName:", v20);

    v21 = self->_pinchGestureRecognizer;
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-Pinch"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPPinchGestureRecognizer setName:](v21, "setName:", v25);

    v26 = self->_rotationGestureRecognizer;
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@-Rotation"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPRotationGestureRecognizer setName:](v26, "setName:", v30);

    -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
    -[UIPanGestureRecognizer setDelegate:](self->_edgeResizeGestureRecognizer, "setDelegate:", self);
    -[SBPIPPinchGestureRecognizer setDelegate:](self->_pinchGestureRecognizer, "setDelegate:", self);
    -[SBPIPRotationGestureRecognizer setDelegate:](self->_rotationGestureRecognizer, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(WeakRetained, "window");
    v40 = (id)objc_claimAutoreleasedReturnValue();

    v32 = self->_systemGestureManagerForResizing;
    if (v32)
    {
      v33 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_handlePanGesture_);
      panWhileResizingGestureRecognizer = self->_panWhileResizingGestureRecognizer;
      self->_panWhileResizingGestureRecognizer = v33;

      v35 = self->_panWhileResizingGestureRecognizer;
      v36 = (void *)MEMORY[0x1E0CB3940];
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@-SystemTwoTouchesPan"), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanGestureRecognizer setName:](v35, "setName:", v39);

      -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_panWhileResizingGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE7D0);
      -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_panWhileResizingGestureRecognizer, "setMinimumNumberOfTouches:", 2);
      -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_panWhileResizingGestureRecognizer, "setMaximumNumberOfTouches:", 2);
      -[UIPanGestureRecognizer setDelegate:](self->_panWhileResizingGestureRecognizer, "setDelegate:", self);
      -[SBPIPPinchGestureRecognizer setFailsPastHysteresis:](self->_pinchGestureRecognizer, "setFailsPastHysteresis:", 1);
      -[SBPIPPinchGestureRecognizer setMaximumNumberOfTouches:](self->_pinchGestureRecognizer, "setMaximumNumberOfTouches:", 2);
      -[SBPIPRotationGestureRecognizer setFailsPastHysteresis:](self->_rotationGestureRecognizer, "setFailsPastHysteresis:", 1);
      -[SBPIPRotationGestureRecognizer setMaximumNumberOfTouches:](self->_rotationGestureRecognizer, "setMaximumNumberOfTouches:", 2);
      -[SBPIPPinchGestureRecognizer setAllowedTouchTypes:](self->_pinchGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE7E8);
      -[SBPIPRotationGestureRecognizer setAllowedTouchTypes:](self->_rotationGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE800);
      -[SBSystemGestureManager addGestureRecognizer:withType:](v32, "addGestureRecognizer:withType:", self->_panWhileResizingGestureRecognizer, 121);
      -[SBSystemGestureManager addGestureRecognizer:withType:](v32, "addGestureRecognizer:withType:", self->_pinchGestureRecognizer, 122);
      -[SBSystemGestureManager addGestureRecognizer:withType:](v32, "addGestureRecognizer:withType:", self->_rotationGestureRecognizer, 123);
    }
    else
    {
      objc_msgSend(v40, "addGestureRecognizer:", self->_pinchGestureRecognizer);
      objc_msgSend(v40, "addGestureRecognizer:", self->_rotationGestureRecognizer);
    }
    objc_msgSend(v40, "addGestureRecognizer:", self->_panGestureRecognizer);
    objc_msgSend(v40, "addGestureRecognizer:", self->_edgeResizeGestureRecognizer);
    -[SBPIPInteractionController _updateSettingsDrivenParameters](self, "_updateSettingsDrivenParameters");

  }
}

- (void)_removeGestureRecognizers
{
  id WeakRetained;
  SBSystemGestureManager *v4;
  SBSystemGestureManager *v5;
  SBPIPRotationGestureRecognizer *rotationGestureRecognizer;
  SBSystemGestureManager *v7;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *edgeResizeGestureRecognizer;
  SBPIPPinchGestureRecognizer *pinchGestureRecognizer;
  SBPIPRotationGestureRecognizer *v11;
  UIPanGestureRecognizer *panWhileResizingGestureRecognizer;
  SBSystemGestureManager *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "window");
  v13 = (SBSystemGestureManager *)objc_claimAutoreleasedReturnValue();

  v4 = self->_systemGestureManagerForResizing;
  v5 = v4;
  if (v4)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](v4, "removeGestureRecognizer:", self->_panWhileResizingGestureRecognizer);
    -[SBSystemGestureManager removeGestureRecognizer:](v5, "removeGestureRecognizer:", self->_pinchGestureRecognizer);
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    v7 = v5;
  }
  else
  {
    -[SBSystemGestureManager removeGestureRecognizer:](v13, "removeGestureRecognizer:", self->_pinchGestureRecognizer);
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    v7 = v13;
  }
  -[SBSystemGestureManager removeGestureRecognizer:](v7, "removeGestureRecognizer:", rotationGestureRecognizer);
  -[SBSystemGestureManager removeGestureRecognizer:](v13, "removeGestureRecognizer:", self->_panGestureRecognizer);
  -[SBSystemGestureManager removeGestureRecognizer:](v13, "removeGestureRecognizer:", self->_edgeResizeGestureRecognizer);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = 0;

  edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
  self->_edgeResizeGestureRecognizer = 0;

  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  self->_pinchGestureRecognizer = 0;

  v11 = self->_rotationGestureRecognizer;
  self->_rotationGestureRecognizer = 0;

  panWhileResizingGestureRecognizer = self->_panWhileResizingGestureRecognizer;
  self->_panWhileResizingGestureRecognizer = 0;

}

- (void)_setupPointerInteraction
{
  id WeakRetained;
  SBSystemPointerInteractionManager *v4;
  SBSystemPointerInteractionManager *systemPointerInteractionManager;
  SBSystemPointerInteractionManager *v6;
  id v7;

  if (-[SBPIPInteractionController _hasValidInteractionTargetView](self, "_hasValidInteractionTargetView"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "systemPointerInteractionManagerForInteractionController:", self);
    v4 = (SBSystemPointerInteractionManager *)objc_claimAutoreleasedReturnValue();
    systemPointerInteractionManager = self->_systemPointerInteractionManager;
    self->_systemPointerInteractionManager = v4;

    v6 = self->_systemPointerInteractionManager;
    v7 = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    -[SBSystemPointerInteractionManager registerView:delegate:](v6, "registerView:delegate:", v7, self);

  }
}

- (void)_removePointerInteraction
{
  SBSystemPointerInteractionManager *systemPointerInteractionManager;
  id WeakRetained;
  SBSystemPointerInteractionManager *v5;

  systemPointerInteractionManager = self->_systemPointerInteractionManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  -[SBSystemPointerInteractionManager unregisterView:](systemPointerInteractionManager, "unregisterView:", WeakRetained);

  v5 = self->_systemPointerInteractionManager;
  self->_systemPointerInteractionManager = 0;

}

- (void)_setupDefaultInteractorsAndHyperRegions
{
  _UIHyperInteractor *v3;
  _UIHyperInteractor *positionInteractor;
  _UIHyperInteractor *v5;
  _UIHyperInteractor *scaleInteractor;
  _UIHyperInteractor *v7;
  _UIHyperInteractor *rotationInteractor;
  void *v9;
  void *v10;
  id v11;

  v3 = (_UIHyperInteractor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD50]), "initWithDimensions:", 2);
  positionInteractor = self->_positionInteractor;
  self->_positionInteractor = v3;

  v5 = (_UIHyperInteractor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD50]), "initWithDimensions:", 1);
  scaleInteractor = self->_scaleInteractor;
  self->_scaleInteractor = v5;

  v7 = (_UIHyperInteractor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD50]), "initWithDimensions:", 1);
  rotationInteractor = self->_rotationInteractor;
  self->_rotationInteractor = v7;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD48]), "initWithDimensions:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD48]), "initWithDimensions:", 1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD48]), "initWithDimensions:", 1);
  -[_UIHyperInteractor _setExtender:](self->_positionInteractor, "_setExtender:", v11);
  -[_UIHyperInteractor _setExtender:](self->_scaleInteractor, "_setExtender:", v10);
  -[_UIHyperInteractor _setExtender:](self->_rotationInteractor, "_setExtender:", v9);
  -[_UIHyperInteractor _setMinimumSpeed:](self->_rotationInteractor, "_setMinimumSpeed:", 0.0);
  -[_UIHyperInteractor _setMinimumSpeed:](self->_scaleInteractor, "_setMinimumSpeed:", 0.0);
  -[SBPIPInteractionController _updateSettingsDrivenParameters](self, "_updateSettingsDrivenParameters");
  -[SBPIPInteractionController _updatePositionRegionComposers](self, "_updatePositionRegionComposers");

}

- (void)_updateSettingsDrivenParameters
{
  void *v3;
  void *v4;
  SBPIPContentViewLayoutSettings *layoutSettings;
  SBPIPContentViewLayoutSettings *v6;
  UIPanGestureRecognizer *edgeResizeGestureRecognizer;
  void *v8;
  _UIHyperInteractor *positionInteractor;
  SBPIPRotationGestureRecognizer *rotationGestureRecognizer;
  _UIHyperInteractor *rotationInteractor;
  _UIHyperInteractor *scaleInteractor;

  -[_UIHyperInteractor _extender](self->_positionInteractor, "_extender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPInteractionSettings positionExtenderMaximumDistance](self->_interactionSettings, "positionExtenderMaximumDistance");
  objc_msgSend(v3, "_setMaximumDistance:");

  -[_UIHyperInteractor _extender](self->_rotationInteractor, "_extender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPInteractionSettings rotationExtenderMaximumDistance](self->_interactionSettings, "rotationExtenderMaximumDistance");
  objc_msgSend(v4, "_setMaximumDistance:");

  layoutSettings = self->_layoutSettings;
  -[SBPIPInteractionSettings maximumSizeSpanForPreferredSizeTuning](self->_interactionSettings, "maximumSizeSpanForPreferredSizeTuning");
  -[SBPIPContentViewLayoutSettings setMaximumSizeSpanForPreferredSizeTuning:](layoutSettings, "setMaximumSizeSpanForPreferredSizeTuning:");
  v6 = self->_layoutSettings;
  -[SBPIPInteractionSettings minimumSizeSpanBetweenPreferredSizes](self->_interactionSettings, "minimumSizeSpanBetweenPreferredSizes");
  -[SBPIPContentViewLayoutSettings setMinimumSizeSpanBetweenPreferredSizes:](v6, "setMinimumSizeSpanBetweenPreferredSizes:");
  -[UIPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", -[SBPIPInteractionSettings panGestureEnabled](self->_interactionSettings, "panGestureEnabled"));
  -[UIPanGestureRecognizer setEnabled:](self->_edgeResizeGestureRecognizer, "setEnabled:", -[SBPIPInteractionSettings edgeResizeGestureEnabled](self->_interactionSettings, "edgeResizeGestureEnabled"));
  edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
  -[SBPIPInteractionSettings edgeResizeSettings](self->_interactionSettings, "edgeResizeSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hysteresis");
  -[UIPanGestureRecognizer _setHysteresis:](edgeResizeGestureRecognizer, "_setHysteresis:");

  -[UIPanGestureRecognizer setEnabled:](self->_panWhileResizingGestureRecognizer, "setEnabled:", -[SBPIPInteractionSettings panGestureEnabled](self->_interactionSettings, "panGestureEnabled"));
  -[SBPIPPinchGestureRecognizer setEnabled:](self->_pinchGestureRecognizer, "setEnabled:", -[SBPIPInteractionSettings pinchGestureEnabled](self->_interactionSettings, "pinchGestureEnabled"));
  positionInteractor = self->_positionInteractor;
  -[SBPIPInteractionSettings positionDecelerationRate](self->_interactionSettings, "positionDecelerationRate");
  -[_UIHyperInteractor _setDecelerationRate:](positionInteractor, "_setDecelerationRate:");
  rotationGestureRecognizer = self->_rotationGestureRecognizer;
  -[SBPIPInteractionSettings rotationPreRecognitionWeight](self->_interactionSettings, "rotationPreRecognitionWeight");
  -[UIRotationGestureRecognizer _setPreRecognitionWeight:](rotationGestureRecognizer, "_setPreRecognitionWeight:");
  -[SBPIPRotationGestureRecognizer setEnabled:](self->_rotationGestureRecognizer, "setEnabled:", -[SBPIPInteractionSettings rotationGestureEnabled](self->_interactionSettings, "rotationGestureEnabled"));
  rotationInteractor = self->_rotationInteractor;
  -[SBPIPInteractionSettings rotationRubberBandCoefficient](self->_interactionSettings, "rotationRubberBandCoefficient");
  -[_UIHyperInteractor _setRubberBandCoefficient:](rotationInteractor, "_setRubberBandCoefficient:");
  scaleInteractor = self->_scaleInteractor;
  -[SBPIPInteractionSettings scaleDecelerationRate](self->_interactionSettings, "scaleDecelerationRate");
  -[_UIHyperInteractor _setDecelerationRate:](scaleInteractor, "_setDecelerationRate:");
}

- (void)_performInitialLayoutIfNeeded
{
  id WeakRetained;
  CGFloat v4;
  CGFloat v5;
  BOOL v6;
  CGRect v7;
  CGRect v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "bounds");
  UISizeRoundToScale();
  v7.size.width = v4;
  v7.size.height = v5;
  v8.size.width = self->_nonoperationalFrame.size.width;
  v8.size.height = self->_nonoperationalFrame.size.height;
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v6 = CGRectEqualToRect(v7, v8);

  if (!v6)
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 7, 1, 0);
}

- (void)_setDefaults
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (-[SBPIPInteractionController _hasValidInteractionTargetView](self, "_hasValidInteractionTargetView"))
  {
    v12 = 0;
    v13 = 0x3FF0000000000000;
    -[SBPIPInteractionController _closestToDefaultCornersPosition](self, "_closestToDefaultCornersPosition");
    v10 = v3;
    v11 = v4;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&self->_pinchGestureBaselineScale = _Q0;
    self->_edgeResizeGestureBaselineHeightScale = 1.0;
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_scaleInteractor, "_copyUnconstrainedPoint:", &v13, v10, v11);
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_rotationInteractor, "_copyUnconstrainedPoint:", &v12);
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_positionInteractor, "_copyUnconstrainedPoint:", &v10);
  }
}

- (CGPoint)_closestToDefaultCornersPosition
{
  uint64_t v3;
  _SBPIPInteractionControllerTransitionInfo *pendingTransition;
  CGSize pipCurrentSize;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize size;
  __int128 v10;
  __int128 v11;
  CGSize pipStashedSize;
  CGPoint pipAnchorPointOffset;
  CGPoint origin;
  void *v15;
  double v16;
  double v17;
  _QWORD v18[6];
  CGSize v19;
  CGSize pipLastSteadySize;
  CGSize v21;
  CGPoint v22;
  CGPoint v23;
  CGSize v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  double v47;
  double v48;
  CGPoint result;

  v3 = -[SBPIPContentViewLayoutSettings currentContentViewPosition](self->_layoutSettings, "currentContentViewPosition");
  pendingTransition = self->_pendingTransition;
  if (pendingTransition)
    v3 = -[_SBPIPInteractionControllerTransitionInfo layoutCorner](pendingTransition, "layoutCorner");
  v47 = 0.0;
  v48 = 0.0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3010000000;
  v45 = &unk_1D0FA064E;
  v46 = *MEMORY[0x1E0C9D538];
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[SBPIPInteractionController _currentPositionInteractionStateContext](self, "_currentPositionInteractionStateContext");
  pipCurrentSize = self->_geometryContext.pipCurrentSize;
  pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
  v19 = pipCurrentSize;
  v6 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
  v7 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
  v8 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
  v29 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
  v30 = v7;
  size = self->_geometryContext.containerBounds.size;
  v10 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
  v11 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
  v25 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
  v26 = v10;
  pipStashedSize = self->_geometryContext.pipStashedSize;
  v28 = v6;
  v27 = v11;
  pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
  origin = self->_geometryContext.containerBounds.origin;
  v21 = pipStashedSize;
  v22 = pipAnchorPointOffset;
  v24 = size;
  v23 = origin;
  v18[1] = 3221225472;
  v33 = v38;
  v34 = v39;
  v35 = v40;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __62__SBPIPInteractionController__closestToDefaultCornersPosition__block_invoke;
  v18[3] = &unk_1E8EADC60;
  v18[4] = &v42;
  v18[5] = v3;
  v36 = v41;
  v31 = v8;
  v32 = v37;
  -[SBPIPInteractionController _enumeratePositionRegionComposersUsingBlock:](self, "_enumeratePositionRegionComposersUsingBlock:", v18);
  -[_UIHyperInteractor _region](self->_positionInteractor, "_region");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_closestPoint:toPoint:", &v47, v43 + 4);

  _Block_object_dispose(&v42, 8);
  v16 = v47;
  v17 = v48;
  result.y = v17;
  result.x = v16;
  return result;
}

uint64_t __62__SBPIPInteractionController__closestToDefaultCornersPosition__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[4];
  uint64_t v21;
  _OWORD v22[13];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(double *)(v4 + 32);
  v6 = *(double *)(v4 + 40);
  v7 = *(_OWORD *)(a1 + 224);
  v22[10] = *(_OWORD *)(a1 + 208);
  v22[11] = v7;
  v8 = *(_OWORD *)(a1 + 256);
  v22[12] = *(_OWORD *)(a1 + 240);
  v9 = *(_OWORD *)(a1 + 160);
  v22[6] = *(_OWORD *)(a1 + 144);
  v22[7] = v9;
  v10 = *(_OWORD *)(a1 + 192);
  v22[8] = *(_OWORD *)(a1 + 176);
  v22[9] = v10;
  v11 = *(_OWORD *)(a1 + 96);
  v22[2] = *(_OWORD *)(a1 + 80);
  v22[3] = v11;
  v12 = *(_OWORD *)(a1 + 128);
  v22[4] = *(_OWORD *)(a1 + 112);
  v22[5] = v12;
  v13 = *(_OWORD *)(a1 + 64);
  v22[0] = *(_OWORD *)(a1 + 48);
  v22[1] = v13;
  v14 = *(_OWORD *)(a1 + 272);
  v15 = *(_OWORD *)(a1 + 304);
  v20[2] = *(_OWORD *)(a1 + 288);
  v20[3] = v15;
  v21 = *(_QWORD *)(a1 + 320);
  v20[0] = v8;
  v20[1] = v14;
  result = objc_msgSend(a2, "defaultCornerPositionForLayoutSettingsPosition:proposedCenter:geometry:interaction:", v3, v22, v20, v5, v6);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v17 + 32) = v18;
  *(_QWORD *)(v17 + 40) = v19;
  return result;
}

- (unint64_t)_canonicalPositionForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGPoint origin;
  _SBPIPInteractionControllerTransitionInfo *pendingTransition;
  unint64_t v12;
  _QWORD v14[7];
  CGSize pipCurrentSize;
  CGSize pipLastSteadySize;
  CGSize pipStashedSize;
  CGPoint pipAnchorPointOffset;
  CGPoint v19;
  CGSize size;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  y = a3.y;
  x = a3.x;
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[SBPIPInteractionController _currentPositionInteractionStateContext](self, "_currentPositionInteractionStateContext");
  v6 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
  v24 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
  v25 = v6;
  v7 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
  v26 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
  v27 = v7;
  v8 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
  size = self->_geometryContext.containerBounds.size;
  v21 = v8;
  v9 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
  v22 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
  v23 = v9;
  pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
  pipStashedSize = self->_geometryContext.pipStashedSize;
  origin = self->_geometryContext.containerBounds.origin;
  pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
  v19 = origin;
  pipCurrentSize = self->_geometryContext.pipCurrentSize;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 2;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SBPIPInteractionController__canonicalPositionForPoint___block_invoke;
  v14[3] = &unk_1E8EADC88;
  v14[4] = &v33;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  v30 = v39;
  v31 = v40;
  v28 = v37;
  v29 = v38;
  v32 = v41;
  -[SBPIPInteractionController _enumeratePositionRegionComposersUsingBlock:](self, "_enumeratePositionRegionComposersUsingBlock:", v14);
  pendingTransition = self->_pendingTransition;
  if (pendingTransition)
  {
    v12 = -[_SBPIPInteractionControllerTransitionInfo layoutCorner](pendingTransition, "layoutCorner");
    v34[3] = v12;
  }
  else
  {
    v12 = v34[3];
  }
  _Block_object_dispose(&v33, 8);
  return v12;
}

uint64_t __57__SBPIPInteractionController__canonicalPositionForPoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t result;
  _OWORD v15[4];
  uint64_t v16;
  _OWORD v17[13];

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 200);
  v7 = *(_OWORD *)(a1 + 232);
  v17[10] = *(_OWORD *)(a1 + 216);
  v17[11] = v7;
  v17[12] = *(_OWORD *)(a1 + 248);
  v8 = *(_OWORD *)(a1 + 136);
  v9 = *(_OWORD *)(a1 + 168);
  v17[6] = *(_OWORD *)(a1 + 152);
  v17[7] = v9;
  v17[8] = *(_OWORD *)(a1 + 184);
  v17[9] = v6;
  v10 = *(_OWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 104);
  v17[2] = *(_OWORD *)(a1 + 88);
  v17[3] = v11;
  v17[4] = *(_OWORD *)(a1 + 120);
  v17[5] = v8;
  v17[0] = *(_OWORD *)(a1 + 56);
  v17[1] = v10;
  v12 = *(_OWORD *)(a1 + 312);
  v15[2] = *(_OWORD *)(a1 + 296);
  v15[3] = v12;
  v16 = *(_QWORD *)(a1 + 328);
  v13 = *(_OWORD *)(a1 + 280);
  v15[0] = *(_OWORD *)(a1 + 264);
  v15[1] = v13;
  result = objc_msgSend(a2, "canonicalPositionForPoint:proposedPosition:geometry:interaction:", v3, v17, v15, v4, v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  UIViewFloatAnimatableProperty *layoutProgressProperty;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
    {
      -[SBPIPInteractionController _setupGestureRecognizers](self, "_setupGestureRecognizers");
      -[SBPIPInteractionController _setupPointerInteraction](self, "_setupPointerInteraction");
      if (!-[SBPIPInteractionController _isInteractive](self, "_isInteractive"))
        -[SBPIPInteractionController _performInitialLayoutIfNeeded](self, "_performInitialLayoutIfNeeded");
    }
    else
    {
      if (!-[SBPIPInteractionController _isGesturing](self, "_isGesturing"))
        -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
      -[UIViewFloatAnimatableProperty invalidate](self->_layoutProgressProperty, "invalidate");
      layoutProgressProperty = self->_layoutProgressProperty;
      self->_layoutProgressProperty = 0;

      -[SBPIPInteractionController _removeGestureRecognizers](self, "_removeGestureRecognizers");
      -[SBPIPInteractionController _removePointerInteraction](self, "_removePointerInteraction");
    }
  }
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_interactionTargetView);
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_nonoperationalFrame.origin.x;
  y = self->_nonoperationalFrame.origin.y;
  width = self->_nonoperationalFrame.size.width;
  height = self->_nonoperationalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SBPIPContentViewLayoutSettings)layoutSettings
{
  return self->_layoutSettings;
}

- (double)currentNormalizedScale
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[_UIHyperInteractor _region](self->_scaleInteractor, "_region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)objc_msgSend(v3, "_minimumPoint");
  v5 = *(double *)objc_msgSend(v3, "_maximumPoint") - v4;
  v6 = 1.0;
  if ((BSFloatIsZero() & 1) == 0)
    v6 = (*(double *)-[_UIHyperInteractor _constrainedPoint](self->_scaleInteractor, "_constrainedPoint") - v4) / v5;

  return v6;
}

- (double)preferredNormalizedScale
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[_UIHyperInteractor _region](self->_scaleInteractor, "_region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)objc_msgSend(v3, "_minimumPoint");
  v5 = *(double *)objc_msgSend(v3, "_maximumPoint") - v4;
  v6 = 1.0;
  if ((BSFloatIsZero() & 1) == 0)
    v6 = (*(double *)-[_UIHyperInteractor _unconstrainedPoint](self->_scaleInteractor, "_unconstrainedPoint") - v4) / v5;

  return v6;
}

- (unint64_t)canonicalPosition
{
  -[SBPIPInteractionController _currentPositionForLayoutReason:](self, "_currentPositionForLayoutReason:", 1024);
  return -[SBPIPInteractionController _canonicalPositionForPoint:](self, "_canonicalPositionForPoint:");
}

- (void)setTargetOverlayView:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetOverlayView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_targetOverlayView, obj);
    if (objc_msgSend(obj, "isHidden"))
      v5 = 0;
    else
      v5 = 2;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "setNeedsLayoutForInteractionController:traits:withReason:behavior:completion:", self, 7, 0x8000, v5, 0);

  }
}

- (void)setContentLayoutSettings:(id)a3 animationBehavior:(int)a4
{
  uint64_t v4;
  void *v7;
  SBPIPContentViewLayoutSettings *v8;

  v4 = *(_QWORD *)&a4;
  v8 = (SBPIPContentViewLayoutSettings *)a3;
  if (self->_layoutSettings != v8)
  {
    objc_storeStrong((id *)&self->_layoutSettings, a3);
    -[SBPIPContentViewLayoutSettings platformMetrics](v8, "platformMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController setPlatformMetrics:contentSize:animationBehavior:](self, "setPlatformMetrics:contentSize:animationBehavior:", v7, v4, self->_preferredContentSize.width, self->_preferredContentSize.height);

  }
}

- (void)setPlatformMetrics:(id)a3 contentSize:(CGSize)a4 animationBehavior:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  SBPIPContentViewLayoutSettings *layoutSettings;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  -[SBPIPContentViewLayoutSettings updatePlatformMetrics:](self->_layoutSettings, "updatePlatformMetrics:", a3);
  layoutSettings = self->_layoutSettings;
  -[SBPIPContentViewLayoutSettings currentContentViewSizeForAspectRatio:](layoutSettings, "currentContentViewSizeForAspectRatio:", width, height);
  -[SBPIPContentViewLayoutSettings currentContentViewSizeForAspectRatio:](layoutSettings, "currentContentViewSizeForAspectRatio:");
  self->_toBeAppliedPreferredContentSize.width = v10;
  self->_toBeAppliedPreferredContentSize.height = v11;
  self->_preferredContentSize = self->_toBeAppliedPreferredContentSize;
  if (-[SBPIPInteractionController isEnabled](self, "isEnabled"))
  {
    -[SBPIPInteractionController preferredNormalizedScale](self, "preferredNormalizedScale");
    v13 = v12;
    -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", -[SBPIPInteractionController _isInteractive](self, "_isInteractive") ^ 1);
    -[SBPIPInteractionController _proratedScaleForNormalizedScale:](self, "_proratedScaleForNormalizedScale:", v13);
    -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:](self, "_setPreferredScale:additionalReasons:animationBehavior:", 4096, v5);
  }
  else
  {
    -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
  }
}

- (void)setContainerSize:(CGSize)a3 withOrientation:(int64_t)a4 scene:(id)a5
{
  uint64_t v7;

  if (objc_msgSend(a5, "isMainDisplayWindowScene"))
  {
    BSRectWithSize();
    if (-[SBPIPInteractionController _updateGeometryContextUsingTargetViewBounds:orientation:](self, "_updateGeometryContextUsingTargetViewBounds:orientation:", a4))
    {
      if (self->_enabled)
      {
        if (-[SBPIPInteractionController _isInteractive](self, "_isInteractive"))
        {
          -[SBPIPInteractionController _cancelAllGestures](self, "_cancelAllGestures");
        }
        else
        {
          -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 1);
          if (-[SBPIPInteractionController _hasInFlightLayoutAnimations](self, "_hasInFlightLayoutAnimations"))
            v7 = 2;
          else
            v7 = 0;
          -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 7, 2, v7);
        }
      }
      else
      {
        -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
      }
    }
  }
}

- (BOOL)isStashed
{
  if (self->_shouldStash == 0x7FFFFFFFFFFFFFFFLL)
    return self->_didLastSettleInStashedState;
  else
    return BSSettingFlagIsYes();
}

- (void)setStashed:(BOOL)a3
{
  int v3;
  NSObject *v5;
  NSString *shortDescription;
  NSObject *v7;
  NSString *v8;
  int IsYes;
  _BOOL4 v10;
  int v11;
  NSString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    v11 = 138543618;
    v12 = shortDescription;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@][Layout] setStashed:%{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  if (self->_shouldStash == 0x7FFFFFFFFFFFFFFFLL || BSSettingFlagForBool() != v3)
  {
    self->_shouldStash = BSSettingFlagForBool();
    SBLogPIP();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_shortDescription;
      IsYes = BSSettingFlagIsYes();
      v11 = 138543618;
      v12 = v8;
      v13 = 1024;
      v14 = IsYes;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@][Layout] _shouldStash:%{BOOL}u", (uint8_t *)&v11, 0x12u);
    }

    if (self->_enabled)
    {
      v10 = -[SBPIPInteractionController _isInteractive](self, "_isInteractive");
      -[SBPIPInteractionController _cancelAllGestures](self, "_cancelAllGestures");
      -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", !v10);
      -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 7, 32, 2);
    }
    else
    {
      -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
    }
  }
}

- (UIEdgeInsets)_minimumStashedPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[SBPIPContentViewLayoutSettings contentViewPaddingWhileStashed](self->_layoutSettings, "contentViewPaddingWhileStashed");
  if (v8 >= top)
    top = v8;
  -[SBPIPContentViewLayoutSettings contentViewPaddingWhileStashed](self->_layoutSettings, "contentViewPaddingWhileStashed");
  if (v9 >= bottom)
    v10 = v9;
  else
    v10 = bottom;
  v11 = top;
  v12 = left;
  v13 = right;
  result.right = v13;
  result.bottom = v10;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)_cachedEdgeInsetsForScene:(id)a3
{
  NSMutableDictionary *scenePersistentIdentifierToEdgeInsets;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  scenePersistentIdentifierToEdgeInsets = self->_scenePersistentIdentifierToEdgeInsets;
  objc_msgSend(a3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scenePersistentIdentifierToEdgeInsets, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UIEdgeInsetsValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)_cachedStashedPaddingForScene:(id)a3
{
  NSMutableDictionary *scenePersistentIdentifierToStashedPadding;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  scenePersistentIdentifierToStashedPadding = self->_scenePersistentIdentifierToStashedPadding;
  objc_msgSend(a3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scenePersistentIdentifierToStashedPadding, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UIEdgeInsetsValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)_setEdgeInsets:(UIEdgeInsets)a3 forScene:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *scenePersistentIdentifierToEdgeInsets;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  BOOL v23;
  _QWORD v25[4];
  CGRect v26;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  v26.origin.x = left + self->_geometryContext.containerBounds.origin.x;
  v26.origin.y = top + self->_geometryContext.containerBounds.origin.y;
  v26.size.width = self->_geometryContext.containerBounds.size.width - (left + right);
  v26.size.height = self->_geometryContext.containerBounds.size.height - (top + bottom);
  if (CGRectIsInfinite(v26)
    || ((-[SBPIPInteractionController _cachedEdgeInsetsForScene:](self, "_cachedEdgeInsetsForScene:", v9), left == v13)
      ? (v14 = top == v10)
      : (v14 = 0),
        v14 ? (v15 = right == v12) : (v15 = 0),
        v15 ? (v16 = bottom == v11) : (v16 = 0),
        v16))
  {
    v23 = 0;
  }
  else
  {
    if (!self->_scenePersistentIdentifierToEdgeInsets)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      scenePersistentIdentifierToEdgeInsets = self->_scenePersistentIdentifierToEdgeInsets;
      self->_scenePersistentIdentifierToEdgeInsets = v17;

    }
    *(double *)v25 = top;
    *(double *)&v25[1] = left;
    *(double *)&v25[2] = bottom;
    *(double *)&v25[3] = right;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v25, "{UIEdgeInsets=dddd}");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_scenePersistentIdentifierToEdgeInsets;
    objc_msgSend(v9, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "persistentIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v22);

    if (objc_msgSend(v9, "isMainDisplayWindowScene"))
    {
      self->_geometryContext.edgeInsets.top = top;
      self->_geometryContext.edgeInsets.left = left;
      v23 = 1;
      self->_geometryContext.edgeInsets.bottom = bottom;
      self->_geometryContext.edgeInsets.right = right;
    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)_setStashedPadding:(UIEdgeInsets)a3 forScene:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *scenePersistentIdentifierToStashedPadding;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  BOOL v31;
  _QWORD v33[4];
  CGRect v34;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  -[SBPIPInteractionController _minimumStashedPadding:](self, "_minimumStashedPadding:", top, left, bottom, right);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v34.origin.x = self->_geometryContext.containerBounds.origin.x + v12;
  v34.origin.y = v11 + self->_geometryContext.containerBounds.origin.y;
  v34.size.width = self->_geometryContext.containerBounds.size.width - (v13 + v16);
  v34.size.height = self->_geometryContext.containerBounds.size.height - (v11 + v15);
  if (CGRectIsInfinite(v34)
    || ((-[SBPIPInteractionController _cachedStashedPaddingForScene:](self, "_cachedStashedPaddingForScene:", v9),
         v13 == v21)
      ? (v22 = v11 == v18)
      : (v22 = 0),
        v22 ? (v23 = v17 == v20) : (v23 = 0),
        v23 ? (v24 = v15 == v19) : (v24 = 0),
        v24))
  {
    v31 = 0;
  }
  else
  {
    if (!self->_scenePersistentIdentifierToStashedPadding)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      scenePersistentIdentifierToStashedPadding = self->_scenePersistentIdentifierToStashedPadding;
      self->_scenePersistentIdentifierToStashedPadding = v25;

    }
    *(double *)v33 = v11;
    *(double *)&v33[1] = v13;
    *(double *)&v33[2] = v15;
    *(double *)&v33[3] = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v33, "{UIEdgeInsets=dddd}");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self->_scenePersistentIdentifierToStashedPadding;
    objc_msgSend(v9, "session");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "persistentIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v27, v30);

    if (objc_msgSend(v9, "isMainDisplayWindowScene"))
    {
      self->_geometryContext.stashedMinimumPadding.top = v11;
      self->_geometryContext.stashedMinimumPadding.left = v13;
      v31 = 1;
      self->_geometryContext.stashedMinimumPadding.bottom = v15;
      self->_geometryContext.stashedMinimumPadding.right = v17;
    }
    else
    {
      v31 = 1;
    }
  }

  return v31;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v17;
  NSString *shortDescription;
  void *v19;
  void *v20;
  _BOOL4 enabled;
  int v22;
  NSString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;
  CGSize v31;

  height = a3.height;
  width = a3.width;
  v30 = *MEMORY[0x1E0C80C00];
  -[SBPIPContentViewLayoutSettings currentContentViewSizeForAspectRatio:](self->_layoutSettings, "currentContentViewSizeForAspectRatio:");
  v7 = v6;
  v9 = v8;
  UISizeRoundToScale();
  v11 = v10;
  v13 = v12;
  UISizeRoundToScale();
  if (v11 != v15 || v13 != v14)
  {
    SBLogPIP();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      v31.width = width;
      v31.height = height;
      NSStringFromCGSize(v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGSize(self->_toBeAppliedPreferredContentSize);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      enabled = self->_enabled;
      v22 = 138544130;
      v23 = shortDescription;
      v24 = 2114;
      v25 = v19;
      v26 = 2114;
      v27 = v20;
      v28 = 1024;
      v29 = enabled;
      _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating public layout trait preferredContentSize:{%{public}@} currentPreferredContentSize{%{public}@} while enabled{%{BOOL}u}", (uint8_t *)&v22, 0x26u);

    }
    self->_toBeAppliedPreferredContentSize.width = v7;
    self->_toBeAppliedPreferredContentSize.height = v9;
    if (self->_enabled)
    {
      -[SBPIPInteractionController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    }
    else
    {
      self->_preferredContentSize = self->_toBeAppliedPreferredContentSize;
      -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
    }
  }
}

- (void)toggleUserPreferredScale
{
  double v3;
  double v4;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (!-[SBPIPInteractionController _isInteractive](self, "_isInteractive"))
  {
    -[SBPIPContentViewLayoutSettings minimumPreferredContentViewSizeForAspectRatio:](self->_layoutSettings, "minimumPreferredContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
    v4 = v3;
    -[SBPIPContentViewLayoutSettings maximumPreferredContentViewSizeForAspectRatio:](self->_layoutSettings, "maximumPreferredContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
    width = self->_preferredContentSize.width;
    v6 = v4 / width;
    v8 = v7 / width;
    -[SBPIPInteractionController _currentScale](self, "_currentScale");
    v10 = v9;
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      if ((BSFloatEqualToFloat() & 1) != 0)
      {
        v8 = v6;
      }
      else if (vabdd_f64(v10, v6) >= vabdd_f64(v10, v8))
      {
        v8 = v6;
      }
    }
    -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:](self, "_setPreferredScale:additionalReasons:animationBehavior:", 0, 2, v8);
  }
}

- (double)_proratedScaleForNormalizedScale:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[_UIHyperInteractor _region](self->_scaleInteractor, "_region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double *)objc_msgSend(v4, "_minimumPoint");
  v6 = v5 + (*(double *)objc_msgSend(v4, "_maximumPoint") - v5) * a3;

  return v6;
}

- (void)setPreferredNormalizedScale:(double)a3
{
  -[SBPIPInteractionController setPreferredNormalizedScale:additionalReasons:animationBehavior:](self, "setPreferredNormalizedScale:additionalReasons:animationBehavior:", 0, 2, a3);
}

- (void)setPreferredNormalizedScale:(double)a3 additionalReasons:(unint64_t)a4 animationBehavior:(int)a5
{
  uint64_t v5;
  char v9;
  char v10;

  v5 = *(_QWORD *)&a5;
  -[SBPIPInteractionController currentNormalizedScale](self, "currentNormalizedScale");
  v9 = BSFloatEqualToFloat();
  if (!-[SBPIPInteractionController _isInteractive](self, "_isInteractive"))
  {
    if ((a4 & 8) != 0)
      v10 = 0;
    else
      v10 = v9;
    if ((v10 & 1) == 0)
    {
      -[SBPIPInteractionController _proratedScaleForNormalizedScale:](self, "_proratedScaleForNormalizedScale:", a3);
      -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:](self, "_setPreferredScale:additionalReasons:animationBehavior:", a4, v5);
    }
  }
}

- (void)_setPreferredScale:(double)a3 additionalReasons:(unint64_t)a4 animationBehavior:(int)a5
{
  uint64_t v5;
  NSObject *v9;

  v5 = *(_QWORD *)&a5;
  SBLogPIP();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:].cold.1();

  self->_preferredScale = a3;
  -[SBPIPInteractionController _applyPreferredScale](self, "_applyPreferredScale");
  if (self->_enabled)
  {
    -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", -[SBPIPInteractionController _isPinching](self, "_isPinching") ^ 1);
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 2, a4 | 0x10, v5);
  }
  else
  {
    -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
  }
}

- (void)_applyPreferredScale
{
  -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_scaleInteractor, "_copyUnconstrainedPoint:", &self->_preferredScale);
}

- (BOOL)_isPreferredContentSizeDirty
{
  return self->_preferredContentSize.height != self->_toBeAppliedPreferredContentSize.height
      || self->_preferredContentSize.width != self->_toBeAppliedPreferredContentSize.width;
}

- (void)_updatePreferredContentSize
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromCGSize(a1[8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}@][Layout] Applying new size preferredSize[%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)layoutInteractedTraits:(unint64_t)a3 withReason:(unint64_t)a4 source:(id)a5
{
  id v9;
  id WeakRetained;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  __int128 v26;
  CGAffineTransform *p_rotationTransform;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  NSObject *v36;
  NSString *shortDescription;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CGFloat x;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float64x2_t v52;
  CGFloat y;
  double v54;
  double v55;
  CGAffineTransform v56;
  CGAffineTransform t2;
  CGAffineTransform v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  _BYTE t1[52];
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  CGFloat v73;
  __int16 v74;
  CGFloat v75;
  __int16 v76;
  CGFloat v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  double v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9)
  {
    if (a3)
      goto LABEL_3;
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 838, CFSTR("Was asked to layout for no traits."));

    if (a4)
      goto LABEL_4;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 837, CFSTR("Was asked to layout for undefined source."));

  if (!a3)
    goto LABEL_34;
LABEL_3:
  if (a4)
    goto LABEL_4;
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 839, CFSTR("Was asked to layout for undefined reason."));

LABEL_4:
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v11 = objc_loadWeakRetained((id *)&self->_targetOverlayView);
  -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:", a4);
  v13 = v12;
  v15 = v14;
  -[SBPIPInteractionController _currentPositionForLayoutReason:](self, "_currentPositionForLayoutReason:", a4);
  v54 = v16;
  v55 = v17;
  -[SBPIPInteractionController _currentRotation](self, "_currentRotation");
  v19 = v18;
  if ((a4 & 0x300) != 0)
  {
    if (self->_enabled)
    {
      objc_msgSend(WeakRetained, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);

    }
    objc_msgSend(v11, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);

  }
  if ((a3 & 7) != 0)
  {
    if (self->_enabled)
    {
      objc_msgSend(WeakRetained, "_sbWindowScene");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPInteractionController _transformFromDisplayArrangeSpaceToWindowScene:](self, "_transformFromDisplayArrangeSpaceToWindowScene:", v22);
      v52 = vaddq_f64(v64, vmlaq_n_f64(vmulq_n_f64(v63, v55), v62, v54));

      objc_msgSend(WeakRetained, "setCenter:", *(_OWORD *)&v52);
    }
    objc_msgSend(v11, "_sbWindowScene", *(_QWORD *)&v52.f64[0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController _transformFromDisplayArrangeSpaceToWindowScene:](self, "_transformFromDisplayArrangeSpaceToWindowScene:", v23);
    v52 = vaddq_f64(v61, vmlaq_n_f64(vmulq_n_f64(v60, v55), v59, v54));

    objc_msgSend(v11, "setCenter:", *(_OWORD *)&v52);
  }
  if ((a3 & 2) != 0)
  {
    if (self->_enabled)
      objc_msgSend(WeakRetained, "setBounds:", 0.0, 0.0, v13, v15);
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v13, v15, *(_QWORD *)&v52.f64[0]);
  }
  -[SBPIPInteractionController stashProgress](self, "stashProgress", *(_QWORD *)&v52.f64[0]);
  v25 = v24;
  if ((a3 & 1) != 0)
  {
    -[SBPIPInteractionController _noteStashProgress:withReason:](self, "_noteStashProgress:withReason:", a4, v24);
    -[SBPIPInteractionController _stashTabCompensationTransformForStashProgress:reason:](self, "_stashTabCompensationTransformForStashProgress:reason:", a4, v25);
    v26 = *(_OWORD *)&t1[16];
    *(_OWORD *)&self->_stashTabCompensationTransform.a = *(_OWORD *)t1;
    *(_OWORD *)&self->_stashTabCompensationTransform.c = v26;
    *(_OWORD *)&self->_stashTabCompensationTransform.tx = *(_OWORD *)&t1[32];
  }
  if ((a3 & 4) != 0)
  {
    p_rotationTransform = &self->_rotationTransform;
    v28 = MEMORY[0x1E0C9BAA8];
    v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    if (v19 == 0.0)
    {
      *(_OWORD *)&p_rotationTransform->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&self->_rotationTransform.c = v29;
      v30 = *(_OWORD *)(v28 + 32);
    }
    else
    {
      *(_OWORD *)&v58.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v58.c = v29;
      *(_OWORD *)&v58.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformRotate((CGAffineTransform *)t1, &v58, v19);
      v31 = *(_OWORD *)&t1[16];
      *(_OWORD *)&p_rotationTransform->a = *(_OWORD *)t1;
      *(_OWORD *)&self->_rotationTransform.c = v31;
      v30 = *(_OWORD *)&t1[32];
    }
    *(_OWORD *)&self->_rotationTransform.tx = v30;
  }
  v32 = *(_OWORD *)&self->_stashTabCompensationTransform.c;
  *(_OWORD *)t1 = *(_OWORD *)&self->_stashTabCompensationTransform.a;
  *(_OWORD *)&t1[16] = v32;
  v33 = *(_OWORD *)&self->_rotationTransform.a;
  *(_OWORD *)&t1[32] = *(_OWORD *)&self->_stashTabCompensationTransform.tx;
  v34 = *(_OWORD *)&self->_rotationTransform.c;
  v35 = *(_OWORD *)&self->_rotationTransform.tx;
  *(_OWORD *)&t2.a = v33;
  *(_OWORD *)&t2.c = v34;
  *(_OWORD *)&t2.tx = v35;
  memset(&v58, 0, sizeof(v58));
  CGAffineTransformConcat(&v58, (CGAffineTransform *)t1, &t2);
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transform");
  else
    memset(&v56, 0, sizeof(v56));
  *(CGAffineTransform *)t1 = v58;
  if (!CGAffineTransformEqualToTransform(&v56, (CGAffineTransform *)t1))
  {
    if (self->_enabled)
    {
      *(CGAffineTransform *)t1 = v58;
      objc_msgSend(WeakRetained, "setTransform:", t1);
    }
    *(CGAffineTransform *)t1 = v58;
    objc_msgSend(v11, "setTransform:", t1);
  }
  objc_msgSend(WeakRetained, "layoutIfNeeded");
  objc_msgSend(v11, "layoutIfNeeded");
  -[SBPIPInteractionController _updateHyperregionVisualizationIfNecessary](self, "_updateHyperregionVisualizationIfNecessary");
  SBLogPIP();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    shortDescription = self->_shortDescription;
    SBStringFromPIPLayoutTrait(a3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "frame");
    v40 = v39;
    objc_msgSend(WeakRetained, "frame");
    v42 = v41;
    x = self->_anchorPoint.x;
    y = self->_anchorPoint.y;
    -[SBPIPInteractionController _currentScale](self, "_currentScale");
    v45 = v44;
    SBStringFromPIPLayoutReason(a4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)t1 = 138546946;
    *(_QWORD *)&t1[4] = shortDescription;
    *(_WORD *)&t1[12] = 2114;
    *(_QWORD *)&t1[14] = v38;
    *(_WORD *)&t1[22] = 2048;
    *(_QWORD *)&t1[24] = v40;
    *(_WORD *)&t1[32] = 2048;
    *(_QWORD *)&t1[34] = v42;
    *(_WORD *)&t1[42] = 2048;
    *(double *)&t1[44] = v13;
    v66 = 2048;
    v67 = v15;
    v68 = 2048;
    v69 = v54;
    v70 = 2048;
    v71 = v55;
    v72 = 2048;
    v73 = x;
    v74 = 2048;
    v75 = y;
    v76 = 2048;
    v77 = v19;
    v78 = 2048;
    v79 = v45;
    v80 = 2048;
    v81 = v25;
    v82 = 2114;
    v83 = v46;
    v84 = 2114;
    v85 = v48;
    _os_log_debug_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] traits: %{public}@\t origin{%.2f,%.2f} size{%.2f,%.2f} position{%.2f,%.2f} anchorPoint{%.2f,%.2f} rotation %.2f scale %.2f stashProgress{%.2f} reason{%{public}@} source{%{public}@}", t1, 0x98u);

  }
}

- (void)layoutWithFrame:(CGRect)a3 reason:(id)a4 source:(id)a5 usingDisplayArrangementSpace:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id WeakRetained;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  NSString *shortDescription;
  _BOOL4 enabled;
  void *v26;
  objc_class *v27;
  void *v28;
  double v29;
  CGRect v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v48 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v16 = objc_loadWeakRetained((id *)&self->_targetOverlayView);
  v32 = width;
  v33 = height;
  v29 = x;
  v31 = y;
  if (v6)
  {
    objc_msgSend(WeakRetained, "_sbWindowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController _transformFromDisplayArrangeSpaceToWindowScene:](self, "_transformFromDisplayArrangeSpaceToWindowScene:", v17);
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v50 = CGRectApplyAffineTransform(v49, &v35);
    v18 = v50.origin.x;
    v19 = v50.origin.y;
    v20 = v50.size.width;
    v21 = v50.size.height;

    objc_msgSend(v16, "_sbWindowScene");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController _transformFromDisplayArrangeSpaceToWindowScene:](self, "_transformFromDisplayArrangeSpaceToWindowScene:", v22);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v52 = CGRectApplyAffineTransform(v51, &v34);
    x = v52.origin.x;
    y = v52.origin.y;
    width = v52.size.width;
    height = v52.size.height;

  }
  else
  {
    v21 = height;
    v20 = width;
    v19 = y;
    v18 = x;
  }
  objc_msgSend(WeakRetained, "setFrame:", v18, v19, v20, v21, *(_QWORD *)&v29, *(_QWORD *)&v31, *(_QWORD *)&v32, *(_QWORD *)&v33);
  objc_msgSend(v16, "setFrame:", x, y, width, height);
  objc_msgSend(WeakRetained, "layoutIfNeeded");
  objc_msgSend(v16, "layoutIfNeeded");
  -[SBPIPInteractionController _updateHyperregionVisualizationIfNecessary](self, "_updateHyperregionVisualizationIfNecessary");
  SBLogPIP();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    enabled = self->_enabled;
    NSStringFromCGRect(v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v37 = shortDescription;
    v38 = 1024;
    v39 = enabled;
    v40 = 2114;
    v41 = v26;
    v42 = 2114;
    v43 = v13;
    v44 = 2114;
    v45 = v14;
    v46 = 2114;
    v47 = v28;
    _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@][Layout] With externally provided frame while enabled{%{BOOL}u}: frame{%{public}@} reason{%{public}@} source{[%{public}@]%{public}@}", buf, 0x3Au);

  }
}

- (CGPoint)_currentPosition
{
  double v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = *(double *)-[_UIHyperInteractor _constrainedPoint](self->_positionInteractor, "_constrainedPoint");
  v4 = *(double *)(-[_UIHyperInteractor _constrainedPoint](self->_positionInteractor, "_constrainedPoint") + 8);
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)_currentPositionForLayoutReason:(unint64_t)a3
{
  __int16 v3;
  double v5;
  double v6;
  CGPoint result;

  v3 = a3;
  -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:");
  -[SBPIPInteractionController _currentPosition](self, "_currentPosition");
  if ((v3 & 0x400) != 0)
    -[SBPIPInteractionController _roundPosition:forSize:](self, "_roundPosition:forSize:");
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_roundPosition:(CGPoint)a3 forSize:(CGSize)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.width * 0.5 + floor(a3.x - a4.width * 0.5);
  v5 = a4.height * 0.5 + floor(a3.y - a4.height * 0.5);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)_currentSizeForLayoutReason:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SBPIPInteractionController _currentScale](self, "_currentScale", a3);
  UISizeRoundToScale();
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_currentScale
{
  return *(double *)-[_UIHyperInteractor _constrainedPoint](self->_scaleInteractor, "_constrainedPoint");
}

- (CGSize)_lastSteadySize
{
  double *v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double *)-[_UIHyperInteractor _unconstrainedPoint](self->_scaleInteractor, "_unconstrainedPoint");
  v4 = *v3 * self->_preferredContentSize.width;
  v5 = *v3 * self->_preferredContentSize.height;
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)_currentRotation
{
  return *(double *)-[_UIHyperInteractor _constrainedPoint](self->_rotationInteractor, "_constrainedPoint");
}

- (double)stashProgress
{
  double result;

  -[SBPIPInteractionController _currentPosition](self, "_currentPosition");
  -[SBPIPInteractionController _stashProgressForPosition:](self, "_stashProgressForPosition:");
  return result;
}

- (double)_stashProgressForPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  id WeakRetained;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  CGPoint v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  uint64_t v57;
  CGPoint v58;
  CGRect v59;
  CGRect v60;

  y = a3.y;
  x = a3.x;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = 0.0;
  if (!-[SBPIPInteractionController _isPinching](self, "_isPinching")
    && !-[SBPIPInteractionController _isRotating](self, "_isRotating")
    && (self->_stashedLeftRegion || self->_stashedRightRegion))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(WeakRetained, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(WeakRetained, "frame");
    v60.origin.x = v17;
    v60.origin.y = v18;
    v60.size.width = v19;
    v60.size.height = v20;
    v59.origin.x = v10;
    v59.origin.y = v12;
    v59.size.width = v14;
    v59.size.height = v16;
    v21 = CGRectContainsRect(v59, v60);

    v6 = 0.0;
    if (!v21)
    {
      v36.x = 0.0;
      v36.y = 0.0;
      v22 = -[SBPIPInteractionController _isPositionCloserToStashedLeftRegion:closestPointOut:](self, "_isPositionCloserToStashedLeftRegion:closestPointOut:", &v36, x, y);
      objc_msgSend(WeakRetained, "bounds");
      v24 = v23 * 0.5;
      v25 = v36.x - v23 * 0.5;
      v26 = v36.x + v23 * 0.5;
      v27 = -(v23 * 0.5);
      if (!v22)
        v27 = v23 * 0.5;
      v28 = x + v27;
      v29 = (x + v27 - v25) / (v26 - v25) + 0.0;
      v30 = 1.0 - v29;
      if (!v22)
        v30 = (x + v27 - v25) / (v26 - v25) + 0.0;
      v6 = fmin(fmax(v30, 0.0), 1.0);
      SBLogPIP();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        _SBFLoggingMethodProem();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v58.x = x;
        v58.y = y;
        NSStringFromCGPoint(v58);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCGPoint(v36);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138414594;
        v38 = v33;
        v39 = 2112;
        v40 = v34;
        v41 = 2112;
        v42 = v35;
        v43 = 1024;
        v44 = v22;
        v45 = 2048;
        v46 = v24;
        v47 = 2048;
        v48 = v28;
        v49 = 2048;
        v50 = v25;
        v51 = 2048;
        v52 = v26;
        v53 = 2048;
        v54 = v29;
        v55 = 2048;
        v56 = v6;
        _os_log_debug_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEBUG, "%@ position: %@; closestPoint: %@; closerToStashedLeft: %{BOOL}u; bias: %g; effectivePositionX: %g; minValue: "
          "%g; maxValue: %g; progress: %g; normalizedProgress: %g",
          buf,
          0x62u);

      }
    }

  }
  return v6;
}

- (CGPoint)_interactionTargetViewPresentationPosition
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  float64x2_t v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  v12 = v7;
  v13 = v6;

  objc_msgSend(WeakRetained, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPInteractionController _transformToDisplayArrangementSpaceFromWindowScene:](self, "_transformToDisplayArrangementSpaceFromWindowScene:", v8);

  v11 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, v12), v14, v13));
  v10 = v11.f64[1];
  v9 = v11.f64[0];
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_noteStashProgress:(double)a3 withReason:(unint64_t)a4
{
  double v6;
  double v7;
  uint64_t v8;
  id WeakRetained;
  id v10;
  __int128 v11;
  UIViewFloatAnimatableProperty *layoutProgressProperty;
  UIViewFloatAnimatableProperty *v13;
  void *v14;
  void *v15;
  char v16;
  _BOOL8 v17;
  void *v18;
  SBPIPInteractionController *v19;
  UIViewFloatAnimatableProperty *v20;
  UIViewFloatAnimatableProperty *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  char v27;
  CGAffineTransform v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (self->_lastStashedProgress != a3)
  {
    self->_lastStashedProgress = a3;
    -[SBPIPInteractionSettings stashProgressTabAppearanceThresholdX](self->_interactionSettings, "stashProgressTabAppearanceThresholdX", a4);
    v7 = v6;
    v8 = -[SBPIPInteractionController _isPositionCloserToStashedLeftRegion:closestPointOut:](self, "_isPositionCloserToStashedLeftRegion:closestPointOut:", 0, *(double *)-[_UIHyperInteractor _constrainedPoint](self->_positionInteractor, "_constrainedPoint"), *(double *)(-[_UIHyperInteractor _constrainedPoint](self->_positionInteractor, "_constrainedPoint")+ 8)) ^ 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "interactionController:didUpdateStashProgress:", self, a3);
    if (-[_UIHyperInteractor sbpip_isInteractive](self->_positionInteractor, "sbpip_isInteractive"))
    {
      objc_msgSend(v10, "interactionController:wantsStashTabHidden:left:", self, v7 > a3, v8);
      if (self->_didLastSettleInStashedState)
      {
        if (v7 > a3
          || (v11 = *(_OWORD *)&self->_stashTabCompensationTransform.c,
              *(_OWORD *)&v28.a = *(_OWORD *)&self->_stashTabCompensationTransform.a,
              *(_OWORD *)&v28.c = v11,
              *(_OWORD *)&v28.tx = *(_OWORD *)&self->_stashTabCompensationTransform.tx,
              !CGAffineTransformIsIdentity(&v28)))
        {
          -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 1, 2048, 2);
        }
      }
      goto LABEL_15;
    }
    layoutProgressProperty = self->_layoutProgressProperty;
    if (layoutProgressProperty)
    {
      -[UIViewFloatAnimatableProperty invalidate](layoutProgressProperty, "invalidate");
      v13 = self->_layoutProgressProperty;
      self->_layoutProgressProperty = 0;

    }
    if (self->_didLastSettleInStashedState)
    {
      objc_msgSend(WeakRetained, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(WeakRetained, "window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isHidden");

        if ((v16 & 1) == 0)
        {
          v20 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
          v21 = self->_layoutProgressProperty;
          self->_layoutProgressProperty = v20;

          -[UIViewFloatAnimatableProperty setValue:](self->_layoutProgressProperty, "setValue:", 0.0);
          -[UIViewFloatAnimatableProperty setValue:](self->_layoutProgressProperty, "setValue:", 1.0);
          objc_initWeak((id *)&v28, self);
          v22 = (void *)MEMORY[0x1E0CEABB0];
          v29[0] = self->_layoutProgressProperty;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __60__SBPIPInteractionController__noteStashProgress_withReason___block_invoke;
          v24[3] = &unk_1E8EADCB0;
          objc_copyWeak(&v26, (id *)&v28);
          v24[4] = self;
          v25 = v10;
          v27 = v8;
          objc_msgSend(v22, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v23, v24);

          objc_destroyWeak(&v26);
          objc_destroyWeak((id *)&v28);
          goto LABEL_15;
        }
      }
      v17 = v7 > a3;
      v18 = v10;
      v19 = self;
    }
    else
    {
      v18 = v10;
      v19 = self;
      v17 = 1;
    }
    objc_msgSend(v18, "interactionController:wantsStashTabHidden:left:", v19, v17, v8);
LABEL_15:

  }
}

void __60__SBPIPInteractionController__noteStashProgress_withReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  double v3;
  double v4;
  double v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[18])
  {
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_interactionTargetViewPresentationPosition");
    objc_msgSend(v6, "_stashProgressForPosition:");
    v4 = v3;
    objc_msgSend(v6[86], "stashProgressTabAppearanceThresholdX");
    objc_msgSend(*(id *)(a1 + 40), "interactionController:wantsStashTabHidden:left:", v6, v4 < v5, *(unsigned __int8 *)(a1 + 56));
    WeakRetained = v6;
  }

}

- (BOOL)_isPositionCloserToStashedLeftRegion:(CGPoint)a3 closestPointOut:(CGPoint *)a4
{
  _UIHyperregionUnion *stashedLeftRegion;
  _UIHyperregionUnion *stashedRightRegion;
  double v8;
  double v9;
  double v10;
  BOOL result;
  CGPoint *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGPoint v16;

  v16 = a3;
  stashedLeftRegion = self->_stashedLeftRegion;
  stashedRightRegion = self->_stashedRightRegion;
  if (stashedLeftRegion)
  {
    if (stashedRightRegion)
    {
      v15 = *MEMORY[0x1E0C9D538];
      v13 = v15;
      -[_UIHyperregionUnion _closestPoint:toPoint:](stashedLeftRegion, "_closestPoint:toPoint:", &v15, &v16);
      v14 = v13;
      -[_UIHyperregionUnion _closestPoint:toPoint:](self->_stashedRightRegion, "_closestPoint:toPoint:", &v14, &v16);
      UIDistanceBetweenPoints();
      v9 = v8;
      UIDistanceBetweenPoints();
      result = v9 < v10;
      if (a4)
      {
        if (v9 >= v10)
          v12 = (CGPoint *)&v14;
        else
          v12 = (CGPoint *)&v15;
        *a4 = *v12;
      }
    }
    else
    {
      -[_UIHyperregionUnion _closestPoint:toPoint:](stashedLeftRegion, "_closestPoint:toPoint:", a4, &v16);
      return 1;
    }
  }
  else
  {
    if (stashedRightRegion)
      -[_UIHyperregionUnion _closestPoint:toPoint:](self->_stashedRightRegion, "_closestPoint:toPoint:", a4, &v16);
    return 0;
  }
  return result;
}

- (CGAffineTransform)_stashTabCompensationTransformForStashProgress:(SEL)a3 reason:(double)a4
{
  __int128 v7;
  id *v8;
  double v9;
  double v10;
  int v11;
  double v12;
  uint64_t v13;
  double v14;
  __int128 v15;
  id WeakRetained;
  uint64_t v17;
  __int128 v18;
  CGAffineTransform v19;

  v7 = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[12].tx;
  if ((a5 & 0x400) != 0)
  {
    v17 = MEMORY[0x1E0C9BAA8];
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v17 + 32);
  }
  else if (a5 == 2048)
  {
    v8 = (id *)self;
    if (LOBYTE(self->ty))
    {
      objc_msgSend(*(id *)&self[14].c, "stashProgressTabAppearanceThresholdX");
      v10 = v9;
      v11 = objc_msgSend(v8, "_isPositionCloserToStashedLeftRegion:closestPointOut:", 0, *(double *)objc_msgSend(v8[57], "_constrainedPoint"), *(double *)(objc_msgSend(v8[57], "_constrainedPoint") + 8));
      objc_msgSend(v8[88], "minimumStashedTabSize");
      if (!v11)
        v12 = -v12;
      v13 = v11 ^ 1u;
      v14 = 0.0;
      if (v10 > a4)
        v14 = 1.0;
      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v19.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v19.c = v15;
      *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformTranslate(retstr, &v19, v14 * v12, 0.0);
      WeakRetained = objc_loadWeakRetained(v8 + 1);
      objc_msgSend(WeakRetained, "interactionController:wantsStashTabHidden:left:", v8, v10 > a4, v13);

    }
  }
  return self;
}

- (void)_adjustContentViewAnchorPointForGestureRecognizer:(id)a3
{
  uint64_t v5;
  void *v6;
  NSString *shortDescription;
  objc_class *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  double v28;
  double v29;
  objc_class *v30;
  void *v31;
  void *v32;
  UIPanGestureRecognizer *v33;

  v33 = (UIPanGestureRecognizer *)a3;
  v5 = -[UIPanGestureRecognizer state](v33, "state");
  v6 = (void *)MEMORY[0x1E0CB3940];
  shortDescription = self->_shortDescription;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@] %@ state — %i — is not suitable for anchor point update"), shortDescription, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(v5 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 1104, v10);

  }
  if (!-[_UIHyperInteractor sbpip_isRubberBanding](self->_positionInteractor, "sbpip_isRubberBanding"))
  {
    if (self->_edgeResizeGestureRecognizer == v33)
    {
      -[SBPIPInteractionController edgeResizeAnchorPoint](self, "edgeResizeAnchorPoint");
      v21 = v20;
      v23 = v22;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
      if (-[SBPIPInteractionController _isSystemGestureRecognizer:](self, "_isSystemGestureRecognizer:", v33))
      {
        -[UIPanGestureRecognizer _activeEventOfType:](v33, "_activeEventOfType:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPanGestureRecognizer _activeTouchesForEvent:](v33, "_activeTouchesForEvent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "anyObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "type") == 1)
        {
          -[SBSystemGestureManager indirectTouchLifecycleMonitor](self->_systemGestureManagerForResizing, "indirectTouchLifecycleMonitor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "systemGestureHoverLocationInView:", WeakRetained);
          v17 = v16;
          v19 = v18;

        }
        else
        {
          -[UIPanGestureRecognizer locationInView:](v33, "locationInView:", 0);
          -[SBPIPInteractionController _convertPointToInteractionTargetView:fromSystemGestureRecognizer:](self, "_convertPointToInteractionTargetView:fromSystemGestureRecognizer:", v33);
          v17 = v26;
          v19 = v27;
        }

      }
      else
      {
        -[UIPanGestureRecognizer locationInView:](v33, "locationInView:", WeakRetained);
        v17 = v24;
        v19 = v25;
      }
      objc_msgSend(WeakRetained, "bounds");
      v21 = v17 / v28;
      v23 = v19 / v29;

    }
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController __moveToAnchorPoint:reason:](self, "__moveToAnchorPoint:reason:", v31, v21, v23);

  }
}

- (void)_resetAnchorPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v16[2];

  v3 = *(double *)-[_UIHyperInteractor _translation](self->_positionInteractor, "_translation");
  v4 = *(double *)(-[_UIHyperInteractor _translation](self->_positionInteractor, "_translation") + 8);
  -[SBPIPInteractionController _lastSteadySize](self, "_lastSteadySize");
  v6 = v5;
  -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:", 1024);
  v8 = v7 / v6;
  v9 = v3 - self->_geometryContext.pipAnchorPointOffset.x * v8;
  v10 = v4 - self->_geometryContext.pipAnchorPointOffset.y * v8;
  *(double *)v16 = v9;
  *(double *)&v16[1] = v10;
  -[_UIHyperInteractor _copyTranslation:](self->_positionInteractor, "_copyTranslation:", v16);
  __asm { FMOV            V0.2D, #0.5 }
  self->_anchorPoint = _Q0;
  self->_geometryContext.pipAnchorPointOffset = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (void)__moveToAnchorPoint:(CGPoint)a3 reason:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _UIHyperInteractor *positionInteractor;
  NSObject *v18;
  NSString *shortDescription;
  CGFloat v20;
  CGFloat v21;
  _QWORD v22[6];
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  CGFloat v32;
  __int16 v33;
  CGFloat v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  y = a3.y;
  x = a3.x;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v9 = self->_anchorPoint.x;
  v10 = self->_anchorPoint.y;
  objc_msgSend(WeakRetained, "bounds");
  v12 = (x - v9) * v11;
  v14 = (y - v10) * v13;
  v15 = self->_geometryContext.pipAnchorPointOffset.x + v12;
  v16 = self->_geometryContext.pipAnchorPointOffset.y + v14;
  self->_anchorPoint.x = x;
  self->_anchorPoint.y = y;
  positionInteractor = self->_positionInteractor;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__SBPIPInteractionController___moveToAnchorPoint_reason___block_invoke;
  v22[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v22[4] = v12;
  *(double *)&v22[5] = v14;
  -[_UIHyperInteractor _mutateTranslation:](positionInteractor, "_mutateTranslation:", v22);
  self->_geometryContext.pipAnchorPointOffset.x = v15;
  self->_geometryContext.pipAnchorPointOffset.y = v16;
  SBLogPIP();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    shortDescription = self->_shortDescription;
    v20 = self->_anchorPoint.x;
    v21 = self->_anchorPoint.y;
    *(_DWORD *)buf = 138545666;
    v24 = shortDescription;
    v25 = 2114;
    v26 = v7;
    v27 = 2048;
    v28 = v9;
    v29 = 2048;
    v30 = v10;
    v31 = 2048;
    v32 = v20;
    v33 = 2048;
    v34 = v21;
    v35 = 2048;
    v36 = v12;
    v37 = 2048;
    v38 = v14;
    v39 = 2048;
    v40 = v15;
    v41 = 2048;
    v42 = v16;
    _os_log_debug_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][Anchor Point] Changed for %{public}@: oldAnchorPoint{%.2f, %.2f} newAnchorPoint{%.2f, %.2f} positionTranslation{%.2f, %.2f} positionTranslationOffset{%.2f, %.2f}", buf, 0x66u);
  }

}

double __57__SBPIPInteractionController___moveToAnchorPoint_reason___block_invoke(uint64_t a1, double *a2)
{
  double v2;
  double result;

  v2 = a2[1];
  *a2 = *(double *)(a1 + 32) + *a2;
  result = *(double *)(a1 + 40) + v2;
  a2[1] = result;
  return result;
}

- (void)_sizeChangeBeganWithBehavior:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  self->_isChangingSize = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "interactionControllerDidBeginSizeChange:behavior:", self, v3);

}

- (void)_sizeChangeEnded
{
  id WeakRetained;

  self->_isChangingSize = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "interactionControllerDidEndSizeChange:", self);

}

- (CGPoint)_convertPointToInteractionTargetView:(CGPoint)a3 fromSystemGestureRecognizer:(id)a4
{
  UIView **p_interactionTargetView;
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  p_interactionTargetView = &self->_interactionTargetView;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_interactionTargetView);
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "size");
  _UIWindowConvertPointFromOrientationToOrientation();
  v9 = v8;
  v11 = v10;

  objc_msgSend(WeakRetained, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "convertPoint:fromView:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGAffineTransform)_transformToDisplayArrangementSpaceFromWindowScene:(SEL)a3
{
  id v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  int v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  double v23;
  double v24;
  double v25;
  double v26;
  id WeakRetained;
  CGFloat v28;
  CGFloat v29;
  CGAffineTransform *result;
  double v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v6 = a4;
  v7 = MEMORY[0x1E0C9BAA8];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  v32 = v6;
  if (v6 && (objc_msgSend(v6, "isMainDisplayWindowScene") & 1) == 0)
  {
    objc_msgSend(v32, "_sbDisplayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SBSDisplayEdgeAdjacentToNeighboringDisplay();
    objc_msgSend(v32, "_boundsForInterfaceOrientation:", objc_msgSend(v32, "interfaceOrientation"));
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    x = self->_geometryContext.containerBounds.origin.x;
    y = self->_geometryContext.containerBounds.origin.y;
    width = self->_geometryContext.containerBounds.size.width;
    height = self->_geometryContext.containerBounds.size.height;
    switch(v10)
    {
      case 0:
        v23 = CGRectGetWidth(self->_geometryContext.containerBounds);
        goto LABEL_7;
      case 1:
        v31 = CGRectGetWidth(self->_geometryContext.containerBounds);
        v33.origin.x = v15;
        v33.origin.y = v16;
        v33.size.width = v17;
        v33.size.height = v18;
        retstr->tx = (v31 - CGRectGetWidth(v33)) * 0.5;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v24 = CGRectGetHeight(v34);
        goto LABEL_9;
      case 2:
        v23 = -CGRectGetWidth(*(CGRect *)&v11);
LABEL_7:
        retstr->tx = v23;
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        v25 = CGRectGetHeight(v35);
        v36.origin.x = v15;
        v36.origin.y = v16;
        v36.size.width = v17;
        v36.size.height = v18;
        v24 = (v25 - CGRectGetHeight(v36)) * 0.5;
        goto LABEL_9;
      case 3:
        v26 = CGRectGetWidth(self->_geometryContext.containerBounds);
        v37.origin.x = v15;
        v37.origin.y = v16;
        v37.size.width = v17;
        v37.size.height = v18;
        retstr->tx = (v26 - CGRectGetWidth(v37)) * 0.5;
        v38.origin.x = v15;
        v38.origin.y = v16;
        v38.size.width = v17;
        v38.size.height = v18;
        v24 = -CGRectGetHeight(v38);
LABEL_9:
        retstr->ty = v24;
        break;
      default:
        break;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  UIRoundToViewScale();
  retstr->tx = v28;
  UIRoundToViewScale();
  retstr->ty = v29;

  return result;
}

- (CGAffineTransform)_transformFromDisplayArrangeSpaceToWindowScene:(SEL)a3
{
  CGAffineTransform *result;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  result = -[SBPIPInteractionController _transformToDisplayArrangementSpaceFromWindowScene:](self, "_transformToDisplayArrangementSpaceFromWindowScene:", a4);
  *(float64x2_t *)&retstr->tx = vnegq_f64(*(float64x2_t *)&retstr->tx);
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  BOOL v6;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_pendingTransition)
  {
    v6 = 0;
  }
  else if (self->_panWhileResizingGestureRecognizer == v4)
  {
    v6 = -[SBPIPInteractionController _isPinching](self, "_isPinching");
  }
  else
  {
    v6 = self->_edgeResizeGestureRecognizer != v4 || self->_pointerIsHoveringOverEdge != 0;
  }

  return v6;
}

- (BOOL)gestureRecognizerShouldFailForMovementPastHysteresis:(id)a3
{
  if (self->_rotationGestureRecognizer != a3 && self->_pinchGestureRecognizer != a3)
    return 1;
  if (-[SBPIPInteractionController _isPinching](self, "_isPinching"))
    return 0;
  return !-[SBPIPInteractionController _isRotating](self, "_isRotating");
}

- (void)handleExternalPanGesture:(id)a3
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  uint64_t v15;
  UIPanGestureRecognizer *externalPanDrivingGestureRecognizer;
  id v17;

  v17 = a3;
  v5 = objc_msgSend(v17, "state");
  if (v5 == 1)
  {
    objc_storeStrong((id *)&self->_externalPanDrivingGestureRecognizer, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(WeakRetained, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    objc_msgSend(WeakRetained, "center");
    v13 = v9 - v12;
    objc_msgSend(WeakRetained, "center");
    self->_panGestureLocationOffset.x = v13;
    self->_panGestureLocationOffset.y = v11 - v14;

    -[SBPIPInteractionController handlePanGesture:](self, "handlePanGesture:", v17);
  }
  else
  {
    v15 = v5;
    -[SBPIPInteractionController handlePanGesture:](self, "handlePanGesture:", v17);
    if ((unint64_t)(v15 - 3) <= 2)
    {
      externalPanDrivingGestureRecognizer = self->_externalPanDrivingGestureRecognizer;
      self->_externalPanDrivingGestureRecognizer = 0;

      self->_panGestureLocationOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    }
  }

}

- (void)handleEdgeResizeGesture:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSString *shortDescription;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      SBLogPIP();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[SBPIPInteractionController handleEdgeResizeGesture:].cold.2((uint64_t)self, (uint64_t)v4);

      self->_pinchGestureScaleFactor = 1.0;
      objc_msgSend(WeakRetained, "bounds");
      self->_edgeResizeGestureBaselineWidthScale = v8 / self->_preferredContentSize.width;
      objc_msgSend(WeakRetained, "bounds");
      self->_edgeResizeGestureBaselineHeightScale = v9 / self->_preferredContentSize.height;
      objc_msgSend(WeakRetained, "bounds");
      self->_edgeResizeGestureBaselineWidth = v10;
      objc_msgSend(WeakRetained, "bounds");
      self->_edgeResizeGestureBaselineHeight = v11;
      -[_UIHyperInteractor sbpip_setInteractive:](self->_scaleInteractor, "sbpip_setInteractive:", 1);
      -[SBPIPInteractionController _adjustContentViewAnchorPointForGestureRecognizer:](self, "_adjustContentViewAnchorPointForGestureRecognizer:", v4);
      -[SBPIPInteractionController _handleGestureBeganState:](self, "_handleGestureBeganState:", v4);
      goto LABEL_10;
    case 2:
LABEL_10:
      objc_msgSend(WeakRetained, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "translationInView:", v12);
      v19 = 0.0;
      v20 = 0.0;
      -[SBPIPInteractionController recalculateScale:baselineScale:forTranslationInView:](self, "recalculateScale:baselineScale:forTranslationInView:", &v20, &v19);
      v13 = v20 * 0.75 + self->_pinchGestureScaleFactor * 0.25;
      self->_pinchGestureScaleFactor = v13;
      v14 = -(v19 - v19 * v13);
      v18 = v14;
      SBLogPIP();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        shortDescription = self->_shortDescription;
        objc_msgSend(v4, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v22 = shortDescription;
        v23 = 2114;
        v24 = v17;
        v25 = 2048;
        v26 = v20;
        v27 = 2048;
        v28 = v14;
        _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Edge Resize Changed: \t scale %.2f scaleTranslation %.2f", buf, 0x2Au);

      }
      -[_UIHyperInteractor _copyTranslation:](self->_scaleInteractor, "_copyTranslation:", &v18);
      -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 2, 256, 1);

      break;
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      if (self->_systemGestureManagerForResizing)
        -[UIPanGestureRecognizer setState:](self->_panWhileResizingGestureRecognizer, "setState:", 4);
LABEL_4:
      SBLogPIP();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[SBPIPInteractionController handleEdgeResizeGesture:].cold.1((uint64_t)self, v4);

      -[SBPIPInteractionController _handleGestureEndedState:](self, "_handleGestureEndedState:", v4);
      break;
    default:
      break;
  }

}

- (void)handlePanGesture:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  _UIHyperInteractor *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  BOOL v22;
  NSObject *v23;
  _UIHyperInteractor *scaleInteractor;
  uint64_t v25;
  NSString *shortDescription;
  void *v27;
  _BOOL4 threeTouchesPanDetected;
  uint64_t v29;
  _QWORD v30[2];
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v6 = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = objc_msgSend(v4, "state");
  if ((unint64_t)(v7 - 3) >= 3)
  {
    if (v7 != 2)
    {
      if (v7 != 1)
        goto LABEL_23;
      SBLogPIP();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SBPIPInteractionController handlePanGesture:].cold.2((uint64_t)self, (uint64_t)v4);

      self->_threeTouchesPanDetected = 0;
      -[_UIHyperInteractor sbpip_setInteractive:](self->_positionInteractor, "sbpip_setInteractive:", 1);
      if (objc_msgSend(v6, "interactionControllerScalesDuringPanGesture:", self))
        -[_UIHyperInteractor sbpip_setInteractive:](self->_scaleInteractor, "sbpip_setInteractive:", 1);
      -[SBPIPInteractionController _handleGestureBeganState:](self, "_handleGestureBeganState:", v4);
    }
    -[SBPIPInteractionController _updateTargetWindowSceneIfNeeded](self, "_updateTargetWindowSceneIfNeeded");
    objc_msgSend(WeakRetained, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v11);
    v13 = v12 + self->_panGestureLocationOffset.x;
    v15 = v14 + self->_panGestureLocationOffset.y;
    objc_msgSend(v4, "velocityInView:", v11);
    v17 = v16;
    v19 = v18;
    v30[0] = v16;
    v30[1] = v18;
    v20 = v13 + self->_geometryContext.pipAnchorPointOffset.x;
    v21 = v15 + self->_geometryContext.pipAnchorPointOffset.y;
    v22 = objc_msgSend(v4, "numberOfTouches", *(_QWORD *)&v20, *(_QWORD *)&v21, v16, v18) == 3
       || self->_threeTouchesPanDetected;
    self->_threeTouchesPanDetected = v22;
    SBLogPIP();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      objc_msgSend(v4, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      threeTouchesPanDetected = self->_threeTouchesPanDetected;
      *(_DWORD *)buf = 138545410;
      v32 = shortDescription;
      v33 = 2114;
      v34 = v27;
      v35 = 2048;
      v36 = v13;
      v37 = 2048;
      v38 = v15;
      v39 = 2048;
      v40 = v17;
      v41 = 2048;
      v42 = v19;
      v43 = 2048;
      v44 = v20;
      v45 = 2048;
      v46 = v21;
      v47 = 1024;
      v48 = threeTouchesPanDetected;
      _os_log_debug_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Pan Changed: \t translation{%.2f, %.2f} velocity{%.2f, %.2f} anchorPointTranslatedPosition{%.2f, %.2f} _threeTouchesPanDetected{%{BOOL}u}", buf, 0x58u);

    }
    -[_UIHyperInteractor _copyTranslation:](self->_positionInteractor, "_copyTranslation:", &v29);
    -[_UIHyperInteractor _copyVelocity:](self->_positionInteractor, "_copyVelocity:", v30);
    if (objc_msgSend(v6, "interactionControllerScalesDuringPanGesture:", self))
    {
      scaleInteractor = self->_scaleInteractor;
      -[SBPIPInteractionController _lastSteadySize](self, "_lastSteadySize");
      objc_msgSend(v6, "interactionController:updateScaleInteractor:pipSize:forPanGesture:", self, scaleInteractor, v4);
      v25 = 3;
    }
    else
    {
      v25 = 1;
    }
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", v25, 128, 1);

  }
  else
  {
    if (objc_msgSend(v6, "interactionControllerScalesDuringPanGesture:", self))
    {
      v8 = self->_scaleInteractor;
      -[SBPIPInteractionController _lastSteadySize](self, "_lastSteadySize");
      objc_msgSend(v6, "interactionController:updateScaleInteractor:pipSize:forPanGesture:", self, v8, v4);
    }
    SBLogPIP();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBPIPInteractionController handlePanGesture:].cold.1((uint64_t)self, (uint64_t)v4);

    -[SBPIPInteractionController _handleGestureEndedState:](self, "_handleGestureEndedState:", v4);
  }
LABEL_23:

}

- (void)handlePinchGesture:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  NSObject *v15;
  NSString *shortDescription;
  void *v17;
  double v18;
  uint64_t v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      SBLogPIP();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[SBPIPInteractionController handlePinchGesture:].cold.2((uint64_t)self, (uint64_t)v4);

      self->_pinchGestureScaleFactor = 1.0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
      objc_msgSend(WeakRetained, "bounds");
      self->_pinchGestureBaselineScale = v8 / self->_preferredContentSize.width;

      -[_UIHyperInteractor sbpip_setInteractive:](self->_scaleInteractor, "sbpip_setInteractive:", 1);
      -[SBPIPInteractionController _adjustContentViewAnchorPointForGestureRecognizer:](self, "_adjustContentViewAnchorPointForGestureRecognizer:", v4);
      -[SBPIPInteractionController _handleGestureBeganState:](self, "_handleGestureBeganState:", self->_pinchGestureRecognizer);
      goto LABEL_10;
    case 2:
LABEL_10:
      objc_msgSend(v4, "scale");
      v10 = v9;
      objc_msgSend(v4, "velocity");
      v12 = v11;
      v19 = v11;
      v13 = v10 * 0.75 + self->_pinchGestureScaleFactor * 0.25;
      self->_pinchGestureScaleFactor = v13;
      v14 = -(self->_pinchGestureBaselineScale - self->_pinchGestureBaselineScale * v13);
      v18 = v14;
      SBLogPIP();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        shortDescription = self->_shortDescription;
        objc_msgSend(v4, "name", *(_QWORD *)&v18, v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v21 = shortDescription;
        v22 = 2114;
        v23 = v17;
        v24 = 2048;
        v25 = v10;
        v26 = 2048;
        v27 = v12;
        v28 = 2048;
        v29 = v14;
        _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Pinch Changed: \t scale %.2f velocity %.2f scaleTranslation %.2f", buf, 0x34u);

      }
      -[_UIHyperInteractor _copyTranslation:](self->_scaleInteractor, "_copyTranslation:", &v18);
      -[_UIHyperInteractor _copyVelocity:](self->_scaleInteractor, "_copyVelocity:", &v19);
      -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 2, 256, 1);
      break;
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      if (self->_systemGestureManagerForResizing)
        -[UIPanGestureRecognizer setState:](self->_panWhileResizingGestureRecognizer, "setState:", 4);
LABEL_4:
      SBLogPIP();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[SBPIPInteractionController handlePinchGesture:].cold.1((uint64_t)self, v4);

      -[SBPIPInteractionController _handleGestureEndedState:](self, "_handleGestureEndedState:", v4);
      break;
    default:
      break;
  }

}

- (void)handleRotationGesture:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  NSObject *v14;
  NSString *shortDescription;
  void *v16;
  uint64_t v17;
  double v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 != 2)
    {
      if (v5 != 1)
        goto LABEL_17;
      SBLogPIP();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[SBPIPInteractionController handleRotationGesture:].cold.2((uint64_t)self, (uint64_t)v4);

      -[_UIHyperInteractor sbpip_setInteractive:](self->_rotationInteractor, "sbpip_setInteractive:", 1);
      -[SBPIPInteractionController _adjustContentViewAnchorPointForGestureRecognizer:](self, "_adjustContentViewAnchorPointForGestureRecognizer:", v4);
      -[SBPIPInteractionController _handleGestureBeganState:](self, "_handleGestureBeganState:", v4);
    }
    objc_msgSend(v4, "rotation");
    v9 = v8;
    v18 = v8;
    objc_msgSend(v4, "velocity");
    v11 = v10;
    v12 = *(double *)-[_UIHyperInteractor _translation](self->_rotationInteractor, "_translation", v10);
    v13 = v9 - v12;
    if (v9 - v12 < 0.0)
      v13 = -v13;
    if (v13 > 3.14159265)
    {
      objc_msgSend(v4, "setRotation:", v12);
      v18 = v12;
      v9 = v12;
    }
    SBLogPIP();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = shortDescription;
      v21 = 2114;
      v22 = v16;
      v23 = 2048;
      v24 = v9;
      v25 = 2048;
      v26 = v11;
      _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Rotation Changed: \t rotation %.2f velocity %.2f", buf, 0x2Au);

    }
    -[_UIHyperInteractor _copyTranslation:](self->_rotationInteractor, "_copyTranslation:", &v18);
    -[_UIHyperInteractor _copyVelocity:](self->_rotationInteractor, "_copyVelocity:", &v17);
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 4, 512, 1);
  }
  else
  {
    SBLogPIP();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBPIPInteractionController handleRotationGesture:].cold.1((uint64_t)self, (uint64_t)v4);

    -[SBPIPInteractionController _handleGestureEndedState:](self, "_handleGestureEndedState:", v4);
  }
LABEL_17:

}

- (void)_handleGestureBeganState:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (!-[SBWindowScene isMainDisplayWindowScene](self->_targetWindowScene, "isMainDisplayWindowScene"))
    -[SBPIPInteractionController _updateGeometryContextBoundsUsingMainDisplayWindowScene](self, "_updateGeometryContextBoundsUsingMainDisplayWindowScene");
  -[SBPIPInteractionController _updatePositionRegionComposers](self, "_updatePositionRegionComposers");
  -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "interactionControllerDidBeginInteraction:forGestureRecognizer:", self, v5);

}

- (void)_handleGestureEndedState:(id)a3
{
  UIPanGestureRecognizer *v5;
  unint64_t gesturesEndedLayoutReason;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *shortDescription;
  uint64_t v13;
  void *v14;
  _BOOL4 gesturesWereCancelled;
  const __CFString *v16;
  uint64_t v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (UIPanGestureRecognizer *)a3;
  self->_gesturesWereCancelled |= -[UIPanGestureRecognizer state](v5, "state") == 4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    gesturesEndedLayoutReason = self->_gesturesEndedLayoutReason;
    if (self->_edgeResizeGestureRecognizer != v5)
    {
      v7 = gesturesEndedLayoutReason | 0x80;
LABEL_9:
      self->_gesturesEndedLayoutReason = v7;
      goto LABEL_10;
    }
LABEL_6:
    v7 = gesturesEndedLayoutReason | 0x100;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    gesturesEndedLayoutReason = self->_gesturesEndedLayoutReason;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self->_gesturesEndedLayoutReason | 0x200;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 1495, CFSTR("Unrecognized gesture recognizer: %@"), v5);

LABEL_10:
  if (!self->_didHandleGestureEndState)
  {
    self->_didHandleGestureEndState = 1;
    self->_gesturesEndedLayoutReason |= 0x400uLL;
    SBLogPIP();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      -[UIPanGestureRecognizer name](v5, "name");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      gesturesWereCancelled = self->_gesturesWereCancelled;
      *(_DWORD *)buf = 138543874;
      v19 = shortDescription;
      if (gesturesWereCancelled)
        v16 = CFSTR("cancelled");
      else
        v16 = CFSTR("recognized");
      v20 = 2114;
      v21 = v13;
      v22 = 2114;
      v23 = v16;
      _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Will Handle Ended State: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !self->_gesturesWereCancelled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel___handleGesturesEndedState_, v9, v10, 0.0);

  }
}

- (void)__handleGesturesEndedState:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  unint64_t gesturesEndedLayoutReason;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id to;
  id location;

  v4 = a3;
  if (self->_didHandleGestureEndState)
  {
    SBLogPIP();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBPIPInteractionController __handleGesturesEndedState:].cold.1();

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___handleGesturesEndedState_, v4);
    -[SBPIPInteractionController _resetAnchorPoint](self, "_resetAnchorPoint");
    -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 1);
    *(_WORD *)&self->_didHandleGestureEndState = 0;
    objc_initWeak(&location, self);
    objc_copyWeak(&to, (id *)&self->_delegate);
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    gesturesEndedLayoutReason = self->_gesturesEndedLayoutReason;
    if ((gesturesEndedLayoutReason & 0x80) != 0)
    {
      v8 = objc_loadWeakRetained(&to);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "interactionControllerPanGestureDidEnd:", self);

    }
    self->_gesturesEndedLayoutReason = 0;
    objc_msgSend(WeakRetained, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController _inFlightHitTestPadding](self, "_inFlightHitTestPadding");
    objc_msgSend(WeakRetained, "_setTouchInsets:");
    v10 = -[SBPIPInteractionController __traitsForGesturesReasons:](self, "__traitsForGesturesReasons:", gesturesEndedLayoutReason);
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke;
    v18[3] = &unk_1E8EA46E8;
    v12 = WeakRetained;
    v19 = v12;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke_2;
    v14[3] = &unk_1E8EADCD8;
    objc_copyWeak(&v16, &to);
    objc_copyWeak(&v17, &location);
    v13 = v9;
    v15 = v13;
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:](self, "_setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:", v10, gesturesEndedLayoutReason, 2, v18, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }

}

uint64_t __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTouchInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
}

void __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(WeakRetained, "interactionControllerDidEndAllInteractions:targetWindowScene:", v2, v2[91]);
    if (v3[91] != *(_QWORD *)(a1 + 32))
      objc_msgSend(v3, "reloadHyperregionComposerData");
  }

}

- (void)_setNeedsLayoutForTraits:(unint64_t)a3 withReason:(unint64_t)a4 behavior:(int)a5
{
  -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:](self, "_setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:", a3, a4, *(_QWORD *)&a5, 0, 0);
}

- (void)_setNeedsLayoutForTraits:(unint64_t)a3 withReason:(unint64_t)a4 behavior:(int)a5 layoutCompletion:(id)a6 interactionCompletion:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSString *shortDescription;
  void *v22;
  unint64_t inFlightAnimatedLayouts;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27[2];
  id location;
  id to;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v8 = *(_QWORD *)&a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  objc_copyWeak(&to, (id *)&self->_delegate);
  self->_allLayoutSessionUpdateReasons |= a4;
  if (-[SBPIPInteractionController _isSizeAffectedByLayoutReasons:](self, "_isSizeAffectedByLayoutReasons:", a4))
    -[SBPIPInteractionController _sizeChangeBeganWithBehavior:](self, "_sizeChangeBeganWithBehavior:", v8);
  ++self->_inFlightAnimatedLayouts;
  SBLogPIP();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    shortDescription = self->_shortDescription;
    SBStringFromPIPLayoutReason(a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    inFlightAnimatedLayouts = self->_inFlightAnimatedLayouts;
    *(_DWORD *)buf = 138543874;
    v31 = shortDescription;
    v32 = 2114;
    v33 = v22;
    v34 = 2048;
    v35 = inFlightAnimatedLayouts;
    _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] increment!: %{public}@ %ld", buf, 0x20u);

  }
  objc_initWeak(&location, self);
  SBLogPIP();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_shortDescription;
    SBStringFromPIPLayoutReason(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:].cold.1((uint64_t)v16, v17, (uint64_t)buf, v15);
  }

  v18 = objc_loadWeakRetained(&to);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke;
  v24[3] = &unk_1E8EADD00;
  objc_copyWeak(v27, &location);
  v24[4] = self;
  v27[1] = (id)a4;
  v19 = v12;
  v25 = v19;
  v20 = v13;
  v26 = v20;
  objc_msgSend(v18, "setNeedsLayoutForInteractionController:traits:withReason:behavior:completion:", self, a3, a4, v8, v24);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&to);

}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *WeakRetained;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained + 84;
    --WeakRetained[84];
    SBLogPIP();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_3(a1, (uint64_t *)(v7 + 672), v9);

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, a2, a3);
    if (*(_QWORD *)(a1 + 48))
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 680))
      {
        v11 = (void *)MEMORY[0x1D17E5550](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 680));
        v29 = MEMORY[0x1E0C809B0];
        v30 = 3221225472;
        v31 = __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_235;
        v32 = &unk_1E8EAA398;
        v33 = v11;
        v34 = *(id *)(a1 + 48);
        v12 = v11;
        v13 = MEMORY[0x1D17E5550](&v29);
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(void **)(v14 + 680);
        *(_QWORD *)(v14 + 680) = v13;

      }
      else
      {
        v18 = MEMORY[0x1D17E5550]();
        v19 = *(_QWORD *)(a1 + 32);
        v12 = *(id *)(v19 + 680);
        *(_QWORD *)(v19 + 680) = v18;
      }

    }
    if ((objc_msgSend((id)v7, "_isGesturing", v29, v30, v31, v32) & 1) == 0)
    {
      SBLogPIP();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v27 = *(_QWORD *)(v7 + 24);
        SBStringFromPIPLayoutReason(*(_QWORD *)(a1 + 64));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v27;
        v37 = 2114;
        v38 = v28;
        v39 = 1024;
        v40 = a2;
        v41 = 1024;
        v42 = a3;
        _os_log_debug_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Did complete animation for: %{public}@ finished: %{BOOL}u, retargeted %{BOOL}u", buf, 0x22u);

      }
      if (!*v8)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 680))
        {
          v21 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550]();
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(void **)(v22 + 680);
          *(_QWORD *)(v22 + 680) = 0;

          v21[2](v21, a2, a3);
        }
        if (objc_msgSend((id)v7, "_isSizeAffectedByLayoutReasons:", *(_QWORD *)(v7 + 152)))
          objc_msgSend((id)v7, "_sizeChangeEnded");
        SBLogPIP();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_2(v7, (uint64_t *)(v7 + 152));

        *(_QWORD *)(v7 + 152) = 0;
        v25 = objc_loadWeakRetained((id *)(v7 + 8));
        objc_msgSend(v25, "interactionController:didSettleOnStashState:", v7, *(unsigned __int8 *)(v7 + 40));

        if (objc_msgSend((id)v7, "_isPreferredContentSizeDirty"))
        {
          SBLogPIP();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_1();

          objc_msgSend((id)v7, "_updatePreferredContentSize");
        }
        if (!*(_BYTE *)(v7 + 41))
          objc_msgSend((id)v7, "_setupForInitialFrame");
      }
    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, a2, a3);
    v17 = *(_QWORD *)(a1 + 48);
    if (v17)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, a2, a3);
  }

}

uint64_t __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_235(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)__traitsForGesturesReasons:(unint64_t)a3
{
  _QWORD *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v10[2];
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  SBPIPInteractionController *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __57__SBPIPInteractionController___traitsForGesturesReasons___block_invoke;
  v12 = &unk_1E8EA1400;
  v13 = self;
  v14 = &v15;
  v4 = v10;
  if (a3)
  {
    v19 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a3) != 0)
        {
          ((void (*)(_QWORD *))v11)(v4);
          if (v19)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }
  }

  v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __57__SBPIPInteractionController___traitsForGesturesReasons___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id WeakRetained;
  char v4;
  uint64_t v5;

  switch(a2)
  {
    case 512:
      v2 = a1 + 40;
      v5 = 4;
LABEL_9:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 24) |= v5;
      return;
    case 256:
      v2 = a1 + 40;
LABEL_8:
      v5 = 2;
      goto LABEL_9;
    case 128:
      v2 = a1 + 40;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1uLL;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 760));
      v4 = objc_msgSend(WeakRetained, "interactionControllerScalesDuringPanGesture:", *(_QWORD *)(v2 - 8));

      if ((v4 & 1) != 0)
        goto LABEL_8;
      break;
  }
}

- (BOOL)_isSystemGestureRecognizer:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 != v6;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *v7;
  UIPanGestureRecognizer *edgeResizeGestureRecognizer;
  BOOL v10;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = (UIPanGestureRecognizer *)a4;
  if (self->_panGestureRecognizer == v6 && self->_panWhileResizingGestureRecognizer == v7)
  {
    v10 = 0;
  }
  else
  {
    edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
    v10 = edgeResizeGestureRecognizer != v6 && edgeResizeGestureRecognizer != v7;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  NSObject *v15;
  NSString *shortDescription;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v31;
  int v32;
  NSString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  if (-[SBPIPInteractionController _isSystemGestureRecognizer:](self, "_isSystemGestureRecognizer:", v6))
  {
    if (objc_msgSend(v7, "type") == 1)
    {
      -[SBSystemGestureManager indirectTouchLifecycleMonitor](self->_systemGestureManagerForResizing, "indirectTouchLifecycleMonitor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemGestureHoverLocationInView:", WeakRetained);
      v11 = v10;
      v13 = v12;

      v14 = objc_msgSend(WeakRetained, "pointInside:forEvent:", 0, v11, v13);
      SBLogPIP();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        shortDescription = self->_shortDescription;
        -[UIPanGestureRecognizer name](v6, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138544386;
        v33 = shortDescription;
        v34 = 2114;
        v35 = v17;
        v36 = 2048;
        v37 = v11;
        v38 = 2048;
        v39 = v13;
        v40 = 1024;
        LODWORD(v41) = v14;
        v18 = "[%{public}@][Gesture][%{public}@] hoverLocation{%.2f,%.2f} hoverInside{%{BOOL}u}";
        v19 = v15;
        v20 = 48;
LABEL_17:
        _os_log_debug_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v32, v20);

      }
    }
    else
    {
      objc_msgSend(v7, "locationInView:", 0);
      v23 = v22;
      v25 = v24;
      -[SBPIPInteractionController _convertPointToInteractionTargetView:fromSystemGestureRecognizer:](self, "_convertPointToInteractionTargetView:fromSystemGestureRecognizer:", v6);
      v27 = v26;
      v29 = v28;
      v14 = objc_msgSend(WeakRetained, "pointInside:withEvent:", 0);
      SBLogPIP();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v31 = self->_shortDescription;
        -[UIPanGestureRecognizer name](v6, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138544898;
        v33 = v31;
        v34 = 2114;
        v35 = v17;
        v36 = 2048;
        v37 = v23;
        v38 = 2048;
        v39 = v25;
        v40 = 2048;
        v41 = v27;
        v42 = 2048;
        v43 = v29;
        v44 = 1024;
        v45 = v14;
        v18 = "[%{public}@][Gesture][%{public}@] point{%.2f,%.2f} pointInView{%.2f,%.2f} pointInside{%{BOOL}u}";
        v19 = v15;
        v20 = 68;
        goto LABEL_17;
      }
    }

    goto LABEL_15;
  }
  objc_msgSend(v7, "locationInView:", WeakRetained);
  v21 = objc_msgSend(WeakRetained, "pointInside:withEvent:", 0);
  LOBYTE(v14) = v21;
  if (self->_panGestureRecognizer == v6)
  {
    if (self->_pointerIsHoveringOverEdge)
      LOBYTE(v14) = 0;
    else
      LOBYTE(v14) = v21;
  }
  else if (self->_edgeResizeGestureRecognizer == v6)
  {
    if (self->_pointerIsHoveringOverEdge)
      LOBYTE(v14) = v21;
    else
      LOBYTE(v14) = 0;
  }
LABEL_15:

  return v14;
}

- (BOOL)_isInteractive
{
  return -[_UIHyperInteractor sbpip_isInteractive](self->_positionInteractor, "sbpip_isInteractive")
      || -[_UIHyperInteractor sbpip_isInteractive](self->_scaleInteractor, "sbpip_isInteractive")
      || -[_UIHyperInteractor sbpip_isInteractive](self->_rotationInteractor, "sbpip_isInteractive");
}

- (BOOL)_hasInFlightLayoutAnimations
{
  return self->_inFlightAnimatedLayouts != 0;
}

- (BOOL)_isSizeAffectedByLayoutReasons:(unint64_t)a3
{
  return (a3 & 0x119) != 0;
}

- (BOOL)_isGesturing
{
  return -[SBPIPInteractionController _isPanning](self, "_isPanning")
      || -[SBPIPInteractionController _isPinching](self, "_isPinching")
      || -[SBPIPInteractionController _isRotating](self, "_isRotating");
}

- (BOOL)_isPanning
{
  char v3;
  id WeakRetained;

  if (-[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_panGestureRecognizer)|| -[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_panWhileResizingGestureRecognizer)|| -[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_externalPanDrivingGestureRecognizer)|| -[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_edgeResizeGestureRecognizer))
  {
    return 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "interactionControllerIsExternalPanGestureRecognizing:", self);
  else
    v3 = 0;

  return v3;
}

- (BOOL)_isPinching
{
  return -[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_pinchGestureRecognizer)|| -[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_externalPanDrivingGestureRecognizer);
}

- (BOOL)_isRotating
{
  return -[SBPIPInteractionController _isGestureRecognizerRecognizing:](self, "_isGestureRecognizerRecognizing:", self->_rotationGestureRecognizer);
}

- (BOOL)_isGestureRecognizerRecognizing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 && objc_msgSend(v4, "state") >= 1 && objc_msgSend(v4, "state") < 3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIEdgeInsets)_inFlightHitTestPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[SBPIPInteractionSettings inFlightHitTestPadding](self->_interactionSettings, "inFlightHitTestPadding");
  v3 = -v2;
  v4 = v3;
  v5 = v3;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_cancelAllGestures
{
  -[SBPIPInteractionController _removeGestureRecognizers](self, "_removeGestureRecognizers");
  if (self->_enabled)
    -[SBPIPInteractionController _setupGestureRecognizers](self, "_setupGestureRecognizers");
}

- (CGPoint)edgeResizeAnchorPoint
{
  void *v3;
  void *v4;
  unint64_t pointerIsHoveringOverEdge;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  CGPoint result;

  -[SBPIPInteractionSettings edgeResizeSettings](self->_interactionSettings, "edgeResizeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorPointSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pointerIsHoveringOverEdge = self->_pointerIsHoveringOverEdge;
  v6 = -[SBPIPInteractionController canonicalPosition](self, "canonicalPosition");
  switch(pointerIsHoveringOverEdge)
  {
    case 1uLL:
      switch(v6)
      {
        case 0uLL:
          objc_msgSend(v4, "dockUpperLeftResizeTopEdgeAnchorPointX");
          v8 = v7;
          objc_msgSend(v4, "dockUpperLeftResizeTopEdgeAnchorPointY");
          goto LABEL_27;
        case 1uLL:
          objc_msgSend(v4, "dockLowerLeftResizeTopEdgeAnchorPointX");
          v8 = v14;
          objc_msgSend(v4, "dockLowerLeftResizeTopEdgeAnchorPointY");
          goto LABEL_27;
        case 2uLL:
          objc_msgSend(v4, "dockLowerRightResizeTopEdgeAnchorPointX");
          v8 = v15;
          objc_msgSend(v4, "dockLowerRightResizeTopEdgeAnchorPointY");
          goto LABEL_27;
        case 3uLL:
          objc_msgSend(v4, "dockUpperRightResizeTopEdgeAnchorPointX");
          v8 = v16;
          objc_msgSend(v4, "dockUpperRightResizeTopEdgeAnchorPointY");
          goto LABEL_27;
        default:
          goto LABEL_11;
      }
    case 2uLL:
      switch(v6)
      {
        case 0uLL:
          objc_msgSend(v4, "dockUpperLeftResizeBottomEdgeAnchorPointX");
          v8 = v11;
          objc_msgSend(v4, "dockUpperLeftResizeBottomEdgeAnchorPointY");
          goto LABEL_27;
        case 1uLL:
          objc_msgSend(v4, "dockLowerLeftResizeBottomEdgeAnchorPointX");
          v8 = v17;
          objc_msgSend(v4, "dockLowerLeftResizeBottomEdgeAnchorPointY");
          goto LABEL_27;
        case 2uLL:
          objc_msgSend(v4, "dockLowerRightResizeBottomEdgeAnchorPointX");
          v8 = v18;
          objc_msgSend(v4, "dockLowerRightResizeBottomEdgeAnchorPointY");
          goto LABEL_27;
        case 3uLL:
          objc_msgSend(v4, "dockUpperRightResizeBottomEdgeAnchorPointX");
          v8 = v19;
          objc_msgSend(v4, "dockUpperRightResizeBottomEdgeAnchorPointY");
          goto LABEL_27;
        default:
          goto LABEL_11;
      }
    case 3uLL:
      switch(v6)
      {
        case 0uLL:
          objc_msgSend(v4, "dockUpperLeftResizeLeftEdgeAnchorPointX");
          v8 = v12;
          objc_msgSend(v4, "dockUpperLeftResizeLeftEdgeAnchorPointY");
          goto LABEL_27;
        case 1uLL:
          objc_msgSend(v4, "dockLowerLeftResizeLeftEdgeAnchorPointX");
          v8 = v20;
          objc_msgSend(v4, "dockLowerLeftResizeLeftEdgeAnchorPointY");
          goto LABEL_27;
        case 2uLL:
          objc_msgSend(v4, "dockLowerRightResizeLeftEdgeAnchorPointX");
          v8 = v21;
          objc_msgSend(v4, "dockLowerRightResizeLeftEdgeAnchorPointY");
          goto LABEL_27;
        case 3uLL:
          objc_msgSend(v4, "dockUpperRightResizeLeftEdgeAnchorPointX");
          v8 = v22;
          objc_msgSend(v4, "dockUpperRightResizeLeftEdgeAnchorPointY");
          goto LABEL_27;
        default:
          goto LABEL_11;
      }
    case 4uLL:
      switch(v6)
      {
        case 0uLL:
          objc_msgSend(v4, "dockUpperLeftResizeRightEdgeAnchorPointX");
          v8 = v13;
          objc_msgSend(v4, "dockUpperLeftResizeRightEdgeAnchorPointY");
          break;
        case 1uLL:
          objc_msgSend(v4, "dockLowerLeftResizeRightEdgeAnchorPointX");
          v8 = v23;
          objc_msgSend(v4, "dockLowerLeftResizeRightEdgeAnchorPointY");
          break;
        case 2uLL:
          objc_msgSend(v4, "dockLowerRightResizeRightEdgeAnchorPointX");
          v8 = v24;
          objc_msgSend(v4, "dockLowerRightResizeRightEdgeAnchorPointY");
          break;
        case 3uLL:
          objc_msgSend(v4, "dockUpperRightResizeRightEdgeAnchorPointX");
          v8 = v25;
          objc_msgSend(v4, "dockUpperRightResizeRightEdgeAnchorPointY");
          break;
        default:
          goto LABEL_11;
      }
LABEL_27:
      v10 = v9;
      break;
    case 5uLL:
      v8 = 1.0;
      v10 = 1.0;
      break;
    case 6uLL:
      v10 = 1.0;
      v8 = 0.0;
      break;
    case 7uLL:
      v10 = 0.0;
      v8 = 1.0;
      break;
    case 8uLL:
      v8 = 0.0;
      v10 = 0.0;
      break;
    default:
LABEL_11:
      v8 = 0.5;
      v10 = 0.5;
      break;
  }

  v26 = v8;
  v27 = v10;
  result.y = v27;
  result.x = v26;
  return result;
}

- (void)recalculateScale:(double *)a3 baselineScale:(double *)a4 forTranslationInView:(CGPoint)a5
{
  double v5;
  double edgeResizeGestureBaselineWidth;
  double v7;
  double edgeResizeGestureBaselineHeight;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;

  v5 = 0.0;
  edgeResizeGestureBaselineWidth = self->_edgeResizeGestureBaselineWidth;
  v7 = edgeResizeGestureBaselineWidth - a5.x;
  switch(self->_pointerIsHoveringOverEdge)
  {
    case 1uLL:
      edgeResizeGestureBaselineHeight = self->_edgeResizeGestureBaselineHeight;
      v9 = edgeResizeGestureBaselineHeight - a5.y;
      goto LABEL_4;
    case 2uLL:
      edgeResizeGestureBaselineHeight = self->_edgeResizeGestureBaselineHeight;
      v9 = a5.y + edgeResizeGestureBaselineHeight;
LABEL_4:
      v5 = v9 / edgeResizeGestureBaselineHeight;
      edgeResizeGestureBaselineWidth = 0.0;
      break;
    case 3uLL:
      goto LABEL_9;
    case 4uLL:
      goto LABEL_12;
    case 5uLL:
      v10 = self->_edgeResizeGestureBaselineHeight;
      v11 = v10 - a5.y;
      goto LABEL_8;
    case 6uLL:
      v12 = self->_edgeResizeGestureBaselineHeight;
      v13 = v12 - a5.y;
      goto LABEL_11;
    case 7uLL:
      v10 = self->_edgeResizeGestureBaselineHeight;
      v11 = a5.y + v10;
LABEL_8:
      v5 = v11 / v10;
LABEL_9:
      edgeResizeGestureBaselineWidth = v7 / edgeResizeGestureBaselineWidth;
      break;
    case 8uLL:
      v12 = self->_edgeResizeGestureBaselineHeight;
      v13 = a5.y + v12;
LABEL_11:
      v5 = v13 / v12;
LABEL_12:
      edgeResizeGestureBaselineWidth = (a5.x + edgeResizeGestureBaselineWidth) / edgeResizeGestureBaselineWidth;
      break;
    default:
      break;
  }
  if (v5 <= edgeResizeGestureBaselineWidth)
    v14 = edgeResizeGestureBaselineWidth;
  else
    v14 = v5;
  v15 = 488;
  if (v5 > edgeResizeGestureBaselineWidth)
    v15 = 496;
  v16 = *(uint64_t *)((char *)&self->super.isa + v15);
  *a3 = fmax(v14, 0.0);
  *(_QWORD *)a4 = v16;
}

- (void)reloadInsets
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id to;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "interactionControllerConnectedWindowScenes:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "interactionController:stashedPaddingForWindowScene:", self, v9);
        if (-[SBPIPInteractionController _setStashedPadding:forScene:](self, "_setStashedPadding:forScene:", v9))
          v6 |= 0x40uLL;
        objc_msgSend(WeakRetained, "interactionController:edgeInsetsForWindowScene:", self, v9);
        if (-[SBPIPInteractionController _setEdgeInsets:forScene:](self, "_setEdgeInsets:forScene:", v9))
          v6 |= 4uLL;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);

    if (v6)
    {
      -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 0);
      if (self->_enabled)
      {
        if (!-[SBPIPInteractionController _isInteractive](self, "_isInteractive"))
        {
          -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 1);
          objc_initWeak(&location, self);
          objc_copyWeak(&to, (id *)&self->_delegate);
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __42__SBPIPInteractionController_reloadInsets__block_invoke;
          v10[3] = &unk_1E8EADD28;
          objc_copyWeak(&v11, &to);
          v12[1] = (id)v6;
          objc_copyWeak(v12, &location);
          -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:](self, "_setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:", 7, v6, 2, 0, v10);
          objc_destroyWeak(v12);
          objc_destroyWeak(&v11);
          objc_destroyWeak(&to);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
      }
    }
  }
  else
  {

  }
}

void __42__SBPIPInteractionController_reloadInsets__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (*(_BYTE *)(a1 + 48) & 4) != 0)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "interactionControllerDidUpdateEdgeInsets:", v2);

  }
}

- (void)_enumeratePositionRegionComposersUsingBlock:(id)a3
{
  -[SBPIPInteractionController _enumerateComposers:usingBlock:](self, "_enumerateComposers:usingBlock:", self->_positionRegionComposers, a3);
}

- (void)_enumerateComposers:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
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
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_enumerationMutation(v5);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_updatePositionRegionComposers
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBPIPInteractionController *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  SBPIPInteractionController *v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "defaultPositionHyperregionComposers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke;
  v12[3] = &unk_1E8EADD50;
  v13 = v4;
  v14 = self;
  v7 = v4;
  -[SBPIPInteractionController _enumeratePositionRegionComposersUsingBlock:](self, "_enumeratePositionRegionComposersUsingBlock:", v12);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_2;
  v11[3] = &unk_1E8EADD78;
  v11[4] = self;
  -[SBPIPInteractionController _enumerateComposers:usingBlock:](self, "_enumerateComposers:usingBlock:", v7, v11);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_3;
  v8[3] = &unk_1E8EADD50;
  v9 = WeakRetained;
  v10 = self;
  v6 = WeakRetained;
  -[SBPIPInteractionController _enumeratePositionRegionComposersUsingBlock:](self, "_enumeratePositionRegionComposersUsingBlock:", v8);
  -[SBPIPInteractionController reloadInsets](self, "reloadInsets");

}

void __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "positionRegionComposerDidInvalidate:", v3);

}

void __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addPositionRegionComposer:", v3);

}

void __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "interactionControllerConnectedWindowScenes:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConnectedWindowScenes:", v3);

  }
}

- (void)prepareForTransitionToWindowScene:(id)a3
{
  SBWindowScene *v4;
  _SBPIPInteractionControllerTransitionInfo *pendingTransition;
  _SBPIPInteractionControllerTransitionInfo *v6;
  _SBPIPInteractionControllerTransitionInfo *v7;
  SBWindowScene *v8;

  v4 = (SBWindowScene *)a3;
  if (self->_targetWindowScene != v4)
  {
    pendingTransition = self->_pendingTransition;
    v8 = v4;
    if (!pendingTransition)
    {
      v6 = objc_alloc_init(_SBPIPInteractionControllerTransitionInfo);
      v7 = self->_pendingTransition;
      self->_pendingTransition = v6;

      -[_SBPIPInteractionControllerTransitionInfo setLayoutCorner:](self->_pendingTransition, "setLayoutCorner:", -[SBPIPContentViewLayoutSettings currentContentViewPosition](self->_layoutSettings, "currentContentViewPosition"));
      pendingTransition = self->_pendingTransition;
    }
    -[_SBPIPInteractionControllerTransitionInfo setTargetWindowScene:](pendingTransition, "setTargetWindowScene:", v8);
    v4 = v8;
  }

}

- (void)finishTransitionToWindowScene:(id)a3
{
  _SBPIPInteractionControllerTransitionInfo *pendingTransition;

  -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 1, 1, 2);
  pendingTransition = self->_pendingTransition;
  self->_pendingTransition = 0;

}

- (void)reloadHyperregionComposerData
{
  -[SBPIPInteractionController _updatePositionRegionComposers](self, "_updatePositionRegionComposers");
  -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 1);
}

- (void)_updateTargetWindowSceneIfNeeded
{
  -[SBPIPInteractionController _updateTargetWindowSceneIfNeededUpdatingInteractors:](self, "_updateTargetWindowSceneIfNeededUpdatingInteractors:", 1);
}

- (void)_updateTargetWindowSceneIfNeededUpdatingInteractors:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  SBWindowScene **p_targetWindowScene;
  SBWindowScene *v10;
  _SBPIPInteractionControllerTransitionInfo *pendingTransition;
  SBWindowScene *v12;
  SBWindowScene *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat MinX;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat MinY;
  double v33;
  CGFloat MaxX;
  double v35;
  double v36;
  double v37;
  CGFloat MaxY;
  SBWindowScene *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  char v52;
  _BYTE v53[128];
  uint64_t v54;

  v3 = a3;
  v54 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v7, "interactionControllerConnectedWindowScenes:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  p_targetWindowScene = &self->_targetWindowScene;
  v10 = self->_targetWindowScene;
  pendingTransition = self->_pendingTransition;
  if (pendingTransition)
  {
    -[_SBPIPInteractionControllerTransitionInfo targetWindowScene](pendingTransition, "targetWindowScene");
    v12 = (SBWindowScene *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = v12;

    v10 = v13;
    goto LABEL_9;
  }
  -[SBPIPInteractionController _currentPositionInteractionStateContext](self, "_currentPositionInteractionStateContext");
  if (!v52 && v6)
  {
    v12 = v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_151);
    v12 = (SBWindowScene *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v41 = v3;
    v42 = v6;
    v51 = 0;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[SBPIPInteractionController _currentPositionInteractionStateContext](self, "_currentPositionInteractionStateContext");
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v40 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "isMainDisplayWindowScene", v40);
          v23 = v21;
          if (v22)
            v24 = v18;
          else
            v24 = v17;
          if (v22)
            v18 = v23;
          else
            v17 = v23;

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }

    objc_msgSend(v18, "_sbDisplayConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v42;
    v3 = v41;
    p_targetWindowScene = &self->_targetWindowScene;
    switch(SBSDisplayEdgeAdjacentToNeighboringDisplay())
    {
      case 0u:
        v26 = *((double *)&v49 + 1);
        MinX = CGRectGetMinX(self->_geometryContext.containerBounds);
        v28 = v17;
        if (v26 < MinX)
          goto LABEL_42;
        v29 = *((double *)&v49 + 1);
        v30 = CGRectGetMinX(self->_geometryContext.containerBounds);
        goto LABEL_35;
      case 1u:
        v31 = *(double *)&v50;
        MinY = CGRectGetMinY(self->_geometryContext.containerBounds);
        v28 = v17;
        if (v31 >= MinY)
        {
          v29 = *(double *)&v50;
          v30 = CGRectGetMinY(self->_geometryContext.containerBounds);
LABEL_35:
          v28 = v18;
          if (v29 <= v30)
            goto LABEL_43;
        }
        goto LABEL_42;
      case 2u:
        v33 = *((double *)&v49 + 1);
        MaxX = CGRectGetMaxX(self->_geometryContext.containerBounds);
        v28 = v17;
        if (v33 > MaxX)
          goto LABEL_42;
        v35 = *((double *)&v49 + 1);
        v36 = CGRectGetMaxX(self->_geometryContext.containerBounds);
        break;
      case 3u:
        v37 = *(double *)&v50;
        MaxY = CGRectGetMaxY(self->_geometryContext.containerBounds);
        v28 = v17;
        if (v37 > MaxY)
          goto LABEL_42;
        v35 = *(double *)&v50;
        v36 = CGRectGetMaxY(self->_geometryContext.containerBounds);
        break;
      default:
        v6 = v42;
        v3 = v41;
        v8 = v40;
        p_targetWindowScene = &self->_targetWindowScene;
        goto LABEL_44;
    }
    v28 = v18;
    if (v35 < v36)
    {
LABEL_42:
      v39 = v28;

      v10 = v39;
    }
LABEL_43:
    v8 = v40;
LABEL_44:

  }
LABEL_9:
  if (v10 != *p_targetWindowScene)
  {
    objc_storeStrong((id *)p_targetWindowScene, v10);
    if (v3)
      -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 0);
  }

}

uint64_t __82__SBPIPInteractionController__updateTargetWindowSceneIfNeededUpdatingInteractors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

- (void)_updateInteractorsAndCommit:(BOOL)a3
{
  _BOOL4 v3;
  _UIHyperInteractor *scaleInteractor;
  void *v6;
  void *v7;
  SBPIPContentViewLayoutSettings *layoutSettings;
  _UIHyperInteractor *rotationInteractor;
  void *v10;
  void *v11;
  unint64_t v12;
  _UIHyperInteractor *positionInteractor;
  void *v14;
  void *v15;
  BOOL v16;
  id WeakRetained;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  SBPIPPinchGestureRecognizer *pinchGestureRecognizer;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  double v34;
  double v35;
  __int128 v36;
  uint64_t v37;

  v3 = a3;
  v37 = 0;
  v36 = *MEMORY[0x1E0C9D538];
  scaleInteractor = self->_scaleInteractor;
  -[SBPIPInteractionController _scaleHyperregion](self, "_scaleHyperregion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInteractor _setRegion:](scaleInteractor, "_setRegion:", v6);

  if (v3)
  {
    -[_UIHyperInteractor _commitTranslation](self->_scaleInteractor, "_commitTranslation", 0);
    -[_UIHyperInteractor _region](self->_scaleInteractor, "_region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_closestPoint:toPoint:", &v34, -[_UIHyperInteractor _projectedPoint](self->_scaleInteractor, "_projectedPoint"));

    -[_UIHyperInteractor sbpip_setInteractive:](self->_scaleInteractor, "sbpip_setInteractive:", 0);
    -[_UIHyperInteractor _copyVelocity:](self->_scaleInteractor, "_copyVelocity:", &v37);
    -[_UIHyperInteractor _copyTranslation:](self->_scaleInteractor, "_copyTranslation:", &v37);
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_scaleInteractor, "_copyUnconstrainedPoint:", &v34);
    layoutSettings = self->_layoutSettings;
    -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:", 1024);
    -[SBPIPContentViewLayoutSettings setContentViewSize:](layoutSettings, "setContentViewSize:");
  }
  rotationInteractor = self->_rotationInteractor;
  -[SBPIPInteractionController _rotationHyperregion](self, "_rotationHyperregion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInteractor _setRegion:](rotationInteractor, "_setRegion:", v10);

  if (v3)
  {
    -[_UIHyperInteractor _region](self->_rotationInteractor, "_region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperInteractor _commitTranslation](self->_rotationInteractor, "_commitTranslation");
    -[_UIHyperInteractor sbpip_setInteractive:](self->_rotationInteractor, "sbpip_setInteractive:", 0);
    -[_UIHyperInteractor _copyVelocity:](self->_rotationInteractor, "_copyVelocity:", &v37);
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_rotationInteractor, "_copyUnconstrainedPoint:", objc_msgSend(v11, "_value"));

  }
  -[SBPIPInteractionController _updateTargetWindowSceneIfNeededUpdatingInteractors:](self, "_updateTargetWindowSceneIfNeededUpdatingInteractors:", 0);
  v12 = -[SBPIPInteractionController canonicalPosition](self, "canonicalPosition");
  positionInteractor = self->_positionInteractor;
  -[SBPIPInteractionController positionHyperregion](self, "positionHyperregion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInteractor _setRegion:](positionInteractor, "_setRegion:", v14);

  -[SBPIPInteractionController _updateHyperregionVisualizationIfNecessary](self, "_updateHyperregionVisualizationIfNecessary");
  if (v3)
  {
    -[_UIHyperInteractor _region](self->_positionInteractor, "_region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperInteractor _commitTranslation](self->_positionInteractor, "_commitTranslation");
    v34 = 0.0;
    v35 = 0.0;
    v16 = -[_UIHyperInteractor sbpip_isInteractive](self->_positionInteractor, "sbpip_isInteractive");
    if (!self->_pendingTransition)
      goto LABEL_31;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(WeakRetained, "_sbWindowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBPIPInteractionControllerTransitionInfo targetWindowScene](self->_pendingTransition, "targetWindowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != v19)
    {
LABEL_31:
      if (BSSettingFlagIsExplicitNo())
      {
        -[SBPIPInteractionController _closestToDefaultCornersPosition](self, "_closestToDefaultCornersPosition");
        v34 = v20;
        v35 = v21;
        self->_didLastSettleInStashedState = 0;
LABEL_28:
        self->_shouldStash = 0x7FFFFFFFFFFFFFFFLL;
        -[_UIHyperInteractor _copyVelocity:](self->_positionInteractor, "_copyVelocity:", &v36, *(_QWORD *)&v34, *(_QWORD *)&v35);
        -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_positionInteractor, "_copyUnconstrainedPoint:", &v34);
        -[_UIHyperInteractor sbpip_setInteractive:](self->_positionInteractor, "sbpip_setInteractive:", 0);
        self->_threeTouchesPanDetected = 0;

        return;
      }
      if (v16)
      {
        v22 = -[_UIHyperInteractor _projectedPoint](self->_positionInteractor, "_projectedPoint");
LABEL_16:
        v23 = objc_msgSend(v15, "_regionIndexForClosestPoint:toPoint:", &v34, v22);
        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          SBLogPIP();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[SBPIPInteractionController _updateInteractorsAndCommit:].cold.1();
        }
        else
        {
          v27 = v23;
          objc_msgSend(v15, "_regions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndex:", v27);
          v24 = objc_claimAutoreleasedReturnValue();

          self->_didLastSettleInStashedState = -[SBPIPInteractionController _regionIsStashedOne:](self, "_regionIsStashedOne:", v24);
        }

        pinchGestureRecognizer = self->_pinchGestureRecognizer;
        v30 = !self->_didLastSettleInStashedState
           && -[SBPIPInteractionSettings pinchGestureEnabled](self->_interactionSettings, "pinchGestureEnabled");
        -[SBPIPPinchGestureRecognizer setEnabled:](pinchGestureRecognizer, "setEnabled:", v30);
        v31 = -[SBPIPInteractionController _canonicalPositionForPoint:](self, "_canonicalPositionForPoint:", v34, v35);
        v32 = v31;
        if (self->_didLastSettleInStashedState && v12 != v31)
        {
          v33 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v33, "interactionController:wantsStashTabHidden:left:", self, 0, (v32 & 0xFFFFFFFFFFFFFFFELL) == 2);

        }
        -[SBPIPContentViewLayoutSettings setContentViewPosition:](self->_layoutSettings, "setContentViewPosition:", v32);
        goto LABEL_28;
      }
      if (self->_didLastSettleInStashedState
        || (BSSettingFlagIsYes() & 1) != 0
        || -[SBPIPInteractionSettings freePositioning](self->_interactionSettings, "freePositioning") == 2)
      {
        v22 = -[_UIHyperInteractor _constrainedPoint](self->_positionInteractor, "_constrainedPoint");
        goto LABEL_16;
      }
    }
    -[SBPIPInteractionController _closestToDefaultCornersPosition](self, "_closestToDefaultCornersPosition");
    v34 = v25;
    v35 = v26;
    goto LABEL_28;
  }
}

- (id)_scaleHyperregion
{
  double v3;
  double v4;
  double width;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  _QWORD v14[5];
  _QWORD v15[5];

  -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](self->_layoutSettings, "minimumPossibleContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
  v4 = v3;
  -[SBPIPContentViewLayoutSettings maximumPossibleContentViewSizeForAspectRatio:](self->_layoutSettings, "maximumPossibleContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
  width = self->_preferredContentSize.width;
  v6 = v4 / width;
  v8 = v7 / width;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD60]), "initWithDimensions:", 1);
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__SBPIPInteractionController__scaleHyperregion__block_invoke;
  v15[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v15[4] = v6;
  objc_msgSend(v9, "_mutateMinimumPoint:", v15);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __47__SBPIPInteractionController__scaleHyperregion__block_invoke_2;
  v14[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v14[4] = v8;
  objc_msgSend(v9, "_mutateMaximumPoint:", v14);
  -[_UIHyperInteractor _extender](self->_scaleInteractor, "_extender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPInteractionSettings scaleExtenderMaximumDistance](self->_interactionSettings, "scaleExtenderMaximumDistance");
  objc_msgSend(v11, "_setMaximumDistance:", fmax((v8 - v6) * v12, 0.0));

  return v9;
}

double __47__SBPIPInteractionController__scaleHyperregion__block_invoke(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __47__SBPIPInteractionController__scaleHyperregion__block_invoke_2(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

- (id)_rotationHyperregion
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD58]), "initWithDimensions:", 1);
}

- (id)positionHyperregion
{
  id WeakRetained;
  void *v4;
  char v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize size;
  __int128 v10;
  __int128 v11;
  CGPoint pipAnchorPointOffset;
  CGPoint origin;
  CGSize pipLastSteadySize;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[4];
  uint64_t v29;
  _OWORD v30[13];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[SBPIPInteractionController _hasValidInteractionTargetView](self, "_hasValidInteractionTargetView"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(WeakRetained, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMainDisplayWindowScene");

    if ((v5 & 1) == 0)
      -[SBPIPInteractionController _updateGeometryContextBoundsUsingMainDisplayWindowScene](self, "_updateGeometryContextBoundsUsingMainDisplayWindowScene");
    -[SBPIPInteractionController _updatePIPSizeGeometryContext](self, "_updatePIPSizeGeometryContext");
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[SBPIPInteractionController _currentPositionInteractionStateContext](self, "_currentPositionInteractionStateContext");
    v6 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
    v7 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
    v8 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
    v30[10] = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
    v30[11] = v7;
    v30[12] = v8;
    size = self->_geometryContext.containerBounds.size;
    v10 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
    v11 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
    v30[6] = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
    v30[7] = v10;
    v30[8] = v11;
    v30[9] = v6;
    pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
    origin = self->_geometryContext.containerBounds.origin;
    v30[2] = self->_geometryContext.pipStashedSize;
    v30[3] = pipAnchorPointOffset;
    pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
    v30[4] = origin;
    v30[5] = size;
    v30[0] = self->_geometryContext.pipCurrentSize;
    v30[1] = pipLastSteadySize;
    v28[2] = v33;
    v28[3] = v34;
    v29 = v35;
    v28[0] = v31;
    v28[1] = v32;
    -[SBPIPInteractionController _updateResolvedPositionHyperRegionsMapWithGeometry:interactionState:](self, "_updateResolvedPositionHyperRegionsMapWithGeometry:interactionState:", v30, v28);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSDictionary allValues](self->_resolvedPositionRegionsMap, "allValues", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "_regions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v19);
    }

    objc_msgSend(v16, "_setRegions:", v15);
  }
  else
  {
    -[_UIHyperInteractor _region](self->_positionInteractor, "_region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (void)_updatePIPSizeGeometryContext
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  -[SBPIPInteractionController _lastSteadySize](self, "_lastSteadySize");
  self->_geometryContext.pipLastSteadySize.width = v3;
  self->_geometryContext.pipLastSteadySize.height = v4;
  -[SBPIPInteractionController _currentSizeForLayoutReason:](self, "_currentSizeForLayoutReason:", 1024);
  v6 = v5;
  self->_geometryContext.pipCurrentSize.width = v5;
  self->_geometryContext.pipCurrentSize.height = v7;
  -[SBPIPContentViewLayoutSettings minimumStashedTabSize](self->_layoutSettings, "minimumStashedTabSize");
  self->_geometryContext.pipStashedSize.width = v6;
  self->_geometryContext.pipStashedSize.height = v8;
}

- (void)_updateGeometryContextBoundsUsingMainDisplayWindowScene
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "interactionControllerConnectedWindowScenes:", self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isMainDisplayWindowScene"))
        {
          v10 = objc_msgSend(v9, "interfaceOrientation");
          objc_msgSend(v9, "_boundsForInterfaceOrientation:", v10);
          -[SBPIPInteractionController _updateGeometryContextUsingTargetViewBounds:orientation:](self, "_updateGeometryContextUsingTargetViewBounds:orientation:", v10);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)_updateGeometryContextUsingTargetViewBounds:(CGRect)a3 orientation:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t orientation;
  BOOL v10;
  NSObject *v12;
  NSObject *v13;
  NSString *shortDescription;
  int64_t v16;
  _BOOL4 enabled;
  NSString *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  int v22;
  NSString *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  orientation = self->_geometryContext.orientation;
  v10 = orientation != a4;
  if (orientation != a4)
  {
    SBLogPIP();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      v16 = self->_geometryContext.orientation;
      enabled = self->_enabled;
      v22 = 138544130;
      v23 = shortDescription;
      v24 = 2048;
      v25 = v16;
      v26 = 2048;
      v27 = a4;
      v28 = 1024;
      v29 = enabled;
      _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating orientation: old{%ld} new{%ld} while enabled{%{BOOL}u}", (uint8_t *)&v22, 0x26u);
    }

    self->_geometryContext.orientation = a4;
  }
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (!CGRectEqualToRect(self->_geometryContext.containerBounds, v32))
  {
    SBLogPIP();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = self->_shortDescription;
      NSStringFromCGRect(self->_geometryContext.containerBounds);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      NSStringFromCGRect(v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_enabled;
      v22 = 138544130;
      v23 = v18;
      v24 = 2114;
      v25 = (int64_t)v19;
      v26 = 2114;
      v27 = (int64_t)v20;
      v28 = 1024;
      v29 = v21;
      _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating container bounds: old{%{public}@ new{%{public}@} while enabled{%{BOOL}u}", (uint8_t *)&v22, 0x26u);

    }
    self->_geometryContext.containerBounds.origin.x = x;
    self->_geometryContext.containerBounds.origin.y = y;
    v10 = 1;
    self->_geometryContext.containerBounds.size.width = width;
    self->_geometryContext.containerBounds.size.height = height;
  }
  return v10;
}

- (SBPIPPositionInteractionStateContext)_currentPositionInteractionStateContext
{
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  SBPIPPositionInteractionStateContext *result;
  double v13;

  retstr->projectedPositionStashProgress = 0.0;
  *(_OWORD *)&retstr->initialPosition.y = 0u;
  *(_OWORD *)&retstr->currentPosition.y = 0u;
  *(_OWORD *)&retstr->isStashed = 0u;
  *(_OWORD *)&retstr->projectedPosition.y = 0u;
  retstr->isStashed = -[SBPIPInteractionController isStashed](self, "isStashed");
  retstr->isInteractive = -[_UIHyperInteractor sbpip_isInteractive](self->_positionInteractor, "sbpip_isInteractive");
  retstr->hasActiveGesture = -[SBPIPInteractionController _isGesturing](self, "_isGesturing");
  retstr->isFreelyPositionable = -[SBPIPInteractionSettings freePositioning](self->_interactionSettings, "freePositioning") != 0;
  v5 = *(double *)-[_UIHyperInteractor _projectedPoint](self->_positionInteractor, "_projectedPoint");
  v6 = *(double *)(-[_UIHyperInteractor _projectedPoint](self->_positionInteractor, "_projectedPoint") + 8);
  retstr->projectedPosition.x = v5;
  retstr->projectedPosition.y = v6;
  v7 = *(double *)-[_UIHyperInteractor _unconstrainedPoint](self->_positionInteractor, "_unconstrainedPoint");
  v8 = *(double *)(-[_UIHyperInteractor _unconstrainedPoint](self->_positionInteractor, "_unconstrainedPoint") + 8);
  retstr->initialPosition.x = v7;
  retstr->initialPosition.y = v8;
  -[SBPIPInteractionController _currentPosition](self, "_currentPosition");
  retstr->currentPosition.x = v9;
  retstr->currentPosition.y = v10;
  retstr->currentPositionStashProgress = 0.0;
  retstr->projectedPositionStashProgress = 0.0;
  -[SBPIPInteractionController _stashProgressForPosition:](self, "_stashProgressForPosition:");
  retstr->currentPositionStashProgress = v11;
  result = (SBPIPPositionInteractionStateContext *)-[SBPIPInteractionController _stashProgressForPosition:](self, "_stashProgressForPosition:", v5, v6);
  retstr->projectedPositionStashProgress = v13;
  return result;
}

- (void)_updateResolvedPositionHyperRegionsMapWithGeometry:(SBPIPPositionGeometryContext *)a3 interactionState:(SBPIPPositionInteractionStateContext *)a4
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v21;
  __int128 v22;
  NSDictionary *resolvedPositionRegionsMap;
  NSDictionary *v24;
  _UIHyperregionUnion *v25;
  _UIHyperregionUnion *stashedLeftRegion;
  _UIHyperregionUnion *v27;
  _UIHyperregionUnion *stashedRightRegion;
  _OWORD v29[4];
  double projectedPositionStashProgress;
  _OWORD v31[13];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = self->_positionRegionComposers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v33;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        v15 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
        v31[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
        v31[11] = v15;
        v31[12] = *(_OWORD *)&a3->offscreenCorners;
        v16 = *(_OWORD *)&a3->edgeInsets.bottom;
        v31[6] = *(_OWORD *)&a3->edgeInsets.top;
        v31[7] = v16;
        v17 = *(_OWORD *)&a3->minimumPadding.bottom;
        v31[8] = *(_OWORD *)&a3->minimumPadding.top;
        v31[9] = v17;
        pipAnchorPointOffset = a3->pipAnchorPointOffset;
        v31[2] = a3->pipStashedSize;
        v31[3] = pipAnchorPointOffset;
        size = a3->containerBounds.size;
        v31[4] = a3->containerBounds.origin;
        v31[5] = size;
        pipLastSteadySize = a3->pipLastSteadySize;
        v31[0] = a3->pipCurrentSize;
        v31[1] = pipLastSteadySize;
        v21 = *(_OWORD *)&a4->currentPosition.y;
        v29[2] = *(_OWORD *)&a4->initialPosition.y;
        v29[3] = v21;
        projectedPositionStashProgress = a4->projectedPositionStashProgress;
        v22 = *(_OWORD *)&a4->projectedPosition.y;
        v29[0] = *(_OWORD *)&a4->isStashed;
        v29[1] = v22;
        objc_msgSend(v14, "positionRegionsForRegions:geometry:interaction:", v13, v31, v29);
        v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  resolvedPositionRegionsMap = self->_resolvedPositionRegionsMap;
  self->_resolvedPositionRegionsMap = v10;
  v24 = v10;

  -[NSDictionary objectForKey:](v24, "objectForKey:", &unk_1E91D0D88);
  v25 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
  stashedLeftRegion = self->_stashedLeftRegion;
  self->_stashedLeftRegion = v25;

  -[NSDictionary objectForKey:](v24, "objectForKey:", &unk_1E91D0DA0);
  v27 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
  stashedRightRegion = self->_stashedRightRegion;
  self->_stashedRightRegion = v27;

}

- (void)_updateHyperregionVisualizationIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  SBPIPInteractionControllerVisualizationView *positionRegionVisualizationView;
  SBPIPInteractionControllerVisualizationView *v7;
  SBPIPInteractionControllerVisualizationView *v8;
  id WeakRetained;
  void *v10;
  SBPIPInteractionControllerVisualizationView *v11;
  void *v12;
  SBPIPInteractionControllerVisualizationView *v13;
  SBPIPPositionGeometryContext *p_geometryContext;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGSize size;
  __int128 v19;
  __int128 v20;
  CGPoint pipAnchorPointOffset;
  CGPoint origin;
  CGSize pipLastSteadySize;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  SBPIPInteractionControllerVisualizationView *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGPoint v35;
  CGSize v36;
  CGSize v37;
  SBPIPInteractionControllerVisualizationView *v38;
  SBPIPInteractionControllerVisualizationView *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGPoint v44;
  CGSize v45;
  CGSize v46;
  SBPIPInteractionControllerVisualizationView *v47;
  SBPIPInteractionControllerVisualizationView *v48;
  _BYTE v49[72];
  _BYTE v50[208];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGSize pipCurrentSize;
  CGSize v56;
  CGSize pipStashedSize;
  CGPoint v58;
  CGPoint v59;
  CGSize v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "visualizePositionRegions");

  positionRegionVisualizationView = self->_positionRegionVisualizationView;
  if (v5)
  {
    if (!positionRegionVisualizationView)
    {
      v7 = objc_alloc_init(SBPIPInteractionControllerVisualizationView);
      v8 = self->_positionRegionVisualizationView;
      self->_positionRegionVisualizationView = v7;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(WeakRetained, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addSubview:", self->_positionRegionVisualizationView);
    v11 = self->_positionRegionVisualizationView;
    -[_UIHyperInteractor _region](self->_positionInteractor, "_region");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPInteractionControllerVisualizationView setRegionUnion:](v11, "setRegionUnion:", v12);

    v13 = self->_positionRegionVisualizationView;
    p_geometryContext = &self->_geometryContext;
    v15 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
    v16 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
    v17 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
    v65 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
    v66 = v16;
    v67 = v17;
    size = self->_geometryContext.containerBounds.size;
    v19 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
    v20 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
    v61 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
    v62 = v19;
    v63 = v20;
    v64 = v15;
    pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
    origin = self->_geometryContext.containerBounds.origin;
    pipStashedSize = self->_geometryContext.pipStashedSize;
    v58 = pipAnchorPointOffset;
    pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
    v59 = origin;
    v60 = size;
    pipCurrentSize = self->_geometryContext.pipCurrentSize;
    v56 = pipLastSteadySize;
    -[SBPIPInteractionControllerVisualizationView setMainGeometryContext:](v13, "setMainGeometryContext:", &pipCurrentSize);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v24 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v24, "interactionControllerConnectedWindowScenes:", self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v52 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if ((objc_msgSend(v30, "isMainDisplayWindowScene") & 1) == 0)
          {
            v39 = self->_positionRegionVisualizationView;
            -[NSMutableArray firstObject](self->_positionRegionComposers, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
            v65 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
            v66 = v41;
            v67 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
            v42 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
            v61 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
            v62 = v42;
            v43 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
            v63 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
            v64 = v43;
            v44 = self->_geometryContext.pipAnchorPointOffset;
            pipStashedSize = self->_geometryContext.pipStashedSize;
            v58 = v44;
            v45 = self->_geometryContext.containerBounds.size;
            v59 = self->_geometryContext.containerBounds.origin;
            v60 = v45;
            v46 = self->_geometryContext.pipLastSteadySize;
            pipCurrentSize = p_geometryContext->pipCurrentSize;
            v56 = v46;
            -[SBPIPInteractionController regionComposer:transformGeometryContext:toWindowScene:](self, "regionComposer:transformGeometryContext:toWindowScene:", v40, &pipCurrentSize, v30);
            -[SBPIPInteractionControllerVisualizationView setExtendedGeometryContext:](v39, "setExtendedGeometryContext:", v50);

            goto LABEL_16;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        if (v27)
          continue;
        break;
      }
    }

    v31 = self->_positionRegionVisualizationView;
    v32 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
    v65 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
    v66 = v32;
    v67 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
    v33 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
    v61 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
    v62 = v33;
    v34 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
    v63 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
    v64 = v34;
    v35 = self->_geometryContext.pipAnchorPointOffset;
    pipStashedSize = self->_geometryContext.pipStashedSize;
    v58 = v35;
    v36 = self->_geometryContext.containerBounds.size;
    v59 = self->_geometryContext.containerBounds.origin;
    v60 = v36;
    v37 = self->_geometryContext.pipLastSteadySize;
    pipCurrentSize = p_geometryContext->pipCurrentSize;
    v56 = v37;
    -[SBPIPInteractionControllerVisualizationView setExtendedGeometryContext:](v31, "setExtendedGeometryContext:", &pipCurrentSize);
LABEL_16:
    v47 = self->_positionRegionVisualizationView;
    -[SBPIPInteractionController _currentPositionInteractionStateContext](self, "_currentPositionInteractionStateContext");
    -[SBPIPInteractionControllerVisualizationView setInteractionContext:](v47, "setInteractionContext:", v49);
    v48 = self->_positionRegionVisualizationView;
    objc_msgSend(v10, "bounds");
    -[SBPIPInteractionControllerVisualizationView setFrame:](v48, "setFrame:");
    -[SBPIPInteractionControllerVisualizationView setNeedsLayout](self->_positionRegionVisualizationView, "setNeedsLayout");
    -[SBPIPInteractionControllerVisualizationView layoutIfNeeded](self->_positionRegionVisualizationView, "layoutIfNeeded");

  }
  else if (positionRegionVisualizationView)
  {
    -[SBPIPInteractionControllerVisualizationView removeFromSuperview](positionRegionVisualizationView, "removeFromSuperview");
    v38 = self->_positionRegionVisualizationView;
    self->_positionRegionVisualizationView = 0;

  }
}

- (BOOL)_regionIsStashedOne:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  v4 = a3;
  -[_UIHyperregionUnion _regions](self->_stashedLeftRegion, "_regions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[_UIHyperregionUnion _regions](self->_stashedRightRegion, "_regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v4);

  }
  return v7;
}

- (void)addPositionRegionComposer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 2285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("positionRegionComposer"));

    v5 = 0;
  }
  if ((-[NSMutableArray containsObject:](self->_positionRegionComposers, "containsObject:", v5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 2290, CFSTR("[%@] already added to this interaction controller [%@]"), v8, self->_shortDescription);

  }
  else
  {
    -[NSMutableArray addObject:](self->_positionRegionComposers, "addObject:", v8);
    objc_msgSend(v8, "setDelegate:", self);
  }

}

- (void)positionRegionComposerDidInvalidate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 2295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("positionRegionComposer"));

  }
  if (-[NSMutableArray containsObject:](self->_positionRegionComposers, "containsObject:", v5))
  {
    -[NSMutableArray removeObject:](self->_positionRegionComposers, "removeObject:", v5);
    objc_msgSend(v5, "setDelegate:", 0);
    SBLogPIP();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = (id)objc_opt_class();
      v14 = 2048;
      v15 = v5;
      v8 = v13;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@][Hyper] invalidated: %{public}@(%p)", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 2301, CFSTR("[%@] already removed from this interaction controller [%@]"), v5, self->_shortDescription);
  }

}

- (void)positionRegionComposerNeedsUpdate:(id)a3 behavior:(int)a4
{
  uint64_t v4;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 2306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionComposer"));

  }
  if ((-[NSMutableArray containsObject:](self->_positionRegionComposers, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPInteractionController.m"), 2307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_positionRegionComposers containsObject:regionComposer]"));

  }
  -[SBPIPInteractionController _updateInteractorsAndCommit:](self, "_updateInteractorsAndCommit:", 0);
  if (-[SBPIPInteractionController isEnabled](self, "isEnabled"))
  {
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:](self, "_setNeedsLayoutForTraits:withReason:behavior:", 1, 0x4000, v4);
    SBLogPIP();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = (id)objc_opt_class();
      v18 = 2048;
      v19 = v7;
      v10 = v17;
      v11 = "[%{public}@][Hyper] enabled; needsUpdate: %{public}@(%p)";
LABEL_10:
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x20u);

    }
  }
  else
  {
    -[SBPIPInteractionController _setupForInitialFrame](self, "_setupForInitialFrame");
    SBLogPIP();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = (id)objc_opt_class();
      v18 = 2048;
      v19 = v7;
      v10 = v17;
      v11 = "[%{public}@][Hyper] disabled; needsUpdate: %{public}@(%p)";
      goto LABEL_10;
    }
  }

}

- (SBPIPPositionGeometryContext)regionComposer:(SEL)a3 transformGeometryContext:(id)a4 toWindowScene:(SBPIPPositionGeometryContext *)a5
{
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  SBPIPPositionGeometryContext *result;
  CGAffineTransform v36;
  CGRect v37;

  v10 = a4;
  v11 = a6;
  v12 = v11;
  v13 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  *(_OWORD *)&retstr->stashedMinimumPadding.top = *(_OWORD *)&a5->stashedMinimumPadding.top;
  *(_OWORD *)&retstr->stashedMinimumPadding.bottom = v13;
  *(_OWORD *)&retstr->offscreenCorners = *(_OWORD *)&a5->offscreenCorners;
  v14 = *(_OWORD *)&a5->edgeInsets.bottom;
  *(_OWORD *)&retstr->edgeInsets.top = *(_OWORD *)&a5->edgeInsets.top;
  *(_OWORD *)&retstr->edgeInsets.bottom = v14;
  v15 = *(_OWORD *)&a5->minimumPadding.bottom;
  *(_OWORD *)&retstr->minimumPadding.top = *(_OWORD *)&a5->minimumPadding.top;
  *(_OWORD *)&retstr->minimumPadding.bottom = v15;
  pipAnchorPointOffset = a5->pipAnchorPointOffset;
  retstr->pipStashedSize = a5->pipStashedSize;
  retstr->pipAnchorPointOffset = pipAnchorPointOffset;
  size = a5->containerBounds.size;
  retstr->containerBounds.origin = a5->containerBounds.origin;
  retstr->containerBounds.size = size;
  pipLastSteadySize = a5->pipLastSteadySize;
  retstr->pipCurrentSize = a5->pipCurrentSize;
  retstr->pipLastSteadySize = pipLastSteadySize;
  if (v11 && (objc_msgSend(v11, "isMainDisplayWindowScene") & 1) == 0)
  {
    objc_msgSend(v12, "_boundsForInterfaceOrientation:", objc_msgSend(v12, "interfaceOrientation"));
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[SBPIPInteractionController _transformToDisplayArrangementSpaceFromWindowScene:](self, "_transformToDisplayArrangementSpaceFromWindowScene:", v12);
    v37.origin.x = v20;
    v37.origin.y = v22;
    v37.size.width = v24;
    v37.size.height = v26;
    retstr->containerBounds = CGRectApplyAffineTransform(v37, &v36);
    retstr->orientation = objc_msgSend(v12, "interfaceOrientation");
  }
  -[SBPIPInteractionController _cachedEdgeInsetsForScene:](self, "_cachedEdgeInsetsForScene:", v12);
  retstr->edgeInsets.top = v27;
  retstr->edgeInsets.left = v28;
  retstr->edgeInsets.bottom = v29;
  retstr->edgeInsets.right = v30;
  -[SBPIPInteractionController _cachedStashedPaddingForScene:](self, "_cachedStashedPaddingForScene:", v12);
  retstr->stashedMinimumPadding.top = v31;
  retstr->stashedMinimumPadding.left = v32;
  retstr->stashedMinimumPadding.bottom = v33;
  retstr->stashedMinimumPadding.right = v34;

  return result;
}

- (id)targetWindowSceneForRegionComposer:(id)a3
{
  -[SBPIPInteractionController _updateTargetWindowSceneIfNeededUpdatingInteractors:](self, "_updateTargetWindowSceneIfNeededUpdatingInteractors:", 0);
  return self->_targetWindowScene;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *WeakRetained;
  void *v20;
  void *v21;
  char v22;
  id v23;
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
  uint64_t v36;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fixedCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromView:", v8, x, y);
  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v11);
  v14 = v13;
  v16 = v15;

  if (-[SBPIPInteractionController isStashed](self, "isStashed") || self->_pendingTransition)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!objc_msgSend(WeakRetained, "shouldPointerInteractionBeginForInteractionController:atLocation:inView:", self, v8, x, y))
  {
    v17 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)SBApp, "bannerManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sbWindowScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "pointInsideBanner:inWindowScene:", v21, v14, v16);

  if ((v22 & 1) == 0)
  {
    v23 = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    objc_msgSend(v23, "frame");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[SBPIPInteractionSettings edgeResizeSettings](self->_interactionSettings, "edgeResizeSettings");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "liveResizePointerInteractionRegionInnerLength");
    v33 = v32;
    objc_msgSend(WeakRetained, "liveResizePointerInteractionRegionOuterLength");
    v35 = v34;
    objc_msgSend(WeakRetained, "liveResizePointerInteractionRegionCornerLength");
    v17 = +[SBEdgeResizeSystemPointerInteractionHelper shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:](SBEdgeResizeSystemPointerInteractionHelper, "shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:", 0, &self->_hoveringOverEdge, &self->_pointerRegion, x, y, v25, v27, v29, v31, v33, v35, v36);
LABEL_9:

    goto LABEL_4;
  }
LABEL_3:
  v17 = 0;
LABEL_4:

  return v17;
}

- (void)pointerWillExitRegion
{
  id WeakRetained;
  uint64_t v4;
  CGSize v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "_setTouchInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));

  v4 = MEMORY[0x1E0C9D648];
  -[UIView setFrame:](self->_pointerHitTestBlocker, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = *(CGSize *)(v4 + 16);
  self->_pointerRegion.origin = *(CGPoint *)v4;
  self->_pointerRegion.size = v5;
  self->_pointerIsHoveringOverEdge = 0;
  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "interactionControllerDidEndEdgeResizing:", self);

}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[SBPIPInteractionSettings edgeResizeSettings](self->_interactionSettings, "edgeResizeSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveResizePointerInteractionRegionOuterLength");
  UIEdgeInsetsMakeWithEdges();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CEA870];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionWithRect:identifier:", v7, self->_pointerRegion.origin.x, self->_pointerRegion.origin.y, self->_pointerRegion.size.width, self->_pointerRegion.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLatchingAxes:", +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:](SBEdgeResizeSystemPointerInteractionHelper, "latchingAxesForHoveredEdge:", self->_hoveringOverEdge));
  return v8;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  SBPIPInteractionSettings *interactionSettings;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  UIView *pointerHitTestBlocker;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  unint64_t hoveringOverEdge;
  double v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  void *v28;

  interactionSettings = self->_interactionSettings;
  v6 = a3;
  -[SBPIPInteractionSettings edgeResizeSettings](interactionSettings, "edgeResizeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_pointerIsHoveringOverEdge && self->_hoveringOverEdge)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "interactionControllerDidBeginEdgeResizing:", self);

  }
  self->_pointerIsHoveringOverEdge = self->_hoveringOverEdge;
  v9 = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(v7, "liveResizePointerInteractionRegionOuterLength");
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v9, "_setTouchInsets:");

  pointerHitTestBlocker = self->_pointerHitTestBlocker;
  objc_msgSend(v6, "rect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[UIView setFrame:](pointerHitTestBlocker, "setFrame:", v12, v14, v16, v18);
  v19 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v19, "currentCornerRadiusForInteractionController:", self);
  v21 = v20;

  hoveringOverEdge = self->_hoveringOverEdge;
  objc_msgSend(v7, "liveResizePointerInteractionRegionInnerLength");
  v24 = v23;
  objc_msgSend(v7, "liveResizePointerInteractionRegionOuterLength");
  +[SBEdgeResizeSystemPointerInteractionHelper fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:](SBEdgeResizeSystemPointerInteractionHelper, "fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:", hoveringOverEdge, v24, v25, v21, v21, v21, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:](SBEdgeResizeSystemPointerInteractionHelper, "latchingAxesForHoveredEdge:", self->_hoveringOverEdge);
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithShape:constrainedAxes:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (SBPIPInteractionControllerDataSource)dataSource
{
  return (SBPIPInteractionControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (double)preferredScale
{
  return self->_preferredScale;
}

- (CGRect)nonoperationalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_nonoperationalFrame.origin.x;
  y = self->_nonoperationalFrame.origin.y;
  width = self->_nonoperationalFrame.size.width;
  height = self->_nonoperationalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (UIView)targetOverlayView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetOverlayView);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetOverlayView);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pendingTransition, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifierToStashedPadding, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifierToEdgeInsets, 0);
  objc_storeStrong((id *)&self->_targetWindowScene, 0);
  objc_storeStrong((id *)&self->_positionRegionVisualizationView, 0);
  objc_storeStrong((id *)&self->_pointerHitTestBlocker, 0);
  objc_storeStrong((id *)&self->_layoutSettings, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong(&self->_pendingInteractionCompletion, 0);
  objc_storeStrong((id *)&self->_scaleInteractor, 0);
  objc_storeStrong((id *)&self->_rotationInteractor, 0);
  objc_storeStrong((id *)&self->_positionInteractor, 0);
  objc_storeStrong((id *)&self->_stashedRightRegion, 0);
  objc_storeStrong((id *)&self->_stashedLeftRegion, 0);
  objc_storeStrong((id *)&self->_positionRegionComposers, 0);
  objc_storeStrong((id *)&self->_resolvedPositionRegionsMap, 0);
  objc_storeStrong((id *)&self->_panWhileResizingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_externalPanDrivingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_edgeResizeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_layoutProgressProperty, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, 0);
  objc_storeStrong((id *)&self->_systemGestureManagerForResizing, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_destroyWeak((id *)&self->_interactionTargetView);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setPreferredScale:additionalReasons:animationBehavior:.cold.1()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x1E0C80C00]);
  v1 = *(unsigned __int8 *)(v0 + 41);
  v5 = 138543874;
  v6 = v2;
  v7 = 2048;
  v8 = v3;
  v9 = 1024;
  v10 = v1;
  _os_log_debug_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating public layout trait preferred scale: %f while enabled{%{BOOL}u}", (uint8_t *)&v5, 0x1Cu);
}

- (void)handleEdgeResizeGesture:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Edge Resize Ended", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handleEdgeResizeGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_4_8(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Edge Resize Began", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handlePanGesture:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_4_8(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Pan Ended", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handlePanGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_4_8(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Pan Began", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handlePinchGesture:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Pinch Ended", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handlePinchGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_4_8(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Pinch Began", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handleRotationGesture:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_4_8(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Rotation Ended", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)handleRotationGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_4_8(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Gesture][%{public}@] Rotation Began", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)__handleGesturesEndedState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x1E0C80C00]);
  v3 = CFSTR("cancelled");
  if (!*(_BYTE *)(v4 + 43))
    v3 = CFSTR("recognized");
  v5 = 138543618;
  v6 = v2;
  v7 = 2114;
  v8 = v3;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, v0, v1, "[%{public}@][Gesture] Did Handle Ended State: %{public}@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setNeedsLayoutForTraits:(uint64_t)a3 withReason:(NSObject *)a4 behavior:layoutCompletion:interactionCompletion:.cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a4, a3, "[%{public}@][Layout] Will begin animation for: %{public}@", (uint8_t *)a3);

}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x1E0C80C00]);
  v2 = 138543362;
  v3 = v0;
  _os_log_debug_impl(&dword_1D0540000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Preferred content size is dirty, attempt updating it now.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_2(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  SBStringFromPIPLayoutReason(*a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "[%{public}@][Layout] Settled for: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_3(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  SBStringFromPIPLayoutReason(*(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a2;
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] decrement!: %{public}@ %ld", (uint8_t *)&v8, 0x20u);

}

- (void)_updateInteractorsAndCommit:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x1E0C80C00]);
  v2 = 138543362;
  v3 = v0;
  _os_log_error_impl(&dword_1D0540000, v1, OS_LOG_TYPE_ERROR, "Unexpectedly had no subregions for interaction controller %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
