@implementation UIDisplayP3Color

- (UIDisplayP3Color)initWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  UIDisplayP3Color *v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIDisplayP3Color *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIDisplayP3Color;
  v10 = -[UIDisplayP3Color init](&v18, sel_init);
  if (v10)
  {
    v11 = a5 >= 0.0 && a5 <= 1.0;
    if (!v11 || a4 < 0.0 || a3 > 1.0 || a3 < 0.0 || a4 > 1.0)
      UIColorBreakForOutOfRangeColorComponents();
    v12 = 1.0;
    if (a3 <= 1.0)
      v13 = a3;
    else
      v13 = 1.0;
    if (a3 < 0.0)
      v13 = 0.0;
    v10->redComponent = v13;
    if (a4 <= 1.0)
      v14 = a4;
    else
      v14 = 1.0;
    if (a4 < 0.0)
      v14 = 0.0;
    v10->greenComponent = v14;
    if (a5 <= 1.0)
      v15 = a5;
    else
      v15 = 1.0;
    if (a5 < 0.0)
      v15 = 0.0;
    v10->blueComponent = v15;
    if (a6 <= 1.0)
      v12 = a6;
    if (a6 < 0.0)
      v12 = 0.0;
    v10->alphaComponent = v12;
    v16 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UIDisplayP3Color;
  -[UIDisplayP3Color dealloc](&v3, sel_dealloc);
}

- (UIDisplayP3Color)colorWithAlphaComponent:(double)a3
{
  double v3;
  double v4;
  UIDisplayP3Color *v5;

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
    v5 = -[UIDisplayP3Color initWithDisplayP3Red:green:blue:alpha:]([UIDisplayP3Color alloc], "initWithDisplayP3Red:green:blue:alpha:", self->redComponent, self->greenComponent, self->blueComponent, v4);
  return v5;
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
  v5 = -[UIDisplayP3Color CGColor](objc_retainAutorelease(self), "CGColor");
  CGContextSetFillColorWithColor(v4, v5);
  CGContextSetStrokeColorWithColor(v4, v5);
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
  CGContextSetFillColorWithColor(v4, -[UIDisplayP3Color CGColor](objc_retainAutorelease(self), "CGColor"));
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
  CGContextSetStrokeColorWithColor(v4, -[UIDisplayP3Color CGColor](objc_retainAutorelease(self), "CGColor"));
}

- (id)colorSpaceName
{
  return CFSTR("UIDisplayP3ColorSpace");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIDisplayP3Color colorSpaceName](self, "colorSpaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %g %g %g %g"), v4, *(_QWORD *)&self->redComponent, *(_QWORD *)&self->greenComponent, *(_QWORD *)&self->blueComponent, *(_QWORD *)&self->alphaComponent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isDeepColor
{
  double v2;
  double v3;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  v9 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v6 = 0;
  -[UIDisplayP3Color getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  v2 = 1.0;
  if (v9 <= 1.0)
    v3 = v9;
  else
    v3 = 1.0;
  if (v9 < 0.0)
    v3 = 0.0;
  if (v9 != v3)
    return 1;
  if (v8 <= 1.0)
    v2 = v8;
  if (v8 < 0.0)
    v2 = 0.0;
  if (v8 != v2)
    return 1;
  v5 = 1.0;
  if (v7 <= 1.0)
    v5 = v7;
  if (v7 < 0.0)
    v5 = 0.0;
  return v7 != v5;
}

- (BOOL)isEqual:(id)a3
{
  UIDisplayP3Color *v4;
  BOOL v5;
  void *v6;
  double alphaComponent;
  void *v8;
  int v9;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = (UIDisplayP3Color *)a3;
  if (v4 == self)
  {
    v5 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !-[UIColor _isDynamic](v4, "_isDynamic"))
  {
    -[UIDisplayP3Color colorSpaceName](v4, "colorSpaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->redComponent == v4->redComponent
        && self->greenComponent == v4->greenComponent
        && self->blueComponent == v4->blueComponent)
      {
        alphaComponent = self->alphaComponent;
LABEL_18:
        v5 = alphaComponent == v4->alphaComponent;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      -[UIDisplayP3Color colorSpaceName](self, "colorSpaceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqualToString:", v8);

      if (v9
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("UIExtendedSRGBColorSpace")) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", CFSTR("UIDeviceRGBColorSpace")))
      {
        v13 = 0.0;
        v14 = 0.0;
        v11 = 0.0;
        v12 = 0.0;
        -[UIDisplayP3Color getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
        if (v14 == v4->redComponent && v13 == v4->greenComponent && v12 == v4->blueComponent)
        {
          alphaComponent = v11;
          goto LABEL_18;
        }
      }
    }
    v5 = 0;
    goto LABEL_20;
  }
  v5 = 0;
LABEL_21:

  return v5;
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

- (CGColor)CGColor
{
  unint64_t *p_cachedColor;
  CGColor *v3;
  double alphaComponent;
  double greenComponent;
  CGColor *v6;
  __int128 v8;
  __int128 v9;
  double redComponent;
  double v11;
  double blueComponent;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_cachedColor = (unint64_t *)&self->_cachedColor;
  v3 = (CGColor *)atomic_load((unint64_t *)&self->_cachedColor);
  if (!v3)
  {
    alphaComponent = self->alphaComponent;
    greenComponent = self->greenComponent;
    redComponent = self->redComponent;
    v11 = greenComponent;
    blueComponent = self->blueComponent;
    v13 = alphaComponent;
    v8 = 0u;
    v9 = 0u;
    UISCreateCachedColorTransform();
    if (qword_1ECD7C4F0 != -1)
      dispatch_once(&qword_1ECD7C4F0, &__block_literal_global_1678);
    if (CGColorTransformConvertColorComponents())
    {
      *((double *)&v9 + 1) = alphaComponent;
      if (qword_1ECD7C4C0 != -1)
        dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
      v3 = CGColorCreate((CGColorSpaceRef)qword_1ECD7C4B8, (const CGFloat *)&v8);
    }
    else
    {
      v3 = 0;
    }
    CGColorTransformRelease();
    while (1)
    {
      v6 = (CGColor *)__ldaxr(p_cachedColor);
      if (v6)
        break;
      if (!__stlxr((unint64_t)v3, p_cachedColor))
        return v3;
    }
    __clrex();
    CGColorRelease(v3);
    return v6;
  }
  return v3;
}

- (double)alphaComponent
{
  return self->alphaComponent;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;

  v16 = 0.0;
  v17 = 0.0;
  v15 = 0.0;
  -[UIDisplayP3Color getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v17, &v16, &v15, 0);
  v13 = 0;
  v14 = 0;
  v12 = 0;
  _NXRGBToHSB((long double *)&v14, (double *)&v13, (double *)&v12, v17, v16, v15);
  if (a3)
    *(_QWORD *)a3 = v14;
  if (a4)
    *(_QWORD *)a4 = v13;
  if (a5)
    *(_QWORD *)a5 = v12;
  if (a6)
    *a6 = self->alphaComponent;
  return 1;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  double greenComponent;
  double blueComponent;
  double alphaComponent;
  uint64_t v13;
  double *v14;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  greenComponent = self->greenComponent;
  blueComponent = self->blueComponent;
  alphaComponent = self->alphaComponent;
  v16[0] = *(_QWORD *)&self->redComponent;
  *(double *)&v16[1] = greenComponent;
  *(double *)&v16[2] = blueComponent;
  *(double *)&v16[3] = alphaComponent;
  if (qword_1ECD7C4F0 != -1)
    dispatch_once(&qword_1ECD7C4F0, &__block_literal_global_1678);
  v13 = qword_1ECD7C4E8;
  v17 = 0u;
  v18 = 0u;
  if (qword_1ECD7C4C0 != -1)
    dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
  if (qword_1ECD7C4B8 == v13)
    goto LABEL_12;
  if (qword_1ECD7C500 != -1)
    dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
  if (qword_1ECD7C4F8 == v13)
  {
LABEL_12:
    v14 = (double *)v16;
    if (!a3)
      goto LABEL_14;
LABEL_13:
    *a3 = *v14;
    goto LABEL_14;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  *((double *)&v18 + 1) = alphaComponent;
  CGColorTransformRelease();
  v14 = (double *)&v17;
  if (a3)
    goto LABEL_13;
LABEL_14:
  if (a4)
    *a4 = v14[1];
  if (a5)
    *a5 = v14[2];
  if (a6)
    *a6 = v14[3];
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
  if (qword_1ECD7C4F0 != -1)
    dispatch_once(&qword_1ECD7C4F0, &__block_literal_global_1678);
  v9 = qword_1ECD7C4E8;
  v13 = 0;
  v14 = 0.0;
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

@end
