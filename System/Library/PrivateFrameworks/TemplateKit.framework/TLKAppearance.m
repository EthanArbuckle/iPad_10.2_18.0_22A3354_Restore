@implementation TLKAppearance

+ (void)disableAppearanceOverrideForView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setOverrideUserInterfaceStyle:", 0);
  objc_msgSend(v3, "_setOverrideVibrancyTrait:", -1);

}

- (void)disableAppearanceForView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", 0);

}

- (id)colorForProminence:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0uLL:
      -[TLKAppearance primaryColor](self, "primaryColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[TLKAppearance secondaryColor](self, "secondaryColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[TLKAppearance tertiaryColor](self, "tertiaryColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[TLKAppearance quaternaryColor](self, "quaternaryColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[TLKAppearance quinaryColor](self, "quinaryColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (id)primaryColorWithDefaultAlpha:(double)a3
{
  void *v5;
  void *v6;

  if (UIAccessibilityDarkerSystemColorsEnabled())
    a3 = a3 + 0.2;
  -[TLKAppearance primaryColor](self, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)bestAppearanceForView:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bestAppearanceForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (TLKAppearance)appearanceWithStyle:(unint64_t)a3
{
  uint64_t *v3;
  void *v4;
  uint64_t v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
      v3 = &appearanceWithStyle__cachedLightAppearance;
      v4 = (void *)appearanceWithStyle__cachedLightAppearance;
      if (appearanceWithStyle__cachedLightAppearance)
        goto LABEL_11;
      goto LABEL_10;
    case 1uLL:
      v3 = &appearanceWithStyle__cachedDarkAppearance;
      v4 = (void *)appearanceWithStyle__cachedDarkAppearance;
      if (!appearanceWithStyle__cachedDarkAppearance)
        goto LABEL_10;
      goto LABEL_11;
    case 2uLL:
      v3 = &appearanceWithStyle__cachedVibrantLightAppearance;
      v4 = (void *)appearanceWithStyle__cachedVibrantLightAppearance;
      if (!appearanceWithStyle__cachedVibrantLightAppearance)
        goto LABEL_10;
      goto LABEL_11;
    case 3uLL:
      v3 = &appearanceWithStyle__cachedVibrantDarkAppearance;
      v4 = (void *)appearanceWithStyle__cachedVibrantDarkAppearance;
      if (!appearanceWithStyle__cachedVibrantDarkAppearance)
      {
LABEL_10:
        v6 = objc_opt_new();
        v7 = (void *)*v3;
        *v3 = v6;

        v4 = (void *)*v3;
      }
LABEL_11:
      a1 = v4;
      break;
    default:
      return (TLKAppearance *)a1;
  }
  return (TLKAppearance *)a1;
}

+ (id)bestAppearanceForTraitCollection:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "_vibrancy") == 1;
  v6 = objc_msgSend(v4, "userInterfaceStyle");

  return (id)objc_msgSend(a1, "appearanceWithVibrancyEnabled:isDark:", v5, v6 == 2);
}

+ (TLKAppearance)appearanceWithVibrancyEnabled:(BOOL)a3 isDark:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 3;
  if (!a3 || !a4)
    v4 = 0;
  v5 = 2;
  if (a4 || !a3)
    v5 = v4;
  if (!a4 || a3)
    v6 = v5;
  else
    v6 = 1;
  return +[TLKAppearance appearanceWithStyle:](TLKAppearance, "appearanceWithStyle:", v6);
}

- (void)enableAppearanceForContainer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[TLKAppearance compositingFilter](self, "compositingFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4)
  {
    v6 = v13;
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      do
      {
        objc_msgSend(v6, "superview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = objc_opt_isKindOfClass();

        v6 = v9;
      }
      while ((v11 & 1) != 0);
    }
    else
    {
      v9 = v6;
    }
    objc_msgSend(v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupBlending:", 0);

    v5 = v13;
  }

}

- (void)enableAppearanceForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TLKAppearance compositingFilter](self, "compositingFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v5);

  objc_msgSend(v4, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[TLKAppearance enableAppearanceForContainer:](self, "enableAppearanceForContainer:", v7);
}

- (id)compositingFilter
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)buttonColorForProminence:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0uLL:
      -[TLKAppearance primaryButtonColor](self, "primaryButtonColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[TLKAppearance secondaryButtonColor](self, "secondaryButtonColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[TLKAppearance tertiaryButtonColor](self, "tertiaryButtonColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
    case 4uLL:
      -[TLKAppearance quaternaryButtonColor](self, "quaternaryButtonColor", v3, v4);
      self = (TLKAppearance *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (BOOL)isVibrant
{
  return self->_isVibrant;
}

- (UIColor)quaternaryColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

- (UIColor)backgroundColor
{
  if (-[TLKAppearance isVibrant](self, "isVibrant"))
    return (UIColor *)0;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)allAppearances
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  +[TLKAppearance appearanceWithStyle:](TLKAppearance, "appearanceWithStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[TLKAppearance appearanceWithStyle:](TLKAppearance, "appearanceWithStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[TLKAppearance appearanceWithStyle:](TLKAppearance, "appearanceWithStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  +[TLKAppearance appearanceWithStyle:](TLKAppearance, "appearanceWithStyle:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)bestAppearanceForSystem
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bestAppearanceForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIColor)primaryColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)secondaryColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)tertiaryColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

- (UIColor)quinaryColor
{
  void *v3;
  void *v4;
  void *v5;
  double v7;

  v7 = 0.0;
  -[TLKAppearance quaternaryColor](self, "quaternaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getHue:saturation:brightness:alpha:", 0, 0, 0, &v7);

  v7 = v7 * 0.6;
  -[TLKAppearance quaternaryColor](self, "quaternaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (UIColor)secondaryButtonColor
{
  if (-[TLKAppearance isVibrant](self, "isVibrant"))
    -[TLKAppearance primaryButtonColor](self, "primaryButtonColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)platterColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
}

- (UIColor)groupedBackgroundColor
{
  if (-[TLKAppearance isVibrant](self, "isVibrant"))
    return (UIColor *)0;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)viewHasOverriddenAppearance:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "overrideUserInterfaceStyle"))
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "_overrideVibrancyTrait") != -1;

  return v4;
}

- (void)overrideAppearanceForView:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[TLKAppearance isDark](self, "isDark"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v5, "setOverrideUserInterfaceStyle:", v4);
  objc_msgSend(v5, "_setOverrideVibrancyTrait:", -[TLKAppearance isVibrant](self, "isVibrant"));

}

- (id)textColorForColor:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[TLKAppearance primaryColor](self, "primaryColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

+ (id)colorWithRed:(unint64_t)a3 green:(unint64_t)a4 blue:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)a3 / 255.0, (double)a4 / 255.0, (double)a5 / 255.0, 1.0);
}

- (BOOL)isEqual:(id)a3
{
  TLKAppearance *v4;
  TLKAppearance *v5;
  unint64_t v6;
  BOOL v7;

  v4 = (TLKAppearance *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[TLKAppearance style](self, "style");
    v7 = v6 == -[TLKAppearance style](v5, "style");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)accessibilityContrastColorBoost
{
  return self->_accessibilityContrastColorBoost;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
