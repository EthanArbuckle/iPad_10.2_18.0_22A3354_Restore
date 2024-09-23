@implementation _UIBackdropViewSettingsNone

- (void)setDefaultValues
{
  BOOL v3;
  UIImage *grayscaleTintMaskImage;
  UIColor *colorTint;
  UIImage *colorTintMaskImage;
  UIImage *filterMaskImage;
  UIColor *v13;
  UIColor *legibleColor;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIBackdropViewSettingsNone;
  -[_UIBackdropViewSettings setDefaultValues](&v15, sel_setDefaultValues);
  self->super._requiresColorStatistics = 0;
  self->super._backdropVisible = 0;
  v3 = self->super._graphicsQuality == 100 || _AXSEnhanceBackgroundContrastEnabled() != 0;
  self->super._usesBackdropEffectView = v3;
  *(_WORD *)&self->super._usesGrayscaleTintView = 0;
  self->super._grayscaleTintLevel = 0.0;
  self->super._grayscaleTintAlpha = 0.0;
  grayscaleTintMaskImage = self->super._grayscaleTintMaskImage;
  self->super._grayscaleTintMaskAlpha = 1.0;
  self->super._grayscaleTintMaskImage = 0;

  colorTint = self->super._colorTint;
  self->super._colorTint = 0;

  *(_OWORD *)&self->super._colorTintAlpha = xmmword_18666F250;
  colorTintMaskImage = self->super._colorTintMaskImage;
  self->super._colorTintMaskImage = 0;

  self->super._blurRadius = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->super._saturationDeltaFactor = _Q0;
  filterMaskImage = self->super._filterMaskImage;
  self->super._filterMaskImage = 0;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v13;

}

@end
