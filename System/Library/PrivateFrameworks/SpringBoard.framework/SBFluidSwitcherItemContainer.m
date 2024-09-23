@implementation SBFluidSwitcherItemContainer

- (void)setUnobscuredMargin:(double)a3
{
  void *v5;
  char v6;
  double v7;
  CGFloat Width;
  CGRect v9;

  if (self->_unobscuredMargin != a3)
  {
    -[SBFluidSwitcherItemContainer layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldRasterize");

    if ((v6 & 1) != 0)
    {
      if (self->_unobscuredMargin < a3)
      {
        v7 = a3 + a3;
        -[SBFluidSwitcherItemContainer bounds](self, "bounds");
        Width = CGRectGetWidth(v9);
        if (v7 < Width)
          Width = v7;
        self->_unobscuredMargin = Width;
        -[SBFluidSwitcherItemContainer _updatePageViewContentClippingFrame](self, "_updatePageViewContentClippingFrame");
        -[SBFluidSwitcherItemContainer setNeedsDisplay](self, "setNeedsDisplay");
      }
    }
    else
    {
      self->_unobscuredMargin = a3;
      -[SBFluidSwitcherItemContainer _updatePageViewContentClippingFrame](self, "_updatePageViewContentClippingFrame");
    }
  }
}

- (void)setSuppressesHighlightEffect:(BOOL)a3
{
  self->_suppressesHighlightEffect = a3;
}

- (void)setSelectable:(BOOL)a3
{
  if (self->_preferredPointerLockStatusSuppressed)
    a3 = 1;
  self->_selectable = a3;
}

- (void)setRubberbandable:(BOOL)a3
{
  if (self->_rubberbandable != a3)
  {
    self->_rubberbandable = a3;
    -[SBFluidSwitcherItemContainer _updateKillScrollViewEnabled](self, "_updateKillScrollViewEnabled");
  }
}

- (void)setKillable:(BOOL)a3
{
  if (self->_killable != a3)
  {
    self->_killable = a3;
    -[SBFluidSwitcherItemContainer _updateKillScrollViewEnabled](self, "_updateKillScrollViewEnabled");
    if (!a3)
      -[SBFluidSwitcherItemContainer _resetKillProgressScrollState](self, "_resetKillProgressScrollState");
    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setKillAxis:(unint64_t)a3
{
  if (self->_killAxis != a3)
  {
    self->_killAxis = a3;
    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherItemContainer layoutIfNeeded](self, "layoutIfNeeded");
    -[SBFluidSwitcherItemContainer _resetKillProgressScrollState](self, "_resetKillProgressScrollState");
  }
}

- (void)setFocusable:(BOOL)a3
{
  if (self->_focusable != a3)
  {
    if (self->_focusable)
      -[SBFluidSwitcherItemContainer resignFirstResponder](self, "resignFirstResponder");
    self->_focusable = a3;
  }
}

- (void)setEligibleForContentDragSpringLoading:(BOOL)a3
{
  self->_eligibleForContentDragSpringLoading = a3;
}

- (void)setClipsToUnobscuredMargin:(BOOL)a3
{
  if (self->_clipsToUnobscuredMargin != a3)
  {
    self->_clipsToUnobscuredMargin = a3;
    -[SBFluidSwitcherItemContainer _updatePageViewContentViewClipping](self, "_updatePageViewContentViewClipping");
    -[SBFluidSwitcherItemContainer _updatePageViewContentClippingFrame](self, "_updatePageViewContentClippingFrame");
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFluidSwitcherItemContainer;
    v5 = -[SBFluidSwitcherItemContainer _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (id)_pageView
{
  return self->_pageView;
}

- (void)setWallpaperGradientAttributes:(SBSwitcherWallpaperGradientAttributes)a3
{
  -[SBAppSwitcherPageView setWallpaperGradientAttributes:](self->_pageView, "setWallpaperGradientAttributes:", a3.leadingAlpha, a3.trailingAlpha);
}

- (void)setTransformAnimationsAreLegacyCounterRotations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFluidSwitcherItemContainer layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransformAnimationsAreLegacyCounterRotations:", v3);

}

- (void)setPositionAnimationsBeginFromModelState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFluidSwitcherItemContainer layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPositionAnimationsBeginFromModelState:", v3);

}

- (void)setShouldUseWallpaperGradientTreatment:(BOOL)a3
{
  -[SBAppSwitcherPageView setNeedsWallpaperGradientTreatment:](self->_pageView, "setNeedsWallpaperGradientTreatment:", a3);
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    if (a3)
    {
      -[SBFluidSwitcherItemContainer _resetKillProgressScrollState](self, "_resetKillProgressScrollState");
      -[SBFluidSwitcherItemContainer _updateShadowVisibility](self, "_updateShadowVisibility");
      objc_initWeak(&location, self);
      v5 = (void *)*MEMORY[0x1E0CEB258];
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __42__SBFluidSwitcherItemContainer_setActive___block_invoke;
      v9 = &unk_1E8E9DF28;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "sb_performBlockAfterCATransactionSynchronizedCommit:", &v6);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    -[SBAppSwitcherPageView setActive:](self->_pageView, "setActive:", v3, v6, v7, v8, v9);
  }
}

- (void)_resetKillProgressScrollState
{
  SBFluidSwitcherTouchPassThroughScrollView *killScrollView;
  SBAppSwitcherPageView *pageView;
  __int128 v5;
  _OWORD v6[3];

  -[SBFluidSwitcherTouchPassThroughScrollView _stopScrollingAndZoomingAnimations](self->_killScrollView, "_stopScrollingAndZoomingAnimations");
  killScrollView = self->_killScrollView;
  -[SBFluidSwitcherItemContainer _contentOffsetAtRest](self, "_contentOffsetAtRest");
  -[SBFluidSwitcherTouchPassThroughScrollView setContentOffset:](killScrollView, "setContentOffset:");
  pageView = self->_pageView;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SBAppSwitcherPageView setTransform:](pageView, "setTransform:", v6);
}

- (CGPoint)_contentOffsetAtRest
{
  double v3;
  double v4;
  CGPoint result;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1 && self->_killAxis == 1)
  {
    -[SBFluidSwitcherTouchPassThroughScrollView contentSize](self->_killScrollView, "contentSize");
    -[SBFluidSwitcherTouchPassThroughScrollView bounds](self->_killScrollView, "bounds");
    SBScreenScale();
    BSFloatRoundForScale();
    v4 = 0.0;
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)currentStatusBarHeight
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "currentStatusBarHeightOfContainer:", self);
  v5 = v4;

  return v5;
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
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  SBAppSwitcherPageView *pageView;
  double v30;
  double v31;
  SBApplicationBlurContentView *blurView;
  SBApplicationBlurContentView *v33;
  SBFluidSwitcherIconOverlayView *iconOverlayView;
  _QWORD v35[7];
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)SBFluidSwitcherItemContainer;
  -[SBFTouchPassThroughClippingView layoutSubviews](&v36, sel_layoutSubviews);
  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForPageViewOfContainer:fullyPresented:", self, 1);
  v5 = v4;
  v7 = v6;
  -[SBFluidSwitcherItemContainer _frameForScrollViewWithFullPresentedSize:](self, "_frameForScrollViewWithFullPresentedSize:", v4, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SBFluidSwitcherTouchPassThroughScrollView frame](self->_killScrollView, "frame");
  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  if (!CGRectEqualToRect(v37, v38))
    -[SBFluidSwitcherTouchPassThroughScrollView setFrame:](self->_killScrollView, "setFrame:", v9, v11, v13, v15);
  -[SBFluidSwitcherItemContainer _contentSizeForScrollView](self, "_contentSizeForScrollView");
  v17 = v16;
  v19 = v18;
  -[SBFluidSwitcherTouchPassThroughScrollView contentSize](self->_killScrollView, "contentSize");
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __46__SBFluidSwitcherItemContainer_layoutSubviews__block_invoke;
    v35[3] = &unk_1E8E9DF00;
    v35[4] = self;
    v35[5] = v17;
    v35[6] = v19;
    v20 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v35);
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInRetargetableAnimationBlock"))
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v20);
    }
    else if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v20);
    }
    else
    {
      v20[2](v20);
    }

  }
  -[SBFluidSwitcherItemContainer _frameForPageViewWithFullPresentedSize:](self, "_frameForPageViewWithFullPresentedSize:", v5, v7);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  pageView = self->_pageView;
  SBRectWithSize();
  -[SBAppSwitcherPageView setBounds:](pageView, "setBounds:");
  UIRectGetCenter();
  -[SBAppSwitcherPageView setCenter:](self->_pageView, "setCenter:", v30 + v26 * (self->_pageViewAnchorPoint.x + -0.5) + self->_pageViewOffset.x, v31 + v28 * (self->_pageViewAnchorPoint.y + -0.5) + self->_pageViewOffset.y);
  -[SBAppSwitcherPageView setOrientation:](self->_pageView, "setOrientation:", objc_msgSend(v3, "switcherInterfaceOrientation"));
  -[SBAppSwitcherPageView setOverlayViewSize:](self->_pageView, "setOverlayViewSize:", v5, v7);
  -[SBAppSwitcherPageView setFullyPresentedSize:](self->_pageView, "setFullyPresentedSize:", v5, v7);
  blurView = self->_blurView;
  if (blurView)
  {
    -[SBAppSwitcherPageView bounds](self->_pageView, "bounds");
    -[SBApplicationBlurContentView setBounds:](blurView, "setBounds:");
    v33 = self->_blurView;
    -[SBAppSwitcherPageView center](self->_pageView, "center");
    -[SBApplicationBlurContentView setCenter:](v33, "setCenter:");
  }
  -[SBFluidSwitcherItemContainer _updatePageViewContentClippingFrame](self, "_updatePageViewContentClippingFrame");
  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView)
    -[BSUIOrientationTransformWrapperView setFrame:](iconOverlayView, "setFrame:", v22, v24, v26, v28);
  -[SBFluidSwitcherItemContainer _ensureSubviewOrder](self, "_ensureSubviewOrder");

}

- (void)_updatePageViewContentClippingFrame
{
  double unobscuredMargin;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[SBAppSwitcherPageView bounds](self->_pageView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (self->_clipsToUnobscuredMargin)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      -[SBFluidSwitcherItemContainer _frameForPageView](self, "_frameForPageView");
      v11 = v10;
      unobscuredMargin = self->_unobscuredMargin;
      v5 = v11 - unobscuredMargin;
    }
    else
    {
      unobscuredMargin = self->_unobscuredMargin;
    }
  }
  -[SBAppSwitcherPageView setContentClippingFrame:](self->_pageView, "setContentClippingFrame:", v5, v7, unobscuredMargin, v9);
}

- (CGRect)_frameForPageViewWithFullPresentedSize:(CGSize)a3
{
  double height;
  double width;
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
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameForPageViewOfContainer:fullyPresented:", self, 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1 && self->_killAxis == 1)
  {
    -[SBFluidSwitcherTouchPassThroughScrollView contentSize](self->_killScrollView, "contentSize");
    v16 = v15;
    -[SBFluidSwitcherTouchPassThroughScrollView bounds](self->_killScrollView, "bounds");
    v18 = v8 + v16 - v17;
  }
  else
  {
    -[SBFluidSwitcherTouchPassThroughScrollView bounds](self->_killScrollView, "bounds");
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", v19, v20);
    v22 = v21;
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", width, height);
    -[SBFluidSwitcherItemContainer _CGPointFromScalarBasedOnKillAxis:](self, "_CGPointFromScalarBasedOnKillAxis:", v22 - v23);
    v18 = v24;
    v10 = v25;
  }

  v26 = v18;
  v27 = v10;
  v28 = v12;
  v29 = v14;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (SBFluidSwitcherItemContainerDelegate)delegate
{
  return (SBFluidSwitcherItemContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (CGRect)_frameForScrollViewWithFullPresentedSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.height;
  width = a3.width;
  SBRectWithSize();
  -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", v6, v7);
  -[SBFluidSwitcherItemContainer _CGSizeFromLengthBasedOnKillAxis:](self, "_CGSizeFromLengthBasedOnKillAxis:", v8 * 0.5);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1 || self->_killAxis != 1)
  {
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", width, height);
    -[SBFluidSwitcherItemContainer _CGPointFromScalarBasedOnKillAxis:](self, "_CGPointFromScalarBasedOnKillAxis:", v9 * 0.5);
  }
  SBScreenScale();
  BSRectRoundForScale();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)_CGSizeWidthOrHeightBasedOnKillAxis:(CGSize)a3
{
  if (!self->_killAxis)
    a3.width = a3.height;
  return a3.width;
}

- (CGPoint)_CGPointFromScalarBasedOnKillAxis:(double)a3
{
  unint64_t killAxis;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  killAxis = self->_killAxis;
  v4 = 0.0;
  if (killAxis)
    v5 = a3;
  else
    v5 = 0.0;
  if (!killAxis)
    v4 = a3;
  v6 = v5;
  result.y = v4;
  result.x = v6;
  return result;
}

- (void)_ensureSubviewOrder
{
  -[SBFTouchPassThroughClippingView bringSubviewToFront:](self, "bringSubviewToFront:", self->_killScrollView);
  -[SBFluidSwitcherTouchPassThroughScrollView bringSubviewToFront:](self->_killScrollView, "bringSubviewToFront:", self->_iconOverlayView);
}

- (CGSize)_contentSizeForScrollView
{
  double v3;
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
  CGSize result;

  -[SBFluidSwitcherItemContainer contentPageViewScale](self, "contentPageViewScale");
  if (self->_killable && (v4 = v3, BSFloatGreaterThanFloat()))
  {
    v5 = self->_minimumTranslationForKillingContainer / v4;
    -[SBFluidSwitcherTouchPassThroughScrollView bounds](self->_killScrollView, "bounds");
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", v6, v7);
    -[SBFluidSwitcherItemContainer _CGSizeFromLengthBasedOnKillAxis:](self, "_CGSizeFromLengthBasedOnKillAxis:", v5 + v8 + v5 + v8);
  }
  else
  {
    -[SBFluidSwitcherTouchPassThroughScrollView bounds](self->_killScrollView, "bounds");
    v12 = v11;
    -[SBFluidSwitcherTouchPassThroughScrollView bounds](self->_killScrollView, "bounds");
    v10 = v13 + 1.0;
    v9 = v12;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)contentPageViewScale
{
  return self->_contentPageViewScale;
}

- (CGSize)_CGSizeFromLengthBasedOnKillAxis:(double)a3
{
  unint64_t killAxis;
  double v4;
  double v5;
  double v6;
  CGSize result;

  killAxis = self->_killAxis;
  v4 = 0.0;
  if (killAxis)
    v5 = a3;
  else
    v5 = 0.0;
  if (!killAxis)
    v4 = a3;
  v6 = v5;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)_updateShadowVisibility
{
  id v3;

  -[SBAppSwitcherPageView _shadowView](self->_pageView, "_shadowView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", self->_dragging);

}

- (id)layer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherItemContainer;
  -[SBFluidSwitcherItemContainer layer](&v3, sel_layer);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBAppSwitcherPageContentView)contentView
{
  return -[SBAppSwitcherPageView view](self->_pageView, "view");
}

- (UIView)contentOverlay
{
  return -[SBAppSwitcherPageView overlay](self->_pageView, "overlay");
}

- (void)setShouldScaleOverlayToFillBounds:(BOOL)a3
{
  if (self->_shouldScaleOverlayToFillBounds != a3)
  {
    self->_shouldScaleOverlayToFillBounds = a3;
    -[SBAppSwitcherPageView setShouldScaleOverlayToFillBounds:](self->_pageView, "setShouldScaleOverlayToFillBounds:");
  }
}

- (void)setSupportsSwitcherDragAndDrop:(BOOL)a3
{
  self->_supportsSwitcherDragAndDrop = a3;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBAppSwitcherPageView setMaskedCorners:](self->_pageView, "setMaskedCorners:");
  }
}

- (void)setDraggable:(BOOL)a3
{
  if (self->_draggable != a3)
    self->_draggable = a3;
}

- (void)setBlurred:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  _BOOL4 v11;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  SBApplicationBlurContentView *v27;
  SBApplicationBlurContentView *v28;
  SBApplicationBlurContentView *blurView;
  void *v30;
  double topLeft;
  uint64_t i;
  SBApplicationBlurContentView *v33;
  _QWORD v34[5];
  void (**v35)(_QWORD);
  _QWORD v36[5];
  _QWORD v37[5];
  void (**v38)(_QWORD);
  _QWORD v39[5];
  _QWORD v40[5];
  void (**v41)(_QWORD);
  _BYTE v42[8];
  double topRight;
  __int128 v44;
  uint64_t v45;

  v11 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v13 = (void (**)(_QWORD))a7;
  v14 = (void (**)(_QWORD))a8;
  if (self->_blurred != v11)
  {
    self->_blurred = v11;
    if (v13)
      v13[2](v13);
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_blurred)
    {
      if (!self->_blurView)
      {
        -[SBAppLayout allItems](self->_appLayout, "allItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBAppSwitcherPageView overlay](self->_pageView, "overlay");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v25 = v23;
        }
        else
        {
          -[SBAppSwitcherPageView view](self->_pageView, "view");
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v25;

        v27 = [SBApplicationBlurContentView alloc];
        -[SBAppSwitcherPageView frame](self->_pageView, "frame");
        v28 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:](v27, "initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:", v22, v26);
        blurView = self->_blurView;
        self->_blurView = v28;

        -[SBApplicationBlurContentView setBlurDelay:](self->_blurView, "setBlurDelay:", a5);
        -[SBApplicationBlurContentView setClipsToBounds:](self->_blurView, "setClipsToBounds:", 1);
        -[SBApplicationBlurContentView layer](self->_blurView, "layer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setAllowsGroupOpacity:", 1);

        -[SBFluidSwitcherTouchPassThroughScrollView addSubview:](self->_killScrollView, "addSubview:", self->_blurView);
        topLeft = self->_contentCornerRadii.topLeft;
        topRight = self->_contentCornerRadii.topRight;
        v44 = *(_OWORD *)&self->_contentCornerRadii.bottomLeft;
        for (i = 8; i != 32; i += 8)
        {
          if (topLeft < *(double *)&v42[i])
            topLeft = *(double *)&v42[i];
        }
        -[SBApplicationBlurContentView _setContinuousCornerRadius:](self->_blurView, "_setContinuousCornerRadius:", topLeft);
        -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
        v33 = self->_blurView;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke;
        v40[3] = &unk_1E8EA02D8;
        v40[4] = self;
        v41 = v14;
        -[SBApplicationBlurContentView generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:](v33, "generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:", v15, v40);

        goto LABEL_20;
      }
      v16 = (void *)MEMORY[0x1E0D01908];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_2;
      v39[3] = &unk_1E8E9DED8;
      v39[4] = self;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_3;
      v37[3] = &unk_1E8E9F230;
      v37[4] = self;
      v38 = v14;
      objc_msgSend(v16, "animateWithFactory:options:actions:completion:", v15, 4, v39, v37);
      v17 = v38;
    }
    else
    {
      -[SBAppSwitcherPageView overlay](self->_pageView, "overlay");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHidden:", 0);

      if (!self->_blurView)
      {
        if (v14)
          v14[2](v14);
        goto LABEL_20;
      }
      v19 = (void *)MEMORY[0x1E0D01908];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_4;
      v36[3] = &unk_1E8E9DED8;
      v36[4] = self;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_5;
      v34[3] = &unk_1E8E9F230;
      v34[4] = self;
      v35 = v14;
      objc_msgSend(v19, "animateWithFactory:options:actions:completion:", v15, 4, v36, v34);
      v17 = v35;
    }

LABEL_20:
  }

}

- (void)setSizeForContainingSpace:(CGSize)a3
{
  self->_sizeForContainingSpace = a3;
}

- (void)setPageViewOffset:(CGPoint)a3
{
  if (a3.x != self->_pageViewOffset.x || a3.y != self->_pageViewOffset.y)
  {
    self->_pageViewOffset = a3;
    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPageViewAnchorPoint:(CGPoint)a3
{
  CGPoint *p_pageViewAnchorPoint;
  void *v6;

  p_pageViewAnchorPoint = &self->_pageViewAnchorPoint;
  if (a3.x != self->_pageViewAnchorPoint.x || a3.y != self->_pageViewAnchorPoint.y)
  {
    p_pageViewAnchorPoint->x = a3.x;
    self->_pageViewAnchorPoint.y = a3.y;
    -[SBAppSwitcherPageView layer](self->_pageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnchorPoint:", p_pageViewAnchorPoint->x, p_pageViewAnchorPoint->y);

    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumTranslationForKillingContainer:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_minimumTranslationForKillingContainer = a3;
    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_visible != a3)
  {
    v3 = a3;
    self->_visible = a3;
    if (a3)
    {
      -[SBFluidSwitcherItemContainer _resetKillProgressScrollState](self, "_resetKillProgressScrollState");
      self->_sentKillRequest = 0;
    }
    else
    {
      -[SBFluidSwitcherItemContainer setHighlightedFromDirectTouch:](self, "setHighlightedFromDirectTouch:", 0);
    }
    -[SBAppSwitcherPageView setVisible:](self->_pageView, "setVisible:", v3);
  }
}

- (void)setWallpaperOverlayAlpha:(double)a3
{
  -[SBAppSwitcherPageView setWallpaperOverlayAlpha:](self->_pageView, "setWallpaperOverlayAlpha:", a3);
}

- (void)setTintStyle:(int64_t)a3
{
  -[SBAppSwitcherPageView setTintStyle:](self->_pageView, "setTintStyle:", a3);
}

- (void)setShouldUseBackgroundWallpaperTreatment:(BOOL)a3
{
  -[SBAppSwitcherPageView setNeedsBackgroundWallpaperTreatment:](self->_pageView, "setNeedsBackgroundWallpaperTreatment:", a3);
}

- (void)setShadowStyle:(int64_t)a3
{
  -[SBAppSwitcherPageView setShadowStyle:](self->_pageView, "setShadowStyle:", a3);
}

- (void)setShadowOffset:(double)a3
{
  -[SBAppSwitcherPageView setShadowOffset:](self->_pageView, "setShadowOffset:", a3);
}

- (void)setShadowAlpha:(double)a3
{
  -[SBAppSwitcherPageView setShadowAlpha:](self->_pageView, "setShadowAlpha:", a3);
}

- (void)setResizingAllowed:(BOOL)a3
{
  -[SBAppSwitcherPageView setResizingAllowed:](self->_pageView, "setResizingAllowed:", a3);
}

- (void)setPointerInteractionHitTestPadding:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_pointerInteractionHitTestPadding = a3;
    -[SBAppSwitcherPageView setPointerInteractionHitTestPadding:](self->_pageView, "setPointerInteractionHitTestPadding:", a3);
  }
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  if (self->_pointerInteractionEnabled != a3)
  {
    self->_pointerInteractionEnabled = a3;
    -[SBFluidSwitcherItemContainer _updateTransformForCurrentHighlight](self, "_updateTransformForCurrentHighlight");
  }
}

- (void)setOccludedInContinuousExposeStage:(BOOL)a3
{
  -[SBAppSwitcherPageView setOccludedInContinuousExposeStage:](self->_pageView, "setOccludedInContinuousExposeStage:", a3);
}

- (void)setLighteningAlpha:(double)a3
{
  -[SBAppSwitcherPageView setLighteningAlpha:](self->_pageView, "setLighteningAlpha:", a3);
}

- (void)setDimmingAlpha:(double)a3
{
  -[SBAppSwitcherPageView setDimmingAlpha:](self->_pageView, "setDimmingAlpha:", a3);
}

- (void)setContentViewBlocksTouches:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_preferredPointerLockStatusSuppressed)
    *(_QWORD *)&a3 = 1;
  else
    v3 = a3;
  -[SBAppSwitcherPageView setBlocksTouches:](self->_pageView, "setBlocksTouches:", a3);
}

- (void)setAllowedTouchResizeCorners:(unint64_t)a3
{
  -[SBAppSwitcherPageView setAllowedTouchResizeCorners:](self->_pageView, "setAllowedTouchResizeCorners:", a3);
}

- (SBAffordancePresenceController)affordancePresenceController
{
  return self->_affordancePresenceController;
}

- (void)setContentPageViewScale:(double)a3
{
  if (self->_contentPageViewScale != a3)
  {
    self->_contentPageViewScale = a3;
    -[SBAppSwitcherPageView setSwitcherCardScale:](self->_pageView, "setSwitcherCardScale:");
    -[SBFluidSwitcherTouchPassThroughScrollView setVelocityScaleFactor:](self->_killScrollView, "setVelocityScaleFactor:", self->_killScrollViewInitialVelocityScaleFactor * self->_contentPageViewScale);
    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherItemContainer layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setBlurViewIconScale:(double)a3
{
  -[SBApplicationBlurContentView setIconViewScale:](self->_blurView, "setIconViewScale:", a3);
}

- (void)setContentCornerRadii:(UIRectCornerRadii)a3
{
  UIRectCornerRadii *p_contentCornerRadii;
  double topLeft;
  uint64_t i;
  _BYTE v10[8];
  double topRight;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_contentCornerRadii = &self->_contentCornerRadii;
  if (a3.topLeft != self->_contentCornerRadii.topLeft
    || a3.bottomLeft != self->_contentCornerRadii.bottomLeft
    || a3.bottomRight != self->_contentCornerRadii.bottomRight
    || a3.topRight != self->_contentCornerRadii.topRight)
  {
    p_contentCornerRadii->topLeft = a3.topLeft;
    self->_contentCornerRadii.bottomLeft = a3.bottomLeft;
    self->_contentCornerRadii.bottomRight = a3.bottomRight;
    self->_contentCornerRadii.topRight = a3.topRight;
    -[SBAppSwitcherPageView setCornerRadii:](self->_pageView, "setCornerRadii:");
    topLeft = p_contentCornerRadii->topLeft;
    topRight = p_contentCornerRadii->topRight;
    v12 = *(_OWORD *)&p_contentCornerRadii->bottomLeft;
    for (i = 8; i != 32; i += 8)
    {
      if (topLeft < *(double *)&v10[i])
        topLeft = *(double *)&v10[i];
    }
    -[SBApplicationBlurContentView _setContinuousCornerRadius:](self->_blurView, "_setContinuousCornerRadius:", topLeft);
    -[SBFluidSwitcherIconOverlayView setCornerRadius:](self->_iconOverlayView, "setCornerRadius:", topLeft);
  }
}

- (void)setMeshTransform:(id)a3
{
  id v4;
  id v5;

  if ((unint64_t)a3 | (unint64_t)self->_meshTransform)
  {
    self->_meshTransform = (CAMeshTransform *)a3;
    v4 = a3;
    -[SBFluidSwitcherItemContainer layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", self->_meshTransform, CFSTR("meshTransform"));

  }
}

- (void)setContentOverlay:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v6;
  id v7;

  v4 = a4;
  v6 = a3 != 0;
  v7 = a3;
  -[SBFTouchPassThroughClippingView setHitTestsSubviewsOutsideBounds:](self, "setHitTestsSubviewsOutsideBounds:", v6);
  -[SBHitTestExtendedView setHitTestsSubviewsOutsideBounds:](self->_pageView, "setHitTestsSubviewsOutsideBounds:", -[SBFTouchPassThroughClippingView hitTestsSubviewsOutsideBounds](self, "hitTestsSubviewsOutsideBounds"));
  -[SBAppSwitcherPageView setOverlay:animated:](self->_pageView, "setOverlay:animated:", v7, v4);

}

- (void)setAppLayout:(id)a3
{
  SBAppLayout *v5;
  SBAppLayout *v6;

  v5 = (SBAppLayout *)a3;
  if (self->_appLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_appLayout, a3);
    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherItemContainer _updateAccessibilityIdentifier](self, "_updateAccessibilityIdentifier");
    v5 = v6;
  }

}

- (void)_updateAccessibilityIdentifier
{
  SBAppLayout *appLayout;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  appLayout = self->_appLayout;
  if (appLayout)
  {
    -[SBAppLayout itemForLayoutRole:](appLayout, "itemForLayoutRole:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("card:%@:%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherItemContainer setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

  }
  else
  {
    -[SBFluidSwitcherItemContainer setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
  }
}

void __42__SBFluidSwitcherItemContainer_setActive___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[688] = 1;

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBFluidSwitcherItemContainer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherItemContainer.m"), 193, CFSTR("Override initWithFrame:delegate: instead"));

  return -[SBFluidSwitcherItemContainer initWithFrame:appLayout:delegate:active:windowScene:](self, "initWithFrame:appLayout:delegate:active:windowScene:", 0, 0, 0, 0, x, y, width, height);
}

- (SBFluidSwitcherItemContainer)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherItemContainer.m"), 199, CFSTR("Override initWithFrame:delegate: instead"));

  return -[SBFluidSwitcherItemContainer initWithFrame:appLayout:delegate:active:windowScene:](self, "initWithFrame:appLayout:delegate:active:windowScene:", 0, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SBFluidSwitcherItemContainer)initWithFrame:(CGRect)a3 appLayout:(id)a4 delegate:(id)a5 active:(BOOL)a6 windowScene:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  SBFluidSwitcherItemContainer *v20;
  SBFluidSwitcherItemContainer *v21;
  uint64_t v22;
  SBAppSwitcherSettings *settings;
  uint64_t v24;
  SBMedusaSettings *medusaSettings;
  uint64_t v26;
  SBFluidSwitcherTouchPassThroughScrollView *killScrollView;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  uint64_t v33;
  UIDragInteraction *dragInteraction;
  SBAffordancePresenceController *v35;
  SBAffordancePresenceController *affordancePresenceController;
  void *v38;
  objc_super v39;
  CGRect v40;

  v8 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherItemContainer.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v39.receiver = self;
  v39.super_class = (Class)SBFluidSwitcherItemContainer;
  v20 = -[SBFTouchPassThroughClippingView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_appLayout, a4);
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v22 = objc_claimAutoreleasedReturnValue();
    settings = v21->_settings;
    v21->_settings = (SBAppSwitcherSettings *)v22;

    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v24 = objc_claimAutoreleasedReturnValue();
    medusaSettings = v21->_medusaSettings;
    v21->_medusaSettings = (SBMedusaSettings *)v24;

    v21->_contentPageViewScale = 1.0;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v21->_unobscuredMargin = CGRectGetWidth(v40);
    objc_storeWeak((id *)&v21->_delegate, v18);
    -[SBFluidSwitcherItemContainer _createScrollView](v21, "_createScrollView");
    v26 = objc_claimAutoreleasedReturnValue();
    killScrollView = v21->_killScrollView;
    v21->_killScrollView = (SBFluidSwitcherTouchPassThroughScrollView *)v26;

    -[SBFluidSwitcherTouchPassThroughScrollView velocityScaleFactor](v21->_killScrollView, "velocityScaleFactor");
    v21->_killScrollViewInitialVelocityScaleFactor = v28;
    -[SBFTouchPassThroughClippingView addSubview:](v21, "addSubview:", v21->_killScrollView);
    -[SBFluidSwitcherItemContainer _addPageView](v21, "_addPageView");
    -[SBFluidSwitcherItemContainer setActive:](v21, "setActive:", v8);
    -[SBFluidSwitcherItemContainer layer](v21, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherItemContainer traitCollection](v21, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "displayScale");
    objc_msgSend(v29, "setRasterizationScale:");

    -[SBFluidSwitcherItemContainer _setSafeAreaInsetsFrozen:](v21, "_setSafeAreaInsetsFrozen:", 1);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v21, sel__handleHoverGesture_);
    hoverGestureRecognizer = v21->_hoverGestureRecognizer;
    v21->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v31;

    -[SBFluidSwitcherItemContainer addGestureRecognizer:](v21, "addGestureRecognizer:", v21->_hoverGestureRecognizer);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", v21);
    dragInteraction = v21->_dragInteraction;
    v21->_dragInteraction = (UIDragInteraction *)v33;

    -[SBFluidSwitcherItemContainer addInteraction:](v21, "addInteraction:", v21->_dragInteraction);
    -[SBFluidSwitcherItemContainer _updateAccessibilityIdentifier](v21, "_updateAccessibilityIdentifier");
    -[SBFluidSwitcherItemContainer setPageViewAnchorPoint:](v21, "setPageViewAnchorPoint:", 0.5, 0.5);
    -[SBFluidSwitcherItemContainer _updateKillScrollViewEnabled](v21, "_updateKillScrollViewEnabled");
    v35 = -[SBAffordancePresenceController initWithDelegate:windowScene:]([SBAffordancePresenceController alloc], "initWithDelegate:windowScene:", v21, v19);
    affordancePresenceController = v21->_affordancePresenceController;
    v21->_affordancePresenceController = v35;

  }
  return v21;
}

- (id)_createScrollView
{
  double v3;
  double v4;
  double v5;
  double v6;
  SBFluidSwitcherTouchPassThroughScrollView *v7;
  void *v8;
  void *v9;

  -[SBFluidSwitcherItemContainer _frameForScrollView](self, "_frameForScrollView");
  v7 = -[SBFluidSwitcherTouchPassThroughScrollView initWithFrame:]([SBFluidSwitcherTouchPassThroughScrollView alloc], "initWithFrame:", v3, v4, v5, v6);
  -[SBFluidSwitcherTouchPassThroughScrollView setBounces:](v7, "setBounces:", 1);
  -[SBFluidSwitcherTouchPassThroughScrollView setPagingEnabled:](v7, "setPagingEnabled:", 1);
  -[SBFluidSwitcherTouchPassThroughScrollView setShowsHorizontalScrollIndicator:](v7, "setShowsHorizontalScrollIndicator:", 0);
  -[SBFluidSwitcherTouchPassThroughScrollView setShowsVerticalScrollIndicator:](v7, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherTouchPassThroughScrollView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[SBFluidSwitcherTouchPassThroughScrollView setDelegate:](v7, "setDelegate:", self);
  -[SBFluidSwitcherTouchPassThroughScrollView setClipsToBounds:](v7, "setClipsToBounds:", 0);
  -[SBFluidSwitcherTouchPassThroughScrollView _setAutoScrollEnabled:](v7, "_setAutoScrollEnabled:", 0);
  -[SBFluidSwitcherTouchPassThroughScrollView setTracksImmediatelyWhileDecelerating:](v7, "setTracksImmediatelyWhileDecelerating:", 0);
  -[SBFluidSwitcherTouchPassThroughScrollView _setSupportsPointerDragScrolling:](v7, "_setSupportsPointerDragScrolling:", 1);
  -[SBFluidSwitcherTouchPassThroughScrollView panGestureRecognizer](v7, "panGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowedScrollTypesMask:", 2);

  -[SBFluidSwitcherTouchPassThroughScrollView setAlwaysBounceVertical:](v7, "setAlwaysBounceVertical:", 1);
  return v7;
}

- (void)_addPageView
{
  double v3;
  double v4;
  double v5;
  double v6;
  SBAppSwitcherPageView *v7;
  SBAppSwitcherPageView *pageView;
  void *v9;
  UILongPressGestureRecognizer *v10;
  UILongPressGestureRecognizer *selectionHighlightGestureRecognizer;
  UILongPressGestureRecognizer *v12;
  UILongPressGestureRecognizer *pressDownGestureRecognizer;
  SBFailureNotifyingTapGestureRecognizer *v14;
  SBFailureNotifyingTapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  id v18;

  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frameForPageViewOfContainer:fullyPresented:", self, 1);
  SBRectWithSize();
  v7 = -[SBAppSwitcherPageView initWithFrame:]([SBAppSwitcherPageView alloc], "initWithFrame:", v3, v4, v5, v6);
  pageView = self->_pageView;
  self->_pageView = v7;

  -[SBAppSwitcherPageView setSwitcherCardScale:](self->_pageView, "setSwitcherCardScale:", self->_contentPageViewScale);
  -[SBAppSwitcherPageView setShouldClipContentView:](self->_pageView, "setShouldClipContentView:", self->_clipsToUnobscuredMargin);
  -[SBAppSwitcherPageView setCornerRadii:](self->_pageView, "setCornerRadii:", self->_contentCornerRadii.topLeft, self->_contentCornerRadii.bottomLeft, self->_contentCornerRadii.bottomRight, self->_contentCornerRadii.topRight);
  -[SBAppSwitcherPageView setShouldScaleOverlayToFillBounds:](self->_pageView, "setShouldScaleOverlayToFillBounds:", self->_shouldScaleOverlayToFillBounds);
  -[SBAppSwitcherPageView setDelegate:](self->_pageView, "setDelegate:", self);
  -[SBAppSwitcherPageView setMaskedCorners:](self->_pageView, "setMaskedCorners:", self->_maskedCorners);
  -[SBAppSwitcherPageView setPointerInteractionHitTestPadding:](self->_pageView, "setPointerInteractionHitTestPadding:", self->_pointerInteractionHitTestPadding);
  -[SBAppSwitcherPageView layer](self->_pageView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAnchorPoint:", self->_pageViewAnchorPoint.x, self->_pageViewAnchorPoint.y);

  -[SBFluidSwitcherTouchPassThroughScrollView addSubview:](self->_killScrollView, "addSubview:", self->_pageView);
  v10 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleSelectionHighlightGesture_);
  selectionHighlightGestureRecognizer = self->_selectionHighlightGestureRecognizer;
  self->_selectionHighlightGestureRecognizer = v10;

  -[UILongPressGestureRecognizer setDelegate:](self->_selectionHighlightGestureRecognizer, "setDelegate:", self);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_selectionHighlightGestureRecognizer, "setMinimumPressDuration:", 0.12);
  -[UILongPressGestureRecognizer _setKeepTouchesOnContinuation:](self->_selectionHighlightGestureRecognizer, "_setKeepTouchesOnContinuation:", 1);
  -[SBFluidSwitcherItemContainer addGestureRecognizer:](self, "addGestureRecognizer:", self->_selectionHighlightGestureRecognizer);
  v12 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handlePageViewPressDown_);
  pressDownGestureRecognizer = self->_pressDownGestureRecognizer;
  self->_pressDownGestureRecognizer = v12;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_pressDownGestureRecognizer, "setMinimumPressDuration:", 0.0);
  -[UILongPressGestureRecognizer setDelegate:](self->_pressDownGestureRecognizer, "setDelegate:", self);
  -[SBFluidSwitcherItemContainer addGestureRecognizer:](self, "addGestureRecognizer:", self->_pressDownGestureRecognizer);
  v14 = -[SBFailureNotifyingTapGestureRecognizer initWithTarget:action:]([SBFailureNotifyingTapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePageViewTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v14;

  -[SBFailureNotifyingTapGestureRecognizer setAllowableMovement:](self->_tapGestureRecognizer, "setAllowableMovement:", 10.0);
  -[SBFailureNotifyingTapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[SBFailureNotifyingTapGestureRecognizer _setKeepTouchesOnContinuation:](self->_tapGestureRecognizer, "_setKeepTouchesOnContinuation:", 1);
  -[SBFluidSwitcherItemContainer addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handlePageViewTap_);
  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  self->_doubleTapGestureRecognizer = v16;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setDelegate:](self->_doubleTapGestureRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_doubleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
  -[SBFluidSwitcherItemContainer addGestureRecognizer:](self, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
  -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
  -[SBFluidSwitcherItemContainer layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)prepareForReuse
{
  void *v3;
  char v4;
  void *v5;
  void *v7;

  if (self->_active)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherItemContainer.m"), 304, CFSTR("Can't recycle active view"));

  }
  self->_animatingPageViewScale = 0;
  -[SBFluidSwitcherItemContainer setHighlightedFromDirectTouch:](self, "setHighlightedFromDirectTouch:", 0);
  -[SBFluidSwitcherItemContainer setHighlightedFromCursorHover:](self, "setHighlightedFromCursorHover:", 0);
  -[SBFluidSwitcherItemContainer setLifted:](self, "setLifted:", 0);
  -[SBFluidSwitcherItemContainer setContentOverlay:](self, "setContentOverlay:", 0);
  -[SBFluidSwitcherItemContainer setContentViewBlocksTouches:](self, "setContentViewBlocksTouches:", 1);
  -[SBFluidSwitcherItemContainer setRubberbandable:](self, "setRubberbandable:", 0);
  -[SBFluidSwitcherItemContainer setKillable:](self, "setKillable:", 0);
  -[SBFluidSwitcherItemContainer setFocusable:](self, "setFocusable:", 0);
  -[SBFluidSwitcherItemContainer setDraggable:](self, "setDraggable:", 0);
  -[SBFluidSwitcherItemContainer setSuppressesHighlightEffect:](self, "setSuppressesHighlightEffect:", 0);
  -[SBFluidSwitcherItemContainer setPageViewAnchorPoint:](self, "setPageViewAnchorPoint:", 0.5, 0.5);
  -[SBFluidSwitcherItemContainer setPageViewOffset:](self, "setPageViewOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBFluidSwitcherItemContainer setPreferredPointerLockStatusSuppressed:](self, "setPreferredPointerLockStatusSuppressed:", 0);
  -[SBFluidSwitcherItemContainer setAllowedTouchResizeCorners:](self, "setAllowedTouchResizeCorners:", 0);
  -[SBFluidSwitcherItemContainer _updateForPointerHoveringOverEdge:](self, "_updateForPointerHoveringOverEdge:", 0);
  self->_sentKillRequest = 0;
  -[SBAppSwitcherPageView setAlpha:](self->_pageView, "setAlpha:", 1.0);
  self->_dragging = 0;
  -[SBFluidSwitcherItemContainer _updateShadowVisibility](self, "_updateShadowVisibility");
  -[SBFluidSwitcherItemContainer contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SBFluidSwitcherItemContainer contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForReuse");

  }
  -[SBFluidSwitcherItemContainer setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[UIHoverGestureRecognizer setEnabled:](self->_hoverGestureRecognizer, "setEnabled:", 0);
  -[UIHoverGestureRecognizer setEnabled:](self->_hoverGestureRecognizer, "setEnabled:", 1);
  -[SBFluidSwitcherItemContainer setAppLayout:](self, "setAppLayout:", 0);
  self->_hasPageViewBeenCommitted = 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherItemContainer;
  -[SBFluidSwitcherItemContainer description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" appLayout: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (double)preferredRestingVisibleMarginForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double result;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[SBFluidSwitcherItemContainerHeaderView distanceFromBoundingLeadingEdgeToIconTrailingEdge](SBFluidSwitcherItemContainerHeaderView, "distanceFromBoundingLeadingEdgeToIconTrailingEdge");
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetWidth(v8);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  CGRectGetHeight(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetWidth(v10);
  SBScreenScale();
  BSFloatRoundForScale();
  return result;
}

- (BOOL)contentViewBlocksTouches
{
  return -[SBAppSwitcherPageView blocksTouches](self->_pageView, "blocksTouches");
}

- (void)setPreferredPointerLockStatusSuppressed:(BOOL)a3
{
  if (self->_preferredPointerLockStatusSuppressed != a3)
  {
    self->_preferredPointerLockStatusSuppressed = a3;
    -[SBFluidSwitcherItemContainer setContentViewBlocksTouches:](self, "setContentViewBlocksTouches:", -[SBFluidSwitcherItemContainer contentViewBlocksTouches](self, "contentViewBlocksTouches"));
    -[SBFluidSwitcherItemContainer setSelectable:](self, "setSelectable:", self->_selectable);
  }
}

- (void)setContentOverlay:(id)a3
{
  -[SBFluidSwitcherItemContainer setContentOverlay:animated:](self, "setContentOverlay:animated:", a3, 0);
}

- (double)blurViewIconScale
{
  double result;

  -[SBApplicationBlurContentView iconViewScale](self->_blurView, "iconViewScale");
  return result;
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 648))
  {
    objc_msgSend(*(id *)(v2 + 496), "overlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setAlpha:", 1.0);
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 648))
  {
    objc_msgSend(*(id *)(v2 + 496), "overlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setAlpha:", 0.0);
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 648))
  {
    objc_msgSend(*(id *)(v2 + 640), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 640);
    *(_QWORD *)(v3 + 640) = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)contentAlpha
{
  double result;

  -[SBAppSwitcherPageView contentAlpha](self->_pageView, "contentAlpha");
  return result;
}

- (void)_updatePageViewContentViewClipping
{
  SBAppSwitcherPageView *pageView;
  _BOOL8 v4;

  pageView = self->_pageView;
  v4 = self->_clipsToUnobscuredMargin
    && !self->_highlightedFromDirectTouch
    && !self->_lifted
    && !self->_highlightedFromCursorHover
    && !self->_animatingPageViewScale;
  -[SBAppSwitcherPageView setShouldClipContentView:](pageView, "setShouldClipContentView:", v4);
}

- (double)dimmingAlpha
{
  double result;

  -[SBAppSwitcherPageView dimmingAlpha](self->_pageView, "dimmingAlpha");
  return result;
}

- (double)wallpaperOverlayAlpha
{
  double result;

  -[SBAppSwitcherPageView wallpaperOverlayAlpha](self->_pageView, "wallpaperOverlayAlpha");
  return result;
}

- (double)lighteningAlpha
{
  double result;

  -[SBAppSwitcherPageView lighteningAlpha](self->_pageView, "lighteningAlpha");
  return result;
}

- (void)_updateKillScrollViewEnabled
{
  SBFluidSwitcherTouchPassThroughScrollView *killScrollView;
  _BOOL8 v4;

  killScrollView = self->_killScrollView;
  v4 = -[SBFluidSwitcherItemContainer isKillable](self, "isKillable")
    || -[SBFluidSwitcherItemContainer isRubberbandable](self, "isRubberbandable");
  -[SBFluidSwitcherTouchPassThroughScrollView setScrollEnabled:](killScrollView, "setScrollEnabled:", v4);
}

- (double)killingProgress
{
  double result;

  -[SBFluidSwitcherTouchPassThroughScrollView contentOffset](self->_killScrollView, "contentOffset");
  -[SBFluidSwitcherItemContainer _killingProgressForContentOffset:](self, "_killingProgressForContentOffset:");
  return result;
}

- (double)effectivePageViewPresentationCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBAppSwitcherPageView layer](self->_pageView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (CGRect)effectivePageViewPresentationFrame
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL4 hasPageViewBeenCommitted;
  void *v8;
  void *v9;
  uint64_t v10;
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
  CGRect result;

  -[SBAppSwitcherPageView layer](self->_pageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_hasPageViewBeenCommitted)
  {
    objc_msgSend(v3, "presentationLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;
  hasPageViewBeenCommitted = self->_hasPageViewBeenCommitted;
  -[SBFluidSwitcherItemContainer layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (hasPageViewBeenCommitted)
  {
    objc_msgSend(v8, "presentationLayer");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toLayer:", v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)_killingProgressForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double minimumTranslationForKillingContainer;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  y = a3.y;
  x = a3.x;
  minimumTranslationForKillingContainer = self->_minimumTranslationForKillingContainer;
  -[SBFluidSwitcherItemContainer contentPageViewScale](self, "contentPageViewScale");
  v8 = v7;
  -[SBFluidSwitcherItemContainer _CGPointXOrYBasedOnKillAxis:](self, "_CGPointXOrYBasedOnKillAxis:", x, y);
  v10 = v9;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1 && self->_killAxis == 1)
  {
    -[SBFluidSwitcherItemContainer _contentOffsetAtRest](self, "_contentOffsetAtRest");
    v10 = v11 - v10;
  }
  -[SBAppSwitcherPageView size](self->_pageView, "size");
  -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:");
  return v10 / (minimumTranslationForKillingContainer / v8 + v12);
}

- (CGPoint)_contentOffsetForKillingProgress:(double)a3
{
  double minimumTranslationForKillingContainer;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  minimumTranslationForKillingContainer = self->_minimumTranslationForKillingContainer;
  -[SBFluidSwitcherItemContainer contentPageViewScale](self, "contentPageViewScale");
  v7 = minimumTranslationForKillingContainer / v6;
  -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", self->_sizeForContainingSpace.width, self->_sizeForContainingSpace.height);
  v9 = (v7 + v8) * a3;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1 && self->_killAxis == 1)
  {
    -[SBFluidSwitcherItemContainer _contentOffsetAtRest](self, "_contentOffsetAtRest");
    v9 = v10 - v9;
  }
  -[SBFluidSwitcherItemContainer _CGPointFromScalarBasedOnKillAxis:](self, "_CGPointFromScalarBasedOnKillAxis:", v9);
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)shadowAlpha
{
  double result;

  -[SBAppSwitcherPageView shadowAlpha](self->_pageView, "shadowAlpha");
  return result;
}

- (double)shadowOffset
{
  double result;

  -[SBAppSwitcherPageView shadowOffset](self->_pageView, "shadowOffset");
  return result;
}

- (int64_t)shadowStyle
{
  return -[SBAppSwitcherPageView shadowStyle](self->_pageView, "shadowStyle");
}

- (void)setContentView:(id)a3
{
  -[SBAppSwitcherPageView setView:](self->_pageView, "setView:", a3);
}

- (BOOL)contentViewHasSceneOverlay
{
  void *v2;
  char v3;

  -[SBFluidSwitcherItemContainer contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "hasSceneOverlayView");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isOccludedInContinuousExposeStage
{
  return -[SBAppSwitcherPageView isOccludedInContinuousExposeStage](self->_pageView, "isOccludedInContinuousExposeStage");
}

- (unint64_t)allowedTouchResizeCorners
{
  return -[SBAppSwitcherPageView allowedTouchResizeCorners](self->_pageView, "allowedTouchResizeCorners");
}

- (BOOL)shouldUseBackgroundWallpaperTreatment
{
  return -[SBAppSwitcherPageView needsBackgroundWallpaperTreatment](self->_pageView, "needsBackgroundWallpaperTreatment");
}

- (BOOL)isDeceleratingTowardsKillZone
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[SBFluidSwitcherTouchPassThroughScrollView isDecelerating](self->_killScrollView, "isDecelerating");
  if (v3)
  {
    -[SBFluidSwitcherTouchPassThroughScrollView _pageDecelerationTarget](self->_killScrollView, "_pageDecelerationTarget");
    v5 = v4;
    v7 = v6;
    -[SBFluidSwitcherItemContainer _contentOffsetAtRest](self, "_contentOffsetAtRest");
    LOBYTE(v3) = v7 != v9 || v5 != v8;
  }
  return v3;
}

- (BOOL)positionAnimationsBeginFromModelState
{
  void *v2;
  char v3;

  -[SBFluidSwitcherItemContainer layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "positionAnimationsBeginFromModelState");

  return v3;
}

- (BOOL)transformAnimationsAreLegacyCounterRotations
{
  void *v2;
  char v3;

  -[SBFluidSwitcherItemContainer layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transformAnimationsAreLegacyCounterRotations");

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBFluidSwitcherItemContainer;
  if (-[SBFluidSwitcherItemContainer pointInside:withEvent:](&v26, sel_pointInside_withEvent_, v7, x, y))
    goto LABEL_3;
  v8 = *MEMORY[0x1E0CEB4B0];
  v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  -[SBFluidSwitcherItemContainer bounds](self, "bounds");
  v30.origin.x = v10 + -5.0;
  v30.origin.y = v8 + v11;
  v30.size.width = v12 + 10.0;
  v30.size.height = v13 - (v8 + v9);
  v29.x = x;
  v29.y = y;
  if (CGRectContainsPoint(v30, v29))
  {
LABEL_3:
    v14 = 1;
  }
  else if (-[SBFTouchPassThroughClippingView hitTestsSubviewsOutsideBounds](self, "hitTestsSubviewsOutsideBounds"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[SBFluidSwitcherItemContainer subviews](self, "subviews", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[SBFluidSwitcherItemContainer convertPoint:toView:](self, "convertPoint:toView:", v21, x, y);
          if ((objc_msgSend(v21, "pointInside:withEvent:", v7) & 1) != 0)
          {
            v14 = 1;
            goto LABEL_17;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v18)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_17:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __46__SBFluidSwitcherItemContainer_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __int128 v4;
  double v5;
  double v6;
  id *v7;
  double v8;
  double v9;
  double v10;
  _QWORD *v11;
  void *v12;
  int v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  _OWORD v22[3];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(WeakRetained, "containerWillBeginAnimatingHighlight:scale:isTracking:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 705), 1.0);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v22[0] = *MEMORY[0x1E0C9BAA8];
  v22[1] = v4;
  v22[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_CGSizeWidthOrHeightBasedOnKillAxis:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v6 = v5;
  v7 = *(id **)(a1 + 32);
  objc_msgSend(v7[60], "bounds");
  objc_msgSend(v7, "_CGSizeWidthOrHeightBasedOnKillAxis:", v8, v9);
  v11 = *(_QWORD **)(a1 + 32);
  v12 = (void *)v11[60];
  objc_msgSend(v11, "_CGSizeFromLengthBasedOnKillAxis:", fmax(-(v10 - v6 * 0.5), 0.0));
  objc_msgSend(v12, "_setInterpageSpacing:");
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "isDecelerating");
  v14 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    objc_msgSend((id)v14, "_contentOffsetForKillingProgress:", *(double *)(v14 + 656));
    v16 = v15;
    v18 = v17;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "_setPageDecelerationTarget:");
    objc_msgSend(*(id *)(a1 + 32), "_killingProgressForContentOffset:", v16, v18);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656) = v19;
  }
  else if ((objc_msgSend(*(id *)(v14 + 480), "isDragging") & 1) == 0
         && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "isTracking") & 1) == 0)
  {
    v20 = *(_QWORD **)(a1 + 32);
    v21 = (void *)v20[60];
    objc_msgSend(v20, "_contentOffsetAtRest");
    objc_msgSend(v21, "setContentOffset:");
  }
  objc_msgSend(WeakRetained, "containerDidEndAnimatingHighlight:scale:", *(_QWORD *)(a1 + 32), 1.0);

}

- (CGRect)_frameForScrollView
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
  double v16;
  double v17;
  CGRect result;

  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForPageViewOfContainer:fullyPresented:", self, 1);
  -[SBFluidSwitcherItemContainer _frameForScrollViewWithFullPresentedSize:](self, "_frameForScrollViewWithFullPresentedSize:", v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_frameForPageView
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
  double v16;
  double v17;
  CGRect result;

  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForPageViewOfContainer:fullyPresented:", self, 1);
  -[SBFluidSwitcherItemContainer _frameForPageViewWithFullPresentedSize:](self, "_frameForPageViewWithFullPresentedSize:", v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)affordancePresenceController:(id)a3 didChangeToPresence:(int64_t)a4
{
  -[SBAppSwitcherPageView setResizeGrabbersVisible:](self->_pageView, "setResizeGrabbersVisible:", a4 == 0);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_draggable
    && (-[SBFluidSwitcherTouchPassThroughScrollView isDecelerating](self->_killScrollView, "isDecelerating") & 1) == 0)
  {
    -[SBFluidSwitcherItemContainer appLayout](self, "appLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemForLayoutRole:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    objc_msgSend(v12, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", *MEMORY[0x1E0DAB500], 3, &__block_literal_global_140);
    if (self->_supportsSwitcherDragAndDrop)
      v13 = 11;
    else
      v13 = 12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD68]), "initWithUniqueIdentifier:withLaunchActions:startLocation:", v11, 0, v13);
    objc_msgSend(v10, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDraggedSceneIdentifier:", v15);

    objc_msgSend(v14, "setSourceLocal:", 1);
    objc_msgSend(v14, "setLaunchURL:", 0);
    objc_msgSend(v14, "setUserActivity:", 0);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v12);
    objc_msgSend(v16, "sbh_setAppDragLocalContext:", v14);
    v18[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

uint64_t __73__SBFluidSwitcherItemContainer_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D50];
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBAppSwitcherPageView *pageView;
  double v17;
  SBAppPlatterDragPreview *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v33 = a4;
  -[UIView _sbWindowScene](self, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeScreenController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  if (v7)
  {
    objc_msgSend(v7, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "iconModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherItemContainer appLayout](self, "appLayout");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "itemForLayoutRole:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leafIconForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA620]), "initWithConfigurationOptions:", 6);
  objc_msgSend(v14, "setLocation:", *MEMORY[0x1E0DAA9E8]);
  objc_msgSend(v8, "listLayoutProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setListLayoutProvider:", v15);

  objc_msgSend(v14, "setDelegate:", v8);
  objc_msgSend(v14, "setIcon:", v13);
  objc_msgSend(v14, "setEnabled:", 0);
  pageView = self->_pageView;
  if (pageView)
  {
    -[SBAppSwitcherPageView transform](pageView, "transform");
    v17 = *(double *)&v36;
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v17 = 0.0;
  }
  v18 = -[SBAppPlatterDragPreview initWithReferenceIconView:sourceView:sourceViewScale:]([SBAppPlatterDragPreview alloc], "initWithReferenceIconView:sourceView:sourceViewScale:", v14, self->_pageView, v17 * self->_contentPageViewScale);
  -[SBAppPlatterDragPreview setMode:](v18, "setMode:", 2);
  -[SBFluidSwitcherItemContainer bounds](self, "bounds");
  -[SBAppPlatterDragPreview setAnchorPoint:](v18, "setAnchorPoint:", self->_highlightTapDownLocation.x / v19 + 0.0, self->_highlightTapDownLocation.y / v20 + 0.0);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __78__SBFluidSwitcherItemContainer_dragInteraction_previewForLiftingItem_session___block_invoke;
  v34[3] = &unk_1E8EACB70;
  v35 = v8;
  v21 = v8;
  -[SBAppPlatterDragPreview setCleanUpHandler:](v18, "setCleanUpHandler:", v34);
  objc_msgSend(v21, "iconDragManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addPlatterViewToMedusaDragOffscreenWindow:forWindowScene:", v18, v6);

  -[SBFluidSwitcherItemContainer bounds](self, "bounds");
  UIRectGetCenter();
  v24 = v23;
  v26 = v25;
  -[SBAppPlatterDragPreview window](v18, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherItemContainer convertPoint:toView:](self, "convertPoint:toView:", v27, v24, v26);
  -[SBAppPlatterDragPreview setCenter:](v18, "setCenter:");

  -[SBAppPlatterDragPreview setDragState:](v18, "setDragState:", 1);
  -[SBAppPlatterDragPreview setAlpha:](v18, "setAlpha:", 0.0);
  -[SBAppPlatterDragPreview layoutIfNeeded](v18, "layoutIfNeeded");
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA90]), "initWithView:", v18);
  objc_msgSend(v28, "set_springboardPlatterStyle:", 1);
  objc_msgSend(v33, "sbh_appDragLocalContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setPortaledPreview:", v18);
  return v28;
}

void __78__SBFluidSwitcherItemContainer_dragInteraction_previewForLiftingItem_session___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconDragManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePlatterViewFromMedusaDragOffscreenWindow:", v3);

}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  SBFluidSwitcherItemContainer *v6;
  SBFluidSwitcherItemContainer *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *returnKeyGestureRecognizer;
  id v11;

  v11 = a3;
  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextFocusedItem");
  v6 = (SBFluidSwitcherItemContainer *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    objc_msgSend(v5, "container:didBecomeFocused:", self, 1);
    v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__returnKeyPressed_);
    returnKeyGestureRecognizer = self->_returnKeyGestureRecognizer;
    self->_returnKeyGestureRecognizer = v9;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_returnKeyGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CE770);
    -[SBFluidSwitcherItemContainer addGestureRecognizer:](self, "addGestureRecognizer:", self->_returnKeyGestureRecognizer);
  }
  else
  {
    objc_msgSend(v11, "previouslyFocusedItem");
    v7 = (SBFluidSwitcherItemContainer *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      objc_msgSend(v5, "container:didBecomeFocused:", self, 0);
      -[SBFluidSwitcherItemContainer removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_returnKeyGestureRecognizer);
      v8 = self->_returnKeyGestureRecognizer;
      self->_returnKeyGestureRecognizer = 0;

    }
  }

}

- (id)focusEffect
{
  return 0;
}

- (void)_returnKeyPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SBFluidSwitcherItemContainer isFocusable](self, "isFocusable")
    && -[SBFluidSwitcherItemContainer isSelectable](self, "isSelectable"))
  {
    -[SBFluidSwitcherItemContainer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didSelectContainer:modifierFlags:", self, objc_msgSend(v5, "modifierFlags"));

  }
}

- (double)_CGPointXOrYBasedOnKillAxis:(CGPoint)a3
{
  if (!self->_killAxis)
    a3.x = a3.y;
  return a3.x;
}

- (double)_inverseScaleTransformFactor
{
  char IsZero;
  double result;
  double v5;

  -[SBFluidSwitcherItemContainer contentPageViewScale](self, "contentPageViewScale");
  IsZero = BSFloatIsZero();
  result = 1.0;
  if ((IsZero & 1) == 0)
  {
    -[SBFluidSwitcherItemContainer contentPageViewScale](self, "contentPageViewScale", 1.0);
    return 1.0 / v5;
  }
  return result;
}

- (id)_springLoadingEffectTargetView
{
  void *v3;
  void *v4;

  -[SBAppSwitcherPageView overlay](self->_pageView, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[SBAppSwitcherPageView overlay](self->_pageView, "overlay");
  else
    -[SBFluidSwitcherItemContainer contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_handlePageViewTap:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (-[SBFluidSwitcherItemContainer isSelectable](self, "isSelectable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didSelectContainer:modifierFlags:", self, objc_msgSend(v5, "modifierFlags"));

  }
}

- (void)_handleSelectionHighlightGesture:(id)a3
{
  void *v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") != 1)
  {
    if (objc_msgSend(v9, "state") != 3 && objc_msgSend(v9, "state") != 4)
    {
      if (objc_msgSend(v9, "state") == 2)
      {
        v5 = -[SBFluidSwitcherItemContainer isHighlightedFromDirectTouch](self, "isHighlightedFromDirectTouch");
        goto LABEL_9;
      }
      objc_msgSend(v9, "state");
    }
    v5 = 0;
    goto LABEL_9;
  }
  -[SBFluidSwitcherItemContainer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSelectContainer:numberOfTaps:", self, 1);

  objc_msgSend(v9, "locationInView:", self);
  self->_highlightTapDownLocation.x = v6;
  self->_highlightTapDownLocation.y = v7;
LABEL_9:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerSelectionStateChanged:toState:hover:pencilHover:", self, objc_msgSend(v9, "state"), 0, 0);

  -[SBFluidSwitcherItemContainer setHighlightedFromDirectTouch:](self, "setHighlightedFromDirectTouch:", v5);
}

- (void)setHighlightedFromDirectTouch:(BOOL)a3
{
  if (self->_highlightedFromDirectTouch != a3)
  {
    self->_highlightedFromDirectTouch = a3;
    -[SBFluidSwitcherItemContainer _updateTransformForCurrentHighlight](self, "_updateTransformForCurrentHighlight");
  }
}

- (void)setHighlightedFromCursorHover:(BOOL)a3
{
  if (self->_highlightedFromCursorHover != a3)
  {
    self->_highlightedFromCursorHover = a3;
    -[SBFluidSwitcherItemContainer _updateTransformForCurrentHighlight](self, "_updateTransformForCurrentHighlight");
  }
}

- (void)setLifted:(BOOL)a3
{
  if (self->_lifted != a3)
  {
    self->_lifted = a3;
    -[SBFluidSwitcherItemContainer _updateTransformForCurrentHighlight](self, "_updateTransformForCurrentHighlight");
  }
}

- (void)_updateTransformForCurrentHighlight
{
  CGFloat v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  CGAffineTransform v11;
  uint64_t v12;
  CGAffineTransform v13;

  v3 = 1.0;
  if (self->_suppressesHighlightEffect)
    goto LABEL_2;
  if (self->_highlightedFromCursorHover
    && self->_pointerInteractionEnabled
    && (-[SBFluidSwitcherTouchPassThroughScrollView isDragging](self->_killScrollView, "isDragging") & 1) == 0)
  {
    -[SBFluidSwitcherItemContainer _scaleForHighlightFromCursorHover](self, "_scaleForHighlightFromCursorHover");
    v3 = v6;
    v4 = 1;
  }
  else
  {
    if (!self->_highlightedFromDirectTouch && !self->_lifted)
    {
LABEL_2:
      v4 = 0;
      goto LABEL_10;
    }
    -[SBFluidSwitcherItemContainer _scaleForHighlightFromDirectTouch](self, "_scaleForHighlightFromDirectTouch");
    v3 = v5;
    v4 = 2;
  }
LABEL_10:
  if (v4 != -[SBAppSwitcherPageView highlightType](self->_pageView, "highlightType"))
  {
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, v3, v3);
    self->_animatingPageViewScale = 1;
    -[SBFluidSwitcherItemContainer _updatePageViewContentViewClipping](self, "_updatePageViewContentViewClipping");
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appSelectionSquishSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke;
    v10[3] = &unk_1E8EA4A48;
    v10[4] = self;
    *(CGFloat *)&v10[5] = v3;
    v11 = v13;
    v12 = v4;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke_2;
    v9[3] = &unk_1E8E9E5D8;
    v9[4] = self;
    *(CGFloat *)&v9[5] = v3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v8, 3, v10, v9);

  }
}

uint64_t __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __int128 v4;
  _OWORD v6[3];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(WeakRetained, "containerWillBeginAnimatingHighlight:scale:isTracking:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 705), *(double *)(a1 + 40));

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
  v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v3, "setTransform:", v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setHighlightType:", *(_QWORD *)(a1 + 96));
}

void __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(WeakRetained, "containerDidEndAnimatingHighlight:scale:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

  if ((a3 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 632) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_updatePageViewContentViewClipping");
  }
}

- (double)_scaleForHighlightFromDirectTouch
{
  double result;

  if (SBReduceMotion())
    return 1.0;
  if (-[SBFluidSwitcherItemContainer shadowStyle](self, "shadowStyle") == 2)
    -[SBMedusaSettings floatingAppCardScaleWhileTouched](self->_medusaSettings, "floatingAppCardScaleWhileTouched");
  else
    -[SBAppSwitcherSettings switcherCardScaleWhileTouched](self->_settings, "switcherCardScaleWhileTouched");
  return result;
}

- (double)_scaleForHighlightFromCursorHover
{
  double result;

  if (SBReduceMotion())
    return 1.0;
  if (-[SBFluidSwitcherItemContainer shadowStyle](self, "shadowStyle") == 2)
    -[SBMedusaSettings floatingAppCardScaleWhileCursorHovered](self->_medusaSettings, "floatingAppCardScaleWhileCursorHovered");
  else
    -[SBAppSwitcherSettings switcherCardScaleWhileCursorHovered](self->_settings, "switcherCardScaleWhileCursorHovered");
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  id WeakRetained;
  _BOOL4 v6;
  char v7;
  SBFailureNotifyingTapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  uint64_t v11;

  v4 = (UITapGestureRecognizer *)a3;
  if (-[SBAppSwitcherPageView blocksTouches](self->_pageView, "blocksTouches"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (-[UILongPressGestureRecognizer state](self->_pressDownGestureRecognizer, "state"))
      v6 = -[UILongPressGestureRecognizer state](self->_pressDownGestureRecognizer, "state") != 5;
    else
      v6 = 0;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (tapGestureRecognizer == (SBFailureNotifyingTapGestureRecognizer *)v4 && !v6)
    {
      v7 = 0;
      goto LABEL_21;
    }
    if (tapGestureRecognizer != (SBFailureNotifyingTapGestureRecognizer *)v4)
    {
      doubleTapGestureRecognizer = v4;
      if (self->_doubleTapGestureRecognizer == v4)
        goto LABEL_17;
      if ((UITapGestureRecognizer *)self->_pressDownGestureRecognizer != v4)
      {
        doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
        if ((UITapGestureRecognizer *)self->_selectionHighlightGestureRecognizer != v4)
        {
          v7 = 1;
LABEL_21:

          goto LABEL_22;
        }
LABEL_17:
        if (doubleTapGestureRecognizer == v4)
          v11 = 2;
        else
          v11 = 1;
        v7 = objc_msgSend(WeakRetained, "canSelectContainer:numberOfTaps:", self, v11);
        goto LABEL_21;
      }
    }
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    goto LABEL_17;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (void)gestureRecognizerTransitionedToFailed:(id)a3
{
  if (self->_tapGestureRecognizer == a3)
  {
    -[UILongPressGestureRecognizer setEnabled:](self->_selectionHighlightGestureRecognizer, "setEnabled:", 0);
    -[UILongPressGestureRecognizer setEnabled:](self->_selectionHighlightGestureRecognizer, "setEnabled:", 1);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  SBFluidSwitcherTouchPassThroughScrollView *v4;
  void *v5;
  id WeakRetained;
  SBFluidSwitcherTouchPassThroughScrollView *v7;

  v4 = (SBFluidSwitcherTouchPassThroughScrollView *)a3;
  if (self->_killScrollView == v4)
  {
    v7 = v4;
    -[SBFluidSwitcherTouchPassThroughScrollView window](v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[SBFluidSwitcherItemContainer killingProgress](self, "killingProgress");
      if (BSFloatGreaterThanOrEqualToFloat() && self->_killable && !self->_sentKillRequest)
      {
        self->_sentKillRequest = 1;
        -[SBFluidSwitcherItemContainer _notifyDelegateScrollViewDidChange](self, "_notifyDelegateScrollViewDidChange");
        objc_msgSend(WeakRetained, "killContainer:forReason:", self, 1);
      }
      else
      {
        -[SBFluidSwitcherItemContainer _notifyDelegateScrollViewDidChange](self, "_notifyDelegateScrollViewDidChange");
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "setLowLatency:", 0);
      -[SBFluidSwitcherItemContainer setHighlightedFromDirectTouch:](self, "setHighlightedFromDirectTouch:", -[SBFluidSwitcherTouchPassThroughScrollView isTracking](v7, "isTracking"));

      v4 = v7;
    }
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;

  if (self->_killScrollView == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "containerWillBeginSwipingToKill:", self);

    -[SBFluidSwitcherItemContainer setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherItemContainer layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v7;
  double v8;
  double x;
  double y;
  double v11;
  double v12;
  double v13;
  double v14;

  if (self->_killScrollView == a3)
  {
    objc_msgSend(a3, "contentOffset", a4.x, a4.y);
    if (!self->_killAxis)
      v7 = v8;
    if (v7 >= 62.0)
    {
      x = a5->x;
      y = a5->y;
    }
    else
    {
      -[SBFluidSwitcherItemContainer _contentOffsetAtRest](self, "_contentOffsetAtRest");
      a5->x = x;
      a5->y = y;
    }
    -[SBFluidSwitcherItemContainer _killingProgressForContentOffset:](self, "_killingProgressForContentOffset:", x, y);
    if (v11 >= 1.0)
    {
      v12 = a5->x;
      v13 = a5->y;
    }
    else
    {
      -[SBFluidSwitcherItemContainer _contentOffsetAtRest](self, "_contentOffsetAtRest");
      a5->x = v12;
      a5->y = v13;
    }
    -[SBFluidSwitcherItemContainer _killingProgressForContentOffset:](self, "_killingProgressForContentOffset:", v12, v13);
    self->_killProgressForCurrentDecelerationTarget = v14;
    -[SBFluidSwitcherItemContainer _notifyDelegateScrollViewDidChange](self, "_notifyDelegateScrollViewDidChange");
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (self->_killScrollView == a3)
    -[SBFluidSwitcherItemContainer _notifyDelegateScrollViewDidChange](self, "_notifyDelegateScrollViewDidChange");
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  if (self->_killScrollView == a3)
    -[SBFluidSwitcherItemContainer _notifyDelegateScrollViewDidChange](self, "_notifyDelegateScrollViewDidChange");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;

  if (self->_killScrollView == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "containerDidEndSwipingToKill:", self);

    -[SBFluidSwitcherItemContainer _notifyDelegateScrollViewDidChange](self, "_notifyDelegateScrollViewDidChange");
  }
}

- (void)_notifyDelegateScrollViewDidChange
{
  uint64_t v3;
  id WeakRetained;

  if (self->_sentKillRequest
    || !-[SBFluidSwitcherTouchPassThroughScrollView isDragging](self->_killScrollView, "isDragging"))
  {
    v3 = 0;
  }
  else
  {
    v3 = -[SBFluidSwitcherTouchPassThroughScrollView isDecelerating](self->_killScrollView, "isDecelerating") ^ 1;
  }
  -[SBFluidSwitcherItemContainer killingProgress](self, "killingProgress");
  -[SBFluidSwitcherItemContainer _contentOffsetForKillingProgress:](self, "_contentOffsetForKillingProgress:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[SBFluidSwitcherItemContainer killingProgress](self, "killingProgress");
  objc_msgSend(WeakRetained, "scrollViewKillingProgressUpdated:translation:isDragging:decelerationTargetProgress:forContainer:", v3, self);

}

- (BOOL)_scrollViewShouldPanGestureTryToBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  unint64_t killAxis;
  double v11;
  double v12;
  _BOOL4 v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  NSPoint v23;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "translationInView:", v4);
  v7 = v6;
  v9 = v8;

  killAxis = self->_killAxis;
  if (killAxis)
    v11 = v7;
  else
    v11 = v9;
  v13 = 0;
  if ((BSFloatIsZero() & 1) == 0)
  {
    v12 = killAxis ? v9 : v7;
    if (fabs(v12 / v11) <= 0.5)
      v13 = 1;
  }
  SBLogAppSwitcher();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v13)
      v15 = CFSTR("Allow");
    else
      v15 = CFSTR("Don't allow");
    v23.x = v7;
    v23.y = v9;
    NSStringFromPoint(v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ panning in scroll view [translation: %{public}@", (uint8_t *)&v18, 0x16u);

  }
  return v13;
}

- (void)_handleHoverGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_activeEventOfType:", 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "allTouches", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type") == 2)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v10 = objc_msgSend(v4, "state");
  if ((unint64_t)(v10 - 3) < 2)
  {
    v11 = 0;
LABEL_15:
    -[SBFluidSwitcherItemContainer setHighlightedFromCursorHover:](self, "setHighlightedFromCursorHover:", v11);
    goto LABEL_16;
  }
  if (v10 == 1)
  {
    v11 = 1;
    goto LABEL_15;
  }
LABEL_16:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerSelectionStateChanged:toState:hover:pencilHover:", self, objc_msgSend(v4, "state"), 1, v7);

}

- (id)initialCornerRadiusConfiguration
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithTopLeft:bottomLeft:bottomRight:topRight:", self->_contentCornerRadii.topLeft, self->_contentCornerRadii.bottomLeft, self->_contentCornerRadii.bottomRight, self->_contentCornerRadii.topRight);
}

- (SBDragPreviewShadowParameters)initialDiffuseShadowParameters
{
  void *v3;
  void *v4;
  void *v5;
  SBDragPreviewShadowParameters *result;

  -[SBAppSwitcherPageView _shadowView](self->_pageView, "_shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_diffuseShadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "shadowOpacity");
    objc_msgSend(v5, "shadowRadius");
    objc_msgSend(v5, "shadowOffset");
  }

  return result;
}

- (SBDragPreviewShadowParameters)initialRimShadowParameters
{
  void *v3;
  void *v4;
  void *v5;
  SBDragPreviewShadowParameters *result;

  -[SBAppSwitcherPageView _shadowView](self->_pageView, "_shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rimShadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "shadowOpacity");
    objc_msgSend(v5, "shadowRadius");
    objc_msgSend(v5, "shadowOffset");
  }

  return result;
}

- (id)initialDiffuseShadowFilters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBAppSwitcherPageView _shadowView](self->_pageView, "_shadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_diffuseShadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialRimShadowFilters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBAppSwitcherPageView _shadowView](self->_pageView, "_shadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rimShadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)containerViewForBlurContentView
{
  return -[SBAppSwitcherPageView _overlayClippingView](self->_pageView, "_overlayClippingView");
}

- (void)setDragging:(BOOL)a3
{
  if (self->_dragging != a3)
  {
    self->_dragging = a3;
    -[SBFluidSwitcherItemContainer _updateShadowVisibility](self, "_updateShadowVisibility");
  }
}

- (void)_updateForPointerHoveringOverEdge:(unint64_t)a3
{
  id WeakRetained;
  id v5;

  if (self->_hoveringOverEdge != a3)
  {
    self->_hoveringOverEdge = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = WeakRetained;
    if (self->_hoveringOverEdge)
      objc_msgSend(WeakRetained, "pointerBeganResizingItemContainer:", self);
    else
      objc_msgSend(WeakRetained, "pointerEndedResizingItemContainer:", self);

  }
}

- (void)appSwitcherPageView:(id)a3 pointerIsHoveringOverEdge:(unint64_t)a4
{
  -[SBFluidSwitcherItemContainer _updateForPointerHoveringOverEdge:](self, "_updateForPointerHoveringOverEdge:", a4);
}

- (BOOL)appSwitcherPageView:(id)a3 shouldBeginPointerInteractionAtLocation:(CGPoint)a4 window:(id)a5
{
  double y;
  double x;
  id v8;
  id WeakRetained;
  int v10;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(WeakRetained, "hitTestedToTopAffordance:window:ofItemContainer:", v8, self, x, y) & 1) != 0)
    LOBYTE(v10) = 0;
  else
    v10 = objc_msgSend(WeakRetained, "hitTestedToFloatingElement:window:ofItemContainer:", v8, self, x, y) ^ 1;

  return v10;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIRectCornerRadii)contentCornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->_contentCornerRadii.topLeft;
  bottomLeft = self->_contentCornerRadii.bottomLeft;
  bottomRight = self->_contentCornerRadii.bottomRight;
  topRight = self->_contentCornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (double)unobscuredMargin
{
  return self->_unobscuredMargin;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (CAMeshTransform)meshTransform
{
  return self->_meshTransform;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (CGSize)sizeForContainingSpace
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeForContainingSpace.width;
  height = self->_sizeForContainingSpace.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)clipsToUnobscuredMargin
{
  return self->_clipsToUnobscuredMargin;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (unint64_t)killAxis
{
  return self->_killAxis;
}

- (BOOL)isKillable
{
  return self->_killable;
}

- (BOOL)isRubberbandable
{
  return self->_rubberbandable;
}

- (BOOL)isFocusable
{
  return self->_focusable;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (BOOL)isEligibleForContentDragSpringLoading
{
  return self->_eligibleForContentDragSpringLoading;
}

- (BOOL)isLifted
{
  return self->_lifted;
}

- (BOOL)suppressesHighlightEffect
{
  return self->_suppressesHighlightEffect;
}

- (BOOL)supportsSwitcherDragAndDrop
{
  return self->_supportsSwitcherDragAndDrop;
}

- (double)minimumTranslationForKillingContainer
{
  return self->_minimumTranslationForKillingContainer;
}

- (BOOL)shouldScaleOverlayToFillBounds
{
  return self->_shouldScaleOverlayToFillBounds;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return self->_shouldUseWallpaperGradientTreatment;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributes
{
  double leadingAlpha;
  double trailingAlpha;
  SBSwitcherWallpaperGradientAttributes result;

  leadingAlpha = self->_wallpaperGradientAttributes.leadingAlpha;
  trailingAlpha = self->_wallpaperGradientAttributes.trailingAlpha;
  result.trailingAlpha = trailingAlpha;
  result.leadingAlpha = leadingAlpha;
  return result;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (CGPoint)pageViewAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_pageViewAnchorPoint.x;
  y = self->_pageViewAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)pageViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_pageViewOffset.x;
  y = self->_pageViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)isResizingAllowed
{
  return self->_resizingAllowed;
}

- (BOOL)isHighlightedFromDirectTouch
{
  return self->_highlightedFromDirectTouch;
}

- (BOOL)isHighlightedFromCursorHover
{
  return self->_highlightedFromCursorHover;
}

- (BOOL)isPointerInteractionEnabled
{
  return self->_pointerInteractionEnabled;
}

- (double)pointerInteractionHitTestPadding
{
  return self->_pointerInteractionHitTestPadding;
}

- (unint64_t)pointerIsHoveringOverEdge
{
  return self->_hoveringOverEdge;
}

- (void)setHoveringOverEdge:(unint64_t)a3
{
  self->_hoveringOverEdge = a3;
}

- (CGPoint)meshWarpCollapsedTargetPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_meshWarpCollapsedTargetPosition.x;
  y = self->_meshWarpCollapsedTargetPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMeshWarpCollapsedTargetPosition:(CGPoint)a3
{
  self->_meshWarpCollapsedTargetPosition = a3;
}

- (CGPoint)meshWarpExpandedSourcePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_meshWarpExpandedSourcePosition.x;
  y = self->_meshWarpExpandedSourcePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMeshWarpExpandedSourcePosition:(CGPoint)a3
{
  self->_meshWarpExpandedSourcePosition = a3;
}

- (BOOL)shouldApplyMeshWarp
{
  return self->_shouldApplyMeshWarp;
}

- (void)setShouldApplyMeshWarp:(BOOL)a3
{
  self->_shouldApplyMeshWarp = a3;
}

- (BOOL)isPreferredPointerLockStatusSuppressed
{
  return self->_preferredPointerLockStatusSuppressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affordancePresenceController, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_returnKeyGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_squishSettings, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionHighlightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pressDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_iconOverlayView, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_killScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
