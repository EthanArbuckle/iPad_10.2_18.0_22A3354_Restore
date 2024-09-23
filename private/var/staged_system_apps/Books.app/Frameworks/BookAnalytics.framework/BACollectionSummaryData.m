@implementation BACollectionSummaryData

- (BACollectionSummaryData)initWithCollectionSummary:(id)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = type metadata accessor for BridgedCollectionIDData();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BACollectionSummaryData_collectionSummary) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BridgedCollectionSummaryData();
  return -[BACollectionSummaryData init](&v7, "init");
}

- (BACollectionSummaryData)init
{
  BACollectionSummaryData *result;

  result = (BACollectionSummaryData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedCollectionSummaryData", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BACollectionSummaryData_collectionSummary));
}

@end
