@implementation BKCollectionControllerMemberManagingModifyResponse

- (NSString)assetID
{
  return (NSString *)sub_7512C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID);
}

- (int64_t)assetContentType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType);
}

- (NSString)collectionTitle
{
  return (NSString *)sub_7512C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle);
}

- (BKCollectionControllerMemberManagingModifyResponse)initWithAssetID:(id)a3 assetContentType:(int64_t)a4 collectionTitle:(id)a5
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
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID);
  *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType) = (Class)a4;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle);
  *v15 = v13;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = ObjectType;
  return -[BKCollectionControllerMemberManagingModifyResponse init](&v18, "init");
}

- (BKCollectionControllerMemberManagingModifyResponse)init
{
  BKCollectionControllerMemberManagingModifyResponse *result;

  result = (BKCollectionControllerMemberManagingModifyResponse *)_swift_stdlib_reportUnimplementedInitializer("BKLibrary.CollectionControllerMemberManagingModifyResponse", 58, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_7546C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID, &OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle);
}

@end
