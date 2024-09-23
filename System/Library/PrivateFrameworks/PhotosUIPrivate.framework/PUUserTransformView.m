@implementation PUUserTransformView

- (PUUserTransformView)initWithFrame:(CGRect)a3
{
  PUUserTransformView *result;
  uint64_t v4;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUUserTransformView;
  result = -[PUUserTransformView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_userAffineTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_userAffineTransform.c = v5;
    *(_OWORD *)&result->_userAffineTransform.tx = *(_OWORD *)(v4 + 32);
    result->_enabledInteractions = 7;
    result->__needsUpdateScrollView = 1;
    result->__preferredMinimumZoomScale = 1.0;
    result->__contentZoomScale = 1.0;
    result->_desiredZoomScale = result->__preferredMinimumZoomScale;
    result->_minimumZoomScale = result->__preferredMinimumZoomScale;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $F09A07BAA3E92C2C8B3C4D292C73F932 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToShouldReceiveTouchAtPoint = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeIsUserInteracting = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeIsZoomedIn = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setContentPixelSize:(CGSize)a3
{
  if (a3.width != self->_contentPixelSize.width || a3.height != self->_contentPixelSize.height)
  {
    self->_contentPixelSize = a3;
    -[PUUserTransformView _invalidateScrollView](self, "_invalidateScrollView");
  }
}

- (void)setRequireTwoTouchesForPan:(BOOL)a3
{
  if (self->_requireTwoTouchesForPan != a3)
  {
    self->_requireTwoTouchesForPan = a3;
    -[PUUserTransformView _invalidateScrollView](self, "_invalidateScrollView");
  }
}

- (void)setUntransformedContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_untransformedContentFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_untransformedContentFrame = &self->_untransformedContentFrame;
  if (!CGRectEqualToRect(a3, self->_untransformedContentFrame))
  {
    p_untransformedContentFrame->origin.x = x;
    p_untransformedContentFrame->origin.y = y;
    p_untransformedContentFrame->size.width = width;
    p_untransformedContentFrame->size.height = height;
    -[PUUserTransformView _invalidateScrollView](self, "_invalidateScrollView");
  }
}

- (void)setUserAffineTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_userAffineTransform;
  __int128 v6;
  __int128 v7;

  p_userAffineTransform = &self->_userAffineTransform;
  if ((PUAffineTransformIsApproximatelyEqualToTransform() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->a;
    v7 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_userAffineTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_userAffineTransform->tx = v7;
    *(_OWORD *)&p_userAffineTransform->a = v6;
    -[PUUserTransformView _invalidateScrollView](self, "_invalidateScrollView");
  }
}

- (void)setEnabledInteractions:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PUUserTransformView_setEnabledInteractions___block_invoke;
  v3[3] = &unk_1E58AACF0;
  v3[4] = self;
  v3[5] = a3;
  -[PUUserTransformView _performZoomAndScrollChanges:](self, "_performZoomAndScrollChanges:", v3);
}

- (void)setScrollPadding:(CGSize)a3
{
  uint64_t v4;
  _QWORD v5[5];

  if (a3.width != self->_scrollPadding.width || a3.height != self->_scrollPadding.height)
  {
    v4 = MEMORY[0x1E0C809B0];
    self->_scrollPadding = a3;
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __40__PUUserTransformView_setScrollPadding___block_invoke;
    v5[3] = &unk_1E58ABD10;
    v5[4] = self;
    -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v5);
  }
}

- (void)setMinimumZoomScale:(double)a3
{
  -[PUUserTransformView setMinimumZoomScale:animated:](self, "setMinimumZoomScale:animated:", 0, a3);
}

- (void)setMinimumZoomScale:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double minimumZoomScale;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v13;

  v4 = a4;
  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minimumZoomScale >= 0"));

  }
  minimumZoomScale = self->_minimumZoomScale;
  if (minimumZoomScale != a3)
  {
    self->_minimumZoomScale = a3;
    -[PUUserTransformView _scrollView](self, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "zoomScale");
    v10 = v9;

    if (v10 == minimumZoomScale)
      v11 = -[PUUserTransformView isUserInteracting](self, "isUserInteracting") ^ 1;
    else
      v11 = 0;
    -[PUUserTransformView _updateScrollViewMinimumZoomScaleAndGoToMinimum:animated:](self, "_updateScrollViewMinimumZoomScaleAndGoToMinimum:animated:", v11, v4);
  }
}

- (void)_updateScrollViewMinimumZoomScaleAndGoToMinimum:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD aBlock[6];
  BOOL v28;

  -[PUUserTransformView minimumZoomScale](self, "minimumZoomScale");
  v8 = v7;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoomScale");
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke;
  aBlock[3] = &unk_1E58AA4F0;
  aBlock[4] = self;
  aBlock[5] = v8;
  v28 = a4;
  v13 = _Block_copy(aBlock);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_2;
  v24[3] = &unk_1E58AACF0;
  v25 = v9;
  v26 = v8;
  v14 = v9;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_3;
  v17[3] = &unk_1E58AA568;
  v22 = a3;
  v20 = v8;
  v21 = v11;
  v23 = a4;
  v17[4] = self;
  v18 = v13;
  v19 = _Block_copy(v24);
  v15 = v19;
  v16 = v13;
  -[PUUserTransformView _performZoomAndScrollChanges:](self, "_performZoomAndScrollChanges:", v17);

}

- (BOOL)contentContainsLocationFromProvider:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUUserTransformView scrollContentView](self, "scrollContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "locationInView:", v5);
    v6 = objc_msgSend(v5, "pointInside:withEvent:", 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setOffset:(CGPoint)a3
{
  -[PUUserTransformView setOffset:animated:](self, "setOffset:animated:", 0, a3.x, a3.y);
}

- (void)setOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  if (a3.x != self->_offset.x || a3.y != self->_offset.y)
  {
    self->_offset = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__PUUserTransformView_setOffset_animated___block_invoke;
    v5[3] = &unk_1E58AAD68;
    v5[4] = self;
    v6 = a4;
    -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v5);
  }
}

- (void)toggleZoomWithLocationProvider:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PUUserTransformView hasUserZoomedIn](self, "hasUserZoomedIn"))
    -[PUUserTransformView zoomInOnLocationFromProvider:](self, "zoomInOnLocationFromProvider:", v4);
  else
    -[PUUserTransformView zoomOut:](self, "zoomOut:", 1);

}

- (void)zoomInOnLocationFromProvider:(id)a3
{
  -[PUUserTransformView zoomInOnLocationFromProvider:animated:](self, "zoomInOnLocationFromProvider:animated:", a3, 1);
}

- (void)zoomInOnLocationFromProvider:(id)a3 animated:(BOOL)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  v6 = a3;
  if ((-[PUUserTransformView enabledInteractions](self, "enabledInteractions") & 2) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__PUUserTransformView_zoomInOnLocationFromProvider_animated___block_invoke;
    v7[3] = &unk_1E58AA878;
    v7[4] = self;
    v8 = v6;
    v9 = a4;
    -[PUUserTransformView _performZoomAndScrollChanges:](self, "_performZoomAndScrollChanges:", v7);

  }
}

- (void)zoomOut:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if ((-[PUUserTransformView enabledInteractions](self, "enabledInteractions") & 4) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __31__PUUserTransformView_zoomOut___block_invoke;
    v5[3] = &unk_1E58AAD68;
    v5[4] = self;
    v6 = a3;
    -[PUUserTransformView _performZoomAndScrollChanges:](self, "_performZoomAndScrollChanges:", v5);
  }
}

- (void)setDebugScrollViewContentImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_debugScrollViewContentImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_debugScrollViewContentImage, a3);
    -[PUUserTransformView _invalidateScrollView](self, "_invalidateScrollView");
    v5 = v6;
  }

}

- (void)layoutSubviews
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUUserTransformView;
  -[PUUserTransformView layoutSubviews](&v13, sel_layoutSubviews);
  -[PUUserTransformView _updateScrollViewFrame](self, "_updateScrollViewFrame");
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[PUUserTransformView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;

  if (v5 != v9 || v7 != v11)
    -[PUUserTransformView _setNeedsUpdateScrollView:](self, "_setNeedsUpdateScrollView:", 1);
  -[PUUserTransformView _updateScrollViewIfNeeded](self, "_updateScrollViewIfNeeded");
}

- (void)_updateScrollViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[PUUserTransformView bounds](self, "bounds");
  -[PUUserTransformView offset](self, "offset");
  PXRectGetCenter();
  PXPointAdd();
  v4 = v3;
  v6 = v5;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", v4, v6);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)PUUserTransformView;
  if (!-[PUUserTransformView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, a4))
    return 0;
  if (!self->_delegateFlags.respondsToShouldReceiveTouchAtPoint)
    return 1;
  -[PUUserTransformView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userTransformView:shouldReceiveTouchAtPoint:", self, x, y);

  return v8;
}

- (void)_assertInsideStateChangeBlock
{
  id v4;

  if (-[PUUserTransformView _numberOfNestedStateChanges](self, "_numberOfNestedStateChanges") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 372, CFSTR("not within a state change block"));

  }
}

- (void)_assertInsideStateUpdate
{
  id v4;

  if (!-[PUUserTransformView _isUpdatingState](self, "_isUpdatingState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 377, CFSTR("not within a state update"));

  }
}

- (void)_performStateChanges:(id)a3
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock"));

  }
  -[PUUserTransformView _willChangeState](self, "_willChangeState");
  v6[2]();
  -[PUUserTransformView _didChangeState](self, "_didChangeState");

}

- (void)_willChangeState
{
  -[PUUserTransformView _setNumberOfNestedStateChanges:](self, "_setNumberOfNestedStateChanges:", -[PUUserTransformView _numberOfNestedStateChanges](self, "_numberOfNestedStateChanges") + 1);
}

- (void)_didChangeState
{
  int64_t v3;

  v3 = -[PUUserTransformView _numberOfNestedStateChanges](self, "_numberOfNestedStateChanges") - 1;
  -[PUUserTransformView _setNumberOfNestedStateChanges:](self, "_setNumberOfNestedStateChanges:", v3);
  if (!v3)
    -[PUUserTransformView _updateStateIfNeeded](self, "_updateStateIfNeeded");
}

- (void)_updateStateIfNeeded
{
  _BOOL8 v4;
  id v5;

  if (!-[PUUserTransformView _isUpdatingScrollView](self, "_isUpdatingScrollView")
    && -[PUUserTransformView _needsStateUpdate](self, "_needsStateUpdate"))
  {
    v4 = -[PUUserTransformView _isUpdatingState](self, "_isUpdatingState");
    -[PUUserTransformView _setUpdatingState:](self, "_setUpdatingState:", 1);
    -[PUUserTransformView _setWasUserInteractingBeforeStateUpdate:](self, "_setWasUserInteractingBeforeStateUpdate:", -[PUUserTransformView isUserInteracting](self, "isUserInteracting"));
    -[PUUserTransformView _updateUserPanningOrDeceleratingIfNeeded](self, "_updateUserPanningOrDeceleratingIfNeeded");
    -[PUUserTransformView _updateContentStateIfNeeded](self, "_updateContentStateIfNeeded");
    -[PUUserTransformView _updateAnimatingZoomEndIfNeeded](self, "_updateAnimatingZoomEndIfNeeded");
    -[PUUserTransformView _updateUserZoomingOrBouncingIfNeeded](self, "_updateUserZoomingOrBouncingIfNeeded");
    -[PUUserTransformView _updateUserInteractingIfNeeded](self, "_updateUserInteractingIfNeeded");
    -[PUUserTransformView _updateShouldTrackContentAnimationIfNeeded](self, "_updateShouldTrackContentAnimationIfNeeded");
    -[PUUserTransformView _updateUserAffineTransformIfNeeded](self, "_updateUserAffineTransformIfNeeded");
    -[PUUserTransformView _updateEnabledInteractionsIfNeeded](self, "_updateEnabledInteractionsIfNeeded");
    -[PUUserTransformView _setUpdatingState:](self, "_setUpdatingState:", v4);
    if (-[PUUserTransformView _needsStateUpdate](self, "_needsStateUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 427, CFSTR("state updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsStateUpdate
{
  return -[PUUserTransformView _needsUpdateUserPanningOrDecelerating](self, "_needsUpdateUserPanningOrDecelerating")
      || -[PUUserTransformView _needsUpdateUserZoomingOrBouncing](self, "_needsUpdateUserZoomingOrBouncing")
      || -[PUUserTransformView _needsUpdateUserInteracting](self, "_needsUpdateUserInteracting")
      || -[PUUserTransformView _needsUpdateShouldTrackContentAnimation](self, "_needsUpdateShouldTrackContentAnimation")
      || -[PUUserTransformView _needsUpdateUserAffineTransform](self, "_needsUpdateUserAffineTransform")
      || -[PUUserTransformView _needsUpdateContentState](self, "_needsUpdateContentState")
      || -[PUUserTransformView _needsUpdateAnimatingZoomEnd](self, "_needsUpdateAnimatingZoomEnd");
}

- (void)_setNeedsStateUpdate
{
  id v4;

  if (!-[PUUserTransformView _isUpdatingState](self, "_isUpdatingState")
    && -[PUUserTransformView _numberOfNestedStateChanges](self, "_numberOfNestedStateChanges") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 445, CFSTR("not within a state update or change block"));

  }
}

- (void)_setUserPanning:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateChangeBlock](self, "_assertInsideStateChangeBlock");
  if (self->__isUserPanning != v3)
  {
    self->__isUserPanning = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserPanning=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserPanningOrDecelerating](self, "_invalidateUserPanningOrDecelerating");
  }
}

- (void)_setUserDeceleratingPan:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateChangeBlock](self, "_assertInsideStateChangeBlock");
  if (self->__isUserDeceleratingPan != v3)
  {
    self->__isUserDeceleratingPan = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserDeceleratingPan=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserPanningOrDecelerating](self, "_invalidateUserPanningOrDecelerating");
  }
}

- (void)_setUserZooming:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateChangeBlock](self, "_assertInsideStateChangeBlock");
  if (self->__isUserZooming != v3)
  {
    self->__isUserZooming = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserZooming=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserZoomingOrBouncing](self, "_invalidateUserZoomingOrBouncing");
    if (v3)
      -[PUUserTransformView _invalidateEnabledInteractions](self, "_invalidateEnabledInteractions");
  }
}

- (void)_invalidateEnabledInteractions
{
  -[PUUserTransformView setNeedsUpdateEnabledInteractions:](self, "setNeedsUpdateEnabledInteractions:", 1);
}

- (void)_updateEnabledInteractionsIfNeeded
{
  if (-[PUUserTransformView needsUpdateEnabledInteractions](self, "needsUpdateEnabledInteractions"))
  {
    -[PUUserTransformView setNeedsUpdateEnabledInteractions:](self, "setNeedsUpdateEnabledInteractions:", 0);
    if (-[PUUserTransformView _isUserZooming](self, "_isUserZooming"))
      -[PUUserTransformView setEnabledInteractions:](self, "setEnabledInteractions:", 7);
  }
}

- (void)_setUserEndingZoom:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateChangeBlock](self, "_assertInsideStateChangeBlock");
  if (self->__isUserEndingZoom != v3)
  {
    self->__isUserEndingZoom = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserEndingZoom=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserZoomingOrBouncing](self, "_invalidateUserZoomingOrBouncing");
    if (v3)
      -[PUUserTransformView _invalidateAnimatingZoomEnd](self, "_invalidateAnimatingZoomEnd");
  }
}

- (void)_setUserPanningOrDecelerating:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->__isUserPanningOrDecelerating != v3)
  {
    self->__isUserPanningOrDecelerating = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserPanningOrDecelerating=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserInteracting](self, "_invalidateUserInteracting");
  }
}

- (void)_setUserZoomingOrBouncing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->__isUserZoomingOrBouncing != v3)
  {
    self->__isUserZoomingOrBouncing = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserZoomingOrBouncing=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserInteracting](self, "_invalidateUserInteracting");
  }
}

- (void)_setUserInteracting:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  PUUserTransformView *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->_isUserInteracting != v3)
  {
    self->_isUserInteracting = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = self;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserInteracting=%i", (uint8_t *)&v7, 0x12u);
    }

    -[PUUserTransformView _invalidateUserAffineTransform](self, "_invalidateUserAffineTransform");
    if (self->_delegateFlags.respondsToDidChangeIsUserInteracting)
    {
      -[PUUserTransformView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userTransformView:didChangeIsUserInteracting:", self, v3);

    }
  }
}

- (void)_setShouldTrackContentAnimation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->__shouldTrackContentAnimation != v3)
  {
    self->__shouldTrackContentAnimation = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p shouldTrackContentAnimation=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _updateDisplayLink](self, "_updateDisplayLink");
  }
}

- (void)_setContentAnimating:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->__isContentAnimating != v3)
  {
    self->__isContentAnimating = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isContentAnimating=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateAnimatingZoomEnd](self, "_invalidateAnimatingZoomEnd");
    -[PUUserTransformView _invalidateShouldTrackContentAnimation](self, "_invalidateShouldTrackContentAnimation");
  }
}

- (void)_setContentCenter:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v7;
  void *v8;
  int v9;
  PUUserTransformView *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  CGPoint v14;

  y = a3.y;
  x = a3.x;
  v13 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (x != self->__contentCenter.x || y != self->__contentCenter.y)
  {
    self->__contentCenter.x = x;
    self->__contentCenter.y = y;
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14.x = x;
      v14.y = y;
      NSStringFromCGPoint(v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "%p contentCenter=%@", (uint8_t *)&v9, 0x16u);

    }
    -[PUUserTransformView _invalidateUserAffineTransform](self, "_invalidateUserAffineTransform");
  }
}

- (void)_setContentZoomScale:(double)a3
{
  void *v5;
  int v6;
  double v7;
  NSObject *v8;
  int v9;
  PUUserTransformView *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->__contentZoomScale != a3)
  {
    -[PUUserTransformView _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isZooming");

    if (v6)
    {
      -[PUUserTransformView minimumZoomScale](self, "minimumZoomScale");
      -[PUUserTransformView setHasUserZoomedIn:](self, "setHasUserZoomedIn:", v7 < a3);
    }
    self->__contentZoomScale = a3;
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134218240;
      v10 = self;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "%p contentZoomScale=%f", (uint8_t *)&v9, 0x16u);
    }

    -[PUUserTransformView _invalidateUserAffineTransform](self, "_invalidateUserAffineTransform");
  }
}

- (void)_setAnimatingZoomEnd:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PUUserTransformView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  if (self->__isAnimatingZoomEnd != v3)
  {
    self->__isAnimatingZoomEnd = v3;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%p isAnimatingZoomEnd=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PUUserTransformView _invalidateUserZoomingOrBouncing](self, "_invalidateUserZoomingOrBouncing");
  }
}

- (void)_setUserAffineTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  NSObject *v9;
  __int128 v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUUserTransformView _assertInsideStateUpdate](self, "_assertInsideStateUpdate");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v6 = *(_OWORD *)&self->_userAffineTransform.c;
  *(_OWORD *)&v16.a = *(_OWORD *)&self->_userAffineTransform.a;
  *(_OWORD *)&v16.c = v6;
  *(_OWORD *)&v16.tx = *(_OWORD *)&self->_userAffineTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v16))
  {
    v7 = *(_OWORD *)&a3->a;
    v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_userAffineTransform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_userAffineTransform.tx = v8;
    *(_OWORD *)&self->_userAffineTransform.a = v7;
    PLOneUpGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_OWORD *)&a3->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&t1.c = v10;
      *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
      NSStringFromCGAffineTransform(&t1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(t1.a) = 134218242;
      *(_QWORD *)((char *)&t1.a + 4) = self;
      WORD2(t1.b) = 2112;
      *(_QWORD *)((char *)&t1.b + 6) = v11;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "%p userAffineTransform=%@", (uint8_t *)&t1, 0x16u);

    }
    v12 = -[PUUserTransformView isUserInteracting](self, "isUserInteracting");
    v13 = -[PUUserTransformView _wasUserInteractingBeforeStateUpdate](self, "_wasUserInteractingBeforeStateUpdate") | v12;
    -[PUUserTransformView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    objc_msgSend(v14, "userTransformView:didChangeUserAffineTransform:isUserInteracting:", self, &t1, v13);

  }
}

- (void)_invalidateUserPanningOrDecelerating
{
  -[PUUserTransformView _setNeedsUpdateUserPanningOrDecelerating:](self, "_setNeedsUpdateUserPanningOrDecelerating:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateUserPanningOrDeceleratingIfNeeded
{
  _BOOL8 v3;

  if (-[PUUserTransformView _needsUpdateUserPanningOrDecelerating](self, "_needsUpdateUserPanningOrDecelerating"))
  {
    -[PUUserTransformView _setNeedsUpdateUserPanningOrDecelerating:](self, "_setNeedsUpdateUserPanningOrDecelerating:", 0);
    v3 = -[PUUserTransformView _isUserPanning](self, "_isUserPanning")
      || -[PUUserTransformView _isUserDeceleratingPan](self, "_isUserDeceleratingPan");
    -[PUUserTransformView _setUserPanningOrDecelerating:](self, "_setUserPanningOrDecelerating:", v3);
  }
}

- (void)_invalidateUserZoomingOrBouncing
{
  -[PUUserTransformView _setNeedsUpdateUserZoomingOrBouncing:](self, "_setNeedsUpdateUserZoomingOrBouncing:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateUserZoomingOrBouncingIfNeeded
{
  _BOOL8 v3;

  if (-[PUUserTransformView _needsUpdateUserZoomingOrBouncing](self, "_needsUpdateUserZoomingOrBouncing"))
  {
    -[PUUserTransformView _setNeedsUpdateUserZoomingOrBouncing:](self, "_setNeedsUpdateUserZoomingOrBouncing:", 0);
    v3 = -[PUUserTransformView _isUserZooming](self, "_isUserZooming")
      || -[PUUserTransformView _isUserEndingZoom](self, "_isUserEndingZoom")
      || -[PUUserTransformView _isAnimatingZoomEnd](self, "_isAnimatingZoomEnd");
    -[PUUserTransformView _setUserZoomingOrBouncing:](self, "_setUserZoomingOrBouncing:", v3);
  }
}

- (void)_invalidateUserInteracting
{
  -[PUUserTransformView _setNeedsUpdateUserInteracting:](self, "_setNeedsUpdateUserInteracting:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateUserInteractingIfNeeded
{
  _BOOL8 v3;

  if (-[PUUserTransformView _needsUpdateUserInteracting](self, "_needsUpdateUserInteracting"))
  {
    -[PUUserTransformView _setNeedsUpdateUserInteracting:](self, "_setNeedsUpdateUserInteracting:", 0);
    v3 = -[PUUserTransformView _isUserPanningOrDecelerating](self, "_isUserPanningOrDecelerating")
      || -[PUUserTransformView _isUserZoomingOrBouncing](self, "_isUserZoomingOrBouncing");
    -[PUUserTransformView _setUserInteracting:](self, "_setUserInteracting:", v3);
  }
}

- (void)_invalidateShouldTrackContentAnimation
{
  -[PUUserTransformView _setNeedsUpdateShouldTrackContentAnimation:](self, "_setNeedsUpdateShouldTrackContentAnimation:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateShouldTrackContentAnimationIfNeeded
{
  if (-[PUUserTransformView _needsUpdateShouldTrackContentAnimation](self, "_needsUpdateShouldTrackContentAnimation"))
  {
    -[PUUserTransformView _setNeedsUpdateShouldTrackContentAnimation:](self, "_setNeedsUpdateShouldTrackContentAnimation:", 0);
    -[PUUserTransformView _setShouldTrackContentAnimation:](self, "_setShouldTrackContentAnimation:", -[PUUserTransformView _isContentAnimating](self, "_isContentAnimating"));
  }
}

- (void)_invalidateContentState
{
  -[PUUserTransformView _setNeedsUpdateContentState:](self, "_setNeedsUpdateContentState:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateContentStateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;

  if (!-[PUUserTransformView _needsUpdateContentState](self, "_needsUpdateContentState"))
    return;
  -[PUUserTransformView _setNeedsUpdateContentState:](self, "_setNeedsUpdateContentState:", 0);
  -[PUUserTransformView scrollContentView](self, "scrollContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[PUUserTransformView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformView scrollContentView](self, "scrollContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentationLayer");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  -[PUUserTransformView _scrollView](self, "_scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  PXRectGetCenter();
  objc_msgSend(v4, "convertPoint:fromLayer:", v6);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v10, "bounds");
  PXRectGetCenter();
  objc_msgSend(v4, "convertPoint:fromLayer:", v10);
  v18 = v17;
  v20 = v19;
  if (!v6)
  {
    v21 = 0.0;
    if (v10)
      goto LABEL_8;
LABEL_10:
    v22 = 0.0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "transform");
  v21 = v39;
  if (!v10)
    goto LABEL_10;
LABEL_8:
  objc_msgSend(v10, "transform");
  v22 = v38;
LABEL_11:
  objc_msgSend(v6, "animationKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {

    -[PUUserTransformView _setContentAnimating:](self, "_setContentAnimating:", 1);
  }
  else
  {
    objc_msgSend(v10, "animationKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      v25 = 1;
    }
    else
    {
      objc_msgSend(v12, "animationKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v25 = 1;
      }
      else
      {
        objc_msgSend(v12, "presentationLayer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "animationKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v27, "count") != 0;

      }
    }

    -[PUUserTransformView _setContentAnimating:](self, "_setContentAnimating:", v25);
    if (!v25)
    {
      v22 = v21;
      v18 = v14;
      v20 = v16;
    }
  }
  -[PUUserTransformView _setContentCenter:](self, "_setContentCenter:", v18, v20);
  -[PUUserTransformView _setContentZoomScale:](self, "_setContentZoomScale:", v22);
  -[PUUserTransformView _contentZoomScale](self, "_contentZoomScale");
  -[PUUserTransformView _contentInsetsForContentScale:](self, "_contentInsetsForContentScale:");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContentInset:", v29, v31, v33, v35);

}

- (double)_currentPresentationZoomScale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
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
  __int128 v32;

  -[PUUserTransformView scrollContentView](self, "scrollContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "transform");
    v8 = *(double *)&v25;
    if (v5)
    {
LABEL_3:
      objc_msgSend(v5, "transform");
      v9 = *(double *)&v17;
      goto LABEL_6;
    }
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = 0.0;
    v25 = 0u;
    v26 = 0u;
    if (v5)
      goto LABEL_3;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = 0.0;
  v17 = 0u;
  v18 = 0u;
LABEL_6:
  objc_msgSend(v4, "animationKeys", v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v5, "animationKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      objc_msgSend(v7, "animationKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "count"))
      {
        objc_msgSend(v7, "presentationLayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "animationKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (!v16)
          goto LABEL_13;
        goto LABEL_12;
      }

    }
  }

LABEL_12:
  v8 = v9;
LABEL_13:

  return v8;
}

- (void)_invalidateAnimatingZoomEnd
{
  -[PUUserTransformView _setNeedsUpdateAnimatingZoomEnd:](self, "_setNeedsUpdateAnimatingZoomEnd:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateAnimatingZoomEndIfNeeded
{
  _BOOL4 v3;
  _BOOL8 v4;

  if (-[PUUserTransformView _needsUpdateAnimatingZoomEnd](self, "_needsUpdateAnimatingZoomEnd"))
  {
    -[PUUserTransformView _setNeedsUpdateAnimatingZoomEnd:](self, "_setNeedsUpdateAnimatingZoomEnd:", 0);
    v3 = -[PUUserTransformView _isContentAnimating](self, "_isContentAnimating");
    v4 = 0;
    if (v3)
      v4 = -[PUUserTransformView _isUserEndingZoom](self, "_isUserEndingZoom", 0);
    -[PUUserTransformView _setAnimatingZoomEnd:](self, "_setAnimatingZoomEnd:", v4);
  }
}

- (void)_invalidateUserAffineTransform
{
  -[PUUserTransformView _setNeedsUpdateUserAffineTransform:](self, "_setNeedsUpdateUserAffineTransform:", 1);
  -[PUUserTransformView _setNeedsStateUpdate](self, "_setNeedsStateUpdate");
}

- (void)_updateUserAffineTransformIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  if (-[PUUserTransformView _needsUpdateUserAffineTransform](self, "_needsUpdateUserAffineTransform"))
  {
    -[PUUserTransformView _setNeedsUpdateUserAffineTransform:](self, "_setNeedsUpdateUserAffineTransform:", 0);
    if (!-[PUUserTransformView _isUpdatingScrollView](self, "_isUpdatingScrollView"))
    {
      -[PUUserTransformView bounds](self, "bounds");
      PXRectGetCenter();
      v4 = v3;
      v6 = v5;
      -[PUUserTransformView _contentCenter](self, "_contentCenter");
      v8 = v7 - v4;
      v10 = v9 - v6;
      -[PUUserTransformView _contentZoomScale](self, "_contentZoomScale");
      v12 = v11;
      v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v16.c = v13;
      *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
      *(_OWORD *)&v15.c = v13;
      *(_OWORD *)&v15.tx = *(_OWORD *)&v16.tx;
      CGAffineTransformTranslate(&v16, &v15, v8, v10);
      v14 = v16;
      CGAffineTransformScale(&v15, &v14, v12, v12);
      v16 = v15;
      -[PUUserTransformView _setUserAffineTransform:](self, "_setUserAffineTransform:", &v15);
    }
  }
}

- (void)_performZoomAndScrollChanges:(id)a3
{
  int64_t v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 791, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock"));

  }
  v5 = -[PUUserTransformView _numberOfNestedZoomAndScrollChanges](self, "_numberOfNestedZoomAndScrollChanges");
  -[PUUserTransformView _setNumberOfNestedZoomAndScrollChanges:](self, "_setNumberOfNestedZoomAndScrollChanges:", v5 + 1);
  v7[2]();
  -[PUUserTransformView _setNumberOfNestedZoomAndScrollChanges:](self, "_setNumberOfNestedZoomAndScrollChanges:", v5);
  if (!v5)
    -[PUUserTransformView _updateZoomAndScrollIfNeeded](self, "_updateZoomAndScrollIfNeeded");

}

- (void)_setEnabledInteractions:(unint64_t)a3
{
  -[PUUserTransformView _assertInsideZoomAndScrollChangeBlock](self, "_assertInsideZoomAndScrollChangeBlock");
  if (self->_enabledInteractions != a3)
  {
    self->_enabledInteractions = a3;
    -[PUUserTransformView _invalidateZoomAndScroll](self, "_invalidateZoomAndScroll");
  }
}

- (void)setDesiredZoomScale:(double)a3
{
  -[PUUserTransformView _assertInsideZoomAndScrollChangeBlock](self, "_assertInsideZoomAndScrollChangeBlock");
  if (self->_desiredZoomScale != a3)
  {
    self->_desiredZoomScale = a3;
    -[PUUserTransformView _invalidateZoomAndScroll](self, "_invalidateZoomAndScroll");
  }
}

- (void)_setPreferredMinimumZoomScale:(double)a3
{
  -[PUUserTransformView _assertInsideZoomAndScrollChangeBlock](self, "_assertInsideZoomAndScrollChangeBlock");
  if (self->__preferredMinimumZoomScale != a3)
  {
    self->__preferredMinimumZoomScale = a3;
    -[PUUserTransformView _invalidateZoomAndScroll](self, "_invalidateZoomAndScroll");
  }
}

- (void)_setPreferredMaximumZoomScale:(double)a3
{
  -[PUUserTransformView _assertInsideZoomAndScrollChangeBlock](self, "_assertInsideZoomAndScrollChangeBlock");
  if (self->__preferredMaximumZoomScale != a3)
  {
    self->__preferredMaximumZoomScale = a3;
    -[PUUserTransformView _invalidateZoomAndScroll](self, "_invalidateZoomAndScroll");
  }
}

- (void)_assertInsideZoomAndScrollChangeBlock
{
  id v4;

  if (-[PUUserTransformView _numberOfNestedZoomAndScrollChanges](self, "_numberOfNestedZoomAndScrollChanges") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 845, CFSTR("not within a zoom and scroll change block"));

  }
}

- (void)_invalidateZoomAndScroll
{
  -[PUUserTransformView _setNeedsUpdateZoomAndScroll:](self, "_setNeedsUpdateZoomAndScroll:", 1);
}

- (void)_updateZoomAndScrollIfNeeded
{
  char v3;
  _QWORD v4[5];
  char v5;
  BOOL v6;
  BOOL v7;

  if (-[PUUserTransformView _needsUpdateZoomAndScroll](self, "_needsUpdateZoomAndScroll"))
  {
    -[PUUserTransformView _setNeedsUpdateZoomAndScroll:](self, "_setNeedsUpdateZoomAndScroll:", 0);
    if (!-[PUUserTransformView isUserInteracting](self, "isUserInteracting"))
    {
      v3 = -[PUUserTransformView enabledInteractions](self, "enabledInteractions");
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __51__PUUserTransformView__updateZoomAndScrollIfNeeded__block_invoke;
      v4[3] = &unk_1E58AA590;
      v4[4] = self;
      v5 = v3 & 1;
      v6 = (v3 & 4) != 0;
      v7 = (v3 & 2) != 0;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
    }
  }
}

- (UIEdgeInsets)_contentInsetsForContentScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  -[PUUserTransformView scrollPadding](self, "scrollPadding");
  v7 = v6;
  v8 = v5;
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v22 = *MEMORY[0x1E0DC49E8];
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    -[PUUserTransformView untransformedContentFrame](self, "untransformedContentFrame");
    v11 = v10 * a3;
    v13 = v12 * a3;
    -[PUUserTransformView _scrollView](self, "_scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    v19 = fmax((v18 - v13) * 0.5, 0.0) + v8 * 0.5;
    v20 = fmax((v16 - v11) * 0.5, 0.0) + v7 * 0.5;
    v21 = v20;
    v22 = v19;
  }
  result.right = v20;
  result.bottom = v19;
  result.left = v21;
  result.top = v22;
  return result;
}

- (BOOL)isTrackingZoomGesture
{
  void *v2;
  char v3;

  -[PUUserTransformView _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isZooming");

  return v3;
}

- (CGPoint)_contentOffsetAdjustmentForContentInsets:(UIEdgeInsets)a3
{
  double left;
  double top;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  left = a3.left;
  top = a3.top;
  -[PUUserTransformView scrollPadding](self, "scrollPadding", a3.top, a3.left, a3.bottom, a3.right);
  v7 = v5 * 0.5 - left;
  v8 = v6 * 0.5 - top;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_invalidateScrollView
{
  UIScrollView *scrollView;
  UIView *scrollContentView;

  if (!-[PUUserTransformView isUserInteracting](self, "isUserInteracting"))
  {
    -[UIScrollView setDelegate:](self->__scrollView, "setDelegate:", 0);
    -[UIScrollView removeFromSuperview](self->__scrollView, "removeFromSuperview");
    scrollView = self->__scrollView;
    self->__scrollView = 0;

    scrollContentView = self->_scrollContentView;
    self->_scrollContentView = 0;

    -[PUUserTransformView _setNeedsUpdateScrollView:](self, "_setNeedsUpdateScrollView:", 1);
    -[PUUserTransformView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateScrollViewIfNeeded
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  _PUUserTransformScrollView *v23;
  _PUUserTransformScrollView *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  _PUUserTransformScrollView *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double MidX;
  CGFloat MidY;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  _PUUserTransformScrollView *v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  double v85;
  id v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  _QWORD v92[5];
  BOOL v93;
  _QWORD v94[5];
  _PUUserTransformScrollView *v95;
  double v96;
  double v97;
  double v98;
  _OWORD v99[3];
  double v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  if (-[PUUserTransformView _needsUpdateScrollView](self, "_needsUpdateScrollView"))
  {
    -[PUUserTransformView _setNeedsUpdateScrollView:](self, "_setNeedsUpdateScrollView:", 0);
    -[PUUserTransformView contentPixelSize](self, "contentPixelSize");
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      v3 = -[PUUserTransformView _isUpdatingScrollView](self, "_isUpdatingScrollView");
      -[PUUserTransformView _setUpdatingScrollView:](self, "_setUpdatingScrollView:", 1);
      -[PUUserTransformView bounds](self, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[PUUserTransformView untransformedContentFrame](self, "untransformedContentFrame");
      v13 = v12;
      v90 = v14;
      v16 = v15;
      v18 = v17;
      -[PUUserTransformView contentPixelSize](self, "contentPixelSize");
      v20 = v19;
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "useDebuggingColors");

      -[PUUserTransformView _scrollView](self, "_scrollView");
      v23 = (_PUUserTransformScrollView *)(id)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
      {
        v24 = -[_PUUserTransformScrollView initWithFrame:]([_PUUserTransformScrollView alloc], "initWithFrame:", v5, v7, v9, v11);
        -[_PUUserTransformScrollView setScrollsToTop:](v24, "setScrollsToTop:", 0);
        -[_PUUserTransformScrollView setDecelerationRate:](v24, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
        -[_PUUserTransformScrollView setPreservesCenterDuringRotation:](v24, "setPreservesCenterDuringRotation:", 1);
        -[_PUUserTransformScrollView setShowsHorizontalScrollIndicator:](v24, "setShowsHorizontalScrollIndicator:", 0);
        -[_PUUserTransformScrollView setShowsVerticalScrollIndicator:](v24, "setShowsVerticalScrollIndicator:", 0);
        -[_PUUserTransformScrollView setDelegate:](v24, "setDelegate:", self);
        if (v22)
        {
          -[_PUUserTransformScrollView layer](v24, "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v25, "setBorderColor:", objc_msgSend(v26, "CGColor"));

          -[_PUUserTransformScrollView layer](v24, "layer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setBorderWidth:", 2.0);

        }
        -[PUUserTransformView addSubview:](self, "addSubview:", v24);
        objc_storeStrong((id *)&self->__scrollView, v24);
      }
      v91 = v11;
      v89 = v9;
      -[PUUserTransformView _updateScrollViewFrame](self, "_updateScrollViewFrame");
      -[PUUserTransformView scrollContentView](self, "scrollContentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (__int128 *)MEMORY[0x1E0C9D538];
      if (!v28)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v16, v18);
        v28 = v30;
        if (v22)
        {
          objc_msgSend(v30, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v31, "setBorderColor:", objc_msgSend(v32, "CGColor"));

          objc_msgSend(v28, "layer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setBorderWidth:", 5.0);

        }
        -[_PUUserTransformScrollView addSubview:](v24, "addSubview:", v28);
        objc_storeStrong((id *)&self->_scrollContentView, v28);
        -[PUUserTransformView debugScrollViewContentImage](self, "debugScrollViewContentImage");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_retainAutorelease(v34);
        objc_msgSend(v35, "setContents:", objc_msgSend(v36, "CGImage"));

        -[PUUserTransformView hostedView](self, "hostedView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_msgSend(v28, "bounds");
          -[UIView setFrame:](self->_hostedView, "setFrame:");
          objc_msgSend(v28, "addSubview:", self->_hostedView);
          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
            v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v39 = objc_msgSend(v38, "CGColor");
            objc_msgSend(v37, "layer");
            v86 = v36;
            v40 = v23;
            v41 = v3;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setBorderColor:", v39);

            v3 = v41;
            v23 = v40;
            v36 = v86;

            objc_msgSend(v37, "layer");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            v45 = 1.0;
          }
          else
          {
            objc_msgSend(v37, "layer");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setBorderColor:", 0);

            objc_msgSend(v37, "layer");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            v45 = 0.0;
          }
          objc_msgSend(v43, "setBorderWidth:", v45);

        }
        v29 = (__int128 *)MEMORY[0x1E0C9D538];
      }
      -[PUUserTransformView minimumZoomScale](self, "minimumZoomScale");
      v48 = v47;
      v103 = 0u;
      v104 = 0u;
      v102 = 0u;
      -[PUUserTransformView userAffineTransform](self, "userAffineTransform");
      v101 = *v29;
      v82 = v48;
      v100 = v48;
      v99[0] = v102;
      v99[1] = v103;
      v99[2] = v104;
      PUDecomposeTransform((uint64_t)v99, &v101, &v100, 0, 0);
      v105.origin.x = v13;
      v105.origin.y = v90;
      v105.size.width = v16;
      v49 = v18;
      v105.size.height = v18;
      MidX = CGRectGetMidX(v105);
      v106.origin.x = v13;
      v106.origin.y = v90;
      v106.size.width = v16;
      v106.size.height = v18;
      MidY = CGRectGetMidY(v106);
      v52 = v13;
      v53 = v16 * v100;
      v54 = v18 * v100;
      v84 = *(double *)&v101 + MidX - v16 * v100 * 0.5;
      v87 = MidY - v54 * 0.5 + *((double *)&v101 + 1);
      v107.origin.x = v52;
      v107.origin.y = v90;
      v107.size.width = v16;
      v107.size.height = v49;
      v113.origin.x = v5;
      v113.origin.y = v7;
      v113.size.width = v89;
      v113.size.height = v91;
      CGRectUnion(v107, v113);
      v108.origin.x = v84;
      v108.origin.y = v87;
      v108.size.width = v53;
      v108.size.height = v54;
      v114.origin.x = v5;
      v114.origin.y = v7;
      v114.size.width = v89;
      v114.size.height = v91;
      CGRectUnion(v108, v114);
      -[PUUserTransformView _contentInsetsForContentScale:](self, "_contentInsetsForContentScale:", v100);
      v85 = v56;
      v88 = v55;
      v83 = v57;
      v81 = v58;
      -[PUUserTransformView _contentOffsetAdjustmentForContentInsets:](self, "_contentOffsetAdjustmentForContentInsets:");
      v109.origin.x = v5;
      v109.origin.y = v7;
      v109.size.width = v89;
      v109.size.height = v91;
      v59 = CGRectGetWidth(v109) / v16;
      v110.origin.x = v5;
      v110.origin.y = v7;
      v110.size.width = v89;
      v110.size.height = v91;
      v60 = CGRectGetHeight(v110) / v49;
      if (v59 < v60)
        v59 = v60;
      -[PUUserTransformView window](self, "window");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "screen");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        -[PUUserTransformView window](self, "window");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "screen");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "scale");
        v66 = v65;

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "scale");
        v66 = v67;
      }

      if (v66 <= 0.0)
        v68 = 1.0;
      else
        v68 = v66;
      v69 = v20 / (v16 * v68);
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "defaultZoomInFactor");
      v72 = v71;

      if (v69 * v72 >= 1.0)
        v59 = v69 * v72;
      if ((_UIAccessibilityZoomTouchEnabled() & (v59 < 60.0)) != 0)
        v73 = 60.0;
      else
        v73 = v59;
      PXClamp();
      v100 = v74;
      -[_PUUserTransformScrollView setContentSize:](v24, "setContentSize:", v16, v49);
      v75 = MEMORY[0x1E0C809B0];
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke;
      v94[3] = &unk_1E58AA5B8;
      v94[4] = self;
      v96 = v82;
      v97 = v73;
      v98 = v100;
      v76 = v23;
      v95 = v76;
      -[PUUserTransformView _performZoomAndScrollChanges:](self, "_performZoomAndScrollChanges:", v94);
      -[_PUUserTransformScrollView setContentInset:](v24, "setContentInset:", v88, v85, v83, v81);
      -[_PUUserTransformScrollView contentSize](v24, "contentSize");
      -[_PUUserTransformScrollView bounds](v24, "bounds");
      CGRectGetWidth(v111);
      PXClamp();
      v78 = v77;
      -[_PUUserTransformScrollView contentSize](v24, "contentSize");
      -[_PUUserTransformScrollView bounds](v24, "bounds");
      CGRectGetHeight(v112);
      PXClamp();
      -[_PUUserTransformScrollView setContentOffset:](v24, "setContentOffset:", v78, v79);
      -[PUUserTransformView _updateScrollViewMinimumZoomScaleAndGoToMinimum:animated:](self, "_updateScrollViewMinimumZoomScaleAndGoToMinimum:animated:", 0, 0);
      v92[0] = v75;
      v92[1] = 3221225472;
      v92[2] = __48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke_2;
      v92[3] = &unk_1E58AAD68;
      v92[4] = self;
      v93 = v3;
      -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v92);
      if (-[PUUserTransformView requireTwoTouchesForPan](self, "requireTwoTouchesForPan"))
      {
        -[_PUUserTransformScrollView panGestureRecognizer](v24, "panGestureRecognizer");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setMinimumNumberOfTouches:", 2);

      }
    }
  }
}

- (void)_setUpdatingScrollView:(BOOL)a3
{
  if (self->__updatingScrollView != a3)
  {
    self->__updatingScrollView = a3;
    if (!a3)
      -[PUUserTransformView _invalidateContentState](self, "_invalidateContentState");
  }
}

- (void)setHostedView:(id)a3
{
  UIView *v5;
  UIView **p_hostedView;
  UIView *hostedView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_hostedView = &self->_hostedView;
  hostedView = self->_hostedView;
  v9 = v5;
  if (hostedView != v5)
  {
    -[UIView removeFromSuperview](hostedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_hostedView, a3);
    if (*p_hostedView)
    {
      -[PUUserTransformView scrollContentView](self, "scrollContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      -[UIView setFrame:](*p_hostedView, "setFrame:");
      objc_msgSend(v8, "addSubview:", *p_hostedView);

    }
  }

}

- (double)doubleTapZoomScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  -[PUUserTransformView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PUUserTransformView untransformedContentFrame](self, "untransformedContentFrame");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_opt_class();
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleTapZoomFactor");
  objc_msgSend(v11, "doubleTapZoomScaleForContentSize:inBoundsSize:defaultScale:preferToFillOnDoubleTap:", -[PUUserTransformView preferToFillOnDoubleTap](self, "preferToFillOnDoubleTap"), v8, v10, v4, v6, v13);
  v15 = v14;

  return v15;
}

- (double)fillZoomScale
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  CGRect v17;
  CGRect v18;

  -[PUUserTransformView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUUserTransformView untransformedContentFrame](self, "untransformedContentFrame");
  v12 = v11;
  v14 = v13;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v15 = CGRectGetWidth(v17) / v12;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  result = CGRectGetHeight(v18) / v14;
  if (v15 >= result)
    return v15;
  return result;
}

- (void)_updateDisplayLink
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  PUUserTransformView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[PUUserTransformView _shouldTrackContentAnimation](self, "_shouldTrackContentAnimation");
  -[PUUserTransformView _displayLink](self, "_displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7CCE8], "highFramerateRequiresReasonAndRange"))
      {
        objc_msgSend(v5, "setHighFrameRateReason:", 2228225);
        PXFrameRateRangeTypeGetCAFrameRateRange();
        objc_msgSend(v5, "setPreferredFrameRateRange:");
      }
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99748]);

      -[PUUserTransformView _setDisplayLink:](self, "_setDisplayLink:", v5);
      PLOneUpGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v9 = 134217984;
      v10 = self;
      v8 = "%p starting display link";
      goto LABEL_10;
    }
  }
  else if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[PUUserTransformView _setDisplayLink:](self, "_setDisplayLink:", 0);
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      goto LABEL_12;
    }
    v9 = 134217984;
    v10 = self;
    v8 = "%p stopping display link";
LABEL_10:
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_handleDisplayLink:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PUUserTransformView__handleDisplayLink___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v3);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  return -[PUUserTransformView scrollContentView](self, "scrollContentView");
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PUUserTransformView_scrollViewDidScroll___block_invoke;
  v8[3] = &unk_1E58ABD10;
  v8[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v8);
}

- (void)scrollViewDidZoom:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PUUserTransformView_scrollViewDidZoom___block_invoke;
  v8[3] = &unk_1E58ABD10;
  v8[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v8);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PUUserTransformView_scrollViewWillBeginDragging___block_invoke;
  v8[3] = &unk_1E58ABD10;
  v8[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v8);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v7 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PUUserTransformView_scrollViewDidEndDragging_willDecelerate___block_invoke;
  v10[3] = &unk_1E58AAD68;
  v10[4] = self;
  v11 = a4;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v10);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PUUserTransformView_scrollViewDidEndDecelerating___block_invoke;
  v8[3] = &unk_1E58ABD10;
  v8[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v8);
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformView setZoomStartDate:](self, "setZoomStartDate:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PUUserTransformView_scrollViewWillBeginZooming_withView___block_invoke;
  v10[3] = &unk_1E58ABD10;
  v10[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v10);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD block[5];
  _QWORD v13[5];

  v7 = a3;
  -[PUUserTransformView _scrollView](self, "_scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformView.m"), 1199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView == [self _scrollView]"));

  }
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke;
  v13[3] = &unk_1E58ABD10;
  v13[4] = self;
  -[PUUserTransformView _performStateChanges:](self, "_performStateChanges:", v13);
  v10 = dispatch_time(0, 50000000);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_2;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
}

- (CGRect)visibleRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  CGRect result;

  -[PUUserTransformView _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformView scrollContentView](self, "scrollContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUUserTransformView _isContentAnimating](self, "_isContentAnimating"))
    goto LABEL_6;
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || !v8)
  {

LABEL_6:
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", v4);
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
    goto LABEL_7;
  }
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toLayer:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

LABEL_7:
  v21 = v10;
  v22 = v12;
  v23 = v14;
  v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setHasUserZoomedIn:(BOOL)a3
{
  id v4;

  if (self->_hasUserZoomedIn != a3)
  {
    self->_hasUserZoomedIn = a3;
    if (self->_delegateFlags.respondsToDidChangeIsZoomedIn)
    {
      -[PUUserTransformView delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userTransformViewDidChangeIsZoomedIn:", self);

    }
  }
}

- (CGSize)contentPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentPixelSize.width;
  height = self->_contentPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)requireTwoTouchesForPan
{
  return self->_requireTwoTouchesForPan;
}

- (CGRect)untransformedContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_untransformedContentFrame.origin.x;
  y = self->_untransformedContentFrame.origin.y;
  width = self->_untransformedContentFrame.size.width;
  height = self->_untransformedContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)userAffineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[14].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[14].d;
  return self;
}

- (unint64_t)enabledInteractions
{
  return self->_enabledInteractions;
}

- (CGSize)scrollPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_scrollPadding.width;
  height = self->_scrollPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isUserInteracting
{
  return self->_isUserInteracting;
}

- (BOOL)preferToFillOnDoubleTap
{
  return self->_preferToFillOnDoubleTap;
}

- (void)setPreferToFillOnDoubleTap:(BOOL)a3
{
  self->_preferToFillOnDoubleTap = a3;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (double)minimumZoomScale
{
  return self->_minimumZoomScale;
}

- (BOOL)hasUserZoomedIn
{
  return self->_hasUserZoomedIn;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PUUserTransformViewDelegate)delegate
{
  return (PUUserTransformViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (BOOL)_isUpdatingScrollView
{
  return self->__updatingScrollView;
}

- (BOOL)_isUserPanning
{
  return self->__isUserPanning;
}

- (BOOL)_isUserDeceleratingPan
{
  return self->__isUserDeceleratingPan;
}

- (BOOL)_isUserZooming
{
  return self->__isUserZooming;
}

- (BOOL)_isUserEndingZoom
{
  return self->__isUserEndingZoom;
}

- (BOOL)_isUserPanningOrDecelerating
{
  return self->__isUserPanningOrDecelerating;
}

- (BOOL)_isUserZoomingOrBouncing
{
  return self->__isUserZoomingOrBouncing;
}

- (BOOL)_shouldTrackContentAnimation
{
  return self->__shouldTrackContentAnimation;
}

- (BOOL)_isContentAnimating
{
  return self->__isContentAnimating;
}

- (CGPoint)_contentCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->__contentCenter.x;
  y = self->__contentCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)_contentZoomScale
{
  return self->__contentZoomScale;
}

- (BOOL)_isAnimatingZoomEnd
{
  return self->__isAnimatingZoomEnd;
}

- (int64_t)_numberOfNestedStateChanges
{
  return self->__numberOfNestedStateChanges;
}

- (void)_setNumberOfNestedStateChanges:(int64_t)a3
{
  self->__numberOfNestedStateChanges = a3;
}

- (BOOL)_isUpdatingState
{
  return self->__isUpdatingState;
}

- (void)_setUpdatingState:(BOOL)a3
{
  self->__isUpdatingState = a3;
}

- (BOOL)_wasUserInteractingBeforeStateUpdate
{
  return self->__wasUserInteractingBeforeStateUpdate;
}

- (void)_setWasUserInteractingBeforeStateUpdate:(BOOL)a3
{
  self->__wasUserInteractingBeforeStateUpdate = a3;
}

- (BOOL)_needsUpdateUserPanningOrDecelerating
{
  return self->__needsUpdateUserPanningOrDecelerating;
}

- (void)_setNeedsUpdateUserPanningOrDecelerating:(BOOL)a3
{
  self->__needsUpdateUserPanningOrDecelerating = a3;
}

- (BOOL)_needsUpdateUserZoomingOrBouncing
{
  return self->__needsUpdateUserZoomingOrBouncing;
}

- (void)_setNeedsUpdateUserZoomingOrBouncing:(BOOL)a3
{
  self->__needsUpdateUserZoomingOrBouncing = a3;
}

- (BOOL)_needsUpdateUserInteracting
{
  return self->__needsUpdateUserInteracting;
}

- (void)_setNeedsUpdateUserInteracting:(BOOL)a3
{
  self->__needsUpdateUserInteracting = a3;
}

- (BOOL)_needsUpdateShouldTrackContentAnimation
{
  return self->__needsUpdateShouldTrackContentAnimation;
}

- (void)_setNeedsUpdateShouldTrackContentAnimation:(BOOL)a3
{
  self->__needsUpdateShouldTrackContentAnimation = a3;
}

- (BOOL)_needsUpdateUserAffineTransform
{
  return self->__needsUpdateUserAffineTransform;
}

- (void)_setNeedsUpdateUserAffineTransform:(BOOL)a3
{
  self->__needsUpdateUserAffineTransform = a3;
}

- (BOOL)_needsUpdateContentState
{
  return self->__needsUpdateContentState;
}

- (void)_setNeedsUpdateContentState:(BOOL)a3
{
  self->__needsUpdateContentState = a3;
}

- (BOOL)_needsUpdateAnimatingZoomEnd
{
  return self->__needsUpdateAnimatingZoomEnd;
}

- (void)_setNeedsUpdateAnimatingZoomEnd:(BOOL)a3
{
  self->__needsUpdateAnimatingZoomEnd = a3;
}

- (BOOL)needsUpdateEnabledInteractions
{
  return self->_needsUpdateEnabledInteractions;
}

- (void)setNeedsUpdateEnabledInteractions:(BOOL)a3
{
  self->_needsUpdateEnabledInteractions = a3;
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)_setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->__displayLink, a3);
}

- (double)desiredZoomScale
{
  return self->_desiredZoomScale;
}

- (double)_preferredMinimumZoomScale
{
  return self->__preferredMinimumZoomScale;
}

- (double)_preferredMaximumZoomScale
{
  return self->__preferredMaximumZoomScale;
}

- (int64_t)_numberOfNestedZoomAndScrollChanges
{
  return self->__numberOfNestedZoomAndScrollChanges;
}

- (void)_setNumberOfNestedZoomAndScrollChanges:(int64_t)a3
{
  self->__numberOfNestedZoomAndScrollChanges = a3;
}

- (BOOL)_needsUpdateZoomAndScroll
{
  return self->__needsUpdateZoomAndScroll;
}

- (void)_setNeedsUpdateZoomAndScroll:(BOOL)a3
{
  self->__needsUpdateZoomAndScroll = a3;
}

- (BOOL)_needsUpdateScrollView
{
  return self->__needsUpdateScrollView;
}

- (void)_setNeedsUpdateScrollView:(BOOL)a3
{
  self->__needsUpdateScrollView = a3;
}

- (NSDate)zoomStartDate
{
  return self->_zoomStartDate;
}

- (void)setZoomStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_zoomStartDate, a3);
}

- (UIImage)debugScrollViewContentImage
{
  return self->_debugScrollViewContentImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugScrollViewContentImage, 0);
  objc_storeStrong((id *)&self->_zoomStartDate, 0);
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostedView, 0);
}

uint64_t __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUserZooming:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setUserEndingZoom:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContentState");
}

uint64_t __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_3;
  v3[3] = &unk_1E58ABD10;
  v3[4] = v1;
  return objc_msgSend(v1, "_performStateChanges:", v3);
}

uint64_t __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUserEndingZoom:", 0);
}

uint64_t __59__PUUserTransformView_scrollViewWillBeginZooming_withView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUserZooming:", 1);
}

uint64_t __52__PUUserTransformView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUserDeceleratingPan:", 0);
}

uint64_t __63__PUUserTransformView_scrollViewDidEndDragging_willDecelerate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUserPanning:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setUserDeceleratingPan:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __51__PUUserTransformView_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUserPanning:", 1);
}

uint64_t __41__PUUserTransformView_scrollViewDidZoom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContentState");
}

uint64_t __43__PUUserTransformView_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContentState");
}

uint64_t __42__PUUserTransformView__handleDisplayLink___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContentState");
}

_QWORD *__48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "setMinimumZoomScale:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setPreferredMinimumZoomScale:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setPreferredMaximumZoomScale:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setDesiredZoomScale:", *(double *)(a1 + 64));
  result = *(_QWORD **)(a1 + 32);
  if (result[60] != *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_invalidateZoomAndScroll");
  return result;
}

uint64_t __48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateUserAffineTransform");
  return objc_msgSend(*(id *)(a1 + 32), "_setUpdatingScrollView:", *(unsigned __int8 *)(a1 + 40));
}

void __51__PUUserTransformView__updateZoomAndScrollIfNeeded__block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "desiredZoomScale");
  v4 = v3;
  v5 = v3;
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "minimumZoomScale");
    v5 = v6;
  }
  v7 = v4;
  if (*(_BYTE *)(a1 + 42))
  {
    objc_msgSend(*(id *)(a1 + 32), "_preferredMaximumZoomScale");
    v7 = v8;
  }
  objc_msgSend(v9, "setScrollEnabled:", v2 != 0);
  objc_msgSend(v9, "setMinimumZoomScale:", v5);
  objc_msgSend(v9, "setMaximumZoomScale:", v7);
  objc_msgSend(v9, "setZoomScale:", v4);

}

void __31__PUUserTransformView_zoomOut___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setHasUserZoomedIn:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumZoomScale");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setDesiredZoomScale:");
  objc_msgSend(v4, "setZoomScale:animated:", *(unsigned __int8 *)(a1 + 40), v3);
  objc_msgSend(*(id *)(a1 + 32), "_setEnabledInteractions:", 7);

}

void __61__PUUserTransformView_zoomInOnLocationFromProvider_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "setHasUserZoomedIn:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_scrollView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scrollContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "locationInView:", v2);
  }
  else
  {
    objc_msgSend(v18, "bounds");
    PXRectGetCenter();
  }
  objc_msgSend(*(id *)(a1 + 32), "doubleTapZoomScale");
  v5 = v4;
  objc_msgSend(v2, "bounds");
  PXRectWithCenterAndSize();
  objc_msgSend(v18, "bounds");
  PURectGetAspectRatio(v6, v7, v8, v9);
  PXRectWithAspectRatioFillingRect();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "setDesiredZoomScale:", v5);
  objc_msgSend(v18, "zoomToRect:animated:", *(unsigned __int8 *)(a1 + 48), v11, v13, v15, v17);
  objc_msgSend(*(id *)(a1 + 32), "_setEnabledInteractions:", 7);

}

uint64_t __42__PUUserTransformView_setOffset_animated___block_invoke(uint64_t a1)
{
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentState");
  if (!*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewFrame");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PUUserTransformView_setOffset_animated___block_invoke_2;
  v3[3] = &unk_1E58ABD10;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.3);
}

uint64_t __42__PUUserTransformView_setOffset_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewFrame");
}

void __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setDesiredZoomScale:", *(double *)(a1 + 40));
  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 32), "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentOffset:", v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "_scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomScale:animated:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));

}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMinimumZoomScale:", *(double *)(a1 + 40));
}

void __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  if (*(_BYTE *)(a1 + 72)
    || (objc_msgSend(*(id *)(a1 + 32), "_scrollView"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "zoomScale"),
        v4 = v3,
        v5 = *(double *)(a1 + 56),
        v2,
        v4 < v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasUserZoomedIn:", 0);
    if (*(double *)(a1 + 56) <= *(double *)(a1 + 64))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v9 = (void *)MEMORY[0x1E0DC3F10];
      if (*(_BYTE *)(a1 + 73))
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_7;
        v13[3] = &unk_1E58ABAC8;
        v14 = *(id *)(a1 + 40);
        objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v13, 0, 0.3, 0.0);
        v8 = v14;
        goto LABEL_8;
      }
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_8;
      v11[3] = &unk_1E58ABAC8;
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v9, "performWithoutAnimation:", v11);
      v10 = v12;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0DC3F10];
      if (*(_BYTE *)(a1 + 73))
      {
        v7 = MEMORY[0x1E0C809B0];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_4;
        v20[3] = &unk_1E58ABAC8;
        v21 = *(id *)(a1 + 40);
        v18[0] = v7;
        v18[1] = 3221225472;
        v18[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_5;
        v18[3] = &unk_1E58AA518;
        v19 = *(id *)(a1 + 48);
        objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 2, v20, v18, 0.3, 0.0);

        v8 = v21;
LABEL_8:

        return;
      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_6;
      v15[3] = &unk_1E58AA540;
      v16 = *(id *)(a1 + 40);
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v6, "performWithoutAnimation:", v15);

      v10 = v16;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__PUUserTransformView_setScrollPadding___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContentState");
}

uint64_t __46__PUUserTransformView_setEnabledInteractions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabledInteractions:", *(_QWORD *)(a1 + 40));
}

+ (double)doubleTapZoomScaleForContentSize:(CGSize)a3 inBoundsSize:(CGSize)a4 defaultScale:(double)a5 preferToFillOnDoubleTap:(BOOL)a6
{
  double width;
  double v7;
  CGFloat v8;
  double result;
  double v10;

  width = a3.width;
  v7 = a4.width / a3.width;
  v8 = a4.height / a3.height;
  if (v7 >= a4.height / a3.height)
    v8 = v7;
  if (v8 <= a5)
    result = a5;
  else
    result = v8;
  if (a3.height != 0.0 && ((v10 = width / a3.height, v10 > 2.0) || v10 < 0.5) || a6)
  {
    if (v8 > 1.01)
      return v8;
  }
  return result;
}

@end
