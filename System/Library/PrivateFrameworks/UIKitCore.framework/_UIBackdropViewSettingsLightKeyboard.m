@implementation _UIBackdropViewSettingsLightKeyboard

- (BOOL)_shouldUseDarkeningTintLayer
{
  return 1;
}

- (id)_defaultColorTintColorWithOpacity:(double)a3
{
  double v5;
  double v6;
  double v7;

  if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 40
    || -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 10)
  {
    v5 = 0.82745098;
    v6 = 0.843137255;
    v7 = 0.870588235;
  }
  else
  {
    v5 = 0.921568627;
    v6 = 0.941176471;
    v7 = 0.968627451;
  }
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  double v5;
  int64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIBackdropViewSettingsLightKeyboard;
  -[_UIBackdropViewSettings setDefaultValues](&v14, sel_setDefaultValues);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setGraphicsQuality:](self, "setGraphicsQuality:", objc_msgSend(v3, "_keyboardGraphicsQuality"));

  if (_AXSEnhanceBackgroundContrastEnabled()
    || -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 10)
  {
    v4 = 0;
    v5 = 1.0;
  }
  else
  {
    v4 = 1;
    v5 = 0.9;
  }
  -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
  -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
  v6 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  v7 = v6 == 100;
  -[_UIBackdropViewSettings setUsesGrayscaleTintView:](self, "setUsesGrayscaleTintView:", v7);
  -[_UIBackdropViewSettings setUsesColorBurnTintView:](self, "setUsesColorBurnTintView:", v7);
  v8 = 0;
  if (v6 == 100)
    v8 = -[_UIBackdropViewSettingsLightKeyboard _shouldUseDarkeningTintLayer](self, "_shouldUseDarkeningTintLayer", 0);
  -[_UIBackdropViewSettings setUsesDarkeningTintView:](self, "setUsesDarkeningTintView:", v8);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 1.0);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.5);
  -[_UIBackdropViewSettings setLightenGrayscaleWithSourceOver:](self, "setLightenGrayscaleWithSourceOver:", v4);
  -[_UIBackdropViewSettingsLightKeyboard _defaultColorTintColorWithOpacity:](self, "_defaultColorTintColorWithOpacity:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v9);

  -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 1.0);
  -[_UIBackdropViewSettings setColorBurnTintLevel:](self, "setColorBurnTintLevel:", 0.87);
  -[_UIBackdropViewSettings setColorBurnTintAlpha:](self, "setColorBurnTintAlpha:", 1.0);
  if (-[_UIBackdropViewSettingsLightKeyboard _shouldUseDarkeningTintLayer](self, "_shouldUseDarkeningTintLayer"))
  {
    -[_UIBackdropViewSettings setDarkeningTintAlpha:](self, "setDarkeningTintAlpha:", 0.3);
    -[_UIBackdropViewSettings setDarkeningTintHue:](self, "setDarkeningTintHue:", 0.602777778);
    -[_UIBackdropViewSettings setDarkeningTintSaturation:](self, "setDarkeningTintSaturation:", 0.0);
    -[_UIBackdropViewSettings setDarkeningTintBrightness:](self, "setDarkeningTintBrightness:", 0.5);
    -[_UIBackdropViewSettings setDarkenWithSourceOver:](self, "setDarkenWithSourceOver:", 1);
  }
  v10 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  v11 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
  v12 = &_UIBackdropViewSettingsBlurRadiusMedium;
  v13 = 1;
  if (v10 != 100 && v10 != 40)
  {
    if (v10 != 10)
      return;
    v13 = 0;
    v11 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v12 = &_UIBackdropViewSettingsBlurRadiusNone;
  }
  -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", v13);
  -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", v13);
  -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", *(double *)v12);
  -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", *(double *)v11);
  -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
}

@end
