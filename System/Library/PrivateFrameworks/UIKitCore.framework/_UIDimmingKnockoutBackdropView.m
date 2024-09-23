@implementation _UIDimmingKnockoutBackdropView

- (_UIDimmingKnockoutBackdropView)initWithStyle:(int64_t)a3
{
  _UIDimmingKnockoutBackdropView *v4;
  _UIDimmingKnockoutBackdropView *v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDimmingKnockoutBackdropView;
  v4 = -[UIView init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UIView alpha](v4, "alpha");
    v5->_alpha = v6;
    v5->_style = a3;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    -[UIView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    -[_UIDimmingKnockoutBackdropView _configureViewsWithStyle:](v5, "_configureViewsWithStyle:", a3);
  }
  return v5;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[_UIDimmingKnockoutBackdropView _configureViewsWithStyle:](self, "_configureViewsWithStyle:");
  }
}

- (void)_configureViewsWithStyle:(int64_t)a3
{
  UIView *dimmingKnockoutView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  UIVisualEffectView *v13;
  void *v14;
  UIVisualEffectView *v15;
  UIVisualEffectView *backdropView;

  dimmingKnockoutView = self->dimmingKnockoutView;
  if (!a3 || dimmingKnockoutView)
  {
    if (!a3 && dimmingKnockoutView)
    {
      -[UIView removeFromSuperview](dimmingKnockoutView, "removeFromSuperview");
      v8 = self->dimmingKnockoutView;
      self->dimmingKnockoutView = 0;

    }
  }
  else
  {
    v6 = objc_alloc_init(UIView);
    v7 = self->dimmingKnockoutView;
    self->dimmingKnockoutView = v6;

    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->dimmingKnockoutView, 0);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->dimmingKnockoutView, "setFrame:");
    -[UIView setAutoresizingMask:](self->dimmingKnockoutView, "setAutoresizingMask:", 18);
  }
  -[UIView layer](self->dimmingKnockoutView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDimmingKnockoutBackdropView _dimmingKnockoutFilterForBackdropStyle:](self, "_dimmingKnockoutFilterForBackdropStyle:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v10);

  v11 = self->dimmingKnockoutView;
  -[_UIDimmingKnockoutBackdropView _dimmingKnockoutBackgroundColorForBackdropStyle:](self, "_dimmingKnockoutBackgroundColorForBackdropStyle:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  if (!self->backdropView)
  {
    v13 = [UIVisualEffectView alloc];
    -[_UIDimmingKnockoutBackdropView _visualEffectForStyle:](self, "_visualEffectForStyle:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UIVisualEffectView initWithEffect:](v13, "initWithEffect:", v14);
    backdropView = self->backdropView;
    self->backdropView = v15;

    -[UIView addSubview:](self, "addSubview:", self->backdropView);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->backdropView, "setFrame:");
    -[UIView setAutoresizingMask:](self->backdropView, "setAutoresizingMask:", 18);
  }
  -[_UIDimmingKnockoutBackdropView _updateBackdropViewWithStyle:alpha:](self, "_updateBackdropViewWithStyle:alpha:", a3, self->_alpha);
}

- (void)_updateBackdropViewWithStyle:(int64_t)a3 alpha:(double)a4
{
  UIVisualEffectView *backdropView;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  backdropView = self->backdropView;
  if (a4 == 0.0)
  {
    -[UIVisualEffectView setEffect:](self->backdropView, "setEffect:", 0);
  }
  else
  {
    -[_UIDimmingKnockoutBackdropView _visualEffectForStyle:](self, "_visualEffectForStyle:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](backdropView, "setEffect:", v8);

  }
  -[_UIDimmingKnockoutBackdropView _vibrancyEffectForStyle:](self, "_vibrancyEffectForStyle:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a4 > 0.0 && v9)
  {
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setContentEffects:](self->backdropView, "setContentEffects:", v11);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->backdropView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
  else
  {
    -[UIVisualEffectView setContentEffects:](self->backdropView, "setContentEffects:", MEMORY[0x1E0C9AA60]);
    -[UIVisualEffectView contentView](self->backdropView, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", 0);

  }
}

- (id)_visualEffectForStyle:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      v3 = 1200;
      goto LABEL_6;
    case 1:
      v3 = 0;
      goto LABEL_6;
    case 2:
      v3 = 1;
LABEL_6:
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[UIBlurEffect _effectWithBlurRadius:scale:](UIBlurEffect, "_effectWithBlurRadius:scale:", 18.0, 0.25);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", 0.175, 0.175, 0.175, 0.35);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", 0.0, 0.0, 0.0, 0.35);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIZoomEffect zoomEffectWithMagnitude:](_UIZoomEffect, "zoomEffectWithMagnitude:", 0.025);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v11[1] = v6;
      v11[2] = v7;
      v11[3] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIVisualEffect effectCombiningEffects:](UIVisualEffect, "effectCombiningEffects:", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)_vibrancyEffectForStyle:(int64_t)a3
{
  return 0;
}

- (id)_dimmingKnockoutFilterForBackdropStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E80], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dimmingKnockoutBackgroundColorForBackdropStyle:(int64_t)a3
{
  void *v3;
  double v4;

  switch(a3)
  {
    case 3:
      v4 = 0.0;
LABEL_7:
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 0.5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2:
      v4 = 1.0;
      goto LABEL_7;
    case 1:
      +[UIColor whiteColor](UIColor, "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    -[_UIDimmingKnockoutBackdropView _updateBackdropViewWithStyle:alpha:](self, "_updateBackdropViewWithStyle:alpha:", -[_UIDimmingKnockoutBackdropView style](self, "style"), a3);
    -[UIView setAlpha:](self->dimmingKnockoutView, "setAlpha:", a3);
  }
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDimmingKnockoutBackdropView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIDimmingKnockoutBackdropView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  self->_currentCornerRadius = a3;
  -[_UIDimmingKnockoutBackdropView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  -[UIView layer](self->backdropView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", a3);

  -[UIView layer](self->dimmingKnockoutView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", a3);

  -[_UIDimmingKnockoutBackdropView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)_updateCornerRadius
{
  double currentCornerRadius;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  objc_super v14;

  currentCornerRadius = self->_currentCornerRadius;
  -[UIView bounds](self->backdropView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView layer](self->backdropView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _UIClampedCornerRadius(objc_msgSend(v12, "maskedCorners"), currentCornerRadius, v5, v7, v9, v11);

  v14.receiver = self;
  v14.super_class = (Class)_UIDimmingKnockoutBackdropView;
  -[UIView _setContinuousCornerRadius:](&v14, sel__setContinuousCornerRadius_, v13);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->backdropView, "_setContinuousCornerRadius:", v13);
  -[UIView _setContinuousCornerRadius:](self->dimmingKnockoutView, "_setContinuousCornerRadius:", v13);
  -[UIView setClipsToBounds:](self, "setClipsToBounds:", v13 > 0.0);
  -[UIView setClipsToBounds:](self->backdropView, "setClipsToBounds:", v13 > 0.0);
  -[UIView setClipsToBounds:](self->dimmingKnockoutView, "setClipsToBounds:", v13 > 0.0);
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self, "setHidden:", !a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backdropView, 0);
  objc_storeStrong((id *)&self->dimmingKnockoutView, 0);
}

@end
