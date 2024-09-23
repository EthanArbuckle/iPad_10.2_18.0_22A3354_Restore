@implementation PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer

- (PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionToggleShowOnlyScreenshotFilter"), a3);
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

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 13);

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isContentFilterActive:", 8)
    && (objc_msgSend(v4, "isContentFilterActive:", 7) & 1) == 0)
  {
    if (a3 != 1)
    {
      v9 = CFSTR("PXContentFilterMenu_ScreenRecordings");
LABEL_12:
      PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v5 = objc_msgSend(v4, "showOnlyScreenshots");
    v6 = CFSTR("ENABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT");
    v7 = CFSTR("DISABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT");
LABEL_8:
    if (v5)
      v9 = (__CFString *)v7;
    else
      v9 = (__CFString *)v6;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    v5 = objc_msgSend(v4, "showOnlyScreenshots");
    v6 = CFSTR("ENABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT");
    v7 = CFSTR("DISABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT");
    goto LABEL_8;
  }
  PXContentFilterTitleForItemTag(13);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v10 = (void *)v8;

  return v10;
}

- (void)performUserInteractionTask
{
  id v3;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowOnlyScreenshots:", objc_msgSend(v3, "showOnlyScreenshots") ^ 1);
  -[PXCuratedLibraryToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v3);

}

@end
