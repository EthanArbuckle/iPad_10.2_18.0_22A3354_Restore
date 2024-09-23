@implementation UIVibrancyEffect

- (int64_t)_expectedUsage
{
  return 2;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  -[_UIVibrancyEffectImpl _updateEffectDescriptor:forEnvironment:usage:](self->_impl, "_updateEffectDescriptor:forEnvironment:usage:", a3, a4, a5);
}

+ (UIVibrancyEffect)effectForBlurEffect:(UIBlurEffect *)blurEffect
{
  UIBlurEffect *v4;
  _UIVibrancyEffectCoreMaterialImpl *v5;
  _UIVibrancyEffectCoreMaterialImpl *v6;
  void *v7;

  v4 = blurEffect;
  if (-[UIBlurEffect _canProvideVibrancyEffect](v4, "_canProvideVibrancyEffect"))
  {
    if (-[UIBlurEffect _canProvideCoreMaterialVibrancyEffect](v4, "_canProvideCoreMaterialVibrancyEffect"))
      v5 = -[_UIVibrancyEffectCoreMaterialImpl initWithStyle:vibrancyStyle:]([_UIVibrancyEffectCoreMaterialImpl alloc], "initWithStyle:vibrancyStyle:", -[UIBlurEffect _style](v4, "_style"), 1);
    else
      v5 = -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:]([_UIVibrancyEffectLegacyImpl alloc], "initWithStyle:invertAutomaticStyle:", -[UIBlurEffect _style](v4, "_style"), -[UIBlurEffect _invertAutomaticStyle](v4, "_invertAutomaticStyle"));
  }
  else
  {
    v5 = -[_UIVibrancyEffectModernCompositedImpl initWithCompositingMode:compositingColor:]([_UIVibrancyEffectModernCompositedImpl alloc], "initWithCompositingMode:compositingColor:", 24, 0);
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v5);

  return (UIVibrancyEffect *)v7;
}

+ (UIVibrancyEffect)effectForBlurEffect:(UIBlurEffect *)blurEffect style:(UIVibrancyEffectStyle)style
{
  UIBlurEffect *v6;
  _UIVibrancyEffectCoreMaterialImpl *v7;
  void *v8;

  v6 = blurEffect;
  if (-[UIBlurEffect _canProvideVibrancyEffect](v6, "_canProvideVibrancyEffect")
    && -[UIBlurEffect _canProvideCoreMaterialVibrancyEffect](v6, "_canProvideCoreMaterialVibrancyEffect"))
  {
    v7 = -[_UIVibrancyEffectCoreMaterialImpl initWithStyle:vibrancyStyle:]([_UIVibrancyEffectCoreMaterialImpl alloc], "initWithStyle:vibrancyStyle:", -[UIBlurEffect _style](v6, "_style"), style);
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v7);

  }
  else
  {
    objc_msgSend(a1, "effectForBlurEffect:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIVibrancyEffect *)v8;
}

- (id)_initWithImplementation:(id)a3
{
  id v5;
  UIVibrancyEffect *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIVibrancyEffect;
  v6 = -[UIVibrancyEffect init](&v9, sel_init);
  p_isa = (id *)&v6->super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    objc_msgSend(p_isa[1], "setEffect:", p_isa);
  }

  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return -[_UIVibrancyEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](self->_impl, "_needsUpdateForTransitionFromEnvironment:toEnvironment:usage:", a3, a4, a5);
}

- (UIVibrancyEffect)init
{
  uint64_t v3;
  uint64_t v4;
  _UIVibrancyEffectLegacyImpl *v5;
  UIVibrancyEffect *v6;
  _UIVibrancyEffectModernVibrancyImpl *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[UIVibrancyEffect methodForSelector:](self, "methodForSelector:", sel_effectConfig);
  if (v3 == +[UIVibrancyEffect instanceMethodForSelector:](UIVibrancyEffect, "instanceMethodForSelector:", sel_effectConfig)&& (v4 = -[UIVibrancyEffect methodForSelector:](self, "methodForSelector:", sel_effectConfigForQuality_), v4 == +[UIVibrancyEffect instanceMethodForSelector:](UIVibrancyEffect, "instanceMethodForSelector:", sel_effectConfigForQuality_)))
  {
    v8 = [_UIVibrancyEffectModernVibrancyImpl alloc];
    v9 = *MEMORY[0x1E0CD2F20];
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:](v8, "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", v9, v10, v11, v12, 0);

  }
  else
  {
    v5 = -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:]([_UIVibrancyEffectLegacyImpl alloc], "initWithStyle:invertAutomaticStyle:", 0x8000000000000000, 0);
  }
  v6 = -[UIVibrancyEffect _initWithImplementation:](self, "_initWithImplementation:", v5);

  return v6;
}

+ (id)_effectForBlurEffect:(id)a3 vibrancyStyle:(int64_t)a4
{
  return (id)objc_msgSend(a1, "effectForBlurEffect:style:", a3, _UIVibrancyStyleConvertToPublic(a4));
}

- (BOOL)isEqual:(id)a3
{
  UIVibrancyEffect *v4;
  id *p_isa;
  char v6;

  v4 = (UIVibrancyEffect *)a3;
  p_isa = (id *)&v4->super.super.isa;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && -[UIVibrancyEffect isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = objc_msgSend(p_isa[1], "isEqual:", self->_impl);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)effectConfigForReducedTransperancy:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  _AXSEnhanceBackgroundContrastEnabled();
  if (v3)
  {
    -[UIVibrancyEffect _reduceTransparencyEffectConfig](self, "_reduceTransparencyEffectConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVibrancyEffect effectConfigForQuality:](self, "effectConfigForQuality:", objc_msgSend(v6, "_graphicsQuality"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_vibrantEffectWithLightCAColorMatrix:(CAColorMatrix *)a3 darkCAColorMatrix:(CAColorMatrix *)a4 alpha:(double)a5
{
  _UIVibrancyEffectVibrantColorMatrixImpl *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _UIVibrancyEffectVibrantColorMatrixImpl *v14;
  void *v15;
  _OWORD v17[5];
  _OWORD v18[5];

  v9 = [_UIVibrancyEffectVibrantColorMatrixImpl alloc];
  v10 = *(_OWORD *)&a3->m33;
  v18[2] = *(_OWORD *)&a3->m24;
  v18[3] = v10;
  v18[4] = *(_OWORD *)&a3->m42;
  v11 = *(_OWORD *)&a3->m15;
  v18[0] = *(_OWORD *)&a3->m11;
  v18[1] = v11;
  v12 = *(_OWORD *)&a4->m33;
  v17[2] = *(_OWORD *)&a4->m24;
  v17[3] = v12;
  v17[4] = *(_OWORD *)&a4->m42;
  v13 = *(_OWORD *)&a4->m15;
  v17[0] = *(_OWORD *)&a4->m11;
  v17[1] = v13;
  v14 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithLightCAColorMatrix:darkCAColorMatrix:alpha:](v9, "initWithLightCAColorMatrix:darkCAColorMatrix:alpha:", v18, v17, a5);
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v14);

  return v15;
}

+ (id)darkVibrantEffectWithDodgeColor:(id)a3 lightenColor:(id)a4 compositingColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIVibrancyEffectModernVibrancyImpl *v11;
  _UIVibrancyEffectModernVibrancyImpl *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  v12 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:](v11, "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", *MEMORY[0x1E0CD2F20], v10, v9, v8, 0);

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v12);
  return v13;
}

+ (id)lightVibrantEffectWithBurnColor:(id)a3 darkenColor:(id)a4 compositingColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIVibrancyEffectModernVibrancyImpl *v11;
  _UIVibrancyEffectModernVibrancyImpl *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  v12 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:](v11, "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", *MEMORY[0x1E0CD2F18], v10, v9, v8, 0);

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v12);
  return v13;
}

+ (id)vibrantEffectWithCompositingMode:(int64_t)a3 compositingColor:(id)a4
{
  id v6;
  _UIVibrancyEffectModernCompositedImpl *v7;
  void *v8;

  v6 = a4;
  v7 = -[_UIVibrancyEffectModernCompositedImpl initWithCompositingMode:compositingColor:]([_UIVibrancyEffectModernCompositedImpl alloc], "initWithCompositingMode:compositingColor:", a3, v6);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v7);
  return v8;
}

+ (id)_darkVibrantEffectWithLightenColor:(id)a3 dodgeColor:(id)a4 compositingColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIVibrancyEffectModernVibrancyImpl *v11;
  _UIVibrancyEffectModernVibrancyImpl *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  v12 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:](v11, "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", *MEMORY[0x1E0CD2F20], v9, v10, v8, 1);

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v12);
  return v13;
}

+ (id)_lightVibrantEffectWithDarkenColor:(id)a3 burnColor:(id)a4 compositingColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIVibrancyEffectModernVibrancyImpl *v11;
  _UIVibrancyEffectModernVibrancyImpl *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  v12 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:](v11, "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", *MEMORY[0x1E0CD2F18], v9, v10, v8, 1);

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v12);
  return v13;
}

+ (id)_vibrantEffectWithCAColorMatrix:(CAColorMatrix *)a3 alpha:(double)a4
{
  _UIVibrancyEffectVibrantColorMatrixImpl *v7;
  __int128 v8;
  __int128 v9;
  _UIVibrancyEffectVibrantColorMatrixImpl *v10;
  void *v11;
  _OWORD v13[5];

  v7 = [_UIVibrancyEffectVibrantColorMatrixImpl alloc];
  v8 = *(_OWORD *)&a3->m33;
  v13[2] = *(_OWORD *)&a3->m24;
  v13[3] = v8;
  v13[4] = *(_OWORD *)&a3->m42;
  v9 = *(_OWORD *)&a3->m15;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v9;
  v10 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithCAColorMatrix:alpha:](v7, "initWithCAColorMatrix:alpha:", v13, a4);
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v10);

  return v11;
}

+ (id)_vibrantShadowEffect
{
  _OWORD v3[5];

  v3[0] = xmmword_186678D90;
  v3[1] = xmmword_186678DA0;
  v3[2] = xmmword_186678DB0;
  v3[3] = xmmword_186678DC0;
  v3[4] = xmmword_186678DD0;
  objc_msgSend(a1, "_vibrantEffectWithCAColorMatrix:alpha:", v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vibrantMediumShadowEffect
{
  _UIVibrancyEffectVibrantColorMatrixImpl *v3;
  void *v4;

  v3 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithSystemName:]([_UIVibrancyEffectVibrantColorMatrixImpl alloc], "initWithSystemName:", 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v3);

  return v4;
}

+ (id)vibrantHeavyShadowEffect
{
  _UIVibrancyEffectVibrantColorMatrixImpl *v3;
  void *v4;

  v3 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithSystemName:]([_UIVibrancyEffectVibrantColorMatrixImpl alloc], "initWithSystemName:", 2);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v3);

  return v4;
}

+ (id)vibrantChromeShadowEffect
{
  _UIVibrancyEffectVibrantColorMatrixImpl *v3;
  void *v4;

  v3 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithSystemName:]([_UIVibrancyEffectVibrantColorMatrixImpl alloc], "initWithSystemName:", 3);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v3);

  return v4;
}

+ (id)_vibrantEffectForLightMaterial:(id)a3 darkMaterial:(id)a4 vibrancyStyle:(int64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _UIVibrancyEffectCoreMaterialImpl *v12;

  v8 = a4;
  _UICoreMaterialSanitizeMaterial(a3);
  v9 = objc_claimAutoreleasedReturnValue();
  _UICoreMaterialSanitizeMaterial(v8);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v9 | v10)
  {
    v12 = -[_UIVibrancyEffectCoreMaterialImpl initWithLightMaterial:darkMaterial:vibrancyStyle:]([_UIVibrancyEffectCoreMaterialImpl alloc], "initWithLightMaterial:darkMaterial:vibrancyStyle:", v9, v10, _UIVibrancyStyleConvertToPublic(a5));
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_effectWithStyle:(int64_t)a3 ignoreSimpleVibrancy:(BOOL)a4
{
  _UIVibrancyEffectLegacyImpl *v5;
  void *v6;

  v5 = -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:ignoreSimpleVibrancy:]([_UIVibrancyEffectLegacyImpl alloc], "initWithStyle:invertAutomaticStyle:ignoreSimpleVibrancy:", a3, 0, a4);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImplementation:", v5);

  return v6;
}

- (id)_effectReplacingTintColor:(id)a3
{
  _UIVibrancyEffectImpl *v4;
  UIVibrancyEffect *v5;
  UIVibrancyEffect *v6;

  if (a3)
  {
    -[_UIVibrancyEffectImpl implementationReplacingTintColor:](self->_impl, "implementationReplacingTintColor:");
    v4 = (_UIVibrancyEffectImpl *)objc_claimAutoreleasedReturnValue();
    if (self->_impl == v4)
      v5 = self;
    else
      v5 = (UIVibrancyEffect *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithImplementation:", v4);
    v6 = v5;

  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (UIVibrancyEffect)initWithCoder:(id)a3
{
  id v4;
  UIVibrancyEffect *v5;
  uint64_t v6;
  _UIVibrancyEffectImpl *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIVibrancyEffect;
  v5 = -[UIVisualEffect initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    +[_UIVibrancyEffectImpl implementationFromCoder:](_UIVibrancyEffectImpl, "implementationFromCoder:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    impl = v5->_impl;
    v5->_impl = (_UIVibrancyEffectImpl *)v6;

    -[_UIVibrancyEffectImpl setEffect:](v5->_impl, "setEffect:", v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIVibrancyEffect;
  v4 = a3;
  -[UIVisualEffect encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[_UIVibrancyEffectImpl encodeWithCoder:](self->_impl, "encodeWithCoder:", v4, v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[_UIVibrancyEffectImpl hash](self->_impl, "hash");
}

- (id)_reduceTransparencyEffectConfig
{
  void *v3;
  void *v4;

  +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vibrancyConfigForReducedTransperancyVibrancyStyle:", -[_UIVibrancyEffectImpl style](self->_impl, "style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)effectConfigForQuality:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;

  +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIVibrancyEffectImpl style](self->_impl, "style");
  if (a3 == 10)
    objc_msgSend(v5, "vibrancyConfigForLowQualityVibrancyStyle:", v6);
  else
    objc_msgSend(v5, "vibrancyConfigForHighQualityVibrancyStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)effectConfig
{
  return -[UIVibrancyEffect effectConfigForReducedTransperancy:](self, "effectConfigForReducedTransperancy:", 0);
}

+ (id)_vibrancyEntryWithType:(id)a3 inputColor1:(id)a4 inputColor2:(id)a5 inputReversed:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _UIVisualEffectFilterEntry *v16;
  _UIVisualEffectFilterEntry *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v6 = a6;
  v20[3] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("inputColor0");
  v9 = objc_retainAutorelease(a4);
  v10 = a5;
  v11 = a3;
  v20[0] = objc_msgSend(v9, "CGColor");
  v19[1] = CFSTR("inputColor1");
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "CGColor");

  v20[1] = v13;
  v19[2] = CFSTR("inputReversed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [_UIVisualEffectFilterEntry alloc];
  v17 = -[_UIVisualEffectFilterEntry initWithFilterType:configurationValues:requestedValues:identityValues:](v16, "initWithFilterType:configurationValues:requestedValues:identityValues:", v11, v15, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);

  return v17;
}

- (BOOL)_isATVStyle
{
  return -[_UIVibrancyEffectImpl style](self->_impl, "style") > 3999;
}

- (BOOL)_isAutomaticStyle
{
  int64_t v2;
  BOOL result;

  v2 = -[_UIVibrancyEffectImpl style](self->_impl, "style");
  result = 1;
  if ((unint64_t)(v2 - 4) >= 2 && v2 != 1000)
    return v2 > 4999;
  return result;
}

- (id)effectForUserInterfaceStyle:(int64_t)a3
{
  _UIVibrancyEffectImpl *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[_UIVibrancyEffectImpl implementationForUserInterfaceStyle:](self->_impl, "implementationForUserInterfaceStyle:");
  v5 = (_UIVibrancyEffectImpl *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_impl)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIVibrancyEffect;
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

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIVibrancyEffect;
  -[UIVibrancyEffect description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIVibrancyEffectImpl appendDescriptionTo:](self->_impl, "appendDescriptionTo:", v4);
  return v4;
}

- (int64_t)_blurStyle
{
  return -[_UIVibrancyEffectImpl style](self->_impl, "style");
}

- (int64_t)_vibrancyStyle
{
  return -[_UIVibrancyEffectImpl vibrancyStyle](self->_impl, "vibrancyStyle");
}

@end
