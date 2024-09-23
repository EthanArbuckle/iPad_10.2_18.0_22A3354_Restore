@implementation SUIAnimationKitPrototypeSettings

- (SUIAShockwavePrototypeSettings)shockwaveSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_shockwaveSettings);
  swift_beginAccess();
  return (SUIAShockwavePrototypeSettings *)*v2;
}

- (void)setShockwaveSettings:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_shockwaveSettings);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setDefaultValues
{
  SUIAnimationKitPrototypeSettings *v2;
  SUIAShockwavePrototypeSettings *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUIAnimationKitPrototypeSettings;
  v2 = self;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  v3 = -[SUIAnimationKitPrototypeSettings shockwaveSettings](v2, sel_shockwaveSettings, v4.receiver, v4.super_class);
  -[SUIAShockwavePrototypeSettings setDefaultValues](v3, sel_setDefaultValues);

}

+ (id)settingsControllerModule
{
  id v2;

  _sSo32SUIAnimationKitPrototypeSettingsC017SystemUIAnimationB0E24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{

}

@end
