@implementation SBSystemNotesPositionHyperregionComposer

- (SBSystemNotesPositionHyperregionComposer)init
{
  SBSystemNotesPositionHyperregionComposer *v2;
  SBSystemNotesPositionHyperregionComposer *v3;
  SBPIPPositionHyperregionLibrary *v4;
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSystemNotesPositionHyperregionComposer;
  v2 = -[SBSystemNotesPositionHyperregionComposer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v4 = objc_alloc_init(SBPIPPositionHyperregionLibrary);
    regionsLibrary = v3->_regionsLibrary;
    v3->_regionsLibrary = v4;

    v3->_animationState = 2;
    -[SBSystemNotesPositionHyperregionComposer _setupStateCapture](v3, "_setupStateCapture");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesPositionHyperregionComposer;
  -[SBSystemNotesPositionHyperregionComposer dealloc](&v3, sel_dealloc);
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PictureInPicture - SBSystemNotesPositionHyperregionComposer - %p"), self);
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

id __62__SBSystemNotesPositionHyperregionComposer__setupStateCapture__block_invoke(uint64_t a1)
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)SBSystemNotesPositionHyperregionComposer;
  -[SBSystemNotesPositionHyperregionComposer description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("Animation State");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_animationState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("Offscreen Corners");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_offscreenCorners);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v15[3] = CFSTR("Regions Library");
  regionsLibrary = self->_regionsLibrary;
  if (!regionsLibrary)
    regionsLibrary = (SBPIPPositionHyperregionLibrary *)&stru_1E8EC7EC0;
  v16[2] = v7;
  v16[3] = regionsLibrary;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)performActionsWithTransientStateChange:(id)a3
{
  unint64_t state;
  id WeakRetained;

  state = self->_state;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  if (self->_state != state)
  {
    self->_state = state;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "positionRegionComposerNeedsUpdate:behavior:", self, self->_animationState);

  }
}

- (void)setupForSwipesFromCorners:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[2];
  uint64_t (*v15[2])(uint64_t);
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  if (a4)
    v7 = 2;
  else
    v7 = 0;
  if (self->_state != 1 || self->_offscreenCorners != a3 || self->_animationState != v7)
  {
    self->_state = 1;
    self->_offscreenCorners = a3;
    self->_animationState = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "positionRegionComposerNeedsUpdate:behavior:", self, self->_animationState);

    SBLogPIP();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      _SBFLoggingMethodProem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v15[0] = (uint64_t (*)(uint64_t))__SBNSStringFromUIRectCorner_block_invoke;
      v15[1] = (uint64_t (*)(uint64_t))&unk_1E8E9EB40;
      v12 = v11;
      v16 = v12;
      v13 = v14;
      if (a3)
        -[SBSystemNotesPositionHyperregionComposer setupForSwipesFromCorners:animated:].cold.1(a3, v15, (uint64_t)v13);

      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2114;
      v20 = v12;
      v21 = 1024;
      v22 = v4;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@][Hyper] corners: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);

    }
  }
}

- (void)setupForInteractiveCornerGesture
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "[%{public}@][Hyper]", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)setupForInteractiveCornerGestureEnd
{
  id WeakRetained;
  NSObject *v4;

  if (self->_state != 3)
  {
    self->_state = 3;
    self->_animationState = 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "positionRegionComposerNeedsUpdate:behavior:", self, self->_animationState);

    SBLogPIP();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture].cold.1();

  }
}

- (void)setupForStandardBehavior
{
  id WeakRetained;
  NSObject *v4;

  if (self->_state)
  {
    self->_state = 0;
    self->_animationState = 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "positionRegionComposerNeedsUpdate:behavior:", self, self->_animationState);

    SBLogPIP();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture].cold.1();

  }
}

- (void)setupForInteractiveDismissalToSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  BOOL v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  CGSize v16;

  height = a3.height;
  width = a3.width;
  v15 = *MEMORY[0x1E0C80C00];
  if (self->_state != 4
    || (self->_dismissToSize.width == a3.width ? (v6 = self->_dismissToSize.height == a3.height) : (v6 = 0), !v6))
  {
    self->_state = 4;
    self->_dismissToSize = a3;
    self->_animationState = 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "positionRegionComposerNeedsUpdate:behavior:", self, self->_animationState);

    SBLogPIP();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      _SBFLoggingMethodProem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16.width = width;
      v16.height = height;
      NSStringFromCGSize(v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@][Hyper] toSize: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
}

- (void)setupForEdgeProtectCornerSwipe
{
  id WeakRetained;
  NSObject *v4;

  if (self->_state != 5)
  {
    self->_state = 5;
    self->_animationState = 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "positionRegionComposerNeedsUpdate:behavior:", self, self->_animationState);

    SBLogPIP();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture].cold.1();

  }
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "positionRegionComposerDidInvalidate:", self);

}

- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  void *v8;
  void *v9;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  CGFloat top;
  CGFloat left;
  CGFloat right;
  CGFloat bottom;
  __int128 v17;
  unint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  int64_t orientation;
  unint64_t offscreenCorners;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  void *v30;
  CGFloat Height;
  CGFloat v32;
  double v33;
  SBPIPPositionHyperregionLibrary *v34;
  void *v35;
  SBPIPPositionHyperregionLibrary *v36;
  void *v37;
  CGSize v39;
  CGSize v40;
  CGSize v41;
  CGPoint v42;
  CGPoint v43;
  CGSize v44;
  double v45;
  CGFloat v46;
  uint64_t v47;
  CGFloat v48;
  __int128 v49;
  __int128 v50;
  double v51;
  CGFloat v52;
  uint64_t v53;
  CGFloat v54;
  unint64_t v55;
  int64_t v56;
  __int128 v57;
  __int128 v58;
  CGSize pipCurrentSize;
  CGSize v60;
  CGSize pipStashedSize;
  CGPoint v62;
  CGPoint origin;
  CGSize v64;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  pipAnchorPointOffset = a4->pipAnchorPointOffset;
  pipStashedSize = a4->pipStashedSize;
  v62 = pipAnchorPointOffset;
  size = a4->containerBounds.size;
  origin = a4->containerBounds.origin;
  v64 = size;
  pipLastSteadySize = a4->pipLastSteadySize;
  pipCurrentSize = a4->pipCurrentSize;
  v60 = pipLastSteadySize;
  top = a4->edgeInsets.top;
  left = a4->edgeInsets.left;
  bottom = a4->edgeInsets.bottom;
  right = a4->edgeInsets.right;
  v17 = *(_OWORD *)&a4->minimumPadding.bottom;
  v18 = self->_state - 1;
  v57 = *(_OWORD *)&a4->minimumPadding.top;
  v58 = v17;
  v20 = a4->stashedMinimumPadding.top;
  v19 = a4->stashedMinimumPadding.left;
  v22 = a4->stashedMinimumPadding.bottom;
  v21 = a4->stashedMinimumPadding.right;
  orientation = a4->orientation;
  offscreenCorners = self->_offscreenCorners;
  switch(v18)
  {
    case 0uLL:
      objc_msgSend(v8, "removeAllObjects");
      v41 = pipStashedSize;
      v42 = v62;
      v43 = origin;
      v44 = v64;
      v39 = pipCurrentSize;
      v40 = v60;
      v45 = top;
      v46 = left;
      v47 = *(_QWORD *)&bottom;
      v48 = right;
      v49 = v57;
      v50 = v58;
      v51 = v20;
      v52 = v19;
      v53 = *(_QWORD *)&v22;
      v54 = v21;
      v55 = offscreenCorners;
      v56 = orientation;
      -[SBSystemNotesPositionHyperregionComposer _addOffscreenCornersToRegions:geometry:](self, "_addOffscreenCornersToRegions:geometry:", v9, &v39);
      break;
    case 1uLL:
    case 3uLL:
      objc_msgSend(v8, "removeAllObjects");
      v25 = *MEMORY[0x1E0CEB4B0];
      v26 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v27 = *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      v28 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      if (self->_state == 4)
      {
        pipCurrentSize = self->_dismissToSize;
        v60 = pipCurrentSize;
      }
      regionsLibrary = self->_regionsLibrary;
      v41 = pipStashedSize;
      v42 = v62;
      v43 = origin;
      v44 = v64;
      v39 = pipCurrentSize;
      v40 = v60;
      v45 = v25;
      v46 = v26;
      v47 = v27;
      v48 = v28;
      v49 = v57;
      v50 = v58;
      v51 = v20;
      v52 = v19;
      v53 = *(_QWORD *)&v22;
      v54 = v21;
      v55 = offscreenCorners;
      v56 = orientation;
      -[SBPIPPositionHyperregionLibrary regionWithType:geometry:](regionsLibrary, "regionWithType:geometry:", 5, &v39);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v30, &unk_1E91D1478);
      if (!a5->isStashed && self->_state != 4)
      {
        v41 = pipStashedSize;
        v42 = v62;
        v43 = origin;
        v44 = v64;
        v39 = pipCurrentSize;
        v40 = v60;
        v45 = v25;
        v46 = v26;
        v47 = v27;
        v48 = v28;
        v49 = v57;
        v50 = v58;
        v51 = v20;
        v52 = v19;
        v53 = *(_QWORD *)&v22;
        v54 = v21;
        v55 = offscreenCorners;
        v56 = orientation;
        -[SBSystemNotesPositionHyperregionComposer _addOffscreenCornersToRegions:geometry:](self, "_addOffscreenCornersToRegions:geometry:", v9, &v39);
      }

      break;
    case 2uLL:
      objc_msgSend(v8, "removeObjectForKey:", &unk_1E91D1490);
      objc_msgSend(v9, "removeObjectForKey:", &unk_1E91D14A8);
      break;
    case 4uLL:
      Height = CGRectGetHeight(a4->containerBounds);
      v32 = a4->edgeInsets.left;
      v33 = Height - a4->pipStashedSize.height + -25.0;
      v34 = self->_regionsLibrary;
      v41 = pipStashedSize;
      v42 = v62;
      v43 = origin;
      v44 = v64;
      v39 = pipCurrentSize;
      v40 = v60;
      v45 = v33;
      v46 = v32;
      v47 = 0x4039000000000000;
      v48 = right;
      v49 = v57;
      v50 = v58;
      v51 = v33;
      v52 = v32;
      v53 = 0x4039000000000000;
      v54 = right;
      v55 = offscreenCorners;
      v56 = orientation;
      -[SBPIPPositionHyperregionLibrary regionWithType:geometry:](v34, "regionWithType:geometry:", 2, &v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v35, &unk_1E91D1490);
      v36 = self->_regionsLibrary;
      v41 = pipStashedSize;
      v42 = v62;
      v43 = origin;
      v44 = v64;
      v39 = pipCurrentSize;
      v40 = v60;
      v45 = v33;
      v46 = v32;
      v47 = 0x4039000000000000;
      v48 = right;
      v49 = v57;
      v50 = v58;
      v51 = v33;
      v52 = v32;
      v53 = 0x4039000000000000;
      v54 = right;
      v55 = offscreenCorners;
      v56 = orientation;
      -[SBPIPPositionHyperregionLibrary regionWithType:geometry:](v36, "regionWithType:geometry:", 3, &v39);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v37, &unk_1E91D14A8);

      break;
    default:
      return v9;
  }
  return v9;
}

- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  return a4;
}

- (void)_addOffscreenCornersToRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4
{
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  id v11;
  void *v12;
  CGSize pipCurrentSize;
  CGSize v14;
  CGSize pipStashedSize;
  CGPoint v16;
  CGPoint origin;
  CGSize v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  regionsLibrary = self->_regionsLibrary;
  v5 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  v23 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  v24 = v5;
  v25 = *(_OWORD *)&a4->offscreenCorners;
  v6 = *(_OWORD *)&a4->edgeInsets.bottom;
  v19 = *(_OWORD *)&a4->edgeInsets.top;
  v20 = v6;
  v7 = *(_OWORD *)&a4->minimumPadding.bottom;
  v21 = *(_OWORD *)&a4->minimumPadding.top;
  v22 = v7;
  pipAnchorPointOffset = a4->pipAnchorPointOffset;
  pipStashedSize = a4->pipStashedSize;
  v16 = pipAnchorPointOffset;
  size = a4->containerBounds.size;
  origin = a4->containerBounds.origin;
  v18 = size;
  pipLastSteadySize = a4->pipLastSteadySize;
  pipCurrentSize = a4->pipCurrentSize;
  v14 = pipLastSteadySize;
  v11 = a3;
  -[SBPIPPositionHyperregionLibrary regionWithType:geometry:](regionsLibrary, "regionWithType:geometry:", 4, &pipCurrentSize);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, &unk_1E91D14C0, pipCurrentSize, v14, pipStashedSize, v16, origin, v18, v19, v20, v21, v22, v23, v24, v25);

}

- (SBPIPPositionHyperregionComposerDelegate)delegate
{
  return (SBPIPPositionHyperregionComposerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_regionsLibrary, 0);
}

- (uint64_t)setupForSwipesFromCorners:(uint64_t)result animated:(uint64_t *)(a2 .cold.1(uint64_t result, uint64_t (**a2)(uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint8x8_t v4;
  __int32 v5;
  unint64_t v8;
  BOOL v9;

  v3 = result;
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)result);
  v4.i16[0] = vaddlv_u8(v4);
  v5 = v4.i32[0];
  if (v4.i32[0])
  {
    v8 = 0;
    do
    {
      if (((1 << v8) & v3) != 0)
      {
        result = (*a2)(a3);
        --v5;
      }
      v9 = v8++ > 0x3E;
      v9 = v9 || v5 <= 0;
    }
    while (!v9);
  }
  return result;
}

@end
