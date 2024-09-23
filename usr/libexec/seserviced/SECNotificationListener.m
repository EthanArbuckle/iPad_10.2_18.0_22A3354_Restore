@implementation SECNotificationListener

+ (void)kickOff
{
  void *v2;
  NSString v3;
  id v4;

  if (qword_1003445E0 != -1)
    swift_once(&qword_1003445E0, sub_1001256C0);
  v2 = (void *)objc_opt_self(SESXPCEventListener);
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();

}

- (_TtC10seserviced23SECNotificationListener)init
{
  return (_TtC10seserviced23SECNotificationListener *)sub_1001257BC();
}

- (void)onDarwinNotification:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC10seserviced23SECNotificationListener *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100126020(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  uint64_t v6;
  _TtC10seserviced23SECNotificationListener *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;

  v6 = qword_1003445E8;
  swift_unknownObjectRetain(a4);
  v7 = self;
  if (v6 != -1)
    swift_once(&qword_1003445E8, sub_100126884);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_10009673C(v8, (uint64_t)qword_100346D90);
  v10 = Logger.logObject.getter(v9);
  v14 = static os_log_type_t.info.getter(v10, v11, v12, v13);
  if (os_log_type_enabled(v10, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v14, "Vienna feature flag off, ignoring script install event", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  swift_unknownObjectRelease(a4);
}

- (void).cxx_destruct
{
  sub_1001276CC((uint64_t)self + OBJC_IVAR____TtC10seserviced23SECNotificationListener_delegate);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced23SECNotificationListener_coealescer));
}

@end
