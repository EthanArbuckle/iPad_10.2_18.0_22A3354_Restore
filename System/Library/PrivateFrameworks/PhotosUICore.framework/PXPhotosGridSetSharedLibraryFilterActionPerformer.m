@implementation PXPhotosGridSetSharedLibraryFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return !+[PXPhotosGridToggleFilterActionPerformer isLibaryFilterHidden:viewModel:](PXPhotosGridToggleFilterActionPerformer, "isLibaryFilterHidden:viewModel:", 2, a4);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeSetSharedLibraryFilter");
  return CFSTR("PXActivityTypeSetSharedLibraryFilter");
}

- (id)activitySystemImageName
{
  __CFString *v2;

  v2 = CFSTR("person.2");
  return CFSTR("person.2");
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
  v4 = objc_msgSend(v3, "isLibraryFilterActive:", 2);

  return v4;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hasPreview");
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_Shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)performUserInteractionTask
{
  void *v3;
  id v4;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryFilterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setViewMode:", 2);
  -[PXPhotosGridToggleFilterActionPerformer updateToLibraryFilterStateAndFinishTask:](self, "updateToLibraryFilterStateAndFinishTask:", v4);

}

@end
