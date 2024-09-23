@implementation NotificationSourceMonitorLSObserver

- (void)applicationsDidInstall:(id)a3
{
  sub_249A871A4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_249A86EF0);
}

- (void)applicationsDidUninstall:(id)a3
{
  sub_249A871A4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_249A87020);
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5;
  _TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver *v6;
  _BYTE v7[32];

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_249B02A04();
  swift_unknownObjectRelease();
  sub_249A915C0((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (_TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver)init
{
  _TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver *result;

  result = (_TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver_workspace));
  swift_unknownObjectWeakDestroy();
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver_delegate);
}

@end
