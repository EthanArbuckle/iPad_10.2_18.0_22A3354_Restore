@implementation PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer

- (PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionToggleIncludeSharedWithYouFilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleIncludeSharedWithYouFilter");
  return CFSTR("PXActivityTypeToggleIncludeSharedWithYouFilter");
}

- (id)activitySystemImageName
{
  return CFSTR("shared.with.you");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 3);

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
      v4 = CFSTR("ENABLE_INCLUDE_SWY_FILTER_SHORTCUT");
    else
      v4 = CFSTR("DISABLE_INCLUDE_SWY_FILTER_SHORTCUT");
    PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXContentFilterTitleForItemTag(3);
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
  objc_msgSend(v5, "setIncludeSharedWithYou:", objc_msgSend(v5, "includeSharedWithYou") ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "includeSharedWithYou"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeSharedWithYou:", v3);

  -[PXCuratedLibraryToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v5);
}

@end
