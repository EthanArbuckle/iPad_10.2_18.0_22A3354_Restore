@implementation _UIBackdropViewSettingsColorSample

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsColorSample;
  -[_UIBackdropViewSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[_UIBackdropViewSettings setAppliesTintAndBlurSettings:](self, "setAppliesTintAndBlurSettings:", 0);
  -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", 1);
  -[_UIBackdropViewSettings setUsesGrayscaleTintView:](self, "setUsesGrayscaleTintView:", 0);
  -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 0);
  -[_UIBackdropViewSettings setUsesContentView:](self, "setUsesContentView:", 0);
  -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 1);
  -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 0);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v3);

  -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 0.0);
  -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
  -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 0.0);
  -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.0);
  -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 0.0);
  -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", 0);
}

@end
