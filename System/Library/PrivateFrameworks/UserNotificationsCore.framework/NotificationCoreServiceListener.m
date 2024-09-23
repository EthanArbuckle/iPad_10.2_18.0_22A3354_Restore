@implementation NotificationCoreServiceListener

- (_TtC21UserNotificationsCore31NotificationCoreServiceListener)init
{
  _TtC21UserNotificationsCore31NotificationCoreServiceListener *result;

  result = (_TtC21UserNotificationsCore31NotificationCoreServiceListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationCoreServiceListener_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationCoreServiceListener_queue_listener));
  swift_bridgeObjectRelease();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC21UserNotificationsCore31NotificationCoreServiceListener *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_249A50ADC(v8);

  swift_unknownObjectRelease();
}

@end
