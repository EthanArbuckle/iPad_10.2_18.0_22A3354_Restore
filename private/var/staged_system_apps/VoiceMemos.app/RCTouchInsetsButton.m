@implementation RCTouchInsetsButton

- (void)_commonInit
{
  double v3;
  CAShapeLayer *v4;
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((byte_1001ED850 & 1) == 0)
    -[RCTouchInsetsButton setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v11, "actionButtonExtraXAxisActiveWidth");
  -[RCTouchInsetsButton _setTouchInsets:](self, "_setTouchInsets:", 0.0, -v3, 0.0, -v3);
  v4 = objc_opt_new(CAShapeLayer);
  -[RCTouchInsetsButton setCircleLayer:](self, "setCircleLayer:", v4);
  LODWORD(v5) = 0;
  -[CAShapeLayer setOpacity:](v4, "setOpacity:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  -[CAShapeLayer setStrokeColor:](v4, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transportButtonAnimationCircleColor")));
  -[CAShapeLayer setFillColor:](v4, "setFillColor:", objc_msgSend(v7, "CGColor"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton layer](self, "layer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton imageView](self, "imageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v8, "insertSublayer:below:", v4, v10);

  self->_shouldAnimateOnTap = 0;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double MidY;
  double v10;
  id v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)RCTouchInsetsButton;
  -[RCTouchInsetsButton setBounds:](&v12, "setBounds:");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidY = CGRectGetMidY(v14);
  -[RCTouchInsetsButton animationCircleRadius](self, "animationCircleRadius");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v10, 0.0, 6.28318531)));
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", objc_msgSend(v11, "CGPath"));

}

- (double)animationCircleRadius
{
  return self->_animationCircleRadius;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (RCTouchInsetsButton)initWithFrame:(CGRect)a3
{
  RCTouchInsetsButton *v3;
  RCTouchInsetsButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCTouchInsetsButton;
  v3 = -[RCPointerInteractionButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCTouchInsetsButton _commonInit](v3, "_commonInit");
  return v4;
}

+ (RCTouchInsetsButton)new
{
  return (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "buttonWithType:", 1));
}

+ (id)touchInsetsButton
{
  void *v2;

  byte_1001ED850 = 1;
  v2 = (void *)objc_opt_new(a1);
  byte_1001ED850 = 0;
  return v2;
}

- (RCTouchInsetsButton)initWithCoder:(id)a3
{
  RCTouchInsetsButton *v3;
  RCTouchInsetsButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCTouchInsetsButton;
  v3 = -[RCTouchInsetsButton initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCTouchInsetsButton _commonInit](v3, "_commonInit");
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
  -[RCTouchInsetsButton bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[RCTouchInsetsButton _touchInsets](self, "_touchInsets");
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

- (void)setHighlighted:(BOOL)a3
{
  objc_super v3;

  if (!self->_shouldAnimateOnTap)
  {
    v3.receiver = self;
    v3.super_class = (Class)RCTouchInsetsButton;
    -[RCTouchInsetsButton setHighlighted:](&v3, "setHighlighted:", a3);
  }
}

- (void)setAnimationCircleColor:(id)a3
{
  id v5;
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_animationCircleColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton circleLayer](self, "circleLayer"));
  objc_msgSend(v7, "setFillColor:", v6);

}

- (void)_animateImage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  CGAffineTransform v13;
  _QWORD v14[6];
  CGAffineTransform v15;
  CGAffineTransform v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v5, "transportButtonAnimationDuration");
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v5, "transportButtonAnimationShrinkFactor");
    v9 = v8;
    v10 = 1.0;
  }
  else
  {
    v9 = 1.0;
    v10 = 0.0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton layer](self, "layer"));
  objc_msgSend(v11, "removeAllAnimations");

  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, v9, v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000325C8;
  v14[3] = &unk_1001ABB10;
  v14[4] = self;
  *(double *)&v14[5] = v10;
  v15 = v16;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032624;
  v12[3] = &unk_1001ABB38;
  v12[4] = self;
  v13 = v16;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 65540, v14, v12, v7, 0.0);

}

- (void)_animateTouch:(BOOL)a3
{
  if (self->_shouldAnimateOnTap)
    -[RCTouchInsetsButton _animateImage:](self, "_animateImage:", a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCTouchInsetsButton;
  -[RCTouchInsetsButton touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  -[RCTouchInsetsButton _animateTouch:](self, "_animateTouch:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCTouchInsetsButton;
  -[RCTouchInsetsButton touchesMoved:withEvent:](&v4, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCTouchInsetsButton;
  -[RCTouchInsetsButton touchesEnded:withEvent:](&v5, "touchesEnded:withEvent:", a3, a4);
  -[RCTouchInsetsButton _animateTouch:](self, "_animateTouch:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCTouchInsetsButton;
  -[RCTouchInsetsButton touchesCancelled:withEvent:](&v5, "touchesCancelled:withEvent:", a3, a4);
  -[RCTouchInsetsButton _animateTouch:](self, "_animateTouch:", 0);
}

- (BOOL)shouldAnimateOnTap
{
  return self->_shouldAnimateOnTap;
}

- (void)setShouldAnimateOnTap:(BOOL)a3
{
  self->_shouldAnimateOnTap = a3;
}

- (void)setAnimationCircleRadius:(double)a3
{
  self->_animationCircleRadius = a3;
}

- (UIColor)animationCircleColor
{
  return self->_animationCircleColor;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_animationCircleColor, 0);
}

@end
