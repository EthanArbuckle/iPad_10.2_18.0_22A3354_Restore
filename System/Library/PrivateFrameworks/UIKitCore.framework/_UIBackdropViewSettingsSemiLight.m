@implementation _UIBackdropViewSettingsSemiLight

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsSemiLight;
  -[_UIBackdropViewSettingsLight setDefaultValues](&v3, sel_setDefaultValues);
  if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 100)
  {
    -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 5.0);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.5);
  }
}

@end
