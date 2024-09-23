@implementation _UIBarBackgroundAppearanceData

- (BOOL)hasBackground
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (UIVibrancyEffect)shadowViewEffect
{
  UIVibrancyEffect *shadowEffect;
  UIVibrancyEffect *shadowViewEffect;
  UIVibrancyEffect *v5;
  UIVibrancyEffect *v6;

  shadowEffect = self->_shadowEffect;
  if (shadowEffect)
  {
    shadowViewEffect = self->_shadowViewEffect;
    if (!shadowViewEffect)
    {
      -[UIVibrancyEffect _effectReplacingTintColor:](shadowEffect, "_effectReplacingTintColor:", self->_shadowColor);
      v5 = (UIVibrancyEffect *)objc_claimAutoreleasedReturnValue();
      v6 = self->_shadowViewEffect;
      self->_shadowViewEffect = v5;

      shadowViewEffect = self->_shadowViewEffect;
    }
    shadowEffect = shadowViewEffect;
  }
  return shadowEffect;
}

- (int64_t)backgroundImageContentMode
{
  return self->_backgroundImageContentMode;
}

- (UIColor)shadowViewBackgroundColor
{
  UIColor *shadowColor;

  if (self->_shadowEffect)
    return (UIColor *)0;
  if ((*(_BYTE *)&self->_flags & 4) != 0 && !self->_shadowImage)
    shadowColor = self->_shadowColor;
  else
    shadowColor = 0;
  return shadowColor;
}

- (UIColor)shadowViewTintColor
{
  void *shadowImage;

  if (self->_shadowEffect)
    return (UIColor *)0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    shadowImage = self->_shadowImage;
    if (shadowImage)
      shadowImage = self->_shadowColor;
  }
  else
  {
    shadowImage = 0;
  }
  return (UIColor *)shadowImage;
}

- (BOOL)hasShadow
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

+ (id)opaqueBackgroundData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id v10;

  v2 = (void *)qword_1ECD79CE0;
  if (!qword_1ECD79CE0)
  {
    v3 = objc_opt_new();
    v4 = (void *)qword_1ECD79CE0;
    qword_1ECD79CE0 = v3;

    v5 = *(void **)(qword_1ECD79CE0 + 40);
    *(_QWORD *)(qword_1ECD79CE0 + 40) = MEMORY[0x1E0C9AA60];

    *(_BYTE *)(qword_1ECD79CE0 + 16) |= 1u;
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(qword_1ECD79CE0 + 48);
    *(_QWORD *)(qword_1ECD79CE0 + 48) = v6;

    v8 = *(void **)(qword_1ECD79CE0 + 56);
    *(_QWORD *)(qword_1ECD79CE0 + 56) = 0;

    v9 = (_QWORD *)qword_1ECD79CE0;
    *(_QWORD *)(qword_1ECD79CE0 + 64) = 0;
    v9[13] = 2;
    objc_msgSend(v9, "_updateBackgroundFlags");
    objc_msgSend((id)qword_1ECD79CE0, "configureWithDefaultShadow");
    v10 = (id)objc_msgSend((id)qword_1ECD79CE0, "markReadOnly");
    v2 = (void *)qword_1ECD79CE0;
  }
  return v2;
}

- (UIVibrancyEffect)shadowEffect
{
  return self->_shadowEffect;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  id v5;
  UIColor *v6;
  UIColor *shadowColor;
  UIVibrancyEffect *shadowViewEffect;

  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v6 = (UIColor *)objc_msgSend(v5, "copy");

  shadowColor = self->_shadowColor;
  self->_shadowColor = v6;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  -[_UIBarBackgroundAppearanceData _updateShadowFlags](self, "_updateShadowFlags");
}

+ (id)standardBackgroundData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)_MergedGlobals_1_0;
  if (!_MergedGlobals_1_0)
  {
    v3 = objc_opt_new();
    v4 = (void *)_MergedGlobals_1_0;
    _MergedGlobals_1_0 = v3;

    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(_MergedGlobals_1_0 + 40);
    *(_QWORD *)(_MergedGlobals_1_0 + 40) = v6;

    v8 = _MergedGlobals_1_0;
    *(_BYTE *)(_MergedGlobals_1_0 + 16) |= 1u;
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = 0;

    v10 = *(void **)(_MergedGlobals_1_0 + 56);
    *(_QWORD *)(_MergedGlobals_1_0 + 56) = 0;

    v11 = (_QWORD *)_MergedGlobals_1_0;
    *(_QWORD *)(_MergedGlobals_1_0 + 64) = 0;
    v11[13] = 0;
    objc_msgSend(v11, "_updateBackgroundFlags");
    objc_msgSend((id)_MergedGlobals_1_0, "configureWithDefaultShadow");
    v12 = (id)objc_msgSend((id)_MergedGlobals_1_0, "markReadOnly");
    v2 = (void *)_MergedGlobals_1_0;
  }
  return v2;
}

- (void)_updateBackgroundFlags
{
  char v3;
  UIVibrancyEffect *tabBarVibrancyEffect;
  char v5;

  if (-[NSArray count](self->_backgroundEffects, "count") || self->_backgroundColor)
    v3 = 2;
  else
    v3 = 2 * (self->_backgroundImage != 0);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
  tabBarVibrancyEffect = self->_tabBarVibrancyEffect;
  self->_tabBarVibrancyEffect = 0;

  if (-[NSArray count](self->_backgroundEffects, "count") && !self->_backgroundColor)
    v5 = 8 * (self->_backgroundImage == 0);
  else
    v5 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v5;
}

- (void)_updateShadowFlags
{
  char v3;
  UIImage *shadowImage;

  if (self->_shadowEffect || self->_shadowColor)
  {
    v3 = 4;
  }
  else
  {
    shadowImage = self->_shadowImage;
    if (shadowImage)
      v3 = 4 * (-[UIImage renderingMode](shadowImage, "renderingMode") != UIImageRenderingModeAlwaysTemplate);
    else
      v3 = 0;
  }
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  id v4;
  void *v5;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  UIColor *v12;
  BOOL v13;
  _BOOL4 v14;
  void *v15;
  UIColor *v16;
  _BOOL4 v17;
  void *v18;
  UIColor *v19;
  _BOOL4 v20;
  BOOL v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UIBarBackgroundAppearanceData;
  if (!-[_UIBarAppearanceData checkEqualTo:](&v23, sel_checkEqualTo_, v4)
    || self->_backgroundImageContentMode != *((_QWORD *)v4 + 8))
  {
    goto LABEL_31;
  }
  v5 = (void *)*((_QWORD *)v4 + 6);
  v6 = self->_backgroundColor;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_30;
    v10 = -[UIColor isEqual:](v6, "isEqual:", v7);

    if (!v10)
      goto LABEL_31;
  }
  v11 = (void *)*((_QWORD *)v4 + 7);
  v6 = self->_backgroundImage;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (v6)
      v13 = v12 == 0;
    else
      v13 = 1;
    if (v13)
      goto LABEL_30;
    v14 = -[UIColor isEqual:](v6, "isEqual:", v12);

    if (!v14)
      goto LABEL_31;
  }
  v15 = (void *)*((_QWORD *)v4 + 5);
  v6 = self->_backgroundEffects;
  v16 = v15;
  if (v6 == v16)
  {

  }
  else
  {
    v8 = v16;
    if (!v6 || !v16)
      goto LABEL_30;
    v17 = -[UIColor isEqual:](v6, "isEqual:", v16);

    if (!v17)
      goto LABEL_31;
  }
  v18 = (void *)*((_QWORD *)v4 + 9);
  v6 = self->_overrideTabBarVibrancyEffect;
  v19 = v18;
  if (v6 != v19)
  {
    v8 = v19;
    if (v6 && v19)
    {
      v20 = -[UIColor isEqual:](v6, "isEqual:", v19);

      if (!v20)
        goto LABEL_31;
      goto LABEL_34;
    }
LABEL_30:

    goto LABEL_31;
  }

LABEL_34:
  if (UIEqual(self->_shadowEffect, *((void **)v4 + 12))
    && UIEqual(self->_shadowColor, *((void **)v4 + 10))
    && UIEqual(self->_shadowImage, *((void **)v4 + 11))
    && self->_visibility == *((_QWORD *)v4 + 13))
  {
    v21 = self->_visibilityOnScrollDistance == *((double *)v4 + 14);
    goto LABEL_32;
  }
LABEL_31:
  v21 = 0;
LABEL_32:

  return v21;
}

+ (id)transparentBackgroundData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id v10;

  v2 = (void *)qword_1ECD79CE8;
  if (!qword_1ECD79CE8)
  {
    v3 = objc_opt_new();
    v4 = (void *)qword_1ECD79CE8;
    qword_1ECD79CE8 = v3;

    v5 = *(void **)(qword_1ECD79CE8 + 40);
    *(_QWORD *)(qword_1ECD79CE8 + 40) = MEMORY[0x1E0C9AA60];

    v6 = qword_1ECD79CE8;
    *(_BYTE *)(qword_1ECD79CE8 + 16) |= 1u;
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = 0;

    v8 = *(void **)(qword_1ECD79CE8 + 56);
    *(_QWORD *)(qword_1ECD79CE8 + 56) = 0;

    v9 = (_QWORD *)qword_1ECD79CE8;
    *(_QWORD *)(qword_1ECD79CE8 + 64) = 0;
    v9[13] = 1;
    objc_msgSend(v9, "_updateBackgroundFlags");
    objc_msgSend((id)qword_1ECD79CE8, "configureWithoutShadow");
    v10 = (id)objc_msgSend((id)qword_1ECD79CE8, "markReadOnly");
    v2 = (void *)qword_1ECD79CE8;
  }
  return v2;
}

- (id)replicate
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIBarBackgroundAppearanceData;
  -[_UIBarAppearanceData replicate](&v17, sel_replicate);
  v3 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v3 + 16) = *(_QWORD *)&self->_flags;
  v4 = -[NSArray copy](self->_backgroundEffects, "copy");
  v5 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v4;

  v6 = -[UIColor copy](self->_backgroundColor, "copy");
  v7 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v6;

  objc_storeStrong((id *)(v3 + 56), self->_backgroundImage);
  *(_QWORD *)(v3 + 64) = self->_backgroundImageContentMode;
  *(_QWORD *)(v3 + 104) = self->_visibility;
  *(double *)(v3 + 112) = self->_visibilityOnScrollDistance;
  v8 = -[UIVibrancyEffect copy](self->_overrideTabBarVibrancyEffect, "copy");
  v9 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v8;

  v10 = -[UIVibrancyEffect copy](self->_shadowEffect, "copy");
  v11 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v10;

  objc_storeStrong((id *)(v3 + 88), self->_shadowImage);
  v12 = -[UIColor copy](self->_shadowColor, "copy");
  v13 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v12;

  v14 = -[UIVibrancyEffect copy](self->_tabBarVibrancyEffect, "copy");
  v15 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v14;

  return (id)v3;
}

- (void)configureWithoutShadow
{
  UIColor *shadowColor;
  UIImage *shadowImage;
  UIVibrancyEffect *shadowEffect;
  UIVibrancyEffect *shadowViewEffect;

  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  shadowColor = self->_shadowColor;
  self->_shadowColor = 0;

  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  -[_UIBarBackgroundAppearanceData _updateShadowFlags](self, "_updateShadowFlags");
}

- (void)setBackgroundEffects:(id)a3
{
  NSArray *v5;
  NSArray *backgroundEffects;
  id v7;

  v7 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  if (v7)
  {
    v5 = (NSArray *)objc_msgSend(v7, "copy");
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v5;
  }
  else
  {
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  *(_BYTE *)&self->_flags &= ~1u;
  -[_UIBarBackgroundAppearanceData _updateBackgroundFlags](self, "_updateBackgroundFlags");

}

- (UIBlurEffect)backgroundEffect
{
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (UIBlurEffect *)0;
  -[NSArray firstObject](self->_backgroundEffects, "firstObject");
  return (UIBlurEffect *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBackgroundEffect:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *backgroundEffects;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v6;
  }
  else
  {
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  *(_BYTE *)&self->_flags |= 1u;
  -[_UIBarBackgroundAppearanceData _updateBackgroundFlags](self, "_updateBackgroundFlags");

}

- (void)configureWithDefaultShadow
{
  UIColor *v3;
  UIColor *shadowColor;
  UIVibrancyEffect *shadowEffect;
  UIImage *shadowImage;
  UIVibrancyEffect *shadowViewEffect;

  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  +[UIColor _systemChromeShadowColor](UIColor, "_systemChromeShadowColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  shadowColor = self->_shadowColor;
  self->_shadowColor = v3;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  -[_UIBarBackgroundAppearanceData _updateShadowFlags](self, "_updateShadowFlags");
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  UIColor *v6;
  UIColor *backgroundColor;

  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v6 = (UIColor *)objc_msgSend(v5, "copy");

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v6;

  -[_UIBarBackgroundAppearanceData _updateBackgroundFlags](self, "_updateBackgroundFlags");
}

- (UIVibrancyEffect)tabBarVibrancyEffect
{
  UIVibrancyEffect *overrideTabBarVibrancyEffect;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  UIVibrancyEffect *v11;
  UIVibrancyEffect *tabBarVibrancyEffect;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  overrideTabBarVibrancyEffect = self->_overrideTabBarVibrancyEffect;
  if (!overrideTabBarVibrancyEffect)
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v4 = self->_backgroundEffects;
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v10 = v9;
              if (objc_msgSend(v10, "_canProvideVibrancyEffect", (_QWORD)v14))
              {
                +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v10, 4);
                v11 = (UIVibrancyEffect *)objc_claimAutoreleasedReturnValue();
                tabBarVibrancyEffect = self->_tabBarVibrancyEffect;
                self->_tabBarVibrancyEffect = v11;

              }
              goto LABEL_15;
            }
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

      *(_BYTE *)&self->_flags &= ~8u;
    }
    overrideTabBarVibrancyEffect = self->_tabBarVibrancyEffect;
  }
  return overrideTabBarVibrancyEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowEffect, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_overrideTabBarVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_tabBarVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_shadowViewEffect, 0);
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  __CFString *v54;
  uint64_t v55;
  void *v56;
  _QWORD v58[2];
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = CFSTR("Style");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Style"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v6, "containsValueForKey:", v8))
  {
    v11 = objc_opt_new();
    v12 = objc_opt_class();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Effect"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, CFSTR("Effect"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v14)
    {
      v59[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v15;

      v17 = *(_BYTE *)(v11 + 16) | 1;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0C99E60];
      v58[0] = objc_opt_class();
      v58[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("Effects");
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Effects"), v58[0]);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (void *)v22;
      else
        v24 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)(v11 + 40), v24);

      if (v7)
      v17 = *(_BYTE *)(v11 + 16) & 0xFE;
    }
    *(_BYTE *)(v11 + 16) = v17;
    v25 = objc_opt_class();
    v26 = CFSTR("Color");
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Color"));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(v11 + 48);
    *(_QWORD *)(v11 + 48) = v27;

    if (v7)
    {

      v29 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Image"));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = objc_opt_class();
      v30 = CFSTR("Image");
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(void **)(v11 + 56);
    *(_QWORD *)(v11 + 56) = v31;

    if (v7)
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ImageContentMode"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v11 + 64) = objc_msgSend(v6, "decodeIntegerForKey:", v33);

      objc_msgSend((id)v11, "_updateBackgroundFlags");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Visibility"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v6, "decodeIntegerForKey:", v34);

      if (!v35)
      {
LABEL_34:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowVersion"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v6, "decodeIntegerForKey:", v41);

        goto LABEL_36;
      }
      *(_QWORD *)(v11 + 104) = v35;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("VisibilityOnScrollDistance"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeDoubleForKey:", v36);
      v38 = v37;

    }
    else
    {
      *(_QWORD *)(v11 + 64) = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("ImageContentMode"));
      objc_msgSend((id)v11, "_updateBackgroundFlags");
      v39 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("Visibility"));
      if (!v39)
        goto LABEL_35;
      *(_QWORD *)(v11 + 104) = v39;
      objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("VisibilityOnScrollDistance"));
      v38 = v40;
    }
    if (v38 != 0.0)
      *(double *)(v11 + 112) = v38;
    if (v7)
      goto LABEL_34;
LABEL_35:
    v42 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("ShadowVersion"));
LABEL_36:
    if (v42 == 2)
    {
      v47 = objc_opt_class();
      v48 = CFSTR("ShadowEffect");
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowEffect"));
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = *(void **)(v11 + 96);
      *(_QWORD *)(v11 + 96) = v49;

      if (!v7)
      {
        v51 = objc_opt_class();
        v44 = CFSTR("ShadowColor");
        goto LABEL_53;
      }

      v51 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowColor"));
    }
    else
    {
      if (v42 == 1)
      {
        v43 = objc_opt_class();
        v44 = CFSTR("ShadowEffect");
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowEffect"));
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", v43, v44);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = 96;
        goto LABEL_54;
      }
      v51 = objc_opt_class();
      v44 = CFSTR("ShadowColor");
      if (!v7)
      {
LABEL_53:
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", v51, v44);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = 80;
LABEL_54:
        v52 = *(void **)(v11 + v46);
        *(_QWORD *)(v11 + v46) = v45;

        if (v7)
        {

          v53 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowImage"));
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v53 = objc_opt_class();
          v54 = CFSTR("ShadowImage");
        }
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", v53, v54);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = *(void **)(v11 + 88);
        *(_QWORD *)(v11 + 88) = v55;

        if (v7)
        objc_msgSend((id)v11, "_updateShadowFlags");

        goto LABEL_60;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowColor"));
    }
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  v9 = objc_msgSend(v6, "decodeIntegerForKey:", v8);
  switch(v9)
  {
    case 3:
      objc_msgSend(a1, "transparentBackgroundData");
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "opaqueBackgroundData");
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "standardBackgroundData");
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      goto LABEL_60;
  }
  v11 = v10;
LABEL_60:

  return (id)v11;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v6;
  void *v7;
  NSArray *backgroundEffects;
  __CFString *v9;
  void *v10;
  NSArray *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIColor *backgroundColor;
  void *v20;
  UIColor *v21;
  void *v22;
  UIImage *backgroundImage;
  void *v24;
  int64_t backgroundImageContentMode;
  void *v26;
  int64_t v27;
  void *v28;
  int64_t visibility;
  void *v30;
  double visibilityOnScrollDistance;
  void *v32;
  double v33;
  void *v34;
  UIVibrancyEffect *shadowEffect;
  void *v36;
  UIColor *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  UIColor *shadowColor;
  void *v43;
  UIColor *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  UIImage *shadowImage;
  void *v50;
  id v51;

  v51 = a3;
  v6 = a4;
  v7 = v6;
  if ((_UIBarBackgroundAppearanceData *)_MergedGlobals_1_0 == self)
  {
    if (!v6)
    {
      v16 = v51;
      v17 = 1;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Style"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v51;
    v15 = 1;
LABEL_14:
    objc_msgSend(v14, "encodeInteger:forKey:", v15, v13);

    goto LABEL_70;
  }
  if ((_UIBarBackgroundAppearanceData *)qword_1ECD79CE0 == self)
  {
    if (!v6)
    {
      v16 = v51;
      v17 = 2;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Style"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v51;
    v15 = 2;
    goto LABEL_14;
  }
  if ((_UIBarBackgroundAppearanceData *)qword_1ECD79CE8 == self)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Style"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v51;
      v15 = 3;
      goto LABEL_14;
    }
    v16 = v51;
    v17 = 3;
LABEL_20:
    objc_msgSend(v16, "encodeInteger:forKey:", v17, CFSTR("Style"));
    goto LABEL_70;
  }
  if (-[NSArray count](self->_backgroundEffects, "count"))
  {
    backgroundEffects = self->_backgroundEffects;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[NSArray firstObject](self->_backgroundEffects, "firstObject");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Effect"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "encodeObject:forKey:", v9, v18);

LABEL_25:
        goto LABEL_26;
      }
      v12 = CFSTR("Effect");
      v10 = v51;
      v11 = (NSArray *)v9;
    }
    else
    {
      if (!v7)
      {
        objc_msgSend(v51, "encodeObject:forKey:", self->_backgroundEffects, CFSTR("Effects"));
        backgroundColor = self->_backgroundColor;
        if (!backgroundColor)
          goto LABEL_31;
        v20 = v51;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Effects"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v51;
      v11 = backgroundEffects;
      v12 = v9;
    }
    objc_msgSend(v10, "encodeObject:forKey:", v11, v12);
    goto LABEL_25;
  }
LABEL_26:
  v21 = self->_backgroundColor;
  if (!v21)
    goto LABEL_31;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Color"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v21, v22);

    goto LABEL_31;
  }
  v20 = v51;
  backgroundColor = self->_backgroundColor;
LABEL_30:
  objc_msgSend(v20, "encodeObject:forKey:", backgroundColor, CFSTR("Color"));
LABEL_31:
  backgroundImage = self->_backgroundImage;
  if (!backgroundImage)
  {
LABEL_34:
    backgroundImageContentMode = self->_backgroundImageContentMode;
    if (!backgroundImageContentMode)
      goto LABEL_41;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ImageContentMode"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encodeInteger:forKey:", backgroundImageContentMode, v26);

      goto LABEL_41;
    }
    v28 = v51;
    v27 = self->_backgroundImageContentMode;
    goto LABEL_40;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Image"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", backgroundImage, v24);

    goto LABEL_34;
  }
  objc_msgSend(v51, "encodeObject:forKey:", self->_backgroundImage, CFSTR("Image"));
  v27 = self->_backgroundImageContentMode;
  if (!v27)
    goto LABEL_41;
  v28 = v51;
LABEL_40:
  objc_msgSend(v28, "encodeInteger:forKey:", v27, CFSTR("ImageContentMode"));
LABEL_41:
  visibility = self->_visibility;
  if (!visibility)
  {
LABEL_44:
    visibilityOnScrollDistance = self->_visibilityOnScrollDistance;
    if (visibilityOnScrollDistance == 0.0)
      goto LABEL_51;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("VisibilityOnScrollDistance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encodeDouble:forKey:", v32, visibilityOnScrollDistance);

      goto LABEL_51;
    }
    v34 = v51;
    v33 = self->_visibilityOnScrollDistance;
    goto LABEL_50;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Visibility"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeInteger:forKey:", visibility, v30);

    goto LABEL_44;
  }
  objc_msgSend(v51, "encodeInteger:forKey:", self->_visibility, CFSTR("Visibility"));
  v33 = self->_visibilityOnScrollDistance;
  if (v33 == 0.0)
    goto LABEL_51;
  v34 = v51;
LABEL_50:
  objc_msgSend(v34, "encodeDouble:forKey:", CFSTR("VisibilityOnScrollDistance"), v33);
LABEL_51:
  shadowEffect = self->_shadowEffect;
  if (!shadowEffect)
  {
    shadowColor = self->_shadowColor;
    if (shadowColor)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowColor"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "encodeObject:forKey:", shadowColor, v43);

      }
      else
      {
        objc_msgSend(v51, "encodeObject:forKey:", self->_shadowColor, CFSTR("ShadowColor"));
      }
    }
    goto LABEL_66;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowEffect"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", shadowEffect, v36);

    v37 = self->_shadowColor;
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowColor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encodeObject:forKey:", v37, v38);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowVersion"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v51;
      v41 = 2;
LABEL_62:
      objc_msgSend(v40, "encodeInteger:forKey:", v41, v39);

      goto LABEL_66;
    }
  }
  else
  {
    objc_msgSend(v51, "encodeObject:forKey:", self->_shadowEffect, CFSTR("ShadowEffect"));
    v44 = self->_shadowColor;
    if (v44)
    {
      objc_msgSend(v51, "encodeObject:forKey:", v44, CFSTR("ShadowColor"));
      v45 = v51;
      v46 = 2;
      goto LABEL_65;
    }
  }
  +[UIColor _systemChromeShadowColor](UIColor, "_systemChromeShadowColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowColor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v47, v48);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowVersion"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v51;
    v41 = 1;
    goto LABEL_62;
  }
  objc_msgSend(v51, "encodeObject:forKey:", v47, CFSTR("ShadowColor"));

  v45 = v51;
  v46 = 1;
LABEL_65:
  objc_msgSend(v45, "encodeInteger:forKey:", v46, CFSTR("ShadowVersion"));
LABEL_66:
  shadowImage = self->_shadowImage;
  if (shadowImage)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("ShadowImage"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encodeObject:forKey:", shadowImage, v50);

    }
    else
    {
      objc_msgSend(v51, "encodeObject:forKey:", shadowImage, CFSTR("ShadowImage"));
    }
  }
LABEL_70:

}

- (void)describeInto:(id)a3
{
  id v4;
  NSArray *backgroundEffects;
  void *v6;
  const __CFString *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarBackgroundAppearanceData;
  -[_UIBarAppearanceData describeInto:](&v8, sel_describeInto_, v4);
  if (-[NSArray count](self->_backgroundEffects, "count"))
  {
    backgroundEffects = self->_backgroundEffects;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[NSArray firstObject](backgroundEffects, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" effect=(%@)"), v6);
    }
    else
    {
      -[NSArray componentsJoinedByString:](backgroundEffects, "componentsJoinedByString:", CFSTR(", "));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" effects=(%@)"), v6);
    }

  }
  if (self->_backgroundColor)
    objc_msgSend(v4, "appendFormat:", CFSTR(" color=%@"), self->_backgroundColor);
  if (self->_backgroundImage)
    objc_msgSend(v4, "appendFormat:", CFSTR(" image=%@ contentMode=%li"), self->_backgroundImage, self->_backgroundImageContentMode);
  if (self->_visibility)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" visibility="));
    switch(self->_visibility)
    {
      case 0:
        break;
      case 1:
        v7 = CFSTR("hidden");
        goto LABEL_14;
      case 2:
        v7 = CFSTR("visible");
LABEL_14:
        objc_msgSend(v4, "appendString:", v7);
        break;
      case 3:
        objc_msgSend(v4, "appendString:", CFSTR("visibleOnScroll"));
        if (self->_visibilityOnScrollDistance > 0.0)
          objc_msgSend(v4, "appendFormat:", CFSTR("(distance=%0.2f)"), *(_QWORD *)&self->_visibilityOnScrollDistance);
        break;
      default:
        objc_msgSend(v4, "appendFormat:", CFSTR("unknown(%ld)"), self->_visibility);
        break;
    }
  }
  if (self->_shadowEffect)
    objc_msgSend(v4, "appendFormat:", CFSTR(" shadowEffect=%@"), self->_shadowEffect);
  if (self->_shadowColor)
    objc_msgSend(v4, "appendFormat:", CFSTR(" shadowColor=%@"), self->_shadowColor);
  if (self->_shadowImage)
    objc_msgSend(v4, "appendFormat:", CFSTR(" shadowImage=%@"), self->_shadowImage);

}

- (int64_t)hashInto:(int64_t)a3
{
  int64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIBarBackgroundAppearanceData;
  v4 = -[_UIBarAppearanceData hashInto:](&v9, sel_hashInto_, a3);
  v5 = -[NSArray count](self->_backgroundEffects, "count");
  v6 = 1;
  if (self->_backgroundColor)
    v6 = 2;
  v7 = v6 + v5;
  if (self->_backgroundImage)
    ++v7;
  if (self->_shadowEffect)
    ++v7;
  if (self->_shadowImage)
    ++v7;
  if (self->_shadowColor)
    ++v7;
  return (self->_visibility + v7 * v4 + (uint64_t)self->_visibilityOnScrollDistance) << 8;
}

- (void)setBackgroundImage:(id)a3
{
  UIImage *v5;
  UIImage *backgroundImage;

  v5 = (UIImage *)a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = v5;

  -[_UIBarBackgroundAppearanceData _updateBackgroundFlags](self, "_updateBackgroundFlags");
}

- (void)setOverrideTabBarVibrancyEffect:(id)a3
{
  id v5;
  UIVibrancyEffect *v6;
  UIVibrancyEffect *overrideTabBarVibrancyEffect;

  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v6 = (UIVibrancyEffect *)objc_msgSend(v5, "copy");

  overrideTabBarVibrancyEffect = self->_overrideTabBarVibrancyEffect;
  self->_overrideTabBarVibrancyEffect = v6;

}

- (void)setShadowImage:(id)a3
{
  UIImage *v5;
  UIImage *shadowImage;

  v5 = (UIImage *)a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  shadowImage = self->_shadowImage;
  self->_shadowImage = v5;

  -[_UIBarBackgroundAppearanceData _updateShadowFlags](self, "_updateShadowFlags");
}

- (void)setShadowEffect:(id)a3
{
  id v5;
  UIVibrancyEffect *v6;
  UIVibrancyEffect *shadowEffect;
  UIVibrancyEffect *shadowViewEffect;

  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v6 = (UIVibrancyEffect *)objc_msgSend(v5, "copy");

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = v6;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  -[_UIBarBackgroundAppearanceData _updateShadowFlags](self, "_updateShadowFlags");
}

- (int64_t)behaviorForTransitioningTo:(id)a3
{
  return 1;
}

- (void)setBackgroundImageContentMode:(int64_t)a3
{
  self->_backgroundImageContentMode = a3;
}

- (UIVibrancyEffect)overrideTabBarVibrancyEffect
{
  return self->_overrideTabBarVibrancyEffect;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (double)visibilityOnScrollDistance
{
  return self->_visibilityOnScrollDistance;
}

- (void)setVisibilityOnScrollDistance:(double)a3
{
  self->_visibilityOnScrollDistance = a3;
}

@end
