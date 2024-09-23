@implementation _UIBackdropViewSettingsUltraLight

- (void)setDefaultValues
{
  int64_t v3;
  double v4;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIBackdropViewSettingsUltraLight;
  -[_UIBackdropViewSettings setDefaultValues](&v9, sel_setDefaultValues);
  v3 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  if (v3 == 10)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 0);
    -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", 0);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 0);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.97);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.96);
    v7 = _AXSEnhanceBackgroundContrastEnabled();
    v4 = 1.0;
    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v6 = &_UIBackdropViewSettingsBlurRadiusNone;
    if (!v7)
    {
LABEL_6:
      -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
      -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", 0);
      -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 1.0);
      -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
      -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", *(double *)v6);
      -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", *(double *)v5);
      -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
      goto LABEL_7;
    }
LABEL_5:
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", v4);
    goto LABEL_6;
  }
  if (v3 == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 0);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.97);
    v4 = dbl_186678940[_AXSButtonShapesEnabled() == 0];
    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
    v6 = &_UIBackdropViewSettingsBlurRadiusMedium;
    goto LABEL_5;
  }
LABEL_7:
  +[UIColor blackColor](UIColor, "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v8);

}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIBackdropViewSettingsUltraLight;
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](&v18, sel_computeOutputSettingsUsingModel_, v4);
  if (!-[_UIBackdropViewSettings isEnabled](self, "isEnabled"))
  {
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.6);
    v6 = 0.86;
    goto LABEL_7;
  }
  if (-[_UIBackdropViewSettings isSelected](self, "isSelected")
    && !-[_UIBackdropViewSettings isHighlighted](self, "isHighlighted"))
  {
    if (_MergedGlobals_946 != -1)
      dispatch_once(&_MergedGlobals_946, &__block_literal_global_32);
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", qword_1ECD7CBC0);
    v15 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
    if (v15 == 10)
    {
      v16 = 0.96;
    }
    else
    {
      if (v15 != 100)
        goto LABEL_8;
      v16 = 0.75;
    }
    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", v16);
    goto LABEL_8;
  }
  if (-[_UIBackdropViewSettings isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(v4, "grayscaleTintAlpha");
    v6 = v5 * 0.6;
LABEL_7:
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", v6);
    goto LABEL_8;
  }
  if (!_AXSButtonShapesEnabled()
    && -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 100)
  {
    objc_msgSend(v4, "colorSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "averageSaturation");
    v9 = v8;

    objc_msgSend(v4, "colorSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "averageBrightness");
    v12 = v11;

    if (v12 <= 0.84)
    {
      if (v12 >= 0.2)
      {
LABEL_23:
        if (v9 <= 0.7)
          goto LABEL_8;
        -[_UIBackdropViewSettings grayscaleTintAlpha](self, "grayscaleTintAlpha");
        v6 = fmin(v9 + -0.7 + v17, 0.9);
        goto LABEL_7;
      }
      objc_msgSend(v4, "grayscaleTintAlpha");
      v14 = 0.2 - v12;
    }
    else
    {
      objc_msgSend(v4, "grayscaleTintAlpha");
      v14 = v12 + -0.84;
    }
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", fmin(v14 + v13, 0.9));
    goto LABEL_23;
  }
LABEL_8:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsUltraLight;
  -[_UIBackdropViewSettings dealloc](&v4, sel_dealloc);
}

- (_UIBackdropViewSettingsUltraLight)initWithDefaultValuesForGraphicsQuality:(int64_t)a3
{
  _UIBackdropViewSettingsUltraLight *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBackdropViewSettingsUltraLight;
  v3 = -[_UIBackdropViewSettings initWithDefaultValuesForGraphicsQuality:](&v6, sel_initWithDefaultValuesForGraphicsQuality_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__accessibilityButtonShapesDidChangeNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  }
  return v3;
}

@end
