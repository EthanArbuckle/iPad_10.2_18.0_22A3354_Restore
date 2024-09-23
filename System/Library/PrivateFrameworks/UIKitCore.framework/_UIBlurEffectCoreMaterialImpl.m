@implementation _UIBlurEffectCoreMaterialImpl

- (BOOL)canProvideVibrancyEffect
{
  return self->_style != 0x8000000000000000;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)canProvideCoreMaterialVibrancyEffect
{
  return self->_style != 0x8000000000000000;
}

- (_UIBlurEffectCoreMaterialImpl)initWithStyle:(int64_t)a3
{
  _UIBlurEffectCoreMaterialImpl *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBlurEffectCoreMaterialImpl;
  result = -[_UIBlurEffectCoreMaterialImpl init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_darkMaterial, 0);
  objc_storeStrong((id *)&self->_lightMaterial, 0);
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  int64_t style;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  style = self->_style;
  if (style != 0x8000000000000000)
  {
    if ((_UICoreMaterialStyleNeedsUpdateForEnvironmentChange(style, v8, v9) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)_UIBlurEffectCoreMaterialImpl;
    v11 = -[_UIBlurEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](&v13, sel__needsUpdateForTransitionFromEnvironment_toEnvironment_usage_, v8, v9, a5);
    goto LABEL_6;
  }
  if (self->_lightMaterial == self->_darkMaterial)
    goto LABEL_5;
LABEL_3:
  v11 = 1;
LABEL_6:

  return v11;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  int64_t style;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  style = self->_style;
  v8 = a4;
  v13 = a3;
  if (style == 0x8000000000000000)
  {
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");
    v11 = 10;
    if (v10 == 2)
      v11 = 11;
    v12 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIBlurEffectLegacyImpl__style[v11]);

    _UICoreMaterialUpdateBlurEffectDescriptorForMTMaterial(v12, self->_bundle, v8, v13);
  }
  else
  {
    _UICoreMaterialUpdateBlurEffectDescriptor(style, v8, v13);
  }

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
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (id *)v4;
    v6 = v5;
    if (v5[1] == (id)self->_style)
    {
      lightMaterial = self->_lightMaterial;
      v8 = (NSString *)v5[2];
      v9 = lightMaterial;
      if (v8 == v9)
      {

        goto LABEL_13;
      }
      v10 = v9;
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v13 = -[NSString isEqual:](v8, "isEqual:", v9);

      if (v13)
      {
LABEL_13:
        darkMaterial = self->_darkMaterial;
        v8 = (NSString *)v6[3];
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
        goto LABEL_19;
      }
    }
    v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  style = self->_style;
  v4 = a3;
  if (style != 0x8000000000000000)
  {
    v6 = 0;
    v7 = 0;
    v5 = v4;
    objc_msgSend(v4, "encodeInteger:forKey:", style, CFSTR("UIBlurEffectMaterialStyle"));
    _UIStyledEffectFallbackStylesForCoreMaterialStyle(style, &v7, &v6);
    if (v7 != 0x8000000000000000)
      objc_msgSend(v5, "encodeInteger:forKey:", v7, CFSTR("UIBlurEffectAutomaticStyle"));
    if (v6 != 0x8000000000000000)
      objc_msgSend(v5, "encodeInteger:forKey:", v6, CFSTR("UIBlurEffectStyle"));
    v4 = v5;
  }

}

- (_UIBlurEffectCoreMaterialImpl)initWithLightMaterial:(id)a3 darkMaterial:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIBlurEffectCoreMaterialImpl *v11;
  _UIBlurEffectCoreMaterialImpl *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIBlurEffectCoreMaterialImpl;
  v11 = -[_UIBlurEffectCoreMaterialImpl init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_style = 0x8000000000000000;
    if (v8)
      v13 = v8;
    else
      v13 = v9;
    objc_storeStrong((id *)&v11->_lightMaterial, v13);
    if (v9)
      v14 = v9;
    else
      v14 = v8;
    objc_storeStrong((id *)&v12->_darkMaterial, v14);
    objc_storeStrong((id *)&v12->_bundle, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_style;
}

- (id)tintColor
{
  return 0;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

- (void)appendDescriptionTo:(id)a3
{
  int64_t style;
  NSString *lightMaterial;
  NSString *darkMaterial;
  id v6;
  id v7;

  style = self->_style;
  if (style == 0x8000000000000000)
  {
    lightMaterial = self->_lightMaterial;
    darkMaterial = self->_darkMaterial;
    v7 = a3;
    objc_msgSend(v7, "appendFormat:", CFSTR(" lightMaterial=%@ darkMaterial=%@"), lightMaterial, darkMaterial);
  }
  else
  {
    v6 = a3;
    _UIStyledEffectConvertToString(style);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" style=%@"), v7);

  }
}

@end
