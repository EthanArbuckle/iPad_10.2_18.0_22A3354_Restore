@implementation UIDeviceWhiteColor

- (BOOL)isEqual:(id)a3
{
  UIDeviceWhiteColor *v4;
  BOOL v5;
  void *v6;
  double alphaComponent;
  double v8;
  void *v9;
  int v10;
  double v12;
  double v13;

  v4 = (UIDeviceWhiteColor *)a3;
  if (v4 == self)
  {
    v5 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !-[UIColor _isDynamic](v4, "_isDynamic"))
  {
    -[UIDeviceWhiteColor colorSpaceName](v4, "colorSpaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->whiteComponent == v4->whiteComponent)
      {
        alphaComponent = self->alphaComponent;
        v8 = v4->alphaComponent;
LABEL_12:
        v5 = alphaComponent == v8;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      -[UIDeviceWhiteColor colorSpaceName](self, "colorSpaceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if (v10)
      {
        v12 = 0.0;
        v13 = 0.0;
        -[UIDeviceWhiteColor getWhite:alpha:](v4, "getWhite:alpha:", &v13, &v12);
        if (self->whiteComponent == v13)
        {
          alphaComponent = self->alphaComponent;
          v8 = v12;
          goto LABEL_12;
        }
      }
    }
    v5 = 0;
    goto LABEL_14;
  }
  v5 = 0;
LABEL_15:

  return v5;
}

- (id)colorSpaceName
{
  if (dyld_program_sdk_at_least())
    return CFSTR("UIExtendedGrayColorSpace");
  else
    return CFSTR("UIDeviceWhiteColorSpace");
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  if (a3)
    *a3 = self->whiteComponent;
  if (a4)
    *a4 = self->alphaComponent;
  return 1;
}

- (CGColor)CGColor
{
  unint64_t *p_cachedColor;
  CGColor *result;
  double alphaComponent;
  CGColor *v6;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  p_cachedColor = (unint64_t *)&self->_cachedColor;
  result = (CGColor *)atomic_load((unint64_t *)&self->_cachedColor);
  if (!result)
  {
    alphaComponent = self->alphaComponent;
    components[0] = self->whiteComponent;
    components[1] = alphaComponent;
    if (qword_1ECD7C4B0 != -1)
      dispatch_once(&qword_1ECD7C4B0, &__block_literal_global_1674);
    result = CGColorCreate((CGColorSpaceRef)qword_1ECD7C4A8, components);
    while (1)
    {
      v6 = (CGColor *)__ldaxr(p_cachedColor);
      if (v6)
        break;
      if (!__stlxr((unint64_t)result, p_cachedColor))
        return result;
    }
    __clrex();
    CGColorRelease(result);
    return v6;
  }
  return result;
}

- (unint64_t)hash
{
  return (int)vcvtd_n_s64_f64(self->alphaComponent, 0x10uLL)
       + 13 * (int)vcvtd_n_s64_f64(self->whiteComponent, 0x10uLL);
}

- (void)set
{
  _QWORD *ContextStack;
  CGContext *v4;
  CGColor *v5;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v5 = -[UIDeviceWhiteColor CGColor](objc_retainAutorelease(self), "CGColor");
  CGContextSetFillColorWithColor(v4, v5);
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (double)alphaComponent
{
  return self->alphaComponent;
}

- (UIDeviceWhiteColor)colorWithAlphaComponent:(double)a3
{
  double v3;
  double v4;
  UIDeviceWhiteColor *v5;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  if (a3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  if (v4 == self->alphaComponent)
    v5 = self;
  else
    v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UIDeviceWhiteColor alloc], "initWithWhite:alpha:", self->whiteComponent, v4);
  return v5;
}

- (UIDeviceWhiteColor)initWithWhite:(double)a3 alpha:(double)a4
{
  uint64_t v7;
  UIDeviceWhiteColor *v8;
  char v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  objc_super v17;

  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    if (a3 == 1.0 && a4 == 1.0)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 0.0 && a4 == 1.0)
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 0.0 && a4 == 0.0)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 0.0 && a4 == 0.5)
    {
      +[UIColor __halfTransparentBlackColor](UIColor, "__halfTransparentBlackColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 1.0 || a4 != 0.5)
        goto LABEL_2;
      +[UIColor __halfTransparentWhiteColor](UIColor, "__halfTransparentWhiteColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (UIDeviceWhiteColor *)v15;
    if (v15)
    {

      return v8;
    }
  }
LABEL_2:
  v17.receiver = self;
  v17.super_class = (Class)UIDeviceWhiteColor;
  v8 = -[UIDeviceWhiteColor init](&v17, sel_init);
  if (v8)
  {
    if (a3 > 2.0 || a3 < -1.0)
      UIColorBreakForOutOfRangeColorComponents();
    v10 = dyld_program_sdk_at_least();
    v11 = 0.0;
    v12 = 1.0;
    if (a3 <= 1.0)
      v13 = a3;
    else
      v13 = 1.0;
    if (a3 < 0.0)
      v13 = 0.0;
    if ((v10 & 1) != 0)
      v13 = a3;
    v8->whiteComponent = v13;
    if (a4 <= 1.0)
      v12 = a4;
    if (a4 >= 0.0)
      v11 = v12;
    v8->alphaComponent = v11;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UIDeviceWhiteColor;
  -[UIDeviceWhiteColor dealloc](&v3, sel_dealloc);
}

- (UIDeviceWhiteColor)initWithCGColor:(CGColor *)a3
{
  UIDeviceWhiteColor *v4;
  const CGFloat *Components;
  UIDeviceWhiteColor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIDeviceWhiteColor;
  v4 = -[UIDeviceWhiteColor init](&v8, sel_init);
  if (v4)
  {
    Components = CGColorGetComponents(a3);
    v4->whiteComponent = *Components;
    v4->alphaComponent = Components[1];
    v6 = v4;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIDeviceWhiteColor colorSpaceName](self, "colorSpaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %g %g"), v4, *(_QWORD *)&self->whiteComponent, *(_QWORD *)&self->alphaComponent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setStroke
{
  _QWORD *ContextStack;
  CGContext *v4;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetStrokeColorWithColor(v4, -[UIDeviceWhiteColor CGColor](objc_retainAutorelease(self), "CGColor"));
}

- (void)setFill
{
  _QWORD *ContextStack;
  CGContext *v4;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetFillColorWithColor(v4, -[UIDeviceWhiteColor CGColor](objc_retainAutorelease(self), "CGColor"));
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  if (a3)
    *a3 = self->whiteComponent;
  if (a4)
    *a4 = self->whiteComponent;
  if (a5)
    *a5 = self->whiteComponent;
  if (a6)
    *a6 = self->alphaComponent;
  return 1;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  if (a3)
    *a3 = 0.0;
  if (a4)
    *a4 = 0.0;
  if (a5)
    *a5 = self->whiteComponent;
  if (a6)
    *a6 = self->alphaComponent;
  return 1;
}

- (BOOL)_isDeepColor
{
  double whiteComponent;
  double v3;

  whiteComponent = self->whiteComponent;
  v3 = 0.0;
  if (whiteComponent >= 0.0)
  {
    v3 = 1.0;
    if (whiteComponent <= 1.0)
      v3 = self->whiteComponent;
  }
  return whiteComponent != v3;
}

@end
