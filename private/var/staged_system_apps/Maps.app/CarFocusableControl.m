@implementation CarFocusableControl

- (CarFocusableControl)initWithFrame:(CGRect)a3
{
  CarFocusableControl *v3;
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *selectButtonRecognizer;
  uint64_t v6;
  UIColor *focusedTintColor;
  uint64_t v8;
  UIColor *unfocusedTintColor;
  uint64_t v10;
  UIColor *focusedBackgroundColor;
  uint64_t v12;
  UIColor *unfocusedBackgroundColor;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CarFocusableControl;
  v3 = -[CarFocusableControl initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v3, "_selectButtonPressed:");
    selectButtonRecognizer = v3->_selectButtonRecognizer;
    v3->_selectButtonRecognizer = v4;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v3->_selectButtonRecognizer, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setAllowedPressTypes:](v3->_selectButtonRecognizer, "setAllowedPressTypes:", &off_101273740);
    -[CarFocusableControl addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_selectButtonRecognizer);
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    focusedTintColor = v3->_focusedTintColor;
    v3->_focusedTintColor = (UIColor *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    unfocusedTintColor = v3->_unfocusedTintColor;
    v3->_unfocusedTintColor = (UIColor *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    focusedBackgroundColor = v3->_focusedBackgroundColor;
    v3->_focusedBackgroundColor = (UIColor *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    unfocusedBackgroundColor = v3->_unfocusedBackgroundColor;
    v3->_unfocusedBackgroundColor = (UIColor *)v12;

  }
  return v3;
}

- (void)addSubview:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarFocusableControl;
  v3 = a3;
  -[CarFocusableControl addSubview:](&v4, "addSubview:", v3);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0, v4.receiver, v4.super_class);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  CAShapeLayer *focusShapeLayer;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_focusShapeLayer)
  {
    -[CarFocusableControl bounds](self, "bounds");
    if (width != v9 || height != v8)
    {
      -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
      focusShapeLayer = self->_focusShapeLayer;
      self->_focusShapeLayer = 0;

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CarFocusableControl;
  -[CarFocusableControl setBounds:](&v12, "setBounds:", x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  CAShapeLayer *focusShapeLayer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarFocusableControl;
  v4 = a3;
  -[CarFocusableControl traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

    -[CarFocusableControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  CAShapeLayer *v8;
  CAShapeLayer *focusShapeLayer;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  uint64_t v26;
  CAShapeLayer *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  CAShapeLayer *v33;
  CAShapeLayer *v34;
  void *v35;
  CAShapeLayer *v36;
  id v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CarFocusableControl;
  -[CarFocusableControl layoutSubviews](&v39, "layoutSubviews");
  v3 = -[CarFocusableControl isFocused](self, "isFocused");
  if ((v3 & 1) != 0)
    v4 = objc_claimAutoreleasedReturnValue(-[CarFocusableControl focusedTintColor](self, "focusedTintColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[CarFocusableControl unfocusedTintColor](self, "unfocusedTintColor"));
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl _adjustedColor:forState:](self, "_adjustedColor:forState:", v4, -[CarFocusableControl state](self, "state")));
  -[CarFocusableControl setTintColor:](self, "setTintColor:", v6);

  v7 = -[CarFocusableControl focusableControlStyle](self, "focusableControlStyle");
  if (v7)
  {
    if (v7 != 2)
    {
      if (v7 != 1)
        return;
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      if (!self->_focusShapeLayer)
      {
        v8 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl _createFocusShapeLayer](self, "_createFocusShapeLayer"));
        focusShapeLayer = self->_focusShapeLayer;
        self->_focusShapeLayer = v8;

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl layer](self, "layer"));
      objc_msgSend(v10, "insertSublayer:atIndex:", self->_focusShapeLayer, 0);

      -[CarFocusableControl bounds](self, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[CarFocusableControl roundedFocusInsets](self, "roundedFocusInsets");
      if (UIEdgeInsetsZero.left == v21
        && UIEdgeInsetsZero.top == v20
        && UIEdgeInsetsZero.right == v23
        && UIEdgeInsetsZero.bottom == v22)
      {
        v20 = -UIRoundToViewScale(self, v19, (*(double *)&qword_1014BC238 - v18) * 0.5);
        v21 = -*(double *)&qword_1014BC240;
        v22 = v20;
        v23 = -*(double *)&qword_1014BC240;
      }
      -[CAShapeLayer setFrame:](self->_focusShapeLayer, "setFrame:", v12 + v21, v14 + v20, v16 - (v21 + v23), v18 - (v20 + v22));
      -[CAShapeLayer setBorderWidth:](self->_focusShapeLayer, "setBorderWidth:", 1.0);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor")));
      -[CAShapeLayer setBorderColor:](self->_focusShapeLayer, "setBorderColor:", objc_msgSend(v24, "CGColor"));

      if (v3)
      {
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor")));
        -[CAShapeLayer setBackgroundColor:](self->_focusShapeLayer, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

        -[CAShapeLayer setCornerRadius:](self->_focusShapeLayer, "setCornerRadius:", 2.0);
        v26 = 0;
        v27 = self->_focusShapeLayer;
      }
      else
      {
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
        -[CAShapeLayer setBackgroundColor:](self->_focusShapeLayer, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

        -[CAShapeLayer setCornerRadius:](self->_focusShapeLayer, "setCornerRadius:", 4.0);
        v27 = self->_focusShapeLayer;
        v26 = -[CarFocusableControl isSelected](self, "isSelected") ^ 1;
      }
      -[CAShapeLayer setHidden:](v27, "setHidden:", v26);
      goto LABEL_31;
    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    if (v3)
    {
      v29 = objc_claimAutoreleasedReturnValue(-[CarFocusableControl focusedBackgroundColor](self, "focusedBackgroundColor"));
    }
    else
    {
      if (!-[CarFocusableControl isSelected](self, "isSelected"))
        goto LABEL_30;
      v29 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v32 = (void *)v29;
    if (v29)
    {
      if (!self->_focusShapeLayer)
      {
        v33 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl _createFocusShapeLayer](self, "_createFocusShapeLayer"));
        v34 = self->_focusShapeLayer;
        self->_focusShapeLayer = v33;

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl layer](self, "layer"));
        objc_msgSend(v35, "addSublayer:", self->_focusShapeLayer);

      }
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      v36 = self->_focusShapeLayer;
      v37 = objc_retainAutorelease(v32);
      -[CAShapeLayer setStrokeColor:](v36, "setStrokeColor:", objc_msgSend(v37, "CGColor"));
      +[CATransaction commit](CATransaction, "commit");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableControl layer](self, "layer"));
      objc_msgSend(v38, "addSublayer:", self->_focusShapeLayer);

      goto LABEL_31;
    }
LABEL_30:
    -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
LABEL_31:
    +[CATransaction commit](CATransaction, "commit");
    return;
  }
  if ((v3 & 1) != 0)
    v28 = objc_claimAutoreleasedReturnValue(-[CarFocusableControl focusedBackgroundColor](self, "focusedBackgroundColor"));
  else
    v28 = objc_claimAutoreleasedReturnValue(-[CarFocusableControl unfocusedBackgroundColor](self, "unfocusedBackgroundColor"));
  v31 = (void *)v28;
  -[CarFocusableControl setBackgroundColor:](self, "setBackgroundColor:", v28);

}

- (void)setFocusableControlStyle:(unint64_t)a3
{
  CAShapeLayer *focusShapeLayer;

  if (self->_focusableControlStyle != a3)
  {
    self->_focusableControlStyle = a3;
    -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

    -[CarFocusableControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRoundedFocusInsets:(UIEdgeInsets)a3
{
  CAShapeLayer *focusShapeLayer;

  if (a3.left != self->_roundedFocusInsets.left
    || a3.top != self->_roundedFocusInsets.top
    || a3.right != self->_roundedFocusInsets.right
    || a3.bottom != self->_roundedFocusInsets.bottom)
  {
    self->_roundedFocusInsets = a3;
    -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

    -[CarFocusableControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_createFocusShapeLayer
{
  unint64_t v3;
  void *v4;
  id v5;
  const CGPath *v6;
  id v7;
  id v8;
  CGRect v10;
  CGRect v11;

  v3 = -[CarFocusableControl focusableControlStyle](self, "focusableControlStyle");
  if (v3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[CarFocusableControl bounds](self, "bounds");
    v11 = CGRectInset(v10, -0.75, -0.75);
    v6 = CGPathCreateWithEllipseInRect(v11, 0);
    objc_msgSend(v4, "setPath:", v6);
    CGPathRelease(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CarFocusableControl focusedBackgroundColor](self, "focusedBackgroundColor")));
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v4, "setLineWidth:", 1.5);
  }
  else if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor")));
    objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    objc_msgSend(v4, "setCornerRadius:", 2.0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
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
  -[CarFocusableControl bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CarFocusableControl touchInsets](self, "touchInsets");
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

- (void)_selectButtonPressed:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  CarFocusableControl *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = -[CarFocusableControl isEnabled](self, "isEnabled");
  v5 = v9;
  if (v4)
  {
    v6 = objc_msgSend(v9, "state");
    if (v6 == (id)3)
    {
      -[CarFocusableControl setHighlighted:](self, "setHighlighted:", 0);
      -[CarFocusableControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    }
    else
    {
      if (v6 == (id)1)
      {
        v7 = self;
        v8 = 1;
      }
      else
      {
        v7 = self;
        v8 = 0;
      }
      -[CarFocusableControl setHighlighted:](v7, "setHighlighted:", v8);
    }
    v5 = v9;
  }

}

- (void)willMoveToSuperview:(id)a3
{
  CAShapeLayer *focusShapeLayer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarFocusableControl;
  -[CarFocusableControl willMoveToSuperview:](&v5, "willMoveToSuperview:", a3);
  -[CAShapeLayer removeFromSuperlayer](self->_focusShapeLayer, "removeFromSuperlayer");
  focusShapeLayer = self->_focusShapeLayer;
  self->_focusShapeLayer = 0;

}

- (id)_adjustedColor:(id)a3 forState:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v10;
  double v11;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v10 = 0.0;
    v11 = 0.0;
    objc_msgSend(v5, "getWhite:alpha:", &v11, &v10);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v10 * 0.349999994));
  }
  else if ((v4 & 2) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.200000003));
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CarFocusableControl isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableControl;
  -[CarFocusableControl setEnabled:](&v6, "setEnabled:", v3);
  if (v5 != -[CarFocusableControl isEnabled](self, "isEnabled"))
  {
    -[CarFocusableControl setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[CarFocusableControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CarFocusableControl *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarFocusableControl;
  v6 = a3;
  -[CarFocusableControl didUpdateFocusInContext:withAnimationCoordinator:](&v8, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (CarFocusableControl *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem", v8.receiver, v8.super_class));

  -[CarFocusableControl focusDidChange:](self, "focusDidChange:", v7 == self);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CarFocusableControl isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableControl;
  -[CarFocusableControl setHighlighted:](&v6, "setHighlighted:", v3);
  if (v5 != -[CarFocusableControl isHighlighted](self, "isHighlighted"))
    -[CarFocusableControl setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)canBecomeFocused
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarFocusableControl;
  v3 = -[CarFocusableControl canBecomeFocused](&v5, "canBecomeFocused");
  if (v3)
  {
    v3 = -[CarFocusableControl isEnabled](self, "isEnabled");
    if (v3)
      LOBYTE(v3) = -[CarFocusableControl isHidden](self, "isHidden") ^ 1;
  }
  return v3;
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

- (unint64_t)focusableControlStyle
{
  return self->_focusableControlStyle;
}

- (UIEdgeInsets)roundedFocusInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_roundedFocusInsets.top;
  left = self->_roundedFocusInsets.left;
  bottom = self->_roundedFocusInsets.bottom;
  right = self->_roundedFocusInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)unfocusedTintColor
{
  return self->_unfocusedTintColor;
}

- (void)setUnfocusedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_unfocusedTintColor, a3);
}

- (UIColor)focusedTintColor
{
  return self->_focusedTintColor;
}

- (void)setFocusedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedTintColor, a3);
}

- (UIColor)unfocusedBackgroundColor
{
  return self->_unfocusedBackgroundColor;
}

- (void)setUnfocusedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_unfocusedBackgroundColor, a3);
}

- (UIColor)focusedBackgroundColor
{
  return self->_focusedBackgroundColor;
}

- (void)setFocusedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_unfocusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedTintColor, 0);
  objc_storeStrong((id *)&self->_unfocusedTintColor, 0);
  objc_storeStrong((id *)&self->_focusShapeLayer, 0);
  objc_storeStrong((id *)&self->_selectButtonRecognizer, 0);
}

@end
