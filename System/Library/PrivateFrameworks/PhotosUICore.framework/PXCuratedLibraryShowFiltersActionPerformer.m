@implementation PXCuratedLibraryShowFiltersActionPerformer

- (BOOL)performerResetsAfterCompletion
{
  return 1;
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
  PXUIFilterController *v10;
  void *v11;
  PXUIFilterController *v12;
  PXUIFilterController *v13;
  void *v14;

  filterController = self->_filterController;
  if (!filterController)
  {
    -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedLibraryStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allPhotosContentFilterState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:](PXContentFilterState, "defaultAllPhotosFilterStateForPhotoLibrary:", v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = [PXUIFilterController alloc];
    objc_msgSend(v4, "libraryFilterState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXUIFilterController initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:](v10, "initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:", self, v11, v8, v5, 0);
    v13 = self->_filterController;
    self->_filterController = v12;

    objc_msgSend(v4, "assetsDataSourceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIFilterController setDataSourceManager:](self->_filterController, "setDataSourceManager:", v14);

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

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentContentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFiltering"))
    v4 = CFSTR("line.horizontal.3.decrease.circle.fill");
  else
    v4 = CFSTR("line.horizontal.3.decrease.circle");
  v5 = v4;

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryShowFiltersActionPerformer activityType](self, "activityType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryShowFiltersActionPerformer.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  return 1;
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

  -[PXCuratedLibraryShowFiltersActionPerformer filterController](self, "filterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentContentFilterState");
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

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryFilterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentFilterHiddenTypesForAssetCollection(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PXActionPerformer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "curatedLibraryActionPerformer:contentFilterStateChanged:", self, v6);

}

- (BOOL)_isAlreadyDone
{
  return -[PXActionPerformer state](self, "state") == 0;
}

- (void)filterControllerDidClose:(id)a3
{
  if (!-[PXCuratedLibraryShowFiltersActionPerformer _isAlreadyDone](self, "_isAlreadyDone", a3))
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
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
