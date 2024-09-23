@implementation _UIBackdropViewSettingsDark

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
  v17.super_class = (Class)_UIBackdropViewSettingsDark;
  -[_UIBackdropViewSettings setDefaultValues](&v17, sel_setDefaultValues);
  graphicsQuality = self->super._graphicsQuality;
  if (graphicsQuality == 10)
  {
    self->super._requiresColorStatistics = 0;
    self->super._backdropVisible = 0;
    self->super._usesBackdropEffectView = 0;
    self->super._usesColorTintView = 0;
    *(_OWORD *)&self->super._grayscaleTintLevel = xmmword_186678860;
    if (_AXSEnhanceBackgroundContrastEnabled())
      self->super._grayscaleTintAlpha = 1.0;
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v5 = &_UIBackdropViewSettingsBlurRadiusNone;
    goto LABEL_7;
  }
  if (graphicsQuality == 100)
  {
    self->super._requiresColorStatistics = 0;
    self->super._backdropVisible = 1;
    self->super._usesColorTintView = 0;
    *(_OWORD *)&self->super._grayscaleTintLevel = xmmword_186678870;
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
    v5 = &_UIBackdropViewSettingsBlurRadiusMedium;
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
  _QWORD *v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIBackdropViewSettingsDark;
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](&v5, sel_computeOutputSettingsUsingModel_, v4);
  if (v4[4] == 10 && v4[7] == 2)
    self->super._grayscaleTintAlpha = 0.86;

}

@end
