@implementation CALayer

- (void)bk_setForegroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorRef v7;
  uint64_t v8;
  CGColorRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = sub_100039B8C(a3, a4, a5, a6);
  if (v7)
  {
    v9 = v7;
    v10 = objc_opt_class(CATextLayer, v8);
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
    {
      -[CALayer setForegroundColor:](self, "setForegroundColor:", v9);
    }
    else
    {
      v12 = objc_opt_class(CAShapeLayer, v11);
      if ((objc_opt_isKindOfClass(self, v12) & 1) != 0)
        -[CALayer setStrokeColor:](self, "setStrokeColor:", v9);
    }
    CFRelease(v9);
  }
}

- (void)bk_setBackgroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorRef v7;
  uint64_t v8;
  CGColorRef v9;
  uint64_t v10;

  v7 = sub_100039B8C(a3, a4, a5, a6);
  if (v7)
  {
    v9 = v7;
    v10 = objc_opt_class(CAShapeLayer, v8);
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
      -[CALayer setFillColor:](self, "setFillColor:", v9);
    else
      -[CALayer setBackgroundColor:](self, "setBackgroundColor:", v9);
    CFRelease(v9);
  }
}

@end
