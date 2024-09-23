@implementation _UIBarBackgroundLayoutLegacy

- (BOOL)bg1HasShadow
{
  return self->_hasShadow && !self->super._shadowHidden;
}

- (id)bg1Image
{
  return self->_backgroundImage;
}

- (id)bg1Effects
{
  return self->_backgroundEffects;
}

- (id)bg1Color
{
  return self->_backgroundTintColor;
}

- (id)bg1ShadowImage
{
  return self->_shadowImage;
}

- (id)bg1ShadowEffect
{
  return self->_shadowEffect;
}

- (id)bg1ShadowColor
{
  if (self->_shadowEffect)
    return 0;
  else
    return self->_shadowColor;
}

- (double)bg1ShadowAlpha
{
  return self->super._shadowAlpha * self->super._backgroundAlpha;
}

- (double)bg1ImageAlpha
{
  double result;

  result = 0.909803922;
  if (self->_translucence != 1)
    return 1.0;
  return result;
}

- (double)bg1Alpha
{
  return self->super._backgroundAlpha;
}

- (_UIBarBackgroundLayoutLegacy)initWithLayout:(id)a3
{
  id v4;
  _UIBarBackgroundLayoutLegacy *v5;
  _UIBarBackgroundLayoutLegacy *v6;
  id *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIBarBackgroundLayoutLegacy;
  v5 = -[_UIBarBackgroundLayout initWithLayout:](&v10, sel_initWithLayout_, v4);
  v6 = v5;
  if (v5)
  {
    v5->super._useExplicitGeometry = 0;
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      v6->_translucence = *((_QWORD *)v4 + 11);
      objc_storeStrong((id *)&v6->_backgroundImage, *((id *)v4 + 12));
      v7 = (id *)v4;
      objc_storeStrong((id *)&v6->_backgroundTintColor, v7[13]);
      objc_storeStrong((id *)&v6->_backgroundEffects, v7[14]);
      objc_storeStrong((id *)&v6->_shadowImage, v7[15]);
      objc_storeStrong((id *)&v6->_shadowColor, v7[16]);
      objc_storeStrong((id *)&v6->_shadowEffect, v7[17]);
      v6->_hasShadow = *((_BYTE *)v7 + 144);
      v8 = v7[19];

      *(_QWORD *)&v6->_topInset = v8;
    }
  }

  return v6;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)configureEffectForStyle:(int64_t)a3 backgroundTintColor:(id)a4 forceOpaque:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  UIImage *backgroundImage;
  NSArray *backgroundEffects;
  int64_t interfaceIdiom;
  uint64_t v13;
  NSArray *v14;
  void *v15;
  int *v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *v22;
  NSArray *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v5 = a5;
  v8 = a4;
  v26 = v8;
  if (v5)
  {
    backgroundImage = self->_backgroundImage;
    self->_backgroundImage = 0;

    if (v26)
      objc_msgSend(v26, "colorWithAlphaComponent:", 1.0);
    else
      -[_UIBarBackgroundLayoutLegacy _colorForStyle:](self, "_colorForStyle:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &OBJC_IVAR____UIBarBackgroundLayoutLegacy__backgroundEffects;
    objc_storeStrong((id *)&self->_backgroundTintColor, v15);
    v17 = 2;
  }
  else
  {
    if (a3 == 4)
    {
      backgroundEffects = self->_backgroundEffects;
      self->_backgroundEffects = 0;
    }
    else
    {
      interfaceIdiom = self->super._interfaceIdiom;
      if (interfaceIdiom == 2 || interfaceIdiom == 8)
      {
        if (a3)
          v13 = 4018;
        else
          v13 = 5007;
        -[_UIBarBackgroundLayoutLegacy _blurWithStyle:tint:](self, "_blurWithStyle:tint:", v13, v8);
        v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
        backgroundEffects = self->_backgroundEffects;
        self->_backgroundEffects = v14;
      }
      else
      {
        if (v8 && !self->super._disableTinting)
        {
          backgroundEffects = (NSArray *)v8;
          v21 = 100;
        }
        else
        {
          v18 = dyld_program_sdk_at_least();
          backgroundEffects = 0;
          v19 = 20;
          if (!a3)
            v19 = 10;
          v20 = 2;
          if (!a3)
            v20 = 5;
          if (v18)
            v21 = v19;
          else
            v21 = v20;
        }
        -[_UIBarBackgroundLayoutLegacy _blurWithStyle:tint:](self, "_blurWithStyle:tint:", v21, backgroundEffects);
        v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v23 = self->_backgroundEffects;
        self->_backgroundEffects = v22;

      }
    }

    v17 = 0;
    v16 = &OBJC_IVAR____UIBarBackgroundLayoutLegacy__backgroundTintColor;
    v15 = self->_backgroundImage;
    self->_backgroundImage = 0;
  }

  v24 = *v16;
  v25 = *(Class *)((char *)&self->super.super.isa + v24);
  *(Class *)((char *)&self->super.super.isa + v24) = 0;

  self->_translucence = v17;
}

- (void)configureShadowForBarStyle:(int64_t)a3
{
  UIImage *shadowImage;
  void *v6;
  UIColor *v7;
  UIColor *shadowColor;

  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  objc_storeStrong((id *)&self->_shadowEffect, 0);
  if (!self->_shadowEffect)
  {
    _UIBarHairlineShadowColorForBarStyle(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIColor *)objc_msgSend(v6, "copy");
    shadowColor = self->_shadowColor;
    self->_shadowColor = v7;

  }
  self->_hasShadow = 1;
}

- (id)_blurWithStyle:(int64_t)a3 tint:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!self->super._disableTinting)
  {
    +[UIBlurEffect _effectWithStyle:tintColor:invertAutomaticStyle:](UIBlurEffect, "_effectWithStyle:tintColor:invertAutomaticStyle:", a3, v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v21;
LABEL_9:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!v6)
  {
    +[UIBlurEffect _effectWithBlurRadius:scale:](UIBlurEffect, "_effectWithBlurRadius:scale:", 20.0, 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "getRed:green:blue:alpha:", &v19, (char *)&v19 + 8, &v20, (char *)&v20 + 8);
  v8 = *((double *)&v20 + 1);
  if (*((double *)&v20 + 1) >= 1.0)
  {
    +[UIVisualEffect effectCompositingColor:](UIVisualEffect, "effectCompositingColor:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v22;
    goto LABEL_9;
  }
  v9 = *((double *)&v20 + 1) * *(double *)&v20;
  v10 = *((double *)&v20 + 1) * *((double *)&v19 + 1);
  v11 = *((double *)&v20 + 1) * *(double *)&v19;
  +[UIBlurEffect _effectWithBlurRadius:scale:](UIBlurEffect, "_effectWithBlurRadius:scale:", 20.0, 0.25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", v11, v10, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_10:

  return v15;
}

- (void)setTopInset:(double)a3
{
  double v3;

  v3 = fmax(a3, 0.0);
  if (self->_topInset != v3)
    self->_topInset = v3;
}

- (id)_colorForStyle:(int64_t)a3
{
  int64_t interfaceStyle;
  uint64_t v4;
  int64_t v6;
  void *v7;

  if (self->super._interfaceIdiom == 3)
    return 0;
  interfaceStyle = self->super._interfaceStyle;
  if (a3 == 4)
    v4 = 4;
  else
    v4 = 1;
  if (interfaceStyle == 1000 || interfaceStyle == 2)
    v6 = v4;
  else
    v6 = a3;
  if (v6 == 2)
    v6 = 1;
  if (v6 == 1)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (v6)
    return 0;
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)configureWithoutShadow
{
  UIImage *shadowImage;
  UIColor *shadowColor;
  UIVibrancyEffect *shadowEffect;

  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  shadowColor = self->_shadowColor;
  self->_shadowColor = 0;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  self->_hasShadow = 0;
}

- (void)configureImage:(id)a3 forceTranslucent:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *backgroundEffects;
  UIColor *backgroundTintColor;
  id v9;

  v4 = a4;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  v9 = a3;
  self->_translucence = v4;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  backgroundTintColor = self->_backgroundTintColor;
  self->_backgroundTintColor = 0;

}

- (void)configureShadowImage:(id)a3
{
  id v5;
  UIColor *shadowColor;
  UIVibrancyEffect *shadowEffect;

  objc_storeStrong((id *)&self->_shadowImage, a3);
  v5 = a3;
  shadowColor = self->_shadowColor;
  self->_shadowColor = 0;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  self->_hasShadow = 1;
}

- (void)configureWithEffects:(id)a3
{
  UIImage *backgroundImage;
  uint64_t v5;
  void *v6;
  UIColor *backgroundTintColor;
  id v8;

  v8 = a3;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  self->_translucence = 0;
  v5 = objc_msgSend(v8, "count");
  if (v5)
    v6 = (void *)objc_msgSend(v8, "copy");
  else
    v6 = 0;
  objc_storeStrong((id *)&self->_backgroundEffects, v6);
  if (v5)

  backgroundTintColor = self->_backgroundTintColor;
  self->_backgroundTintColor = 0;

}

- (double)bgInset
{
  return self->_topInset;
}

- (BOOL)shouldUseExplicitGeometry
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowEffect, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

- (void)setUseExplicitGeometry:(BOOL)a3
{
  self->super._useExplicitGeometry = 0;
}

- (UIImage)shadowImage
{
  if (self->_hasShadow)
    return self->_shadowImage;
  else
    return (UIImage *)0;
}

- (BOOL)hasBackgroundEffect
{
  return -[NSArray count](self->_backgroundEffects, "count") != 0;
}

- (void)configureBackgroundColor:(id)a3 barStyle:(int64_t)a4 translucent:(BOOL)a5
{
  _BOOL4 v5;
  UIImage *backgroundImage;
  NSArray *backgroundEffects;
  UIColor *v10;
  UIColor *backgroundTintColor;
  UIColor *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  self->_translucence = v5;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  if (v13 || v5)
  {
    v12 = (UIColor *)v13;
    backgroundTintColor = self->_backgroundTintColor;
    self->_backgroundTintColor = v12;
  }
  else
  {
    -[_UIBarBackgroundLayoutLegacy _colorForStyle:](self, "_colorForStyle:", a4);
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundTintColor = self->_backgroundTintColor;
    self->_backgroundTintColor = v10;
  }

}

- (void)configureImage:(id)a3 forceOpaque:(BOOL)a4 backgroundTintColor:(id)a5
{
  _BOOL4 v6;
  id v9;
  int64_t v10;
  NSArray *backgroundEffects;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  v9 = a5;
  v10 = 2;
  if (!v6)
    v10 = 0;
  self->_translucence = v10;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  if (v6)
  {
    objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_msgSend(v9, "copy");
  }
  v13 = (void *)v12;

  objc_storeStrong((id *)&self->_backgroundTintColor, v13);
}

- (void)configureImage:(id)a3 forceOpaque:(BOOL)a4 barStyle:(int64_t)a5
{
  _BOOL4 v6;
  int64_t v9;
  NSArray *backgroundEffects;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  v9 = 2;
  if (!v6)
    v9 = 0;
  self->_translucence = v9;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  if (!v12)
    v6 = 1;
  if (v6)
  {
    -[_UIBarBackgroundLayoutLegacy _colorForStyle:](self, "_colorForStyle:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)&self->_backgroundTintColor, v11);
  if (v6)

}

- (void)configureAsTransparent
{
  UIImage *backgroundImage;
  NSArray *backgroundEffects;
  UIColor *backgroundTintColor;

  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  self->_translucence = 0;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  backgroundTintColor = self->_backgroundTintColor;
  self->_backgroundTintColor = 0;

}

- (void)describeInto:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBarBackgroundLayoutLegacy;
  v4 = a3;
  -[_UIBarBackgroundLayout describeInto:](&v5, sel_describeInto_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR(" _translucence=%li backgroundImage=%@ backgroundTintColor=%@ backgroundEffects=%@ shadowImage=%@ shadowColor=%@"), self->_translucence, self->_backgroundImage, self->_backgroundTintColor, self->_backgroundEffects, self->_shadowImage, self->_shadowColor, v5.receiver, v5.super_class);

}

@end
