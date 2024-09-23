@implementation PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer

- (PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionToggleShowOnlySharedWithYouFilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleShowOnlySharedWithYouFilter");
  return CFSTR("PXActivityTypeToggleShowOnlySharedWithYouFilter");
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
  v3 = objc_msgSend(v2, "isContentFilterActive:", 14);

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
    if (objc_msgSend(v3, "showOnlyScreenshots"))
      v4 = CFSTR("DISABLE_SHOW_ONLY_SWY_FILTER_SHORTCUT");
    else
      v4 = CFSTR("ENABLE_SHOW_ONLY_SWY_FILTER_SHORTCUT");
    PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXContentFilterTitleForItemTag(14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)performUserInteractionTask
{
  id v3;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowOnlySharedWithYou:", objc_msgSend(v3, "showOnlySharedWithYou") ^ 1);
  -[PXCuratedLibraryToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v3);

}

@end
