@implementation PXHorizontalContentSyndicationGadgetProvider

- (void)_configureDataSourceManager
{
  void *v3;
  PXContentSyndicationDataSourceManager *v4;
  void *v5;
  PXContentSyndicationDataSourceManager *dataSourceManager;
  PXContentSyndicationDataSourceManager *v7;
  void *v8;

  +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syndicationItemsDataSourceManager");
  v4 = (PXContentSyndicationDataSourceManager *)objc_claimAutoreleasedReturnValue();

  -[PXHorizontalContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterChangeObserver:context:", self, PXDataSourceManagerObservationContext_284299);

  dataSourceManager = self->_dataSourceManager;
  self->_dataSourceManager = v4;
  v7 = v4;

  -[PXHorizontalContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerChangeObserver:context:", self, PXDataSourceManagerObservationContext_284299);

  -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_284332);
  -[PXHorizontalContentSyndicationGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (void)_configureDataSourceManagerIfNecessary
{
  void *v3;

  -[PXHorizontalContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PXHorizontalContentSyndicationGadgetProvider _configureDataSourceManager](self, "_configureDataSourceManager");
}

- (void)_updateGadgets
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PXHorizontalCollectionGadget *v8;
  void *v9;
  void *v10;
  PXHorizontalCollectionGadget *v11;
  BOOL v12;
  PXContentSyndicationGadgetProvider *v13;
  void *v14;
  PXContentSyndicationGadgetProvider *v15;
  PXHorizontalCollectionGadget *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  PXHorizontalCollectionGadget *v21;
  _QWORD v22[4];
  id v23;
  id location;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!-[PXHorizontalContentSyndicationGadgetProvider didGenerateGadgets](self, "didGenerateGadgets"))
    return;
  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsAnyItems") & 1) != 0)
  {
    -[PXHorizontalContentSyndicationGadgetProvider libraryFilterState](self, "libraryFilterState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "viewMode");

    if (v6 != 2)
    {
      -[PXGadgetProvider gadgets](self, "gadgets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalContentSyndicationGadgetProvider.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[horizontalGadget isKindOfClass:[PXHorizontalCollectionGadget class]]"));

        }
      }
      else
      {
        v13 = [PXContentSyndicationGadgetProvider alloc];
        -[PXHorizontalContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PXContentSyndicationGadgetProvider initWithDataSourceManager:](v13, "initWithDataSourceManager:", v14);

        v16 = [PXHorizontalCollectionGadget alloc];
        v27[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[PXHorizontalCollectionGadget initWithProviders:](v16, "initWithProviders:", v17);

        -[PXHorizontalCollectionGadget setGadgetType:](v8, "setGadgetType:", 21);
        -[PXHorizontalCollectionGadget setDefaultColumnSpan:](v8, "setDefaultColumnSpan:", 2);
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithVerticalSizeClass:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v18;
        v26 = &unk_1E53EF6C0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXHorizontalCollectionGadget setColumnSpans:](v8, "setColumnSpans:", v19);

        -[PXHorizontalCollectionGadget setIsFixedHeight:](v8, "setIsFixedHeight:", 1);
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __62__PXHorizontalContentSyndicationGadgetProvider__updateGadgets__block_invoke;
        v22[3] = &unk_1E51452F8;
        objc_copyWeak(&v23, &location);
        -[PXHorizontalCollectionGadget setAccessoryButtonAction:](v8, "setAccessoryButtonAction:", v22);
        -[PXHorizontalCollectionGadget performChanges:](v8, "performChanges:", &__block_literal_global_136_284321);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  v8 = 0;
LABEL_9:
  -[PXGadgetProvider gadgets](self, "gadgets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == v8;

  if (!v12)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__PXHorizontalContentSyndicationGadgetProvider__updateGadgets__block_invoke_3;
    v20[3] = &unk_1E5145360;
    v21 = v8;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v20);

  }
}

- (void)_presentSeeAllViewControllerForGadget:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  PXPhotosUIViewController *v11;
  PXPhotosUIViewController *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXContentSyndicationDataSourceManager allAssetsFetchResult](self->_dataSourceManager, "allAssetsFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    PXPhotosViewConfigurationForSocialGroup(0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNavBarStyle:", 1);
    PXContentSyndicationLocalizedSocialLayerTitle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    objc_msgSend(v9, "setContentStartingPosition:", 1);
    objc_msgSend(v9, "setWantsOneUpShowInLibraryButton:", 1);
    objc_msgSend(v9, "setOneUpPresentationOrigin:", 16);
    v11 = [PXPhotosUIViewController alloc];

    v12 = -[PXPhotosUIViewController initWithConfiguration:](v11, "initWithConfiguration:", v9);
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gadget:transitionToViewController:animated:completion:", v6, v12, v4, 0);

  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Error: Unable to present view controller for fetch result of class: %{public}@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (PXHorizontalContentSyndicationGadgetProvider)initWithLibraryFilterState:(id)a3
{
  id v5;
  PXHorizontalContentSyndicationGadgetProvider *v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXHorizontalContentSyndicationGadgetProvider;
  v6 = -[PXGadgetProvider init](&v9, sel_init);
  if (v6)
  {
    +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerChangeObserver:context:", v6, PXConfigurationObservationContext_284300);

    objc_storeStrong((id *)&v6->_libraryFilterState, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v6, PXLibraryFilterStateObservationContext_284301);
  }

  return v6;
}

- (PXHorizontalContentSyndicationGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalContentSyndicationGadgetProvider.m"), 151, CFSTR("%s is not available as initializer"), "-[PXHorizontalContentSyndicationGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXHorizontalContentSyndicationGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalContentSyndicationGadgetProvider.m"), 155, CFSTR("%s is not available as initializer"), "-[PXHorizontalContentSyndicationGadgetProvider init]");

  abort();
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[PXHorizontalContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsAnyItems");

  return v4;
}

- (void)generateGadgets
{
  self->_didGenerateGadgets = 1;
  -[PXHorizontalContentSyndicationGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (void)ppt_presentSeeAllViewController
{
  void *v3;
  id v4;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[PXHorizontalContentSyndicationGadgetProvider _presentSeeAllViewControllerForGadget:animated:](self, "_presentSeeAllViewControllerForGadget:animated:", v4, 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXDataSourceManagerObservationContext_284299 == a5)
  {
LABEL_5:
    v11 = v9;
    -[PXHorizontalContentSyndicationGadgetProvider _updateGadgets](self, "_updateGadgets");
LABEL_8:
    v9 = v11;
    goto LABEL_9;
  }
  if ((void *)PXConfigurationObservationContext_284300 == a5)
  {
    if ((v6 & 3) != 0)
    {
      v11 = v9;
      -[PXHorizontalContentSyndicationGadgetProvider _configureDataSourceManager](self, "_configureDataSourceManager");
      goto LABEL_8;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_284301 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalContentSyndicationGadgetProvider.m"), 194, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
      goto LABEL_5;
  }
LABEL_9:

}

- (NSDate)mostRecentContentDate
{
  return 0;
}

- (int64_t)forYouContentIdentifier
{
  return 4;
}

- (PXContentSyndicationDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)didGenerateGadgets
{
  return self->_didGenerateGadgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __62__PXHorizontalContentSyndicationGadgetProvider__updateGadgets__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_presentSeeAllViewControllerForGadget:animated:", v3, 1);

}

void __62__PXHorizontalContentSyndicationGadgetProvider__updateGadgets__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t v8[16];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  PLSyndicationUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Presenting Shared with You section in For You", v8, 2u);
    }

    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGadgets:", v7);

    v4 = (id)v7;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Removing Shared with You section from For You", v8, 2u);
    }

    objc_msgSend(v4, "removeAllGadgets");
  }

}

void __62__PXHorizontalContentSyndicationGadgetProvider__updateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  PXContentSyndicationLocalizedSocialLayerTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCollectionTitle:", v3);

  objc_msgSend(v2, "setCollectionAccessoryButtonType:", 1);
  PXLocalizedStringFromTable(CFSTR("PXContentSyndicationGadgetSeeAllButtonTitle"), CFSTR("PhotosUICore"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCollectionAccessoryButtonTitle:", v4);

}

uint64_t __75__PXHorizontalContentSyndicationGadgetProvider__configureDataSourceManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

@end
