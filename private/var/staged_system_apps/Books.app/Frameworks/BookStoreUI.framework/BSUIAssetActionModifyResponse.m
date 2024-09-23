@implementation BSUIAssetActionModifyResponse

- (NSString)collectionTitle
{
  return (NSString *)sub_D7734((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIAssetActionModifyResponse_collectionTitle);
}

- (NSString)assetID
{
  return (NSString *)sub_D7734((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIAssetActionModifyResponse_assetID);
}

- (int64_t)assetContentType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyResponse_assetContentType);
}

- (BSUIAssetActionModifyResponse)initWithCollectionTitle:(id)a3 assetID:(id)a4 assetContentType:(int64_t)a5
{
  objc_class *ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyResponse_collectionTitle);
  *v14 = v10;
  v14[1] = v12;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyResponse_assetID);
  *v15 = v13;
  v15[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyResponse_assetContentType) = (Class)a5;
  v18.receiver = self;
  v18.super_class = ObjectType;
  return -[BSUIAssetActionModifyResponse init](&v18, "init");
}

- (BSUIAssetActionModifyResponse)init
{
  BSUIAssetActionModifyResponse *result;

  result = (BSUIAssetActionModifyResponse *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.AssetActionModifyResponse", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->collectionTitle[OBJC_IVAR___BSUIAssetActionModifyResponse_collectionTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->collectionTitle[OBJC_IVAR___BSUIAssetActionModifyResponse_assetID]);
}

@end
