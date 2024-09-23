@implementation PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return objc_msgSend(a4, sel_supportsSocialGroupActions, a3);
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = self;
  v4 = PXContentFilterTitleForItemTag(20);
  if (v4)
  {
    v5 = v4;
    sub_1A7AE3764();

    v6 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return v6;
}

- (NSString)activityType
{
  void *v2;

  sub_1A7AE3764();
  v2 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)activitySystemImageName
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (int64_t)menuElementState
{
  PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer *v2;
  PXContentFilterState *v3;
  unsigned int v4;

  v2 = self;
  v3 = -[PXPhotosGridActionPerformer currentContentFilterState](v2, sel_currentContentFilterState);
  v4 = -[PXContentFilterState isContentFilterActive:](v3, sel_isContentFilterActive_, 20);

  return v4;
}

- (void)performUserInteractionTask
{
  PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer *v2;
  PXContentFilterState *v3;

  v2 = self;
  v3 = -[PXPhotosGridActionPerformer currentContentFilterState](v2, sel_currentContentFilterState);
  -[PXContentFilterState setIncludeOthersInSocialGroupAssets:](v3, sel_setIncludeOthersInSocialGroupAssets_, -[PXContentFilterState includeOthersInSocialGroupAssets](v3, sel_includeOthersInSocialGroupAssets) ^ 1);
  -[PXPhotosGridToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](v2, sel_updateToContentFilterStateAndFinishTask_, v3);

}

- (PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  id v6;
  void *v7;
  PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer *v8;
  objc_super v10;

  sub_1A7AE3764();
  v6 = a3;
  v7 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer();
  v8 = -[PXPhotosGridActionPerformer initWithViewModel:actionType:](&v10, sel_initWithViewModel_actionType_, v6, v7);

  return v8;
}

@end
