@implementation _UIBackdropViewSettingsLightLow

- (void)setDefaultValues
{
  objc_super v3;

  -[_UIBackdropViewSettings setGraphicsQuality:](self, "setGraphicsQuality:", 10);
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsLightLow;
  -[_UIBackdropViewSettingsLight setDefaultValues](&v3, sel_setDefaultValues);
}

@end
