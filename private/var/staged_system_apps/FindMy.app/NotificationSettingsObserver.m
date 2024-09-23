@implementation NotificationSettingsObserver

- (_TtC6FindMy28NotificationSettingsObserver)init
{
  return (_TtC6FindMy28NotificationSettingsObserver *)sub_1003794A0();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC6FindMy28NotificationSettingsObserver *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "NotificationSettingsObserver: Deinit", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  sub_100379994(v8);
  v9.receiver = v4;
  v9.super_class = ObjectType;
  -[NotificationSettingsObserver dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy28NotificationSettingsObserver_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)sceneWillEnterForegroundWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC6FindMy28NotificationSettingsObserver *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100379FA8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
