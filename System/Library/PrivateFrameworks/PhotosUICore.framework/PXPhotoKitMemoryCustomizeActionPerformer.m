@implementation PXPhotoKitMemoryCustomizeActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  swift_unknownObjectRetain();
  v5 = objc_msgSend(v4, sel_assetCollection);
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass() != 0;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v6;
}

- (void)performUserInteractionTask
{
  _TtC12PhotosUICore40PXPhotoKitMemoryCustomizeActionPerformer *v2;

  v2 = self;
  sub_1A6F1C118();

}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  swift_unknownObjectRetain();
  v6 = (void *)sub_1A7AE3734();
  v7 = PXLocalizedString(v6);

  sub_1A7AE3764();
  swift_unknownObjectRelease();

  v8 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return (id)sub_1A7AE3734();
}

- (_TtC12PhotosUICore40PXPhotoKitMemoryCustomizeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _TtC12PhotosUICore40PXPhotoKitMemoryCustomizeActionPerformer *v11;
  objc_super v13;

  sub_1A7AE3764();
  v8 = a4;
  v9 = a5;
  v10 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PXPhotoKitMemoryCustomizeActionPerformer();
  v11 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v13, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v10, v8, v9);

  return v11;
}

@end
