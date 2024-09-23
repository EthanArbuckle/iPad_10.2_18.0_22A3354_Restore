@implementation CRLAnalyticsDataStore

- (void)dealloc
{
  _TtC8Freeform21CRLAnalyticsDataStore *v2;

  v2 = self;
  CRLAnalyticsDataStore.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->supportsEndToEndEncryption[OBJC_IVAR____TtC8Freeform21CRLAnalyticsDataStore_lastSeenUserID]);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLAnalyticsDataStore_lastSeenUserIDRotationDate, &qword_1013E04F0);
}

- (void)kvsDidChangeExternally:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform21CRLAnalyticsDataStore *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005698F4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)checkEndToEndEncryptionSupport
{
  _TtC8Freeform21CRLAnalyticsDataStore *v2;

  v2 = self;
  sub_10056A4E8();

}

- (_TtC8Freeform21CRLAnalyticsDataStore)init
{
  _TtC8Freeform21CRLAnalyticsDataStore *result;

  result = (_TtC8Freeform21CRLAnalyticsDataStore *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLAnalyticsDataStore", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
