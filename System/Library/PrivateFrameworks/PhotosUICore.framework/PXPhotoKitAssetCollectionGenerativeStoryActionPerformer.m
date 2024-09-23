@implementation PXPhotoKitAssetCollectionGenerativeStoryActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = sub_1A69C7D38(v5, a4);

  swift_unknownObjectRelease();
  return v6 & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return (id)sub_1A7AE3734();
}

- (void)performUserInteractionTask
{
  PXPhotoKitAssetCollectionGenerativeStoryActionPerformer *v2;

  v2 = self;
  sub_1A69C7008();

}

- (PXPhotoKitAssetCollectionGenerativeStoryActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PXPhotoKitAssetCollectionGenerativeStoryActionPerformer *v11;
  objc_super v13;

  sub_1A7AE3764();
  v8 = a4;
  v9 = a5;
  v10 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PhotoKitAssetCollectionGenerativeStoryActionPerformer();
  v11 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v13, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v10, v8, v9);

  return v11;
}

@end
