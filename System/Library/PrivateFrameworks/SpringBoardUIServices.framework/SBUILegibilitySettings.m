@implementation SBUILegibilitySettings

+ (id)sharedInstanceForStyle:(int64_t)a3
{
  uint64_t *v3;

  if (a3 == 2)
  {
    if (sharedInstanceForStyle__once_22 != -1)
      dispatch_once(&sharedInstanceForStyle__once_22, &__block_literal_global_24);
    v3 = &sharedInstanceForStyle__instance_23;
  }
  else
  {
    if (sharedInstanceForStyle__once != -1)
      dispatch_once(&sharedInstanceForStyle__once, &__block_literal_global_23);
    v3 = &sharedInstanceForStyle__instance;
  }
  return (id)*v3;
}

void __49__SBUILegibilitySettings_sharedInstanceForStyle___block_invoke()
{
  SBUILegibilitySettings *v0;
  void *v1;

  v0 = -[SBUILegibilitySettings initWithStyle:]([SBUILegibilitySettings alloc], "initWithStyle:", 1);
  v1 = (void *)sharedInstanceForStyle__instance;
  sharedInstanceForStyle__instance = (uint64_t)v0;

}

void __49__SBUILegibilitySettings_sharedInstanceForStyle___block_invoke_2()
{
  SBUILegibilitySettings *v0;
  void *v1;

  v0 = -[SBUILegibilitySettings initWithStyle:]([SBUILegibilitySettings alloc], "initWithStyle:", 2);
  v1 = (void *)sharedInstanceForStyle__instance_23;
  sharedInstanceForStyle__instance_23 = (uint64_t)v0;

}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3
{
  SBUILegibilitySettings *v4;
  SBUILegibilitySettings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUILegibilitySettings;
  v4 = -[SBUILegibilitySettings init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v4, "_configureForStyle:contentColor:", a3, 0);
  return v5;
}

- (SBUILegibilitySettings)initWithContentColor:(id)a3
{
  id v4;
  uint64_t v5;
  SBUILegibilitySettings *v6;
  SBUILegibilitySettings *v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CEADF0], "styleForContentColor:", v4);
  v9.receiver = self;
  v9.super_class = (Class)SBUILegibilitySettings;
  v6 = -[SBUILegibilitySettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v6, "_configureForStyle:contentColor:", v5, v4);

  return v7;
}

- (SBUILegibilitySettings)initWithContentColor:(id)a3 contrast:(double)a4
{
  id v6;
  SBUILegibilitySettings *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUILegibilitySettings;
  v7 = -[SBUILegibilitySettings init](&v9, sel_init);
  if (v7)
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v7, "_configureForStyle:contentColor:", objc_msgSend(MEMORY[0x1E0CEADF0], "styleForContentColor:contrast:", v6, a4), v6);

  return v7;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 contentColor:(id)a4
{
  id v6;
  SBUILegibilitySettings *v7;
  SBUILegibilitySettings *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilitySettings;
  v7 = -[SBUILegibilitySettings init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v7, "_configureForStyle:contentColor:", a3, v6);

  return v8;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBUILegibilitySettings *v14;
  SBUILegibilitySettings *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBUILegibilitySettings;
  v14 = -[SBUILegibilitySettings init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v14, "_configureForStyle:contentColor:", a3, 0);
    objc_storeStrong((id *)&v15->_primaryColor, a4);
    objc_storeStrong((id *)&v15->_secondaryColor, a5);
    objc_storeStrong((id *)&v15->_shadowColor, a6);
  }

  return v15;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6 shadowSettings:(id *)a7
{
  id v13;
  id v14;
  id v15;
  SBUILegibilitySettings *v16;
  SBUILegibilitySettings *v17;
  __int128 v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBUILegibilitySettings;
  v16 = -[SBUILegibilitySettings init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v16, "_configureForStyle:contentColor:", a3, 0);
    objc_storeStrong((id *)&v17->_primaryColor, a4);
    objc_storeStrong((id *)&v17->_secondaryColor, a5);
    objc_storeStrong((id *)&v17->_shadowColor, a6);
    v18 = *(_OWORD *)&a7->var2;
    *(_OWORD *)&v17->_shadowSettings.shadowRadius = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v17->_shadowSettings.imageOutset = v18;
  }

  return v17;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6 shadowSettings:(id *)a7 minFillHeight:(double)a8
{
  id v15;
  id v16;
  id v17;
  SBUILegibilitySettings *v18;
  SBUILegibilitySettings *v19;
  __int128 v20;
  objc_super v22;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBUILegibilitySettings;
  v18 = -[SBUILegibilitySettings init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v18, "_configureForStyle:contentColor:", a3, 0);
    objc_storeStrong((id *)&v19->_primaryColor, a4);
    objc_storeStrong((id *)&v19->_secondaryColor, a5);
    objc_storeStrong((id *)&v19->_shadowColor, a6);
    v20 = *(_OWORD *)&a7->var2;
    *(_OWORD *)&v19->_shadowSettings.shadowRadius = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v19->_shadowSettings.imageOutset = v20;
    v19->_minFillHeight = a8;
  }

  return v19;
}

- (id)_UILegibilitySettings
{
  _UILegibilitySettings *cachedLegacyLegibiltiySettings;
  id v4;
  int64_t style;
  void *v6;
  void *v7;
  void *v8;
  _UILegibilitySettings *v9;
  _UILegibilitySettings *v10;

  cachedLegacyLegibiltiySettings = self->_cachedLegacyLegibiltiySettings;
  if (!cachedLegacyLegibiltiySettings)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEADE8]);
    style = self->_style;
    -[SBUILegibilitySettings primaryColor](self, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilitySettings secondaryColor](self, "secondaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilitySettings shadowColor](self, "shadowColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_UILegibilitySettings *)objc_msgSend(v4, "initWithStyle:primaryColor:secondaryColor:shadowColor:", style, v6, v7, v8);
    v10 = self->_cachedLegacyLegibiltiySettings;
    self->_cachedLegacyLegibiltiySettings = v9;

    -[_UILegibilitySettings setShadowAlpha:](self->_cachedLegacyLegibiltiySettings, "setShadowAlpha:", self->_shadowSettings.shadowAlpha);
    -[_UILegibilitySettings setShadowRadius:](self->_cachedLegacyLegibiltiySettings, "setShadowRadius:", self->_shadowSettings.shadowRadius);
    -[_UILegibilitySettings setImageOutset:](self->_cachedLegacyLegibiltiySettings, "setImageOutset:", self->_shadowSettings.imageOutset);
    -[_UILegibilitySettings setMinFillHeight:](self->_cachedLegacyLegibiltiySettings, "setMinFillHeight:", self->_minFillHeight);
    cachedLegacyLegibiltiySettings = self->_cachedLegacyLegibiltiySettings;
  }
  return cachedLegacyLegibiltiySettings;
}

- (double)shadowRadius
{
  return self->_shadowSettings.shadowRadius;
}

- (double)shadowAlpha
{
  return self->_shadowSettings.shadowAlpha;
}

- (double)imageOutset
{
  return self->_shadowSettings.imageOutset;
}

- (id)compositingFilter
{
  return CAFilterForSBUILegibilityShadowCompositingFilter(self->_shadowSettings.compositingFilter);
}

- (BOOL)isEqualToLegibilitySettings:(id)a3
{
  SBUILegibilitySettings *v4;
  double *v5;
  __int128 v6;
  __int128 v7;
  UIColor *primaryColor;
  unint64_t v9;
  UIColor *secondaryColor;
  unint64_t v11;
  UIColor *shadowColor;
  unint64_t v13;
  char v14;
  _OWORD v16[2];
  _OWORD v17[2];

  v4 = (SBUILegibilitySettings *)a3;
  v5 = (double *)v4;
  if (!v4)
    goto LABEL_15;
  if (v4 == self)
  {
    v14 = 1;
    goto LABEL_17;
  }
  if (self->_style != v4->_style)
    goto LABEL_15;
  v6 = *(_OWORD *)&self->_shadowSettings.imageOutset;
  v17[0] = *(_OWORD *)&self->_shadowSettings.shadowRadius;
  v17[1] = v6;
  v7 = *(_OWORD *)&v4->_shadowSettings.imageOutset;
  v16[0] = *(_OWORD *)&v4->_shadowSettings.shadowRadius;
  v16[1] = v7;
  if (!SBUI_LegibilityShadowSettingsAreEqual((uint64_t)v17, (uint64_t)v16))
    goto LABEL_15;
  if (vabdd_f64(self->_minFillHeight, v5[6]) >= 2.22044605e-16)
    goto LABEL_15;
  primaryColor = self->_primaryColor;
  v9 = *((_QWORD *)v5 + 3);
  if (primaryColor != (UIColor *)v9
    && (unint64_t)primaryColor | v9
    && !-[UIColor _isSimilarToColor:withinPercentage:](primaryColor, "_isSimilarToColor:withinPercentage:", 0.01))
  {
    goto LABEL_15;
  }
  secondaryColor = self->_secondaryColor;
  v11 = *((_QWORD *)v5 + 4);
  if (secondaryColor == (UIColor *)v11
    || !((unint64_t)secondaryColor | v11)
    || -[UIColor _isSimilarToColor:withinPercentage:](secondaryColor, "_isSimilarToColor:withinPercentage:", 0.01))
  {
    shadowColor = self->_shadowColor;
    v13 = *((_QWORD *)v5 + 5);
    v14 = 1;
    if (shadowColor != (UIColor *)v13 && (unint64_t)shadowColor | v13)
      v14 = -[UIColor _isSimilarToColor:withinPercentage:](shadowColor, "_isSimilarToColor:withinPercentage:", 0.01);
  }
  else
  {
LABEL_15:
    v14 = 0;
  }
LABEL_17:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  SBUILegibilitySettings *v4;
  SBUILegibilitySettings *v5;
  BOOL v6;

  v4 = (SBUILegibilitySettings *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[SBUILegibilitySettings isEqualToLegibilitySettings:](self, "isEqualToLegibilitySettings:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t result;
  int64_t style;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _OWORD v11[2];

  result = self->_computedHash;
  if (!result)
  {
    style = self->_style;
    v5 = *(_OWORD *)&self->_shadowSettings.imageOutset;
    v11[0] = *(_OWORD *)&self->_shadowSettings.shadowRadius;
    v11[1] = v5;
    v6 = SBUILegibilityShadowSettingsHash((uint64_t)v11) ^ style;
    v7 = v6 ^ -[UIColor hash](self->_primaryColor, "hash");
    v8 = -[UIColor hash](self->_secondaryColor, "hash");
    v9 = v7 ^ v8 ^ -[UIColor hash](self->_shadowColor, "hash");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minFillHeight);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_computedHash = v9 ^ objc_msgSend(v10, "hash");

    return self->_computedHash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBUILegibilitySettings *v4;
  __int128 v5;

  v4 = -[SBUILegibilitySettings init](+[SBUILegibilitySettings allocWithZone:](SBUILegibilitySettings, "allocWithZone:", a3), "init");
  v4->_style = self->_style;
  objc_storeStrong((id *)&v4->_primaryColor, self->_primaryColor);
  objc_storeStrong((id *)&v4->_secondaryColor, self->_secondaryColor);
  objc_storeStrong((id *)&v4->_shadowColor, self->_shadowColor);
  v5 = *(_OWORD *)&self->_shadowSettings.imageOutset;
  *(_OWORD *)&v4->_shadowSettings.shadowRadius = *(_OWORD *)&self->_shadowSettings.shadowRadius;
  *(_OWORD *)&v4->_shadowSettings.imageOutset = v5;
  v4->_minFillHeight = self->_minFillHeight;
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t style;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  style = self->_style;
  v6 = CFSTR("SBUIModernLegibilityStyleDefault");
  if (style == 2)
    v6 = CFSTR("SBUIModernLegibilityStyleDarkContentWithLightShadow");
  if (style == 1)
    v7 = CFSTR("SBUIModernLegibilityStyleLightContentWithDarkShadow");
  else
    v7 = v6;
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("style"));
  -[SBUILegibilitySettings primaryColor](self, "primaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("primaryColor"));

  -[SBUILegibilitySettings secondaryColor](self, "secondaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("secondaryColor"));

  -[SBUILegibilitySettings shadowColor](self, "shadowColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("shadowColor"));

  -[SBUILegibilitySettings minFillHeight](self, "minFillHeight");
  v16 = (id)objc_msgSend(v4, "appendInteger:withName:", (uint64_t)v15, CFSTR("minFillHeight"));
  -[SBUILegibilitySettings shadowSettings](self, "shadowSettings");
  NSDictionaryFromSBUILegibilityShadowSettings((uint64_t)&v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:", v17, CFSTR("shadowSettings"));

  objc_msgSend(v4, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBUILegibilitySettings)initWithCoder:(id)a3
{
  id v4;
  SBUILegibilitySettings *v5;
  uint64_t v6;
  UIColor *primaryColor;
  uint64_t v8;
  UIColor *secondaryColor;
  uint64_t v10;
  UIColor *shadowColor;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBUILegibilitySettings;
  v5 = -[SBUILegibilitySettings init](&v17, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSBUIModernLegibilityStyleKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBUIModernLegibilityPrimaryColorKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    primaryColor = v5->_primaryColor;
    v5->_primaryColor = (UIColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBUIModernLegibilitySecondaryColorKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    secondaryColor = v5->_secondaryColor;
    v5->_secondaryColor = (UIColor *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBUIModernLegibilityShadowColorKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    shadowColor = v5->_shadowColor;
    v5->_shadowColor = (UIColor *)v10;

    v5->_shadowSettings.compositingFilter = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSBUIModernLegibilityShadowCompositingFilterNameKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kSBUIModernLegibilityShadowRadiusKey"));
    v5->_shadowSettings.shadowRadius = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kSBUIModernLegibilityShadowAlphaKey"));
    v5->_shadowSettings.shadowAlpha = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kSBUIModernLegibilityImageOutsetKey"));
    v5->_shadowSettings.imageOutset = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kSBUIModernLegibilityMinFillHeightKey"));
    v5->_minFillHeight = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("kSBUIModernLegibilityStyleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryColor, CFSTR("kSBUIModernLegibilityPrimaryColorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryColor, CFSTR("kSBUIModernLegibilitySecondaryColorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shadowColor, CFSTR("kSBUIModernLegibilityShadowColorKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shadowSettings.compositingFilter, CFSTR("kSBUIModernLegibilityShadowCompositingFilterNameKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSBUIModernLegibilityShadowRadiusKey"), self->_shadowSettings.shadowRadius);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSBUIModernLegibilityShadowAlphaKey"), self->_shadowSettings.shadowAlpha);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSBUIModernLegibilityImageOutsetKey"), self->_shadowSettings.imageOutset);
  -[SBUILegibilitySettings minFillHeight](self, "minFillHeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSBUIModernLegibilityMinFillHeightKey"));

}

- (void)_configureForStyle:(int64_t)a3 contentColor:(id)a4
{
  id v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;
  UIColor *v12;
  UIColor *v13;
  UIColor *v14;
  UIColor *v15;
  UIColor *v16;
  UIColor *v17;
  UIColor *v18;
  UIColor *primaryColor;
  UIColor *v20;
  UIColor *secondaryColor;
  UIColor *v22;
  UIColor *shadowColor;
  int64_t v24;
  UIColor *v25;
  id v26;

  v6 = a4;
  v26 = v6;
  switch(a3)
  {
    case 2:
      if (v6)
        ComputeLegibilityColorFromColor(v6);
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
      primaryColor = self->_primaryColor;
      self->_primaryColor = v13;

      -[UIColor colorWithAlphaComponent:](self->_primaryColor, "colorWithAlphaComponent:", 0.45);
      v20 = (UIColor *)objc_claimAutoreleasedReturnValue();
      secondaryColor = self->_secondaryColor;
      self->_secondaryColor = v20;

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
      shadowColor = self->_shadowColor;
      self->_shadowColor = v22;

      v24 = 2;
      goto LABEL_13;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v15 = self->_primaryColor;
      self->_primaryColor = v14;

      -[UIColor colorWithAlphaComponent:](self->_primaryColor, "colorWithAlphaComponent:", 0.45);
      v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v17 = self->_secondaryColor;
      self->_secondaryColor = v16;

      if (v26)
        ComputeLegibilityColorFromColor(v26);
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v18 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v25 = self->_shadowColor;
      self->_shadowColor = v18;

      v24 = 1;
LABEL_13:
      *(_OWORD *)&self->_shadowSettings.shadowRadius = xmmword_1A47AF1A0;
      self->_shadowSettings.imageOutset = 24.0;
      self->_shadowSettings.compositingFilter = v24;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v8 = self->_primaryColor;
      self->_primaryColor = v7;

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v10 = self->_secondaryColor;
      self->_secondaryColor = v9;

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v12 = self->_shadowColor;
      self->_shadowColor = v11;

      self->_shadowSettings.shadowRadius = 0.0;
      self->_shadowSettings.shadowAlpha = 0.0;
      self->_shadowSettings.imageOutset = 0.0;
      break;
  }
  self->_minFillHeight = 20.0;
  self->_style = a3;

}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- ($7EAA55B41BE6719E250DE54AFC18E175)shadowSettings
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (double)minFillHeight
{
  return self->_minFillHeight;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_cachedLegacyLegibiltiySettings, 0);
}

@end
