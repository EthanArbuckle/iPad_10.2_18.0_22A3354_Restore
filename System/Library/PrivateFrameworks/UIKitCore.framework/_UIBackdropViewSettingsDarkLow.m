@implementation _UIBackdropViewSettingsDarkLow

- (void)setDefaultValues
{
  objc_super v3;

  -[_UIBackdropViewSettings setGraphicsQuality:](self, "setGraphicsQuality:", 10);
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsDarkLow;
  -[_UIBackdropViewSettingsDark setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.988);
}

@end
