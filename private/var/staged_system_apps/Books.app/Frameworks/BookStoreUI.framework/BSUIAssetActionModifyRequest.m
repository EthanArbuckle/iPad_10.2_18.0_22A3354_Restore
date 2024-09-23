@implementation BSUIAssetActionModifyRequest

- (NSString)storeID
{
  return (NSString *)sub_D7734((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIAssetActionModifyRequest_storeID);
}

- (NSString)collectionID
{
  return (NSString *)sub_D7734((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIAssetActionModifyRequest_collectionID);
}

- (_TtC13BookAnalytics9BATracker)tracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___BSUIAssetActionModifyRequest_tracker));
}

- (BSUIAssetActionModifyRequest)initWithStoreID:(id)a3 collectionID:(id)a4 tracker:(id)a5
{
  objc_class *ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyRequest_storeID);
  *v14 = v10;
  v14[1] = v12;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyRequest_collectionID);
  *v15 = v13;
  v15[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyRequest_tracker) = (Class)a5;
  v19.receiver = self;
  v19.super_class = ObjectType;
  v17 = a5;
  return -[BSUIAssetActionModifyRequest init](&v19, "init");
}

- (BSUIAssetActionModifyRequest)init
{
  BSUIAssetActionModifyRequest *result;

  result = (BSUIAssetActionModifyRequest *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.AssetActionModifyRequest", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->storeID[OBJC_IVAR___BSUIAssetActionModifyRequest_storeID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->storeID[OBJC_IVAR___BSUIAssetActionModifyRequest_collectionID]);

}

@end
