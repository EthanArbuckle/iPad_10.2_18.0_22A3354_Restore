@implementation SKUIPlayButtonControl

- (SKUIPlayButtonControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIPlayButtonControl *v8;
  SKUIPlayButtonControl *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIPlayButtonControl initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIPlayButtonControl;
  v8 = -[SKUIPlayButtonControl initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIPlayButtonControl setBackgroundColor:](v8, "setBackgroundColor:", 0);
    -[SKUIPlayButtonControl setOpaque:](v9, "setOpaque:", 0);
    -[SKUIPlayButtonControl layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupBlending:", 0);

    -[SKUIPlayButtonControl layer](v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    -[SKUIPlayButtonControl _imageView](v9, "_imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonControl addSubview:](v9, "addSubview:", v12);

    v9->_showingPlayIndicator = 1;
  }
  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  SKUIPlayButtonShapeView *selectedLayer;
  void *v6;
  void *v7;
  objc_super v8;

  self->_didInitialHighlightForTouch = 0;
  v8.receiver = self;
  v8.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, a3, a4);
  selectedLayer = self->_selectedLayer;
  if (selectedLayer)
  {
    -[SKUIPlayButtonShapeView layer](selectedLayer, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllAnimations");

    -[SKUIPlayButtonControl _selectedLayer](self, "_selectedLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);
  }
  else
  {
    -[SKUIPlayButtonControl _selectedLayer](self, "_selectedLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonControl addSubview:](self, "addSubview:", v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[SKUIPlayButtonControl isDisabledButSelectable](self, "isDisabledButSelectable"))
  {
    -[SKUIPlayButtonControl element](self, "element");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SKUIPlayButtonControl element](self, "element");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x1E73B7150, 0x1E73B7170, 1, 0, 0, 0);

    }
    -[SKUIPlayButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 256);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIPlayButtonControl;
    -[SKUIPlayButtonControl touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (CGRect)hitRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl hitRect](&v13, sel_hitRect);
  top = self->_bigHitInsets.top;
  left = self->_bigHitInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_bigHitInsets.right);
  v12 = v11 - (top + self->_bigHitInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl layoutSubviews](&v10, sel_layoutSubviews);
  -[SKUIPlayButtonControl buttonSize](self, "buttonSize");
  v4 = v3;
  v6 = v5;
  if (self->_showingPlayIndicator)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[SKUIPlayButtonControl _imageView](self, "_imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v7, 0.0, v4, v6);

  -[SKUIPlayButtonControl _backgroundView](self, "_backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v4, v6);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SKUIPlayButtonControl hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl setEnabled:](&v4, sel_setEnabled_, a3);
  -[SKUIPlayButtonControl _updateEnabledState](self, "_updateEnabledState");
}

- (void)setDisabledButSelectable:(BOOL)a3
{
  self->_disabledButSelectable = a3;
  -[SKUIPlayButtonControl _updateEnabledState](self, "_updateEnabledState");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl setHighlighted:](&v9, sel_setHighlighted_);
  if (-[SKUIPlayButtonControl _renderAsEnabled](self, "_renderAsEnabled"))
  {
    if (self->_backgroundType == 3)
    {
      -[SKUIPlayButtonControl _classicBackdropView](self, "_classicBackdropView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0.7;
      if (v3)
        v7 = 0.35;
      objc_msgSend(v6, "setColorTintAlpha:", v7);
      -[SKUIPlayButtonControl _updateBackdropView](self, "_updateBackdropView");

    }
    else if (!v3)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__SKUIPlayButtonControl_setHighlighted___block_invoke;
      v8[3] = &unk_1E739FD38;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, 0.47, 0.0);
    }
  }
}

void __40__SKUIPlayButtonControl_setHighlighted___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[77])
  {
    objc_msgSend(v1, "_selectedLayer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

  }
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl setSelected:](&v6, sel_setSelected_, a3);
  if (self->_backgroundType == 3)
  {
    -[SKUIPlayButtonControl _classicBackdropView](self, "_classicBackdropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", -[SKUIPlayButtonControl isSelected](self, "isSelected"));

    -[SKUIPlayButtonControl _updateBackdropView](self, "_updateBackdropView");
  }
}

- (void)setProgressIndicatorColor:(id)a3
{
  -[SKUIPlayButtonControl setProgressIndicatorColor:withCompositingFilter:](self, "setProgressIndicatorColor:withCompositingFilter:", a3, 0);
}

- (void)setProgressIndicatorColor:(id)a3 withCompositingFilter:(id)a4
{
  id v7;
  UIColor *progressIndicatorColor;
  int v9;
  id progressIndicatorCompositingFilter;
  UIColor *v11;

  v11 = (UIColor *)a3;
  v7 = a4;
  progressIndicatorColor = self->_progressIndicatorColor;
  if (progressIndicatorColor == v11 || (-[UIColor isEqual:](progressIndicatorColor, "isEqual:") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_progressIndicatorColor, a3);
    v9 = 1;
  }
  progressIndicatorCompositingFilter = self->_progressIndicatorCompositingFilter;
  if (progressIndicatorCompositingFilter == v7
    || (objc_msgSend(progressIndicatorCompositingFilter, "isEqual:", v7) & 1) != 0)
  {
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    objc_storeStrong(&self->_progressIndicatorCompositingFilter, a4);
  }
  -[SKUIPlayButtonControl _updateInnerProgressLayerStroke](self, "_updateInnerProgressLayerStroke");
LABEL_11:

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SKUIPlayButtonControl _updateInnerProgressLayerStroke](self, "_updateInnerProgressLayerStroke");
  -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
}

- (void)beginIndeterminateAnimation
{
  double v2;
  _BOOL4 indeterminate;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  LODWORD(v2) = 0;
  -[SKUIPlayButtonControl setProgress:animated:](self, "setProgress:animated:", 0, v2);
  indeterminate = self->_indeterminate;
  -[SKUIPlayButtonShapeView layer](self->_outerProgressLayer, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (indeterminate)
  {
    objc_msgSend(v5, "animationKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      return;
  }
  else
  {
    objc_msgSend(v5, "setStrokeStart:", 0.119999997);
    self->_indeterminate = 1;

  }
  -[SKUIPlayButtonControl window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[SKUIPlayButtonControl _beginIndeterminateAnimation](self, "_beginIndeterminateAnimation");
}

+ (id)blurColorForColor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v7 = 0;
  v8 = 0;
  v3 = 0;
  if (objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, &v7))
  {
    v9 = v9 * 1.8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.980392157, 0.78);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_colorBlendedWithColor:compositingFilter:", v5, *MEMORY[0x1E0CD2ED8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)blurColorForImage:(id)a3 forButtonSize:(CGSize)a4 withOffsetRight:(float)a5 withOffsetBottom:(float)a6
{
  double width;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  CGImage *v18;
  CGImage *v19;
  CGRect v21;
  CGRect v22;

  width = a4.width;
  v9 = a3;
  objc_msgSend(v9, "scale");
  v11 = v10;
  objc_msgSend(v9, "size");
  v13 = v11 * v12;
  objc_msgSend(v9, "size");
  v15 = width * v11;
  v16 = v11 * v14 - a6 * v11 - v15;
  v17 = objc_retainAutorelease(v9);
  v18 = (CGImage *)objc_msgSend(v17, "CGImage");

  v21.origin.x = v13 - a5 * v11 - v15;
  v21.origin.y = v16;
  v21.size.width = v15;
  v21.size.height = v15;
  v22 = CGRectIntegral(v21);
  v19 = CGImageCreateWithImageInRect(v18, v22);
  +[SKUIPlayButtonControl _calculateStatistics:withSize:](SKUIPlayButtonControl, "_calculateStatistics:withSize:", v19, v15, v15);
  CGImageRelease(v19);
  return 0;
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 28.0;
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)buttonCornerRadius
{
  return 14.0;
}

- (id)cancelImage
{
  return 0;
}

- (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.933333333, 0.933333333, 0.909803922, 1.0);
}

- (void)endIndeterminateAnimation
{
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;

  if (self->_indeterminate)
  {
    -[SKUIPlayButtonControl _outerProgressLayer](self, "_outerProgressLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setStrokeStart:", 0.0);
    objc_msgSend(v4, "removeAllAnimations");
    -[SKUIPlayButtonControl _outerProgressLayer](self, "_outerProgressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeRotation(&v6, -1.57079633);
    objc_msgSend(v5, "setTransform:", &v6);

    self->_indeterminate = 0;
    -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");

  }
}

- (void)hideProgressAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;

  if (self->_showingProgress || self->_indeterminate)
  {
    -[SKUIPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation", a3);
    -[SKUIPlayButtonControl _innerProgressLayer](self, "_innerProgressLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    if (self->_backgroundType == 3)
    {
      -[_UIBackdropView setHidden:](self->_backdropView, "setHidden:", 0);
    }
    else
    {
      -[SKUIPlayButtonControl _backgroundView](self, "_backgroundView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "setHidden:", 0);
        objc_msgSend(v6, "setAlpha:", 1.0);
        -[SKUIPlayButtonControl _imageView](self, "_imageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIPlayButtonControl playButtonDefaultAlpha](self, "playButtonDefaultAlpha");
        objc_msgSend(v7, "setAlpha:", v8);

      }
    }
    self->_showingProgress = 0;
    self->_showingPlayIndicator = 1;
    -[SKUIPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:", 1);
  }
}

- (id)playImage
{
  return 0;
}

- (float)playButtonDefaultAlpha
{
  float result;

  result = 0.48;
  if (!self->_usesBlurredBackground)
    return 1.0;
  return result;
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v5;
  NSString *backdropGroupName;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](backdropGroupName, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_backdropGroupName, a3);
      -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:", self->_backdropGroupName);
      v5 = v8;
    }
  }

}

- (void)setBackgroundImageForBlurring:(id)a3 withOffsetRight:(float)a4 withOffsetBottom:(float)a5
{
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageForBlurring);

  v9 = obj;
  if (WeakRetained != obj)
  {
    v10 = objc_storeWeak((id *)&self->_backgroundImageForBlurring, obj);

    v9 = obj;
    if (obj)
    {
      v11 = objc_loadWeakRetained((id *)&self->_backgroundImageForBlurring);
      *(float *)&v12 = a4;
      *(float *)&v13 = a5;
      -[SKUIPlayButtonControl _updateBackgroundBlur:withOffsetRight:withOffsetBottom:](self, "_updateBackgroundBlur:withOffsetRight:withOffsetBottom:", v11, v12, v13);

      v9 = obj;
    }
  }

}

- (void)setBackgroundType:(int64_t)a3
{
  UIView *backgroundView;
  UIView *v6;
  UIView *v7;
  SKUIPlayButtonGradientView *v8;
  SKUIPlayButtonGradientView *gradientBackgroundView;
  UIView *v10;
  UIView *v11;
  SKUIPlayButtonGradientView *v12;
  SKUIPlayButtonGradientView *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  _UIBackdropView *backdropView;

  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    if (a3 == 3)
    {
      -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
      backgroundView = self->_backgroundView;
      self->_backgroundView = 0;

    }
    else
    {
      v6 = self->_backgroundView;
      if (a3 == 4)
      {
        -[UIView removeFromSuperview](v6, "removeFromSuperview");
        v7 = self->_backgroundView;
        self->_backgroundView = 0;

        if (!self->_gradientBackgroundView)
        {
          -[SKUIPlayButtonControl _gradientBackgroundView](self, "_gradientBackgroundView");
          v8 = (SKUIPlayButtonGradientView *)objc_claimAutoreleasedReturnValue();
          gradientBackgroundView = self->_gradientBackgroundView;
          self->_gradientBackgroundView = v8;

          -[SKUIPlayButtonControl _createGradient:withGradientType:](self, "_createGradient:withGradientType:", self->_gradientColors, self->_gradientType);
          -[SKUIPlayButtonControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_gradientBackgroundView, 0);
        }
        goto LABEL_14;
      }
      if (!v6)
      {
        -[SKUIPlayButtonControl _defaultBackgroundView](self, "_defaultBackgroundView");
        v10 = (UIView *)objc_claimAutoreleasedReturnValue();
        v11 = self->_backgroundView;
        self->_backgroundView = v10;

        -[SKUIPlayButtonControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
      }
    }
    v12 = self->_gradientBackgroundView;
    if (v12)
    {
      -[SKUIPlayButtonGradientView removeFromSuperview](v12, "removeFromSuperview");
      v13 = self->_gradientBackgroundView;
      self->_gradientBackgroundView = 0;

    }
    if (a3 == 3)
    {
      if (!self->_backdropView)
      {
        -[SKUIPlayButtonControl _classicBackdropView](self, "_classicBackdropView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "effectView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIPlayButtonControl buttonCornerRadius](self, "buttonCornerRadius");
        objc_msgSend(v16, "setCornerRadius:", v17);

        objc_msgSend(v14, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIPlayButtonControl buttonCornerRadius](self, "buttonCornerRadius");
        objc_msgSend(v18, "setCornerRadius:", v19);

        -[SKUIPlayButtonControl insertSubview:atIndex:](self, "insertSubview:atIndex:", v14, 0);
LABEL_16:

        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_14:
    backdropView = self->_backdropView;
    if (backdropView)
    {
      -[_UIBackdropView removeFromSuperview](backdropView, "removeFromSuperview");
      -[_UIBackdropView removeMaskViews](self->_backdropView, "removeMaskViews");
      v14 = self->_backdropView;
      self->_backdropView = 0;
      goto LABEL_16;
    }
LABEL_17:
    -[SKUIPlayButtonControl setShowBorder:](self, "setShowBorder:", 1);
    -[SKUIPlayButtonControl _prepareForReuse](self, "_prepareForReuse");
  }
}

- (void)setBackgroundGradientColors:(id)a3 withGradientType:(int64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (*(_OWORD *)&self->_gradientColors != __PAIR128__(a4, (unint64_t)v7))
  {
    self->_gradientType = a4;
    v8 = v7;
    objc_storeStrong((id *)&self->_gradientColors, a3);
    v7 = v8;
  }

}

- (void)setBufferProgressIndicatorColor:(id)a3 withCompositingFilter:(id)a4
{
  id v7;
  UIColor *bufferProgressIndicatorColor;
  int v9;
  id bufferProgressIndicatorCompositingFilter;
  UIColor *v11;

  v11 = (UIColor *)a3;
  v7 = a4;
  bufferProgressIndicatorColor = self->_bufferProgressIndicatorColor;
  if (bufferProgressIndicatorColor == v11 || (-[UIColor isEqual:](bufferProgressIndicatorColor, "isEqual:") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_bufferProgressIndicatorColor, a3);
    v9 = 1;
  }
  bufferProgressIndicatorCompositingFilter = self->_bufferProgressIndicatorCompositingFilter;
  if (bufferProgressIndicatorCompositingFilter == v7
    || (objc_msgSend(bufferProgressIndicatorCompositingFilter, "isEqual:", v7) & 1) != 0)
  {
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    objc_storeStrong(&self->_bufferProgressIndicatorCompositingFilter, a4);
  }
  -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
LABEL_11:

}

- (void)setControlColor:(id)a3
{
  UIColor *v5;
  UIColor **p_backgroundColor;
  UIColor *backgroundColor;
  char v8;
  unint64_t backgroundType;
  BOOL v10;
  uint64_t v11;
  void *v13;
  UIColor *v14;

  v5 = (UIColor *)a3;
  p_backgroundColor = &self->_backgroundColor;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor != v5)
  {
    v14 = v5;
    v8 = -[UIColor isEqual:](backgroundColor, "isEqual:", v5);
    v5 = v14;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      v5 = v14;
      backgroundType = self->_backgroundType;
      v10 = backgroundType > 4;
      v11 = (1 << backgroundType) & 0x16;
      if (!v10 && v11 != 0)
      {
        -[SKUIPlayButtonControl _backgroundView](self, "_backgroundView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackgroundColor:", *p_backgroundColor);

        v5 = v14;
      }
    }
  }

}

- (void)setSelectionColor:(id)a3 withCompositingFilter:(id)a4
{
  UIColor *v6;
  id v7;
  UIColor *selectionColor;
  UIColor *v9;
  id selectionCompositingFilter;
  id v11;
  void *v12;
  UIColor *v13;
  id v14;

  v6 = (UIColor *)a3;
  v7 = a4;
  selectionColor = self->_selectionColor;
  self->_selectionColor = v6;
  v9 = v6;

  selectionCompositingFilter = self->_selectionCompositingFilter;
  self->_selectionCompositingFilter = v7;
  v11 = v7;

  -[SKUIPlayButtonShapeView layer](self->_selectedLayer, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v9);
  objc_msgSend(v12, "setFillColor:", -[UIColor CGColor](v13, "CGColor"));

  -[SKUIPlayButtonShapeView layer](self->_selectedLayer, "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCompositingFilter:", v11);
}

- (void)setControlForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *controlForeGroundColor;
  char v7;
  void *v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  controlForeGroundColor = self->_controlForeGroundColor;
  if (controlForeGroundColor != v5)
  {
    v9 = v5;
    v7 = -[UIColor isEqual:](controlForeGroundColor, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_controlForeGroundColor, a3);
      -[SKUIPlayButtonControl _imageView](self, "_imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v9);

      v5 = v9;
    }
  }

}

- (void)setCustomPlayImage:(id)a3
{
  UIImage *v5;
  UIImage *customPlayImage;
  char v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  customPlayImage = self->_customPlayImage;
  if (customPlayImage != v5)
  {
    v8 = v5;
    v7 = -[UIImage isEqual:](customPlayImage, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customPlayImage, a3);
      -[SKUIPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:", self->_showingPlayIndicator);
      v5 = v8;
    }
  }

}

- (void)setProgress:(float)a3
{
  -[SKUIPlayButtonControl setProgress:animated:](self, "setProgress:animated:", 0);
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  float v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  if (!self->_showingProgress)
    -[SKUIPlayButtonControl _toggleToPlayState](self, "_toggleToPlayState");
  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921 && self->_indeterminate)
      -[SKUIPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation");
    v7 = fmax(fmin(a3, 1.0), 0.0);
    self->_progress = v7;
    -[SKUIPlayButtonControl _innerProgressLayer](self, "_innerProgressLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDuration:", 0.2);
      objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v9, "setRemovedOnCompletion:", 0);
      *(float *)&v10 = self->_progress;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setToValue:", v11);

      objc_msgSend(v12, "addAnimation:forKey:", v9, 0);
    }
    else
    {
      objc_msgSend(v12, "removeAllAnimations");
      objc_msgSend(v12, "setStrokeEnd:", self->_progress);
    }

  }
}

- (BOOL)showOuterBorder
{
  return 0;
}

- (void)setShowBorder:(BOOL)a3
{
  SKUIPlayButtonShapeView *borderLayer;
  id v4;

  if (self->_showBorder != a3)
  {
    self->_showBorder = a3;
    if (a3)
    {
      -[SKUIPlayButtonControl _borderLayer](self, "_borderLayer");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 0);

    }
    else
    {
      borderLayer = self->_borderLayer;
      if (borderLayer)
        -[SKUIPlayButtonShapeView setHidden:](borderLayer, "setHidden:", 1);
    }
  }
}

- (void)setShowOuterBorder:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  if (self->_showOuterBorder != a3)
  {
    v3 = a3;
    self->_showOuterBorder = a3;
    -[SKUIPlayButtonControl _outerProgressLayer](self, "_outerProgressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", !v3);

    -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
  }
}

- (void)showPlayIndicator:(BOOL)a3
{
  -[SKUIPlayButtonControl showPlayIndicator:force:](self, "showPlayIndicator:force:", a3, 0);
}

- (void)showPlayIndicator:(BOOL)a3 force:(BOOL)a4
{
  if (self->_showingPlayIndicator != a3 || a4)
  {
    self->_showingPlayIndicator = a3;
    -[SKUIPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:");
  }
}

- (void)updateOuterProgressLayerStroke
{
  UIColor *bufferProgressIndicatorColor;
  UIColor *v4;
  int *v5;
  id v6;
  void *v7;
  void *v8;
  UIColor *v9;

  bufferProgressIndicatorColor = self->_bufferProgressIndicatorColor;
  if (bufferProgressIndicatorColor)
  {
    v4 = bufferProgressIndicatorColor;
    v5 = &OBJC_IVAR___SKUIPlayButtonControl__bufferProgressIndicatorCompositingFilter;
  }
  else
  {
    if (self->_usesBlurredBackground
      && !self->_indeterminate
      && !-[SKUIPlayButtonControl showOuterBorder](self, "showOuterBorder"))
    {
      v4 = 0;
      v6 = 0;
      goto LABEL_8;
    }
    -[SKUIPlayButtonControl outerBorderColor](self, "outerBorderColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = &OBJC_IVAR___SKUIPlayButtonControl__progressIndicatorCompositingFilter;
  }
  v6 = *(id *)((char *)&self->super.super.super.super.isa + *v5);
LABEL_8:
  -[SKUIPlayButtonShapeView layer](self->_outerProgressLayer, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v4);
  objc_msgSend(v7, "setStrokeColor:", -[UIColor CGColor](v9, "CGColor"));

  -[SKUIPlayButtonShapeView layer](self->_outerProgressLayer, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v6);

}

- (id)_backgroundView
{
  void *gradientBackgroundView;

  gradientBackgroundView = self->_gradientBackgroundView;
  if (!gradientBackgroundView)
  {
    if (self->_backgroundType == 3)
    {
      gradientBackgroundView = self->_backdropView;
    }
    else
    {
      gradientBackgroundView = self->_backgroundView;
      if (!gradientBackgroundView)
        return 0;
    }
  }
  return gradientBackgroundView;
}

- (void)_beginIndeterminateAnimation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  CGAffineTransform v7;

  -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
  -[SKUIPlayButtonControl _outerProgressLayer](self, "_outerProgressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[SKUIPlayButtonControl _outerProgressLayer](self, "_outerProgressLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeRotation(&v7, -1.57079633);
  objc_msgSend(v5, "setTransform:", &v7);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke;
  v6[3] = &unk_1E739FD38;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 197228, v6, 0, 1.0, 0.0);
}

uint64_t __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[6];

  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E73A4960;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    result = objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, (double)v2++ * 0.25, 0.25);
  }
  while (v2 != 4);
  return result;
}

uint64_t __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 600);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (id)_borderLayer
{
  SKUIPlayButtonShapeView *borderLayer;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  SKUIPlayButtonShapeView *v22;
  SKUIPlayButtonShapeView *v23;
  SKUIPlayButtonShapeView *v24;
  void *v25;
  void *v26;
  id v27;
  SKUIPlayButtonShapeView *v28;
  void *v29;
  id v30;

  borderLayer = self->_borderLayer;
  if (!borderLayer)
  {
    -[SKUIPlayButtonControl buttonSize](self, "buttonSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = -1.0 / v9;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = -1.0 / v12;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v16 = v5 + 1.0 / v15 * 2.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v7 + 1.0 / v18 * 2.0;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    v22 = -[SKUIPlayButtonControl _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", v10, v13, v16, v19, 1.0 / v21);
    v23 = self->_borderLayer;
    self->_borderLayer = v22;

    v24 = self->_borderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonShapeView setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[SKUIPlayButtonShapeView layer](self->_borderLayer, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "setFillColor:", objc_msgSend(v27, "CGColor"));

    v28 = self->_borderLayer;
    if (self->_innerProgressLayer)
      -[SKUIPlayButtonControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v28);
    else
      -[SKUIPlayButtonControl addSubview:](self, "addSubview:", v28);
    -[SKUIPlayButtonShapeView layer](self->_borderLayer, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v29, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

    borderLayer = self->_borderLayer;
  }
  return borderLayer;
}

- (id)_cancelImage
{
  void *v2;
  void *v3;

  -[SKUIPlayButtonControl cancelImage](self, "cancelImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SKUIPlayButtonControl _gradientBackgroundView](self, "_gradientBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (a4 != 1)
      goto LABEL_6;
    v9 = 0.5;
    v10 = 1.0;
    v11 = 0.0;
    v12 = 0.5;
  }
  else
  {
    v12 = 1.0;
    v11 = 0.5;
    v9 = 0.0;
    v10 = 0.5;
  }
  objc_msgSend(v8, "setStartPoint:", v11, v9);
  objc_msgSend(v8, "setEndPoint:", v10, v12);
LABEL_6:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18));
        objc_msgSend(v13, "addObject:", objc_msgSend(v19, "CGColor", (_QWORD)v20));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  objc_msgSend(v8, "setColors:", v13);
}

- (id)_classicBackdropView
{
  _UIBackdropView *backdropView;
  void *v4;
  void *v5;
  int v6;
  double v7;
  id v8;
  _UIBackdropView *v9;
  _UIBackdropView *v10;

  backdropView = self->_backdropView;
  if (!backdropView)
  {
    objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:", 2010);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setColorBurnTintAlpha:", 0.0);
    objc_msgSend(v4, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.862745098, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setColorTint:", v5);

    v6 = -[SKUIPlayButtonControl isHighlighted](self, "isHighlighted");
    v7 = 0.7;
    if (v6)
      v7 = 0.35;
    objc_msgSend(v4, "setColorTintAlpha:", v7);
    objc_msgSend(v4, "setDarkeningTintAlpha:", 0.0);
    objc_msgSend(v4, "setScale:", 0.5);
    v8 = objc_alloc(MEMORY[0x1E0DC4028]);
    -[SKUIPlayButtonControl bounds](self, "bounds");
    v9 = (_UIBackdropView *)objc_msgSend(v8, "initWithFrame:settings:", v4);
    v10 = self->_backdropView;
    self->_backdropView = v9;

    -[_UIBackdropView setComputesColorSettings:](self->_backdropView, "setComputesColorSettings:", 0);
    -[_UIBackdropView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
    if (self->_backdropGroupName)
      -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:");

    backdropView = self->_backdropView;
  }
  return backdropView;
}

- (id)_defaultBackgroundView
{
  UIView *backgroundView;
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  float v8;
  UIView *v9;
  void *v10;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_backgroundView;
    self->_backgroundView = v5;

    -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView layer](self->_backgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonControl buttonCornerRadius](self, "buttonCornerRadius");
    objc_msgSend(v7, "setCornerRadius:", v8);

    v9 = self->_backgroundView;
    -[SKUIPlayButtonControl defaultBackgroundColor](self, "defaultBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (BOOL)_renderAsEnabled
{
  int v3;

  v3 = -[SKUIPlayButtonControl isEnabled](self, "isEnabled");
  if (v3)
    LOBYTE(v3) = !-[SKUIPlayButtonControl isDisabledButSelectable](self, "isDisabledButSelectable");
  return v3;
}

- (id)_gradientBackgroundView
{
  SKUIPlayButtonGradientView *gradientBackgroundView;
  SKUIPlayButtonGradientView *v4;
  SKUIPlayButtonGradientView *v5;
  SKUIPlayButtonGradientView *v6;
  void *v7;
  float v8;
  SKUIPlayButtonGradientView *v9;
  void *v10;

  gradientBackgroundView = self->_gradientBackgroundView;
  if (!gradientBackgroundView)
  {
    v4 = [SKUIPlayButtonGradientView alloc];
    v5 = -[SKUIPlayButtonGradientView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_gradientBackgroundView;
    self->_gradientBackgroundView = v5;

    -[SKUIPlayButtonGradientView setUserInteractionEnabled:](self->_gradientBackgroundView, "setUserInteractionEnabled:", 0);
    -[SKUIPlayButtonGradientView layer](self->_gradientBackgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonControl buttonCornerRadius](self, "buttonCornerRadius");
    objc_msgSend(v7, "setCornerRadius:", v8);

    v9 = self->_gradientBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonGradientView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[SKUIPlayButtonGradientView setClipsToBounds:](self->_gradientBackgroundView, "setClipsToBounds:", 1);
    gradientBackgroundView = self->_gradientBackgroundView;
  }
  return gradientBackgroundView;
}

- (id)_imageView
{
  UIImageView *imageView;
  id v4;
  UIImageView *v5;
  UIImageView *v6;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_imageView;
    self->_imageView = v5;

    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 4);
    -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setOpaque:](self->_imageView, "setOpaque:", 0);
    -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", 0);
    imageView = self->_imageView;
  }
  return imageView;
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SKUIPlayButtonShapeView *v9;
  SKUIPlayButtonShapeView *v10;
  void *v11;
  const CGPath *v12;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = [SKUIPlayButtonShapeView alloc];
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v16 = CGRectInset(v15, a4 * 0.5, a4 * 0.5);
  v10 = -[SKUIPlayButtonShapeView initWithFrame:](v9, "initWithFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  CGAffineTransformMakeRotation(&v14, -1.57079633);
  -[SKUIPlayButtonShapeView setTransform:](v10, "setTransform:", &v14);
  -[SKUIPlayButtonShapeView layer](v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineWidth:", a4);
  -[SKUIPlayButtonShapeView bounds](v10, "bounds");
  v12 = CGPathCreateWithEllipseInRect(v17, 0);
  objc_msgSend(v11, "setPath:", v12);
  objc_msgSend(v11, "setLineCap:", CFSTR("round"));
  CGPathRelease(v12);
  -[SKUIPlayButtonShapeView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);

  return v10;
}

- (void)_prepareForReuse
{
  SKUIPlayButtonShapeView *outerProgressLayer;
  SKUIPlayButtonShapeView *v4;
  SKUIPlayButtonShapeView *innerProgressLayer;
  SKUIPlayButtonShapeView *v6;
  UIColor *progressIndicatorColor;
  float v8;
  double v9;
  void *v10;
  void *v11;
  UIColor *v12;
  UIColor *controlForeGroundColor;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIColor *v18;
  void *v19;
  UIView *backgroundView;
  void *v21;
  float v22;
  void *v23;

  objc_storeWeak((id *)&self->_backgroundImageForBlurring, 0);
  self->_indeterminate = 0;
  self->_progress = 0.0;
  self->_showingProgress = 0;
  self->_showingPlayIndicator = 1;
  self->_showOuterBorder = 0;
  outerProgressLayer = self->_outerProgressLayer;
  if (outerProgressLayer)
  {
    -[SKUIPlayButtonShapeView removeFromSuperview](outerProgressLayer, "removeFromSuperview");
    v4 = self->_outerProgressLayer;
    self->_outerProgressLayer = 0;

  }
  innerProgressLayer = self->_innerProgressLayer;
  if (innerProgressLayer)
  {
    -[SKUIPlayButtonShapeView removeFromSuperview](innerProgressLayer, "removeFromSuperview");
    v6 = self->_innerProgressLayer;
    self->_innerProgressLayer = 0;

  }
  progressIndicatorColor = self->_progressIndicatorColor;
  self->_progressIndicatorColor = 0;

  if (-[SKUIPlayButtonControl _renderAsEnabled](self, "_renderAsEnabled"))
  {
    -[SKUIPlayButtonControl playButtonDefaultAlpha](self, "playButtonDefaultAlpha");
    v9 = v8;
  }
  else
  {
    v9 = 0.4;
  }
  -[SKUIPlayButtonControl _imageView](self, "_imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  -[SKUIPlayButtonControl _imageView](self, "_imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v9);

  if ((self->_backgroundType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[SKUIPlayButtonControl _useBlurredBackground:](self, "_useBlurredBackground:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
    controlForeGroundColor = self->_controlForeGroundColor;
    self->_controlForeGroundColor = v12;

    -[SKUIPlayButtonControl _imageView](self, "_imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = *MEMORY[0x1E0CD2E98];
  }
  else
  {
    -[SKUIPlayButtonControl _useBlurredBackground:](self, "_useBlurredBackground:", 0);
    v18 = self->_controlForeGroundColor;
    self->_controlForeGroundColor = 0;

    -[SKUIPlayButtonControl _imageView](self, "_imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0;
  }
  objc_msgSend(v15, "setCompositingFilter:", v17);

  -[SKUIPlayButtonControl _imageView](self, "_imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTintColor:", self->_controlForeGroundColor);

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView layer](backgroundView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonControl buttonCornerRadius](self, "buttonCornerRadius");
    objc_msgSend(v21, "setCornerRadius:", v22);

  }
  -[SKUIPlayButtonControl setControlForegroundColor:](self, "setControlForegroundColor:", self->_controlForeGroundColor);
  -[SKUIPlayButtonControl defaultBackgroundColor](self, "defaultBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIPlayButtonControl setControlColor:](self, "setControlColor:", v23);

  -[SKUIPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:", 1);
  -[SKUIPlayButtonControl setNeedsLayout](self, "setNeedsLayout");
}

- (id)_innerProgressLayer
{
  SKUIPlayButtonShapeView *innerProgressLayer;
  double v4;
  double v5;
  SKUIPlayButtonShapeView *v6;
  SKUIPlayButtonShapeView *v7;
  SKUIPlayButtonShapeView *v8;
  void *v9;
  void *v10;
  id v11;

  innerProgressLayer = self->_innerProgressLayer;
  if (!innerProgressLayer)
  {
    -[SKUIPlayButtonControl buttonSize](self, "buttonSize");
    v6 = -[SKUIPlayButtonControl _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 2.0);
    v7 = self->_innerProgressLayer;
    self->_innerProgressLayer = v6;

    v8 = self->_innerProgressLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonShapeView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SKUIPlayButtonShapeView layer](self->_innerProgressLayer, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(v10, "setStrokeEnd:", 0.0);
    -[SKUIPlayButtonControl addSubview:](self, "addSubview:", self->_innerProgressLayer);
    -[SKUIPlayButtonControl _updateInnerProgressLayerStroke](self, "_updateInnerProgressLayerStroke");

    innerProgressLayer = self->_innerProgressLayer;
  }
  return innerProgressLayer;
}

- (id)_outerProgressLayer
{
  SKUIPlayButtonShapeView *outerProgressLayer;
  double v4;
  double v5;
  SKUIPlayButtonShapeView *v6;
  SKUIPlayButtonShapeView *v7;
  SKUIPlayButtonShapeView *v8;
  void *v9;
  void *v10;
  id v11;
  SKUIPlayButtonShapeView *v12;

  outerProgressLayer = self->_outerProgressLayer;
  if (!outerProgressLayer)
  {
    -[SKUIPlayButtonControl buttonSize](self, "buttonSize");
    v6 = -[SKUIPlayButtonControl _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 1.5);
    v7 = self->_outerProgressLayer;
    self->_outerProgressLayer = v6;

    v8 = self->_outerProgressLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonShapeView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SKUIPlayButtonShapeView layer](self->_outerProgressLayer, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    v12 = self->_outerProgressLayer;
    if (self->_innerProgressLayer)
      -[SKUIPlayButtonControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v12);
    else
      -[SKUIPlayButtonControl addSubview:](self, "addSubview:", v12);
    -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");

    outerProgressLayer = self->_outerProgressLayer;
  }
  return outerProgressLayer;
}

- (id)_playImage
{
  void *v2;
  void *v3;

  -[SKUIPlayButtonControl playImage](self, "playImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_selectedLayer
{
  SKUIPlayButtonShapeView *selectedLayer;
  double v4;
  double v5;
  SKUIPlayButtonShapeView *v6;
  SKUIPlayButtonShapeView *v7;
  void *v8;
  UIColor *selectionColor;
  void *v10;
  const CGPath *v11;
  CGRect v13;

  selectedLayer = self->_selectedLayer;
  if (!selectedLayer)
  {
    -[SKUIPlayButtonControl buttonSize](self, "buttonSize");
    v6 = -[SKUIPlayButtonShapeView initWithFrame:]([SKUIPlayButtonShapeView alloc], "initWithFrame:", 0.0, 0.0, v4, v5);
    v7 = self->_selectedLayer;
    self->_selectedLayer = v6;

    -[SKUIPlayButtonShapeView layer](self->_selectedLayer, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    selectionColor = self->_selectionColor;
    if (selectionColor)
    {
      -[SKUIPlayButtonControl setSelectionColor:withCompositingFilter:](self, "setSelectionColor:withCompositingFilter:", selectionColor, self->_selectionCompositingFilter);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIPlayButtonControl setSelectionColor:withCompositingFilter:](self, "setSelectionColor:withCompositingFilter:", v10, self->_selectionCompositingFilter);

    }
    -[SKUIPlayButtonShapeView bounds](self->_selectedLayer, "bounds");
    v11 = CGPathCreateWithEllipseInRect(v13, 0);
    objc_msgSend(v8, "setPath:", v11);
    CGPathRelease(v11);
    -[SKUIPlayButtonControl addSubview:](self, "addSubview:", self->_selectedLayer);
    -[SKUIPlayButtonShapeView setUserInteractionEnabled:](self->_selectedLayer, "setUserInteractionEnabled:", 0);

    selectedLayer = self->_selectedLayer;
  }
  return selectedLayer;
}

- (void)_showPlayIndicator:(BOOL)a3
{
  _BOOL8 v3;
  UIImageView *imageView;
  void *v6;

  v3 = a3;
  imageView = self->_imageView;
  if (a3)
    -[SKUIPlayButtonControl _playImage](self, "_playImage");
  else
    -[SKUIPlayButtonControl _cancelImage](self, "_cancelImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v6);

  -[SKUIPlayButtonControl playIndicatorDidChange:](self, "playIndicatorDidChange:", v3);
  -[SKUIPlayButtonControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)_toggleToPlayState
{
  void *v3;
  id v4;

  self->_showingProgress = 1;
  self->_showingPlayIndicator = 0;
  -[SKUIPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:", 0);
  -[SKUIPlayButtonControl _outerProgressLayer](self, "_outerProgressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[SKUIPlayButtonControl _innerProgressLayer](self, "_innerProgressLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)_updateBackdropView
{
  void *v3;
  void *v4;
  _UIBackdropView *backdropView;
  id v6;

  -[_UIBackdropView outputSettings](self->_backdropView, "outputSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computeOutputSettingsUsingModel:", v4);

  backdropView = self->_backdropView;
  -[_UIBackdropView outputSettings](backdropView, "outputSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView applySettings:](backdropView, "applySettings:", v6);

}

- (void)_updateBackgroundBlur:(id)a3 withOffsetRight:(float)a4 withOffsetBottom:(float)a5
{
  id v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void (**v13)(void *, void *);
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(void *, void *);
  uint64_t *v23;
  id v24;
  float v25;
  float v26;
  id location;
  _QWORD aBlock[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  objc_getAssociatedObject(v8, (const void *)_SKUIPlayButtonControlBackgroundImageAssociatedObjectKeyColorCache);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIPlayButtonControl buttonSize](self, "buttonSize");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a4, a5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke;
  aBlock[3] = &unk_1E73A5318;
  aBlock[4] = self;
  v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend((id)v30[5], "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {

      v14 = 0;
    }
    v13[2](v13, v14);
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_2;
    v19[3] = &unk_1E73A5368;
    objc_copyWeak(&v24, &location);
    v18 = v8;
    v25 = a4;
    v26 = a5;
    v20 = v18;
    v23 = &v29;
    v21 = v11;
    v22 = v13;
    dispatch_async(v17, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    v14 = 0;
  }

  _Block_object_dispose(&v29, 8);
}

void __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackgroundColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

void __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "buttonSize");
    +[SKUIPlayButtonControl blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:](SKUIPlayButtonControl, "blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_3;
    block[3] = &unk_1E73A5340;
    v12 = *(_QWORD *)(a1 + 56);
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_getAssociatedObject(*(id *)(a1 + 32), (const void *)_SKUIPlayButtonControlBackgroundImageAssociatedObjectKeyColorCache);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_setAssociatedObject(*(id *)(a1 + 32), (const void *)_SKUIPlayButtonControlBackgroundImageAssociatedObjectKeyColorCache, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), (void *)1);
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v5, "setObject:forKey:", v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, *(_QWORD *)(a1 + 48));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_useBlurredBackground:(BOOL)a3
{
  if (self->_usesBlurredBackground != a3)
    self->_usesBlurredBackground = a3;
}

- (void)_updateInnerProgressLayerStroke
{
  UIColor *progressIndicatorColor;
  UIColor *v4;
  id v5;
  void *v6;
  void *v7;
  UIColor *v8;

  progressIndicatorColor = self->_progressIndicatorColor;
  if (progressIndicatorColor)
  {
    v4 = progressIndicatorColor;
    v5 = self->_progressIndicatorCompositingFilter;
  }
  else
  {
    -[SKUIPlayButtonControl tintColor](self, "tintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  -[SKUIPlayButtonShapeView layer](self->_innerProgressLayer, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "setStrokeColor:", -[UIColor CGColor](v8, "CGColor"));

  -[SKUIPlayButtonShapeView layer](self->_innerProgressLayer, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v5);

}

- (void)_updateEnabledState
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;

  if (self->_backgroundType == 3)
  {
    -[SKUIPlayButtonControl _classicBackdropView](self, "_classicBackdropView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", -[SKUIPlayButtonControl _renderAsEnabled](self, "_renderAsEnabled"));

    objc_msgSend(v3, "inputSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", 0);

  }
  else
  {
    if (-[SKUIPlayButtonControl _renderAsEnabled](self, "_renderAsEnabled"))
    {
      -[SKUIPlayButtonControl playButtonDefaultAlpha](self, "playButtonDefaultAlpha");
      v7 = v6;
    }
    else
    {
      v7 = 0.4;
    }
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v7);
  }
  -[SKUIPlayButtonControl setNeedsLayout](self, "setNeedsLayout");
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
  v12 = malloc_type_malloc(v11 * (unint64_t)a5.height, 0x7DAF1F6BuLL);
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
    v26 = qword_1BBED1DE0[v15];
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
  result = ($8452678F12DBC466148836A9D382CAFC *)__SK_RGBtoHSV(&v53, &v52, &v51, v39 * 0.00392156863, v41 * 0.00392156863, v43 * 0.00392156863);
  if (a4)
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

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIColor)controlForeGroundColor
{
  return self->_controlForeGroundColor;
}

- (UIImage)customPlayImage
{
  return self->_customPlayImage;
}

- (UIImage)customToggleImage
{
  return self->_customToggleImage;
}

- (void)setCustomToggleImage:(id)a3
{
  objc_storeStrong((id *)&self->_customToggleImage, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)showingPlayIndicator
{
  return self->_showingPlayIndicator;
}

- (UIColor)progressIndicatorColor
{
  return self->_progressIndicatorColor;
}

- (BOOL)showingProgress
{
  return self->_showingProgress;
}

- (UIEdgeInsets)bigHitInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_bigHitInsets.top;
  left = self->_bigHitInsets.left;
  bottom = self->_bigHitInsets.bottom;
  right = self->_bigHitInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBigHitInsets:(UIEdgeInsets)a3
{
  self->_bigHitInsets = a3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UIImage)backgroundImageForBlurring
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_backgroundImageForBlurring);
}

- (void)setBackgroundImageForBlurring:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundImageForBlurring, a3);
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (SKUIButtonViewElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_destroyWeak((id *)&self->_backgroundImageForBlurring);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong(&self->_selectionCompositingFilter, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
  objc_storeStrong(&self->_progressIndicatorCompositingFilter, 0);
  objc_storeStrong((id *)&self->_progressIndicatorColor, 0);
  objc_storeStrong((id *)&self->_selectedLayer, 0);
  objc_storeStrong((id *)&self->_outerProgressLayer, 0);
  objc_storeStrong((id *)&self->_innerProgressLayer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
  objc_storeStrong((id *)&self->_customToggleImage, 0);
  objc_storeStrong((id *)&self->_customPlayImage, 0);
  objc_storeStrong(&self->_bufferProgressIndicatorCompositingFilter, 0);
  objc_storeStrong((id *)&self->_controlForeGroundColor, 0);
  objc_storeStrong((id *)&self->_bufferProgressIndicatorColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPlayButtonControl initWithFrame:]";
}

@end
