@implementation CAShapeLayer

- (void)setOpacity:(float)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  id v8;

  v4 = a4;
  -[CAShapeLayer opacity](self, "opacity");
  if (*(float *)&v7 != a3)
  {
    *(float *)&v7 = a3;
    if (v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
      -[CAShapeLayer animateProperty:toValue:timing:](self, "animateProperty:toValue:timing:", CFSTR("opacity"), v8, kCAMediaTimingFunctionLinear);

    }
    else
    {
      -[CAShapeLayer setOpacity:](self, "setOpacity:", v7);
    }
  }
}

- (void)setStrokeColor:(CGColor *)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (!CGColorEqualToColor(-[CAShapeLayer strokeColor](self, "strokeColor"), a3))
  {
    if (v4)
      -[CAShapeLayer animateProperty:toValue:timing:](self, "animateProperty:toValue:timing:", CFSTR("strokeColor"), a3, kCAMediaTimingFunctionLinear);
    else
      -[CAShapeLayer setStrokeColor:](self, "setStrokeColor:", a3);
  }
}

- (void)setPath:(CGPath *)a3 fromPath:(CGPath *)a4 animated:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  if (!CGPathEqualToPath(-[CAShapeLayer path](self, "path"), a3))
  {
    if (v5)
      -[CAShapeLayer animateProperty:toValue:fromValue:timing:](self, "animateProperty:toValue:fromValue:timing:", CFSTR("path"), a3, a4, kCAMediaTimingFunctionEaseOut);
    else
      -[CAShapeLayer setPath:](self, "setPath:", a3);
  }
}

- (void)setPath:(CGPath *)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (!CGPathEqualToPath(-[CAShapeLayer path](self, "path"), a3))
  {
    if (v4)
      -[CAShapeLayer animateProperty:toValue:timing:](self, "animateProperty:toValue:timing:", CFSTR("path"), a3, kCAMediaTimingFunctionEaseOut);
    else
      -[CAShapeLayer setPath:](self, "setPath:", a3);
  }
}

- (void)setFillColor:(CGColor *)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (!CGColorEqualToColor(-[CAShapeLayer fillColor](self, "fillColor"), a3))
  {
    if (v4)
      -[CAShapeLayer animateProperty:toValue:timing:](self, "animateProperty:toValue:timing:", CFSTR("fillColor"), a3, kCAMediaTimingFunctionLinear);
    else
      -[CAShapeLayer setFillColor:](self, "setFillColor:", a3);
  }
}

@end
