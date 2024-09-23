@implementation UIDeviceRGBColor

- (BOOL)isEqual:(id)a3
{
  UIDeviceRGBColor *v4;
  BOOL v5;
  void *v6;
  double alphaComponent;
  double v8;
  void *v9;
  int v10;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = (UIDeviceRGBColor *)a3;
  if (v4 == self)
  {
    v5 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !-[UIColor _isDynamic](v4, "_isDynamic"))
  {
    -[UIDeviceRGBColor colorSpaceName](v4, "colorSpaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->redComponent == v4->redComponent
        && self->greenComponent == v4->greenComponent
        && self->blueComponent == v4->blueComponent)
      {
        alphaComponent = self->alphaComponent;
        v8 = v4->alphaComponent;
LABEL_17:
        v5 = alphaComponent == v8;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      -[UIDeviceRGBColor colorSpaceName](self, "colorSpaceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if (v10 || objc_msgSend(v6, "isEqualToString:", CFSTR("UIDisplayP3ColorSpace")))
      {
        v14 = 0.0;
        v15 = 0.0;
        v12 = 0.0;
        v13 = 0.0;
        -[UIDeviceRGBColor getRed:green:blue:alpha:](v4, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
        if (self->redComponent == v15 && self->greenComponent == v14 && self->blueComponent == v13)
        {
          alphaComponent = self->alphaComponent;
          v8 = v12;
          goto LABEL_17;
        }
      }
    }
    v5 = 0;
    goto LABEL_19;
  }
  v5 = 0;
LABEL_20:

  return v5;
}

- (id)colorSpaceName
{
  if (dyld_program_sdk_at_least())
    return CFSTR("UIExtendedSRGBColorSpace");
  else
    return CFSTR("UIDeviceRGBColorSpace");
}

- (unint64_t)hash
{
  return 13
       * (13
        * ((int)vcvtd_n_s64_f64(self->greenComponent, 0x10uLL) + 13
                                                               * (int)vcvtd_n_s64_f64(self->redComponent, 0x10uLL))
        + (int)vcvtd_n_s64_f64(self->blueComponent, 0x10uLL))
       + (int)vcvtd_n_s64_f64(self->alphaComponent, 0x10uLL);
}

- (UIDeviceRGBColor)initWithCGColor:(CGColor *)a3
{
  UIDeviceRGBColor *v4;
  const CGFloat *Components;
  UIDeviceRGBColor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIDeviceRGBColor;
  v4 = -[UIDeviceRGBColor init](&v8, sel_init);
  if (v4)
  {
    Components = CGColorGetComponents(a3);
    v4->redComponent = *Components;
    v4->greenComponent = Components[1];
    v4->blueComponent = Components[2];
    v4->alphaComponent = Components[3];
    v6 = v4;
  }

  return v4;
}

- (UIDeviceRGBColor)colorWithAlphaComponent:(double)a3
{
  double v3;
  double v4;
  UIDeviceRGBColor *v5;

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
    v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UIDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", self->redComponent, self->greenComponent, self->blueComponent, v4);
  return v5;
}

- (UIDeviceRGBColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  UIDeviceRGBColor *v10;
  char v16;
  double v17;
  char v18;
  double v19;
  char v20;
  double v21;
  double v22;
  UIDeviceRGBColor *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)UIDeviceRGBColor;
  v10 = -[UIDeviceRGBColor init](&v25, sel_init);
  if (v10)
  {
    if (a5 < -1.0 || a5 > 2.0 || a4 < -1.0 || a3 > 2.0 || a3 < -1.0 || a4 > 2.0)
      UIColorBreakForOutOfRangeColorComponents();
    v16 = dyld_program_sdk_at_least();
    if (a3 <= 1.0)
      v17 = a3;
    else
      v17 = 1.0;
    if (a3 < 0.0)
      v17 = 0.0;
    if ((v16 & 1) != 0)
      v17 = a3;
    v10->redComponent = v17;
    v18 = dyld_program_sdk_at_least();
    if (a4 <= 1.0)
      v19 = a4;
    else
      v19 = 1.0;
    if (a4 < 0.0)
      v19 = 0.0;
    if ((v18 & 1) != 0)
      v19 = a4;
    v10->greenComponent = v19;
    v20 = dyld_program_sdk_at_least();
    if (a5 <= 1.0)
      v21 = a5;
    else
      v21 = 1.0;
    if (a5 < 0.0)
      v21 = 0.0;
    if ((v20 & 1) != 0)
      v21 = a5;
    v10->blueComponent = v21;
    if (a6 <= 1.0)
      v22 = a6;
    else
      v22 = 1.0;
    if (a6 < 0.0)
      v22 = 0.0;
    v10->alphaComponent = v22;
    v23 = v10;
  }

  return v10;
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
  v5 = -[UIDeviceRGBColor CGColor](objc_retainAutorelease(self), "CGColor");
  CGContextSetFillColorWithColor(v4, v5);
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (CGColor)CGColor
{
  unint64_t *p_cachedColor;
  CGColor *result;
  double alphaComponent;
  double greenComponent;
  double blueComponent;
  CGColor *v8;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  p_cachedColor = (unint64_t *)&self->_cachedColor;
  result = (CGColor *)atomic_load((unint64_t *)&self->_cachedColor);
  if (!result)
  {
    alphaComponent = self->alphaComponent;
    greenComponent = self->greenComponent;
    blueComponent = self->blueComponent;
    components[0] = self->redComponent;
    components[1] = greenComponent;
    components[2] = blueComponent;
    components[3] = alphaComponent;
    if (qword_1ECD7C4C0 != -1)
      dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
    result = CGColorCreate((CGColorSpaceRef)qword_1ECD7C4B8, components);
    while (1)
    {
      v8 = (CGColor *)__ldaxr(p_cachedColor);
      if (v8)
        break;
      if (!__stlxr((unint64_t)result, p_cachedColor))
        return result;
    }
    __clrex();
    CGColorRelease(result);
    return v8;
  }
  return result;
}

- (double)alphaComponent
{
  return self->alphaComponent;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UIDeviceRGBColor;
  -[UIDeviceRGBColor dealloc](&v3, sel_dealloc);
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  double redComponent;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  redComponent = self->redComponent;
  v13 = 0;
  _NXRGBToHSB((long double *)&v15, (double *)&v14, (double *)&v13, redComponent, self->greenComponent, self->blueComponent);
  if (a3)
    *(_QWORD *)a3 = v15;
  if (a4)
    *(_QWORD *)a4 = v14;
  if (a5)
    *(_QWORD *)a5 = v13;
  if (a6)
    *a6 = self->alphaComponent;
  return 1;
}

- (UIDeviceRGBColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  char v11;
  double v12;
  char v13;
  double v14;
  char v15;
  double v16;
  long double v17;
  int v18;
  long double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v11 = dyld_program_sdk_at_least();
  if (a3 <= 1.0)
    v12 = a3;
  else
    v12 = 1.0;
  if (a3 < 0.0)
    v12 = 0.0;
  if ((v11 & 1) == 0)
    a3 = v12;
  v13 = dyld_program_sdk_at_least();
  if (a4 <= 1.0)
    v14 = a4;
  else
    v14 = 1.0;
  if (a4 < 0.0)
    v14 = 0.0;
  if ((v13 & 1) == 0)
    a4 = v14;
  v15 = dyld_program_sdk_at_least();
  if (a5 <= 1.0)
    v16 = a5;
  else
    v16 = 1.0;
  if (a5 < 0.0)
    v16 = 0.0;
  if ((v15 & 1) == 0)
    a5 = v16;
  v17 = fmod(a3, 1.0) * 6.0;
  v18 = (int)v17;
  v19 = v17 - (double)(int)v17;
  v20 = (1.0 - a4) * a5;
  v21 = (1.0 - v19 * a4) * a5;
  v22 = (1.0 - (1.0 - v19) * a4) * a5;
  v23 = a5;
  v24 = v22;
  switch(v18)
  {
    case 1:
      v23 = v21;
      v24 = a5;
      break;
    case 2:
      v23 = (1.0 - a4) * a5;
      v24 = a5;
      v20 = v22;
      break;
    case 3:
      v23 = (1.0 - a4) * a5;
      v24 = v21;
      goto LABEL_27;
    case 4:
      v23 = v22;
      v24 = (1.0 - a4) * a5;
LABEL_27:
      v20 = a5;
      break;
    case 5:
      v23 = a5;
      v24 = (1.0 - a4) * a5;
      v20 = v21;
      break;
    default:
      return -[UIDeviceRGBColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v23, v24, v20, a6);
  }
  return -[UIDeviceRGBColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v23, v24, v20, a6);
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
  CGContextSetFillColorWithColor(v4, -[UIDeviceRGBColor CGColor](objc_retainAutorelease(self), "CGColor"));
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  if (a3)
    *a3 = self->redComponent;
  if (a4)
    *a4 = self->greenComponent;
  if (a5)
    *a5 = self->blueComponent;
  if (a6)
    *a6 = self->alphaComponent;
  return 1;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  double greenComponent;
  double blueComponent;
  double alphaComponent;
  uint64_t v9;
  double *v10;
  _QWORD v12[4];
  uint64_t v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  greenComponent = self->greenComponent;
  blueComponent = self->blueComponent;
  alphaComponent = self->alphaComponent;
  v12[0] = *(_QWORD *)&self->redComponent;
  *(double *)&v12[1] = greenComponent;
  *(double *)&v12[2] = blueComponent;
  *(double *)&v12[3] = alphaComponent;
  if (qword_1ECD7C4C0 != -1)
    dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
  v13 = 0;
  v14 = 0.0;
  v9 = qword_1ECD7C4B8;
  if (qword_1ECD7C4B0 != -1)
    dispatch_once(&qword_1ECD7C4B0, &__block_literal_global_1674);
  if (qword_1ECD7C4A8 == v9)
    goto LABEL_12;
  if (qword_1ECD7C4E0 != -1)
    dispatch_once(&qword_1ECD7C4E0, &__block_literal_global_1677);
  if (qword_1ECD7C4D8 == v9)
  {
LABEL_12:
    v10 = (double *)v12;
    if (!a3)
      goto LABEL_14;
LABEL_13:
    *a3 = *v10;
    goto LABEL_14;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  v14 = alphaComponent;
  CGColorTransformRelease();
  v10 = (double *)&v13;
  if (a3)
    goto LABEL_13;
LABEL_14:
  if (a4)
    *a4 = v10[1];
  return 1;
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
  CGContextSetStrokeColorWithColor(v4, -[UIDeviceRGBColor CGColor](objc_retainAutorelease(self), "CGColor"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIDeviceRGBColor colorSpaceName](self, "colorSpaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %g %g %g %g"), v4, *(_QWORD *)&self->redComponent, *(_QWORD *)&self->greenComponent, *(_QWORD *)&self->blueComponent, *(_QWORD *)&self->alphaComponent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isDeepColor
{
  double redComponent;
  double v3;
  double greenComponent;
  double v5;
  double blueComponent;
  double v8;

  redComponent = self->redComponent;
  v3 = 0.0;
  if (redComponent >= 0.0)
  {
    v3 = 1.0;
    if (redComponent <= 1.0)
      v3 = self->redComponent;
  }
  if (redComponent != v3)
    return 1;
  greenComponent = self->greenComponent;
  v5 = 0.0;
  if (greenComponent >= 0.0)
  {
    v5 = 1.0;
    if (greenComponent <= 1.0)
      v5 = self->greenComponent;
  }
  if (greenComponent != v5)
    return 1;
  blueComponent = self->blueComponent;
  v8 = 0.0;
  if (blueComponent >= 0.0)
  {
    v8 = 1.0;
    if (blueComponent <= 1.0)
      v8 = self->blueComponent;
  }
  return blueComponent != v8;
}

@end
