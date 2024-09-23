@implementation _UIGrabber

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 36.0;
  v4 = 5.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_UIGrabber)initWithFrame:(CGRect)a3
{
  _UIGrabber *v3;
  _UIGrabber *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIGrabber;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _UIGrabberCommonInit(v3);
  return v4;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _QWORD v56[3];
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v56[2] = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  v58 = CGRectInset(v57, 0.0, -5.0);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  -[_UIGrabber _lumaTrackingBackdropView](self, "_lumaTrackingBackdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

  v8 = -[_UIGrabber _isBlurEnabled](self, "_isBlurEnabled") ^ 1;
  -[_UIGrabber _lumaTrackingBackdropView](self, "_lumaTrackingBackdropView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  -[UIView bounds](self, "bounds");
  v60 = CGRectInset(v59, 0.0, -5.0);
  v10 = v60.origin.x;
  v11 = v60.origin.y;
  v12 = v60.size.width;
  v13 = v60.size.height;
  -[_UIGrabber _visualEffectView](self, "_visualEffectView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v10, v11, v12, v13);

  -[UIView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UIGrabber _backgroundLuminanceLevel](self, "_backgroundLuminanceLevel");
  if (v16 - 1 <= 1)
  {
    objc_msgSend(v15, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", v16, 0x1E1A994B0);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0.0;
  v55 = 0.0;
  v52 = 0.0;
  v53 = 0.0;
  objc_msgSend(v18, "resolvedColorWithTraitCollection:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getRed:green:blue:alpha:", &v55, &v54, &v53, &v52);

  if (objc_msgSend(v15, "userInterfaceStyle") == 2)
  {
    v20 = v55 * v52;
    v21 = v52 * v54;
    v22 = v52 * v53;
  }
  else
  {
    v20 = -((1.0 - v55) * v52);
    v21 = -((1.0 - v54) * v52);
    v22 = -((1.0 - v53) * v52);
  }
  v38 = 0x3FF0000000000000;
  v39 = 0u;
  v40 = 0u;
  v41 = 0x3FF0000000000000;
  v42 = 0u;
  v43 = 0u;
  v44 = 0x3FF0000000000000;
  v45 = 0u;
  v46 = 0u;
  v47 = 0x3FF0000000000000;
  v48 = v20;
  v49 = v21;
  v50 = v22;
  v51 = 0;
  +[UIColorEffect colorEffectMatrix:](UIColorEffect, "colorEffectMatrix:", &v38);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v23;
  +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 30.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGrabber _visualEffectView](self, "_visualEffectView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundEffects:", v25);

  v27 = -[_UIGrabber _isBlurEnabled](self, "_isBlurEnabled") ^ 1;
  -[_UIGrabber _visualEffectView](self, "_visualEffectView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", v27);

  if (-[_UIGrabber _isBlurEnabled](self, "_isBlurEnabled"))
    v29 = 0;
  else
    v29 = v18;
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v29);
  -[UIView bounds](self, "bounds");
  v30 = CGRectGetHeight(v61) * 0.5;
  -[UIView layer](self, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCornerRadius:", v30);

  -[UIView bounds](self, "bounds");
  v34 = v33 + -44.0;
  v35 = (v33 + -44.0) * 0.5;
  if (v34 <= 0.0)
    v36 = v35;
  else
    v36 = 0.0;
  if (v32 + -44.0 <= 0.0)
    v37 = (v32 + -44.0) * 0.5;
  else
    v37 = 0.0;
  -[UIView _setTouchInsets:](self, "_setTouchInsets:", v37, v36, v37, v36);

}

- (UIVisualEffectView)_visualEffectView
{
  return self->__visualEffectView;
}

- (_UILumaTrackingBackdropView)_lumaTrackingBackdropView
{
  return self->__lumaTrackingBackdropView;
}

- (unint64_t)_backgroundLuminanceLevel
{
  return self->__backgroundLuminanceLevel;
}

- (_UIGrabber)initWithCoder:(id)a3
{
  _UIGrabber *v3;
  _UIGrabber *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIGrabber;
  v3 = -[UIControl initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _UIGrabberCommonInit(v3);
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UIGrabber *v5;

  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
  {
    if (UIViewIgnoresTouchEvents(self))
      v5 = 0;
    else
      v5 = self;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_setLumaTrackingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->__lumaTrackingEnabled != a3)
  {
    self->__lumaTrackingEnabled = a3;
    v3 = !a3;
    -[_UIGrabber _lumaTrackingBackdropView](self, "_lumaTrackingBackdropView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaused:", v3);

  }
}

- (void)_setBackgroundLuminanceLevel:(unint64_t)a3
{
  if (self->__backgroundLuminanceLevel != a3)
  {
    self->__backgroundLuminanceLevel = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  _QWORD v5[5];

  -[_UIGrabber _setBackgroundLuminanceLevel:](self, "_setBackgroundLuminanceLevel:", a4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___UIGrabber_backgroundLumaView_didTransitionToLevel___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  +[UIView animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:](UIView, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 0, v5, 0, 0.21, 0.0, 0.0, 0.0);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
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
  void *v18;

  -[UIView bounds](self, "bounds", a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView _touchInsets](self, "_touchInsets");
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v7 + v17, v9 + v14, v11 - (v17 + v15), v13 - (v14 + v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLatchingAxes:", 2);
  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  UITargetedPreview *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
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
  void *v22;
  CGRect v24;

  v5 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", self);
  -[UIView center](self, "center");
  v7 = v6;
  v9 = v8;
  -[UIView _screen](self, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  UIRectCenteredAboutPointScale(0.0, 0.0, 48.0, 13.0, v7, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v13, v15, v17, v19, CGRectGetHeight(v24) * 0.5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v21, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)_setBlurEnabled:(BOOL)a3
{
  if (self->__blurEnabled != a3)
  {
    self->__blurEnabled = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_lumaTrackingEnabled
{
  return self->__lumaTrackingEnabled;
}

- (BOOL)_isBlurEnabled
{
  return self->__blurEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lumaTrackingBackdropView, 0);
  objc_storeStrong((id *)&self->__visualEffectView, 0);
}

@end
