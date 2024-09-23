@implementation BSUIContextActionDataAssetModel

- (BSUIContextActionDataAssetModel)initWithAdamID:(id)a3
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (char *)self + OBJC_IVAR___BSUIContextActionDataAssetModel_initType;
  *(_QWORD *)v5 = v4;
  *((_QWORD *)v5 + 1) = v6;
  v5[40] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContextActionDataModel.Asset();
  return -[BSUIContextActionDataAssetModel init](&v8, "init");
}

- (BSUIContextActionDataAssetModel)initWithLibraryAsset:(id)a3 productProfile:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (BSUIContextActionDataAssetModel *)ContextActionDataModel.Asset.init(libraryAsset:productProfile:)(v5, a4);
}

- (BSUIContextActionDataAssetModel)initWithMResourceRawData:(id)a3
{
  uint64_t v3;
  __n128 v4;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  return (BSUIContextActionDataAssetModel *)ContextActionDataModel.Asset.init(mResourceRawData:)(v3, v4);
}

- (BSUIContextActionDataAssetModel)init
{
  BSUIContextActionDataAssetModel *result;

  result = (BSUIContextActionDataAssetModel *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.Asset", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_14DB1C((uint64_t)self + OBJC_IVAR___BSUIContextActionDataAssetModel_initType);
}

@end
