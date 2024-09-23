@implementation UIVisualEffect

+ (id)_effectCopyingFromCaptureGroup:(id)a3
{
  return +[_UICopyEffect copyEffectWithCaptureGroup:](_UICopyEffect, "copyEffectWithCaptureGroup:", a3);
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return 0;
}

+ (id)effectCombiningEffects:(id)a3
{
  id v4;
  uint64_t v5;
  _UICompoundEffect *v6;
  _UICompoundEffect *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 == 1)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (_UICompoundEffect *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    v6 = -[_UICompoundEffect initWithEffects:]([_UICompoundEffect alloc], "initWithEffects:", v4);
  }
  else
  {
    objc_msgSend(a1, "emptyEffect");
    v6 = (_UICompoundEffect *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_enumerateEffects:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, UIVisualEffect *, char *))a3 + 2))(a3, self, &v3);
}

+ (id)emptyEffect
{
  if (qword_1ECD7A878 != -1)
    dispatch_once(&qword_1ECD7A878, &__block_literal_global_40);
  return (id)_MergedGlobals_5_0;
}

+ (id)effectCompositingColor:(id)a3 withMode:(int64_t)a4 alpha:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a3;
  _UIVisualEffectNewOverlay(a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setColor:", v8);
    v11 = v10;
  }
  else
  {
    objc_msgSend(a1, "emptyEffect");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

void __29__UIVisualEffect_emptyEffect__block_invoke()
{
  _UIEmptyEffect *v0;
  void *v1;

  v0 = objc_alloc_init(_UIEmptyEffect);
  v1 = (void *)_MergedGlobals_5_0;
  _MergedGlobals_5_0 = (uint64_t)v0;

}

+ (id)effectCompositingImage:(id)a3
{
  return (id)objc_msgSend(a1, "effectCompositingImage:withMode:alpha:", a3, 0, 1.0);
}

+ (id)effectCompositingColor:(id)a3
{
  return (id)objc_msgSend(a1, "effectCompositingColor:withMode:alpha:", a3, 0, 1.0);
}

+ (id)effectCompositingImage:(id)a3 withMode:(int64_t)a4 alpha:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a3;
  _UIVisualEffectNewOverlay(a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setImage:", v8);
    v11 = v10;
  }
  else
  {
    objc_msgSend(a1, "emptyEffect");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBackdropViewSettings)effectSettings
{
  return 0;
}

- (BOOL)_isATVStyle
{
  return 0;
}

- (BOOL)_isAutomaticStyle
{
  return 0;
}

- (_UIVisualEffectConfig)effectConfig
{
  return 0;
}

- (id)effectConfigForQuality:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffect.m"), 361, CFSTR("UIVisualEffect subclass must override %@"), v6);

  return 0;
}

- (id)_allEffects
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_selectorOverridden:(SEL)a3
{
  uint64_t v4;

  v4 = -[UIVisualEffect methodForSelector:](self, "methodForSelector:");
  return v4 != +[UIVisualEffect instanceMethodForSelector:](UIVisualEffect, "instanceMethodForSelector:", a3);
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (-[UIVisualEffect _selectorOverridden:](self, "_selectorOverridden:", sel_effectSettings))
  {
    +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffect effectSettings](self, "effectSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applyBackdropSettings:toEffectDescriptor:environment:", v9, v11, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (-[UIVisualEffect _selectorOverridden:](self, "_selectorOverridden:", sel_effectConfigForQuality_))
  {
    +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffect effectConfigForQuality:](self, "effectConfigForQuality:", objc_msgSend(v9, "_graphicsQuality"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applyVibrancyConfig:toEffectDescriptor:", v10, v11);

    goto LABEL_7;
  }
  if (-[UIVisualEffect _selectorOverridden:](self, "_selectorOverridden:", sel_effectConfig))
  {
    +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffect effectConfig](self, "effectConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applyVibrancyConfig:toEffectDescriptor:", v9, v11);
    goto LABEL_7;
  }
LABEL_8:

}

- (int64_t)_expectedUsage
{
  if (-[UIVisualEffect _selectorOverridden:](self, "_selectorOverridden:", sel_effectSettings))
    return 1;
  if (-[UIVisualEffect _selectorOverridden:](self, "_selectorOverridden:", sel_effectConfigForQuality_))
    return 2;
  if (-[UIVisualEffect _selectorOverridden:](self, "_selectorOverridden:", sel_effectConfig))
    return 2;
  return 0;
}

@end
