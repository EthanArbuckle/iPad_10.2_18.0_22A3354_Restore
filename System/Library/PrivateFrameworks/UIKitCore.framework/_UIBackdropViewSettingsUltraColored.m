@implementation _UIBackdropViewSettingsUltraColored

- (void)setDefaultValues
{
  int64_t v3;
  UIColor *v4;
  uint64_t *v5;
  uint64_t *v6;
  double v7;
  UIColor *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIBackdropViewSettingsUltraColored;
  -[_UIBackdropViewSettings setDefaultValues](&v10, sel_setDefaultValues);
  v3 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  if (v3 == 10)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 0);
    -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", 0);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.97);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.1);
    v7 = 1.0;
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    v8 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0196078431, 0.0196078431, 0.0196078431, 1.0);
    -[_UIBackdropViewSettingsUltraColored setColorTint:](self, "setColorTint:", v8);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.98);
    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v6 = &_UIBackdropViewSettingsBlurRadiusNone;
    if (!_AXSEnhanceBackgroundContrastEnabled())
    {
LABEL_6:
      -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
      -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", *(double *)v6);
      -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", *(double *)v5);
      -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
      goto LABEL_7;
    }
LABEL_5:
    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", v7);
    goto LABEL_6;
  }
  if (v3 == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.97);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.5);
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    v4 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0196078431, 0.0196078431, 0.0196078431, 1.0);
    -[_UIBackdropViewSettingsUltraColored setColorTint:](self, "setColorTint:", v4);

    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorDesaturate;
    v6 = &_UIBackdropViewSettingsBlurRadiusMedium;
    v7 = 0.85;
    goto LABEL_5;
  }
LABEL_7:
  +[UIColor whiteColor](UIColor, "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v9);

}

- (void)setColorTint:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)_UIBackdropViewSettingsUltraColored;
  -[_UIBackdropViewSettings setColorTint:](&v7, sel_setColorTint_, v5);

}

@end
