@implementation _UIBackdropViewSettingsFlatSemiLight

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsFlatSemiLight;
  -[_UIBackdropViewSettingsLight setDefaultValues](&v3, sel_setDefaultValues);
  if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 100)
  {
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.2);
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 8.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.0);
  }
}

@end
