@implementation _UIKBRTTouchDrifingFingerCircleView

- (_UIKBRTTouchDrifingFingerCircleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIKBRTTouchDrifingFingerCircleView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_UIKBRTTouchDrifingFingerCircleView;
  v7 = -[UIView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UIView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 1);

    -[_UIKBRTTouchDrifingFingerCircleView _updateCornersFromFrame:](v7, "_updateCornersFromFrame:", x, y, width, height);
  }
  return v7;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIKBRTTouchDrifingFingerCircleView;
  -[UIView setFrame:](&v8, sel_setFrame_);
  -[_UIKBRTTouchDrifingFingerCircleView _updateCornersFromFrame:](self, "_updateCornersFromFrame:", x, y, width, height);
}

- (void)setBorderColor:(CGColor *)a3
{
  void *v5;
  void *v6;
  id v7;

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "setBorderColor:", a3);

    -[UIView layer](self, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", 3.0);
  }
  else
  {
    objc_msgSend(v5, "setBorderWidth:", 0.0);

    -[UIView layer](self, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", 0);
  }

}

- (CGColor)borderColor
{
  void *v2;
  CGColor *v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColor *)objc_msgSend(v2, "borderColor");

  return v3;
}

- (void)_updateCornersFromFrame:(CGRect)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3.size.width * 0.5;
  v4 = floorf(v3);
  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

@end
