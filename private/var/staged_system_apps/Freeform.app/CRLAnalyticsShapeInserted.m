@implementation CRLAnalyticsShapeInserted

+ (void)sendShapeInsertedAnalyticsWithShapeIdentifier:(id)a3 isMiniShapePicker:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  sub_1005118E4(v5, v7, a4);
  swift_bridgeObjectRelease(v7);
}

- (_TtC8Freeform25CRLAnalyticsShapeInserted)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsShapeInserted();
  return -[CRLAnalyticsShapeInserted init](&v3, "init");
}

@end
