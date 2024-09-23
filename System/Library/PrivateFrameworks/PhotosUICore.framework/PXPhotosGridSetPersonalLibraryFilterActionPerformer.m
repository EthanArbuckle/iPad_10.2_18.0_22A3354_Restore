@implementation PXPhotosGridSetPersonalLibraryFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return !+[PXPhotosGridToggleFilterActionPerformer isLibaryFilterHidden:viewModel:](PXPhotosGridToggleFilterActionPerformer, "isLibaryFilterHidden:viewModel:", 1, a4);
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

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
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
  id v4;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryFilterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setViewMode:", 1);
  -[PXPhotosGridToggleFilterActionPerformer updateToLibraryFilterStateAndFinishTask:](self, "updateToLibraryFilterStateAndFinishTask:", v4);

}

@end
