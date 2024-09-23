@implementation _UIBackdropViewSettingsNonAdaptive

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsNonAdaptive;
  -[_UIBackdropViewSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
  -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
  -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", 0);
  -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
  -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 30.0);
  -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.5);
  -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v3);

}

@end
