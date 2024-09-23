@implementation _UIBackdropViewSettingsATVAdaptive

- (void)setDefaultValues
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _OWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIBackdropViewSettingsATVAdaptive;
  -[_UIBackdropViewSettings setDefaultValues](&v13, sel_setDefaultValues);
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

    if (v3)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.301960784, 0.325490196, 0.337254902, 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v10);

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
    v11 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_TVVisualEffectWithColorMatrix)
      goto LABEL_7;
    while (v4 >= v11)
    {
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_TVVisualEffectWithColorMatrix, (uint64_t)CFSTR("TVVisualEffectWithColorMatrix"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v11 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
      if (v4 == _UIInternalPreference_TVVisualEffectWithColorMatrix)
        goto LABEL_7;
    }
    if (byte_1EDDA7DB4)
    {
LABEL_7:
      -[_UIBackdropViewSettings setUsesColorOffset:](self, "setUsesColorOffset:", 1);
      v12[0] = xmmword_186678630;
      v12[1] = xmmword_186678640;
      v12[2] = xmmword_186678650;
      v12[3] = xmmword_186678660;
      v12[4] = xmmword_186678670;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v12);
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

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 30.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v7);

  }
}

@end
