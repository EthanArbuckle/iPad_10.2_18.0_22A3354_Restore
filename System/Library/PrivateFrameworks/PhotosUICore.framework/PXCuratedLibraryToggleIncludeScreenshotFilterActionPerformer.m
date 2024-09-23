@implementation PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer

- (PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionToggleIncludeScreenshotFilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleIncludeScreenshotsFilter");
  return CFSTR("PXActivityTypeToggleIncludeScreenshotsFilter");
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
  v3 = objc_msgSend(v2, "isContentFilterActive:", 2);

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v3;
  __CFString *v4;
  void *v5;

  if (a3 == 1)
  {
    -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "includeScreenshots"))
      v4 = CFSTR("DISABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT");
    else
      v4 = CFSTR("ENABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT");
    PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXContentFilterTitleForItemTag(2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeScreenshots:", objc_msgSend(v5, "includeScreenshots") ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "includeScreenshots"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeScreenshots:", v3);

  -[PXCuratedLibraryToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v5);
}

@end
