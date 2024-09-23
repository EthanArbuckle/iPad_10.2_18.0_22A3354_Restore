@implementation SBFluidSwitcherSpaceUnderlayAccessoryView

- (void)setHeaderOpacity:(double)a3 updateMode:(int64_t)a4 settings:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  char IsZero;
  SBFluidSwitcherItemContainerHeaderView *headerView;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  void (**v17)(id, uint64_t, _QWORD);
  id v18;
  _QWORD v19[5];
  id location;
  _QWORD v21[5];
  _QWORD v22[5];

  v10 = a5;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  if ((BSFloatEqualToFloat() & 1) != 0)
  {
    if (v11)
      v11[2](v11, 1, 0);
  }
  else
  {
    self->_headerOpacity = a3;
    IsZero = BSFloatIsZero();
    headerView = self->_headerView;
    if ((IsZero & 1) != 0)
    {
      if (headerView)
      {
        objc_initWeak(&location, self);
        v14 = (void *)MEMORY[0x1E0CEABB0];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_3;
        v19[3] = &unk_1E8E9DED8;
        v19[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_4;
        v16[3] = &unk_1E8EA4D88;
        objc_copyWeak(&v18, &location);
        v17 = v11;
        objc_msgSend(v14, "sb_animateWithSettings:mode:animations:completion:", v10, a4, v19, v16);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      v15 = MEMORY[0x1E0C809B0];
      if (!headerView)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke;
        v22[3] = &unk_1E8E9DED8;
        v22[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v22);
      }
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_2;
      v21[3] = &unk_1E8E9DED8;
      v21[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v10, a4, v21, v11);
    }
  }

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
  int IsZero;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  SBFluidSwitcherItemContainerHeaderView *headerView;
  CGFloat v26;
  CGAffineTransform v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28.receiver = self;
  v28.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  -[SBFTouchPassThroughClippingView layoutSubviews](&v28, sel_layoutSubviews);
  -[SBFluidSwitcherSpaceUnderlayAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFTouchPassThroughView setBounds:](self->_contentView, "setBounds:");
  UIRectGetCenter();
  -[SBFTouchPassThroughView setCenter:](self->_contentView, "setCenter:", v11 + self->_contentViewOffset.x, v12 + self->_contentViewOffset.y);
  IsZero = BSFloatIsZero();
  v14 = 1.0;
  if (!IsZero)
    v14 = 1.0 / self->_contentScale;
  v26 = v14;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  CGRectGetWidth(v29);
  -[SBFluidSwitcherItemContainerHeaderView layer](self->_headerView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anchorPoint");

  -[SBFluidSwitcherItemContainerHeaderView preferredHeaderHeight](self->_headerView, "preferredHeaderHeight");
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  CGRectGetMinX(v30);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  CGRectGetMinY(v31);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  UIRectIntegralWithScale();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[SBFluidSwitcherItemContainerHeaderView sb_setBoundsAndPositionFromFrame:](self->_headerView, "sb_setBoundsAndPositionFromFrame:", v18, v20, v22, v24);
  headerView = self->_headerView;
  CGAffineTransformMakeScale(&v27, v26, v26);
  -[SBFluidSwitcherItemContainerHeaderView setTransform:](headerView, "setTransform:", &v27);
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_backgroundView, "sb_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[SBAppSwitcherPageShadowView sb_setBoundsAndPositionFromFrame:](self->_shadowView, "sb_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:", self->_shadowView);
  -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:", self->_backgroundView);
  -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:", self->_resizeGrabber);
  -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:", self->_headerView);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateBackgroundView](self, "_updateBackgroundView");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
  }
}

- (void)setTitleOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_titleOpacity = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateHeaderAnimated:](self, "_updateHeaderAnimated:", 0);
  }
}

- (void)setResizeGrabberCenter:(CGPoint)a3
{
  if (a3.x != self->_resizeGrabberCenter.x || a3.y != self->_resizeGrabberCenter.y)
  {
    self->_resizeGrabberCenter = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateResizeGrabber](self, "_updateResizeGrabber");
  }
}

- (void)setResizeGrabberBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_resizeGrabberBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_resizeGrabberBounds = &self->_resizeGrabberBounds;
  if (!CGRectEqualToRect(a3, self->_resizeGrabberBounds))
  {
    p_resizeGrabberBounds->origin.x = x;
    p_resizeGrabberBounds->origin.y = y;
    p_resizeGrabberBounds->size.width = width;
    p_resizeGrabberBounds->size.height = height;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateResizeGrabber](self, "_updateResizeGrabber");
  }
}

- (void)setContentViewOffset:(CGPoint)a3
{
  if (a3.x != self->_contentViewOffset.x || a3.y != self->_contentViewOffset.y)
  {
    self->_contentViewOffset = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_updateResizeGrabber
{
  void *v3;
  id WeakRetained;

  -[SBSeparatorView setBounds:](self->_resizeGrabber, "setBounds:", self->_resizeGrabberBounds.origin.x, self->_resizeGrabberBounds.origin.y, self->_resizeGrabberBounds.size.width, self->_resizeGrabberBounds.size.height);
  -[SBSeparatorView setCenter:](self->_resizeGrabber, "setCenter:", self->_resizeGrabberCenter.x, self->_resizeGrabberCenter.y);
  -[SBSeparatorView setAlpha:](self->_resizeGrabber, "setAlpha:", self->_resizeGrabberOpacity);
  -[SBSeparatorView setKeyboardHeight:](self->_resizeGrabber, "setKeyboardHeight:", self->_keyboardHeight);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  -[SBSeparatorView nubView](self->_resizeGrabber, "nubView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSFloatIsZero() & 1) != 0 || (objc_msgSend(WeakRetained, "isViewRegistered:", v3) & 1) != 0)
  {
    if (BSFloatIsZero() && objc_msgSend(WeakRetained, "isViewRegistered:", v3))
      objc_msgSend(WeakRetained, "unregisterView:", v3);
  }
  else
  {
    objc_msgSend(WeakRetained, "registerView:delegate:", v3, self);
  }

}

- (void)setContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentScale = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView setNeedsLayout](self, "setNeedsLayout");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setShadowStyle:(int64_t)a3
{
  if (self->_shadowStyle != a3)
  {
    self->_shadowStyle = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
  }
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
  {
    self->_shadowOffset = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
  }
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
  }
}

- (void)setBackgroundOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_backgroundOpacity = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)setKeyboardHeight:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_keyboardHeight = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateResizeGrabber](self, "_updateResizeGrabber");
  }
}

- (void)setResizeGrabberOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_resizeGrabberOpacity = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateResizeGrabber](self, "_updateResizeGrabber");
  }
}

- (void)setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  -[SBFTouchPassThroughClippingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateBackgroundView](self, "_updateBackgroundView");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
  }
}

- (void)_updateBackgroundView
{
  id v3;

  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", self->_backgroundOpacity);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", self->_cornerRadius);
  -[UIView layer](self->_backgroundView, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", self->_maskedCorners);

}

- (void)_updateShadowView
{
  void *v3;

  -[SBAppSwitcherPageShadowView setStyle:](self->_shadowView, "setStyle:", self->_shadowStyle);
  -[SBAppSwitcherPageShadowView setAlpha:](self->_shadowView, "setAlpha:", self->_shadowAlpha);
  -[SBAppSwitcherPageShadowView setShadowOffset:](self->_shadowView, "setShadowOffset:", self->_shadowOffset);
  -[SBAppSwitcherPageShadowView setShadowPath:](self->_shadowView, "setShadowPath:", self->_shadowPath);
  -[SBAppSwitcherPageShadowView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", self->_cornerRadius);
  -[SBAppSwitcherPageShadowView layer](self->_shadowView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", self->_maskedCorners);

  -[SBAppSwitcherPageShadowView setSwitcherCardScale:](self->_shadowView, "setSwitcherCardScale:", self->_contentScale);
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *titleItems;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    titleItems = self->_titleItems;
    self->_titleItems = v6;

    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateHeaderAnimated:](self, "_updateHeaderAnimated:", v4);
  }

}

- (SBFluidSwitcherSpaceUnderlayAccessoryView)initWithDelegate:(id)a3 systemPointerInteractionManager:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBFluidSwitcherSpaceUnderlayAccessoryView *v12;
  SBFluidSwitcherSpaceUnderlayAccessoryView *v13;
  uint64_t v14;
  SBAppSwitcherSettings *settings;
  uint64_t v16;
  SBFTouchPassThroughView *contentView;
  SBFTouchPassThroughView *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[SBFTouchPassThroughClippingView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v6);
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v14 = objc_claimAutoreleasedReturnValue();
    settings = v13->_settings;
    v13->_settings = (SBAppSwitcherSettings *)v14;

    objc_storeWeak((id *)&v13->_systemPointerInteractionManager, v7);
    v13->_titleOpacity = 1.0;
    v13->_backgroundOpacity = 0.0;
    v13->_shadowStyle = 1;
    v13->_contentViewScale = 1.0;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v8, v9, v10, v11);
    contentView = v13->_contentView;
    v13->_contentView = (SBFTouchPassThroughView *)v16;

    v18 = v13->_contentView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[SBFTouchPassThroughClippingView addSubview:](v13, "addSubview:", v13->_contentView);
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateBackgroundViewVisibility](v13, "_updateBackgroundViewVisibility");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowVisibility](v13, "_updateShadowVisibility");
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateResizeGrabberVisibility](v13, "_updateResizeGrabberVisibility");
  }

  return v13;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  -[SBFluidSwitcherSpaceUnderlayAccessoryView prepareForReuse](self, "prepareForReuse");
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  -[SBSeparatorView nubView](self->_resizeGrabber, "nubView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "unregisterView:", v4);

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  -[SBFluidSwitcherSpaceUnderlayAccessoryView dealloc](&v5, sel_dealloc);
}

uint64_t __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke(uint64_t a1)
{
  SBFluidSwitcherItemContainerHeaderView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;

  v2 = [SBFluidSwitcherItemContainerHeaderView alloc];
  v3 = -[SBFluidSwitcherItemContainerHeaderView initWithFrame:delegate:](v2, "initWithFrame:delegate:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 496);
  *(_QWORD *)(v4 + 496) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  v8 = 1.0;
  if (v7 != 1)
    v8 = 0.0;
  objc_msgSend(v6, "setAnchorPoint:", v8, 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));
  objc_msgSend(*(id *)(a1 + 32), "_updateHeaderAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 584));
}

uint64_t __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_3(uint64_t a1)
{
  ++setHeaderOpacity_updateMode_settings_completion__staticHeaderOpacityAnimations;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
}

void __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id *v7;
  int IsZero;
  id v10;
  uint64_t v11;
  id *v12;

  --setHeaderOpacity_updateMode_settings_completion__staticHeaderOpacityAnimations;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[62], "alpha");
    IsZero = BSFloatIsZero();
    v7 = v12;
    if (IsZero && setHeaderOpacity_updateMode_settings_completion__staticHeaderOpacityAnimations == 0)
    {
      objc_msgSend(v12[62], "removeFromSuperview");
      v10 = v12[62];
      v12[62] = 0;

      v7 = v12;
    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);
    v7 = v12;
  }

}

- (void)setShadowPath:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_shadowPath) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowPath, a3);
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateShadowView](self, "_updateShadowView");
  }

}

- (void)setContentViewScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentViewScale = a3;
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateContentView](self, "_updateContentView");
  }
}

- (void)itemContainerHeaderView:(id)a3 didSelectTitleItem:(id)a4
{
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = &SBLayoutRolePrimary;
    if (-[NSArray count](self->_titleItems, "count") >= 2)
    {
      -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v6)
        v7 = &SBLayoutRoleSide;
    }
    v9 = *v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "underlayAccessoryView:didSelectHeaderForRole:", self, v9);

  }
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  id v7;
  char isKindOfClass;
  id WeakRetained;

  v7 = a5;
  if ((objc_msgSend(a3, "_isPencilInitiated") & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_msgSend(WeakRetained, "underlayAccessoryViewShouldBeginPointerInteraction:", self))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  return isKindOfClass & 1;
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = -20.0;
  v4 = -20.0;
  v5 = -20.0;
  v6 = -20.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  id v4;
  uint64_t v5;
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CGRect v29;

  v4 = a4;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", v6);
    objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "medusaSeparatorCursorEdgeInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v29.origin.x = v10 + v21;
    v29.origin.y = v12 + v19;
    v29.size.width = v14 - (v21 + v25);
    v29.size.height = v16 - (v19 + v23);
    objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:cornerRadius:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height, CGRectGetHeight(v29) * 0.5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v8, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  SBFluidSwitcherItemContainerHeaderView *headerView;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  if (-[SBFluidSwitcherSpaceUnderlayAccessoryView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    -[SBFluidSwitcherItemContainerHeaderView alpha](self->_headerView, "alpha");
    if (BSFloatGreaterThanFloat())
    {
      headerView = self->_headerView;
      -[SBFluidSwitcherSpaceUnderlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", headerView, x, y);
      v8 = -[SBFluidSwitcherItemContainerHeaderView pointInside:withEvent:](headerView, "pointInside:withEvent:", v7);
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
  SBFluidSwitcherItemContainerHeaderView *headerView;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  -[SBFTouchPassThroughView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[SBFluidSwitcherItemContainerHeaderView alpha](self->_headerView, "alpha"),
        BSFloatGreaterThanFloat())
    && (headerView = self->_headerView,
        -[SBFluidSwitcherSpaceUnderlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", headerView, x, y), -[SBFluidSwitcherItemContainerHeaderView hitTest:withEvent:](headerView, "hitTest:withEvent:", v7), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateBackgroundViewVisibility
{
  _QWORD v2[5];

  if (!self->_backgroundView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __76__SBFluidSwitcherSpaceUnderlayAccessoryView__updateBackgroundViewVisibility__block_invoke;
    v2[3] = &unk_1E8E9DED8;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v2);
  }
}

uint64_t __76__SBFluidSwitcherSpaceUnderlayAccessoryView__updateBackgroundViewVisibility__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = objc_msgSend(v2, "initWithFrame:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 512);
  *(_QWORD *)(v4 + 512) = v3;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundView");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateShadowVisibility
{
  BOOL v3;
  SBAppSwitcherPageShadowView *shadowView;
  SBAppSwitcherPageShadowView *v5;
  _QWORD v6[5];

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
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__SBFluidSwitcherSpaceUnderlayAccessoryView__updateShadowVisibility__block_invoke;
    v6[3] = &unk_1E8E9DED8;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v6);
  }
}

uint64_t __68__SBFluidSwitcherSpaceUnderlayAccessoryView__updateShadowVisibility__block_invoke(uint64_t a1)
{
  SBAppSwitcherPageShadowView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = [SBAppSwitcherPageShadowView alloc];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = -[SBAppSwitcherPageShadowView initWithFrame:style:](v2, "initWithFrame:style:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 520);
  *(_QWORD *)(v4 + 520) = v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateShadowView");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateResizeGrabberVisibility
{
  SBSeparatorView *v3;
  SBSeparatorView *v4;
  SBSeparatorView *v5;
  SBSeparatorView *resizeGrabber;
  id v7;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || self->_resizeGrabber)
      return;
LABEL_7:
    v4 = [SBSeparatorView alloc];
    v5 = -[SBSeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    resizeGrabber = self->_resizeGrabber;
    self->_resizeGrabber = v5;

    -[SBSeparatorView setAccessibilityIdentifier:](self->_resizeGrabber, "setAccessibilityIdentifier:", CFSTR("SideAppDivider"));
    -[SBFluidSwitcherSpaceUnderlayAccessoryView _updateResizeGrabber](self, "_updateResizeGrabber");
    -[SBFTouchPassThroughView addSubview:](self->_contentView, "addSubview:", self->_resizeGrabber);
    return;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
  {

    return;
  }
  v3 = self->_resizeGrabber;

  if (!v3)
    goto LABEL_7;
}

- (void)_updateContentView
{
  SBFTouchPassThroughView *contentView;
  CGAffineTransform v3;

  contentView = self->_contentView;
  CGAffineTransformMakeScale(&v3, self->_contentViewScale, self->_contentViewScale);
  -[SBFTouchPassThroughView setTransform:](contentView, "setTransform:", &v3);
}

- (void)_updateHeaderAnimated:(BOOL)a3
{
  -[SBFluidSwitcherItemContainerHeaderView setTextAlpha:](self->_headerView, "setTextAlpha:", a3, self->_titleOpacity);
  -[SBFluidSwitcherItemContainerHeaderView setTitleItems:animated:](self->_headerView, "setTitleItems:animated:", self->_titleItems, 0);
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
  -[SBFluidSwitcherSpaceUnderlayAccessoryView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", objc_msgSend(v11, "cgColor"));

  -[SBFluidSwitcherSpaceUnderlayAccessoryView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", 8.0);

}

- (SBFluidSwitcherSpaceUnderlayAccessoryViewDelegate)delegate
{
  return (SBFluidSwitcherSpaceUnderlayAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (double)headerOpacity
{
  return self->_headerOpacity;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (NSArray)titleItems
{
  return self->_titleItems;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (double)resizeGrabberOpacity
{
  return self->_resizeGrabberOpacity;
}

- (CGRect)resizeGrabberBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_resizeGrabberBounds.origin.x;
  y = self->_resizeGrabberBounds.origin.y;
  width = self->_resizeGrabberBounds.size.width;
  height = self->_resizeGrabberBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)resizeGrabberCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_resizeGrabberCenter.x;
  y = self->_resizeGrabberCenter.y;
  result.y = y;
  result.x = x;
  return result;
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
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resizeGrabber, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
