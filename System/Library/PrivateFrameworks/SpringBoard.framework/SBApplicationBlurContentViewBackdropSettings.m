@implementation SBApplicationBlurContentViewBackdropSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBApplicationBlurContentViewBackdropSettings;
  -[_UIBackdropViewSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 85.0);
  -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 2.0);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 1.0);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.4);
  -[_UIBackdropViewSettings setLightenGrayscaleWithSourceOver:](self, "setLightenGrayscaleWithSourceOver:", 1);
  -[_UIBackdropViewSettings setDarkeningTintSaturation:](self, "setDarkeningTintSaturation:", 0.0);
  -[_UIBackdropViewSettings setDarkeningTintBrightness:](self, "setDarkeningTintBrightness:", 0.0);
  -[_UIBackdropViewSettings setDarkeningTintAlpha:](self, "setDarkeningTintAlpha:", 0.04);
  -[_UIBackdropViewSettings setDarkenWithSourceOver:](self, "setDarkenWithSourceOver:", 1);
}

@end
