@implementation HKSHBatteryRing

- (HKSHBatteryRing)init
{
  return -[HKSHBatteryRing initWithFillFraction:radius:strokeWidth:](self, "initWithFillFraction:radius:strokeWidth:", 0.0, 0.0, 0.0);
}

- (HKSHBatteryRing)initWithFillFraction:(double)a3 radius:(double)a4 strokeWidth:(double)a5
{
  HKSHBatteryRing *v8;
  HKSHBatteryRing *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKSHBatteryRing;
  v8 = -[HKSHBatteryRing init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HKSHBatteryRing _validFillFraction:](v8, "_validFillFraction:", a3);
    v9->_radius = a4;
    v9->_fillFraction = v10;
    v9->_strokeWidth = a5;
    v9->_backgroundRingAlpha = 0.200000003;
  }
  return v9;
}

- (id)ringImage
{
  double radius;
  double v4;
  double v5;
  CGContext *CurrentContext;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGSize v13;

  radius = self->_radius;
  v4 = radius + self->_strokeWidth * -0.5;
  v13.width = radius + radius;
  v5 = (self->_fillFraction + self->_fillFraction) * 3.14159274 + -1.57079637;
  v13.height = radius + radius;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, self->_strokeWidth);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  -[HKSHBatteryRing fillColor](self, "fillColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStroke");
  CGContextAddArc(CurrentContext, radius, radius, v4, -1.57079637, v5, 0);
  CGContextStrokePath(CurrentContext);
  if (self->_fillFraction != 1.0)
  {
    v8 = (void *)ringImage_drainColor;
    if (!ringImage_drainColor)
    {
      objc_msgSend(v7, "colorWithAlphaComponent:", self->_backgroundRingAlpha);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)ringImage_drainColor;
      ringImage_drainColor = v9;

      v8 = (void *)ringImage_drainColor;
    }
    objc_msgSend(v8, "setStroke");
    CGContextAddArc(CurrentContext, radius, radius, v4, v5, 4.71238899, 0);
    CGContextStrokePath(CurrentContext);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)fillFractionString
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_1EEB57228 != -1)
    dispatch_once(&qword_1EEB57228, &__block_literal_global_0);
  v3 = (void *)_MergedGlobals_1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSHBatteryRing fillFractionPercent](self, "fillFractionPercent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __37__HKSHBatteryRing_fillFractionString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_1, "setNumberStyle:", 0);
  v2 = (void *)_MergedGlobals_1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

- (int64_t)fillFractionPercent
{
  return (uint64_t)(self->_fillFraction * 100.0);
}

- (id)fillColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hkshui_batteryColorForFillFraction:", self->_fillFraction);
}

- (double)_validFillFraction:(double)a3
{
  double v3;
  BOOL v4;
  double result;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  v4 = a3 < 0.0;
  result = 0.0;
  if (!v4)
    return v3;
  return result;
}

- (double)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(double)a3
{
  self->_fillFraction = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (double)backgroundRingAlpha
{
  return self->_backgroundRingAlpha;
}

- (void)setBackgroundRingAlpha:(double)a3
{
  self->_backgroundRingAlpha = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

@end
