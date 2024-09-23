@implementation _UIBackdropViewSettingsPasscodePaddle

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsPasscodePaddle;
  -[_UIBackdropViewSettingsDark setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.16);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 1.0);
  -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 2.0);
}

@end
