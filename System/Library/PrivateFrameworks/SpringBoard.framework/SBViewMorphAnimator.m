@implementation SBViewMorphAnimator

- (SBViewMorphAnimator)initWithUUID:(id)a3 windowScene:(id)a4 direction:(int64_t)a5
{
  id v9;
  id v10;
  SBViewMorphAnimator *v11;
  SBViewMorphAnimator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBViewMorphAnimator;
  v11 = -[SBViewMorphAnimator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    v12->_direction = a5;
    objc_storeWeak((id *)&v12->_windowScene, v10);
    -[SBViewMorphAnimator _reset](v12, "_reset");
  }

  return v12;
}

- (SBViewMorphAnimator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 104, CFSTR("unavailable initializer, use -initWithUUID:"));

  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SBViewMorphAnimator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] dealloc", buf, 0xCu);
  }

  -[SBViewMorphAnimator _resetAllAnimations](self, "_resetAllAnimations");
  v4.receiver = self;
  v4.super_class = (Class)SBViewMorphAnimator;
  -[SBViewMorphAnimator dealloc](&v4, sel_dealloc);
}

- (void)_reset
{
  CGPoint v3;
  CGSize v4;
  NSHashTable *observers;
  id sourceAllAnimationsCompletionBlock;
  SBViewMorphAnimatorContentClippingView *targetContentClippingView;
  SBViewMorphAnimatorContentBlackCurtainView *sourceBlackCurtainView;

  self->_invalidated = 0;
  v3 = (CGPoint)*MEMORY[0x1E0C9D628];
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_targetFinalFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_targetFinalFrame.size = v4;
  self->_sourceFinalCenter = (CGPoint)SBInvalidPoint;
  self->_targetSourcePinningFrame.origin = v3;
  self->_targetSourcePinningFrame.size = v4;
  *(_OWORD *)&self->_sourceFinalScale = xmmword_1D0E89BC0;
  self->_fromOrientation = 0;
  self->_toOrientation = 0;
  *(_WORD *)&self->_automaticallyStartSourceAnimations = 257;
  self->_sourceContentContainerFrame.origin = v3;
  self->_sourceContentContainerFrame.size = v4;
  self->_sourceCornerRadius = 0.0;
  observers = self->_observers;
  self->_observers = 0;

  self->_startedSourceAnimations = 0;
  self->_completedSourceAnimations = 0;
  self->_completedTargetAnimations = 0;
  sourceAllAnimationsCompletionBlock = self->_sourceAllAnimationsCompletionBlock;
  self->_sourceAllAnimationsCompletionBlock = 0;

  targetContentClippingView = self->_targetContentClippingView;
  self->_targetContentClippingView = 0;

  sourceBlackCurtainView = self->_sourceBlackCurtainView;
  self->_sourceBlackCurtainView = 0;

}

- (void)cancel:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  id WeakRetained;
  int v7;
  SBViewMorphAnimator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] was canceled", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (!self->_direction)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
      objc_msgSend(WeakRetained, "setAlpha:", 0.0);

    }
    -[SBViewMorphAnimator _resetAllAnimations](self, "_resetAllAnimations");
    -[SBViewMorphAnimator _noteAnimatorWasCanceled](self, "_noteAnimatorWasCanceled");
    -[SBViewMorphAnimator _continueSourceAnimationsCompletionPendingBlock](self, "_continueSourceAnimationsCompletionPendingBlock");
  }
  if (v4)
    v4[2](v4);

}

- (void)interrupt:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);
  uint8_t buf[4];
  SBViewMorphAnimator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] was interrupted", buf, 0xCu);
  }

  if (self->_invalidated)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    -[SBViewMorphAnimator _noteAnimatorWasInterrupted](self, "_noteAnimatorWasInterrupted");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__SBViewMorphAnimator_interrupt___block_invoke;
    v6[3] = &unk_1E8EA02D8;
    v6[4] = self;
    v7 = v4;
    -[SBViewMorphAnimator cancel:](self, "cancel:", v6);

  }
}

void __33__SBViewMorphAnimator_interrupt___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  _QWORD v5[5];

  v1 = (void *)MEMORY[0x1E0CEABB0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SBViewMorphAnimator_interrupt___block_invoke_2;
  v5[3] = &unk_1E8E9DED8;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__SBViewMorphAnimator_interrupt___block_invoke_3;
  v3[3] = &unk_1E8E9F1C0;
  v4 = v2;
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v5, v3, 0.2);

}

void __33__SBViewMorphAnimator_interrupt___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

}

uint64_t __33__SBViewMorphAnimator_interrupt___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_resetAllAnimations
{
  BSAbsoluteMachTimer *allAnimationsTimeoutTimer;
  BSAbsoluteMachTimer *morphAnimationTimeout;
  BSAbsoluteMachTimer *sourceAnimationsCompletionContinueBlockTimeoutTimer;
  NSObject *v6;
  int v7;
  SBViewMorphAnimator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SBViewMorphAnimator _removeBlackCurtainView](self, "_removeBlackCurtainView");
  -[SBViewMorphAnimator _removeTargetClippingView](self, "_removeTargetClippingView");
  -[SBViewMorphAnimator _removeMatchMoveAnimation](self, "_removeMatchMoveAnimation");
  -[BSAbsoluteMachTimer invalidate](self->_allAnimationsTimeoutTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_morphAnimationTimeout, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_sourceAnimationsCompletionContinueBlockTimeoutTimer, "invalidate");
  allAnimationsTimeoutTimer = self->_allAnimationsTimeoutTimer;
  self->_allAnimationsTimeoutTimer = 0;

  morphAnimationTimeout = self->_morphAnimationTimeout;
  self->_morphAnimationTimeout = 0;

  sourceAnimationsCompletionContinueBlockTimeoutTimer = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  self->_sourceAnimationsCompletionContinueBlockTimeoutTimer = 0;

  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] did reset all animations", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_removeTargetClippingView
{
  SBViewMorphAnimatorContentClippingView *targetContentClippingView;
  void *v4;
  SBViewMorphAnimatorContentClippingView *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetContentView);
  targetContentClippingView = self->_targetContentClippingView;
  if (targetContentClippingView)
  {
    -[SBViewMorphAnimatorContentClippingView superview](targetContentClippingView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSubview:belowSubview:", WeakRetained, self->_targetContentClippingView);

    -[SBViewMorphAnimatorContentClippingView frame](self->_targetContentClippingView, "frame");
    objc_msgSend(WeakRetained, "setFrame:");
    -[SBViewMorphAnimatorContentClippingView removeFromSuperview](self->_targetContentClippingView, "removeFromSuperview");
    v5 = self->_targetContentClippingView;
    self->_targetContentClippingView = 0;

  }
}

- (void)_removeBlackCurtainView
{
  SBViewMorphAnimatorContentBlackCurtainView *sourceBlackCurtainView;
  SBViewMorphAnimatorContentBlackCurtainView *v4;

  sourceBlackCurtainView = self->_sourceBlackCurtainView;
  if (sourceBlackCurtainView)
  {
    -[SBViewMorphAnimatorContentBlackCurtainView removeFromSuperview](sourceBlackCurtainView, "removeFromSuperview");
    v4 = self->_sourceBlackCurtainView;
    self->_sourceBlackCurtainView = 0;

  }
}

- (double)sourceClippingCornerRadius
{
  return self->_targetCornerRadius / self->_sourceFinalScale;
}

- (CGRect)sourceClippingFrame
{
  return CGRectInset(self->_sourceContentFrame, 1.0, 1.0);
}

- (BOOL)_isReversed
{
  return self->_direction == 1;
}

- (BOOL)preflightCheck
{
  id WeakRetained;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v26;
  SBViewMorphAnimator *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  NSRect v37;
  NSRect v38;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sourceContentFrameForAnimator:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "targetFinalFrameForAnimator:", self);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    if (CGRectIsNull(v35))
    {
      v21 = 0;
    }
    else
    {
      v36.origin.x = v14;
      v36.origin.y = v16;
      v36.size.width = v18;
      v36.size.height = v20;
      v21 = !CGRectIsNull(v36);
    }
    SBLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37.origin.x = v6;
      v37.origin.y = v8;
      v37.size.width = v10;
      v37.size.height = v12;
      NSStringFromRect(v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38.origin.x = v14;
      v38.origin.y = v16;
      v38.size.width = v18;
      v38.size.height = v20;
      NSStringFromRect(v38);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 134218754;
      v27 = self;
      v28 = 1024;
      v29 = v21;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] Preflight check succeeded? %{BOOL}u, with sourceContentFrame: %@, targetFinalFrame: %@.", (uint8_t *)&v26, 0x26u);

    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  -[SBViewMorphAnimator _updateParameters](self, "_updateParameters");
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
  -[SBViewMorphAnimator _updateParameters](self, "_updateParameters");
  if (a3)
  {
    if (self->_automaticallyStartSourceAnimations)
      -[SBViewMorphAnimator startSourceAnimations:](self, "startSourceAnimations:", 15);
  }
}

- (void)setTargetView:(id)a3
{
  id WeakRetained;

  objc_storeWeak((id *)&self->_targetView, a3);
  -[SBViewMorphAnimator _updateParameters](self, "_updateParameters");
  if (self->_direction == 1)
  {
    if (!a3)
    {
      -[SBViewMorphAnimator noteTargetAnimationsDidEnd:finished:continueBlock:](self, "noteTargetAnimationsDidEnd:finished:continueBlock:", 4, 1, 0);
      return;
    }
  }
  else
  {
    -[SBViewMorphAnimator noteTargetAnimationsDidEnd:finished:continueBlock:](self, "noteTargetAnimationsDidEnd:finished:continueBlock:", 4, 1, 0);
  }
  if (a3 && self->_automaticallyStartTargetAnimations)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetContentView);

    if (WeakRetained)
      -[SBViewMorphAnimator startTargetAnimations:](self, "startTargetAnimations:", 1);
  }
}

- (void)setTargetContentView:(id)a3
{
  id WeakRetained;

  objc_storeWeak((id *)&self->_targetContentView, a3);
  -[SBViewMorphAnimator _updateParameters](self, "_updateParameters");
  if (self->_automaticallyStartTargetAnimations)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

    if (a3)
    {
      if (WeakRetained)
        -[SBViewMorphAnimator startTargetAnimations:](self, "startTargetAnimations:", 1);
    }
  }
}

- (void)_updateParameters
{
  id WeakRetained;
  _BOOL4 v4;
  id v5;
  id v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double x;
  double v23;
  double y;
  double v25;
  double width;
  double v27;
  double height;
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
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  NSObject *v58;
  void *v59;
  double sourceFinalScale;
  void *v61;
  void *v62;
  uint64_t v63;
  _BOOL4 v64;
  id v65;
  void *v66;
  double targetCornerRadius;
  void *v68;
  uint8_t buf[4];
  SBViewMorphAnimator *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  double v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  _BOOL4 v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = -[SBViewMorphAnimator _isReversed](self, "_isReversed");
  v5 = objc_loadWeakRetained((id *)&self->_sourceView);
  v6 = objc_loadWeakRetained((id *)&self->_targetView);
  if (v5)
  {
    objc_msgSend(WeakRetained, "sourceCornerRadiusForAnimator:", self);
    self->_sourceCornerRadius = v7;
    objc_msgSend(WeakRetained, "targetFinalCornerRadiusForAnimator:", self);
    self->_targetCornerRadius = v8;
    objc_msgSend(WeakRetained, "targetFinalFrameForAnimator:", self);
    self->_targetFinalFrame.origin.x = v9;
    self->_targetFinalFrame.origin.y = v10;
    self->_targetFinalFrame.size.width = v11;
    self->_targetFinalFrame.size.height = v12;
    objc_msgSend(WeakRetained, "sourceContentFrameForAnimator:", self);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    if (v4)
    {
      objc_msgSend(v6, "frame");
      x = v21;
      y = v23;
      width = v25;
      height = v27;
    }
    else
    {
      x = self->_targetFinalFrame.origin.x;
      y = self->_targetFinalFrame.origin.y;
      width = self->_targetFinalFrame.size.width;
      height = self->_targetFinalFrame.size.height;
    }
    -[SBViewMorphAnimator _sourceFinalScaleWithContentFrame:targetFinalFrame:](self, "_sourceFinalScaleWithContentFrame:targetFinalFrame:", v14, v16, v18, v20, x, y, width, height);
    -[SBViewMorphAnimator _validatedSourceContentFrame:withinSourceView:withSourceFinalScale:](self, "_validatedSourceContentFrame:withinSourceView:withSourceFinalScale:", v5, v14, v16, v18, v20, v29);
    self->_sourceContentFrame.origin.x = v30;
    self->_sourceContentFrame.origin.y = v31;
    self->_sourceContentFrame.size.width = v32;
    self->_sourceContentFrame.size.height = v33;
    if (v4)
    {
      objc_msgSend(v6, "frame");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v30 = self->_sourceContentFrame.origin.x;
      v31 = self->_sourceContentFrame.origin.y;
      v32 = self->_sourceContentFrame.size.width;
      v33 = self->_sourceContentFrame.size.height;
    }
    else
    {
      v35 = self->_targetFinalFrame.origin.x;
      v37 = self->_targetFinalFrame.origin.y;
      v39 = self->_targetFinalFrame.size.width;
      v41 = self->_targetFinalFrame.size.height;
    }
    -[SBViewMorphAnimator _sourceFinalScaleWithContentFrame:targetFinalFrame:](self, "_sourceFinalScaleWithContentFrame:targetFinalFrame:", v30, v31, v32, v33, v35, v37, v39, v41);
    v43 = v42;
    self->_sourceFinalScale = v42;
    if (v4)
    {
      objc_msgSend(v6, "frame");
    }
    else
    {
      v44 = self->_targetFinalFrame.origin.x;
      v45 = self->_targetFinalFrame.origin.y;
      v46 = self->_targetFinalFrame.size.width;
      v47 = self->_targetFinalFrame.size.height;
    }
    -[SBViewMorphAnimator _source:finalCenterWithFinalScale:contentFrame:targetFinalFrame:](self, "_source:finalCenterWithFinalScale:contentFrame:targetFinalFrame:", v5, v43, self->_sourceContentFrame.origin.x, self->_sourceContentFrame.origin.y, self->_sourceContentFrame.size.width, self->_sourceContentFrame.size.height, *(_QWORD *)&v44, *(_QWORD *)&v45, *(_QWORD *)&v46, *(_QWORD *)&v47);
    self->_sourceFinalCenter.x = v48;
    self->_sourceFinalCenter.y = v49;
    -[SBViewMorphAnimator _targetSourcePinningFrameWithSourceContentFrame:targetFinalFrame:](self, "_targetSourcePinningFrameWithSourceContentFrame:targetFinalFrame:", self->_sourceContentFrame.origin.x, self->_sourceContentFrame.origin.y, self->_sourceContentFrame.size.width, self->_sourceContentFrame.size.height, self->_targetFinalFrame.origin.x, self->_targetFinalFrame.origin.y, self->_targetFinalFrame.size.width, self->_targetFinalFrame.size.height);
    self->_targetSourcePinningFrame.origin.x = v50;
    self->_targetSourcePinningFrame.origin.y = v51;
    self->_targetSourcePinningFrame.size.width = v52;
    self->_targetSourcePinningFrame.size.height = v53;
    -[SBViewMorphAnimator _sourceContentContainerFrameForSourceView:withTargetDataSource:](self, "_sourceContentContainerFrameForSourceView:withTargetDataSource:", v5, WeakRetained);
    self->_sourceContentContainerFrame.origin.x = v54;
    self->_sourceContentContainerFrame.origin.y = v55;
    self->_sourceContentContainerFrame.size.width = v56;
    self->_sourceContentContainerFrame.size.height = v57;
    SBLogCommon();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCGRect(self->_sourceContentFrame);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(self->_targetFinalFrame);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      sourceFinalScale = self->_sourceFinalScale;
      NSStringFromCGPoint(self->_sourceFinalCenter);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(self->_targetSourcePinningFrame);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(self->_sourceContentContainerFrame);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v4;
      v65 = v6;
      v66 = (void *)v63;
      targetCornerRadius = self->_targetCornerRadius;
      *(_DWORD *)buf = 134220034;
      v70 = self;
      v71 = 2114;
      v72 = v68;
      v73 = 2114;
      v74 = v59;
      v75 = 2048;
      v76 = sourceFinalScale;
      v77 = 2114;
      v78 = v61;
      v79 = 2114;
      v80 = v62;
      v81 = 2114;
      v82 = v63;
      v83 = 2048;
      v84 = targetCornerRadius;
      v85 = 1024;
      v86 = v64;
      _os_log_impl(&dword_1D0540000, v58, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] Parameters update: _sourceContentFrame(%{public}@) _targetFinalFrame(%{public}@) _sourceFinalScale(%.2f) _sourceFinalCenter(%{public}@) _targetSourcePinningFrame(%{public}@) _sourceContentContainerFrame(%{public}@) _targetCornerRadius(%.2f) isAnimationDirectionReversed(%{BOOL}u)", buf, 0x58u);

      v6 = v65;
    }

  }
}

- (BOOL)_isTargetSourcePinningFrameEquivalentToSourceViewFrame
{
  SBViewMorphAnimator *v2;
  id WeakRetained;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v9;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  objc_msgSend(WeakRetained, "bounds");
  v9.origin.x = v4;
  v9.origin.y = v5;
  v9.size.width = v6;
  v9.size.height = v7;
  LOBYTE(v2) = CGRectContainsRect(v2->_targetSourcePinningFrame, v9);

  return (char)v2;
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
    v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 2);
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  if (!-[NSHashTable containsObject:](observers, "containsObject:", v4))
    -[NSHashTable addObject:](self->_observers, "addObject:", v8);

}

- (void)noteSourceAnimationsWillStart:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__SBViewMorphAnimator_noteSourceAnimationsWillStart___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0___SBViewMorphAnimatorObserver__8l;
  v3[4] = a3;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_willStartSourceAnimations_, v3);
}

uint64_t __53__SBViewMorphAnimator_noteSourceAnimationsWillStart___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willStartSourceAnimations:", *(_QWORD *)(a1 + 32));
}

- (void)noteSourceAnimationsDidEnd:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBViewMorphAnimator_noteSourceAnimationsDidEnd_finished_continueBlock___block_invoke;
  v10[3] = &unk_1E8EAFDC0;
  v13 = a4;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_didEndSourceAnimations_finished_continueBlock_, v10);

}

uint64_t __73__SBViewMorphAnimator_noteSourceAnimationsDidEnd_finished_continueBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndSourceAnimations:finished:continueBlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)noteTargetAnimationsWillStart:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__SBViewMorphAnimator_noteTargetAnimationsWillStart___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0___SBViewMorphAnimatorObserver__8l;
  v3[4] = a3;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_willStartTargetAnimations_, v3);
}

uint64_t __53__SBViewMorphAnimator_noteTargetAnimationsWillStart___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willStartTargetAnimations:", *(_QWORD *)(a1 + 32));
}

- (void)noteWillRemoveTargeMatchMoveAnimationAtFrame:(CGRect)a3 withinSourceFrame:(CGRect)a4
{
  _QWORD v4[4];
  CGRect v5;
  CGRect v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__SBViewMorphAnimator_noteWillRemoveTargeMatchMoveAnimationAtFrame_withinSourceFrame___block_invoke;
  v4[3] = &__block_descriptor_96_e39_v16__0___SBViewMorphAnimatorObserver__8l;
  v5 = a3;
  v6 = a4;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_willRemoveTargeMatchMoveAnimationAtFrame_withinSourceFrame_, v4);
}

uint64_t __86__SBViewMorphAnimator_noteWillRemoveTargeMatchMoveAnimationAtFrame_withinSourceFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "willRemoveTargeMatchMoveAnimationAtFrame:withinSourceFrame:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

- (void)noteTargetAnimationsDidEnd:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBViewMorphAnimator_noteTargetAnimationsDidEnd_finished_continueBlock___block_invoke;
  v10[3] = &unk_1E8EAFDC0;
  v13 = a4;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_didEndTargetAnimations_finished_continueBlock_, v10);

}

uint64_t __73__SBViewMorphAnimator_noteTargetAnimationsDidEnd_finished_continueBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndTargetAnimations:finished:continueBlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_noteDidEndAllAnimations
{
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_didEndAllAnimations, &__block_literal_global_176);
}

uint64_t __47__SBViewMorphAnimator__noteDidEndAllAnimations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndAllAnimations");
}

- (void)_noteAnimatorWasCanceled
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__SBViewMorphAnimator__noteAnimatorWasCanceled__block_invoke;
  v2[3] = &unk_1E8EAFE48;
  v2[4] = self;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_animatorWasCanceled_, v2);
}

uint64_t __47__SBViewMorphAnimator__noteAnimatorWasCanceled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "animatorWasCanceled:", *(_QWORD *)(a1 + 32));
}

- (void)_noteAnimatorWasInterrupted
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__SBViewMorphAnimator__noteAnimatorWasInterrupted__block_invoke;
  v2[3] = &unk_1E8EAFE48;
  v2[4] = self;
  -[SBViewMorphAnimator _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_animatorWasInterrupted_, v2);
}

uint64_t __50__SBViewMorphAnimator__noteAnimatorWasInterrupted__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "animatorWasInterrupted:", *(_QWORD *)(a1 + 32));
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, SBViewMorphAnimator *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SBViewMorphAnimator *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, SBViewMorphAnimator *))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5[2](v5, self);
  if (-[NSHashTable count](self->_observers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(SBViewMorphAnimator **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (CGRect)_validatedSourceContentFrame:(CGRect)a3 withinSourceView:(id)a4 withSourceFinalScale:(double)a5
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  id v14;
  double v15;
  double v16;
  double v17;
  double height;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat aRect;
  uint8_t buf[4];
  SBViewMorphAnimator *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  NSRect v36;
  NSRect v37;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  self->_sourceContentFrameWasAltered = 0;
  if (a5 > 1.0 && self->_direction == 0)
  {
    aRect = a3.size.height;
    v14 = a4;
    objc_msgSend(v14, "bounds");
    v10 = v15;
    objc_msgSend(v14, "bounds");
    v17 = v16;

    v19 = self->_targetFinalFrame.size.width;
    height = self->_targetFinalFrame.size.height;
    v9 = floor(v10 * (height / v19));
    if (v9 <= v17)
    {
      v12 = 0.0;
      v11 = 0.0;
    }
    else
    {
      v20 = floor(v17 * (v19 / height));
      v12 = (v10 - v20) * 0.5;
      v11 = 0.0;
      v10 = v20;
      v9 = v17;
    }
    self->_sourceContentFrameWasAltered = 1;
    SBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = aRect;
      NSStringFromRect(v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37.origin.x = v12;
      v37.origin.y = 0.0;
      v37.size.width = v10;
      v37.size.height = v9;
      NSStringFromRect(v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v30 = self;
      v31 = 2114;
      v32 = v22;
      v33 = 2114;
      v34 = v23;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] Altering sourceContentFrame{%{public}@} to {%{public}@}", buf, 0x20u);

    }
  }
  else
  {
    v9 = a3.size.height;
    v10 = a3.size.width;
    v11 = a3.origin.y;
    v12 = a3.origin.x;
  }
  v24 = v12;
  v25 = v11;
  v26 = v10;
  v27 = v9;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_sourceContentContainerFrameForSourceView:(id)a3 withTargetDataSource:(id)a4
{
  CGRect v4;

  if (a4)
  {
    objc_msgSend(a4, "sourceContentContainerFrameForAnimator:", self);
    return CGRectInset(v4, -1.0, -1.0);
  }
  else
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D628];
  }
}

- (double)_sourceFinalScaleWithContentFrame:(CGRect)a3 targetFinalFrame:(CGRect)a4
{
  double height;
  double width;
  CGFloat x;
  double v7;
  double v8;
  CGFloat y;
  CGFloat v10;
  double v11;
  CGFloat rect;
  CGRect v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  rect = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  v10 = a3.origin.x;
  v11 = 0.0;
  if (!CGRectIsNull(a3))
  {
    v14.origin.x = x;
    v14.origin.y = rect;
    v14.size.width = width;
    v14.size.height = height;
    if (!CGRectIsNull(v14))
    {
      v15.origin.x = v10;
      v15.origin.y = y;
      v15.size.width = v8;
      v15.size.height = v7;
      if (!CGRectIsEmpty(v15))
      {
        if (width / v8 >= height / v7)
          return height / v7;
        else
          return width / v8;
      }
    }
  }
  return v11;
}

- (CGPoint)_source:(id)a3 finalCenterWithFinalScale:(double)a4 contentFrame:(CGRect)a5 targetFinalFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
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
  NSObject *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  double v32;
  uint8_t buf[4];
  SBViewMorphAnimator *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;
  CGPoint v44;
  CGPoint v45;
  CGPoint result;
  CGRect v47;
  CGRect v48;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v12)
  {
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    if (!CGRectIsNull(v47) && !CGRectIsNull(a6))
    {
      UIRectGetCenter();
      v16 = v15;
      v32 = v17;
      objc_msgSend(v12, "bounds");
      UIRectGetCenter();
      v19 = v18;
      v21 = v20;
      UIRectGetCenter();
      v31 = v19;
      v13 = v16 + (v19 - v22) * a4;
      v14 = v32 + (v21 - v23) * a4;
      SBLogPIP();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromCGRect(a6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44.y = v21;
        v44.x = v31;
        NSStringFromCGPoint(v44);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v48.origin.x = x;
        v48.origin.y = y;
        v48.size.width = width;
        v48.size.height = height;
        NSStringFromCGRect(v48);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v45.x = v13;
        v45.y = v14;
        NSStringFromCGPoint(v45);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v34 = self;
        v35 = 2114;
        v36 = v27;
        v37 = 2114;
        v38 = v28;
        v39 = 2114;
        v40 = v29;
        v41 = 2114;
        v42 = v30;
        _os_log_debug_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEBUG, "[Layout][Morph Animator][%p] finalCenterWithFinalScale finalFrame[%{public}@] containerCenter[%{public}@] contentFrame:[%{public}@] sourceFinalCenter[%{public}@]", buf, 0x34u);

      }
    }
  }

  v25 = v13;
  v26 = v14;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGRect)_targetSourcePinningFrameWithSourceContentFrame:(CGRect)a3 targetFinalFrame:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = a3.size.width;
  v23 = a3.size.height;
  if (!CGRectIsNull(a3))
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (!CGRectIsNull(v26))
    {
      if (v22 / width >= v23 / height)
        v8 = v22 / width;
      else
        v8 = v23 / height;
      BSRectWithSize();
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v24.c = v17;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformScale(&v25, &v24, v8, v8);
      v27.origin.x = v10;
      v27.origin.y = v12;
      v27.size.width = v14;
      v27.size.height = v16;
      CGRectApplyAffineTransform(v27, &v25);
      UIRectGetCenter();
      UIRectCenteredAboutPoint();
    }
  }
  SBScreenScale();
  BSRectRoundForScale();
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_targetInitialClippingBoundsWithSourceContentFrame:(CGRect)a3 sourceFinalScale:(double)a4 targetViewBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL IsNull;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a5))
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    IsNull = CGRectIsNull(v18);
    if (a4 > 0.0 && !IsNull)
    {
      v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v16.c = v11;
      *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformScale(&v17, &v16, a4, a4);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      CGRectApplyAffineTransform(v19, &v17);
    }
  }
  SBScreenScale();
  BSRectRoundForScale();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)startSourceAnimations:(unint64_t)a3
{
  return !self->_invalidated;
}

- (BOOL)startTargetAnimations:(unint64_t)a3
{
  _BOOL4 invalidated;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint8x8_t v13;
  int v14;
  unint64_t v15;
  _QWORD v17[2];
  void (*v18)(id *, uint64_t);
  void *v19;
  SBViewMorphAnimator *v20;
  id v21;
  id v22;
  id v23;
  char v24;

  invalidated = self->_invalidated;
  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    v7 = objc_loadWeakRetained((id *)&self->_targetView);
    v8 = objc_loadWeakRetained((id *)&self->_targetContentView);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v18 = __45__SBViewMorphAnimator_startTargetAnimations___block_invoke;
    v19 = &unk_1E8EAFE70;
    v20 = self;
    v9 = WeakRetained;
    v21 = v9;
    v10 = v7;
    v22 = v10;
    v11 = v8;
    v23 = v11;
    v12 = v17;
    if (a3)
    {
      v24 = 0;
      v13 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
      v13.i16[0] = vaddlv_u8(v13);
      v14 = v13.i32[0];
      if (v13.i32[0])
      {
        v15 = 0;
        do
        {
          if (((1 << v15) & a3) != 0)
          {
            ((void (*)(_QWORD *))v18)(v12);
            if (v24)
              break;
            --v14;
          }
          if (v15 > 0x3E)
            break;
          ++v15;
        }
        while (v14 > 0);
      }
    }

  }
  return !invalidated;
}

void __45__SBViewMorphAnimator_startTargetAnimations___block_invoke(id *a1, uint64_t a2)
{
  _QWORD *v3;
  int v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double *v19;
  int v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  double MinX;
  void *v42;
  void *v43;
  double MaxX;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  SBViewMorphAnimatorContentClippingView *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  double v65;
  void *v66;
  int v67;
  id v68;
  double v69;
  double *v70;
  uint64_t v71;
  _QWORD v72[5];
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  double v77;
  char v78;
  double v79;
  _BYTE buf[12];
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  id v90;
  _QWORD v91[5];
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v91[4] = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  if ((a2 & ~v3[15]) == 0)
    return;
  v5 = objc_msgSend(v3, "_isReversed");
  if (a2 == 2)
  {
    v13 = a1[4];
    if (!v13[26])
    {
      objc_msgSend(v13, "noteTargetAnimationsDidEnd:finished:continueBlock:", 2, 0, 0);
      return;
    }
    v79 = 0.0;
    *(_QWORD *)buf = 0;
    v14 = 0;
    v15 = 0;
    if (!SBReduceMotion())
    {
      v16 = *((id *)a1[4] + 10);
      v14 = v16;
      if (v16)
      {
        objc_msgSend(v16, "dampingRatio");
        objc_msgSend(v14, "response");
        convertDampingRatioAndResponseToTensionAndFriction();
        v17 = (void *)MEMORY[0x1E0D01870];
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "settingsWithMass:stiffness:damping:timingFunction:", v18, 1.0, *(double *)buf, v79);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
    }
    v19 = (double *)a1[4];
    if (v5)
    {
      v20 = objc_msgSend(v19, "_isTargetSourcePinningFrameEquivalentToSourceViewFrame");
      v19 = (double *)a1[4];
      v21 = 0.0;
      if (v20)
        v21 = v19[27] * v19[18];
    }
    else
    {
      v21 = v19[19];
    }
    v22 = 0.0;
    if (!*((_BYTE *)v19 + 13))
      v22 = 1.0;
    objc_msgSend(a1[7], "setAlpha:", v22);
    v23 = MEMORY[0x1E0C809B0];
    v24 = (void *)MEMORY[0x1E0D01908];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_39;
    v73[3] = &unk_1E8EA0CC0;
    v25 = a1[7];
    v78 = v5;
    v26 = a1[4];
    v74 = v25;
    v75 = v26;
    v76 = a1[6];
    v77 = v21;
    v72[0] = v23;
    v72[1] = 3221225472;
    v72[2] = __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_2;
    v72[3] = &unk_1E8E9E980;
    v72[4] = a1[4];
    objc_msgSend(v24, "animateWithSettings:actions:completion:", v15, v73, v72);
    objc_msgSend(a1[4], "noteTargetAnimationsWillStart:", 2);

    goto LABEL_25;
  }
  if (a2 != 1)
    return;
  if (a1[5]
    && a1[6]
    && a1[7]
    && !CGRectIsNull(*(CGRect *)((char *)a1[4] + 368))
    && !CGRectIsNull(*(CGRect *)((char *)a1[4] + 272)))
  {
    objc_msgSend(a1[6], "layoutIfNeeded");
    objc_msgSend(a1[6], "bounds");
    v71 = v27;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v34 = (double *)a1[4];
    v35 = v34[30];
    v36 = v34[31];
    v37 = v34[32];
    v38 = v34[33];
    v14 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
    objc_msgSend(a1[5], "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceLayer:", v39);

    v40 = (void *)MEMORY[0x1E0CB3B18];
    v92.origin.x = v35;
    v92.origin.y = v36;
    v92.size.width = v37;
    v92.size.height = v38;
    MinX = CGRectGetMinX(v92);
    v93.origin.x = v35;
    v93.origin.y = v36;
    v93.size.width = v37;
    v93.size.height = v38;
    objc_msgSend(v40, "valueWithCGPoint:", MinX, CGRectGetMinY(v93));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v42;
    v43 = (void *)MEMORY[0x1E0CB3B18];
    v94.origin.x = v35;
    v94.origin.y = v36;
    v94.size.width = v37;
    v94.size.height = v38;
    MaxX = CGRectGetMaxX(v94);
    v95.origin.x = v35;
    v95.origin.y = v36;
    v95.size.width = v37;
    v95.size.height = v38;
    objc_msgSend(v43, "valueWithCGPoint:", MaxX, CGRectGetMinY(v95));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v45;
    v46 = (void *)MEMORY[0x1E0CB3B18];
    v96.origin.x = v35;
    v96.origin.y = v36;
    v96.size.width = v37;
    v96.size.height = v38;
    v47 = CGRectGetMaxX(v96);
    v97.origin.x = v35;
    v97.origin.y = v36;
    v97.size.width = v37;
    v97.size.height = v38;
    objc_msgSend(v46, "valueWithCGPoint:", v47, CGRectGetMaxY(v97));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v48;
    v49 = (void *)MEMORY[0x1E0CB3B18];
    v98.origin.x = v35;
    v98.origin.y = v36;
    v98.size.width = v37;
    v98.size.height = v38;
    v50 = CGRectGetMinX(v98);
    v99.origin.x = v35;
    v99.origin.y = v36;
    v99.size.width = v37;
    v99.size.height = v38;
    objc_msgSend(v49, "valueWithCGPoint:", v50, CGRectGetMaxY(v99));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourcePoints:", v52);

    objc_msgSend(v14, "setDuration:", INFINITY);
    objc_msgSend(a1[6], "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addAnimation:forKey:", v14, CFSTR("SBMorphAnimatorLayerMatchMoveAnimationKey"));

    objc_msgSend(a1[4], "_startMorphAnimationTimeoutTimer");
    objc_msgSend(a1[7], "layoutIfNeeded");
    v54 = a1[4];
    objc_msgSend(a1[7], "frame");
    v54[38] = v55;
    v54[39] = v56;
    v54[40] = v57;
    v54[41] = v58;
    v59 = -[SBViewMorphAnimatorContentClippingView initWithFrame:]([SBViewMorphAnimatorContentClippingView alloc], "initWithFrame:", *((double *)a1[4] + 38), *((double *)a1[4] + 39), *((double *)a1[4] + 40), *((double *)a1[4] + 41));
    v60 = a1[4];
    v61 = (void *)v60[26];
    v60[26] = v59;

    objc_msgSend(a1[7], "superview");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "insertSubview:belowSubview:", *((_QWORD *)a1[4] + 26), a1[7]);

    v63 = a1[7];
    objc_msgSend(*((id *)a1[4] + 26), "bounds");
    objc_msgSend(v63, "setFrame:");
    objc_msgSend(*((id *)a1[4] + 26), "addSubview:", a1[7]);
    objc_msgSend(*((id *)a1[4] + 26), "setClipsToBounds:", 1);
    v64 = a1[4];
    if ((v5 & 1) != 0)
    {
      v65 = *((double *)v64 + 19);
      objc_msgSend(*((id *)v64 + 26), "_setContinuousCornerRadius:", v65);
      objc_msgSend(a1[7], "_setContinuousCornerRadius:", v65);
      objc_msgSend(*((id *)a1[4] + 26), "layer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      BSRectWithSize();
      objc_msgSend(v66, "setBounds:");

    }
    else
    {
      v67 = objc_msgSend(v64, "_isTargetSourcePinningFrameEquivalentToSourceViewFrame");
      v68 = a1[4];
      v69 = 0.0;
      if (v67)
        v69 = *((double *)v68 + 27) * *((double *)v68 + 18);
      objc_msgSend(*((id *)v68 + 26), "_setContinuousCornerRadius:", v69);
      objc_msgSend(a1[7], "_setContinuousCornerRadius:", v69);
      v70 = (double *)a1[4];
      objc_msgSend(v70, "_targetInitialClippingBoundsWithSourceContentFrame:sourceFinalScale:targetViewBounds:", v70[46], v70[47], v70[48], v70[49], v70[18], v71, v29, v31, v33);
      objc_msgSend(*((id *)a1[4] + 26), "setBounds:");
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(a1[4], "noteTargetAnimationsWillStart:", 1);
LABEL_25:

    return;
  }
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (char *)a1[4];
    NSStringFromRect(*(NSRect *)(v7 + 368));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromRect(*(NSRect *)((char *)a1[4] + 272));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    v11 = a1[6];
    v12 = a1[7];
    *(_DWORD *)buf = 134219266;
    *(_QWORD *)&buf[4] = v7;
    v81 = 2112;
    v82 = v8;
    v83 = 2112;
    v84 = v9;
    v85 = 2048;
    v86 = v10;
    v87 = 2048;
    v88 = v11;
    v89 = 2048;
    v90 = v12;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Interrupting morph animator since match move was requested to start with invalid frames _sourceContentFrame{%@} _targetFinalFrame{%@} or missing views: sourceView(%p) targetView(%p) targetContentView(%p)", buf, 0x3Eu);

  }
  objc_msgSend(a1[4], "interrupt:", 0);
}

uint64_t __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  double x;
  double y;
  double width;
  double height;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGRect v23;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 64))
  {
    v23 = CGRectIntersection(*(CGRect *)(v2 + 368), *(CGRect *)(v2 + 336));
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    v7 = *(double *)(*(_QWORD *)(a1 + 40) + 144);
    objc_msgSend(*(id *)(a1 + 48), "bounds");
    objc_msgSend((id)v2, "_targetInitialClippingBoundsWithSourceContentFrame:sourceFinalScale:targetViewBounds:", x, y, width, height, v7, v8, v9, v10, v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBounds:", v13, v15, v17, v19);

  }
  else
  {
    v21 = *(void **)(v2 + 208);
    BSRectWithSize();
    objc_msgSend(v21, "setBounds:");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "_setContinuousCornerRadius:", *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 56));
}

uint64_t __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "noteTargetAnimationsDidEnd:finished:continueBlock:", 2, 1, 0);
}

- (void)_startMorphAnimationTimeoutTimer
{
  BSAbsoluteMachTimer *morphAnimationTimeout;
  BSAbsoluteMachTimer *v4;
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *v6;
  float v7;
  double v8;
  float v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[BSAbsoluteMachTimer invalidate](self->_morphAnimationTimeout, "invalidate");
  morphAnimationTimeout = self->_morphAnimationTimeout;
  self->_morphAnimationTimeout = 0;

  v4 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("morphAnimationTimeout"));
  v5 = self->_morphAnimationTimeout;
  self->_morphAnimationTimeout = v4;

  objc_initWeak(&location, self);
  v6 = self->_morphAnimationTimeout;
  if (-[SBViewMorphAnimator _isReversed](self, "_isReversed"))
  {
    UIAnimationDragCoefficient();
    v8 = v7 * 1.5;
  }
  else
  {
    UIAnimationDragCoefficient();
    v8 = v9;
  }
  v10 = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C80D38];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__SBViewMorphAnimator__startMorphAnimationTimeoutTimer__block_invoke;
  v12[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v13, &location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v6, "scheduleWithFireInterval:leewayInterval:queue:handler:", v10, v12, v8, 0.0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __55__SBViewMorphAnimator__startMorphAnimationTimeoutTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "interrupt:", 0);
    objc_msgSend(v3[23], "invalidate");
    v2 = v3[23];
    v3[23] = 0;

    WeakRetained = v3;
  }

}

- (void)willStartSourceAnimations:(unint64_t)a3
{
  SBViewMorphAnimatorContentBlackCurtainView *v5;
  SBViewMorphAnimatorContentBlackCurtainView *sourceBlackCurtainView;
  SBViewMorphAnimatorContentBlackCurtainView *v7;
  void *v8;
  SBViewMorphAnimatorContentBlackCurtainView *v9;
  id WeakRetained;
  id v11;
  BSAbsoluteMachTimer *v12;
  BSAbsoluteMachTimer *allAnimationsTimeoutTimer;
  BSAbsoluteMachTimer *v14;
  float v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  unint64_t startedSourceAnimations;
  _QWORD v21[4];
  id v22;
  id location;

  if (!self->_allAnimationsTimeoutTimer)
  {
    if (-[SBViewMorphAnimator _isReversed](self, "_isReversed"))
    {
      v5 = -[SBViewMorphAnimatorContentBlackCurtainView initWithFrame:]([SBViewMorphAnimatorContentBlackCurtainView alloc], "initWithFrame:", self->_sourceContentContainerFrame.origin.x, self->_sourceContentContainerFrame.origin.y, self->_sourceContentContainerFrame.size.width, self->_sourceContentContainerFrame.size.height);
      sourceBlackCurtainView = self->_sourceBlackCurtainView;
      self->_sourceBlackCurtainView = v5;

      v7 = self->_sourceBlackCurtainView;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewMorphAnimatorContentBlackCurtainView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      v9 = self->_sourceBlackCurtainView;
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "sourceBlackCurtainCornerRadiusForAnimator:", self);
      -[SBViewMorphAnimatorContentBlackCurtainView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:");

      v11 = objc_loadWeakRetained((id *)&self->_sourceView);
      objc_msgSend(v11, "addSubview:", self->_sourceBlackCurtainView);

    }
    objc_initWeak(&location, self);
    v12 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("allAnimationsTimeout"));
    allAnimationsTimeoutTimer = self->_allAnimationsTimeoutTimer;
    self->_allAnimationsTimeoutTimer = v12;

    v14 = self->_allAnimationsTimeoutTimer;
    if (self->_direction)
    {
      UIAnimationDragCoefficient();
      v16 = 2.0;
    }
    else
    {
      UIAnimationDragCoefficient();
      v16 = 1.5;
    }
    v17 = v16 * v15;
    v18 = MEMORY[0x1E0C80D38];
    v19 = MEMORY[0x1E0C80D38];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__SBViewMorphAnimator_willStartSourceAnimations___block_invoke;
    v21[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v22, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v14, "scheduleWithFireInterval:leewayInterval:queue:handler:", v18, v21, v17, 0.0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  startedSourceAnimations = self->_startedSourceAnimations;
  self->_startedSourceAnimations = startedSourceAnimations | a3;
  if ((startedSourceAnimations | a3) != startedSourceAnimations)
    -[SBViewMorphAnimator _checkAnimationsDependencies:](self, "_checkAnimationsDependencies:", 0);
}

void __49__SBViewMorphAnimator_willStartSourceAnimations___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "interrupt:", 0);
    objc_msgSend(v3[22], "invalidate");
    v2 = v3[22];
    v3[22] = 0;

    WeakRetained = v3;
  }

}

- (void)didEndSourceAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  unint64_t completedSourceAnimations;
  id v10;

  v5 = a4;
  v8 = a5;
  if (!v5)
  {
    v10 = v8;
    -[SBViewMorphAnimator interrupt:](self, "interrupt:", v8);
    goto LABEL_5;
  }
  completedSourceAnimations = self->_completedSourceAnimations;
  self->_completedSourceAnimations = completedSourceAnimations | a3;
  if ((completedSourceAnimations | a3) != completedSourceAnimations)
  {
    v10 = v8;
    -[SBViewMorphAnimator _checkAnimationsDependencies:](self, "_checkAnimationsDependencies:", v8);
LABEL_5:
    v8 = v10;
  }

}

- (void)willStartTargetAnimations:(unint64_t)a3
{
  unint64_t startedTargetAnimations;

  startedTargetAnimations = self->_startedTargetAnimations;
  self->_startedTargetAnimations = startedTargetAnimations | a3;
  if ((startedTargetAnimations | a3) != startedTargetAnimations)
    -[SBViewMorphAnimator _checkAnimationsDependencies:](self, "_checkAnimationsDependencies:", 0);
}

- (void)didEndTargetAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  unint64_t completedTargetAnimations;
  id v10;

  v5 = a4;
  v8 = a5;
  if (!v5)
  {
    v10 = v8;
    -[SBViewMorphAnimator interrupt:](self, "interrupt:", v8);
    goto LABEL_5;
  }
  completedTargetAnimations = self->_completedTargetAnimations;
  self->_completedTargetAnimations = completedTargetAnimations | a3;
  if ((completedTargetAnimations | a3) != completedTargetAnimations)
  {
    v10 = v8;
    -[SBViewMorphAnimator _checkAnimationsDependencies:](self, "_checkAnimationsDependencies:", v8);
LABEL_5:
    v8 = v10;
  }

}

- (void)_removeMatchMoveAnimation
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *morphAnimationTimeout;
  id WeakRetained;

  -[SBViewMorphAnimator _removeTargetClippingView](self, "_removeTargetClippingView");
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_msgSend(WeakRetained, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("SBMorphAnimatorLayerMatchMoveAnimationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (self->_direction)
    {
      v5 = objc_loadWeakRetained((id *)&self->_sourceView);
      objc_msgSend(v5, "frame");
      -[SBViewMorphAnimator noteWillRemoveTargeMatchMoveAnimationAtFrame:withinSourceFrame:](self, "noteWillRemoveTargeMatchMoveAnimationAtFrame:withinSourceFrame:", self->_targetSourcePinningFrame.origin.x, self->_targetSourcePinningFrame.origin.y, self->_targetSourcePinningFrame.size.width, self->_targetSourcePinningFrame.size.height, v6, v7, v8, v9);

      objc_msgSend(WeakRetained, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAnimationForKey:", CFSTR("SBMorphAnimatorLayerMatchMoveAnimationKey"));

      -[BSAbsoluteMachTimer invalidate](self->_morphAnimationTimeout, "invalidate");
      morphAnimationTimeout = self->_morphAnimationTimeout;
      self->_morphAnimationTimeout = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "layer");
      morphAnimationTimeout = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(morphAnimationTimeout, "removeAnimationForKey:", CFSTR("SBMorphAnimatorLayerMatchMoveAnimationKey"));
    }

  }
}

- (void)_checkAnimationsDependencies:(id)a3
{
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);
  id WeakRetained;
  BOOL v8;
  unint64_t completedSourceAnimations;
  unint64_t completedTargetAnimations;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  char v17;
  unint64_t v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  NSObject *v32;
  char v33;
  void *v34;
  id v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(_QWORD);
  id v53;
  unint64_t startedSourceAnimations;
  unint64_t v55;
  unint64_t startedTargetAnimations;
  _QWORD v57[5];
  BOOL v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  BOOL v62;
  _QWORD v63[5];
  _QWORD v64[5];
  uint8_t buf[4];
  SBViewMorphAnimator *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  unint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  v6 = v5;
  if (self->_invalidated)
  {
    if (v5)
      v5[2](v5);
    goto LABEL_62;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  v8 = -[SBViewMorphAnimator _isReversed](self, "_isReversed");
  completedSourceAnimations = self->_completedSourceAnimations;
  startedSourceAnimations = self->_startedSourceAnimations;
  completedTargetAnimations = self->_completedTargetAnimations;
  v55 = completedSourceAnimations & 0xF;
  startedTargetAnimations = self->_startedTargetAnimations;
  v11 = v55 == 15;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    SBViewMorphAnimatorCompletedSourceAnimationsDescription(self->_startedSourceAnimations);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBViewMorphAnimatorCompletedTargetAnimationsDescription(self->_startedTargetAnimations);
    v53 = WeakRetained;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBViewMorphAnimatorCompletedSourceAnimationsDescription(self->_completedSourceAnimations);
    v52 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBViewMorphAnimatorCompletedTargetAnimationsDescription(self->_completedTargetAnimations);
    v16 = a2;
    v17 = completedTargetAnimations;
    completedTargetAnimations = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v66 = self;
    v67 = 2114;
    v68 = v13;
    v69 = 2114;
    v70 = v14;
    v71 = 2114;
    v72 = v15;
    v73 = 2114;
    v74 = completedTargetAnimations;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] dependency check: startedSourceAnimations(%{public}@) startedTargetAnimations(%{public}@) completedSourceAnimations(%{public}@) completedTargetAnimations(%{public}@)", buf, 0x34u);

    LOBYTE(completedTargetAnimations) = v17;
    a2 = v16;

    v11 = (completedSourceAnimations & 0xF) == 15;
    v6 = v52;

    WeakRetained = v53;
  }
  v18 = completedTargetAnimations & 7;

  if (!v8)
  {
    v33 = startedTargetAnimations;
    if (self->_automaticallyStartTargetAnimations
      && (startedTargetAnimations & 1) != 0
      && (startedTargetAnimations & 2) == 0)
    {
      v34 = (void *)*MEMORY[0x1E0CEB258];
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke;
      v64[3] = &unk_1E8E9DED8;
      v64[4] = self;
      objc_msgSend(v34, "_performBlockAfterCATransactionCommits:", v64);
    }
    if ((startedSourceAnimations & 4) != 0
      && (completedSourceAnimations & 4) != 0
      && (startedTargetAnimations & 1) != 0)
    {
      v35 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v35, "hideSourceViewForAnimator:", self);
        SBLogCommon();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v66 = self;
          _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Hiding source view since source clip ended and match move started.", buf, 0xCu);
        }

        v33 = startedTargetAnimations;
      }

    }
    v37 = 0;
    if (v55 == 15 && (completedTargetAnimations & 1) == 0)
    {
      if ((v33 & 1) != 0)
      {
        -[SBViewMorphAnimator _continueSourceAnimationsCompletionPendingBlock](self, "_continueSourceAnimationsCompletionPendingBlock");
        -[SBViewMorphAnimator _removeMatchMoveAnimation](self, "_removeMatchMoveAnimation");
        v41 = (void *)*MEMORY[0x1E0CEB258];
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_51;
        v63[3] = &unk_1E8E9DED8;
        v63[4] = self;
        objc_msgSend(v41, "_performBlockAfterCATransactionCommits:", v63);
        SBLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v66 = self;
          _os_log_impl(&dword_1D0540000, v42, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Removed target match move since all source animations ended and match move was started.", buf, 0xCu);
        }

        v37 = 0;
      }
      else
      {
        v37 = 0;
        if (v6 && !self->_sourceAllEnded)
        {
          if (self->_sourceAllAnimationsCompletionBlock)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 747, CFSTR("Morph animator was notified twice about source scale and position animations end."));

          }
          if (self->_direction)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 748, CFSTR("This path shouldn't be taken for reverse direction."));

          }
          SBLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v66 = self;
            _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Waiting for target match move animation to start before calling source scale and position ended continuation block.", buf, 0xCu);
          }

          -[SBViewMorphAnimator setSourceAllAnimationsCompletionBlock:](self, "setSourceAllAnimationsCompletionBlock:", v6);
          v37 = 1;
        }
      }
      self->_sourceAllEnded = v11;
    }
    v31 = v37 != 0;
    if (v18 != 7)
      goto LABEL_58;
    v39 = (void *)*MEMORY[0x1E0CEB258];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_56;
    v61[3] = &unk_1E8E9F508;
    v61[4] = self;
    v62 = v11;
    v40 = v61;
    goto LABEL_57;
  }
  v19 = startedTargetAnimations;
  if ((startedTargetAnimations & 3) == 1)
  {
    v20 = (void *)*MEMORY[0x1E0CEB258];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_2;
    v60[3] = &unk_1E8E9DED8;
    v60[4] = self;
    objc_msgSend(v20, "_performBlockAfterCATransactionCommits:", v60);
  }
  if (v55 == 15)
  {
    if (self->_sourceBlackCurtainView)
    {
      objc_msgSend(WeakRetained, "superview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewMorphAnimatorContentBlackCurtainView superview](self->_sourceBlackCurtainView, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewMorphAnimatorContentBlackCurtainView frame](self->_sourceBlackCurtainView, "frame");
      objc_msgSend(v22, "convertRect:toView:", v21);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v19 = startedTargetAnimations;
      objc_msgSend(v21, "insertSubview:belowSubview:", self->_sourceBlackCurtainView, WeakRetained);
      -[SBViewMorphAnimatorContentBlackCurtainView setFrame:](self->_sourceBlackCurtainView, "setFrame:", v24, v26, v28, v30);

    }
    if ((completedTargetAnimations & 1) == 0)
    {
      if ((v19 & 1) != 0)
      {
        if ((completedTargetAnimations & 4) != 0)
        {
          -[SBViewMorphAnimator _continueSourceAnimationsCompletionPendingBlock](self, "_continueSourceAnimationsCompletionPendingBlock");
          v31 = 0;
        }
        else
        {
          v31 = 0;
          if (v6 && !self->_sourceAllEnded)
          {
            if (self->_sourceAllAnimationsCompletionBlock)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 785, CFSTR("Morph animator was notified twice about source scale and position animations end."));

            }
            if (self->_direction != 1)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 786, CFSTR("This path shouldn't be taken for forward direction."));

            }
            SBLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v66 = self;
              _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Waiting for target external placeholder animations to complete before calling source scale and position ended continuation block.", buf, 0xCu);
            }

            -[SBViewMorphAnimator setSourceAllAnimationsCompletionBlock:](self, "setSourceAllAnimationsCompletionBlock:", v6);
            v31 = 1;
          }
        }
        -[SBViewMorphAnimator _removeMatchMoveAnimation](self, "_removeMatchMoveAnimation");
        v44 = (void *)*MEMORY[0x1E0CEB258];
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_59;
        v59[3] = &unk_1E8E9DED8;
        v59[4] = self;
        objc_msgSend(v44, "_performBlockAfterCATransactionCommits:", v59);
        SBLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v66 = self;
          _os_log_impl(&dword_1D0540000, v45, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Removed target match move since all source animations ended and match move was started.", buf, 0xCu);
        }

      }
      else
      {
        v31 = 0;
        if (v6 && !self->_sourceAllEnded)
        {
          if (self->_sourceAllAnimationsCompletionBlock)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 800, CFSTR("Morph animator was notified twice about source scale and position animations end."));

          }
          if (self->_direction != 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBViewMorphAnimator.m"), 801, CFSTR("This path shouldn't be taken for forward direction."));

          }
          SBLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v66 = self;
            _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Waiting for target match move animation to start before calling source scale and position ended continuation block.", buf, 0xCu);
          }

          -[SBViewMorphAnimator setSourceAllAnimationsCompletionBlock:](self, "setSourceAllAnimationsCompletionBlock:", v6);
          v31 = 1;
        }
      }
      self->_sourceAllEnded = v11;
      if ((completedTargetAnimations & 4) == 0)
        goto LABEL_49;
      goto LABEL_48;
    }
  }
  v31 = 0;
  if ((completedTargetAnimations & 4) != 0)
LABEL_48:
    -[SBViewMorphAnimator _continueSourceAnimationsCompletionPendingBlock](self, "_continueSourceAnimationsCompletionPendingBlock");
LABEL_49:
  if (v18 != 7)
    goto LABEL_58;
  v39 = (void *)*MEMORY[0x1E0CEB258];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_60;
  v57[3] = &unk_1E8E9F508;
  v57[4] = self;
  v58 = v11;
  v40 = v57;
LABEL_57:
  objc_msgSend(v39, "_performBlockAfterCATransactionCommits:", v40);
LABEL_58:
  if (v6 && !v31)
    v6[2](v6);

LABEL_62:
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Auto starting target unclip since target match move started.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "startTargetAnimations:", 2);
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "noteTargetAnimationsDidEnd:finished:continueBlock:", 1, 1, 0);
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeMatchMoveAnimation");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_noteDidEndAllAnimations");
  return result;
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Auto starting target unclip since target match move started.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "startTargetAnimations:", 2);
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "noteTargetAnimationsDidEnd:finished:continueBlock:", 1, 1, 0);
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_60(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeMatchMoveAnimation");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_noteDidEndAllAnimations");
  return result;
}

- (void)setSourceAllAnimationsCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id sourceAllAnimationsCompletionBlock;
  int64_t direction;
  float v8;
  float v9;
  double v10;
  BSAbsoluteMachTimer *v11;
  BSAbsoluteMachTimer *sourceAnimationsCompletionContinueBlockTimeoutTimer;
  BSAbsoluteMachTimer *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D17E5550]();
  sourceAllAnimationsCompletionBlock = self->_sourceAllAnimationsCompletionBlock;
  self->_sourceAllAnimationsCompletionBlock = v5;

  direction = self->_direction;
  UIAnimationDragCoefficient();
  v9 = v8;
  if (direction)
    v10 = 1.5;
  else
    v10 = 0.1;
  objc_initWeak(&location, self);
  v11 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("sourceAnimationsCompletionTimeout"));
  sourceAnimationsCompletionContinueBlockTimeoutTimer = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  self->_sourceAnimationsCompletionContinueBlockTimeoutTimer = v11;

  v13 = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  v14 = MEMORY[0x1E0C80D38];
  v15 = MEMORY[0x1E0C80D38];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__SBViewMorphAnimator_setSourceAllAnimationsCompletionBlock___block_invoke;
  v16[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v17, &location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", v14, v16, v10 * v9, 0.0);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __61__SBViewMorphAnimator_setSourceAllAnimationsCompletionBlock___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[24], "invalidate");
    v2 = v3[24];
    v3[24] = 0;

    objc_msgSend(v3, "_handleHandoffTimeout");
    WeakRetained = v3;
  }

}

- (void)_continueSourceAnimationsCompletionPendingBlock
{
  BSAbsoluteMachTimer *sourceAnimationsCompletionContinueBlockTimeoutTimer;
  BSAbsoluteMachTimer *v4;
  void (**sourceAllAnimationsCompletionBlock)(id, SEL);
  id v6;

  sourceAnimationsCompletionContinueBlockTimeoutTimer = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  if (sourceAnimationsCompletionContinueBlockTimeoutTimer)
  {
    -[BSAbsoluteMachTimer invalidate](sourceAnimationsCompletionContinueBlockTimeoutTimer, "invalidate");
    v4 = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
    self->_sourceAnimationsCompletionContinueBlockTimeoutTimer = 0;

  }
  sourceAllAnimationsCompletionBlock = (void (**)(id, SEL))self->_sourceAllAnimationsCompletionBlock;
  if (sourceAllAnimationsCompletionBlock)
  {
    sourceAllAnimationsCompletionBlock[2](sourceAllAnimationsCompletionBlock, a2);
    v6 = self->_sourceAllAnimationsCompletionBlock;
    self->_sourceAllAnimationsCompletionBlock = 0;

  }
}

- (void)_handleHandoffTimeout
{
  -[SBViewMorphAnimator noteTargetAnimationsDidEnd:finished:continueBlock:](self, "noteTargetAnimationsDidEnd:finished:continueBlock:", 7, 0, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (UIView)targetContentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetContentView);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (SBFFluidBehaviorSettings)sourceClipAnimationSettings
{
  return self->_sourceClipAnimationSettings;
}

- (void)setSourceClipAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sourceClipAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)targetClipAnimationSettings
{
  return self->_targetClipAnimationSettings;
}

- (void)setTargetClipAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_targetClipAnimationSettings, a3);
}

- (SBViewMorphAnimatorDelegate)delegate
{
  return (SBViewMorphAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBViewMorphAnimatorDataSource)dataSource
{
  return (SBViewMorphAnimatorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BOOL)automaticallyStartSourceAnimations
{
  return self->_automaticallyStartSourceAnimations;
}

- (void)setAutomaticallyStartSourceAnimations:(BOOL)a3
{
  self->_automaticallyStartSourceAnimations = a3;
}

- (BOOL)automaticallyStartTargetAnimations
{
  return self->_automaticallyStartTargetAnimations;
}

- (void)setAutomaticallyStartTargetAnimations:(BOOL)a3
{
  self->_automaticallyStartTargetAnimations = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)startedSourceAnimations
{
  return self->_startedSourceAnimations;
}

- (void)setStartedSourceAnimations:(unint64_t)a3
{
  self->_startedSourceAnimations = a3;
}

- (unint64_t)startedTargetAnimations
{
  return self->_startedTargetAnimations;
}

- (void)setStartedTargetAnimations:(unint64_t)a3
{
  self->_startedTargetAnimations = a3;
}

- (unint64_t)completedSourceAnimations
{
  return self->_completedSourceAnimations;
}

- (void)setCompletedSourceAnimations:(unint64_t)a3
{
  self->_completedSourceAnimations = a3;
}

- (unint64_t)completedTargetAnimations
{
  return self->_completedTargetAnimations;
}

- (void)setCompletedTargetAnimations:(unint64_t)a3
{
  self->_completedTargetAnimations = a3;
}

- (CGPoint)sourceFinalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_sourceFinalCenter.x;
  y = self->_sourceFinalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)sourceFinalScale
{
  return self->_sourceFinalScale;
}

- (CGRect)targetSourcePinningFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetSourcePinningFrame.origin.x;
  y = self->_targetSourcePinningFrame.origin.y;
  width = self->_targetSourcePinningFrame.size.width;
  height = self->_targetSourcePinningFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)targetFinalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFinalFrame.origin.x;
  y = self->_targetFinalFrame.origin.y;
  width = self->_targetFinalFrame.size.width;
  height = self->_targetFinalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)sourceAllEnded
{
  return self->_sourceAllEnded;
}

- (void)setSourceAllEnded:(BOOL)a3
{
  self->_sourceAllEnded = a3;
}

- (BOOL)targetExternalPlaceholderAllEnded
{
  return self->_targetExternalPlaceholderAllEnded;
}

- (void)setTargetExternalPlaceholderAllEnded:(BOOL)a3
{
  self->_targetExternalPlaceholderAllEnded = a3;
}

- (BOOL)sourceContentFrameWasAltered
{
  return self->_sourceContentFrameWasAltered;
}

- (void)setSourceContentFrameWasAltered:(BOOL)a3
{
  self->_sourceContentFrameWasAltered = a3;
}

- (id)sourceAllAnimationsCompletionBlock
{
  return self->_sourceAllAnimationsCompletionBlock;
}

- (BSAbsoluteMachTimer)allAnimationsTimeoutTimer
{
  return self->_allAnimationsTimeoutTimer;
}

- (void)setAllAnimationsTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_allAnimationsTimeoutTimer, a3);
}

- (BSAbsoluteMachTimer)morphAnimationTimeout
{
  return self->_morphAnimationTimeout;
}

- (void)setMorphAnimationTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_morphAnimationTimeout, a3);
}

- (BSAbsoluteMachTimer)sourceAnimationsCompletionContinueBlockTimeoutTimer
{
  return self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
}

- (void)setSourceAnimationsCompletionContinueBlockTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAnimationsCompletionContinueBlockTimeoutTimer, a3);
}

- (SBViewMorphAnimatorContentBlackCurtainView)sourceBlackCurtainView
{
  return self->_sourceBlackCurtainView;
}

- (void)setSourceBlackCurtainView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBlackCurtainView, a3);
}

- (SBViewMorphAnimatorContentClippingView)targetContentClippingView
{
  return self->_targetContentClippingView;
}

- (void)setTargetContentClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_targetContentClippingView, a3);
}

- (CGRect)targetContentClippingViewInitialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetContentClippingViewInitialFrame.origin.x;
  y = self->_targetContentClippingViewInitialFrame.origin.y;
  width = self->_targetContentClippingViewInitialFrame.size.width;
  height = self->_targetContentClippingViewInitialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetContentClippingViewInitialFrame:(CGRect)a3
{
  self->_targetContentClippingViewInitialFrame = a3;
}

- (CGRect)sourceContentContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceContentContainerFrame.origin.x;
  y = self->_sourceContentContainerFrame.origin.y;
  width = self->_sourceContentContainerFrame.size.width;
  height = self->_sourceContentContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceContentContainerFrame:(CGRect)a3
{
  self->_sourceContentContainerFrame = a3;
}

- (CGRect)sourceContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceContentFrame.origin.x;
  y = self->_sourceContentFrame.origin.y;
  width = self->_sourceContentFrame.size.width;
  height = self->_sourceContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (double)sourceCornerRadius
{
  return self->_sourceCornerRadius;
}

- (void)setSourceCornerRadius:(double)a3
{
  self->_sourceCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentClippingView, 0);
  objc_storeStrong((id *)&self->_sourceBlackCurtainView, 0);
  objc_storeStrong((id *)&self->_sourceAnimationsCompletionContinueBlockTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_morphAnimationTimeout, 0);
  objc_storeStrong((id *)&self->_allAnimationsTimeoutTimer, 0);
  objc_storeStrong(&self->_sourceAllAnimationsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetClipAnimationSettings, 0);
  objc_storeStrong((id *)&self->_sourceClipAnimationSettings, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_targetContentView);
  objc_destroyWeak((id *)&self->_targetView);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
