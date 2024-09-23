@implementation PXPhotoKitPlayMovieAssetActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  char v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = _s12PhotosUICore37PhotoKitPlayMovieAssetActionPerformerC10canPerform4with6person11socialGroupSbSo19PXSelectionSnapshotC_So8PHPersonCSgSo08PHSocialO0CSgtFZ_0(v7);

  return v10 & 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return 1;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = (void *)sub_1A7AE3734();
  v6 = PXLocalizedString(v5);

  sub_1A7AE3764();
  v7 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return (id)sub_1A7AE3734();
}

+ (id)createActivityWithActionManager:(id)a3
{
  return _s12PhotosUICore37PhotoKitPlayMovieAssetActionPerformerC14createActivity4withSo10PXActivityCSgSo07PXPhotodgH7ManagerC_tFZ_0();
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return 0;
}

- (void)performUserInteractionTask
{
  PXPhotoKitPlayMovieAssetActionPerformer *v2;

  v2 = self;
  sub_1A6AA8C9C();

}

- (PXPhotoKitPlayMovieAssetActionPerformer)initWithActionType:(id)a3
{
  void *v4;
  PXPhotoKitPlayMovieAssetActionPerformer *v5;
  objc_super v7;

  sub_1A7AE3764();
  v4 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotoKitPlayMovieAssetActionPerformer();
  v5 = -[PXActionPerformer initWithActionType:](&v7, sel_initWithActionType_, v4);

  return v5;
}

@end
