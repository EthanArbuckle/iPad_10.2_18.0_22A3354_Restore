@implementation _UIBackdropViewSettingsAdaptiveLight

- (void)setDefaultValues
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsAdaptiveLight;
  -[_UIBackdropViewSettingsLight setDefaultValues](&v4, sel_setDefaultValues);
  v3 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  if (v3 == 10)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
  }
  else if (v3 == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 1);
    -[_UIBackdropViewSettings setUsesDarkeningTintView:](self, "setUsesDarkeningTintView:", 1);
    -[_UIBackdropViewSettings setDarkeningTintAlpha:](self, "setDarkeningTintAlpha:", 0.3);
    -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 2.0);
  }
}

@end
