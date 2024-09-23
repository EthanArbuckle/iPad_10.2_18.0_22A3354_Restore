@implementation BSUIContextMenuAssetPropertyProvider

- (NSString)assetID
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSUIContextMenuAssetPropertyProvider *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo);
  v4 = v3[3];
  v5 = v3[4];
  sub_66898(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (int64_t)assetType
{
  BSUIContextMenuAssetPropertyProvider *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1F663C();

  return v3;
}

- (BOOL)isOwned
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  BSUIContextMenuAssetPropertyProvider *v7;
  char v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo);
  v4 = v3[3];
  v5 = v3[4];
  sub_66898(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 152);
  v7 = self;
  v8 = v6(v4, v5);

  return v8 & 1;
}

- (BOOL)isStoreAsset
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSUIContextMenuAssetPropertyProvider *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo);
  v4 = v3[3];
  v5 = v3[4];
  sub_66898(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 288);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
    swift_bridgeObjectRelease(v9);
  return v9 != 0;
}

- (BSUIContextMenuAssetPropertyProvider)init
{
  BSUIContextMenuAssetPropertyProvider *result;

  result = (BSUIContextMenuAssetPropertyProvider *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.ContextMenuAssetPropertyProvider", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s11BookStoreUI5ShelfV20HeaderComponentModelVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo));
}

@end
