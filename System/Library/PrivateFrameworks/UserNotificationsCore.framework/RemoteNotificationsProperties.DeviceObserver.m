@implementation RemoteNotificationsProperties.DeviceObserver

- (void)dealloc
{
  _TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver *v2;

  v2 = self;
  sub_249AB0198();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver_queue));
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  _TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver *v7;

  if (a4)
    sub_249B02668();
  v6 = a3;
  v7 = self;
  sub_249AB2BC4("IDS devices changed. Refreshing state.");

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  _TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver *v7;

  if (a4)
    sub_249B027F4();
  v6 = a3;
  v7 = self;
  sub_249AB2BC4("IDS account changed. Refreshing state.");

  swift_bridgeObjectRelease();
}

- (_TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver)init
{
  _TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver *result;

  result = (_TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
