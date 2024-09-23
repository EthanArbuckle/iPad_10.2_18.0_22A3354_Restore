@implementation PXImportAssetActionManager

- (PXImportAssetActionManager)initWithImportItem:(id)a3 importController:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importItem) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importController) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ImportAssetActionManager();
  v6 = a3;
  v7 = a4;
  return -[PXAssetActionManager initWithSelectionManager:](&v9, sel_initWithSelectionManager_, 0);
}

- (BOOL)canPerformActionType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  PXImportAssetActionManager *v10;
  PXImportAssetActionManager *v11;
  id v12;

  v4 = sub_1A7AE3764();
  v6 = v5;
  if (v4 == sub_1A7AE3764() && v6 == v7)
  {
    v11 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A7AE4DB4();
    v10 = self;
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
  }
  v12 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importItem), sel_importAsset);

  swift_bridgeObjectRelease();
  if (v12)
  {

    return 1;
  }
  return 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PXImportAssetActionManager *v7;
  id v8;

  v4 = sub_1A7AE3764();
  v6 = v5;
  v7 = self;
  v8 = sub_1A6A8A380(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (PXImportAssetActionManager)initWithSelectionManager:(id)a3
{
  id v3;
  PXImportAssetActionManager *result;

  v3 = a3;
  result = (PXImportAssetActionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
