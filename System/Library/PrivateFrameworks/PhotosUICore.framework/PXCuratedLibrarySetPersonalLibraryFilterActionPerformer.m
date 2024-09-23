@implementation PXCuratedLibrarySetPersonalLibraryFilterActionPerformer

- (PXCuratedLibrarySetPersonalLibraryFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibrarySetPersonalLibraryFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionSetPersonalLibraryFilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeSetPersonalLibraryFilter");
  return CFSTR("PXActivityTypeSetPersonalLibraryFilter");
}

- (id)activitySystemImageName
{
  __CFString *v2;

  v2 = CFSTR("person");
  return CFSTR("person");
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
  v4 = objc_msgSend(v3, "isLibraryFilterActive:", 1);

  return v4;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_Personal"));
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
  objc_msgSend(v4, "setViewMode:", 1);

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryToggleFilterActionPerformer updateToLibraryFilterStateAndFinishTask:](self, "updateToLibraryFilterStateAndFinishTask:", v5);

}

@end
