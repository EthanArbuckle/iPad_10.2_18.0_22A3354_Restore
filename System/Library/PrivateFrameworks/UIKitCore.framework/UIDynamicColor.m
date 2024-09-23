@implementation UIDynamicColor

- (BOOL)_isDynamic
{
  return 1;
}

- (id)resolvedColorWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_resolvedMaterialWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "_userInterfaceRenderingMode") == 2)
  {
    -[UIColor _systemColorName](self, "_systemColorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIMaterial materialForSystemColorName:](_UIMaterial, "materialForSystemColorName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isVibrant") && objc_msgSend(v4, "_vibrancy") != 1)
      v7 = 0;
    else
      v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)set
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  objc_super v7;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDynamicColor;
    -[UIColor set](&v7, "set");
  }
  else
  {
    -[UIDynamicColor set](v4, "set");
  }

}

- (UIDynamicColor)colorWithAlphaComponent:(double)a3
{
  return (UIDynamicColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:]((id *)[UIDynamicModifiedColor alloc], self, (void *)0xFFFFFFFFFFFFFFFFLL, a3);
}

- (double)alphaComponent
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  double v7;
  double v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    -[UIColor alphaComponent](&v10, sel_alphaComponent);
  }
  else
  {
    -[UIDynamicColor alphaComponent](v4, "alphaComponent");
  }
  v8 = v7;

  return v8;
}

- (CGColor)CGColor
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  CGColor *v7;
  CGColor *v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    v7 = -[UIColor CGColor](&v10, sel_CGColor);
  }
  else
  {
    v7 = -[UIDynamicColor CGColor](objc_retainAutorelease(v4), "CGColor");
  }
  v8 = v7;

  return v8;
}

- (void)setFill
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  objc_super v7;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDynamicColor;
    -[UIColor setFill](&v7, sel_setFill);
  }
  else
  {
    -[UIDynamicColor setFill](v4, "setFill");
  }

}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  void *v11;
  UIDynamicColor *v12;
  UIDynamicColor *v13;
  BOOL v14;
  unsigned __int8 v15;
  BOOL v16;
  objc_super v18;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v11);
  v12 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12 == self;
  else
    v14 = 1;
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIDynamicColor;
    v15 = -[UIColor getHue:saturation:brightness:alpha:](&v18, sel_getHue_saturation_brightness_alpha_, a3, a4, a5, a6);
  }
  else
  {
    v15 = -[UIDynamicColor getHue:saturation:brightness:alpha:](v12, "getHue:saturation:brightness:alpha:", a3, a4, a5, a6);
  }
  v16 = v15;

  return v16;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  void *v11;
  UIDynamicColor *v12;
  UIDynamicColor *v13;
  BOOL v14;
  unsigned __int8 v15;
  BOOL v16;
  objc_super v18;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v11);
  v12 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12 == self;
  else
    v14 = 1;
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIDynamicColor;
    v15 = -[UIColor getRed:green:blue:alpha:](&v18, sel_getRed_green_blue_alpha_, a3, a4, a5, a6);
  }
  else
  {
    v15 = -[UIDynamicColor getRed:green:blue:alpha:](v12, "getRed:green:blue:alpha:", a3, a4, a5, a6);
  }
  v16 = v15;

  return v16;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  void *v7;
  UIDynamicColor *v8;
  UIDynamicColor *v9;
  BOOL v10;
  unsigned __int8 v11;
  BOOL v12;
  objc_super v14;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v7);
  v8 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8 == self;
  else
    v10 = 1;
  if (v10)
  {
    v14.receiver = self;
    v14.super_class = (Class)UIDynamicColor;
    v11 = -[UIColor getWhite:alpha:](&v14, sel_getWhite_alpha_, a3, a4);
  }
  else
  {
    v11 = -[UIDynamicColor getWhite:alpha:](v8, "getWhite:alpha:", a3, a4);
  }
  v12 = v11;

  return v12;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Abstract method %@ called from class %@. Subclasses must override."), v5, v7);

  return 0;
}

- (id)_highContrastDynamicColor
{
  return -[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:]((id *)[UIDynamicModifiedColor alloc], self, (void *)1, 1.79769313e308);
}

- (void)setStroke
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  objc_super v7;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDynamicColor;
    -[UIColor setStroke](&v7, sel_setStroke);
  }
  else
  {
    -[UIDynamicColor setStroke](v4, "setStroke");
  }

}

- (BOOL)isPatternColor
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    v7 = -[UIColor isPatternColor](&v10, sel_isPatternColor);
  }
  else
  {
    v7 = -[UIDynamicColor isPatternColor](v4, "isPatternColor");
  }
  v8 = v7;

  return v8;
}

- (BOOL)_isDeepColor
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    v7 = -[UIColor _isDeepColor](&v10, sel__isDeepColor);
  }
  else
  {
    v7 = -[UIDynamicColor _isDeepColor](v4, "_isDeepColor");
  }
  v8 = v7;

  return v8;
}

- (id)colorSpaceName
{
  void *v3;
  UIDynamicColor *v4;
  UIDynamicColor *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    -[UIColor colorSpaceName](&v10, sel_colorSpaceName);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIDynamicColor colorSpaceName](v4, "colorSpaceName");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (UIDynamicColor)colorWithProminence:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[UIColor _systemColorName](self, "_systemColorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("labelColor")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("secondaryLabelColor")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("tertiaryLabelColor")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("quaternaryLabelColor")))
  {
    switch(a3)
    {
      case 0:
        +[UIColor labelColor](UIColor, "labelColor");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("systemFillColor")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("secondarySystemFillColor")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("tertiarySystemFillColor")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("quaternarySystemFillColor")))
    {
      switch(a3)
      {
        case 0:
          +[UIColor systemFillColor](UIColor, "systemFillColor");
          v6 = objc_claimAutoreleasedReturnValue();
          break;
        case 1:
          +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
          v6 = objc_claimAutoreleasedReturnValue();
          break;
        case 2:
          +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
          v6 = objc_claimAutoreleasedReturnValue();
          break;
        case 3:
          +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
          v6 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_16;
      }
    }
    else
    {
LABEL_16:
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("systemBackgroundColor")) & 1) != 0
        || (objc_msgSend(v5, "isEqualToString:", CFSTR("secondarySystemBackgroundColor")) & 1) != 0
        || objc_msgSend(v5, "isEqualToString:", CFSTR("tertiarySystemBackgroundColor")))
      {
        switch(a3)
        {
          case 0:
            +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
            v6 = objc_claimAutoreleasedReturnValue();
            break;
          case 1:
            +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
            v6 = objc_claimAutoreleasedReturnValue();
            break;
          case 2:
          case 3:
            +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
            v6 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            goto LABEL_25;
        }
      }
      else
      {
LABEL_25:
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("systemGroupedBackgroundColor")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("secondarySystemGroupedBackgroundColor")) & 1) != 0
          || objc_msgSend(v5, "isEqualToString:", CFSTR("tertiarySystemGroupedBackgroundColor")))
        {
          switch(a3)
          {
            case 0:
              +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              break;
            case 1:
              +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              break;
            case 2:
            case 3:
              +[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor");
              v6 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              goto LABEL_32;
          }
        }
        else
        {
LABEL_32:
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("systemGrayColor")) & 1) != 0
            || (objc_msgSend(v5, "isEqualToString:", CFSTR("systemGray2Color")) & 1) != 0
            || (objc_msgSend(v5, "isEqualToString:", CFSTR("systemGray3Color")) & 1) != 0
            || (objc_msgSend(v5, "isEqualToString:", CFSTR("systemGray4Color")) & 1) != 0
            || (objc_msgSend(v5, "isEqualToString:", CFSTR("systemGray5Color")) & 1) != 0
            || objc_msgSend(v5, "isEqualToString:", CFSTR("systemGray6Color")))
          {
            switch(a3)
            {
              case 0:
                +[UIColor systemGrayColor](UIColor, "systemGrayColor");
                v6 = objc_claimAutoreleasedReturnValue();
                break;
              case 1:
                +[UIColor systemGray2Color](UIColor, "systemGray2Color");
                v6 = objc_claimAutoreleasedReturnValue();
                break;
              case 2:
                +[UIColor systemGray3Color](UIColor, "systemGray3Color");
                v6 = objc_claimAutoreleasedReturnValue();
                break;
              case 3:
                +[UIColor systemGray4Color](UIColor, "systemGray4Color");
                v6 = objc_claimAutoreleasedReturnValue();
                break;
              default:
                goto LABEL_42;
            }
          }
          else
          {
LABEL_42:
            v6 = (uint64_t)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self, (void *)0xFFFFFFFFFFFFFFFFLL, (void *)a3, 1.79769313e308);
          }
        }
      }
    }
  }
  v7 = (void *)v6;

  return (UIDynamicColor *)v7;
}

- (int64_t)prominence
{
  void *v3;
  int64_t v4;
  objc_super v6;

  -[UIColor _systemColorName](self, "_systemColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("secondary")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("tertiary")) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("quaternary")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("systemGrayColor")) & 1) != 0)
      {
        v4 = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("systemGray2Color")) & 1) != 0)
        goto LABEL_2;
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("systemGray3Color")) & 1) != 0)
      {
LABEL_4:
        v4 = 2;
        goto LABEL_9;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("systemGray4Color")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("systemGray5Color")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("systemGray6Color")) & 1) == 0)
      {
        v6.receiver = self;
        v6.super_class = (Class)UIDynamicColor;
        v4 = -[UIColor prominence](&v6, sel_prominence);
        goto LABEL_9;
      }
    }
    v4 = 3;
    goto LABEL_9;
  }
LABEL_2:
  v4 = 1;
LABEL_9:

  return v4;
}

id ___UIDynamicColor_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 2)
    v4 = 32;
  return *(id *)(a1 + v4);
}

@end
