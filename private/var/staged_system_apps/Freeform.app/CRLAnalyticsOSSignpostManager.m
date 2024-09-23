@implementation CRLAnalyticsOSSignpostManager

+ (_TtC8Freeform29CRLAnalyticsOSSignpostManager)shared
{
  if (qword_1013DCFB8 != -1)
    swift_once(&qword_1013DCFB8, sub_100709B8C);
  return (_TtC8Freeform29CRLAnalyticsOSSignpostManager *)(id)qword_10147F3A8;
}

- (void)beginSignpostIntervalWithName:(id)a3 with:(id)a4
{
  unint64_t v7;
  Swift::OpaquePointer v8;
  id v9;
  _TtC8Freeform29CRLAnalyticsOSSignpostManager *v10;

  v7 = sub_1004F6160();
  v8._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  CRLAnalyticsOSSignpostManager.beginSignpostInterval(name:with:)(v9, v8);

  swift_bridgeObjectRelease(v8._rawValue);
}

- (void)endSignpostIntervalFor:(id)a3
{
  id v5;
  _TtC8Freeform29CRLAnalyticsOSSignpostManager *v6;

  v5 = a3;
  v6 = self;
  CRLAnalyticsOSSignpostManager.endSignpostInterval(for:)((CRLCanvasRep_optional *)a3);

}

- (void)endSignpostIntervalWithName:(id)a3
{
  id v4;
  _TtC8Freeform29CRLAnalyticsOSSignpostManager *v5;

  v4 = a3;
  v5 = self;
  CRLAnalyticsOSSignpostManager.endSignpostInterval(name:)(v4);

}

- (_TtC8Freeform29CRLAnalyticsOSSignpostManager)init
{
  _TtC8Freeform29CRLAnalyticsOSSignpostManager *result;

  result = (_TtC8Freeform29CRLAnalyticsOSSignpostManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLAnalyticsOSSignpostManager", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform29CRLAnalyticsOSSignpostManager_signposter;
  v4 = type metadata accessor for OSSignposter(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform29CRLAnalyticsOSSignpostManager__unsafe_contextList));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform29CRLAnalyticsOSSignpostManager_contextAccessLock));
}

@end
