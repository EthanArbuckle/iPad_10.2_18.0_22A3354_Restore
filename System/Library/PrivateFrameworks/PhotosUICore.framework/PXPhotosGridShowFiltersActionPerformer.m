@implementation PXPhotosGridShowFiltersActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  if (objc_msgSend(v4, "canFilterContent"))
  {
    objc_msgSend(v4, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canContainAssets");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PXUIFilterController)filterController
{
  PXUIFilterController *filterController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PXUIFilterController *v14;
  void *v15;
  PXUIFilterController *v16;
  PXUIFilterController *v17;
  void *v18;

  filterController = self->_filterController;
  if (!filterController)
  {
    -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedLibraryStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentFilterState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v5, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXContentFilterState defaultFilterStateForPhotoLibrary:](PXContentFilterState, "defaultFilterStateForPhotoLibrary:", v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = PXFilterControllerOptionsForCollection(v12);
    if (objc_msgSend(v4, "hidesAssetCountInFooter"))
      v13 |= 8uLL;
    v14 = [PXUIFilterController alloc];
    objc_msgSend(v4, "libraryFilterState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXUIFilterController initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:](v14, "initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:", self, v15, v8, v5, v13);
    v17 = self->_filterController;
    self->_filterController = v16;

    objc_msgSend(v4, "dataSourceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIFilterController setDataSourceManager:](self->_filterController, "setDataSourceManager:", v18);

    filterController = self->_filterController;
  }
  return filterController;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeShowFilters");
  return CFSTR("PXActivityTypeShowFilters");
}

- (id)activitySystemImageName
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFiltering"))
    v4 = CFSTR("line.horizontal.3.decrease.circle.fill");
  else
    v4 = CFSTR("line.horizontal.3.decrease.circle");
  v5 = v4;

  return v5;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsShowFilters"), CFSTR("PhotosUICore"));
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  -[PXPhotosGridShowFiltersActionPerformer filterController](self, "filterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setContentFilterState:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);
  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v3);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v7))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "Failed to present view controller for filter action.", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present view controller for filter action."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v10);

  }
}

- (id)contentFilterHiddenTypesForFilterController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryFilterState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentFilterHiddenTypesForAssetCollection(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PXActionPerformer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosGridActionPerformer:contentFilterStateChanged:", self, v5);

}

- (void)filterControllerDidClose:(id)a3
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (void)setFilterController:(id)a3
{
  objc_storeStrong((id *)&self->_filterController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterController, 0);
}

@end
