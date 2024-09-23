@implementation STOnBoardingConfiguration

- (STOnBoardingConfigurationUser)user
{
  return (STOnBoardingConfigurationUser *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_user));
}

- (BOOL)updateExistingSettings
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_updateExistingSettings);
}

- (STOnBoardingConfigurationDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_delegate;
  swift_beginAccess();
  return (STOnBoardingConfigurationDelegate *)(id)MEMORY[0x220731A28](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration)init
{
  _TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration *result;

  result = (_TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_219B91F14((uint64_t)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_delegate);
}

@end
