@implementation MPAnalyticsLogger

- (void)logEvent:(id)a3 withCoreAnalyticsDictionary:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MPAnalyticsLogger *v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = sub_100013580(0, &qword_1000A2700, NSObject_ptr);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v9, &protocol witness table for String);
  v11 = self;
  sub_10000A374(v6, v8, v10);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v10);
}

- (MPAnalyticsLogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MPAnalyticsLogger();
  return -[MPAnalyticsLogger init](&v3, "init");
}

- (void)logEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  MPAnalyticsLogger *v6;
  void *v7;
  uint64_t v8;
  NSString v9;
  void *v10;
  _QWORD v11[6];

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  sub_100013580(0, (unint64_t *)&qword_1000A26F8, OS_os_log_ptr);
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter(v6);
  v8 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("MPAnalyticsLogger: logging core analytics view %@", 49, 2, &_mh_execute_header, v7, v8, &_swiftEmptyArrayStorage);

  v9 = String._bridgeToObjectiveC()();
  v11[4] = variable initialization expression of ClarityUISceneDelegate.window;
  v11[5] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100007774;
  v11[3] = &unk_10008A9D0;
  v10 = _Block_copy(v11);
  AnalyticsSendEventLazy(v9, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v5);
}

- (void)logCustomGreetingUpdated
{
  uint64_t v3;
  uint64_t inited;
  MPAnalyticsLogger *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[56];

  v3 = sub_10001283C(qword_1000A25D8);
  inited = swift_initStackObject(v3, v9);
  *(_OWORD *)(inited + 16) = xmmword_100067A10;
  *(_QWORD *)(inited + 32) = 0xD000000000000017;
  *(_QWORD *)(inited + 40) = 0x800000010006B0A0;
  sub_100013580(0, (unint64_t *)&qword_1000A26D8, NSNumber_ptr);
  v5 = self;
  *(NSNumber *)(inited + 48) = NSNumber.init(BOOLeanLiteral:)(1);
  v6 = sub_100052054(inited);
  sub_10005251C(v6);
  v8 = v7;
  swift_bridgeObjectRelease(v6);
  sub_10000A374(0xD00000000000002FLL, 0x800000010006B0C0, v8);

  swift_bridgeObjectRelease(v8);
}

@end
