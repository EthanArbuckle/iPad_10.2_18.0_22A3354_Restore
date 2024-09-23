@implementation CarUserTrackingButton

+ (CarUserTrackingButton)buttonWithUserTrackingView:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];

  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___CarUserTrackingButton;
  v3 = objc_msgSendSuper2(&v17, "buttonWithUserTrackingView:withType:", a3, 0);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("CarUserTrackingButton"));
  objc_msgSend(v4, "_setSelectsWhenTracking:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("location"), UIFontTextStyleSubheadline));
  objc_msgSend(v4, "_setImage:forUserTrackingMode:controlState:", v5, 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("location.fill"), UIFontTextStyleSubheadline));
  objc_msgSend(v4, "_setImage:forUserTrackingMode:controlState:", v6, 1, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("location.north.line.fill"), UIFontTextStyleSubheadline));
  objc_msgSend(v4, "_setImage:forUserTrackingMode:controlState:", v7, 2, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageView"));
  objc_msgSend(v8, "setContentMode:", 1);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapsCar_injectBlurView"));
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CarPlay_Location"), CFSTR("localized string not found"), 0));
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CarPlay_Tracking"), CFSTR("localized string not found"), 0));
  v18[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  objc_msgSend(v4, "setAccessibilityUserInputLabels:", v15);

  return (CarUserTrackingButton *)v4;
}

- (CarUserTrackingButton)initWithFrame:(CGRect)a3
{
  CarUserTrackingButton *v3;
  CarUserTrackingButton *v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  NSLayoutConstraint *heightConstraint;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v14.receiver = self;
  v14.super_class = (Class)CarUserTrackingButton;
  v3 = -[CarUserTrackingButton initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarUserTrackingButton _updateColors](v3, "_updateColors");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserTrackingButton heightAnchor](v4, "heightAnchor"));
    v6 = -[CarUserTrackingButton roundedCorners](v4, "roundedCorners");
    v7 = 33.0;
    if (v6 == (id)15)
      v7 = 28.0;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", v7));
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserTrackingButton widthAnchor](v4, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 28.0));
    v15[0] = v11;
    v15[1] = v4->_heightConstraint;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  }
  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarUserTrackingButton;
  -[CarUserTrackingButton didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserTrackingButton window](self, "window"));

  if (v3)
    -[CarUserTrackingButton _updateColors](self, "_updateColors");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarUserTrackingButton;
  v4 = a3;
  -[CarUserTrackingButton traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserTrackingButton traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[CarUserTrackingButton _updateColors](self, "_updateColors");
}

- (void)setRoundedCorners:(unint64_t)a3
{
  double v3;

  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    v3 = 33.0;
    if (a3 == 15)
      v3 = 28.0;
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v3);
  }
}

- (void)_updateColors
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((-[CarUserTrackingButton isFocused](self, "isFocused") & 1) != 0)
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  v4 = (void *)v3;
  -[CarUserTrackingButton setTintColor:](self, "setTintColor:", v3);

  if (-[CarUserTrackingButton isFocused](self, "isFocused"))
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (id)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView contentView](self->_blurView, "contentView"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (int64_t)_activityIndicatorStyle
{
  return 21;
}

- (BOOL)_isHighlightedForState:(int64_t)a3
{
  return 0;
}

- (unint64_t)behavior
{
  return 1;
}

- (void)layoutSubviews
{
  CarDynamicBlurView *blurView;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)CarUserTrackingButton;
  -[CarUserTrackingButton layoutSubviews](&v9, "layoutSubviews");
  -[CarUserTrackingButton bounds](self, "bounds");
  if (!CGRectEqualToRect(v10, self->_lastBounds) || self->_roundedCorners != self->_lastRoundedCorners)
  {
    blurView = self->_blurView;
    -[CarUserTrackingButton roundedCornerRadius](self, "roundedCornerRadius");
    -[CarDynamicBlurView _setCornerRadius:continuous:maskedCorners:](blurView, "_setCornerRadius:continuous:maskedCorners:", -[CarUserTrackingButton needsContinuousRoundedCorners](self, "needsContinuousRoundedCorners"), self->_roundedCorners & 0xF, v4);
    -[CarUserTrackingButton bounds](self, "bounds");
    self->_lastBounds.origin.x = v5;
    self->_lastBounds.origin.y = v6;
    self->_lastBounds.size.width = v7;
    self->_lastBounds.size.height = v8;
    self->_lastRoundedCorners = self->_roundedCorners;
  }
}

- (double)roundedCornerRadius
{
  return 14.0;
}

- (BOOL)needsContinuousRoundedCorners
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  +[CATransaction begin](CATransaction, "begin", a3, a4);
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CarUserTrackingButton _updateColors](self, "_updateColors");
  +[CATransaction commit](CATransaction, "commit");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[CarUserTrackingButton bounds](self, "bounds", a4);
  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchInsets.right);
  v15.size.height = v12 - (top + self->_touchInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
