@implementation _UIVibrancyEffectCoreMaterialImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  int64_t blurStyle;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  blurStyle = self->_blurStyle;
  if (blurStyle == 0x8000000000000000)
  {
    v8 = a4;
    v9 = a3;
    objc_msgSend(v8, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");
    v12 = 19;
    if (v11 == 2)
      v12 = 20;
    v13 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIVibrancyEffectLegacyImpl__style[v12]);

    _UICoreMaterialUpdateVibrancyEffectDescriptorForMTMaterial(v13, self->_vibrancyStyle, v8, v9);
  }
  else
  {
    _UICoreMaterialUpdateVibrancyEffectDescriptor(blurStyle, self->_vibrancyStyle, a4, a3);
  }

}

- (_UIVibrancyEffectCoreMaterialImpl)initWithStyle:(int64_t)a3 vibrancyStyle:(int64_t)a4
{
  _UIVibrancyEffectCoreMaterialImpl *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIVibrancyEffectCoreMaterialImpl;
  result = -[_UIVibrancyEffectCoreMaterialImpl init](&v7, sel_init);
  if (result)
  {
    result->_blurStyle = a3;
    result->_vibrancyStyle = a4;
  }
  return result;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  int64_t blurStyle;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  blurStyle = self->_blurStyle;
  if (blurStyle != 0x8000000000000000)
  {
    if ((_UICoreMaterialStyleNeedsUpdateForEnvironmentChange(blurStyle, v8, v9) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)_UIVibrancyEffectCoreMaterialImpl;
    v11 = -[_UIVibrancyEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](&v13, sel__needsUpdateForTransitionFromEnvironment_toEnvironment_usage_, v8, v9, a5);
    goto LABEL_6;
  }
  if (self->_lightMaterial == self->_darkMaterial)
    goto LABEL_5;
LABEL_3:
  v11 = 1;
LABEL_6:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkMaterial, 0);
  objc_storeStrong((id *)&self->_lightMaterial, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  NSString *lightMaterial;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  char v12;
  int v13;
  NSString *darkMaterial;
  NSString *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    v6 = v5;
    if (v5[1] == (id)self->_blurStyle && v5[2] == (id)self->_vibrancyStyle)
    {
      lightMaterial = self->_lightMaterial;
      v8 = (NSString *)v5[3];
      v9 = lightMaterial;
      if (v8 == v9)
      {

        goto LABEL_14;
      }
      v10 = v9;
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v13 = -[NSString isEqual:](v8, "isEqual:", v9);

      if (v13)
      {
LABEL_14:
        darkMaterial = self->_darkMaterial;
        v8 = (NSString *)v6[4];
        v15 = darkMaterial;
        if (v8 == v15)
        {
          v12 = 1;
          v10 = v8;
        }
        else
        {
          v10 = v15;
          v12 = 0;
          if (v8 && v15)
            v12 = -[NSString isEqual:](v8, "isEqual:", v15);
        }
        goto LABEL_20;
      }
    }
    v12 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

- (_UIVibrancyEffectCoreMaterialImpl)initWithLightMaterial:(id)a3 darkMaterial:(id)a4 vibrancyStyle:(int64_t)a5
{
  id v8;
  id v9;
  _UIVibrancyEffectCoreMaterialImpl *v10;
  _UIVibrancyEffectCoreMaterialImpl *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIVibrancyEffectCoreMaterialImpl;
  v10 = -[_UIVibrancyEffectCoreMaterialImpl init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_blurStyle = 0x8000000000000000;
    v10->_vibrancyStyle = a5;
    if (v8)
      v12 = v8;
    else
      v12 = v9;
    objc_storeStrong((id *)&v10->_lightMaterial, v12);
    if (v9)
      v13 = v9;
    else
      v13 = v8;
    objc_storeStrong((id *)&v11->_darkMaterial, v13);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  if (self->_blurStyle != 0x8000000000000000)
  {
    v5 = v4;
    objc_msgSend(v4, "encodeInteger:forKey:", self->_vibrancyStyle, CFSTR("UIVibrancyEffectVibrancyStyle"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_blurStyle, CFSTR("UIVibrancyEffectBlurMaterialStyle"));
    v6 = 0;
    v7 = 0;
    _UIStyledEffectFallbackStylesForCoreMaterialStyle(self->_blurStyle, &v7, &v6);
    if (v7 != 0x8000000000000000)
      objc_msgSend(v5, "encodeInteger:forKey:", v7, CFSTR("UIVibrancyEffectBlurAutomaticStyle"));
    if (v6 != 0x8000000000000000)
      objc_msgSend(v5, "encodeInteger:forKey:", v6, CFSTR("UIVibrancyEffectBlurStyle"));
    v4 = v5;
  }

}

- (unint64_t)hash
{
  return self->_vibrancyStyle ^ self->_blurStyle;
}

- (int64_t)style
{
  return self->_blurStyle;
}

- (int64_t)vibrancyStyle
{
  return self->_vibrancyStyle;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

- (void)appendDescriptionTo:(id)a3
{
  id v4;
  void *v5;
  unint64_t vibrancyStyle;
  __CFString *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_blurStyle == 0x8000000000000000)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" lightMaterial=%@ darkMaterial=%@"), self->_lightMaterial, self->_darkMaterial);
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" style="));
    _UIStyledEffectConvertToString(self->_blurStyle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v5);

  }
  objc_msgSend(v8, "appendString:", CFSTR(" vibrancyStyle="));
  vibrancyStyle = self->_vibrancyStyle;
  if (vibrancyStyle >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%li)"), self->_vibrancyStyle);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E16B5038[vibrancyStyle];
  }
  objc_msgSend(v8, "appendString:", v7);

}

@end
