@implementation PXPhotosGridToggleShowOnlyScreenshotFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleShowOnlyScreenshotFilterActionPerformer;
  if (objc_msgSendSuper2(&v9, sel_canPerformActionType_withViewModel_, a3, v6))
    v7 = !+[PXPhotosGridToggleFilterActionPerformer isContentFilterHidden:viewModel:](PXPhotosGridToggleFilterActionPerformer, "isContentFilterHidden:viewModel:", 13, v6);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleShowOnlyScreenshotsFilter");
  return CFSTR("PXActivityTypeToggleShowOnlyScreenshotsFilter");
}

- (id)activitySystemImageName
{
  return CFSTR("camera.viewfinder");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 13);

  return v3;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isContentFilterActive:", 8))
    v6 = objc_msgSend(v5, "isContentFilterActive:", 7) ^ 1;
  else
    v6 = 0;
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstAssetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0 && !objc_msgSend(v9, "px_isVideosSmartAlbum"))
  {
    if (a3 != 1)
    {
      PXContentFilterTitleForItemTag(13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v10 = objc_msgSend(v5, "showOnlyScreenshots");
    v11 = CFSTR("ENABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT");
    v12 = CFSTR("DISABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT");
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    v10 = objc_msgSend(v5, "showOnlyScreenshots");
    v11 = CFSTR("ENABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT");
    v12 = CFSTR("DISABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT");
LABEL_11:
    if (v10)
      v13 = (__CFString *)v12;
    else
      v13 = (__CFString *)v11;
    goto LABEL_14;
  }
  v13 = CFSTR("PXContentFilterMenu_ScreenRecordings");
LABEL_14:
  PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v15 = (void *)v14;

  return v15;
}

- (void)performUserInteractionTask
{
  id v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowOnlyScreenshots:", objc_msgSend(v3, "showOnlyScreenshots") ^ 1);
  -[PXPhotosGridToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v3);

}

@end
