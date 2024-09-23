@implementation _UIBackdropViewSettingsUltraDark

- (void)setDefaultValues
{
  int64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  double v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIBackdropViewSettingsUltraDark;
  -[_UIBackdropViewSettingsNonAdaptive setDefaultValues](&v9, sel_setDefaultValues);
  v3 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  if (v3 == 10)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 0);
    -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", 0);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 0);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.02);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.85);
    v7 = _AXSEnhanceBackgroundContrastEnabled();
    v6 = 1.0;
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v5 = &_UIBackdropViewSettingsBlurRadiusNone;
    if (!v7)
    {
LABEL_6:
      -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
      -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", 0);
      -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 1.0);
      -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
      -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", *(double *)v5);
      -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", *(double *)v4);
      -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
      goto LABEL_7;
    }
LABEL_5:
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", v6);
    goto LABEL_6;
  }
  if (v3 == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 0);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.02);
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
    v5 = &_UIBackdropViewSettingsBlurRadiusSmall;
    v6 = 0.85;
    goto LABEL_5;
  }
LABEL_7:
  +[UIColor whiteColor](UIColor, "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v8);

}

@end
