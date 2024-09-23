@implementation WFColor

+ (WFColor)colorWithCGColor:(CGColor *)a3
{
  return -[WFColor initWithCGColor:]([WFColor alloc], "initWithCGColor:", a3);
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_CGColor);
  v3.receiver = self;
  v3.super_class = (Class)WFColor;
  -[WFColor dealloc](&v3, sel_dealloc);
}

- (WFColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorSpace *v11;
  CGColorSpace *v12;
  double v13;
  CGColor *v14;
  WFColor *v15;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  v12 = v11;
  components[0] = a3;
  components[1] = a4;
  v13 = 1.0;
  if (a6 <= 1.0)
    v13 = a6;
  if (a6 < 0.0)
    v13 = 0.0;
  components[2] = a5;
  components[3] = v13;
  v14 = CGColorCreate(v11, components);
  v15 = -[WFColor initWithCGColor:](self, "initWithCGColor:", v14);
  CGColorSpaceRelease(v12);
  CGColorRelease(v14);
  return v15;
}

- (WFColor)initWithCGColor:(CGColor *)a3
{
  WFColor *v5;
  WFColor *v6;
  WFColor *v7;
  void *v10;
  objc_super v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFColor.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CGColor"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WFColor;
  v5 = -[WFColor init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_representationType = 0;
    v5->_CGColor = CGColorRetain(a3);
    v7 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_NSColor, 0);
  objc_destroyWeak((id *)&self->_platformColor);
}

- (WFColor)colorWithAlphaComponent:(double)a3
{
  CGColor *CopyWithAlpha;
  WFColor *v4;

  CopyWithAlpha = CGColorCreateCopyWithAlpha(-[WFColor CGColor](objc_retainAutorelease(self), "CGColor"), a3);
  v4 = -[WFColor initWithCGColor:]([WFColor alloc], "initWithCGColor:", CopyWithAlpha);
  CGColorRelease(CopyWithAlpha);
  return v4;
}

- (WFColor)initWithPlatformColor:(id)a3
{
  return -[WFColor initWithCGColor:](self, "initWithCGColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFColor representationType](self, "representationType"), CFSTR("representationType"));
  v5 = -[WFColor representationType](self, "representationType");
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "encodeInteger:forKey:", -[WFColor systemColor](self, "systemColor"), CFSTR("systemColor"));
    }
    else if (v5 == 2)
    {
      -[WFColor colorName](self, "colorName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("colorName"));

      -[WFColor bundle](self, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundle"));

    }
  }
  else
  {
    v15 = 0.0;
    v16 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    if (-[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13))
    {
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("redComponent"), v16);
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("greenComponent"), v15);
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("blueComponent"), v14);
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("alphaComponent"), v13);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = WFColorErrorDomain;
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("Unable to convert color to RGB color space for serialization");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v12);

    }
  }

}

- (double)red
{
  _BOOL4 v2;
  double result;
  double v4;

  v4 = 0.0;
  v2 = -[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v4, 0, 0, 0);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (double)green
{
  _BOOL4 v2;
  double result;
  double v4;

  v4 = 0.0;
  v2 = -[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", 0, &v4, 0, 0);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (double)blue
{
  _BOOL4 v2;
  double result;
  double v4;

  v4 = 0.0;
  v2 = -[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", 0, 0, &v4, 0);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (id)paletteGradientFallingBackToDefaultGradient:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (paletteGradientFallingBackToDefaultGradient__onceToken != -1)
    dispatch_once(&paletteGradientFallingBackToDefaultGradient__onceToken, &__block_literal_global_4665);
  v5 = (void *)paletteGradientFallingBackToDefaultGradient__colorToGradientIndexMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[WFColor RGBAValue](self, "RGBAValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "workflowGradientPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "unsignedIntegerValue"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v3)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend((id)objc_opt_class(), "workflowGradientPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

LABEL_8:
  return v10;
}

- (unsigned)RGBAValue
{
  NSObject *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  uint8_t buf[4];
  WFColor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (!-[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5))
  {
    v3 = os_log_create("com.apple.shortcuts", "General");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_fault_impl(&dword_1AF681000, v3, OS_LOG_TYPE_FAULT, "Could not get RGB components from color %{public}@", buf, 0xCu);
    }

  }
  return ((int)(v8 * 255.0) << 24) | ((int)(v7 * 255.0) << 16) | ((int)(v6 * 255.0) << 8) | (int)(v5 * 255.0);
}

+ (id)workflowGradientPalette
{
  if (workflowGradientPalette_onceToken != -1)
    dispatch_once(&workflowGradientPalette_onceToken, &__block_literal_global_74_4699);
  return (id)workflowGradientPalette_workflowGradientPalette;
}

- (BOOL)isEqual:(id)a3
{
  WFColor *v4;
  WFColor *v5;
  WFColor *v6;
  WFColor *v7;
  CGColor *v8;
  WFColor *v9;
  unint64_t v10;
  WFColor *v11;
  uint64_t v12;
  CGColor *v13;
  WFColor *v14;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  _QWORD v21[5];
  _QWORD aBlock[5];

  v4 = (WFColor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (-[WFColor systemColor](self, "systemColor") && -[WFColor systemColor](v9, "systemColor"))
    {
      v10 = -[WFColor systemColor](self, "systemColor");
      LOBYTE(v8) = v10 == -[WFColor systemColor](v9, "systemColor");
    }
    else
    {
      v11 = objc_retainAutorelease(v9);
      v12 = -[WFColor CGColor](v11, "CGColor");
      if (v11)
      {
        v13 = (CGColor *)v12;
        v14 = objc_retainAutorelease(self);
        ColorSpace = CGColorGetColorSpace(-[WFColor CGColor](v14, "CGColor"));
        v16 = CGColorGetColorSpace(v13);
        LOBYTE(v8) = 0;
        if (ColorSpace && v16)
        {
          if (CGColorSpaceEqualToColorSpace())
          {
            LOBYTE(v8) = CGColorEqualToColor(-[WFColor CGColor](objc_retainAutorelease(v14), "CGColor"), v13);
          }
          else
          {
            v8 = (CGColor *)MEMORY[0x1B5DFB980](ColorSpace, 0);
            v17 = MEMORY[0x1E0C809B0];
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __19__WFColor_isEqual___block_invoke;
            aBlock[3] = &__block_descriptor_40_e5_v8__0l;
            aBlock[4] = v8;
            v18 = (void (**)(_QWORD))_Block_copy(aBlock);
            if (v8)
            {
              v8 = (CGColor *)CGColorTransformConvertColor();
              v21[0] = v17;
              v21[1] = 3221225472;
              v21[2] = __19__WFColor_isEqual___block_invoke_2;
              v21[3] = &__block_descriptor_40_e5_v8__0l;
              v21[4] = v8;
              v19 = (void (**)(_QWORD))_Block_copy(v21);
              if (v8)
                LOBYTE(v8) = CGColorEqualToColor(-[WFColor CGColor](objc_retainAutorelease(v14), "CGColor"), v8);
              v19[2](v19);

            }
            v18[2](v18);

          }
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }

  }
  return (char)v8;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  CGColor *v10;
  CGColor *v11;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpace *ColorSpace;
  void *v15;
  void *v16;
  const __CFString *v17;
  BOOL v18;
  CGColorSpace *v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = -[WFColor CGColor](objc_retainAutorelease(self), "CGColor");
  if (v10)
  {
    v11 = v10;
    Components = CGColorGetComponents(v10);
    Alpha = CGColorGetAlpha(v11);
    ColorSpace = CGColorGetColorSpace(v11);
    if (Components)
    {
      v21 = 0u;
      v22 = 0u;
      CGColorSpaceGetName(ColorSpace);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C9DA10], v21, v22) & 1) != 0)
          goto LABEL_11;
        v17 = (const __CFString *)*MEMORY[0x1E0C9D960];
        if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C9D960]) & 1) != 0)
          goto LABEL_11;
      }
      else
      {
        v17 = (const __CFString *)*MEMORY[0x1E0C9D960];
      }
      v19 = CGColorSpaceCreateWithName(v17);
      MEMORY[0x1B5DFB980](v19, 0);
      CGColorSpaceRelease(v19);
      if (!CGColorTransformConvertColorComponents())
      {
        CGColorTransformRelease();
        v18 = 0;
LABEL_21:

        return v18;
      }
      *((CGFloat *)&v22 + 1) = Alpha;
      CGColorTransformRelease();
      Components = (const CGFloat *)&v21;
LABEL_11:
      if (a3)
        *a3 = *Components;
      if (a4)
        *a4 = Components[1];
      if (a5)
        *a5 = Components[2];
      if (a6)
        *a6 = Components[3];
      v18 = 1;
      goto LABEL_21;
    }
  }
  return 0;
}

- (CGColor)CGColor
{
  unint64_t representationType;
  CGColor *v3;
  id v4;
  CGColor *v5;

  representationType = self->_representationType;
  v3 = (CGColor *)(representationType - 1);
  if (representationType - 1 >= 2)
  {
    if (!representationType)
      return self->_CGColor;
    return v3;
  }
  else
  {
    -[WFColor platformColor](self, "platformColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (CGColor *)objc_msgSend(v4, "CGColor");

    return v5;
  }
}

- (UIColor)UIColor
{
  UIColor **p_platformColor;
  id WeakRetained;
  unint64_t v5;
  uint64_t v6;
  id v7;

  p_platformColor = &self->_platformColor;
  WeakRetained = objc_loadWeakRetained((id *)&self->_platformColor);
  if (!WeakRetained)
  {
    v5 = -[WFColor representationType](self, "representationType");
    if (v5)
    {
      if (v5 != 2)
      {
        if (v5 == 1)
        {
          switch(-[WFColor systemColor](self, "systemColor"))
          {
            case 0uLL:
              -[objc_class clearColor](getUIColorClass(), "clearColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 1uLL:
              -[objc_class labelColor](getUIColorClass(), "labelColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 2uLL:
              -[objc_class systemRedColor](getUIColorClass(), "systemRedColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 3uLL:
              -[objc_class systemGreenColor](getUIColorClass(), "systemGreenColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 4uLL:
              -[objc_class systemBlueColor](getUIColorClass(), "systemBlueColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 5uLL:
              -[objc_class systemOrangeColor](getUIColorClass(), "systemOrangeColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 6uLL:
              -[objc_class systemYellowColor](getUIColorClass(), "systemYellowColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 7uLL:
              -[objc_class systemPinkColor](getUIColorClass(), "systemPinkColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 8uLL:
              -[objc_class systemPurpleColor](getUIColorClass(), "systemPurpleColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 9uLL:
              -[objc_class systemTealColor](getUIColorClass(), "systemTealColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 10uLL:
              -[objc_class systemIndigoColor](getUIColorClass(), "systemIndigoColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 11uLL:
              -[objc_class systemBrownColor](getUIColorClass(), "systemBrownColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 12uLL:
              -[objc_class systemMintColor](getUIColorClass(), "systemMintColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 13uLL:
              -[objc_class systemCyanColor](getUIColorClass(), "systemCyanColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 14uLL:
              -[objc_class systemGrayColor](getUIColorClass(), "systemGrayColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 15uLL:
              -[objc_class secondaryLabelColor](getUIColorClass(), "secondaryLabelColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 16uLL:
              -[objc_class secondarySystemFillColor](getUIColorClass(), "secondarySystemFillColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 17uLL:
              -[objc_class secondarySystemBackgroundColor](getUIColorClass(), "secondarySystemBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 18uLL:
              -[objc_class tertiarySystemBackgroundColor](getUIColorClass(), "tertiarySystemBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 19uLL:
              -[objc_class systemGroupedBackgroundColor](getUIColorClass(), "systemGroupedBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 20uLL:
              -[objc_class tertiarySystemGroupedBackgroundColor](getUIColorClass(), "tertiarySystemGroupedBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 21uLL:
              -[objc_class whiteColor](getUIColorClass(), "whiteColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 22uLL:
              -[objc_class blackColor](getUIColorClass(), "blackColor");
              v6 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            default:
              break;
          }
        }
        WeakRetained = 0;
        goto LABEL_11;
      }
      -[objc_class colorNamed:inBundle:compatibleWithTraitCollection:](getUIColorClass(), "colorNamed:inBundle:compatibleWithTraitCollection:", self->_colorName, self->_bundle, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(getUIColorClass()), "initWithCGColor:", -[WFColor CGColor](objc_retainAutorelease(self), "CGColor"));
    }
LABEL_10:
    WeakRetained = (id)v6;
LABEL_11:
    objc_storeWeak((id *)p_platformColor, WeakRetained);
  }
  v7 = WeakRetained;

  return (UIColor *)v7;
}

- (unint64_t)representationType
{
  return self->_representationType;
}

- (unint64_t)systemColor
{
  return self->_systemColor;
}

- (WFColor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFColor *v10;
  WFColor *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("representationType"));
  if (!v5)
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("redComponent"))
      || !objc_msgSend(v4, "containsValueForKey:", CFSTR("greenComponent"))
      || !objc_msgSend(v4, "containsValueForKey:", CFSTR("blueComponent"))
      || !objc_msgSend(v4, "containsValueForKey:", CFSTR("alphaComponent")))
    {
      goto LABEL_15;
    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("redComponent"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("greenComponent"));
    v15 = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blueComponent"));
    v17 = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("alphaComponent"));
    v11 = -[WFColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v13, v15, v17, v18);
LABEL_9:
    self = v11;
    v10 = self;
    goto LABEL_18;
  }
  if (v5 == 1)
  {
    v11 = -[WFColor initWithSystemColor:](self, "initWithSystemColor:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("systemColor")));
    goto LABEL_9;
  }
  if (v5 != 2)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    if (v6 && v8)
    {
      self = -[WFColor initWithColorName:inBundle:](self, "initWithColorName:inBundle:", v6, v8);
      v10 = self;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

LABEL_18:
  return v10;
}

+ (WFColor)whiteColor
{
  return +[WFColor colorWithWhite:alpha:](WFColor, "colorWithWhite:alpha:", 1.0, 1.0);
}

+ (WFColor)colorWithWhite:(double)a3 alpha:(double)a4
{
  return -[WFColor initWithWhite:alpha:]([WFColor alloc], "initWithWhite:alpha:", a3, a4);
}

- (WFColor)initWithWhite:(double)a3 alpha:(double)a4
{
  CGColorSpace *v7;
  CGColorSpace *v8;
  double v9;
  CGColor *v10;
  WFColor *v11;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D930]);
  v8 = v7;
  v9 = 1.0;
  if (a4 <= 1.0)
    v9 = a4;
  if (a4 < 0.0)
    v9 = 0.0;
  components[0] = a3;
  components[1] = v9;
  v10 = CGColorCreate(v7, components);
  v11 = -[WFColor initWithCGColor:](self, "initWithCGColor:", v10);
  CGColorSpaceRelease(v8);
  CGColorRelease(v10);
  return v11;
}

+ (WFColor)clearColor
{
  return +[WFColor colorWithWhite:alpha:](WFColor, "colorWithWhite:alpha:", 0.0, 0.0);
}

- (WFGradient)gradient
{
  WFGradient *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  WFColor *v22;
  double v23;
  WFColor *v24;
  WFColor *v25;
  WFColor *v26;
  WFColor *v27;
  WFColor *v28;

  if (-[WFColor hasPaletteGradient](self, "hasPaletteGradient"))
  {
    -[WFColor paletteGradient](self, "paletteGradient");
    v3 = (WFGradient *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFColor red](self, "red");
    v5 = v4;
    -[WFColor blue](self, "blue");
    v7 = v6;
    -[WFColor green](self, "green");
    v9 = v8 * 0.7152 + v5 * 0.2126 + v7 * 0.0722;
    v10 = 0.0;
    v11 = 0.7;
    v12 = 0.25;
    if (v9 <= 0.25)
    {
      v12 = 0.2;
    }
    else if (v9 > 0.5)
    {
      v12 = dbl_1AF77F060[v9 > 0.75];
      if (v9 <= 0.75)
        v10 = 0.0;
      else
        v10 = 1.0;
      v11 = dbl_1AF77F070[v9 > 0.75];
    }
    v13 = v5 - (v9 - v5) * 0.2;
    v14 = 1.0 - v13;
    if (v12 < 0.0)
      v14 = v5 - (v9 - v5) * 0.2;
    v15 = v13 + v12 * v14;
    v16 = v7 - (v9 - v7) * 0.2;
    v17 = 1.0 - v16;
    if (v12 < 0.0)
      v17 = v7 - (v9 - v7) * 0.2;
    v18 = v16 + v12 * v17;
    v19 = v8 - (v9 - v8) * 0.2;
    v20 = 1.0 - v19;
    if (v12 < 0.0)
      v20 = v19;
    v21 = v19 + v12 * v20;
    v22 = [WFColor alloc];
    -[WFColor alpha](self, "alpha");
    v24 = -[WFColor initWithRed:green:blue:alpha:](v22, "initWithRed:green:blue:alpha:", v15, v21, v18, v23);
    v25 = self;
    if (v10 <= v11)
      v26 = v24;
    else
      v26 = v25;
    if (v10 <= v11)
      v27 = v25;
    else
      v27 = v24;
    v28 = v24;
    v3 = -[WFGradient initWithStartColor:endColor:]([WFGradient alloc], "initWithStartColor:endColor:", v26, v27);

  }
  return v3;
}

- (WFGradient)paletteGradient
{
  return (WFGradient *)-[WFColor paletteGradientFallingBackToDefaultGradient:](self, "paletteGradientFallingBackToDefaultGradient:", 1);
}

- (BOOL)hasPaletteGradient
{
  void *v2;
  BOOL v3;

  -[WFColor paletteGradientFallingBackToDefaultGradient:](self, "paletteGradientFallingBackToDefaultGradient:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (WFColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[WFColor initWithRed:green:blue:alpha:]([WFColor alloc], "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (WFColor)colorWithRGBAValue:(unsigned int)a3
{
  return +[WFColor colorWithRed:green:blue:alpha:](WFColor, "colorWithRed:green:blue:alpha:", (double)HIBYTE(a3) / 255.0, (double)BYTE2(a3) / 255.0, (double)BYTE1(a3) / 255.0, (double)a3 / 255.0);
}

+ (WFColor)colorWithSystemColor:(unint64_t)a3
{
  return -[WFColor initWithSystemColor:]([WFColor alloc], "initWithSystemColor:", a3);
}

- (WFColor)initWithSystemColor:(unint64_t)a3
{
  WFColor *v4;
  WFColor *v5;
  WFColor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFColor;
  v4 = -[WFColor init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_representationType = 1;
    v4->_systemColor = a3;
    v6 = v4;
  }

  return v5;
}

- (double)alpha
{
  _BOOL4 v2;
  double result;
  double v4;

  v4 = 0.0;
  v2 = -[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", 0, 0, 0, &v4);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

+ (id)colorNamed:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  WFColor *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WFColor initWithColorName:inBundle:]([WFColor alloc], "initWithColorName:inBundle:", v6, v5);

  return v7;
}

- (WFColor)initWithColorName:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  WFColor *v8;
  WFColor *v9;
  uint64_t v10;
  NSString *colorName;
  WFColor *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFColor;
  v8 = -[WFColor init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_representationType = 2;
    v10 = objc_msgSend(v6, "copy");
    colorName = v9->_colorName;
    v9->_colorName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_bundle, a4);
    v12 = v9;
  }

  return v9;
}

void __51__WFColor_WorkflowPalette__workflowGradientPalette__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[17];

  v17[15] = *MEMORY[0x1E0C80C00];
  WFWorkflowGradientFromRGBA(3881920767, 3680263423, 3260237823, 3125427711);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  WFWorkflowGradientFromRGBA(4035143167, 3950730239, 3226876415, 3008246527);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  WFWorkflowGradientFromRGBA(3953481727, 3869068543, 2825198335, 2707297279);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  WFWorkflowGradientFromRGBA(4038803711, 3736876031, 2827687423, 2238516735);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  WFWorkflowGradientFromRGBA(1707237887, 1488475391, 997931519, 930821375);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v12;
  WFWorkflowGradientFromRGBA(717727999, 650093055, 343237119, 258890751);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v0;
  WFWorkflowGradientFromRGBA(1051521279, 1992222463, 224894975, 106729983);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v1;
  WFWorkflowGradientFromRGBA(998242303, 998438911, 406836735, 1520105727);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v2;
  WFWorkflowGradientFromRGBA(1113307391, 1113307391, 224894975, 106729983);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v3;
  WFWorkflowGradientFromRGBA(2018359551, 1816373503, 1412728319, 1244623871);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v4;
  WFWorkflowGradientFromRGBA(2893339903, 2674380799, 2119996671, 1850574335);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v5;
  WFWorkflowGradientFromRGBA(3867791103, 3648635135, 2992140543, 2705809407);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v6;
  WFWorkflowGradientFromRGBA(2156499967, 2038598911, 1600548607, 1364878335);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[12] = v7;
  WFWorkflowGradientFromRGBA(2376241151, 2376241151, 1954379007, 1752393983);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[13] = v8;
  WFWorkflowGradientFromRGBA(2727046911, 2946071807, 2138534911, 2154983167);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[14] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)workflowGradientPalette_workflowGradientPalette;
  workflowGradientPalette_workflowGradientPalette = v10;

}

+ (WFColor)colorWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[WFColor initWithDisplayP3Red:green:blue:alpha:]([WFColor alloc], "initWithDisplayP3Red:green:blue:alpha:", a3, a4, a5, a6);
}

- (WFColor)initWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorSpace *v7;
  float64x2_t v8;
  float64x2_t v14;
  CGColor *v15;
  WFColor *v16;
  CGFloat components[2];
  int8x16_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  v8.f64[0] = a3;
  v8.f64[1] = a4;
  __asm { FMOV            V1.2D, #1.0 }
  v14.f64[0] = a5;
  v14.f64[1] = a6;
  *(int8x16_t *)components = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v8, _Q1), (int8x16_t)_Q1, (int8x16_t)v8), (int8x16_t)vcltzq_f64(v8));
  v23 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v14, _Q1), (int8x16_t)_Q1, (int8x16_t)v14), (int8x16_t)vcltzq_f64(v14));
  v15 = CGColorCreate(v7, components);
  v16 = -[WFColor initWithCGColor:](self, "initWithCGColor:", v15);
  CGColorSpaceRelease(v7);
  CGColorRelease(v15);
  return v16;
}

+ (WFColor)colorWithP3RGBAValue:(unsigned int)a3
{
  return +[WFColor colorWithDisplayP3Red:green:blue:alpha:](WFColor, "colorWithDisplayP3Red:green:blue:alpha:", (double)HIBYTE(a3) / 255.0, (double)BYTE2(a3) / 255.0, (double)BYTE1(a3) / 255.0, (double)a3 / 255.0);
}

+ (WFColor)blackColor
{
  return +[WFColor colorWithWhite:alpha:](WFColor, "colorWithWhite:alpha:", 0.0, 1.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __72__WFColor_WorkflowPalette__paletteGradientFallingBackToDefaultGradient___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6002340;
  v2[1] = &unk_1E6002370;
  v3[0] = &unk_1E6002358;
  v3[1] = &unk_1E6002388;
  v2[2] = &unk_1E60023A0;
  v2[3] = &unk_1E60023D0;
  v3[2] = &unk_1E60023B8;
  v3[3] = &unk_1E60023E8;
  v2[4] = &unk_1E6002400;
  v2[5] = &unk_1E6002430;
  v3[4] = &unk_1E6002418;
  v3[5] = &unk_1E6002448;
  v2[6] = &unk_1E6002460;
  v2[7] = &unk_1E6002478;
  v3[6] = &unk_1E6002448;
  v3[7] = &unk_1E6002490;
  v2[8] = &unk_1E60024A8;
  v2[9] = &unk_1E60024D8;
  v3[8] = &unk_1E60024C0;
  v3[9] = &unk_1E60024F0;
  v2[10] = &unk_1E6002508;
  v2[11] = &unk_1E6002538;
  v3[10] = &unk_1E6002520;
  v3[11] = &unk_1E6002550;
  v2[12] = &unk_1E6002568;
  v2[13] = &unk_1E6002598;
  v3[12] = &unk_1E6002580;
  v3[13] = &unk_1E60025B0;
  v2[14] = &unk_1E60025C8;
  v2[15] = &unk_1E60025F8;
  v3[14] = &unk_1E60025E0;
  v3[15] = &unk_1E6002610;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paletteGradientFallingBackToDefaultGradient__colorToGradientIndexMapping;
  paletteGradientFallingBackToDefaultGradient__colorToGradientIndexMapping = v0;

}

- (NSString)hexValue
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%06X"), -[WFColor RGBAValue](self, "RGBAValue") >> 8);
}

+ (id)workflowPalette
{
  if (workflowPalette_onceToken != -1)
    dispatch_once(&workflowPalette_onceToken, &__block_literal_global_39_4730);
  return (id)workflowPalette_workflowPalette;
}

+ (id)workflowPaletteNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  WFLocalizedString(CFSTR("Red"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  WFLocalizedString(CFSTR("Orange"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  WFLocalizedString(CFSTR("Tangerine"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  WFLocalizedString(CFSTR("Yellow"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  WFLocalizedString(CFSTR("Lime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  WFLocalizedString(CFSTR("Teal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v13;
  WFLocalizedString(CFSTR("Cyan"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v2;
  WFLocalizedString(CFSTR("Blue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v3;
  WFLocalizedString(CFSTR("Navy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v4;
  WFLocalizedString(CFSTR("Grape"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v5;
  WFLocalizedString(CFSTR("Purple"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v6;
  WFLocalizedString(CFSTR("Pink"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v7;
  WFLocalizedString(CFSTR("Gray Blue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v8;
  WFLocalizedString(CFSTR("Gray Green"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v9;
  WFLocalizedString(CFSTR("Gray Brown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[14] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (WFColor)colorWithPaletteColor:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "workflowPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFColor *)v5;
}

void __43__WFColor_WorkflowPalette__workflowPalette__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[17];

  v17[15] = *MEMORY[0x1E0C80C00];
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 4282601983);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 4251333119);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 4271458815);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 4274264319);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 4292093695);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v12;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 431817727);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v0;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 1440408063);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v1;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 463140863);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v2;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 946986751);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v3;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 2071128575);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v4;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 3679049983);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v5;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 3980825855);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v6;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 255);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[12] = v7;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 3031607807);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[13] = v8;
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 2846468607);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[14] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)workflowPalette_workflowPalette;
  workflowPalette_workflowPalette = v10;

}

- (WFColor)init
{
  return -[WFColor initWithWhite:alpha:](self, "initWithWhite:alpha:", 0.0, 0.0);
}

- (WFColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  void *v7;
  WFColor *v8;

  v7 = (void *)objc_msgSend(objc_alloc(getUIColorClass()), "initWithHue:saturation:brightness:alpha:", fmax(fmin(a3, 1.0), 0.0), fmax(fmin(a4, 1.0), 0.0), fmax(fmin(a5, 1.0), 0.0), a6);
  v8 = -[WFColor initWithPlatformColor:](self, "initWithPlatformColor:", v7);

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFColor red](self, "red");
  v5 = v4;
  -[WFColor green](self, "green");
  v7 = v6;
  -[WFColor blue](self, "blue");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Red:%f Green:%f Blue:%f"), v5, v7, v8);
}

- (void)getHue:(double *)a3 saturation:(double *)a4 value:(double *)a5 alpha:(double *)a6
{
  id v10;

  -[WFColor platformColor](self, "platformColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getHue:saturation:brightness:alpha:", a3, a4, a5, a6);

}

- (BOOL)isCloseToColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v13 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v8 = 0.0;
  v4 = a3;
  -[WFColor getHue:saturation:value:alpha:](self, "getHue:saturation:value:alpha:", &v13, &v12, &v11, 0);
  objc_msgSend(v4, "getHue:saturation:value:alpha:", &v10, &v9, &v8, 0);

  if (vabdd_f64(v12, v9) > 0.0399999991 || vabdd_f64(v11, v8) > 0.0399999991)
    return 0;
  v5 = v13;
  v6 = v10;
  if (vabdd_f64(v13, v10) <= 0.0399999991)
    return 1;
  if (v13 < 0.0399999991)
    v5 = v13 + 1.0;
  if (v10 < 0.0399999991)
    v6 = v10 + 1.0;
  return vabdd_f64(v5, v6) <= 0.0399999991;
}

- (BOOL)isDark
{
  double v3;

  v3 = 0.0;
  -[WFColor getHue:saturation:value:alpha:](self, "getHue:saturation:value:alpha:", 0, 0, &v3, 0);
  return v3 < 0.5;
}

- (WFColor)initWithSerializedRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  WFColor *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  WFColor *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  float v28;
  double v29;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFColorRepresentationType"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WFColorRepresentationTypeName")) & 1) != 0)
  {

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFColorName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFBundleURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = 0;
      if (v6 && v9)
      {
        self = -[WFColor initWithColorName:inBundle:](self, "initWithColorName:inBundle:", v6, v9);
        v11 = self;
      }
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }

  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WFColorRepresentationTypeSystem")) & 1) != 0)
    {

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFSystemColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = v13 > 0x16 ? 0 : off_1E5FC6D30[v13];
        v16 = v15;

        if ((-[__CFString isEqualToString:](v16, "isEqualToString:", v12) & 1) != 0)
          break;
        ++v13;
        v14 = v16;
        if (!v16)
        {
          v13 = 1;
          break;
        }
      }

      v17 = -[WFColor initWithSystemColor:](self, "initWithSystemColor:", v13);
    }
    else
    {
      objc_msgSend(v5, "isEqualToString:", CFSTR("WFColorRepresentationTypeCGColor"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("greenComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v23 = v22;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blueComponent"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "floatValue");
      v26 = v25;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alphaComponent"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v28;

      v17 = -[WFColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v20, v23, v26, v29);
    }
    self = v17;
    v11 = self;
  }

  return v11;
}

- (id)serializedRepresentation
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  const __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  double v24;
  double v25;
  double v26;
  double v27;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[WFColor representationType](self, "representationType");
  v5 = CFSTR("WFColorRepresentationTypeName");
  if (v4 == 1)
    v5 = CFSTR("WFColorRepresentationTypeSystem");
  if (v4)
    v6 = v5;
  else
    v6 = CFSTR("WFColorRepresentationTypeCGColor");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("WFColorRepresentationType"));
  v7 = -[WFColor representationType](self, "representationType");
  switch(v7)
  {
    case 0uLL:
      v26 = 0.0;
      v27 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      -[WFColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v27, &v26, &v25, &v24);
      HIDWORD(v12) = HIDWORD(v27);
      *(float *)&v12 = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("redComponent"));

      HIDWORD(v14) = HIDWORD(v26);
      *(float *)&v14 = v26;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("greenComponent"));

      HIDWORD(v16) = HIDWORD(v25);
      *(float *)&v16 = v25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("blueComponent"));

      HIDWORD(v18) = HIDWORD(v24);
      *(float *)&v18 = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("alphaComponent");
LABEL_15:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v19);
      goto LABEL_16;
    case 1uLL:
      v20 = -[WFColor systemColor](self, "systemColor");
      if (v20 > 0x16)
        v21 = 0;
      else
        v21 = off_1E5FC6D30[v20];
      v9 = v21;
      v19 = CFSTR("WFSystemColor");
      goto LABEL_15;
    case 2uLL:
      -[WFColor colorName](self, "colorName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("WFColorName"));

      -[WFColor bundle](self, "bundle");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString bundleURL](v9, "bundleURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("WFBundleURL"));

LABEL_16:
      break;
  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (unint64_t)hash
{
  return CFHash(-[WFColor CGColor](objc_retainAutorelease(self), "CGColor"));
}

- (NSColor)NSColor
{
  return self->_NSColor;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

uint64_t __19__WFColor_isEqual___block_invoke()
{
  return CGColorTransformRelease();
}

void __19__WFColor_isEqual___block_invoke_2(uint64_t a1)
{
  CGColorRelease(*(CGColorRef *)(a1 + 32));
}

+ (WFColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return -[WFColor initWithHue:saturation:brightness:alpha:]([WFColor alloc], "initWithHue:saturation:brightness:alpha:", a3, a4, a5, a6);
}

+ (WFColor)colorWithFocusColorName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (colorWithFocusColorName__onceToken != -1)
    dispatch_once(&colorWithFocusColorName__onceToken, &__block_literal_global_16464);
  objc_msgSend((id)colorWithFocusColorName__colorMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", objc_msgSend(v4, "unsignedIntValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315394;
      v10 = "+[WFColor(Focus) colorWithFocusColorName:]";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1AF681000, v7, OS_LOG_TYPE_FAULT, "%s Given a Focus color (%@), but we couldn't map it to a WFColor. Are there new Focus colors?", (uint8_t *)&v9, 0x16u);
    }

    v6 = 0;
  }

  return (WFColor *)v6;
}

void __42__WFColor_Focus__colorWithFocusColorName___block_invoke()
{
  void *v0;

  v0 = (void *)colorWithFocusColorName__colorMapping;
  colorWithFocusColorName__colorMapping = (uint64_t)&unk_1E6004350;

}

+ (id)tintColorForBundleIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = tintColorForBundleIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&tintColorForBundleIdentifier__onceToken, &__block_literal_global_86_16944);
  objc_msgSend((id)tintColorForBundleIdentifier__bundleIdentifierMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __63__WFColor_IconicSymbolUtilities__tintColorForBundleIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[11];
  _QWORD v14[13];

  v14[11] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("com.apple.mobiletimer");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v13[1] = CFSTR("com.apple.iBooks");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v0;
  v13[2] = CFSTR("com.apple.mobilenotes");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v13[3] = CFSTR("com.apple.Pages");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v13[4] = CFSTR("com.apple.Numbers");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v13[5] = CFSTR("com.apple.Keynote");
  +[WFColor colorWithRed:green:blue:alpha:](WFColor, "colorWithRed:green:blue:alpha:", 0.15, 0.74, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v13[6] = CFSTR("com.apple.podcasts");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v13[7] = CFSTR("com.apple.mobilephone");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v13[8] = CFSTR("com.apple.facetime");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v13[9] = CFSTR("com.apple.Music");
  +[WFColor colorWithRed:green:blue:alpha:](WFColor, "colorWithRed:green:blue:alpha:", 1.0, 0.38, 0.47, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v13[10] = CFSTR("com.shazam.Shazam");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)tintColorForBundleIdentifier__bundleIdentifierMapping;
  tintColorForBundleIdentifier__bundleIdentifierMapping = v10;

}

@end
