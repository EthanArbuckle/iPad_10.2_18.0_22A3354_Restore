@implementation _UIBackdropViewSettingsATVMenuLight

- (void)setDefaultValues
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIBackdropViewSettingsATVMenuLight;
  -[_UIBackdropViewSettings setDefaultValues](&v11, sel_setDefaultValues);
  v3 = _AXSEnhanceBackgroundContrastEnabled();
  if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 10 || v3)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 0);
    -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", 0);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.62745098, 0.62745098, 0.62745098, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v7);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.6);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 0.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor blackColor](UIColor, "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v8);

    if (v3)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.6, 0.62745098, 0.643137255, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v9);

      -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 1.0);
    }
  }
  else if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v4 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1)
      goto LABEL_7;
    v10 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_TVVisualEffectWithColorMatrix)
      goto LABEL_7;
    while (v4 >= v10)
    {
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_TVVisualEffectWithColorMatrix, (uint64_t)CFSTR("TVVisualEffectWithColorMatrix"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v10 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
      if (v4 == _UIInternalPreference_TVVisualEffectWithColorMatrix)
        goto LABEL_7;
    }
    if (byte_1EDDA7DB4)
    {
LABEL_7:
      -[_UIBackdropViewSettings setUsesColorOffset:](self, "setUsesColorOffset:", 1);
      -[_UIBackdropViewSettings setColorOffsetAlpha:](self, "setColorOffsetAlpha:", 0.04);
    }
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.509803922, 0.509803922, 0.509803922, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v5);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.65);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 50.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 2.0);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v6);

  }
}

@end
