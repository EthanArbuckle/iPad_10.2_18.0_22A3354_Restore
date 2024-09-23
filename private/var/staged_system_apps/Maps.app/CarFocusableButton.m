@implementation CarFocusableButton

+ (id)button
{
  return objc_msgSend(a1, "buttonWithType:", 0);
}

+ (id)closeButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "button"));
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("CloseButton"));
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  objc_msgSend(v2, "setFocusedTintColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemTertiaryColor](UIColor, "_carSystemTertiaryColor"));
  objc_msgSend(v2, "setNonFocusedTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageView"));
  objc_msgSend(v5, "setContentMode:", 1);

  LODWORD(v6) = 1148846080;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("multiply.circle.fill"), UIFontTextStyleTitle3, 6));
  objc_msgSend(v2, "setImage:forState:", v9, 0);

  objc_msgSend(v2, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CarPlay_Close"), CFSTR("localized string not found"), 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CarPlay_Dismiss"), CFSTR("localized string not found"), 0));
  v18[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CarPlay_X"), CFSTR("localized string not found"), 0));
  v18[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  objc_msgSend(v2, "setAccessibilityUserInputLabels:", v16);

  return v2;
}

+ (CarFocusableButton)buttonWithType:(int64_t)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CarFocusableButton;
  v3 = objc_msgSendSuper2(&v6, "buttonWithType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "_commonInit");
  return (CarFocusableButton *)v4;
}

- (CarFocusableButton)initWithFrame:(CGRect)a3
{
  CarFocusableButton *v3;
  CarFocusableButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  v3 = -[CarFocusableButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CarFocusableButton _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *recognizer;
  UIColor *v5;
  UIColor *focusedTintColor;
  UIColor *v7;
  UIColor *nonFocusedTintColor;
  UIColor *v9;
  UIColor *focusedBackgroundColor;
  UIColor *v11;
  UIColor *nonFocusedBackgroundColor;

  v3 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "tappedButton:");
  recognizer = self->_recognizer;
  self->_recognizer = v3;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_recognizer, "setMinimumPressDuration:", 0.0);
  -[UILongPressGestureRecognizer setAllowedPressTypes:](self->_recognizer, "setAllowedPressTypes:", &off_1012740A0);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  focusedTintColor = self->_focusedTintColor;
  self->_focusedTintColor = v5;

  v7 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  nonFocusedTintColor = self->_nonFocusedTintColor;
  self->_nonFocusedTintColor = v7;

  v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  focusedBackgroundColor = self->_focusedBackgroundColor;
  self->_focusedBackgroundColor = v9;

  v11 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  nonFocusedBackgroundColor = self->_nonFocusedBackgroundColor;
  self->_nonFocusedBackgroundColor = v11;

  -[CarFocusableButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[CarFocusableButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);
  -[CarFocusableButton addGestureRecognizer:](self, "addGestureRecognizer:", self->_recognizer);
  -[CarFocusableButton _updateAppearance](self, "_updateAppearance");
}

- (void)willMoveToSuperview:(id)a3
{
  CAShapeLayer *focusShapeLayer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton willMoveToSuperview:](&v5, "willMoveToSuperview:", a3);
  -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
  focusShapeLayer = self->_focusShapeLayer;
  self->_focusShapeLayer = 0;

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton window](self, "window"));

  if (v3)
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarFocusableButton;
  v4 = a3;
  -[CarFocusableButton traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
}

- (void)setAdjustsImageWhenDisabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setAdjustsImageWhenDisabled:](&v3, "setAdjustsImageWhenDisabled:", 0);
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setAdjustsImageWhenHighlighted:](&v3, "setAdjustsImageWhenHighlighted:", 0);
}

- (void)setFocusedTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_focusedTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_focusedTintColor, a3);
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
    v5 = v6;
  }

}

- (void)setNonFocusedTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_nonFocusedTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_nonFocusedTintColor, a3);
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
    v5 = v6;
  }

}

- (void)setFocusedBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_focusedBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_focusedBackgroundColor, a3);
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
    v5 = v6;
  }

}

- (void)setNonFocusedBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_nonFocusedBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_nonFocusedBackgroundColor, a3);
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
    v5 = v6;
  }

}

- (void)setModifiesBackgroundColor:(BOOL)a3
{
  if (self->_modifiesBackgroundColor != a3)
  {
    self->_modifiesBackgroundColor = a3;
    -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CarFocusableButton isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setEnabled:](&v6, "setEnabled:", v3);
  if (v5 != -[CarFocusableButton isEnabled](self, "isEnabled"))
  {
    -[CarFocusableButton setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[CarFocusableButton _updateColorSettings](self, "_updateColorSettings");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CarFocusableButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setHighlighted:](&v6, "setHighlighted:", v3);
  if (v5 != -[CarFocusableButton isHighlighted](self, "isHighlighted"))
    -[CarFocusableButton _updateColorSettings](self, "_updateColorSettings");
}

- (BOOL)canBecomeFocused
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarFocusableButton;
  v3 = -[CarFocusableButton canBecomeFocused](&v5, "canBecomeFocused");
  if (v3)
  {
    v3 = -[CarFocusableButton isEnabled](self, "isEnabled");
    if (v3)
      LOBYTE(v3) = -[CarFocusableButton isHidden](self, "isHidden") ^ 1;
  }
  return v3;
}

- (id)_focusShapeLayer
{
  CAShapeLayer *focusShapeLayer;
  CAShapeLayer *v4;
  CAShapeLayer *v5;
  const CGPath *v6;
  id v7;
  id v8;
  CGRect v10;
  CGRect v11;

  focusShapeLayer = self->_focusShapeLayer;
  if (!focusShapeLayer)
  {
    v4 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    v5 = self->_focusShapeLayer;
    self->_focusShapeLayer = v4;

    -[CarFocusableButton bounds](self, "bounds");
    v11 = CGRectInset(v10, -0.75, -0.75);
    v6 = CGPathCreateWithEllipseInRect(v11, 0);
    -[CAShapeLayer setPath:](self->_focusShapeLayer, "setPath:", v6);
    CGPathRelease(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CarFocusableButton focusedBackgroundColor](self, "focusedBackgroundColor")));
    -[CAShapeLayer setStrokeColor:](self->_focusShapeLayer, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CAShapeLayer setFillColor:](self->_focusShapeLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_focusShapeLayer, "setLineWidth:", 1.5);
    focusShapeLayer = self->_focusShapeLayer;
  }
  return focusShapeLayer;
}

- (void)_setNeedsUpdateAppearance
{
  _QWORD v2[4];
  id v3;
  id location;

  if (!self->_needsUpdateAppearance)
  {
    self->_needsUpdateAppearance = 1;
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100986960;
    v2[3] = &unk_1011AD260;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_updateAppearance
{
  CGSize *p_lastKnownSize;
  double v4;
  double height;
  double v6;
  CGFloat v8;
  CGFloat v9;
  CAShapeLayer *focusShapeLayer;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  if (!self->_showsEllipticalFocusIndicator)
  {
    if ((-[CarFocusableButton isFocused](self, "isFocused") & 1) != 0)
      v12 = objc_claimAutoreleasedReturnValue(-[CarFocusableButton focusedTintColor](self, "focusedTintColor"));
    else
      v12 = objc_claimAutoreleasedReturnValue(-[CarFocusableButton nonFocusedTintColor](self, "nonFocusedTintColor"));
    v15 = (id)v12;
    -[CarFocusableButton setTintColor:](self, "setTintColor:", v12);
    goto LABEL_18;
  }
  p_lastKnownSize = &self->_lastKnownSize;
  -[CarFocusableButton bounds](self, "bounds");
  height = self->_lastKnownSize.height;
  if (p_lastKnownSize->width != v6 || height != v4)
  {
    -[CarFocusableButton bounds](self, "bounds", p_lastKnownSize->width, height);
    p_lastKnownSize->width = v8;
    self->_lastKnownSize.height = v9;
    -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

  }
  if (-[CarFocusableButton isFocused](self, "isFocused"))
  {
    v11 = objc_claimAutoreleasedReturnValue(-[CarFocusableButton focusedBackgroundColor](self, "focusedBackgroundColor"));
  }
  else
  {
    if (!-[CarFocusableButton isSelected](self, "isSelected"))
    {
LABEL_15:
      -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
      goto LABEL_19;
    }
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v13 = (void *)v11;
  if (!v11)
    goto LABEL_15;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton _focusShapeLayer](self, "_focusShapeLayer"));
  v15 = objc_retainAutorelease(v13);
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

  +[CATransaction commit](CATransaction, "commit");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton layer](self, "layer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton _focusShapeLayer](self, "_focusShapeLayer"));
  objc_msgSend(v16, "addSublayer:", v17);

LABEL_18:
LABEL_19:
  if (self->_modifiesBackgroundColor)
  {
    if ((-[CarFocusableButton isFocused](self, "isFocused") & 1) != 0)
      v18 = objc_claimAutoreleasedReturnValue(-[CarFocusableButton focusedBackgroundColor](self, "focusedBackgroundColor"));
    else
      v18 = objc_claimAutoreleasedReturnValue(-[CarFocusableButton nonFocusedBackgroundColor](self, "nonFocusedBackgroundColor"));
    v19 = (id)v18;
    -[CarFocusableButton setBackgroundColor:](self, "setBackgroundColor:", v18);

  }
}

- (void)_updateColorSettings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  double v16;
  double v17;
  objc_super v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton tintColor](self, "tintColor"));
  v18.receiver = self;
  v18.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setTitleColor:forState:](&v18, "setTitleColor:forState:", v3, 0);

  v16 = 0.0;
  v17 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton tintColor](self, "tintColor"));
  objc_msgSend(v4, "getWhite:alpha:", &v17, &v16);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton titleColorForState:](self, "titleColorForState:", 2));
  if (!*(_WORD *)&self->_customDisabledColor)
  {
    self->_generatedDisabledColor = 1;
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v17, v16 * 0.349999994));

    v15.receiver = self;
    v15.super_class = (Class)CarFocusableButton;
    -[CarFocusableButton setTitleColor:forState:](&v15, "setTitleColor:forState:", v6, 2);
    v5 = (void *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton titleColorForState:](self, "titleColorForState:", 1));
  if (!self->_customHighlightedColor && !self->_generatedHighlightedColor)
  {
    self->_generatedHighlightedColor = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton tintColor](self, "tintColor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.200000003));

    v14.receiver = self;
    v14.super_class = (Class)CarFocusableButton;
    -[CarFocusableButton setTitleColor:forState:](&v14, "setTitleColor:forState:", v9, 1);
    v7 = (void *)v9;
  }
  if (-[CarFocusableButton isHighlighted](self, "isHighlighted"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton imageView](self, "imageView"));
    v11 = v10;
    v12 = v7;
LABEL_11:
    objc_msgSend(v10, "setTintColor:", v12);
    goto LABEL_12;
  }
  if ((-[CarFocusableButton isEnabled](self, "isEnabled") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton imageView](self, "imageView"));
    v11 = v10;
    v12 = v5;
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton tintColor](self, "tintColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton imageView](self, "imageView"));
  objc_msgSend(v13, "setTintColor:", v11);

LABEL_12:
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton tintColorDidChange](&v3, "tintColorDidChange");
  self->_generatedHighlightedColor = 0;
  self->_generatedDisabledColor = 0;
  -[CarFocusableButton _updateColorSettings](self, "_updateColorSettings");
}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  int *v5;
  objc_super v6;

  if (a4 == 1)
  {
    v5 = &OBJC_IVAR___CarFocusableButton__customHighlightedColor;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v5 = &OBJC_IVAR___CarFocusableButton__customDisabledColor;
LABEL_5:
    *((_BYTE *)&self->super.super.super.super.super.super.isa + *v5) = a3 != 0;
    *((_BYTE *)&self->super.super.super.super.super.super.isa + v5[1]) = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setTitleColor:forState:](&v6, "setTitleColor:forState:");
  -[CarFocusableButton _setNeedsUpdateAppearance](self, "_setNeedsUpdateAppearance");
}

- (void)tappedButton:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (-[CarFocusableButton isEnabled](self, "isEnabled"))
  {
    if (objc_msgSend(v5, "state") == (id)1)
    {
      -[CarFocusableButton setHighlighted:](self, "setHighlighted:", 1);
    }
    else
    {
      v4 = objc_msgSend(v5, "state");
      -[CarFocusableButton setHighlighted:](self, "setHighlighted:", 0);
      if (v4 == (id)3)
        -[CarFocusableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    }
  }

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CarFocusableButton *v7;
  CarFocusableButton *v8;
  CarFocusableButton *v9;
  CarFocusableButton *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton didUpdateFocusInContext:withAnimationCoordinator:](&v11, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  if (v7 == self)
  {

LABEL_5:
    v10 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
    -[CarFocusableButton focusDidChange:](self, "focusDidChange:", v10 == self);

    goto LABEL_6;
  }
  v8 = v7;
  v9 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem"));

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (UIColor)focusedTintColor
{
  return self->_focusedTintColor;
}

- (UIColor)nonFocusedTintColor
{
  return self->_nonFocusedTintColor;
}

- (UIColor)focusedBackgroundColor
{
  return self->_focusedBackgroundColor;
}

- (UIColor)nonFocusedBackgroundColor
{
  return self->_nonFocusedBackgroundColor;
}

- (BOOL)modifiesBackgroundColor
{
  return self->_modifiesBackgroundColor;
}

- (BOOL)showsEllipticalFocusIndicator
{
  return self->_showsEllipticalFocusIndicator;
}

- (void)setShowsEllipticalFocusIndicator:(BOOL)a3
{
  self->_showsEllipticalFocusIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFocusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_nonFocusedTintColor, 0);
  objc_storeStrong((id *)&self->_focusedTintColor, 0);
  objc_storeStrong((id *)&self->_focusShapeLayer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end
