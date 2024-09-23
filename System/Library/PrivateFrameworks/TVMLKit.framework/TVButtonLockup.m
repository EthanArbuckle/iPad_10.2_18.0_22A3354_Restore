@implementation TVButtonLockup

- (TVButtonLockup)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 groupName:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  TVButtonLockup *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  _UIFloatingContentView *floatingView;
  _TVVisualEffectView *v20;
  void *v21;
  uint64_t v22;
  _TVVisualEffectView *backdropView;
  void *v24;
  uint64_t v25;
  UIView *overlayView;
  UIView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)TVButtonLockup;
  v12 = -[TVButtonLockup initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BDF70B8]);
    v14 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], v15, v16, v17);
    floatingView = v12->_floatingView;
    v12->_floatingView = (_UIFloatingContentView *)v18;

    -[_UIFloatingContentView setBackgroundColor:forState:](v12->_floatingView, "setBackgroundColor:forState:", 0, 8);
    -[_UIFloatingContentView setBackgroundColor:forState:](v12->_floatingView, "setBackgroundColor:forState:", 0, 1);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v12->_floatingView, "setFocusedSizeIncrease:", 14.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v12->_floatingView, "setContentMotionRotation:translation:", 0.0, 0.0, 8.0, 0.0);
    -[_UIFloatingContentView setFocusScaleAnchorPoint:](v12->_floatingView, "setFocusScaleAnchorPoint:", 0.5, 1.0);
    -[_UIFloatingContentView setShadowRadius:](v12->_floatingView, "setShadowRadius:", 30.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v12->_floatingView, "setShadowVerticalOffset:", 15.0);
    -[_UIFloatingContentView setShadowOpacity:](v12->_floatingView, "setShadowOpacity:", 0.25);
    -[_UIFloatingContentView setCornerRadius:](v12->_floatingView, "setCornerRadius:", 6.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v12->_floatingView, "setContinuousCornerEnabled:", 0);
    -[_UIFloatingContentView setVisualEffectContainerViewScaleFactor:](v12->_floatingView, "setVisualEffectContainerViewScaleFactor:", 0.988);
    -[TVButtonLockup addSubview:](v12, "addSubview:", v12->_floatingView);
    v12->_backdropStyle = a4;
    v12->_vibrantLabelThemeOverride = 0;
    v20 = [_TVVisualEffectView alloc];
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", v12->_backdropStyle);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_TVVisualEffectView initWithEffect:](v20, "initWithEffect:", v21);
    backdropView = v12->_backdropView;
    v12->_backdropView = (_TVVisualEffectView *)v22;

    -[_TVVisualEffectView _setCornerRadius:](v12->_backdropView, "_setCornerRadius:", 6.0);
    if (objc_msgSend(v11, "length"))
      -[_TVVisualEffectView _setGroupName:](v12->_backdropView, "_setGroupName:", v11);
    -[_UIFloatingContentView visualEffectContainerView](v12->_floatingView, "visualEffectContainerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v12->_backdropView);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v14, v15, v16, v17);
    overlayView = v12->_overlayView;
    v12->_overlayView = (UIView *)v25;

    -[UIView setUserInteractionEnabled:](v12->_overlayView, "setUserInteractionEnabled:", 0);
    v27 = v12->_overlayView;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v27, "setBackgroundColor:", v28);

    -[UIView setAlpha:](v12->_overlayView, "setAlpha:", 0.0);
    -[UIView _setCornerRadius:](v12->_overlayView, "_setCornerRadius:", 6.0);
    -[_UIFloatingContentView contentView](v12->_floatingView, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v12->_overlayView);

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v12, sel__selectButtonAction_);
    -[TVButtonLockup addGestureRecognizer:](v12, "addGestureRecognizer:", v30);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v12, sel__playButtonAction_);
    objc_msgSend(v31, "setAllowedPressTypes:", &unk_24EBCD508);
    -[TVButtonLockup addGestureRecognizer:](v12, "addGestureRecognizer:", v31);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v12, sel__updateForAccessibilityChange, *MEMORY[0x24BED27B0], 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup dealloc](&v4, sel_dealloc);
}

- (void)setDisabled:(BOOL)a3
{
  _TVVisualEffectView *backdropView;
  double v4;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    backdropView = self->_backdropView;
    v4 = 1.0;
    if (a3)
      v4 = 0.5;
    -[_TVVisualEffectView setAlpha:](backdropView, "setAlpha:", v4);
  }
}

- (void)setText:(id)a3 minimumScale:(double)a4 maxNumberOfLines:(unint64_t)a5
{
  void *v8;
  double v9;
  NSInteger v10;
  void *v11;
  _TVImageView *imageView;
  CALayer *imageMask;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UILabel *v20;
  UILabel *textView;
  void *v22;
  UILabel *v23;
  UILabel *textMask;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[UILabel attributedText](self->_textView, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToAttributedString:", v35)
    && (-[UILabel minimumScaleFactor](self->_textView, "minimumScaleFactor"), v9 == a4))
  {
    v10 = -[UILabel numberOfLines](self->_textView, "numberOfLines");

    if (v10 == a5)
      goto LABEL_15;
  }
  else
  {

  }
  if (self->_imageView)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("TVMLImageViewImageDidLoadNotification"), 0);

    -[_TVImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    imageView = self->_imageView;
    self->_imageView = 0;

    -[CALayer removeFromSuperlayer](self->_imageMask, "removeFromSuperlayer");
    imageMask = self->_imageMask;
    self->_imageMask = 0;

  }
  -[UILabel removeFromSuperview](self->_textView, "removeFromSuperview");
  -[UILabel layer](self->_textMask, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperlayer");

  v15 = objc_alloc(MEMORY[0x24BDF6B68]);
  v16 = *MEMORY[0x24BDBF090];
  v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v20 = (UILabel *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x24BDBF090], v17, v18, v19);
  textView = self->_textView;
  self->_textView = v20;

  -[UILabel setAttributedText:](self->_textView, "setAttributedText:", v35);
  -[UILabel setOpaque:](self->_textView, "setOpaque:", 0);
  -[UILabel setBackgroundColor:](self->_textView, "setBackgroundColor:", 0);
  -[UILabel setNumberOfLines:](self->_textView, "setNumberOfLines:", a5);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_textView, "setAdjustsFontForContentSizeCategory:", 1);
  -[_UIFloatingContentView contentView](self->_floatingView, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "insertSubview:above:", self->_textView, self->_overlayView);

  v23 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v16, v17, v18, v19);
  textMask = self->_textMask;
  self->_textMask = v23;

  v25 = (void *)objc_msgSend(v35, "mutableCopy");
  v26 = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "string");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAttribute:value:range:", v26, v27, 0, objc_msgSend(v28, "length"));

  v29 = self->_textMask;
  v30 = (void *)objc_msgSend(v25, "copy");
  -[UILabel setAttributedText:](v29, "setAttributedText:", v30);

  -[UILabel setOpaque:](self->_textMask, "setOpaque:", 0);
  -[UILabel setBackgroundColor:](self->_textMask, "setBackgroundColor:", 0);
  -[UILabel setNumberOfLines:](self->_textMask, "setNumberOfLines:", a5);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_textMask, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel layer](self->_textMask, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSHighContrastFocusIndicatorsEnabled())
    v32 = 0;
  else
    v32 = *MEMORY[0x24BDE5A48];
  objc_msgSend(v31, "setCompositingFilter:", v32);

  -[UIView layer](self->_overlayView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel layer](self->_textMask, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSublayer:", v34);

  if (a4 > 0.0 && a4 < 1.0)
  {
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_textView, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_textView, "setMinimumScaleFactor:", a4);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_textMask, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_textMask, "setMinimumScaleFactor:", a4);
  }
  -[TVButtonLockup setNeedsLayout](self, "setNeedsLayout");

LABEL_15:
}

- (void)setImageView:(id)a3
{
  _TVImageView *v5;
  _TVImageView **p_imageView;
  UILabel *textView;
  UILabel *v8;
  void *v9;
  UILabel *textMask;
  void *v11;
  CALayer *imageMask;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _TVImageView *v20;

  v5 = (_TVImageView *)a3;
  p_imageView = &self->_imageView;
  v20 = v5;
  if (self->_imageView == v5)
  {
    if (!v5)
      goto LABEL_10;
    -[_TVImageView image](v5, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObserver:name:object:", self, CFSTR("TVMLImageViewImageDidLoadNotification"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__updateImageMask, CFSTR("TVMLImageViewImageDidLoadNotification"), *p_imageView);

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  textView = self->_textView;
  if (textView)
  {
    -[UILabel removeFromSuperview](textView, "removeFromSuperview");
    v8 = self->_textView;
    self->_textView = 0;

    -[UILabel layer](self->_textMask, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperlayer");

    textMask = self->_textMask;
    self->_textMask = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("TVMLImageViewImageDidLoadNotification"), 0);

  -[_TVImageView removeFromSuperview](*p_imageView, "removeFromSuperview");
  -[CALayer removeFromSuperlayer](self->_imageMask, "removeFromSuperlayer");
  imageMask = self->_imageMask;
  self->_imageMask = 0;

  objc_storeStrong((id *)&self->_imageView, a3);
  if (*p_imageView)
  {
    -[_UIFloatingContentView contentView](self->_floatingView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertSubview:below:", *p_imageView, self->_overlayView);

    -[_TVImageView image](*p_imageView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", self, CFSTR("TVMLImageViewImageDidLoadNotification"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__updateImageMask, CFSTR("TVMLImageViewImageDidLoadNotification"), *p_imageView);

      goto LABEL_10;
    }
LABEL_9:
    -[TVButtonLockup _updateImageMask](self, "_updateImageMask");
  }
LABEL_10:
  -[TVButtonLockup setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTitleView:(id)a3
{
  UILabel *v5;
  UILabel *titleView;
  UILabel *v7;

  v5 = (UILabel *)a3;
  titleView = self->_titleView;
  v7 = v5;
  if (titleView != v5)
  {
    -[UILabel removeFromSuperview](titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    if (self->_titleView)
      -[TVButtonLockup addSubview:](self, "addSubview:");
  }
  -[TVButtonLockup setNeedsLayout](self, "setNeedsLayout");

}

- (id)backgroundColor
{
  return self->__backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *backgroundColor;
  void *v7;
  void *v8;
  UIColor *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVButtonLockup;
  v4 = a3;
  -[TVButtonLockup setBackgroundColor:](&v11, sel_setBackgroundColor_, v4);
  v5 = (UIColor *)objc_msgSend(v4, "copy", v11.receiver, v11.super_class);

  backgroundColor = self->__backgroundColor;
  self->__backgroundColor = v5;

  if (self->__backgroundColor)
  {
    -[_TVVisualEffectView removeFromSuperview](self->_backdropView, "removeFromSuperview");
    -[_UIFloatingContentView contentView](self->_floatingView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = self->__backgroundColor;
  }
  else
  {
    -[_UIFloatingContentView visualEffectContainerView](self->_floatingView, "visualEffectContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_backdropView);

    -[_UIFloatingContentView contentView](self->_floatingView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "setBackgroundColor:", v9);

}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  UIColor **p_highlightColor;
  UIView *overlayView;
  void *v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  p_highlightColor = &self->_highlightColor;
  if (self->_highlightColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    overlayView = self->_overlayView;
    if (*p_highlightColor)
    {
      -[UIView setBackgroundColor:](overlayView, "setBackgroundColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](overlayView, "setBackgroundColor:", v8);

    }
    v5 = v9;
  }

}

- (BOOL)canBecomeFocused
{
  return !self->_disabled;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVButtonLockup;
  v6 = a4;
  -[TVButtonLockup didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, v6);
  if (-[TVButtonLockup isFocused](self, "isFocused", v8.receiver, v8.super_class))
    v7 = 8;
  else
    v7 = 0;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self->_floatingView, "setControlState:withAnimationCoordinator:", v7, v6);

  -[TVButtonLockup _updateForFocusStateChange](self, "_updateForFocusStateChange");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVButtonLockup;
  v6 = a3;
  -[TVButtonLockup pressesBegan:withEvent:](&v9, sel_pressesBegan_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "type");
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    if (-[TVButtonLockup isFocused](self, "isFocused"))
      -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 9, 1);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  _UIFloatingContentView *floatingView;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup pressesCancelled:withEvent:](&v7, sel_pressesCancelled_withEvent_, a3, a4);
  if ((-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 1) != 0)
  {
    floatingView = self->_floatingView;
    if (-[TVButtonLockup isFocused](self, "isFocused"))
      v6 = 8;
    else
      v6 = 0;
    -[_UIFloatingContentView setControlState:animated:](floatingView, "setControlState:animated:", v6, 1);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  _UIFloatingContentView *floatingView;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup pressesEnded:withEvent:](&v7, sel_pressesEnded_withEvent_, a3, a4);
  if ((-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 1) != 0)
  {
    floatingView = self->_floatingView;
    if (-[TVButtonLockup isFocused](self, "isFocused"))
      v6 = 8;
    else
      v6 = 0;
    -[_UIFloatingContentView setControlState:animated:](floatingView, "setControlState:animated:", v6, 1);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 9, 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL4 v18;
  uint64_t v19;
  objc_super v20;
  CGPoint v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)TVButtonLockup;
  v6 = a3;
  -[TVButtonLockup touchesMoved:withEvent:](&v20, sel_touchesMoved_withEvent_, v6, a4);
  -[TVButtonLockup bounds](self, "bounds", v20.receiver, v20.super_class);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "locationInView:", self);
  v21.x = v16;
  v21.y = v17;
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v18 = CGRectContainsPoint(v22, v21);

  if (v18)
    v19 = 9;
  else
    v19 = 0;
  -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", v19, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  if ((-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 1) != 0)
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 0, 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  if ((-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 1) != 0)
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 0, 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
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
  CGSize result;

  -[UIView tv_itemWidth](self, "tv_itemWidth", a3.width, a3.height);
  if (v4 == 0.0)
    v5 = 142.0;
  else
    v5 = v4;
  -[UIView tv_itemHeight](self, "tv_itemHeight");
  if (v6 == 0.0)
    v7 = 80.0;
  else
    v7 = v6;
  -[TVButtonLockup titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tv_margin");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[TVButtonLockup titleView](self, "titleView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v5 - (v12 + v16), 0.0);
  v19 = v18;

  v20 = v14 + v7 + v10 + v19;
  v21 = v5;
  result.height = v20;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  _TVImageView *imageView;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup layoutSubviews](&v46, sel_layoutSubviews);
  -[UIView tv_itemWidth](self, "tv_itemWidth");
  if (v3 == 0.0)
    v4 = 142.0;
  else
    v4 = v3;
  -[UIView tv_itemHeight](self, "tv_itemHeight");
  if (v5 == 0.0)
    v6 = 80.0;
  else
    v6 = v5;
  -[TVButtonLockup titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_margin");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v4 - (v11 + v13);
  -[TVButtonLockup titleView](self, "titleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v14, 0.0);
  v17 = v16;

  -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", 0.0, 0.0, v4, v6);
  -[_TVVisualEffectView setFrame:](self->_backdropView, "setFrame:", 0.0, 0.0, v4, v6);
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, 0.0, v4, v6);
  if (self->_textView)
  {
    -[UIView tv_padding](self, "tv_padding");
    v19 = v18;
    v21 = v20;
    -[UILabel tv_margin](self->_textView, "tv_margin");
    -[UILabel tv_textSizeForWidth:](self->_textView, "tv_textSizeForWidth:", v4 - (v21 + v23 + v19 + v22));
    v25 = v24;
    v27 = v26;
    v28 = floor((v4 - v24) * 0.5);
    v44 = v14;
    v29 = v11;
    v30 = v17;
    v31 = v9;
    v32 = floor((v6 - v26) * 0.5);
    -[UILabel setFrame:](self->_textView, "setFrame:", v28, v32, v24, v26);
    -[UILabel layer](self->_textMask, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v32;
    v9 = v31;
    v17 = v30;
    v11 = v29;
    v14 = v44;
    objc_msgSend(v33, "setFrame:", v28, v34, v25, v27);

  }
  else
  {
    imageView = self->_imageView;
    if (imageView)
    {
      -[_TVImageView sizeThatFits:](imageView, "sizeThatFits:", v4, v6);
      v45 = v9;
      v37 = v36;
      v39 = v38;
      v40 = floor((v4 - v36) * 0.5);
      v41 = floor((v6 - v38) * 0.5);
      -[_TVImageView setFrame:](self->_imageView, "setFrame:", v40, v41, v36, v38);
      v42 = v37;
      v9 = v45;
      -[CALayer setFrame:](self->_imageMask, "setFrame:", v40, v41, v42, v39);
    }
  }
  -[TVButtonLockup titleView](self, "titleView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", v11, v6 + v9 + -7.0, v14, v17 + 2.0 + 12.0);

  -[TVButtonLockup _updateForFocusStateChange](self, "_updateForFocusStateChange");
  -[TVButtonLockup bounds](self, "bounds");
  -[TVButtonLockup _setFocusableContentMargins:](self, "_setFocusableContentMargins:", 0.0, 0.0, CGRectGetHeight(v47) - v6, 0.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (v4)
  {
    -[TVButtonLockup traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle"))
    {
      objc_msgSend(v4, "userInterfaceStyle");
      -[TVButtonLockup traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInterfaceStyle");

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TVButtonLockup;
  -[TVButtonLockup traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);

}

- (int64_t)_focusedSound
{
  return 1;
}

- (void)_updateTextForAccessibilityAndFocus
{
  char v3;
  UILabel *textView;
  int v5;
  double v6;
  UILabel *v7;
  uint64_t v8;
  id v9;

  v3 = -[TVButtonLockup isFocused](self, "isFocused");
  textView = self->_textView;
  if ((v3 & 1) == 0)
  {
    -[UILabel setAlpha:](self->_textView, "setAlpha:", 1.0);
    v7 = self->_textView;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = _AXSHighContrastFocusIndicatorsEnabled();
  v6 = 1.0;
  if (!v5)
    v6 = 0.0;
  -[UILabel setAlpha:](textView, "setAlpha:", v6);
  v7 = self->_textView;
  if (!_AXSHighContrastFocusIndicatorsEnabled())
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (id)v8;
  -[UILabel setColor:](v7, "setColor:");

}

- (void)_updateForAccessibilityChange
{
  CALayer *imageMask;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  imageMask = self->_imageMask;
  v4 = _AXSHighContrastFocusIndicatorsEnabled();
  v5 = *MEMORY[0x24BDE5A48];
  if (v4)
    v6 = 0;
  else
    v6 = *MEMORY[0x24BDE5A48];
  -[CALayer setCompositingFilter:](imageMask, "setCompositingFilter:", v6);
  -[UILabel layer](self->_textMask, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSHighContrastFocusIndicatorsEnabled())
    v8 = 0;
  else
    v8 = v5;
  objc_msgSend(v7, "setCompositingFilter:", v8);

  -[TVButtonLockup _updateTextForAccessibilityAndFocus](self, "_updateTextForAccessibilityAndFocus");
}

- (void)_updateForFocusStateChange
{
  uint64_t v3;
  double v4;
  double v5;

  v3 = -[TVButtonLockup isFocused](self, "isFocused");
  if ((_DWORD)v3)
    v4 = 1.0;
  else
    v4 = 0.0;
  if ((_DWORD)v3)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[UIView setAlpha:](self->_overlayView, "setAlpha:", v4);
  -[_TVImageView setAlpha:](self->_imageView, "setAlpha:", v5);
  -[UILabel setHidden:](self->_titleView, "setHidden:", v3 ^ 1);
  -[CALayer setAllowsEdgeAntialiasing:](self->_imageMask, "setAllowsEdgeAntialiasing:", v3);
  -[TVButtonLockup _updateShadowForLabel:inFocus:](self, "_updateShadowForLabel:inFocus:", self->_titleView, v3);
  -[TVButtonLockup _updateTextForAccessibilityAndFocus](self, "_updateTextForAccessibilityAndFocus");
}

- (void)_updateImageMask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CALayer *v7;
  CALayer *imageMask;
  CALayer *v9;
  uint64_t v10;
  void *v11;
  CALayer *v12;
  id v13;

  -[_TVImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVImageView image](self->_imageView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CALayer removeFromSuperlayer](self->_imageMask, "removeFromSuperlayer");
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
    imageMask = self->_imageMask;
    self->_imageMask = v7;

    v9 = self->_imageMask;
    if (_AXSHighContrastFocusIndicatorsEnabled())
      v10 = 0;
    else
      v10 = *MEMORY[0x24BDE5A48];
    -[CALayer setCompositingFilter:](v9, "setCompositingFilter:", v10);
    -[UIView layer](self->_overlayView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", self->_imageMask);

    v12 = self->_imageMask;
    v13 = objc_retainAutorelease(v6);
    -[CALayer setContents:](v12, "setContents:", objc_msgSend(v13, "CGImage"));
    -[_TVImageView frame](self->_imageView, "frame");
    -[CALayer setFrame:](self->_imageMask, "setFrame:");

  }
}

- (void)_selectButtonAction:(id)a3
{
  -[IKViewElement tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:](self->_viewElement, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, a3, 0);
}

- (void)_playButtonAction:(id)a3
{
  -[IKViewElement tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:](self->_viewElement, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("play"), 1, 1, 0, a3, 0);
}

- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v5 = a3;
  v11 = v5;
  if (v4)
  {
    if (!_updateShadowForLabel_inFocus____ShadowColor_0)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_updateShadowForLabel_inFocus____ShadowColor_0;
      _updateShadowForLabel_inFocus____ShadowColor_0 = v6;

      v5 = v11;
    }
    objc_msgSend(v5, "setShadowColor:");
    v8 = 2.0;
    v9 = 0.0;
    v10 = 6.0;
  }
  else
  {
    objc_msgSend(v5, "setShadowColor:", 0);
    v9 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v10 = 0.0;
  }
  objc_msgSend(v11, "setShadowOffset:", v9, v8);
  objc_msgSend(v11, "setShadowBlur:", v10);

}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (int64_t)vibrantLabelThemeOverride
{
  return self->_vibrantLabelThemeOverride;
}

- (void)setVibrantLabelThemeOverride:(int64_t)a3
{
  self->_vibrantLabelThemeOverride = a3;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->__backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageMask, 0);
  objc_storeStrong((id *)&self->_textMask, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
}

@end
