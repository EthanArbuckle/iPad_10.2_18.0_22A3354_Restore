@implementation SBFluidSwitcherSpaceOverlayAccessoryView

- (void)setWantsPointerInteractions:(BOOL)a3
{
  self->_wantsPointerInteractions = a3;
  -[SBFluidSwitcherItemContainerFooterView setWantsIconPointerInteractions:](self->_footerView, "setWantsIconPointerInteractions:");
}

- (void)setIconHitTestOutset:(double)a3
{
  self->_iconHitTestOutset = a3;
  -[SBFluidSwitcherItemContainerFooterView setIconHitTestOutset:](self->_footerView, "setIconHitTestOutset:");
}

- (void)setDrawsFooter:(BOOL)a3
{
  if (self->_drawsFooter != a3)
  {
    self->_drawsFooter = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView _updateFooterVisibility](self, "_updateFooterVisibility");
  }
}

- (void)configureOverlayForIconZoomWithView:(id)a3 crossfadeViews:(id)a4
{
  id v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  SBFluidSwitcherIconOverlayView *iconOverlayView;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  _BOOL4 v25;
  SBFluidSwitcherIconOverlayView *v26;
  SBFluidSwitcherIconOverlayView *v27;
  id WeakRetained;
  id v29;
  CGRect v30;
  CGRect v31;

  v29 = a3;
  v6 = a4;
  -[SBFluidSwitcherSpaceOverlayAccessoryView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1;
  objc_msgSend(v7, "overlayAccessoryViewFrameForIconOverlayView:fullPresented:", self, 1);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend(v7, "overlayAccessoryViewHomeScreenInterfaceOrientation:", self);
  v18 = objc_msgSend(v7, "overlayAccessoryViewSwitcherInterfaceOrientation:", self);
  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView)
  {
    -[SBFluidSwitcherIconOverlayView iconView](iconOverlayView, "iconView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "icon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "icon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    v8 = v23 ^ 1;
    iconOverlayView = self->_iconOverlayView;
  }
  -[SBFluidSwitcherIconOverlayView crossfadeViewFrame](iconOverlayView, "crossfadeViewFrame");
  v31.origin.x = v10;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v16;
  v24 = CGRectEqualToRect(v30, v31);
  v25 = -[BSUIOrientationTransformWrapperView contentOrientation](self->_iconOverlayView, "contentOrientation") != v17
     || -[BSUIOrientationTransformWrapperView containerOrientation](self->_iconOverlayView, "containerOrientation") != v18;
  if (v29 && (v8 | v25 | !v24) == 1)
  {
    -[SBFluidSwitcherSpaceOverlayAccessoryView removeIconOverlay](self, "removeIconOverlay");
    v26 = -[SBFluidSwitcherIconOverlayView initWithIconView:crossfadeViews:crossfadeViewFrame:contentOrientation:containerOrientation:]([SBFluidSwitcherIconOverlayView alloc], "initWithIconView:crossfadeViews:crossfadeViewFrame:contentOrientation:containerOrientation:", v29, v6, v17, v18, v10, v12, v14, v16);
    v27 = self->_iconOverlayView;
    self->_iconOverlayView = v26;

    -[SBFTouchPassThroughView addSubview:](self->_contentView, "addSubview:", self->_iconOverlayView);
    -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherSpaceOverlayAccessoryView layoutIfNeeded](self, "layoutIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "overlayAccessoryView:didUpdateShowingIconOverlay:", self, 1);

  }
}

- (void)removeIconOverlay
{
  SBFluidSwitcherIconOverlayView *iconOverlayView;
  SBFluidSwitcherIconOverlayView *v4;
  id WeakRetained;

  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView)
  {
    -[SBFluidSwitcherIconOverlayView invalidate](iconOverlayView, "invalidate");
    -[SBFluidSwitcherIconOverlayView removeFromSuperview](self->_iconOverlayView, "removeFromSuperview");
    v4 = self->_iconOverlayView;
    self->_iconOverlayView = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "overlayAccessoryView:didUpdateShowingIconOverlay:", self, 0);

  }
}

- (SBFluidSwitcherSpaceOverlayAccessoryViewDelegate)delegate
{
  return (SBFluidSwitcherSpaceOverlayAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  void *v11;
  SBHomeGrabberRotationView *homeGrabberView;
  CAShapeLayer *focusIndicatorLayer;
  CAShapeLayer *v14;
  id v15;
  double v16;
  CGFloat v17;
  SBFluidSwitcherItemContainerFooterView *footerView;
  SBFluidSwitcherIconOverlayView *iconOverlayView;
  id WeakRetained;
  SBFluidSwitcherIconOverlayView *v21;
  SBSwitcherShelfViewController *shelfViewController;
  SBFTouchPassThroughView *contentView;
  void *v24;
  CGAffineTransform v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  -[SBFTouchPassThroughClippingView layoutSubviews](&v26, sel_layoutSubviews);
  -[SBFluidSwitcherSpaceOverlayAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFluidSwitcherSpaceOverlayAccessoryView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  -[SBFluidSwitcherSpaceOverlayAccessoryView _updateContentViewLayout](self, "_updateContentViewLayout");
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView)
    -[SBHomeGrabberRotationView setFrame:](homeGrabberView, "setFrame:", v4, v6, v8, v10);
  focusIndicatorLayer = self->_focusIndicatorLayer;
  if (focusIndicatorLayer)
  {
    -[CAShapeLayer setFrame:](focusIndicatorLayer, "setFrame:", v4, v6, v8, v10);
    v14 = self->_focusIndicatorLayer;
    objc_msgSend(MEMORY[0x1E0CEA390], "_bezierPathWithPillRect:cornerRadius:", v4, v6, v8, v10, self->_cornerRadius);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v14, "setPath:", objc_msgSend(v15, "CGPath"));

  }
  if (self->_footerView)
  {
    -[SBFluidSwitcherSpaceOverlayAccessoryView _inverseContentScale](self, "_inverseContentScale");
    v17 = v16;
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    CGRectGetWidth(v27);
    -[SBFluidSwitcherItemContainerFooterView intrinsicContentSize](self->_footerView, "intrinsicContentSize");
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    CGRectGetMidX(v28);
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    CGRectGetMaxY(v29);
    UIRectIntegralWithScale();
    -[SBFluidSwitcherItemContainerFooterView sb_setBoundsAndPositionFromFrame:](self->_footerView, "sb_setBoundsAndPositionFromFrame:");
    footerView = self->_footerView;
    CGAffineTransformMakeScale(&v25, v17, v17);
    -[SBFluidSwitcherItemContainerFooterView setTransform:](footerView, "setTransform:", &v25);
  }
  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "overlayAccessoryViewFrameForIconOverlayView:fullPresented:", self, 0);
    -[BSUIOrientationTransformWrapperView setFrame:](iconOverlayView, "setFrame:");

    v21 = self->_iconOverlayView;
    if (v21)
      -[SBFluidSwitcherIconOverlayView setCornerRadius:](v21, "setCornerRadius:", self->_cornerRadius);
  }
  if (self->_footerView)
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  shelfViewController = self->_shelfViewController;
  if (shelfViewController)
  {
    contentView = self->_contentView;
    -[SBSwitcherShelfViewController view](shelfViewController, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView bringSubviewToFront:](contentView, "bringSubviewToFront:", v24);

  }
  if (self->_homeGrabberView)
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  if (self->_iconOverlayView)
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
}

- (void)_updateContentViewLayout
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

  -[SBFluidSwitcherSpaceOverlayAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  v12 = v11 + self->_contentViewOffset.x;
  v14 = v13 + self->_contentViewOffset.y;
  -[SBFTouchPassThroughView setBounds:](self->_contentView, "setBounds:", v4, v6, v8, v10);
  -[SBFTouchPassThroughView setCenter:](self->_contentView, "setCenter:", v12, v14);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (void)setTitleOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_titleOpacity = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView _updateFooterAnimated:](self, "_updateFooterAnimated:", 1);
  }
}

- (void)setContentViewOffset:(CGPoint)a3
{
  if (a3.x != self->_contentViewOffset.x || a3.y != self->_contentViewOffset.y)
  {
    self->_contentViewOffset = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView _updateContentViewLayout](self, "_updateContentViewLayout");
  }
}

- (SBHomeGrabberRotationView)homeGrabberView
{
  return self->_homeGrabberView;
}

- (void)setUniqueIconsOnly:(BOOL)a3
{
  self->_uniqueIconsOnly = a3;
  -[SBFluidSwitcherItemContainerFooterView setUniqueIconsOnly:](self->_footerView, "setUniqueIconsOnly:");
}

- (void)setIconAlignment:(unint64_t)a3
{
  self->_iconAlignment = a3;
  -[SBFluidSwitcherItemContainerFooterView setIconAlignment:](self->_footerView, "setIconAlignment:");
}

- (void)setFooterStyle:(unint64_t)a3
{
  if (self->_footerStyle != a3)
  {
    self->_footerStyle = a3;
    -[SBFluidSwitcherItemContainerFooterView setFooterStyle:](self->_footerView, "setFooterStyle:");
    -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentScale = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHomeGrabberView:(id)a3
{
  SBHomeGrabberRotationView *v5;
  SBHomeGrabberRotationView *homeGrabberView;
  _QWORD v7[5];

  v5 = (SBHomeGrabberRotationView *)a3;
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView != v5)
  {
    if (homeGrabberView)
      -[SBHomeGrabberRotationView removeFromSuperview](homeGrabberView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_homeGrabberView, a3);
    if (self->_homeGrabberView)
      -[SBFTouchPassThroughView addSubview:](self->_contentView, "addSubview:");
    -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInRetargetableAnimationBlock"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __63__SBFluidSwitcherSpaceOverlayAccessoryView_setHomeGrabberView___block_invoke;
      v7[3] = &unk_1E8E9DED8;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v7);
    }
    else
    {
      -[SBFluidSwitcherSpaceOverlayAccessoryView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }

}

- (void)setDrawsFocusIndicator:(BOOL)a3
{
  if (self->_drawsFocusIndicator != a3)
  {
    self->_drawsFocusIndicator = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView _updateFocusIndicator](self, "_updateFocusIndicator");
  }
}

- (void)setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  -[SBFTouchPassThroughClippingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleAndIconOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_titleAndIconOpacity = a3;
    -[SBFluidSwitcherSpaceOverlayAccessoryView _updateFooterAnimated:](self, "_updateFooterAnimated:", 1);
  }
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *titleItems;
  char v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  v4 = a4;
  v6 = (NSArray *)a3;
  titleItems = self->_titleItems;
  if (titleItems != v6)
  {
    v11 = v6;
    v8 = -[NSArray isEqual:](titleItems, "isEqual:", v6);
    v6 = v11;
    if ((v8 & 1) == 0)
    {
      v9 = (NSArray *)-[NSArray copy](v11, "copy");
      v10 = self->_titleItems;
      self->_titleItems = v9;

      -[SBFluidSwitcherSpaceOverlayAccessoryView _updateFooterAnimated:](self, "_updateFooterAnimated:", v4);
      v6 = v11;
    }
  }

}

- (SBFluidSwitcherSpaceOverlayAccessoryView)initWithDelegate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SBFluidSwitcherSpaceOverlayAccessoryView *v9;
  SBFluidSwitcherSpaceOverlayAccessoryView *v10;
  uint64_t v11;
  SBAppSwitcherSettings *settings;
  uint64_t v13;
  SBFTouchPassThroughView *contentView;
  SBFTouchPassThroughView *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[SBFTouchPassThroughClippingView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v4);
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    settings = v10->_settings;
    v10->_settings = (SBAppSwitcherSettings *)v11;

    v10->_titleAndIconOpacity = 1.0;
    v10->_titleOpacity = 1.0;
    v10->_contentViewScale = 1.0;
    v10->_footerStyle = 0;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v5, v6, v7, v8);
    contentView = v10->_contentView;
    v10->_contentView = (SBFTouchPassThroughView *)v13;

    v15 = v10->_contentView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[SBFTouchPassThroughClippingView addSubview:](v10, "addSubview:", v10->_contentView);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFluidSwitcherSpaceOverlayAccessoryView prepareForReuse](self, "prepareForReuse");
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  -[SBFluidSwitcherSpaceOverlayAccessoryView dealloc](&v3, sel_dealloc);
}

- (void)setTitleItems:(id)a3
{
  -[SBFluidSwitcherSpaceOverlayAccessoryView setTitleItems:animated:](self, "setTitleItems:animated:", a3, 0);
}

uint64_t __63__SBFluidSwitcherSpaceOverlayAccessoryView_setHomeGrabberView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setShelfViewController:(id)a3
{
  SBSwitcherShelfViewController *v5;
  SBSwitcherShelfViewController *shelfViewController;
  SBSwitcherShelfViewController *v7;
  SBSwitcherShelfViewController *v8;
  void *v9;
  SBFTouchPassThroughView *contentView;
  void *v11;
  SBSwitcherShelfViewController *v12;

  v5 = (SBSwitcherShelfViewController *)a3;
  shelfViewController = self->_shelfViewController;
  if (shelfViewController != v5)
  {
    v12 = v5;
    v7 = shelfViewController;
    v8 = v7;
    if (v7)
    {
      -[SBSwitcherShelfViewController view](v7, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_shelfViewController, a3);
    contentView = self->_contentView;
    -[SBSwitcherShelfViewController view](self->_shelfViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView addSubview:](contentView, "addSubview:", v11);

    -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setContentViewScale:(double)a3
{
  SBFTouchPassThroughView *contentView;
  CGAffineTransform v6;

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentViewScale = a3;
    contentView = self->_contentView;
    CGAffineTransformMakeScale(&v6, a3, a3);
    -[SBFTouchPassThroughView setTransform:](contentView, "setTransform:", &v6);
  }
}

- (void)prepareForReuse
{
  SBHomeGrabberRotationView *homeGrabberView;
  SBHomeGrabberRotationView *v4;
  SBSwitcherShelfViewController *shelfViewController;
  void *v6;
  SBSwitcherShelfViewController *v7;
  SBFluidSwitcherItemContainerFooterView *footerView;

  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView)
  {
    -[SBHomeGrabberRotationView removeFromSuperview](homeGrabberView, "removeFromSuperview");
    v4 = self->_homeGrabberView;
    self->_homeGrabberView = 0;

  }
  shelfViewController = self->_shelfViewController;
  if (shelfViewController)
  {
    -[SBSwitcherShelfViewController view](shelfViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v7 = self->_shelfViewController;
    self->_shelfViewController = 0;

  }
  if (self->_footerView)
  {
    self->_drawsFooter = 0;
    -[SBFluidSwitcherItemContainerFooterView removeFromSuperview](self->_footerView, "removeFromSuperview");
    footerView = self->_footerView;
    self->_footerView = 0;

  }
  if (self->_iconOverlayView)
    -[SBFluidSwitcherSpaceOverlayAccessoryView removeIconOverlay](self, "removeIconOverlay");
  if (self->_wantsPointerInteractions)
    -[SBFluidSwitcherSpaceOverlayAccessoryView setWantsPointerInteractions:](self, "setWantsPointerInteractions:", 0);
}

- (void)itemContainerFooterView:(id)a3 didSelectTitleItem:(id)a4
{
  NSUInteger v5;
  uint64_t *v6;
  uint64_t v7;
  id WeakRetained;

  v5 = -[NSArray indexOfObject:](self->_titleItems, "indexOfObject:", a4);
  if (v5)
  {
    if (v5 == 1)
    {
      v6 = &SBLayoutRoleSide;
      goto LABEL_6;
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v5 + 3;
      goto LABEL_8;
    }
  }
  v6 = &SBLayoutRolePrimary;
LABEL_6:
  v7 = *v6;
LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "overlayAccessoryView:didSelectHeaderForRole:", self, v7);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  SBFluidSwitcherItemContainerFooterView *footerView;
  SBFluidSwitcherItemContainerFooterView *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  if (-[SBFluidSwitcherSpaceOverlayAccessoryView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    footerView = self->_footerView;
    if (footerView
      && (-[SBFluidSwitcherItemContainerFooterView alpha](footerView, "alpha"), BSFloatGreaterThanFloat()))
    {
      v10 = self->_footerView;
      -[SBFluidSwitcherSpaceOverlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      v8 = -[SBFluidSwitcherItemContainerFooterView pointInside:withEvent:](v10, "pointInside:withEvent:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  SBFluidSwitcherItemContainerFooterView *footerView;
  SBFluidSwitcherItemContainerFooterView *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  -[SBFTouchPassThroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (footerView = self->_footerView) != 0
    && (-[SBFluidSwitcherItemContainerFooterView alpha](footerView, "alpha"), BSFloatGreaterThanFloat())
    && (v11 = self->_footerView,
        -[SBFluidSwitcherSpaceOverlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y),
        -[SBFTouchPassThroughView hitTest:withEvent:](v11, "hitTest:withEvent:", v7),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateFocusIndicator
{
  _BOOL4 drawsFocusIndicator;
  CAShapeLayer *focusIndicatorLayer;
  double v5;
  double v6;
  int IsZero;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CAShapeLayer *v21;
  CAShapeLayer *v22;
  CAShapeLayer *v23;
  id v24;
  CAShapeLayer *v25;
  id v26;
  void *v27;

  drawsFocusIndicator = self->_drawsFocusIndicator;
  focusIndicatorLayer = self->_focusIndicatorLayer;
  -[SBFluidSwitcherSpaceOverlayAccessoryView _inverseContentScale](self, "_inverseContentScale");
  v6 = v5;
  IsZero = BSFloatIsZero();
  v8 = v6 + v6;
  v9 = 0.0;
  if (IsZero)
    v10 = 0.0;
  else
    v10 = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "CGColor");

  if (drawsFocusIndicator)
  {
    if (!focusIndicatorLayer)
    {
      -[SBFluidSwitcherSpaceOverlayAccessoryView bounds](self, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v21 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      v22 = self->_focusIndicatorLayer;
      self->_focusIndicatorLayer = v21;

      -[CAShapeLayer setFillColor:](self->_focusIndicatorLayer, "setFillColor:", v12);
      -[CAShapeLayer setFrame:](self->_focusIndicatorLayer, "setFrame:", v14, v16, v18, v20);
      -[CAShapeLayer setLineWidth:](self->_focusIndicatorLayer, "setLineWidth:", 0.0);
      v23 = self->_focusIndicatorLayer;
      objc_msgSend(MEMORY[0x1E0CEA390], "_bezierPathWithPillRect:cornerRadius:", v14, v16, v18, v20, self->_cornerRadius);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setPath:](v23, "setPath:", objc_msgSend(v24, "CGPath"));

      v25 = self->_focusIndicatorLayer;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](v25, "setStrokeColor:", objc_msgSend(v26, "CGColor"));

      -[SBFTouchPassThroughView layer](self->_contentView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSublayer:", self->_focusIndicatorLayer);

      -[SBFluidSwitcherSpaceOverlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
    }
    v9 = v10;
  }
  -[CAShapeLayer setLineWidth:](self->_focusIndicatorLayer, "setLineWidth:", v9);
}

- (void)_updateFooterVisibility
{
  _BOOL4 v3;
  SBFluidSwitcherItemContainerFooterView *footerView;
  SBFluidSwitcherItemContainerFooterView *v5;
  _QWORD v6[5];

  v3 = !-[SBAppSwitcherSettings shouldSimplifyForOptions:](self->_settings, "shouldSimplifyForOptions:", 8)
    && self->_drawsFooter;
  footerView = self->_footerView;
  if (v3 || !footerView)
  {
    if (footerView)
      v3 = 0;
    if (v3)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __67__SBFluidSwitcherSpaceOverlayAccessoryView__updateFooterVisibility__block_invoke;
      v6[3] = &unk_1E8E9DED8;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v6);
    }
  }
  else
  {
    -[SBFluidSwitcherItemContainerFooterView removeFromSuperview](footerView, "removeFromSuperview");
    v5 = self->_footerView;
    self->_footerView = 0;

  }
}

uint64_t __67__SBFluidSwitcherSpaceOverlayAccessoryView__updateFooterVisibility__block_invoke(uint64_t a1)
{
  SBFluidSwitcherItemContainerFooterView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = [SBFluidSwitcherItemContainerFooterView alloc];
  v3 = -[SBFluidSwitcherItemContainerFooterView initWithFrame:delegate:](v2, "initWithFrame:delegate:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 488);
  *(_QWORD *)(v4 + 488) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setIconAlignment:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setFooterStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 600));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setUniqueIconsOnly:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 521));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488), 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateFooterAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateFooterAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBFluidSwitcherItemContainerFooterView setAlpha:](self->_footerView, "setAlpha:", self->_titleAndIconOpacity);
  -[SBFluidSwitcherItemContainerFooterView setTextAlpha:](self->_footerView, "setTextAlpha:", self->_titleOpacity);
  -[SBFluidSwitcherItemContainerFooterView setTitleItems:animated:](self->_footerView, "setTitleItems:animated:", self->_titleItems, v3);
}

- (double)_inverseContentScale
{
  char IsZero;
  double result;

  IsZero = BSFloatIsZero();
  result = 1.0;
  if ((IsZero & 1) == 0)
    return 1.0 / self->_contentScale;
  return result;
}

- (void)_configureDebugBorder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPurpleColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherSpaceOverlayAccessoryView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", objc_msgSend(v11, "cgColor"));

  -[SBFluidSwitcherSpaceOverlayAccessoryView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", 8.0);

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (BOOL)drawsFocusIndicator
{
  return self->_drawsFocusIndicator;
}

- (BOOL)drawsFooter
{
  return self->_drawsFooter;
}

- (BOOL)uniqueIconsOnly
{
  return self->_uniqueIconsOnly;
}

- (BOOL)wantsPointerInteractions
{
  return self->_wantsPointerInteractions;
}

- (double)iconHitTestOutset
{
  return self->_iconHitTestOutset;
}

- (unint64_t)iconAlignment
{
  return self->_iconAlignment;
}

- (double)titleAndIconOpacity
{
  return self->_titleAndIconOpacity;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (unint64_t)footerStyle
{
  return self->_footerStyle;
}

- (unint64_t)multiWindowIndicatorRoleMask
{
  return self->_multiWindowIndicatorRoleMask;
}

- (void)setMultiWindowIndicatorRoleMask:(unint64_t)a3
{
  self->_multiWindowIndicatorRoleMask = a3;
}

- (NSArray)titleItems
{
  return self->_titleItems;
}

- (SBSwitcherShelfViewController)shelfViewController
{
  return self->_shelfViewController;
}

- (double)contentViewScale
{
  return self->_contentViewScale;
}

- (CGPoint)contentViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentViewOffset.x;
  y = self->_contentViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfViewController, 0);
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconOverlayView, 0);
  objc_storeStrong((id *)&self->_focusIndicatorLayer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
