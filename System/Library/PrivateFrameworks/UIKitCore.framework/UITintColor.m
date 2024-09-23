@implementation UITintColor

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3 == self)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (CGColor)CGColor
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  CGColor *v7;
  CGColor *v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    v7 = -[UIDynamicColor CGColor](&v10, sel_CGColor);
  }
  else
  {
    v7 = -[UITintColor CGColor](objc_retainAutorelease(v4), "CGColor");
  }
  v8 = v7;

  return v8;
}

- (void)set
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  objc_super v7;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITintColor;
    -[UIDynamicColor set](&v7, "set");
  }
  else
  {
    -[UITintColor set](v4, "set");
  }

}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  UITintColor *v7;
  UITintColor *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  if (pthread_main_np() == 1)
  {
    _UIGetCurrentFallbackView();
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      *(_QWORD *)(v6 + 124) |= 0x100000000uLL;

  }
  objc_msgSend(v5, "_tintColor");
  v7 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || v7 == self)
  {
    if (v5)
    {
      v10 = objc_msgSend(v5, "userInterfaceIdiom");
    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "userInterfaceIdiom");
    }
    +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (UITintColor)init
{
  UITintColor *v2;
  UITintColor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITintColor;
  v2 = -[UITintColor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIColor _setSystemColorName:](v2, "_setSystemColorName:", CFSTR("tintColor"));
  return v3;
}

- (BOOL)_isDynamicTintColor
{
  return 1;
}

- (void)setFill
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  objc_super v7;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITintColor;
    -[UIDynamicColor setFill](&v7, sel_setFill);
  }
  else
  {
    -[UITintColor setFill](v4, "setFill");
  }

}

- (void)setStroke
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  objc_super v7;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITintColor;
    -[UIDynamicColor setStroke](&v7, sel_setStroke);
  }
  else
  {
    -[UITintColor setStroke](v4, "setStroke");
  }

}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  void *v7;
  UITintColor *v8;
  UITintColor *v9;
  BOOL v10;
  unsigned __int8 v11;
  BOOL v12;
  objc_super v14;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v7);
  v8 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8 == self;
  else
    v10 = 1;
  if (v10)
  {
    v14.receiver = self;
    v14.super_class = (Class)UITintColor;
    v11 = -[UIDynamicColor getWhite:alpha:](&v14, sel_getWhite_alpha_, a3, a4);
  }
  else
  {
    v11 = -[UITintColor getWhite:alpha:](v8, "getWhite:alpha:", a3, a4);
  }
  v12 = v11;

  return v12;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  void *v11;
  UITintColor *v12;
  UITintColor *v13;
  BOOL v14;
  unsigned __int8 v15;
  BOOL v16;
  objc_super v18;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v11);
  v12 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12 == self;
  else
    v14 = 1;
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)UITintColor;
    v15 = -[UIDynamicColor getHue:saturation:brightness:alpha:](&v18, sel_getHue_saturation_brightness_alpha_, a3, a4, a5, a6);
  }
  else
  {
    v15 = -[UITintColor getHue:saturation:brightness:alpha:](v12, "getHue:saturation:brightness:alpha:", a3, a4, a5, a6);
  }
  v16 = v15;

  return v16;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  void *v11;
  UITintColor *v12;
  UITintColor *v13;
  BOOL v14;
  unsigned __int8 v15;
  BOOL v16;
  objc_super v18;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v11);
  v12 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12 == self;
  else
    v14 = 1;
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)UITintColor;
    v15 = -[UIDynamicColor getRed:green:blue:alpha:](&v18, sel_getRed_green_blue_alpha_, a3, a4, a5, a6);
  }
  else
  {
    v15 = -[UITintColor getRed:green:blue:alpha:](v12, "getRed:green:blue:alpha:", a3, a4, a5, a6);
  }
  v16 = v15;

  return v16;
}

- (double)alphaComponent
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  double v7;
  double v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    -[UIDynamicColor alphaComponent](&v10, sel_alphaComponent);
  }
  else
  {
    -[UITintColor alphaComponent](v4, "alphaComponent");
  }
  v8 = v7;

  return v8;
}

- (BOOL)isPatternColor
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    v7 = -[UIDynamicColor isPatternColor](&v10, sel_isPatternColor);
  }
  else
  {
    v7 = -[UITintColor isPatternColor](v4, "isPatternColor");
  }
  v8 = v7;

  return v8;
}

- (BOOL)_isDeepColor
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    v7 = -[UIDynamicColor _isDeepColor](&v10, sel__isDeepColor);
  }
  else
  {
    v7 = -[UITintColor _isDeepColor](v4, "_isDeepColor");
  }
  v8 = v7;

  return v8;
}

- (id)colorSpaceName
{
  void *v3;
  UITintColor *v4;
  UITintColor *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITintColor _resolvedColorWithTraitCollection:](self, "_resolvedColorWithTraitCollection:", v3);
  v4 = (UITintColor *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4 == self;
  else
    v6 = 1;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    -[UIDynamicColor colorSpaceName](&v10, sel_colorSpaceName);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITintColor colorSpaceName](v4, "colorSpaceName");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

@end
