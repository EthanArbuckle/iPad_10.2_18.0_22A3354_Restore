@implementation SettingsCenterListener

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4
{
  id v6;
  _TtC21UserNotificationsCore22SettingsCenterListener *v7;

  sub_249B027F4();
  v6 = a3;
  v7 = self;
  sub_249A0D9F0(v6);

  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCore22SettingsCenterListener)init
{
  _TtC21UserNotificationsCore22SettingsCenterListener *result;

  result = (_TtC21UserNotificationsCore22SettingsCenterListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore22SettingsCenterListener_delegate);
}

@end
