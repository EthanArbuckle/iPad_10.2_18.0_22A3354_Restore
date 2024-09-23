@implementation _UIPopoverBackgroundVisualEffect

+ (id)effectWithStyle:(int64_t)a3 tint:(id)a4
{
  id v6;
  uint64_t v7;
  _BYTE *v8;
  double v10;

  v6 = a4;
  objc_msgSend(a1, "_effectWithStyle:tintColor:invertAutomaticStyle:", a3, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_BYTE *)v7;
  if (v6)
  {
    v10 = 0.0;
    objc_msgSend(v6, "getRed:green:blue:alpha:", 0, 0, 0, &v10);
    v8[16] = v10 < 1.0;
  }
  else
  {
    *(_BYTE *)(v7 + 16) = 1;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPopoverBackgroundVisualEffect;
  result = -[UIBlurEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_BYTE *)result + 16) = self->_tintColorIsTranslucent;
  return result;
}

- (id)effectSettings
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverBackgroundVisualEffect;
  -[UIBlurEffect effectSettings](&v7, sel_effectSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBlurEffect _tintColor](self, "_tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "setUsesColorTintView:", 1);
    -[UIBlurEffect _tintColor](self, "_tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setColorTint:", v5);

    objc_msgSend(v3, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v3, "setUsesBackdropEffectView:", self->_tintColorIsTranslucent);
  }
  return v3;
}

- (BOOL)tintColorIsTranslucent
{
  return self->_tintColorIsTranslucent;
}

@end
