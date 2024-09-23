@implementation BKScrubberSlider

- (BKScrubberSlider)init
{
  BKScrubberSlider *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKScrubberSlider;
  v2 = -[BKScrubberSlider init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v4 = -[BKScrubberSlider registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v3, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v2;
}

- (id)createThumbView
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKScrubberSlider;
  v3 = -[BKScrubberSlider createThumbView](&v6, "createThumbView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
  objc_msgSend(v4, "setThumbView:", v3);

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BKScrubberSlider;
  -[BKScrubberSlider layoutSubviews](&v16, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bufferedView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionIndicatorView"));
  if (v4)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[BKScrubberSlider _createBufferedRect](self, "_createBufferedRect");
    objc_msgSend(v4, "setFrame:");
    +[CATransaction commit](CATransaction, "commit");
  }
  if (v5)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[BKScrubberSlider _createSessionIndicatorRect](self, "_createSessionIndicatorRect");
    objc_msgSend(v5, "setFrame:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v8 = objc_msgSend(v7, "isEqual:", v5);

    if ((v8 & 1) == 0)
      objc_msgSend(v3, "bringSubviewToFront:", v5);
    +[CATransaction commit](CATransaction, "commit");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider subviews](self, "subviews"));
  v10 = (char *)objc_msgSend(v9, "count");

  v11 = v10 - 2;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider subviews](self, "subviews"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));
  v14 = objc_msgSend(v13, "isEqual:", v3);

  if ((v14 & 1) == 0)
  {
    -[BKScrubberSlider bringSubviewToFront:](self, "bringSubviewToFront:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbView"));
    -[BKScrubberSlider bringSubviewToFront:](self, "bringSubviewToFront:", v15);

  }
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double width;
  double x;
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
  objc_super v17;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)BKScrubberSlider;
  -[BKScrubberSlider trackRectForBounds:](&v17, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  -[BKScrubberSlider trackRectHorizontalInset](self, "trackRectHorizontalInset");
  v11 = x + v10;
  -[BKScrubberSlider trackRectHorizontalInset](self, "trackRectHorizontalInset");
  v13 = width + v12 * -2.0;
  v14 = v11;
  v15 = v7;
  v16 = v9;
  result.size.height = v16;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[BKScrubberSlider bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[BKScrubberSlider touchInsets](self, "touchInsets");
  v16 = v10 + v15;
  v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.x = v8 + v17;
  v23.origin.y = v16;
  v23.size.width = v19;
  v22.x = x;
  v22.y = y;
  return CGRectContainsPoint(v23, v22);
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != self->_touchInsets.left
    || a3.top != self->_touchInsets.top
    || a3.right != self->_touchInsets.right
    || a3.bottom != self->_touchInsets.bottom)
  {
    self->_touchInsets = a3;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
    objc_msgSend(v10, "setThumbTouchInsets:", top, left, bottom, right);

  }
}

- (CGRect)visualTrackRectForBounds:(CGRect)a3
{
  CGRect v3;

  -[BKScrubberSlider trackRectForBounds:](self, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v3, 1.0, 0.0);
}

- (BKScrubberSliderContainerView)containerView
{
  BKScrubberSliderContainerView *containerView;
  BKScrubberSliderContainerView *v4;
  BKScrubberSliderContainerView *v5;
  BKScrubberSliderContainerView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  containerView = self->_containerView;
  if (!containerView)
  {
    v4 = [BKScrubberSliderContainerView alloc];
    -[BKScrubberSlider bounds](self, "bounds");
    v5 = -[BKScrubberSliderContainerView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_containerView;
    self->_containerView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BKScrubberSliderContainerView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView layer](self->_containerView, "layer"));
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    -[BKScrubberSliderContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKScrubberSlider addSubview:](self, "addSubview:", self->_containerView);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView topAnchor](self->_containerView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider topAnchor](self, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v23[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView leadingAnchor](self->_containerView, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider leadingAnchor](self, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
    v23[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView trailingAnchor](self->_containerView, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider trailingAnchor](self, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v23[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider bottomAnchor](self, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v23[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    containerView = self->_containerView;
  }
  return containerView;
}

- (void)setBufferedValue:(double)bufferedValue
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (self->_bufferedValue != bufferedValue)
  {
    self->_bufferedValue = bufferedValue;
    if (bufferedValue > 0.0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bufferedView"));

      if (!v5)
      {
        -[BKScrubberSlider bounds](self, "bounds");
        -[BKScrubberSlider visualTrackRectForBounds:](self, "visualTrackRectForBounds:");
        v10 = v9;
        v8 = objc_opt_new(UIView);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider bufferIndicatorColor](self, "bufferIndicatorColor"));
        if (v11)
        {
          -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v11);
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
          -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v12);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v8, "layer"));
        objc_msgSend(v13, "setCornerRadius:", v10 * 0.5);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v8, "layer"));
        objc_msgSend(v14, "setMaskedCorners:", 10);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
        objc_msgSend(v15, "addSubview:", v8);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
        objc_msgSend(v16, "setBufferedView:", v8);

        goto LABEL_12;
      }
      bufferedValue = self->_bufferedValue;
    }
    if (bufferedValue > 0.0)
    {
LABEL_13:
      -[BKScrubberSlider setNeedsLayout](self, "setNeedsLayout");
      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bufferedView"));
    objc_msgSend(v7, "removeFromSuperview");

    v8 = (UIView *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
    -[UIView setBufferedView:](v8, "setBufferedView:", 0);
LABEL_12:

    goto LABEL_13;
  }
}

- (void)setBufferIndicatorColor:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_bufferIndicatorColor, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bufferedView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)setSessionIndicatorColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  unsigned __int8 v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_sessionIndicatorColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_sessionIndicatorColor, a3);
      -[BKScrubberSlider _updateSessionIndicatorColor](self, "_updateSessionIndicatorColor");
      v6 = v8;
    }
  }

}

- (void)setSessionIndicatorValue:(id)a3
{
  id v5;
  NSNumber **p_sessionIndicatorValue;
  NSNumber *sessionIndicatorValue;
  void *v8;
  void *v9;
  UIView *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a3;
  p_sessionIndicatorValue = &self->_sessionIndicatorValue;
  sessionIndicatorValue = self->_sessionIndicatorValue;
  v20 = v5;
  if (v5)
  {
    if (!-[NSNumber isEqualToNumber:](sessionIndicatorValue, "isEqualToNumber:", v5))
    {
      objc_storeStrong((id *)&self->_sessionIndicatorValue, a3);
      if (!*p_sessionIndicatorValue)
        goto LABEL_9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionIndicatorView"));

      if (v9)
        goto LABEL_9;
      v10 = objc_opt_new(UIView);
      -[BKScrubberSlider _createSessionIndicatorRect](self, "_createSessionIndicatorRect");
      -[UIView setFrame:](v10, "setFrame:");
      v11 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTapSessionIndicator:");
      -[UIView addGestureRecognizer:](v10, "addGestureRecognizer:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
      objc_msgSend(v12, "addSubview:", v10);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
      objc_msgSend(v13, "setSessionIndicatorView:", v10);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 8.0, 7.5, 6.0, 6.0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
      v16 = objc_retainAutorelease(v14);
      objc_msgSend(v15, "setPath:", objc_msgSend(v16, "CGPath"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v10, "layer"));
      objc_msgSend(v17, "addSublayer:", v15);

      -[BKScrubberSlider _updateSessionIndicatorColor](self, "_updateSessionIndicatorColor");
LABEL_8:

LABEL_9:
      -[BKScrubberSlider setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else if (sessionIndicatorValue)
  {
    *p_sessionIndicatorValue = 0;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sessionIndicatorView"));
    objc_msgSend(v19, "removeFromSuperview");

    v10 = (UIView *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
    -[UIView setSessionIndicatorView:](v10, "setSessionIndicatorView:", 0);
    goto LABEL_8;
  }
  -[BKScrubberSlider setCachedAccessibleDescriptionOfSessionIndicatorPosition:](self, "setCachedAccessibleDescriptionOfSessionIndicatorPosition:", 0);

}

- (CGRect)_createSessionIndicatorRect
{
  void *v3;
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
  double v17;
  double v18;
  double v19;
  int v20;
  double Center;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[BKScrubberSlider trackRectForBounds:](self, "trackRectForBounds:", v5, v7, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[NSNumber floatValue](self->_sessionIndicatorValue, "floatValue");
  LODWORD(v28) = v20;
  Center = CGRectGetCenter(-[BKScrubberSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v5, v7, v9, v11, v13, v15, v17, v19, v28));
  CGRectGetCenter(v22);
  v23 = Center + -11.0;
  v25 = v24 + -11.0;
  v26 = 22.0;
  v27 = 22.0;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v23;
  return result;
}

- (CGRect)_createBufferedRect
{
  double v3;
  double v4;
  float v5;
  void *v6;
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
  double y;
  double v19;
  double v20;
  double v21;
  double height;
  int v23;
  double x;
  double v25;
  double v26;
  double width;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  -[BKScrubberSlider bufferedValue](self, "bufferedValue");
  v4 = v3;
  -[BKScrubberSlider value](self, "value");
  if (v4 <= v5)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[BKScrubberSlider visualTrackRectForBounds:](self, "visualTrackRectForBounds:", v8, v10, v12, v14);
    v16 = v15;
    y = v17;
    v32 = v4;
    v20 = v19;
    height = v21;
    -[BKScrubberSlider value](self, "value");
    LODWORD(v31) = v23;
    -[BKScrubberSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v8, v10, v12, v14, v16, y, v20, height, v31);
    x = CGRectGetMaxX(v33);
    v25 = fmax(v16 + v32 * v20 - x, 0.0);
    v34.origin.x = v16;
    v34.origin.y = y;
    v34.size.width = v20;
    v34.size.height = height;
    v26 = CGRectGetMaxX(v34) - x;
    if (v25 >= v26)
      width = v26;
    else
      width = v25;
  }
  v28 = x;
  v29 = y;
  v30 = height;
  result.size.height = v30;
  result.size.width = width;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)_hasSessionIndicatorView
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sessionIndicatorView"));
  v4 = v3 != 0;

  return v4;
}

- (id)_sessionIndicatorAccessibleDescription
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider cachedAccessibleDescriptionOfSessionIndicatorPosition](self, "cachedAccessibleDescriptionOfSessionIndicatorPosition"));
  if (v3 || !-[BKScrubberSlider _hasSessionIndicatorView](self, "_hasSessionIndicatorView"))
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "accessibleDescriptionOfSessionIndicatorPosition");

  if ((v5 & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibleDescriptionOfSessionIndicatorPosition"));
    -[BKScrubberSlider setCachedAccessibleDescriptionOfSessionIndicatorPosition:](self, "setCachedAccessibleDescriptionOfSessionIndicatorPosition:", v6);

LABEL_5:
  }
  return -[BKScrubberSlider cachedAccessibleDescriptionOfSessionIndicatorPosition](self, "cachedAccessibleDescriptionOfSessionIndicatorPosition");
}

- (void)_didTapSessionIndicator:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider delegate](self, "delegate", a3));
  objc_msgSend(v4, "didTapSessionIndicator:", self);

}

- (void)_updateSessionIndicatorColor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider containerView](self, "containerView"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionIndicatorView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sublayers"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider sessionIndicatorColor](self, "sessionIndicatorColor")));
        v13 = objc_msgSend(v12, "CGColor");
        v14 = v13;
        if (!v13)
        {
          v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksOpaqueSecondaryLabelColor](UIColor, "bc_booksOpaqueSecondaryLabelColor")));
          v14 = objc_msgSend(v4, "CGColor");
        }
        v15 = objc_opt_class(CAShapeLayer);
        v16 = BUDynamicCast(v15, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        objc_msgSend(v17, "setFillColor:", v14);

        if (!v13)
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (id)accessibilityCustomActions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  v3 = objc_alloc((Class)NSMutableArray);
  v15.receiver = self;
  v15.super_class = (Class)BKScrubberSlider;
  v4 = -[BKScrubberSlider accessibilityCustomActions](&v15, "accessibilityCustomActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithArray:", v5);

  if (-[BKScrubberSlider _hasSessionIndicatorView](self, "_hasSessionIndicatorView"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider _sessionIndicatorAccessibleDescription](self, "_sessionIndicatorAccessibleDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Scrub to start of playback at %@"), &stru_10091C438, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Scrub to start of playback"), &stru_10091C438, 0));
    }

    v11 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v10, self, "bkaxDidTapSessionIndicator");
    objc_msgSend(v6, "addObject:", v11);

  }
  if (objc_msgSend(v6, "count"))
    v12 = v6;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (CGRect)accessibilityFrame
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
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect result;

  v22.receiver = self;
  v22.super_class = (Class)BKScrubberSlider;
  -[BKScrubberSlider accessibilityFrame](&v22, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider delegate](self, "delegate"));
  v12 = objc_opt_respondsToSelector(v11, "alternateAccessibilityFrameFor:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSlider delegate](self, "delegate"));
    objc_msgSend(v13, "alternateAccessibilityFrameFor:", self);
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;

  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)bkaxDefaultAccessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)BKScrubberSlider;
  -[BKScrubberSlider accessibilityFrame](&v6, "accessibilityFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)bkaxDidTapSessionIndicator
{
  -[BKScrubberSlider _didTapSessionIndicator:](self, "_didTapSessionIndicator:", 0);
}

- (double)trackRectHorizontalInset
{
  return self->_trackRectHorizontalInset;
}

- (void)setTrackRectHorizontalInset:(double)a3
{
  self->_trackRectHorizontalInset = a3;
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

- (double)bufferedValue
{
  return self->_bufferedValue;
}

- (UIColor)bufferIndicatorColor
{
  return self->_bufferIndicatorColor;
}

- (UIColor)sessionIndicatorColor
{
  return self->_sessionIndicatorColor;
}

- (NSNumber)sessionIndicatorValue
{
  return self->_sessionIndicatorValue;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSString)cachedAccessibleDescriptionOfSessionIndicatorPosition
{
  return self->_cachedAccessibleDescriptionOfSessionIndicatorPosition;
}

- (void)setCachedAccessibleDescriptionOfSessionIndicatorPosition:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccessibleDescriptionOfSessionIndicatorPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAccessibleDescriptionOfSessionIndicatorPosition, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_sessionIndicatorValue, 0);
  objc_storeStrong((id *)&self->_sessionIndicatorColor, 0);
  objc_storeStrong((id *)&self->_bufferIndicatorColor, 0);
}

@end
