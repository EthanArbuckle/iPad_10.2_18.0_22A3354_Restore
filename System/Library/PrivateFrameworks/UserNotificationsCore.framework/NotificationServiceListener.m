@implementation NotificationServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  char *v7;
  id v8;
  _TtC21UserNotificationsCore27NotificationServiceListener *v9;
  id v10;
  _TtC21UserNotificationsCore27NotificationServiceListener *v11;
  id v12;
  char *v14;
  void *v15;

  v7 = (char *)objc_allocWithZone((Class)type metadata accessor for NotificationServiceConnection());
  v8 = a4;
  v9 = self;
  v10 = v8;
  v11 = v9;
  v12 = a3;
  v14 = sub_2499AEF98(v11, v10, v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544BD568);
  sub_249B028E4();

  return 1;
}

- (_TtC21UserNotificationsCore27NotificationServiceListener)init
{
  return (_TtC21UserNotificationsCore27NotificationServiceListener *)sub_249A6F984();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore27NotificationServiceListener_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore27NotificationServiceListener_queue_listener));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
