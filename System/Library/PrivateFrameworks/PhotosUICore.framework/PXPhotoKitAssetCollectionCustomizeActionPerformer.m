@implementation PXPhotoKitAssetCollectionCustomizeActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  char v5;

  v4 = a3;
  swift_unknownObjectRetain();
  v5 = sub_1A713679C(v4);

  swift_unknownObjectRelease();
  return v5 & 1;
}

- (void)performUserInteractionTask
{
  _TtC12PhotosUICore49PXPhotoKitAssetCollectionCustomizeActionPerformer *v2;

  v2 = self;
  sub_1A7135F9C();

}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  swift_unknownObjectRetain();
  sub_1A71368B0(v5);
  v7 = v6;

  swift_unknownObjectRelease();
  if (v7)
  {
    v8 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_unknownObjectRetain();
  objc_msgSend(objc_msgSend(v4, sel_assetCollection), sel_px_isSharedAlbum);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  v5 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC12PhotosUICore49PXPhotoKitAssetCollectionCustomizeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _TtC12PhotosUICore49PXPhotoKitAssetCollectionCustomizeActionPerformer *v11;
  objc_super v13;

  sub_1A7AE3764();
  v8 = a4;
  v9 = a5;
  v10 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PXPhotoKitAssetCollectionCustomizeActionPerformer();
  v11 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v13, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v10, v8, v9);

  return v11;
}

@end
