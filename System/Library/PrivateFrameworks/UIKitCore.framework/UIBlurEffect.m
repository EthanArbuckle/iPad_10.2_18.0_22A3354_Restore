@implementation UIBlurEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (UIBlurEffect)effectWithStyle:(UIBlurEffectStyle)style
{
  return (UIBlurEffect *)objc_msgSend(a1, "_effectWithStyle:tintColor:invertAutomaticStyle:", style, 0, 0);
}

- (BOOL)_canProvideVibrancyEffect
{
  return -[_UIBlurEffectImpl canProvideVibrancyEffect](self->_impl, "canProvideVibrancyEffect");
}

- (BOOL)_canProvideCoreMaterialVibrancyEffect
{
  return -[_UIBlurEffectImpl canProvideCoreMaterialVibrancyEffect](self->_impl, "canProvideCoreMaterialVibrancyEffect");
}

- (int64_t)_style
{
  return -[_UIBlurEffectImpl style](self->_impl, "style");
}

+ (id)_effectWithStyle:(int64_t)a3 tintColor:(id)a4 invertAutomaticStyle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _UIBlurEffectCoreMaterialImpl *v10;
  id v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 0x4B0 || (unint64_t)(a3 - 6) < 0xF || (unint64_t)(a3 - 1100) <= 2)
  {
    v10 = -[_UIBlurEffectCoreMaterialImpl initWithStyle:]([_UIBlurEffectCoreMaterialImpl alloc], "initWithStyle:", a3);
    v11 = objc_alloc((Class)a1);
  }
  else
  {
    v9 = objc_alloc((Class)a1);
    v10 = -[_UIBlurEffectLegacyImpl initWithStyle:tintColor:invertAutomaticStyle:]([_UIBlurEffectLegacyImpl alloc], "initWithStyle:tintColor:invertAutomaticStyle:", a3, v8, v5);
    v11 = v9;
  }
  v12 = (void *)objc_msgSend(v11, "_initWithImplementation:", v10);

  return v12;
}

- (id)_initWithImplementation:(id)a3
{
  id v5;
  UIBlurEffect *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIBlurEffect;
  v6 = -[UIBlurEffect init](&v9, sel_init);
  p_isa = (id *)&v6->super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    objc_msgSend(p_isa[1], "setEffect:", p_isa);
  }

  return p_isa;
}

- (BOOL)_invertAutomaticStyle
{
  return -[_UIBlurEffectImpl invertAutomaticStyle](self->_impl, "invertAutomaticStyle");
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return -[_UIBlurEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](self->_impl, "_needsUpdateForTransitionFromEnvironment:toEnvironment:usage:", a3, a4, a5);
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  _UIBlurEffectImpl *impl;
  id v9;
  id v10;

  v10 = a3;
  impl = self->_impl;
  v9 = a4;
  -[_UIBlurEffectImpl _updateEffectDescriptor:forEnvironment:usage:](impl, "_updateEffectDescriptor:forEnvironment:usage:", v10, v9, a5);
  LODWORD(impl) = objc_msgSend(v9, "allowsBlurring");

  if ((_DWORD)impl)
    objc_msgSend(v10, "setDisableInPlaceFiltering:", 1);
  if (a5 == 1)
  {
    objc_msgSend(v10, "setAllowsVibrancyInContent:", 1);
    objc_msgSend(v10, "setLayerHitTestsAsOpaque:", 1);
  }

}

- (int64_t)_expectedUsage
{
  return 1;
}

+ (id)_effectWithBlurRadius:(double)a3 scale:(double)a4
{
  id v6;
  _UIBlurEffectModernImpl *v7;
  void *v8;

  v6 = objc_alloc((Class)a1);
  v7 = -[_UIBlurEffectModernImpl initWithBlurRadius:scale:]([_UIBlurEffectModernImpl alloc], "initWithBlurRadius:scale:", a3, a4);
  v8 = (void *)objc_msgSend(v6, "_initWithImplementation:", v7);

  return v8;
}

+ (UIBlurEffect)effectWithBlurRadius:(double)a3
{
  id v4;
  _UIBlurEffectModernImpl *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  v5 = -[_UIBlurEffectModernImpl initWithBlurRadius:scale:]([_UIBlurEffectModernImpl alloc], "initWithBlurRadius:scale:", a3, 0.0);
  v6 = (void *)objc_msgSend(v4, "_initWithImplementation:", v5);

  return (UIBlurEffect *)v6;
}

- (id)effectSettings
{
  void *v3;
  void *v4;

  +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backdropSettingsForBlurStyle:", -[_UIBlurEffectImpl style](self->_impl, "style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)effectForUserInterfaceStyle:(int64_t)a3
{
  _UIBlurEffectImpl *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[_UIBlurEffectImpl implementationForUserInterfaceStyle:](self->_impl, "implementationForUserInterfaceStyle:");
  v5 = (_UIBlurEffectImpl *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_impl)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIBlurEffect;
    -[UIVisualEffect effectForUserInterfaceStyle:](&v9, sel_effectForUserInterfaceStyle_, a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithImplementation:", v5);
  }
  v7 = (void *)v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  void *v4;
  void *v5;

  if (!-[_UIBlurEffectImpl requiresCopying](self->_impl, "requiresCopying", a3))
    return self;
  v3 = objc_alloc((Class)objc_opt_class());
  v4 = (void *)-[_UIBlurEffectImpl copy](self->_impl, "copy");
  v5 = (void *)objc_msgSend(v3, "_initWithImplementation:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  UIBlurEffect *v4;
  id *p_isa;
  char v6;

  v4 = (UIBlurEffect *)a3;
  p_isa = (id *)&v4->super.super.isa;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && -[UIBlurEffect isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = objc_msgSend(p_isa[1], "isEqual:", self->_impl);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_effectWithTintColor:(id)a3
{
  return (id)objc_msgSend(a1, "_effectWithStyle:tintColor:invertAutomaticStyle:", 100, a3, 0);
}

+ (UIBlurEffect)effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4
{
  id v6;
  id v7;
  _UIBlurEffectVariableImpl *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v8 = -[_UIBlurEffectVariableImpl initWithBaseRadius:imageMask:scale:]([_UIBlurEffectVariableImpl alloc], "initWithBaseRadius:imageMask:scale:", v6, a3, 0.0);

  v9 = (void *)objc_msgSend(v7, "_initWithImplementation:", v8);
  return (UIBlurEffect *)v9;
}

+ (id)_effectWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_effectWithStyle:tintColor:invertAutomaticStyle:", a3, 0, a4);
}

+ (id)_effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4 scale:(double)a5
{
  id v8;
  id v9;
  _UIBlurEffectVariableImpl *v10;
  void *v11;

  v8 = a4;
  v9 = objc_alloc((Class)a1);
  v10 = -[_UIBlurEffectVariableImpl initWithBaseRadius:imageMask:scale:]([_UIBlurEffectVariableImpl alloc], "initWithBaseRadius:imageMask:scale:", v8, a3, a5);

  v11 = (void *)objc_msgSend(v9, "_initWithImplementation:", v10);
  return v11;
}

+ (id)_effectForLightMaterial:(id)a3 darkMaterial:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _UIBlurEffectCoreMaterialImpl *v13;

  v8 = a5;
  v9 = a4;
  _UICoreMaterialSanitizeMaterial(a3);
  v10 = objc_claimAutoreleasedReturnValue();
  _UICoreMaterialSanitizeMaterial(v9);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v10 | v11)
  {
    v13 = -[_UIBlurEffectCoreMaterialImpl initWithLightMaterial:darkMaterial:bundle:]([_UIBlurEffectCoreMaterialImpl alloc], "initWithLightMaterial:darkMaterial:bundle:", v10, v11, v8);
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_effectWithInfiniteRadius
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_UIBlurEffectAverageImpl sharedInstance](_UIBlurEffectAverageImpl, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithImplementation:", v3);

  return v4;
}

+ (id)_effectWithInfiniteRadiusScale:(double)a3
{
  id v4;
  _UIBlurEffectAverageImpl *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  v5 = -[_UIBlurEffectAverageImpl initWithScale:]([_UIBlurEffectAverageImpl alloc], "initWithScale:", a3);
  v6 = (void *)objc_msgSend(v4, "_initWithImplementation:", v5);

  return v6;
}

- (UIBlurEffect)init
{
  uint64_t v3;
  _UIBlurEffectModernImpl *v4;
  _UIBlurEffectModernImpl *v5;
  UIBlurEffect *v6;

  v3 = -[UIBlurEffect methodForSelector:](self, "methodForSelector:", sel_effectSettings);
  if (v3 == +[UIBlurEffect instanceMethodForSelector:](UIBlurEffect, "instanceMethodForSelector:", sel_effectSettings))v4 = -[_UIBlurEffectModernImpl initWithBlurRadius:scale:]([_UIBlurEffectModernImpl alloc], "initWithBlurRadius:scale:", 0.0, 0.0);
  else
    v4 = -[_UIBlurEffectLegacyImpl initWithStyle:tintColor:invertAutomaticStyle:]([_UIBlurEffectLegacyImpl alloc], "initWithStyle:tintColor:invertAutomaticStyle:", 0x8000000000000000, 0, 0);
  v5 = v4;
  v6 = -[UIBlurEffect _initWithImplementation:](self, "_initWithImplementation:", v4);

  return v6;
}

- (UIBlurEffect)initWithCoder:(id)a3
{
  id v4;
  UIBlurEffect *v5;
  uint64_t v6;
  _UIBlurEffectImpl *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIBlurEffect;
  v5 = -[UIVisualEffect initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    +[_UIBlurEffectImpl implementationFromCoder:](_UIBlurEffectImpl, "implementationFromCoder:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    impl = v5->_impl;
    v5->_impl = (_UIBlurEffectImpl *)v6;

    -[_UIBlurEffectImpl setEffect:](v5->_impl, "setEffect:", v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIBlurEffect;
  v4 = a3;
  -[UIVisualEffect encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[_UIBlurEffectImpl encodeWithCoder:](self->_impl, "encodeWithCoder:", v4, v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[_UIBlurEffectImpl hash](self->_impl, "hash");
}

- (UIColor)_tintColor
{
  return (UIColor *)-[_UIBlurEffectImpl tintColor](self->_impl, "tintColor");
}

- (BOOL)_isATVStyle
{
  return -[_UIBlurEffectImpl style](self->_impl, "style") > 3999;
}

- (BOOL)_isAutomaticStyle
{
  int64_t v2;
  BOOL result;

  v2 = -[_UIBlurEffectImpl style](self->_impl, "style");
  result = 1;
  if ((unint64_t)(v2 - 4) >= 2 && v2 != 1000)
    return v2 > 4999;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIBlurEffect;
  -[UIBlurEffect description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIBlurEffectImpl appendDescriptionTo:](self->_impl, "appendDescriptionTo:", v4);
  return v4;
}

@end
