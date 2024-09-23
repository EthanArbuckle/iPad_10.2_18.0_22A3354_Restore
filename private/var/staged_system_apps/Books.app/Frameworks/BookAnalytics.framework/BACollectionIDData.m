@implementation BACollectionIDData

- (BACollectionIDData)initWithCollectionID:(id)a3 collectionMemberCount:(unint64_t)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BACollectionIDData_collectionID);
  *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BACollectionIDData_collectionMemberCount) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BridgedCollectionIDData();
  return -[BACollectionIDData init](&v10, "init");
}

- (BACollectionIDData)init
{
  BACollectionIDData *result;

  result = (BACollectionIDData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedCollectionIDData", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->collectionID[OBJC_IVAR___BACollectionIDData_collectionID]);
}

@end
