@implementation UIPointerHoverEffect

- (UIPointerHoverEffect)init
{
  UIPointerHoverEffect *v2;
  UIPointerHoverEffect *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPointerHoverEffect;
  v2 = -[UIPointerHoverEffect init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIPointerHoverEffect setPreferredTintMode:](v2, "setPreferredTintMode:", 1);
    -[UIPointerHoverEffect setPrefersScaledContent:](v3, "setPrefersScaledContent:", 1);
  }
  return v3;
}

- (unint64_t)options
{
  UIPointerEffectTintMode v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[UIPointerHoverEffect preferredTintMode](self, "preferredTintMode");
  v4 = 9;
  if (v3 != UIPointerEffectTintModeUnderlay)
    v4 = 1;
  if (v3 == UIPointerEffectTintModeOverlay)
    v5 = 5;
  else
    v5 = v4;
  if (-[UIPointerHoverEffect prefersShadow](self, "prefersShadow"))
    v5 |= 0x10uLL;
  if (-[UIPointerHoverEffect prefersScaledContent](self, "prefersScaledContent"))
    v5 |= 0x20uLL;
  if (-[UIPointerHoverEffect _tintViewTakesOnPointerShape](self, "_tintViewTakesOnPointerShape"))
    v5 |= 0xC00uLL;
  if (-[UIPointerHoverEffect _tintViewUsesPointerMaterial](self, "_tintViewUsesPointerMaterial"))
    return v5 & 0xFFFFFFFFFFFFBFF3 | 0x4008;
  else
    return v5;
}

- (unint64_t)constrainedAxes
{
  return 0;
}

- (id)settings
{
  void *v2;
  void *v3;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hoverEffectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPointerHoverEffect;
  v4 = -[UIPointerEffect copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPreferredTintMode:", -[UIPointerHoverEffect preferredTintMode](self, "preferredTintMode"));
  objc_msgSend(v4, "setPrefersScaledContent:", -[UIPointerHoverEffect prefersScaledContent](self, "prefersScaledContent"));
  objc_msgSend(v4, "setPrefersShadow:", -[UIPointerHoverEffect prefersShadow](self, "prefersShadow"));
  objc_msgSend(v4, "set_tintViewTakesOnPointerShape:", -[UIPointerHoverEffect _tintViewTakesOnPointerShape](self, "_tintViewTakesOnPointerShape"));
  objc_msgSend(v4, "set_tintViewUsesPointerMaterial:", -[UIPointerHoverEffect _tintViewUsesPointerMaterial](self, "_tintViewUsesPointerMaterial"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIPointerHoverEffect;
  if (-[UIPointerEffect isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "preferredTintMode");
    if (v6 == -[UIPointerHoverEffect preferredTintMode](self, "preferredTintMode")
      && (v7 = objc_msgSend(v5, "prefersScaledContent"),
          v7 == -[UIPointerHoverEffect prefersScaledContent](self, "prefersScaledContent"))
      && (v8 = objc_msgSend(v5, "prefersShadow"), v8 == -[UIPointerHoverEffect prefersShadow](self, "prefersShadow"))
      && (v9 = objc_msgSend(v5, "_tintViewTakesOnPointerShape"),
          v9 == -[UIPointerHoverEffect _tintViewTakesOnPointerShape](self, "_tintViewTakesOnPointerShape")))
    {
      v12 = objc_msgSend(v5, "_tintViewUsesPointerMaterial");
      v10 = v12 ^ -[UIPointerHoverEffect _tintViewUsesPointerMaterial](self, "_tintViewUsesPointerMaterial") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  UIPointerEffectTintMode v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIPointerHoverEffect;
  v3 = -[UIPointerEffect hash](&v9, sel_hash);
  v4 = -[UIPointerHoverEffect preferredTintMode](self, "preferredTintMode");
  v5 = v4 ^ -[UIPointerHoverEffect prefersScaledContent](self, "prefersScaledContent");
  v6 = v5 ^ -[UIPointerHoverEffect prefersShadow](self, "prefersShadow");
  v7 = v6 ^ -[UIPointerHoverEffect _tintViewTakesOnPointerShape](self, "_tintViewTakesOnPointerShape") ^ v3;
  return v7 ^ -[UIPointerHoverEffect _tintViewUsesPointerMaterial](self, "_tintViewUsesPointerMaterial");
}

- (UIPointerEffectTintMode)preferredTintMode
{
  return self->_preferredTintMode;
}

- (void)setPreferredTintMode:(UIPointerEffectTintMode)preferredTintMode
{
  self->_preferredTintMode = preferredTintMode;
}

- (BOOL)prefersShadow
{
  return self->_prefersShadow;
}

- (void)setPrefersShadow:(BOOL)prefersShadow
{
  self->_prefersShadow = prefersShadow;
}

- (BOOL)prefersScaledContent
{
  return self->_prefersScaledContent;
}

- (void)setPrefersScaledContent:(BOOL)prefersScaledContent
{
  self->_prefersScaledContent = prefersScaledContent;
}

- (BOOL)_tintViewTakesOnPointerShape
{
  return self->__tintViewTakesOnPointerShape;
}

- (void)set_tintViewTakesOnPointerShape:(BOOL)a3
{
  self->__tintViewTakesOnPointerShape = a3;
}

- (BOOL)_tintViewUsesPointerMaterial
{
  return self->__tintViewUsesPointerMaterial;
}

- (void)set_tintViewUsesPointerMaterial:(BOOL)a3
{
  self->__tintViewUsesPointerMaterial = a3;
}

@end
