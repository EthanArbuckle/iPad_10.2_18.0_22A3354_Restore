@implementation _UIBlurEffectImpl

- (BOOL)canProvideCoreMaterialVibrancyEffect
{
  return 0;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "allowsDithering");
  if (v8 == objc_msgSend(v7, "allowsDithering")
    && (v9 = objc_msgSend(v6, "allowsBlurring"), v9 == objc_msgSend(v7, "allowsBlurring"))
    && (v10 = objc_msgSend(v6, "reducedTransperancy"), v10 == objc_msgSend(v7, "reducedTransperancy")))
  {
    objc_msgSend(v6, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");
    objc_msgSend(v7, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14 != objc_msgSend(v15, "userInterfaceIdiom");

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)requiresCopying
{
  return 0;
}

- (BOOL)canProvideVibrancyEffect
{
  return 0;
}

+ (id)implementationFromCoder:(id)a3
{
  id v3;
  _UIBlurEffectCoreMaterialImpl *v4;
  const __CFString *v5;
  _UIBlurEffectVariableImpl *v6;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("UIBlurEffectMaterialStyle")))
  {
    v4 = -[_UIBlurEffectCoreMaterialImpl initWithStyle:]([_UIBlurEffectCoreMaterialImpl alloc], "initWithStyle:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UIBlurEffectMaterialStyle")));
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("UIBlurEffectAutomaticStyle")))
  {
    v5 = CFSTR("UIBlurEffectAutomaticStyle");
LABEL_7:
    v4 = -[_UIBlurEffectLegacyImpl initWithStyle:tintColor:invertAutomaticStyle:]([_UIBlurEffectLegacyImpl alloc], "initWithStyle:tintColor:invertAutomaticStyle:", objc_msgSend(v3, "decodeIntegerForKey:", v5), 0, 0);
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("UIBlurEffectStyle")))
  {
    v5 = CFSTR("UIBlurEffectStyle");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("UIBlurEffectInfiniteRadius")))
  {
    +[_UIBlurEffectAverageImpl sharedInstance](_UIBlurEffectAverageImpl, "sharedInstance");
    v4 = (_UIBlurEffectCoreMaterialImpl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("UIBlurEffectRadius"));
    v9 = v8;
    objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("UIBlurEffectScale"));
    v11 = v10;
    if (objc_msgSend(v3, "containsValueForKey:", CFSTR("UIBlurEffectImageMask")))
    {
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIBlurEffectImageMask"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[_UIBlurEffectVariableImpl initWithBaseRadius:imageMask:scale:]([_UIBlurEffectVariableImpl alloc], "initWithBaseRadius:imageMask:scale:", v12, v9, v11);

      goto LABEL_9;
    }
    v4 = -[_UIBlurEffectModernImpl initWithBlurRadius:scale:]([_UIBlurEffectModernImpl alloc], "initWithBlurRadius:scale:", v9, v11);
  }
LABEL_8:
  v6 = (_UIBlurEffectVariableImpl *)v4;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBlurEffect.m"), 428, CFSTR("Subclass must implement"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBlurEffect.m"), 434, CFSTR("Subclass must implement"));

  return 0;
}

- (int64_t)style
{
  return 0x8000000000000000;
}

- (id)tintColor
{
  return 0;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

@end
