@implementation TRAMutableSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRASettings initWithSettings:](+[TRASettings allocWithZone:](TRASettings, "allocWithZone:", a3), "initWithSettings:", self);
}

- (void)setOrientationSettings:(id)a3
{
  TRASettingsOrientation *v4;
  TRASettingsOrientation *orientationSettings;

  v4 = (TRASettingsOrientation *)objc_msgSend(a3, "copy");
  orientationSettings = self->super._orientationSettings;
  self->super._orientationSettings = v4;

}

- (void)setUserInterfaceStyleSettings:(id)a3
{
  TRASettingsUserInterfaceStyle *v4;
  TRASettingsUserInterfaceStyle *userInterfaceStyleSettings;

  v4 = (TRASettingsUserInterfaceStyle *)objc_msgSend(a3, "copy");
  userInterfaceStyleSettings = self->super._userInterfaceStyleSettings;
  self->super._userInterfaceStyleSettings = v4;

}

- (void)setZOrderLevelSettings:(id)a3
{
  TRASettingsZOrderLevel *v4;
  TRASettingsZOrderLevel *zOrderLevelSettings;

  v4 = (TRASettingsZOrderLevel *)objc_msgSend(a3, "copy");
  zOrderLevelSettings = self->super._zOrderLevelSettings;
  self->super._zOrderLevelSettings = v4;

}

- (void)setAmbientPresentationSettings:(id)a3
{
  TRASettingsAmbientPresentation *v4;
  TRASettingsAmbientPresentation *ambientPresentationSettings;

  v4 = (TRASettingsAmbientPresentation *)objc_msgSend(a3, "copy");
  ambientPresentationSettings = self->super._ambientPresentationSettings;
  self->super._ambientPresentationSettings = v4;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSettings:", self);
}

@end
