@implementation _UIBackdropViewSettingsLight

- (void)setDefaultValues
{
  int64_t graphicsQuality;
  uint64_t *v4;
  uint64_t *v5;
  UIImage *grayscaleTintMaskImage;
  UIColor *colorTint;
  UIImage *colorTintMaskImage;
  UIImage *filterMaskImage;
  UIColor *v15;
  UIColor *legibleColor;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIBackdropViewSettingsLight;
  -[_UIBackdropViewSettings setDefaultValues](&v17, sel_setDefaultValues);
  self->super._requiresColorStatistics = 0;
  graphicsQuality = self->super._graphicsQuality;
  if (graphicsQuality == 10)
  {
    self->super._backdropVisible = 0;
    self->super._usesBackdropEffectView = 0;
    self->super._usesColorTintView = 0;
    *(_OWORD *)&self->super._grayscaleTintLevel = xmmword_186678890;
    if (_AXSEnhanceBackgroundContrastEnabled())
      self->super._grayscaleTintAlpha = 1.0;
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v5 = &_UIBackdropViewSettingsBlurRadiusNone;
    goto LABEL_7;
  }
  if (graphicsQuality == 100)
  {
    self->super._backdropVisible = 1;
    self->super._usesColorTintView = 0;
    *(_OWORD *)&self->super._grayscaleTintLevel = xmmword_1866788A0;
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
    v5 = &_UIBackdropViewSettingsBlurRadiusLarge;
LABEL_7:
    grayscaleTintMaskImage = self->super._grayscaleTintMaskImage;
    self->super._grayscaleTintMaskAlpha = 1.0;
    self->super._grayscaleTintMaskImage = 0;

    colorTint = self->super._colorTint;
    self->super._colorTint = 0;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&self->super._colorTintAlpha = _Q0;
    colorTintMaskImage = self->super._colorTintMaskImage;
    self->super._colorTintMaskImage = 0;

    *(_QWORD *)&self->super._blurRadius = *v5;
    *(_QWORD *)&self->super._saturationDeltaFactor = *v4;
    filterMaskImage = self->super._filterMaskImage;
    self->super._filterMaskAlpha = 1.0;
    self->super._filterMaskImage = 0;

  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v15;

}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  id v4;
  int64_t graphicsQuality;
  int64_t v6;
  double v7;
  UIColor *colorTint;
  UIColor **p_colorTint;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  UIColor *v17;
  UIColor *legibleColor;
  uint64_t v19;
  double v20;
  uint64_t v21;
  UIColor *v22;
  int64_t v23;
  double v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UIBackdropViewSettingsLight;
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](&v25, sel_computeOutputSettingsUsingModel_, v4);
  if (self->super._enabled)
  {
    if (self->super._selected)
    {
      if (!self->super._highlighted)
      {
        if (qword_1ECD7CBA8 != -1)
          dispatch_once(&qword_1ECD7CBA8, &__block_literal_global_13);
        objc_storeStrong((id *)&self->super._colorTint, (id)qword_1ECD7CBB0);
        graphicsQuality = self->super._graphicsQuality;
        if (graphicsQuality == 10)
        {
          v7 = 0.96;
          goto LABEL_21;
        }
        if (graphicsQuality != 100)
          goto LABEL_22;
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (self->super._highlighted)
    {
LABEL_15:
      objc_storeStrong((id *)&self->super._colorTint, *((id *)v4 + 16));
      self->super._colorTintAlpha = *((double *)v4 + 17) * 0.6;
      goto LABEL_22;
    }
    p_colorTint = &self->super._colorTint;
    colorTint = self->super._colorTint;
    self->super._colorTint = 0;

    self->super._colorTintAlpha = 0.0;
    self->super._grayscaleTintAlpha = *((double *)v4 + 12);
    v10 = (void *)*((_QWORD *)v4 + 16);
    if (v10)
    {
      objc_storeStrong((id *)&self->super._colorTint, v10);
      v11 = *((double *)v4 + 17);
    }
    else
    {
      if (*((_QWORD *)v4 + 7) != 1
        || (v19 = *((_QWORD *)v4 + 8), v19 < 0)
        || (v20 = (double)v19 * 0.04 + 0.08, v20 <= 0.0))
      {
LABEL_35:
        v23 = self->super._graphicsQuality;
        if (v23 == 10)
        {
          self->super._grayscaleTintLevel = fmin(self->super._grayscaleTintLevel + (double)*((uint64_t *)v4 + 8) * 0.1, 1.0);
        }
        else if (v23 == 100)
        {
          self->super._grayscaleTintAlpha = fmin(self->super._grayscaleTintAlpha* ((double)*((uint64_t *)v4 + 8) * 0.5 + 1.0), 1.0);
        }
        goto LABEL_22;
      }
      +[_UIBackdropViewSettings darkeningTintColor](_UIBackdropViewSettings, "darkeningTintColor");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *p_colorTint;
      *p_colorTint = (UIColor *)v21;

      v11 = v20 * *((double *)v4 + 17);
    }
    self->super._colorTintAlpha = v11;
    goto LABEL_35;
  }
  if (_MergedGlobals_945 != -1)
    dispatch_once(&_MergedGlobals_945, &__block_literal_global_31);
  objc_storeStrong((id *)&self->super._colorTint, (id)qword_1ECD7CBA0);
  v6 = self->super._graphicsQuality;
  if (v6 == 10)
  {
LABEL_16:
    v7 = 0.75;
    goto LABEL_21;
  }
  if (v6 == 100)
  {
    v7 = 0.2;
LABEL_21:
    self->super._colorTintAlpha = v7;
  }
LABEL_22:
  objc_msgSend(*((id *)v4 + 6), "averageBrightness");
  v13 = v12;
  v14 = *((id *)v4 + 16);
  v15 = v14;
  if (v14)
  {
    if ((v24 = 0.0,
          v16 = objc_retainAutorelease(v14),
          CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v16, "CGColor")) == 2)
      && (objc_msgSend(v16, "getWhite:alpha:", &v24, 0) & 1) != 0
      || objc_msgSend(v16, "getHue:saturation:brightness:alpha:", 0, 0, &v24, 0))
    {
      v13 = v24;
    }
  }
  if (v13 <= 0.65)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.0, 0.6);
  }
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v17;

}

@end
