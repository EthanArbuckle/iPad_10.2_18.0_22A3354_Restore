@implementation _UILegibilityCachedShadow

- (void)dealloc
{
  objc_super v3;

  self->_settings = 0;
  self->_shadow = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityCachedShadow;
  -[_UILegibilityCachedShadow dealloc](&v3, sel_dealloc);
}

- (BOOL)matchesSettings:(id)a3 strength:(double)a4
{
  double v7;

  -[_UILegibilityCachedShadow strength](self, "strength");
  return vabdd_f64(v7, a4) < 0.00000011920929
      && -[_UILegibilitySettings isEqual:](-[_UILegibilityCachedShadow settings](self, "settings"), "isEqual:", a3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(a3, "settings");
  objc_msgSend(a3, "strength");
  return -[_UILegibilityCachedShadow matchesSettings:strength:](self, "matchesSettings:strength:", v5);
}

- (_UILegibilitySettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (UIImage)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
