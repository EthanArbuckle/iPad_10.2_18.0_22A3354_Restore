@implementation CAScrollLayer

- (void)setContentOffset:(CGPoint)a3
{
  -[CAScrollLayer setContentOffset:animated:](self, "setContentOffset:animated:", 0, a3.x, a3.y);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CABasicAnimation *v17;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = -[CAScrollLayer bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[CAScrollLayer setBounds:](self, "setBounds:", TSDRectWithOriginAndSize(v8, x, y, v13, v15));
  if (v4)
  {
    v17 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("bounds"));
    -[CABasicAnimation setDuration:](v17, "setDuration:", 0.2);
    -[CABasicAnimation setTimingFunction:](v17, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    -[CABasicAnimation setFromValue:](v17, "setFromValue:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v10, v12, v14, v16));
    -[CAScrollLayer addAnimation:forKey:](self, "addAnimation:forKey:", v17, CFSTR("scrollAnimation"));
  }
}

@end
