@implementation TLKButton

- (TLKButton)init
{
  TLKButton *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TLKButton;
  v2 = -[TLKButton init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TLKButton setBackgroundView:](v2, "setBackgroundView:", v3);

    -[TLKButton backgroundView](v2, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKButton addSubview:](v2, "addSubview:", v4);

    v5 = (void *)objc_opt_new();
    -[TLKButton setImageView:](v2, "setImageView:", v5);

    -[TLKButton imageView](v2, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKButton addSubview:](v2, "addSubview:", v6);

    +[TLKTapContainerButton buttonWithType:](TLKTapContainerButton, "buttonWithType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKButton setButton:](v2, "setButton:", v7);

    -[TLKButton button](v2, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKButton addSubview:](v2, "addSubview:", v8);

    -[TLKButton setToggled:](v2, "setToggled:", 0);
  }
  return v2;
}

- (UIImage)imageOnImageView
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKButton;
  -[TLKButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKButton;
  -[TLKButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIImage *v14;
  void *v15;
  void *v16;
  void *v17;
  UIImage *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  UIImage *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)TLKButton;
  v4 = a3;
  -[UIView tlk_updateForAppearance:](&v35, sel_tlk_updateForAppearance_, v4);
  -[TLKButton setButtonSelectionState:](self, "setButtonSelectionState:", -[TLKButton isToggled](self, "isToggled"));
  if (self->_overlayImage)
  {
    -[TLKButton backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableAppearanceForView:", v5);

    -[TLKButton intrinsicContentSize](self, "intrinsicContentSize");
    v7 = v6;
    v9 = v8;
    -[UIImage size](self->_overlayImage, "size");
    v11 = v10;
    v13 = v12;
    v14 = self->_overlayImage;
    -[TLKButton imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProminence:", 1);

    +[TLKAppearance appearanceWithStyle:](TLKAppearance, "appearanceWithStyle:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKButton imageView](self, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "overrideAppearanceForView:", v17);

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __37__TLKButton_tlk_updateForAppearance___block_invoke;
    v29[3] = &unk_1E5C07100;
    v31 = v7;
    v32 = v9;
    v33 = v11;
    v34 = v13;
    v29[4] = self;
    v30 = v14;
    v18 = v14;
    +[TLKUtilities dispatchAsyncIfNecessary:](TLKUtilities, "dispatchAsyncIfNecessary:", v29);

  }
  else
  {
    -[TLKButton imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKAppearance disableAppearanceOverrideForView:](TLKAppearance, "disableAppearanceOverrideForView:", v19);

    objc_msgSend(v4, "quaternaryColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKButton backgroundView](self, "backgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);

    -[TLKButton backgroundView](self, "backgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableAppearanceForView:", v22);

    v23 = objc_msgSend(v4, "isDark") ^ 1;
    -[TLKButton imageView](self, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProminence:", v23);

    -[TLKButton _updateInnerProgressLayerStroke](self, "_updateInnerProgressLayerStroke");
    -[TLKButton updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
    -[TLKButton button](self, "button");
    v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableAppearanceForContainer:", v18);

  }
  -[TLKButton intrinsicContentSize](self, "intrinsicContentSize");
  v26 = v25 * 0.5;
  -[TLKButton backgroundView](self, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerRadius:", v26);

}

void __37__TLKButton_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "overlayImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = (*(double *)(a1 + 64) - v4) * 0.5;
  *(float *)&v6 = v6;
  v7 = (*(double *)(a1 + 72) - v5) * 0.5;
  *(float *)&v7 = v7;
  objc_msgSend(v2, "blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:", v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__TLKButton_tlk_updateForAppearance___block_invoke_2;
  v12[3] = &unk_1E5C06FF0;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v10;
  v15 = v8;
  v11 = v8;
  +[TLKUtilities dispatchMainIfNecessary:](TLKUtilities, "dispatchMainIfNecessary:", v12);

}

void __37__TLKButton_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "overlayImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (void)setOverlayImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (v5 && self->_overlayImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overlayImage, a3);
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    -[TLKButton setButtonSelectionState:](self, "setButtonSelectionState:", -[TLKButton isToggled](self, "isToggled"));
    v5 = v6;
  }

}

- (void)setToggled:(BOOL)a3
{
  -[TLKButton showPlayIndicator:](self, "showPlayIndicator:", !a3);
}

- (void)setContainerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TLKButton button](self, "button");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContainerView:", v4);

}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[TLKButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  -[TLKButton fixedSize](self, "fixedSize");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[TLKButton toggledImage](self, "toggledImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

    -[TLKButton untoggledImage](self, "untoggledImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;
    v17 = v16;

    if (v10 >= v12)
      v18 = v10;
    else
      v18 = v12;
    if (v15 >= v17)
      v19 = v15;
    else
      v19 = v17;
    if (v18 < v19)
      v18 = v19;
    v20 = ceil(v18);
    v7 = v20 + v20;
    v6 = v20 + v20;
  }
  else
  {
    -[TLKButton fixedSize](self, "fixedSize");
  }
  result.height = v7;
  result.width = v6;
  return result;
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)TLKButton;
  -[TLKButton layoutSubviews](&v21, sel_layoutSubviews);
  -[TLKButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKButton backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TLKButton button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[TLKButton imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intrinsicContentSize");
  v15 = v14;
  v17 = v16;

  -[TLKButton bounds](self, "bounds");
  v18 = CGRectGetMidX(v22) - v15 * 0.5;
  -[TLKButton bounds](self, "bounds");
  v19 = CGRectGetMidY(v23) - v17 * 0.5;
  -[TLKButton imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v18, v19, v15, v17);

}

- (void)hideProgressAnimated:(BOOL)a3
{
  void *v4;
  void *v5;

  -[TLKButton _outerProgressLayer](self, "_outerProgressLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[TLKButton _innerProgressLayer](self, "_innerProgressLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  if (self->_indeterminate)
  {
    -[TLKButton endIndeterminateAnimation](self, "endIndeterminateAnimation");
    -[TLKButton setButtonSelectionState:](self, "setButtonSelectionState:", 0);
  }
}

- (void)setButtonSelectionState:(BOOL)a3
{
  _BOOL4 v3;
  TLKImage *v5;
  int *v6;
  void *v7;
  TLKImage *v8;

  v3 = a3;
  v5 = [TLKImage alloc];
  v6 = &OBJC_IVAR___TLKButton__untoggledImage;
  if (v3)
    v6 = &OBJC_IVAR___TLKButton__toggledImage;
  v8 = -[TLKImage initWithImage:](v5, "initWithImage:", *(Class *)((char *)&self->super.super.super.isa + *v6));
  self->_toggled = v3;
  -[TLKButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTlkImage:", v8);

  -[TLKButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[TLKButton setNeedsLayout](self, "setNeedsLayout");

}

- (void)showPlayIndicator:(BOOL)a3
{
  -[TLKButton setButtonSelectionState:](self, "setButtonSelectionState:", !a3);
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[TLKButton showPlayIndicator:](self, "showPlayIndicator:", 0);
  -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[TLKButton _innerProgressLayer](self, "_innerProgressLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921 && self->_indeterminate)
      -[TLKButton endIndeterminateAnimation](self, "endIndeterminateAnimation");
    self->_progress = fmax(fmin(a3, 1.0), 0.0);
    -[TLKButton _innerProgressLayer](self, "_innerProgressLayer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[TLKButton outerProgressLayer](self, "outerProgressLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllAnimations");

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDuration:", 0.2);
      objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v10, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_progress);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToValue:", v11);

      objc_msgSend(v12, "addAnimation:forKey:", v10, 0);
    }
    else
    {
      objc_msgSend(v12, "removeAllAnimations");
      objc_msgSend(v12, "setStrokeEnd:", self->_progress);
    }

  }
}

- (void)beginIndeterminateAnimation
{
  double v2;
  CAShapeLayer *outerProgressLayer;
  void *v5;
  uint64_t v6;
  void *v7;

  LODWORD(v2) = 0;
  -[TLKButton setProgress:animated:](self, "setProgress:animated:", 0, v2);
  outerProgressLayer = self->_outerProgressLayer;
  if (self->_indeterminate)
  {
    -[CAShapeLayer animationKeys](outerProgressLayer, "animationKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      return;
  }
  else
  {
    -[CAShapeLayer setStrokeStart:](outerProgressLayer, "setStrokeStart:", 0.119999997);
    self->_indeterminate = 1;
  }
  -[TLKButton window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[TLKButton _beginIndeterminateAnimation](self, "_beginIndeterminateAnimation");
}

- (void)endIndeterminateAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGAffineTransform v7;

  if (self->_indeterminate)
  {
    -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStrokeStart:", 0.0);
    objc_msgSend(v3, "removeAllAnimations");
    -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeRotation(&v7, -1.57079633);
    objc_msgSend(v4, "setAffineTransform:", &v7);

    self->_indeterminate = 0;
    -[TLKButton updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
    -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[TLKButton _innerProgressLayer](self, "_innerProgressLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

  }
}

- (void)_beginIndeterminateAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  CATransform3D v17;
  CGAffineTransform v18;
  CATransform3D v19;
  CGAffineTransform m;
  CATransform3D v21;
  CGAffineTransform v22;

  -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[TLKButton _innerProgressLayer](self, "_innerProgressLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[TLKButton updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
  -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[TLKButton _outerProgressLayer](self, "_outerProgressLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeRotation(&v22, -1.57079633);
  objc_msgSend(v6, "setAffineTransform:", &v22);

  v7 = (void *)objc_opt_new();
  v8 = 0.0;
  v9 = 4;
  do
  {
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeRotation(&m, v8 * 3.14159265 * 0.5);
    CATransform3DMakeAffineTransform(&v21, &m);
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeRotation(&v18, (v8 + -1.0) * 3.14159265 * 0.5);
    CATransform3DMakeAffineTransform(&v19, &v18);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", v11);

    v17 = v21;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setToValue:", v12);

    objc_msgSend(v10, "setDuration:", 0.25);
    objc_msgSend(v10, "setBeginTime:", v8 * 0.25);
    objc_msgSend(v7, "addObject:", v10);

    v8 = v8 + 1.0;
    --v9;
  }
  while (v9);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDuration:", 1.0);
  LODWORD(v14) = 2139095039;
  objc_msgSend(v13, "setRepeatCount:", v14);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimingFunction:", v15);

  objc_msgSend(v13, "setAnimations:", v7);
  -[TLKButton outerProgressLayer](self, "outerProgressLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v13, 0);

}

- (id)_outerProgressLayer
{
  CAShapeLayer *outerProgressLayer;
  double v4;
  double v5;
  CAShapeLayer *v6;
  CAShapeLayer *v7;
  CAShapeLayer *v8;
  id v9;
  CAShapeLayer *v10;
  id v11;
  CAShapeLayer *innerProgressLayer;
  void *v13;
  void *v14;
  void *v15;
  CAShapeLayer *v16;

  outerProgressLayer = self->_outerProgressLayer;
  if (!outerProgressLayer)
  {
    -[TLKButton intrinsicContentSize](self, "intrinsicContentSize");
    v6 = -[TLKButton _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 1.5);
    v7 = self->_outerProgressLayer;
    self->_outerProgressLayer = v6;

    v8 = self->_outerProgressLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

    v10 = self->_outerProgressLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    innerProgressLayer = self->_innerProgressLayer;
    -[TLKButton button](self, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = self->_outerProgressLayer;
    if (innerProgressLayer)
      objc_msgSend(v14, "insertSublayer:below:", v16, self->_innerProgressLayer);
    else
      objc_msgSend(v14, "addSublayer:", v16);

    -[TLKButton updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
    outerProgressLayer = self->_outerProgressLayer;
  }
  return outerProgressLayer;
}

- (id)_innerProgressLayer
{
  CAShapeLayer *innerProgressLayer;
  double v4;
  double v5;
  CAShapeLayer *v6;
  CAShapeLayer *v7;
  CAShapeLayer *v8;
  id v9;
  void *v10;
  CAShapeLayer *v11;
  id v12;
  void *v13;
  void *v14;

  innerProgressLayer = self->_innerProgressLayer;
  if (!innerProgressLayer)
  {
    -[TLKButton intrinsicContentSize](self, "intrinsicContentSize");
    v6 = -[TLKButton _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 2.0);
    v7 = self->_innerProgressLayer;
    self->_innerProgressLayer = v6;

    v8 = self->_innerProgressLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = self->_innerProgressLayer;
    objc_msgSend(v10, "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v11, "setFillColor:", objc_msgSend(v12, "CGColor"));

    -[CAShapeLayer setStrokeEnd:](v11, "setStrokeEnd:", 0.0);
    -[TLKButton button](self, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", self->_innerProgressLayer);

    -[TLKButton _updateInnerProgressLayerStroke](self, "_updateInnerProgressLayerStroke");
    innerProgressLayer = self->_innerProgressLayer;
  }
  return innerProgressLayer;
}

- (void)updateOuterProgressLayerStroke
{
  void *v3;
  CAShapeLayer *outerProgressLayer;
  CAShapeLayer *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TLKButton iconColor](self, "iconColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  outerProgressLayer = self->_outerProgressLayer;
  v9 = objc_retainAutorelease(v3);
  -[CAShapeLayer setStrokeColor:](outerProgressLayer, "setStrokeColor:", objc_msgSend(v9, "CGColor"));
  v5 = self->_outerProgressLayer;
  -[TLKButton backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compositingFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setCompositingFilter:](v5, "setCompositingFilter:", v8);

}

- (void)_updateInnerProgressLayerStroke
{
  void *v3;
  CAShapeLayer *innerProgressLayer;
  CAShapeLayer *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TLKButton iconColor](self, "iconColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  innerProgressLayer = self->_innerProgressLayer;
  v9 = objc_retainAutorelease(v3);
  -[CAShapeLayer setStrokeColor:](innerProgressLayer, "setStrokeColor:", objc_msgSend(v9, "CGColor"));
  v5 = self->_innerProgressLayer;
  -[TLKButton backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compositingFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setCompositingFilter:](v5, "setCompositingFilter:", v8);

}

- (id)iconColor
{
  void *v2;
  void *v3;

  +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorForProminence:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  double x;
  double y;
  double width;
  double height;
  void *v9;
  id v10;
  const CGPath *v11;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;

  v14 = CGRectInset(a3, a4 * 0.5, a4 * 0.5);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  CGAffineTransformMakeRotation(&v13, -1.57079633);
  objc_msgSend(v9, "setAffineTransform:", &v13);
  v10 = v9;
  objc_msgSend(v10, "setLineWidth:", a4);
  objc_msgSend(v10, "bounds");
  v11 = CGPathCreateWithEllipseInRect(v15, 0);
  objc_msgSend(v10, "setPath:", v11);
  objc_msgSend(v10, "setLineCap:", CFSTR("round"));
  CGPathRelease(v11);

  return v10;
}

- (void)addTarget:(id)a3 forAction:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TLKButton button](self, "button");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

+ (id)blurColorForImage:(id)a3 forButtonSize:(CGSize)a4 withOffsetRight:(float)a5 withOffsetBottom:(float)a6
{
  double width;
  id v10;
  CGImage *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGImage *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  CGRect v25;
  CGRect v26;

  width = a4.width;
  v10 = objc_retainAutorelease(a3);
  v11 = (CGImage *)objc_msgSend(v10, "CGImage");
  objc_msgSend(v10, "scale");
  v13 = v12;
  objc_msgSend(v10, "size");
  v15 = v13 * v14;
  objc_msgSend(v10, "size");
  v17 = v16;

  v18 = width * v13;
  v25.origin.x = v15 - a5 * v13 - v18;
  v25.origin.y = v13 * v17 - a6 * v13 - v18;
  v25.size.width = v18;
  v25.size.height = v18;
  v26 = CGRectIntegral(v25);
  v19 = CGImageCreateWithImageInRect(v11, v26);
  v24 = 0u;
  v20 = (void *)objc_opt_class();
  if (v20)
    objc_msgSend(v20, "_calculateStatistics:withSize:", v19, v18, v18);
  else
    v24 = 0u;
  CGImageRelease(v19);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v24, 0.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blurColorForColor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)blurColorForColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;

  v3 = a3;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0;
  v9 = 0;
  v4 = v3;
  if (objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8))
  {
    v10 = v10 * 1.8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.980392157, 0.78);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_colorBlendedWithColor:compositingFilter:", v6, *MEMORY[0x1E0CD2ED8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4
{
  double height;
  double width;
  size_t v9;
  size_t v10;
  size_t v11;
  void *v12;
  CGColorSpace *DeviceRGB;
  CGContext *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  size_t v26;
  uint64_t v27;
  size_t v28;
  unsigned __int8 *v29;
  size_t i;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  double v44;
  double v45;
  double v46;
  $8452678F12DBC466148836A9D382CAFC *result;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGRect v57;

  height = a5.height;
  width = a5.width;
  v9 = (unint64_t)a5.width;
  v10 = (unint64_t)a5.height;
  v11 = 4 * (unint64_t)a5.width;
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v12 = malloc_type_malloc(v11 * (unint64_t)a5.height, 0xB4BEC89DuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v14 = CGBitmapContextCreate(v12, v9, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v57.size.width = (double)(unint64_t)width;
  v57.size.height = (double)(unint64_t)height;
  v57.origin.x = 0.0;
  v57.origin.y = 0.0;
  CGContextDrawImage(v14, v57, a4);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 1;
  do
  {
    v25 = v24;
    v26 = qword_1AC789AA0[v15];
    if (v26 < v10)
    {
      v27 = (uint64_t)v12 + (v11 + 4) * v26 + 3;
      v28 = v26;
      do
      {
        v29 = (unsigned __int8 *)v27;
        for (i = v26; i < v9; v29 += 4 * v26)
        {
          v31 = *(v29 - 3);
          v23 += v31;
          v32 = *(v29 - 2);
          v22 += v32;
          v33 = *(v29 - 1);
          v21 += v33;
          v20 += *v29;
          v19 += (v31 * v31);
          v18 += (v32 * v32);
          v17 += (v33 * v33);
          ++v16;
          i += v26;
        }
        v28 += v26;
        v27 += v11 * v26;
      }
      while (v28 < v10);
    }
    v24 = 0;
    v15 = 1;
  }
  while ((v25 & 1) != 0);
  if (v16 <= 1)
    v16 = 1;
  v34 = 1.0 / (double)v16;
  v35 = (unint64_t)(v34 * (double)v23);
  v36 = (unint64_t)(v34 * (double)v22);
  v37 = (unint64_t)(v34 * (double)v21);
  v38 = fmax(-((double)(v35 * v35) - (double)v19 * v34), 0.0);
  v39 = sqrtf(v38);
  v40 = fmax(-((double)(v36 * v36) - (double)v18 * v34), 0.0);
  v41 = sqrtf(v40);
  v42 = fmax(-((double)(v37 * v37) - (double)v17 * v34), 0.0);
  v43 = sqrtf(v42);
  v55 = 0.0;
  v56 = 0.0;
  v54 = 0.0;
  v51 = 0.0;
  v52 = 0.0;
  v44 = (double)v35 * 0.00392156863;
  v45 = (double)v36 * 0.00392156863;
  v46 = (double)v37 * 0.00392156863;
  __SK_RGBtoHSV(&v56, &v55, &v54, v44, v45, v46);
  __SK_RGBtoHSV(&v53, &v52, &v51, v39 * 0.00392156863, v41 * 0.00392156863, v43 * 0.00392156863);
  free(v12);
  retstr->var0 = v44;
  retstr->var1 = v45;
  retstr->var2 = v46;
  retstr->var3 = v56;
  v48 = v54;
  retstr->var4 = v55;
  retstr->var5 = v48;
  v49 = v52;
  v50 = v51;
  retstr->var6 = (double)(unint64_t)(v34 * (double)v20) * 0.00392156863;
  retstr->var7 = v50;
  retstr->var8 = v49;
  return result;
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (UIImage)untoggledImage
{
  return self->_untoggledImage;
}

- (void)setUntoggledImage:(id)a3
{
  objc_storeStrong((id *)&self->_untoggledImage, a3);
}

- (UIImage)toggledImage
{
  return self->_toggledImage;
}

- (void)setToggledImage:(id)a3
{
  objc_storeStrong((id *)&self->_toggledImage, a3);
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (CGSize)fixedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fixedSize.width;
  height = self->_fixedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFixedSize:(CGSize)a3
{
  self->_fixedSize = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (TLKTapContainerButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (CAShapeLayer)outerProgressLayer
{
  return self->_outerProgressLayer;
}

- (void)setOuterProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerProgressLayer, a3);
}

- (CAShapeLayer)innerProgressLayer
{
  return self->_innerProgressLayer;
}

- (void)setInnerProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerProgressLayer, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_innerProgressLayer, 0);
  objc_storeStrong((id *)&self->_outerProgressLayer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_toggledImage, 0);
  objc_storeStrong((id *)&self->_untoggledImage, 0);
}

@end
