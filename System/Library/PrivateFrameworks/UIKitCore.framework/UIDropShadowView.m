@implementation UIDropShadowView

- (void)setMagicShadowAlpha:(double)a3
{
  id v4;

  -[UIDropShadowView magicShadowView](self, "magicShadowView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)setEnvironmentMatchingCornerRadii:(UIRectCornerRadii)a3
{
  if (self->_environmentMatchingCornerRadii.topLeft != a3.topLeft
    || self->_environmentMatchingCornerRadii.bottomLeft != a3.bottomLeft
    || self->_environmentMatchingCornerRadii.bottomRight != a3.bottomRight
    || self->_environmentMatchingCornerRadii.topRight != a3.topRight)
  {
    self->_environmentMatchingCornerRadii = a3;
    -[UIDropShadowView updateCornerClippingViews](self, "updateCornerClippingViews");
  }
}

- (void)setContentTouchInsets:(UIEdgeInsets)a3
{
  self->_contentTouchInsets = a3;
}

- (_UIRoundedRectShadowView)magicShadowView
{
  return self->_magicShadowView;
}

- (void)_setInsetsContentViewForGrabber:(BOOL)a3
{
  if (self->__insetsContentViewForGrabber != a3)
  {
    self->__insetsContentViewForGrabber = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setHasGrabber:(BOOL)a3
{
  _UIGrabber *v4;
  _UIGrabber *topGrabber;
  _UIGrabber *v6;
  _UIGrabber *bottomGrabber;
  _QWORD v8[5];

  if (self->__hasGrabber != a3)
  {
    self->__hasGrabber = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    if (self->__hasGrabber && !-[UIDropShadowView _hasCreatedGrabbers](self, "_hasCreatedGrabbers"))
    {
      v4 = objc_alloc_init(_UIGrabber);
      topGrabber = self->__topGrabber;
      self->__topGrabber = v4;

      -[UIControl addTarget:action:forControlEvents:](self->__topGrabber, "addTarget:action:forControlEvents:", self, sel__grabberPrimaryAction, 0x2000);
      -[UIView addSubview:](self, "addSubview:", self->__topGrabber);
      v6 = objc_alloc_init(_UIGrabber);
      bottomGrabber = self->__bottomGrabber;
      self->__bottomGrabber = v6;

      -[UIControl addTarget:action:forControlEvents:](self->__bottomGrabber, "addTarget:action:forControlEvents:", self, sel__grabberPrimaryAction, 0x2000);
      -[UIView addSubview:](self, "addSubview:", self->__bottomGrabber);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __35__UIDropShadowView__setHasGrabber___block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
    }
  }
}

- (void)_setGrabberSpacing:(double)a3
{
  if (self->__grabberSpacing != a3)
  {
    self->__grabberSpacing = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setGrabberEdge:(int64_t)a3
{
  if (self->__grabberEdge != a3)
  {
    self->__grabberEdge = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setGrabberAlpha:(double)a3
{
  if (self->__grabberAlpha != a3)
  {
    self->__grabberAlpha = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (UIDropShadowView)initWithFrame:(CGRect)a3 independentCorners:(int64_t)a4 supportsShadow:(BOOL)a5 stylesSheetsAsCards:(BOOL)a6
{
  _BOOL4 v7;
  UIDropShadowView *v9;
  UIDropShadowView *v10;
  uint64_t v11;
  void *v12;
  _UIRoundedRectShadowView *v13;
  _UIRoundedRectShadowView *magicShadowView;
  void *v15;
  _UIRoundedRectShadowView *v16;
  UIView *v17;
  void *v18;
  id v19;
  void *v20;
  UIView *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  UIView **v26;
  id WeakRetained;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  UIView *v32;
  void *v33;
  void *v34;
  UIView *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *cornerClippingDescendants;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  objc_super v59;
  _QWORD v60[3];
  UIView *v61;
  _QWORD v62[2];

  v7 = a5;
  v62[1] = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)UIDropShadowView;
  v9 = -[UIView initWithFrame:](&v59, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (!v9)
    return v10;
  v9->_supportsShadow = v7;
  v9->_independentCorners = a4;
  v9->__grabberSpacing = 5.0;
  v9->__grabberBlurEnabled = 1;
  v11 = *MEMORY[0x1E0CD2A68];
  -[UIView layer](v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", v11);

  if (v7)
  {
    v13 = -[_UIRoundedRectShadowView initWithCornerRadius:]([_UIRoundedRectShadowView alloc], "initWithCornerRadius:", 10.0);
    magicShadowView = v10->_magicShadowView;
    v10->_magicShadowView = v13;

    -[UIView setUserInteractionEnabled:](v10->_magicShadowView, "setUserInteractionEnabled:", 0);
    -[UIView layer](v10->_magicShadowView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsHitTesting:", 0);

    -[_UIShadowView setUseLowerIntensity:](v10->_magicShadowView, "setUseLowerIntensity:", 1);
    v16 = v10->_magicShadowView;
    -[UIView bounds](v10, "bounds");
    -[_UIRoundedRectShadowView frameWithContentWithFrame:](v16, "frameWithContentWithFrame:");
    -[UIImageView setFrame:](v10->_magicShadowView, "setFrame:");
    -[UIView setAutoresizingMask:](v10->_magicShadowView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v10, "addSubview:", v10->_magicShadowView);
    v17 = objc_alloc_init(UIView);
    -[UIView setAutoresizingMask:](v17, "setAutoresizingMask:", 18);
    -[UIView layer](v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerCurve:", v11);

    -[UIView addSubview:](v10, "addSubview:", v17);
    objc_storeWeak((id *)&v10->_firstCornerClippingDescendant, v17);

  }
  else
  {
    objc_storeWeak((id *)&v10->_firstCornerClippingDescendant, v10);
  }
  if (a4 == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
    objc_msgSend(WeakRetained, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMaskedCorners:", 1);

    v21 = objc_alloc_init(UIView);
    -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
    -[UIView layer](v21, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerCurve:", v11);

    -[UIView layer](v21, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMaskedCorners:", 4);

    v31 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
    objc_msgSend(v31, "addSubview:", v21);

    v32 = objc_alloc_init(UIView);
    -[UIView setAutoresizingMask:](v32, "setAutoresizingMask:", 18);
    -[UIView layer](v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerCurve:", v11);

    -[UIView layer](v32, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMaskedCorners:", 8);

    -[UIView addSubview:](v21, "addSubview:", v32);
    v35 = objc_alloc_init(UIView);
    -[UIView setAutoresizingMask:](v35, "setAutoresizingMask:", 18);
    -[UIView layer](v35, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCornerCurve:", v11);

    -[UIView layer](v35, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMaskedCorners:", 2);

    -[UIView addSubview:](v32, "addSubview:", v35);
    v60[0] = v21;
    v60[1] = v32;
    v60[2] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
    v38 = objc_claimAutoreleasedReturnValue();
    cornerClippingDescendants = v10->_cornerClippingDescendants;
    v10->_cornerClippingDescendants = (NSArray *)v38;

  }
  else
  {
    if (a4 == 2)
    {
      v40 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      objc_msgSend(v40, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setMaskedCorners:", 3);

      v21 = objc_alloc_init(UIView);
      -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
      -[UIView layer](v21, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setCornerCurve:", v11);

      -[UIView layer](v21, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setMaskedCorners:", 12);

      v44 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      objc_msgSend(v44, "addSubview:", v21);

      v61 = v21;
      v25 = (void *)MEMORY[0x1E0C99D20];
      v26 = &v61;
    }
    else
    {
      if (a4 != 1)
        goto LABEL_13;
      v19 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMaskedCorners:", 5);

      v21 = objc_alloc_init(UIView);
      -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
      -[UIView layer](v21, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCornerCurve:", v11);

      -[UIView layer](v21, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMaskedCorners:", 10);

      v24 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      objc_msgSend(v24, "addSubview:", v21);

      v62[0] = v21;
      v25 = (void *)MEMORY[0x1E0C99D20];
      v26 = (UIView **)v62;
    }
    objc_msgSend(v25, "arrayWithObjects:count:", v26, 1);
    v45 = objc_claimAutoreleasedReturnValue();
    v32 = (UIView *)v10->_cornerClippingDescendants;
    v10->_cornerClippingDescendants = (NSArray *)v45;
  }

LABEL_13:
  v46 = *MEMORY[0x1E0C9D820];
  v47 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UIView layer](v10, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setShadowOffset:", v46, v47);

  -[UIView layer](v10, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setShadowRadius:", 2.0);

  -[UIView layer](v10, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setShadowPathIsBounds:", 1);

  +[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor");
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v52 = objc_msgSend(v51, "CGColor");
  -[UIView layer](v10, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setShadowColor:", v52);

  if (!a6)
  {
    if (dyld_program_sdk_at_least())
    {
      -[UIView layer](v10, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v56 = 13.0;
    }
    else
    {
      if (!dyld_program_sdk_at_least())
      {
LABEL_19:
        -[UIView setClipsToBounds:](v10, "setClipsToBounds:", dyld_program_sdk_at_least());
        +[UIColor lightGrayColor](UIColor, "lightGrayColor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v57);

        return v10;
      }
      -[UIView layer](v10, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v56 = 6.0;
    }
    objc_msgSend(v54, "setCornerRadius:", v56);

    goto LABEL_19;
  }
  return v10;
}

- (void)setOverlayView:(id)a3
{
  UIView *v5;
  UIView **p_overlayView;
  UIView *overlayView;
  void *v8;
  void *v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31[4] = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v5)
  {
    -[UIView superview](overlayView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDropShadowView deepestClippingView](self, "deepestClippingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_overlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayView, a3);
    if (*p_overlayView)
    {
      -[UIDropShadowView deepestClippingView](self, "deepestClippingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", *p_overlayView);

      if (-[UIView translatesAutoresizingMaskIntoConstraints](*p_overlayView, "translatesAutoresizingMaskIntoConstraints"))
      {
        -[UIView bounds](self, "bounds");
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;
        v15 = -CGRectGetWidth(v32);
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        v16 = -CGRectGetHeight(v33);
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v35 = CGRectInset(v34, v15, v16);
        -[UIView setFrame:](*p_overlayView, "setFrame:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
        -[UIView setAutoresizingMask:](*p_overlayView, "setAutoresizingMask:", 18);
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0D156E0];
        -[UIView centerXAnchor](*p_overlayView, "centerXAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self, "centerXAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintEqualToAnchor:", v29);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v28;
        -[UIView centerYAnchor](*p_overlayView, "centerYAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self, "centerYAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v18;
        -[UIView widthAnchor](*p_overlayView, "widthAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView widthAnchor](self, "widthAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", v20, 3.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v21;
        -[UIView heightAnchor](*p_overlayView, "heightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView heightAnchor](self, "heightAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", v23, 3.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31[3] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "activateConstraints:", v25);

      }
    }
  }

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDropShadowView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIDropShadowView updateCornerClippingViews](self, "updateCornerClippingViews");
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
  _BOOL4 v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UIDropShadowView;
  -[UIView layoutSubviews](&v15, sel_layoutSubviews);
  -[UIDropShadowView _layoutGrabbers](self, "_layoutGrabbers");
  if (-[UIDropShadowView _insetsContentViewForGrabber](self, "_insetsContentViewForGrabber"))
  {
    -[UIDropShadowView _contentViewFrame](self, "_contentViewFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIDropShadowView contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setFrameIgnoringLayerTransform:", v4, v6, v8, v10);

  }
  v12 = -[UIDropShadowView _effectiveInsetsContentViewForGrabber](self, "_effectiveInsetsContentViewForGrabber");
  if (v12)
  {
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[UIDropShadowView deepestClippingView](self, "deepestClippingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  if (v12)
}

- (BOOL)_insetsContentViewForGrabber
{
  return self->__insetsContentViewForGrabber;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    -[UIView superview](contentView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDropShadowView deepestClippingView](self, "deepestClippingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      -[UIDropShadowView deepestClippingView](self, "deepestClippingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:atIndex:", *p_contentView, 0);

      if (-[UIView translatesAutoresizingMaskIntoConstraints](*p_contentView, "translatesAutoresizingMaskIntoConstraints"))
      {
        -[UIView bounds](self, "bounds");
        -[UIView setFrame:](*p_contentView, "setFrame:");
        -[UIView setAutoresizingMask:](*p_contentView, "setAutoresizingMask:", 18);
      }
      else
      {
        v20 = (void *)MEMORY[0x1E0D156E0];
        -[UIView leftAnchor](*p_contentView, "leftAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leftAnchor](self, "leftAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v22;
        -[UIView rightAnchor](*p_contentView, "rightAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView rightAnchor](self, "rightAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v12;
        -[UIView topAnchor](*p_contentView, "topAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self, "topAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v15;
        -[UIView bottomAnchor](*p_contentView, "bottomAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self, "bottomAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25[3] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "activateConstraints:", v19);

      }
    }
  }

}

- (void)updateCornerClippingViews
{
  void *v3;
  void *v4;
  void *v5;
  double topLeft;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double bottomRight;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double bottomLeft;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double topRight;
  double v31;
  id v32;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_effectiveUISettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerRadiusConfiguration");
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (-[UIDropShadowView supportsShadow](self, "supportsShadow"))
  {
    topLeft = self->_environmentMatchingCornerRadii.topLeft;
    if (topLeft == 1.79769313e308)
    {
      objc_msgSend(v32, "topLeft");
      topLeft = v7;
    }
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", topLeft);

  }
  switch(-[UIDropShadowView independentCorners](self, "independentCorners"))
  {
    case 0:
      -[UIDropShadowView firstCornerClippingDescendant](self, "firstCornerClippingDescendant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_environmentMatchingCornerRadii.topLeft;
      objc_msgSend(v32, "topLeft");
      setEnvironmentMatchingCornerRadius(v12, self, (uint64_t)&self->_environmentMatchingCornerRadii, v16, v17);
      goto LABEL_9;
    case 1:
    case 2:
      -[UIDropShadowView firstCornerClippingDescendant](self, "firstCornerClippingDescendant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_environmentMatchingCornerRadii.topLeft;
      objc_msgSend(v32, "topLeft");
      setEnvironmentMatchingCornerRadius(v9, self, (uint64_t)&self->_environmentMatchingCornerRadii, v10, v11);

      -[UIDropShadowView cornerClippingDescendants](self, "cornerClippingDescendants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      bottomRight = self->_environmentMatchingCornerRadii.bottomRight;
      objc_msgSend(v32, "bottomRight");
      setEnvironmentMatchingCornerRadius(v13, self, (uint64_t)&self->_environmentMatchingCornerRadii.bottomRight, bottomRight, v15);

      goto LABEL_9;
    case 3:
      -[UIDropShadowView firstCornerClippingDescendant](self, "firstCornerClippingDescendant");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_environmentMatchingCornerRadii.topLeft;
      objc_msgSend(v32, "topLeft");
      setEnvironmentMatchingCornerRadius(v18, self, (uint64_t)&self->_environmentMatchingCornerRadii, v19, v20);

      -[UIDropShadowView cornerClippingDescendants](self, "cornerClippingDescendants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      bottomLeft = self->_environmentMatchingCornerRadii.bottomLeft;
      objc_msgSend(v32, "bottomLeft");
      setEnvironmentMatchingCornerRadius(v22, self, (uint64_t)&self->_environmentMatchingCornerRadii.bottomLeft, bottomLeft, v24);

      -[UIDropShadowView cornerClippingDescendants](self, "cornerClippingDescendants");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = self->_environmentMatchingCornerRadii.bottomRight;
      objc_msgSend(v32, "bottomRight");
      setEnvironmentMatchingCornerRadius(v26, self, (uint64_t)&self->_environmentMatchingCornerRadii.bottomRight, v27, v28);

      -[UIDropShadowView cornerClippingDescendants](self, "cornerClippingDescendants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      topRight = self->_environmentMatchingCornerRadii.topRight;
      objc_msgSend(v32, "topRight");
      setEnvironmentMatchingCornerRadius(v29, self, (uint64_t)&self->_environmentMatchingCornerRadii.topRight, topRight, v31);

LABEL_9:
      break;
    default:
      break;
  }

}

- (UIView)deepestClippingView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIDropShadowView cornerClippingDescendants](self, "cornerClippingDescendants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIDropShadowView firstCornerClippingDescendant](self, "firstCornerClippingDescendant");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (UIView *)v7;
}

- (UIView)firstCornerClippingDescendant
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_firstCornerClippingDescendant);
}

- (NSArray)cornerClippingDescendants
{
  return self->_cornerClippingDescendants;
}

- (BOOL)supportsShadow
{
  return self->_supportsShadow;
}

- (int64_t)independentCorners
{
  return self->_independentCorners;
}

- (void)_layoutGrabbers
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MidX;
  _BOOL8 v17;
  _BOOL8 v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  if (-[UIDropShadowView _hasCreatedGrabbers](self, "_hasCreatedGrabbers"))
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = -[UIDropShadowView _grabberEdge](self, "_grabberEdge");
    -[UIDropShadowView _grabberAlpha](self, "_grabberAlpha");
    v13 = v12;
    -[UIDropShadowView _grabberSpacing](self, "_grabberSpacing");
    v15 = v14;
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    MidX = CGRectGetMidX(v26);
    v17 = -[UIDropShadowView _isGrabberLumaTrackingEnabled](self, "_isGrabberLumaTrackingEnabled");
    v18 = -[UIDropShadowView _isGrabberBlurEnabled](self, "_isGrabberBlurEnabled");
    -[UIDropShadowView _topGrabber](self, "_topGrabber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    if (v11)
      v20 = 0.0;
    else
      v20 = v13;
    objc_msgSend(v19, "setAlpha:", v20);
    objc_msgSend(v25, "sizeToFit");
    objc_msgSend(v25, "bounds");
    objc_msgSend(v25, "setCenter:", MidX, v15 + CGRectGetHeight(v27) * 0.5);
    objc_msgSend(v25, "_setLumaTrackingEnabled:", v17);
    objc_msgSend(v25, "_setBlurEnabled:", v18);
    -[UIDropShadowView _bottomGrabber](self, "_bottomGrabber");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v11 == 1)
      v23 = v13;
    else
      v23 = 0.0;
    objc_msgSend(v21, "setAlpha:", v23);
    objc_msgSend(v22, "sizeToFit");
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    v24 = CGRectGetHeight(v28) - v15;
    objc_msgSend(v22, "bounds");
    objc_msgSend(v22, "setCenter:", MidX, v24 - CGRectGetHeight(v29) * 0.5);
    objc_msgSend(v22, "_setLumaTrackingEnabled:", v17);
    objc_msgSend(v22, "_setBlurEnabled:", v18);

  }
}

- (BOOL)_hasCreatedGrabbers
{
  return self->__topGrabber || self->__bottomGrabber != 0;
}

- (BOOL)_effectiveInsetsContentViewForGrabber
{
  _BOOL4 v3;

  v3 = -[UIDropShadowView _insetsContentViewForGrabber](self, "_insetsContentViewForGrabber");
  if (v3)
    LOBYTE(v3) = -[UIDropShadowView _hasGrabber](self, "_hasGrabber");
  return v3;
}

- (void)_setGrabberLumaTrackingEnabled:(BOOL)a3
{
  if (self->__grabberLumaTrackingEnabled != a3)
  {
    self->__grabberLumaTrackingEnabled = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magicShadowView, 0);
  objc_storeStrong((id *)&self->__bottomGrabber, 0);
  objc_storeStrong((id *)&self->__topGrabber, 0);
  objc_storeStrong((id *)&self->_cornerClippingDescendants, 0);
  objc_destroyWeak((id *)&self->_firstCornerClippingDescendant);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (CGRect)_contentViewFrame
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
  int64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[UIDropShadowView _effectiveInsetsContentViewForGrabber](self, "_effectiveInsetsContentViewForGrabber"))
  {
    -[UIDropShadowView _grabberSpacing](self, "_grabberSpacing");
    v12 = v11 + v11;
    -[UIView safeAreaInsets](self, "safeAreaInsets");
    v14 = v13;
    v16 = v15;
    v17 = -[UIDropShadowView _grabberEdge](self, "_grabberEdge");
    if (v17 == 1)
    {
      -[UIDropShadowView _bottomGrabber](self, "_bottomGrabber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v18 = v12 + v16 + CGRectGetHeight(v26);
      v19 = 0.0;
    }
    else
    {
      v18 = 0.0;
      v19 = 0.0;
      if (v17)
      {
LABEL_7:
        v4 = v4 + 0.0;
        v6 = v6 + v19;
        v10 = v10 - (v18 + v19);
        goto LABEL_8;
      }
      -[UIDropShadowView _topGrabber](self, "_topGrabber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v19 = v12 + v14 + CGRectGetHeight(v25);
    }

    goto LABEL_7;
  }
LABEL_8:
  v21 = v4;
  v22 = v6;
  v23 = v8;
  v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

uint64_t __35__UIDropShadowView__setHasGrabber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutGrabbers");
}

- (void)_setGrabberBlurEnabled:(BOOL)a3
{
  if (self->__grabberBlurEnabled != a3)
  {
    self->__grabberBlurEnabled = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_isGrabber:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[UIDropShadowView _topGrabber](self, "_topGrabber");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    -[UIDropShadowView _bottomGrabber](self, "_bottomGrabber");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  return v7;
}

- (void)_grabberPrimaryAction
{
  id v3;

  -[UIDropShadowView _delegate](self, "_delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_dropShadowViewGrabberDidTriggerPrimaryAction:", self);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIDropShadowView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIDropShadowView *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  BOOL v31;
  objc_super v33;
  CGPoint v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIDropShadowView _topGrabber](self, "_topGrabber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  objc_msgSend(v8, "hitTest:withEvent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    -[UIDropShadowView _bottomGrabber](self, "_bottomGrabber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
    objc_msgSend(v12, "hitTest:withEvent:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v11 = v13;
LABEL_12:

      goto LABEL_13;
    }
    v33.receiver = self;
    v33.super_class = (Class)UIDropShadowView;
    -[UIView hitTest:withEvent:](&v33, sel_hitTest_withEvent_, v7, x, y);
    v15 = (UIDropShadowView *)objc_claimAutoreleasedReturnValue();
    if (v15 == self)
      goto LABEL_8;
    -[UIDropShadowView contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIView isDescendantOfView:](v15, "isDescendantOfView:", v16))
    {
      -[UIView bounds](self, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[UIDropShadowView contentTouchInsets](self, "contentTouchInsets");
      v26 = v20 + v25;
      v29 = v22 - (v27 + v28);
      v35.size.height = v24 - (v25 + v30);
      v35.origin.x = v18 + v27;
      v35.origin.y = v26;
      v35.size.width = v29;
      v34.x = x;
      v34.y = y;
      v31 = CGRectContainsPoint(v35, v34);

      if (!v31)
      {
LABEL_8:
        v11 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {

    }
    v11 = v15;
    goto LABEL_11;
  }
  v11 = v9;
LABEL_13:

  return v11;
}

- (void)setMasksTopCornersOnly:(BOOL)a3
{
  uint64_t v3;
  id v4;

  self->_masksTopCornersOnly = a3;
  if (a3)
    v3 = 3;
  else
    v3 = 15;
  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", v3);

}

- (void)willBeginRotationWithOriginalBounds:(CGRect)a3 newBounds:(CGRect)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3.size.width == a4.size.width && a3.size.height == a4.size.height)
  {
    -[UIView layer](self->_contentView, "layer", a3.origin.x, a3.origin.y);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_graphicsQuality");

    if (v6 != 100)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      objc_msgSend(v8, "setRasterizationScale:");

      objc_msgSend(v8, "setShouldRasterize:", 1);
    }
    objc_msgSend(v8, "setFrozen:", 1);

  }
}

- (void)didFinishRotation
{
  id v2;

  -[UIView layer](self->_contentView, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrozen:", 0);
  objc_msgSend(v2, "setShouldRasterize:", 0);

}

- (UIRectCornerRadii)environmentMatchingCornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->_environmentMatchingCornerRadii.topLeft;
  bottomLeft = self->_environmentMatchingCornerRadii.bottomLeft;
  bottomRight = self->_environmentMatchingCornerRadii.bottomRight;
  topRight = self->_environmentMatchingCornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)_hasGrabber
{
  return self->__hasGrabber;
}

- (double)_grabberAlpha
{
  return self->__grabberAlpha;
}

- (double)_grabberSpacing
{
  return self->__grabberSpacing;
}

- (int64_t)_grabberEdge
{
  return self->__grabberEdge;
}

- (BOOL)_isGrabberLumaTrackingEnabled
{
  return self->__grabberLumaTrackingEnabled;
}

- (BOOL)_isGrabberBlurEnabled
{
  return self->__grabberBlurEnabled;
}

- (UIEdgeInsets)contentTouchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentTouchInsets.top;
  left = self->_contentTouchInsets.left;
  bottom = self->_contentTouchInsets.bottom;
  right = self->_contentTouchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIDropShadowViewDelegate)_delegate
{
  return (UIDropShadowViewDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (BOOL)masksTopCornersOnly
{
  return self->_masksTopCornersOnly;
}

- (_UIGrabber)_topGrabber
{
  return self->__topGrabber;
}

- (_UIGrabber)_bottomGrabber
{
  return self->__bottomGrabber;
}

@end
