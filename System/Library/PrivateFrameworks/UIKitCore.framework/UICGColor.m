@implementation UICGColor

- (BOOL)isEqual:(id)a3
{
  UICGColor *v4;
  BOOL v5;
  char isKindOfClass;
  CGColor *cachedColor;
  CGColor *v8;

  v4 = (UICGColor *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !-[UIColor _isDynamic](v4, "_isDynamic"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      cachedColor = self->_cachedColor;
      if ((isKindOfClass & 1) != 0)
        v8 = v4->_cachedColor;
      else
        v8 = -[UICGColor CGColor](objc_retainAutorelease(v4), "CGColor");
      v5 = CGColorEqualToColor(cachedColor, v8);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)colorSpaceName
{
  CGColorSpace *ColorSpace;
  unsigned __int32 v4;
  objc_super v6;

  ColorSpace = CGColorGetColorSpace(self->_cachedColor);
  v4 = CGColorSpaceGetModel(ColorSpace) + 1;
  if (v4 < 8)
    return off_1E16CACC8[v4];
  v6.receiver = self;
  v6.super_class = (Class)UICGColor;
  -[UIColor colorSpaceName](&v6, sel_colorSpaceName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  unint64_t result;

  result = (unint64_t)self->_cachedColor;
  if (result)
    return CFHash((CFTypeRef)result);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UICGColor;
  -[UICGColor dealloc](&v3, sel_dealloc);
}

- (void)set
{
  _QWORD *ContextStack;
  CGContext *v4;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetFillColorWithColor(v4, self->_cachedColor);
  CGContextSetStrokeColorWithColor(v4, self->_cachedColor);
}

- (UICGColor)colorWithAlphaComponent:(double)a3
{
  CGColor *CopyWithAlpha;
  void *v4;

  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->_cachedColor, a3);
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", CopyWithAlpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorRelease(CopyWithAlpha);
  return (UICGColor *)v4;
}

- (UICGColor)initWithCGColor:(CGColor *)a3
{
  UICGColor *v3;
  objc_super v6;

  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UICGColor;
    v3 = -[UICGColor init](&v6, sel_init);
    if (v3)
      v3->_cachedColor = CGColorRetain(a3);
  }
  return v3;
}

- (CGColor)CGColor
{
  return self->_cachedColor;
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
  CGContextSetFillColorWithColor(v4, self->_cachedColor);
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  _BOOL4 v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;

  v17 = 0.0;
  v18 = 0.0;
  v15 = 0;
  v16 = 0.0;
  v10 = -[UICGColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
  if (v10)
  {
    v13 = 0;
    v14 = 0;
    v12 = 0;
    _NXRGBToHSB((long double *)&v14, (double *)&v13, (double *)&v12, v18, v17, v16);
    if (a3)
      *(_QWORD *)a3 = v14;
    if (a4)
      *(_QWORD *)a4 = v13;
    if (a5)
      *(_QWORD *)a5 = v12;
    if (a6)
      *(_QWORD *)a6 = v15;
  }
  return v10;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  CGColor *cachedColor;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  cachedColor = self->_cachedColor;
  if (!cachedColor)
    return 0;
  Components = CGColorGetComponents(self->_cachedColor);
  Alpha = CGColorGetAlpha(cachedColor);
  ColorSpace = CGColorGetColorSpace(cachedColor);
  if (!Components)
    return 0;
  v14 = ColorSpace;
  v19 = 0u;
  v20 = 0u;
  if (qword_1ECD7C4C0 != -1)
    dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
  if ((CGColorSpaceRef)qword_1ECD7C4B8 == v14)
    goto LABEL_11;
  if (qword_1ECD7C500 != -1)
    dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
  if ((CGColorSpaceRef)qword_1ECD7C4F8 == v14)
    goto LABEL_11;
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  *((CGFloat *)&v20 + 1) = Alpha;
  CGColorTransformRelease();
  Components = (const CGFloat *)&v19;
LABEL_11:
  v16 = *((_QWORD *)Components + 1);
  v15 = *((_QWORD *)Components + 2);
  v17 = *((_QWORD *)Components + 3);
  if (a3)
    *a3 = *Components;
  if (a4)
    *(_QWORD *)a4 = v16;
  if (a5)
    *(_QWORD *)a5 = v15;
  if (a6)
    *(_QWORD *)a6 = v17;
  return 1;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  CGColor *cachedColor;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v10;
  uint64_t v11;
  uint64_t v13;
  CGFloat v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  cachedColor = self->_cachedColor;
  if (!cachedColor)
    return 0;
  Components = CGColorGetComponents(self->_cachedColor);
  Alpha = CGColorGetAlpha(cachedColor);
  ColorSpace = CGColorGetColorSpace(cachedColor);
  if (!Components)
    return 0;
  v10 = ColorSpace;
  v13 = 0;
  v14 = 0.0;
  if (qword_1ECD7C4B0 != -1)
    dispatch_once(&qword_1ECD7C4B0, &__block_literal_global_1674);
  if ((CGColorSpaceRef)qword_1ECD7C4A8 == v10)
    goto LABEL_11;
  if (qword_1ECD7C4E0 != -1)
    dispatch_once(&qword_1ECD7C4E0, &__block_literal_global_1677);
  if ((CGColorSpaceRef)qword_1ECD7C4D8 == v10)
    goto LABEL_11;
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  v14 = Alpha;
  CGColorTransformRelease();
  Components = (const CGFloat *)&v13;
LABEL_11:
  v11 = *((_QWORD *)Components + 1);
  if (a3)
    *a3 = *Components;
  if (a4)
    *(_QWORD *)a4 = v11;
  return 1;
}

- (double)alphaComponent
{
  return CGColorGetAlpha(self->_cachedColor);
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
  CGContextSetStrokeColorWithColor(v4, self->_cachedColor);
}

- (id)description
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  void *i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  NumberOfComponents = CGColorGetNumberOfComponents(self->_cachedColor);
  Components = CGColorGetComponents(self->_cachedColor);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); NumberOfComponents; --NumberOfComponents)
  {
    v6 = *(_QWORD *)Components++;
    objc_msgSend(i, "appendFormat:", CFSTR("%g "), v6);
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[UICGColor colorSpaceName](self, "colorSpaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v8, i);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_isDeepColor
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  if (-[UICGColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v11, &v10, &v9, 0))
  {
    v3 = 1.0;
    if (v11 <= 1.0)
      v4 = v11;
    else
      v4 = 1.0;
    if (v11 < 0.0)
      v4 = 0.0;
    if (v11 != v4)
      goto LABEL_13;
    if (v10 <= 1.0)
      v3 = v10;
    if (v10 < 0.0)
      v3 = 0.0;
    if (v10 != v3)
    {
LABEL_13:
      LOBYTE(v5) = 1;
      return v5;
    }
    v6 = v9;
  }
  else
  {
    v5 = -[UICGColor getWhite:alpha:](self, "getWhite:alpha:", &v12, 0);
    if (!v5)
      return v5;
    v6 = v12;
  }
  v7 = 1.0;
  if (v6 <= 1.0)
    v7 = v6;
  if (v6 < 0.0)
    v7 = 0.0;
  LOBYTE(v5) = v6 != v7;
  return v5;
}

- (BOOL)isPatternColor
{
  CGColorSpace *ColorSpace;

  ColorSpace = CGColorGetColorSpace(self->_cachedColor);
  return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelPattern;
}

@end
