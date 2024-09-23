@implementation DarwinNotificationManager

+ (_TtC15audioaccessoryd25DarwinNotificationManager)shared
{
  if (qword_100210158 != -1)
    swift_once(&qword_100210158, sub_1000C7858);
  return (_TtC15audioaccessoryd25DarwinNotificationManager *)(id)static DarwinNotificationManager.shared;
}

- (_TtC15audioaccessoryd25DarwinNotificationManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd25DarwinNotificationManager_helpers) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DarwinNotificationManager();
  return -[DarwinNotificationManager init](&v3, "init");
}

- (void)setUp
{
  _TtC15audioaccessoryd25DarwinNotificationManager *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC15audioaccessoryd25DarwinNotificationManager *v8;
  _QWORD v9[5];
  uint64_t v10;

  sub_1000C8110();
  v3 = self;
  v4 = static OS_dispatch_queue.main.getter();
  v5 = swift_allocObject(&unk_1001E8858, 24, 7);
  *(_QWORD *)(v5 + 16) = v3;
  v9[4] = sub_1000C81A8;
  v10 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000C7E54;
  v9[3] = &unk_1001E8870;
  v6 = _Block_copy(v9);
  v7 = v10;
  v8 = v3;
  swift_release(v7);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, v6);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd25DarwinNotificationManager_helpers));
}

@end
