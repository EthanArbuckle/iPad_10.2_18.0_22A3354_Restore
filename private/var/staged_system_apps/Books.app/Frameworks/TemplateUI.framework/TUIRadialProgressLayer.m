@implementation TUIRadialProgressLayer

- (TUIRadialProgressLayer)init
{
  TUIRadialProgressLayer *v2;
  TUIRadialProgressLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIRadialProgressLayer;
  v2 = -[TUIRadialProgressLayer init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TUIRadialProgressLayer setFillColor:](v2, "setFillColor:", 0);
    -[TUIRadialProgressLayer setLineWidth:](v3, "setLineWidth:", 3.5);
    -[TUIRadialProgressLayer setLineCap:](v3, "setLineCap:", kCALineCapButt);
    -[TUIRadialProgressLayer setStrokeStart:](v3, "setStrokeStart:", 0.0);
    -[TUIRadialProgressLayer setStrokeEnd:](v3, "setStrokeEnd:", 0.0);
    v3->_mode = 0;
  }
  return v3;
}

- (void)setupWithMode:(unint64_t)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  const CGPath *v13;
  double v14;
  void *v15;
  double v16;
  id v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = 1.5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    v10 = 3.5;
  v11 = v10 * (a4.size.width / 27.0);
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v12 = 0.0;
  else
    v12 = 0.5;
  -[TUIRadialProgressLayer setLineWidth:](self, "setLineWidth:", v11);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectInset(v18, v12 + v11 * 0.5, v12 + v11 * 0.5);
  v13 = CGPathCreateWithEllipseInRect(v19, 0);
  -[TUIRadialProgressLayer setPath:](self, "setPath:", v13);
  CGPathRelease(v13);
  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (a3 == 1)
    {
      -[TUIRadialProgressLayer setValue:](self, "setValue:", 0.85);
      v17 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
      LODWORD(v14) = 1086918619;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
      objc_msgSend(v17, "setToValue:", v15);

      objc_msgSend(v17, "setDuration:", 1.0);
      objc_msgSend(v17, "setCumulative:", 0);
      LODWORD(v16) = 2139095040;
      objc_msgSend(v17, "setRepeatCount:", v16);
      -[TUIRadialProgressLayer addAnimation:forKey:](self, "addAnimation:forKey:", v17, CFSTR("rotationAnimation"));

    }
    else
    {
      -[TUIRadialProgressLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("rotationAnimation"));
    }
  }
}

- (void)setValue:(double)a3
{
  self->_value = a3;
  -[TUIRadialProgressLayer setStrokeEnd:](self, "setStrokeEnd:");
}

- (double)value
{
  return self->_value;
}

@end
