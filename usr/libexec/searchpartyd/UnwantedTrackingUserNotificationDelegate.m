@implementation UnwantedTrackingUserNotificationDelegate

- (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate)init
{
  return (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate *)sub_10002615C();
}

- (void)dealloc
{
  uint64_t v2;
  _TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_super v9;

  v2 = qword_1010EA138;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1010EA138, sub_100A3A4A8);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10001A9E8(v4, (uint64_t)qword_1011B7B58);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "UnwantedTrackingUserNotificationDelegate: Deinit", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for UnwantedTrackingUserNotificationDelegate();
  -[UnwantedTrackingUserNotificationDelegate dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate_name]);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate *v17;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = qword_1010EA138;
  v10 = a3;
  v11 = a4;
  v17 = self;
  if (v9 != -1)
    swift_once(&qword_1010EA138, sub_100A3A4A8);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_10001A9E8(v12, (uint64_t)qword_1011B7B58);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter(v14);
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "UnwantedTrackingUserNotificationDelegate: willPresentNotification", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  (*((void (**)(void *, uint64_t))v8 + 2))(v8, 19);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100027930(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

@end
