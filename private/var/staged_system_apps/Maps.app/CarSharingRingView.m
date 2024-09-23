@implementation CarSharingRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer);
}

- (CarSharingRingView)initWithFrame:(CGRect)a3
{
  CarSharingRingView *v3;
  CarSharingRingView *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarSharingRingView;
  v3 = -[CarSharingRingView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarSharingRingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](v4, "shapeLayer"));
    objc_msgSend(v7, "setFillColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](v4, "shapeLayer"));
    objc_msgSend(v8, "setLineWidth:", 2.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](v4, "shapeLayer"));
    objc_msgSend(v9, "setStrokeEnd:", 0.0);

    CGAffineTransformMakeRotation(&v13, -1.57079633);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](v4, "shapeLayer"));
    v12 = v13;
    objc_msgSend(v10, "setAffineTransform:", &v12);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarSharingRingView;
  -[CarSharingRingView layoutSubviews](&v9, "layoutSubviews");
  -[CarSharingRingView bounds](self, "bounds");
  if (v3 != self->_lastSize.width || v4 != self->_lastSize.height)
  {
    self->_lastSize.width = v3;
    self->_lastSize.height = v4;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0)));
    v7 = objc_msgSend(v6, "CGPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
    objc_msgSend(v8, "setPath:", v7);

  }
}

- (CGColor)color
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
  v3 = (CGColor *)objc_msgSend(v2, "strokeColor");

  return v3;
}

- (void)setColor:(CGColor *)a3
{
  void *v5;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
  objc_msgSend(v5, "setStrokeColor:", a3);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)setFilled:(BOOL)a3
{
  -[CarSharingRingView setFilled:animated:](self, "setFilled:animated:", a3, 0);
}

- (void)setFilled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v4 = a4;
  v5 = a3;
  self->_filled = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("drawCircleAnimation"));

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
    objc_msgSend(v8, "setStrokeEnd:", (double)(v5 ^ 1));

    -[CarSharingRingView setAlpha:](self, "setAlpha:", 1.0);
    +[CATransaction commit](CATransaction, "commit");
    v14 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
    objc_msgSend(v14, "setDuration:", 1.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    objc_msgSend(v14, "setToValue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    objc_msgSend(v14, "setTimingFunction:", v10);

    objc_msgSend(v14, "setDelegate:", self);
    objc_msgSend(v14, "setFillMode:", kCAFillModeBoth);
    objc_msgSend(v14, "setRemovedOnCompletion:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
    objc_msgSend(v11, "addAnimation:forKey:", v14, CFSTR("drawCircleAnimation"));

  }
  else
  {
    v12 = (double)v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView shapeLayer](self, "shapeLayer"));
    objc_msgSend(v13, "setStrokeEnd:", v12);

    -[CarSharingRingView setAlpha:](self, "setAlpha:", v12);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CarSharingRingView setFilled:](self, "setFilled:", -[CarSharingRingView isFilled](self, "isFilled"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarSharingRingView animationDelegate](self, "animationDelegate"));
  objc_msgSend(v7, "animationDidStop:finished:", v6, v4);

}

- (CAAnimationDelegate)animationDelegate
{
  return (CAAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (BOOL)isFilled
{
  return self->_filled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
}

@end
