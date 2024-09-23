@implementation PKContinuousButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_updateColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[PKContinuousButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[PKContinuousButton traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__PKContinuousButton__updateColor__block_invoke;
  v9[3] = &unk_1E3E61388;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  PKUIPerformWithEffectiveTraitCollection(v7, v9);

  -[PKContinuousButton _updateTitleColor](self, "_updateTitleColor");
}

void __34__PKContinuousButton__updateColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  CGColor *v3;
  void *v4;
  CGColor *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  switch(*(_QWORD *)(v1 + 768))
  {
    case 0:
      v3 = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setStrokeColor:", v3);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 872);
      v5 = 0;
      goto LABEL_8;
    case 1:
      v3 = CGColorRetain((CGColorRef)objc_msgSend(*(id *)(v1 + 808), "CGColor"));
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v3 = CGColorRetain((CGColorRef)objc_msgSend(v6, "CGColor"));

      }
      goto LABEL_7;
    case 2:
      v3 = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
LABEL_7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setStrokeColor:", v3);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 872);
      v5 = v3;
LABEL_8:
      objc_msgSend(v4, "setFillColor:", v5);
      CGColorRelease(v3);
      break;
    case 3:
    case 4:
      objc_msgSend(*(id *)(v1 + 872), "setStrokeColor:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setFillColor:", 0);
      break;
    default:
      return;
  }
}

- (void)_updateTitleColor
{
  UIColor *overrideTitleColor;
  UIColor *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIColor *v8;
  void *v9;
  UIColor *v10;
  UIColor *v11;

  overrideTitleColor = self->_overrideTitleColor;
  if (overrideTitleColor)
  {
    v4 = overrideTitleColor;
  }
  else
  {
    switch(self->_configuration.style)
    {
      case 0:
      case 1:
      case 4:
        -[PKContinuousButton tintColor](self, "tintColor");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 2:
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 3:
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v4 = (UIColor *)v5;
        if (!v5)
          goto LABEL_8;
        break;
      default:
LABEL_8:
        -[PKContinuousButton tintColor](self, "tintColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = v6;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
        }
        v4 = v8;

        break;
    }
  }
  v11 = v4;
  -[PKContinuousButton setTitleColor:forState:](self, "setTitleColor:forState:", v11, 0);
  v9 = v11;
  if (self->_configuration.highlightEffect == 2)
  {
    v9 = v11;
    if ((unint64_t)(self->_configuration.style - 1) <= 1)
    {
      -[UIColor colorWithAlphaComponent:](v11, "colorWithAlphaComponent:", 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[PKContinuousButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 4);
  -[PKContinuousButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 1);
  -[PKContinuousButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 5);
  if (self->_configuration.disabledEffect != self->_configuration.highlightEffect)
  {
    v10 = v11;

    if (self->_configuration.disabledEffect == 2 && (unint64_t)(self->_configuration.style - 1) <= 1)
    {
      -[UIColor colorWithAlphaComponent:](v10, "colorWithAlphaComponent:", 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v10;
    }
  }
  -[PKContinuousButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 2);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  $F83FDD48ACA6A2FD47999B958F960C73 *p_configuration;
  int64_t shape;
  void *v16;
  CAShapeLayer *layer;
  double cornerRadius;
  _UIBackdropView *backdropView;
  void *v20;
  void *v21;
  id v22;
  _UIBackdropView *v23;
  void *v24;
  void *v25;
  UIActivityIndicatorView *activityIndicatorView;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton layoutSubviews](&v28, sel_layoutSubviews);
  -[PKContinuousButton bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  if (v3 == self->_boundsSize.width && v4 == self->_boundsSize.height)
    goto LABEL_18;
  v10 = v3;
  v11 = v4;
  self->_boundsSize.width = v3;
  self->_boundsSize.height = v4;
  -[CAShapeLayer lineWidth](self->_layer, "lineWidth");
  v13 = v12 * 0.5;
  p_configuration = &self->_configuration;
  shape = self->_configuration.shape;
  switch(shape)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithPillRect:cornerRadius:", v6 + v13, v8 + v13, v10 - (v13 + v13), v11 - (v13 + v13), v11 * 0.5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setCornerCurve:](self->_layer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      layer = self->_layer;
      cornerRadius = v11 * 0.5;
      goto LABEL_12;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithPillRect:cornerRadius:", v6 + v13, v8 + v13, v10 - (v13 + v13), v11 - (v13 + v13), p_configuration->cornerRadius);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setCornerCurve:](self->_layer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      layer = self->_layer;
      cornerRadius = p_configuration->cornerRadius;
      goto LABEL_12;
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v6 + v13, v8 + v13, v10 - (v13 + v13), v11 - (v13 + v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setCornerCurve:](self->_layer, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
      layer = self->_layer;
      cornerRadius = fmin(v10, v11) * 0.5;
LABEL_12:
      -[CAShapeLayer setCornerRadius:](layer, "setCornerRadius:", cornerRadius);
      goto LABEL_14;
  }
  v16 = 0;
LABEL_14:
  backdropView = self->_backdropView;
  if (backdropView)
  {
    -[_UIBackdropView superview](backdropView, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[PKContinuousButton _backgroundView](self, "_backgroundView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", self->_backdropView);

    }
  }
  v22 = objc_retainAutorelease(v16);
  -[CAShapeLayer setPath:](self->_layer, "setPath:", objc_msgSend(v22, "CGPath"));

LABEL_18:
  v23 = self->_backdropView;
  if (v23)
  {
    -[PKContinuousButton _backgroundView](self, "_backgroundView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    -[_UIBackdropView setFrame:](v23, "setFrame:");

  }
  -[UIActivityIndicatorView superview](self->_activityIndicatorView, "superview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    activityIndicatorView = self->_activityIndicatorView;
    -[PKContinuousButton titleLabel](self, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "center");
    -[UIActivityIndicatorView setCenter:](activityIndicatorView, "setCenter:");

  }
}

- (PKContinuousButton)initWithConfiguration:(id *)a3
{
  PKContinuousButton *v4;
  PKContinuousButton *v5;
  int64_t var4;
  __int128 v7;
  uint64_t v8;
  _UIBackdropView *backdropView;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIColor *normalInputColor;
  uint64_t v15;
  UIColor *highlightInputColor;
  uint64_t v17;
  UIColor *disabledInputColor;
  uint64_t v19;
  UIColor *activityIndicatorColor;
  uint64_t v21;
  CAShapeLayer *layer;
  void *v23;
  id v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKContinuousButton;
  v4 = -[PKContinuousButton initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[PKContinuousButton setOpaque:](v4, "setOpaque:", 0);
    -[PKContinuousButton setExclusiveTouch:](v5, "setExclusiveTouch:", 1);
    -[PKContinuousButton setTintAdjustmentMode:](v5, "setTintAdjustmentMode:", 1);
    -[PKContinuousButton _setWantsAccessibilityUnderline:](v5, "_setWantsAccessibilityUnderline:", 0);
    var4 = a3->var4;
    v7 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&v5->_configuration.cornerRadius = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v5->_configuration.style = v7;
    v5->_configuration.disabledEffect = var4;
    v5->_configuration.cornerRadius = fmax(v5->_configuration.cornerRadius, 0.0);
    if (v5->_configuration.style == 3)
    {
      v5->_backdropStyle = 2020;
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", v5->_backdropStyle);
      backdropView = v5->_backdropView;
      v5->_backdropView = (_UIBackdropView *)v8;

      -[_UIBackdropView setUserInteractionEnabled:](v5->_backdropView, "setUserInteractionEnabled:", 0);
      v10 = objc_alloc_init(MEMORY[0x1E0DC3870]);
      -[PKContinuousButton setBackgroundImage:forState:](v5, "setBackgroundImage:forState:", v10, 0);

      -[PKContinuousButton layoutIfNeeded](v5, "layoutIfNeeded");
      -[PKContinuousButton _backgroundView](v5, "_backgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v5->_backdropView);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__accessibilitySettingsDidChange_, *MEMORY[0x1E0DC45B8], 0);

    }
    if (!v5->_configuration.disabledEffect)
      v5->_configuration.disabledEffect = v5->_configuration.highlightEffect;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v13 = objc_claimAutoreleasedReturnValue();
    normalInputColor = v5->_normalInputColor;
    v5->_normalInputColor = (UIColor *)v13;

    +[PKContinuousButton _filterInputColorForEffect:](PKContinuousButton, "_filterInputColorForEffect:", v5->_configuration.highlightEffect);
    v15 = objc_claimAutoreleasedReturnValue();
    highlightInputColor = v5->_highlightInputColor;
    v5->_highlightInputColor = (UIColor *)v15;

    +[PKContinuousButton _filterInputColorForEffect:](PKContinuousButton, "_filterInputColorForEffect:", v5->_configuration.disabledEffect);
    v17 = objc_claimAutoreleasedReturnValue();
    disabledInputColor = v5->_disabledInputColor;
    v5->_disabledInputColor = (UIColor *)v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v19 = objc_claimAutoreleasedReturnValue();
    activityIndicatorColor = v5->_activityIndicatorColor;
    v5->_activityIndicatorColor = (UIColor *)v19;

    -[PKContinuousButton layer](v5, "layer");
    v21 = objc_claimAutoreleasedReturnValue();
    layer = v5->_layer;
    v5->_layer = (CAShapeLayer *)v21;

    -[CAShapeLayer setLineWidth:](v5->_layer, "setLineWidth:", 1.0);
    -[CAShapeLayer setMasksToBounds:](v5->_layer, "setMasksToBounds:", 1);
    v5->_enabled = 1;
    v5->_highlighted = 0;
    v5->_selected = 0;
    v27[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)-[PKContinuousButton registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v23, &__block_literal_global_198);

    -[PKContinuousButton _updateColor](v5, "_updateColor");
  }
  return v5;
}

+ (id)_filterInputColorForEffect:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  void *v6;

  if (a3 == 2)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    v4 = 1.0;
    v5 = 0.5;
  }
  else
  {
    if (a3 == 1)
    {
      v3 = (void *)MEMORY[0x1E0DC3658];
      v4 = 0.6;
    }
    else
    {
      if (a3)
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      v3 = (void *)MEMORY[0x1E0DC3658];
      v4 = 1.0;
    }
    v5 = 1.0;
  }
  objc_msgSend(v3, "colorWithWhite:alpha:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_9;
  return v6;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PKContinuousButton _updateColor](self, "_updateColor");
}

- (void)updateWithImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  -[PKContinuousButton updateImageView](self, "updateImageView");
}

- (void)updateImageView
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, UIImage *, _QWORD);
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  $F83FDD48ACA6A2FD47999B958F960C73 *p_configuration;
  UIImage *v12;
  UIImage *v13;
  UIImage *v14;
  UIImage *v15;
  _QWORD v16[4];
  UIImage *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  UIImage *v24;
  _QWORD v25[4];
  UIImage *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  UIImage *v33;
  _QWORD aBlock[5];
  id v35;

  -[PKContinuousButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[PKContinuousButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);
  -[PKContinuousButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PKContinuousButton_updateImageView__block_invoke;
  aBlock[3] = &unk_1E3E776A8;
  aBlock[4] = self;
  v6 = v4;
  v35 = v6;
  v7 = (void (**)(void *, UIImage *, _QWORD))_Block_copy(aBlock);
  v8 = self->_image;
  v7[2](v7, v8, 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__53;
  v32 = __Block_byref_object_dispose__53;
  v9 = v8;
  v10 = v9;
  v33 = v9;
  p_configuration = &self->_configuration;
  v12 = v9;
  if (self->_configuration.highlightEffect == 2)
  {
    v12 = v9;
    if ((unint64_t)(self->_configuration.style - 1) <= 1)
    {
      v25[0] = v5;
      v25[1] = 3221225472;
      v25[2] = __37__PKContinuousButton_updateImageView__block_invoke_35;
      v25[3] = &unk_1E3E66238;
      v27 = &v28;
      v26 = v9;
      PKUIPerformWithEffectiveTraitCollection(v3, v25);

      v12 = (UIImage *)v29[5];
    }
  }
  v7[2](v7, v12, 4);
  v7[2](v7, (UIImage *)v29[5], 1);
  v7[2](v7, (UIImage *)v29[5], 5);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__53;
  v23 = __Block_byref_object_dispose__53;
  v13 = (UIImage *)(id)v29[5];
  v24 = v13;
  if (self->_configuration.disabledEffect != self->_configuration.highlightEffect)
  {
    v14 = v13;
    v15 = v10;
    v24 = v15;

    if (p_configuration->disabledEffect == 2 && (unint64_t)(p_configuration->style - 1) <= 1)
    {
      v16[0] = v5;
      v16[1] = 3221225472;
      v16[2] = __37__PKContinuousButton_updateImageView__block_invoke_2;
      v16[3] = &unk_1E3E66238;
      v18 = &v19;
      v17 = v15;
      PKUIPerformWithEffectiveTraitCollection(v3, v16);

    }
  }
  v7[2](v7, (UIImage *)v20[5], 2);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v28, 8);
}

void __37__PKContinuousButton_updateImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  void *v7;
  id v8;
  int v9;
  id v10;
  id v11;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[100];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a2;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "containsObject:");
    v10 = v8;
    if (v9)
      v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setImage:forState:", v10, a3);

  }
  else
  {
    v11 = a2;
    objc_msgSend(v4, "setImage:forState:", v11, a3);
  }

}

- (void)setImageEnabled:(BOOL)a3 forState:(unint64_t)a4
{
  NSMutableSet *disabledImageStates;
  void *v7;
  NSMutableSet *v8;
  NSMutableSet *v9;

  disabledImageStates = self->_disabledImageStates;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](disabledImageStates, "removeObject:", v7);
  }
  else
  {
    if (!disabledImageStates)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = self->_disabledImageStates;
      self->_disabledImageStates = v8;

      disabledImageStates = self->_disabledImageStates;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](disabledImageStates, "addObject:", v7);
  }

  if (self->_image)
    -[PKContinuousButton updateImageView](self, "updateImageView");
}

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PKContinuousButton)initWithCoder:(id)a3
{

  return 0;
}

- (PKContinuousButton)init
{
  return -[PKContinuousButton initWithCornerRadius:effect:](self, "initWithCornerRadius:effect:", 1, 0.0);
}

- (PKContinuousButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKContinuousButton *v7;
  PKContinuousButton *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[PKContinuousButton initWithCornerRadius:effect:](self, "initWithCornerRadius:effect:", 1, 0.0);
  v8 = v7;
  if (v7)
    -[PKContinuousButton setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (PKContinuousButton)initWithCornerRadius:(double)a3 effect:(int64_t)a4
{
  double v5;
  __int128 v6;
  int64_t v7;
  int64_t v8;

  v5 = a3;
  v6 = xmmword_19DEE0240;
  v7 = a4;
  v8 = a4;
  return -[PKContinuousButton initWithConfiguration:](self, "initWithConfiguration:", &v5);
}

uint64_t __44__PKContinuousButton_initWithConfiguration___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (a2[99])
    return objc_msgSend(a2, "updateImageView");
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton dealloc](&v4, sel_dealloc);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKContinuousButton;
    v5 = -[PKContinuousButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKContinuousButton _updateColor](self, "_updateColor");
}

- (void)updateBackgroundColorWithColor:(id)a3
{
  UIColor *v4;
  UIColor *overrideBackgroundColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  overrideBackgroundColor = self->_overrideBackgroundColor;
  self->_overrideBackgroundColor = v4;

  -[PKContinuousButton _updateColor](self, "_updateColor");
}

- (void)updateTitleColorWithColor:(id)a3
{
  UIColor *v4;
  UIColor *overrideTitleColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  overrideTitleColor = self->_overrideTitleColor;
  self->_overrideTitleColor = v4;

  -[PKContinuousButton _updateTitleColor](self, "_updateTitleColor");
}

- (void)updateActivityIndicatorColorWithColor:(id)a3
{
  UIColor **p_activityIndicatorColor;
  UIActivityIndicatorView *activityIndicatorView;
  UIColor *v7;

  p_activityIndicatorColor = &self->_activityIndicatorColor;
  v7 = (UIColor *)a3;
  if (*p_activityIndicatorColor != v7)
  {
    objc_storeStrong((id *)&self->_activityIndicatorColor, a3);
    activityIndicatorView = self->_activityIndicatorView;
    if (activityIndicatorView)
      -[UIActivityIndicatorView setColor:](activityIndicatorView, "setColor:", *p_activityIndicatorColor);
  }

}

void __37__PKContinuousButton_updateImageView__block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pkui_imageWithAlpha:", 0.5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__PKContinuousButton_updateImageView__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pkui_imageWithAlpha:", 0.5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setBlurDisabled:(BOOL)a3
{
  if (self->_configuration.style == 3 && self->_blurDisabled != a3)
  {
    self->_blurDisabled = a3;
    -[PKContinuousButton _updateBackdropSettings](self, "_updateBackdropSettings");
  }
}

- (void)_updateBackdropSettings
{
  _BOOL4 blurDisabled;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  blurDisabled = self->_blurDisabled;
  v4 = (void *)MEMORY[0x1E0DC4030];
  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:", self->_backdropStyle);
  v5 = objc_claimAutoreleasedReturnValue();
  if (blurDisabled)
  {
    v7 = (id)v5;
    v6 = objc_msgSend(v4, "pkui_createTransparentSettingsFromSettings:", v5);

    v5 = v6;
  }
  v8 = (id)v5;
  -[_UIBackdropView transitionToSettings:](self->_backdropView, "transitionToSettings:", v5);

}

- (void)_createHighlightFilterIfNecessary
{
  id v3;
  CAFilter *v4;
  CAFilter *highlightFilter;
  CAShapeLayer *layer;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!self->_highlightFilter)
  {
    v3 = objc_alloc(MEMORY[0x1E0CD2780]);
    v4 = (CAFilter *)objc_msgSend(v3, "initWithType:", *MEMORY[0x1E0CD2E60]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    -[CAFilter setValue:forKey:](self->_highlightFilter, "setValue:forKey:", -[UIColor CGColor](self->_normalInputColor, "CGColor"), CFSTR("inputColor"));
    layer = self->_layer;
    v8[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setFilters:](layer, "setFilters:", v7);

    objc_storeStrong((id *)&self->_appliedInputColor, self->_normalInputColor);
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton setEnabled:](&v5, sel_setEnabled_);
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[PKContinuousButton _updateFilter](self, "_updateFilter");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKContinuousButton _updateFilter](self, "_updateFilter");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    -[PKContinuousButton _updateFilter](self, "_updateFilter");
  }
}

- (void)_updateFilter
{
  int *v3;
  void *v4;
  void *v5;
  CGColor *v6;
  void *v7;
  CAShapeLayer *layer;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  -[PKContinuousButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
  v3 = &OBJC_IVAR___PKContinuousButton__disabledInputColor;
  if (self->_enabled)
  {
    v3 = &OBJC_IVAR___PKContinuousButton__highlightInputColor;
    if (!self->_highlighted)
    {
      v3 = &OBJC_IVAR___PKContinuousButton__normalInputColor;
      if (self->_selected)
        v3 = &OBJC_IVAR___PKContinuousButton__highlightInputColor;
    }
  }
  v13 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  if ((-[UIColor isEqual:](self->_appliedInputColor, "isEqual:") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0DC3658];
    -[CAShapeLayer presentationLayer](self->_layer, "presentationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CGColor *)objc_msgSend(v5, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    if (!v6)
      v6 = -[UIColor CGColor](self->_appliedInputColor, "CGColor");
    objc_msgSend(v4, "colorWithCGColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    layer = self->_layer;
    v9 = objc_retainAutorelease(v13);
    -[CAShapeLayer setValue:forKeyPath:](layer, "setValue:forKeyPath:", objc_msgSend(v9, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdditive:", 0);
    objc_msgSend(v10, "setDuration:", 0.15);
    v11 = objc_retainAutorelease(v7);
    objc_msgSend(v10, "setFromValue:", objc_msgSend(v11, "CGColor"));
    v12 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "setToValue:", objc_msgSend(v12, "CGColor"));
    -[CAShapeLayer removeAnimationForKey:](self->_layer, "removeAnimationForKey:", CFSTR("highlight"));
    -[CAShapeLayer addAnimation:forKey:](self->_layer, "addAnimation:forKey:", v10, CFSTR("highlight"));
    objc_storeStrong((id *)&self->_appliedInputColor, v12);

  }
}

- (void)setShowSpinner:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;

  if (self->_showSpinner == a3)
    return;
  self->_showSpinner = a3;
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v6 = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

    activityIndicatorView = self->_activityIndicatorView;
    if (self->_activityIndicatorColor)
    {
      -[UIActivityIndicatorView setColor:](activityIndicatorView, "setColor:");
      activityIndicatorView = self->_activityIndicatorView;
    }
  }
  if (!self->_showSpinner)
    goto LABEL_9;
  -[UIActivityIndicatorView superview](activityIndicatorView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PKContinuousButton addSubview:](self, "addSubview:", self->_activityIndicatorView);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
    -[PKContinuousButton titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[PKContinuousButton _imageView](self, "_imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0.0;
    goto LABEL_13;
  }
  if (!self->_showSpinner)
  {
    activityIndicatorView = self->_activityIndicatorView;
LABEL_9:
    -[UIActivityIndicatorView superview](activityIndicatorView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
      -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicatorView, "removeFromSuperview");
      -[PKContinuousButton titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 1.0);

      -[PKContinuousButton _imageView](self, "_imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1.0;
LABEL_13:
      objc_msgSend(v10, "setAlpha:", v12);

      -[PKContinuousButton setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)blurDisabled
{
  return self->_blurDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorColor, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_appliedInputColor, 0);
  objc_storeStrong((id *)&self->_disabledInputColor, 0);
  objc_storeStrong((id *)&self->_selectedInputColor, 0);
  objc_storeStrong((id *)&self->_highlightInputColor, 0);
  objc_storeStrong((id *)&self->_normalInputColor, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_overrideTitleColor, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
  objc_storeStrong((id *)&self->_disabledImageStates, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
