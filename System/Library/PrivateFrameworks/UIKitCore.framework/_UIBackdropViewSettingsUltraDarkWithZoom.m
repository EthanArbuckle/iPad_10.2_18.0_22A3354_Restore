@implementation _UIBackdropViewSettingsUltraDarkWithZoom

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsUltraDarkWithZoom;
  -[_UIBackdropViewSettingsUltraDark setDefaultValues](&v3, sel_setDefaultValues);
  self->super.super.super._zoom = 0.05;
  self->super.super.super._shouldDoRasterizationAndAlphaHack = 1;
}

@end
