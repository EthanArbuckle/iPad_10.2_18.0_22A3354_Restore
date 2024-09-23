@implementation _UIBackdropViewSettingsATVAdaptiveLighten

- (void)setDefaultValues
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _OWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIBackdropViewSettingsATVAdaptiveLighten;
  -[_UIBackdropViewSettings setDefaultValues](&v14, sel_setDefaultValues);
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
    +[UIColor whiteColor](UIColor, "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v8);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 0.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v9);

    if (!v3)
      return;
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.643137255, 0.666666667, 0.682352941, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v10);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 1.0);
    +[UIColor blackColor](UIColor, "blackColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") != 100)
      return;
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v4 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1)
      goto LABEL_7;
    v12 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_TVVisualEffectWithColorMatrix)
      goto LABEL_7;
    while (v4 >= v12)
    {
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_TVVisualEffectWithColorMatrix, (uint64_t)CFSTR("TVVisualEffectWithColorMatrix"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v12 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
      if (v4 == _UIInternalPreference_TVVisualEffectWithColorMatrix)
        goto LABEL_7;
    }
    if (byte_1EDDA7DB4)
    {
LABEL_7:
      -[_UIBackdropViewSettings setUsesColorOffset:](self, "setUsesColorOffset:", 1);
      v13[0] = xmmword_1866786A0;
      v13[1] = xmmword_1866786B0;
      v13[2] = xmmword_1866786C0;
      v13[3] = xmmword_1866786D0;
      v13[4] = xmmword_186678670;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropViewSettings setColorOffsetMatrix:](self, "setColorOffsetMatrix:", v5);

    }
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v6);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.07);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 60.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.3);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v7);

}

@end
