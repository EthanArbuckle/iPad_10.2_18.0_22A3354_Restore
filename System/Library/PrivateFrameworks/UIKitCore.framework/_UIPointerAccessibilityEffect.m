@implementation _UIPointerAccessibilityEffect

+ (id)_effectWithInputEffect:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;

  v3 = a3;
  objc_msgSend(v3, "preview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerEffect effectWithPreview:](_UIPointerAccessibilityEffect, "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPrefersScaledContent:", ((unint64_t)objc_msgSend(v3, "options") >> 5) & 1);
  isKindOfClass = 1;
  objc_msgSend(v5, "set_tintViewTakesOnPointerShape:", 1);
  if ((objc_msgSend(v3, "options") & 8) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_msgSend(v5, "set_tintViewUsesPointerMaterial:", isKindOfClass & 1);

  return v5;
}

+ (BOOL)shouldApplyAccessibilityEffect
{
  return _AXSPointerAllowAppCustomizationEnabled() == 0;
}

- (BOOL)prefersShadow
{
  int v3;
  objc_super v5;

  v3 = _AXSPointerEffectScalingEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPointerAccessibilityEffect;
    LOBYTE(v3) = -[UIPointerHoverEffect prefersShadow](&v5, sel_prefersShadow);
  }
  return v3;
}

- (BOOL)prefersScaledContent
{
  int v3;
  objc_super v5;

  v3 = _AXSPointerEffectScalingEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPointerAccessibilityEffect;
    LOBYTE(v3) = -[UIPointerHoverEffect prefersScaledContent](&v5, sel_prefersScaledContent);
  }
  return v3;
}

@end
