@implementation _UIBackdropViewSettingsDarkWithZoom

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsDarkWithZoom;
  -[_UIBackdropViewSettingsDark setDefaultValues](&v3, sel_setDefaultValues);
  self->super.super._zoom = 0.05;
}

@end
