@implementation BKCollectionControllerMemberManagingRemoveRequest

- (NSString)storeID
{
  return (NSString *)sub_7512C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID);
}

- (NSString)collectionID
{
  return (NSString *)sub_7512C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID);
}

- (BKCollectionControllerMemberManagingRemoveRequest)initWithStoreID:(id)a3 collectionID:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID);
  *v12 = v8;
  v12[1] = v10;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID);
  *v13 = v11;
  v13[1] = v14;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return -[BKCollectionControllerMemberManagingRemoveRequest init](&v16, "init");
}

- (BKCollectionControllerMemberManagingRemoveRequest)init
{
  BKCollectionControllerMemberManagingRemoveRequest *result;

  result = (BKCollectionControllerMemberManagingRemoveRequest *)_swift_stdlib_reportUnimplementedInitializer("BKLibrary.CollectionControllerMemberManagingRemoveRequest", 57, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_7546C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID, &OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID);
}

@end
