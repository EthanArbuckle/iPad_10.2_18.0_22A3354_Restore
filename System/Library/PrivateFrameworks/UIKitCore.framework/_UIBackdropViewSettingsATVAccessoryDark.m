@implementation _UIBackdropViewSettingsATVAccessoryDark

- (void)setDefaultValues
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIBackdropViewSettingsATVAccessoryDark;
  -[_UIBackdropViewSettings setDefaultValues](&v9, sel_setDefaultValues);
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
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v6);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.65);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 0.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v7);

    if (v3)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.22745098, 0.247058824, 0.254901961, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v8);

      -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 1.0);
    }
  }
  else if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.588235294, 0.588235294, 0.588235294, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v4);

    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.15);
    -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 90.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.5);
    -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v5);

  }
}

@end
