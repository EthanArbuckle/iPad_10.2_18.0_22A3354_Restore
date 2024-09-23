@implementation SBAppSwitcherPageView

- (void)setNeedsWallpaperGradientTreatment:(BOOL)a3
{
  if (self->_needsWallpaperGradientTreatment != a3)
  {
    self->_needsWallpaperGradientTreatment = a3;
    -[SBAppSwitcherPageView _createOrDestroyWallpaperGradientView](self, "_createOrDestroyWallpaperGradientView");
  }
}

uint64_t __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutOverlayView");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layoutIfNeeded");
}

- (void)layoutSubviews
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  id WeakRetained;
  double v27;
  double v28;
  SBAppSwitcherPageContentView *view;
  uint64_t v30;
  double v31;
  SBAppResizeGrabberView *topLeftResizeGrabberPillView;
  SBAppResizeGrabberView *topRightResizeGrabberPillView;
  SBAppResizeGrabberView *bottomLeftResizeGrabberPillView;
  SBAppResizeGrabberView *bottomRightResizeGrabberPillView;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;

  -[SBAppSwitcherPageView _orderSubviews](self, "_orderSubviews");
  -[SBAppSwitcherPageView bounds](self, "bounds");
  v4 = v3;
  v39 = v6;
  v40 = v5;
  v38 = v7;
  -[SBAppSwitcherPageView _contentViewFrame](self, "_contentViewFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v37 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  if (!self->_shouldClipContentView)
  {
    SBRectWithSize();
    v9 = v19;
    v16 = v20;
    v17 = v21;
    v18 = v22;
  }
  -[UIView alpha](self->_hitTestBlocker, "alpha");
  v23 = SBFloatGreaterThanFloat();
  v24 = v16;
  v25 = v18;
  if (v23)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "currentStatusBarHeight");
    v36 = v4;
    v28 = v27;

    v24 = v16 + v28;
    v25 = v18 - v28;
    v4 = v36;
  }
  -[UIView setFrame:](self->_hitTestBlocker, "setFrame:", v9, v24, v17, v25);
  -[UIView setFrame:](self->_viewClippingView, "setFrame:", v9, v16, v17, v18);
  -[UIView setFrame:](self->_contentContainerView, "setFrame:", v4, v40, v39, v38);
  -[UIView setFrame:](self->_dimmingView, "setFrame:", v37, v11, v13, v15);
  -[UIView setFrame:](self->_tintView, "setFrame:", v37, v11, v13, v15);
  -[SBWallpaperEffectView setFrame:](self->_wallpaperOverlayView, "setFrame:", v37, v11, v13, v15);
  -[SBAppSwitcherWallpaperGradientView setFrame:](self->_wallpaperGradientView, "setFrame:", v37, v11, v13, v15);
  view = self->_view;
  v30 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  v31 = v13 - v39;
  if (v30 != 1)
    v31 = 0.0;
  -[SBAppSwitcherPageContentView setFrame:](view, "setFrame:", v31, 0.0, v39, v38);
  -[UIView setFrame:](self->_overlayClippingView, "setFrame:", v37, v11, v13, v15);
  -[SBAppSwitcherPageView _layoutOverlayView](self, "_layoutOverlayView");
  topLeftResizeGrabberPillView = self->_topLeftResizeGrabberPillView;
  if (topLeftResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](topLeftResizeGrabberPillView, "frameInContentRect:", v37, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_topLeftResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  topRightResizeGrabberPillView = self->_topRightResizeGrabberPillView;
  if (topRightResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](topRightResizeGrabberPillView, "frameInContentRect:", v37, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_topRightResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  bottomLeftResizeGrabberPillView = self->_bottomLeftResizeGrabberPillView;
  if (bottomLeftResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](bottomLeftResizeGrabberPillView, "frameInContentRect:", v37, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_bottomLeftResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  bottomRightResizeGrabberPillView = self->_bottomRightResizeGrabberPillView;
  if (bottomRightResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](bottomRightResizeGrabberPillView, "frameInContentRect:", v37, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_bottomRightResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  -[SBAppSwitcherPageShadowView setFrame:](self->_shadowView, "setFrame:", v4, v40, v39, v38);
}

- (void)_layoutOverlayView
{
  double width;
  double height;
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
  double v18;
  __int128 v19;
  double v20;
  double v21;
  UIView *overlayView;
  CGAffineTransform v23;
  CGAffineTransform v24;

  if (self->_shouldClipContentView)
  {
    width = self->_contentClippingFrame.size.width;
    height = self->_contentClippingFrame.size.height;
  }
  else
  {
    -[SBAppSwitcherPageView bounds](self, "bounds");
    width = v5;
    height = v6;
  }
  SBRectWithSize();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  UIRectGetCenter();
  v16 = v15;
  v18 = v17;
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v24.c = v19;
  *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (self->_shouldScaleOverlayToFillBounds)
  {
    -[UIView bounds](self->_overlayClippingView, "bounds");
    UIRectGetCenter();
    v16 = v20;
    v18 = v21;
    CGAffineTransformMakeScale(&v24, width / v12, height / v14);
  }
  -[UIView setBounds:](self->_overlayView, "setBounds:", v8, v10, v12, v14);
  -[UIView setCenter:](self->_overlayView, "setCenter:", v16, v18);
  overlayView = self->_overlayView;
  v23 = v24;
  -[UIView setTransform:](overlayView, "setTransform:", &v23);
}

- (CGRect)_contentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->_shouldClipContentView)
  {
    x = self->_contentClippingFrame.origin.x;
    y = self->_contentClippingFrame.origin.y;
    width = self->_contentClippingFrame.size.width;
    height = self->_contentClippingFrame.size.height;
  }
  else
  {
    -[SBAppSwitcherPageView bounds](self, "bounds");
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_orderSubviews
{
  UIView *contentContainerView;
  uint64_t v4;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  UIView *v14;
  uint64_t v15;
  UIView *v16;
  UIView *v17;
  UIView *v18;
  id v19;

  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_shadowView);
  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_contentContainerView);
  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_topLeftResizeGrabberPillView);
  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_topRightResizeGrabberPillView);
  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_bottomLeftResizeGrabberPillView);
  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_bottomRightResizeGrabberPillView);
  -[SBAppSwitcherPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_pointerHitTestBlocker);
  contentContainerView = self->_contentContainerView;
  v4 = objc_opt_class();
  v5 = contentContainerView;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[UIView contentViews](v7, "contentViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[UIView subviews](self->_contentContainerView, "subviews");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_overlayClippingView)
    objc_msgSend(v11, "addObject:");
  if (self->_viewClippingView)
    objc_msgSend(v12, "addObject:");
  if (self->_topLeftResizeGrabberPillView)
    objc_msgSend(v12, "addObject:");
  if (self->_topRightResizeGrabberPillView)
    objc_msgSend(v12, "addObject:");
  if (self->_bottomLeftResizeGrabberPillView)
    objc_msgSend(v12, "addObject:");
  if (self->_bottomRightResizeGrabberPillView)
    objc_msgSend(v12, "addObject:");
  if (self->_tintView)
    objc_msgSend(v12, "addObject:");
  if (self->_dimmingView)
    objc_msgSend(v12, "addObject:");
  if (self->_wallpaperOverlayView)
    objc_msgSend(v12, "addObject:");
  if (self->_wallpaperGradientView)
    objc_msgSend(v12, "addObject:");
  if (self->_hitTestBlocker)
    objc_msgSend(v12, "addObject:");
  if ((objc_msgSend(v19, "isEqual:", v12) & 1) == 0)
  {
    v13 = -[SBAppSwitcherPageView _supportsAsymmetricalCornerRadii](self, "_supportsAsymmetricalCornerRadii");
    v14 = self->_contentContainerView;
    if (v13)
    {
      v15 = objc_opt_class();
      v16 = v14;
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v18 = v17;

      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_overlayClippingView);
      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_viewClippingView);
      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_tintView);
      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_dimmingView);
      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_wallpaperOverlayView);
      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_wallpaperGradientView);
      -[UIView bringContentViewToFront:](v18, "bringContentViewToFront:", self->_hitTestBlocker);

    }
    else
    {
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_overlayClippingView);
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_viewClippingView);
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_tintView);
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_dimmingView);
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_wallpaperOverlayView);
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_wallpaperGradientView);
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:", self->_hitTestBlocker);
    }
  }

}

- (void)setContentClippingFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentClippingFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentClippingFrame = &self->_contentClippingFrame;
  if (!CGRectEqualToRect(self->_contentClippingFrame, a3))
  {
    p_contentClippingFrame->origin.x = x;
    p_contentClippingFrame->origin.y = y;
    p_contentClippingFrame->size.width = width;
    p_contentClippingFrame->size.height = height;
    -[SBAppSwitcherPageView setNeedsLayout](self, "setNeedsLayout");
    -[SBAppSwitcherPageView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setOverlayViewSize:(CGSize)a3
{
  if (self->_overlayViewSize.width != a3.width || self->_overlayViewSize.height != a3.height)
  {
    self->_overlayViewSize = a3;
    -[SBAppSwitcherPageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3
{
  void *v4;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[SBAppSwitcherPageView view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOrientation:", self->_orientation);

    -[SBAppSwitcherPageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFullyPresentedSize:(CGSize)a3
{
  if (self->_fullyPresentedSize.width != a3.width || self->_fullyPresentedSize.height != a3.height)
  {
    self->_fullyPresentedSize = a3;
    -[SBAppSwitcherPageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBAppSwitcherPageView view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", v3);

}

- (SBAppSwitcherPageShadowView)_shadowView
{
  return self->_shadowView;
}

- (SBAppSwitcherPageContentView)view
{
  return self->_view;
}

- (UIView)overlay
{
  return self->_overlayView;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBAppSwitcherPageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)setWallpaperOverlayAlpha:(double)a3
{
  if (self->_wallpaperOverlayAlpha != a3)
  {
    self->_wallpaperOverlayAlpha = a3;
    -[SBAppSwitcherPageView _updateWallpaperOverlayAlpha](self, "_updateWallpaperOverlayAlpha");
  }
}

- (void)setTintStyle:(int64_t)a3
{
  if (self->_tintStyle != a3)
  {
    self->_tintStyle = a3;
    -[SBAppSwitcherPageView _updateTintStyle](self, "_updateTintStyle");
  }
}

- (void)setShadowStyle:(int64_t)a3
{
  if (self->_shadowStyle != a3)
  {
    self->_shadowStyle = a3;
    -[SBAppSwitcherPageShadowView setStyle:](self->_shadowView, "setStyle:");
  }
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
  {
    self->_shadowOffset = a3;
    -[SBAppSwitcherPageShadowView setShadowOffset:](self->_shadowView, "setShadowOffset:");
  }
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    -[SBAppSwitcherPageShadowView setAlpha:](self->_shadowView, "setAlpha:");
  }
}

- (void)setResizingAllowed:(BOOL)a3
{
  if (self->_resizingAllowed != a3)
    self->_resizingAllowed = a3;
}

- (void)setOccludedInContinuousExposeStage:(BOOL)a3
{
  if (self->_occludedInContinuousExposeStage != a3)
    self->_occludedInContinuousExposeStage = a3;
}

- (void)setNeedsBackgroundWallpaperTreatment:(BOOL)a3
{
  if (self->_needsBackgroundWallpaperTreatment != a3)
  {
    self->_needsBackgroundWallpaperTreatment = a3;
    -[SBAppSwitcherPageView _createOrDestroyWallpaperOverlayView](self, "_createOrDestroyWallpaperOverlayView");
  }
}

- (void)setLighteningAlpha:(double)a3
{
  if (self->_lighteningAlpha != a3)
  {
    self->_lighteningAlpha = a3;
    -[SBAppSwitcherPageView _updateTintViewAlpha](self, "_updateTintViewAlpha");
  }
}

- (void)setDimmingAlpha:(double)a3
{
  if (self->_dimmingAlpha != a3)
  {
    self->_dimmingAlpha = a3;
    -[SBAppSwitcherPageView _updateDimmingViewAlpha](self, "_updateDimmingViewAlpha");
  }
}

- (void)setBlocksTouches:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIView layer](self->_hitTestBlocker, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsHitTesting:", v3);

  -[UIView setUserInteractionEnabled:](self->_hitTestBlocker, "setUserInteractionEnabled:", v3);
}

- (void)setAllowedTouchResizeCorners:(unint64_t)a3
{
  self->_allowedTouchResizeCorners = a3;
  -[SBAppSwitcherPageView _updateGrabberVisibilities](self, "_updateGrabberVisibilities");
}

- (void)_updateGrabberVisibilities
{
  unint64_t allowedTouchResizeCorners;
  SBAppResizeGrabberView *topLeftResizeGrabberPillView;
  double v5;
  double v6;
  double v7;
  SBAppResizeGrabberView *bottomRightResizeGrabberPillView;
  double v9;

  if (self->_resizeGrabbersVisible)
  {
    allowedTouchResizeCorners = self->_allowedTouchResizeCorners;
    topLeftResizeGrabberPillView = self->_topLeftResizeGrabberPillView;
    if ((allowedTouchResizeCorners & 1) != 0)
      v5 = 1.0;
    else
      v5 = 0.0;
    -[SBAppResizeGrabberView setAlpha:](topLeftResizeGrabberPillView, "setAlpha:", v5);
    if ((allowedTouchResizeCorners & 2) != 0)
      v6 = 1.0;
    else
      v6 = 0.0;
    -[SBAppResizeGrabberView setAlpha:](self->_topRightResizeGrabberPillView, "setAlpha:", v6);
    if ((allowedTouchResizeCorners & 4) != 0)
      v7 = 1.0;
    else
      v7 = 0.0;
    -[SBAppResizeGrabberView setAlpha:](self->_bottomLeftResizeGrabberPillView, "setAlpha:", v7);
    bottomRightResizeGrabberPillView = self->_bottomRightResizeGrabberPillView;
    if ((allowedTouchResizeCorners & 8) != 0)
      v9 = 1.0;
    else
      v9 = 0.0;
  }
  else
  {
    -[SBAppResizeGrabberView setAlpha:](self->_topLeftResizeGrabberPillView, "setAlpha:", 0.0);
    -[SBAppResizeGrabberView setAlpha:](self->_topRightResizeGrabberPillView, "setAlpha:", 0.0);
    -[SBAppResizeGrabberView setAlpha:](self->_bottomLeftResizeGrabberPillView, "setAlpha:", 0.0);
    bottomRightResizeGrabberPillView = self->_bottomRightResizeGrabberPillView;
    v9 = 0.0;
  }
  -[SBAppResizeGrabberView setAlpha:](bottomRightResizeGrabberPillView, "setAlpha:", v9);
}

- (void)setWallpaperGradientAttributes:(SBSwitcherWallpaperGradientAttributes)a3
{
  double trailingAlpha;
  double leadingAlpha;
  SBSwitcherWallpaperGradientAttributes *p_wallpaperGradientAttributes;

  trailingAlpha = a3.trailingAlpha;
  leadingAlpha = a3.leadingAlpha;
  p_wallpaperGradientAttributes = &self->_wallpaperGradientAttributes;
  if ((SBSwitcherWallpaperGradientAttributesEqual() & 1) == 0)
  {
    p_wallpaperGradientAttributes->leadingAlpha = leadingAlpha;
    p_wallpaperGradientAttributes->trailingAlpha = trailingAlpha;
    -[SBAppSwitcherPageView _updateWallpaperGradientAttributes](self, "_updateWallpaperGradientAttributes");
  }
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBAppSwitcherPageView view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisible:", v3);

}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  if (a3.topLeft != self->_cornerRadii.topLeft
    || a3.bottomLeft != self->_cornerRadii.bottomLeft
    || a3.bottomRight != self->_cornerRadii.bottomRight
    || a3.topRight != self->_cornerRadii.topRight)
  {
    self->_cornerRadii = a3;
    -[SBAppSwitcherPageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)_updateCornerRadius
{
  UIRectCornerRadii *p_cornerRadii;
  __int128 v4;
  __int128 v5;
  uint64_t i;
  void *v7;
  UIView *v8;
  uint64_t v9;
  UIView *v10;
  UIView *v11;
  UIView *contentContainerView;
  uint64_t v13;
  UIView *v14;
  UIView *v15;
  UIView *v16;
  UIView *v17;
  uint64_t v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  void *v22;
  void *v23;
  double v24;
  UIView *v25;
  UIView *v26;
  uint64_t v27;
  UIView *v28;
  UIView *v29;
  UIView *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t maskedCorners;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  _OWORD v46[2];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  p_cornerRadii = &self->_cornerRadii;
  v5 = *(_OWORD *)&self->_cornerRadii.topLeft;
  v4 = *(_OWORD *)&self->_cornerRadii.bottomRight;
  v46[0] = v5;
  v46[1] = v4;
  for (i = 8; i != 32; i += 8)
  {
    if (*(double *)&v5 < *(double *)((char *)v46 + i))
      *(_QWORD *)&v5 = *(_QWORD *)((char *)v46 + i);
  }
  v45 = *(double *)&v5;
  v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithTopLeft:bottomLeft:bottomRight:topRight:", self->_cornerRadii.topLeft, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight, self->_cornerRadii.topRight);
  if (-[SBAppSwitcherPageView _supportsAsymmetricalCornerRadii](self, "_supportsAsymmetricalCornerRadii")
    && (objc_msgSend(v44, "isCongruent") & 1) == 0)
  {
    contentContainerView = self->_contentContainerView;
    v13 = objc_opt_class();
    v14 = contentContainerView;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v25 = v15;

    -[UIView setCornerRadiusConfiguration:](v25, "setCornerRadiusConfiguration:", v44);
    v26 = self->_contentContainerView;
    v27 = objc_opt_class();
    v28 = v26;
    if (v27)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    -[UIView setMaskedCorners:](v30, "setMaskedCorners:", self->_maskedCorners);
    -[SBAppSwitcherPageView view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMaskedCorners:", 0);

    -[SBAppSwitcherPageView view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0.0;
    objc_msgSend(v23, "setCornerRadius:", 0.0);
  }
  else
  {
    if (-[SBAppSwitcherPageView _supportsAsymmetricalCornerRadii](self, "_supportsAsymmetricalCornerRadii"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", 0.0);
      v8 = self->_contentContainerView;
      v9 = objc_opt_class();
      v10 = v8;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v16 = v11;

      -[UIView setCornerRadiusConfiguration:](v16, "setCornerRadiusConfiguration:", v7);
      v17 = self->_contentContainerView;
      v18 = objc_opt_class();
      v19 = v17;
      if (v18)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
      }
      else
      {
        v20 = 0;
      }
      v21 = v20;

      -[UIView setMaskedCorners:](v21, "setMaskedCorners:", self->_maskedCorners);
    }
    else
    {
      -[UIView layer](self->_contentContainerView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMaskedCorners:", self->_maskedCorners);
    }

    -[SBAppSwitcherPageView view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMaskedCorners:", self->_maskedCorners);

    -[SBAppSwitcherPageView view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerRadius:", v45);
    v24 = v45;
  }

  -[UIView _setContinuousCornerRadius:](self->_dimmingView, "_setContinuousCornerRadius:", v24);
  -[SBWallpaperEffectView _setContinuousCornerRadius:](self->_wallpaperOverlayView, "_setContinuousCornerRadius:", v24);
  -[_UIBackdropView _setContinuousCornerRadius:](self->_wallpaperGradientView, "_setContinuousCornerRadius:", v24);
  -[UIView _setContinuousCornerRadius:](self->_tintView, "_setContinuousCornerRadius:", v24);
  -[UIView _setContinuousCornerRadius:](self->_overlayClippingView, "_setContinuousCornerRadius:", v24);
  -[SBAppSwitcherPageShadowView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", v45);
  -[SBAppSwitcherPageShadowView layer](self->_shadowView, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMaskedCorners:", self->_maskedCorners);

  -[UIView layer](self->_overlayClippingView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMaskedCorners:", self->_maskedCorners);

  if (self->_shouldClipContentView)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v34 = 10;
    else
      v34 = 5;
    -[UIView layer](self->_dimmingView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMaskedCorners:", v34);

    -[SBWallpaperEffectView layer](self->_wallpaperOverlayView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMaskedCorners:", v34);

    -[SBAppSwitcherWallpaperGradientView layer](self->_wallpaperGradientView, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMaskedCorners:", v34);

    -[UIView layer](self->_tintView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    maskedCorners = v34;
  }
  else
  {
    -[UIView layer](self->_dimmingView, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setMaskedCorners:", self->_maskedCorners);

    -[SBWallpaperEffectView layer](self->_wallpaperOverlayView, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setMaskedCorners:", self->_maskedCorners);

    -[SBAppSwitcherWallpaperGradientView layer](self->_wallpaperGradientView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setMaskedCorners:", self->_maskedCorners);

    -[UIView layer](self->_tintView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    maskedCorners = self->_maskedCorners;
  }
  objc_msgSend(v38, "setMaskedCorners:", maskedCorners);

  -[SBAppResizeGrabberView setCornerRadius:](self->_topLeftResizeGrabberPillView, "setCornerRadius:", p_cornerRadii->topLeft);
  -[SBAppResizeGrabberView setCornerRadius:](self->_topRightResizeGrabberPillView, "setCornerRadius:", p_cornerRadii->topRight);
  -[SBAppResizeGrabberView setCornerRadius:](self->_bottomLeftResizeGrabberPillView, "setCornerRadius:", p_cornerRadii->bottomLeft);
  -[SBAppResizeGrabberView setCornerRadius:](self->_bottomRightResizeGrabberPillView, "setCornerRadius:", p_cornerRadii->bottomRight);

}

- (BOOL)_supportsAsymmetricalCornerRadii
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() == 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v2;
}

uint64_t __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  double v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = 0.0;
  if (!v2[60])
    v3 = 1.0;
  objc_msgSend(v2, "setContentAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "bs_setHitTestingDisabled:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) != 0);
}

- (void)setContentAlpha:(double)a3
{
  -[SBAppSwitcherPageContentView setAlpha:](self->_view, "setAlpha:", a3);
}

void *__45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *result;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 0);

  result = *(void **)(a1 + 40);
  if (result)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(void **)(v4 + 480) != result)
    {
      result = (void *)objc_msgSend(result, "isDescendantOfView:", *(_QWORD *)(v4 + 472));
      if ((_DWORD)result)
        return (void *)objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    }
  }
  return result;
}

- (void)setOverlay:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView **p_overlayView;
  UIView *overlayView;
  __int128 v10;
  UIView *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  UIView *v16;
  _QWORD v17[5];
  UIView *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _OWORD v21[3];

  v4 = a4;
  v7 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v7)
  {
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v21[0] = *MEMORY[0x1E0C9BAA8];
    v21[1] = v10;
    v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](overlayView, "setTransform:", v21);
    v11 = *p_overlayView;
    objc_storeStrong((id *)&self->_overlayView, a3);
    v12 = MEMORY[0x1E0C809B0];
    if (*p_overlayView)
    {
      -[UIView addSubview:](self->_overlayClippingView, "addSubview:");
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke;
      v20[3] = &unk_1E8E9DED8;
      v20[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v20);
    }
    v13 = 0.0;
    if (v4)
    {
      -[SBAppSwitcherPageContentView layer](self->_view, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowsGroupOpacity:", -[SBAppSwitcherPageContentView contentRequiresGroupOpacity](self->_view, "contentRequiresGroupOpacity"));

      v13 = 0.35;
    }
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v18 = v11;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_2;
    v19[3] = &unk_1E8E9DED8;
    v19[4] = self;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_3;
    v17[3] = &unk_1E8E9DEB0;
    v17[4] = self;
    v16 = v11;
    objc_msgSend(v15, "animateWithDuration:animations:completion:", v19, v17, v13);

  }
}

- (SBAppSwitcherPageView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  SBAppSwitcherPageView *v5;
  uint64_t v6;
  SBAppSwitcherSettings *settings;
  void *v8;
  _BOOL4 v9;
  CGPoint *v10;
  SBAsymmetricalCornerRadiusWrapperView *v11;
  UIView *contentContainerView;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  UIView *hitTestBlocker;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *v21;
  UIView *dimmingView;
  UIView *v23;
  void *v24;
  void *v25;
  UIView *v26;
  UIView *tintView;
  UIView *v28;
  void *v29;
  void *v30;
  CGSize v31;
  UIView *v32;
  UIView *viewClippingView;
  SBHitTestExtendedView *v34;
  UIView *overlayClippingView;
  SBAppResizeGrabberView *v36;
  SBAppResizeGrabberView *topLeftResizeGrabberPillView;
  SBAppResizeGrabberView *v38;
  SBAppResizeGrabberView *topRightResizeGrabberPillView;
  SBAppResizeGrabberView *v40;
  SBAppResizeGrabberView *bottomLeftResizeGrabberPillView;
  SBAppResizeGrabberView *v42;
  SBAppResizeGrabberView *bottomRightResizeGrabberPillView;
  UIView *v44;
  UIView *pointerHitTestBlocker;
  UIView *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v51;

  height = a3.size.height;
  width = a3.size.width;
  v51.receiver = self;
  v51.super_class = (Class)SBAppSwitcherPageView;
  v5 = -[SBHitTestExtendedView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (SBAppSwitcherSettings *)v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherPageView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[SBHitTestExtendedView setHitTestsSubviewsOutsideBounds:](v5, "setHitTestsSubviewsOutsideBounds:", 0);
    v9 = -[SBAppSwitcherPageView _supportsAsymmetricalCornerRadii](v5, "_supportsAsymmetricalCornerRadii");
    v10 = (CGPoint *)MEMORY[0x1E0C9D648];
    if (v9)
    {
      v11 = -[SBAsymmetricalCornerRadiusWrapperView initWithFrame:]([SBAsymmetricalCornerRadiusWrapperView alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      contentContainerView = v5->_contentContainerView;
      v5->_contentContainerView = &v11->super.super;

      -[UIView setClipsToBounds:](v5->_contentContainerView, "setClipsToBounds:", 1);
    }
    else
    {
      v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v14 = v5->_contentContainerView;
      v5->_contentContainerView = v13;

    }
    -[SBAppSwitcherPageView addSubview:](v5, "addSubview:", v5->_contentContainerView);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    hitTestBlocker = v5->_hitTestBlocker;
    v5->_hitTestBlocker = v15;

    v17 = v5->_hitTestBlocker;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UIView layer](v5->_hitTestBlocker, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHitTestsAsOpaque:", 1);

    -[UIView layer](v5->_hitTestBlocker, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsHitTesting:", 1);

    -[SBAppSwitcherPageView _addContentView:](v5, "_addContentView:", v5->_hitTestBlocker);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    dimmingView = v5->_dimmingView;
    v5->_dimmingView = v21;

    v23 = v5->_dimmingView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[UIView setClipsToBounds:](v5->_dimmingView, "setClipsToBounds:", 1);
    -[UIView layer](v5->_dimmingView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsHitTesting:", 0);

    -[SBAppSwitcherPageView _addContentView:](v5, "_addContentView:", v5->_dimmingView);
    v26 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    tintView = v5->_tintView;
    v5->_tintView = v26;

    v28 = v5->_tintView;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[UIView layer](v5->_tintView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAllowsHitTesting:", 0);

    -[UIView setClipsToBounds:](v5->_tintView, "setClipsToBounds:", 1);
    v5->_tintStyle = 0;
    -[SBAppSwitcherPageView _updateTintStyle](v5, "_updateTintStyle");
    -[SBAppSwitcherPageView _addContentView:](v5, "_addContentView:", v5->_tintView);
    v31 = (CGSize)v10[1];
    v5->_contentClippingFrame.origin = *v10;
    v5->_contentClippingFrame.size = v31;
    v5->_overlayViewSize.width = width;
    v5->_overlayViewSize.height = height;
    v32 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    viewClippingView = v5->_viewClippingView;
    v5->_viewClippingView = v32;

    -[UIView setClipsToBounds:](v5->_viewClippingView, "setClipsToBounds:", 1);
    -[SBAppSwitcherPageView _addContentView:](v5, "_addContentView:", v5->_viewClippingView);
    v34 = objc_alloc_init(SBHitTestExtendedView);
    overlayClippingView = v5->_overlayClippingView;
    v5->_overlayClippingView = &v34->super;

    -[UIView setClipsToBounds:](v5->_overlayClippingView, "setClipsToBounds:", 1);
    -[SBAppSwitcherPageView _addContentView:](v5, "_addContentView:", v5->_overlayClippingView);
    -[SBAppSwitcherPageView _updateShadowPresence](v5, "_updateShadowPresence");
    -[SBAppSwitcherPageView setShadowStyle:](v5, "setShadowStyle:", 1);
    -[SBAppSwitcherPageView setShadowAlpha:](v5, "setShadowAlpha:", 1.0);
    -[SBAppSwitcherPageView _updateEffectOverlayViews](v5, "_updateEffectOverlayViews");
    -[SBAppSwitcherPageView _updateCornerRadius](v5, "_updateCornerRadius");
    -[SBAppSwitcherPageView setResizeGrabbersVisible:](v5, "setResizeGrabbersVisible:", 1);
    if (SBFIsChamoisWindowingUIAvailable())
    {
      v36 = -[SBAppResizeGrabberView initWithCorner:]([SBAppResizeGrabberView alloc], "initWithCorner:", 0);
      topLeftResizeGrabberPillView = v5->_topLeftResizeGrabberPillView;
      v5->_topLeftResizeGrabberPillView = v36;

      -[SBAppSwitcherPageView addSubview:](v5, "addSubview:", v5->_topLeftResizeGrabberPillView);
      v38 = -[SBAppResizeGrabberView initWithCorner:]([SBAppResizeGrabberView alloc], "initWithCorner:", 1);
      topRightResizeGrabberPillView = v5->_topRightResizeGrabberPillView;
      v5->_topRightResizeGrabberPillView = v38;

      -[SBAppSwitcherPageView addSubview:](v5, "addSubview:", v5->_topRightResizeGrabberPillView);
      v40 = -[SBAppResizeGrabberView initWithCorner:]([SBAppResizeGrabberView alloc], "initWithCorner:", 2);
      bottomLeftResizeGrabberPillView = v5->_bottomLeftResizeGrabberPillView;
      v5->_bottomLeftResizeGrabberPillView = v40;

      -[SBAppSwitcherPageView addSubview:](v5, "addSubview:", v5->_bottomLeftResizeGrabberPillView);
      v42 = -[SBAppResizeGrabberView initWithCorner:]([SBAppResizeGrabberView alloc], "initWithCorner:", 3);
      bottomRightResizeGrabberPillView = v5->_bottomRightResizeGrabberPillView;
      v5->_bottomRightResizeGrabberPillView = v42;

      -[SBAppSwitcherPageView addSubview:](v5, "addSubview:", v5->_bottomRightResizeGrabberPillView);
      v44 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      pointerHitTestBlocker = v5->_pointerHitTestBlocker;
      v5->_pointerHitTestBlocker = v44;

      v46 = v5->_pointerHitTestBlocker;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v46, "setBackgroundColor:", v47);

      -[UIView layer](v5->_pointerHitTestBlocker, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setHitTestsAsOpaque:", 1);

      -[UIView layer](v5->_pointerHitTestBlocker, "layer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setAllowsHitTesting:", 1);

      -[SBAppSwitcherPageView addSubview:](v5, "addSubview:", v5->_pointerHitTestBlocker);
    }
    -[PTSettings addKeyObserver:](v5->_settings, "addKeyObserver:", v5);
  }
  return v5;
}

- (void)_addContentView:(id)a3
{
  _BOOL4 v4;
  UIView *contentContainerView;
  uint64_t v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  id v10;

  v10 = a3;
  v4 = -[SBAppSwitcherPageView _supportsAsymmetricalCornerRadii](self, "_supportsAsymmetricalCornerRadii");
  contentContainerView = self->_contentContainerView;
  if (v4)
  {
    v6 = objc_opt_class();
    v7 = contentContainerView;
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

    -[UIView addContentView:](v9, "addContentView:", v10);
  }
  else
  {
    -[UIView addSubview:](contentContainerView, "addSubview:", v10);
  }

}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (SBFIsChamoisWindowingUIAvailable())
  {
    -[UIView _sbWindowScene](self, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemPointerInteractionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemPointerInteractionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v7)
    {
      objc_msgSend(v5, "unregisterView:", self);
      objc_msgSend(v7, "registerView:delegate:", self, self);
      objc_storeWeak((id *)&self->_systemPointerInteractionManager, v7);
    }

  }
}

- (void)setView:(id)a3 animated:(BOOL)a4
{
  SBAppSwitcherPageContentView *v7;
  SBAppSwitcherPageContentView *v8;
  SBAppSwitcherPageContentView *view;
  SBAppSwitcherPageContentView *v10;
  uint64_t v11;
  void *v12;
  SBAppSwitcherPageContentView *v13;
  void *v14;
  _QWORD v15[4];
  SBAppSwitcherPageContentView *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  SBAppSwitcherPageContentView *v20;

  v7 = (SBAppSwitcherPageContentView *)a3;
  v8 = v7;
  view = self->_view;
  if (view != v7)
  {
    if (a4)
    {
      v10 = view;
      objc_storeStrong((id *)&self->_view, a3);
      v11 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke_2;
      v18[3] = &unk_1E8E9DED8;
      v18[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v18);
      v12 = (void *)MEMORY[0x1E0CEABB0];
      v16 = v10;
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke_3;
      v17[3] = &unk_1E8E9DED8;
      v17[4] = self;
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke_4;
      v15[3] = &unk_1E8E9E980;
      v13 = v10;
      objc_msgSend(v12, "animateWithDuration:animations:completion:", v17, v15, 0.35);

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CEABB0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke;
      v19[3] = &unk_1E8E9E820;
      v19[4] = self;
      v20 = v7;
      objc_msgSend(v14, "performWithoutAnimation:", v19);

    }
  }

}

void __42__SBAppSwitcherPageView_setView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "removeFromSuperview");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 464), *(id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 464))
  {
    objc_msgSend(*(id *)(v4 + 456), "addSubview:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
    objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadius");
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
}

uint64_t __42__SBAppSwitcherPageView_setView_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadius");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __42__SBAppSwitcherPageView_setView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

uint64_t __42__SBAppSwitcherPageView_setView_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

- (void)_updateTintStyle
{
  UIView **p_tintView;
  UIView *tintView;
  void *v5;
  double v6;
  UIView *v7;
  void *v8;
  id v9;

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  switch(self->_tintStyle)
  {
    case 0:
    case 3:
      p_tintView = &self->_tintView;
      tintView = self->_tintView;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](tintView, "setBackgroundColor:", v5);
      v6 = 0.0;
      goto LABEL_7;
    case 1:
      p_tintView = &self->_tintView;
      v7 = self->_tintView;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tintStyleDimmingAlphaInFocusForLightMode");
      goto LABEL_6;
    case 2:
      p_tintView = &self->_tintView;
      v7 = self->_tintView;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tintStyleDimmingAlphaInFocusForDarkMode");
      goto LABEL_6;
    case 4:
      p_tintView = &self->_tintView;
      v7 = self->_tintView;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tintStyleDimmingAlphaUnFocusForDarkMode");
LABEL_6:
      objc_msgSend(v5, "colorWithAlphaComponent:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      v6 = 1.0;
LABEL_7:

      -[UIView setAlpha:](*p_tintView, "setAlpha:", v6);
      break;
    default:
      break;
  }

}

- (void)setView:(id)a3
{
  -[SBAppSwitcherPageView setView:animated:](self, "setView:animated:", a3, 0);
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[SBAppSwitcherPageView view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (BOOL)isVisible
{
  void *v2;
  char v3;

  -[SBAppSwitcherPageView view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  return v3;
}

- (BOOL)isOccludedInContinuousExposeStage
{
  return self->_occludedInContinuousExposeStage;
}

- (void)setResizeGrabbersVisible:(BOOL)a3
{
  self->_resizeGrabbersVisible = a3;
  -[SBAppSwitcherPageView _updateGrabberVisibilities](self, "_updateGrabberVisibilities");
}

- (BOOL)isResizingAllowed
{
  return self->_resizingAllowed;
}

- (BOOL)blocksTouches
{
  void *v3;
  BOOL v4;

  -[UIView layer](self->_hitTestBlocker, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hitTestsAsOpaque"))
    v4 = -[UIView isUserInteractionEnabled](self->_hitTestBlocker, "isUserInteractionEnabled");
  else
    v4 = 0;

  return v4;
}

- (void)setOverlay:(id)a3
{
  -[SBAppSwitcherPageView setOverlay:animated:](self, "setOverlay:animated:", a3, 0);
}

- (void)setOverlayAlpha:(double)a3
{
  -[UIView setAlpha:](self->_overlayView, "setAlpha:", a3);
}

- (double)overlayAlpha
{
  double result;

  -[UIView alpha](self->_overlayView, "alpha");
  return result;
}

- (double)contentAlpha
{
  double result;

  -[SBAppSwitcherPageContentView alpha](self->_view, "alpha");
  return result;
}

- (void)setHighlightType:(unint64_t)a3
{
  if (self->_highlightType != a3)
  {
    self->_highlightType = a3;
    -[SBAppSwitcherPageShadowView setHighlightType:](self->_shadowView, "setHighlightType:");
  }
}

- (void)setShouldClipContentView:(BOOL)a3
{
  if (self->_shouldClipContentView != a3)
  {
    self->_shouldClipContentView = a3;
    -[SBAppSwitcherPageView _updateCornerRadius](self, "_updateCornerRadius");
    -[SBAppSwitcherPageView setNeedsLayout](self, "setNeedsLayout");
    -[SBAppSwitcherPageView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setSwitcherCardScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_switcherCardScale = a3;
    -[SBAppSwitcherPageShadowView setSwitcherCardScale:](self->_shadowView, "setSwitcherCardScale:", a3);
  }
}

- (void)setShouldScaleOverlayToFillBounds:(BOOL)a3
{
  if (self->_shouldScaleOverlayToFillBounds != a3)
  {
    self->_shouldScaleOverlayToFillBounds = a3;
    -[SBAppSwitcherPageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)invalidate
{
  void *v3;
  id WeakRetained;

  -[SBAppSwitcherPageView view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBAppSwitcherPageView setView:](self, "setView:", 0);
  -[SBAppSwitcherPageView pointerWillExitRegion](self, "pointerWillExitRegion");
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  objc_msgSend(WeakRetained, "unregisterView:", self);

  objc_storeWeak((id *)&self->_systemPointerInteractionManager, 0);
}

- (void)_updateDimmingViewAlpha
{
  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", self->_dimmingAlpha);
}

- (void)_updateTintViewAlpha
{
  -[UIView setAlpha:](self->_tintView, "setAlpha:", self->_lighteningAlpha);
}

- (void)_updateWallpaperOverlayAlpha
{
  -[SBWallpaperEffectView setAlpha:](self->_wallpaperOverlayView, "setAlpha:", self->_wallpaperOverlayAlpha);
}

- (void)_updateWallpaperGradientAttributes
{
  char IsZero;
  double v4;

  -[SBAppSwitcherWallpaperGradientView setAttributes:](self->_wallpaperGradientView, "setAttributes:", self->_wallpaperGradientAttributes.leadingAlpha, self->_wallpaperGradientAttributes.trailingAlpha);
  if (!BSFloatIsZero() || (IsZero = BSFloatIsZero(), v4 = 0.0, (IsZero & 1) == 0))
    v4 = 1.0;
  -[SBAppSwitcherWallpaperGradientView setAlpha:](self->_wallpaperGradientView, "setAlpha:", v4);
}

- (void)_updateShadowPresence
{
  BOOL v3;
  SBAppSwitcherPageShadowView *shadowView;
  SBAppSwitcherPageShadowView *v5;
  SBAppSwitcherPageShadowView *v6;
  SBAppSwitcherPageShadowView *v7;
  SBAppSwitcherPageShadowView *v8;

  v3 = -[SBAppSwitcherSettings shouldSimplifyForOptions:](self->_settings, "shouldSimplifyForOptions:", 32);
  shadowView = self->_shadowView;
  if (v3)
  {
    if (shadowView)
    {
      -[SBAppSwitcherPageShadowView removeFromSuperview](shadowView, "removeFromSuperview");
      v5 = self->_shadowView;
      self->_shadowView = 0;

    }
  }
  else if (!shadowView)
  {
    v6 = [SBAppSwitcherPageShadowView alloc];
    -[SBAppSwitcherPageView bounds](self, "bounds");
    v7 = -[SBAppSwitcherPageShadowView initWithFrame:style:](v6, "initWithFrame:style:", self->_shadowStyle);
    v8 = self->_shadowView;
    self->_shadowView = v7;

    -[SBAppSwitcherPageView addSubview:](self, "addSubview:", self->_shadowView);
  }
}

- (void)_updateEffectOverlayViews
{
  -[SBAppSwitcherPageView _updateDimmingViewAlpha](self, "_updateDimmingViewAlpha");
  -[SBAppSwitcherPageView _updateTintViewAlpha](self, "_updateTintViewAlpha");
  -[SBAppSwitcherPageView _updateWallpaperOverlayAlpha](self, "_updateWallpaperOverlayAlpha");
  -[SBAppSwitcherPageView _updateWallpaperGradientAttributes](self, "_updateWallpaperGradientAttributes");
}

- (void)_createOrDestroyWallpaperOverlayView
{
  SBWallpaperEffectView *wallpaperOverlayView;
  SBWallpaperEffectView *v4;
  _QWORD v5[5];

  if (!self->_needsBackgroundWallpaperTreatment
    || !self->_wallpaperOverlayView
    && (v5[0] = MEMORY[0x1E0C809B0],
        v5[1] = 3221225472,
        v5[2] = __61__SBAppSwitcherPageView__createOrDestroyWallpaperOverlayView__block_invoke,
        v5[3] = &unk_1E8E9DED8,
        v5[4] = self,
        objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v5),
        !self->_needsBackgroundWallpaperTreatment))
  {
    wallpaperOverlayView = self->_wallpaperOverlayView;
    if (wallpaperOverlayView)
    {
      -[SBWallpaperEffectView removeFromSuperview](wallpaperOverlayView, "removeFromSuperview");
      v4 = self->_wallpaperOverlayView;
      self->_wallpaperOverlayView = 0;

    }
  }
}

uint64_t __61__SBAppSwitcherPageView__createOrDestroyWallpaperOverlayView__block_invoke(uint64_t a1)
{
  SBWallpaperEffectView *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v2 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 440);
  *(_QWORD *)(v3 + 440) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[55];
  objc_msgSend(v5, "_contentViewFrame");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setStyle:", 14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsHitTesting:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setClipsToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_addContentView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperOverlayAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadius");
}

- (void)_createOrDestroyWallpaperGradientView
{
  _BOOL4 needsWallpaperGradientTreatment;
  SBAppSwitcherWallpaperGradientView *wallpaperGradientView;
  SBAppSwitcherWallpaperGradientView *v5;
  _QWORD v6[5];

  needsWallpaperGradientTreatment = self->_needsWallpaperGradientTreatment;
  wallpaperGradientView = self->_wallpaperGradientView;
  if (needsWallpaperGradientTreatment)
  {
    if (!wallpaperGradientView)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__SBAppSwitcherPageView__createOrDestroyWallpaperGradientView__block_invoke;
      v6[3] = &unk_1E8E9DED8;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v6);
    }
  }
  else if (wallpaperGradientView)
  {
    -[SBAppSwitcherWallpaperGradientView removeFromSuperview](wallpaperGradientView, "removeFromSuperview");
    v5 = self->_wallpaperGradientView;
    self->_wallpaperGradientView = 0;

  }
}

void __62__SBAppSwitcherPageView__createOrDestroyWallpaperGradientView__block_invoke(uint64_t a1)
{
  SBAppSwitcherWallpaperGradientView *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = -[SBAppSwitcherWallpaperGradientView initWithPrivateStyle:]([SBAppSwitcherWallpaperGradientView alloc], "initWithPrivateStyle:", -2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 576);
  *(_QWORD *)(v3 + 576) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "inputSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScale:", 0.1);
  objc_msgSend(v5, "setBlurRadius:", 50.0);
  objc_msgSend(v5, "setBackdropVisible:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "bs_setHitTestingDisabled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setGroupName:", CFSTR("AppSwitcherWallpaperGradient"));
  objc_msgSend(*(id *)(a1 + 32), "_addContentView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperGradientAttributes");
  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadius");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppSwitcherPageView;
  v4 = a3;
  -[SBAppSwitcherPageView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[SBAppSwitcherPageView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[SBAppSwitcherPageView _updateEffectOverlayViews](self, "_updateEffectOverlayViews");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  _QWORD block[5];

  if (self->_settings == a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SBAppSwitcherPageView_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __53__SBAppSwitcherPageView_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateShadowPresence");
  return objc_msgSend(*(id *)(a1 + 32), "_updateEffectOverlayViews");
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  double y;
  double x;
  id WeakRetained;
  CGPoint v9;
  CGSize v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
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
  _BOOL4 v29;
  CGSize v30;
  BOOL v31;
  CGSize v33;
  CGPoint v34;
  CGPoint v35;
  CGSize v36;
  unint64_t v37;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v37 = 0;
  v9 = (CGPoint)*MEMORY[0x1E0C9D648];
  v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v35 = (CGPoint)*MEMORY[0x1E0C9D648];
  v36 = v10;
  if (!self->_resizingAllowed)
    goto LABEL_6;
  if (self->_occludedInContinuousExposeStage)
    goto LABEL_6;
  v33 = v10;
  v34 = v9;
  -[SBAppSwitcherPageView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  v13 = v12;
  v15 = v14;

  -[SBAppSwitcherPageView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(WeakRetained, "appSwitcherPageView:shouldBeginPointerInteractionAtLocation:window:", self, v16, v13, v15);

  v10 = v33;
  v9 = v34;
  if (!v17)
    goto LABEL_6;
  -[SBAppSwitcherPageView _contentViewFrame](self, "_contentViewFrame", v34.x, v33.width);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[SBAppSwitcherSettings liveResizePointerInteractionRegionInnerLength](self->_settings, "liveResizePointerInteractionRegionInnerLength");
  v27 = v26;
  -[SBAppSwitcherSettings liveResizePointerInteractionRegionOuterLength](self->_settings, "liveResizePointerInteractionRegionOuterLength");
  v29 = +[SBEdgeResizeSystemPointerInteractionHelper shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:](SBEdgeResizeSystemPointerInteractionHelper, "shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:", -[SBAppSwitcherPageView allowedTouchResizeCorners](self, "allowedTouchResizeCorners"), &v37, &v35, x, y, v19, v21, v23, v25, v27, v28, 0x4039000000000000);
  v10 = v33;
  v9 = v34;
  if (v29)
  {
    self->_hoveringOverEdge = v37;
    v30 = v36;
    self->_pointerRegion.origin = v35;
    self->_pointerRegion.size = v30;
    v31 = 1;
  }
  else
  {
LABEL_6:
    v31 = 0;
    self->_hoveringOverEdge = 0;
    self->_pointerRegion.origin = v9;
    self->_pointerRegion.size = v10;
  }
  objc_msgSend(WeakRetained, "appSwitcherPageView:pointerIsHoveringOverEdge:", self, self->_hoveringOverEdge);

  return v31;
}

- (void)pointerWillExitRegion
{
  uint64_t v3;
  CGSize v4;
  id WeakRetained;

  v3 = MEMORY[0x1E0C9D648];
  -[UIView setFrame:](self->_pointerHitTestBlocker, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = *(CGSize *)(v3 + 16);
  self->_pointerRegion.origin = *(CGPoint *)v3;
  self->_pointerRegion.size = v4;
  self->_hoveringOverEdge = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appSwitcherPageView:pointerIsHoveringOverEdge:", self, self->_hoveringOverEdge);

}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  UIEdgeInsetsMakeWithEdges();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4
{
  void *v5;
  CGRect *p_pointerRegion;
  objc_class *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CEA870];
  p_pointerRegion = &self->_pointerRegion;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionWithRect:identifier:", v8, p_pointerRegion->origin.x, p_pointerRegion->origin.y, p_pointerRegion->size.width, p_pointerRegion->size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLatchingAxes:", +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:](SBEdgeResizeSystemPointerInteractionHelper, "latchingAxesForHoveredEdge:", self->_hoveringOverEdge));
  return v9;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  UIView *pointerHitTestBlocker;
  unint64_t hoveringOverEdge;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;

  pointerHitTestBlocker = self->_pointerHitTestBlocker;
  objc_msgSend(a3, "rect");
  -[UIView setFrame:](pointerHitTestBlocker, "setFrame:");
  hoveringOverEdge = self->_hoveringOverEdge;
  -[SBAppSwitcherSettings liveResizePointerInteractionRegionInnerLength](self->_settings, "liveResizePointerInteractionRegionInnerLength");
  v8 = v7;
  -[SBAppSwitcherSettings liveResizePointerInteractionRegionOuterLength](self->_settings, "liveResizePointerInteractionRegionOuterLength");
  +[SBEdgeResizeSystemPointerInteractionHelper fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:](SBEdgeResizeSystemPointerInteractionHelper, "fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:", hoveringOverEdge, v8, v9, self->_cornerRadii.topLeft, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight, self->_cornerRadii.topRight);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:](SBEdgeResizeSystemPointerInteractionHelper, "latchingAxesForHoveredEdge:", self->_hoveringOverEdge);
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithShape:constrainedAxes:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->_cornerRadii.topLeft;
  bottomLeft = self->_cornerRadii.bottomLeft;
  bottomRight = self->_cornerRadii.bottomRight;
  topRight = self->_cornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)highlightType
{
  return self->_highlightType;
}

- (BOOL)shouldClipContentView
{
  return self->_shouldClipContentView;
}

- (CGRect)contentClippingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentClippingFrame.origin.x;
  y = self->_contentClippingFrame.origin.y;
  width = self->_contentClippingFrame.size.width;
  height = self->_contentClippingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)overlayViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_overlayViewSize.width;
  height = self->_overlayViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)fullyPresentedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullyPresentedSize.width;
  height = self->_fullyPresentedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)switcherCardScale
{
  return self->_switcherCardScale;
}

- (BOOL)shouldScaleOverlayToFillBounds
{
  return self->_shouldScaleOverlayToFillBounds;
}

- (UIView)_overlayClippingView
{
  return self->_overlayClippingView;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (double)pointerInteractionHitTestPadding
{
  return self->_pointerInteractionHitTestPadding;
}

- (void)setPointerInteractionHitTestPadding:(double)a3
{
  self->_pointerInteractionHitTestPadding = a3;
}

- (BOOL)needsBackgroundWallpaperTreatment
{
  return self->_needsBackgroundWallpaperTreatment;
}

- (double)wallpaperOverlayAlpha
{
  return self->_wallpaperOverlayAlpha;
}

- (double)lighteningAlpha
{
  return self->_lighteningAlpha;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (BOOL)needsWallpaperGradientTreatment
{
  return self->_needsWallpaperGradientTreatment;
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

- (BOOL)areResizeGrabbersVisible
{
  return self->_resizeGrabbersVisible;
}

- (unint64_t)allowedTouchResizeCorners
{
  return self->_allowedTouchResizeCorners;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (SBAppSwitcherPageViewDelegate)delegate
{
  return (SBAppSwitcherPageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_pointerHitTestBlocker, 0);
  objc_storeStrong((id *)&self->_bottomRightResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_bottomLeftResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_topRightResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_topLeftResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_wallpaperGradientView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_overlayClippingView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_viewClippingView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_wallpaperOverlayView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_hitTestBlocker, 0);
}

@end
