@implementation _UIVibrancyEffectLegacyImpl

- (void)setEffect:(id)a3
{
  self->_effect = (UIVibrancyEffect *)a3;
}

- (_UIVibrancyEffectLegacyImpl)initWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4 ignoreSimpleVibrancy:(BOOL)a5
{
  _UIVibrancyEffectLegacyImpl *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIVibrancyEffectLegacyImpl;
  result = -[_UIVibrancyEffectLegacyImpl init](&v9, sel_init);
  if (result)
  {
    result->_style = a3;
    result->_invertAutomaticStyle = a4;
    result->_ignoreSimpleVibrancy = a5;
  }
  return result;
}

- (_UIVibrancyEffectLegacyImpl)initWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4
{
  return -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:ignoreSimpleVibrancy:](self, "initWithStyle:invertAutomaticStyle:ignoreSimpleVibrancy:", a3, a4, 0);
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  UIVibrancyEffect *effect;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  effect = self->_effect;
  v8 = a3;
  objc_msgSend(v14, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVibrancyEffect effectForUserInterfaceStyle:](effect, "effectForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "reducedTransperancy") & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v14, "useSimpleVibrancy");
  objc_msgSend(v10, "effectConfigForReducedTransperancy:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyVibrancyConfig:toEffectDescriptor:", v12, v8);

  objc_msgSend(v8, "setContentViewRequiresClipping:", 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t style;
  BOOL v6;
  id v7;

  v4 = a3;
  style = self->_style;
  v7 = v4;
  if ((unint64_t)(style - 4) < 2 || (style != 1000 ? (v6 = style < 5000) : (v6 = 0), !v6))
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    style = _UIStyledEffectConvertAutomaticStyle(self->_style, 1, 0);
    v4 = v7;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", style, CFSTR("UIVibrancyEffectBlurStyle"));

}

- (unint64_t)hash
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && *((_QWORD *)v4 + 1) == self->_style
    && v4[16] == self->_invertAutomaticStyle;

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)invertAutomaticStyle
{
  return self->_invertAutomaticStyle;
}

- (id)implementationForUserInterfaceStyle:(int64_t)a3
{
  _UIVibrancyEffectLegacyImpl *v4;
  uint64_t style;
  BOOL v6;
  _UIVibrancyEffectLegacyImpl *v7;

  v4 = self;
  style = v4->_style;
  if ((unint64_t)(style - 4) < 2 || (style != 1000 ? (v6 = style < 5000) : (v6 = 0), !v6))
  {
    v7 = -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:]([_UIVibrancyEffectLegacyImpl alloc], "initWithStyle:invertAutomaticStyle:", _UIStyledEffectConvertAutomaticStyle(v4->_style, a3, v4->_invertAutomaticStyle), 0);

    v4 = v7;
  }
  return v4;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  int64_t style;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  style = self->_style;
  if ((unint64_t)(style - 4) >= 2 && style != 1000 && style < 5000)
    goto LABEL_7;
  objc_msgSend(v8, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle");
  objc_msgSend(v9, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceStyle");

  if (v13 == v15)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)_UIVibrancyEffectLegacyImpl;
    v16 = -[_UIVibrancyEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](&v18, sel__needsUpdateForTransitionFromEnvironment_toEnvironment_usage_, v8, v9, a5);
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)appendDescriptionTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "appendString:", CFSTR(" style="));
  _UIStyledEffectConvertToString(self->_style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v4);

  if (self->_invertAutomaticStyle)
    objc_msgSend(v5, "appendString:", CFSTR(" invertedAutomaticStyle"));

}

- (UIVibrancyEffect)effect
{
  return self->_effect;
}

@end
