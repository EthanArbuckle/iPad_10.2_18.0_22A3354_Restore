@implementation PKColor

+ (id)colorFromString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id v13;
  id v14;
  int v15;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3900];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

    v15 = 0;
    if (objc_msgSend(v5, "scanString:intoString:", CFSTR("#"), 0)
      && objc_msgSend(v5, "scanHexInt:", &v15)
      && objc_msgSend(v5, "isAtEnd"))
    {
      +[PKColor colorWithR:G:B:A:](PKColor, "colorWithR:G:B:A:", (float)((float)BYTE2(v15) / 255.0), (float)((float)BYTE1(v15) / 255.0), (float)((float)v15 / 255.0), 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "setScanLocation:", 0);
      v14 = 0;
      v7 = objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("("), &v14);
      v8 = v14;
      v9 = 0;
      if (v7
        && (v9 = 0, objc_msgSend(v5, "scanString:intoString:", CFSTR("("), 0))
        && (v13 = 0, v10 = objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(")"), &v13),
                       v9 = v13,
                       v10)
        && objc_msgSend(v5, "scanString:intoString:", CFSTR(")"), 0)
        && objc_msgSend(v5, "isAtEnd"))
      {
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _ColorWithColorSpaceAndComponents(v8, v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v5, "setScanLocation:", 0);
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)colorWithR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  PKColor *v6;
  float64x2_t v7;

  v6 = objc_alloc_init(PKColor);
  v7.f64[0] = a3;
  v7.f64[1] = a4;
  __asm { FMOV            V1.2D, #1.0 }
  *(int8x16_t *)&v6->_red = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v7, _Q1), (int8x16_t)_Q1, (int8x16_t)v7), (int8x16_t)vcltzq_f64(v7));
  v7.f64[0] = a5;
  v7.f64[1] = a6;
  *(int8x16_t *)&v6->_blue = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v7, _Q1), (int8x16_t)_Q1, (int8x16_t)v7), (int8x16_t)vcltzq_f64(v7));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKColor)initWithCoder:(id)a3
{
  id v4;
  PKColor *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKColor;
  v5 = -[PKColor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("red"));
    v5->_red = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("green"));
    v5->_green = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("blue"));
    v5->_blue = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("alpha"));
    v5->_alpha = v9;
  }

  return v5;
}

- (void)dealloc
{
  const void *v3;
  objc_super v4;

  v3 = (const void *)atomic_load((unint64_t *)&self->_colorRef);
  if (v3)
    CFRelease(v3);
  v4.receiver = self;
  v4.super_class = (Class)PKColor;
  -[PKColor dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  float red;
  double v5;
  double green;
  double blue;
  double alpha;
  id v9;

  red = self->_red;
  v9 = a3;
  *(float *)&v5 = red;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("red"), v5);
  green = self->_green;
  *(float *)&green = green;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("green"), green);
  blue = self->_blue;
  *(float *)&blue = blue;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("blue"), blue);
  alpha = self->_alpha;
  *(float *)&alpha = alpha;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("alpha"), alpha);

}

- (CGColor)CGColor
{
  unint64_t *p_colorRef;
  CGColor *result;
  __int128 v5;
  CGColor *v6;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_colorRef = (unint64_t *)&self->_colorRef;
  result = (CGColor *)atomic_load((unint64_t *)&self->_colorRef);
  if (!result)
  {
    v5 = *(_OWORD *)&self->_blue;
    v7[0] = *(_OWORD *)&self->_red;
    v7[1] = v5;
    if (qword_1ECF22280 != -1)
      dispatch_once(&qword_1ECF22280, &__block_literal_global_23);
    result = CGColorCreate((CGColorSpaceRef)_MergedGlobals_199, (const CGFloat *)v7);
    if (result)
    {
      while (1)
      {
        v6 = (CGColor *)__ldaxr(p_colorRef);
        if (v6)
          break;
        if (!__stlxr((unint64_t)result, p_colorRef))
          return result;
      }
      __clrex();
      CFRelease(result);
      return v6;
    }
  }
  return result;
}

+ (id)matchingColorFromColor:(CGColor *)a3
{
  CGColor *v3;
  CGColorSpace *v4;
  CGColor *CopyByMatchingToColorSpace;
  CGColor *v6;
  const CGFloat *Components;
  PKColor *v8;
  unint64_t *p_colorRef;

  if (!a3)
    goto LABEL_14;
  v3 = a3;
  if (qword_1ECF22280 != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (CGColorSpace *)_MergedGlobals_199;
    if (CGColorSpaceGetNumberOfComponents((CGColorSpaceRef)_MergedGlobals_199) == 3)
      break;
LABEL_14:
    __break(1u);
LABEL_15:
    dispatch_once(&qword_1ECF22280, &__block_literal_global_23);
  }
  if (CGColorGetColorSpace(v3) == v4)
    CopyByMatchingToColorSpace = (CGColor *)CFRetain(v3);
  else
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, kCGRenderingIntentPerceptual, v3, 0);
  v6 = CopyByMatchingToColorSpace;
  if (CopyByMatchingToColorSpace)
  {
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    v8 = objc_alloc_init(PKColor);
    v8->_red = *Components;
    v8->_green = Components[1];
    v8->_blue = Components[2];
    v8->_alpha = Components[3];
    p_colorRef = (unint64_t *)&v8->_colorRef;
    while (!__ldaxr(p_colorRef))
    {
      if (!__stlxr((unint64_t)v6, p_colorRef))
        return v8;
    }
    __clrex();
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)colorWithH:(double)a3 S:(double)a4 B:(double)a5 A:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  int v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;

  if (a3 <= 1.0)
    v6 = a3;
  else
    v6 = 1.0;
  if (a3 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  if (a4 <= 1.0)
    v8 = a4;
  else
    v8 = 1.0;
  if (a4 >= 0.0)
    v9 = v8;
  else
    v9 = 0.0;
  if (a5 <= 1.0)
    v10 = a5;
  else
    v10 = 1.0;
  if (a5 >= 0.0)
    v11 = v10;
  else
    v11 = 0.0;
  v12 = v7 * 6.0;
  if (v7 == 1.0)
    v12 = 0.0;
  v13 = v12;
  v14 = (int)v13;
  HIDWORD(v15) = 0;
  *(float *)&v15 = (1.0 - v9) * v11;
  v16 = (float)(v13 - (float)(int)v13);
  v19 = v11 * (1.0 - v9 * v16);
  v17 = v19;
  v18 = v11 * (1.0 - v9 * (1.0 - v16));
  *(float *)&v19 = v18;
  switch(v14)
  {
    case 0:
      v19 = *(float *)&v19;
      v15 = *(float *)&v15;
      goto LABEL_31;
    case 1:
      v18 = v17;
      v15 = *(float *)&v15;
      goto LABEL_25;
    case 2:
      v18 = *(float *)&v15;
      v15 = *(float *)&v19;
LABEL_25:
      v19 = v11;
      return (id)objc_msgSend(a1, "colorWithR:G:B:A:", v18, v19, v15, a6);
    case 3:
      v18 = *(float *)&v15;
      v19 = v17;
      goto LABEL_29;
    case 4:
      v18 = *(float *)&v19;
      v19 = *(float *)&v15;
LABEL_29:
      v15 = v11;
      break;
    case 5:
      v19 = *(float *)&v15;
      v15 = v17;
LABEL_31:
      v18 = v11;
      break;
    default:
      return (id)objc_msgSend(a1, "colorWithR:G:B:A:", v18, v19, v15, a6);
  }
  return (id)objc_msgSend(a1, "colorWithR:G:B:A:", v18, v19, v15, a6);
}

- (double)luminance
{
  return self->_green * 0.7152 + self->_red * 0.2126 + self->_blue * 0.0722;
}

- (NSString)string
{
  uint64_t v2;
  void *v3;
  float v4;
  float v5;
  unint64_t v6;
  float v7;

  v3 = &unk_190453000;
  v4 = self->_red * 255.0;
  LODWORD(v3) = llroundf(v4);
  v5 = self->_green * 255.0;
  LODWORD(v2) = llroundf(v5);
  v6 = 0x1E0CB3000uLL;
  v7 = self->_blue * 255.0;
  LODWORD(v6) = llroundf(v7);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%d, %d, %d, %.2f)"), v3, v2, v6, *(_QWORD *)&self->_alpha);
}

- (unint64_t)hash
{
  float v2;
  unint64_t v3;
  float v4;
  unint64_t v5;
  float v6;
  float v7;

  v2 = self->_red * 255.0;
  v3 = llroundf(v2);
  v4 = self->_green * 255.0;
  v5 = llroundf(v4);
  v6 = self->_blue * 255.0;
  v7 = self->_alpha * 255.0;
  return (v5 << 16) | (v3 << 24) | (llroundf(v6) << 8) | llroundf(v7);
}

- (BOOL)isEqual:(id)a3
{
  PKColor *v4;
  double *v5;

  v4 = (PKColor *)a3;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self)
        LOBYTE(self) = self->_red == v5[1] && self->_green == v5[2] && self->_blue == v5[3] && self->_alpha == v5[4];

    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

@end
