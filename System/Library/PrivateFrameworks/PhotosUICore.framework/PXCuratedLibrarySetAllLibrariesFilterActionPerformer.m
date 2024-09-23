@implementation PXCuratedLibrarySetAllLibrariesFilterActionPerformer

- (PXCuratedLibrarySetAllLibrariesFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibrarySetAllLibrariesFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionSetAllLibrariesFilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeSetAllLibrariesFilter");
  return CFSTR("PXActivityTypeSetAllLibrariesFilter");
}

- (id)activitySystemImageName
{
  __CFString *v2;

  v2 = CFSTR("photo.on.rectangle");
  return CFSTR("photo.on.rectangle");
}

- (int64_t)menuElementState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLibraryFilterActive:", 0);

  return v4;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_All"));
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewMode:", 0);

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryToggleFilterActionPerformer updateToLibraryFilterStateAndFinishTask:](self, "updateToLibraryFilterStateAndFinishTask:", v5);

}

@end
