@implementation PXCuratedLibraryUnfilterActionPerformer

- (PXCuratedLibraryUnfilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUnfilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionUnfilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeUnfilter");
  return CFSTR("PXActivityTypeUnfilter");
}

- (id)activitySystemImageName
{
  return CFSTR("square.grid.3x3");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 1);

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXContentFilterTitleForItemTag(1);
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:](PXContentFilterState, "defaultAllPhotosFilterStateForPhotoLibrary:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v5);
}

@end
