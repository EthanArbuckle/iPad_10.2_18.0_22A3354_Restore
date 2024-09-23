@implementation _SBFVibrantSettings

+ (id)vibrantSettingsWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReferenceColor:referenceContrast:legibilitySettings:", v9, v8, a4);

  return v10;
}

- (_SBFVibrantSettings)initWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5
{
  id v8;
  id v9;
  _SBFVibrantSettings *v10;
  uint64_t v11;
  UIColor *referenceColor;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SBFVibrantSettings;
  v10 = -[_SBFVibrantSettings init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    referenceColor = v10->_referenceColor;
    v10->_referenceColor = (UIColor *)v11;

    v10->_referenceContrast = a4;
    objc_storeStrong((id *)&v10->_legibilitySettings, a5);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _SBFVibrantSettings *v4;
  UIColor *referenceColor;
  char v6;
  char v7;
  double v8;
  _UILegibilitySettings *legibilitySettings;
  char v10;
  char v11;

  v4 = (_SBFVibrantSettings *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      referenceColor = self->_referenceColor;
      if ((unint64_t)referenceColor | (unint64_t)v4->_referenceColor)
        v6 = -[UIColor isEqual:](referenceColor, "isEqual:");
      else
        v6 = 1;
      v8 = vabdd_f64(self->_referenceContrast, v4->_referenceContrast);
      legibilitySettings = self->_legibilitySettings;
      if ((unint64_t)legibilitySettings | (unint64_t)v4->_legibilitySettings)
        v10 = -[_UILegibilitySettings isEqual:](legibilitySettings, "isEqual:");
      else
        v10 = 1;
      if (v8 < 0.00000011920929)
        v11 = v6;
      else
        v11 = 0;
      v7 = v11 & v10;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  double v3;

  v3 = self->_referenceContrast + (double)(unint64_t)-[UIColor hash](self->_referenceColor, "hash");
  return (unint64_t)(v3
                          + (double)(unint64_t)-[_UILegibilitySettings hash](self->_legibilitySettings, "hash"));
}

- (int64_t)_style
{
  _UILegibilitySettings *legibilitySettings;
  int64_t v5;
  _UILegibilitySettings *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!self->_style)
  {
    self->_style = -1;
    if (self->_referenceColor)
    {
      if (!UIAccessibilityIsReduceTransparencyEnabled())
      {
        v12 = 0;
        v10 = 0;
        v11 = 0;
        _SBFGetRGBAValuesForColor(self->_referenceColor, &v12, &v11, &v10, 0);
        v8 = 0;
        v9 = 0;
        v7 = 0;
        _SBFGetHSBAValuesForColor(self->_referenceColor, &v9, &v8, &v7, 0);
        legibilitySettings = self->_legibilitySettings;
        if (!legibilitySettings || -[_UILegibilitySettings style](legibilitySettings, "style") == 1)
        {
          v5 = 1;
LABEL_8:
          self->_style = v5;
          return self->_style;
        }
        v6 = self->_legibilitySettings;
        if (v6 && -[_UILegibilitySettings style](v6, "style") == 2)
        {
          v5 = 2;
          goto LABEL_8;
        }
      }
    }
  }
  return self->_style;
}

- (UIColor)tintColor
{
  UIColor *tintColor;
  int64_t v4;
  UIColor *referenceColor;
  void *v6;
  void *v7;
  UIColor *v8;
  _UILegibilitySettings *legibilitySettings;
  void *v10;
  double v11;
  double v12;
  _UILegibilitySettings *v13;
  UIColor *v14;
  UIColor *v15;

  tintColor = self->_tintColor;
  if (!tintColor)
  {
    v4 = -[_SBFVibrantSettings _style](self, "_style");
    if (v4 == -1)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings && -[_UILegibilitySettings style](legibilitySettings, "style") == 2)
      {
        v10 = (void *)MEMORY[0x1E0CEA478];
        v11 = 0.0;
        v12 = 0.5;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CEA478];
        v12 = 0.3;
        v11 = 1.0;
      }
      objc_msgSend(v10, "colorWithWhite:alpha:", v11, v12);
      v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v7 = self->_tintColor;
      self->_tintColor = v14;
    }
    else
    {
      if (v4 == 2)
      {
        v13 = self->_legibilitySettings;
        if (v13)
          -[_UILegibilitySettings primaryColor](v13, "primaryColor");
        else
          objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "colorWithAlphaComponent:", 0.7);
        v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 != 1)
        {
LABEL_17:
          tintColor = self->_tintColor;
          return tintColor;
        }
        referenceColor = self->_referenceColor;
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIColor _colorBlendedWithColor:](referenceColor, "_colorBlendedWithColor:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[_SBFVibrantSettings _computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:](self, "_computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:", v7, fmin(self->_referenceContrast * self->_referenceContrast * 3.0 + 0.05, 0.35));
        v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v15 = self->_tintColor;
      self->_tintColor = v8;

    }
    goto LABEL_17;
  }
  return tintColor;
}

- (UIColor)highlightLimitingColor
{
  UIColor *highlightLimitingColor;
  UIColor *v4;
  UIColor *v5;

  highlightLimitingColor = self->_highlightLimitingColor;
  if (!highlightLimitingColor)
  {
    if ((unint64_t)(-[_SBFVibrantSettings _style](self, "_style") - 1) <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.87, 1.0);
      v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v5 = self->_highlightLimitingColor;
      self->_highlightLimitingColor = v4;

    }
    highlightLimitingColor = self->_highlightLimitingColor;
  }
  return highlightLimitingColor;
}

- (UIColor)shimmerColor
{
  UIColor *shimmerColor;
  UIColor *referenceColor;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  UIColor *v10;
  UIColor *v11;

  shimmerColor = self->_shimmerColor;
  if (!shimmerColor)
  {
    if (-[_SBFVibrantSettings _style](self, "_style") == 1)
    {
      referenceColor = self->_referenceColor;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIColor _colorBlendedWithColor:](referenceColor, "_colorBlendedWithColor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[_SBFVibrantSettings tintColor](self, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_colorBlendedWithColor:compositingFilter:", v7, *MEMORY[0x1E0CD2BD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_luminance");
      -[_SBFVibrantSettings _computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:](self, "_computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:", v8, fmax(0.98 - v9, 0.2));
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v11 = self->_shimmerColor;
      self->_shimmerColor = v10;

    }
    shimmerColor = self->_shimmerColor;
  }
  return shimmerColor;
}

- (UIColor)chevronShimmerColor
{
  UIColor *chevronShimmerColor;
  int64_t v4;
  UIColor *referenceColor;
  void *v6;
  void *v7;
  double v8;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;

  chevronShimmerColor = self->_chevronShimmerColor;
  if (!chevronShimmerColor)
  {
    v4 = -[_SBFVibrantSettings _style](self, "_style");
    if (v4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.6, 1.0);
      v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v7 = self->_chevronShimmerColor;
      self->_chevronShimmerColor = v11;
    }
    else
    {
      if (v4 != 1)
      {
LABEL_7:
        chevronShimmerColor = self->_chevronShimmerColor;
        return chevronShimmerColor;
      }
      referenceColor = self->_referenceColor;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIColor _colorBlendedWithColor:](referenceColor, "_colorBlendedWithColor:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_luminance");
      -[_SBFVibrantSettings _computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:](self, "_computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:", v7, fmax(0.95 - v8, 0.2));
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v10 = self->_chevronShimmerColor;
      self->_chevronShimmerColor = v9;

    }
    goto LABEL_7;
  }
  return chevronShimmerColor;
}

- (UIColor)highlightColor
{
  UIColor *highlightColor;
  int64_t v4;
  UIColor *referenceColor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  UIColor *v15;
  UIColor *v16;
  _UILegibilitySettings *legibilitySettings;
  UIColor *v18;

  highlightColor = self->_highlightColor;
  if (!highlightColor)
  {
    v4 = -[_SBFVibrantSettings _style](self, "_style");
    if (v4 == 2)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings)
        -[_UILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorWithAlphaComponent:", 0.7);
      v18 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v8 = self->_highlightColor;
      self->_highlightColor = v18;
    }
    else
    {
      if (v4 != 1)
      {
LABEL_12:
        highlightColor = self->_highlightColor;
        return highlightColor;
      }
      referenceColor = self->_referenceColor;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIColor _colorBlendedWithColor:](referenceColor, "_colorBlendedWithColor:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[_SBFVibrantSettings tintColor](self, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_colorBlendedWithColor:compositingFilter:", v8, *MEMORY[0x1E0CD2BD0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_luminance");
      v11 = 0.98 - v10;
      v12 = v11 * 0.75;
      v13 = v11 <= 0.2;
      v14 = 0.15;
      if (!v13)
        v14 = v12;
      -[_SBFVibrantSettings _computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:](self, "_computeSourceColorDodgeColorForDestinationColor:producingLuminanceChange:", v9, v14);
      v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v16 = self->_highlightColor;
      self->_highlightColor = v15;

    }
    goto LABEL_12;
  }
  return highlightColor;
}

- (id)_computeSourceColorDodgeColorForDestinationColor:(id)a3 producingLuminanceChange:(double)a4
{
  id v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v5 = a3;
  objc_msgSend(v5, "_luminance");
  v29 = 0.0;
  v30 = 0.0;
  v21 = fmin(v6 + a4, 1.0);
  v28 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v30, &v29, &v28, 0);
  v26 = 0.0;
  v27 = 0.0;
  v25 = 0;
  _SBFGetHSBAValuesForColor(v5, &v27, &v26, &v25, 0);
  v26 = v26 * 0.15;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0.0;
  v24 = 0.0;
  v22 = 0.0;
  objc_msgSend(v7, "getRed:green:blue:alpha:", &v24, &v23, &v22, 0);
  v19 = v23 + a4;
  v20 = v24 + a4;
  v8 = v22 + a4;
  v9 = 0.0;
  do
  {
    v10 = v9 + 1.0 - v24 / v20;
    v11 = v9 + 1.0 - v23 / v19;
    v12 = v9 + 1.0 - v22 / v8;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v30 / (1.0 - v10), v29 / (1.0 - v11), v28 / (1.0 - v12), 1.0, *(_QWORD *)&v19, *(_QWORD *)&v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_luminance");
    v15 = v14;

    v9 = v9 + 0.01;
  }
  while (v15 < v21 && v9 < 1.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v10, v11, v12, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)tintViewWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_SBFVibrantSettings tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  if (-[_SBFVibrantSettings _style](self, "_style") == 1)
  {
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", *MEMORY[0x1E0CD2BD0]);

  }
  return v4;
}

- (id)highlightLimitingViewWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_SBFVibrantSettings highlightLimitingColor](self, "highlightLimitingColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", *MEMORY[0x1E0CD2C28]);

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)referenceColor
{
  return self->_referenceColor;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)referenceContrast
{
  return self->_referenceContrast;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setShimmerColor:(id)a3
{
  objc_storeStrong((id *)&self->_shimmerColor, a3);
}

- (void)setChevronShimmerColor:(id)a3
{
  objc_storeStrong((id *)&self->_chevronShimmerColor, a3);
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void)setHighlightLimitingColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLimitingColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLimitingColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_chevronShimmerColor, 0);
  objc_storeStrong((id *)&self->_shimmerColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_referenceColor, 0);
}

@end
