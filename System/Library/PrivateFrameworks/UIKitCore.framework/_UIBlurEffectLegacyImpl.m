@implementation _UIBlurEffectLegacyImpl

- (BOOL)canProvideVibrancyEffect
{
  return 1;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setEffect:(id)a3
{
  self->_effect = (UIBlurEffect *)a3;
}

- (_UIBlurEffectLegacyImpl)initWithStyle:(int64_t)a3 tintColor:(id)a4 invertAutomaticStyle:(BOOL)a5
{
  id v8;
  _UIBlurEffectLegacyImpl *v9;
  _UIBlurEffectLegacyImpl *v10;
  uint64_t v11;
  UIColor *tintColor;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIBlurEffectLegacyImpl;
  v9 = -[_UIBlurEffectLegacyImpl init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    v11 = objc_msgSend(v8, "copy");
    tintColor = v10->_tintColor;
    v10->_tintColor = (UIColor *)v11;

    v10->_invertAutomaticStyle = a5;
  }

  return v10;
}

- (BOOL)invertAutomaticStyle
{
  return self->_invertAutomaticStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
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
    v18.super_class = (Class)_UIBlurEffectLegacyImpl;
    v16 = -[_UIBlurEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](&v18, sel__needsUpdateForTransitionFromEnvironment_toEnvironment_usage_, v8, v9, a5);
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  UIBlurEffect *effect;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  effect = self->_effect;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBlurEffect effectForUserInterfaceStyle:](effect, "effectForUserInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "effectSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_tintColor)
    objc_msgSend(v11, "setColorTint:");
  +[_UILegacyEffectConverter sharedConverter](_UILegacyEffectConverter, "sharedConverter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyBackdropSettings:toEffectDescriptor:environment:", v12, v9, v8);

}

- (id)implementationForUserInterfaceStyle:(int64_t)a3
{
  _UIBlurEffectLegacyImpl *v4;
  uint64_t style;
  BOOL v6;
  _UIBlurEffectLegacyImpl *v7;

  v4 = self;
  style = v4->_style;
  if ((unint64_t)(style - 4) < 2 || (style != 1000 ? (v6 = style < 5000) : (v6 = 0), !v6))
  {
    v7 = -[_UIBlurEffectLegacyImpl initWithStyle:tintColor:invertAutomaticStyle:]([_UIBlurEffectLegacyImpl alloc], "initWithStyle:tintColor:invertAutomaticStyle:", _UIStyledEffectConvertAutomaticStyle(v4->_style, a3, v4->_invertAutomaticStyle), v4->_tintColor, 0);

    v4 = v7;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 *v6;
  UIColor *tintColor;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = (unsigned __int8 *)v5;
    if (*((_QWORD *)v5 + 1) == self->_style)
    {
      tintColor = self->_tintColor;
      v8 = (UIColor *)*((id *)v5 + 2);
      v9 = tintColor;
      if (v8 == v9)
      {

LABEL_13:
        v12 = v6[24] == self->_invertAutomaticStyle;
LABEL_15:

        goto LABEL_16;
      }
      v10 = v9;
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

      }
      else
      {
        v13 = -[UIColor isEqual:](v8, "isEqual:", v9);

        if (v13)
          goto LABEL_13;
      }
    }
    v12 = 0;
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
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
  objc_msgSend(v4, "encodeInteger:forKey:", style, CFSTR("UIBlurEffectStyle"));

}

- (unint64_t)hash
{
  return self->_style;
}

- (id)tintColor
{
  return self->_tintColor;
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
  if (self->_tintColor)
    objc_msgSend(v5, "appendFormat:", CFSTR(" tintColor=%@"), self->_tintColor);

}

- (UIBlurEffect)effect
{
  return self->_effect;
}

@end
