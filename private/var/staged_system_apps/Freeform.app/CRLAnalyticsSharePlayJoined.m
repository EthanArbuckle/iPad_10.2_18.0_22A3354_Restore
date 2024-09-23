@implementation CRLAnalyticsSharePlayJoined

- (_TtC8Freeform27CRLAnalyticsSharePlayJoined)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsSharePlayJoined();
  return -[CRLAnalyticsSharePlayJoined init](&v3, "init");
}

+ (void)sendSharePlayJoinedAnalyticsWithTotalTimeDelta:(float)a1 shareLinkDelta:(float)a2 joinShareDelta:(float)a3 fetchBoardDelta:(float)a4 joinCollabDelta:(float)a5
{
  id v10;
  double v11;
  id v12;
  char isUniquelyReferenced_nonNull_native;
  id v14;
  double v15;
  id v16;
  char v17;
  id v18;
  double v19;
  id v20;
  char v21;
  id v22;
  double v23;
  id v24;
  char v25;
  id v26;
  double v27;
  id v28;
  char v29;
  void *v30;
  NSString v31;
  Class isa;

  sub_1008D5C30((uint64_t)_swiftEmptyArrayStorage);
  v10 = objc_allocWithZone((Class)NSNumber);
  *(float *)&v11 = a1;
  v12 = objc_msgSend(v10, "initWithFloat:", v11);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100826868((uint64_t)v12, 0x6D69546C61746F74, 0xEE0061746C654465, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v14 = objc_allocWithZone((Class)NSNumber);
  *(float *)&v15 = a2;
  v16 = objc_msgSend(v14, "initWithFloat:", v15);
  v17 = swift_isUniquelyReferenced_nonNull_native();
  sub_100826868((uint64_t)v16, 0x6E694C6572616873, 0xEE0061746C65446BLL, v17);
  swift_bridgeObjectRelease();
  v18 = objc_allocWithZone((Class)NSNumber);
  *(float *)&v19 = a3;
  v20 = objc_msgSend(v18, "initWithFloat:", v19);
  v21 = swift_isUniquelyReferenced_nonNull_native();
  sub_100826868((uint64_t)v20, 0x726168536E696F6ALL, 0xEE0061746C654465, v21);
  swift_bridgeObjectRelease();
  v22 = objc_allocWithZone((Class)NSNumber);
  *(float *)&v23 = a4;
  v24 = objc_msgSend(v22, "initWithFloat:", v23);
  v25 = swift_isUniquelyReferenced_nonNull_native();
  sub_100826868((uint64_t)v24, 0x616F426863746566, 0xEF61746C65446472, v25);
  swift_bridgeObjectRelease();
  v26 = objc_allocWithZone((Class)NSNumber);
  *(float *)&v27 = a5;
  v28 = objc_msgSend(v26, "initWithFloat:", v27);
  v29 = swift_isUniquelyReferenced_nonNull_native();
  sub_100826868((uint64_t)v28, 0x6C6C6F436E696F6ALL, 0xEF61746C65446261, v29);
  swift_bridgeObjectRelease();
  v30 = (void *)objc_opt_self(CRLAnalyticsLogger);
  v31 = String._bridgeToObjectiveC()();
  sub_100511A70();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v30, "sendEventInDomain:lazily:eventPayload:", v31, 1, isa, swift_bridgeObjectRelease().n128_f64[0]);

}

@end
