@implementation PXCMMBannerTileController

- (PXCMMBannerTileController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMBannerTileController.m"), 51, CFSTR("%s is not available as initializer"), "-[PXCMMBannerTileController init]");

  abort();
}

- (PXCMMBannerTileController)initWithActivityType:(unint64_t)a3 sourceType:(unint64_t)a4 viewModel:(id)a5 momentShareStatusPresentation:(id)a6 importStatusManager:(id)a7
{
  id v14;
  id v15;
  id v16;
  PXCMMBannerTileController *v17;
  PXCMMBannerTileController *v18;
  void *v20;
  objc_super v21;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMBannerTileController.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PXCMMBannerTileController;
  v17 = -[PXCMMBannerTileController init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_activityType = a3;
    v17->_sourceType = a4;
    objc_storeStrong((id *)&v17->_viewModel, a5);
    -[PXCMMViewModel registerChangeObserver:context:](v18->_viewModel, "registerChangeObserver:context:", v18, PXViewModelObservationContext_179343);
    objc_storeStrong((id *)&v18->_momentShareStatusPresentation, a6);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v18->_momentShareStatusPresentation, "registerChangeObserver:context:", v18, PXMomentShareStatusPresentationObservationContext_179344);
    objc_storeStrong((id *)&v18->_importStatusManager, a7);
  }

  return v18;
}

- (void)setPeopleSuggestionsDataSourceManager:(id)a3
{
  PXPeopleSuggestionsDataSourceManager *v5;
  PXPeopleSuggestionsDataSourceManager *v6;
  char v7;
  PXPeopleSuggestionsDataSourceManager *v8;

  v8 = (PXPeopleSuggestionsDataSourceManager *)a3;
  v5 = self->_peopleSuggestionsDataSourceManager;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXPeopleSuggestionsDataSourceManager isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_peopleSuggestionsDataSourceManager, "unregisterChangeObserver:context:", self, PXPeopleSuggestionsDataSourceManagerContext);
      objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, a3);
      -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_peopleSuggestionsDataSourceManager, "registerChangeObserver:context:", self, PXPeopleSuggestionsDataSourceManagerContext);
      -[PXCMMBannerTileController _updatePeopleSuggestionNames](self, "_updatePeopleSuggestionNames");
    }
  }

}

- (void)_updateCounts
{
  uint64_t v4;
  NSArray *localizedNames;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PXCMMViewModel *v18;

  v18 = self->_viewModel;
  v4 = -[PXCMMViewModel selectedCount](v18, "selectedCount");
  switch(self->_activityType)
  {
    case 0uLL:
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMBannerTileController.m"), 138, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1uLL:
      localizedNames = self->_localizedNames;
      -[PXCMMBannerTileController bannerView](self, "bannerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLocalizedNamesForHeadline:", localizedNames);

      PXLocalizedAssetCountForUsage(v4, -[PXCMMViewModel aggregateMediaType](v18, "aggregateMediaType"), 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMBannerTileController bannerView](self, "bannerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSubheadline:", v7);

      goto LABEL_12;
    case 2uLL:
      PXLocalizedAssetMessageForUsage(-[PXCMMViewModel aggregateMediaType](v18, "aggregateMediaType"), 0, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMBannerTileController bannerView](self, "bannerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHeadline:", v7);

      if (-[PXCMMViewModel isSelecting](v18, "isSelecting"))
      {
        v10 = -[PXCMMViewModel aggregateMediaTypeForSelection](v18, "aggregateMediaTypeForSelection");
      }
      else
      {
        v11 = -[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentation, "state");
        if (v11 == 5 || v11 == 3)
        {
          v12 = -[PXCMMViewModel aggregateMediaTypeForSelection](v18, "aggregateMediaTypeForSelection");
          v13 = v4;
          v14 = 20;
          goto LABEL_11;
        }
        v4 = -[PXCMMViewModel totalCount](v18, "totalCount");
        v10 = -[PXCMMViewModel aggregateMediaType](v18, "aggregateMediaType");
      }
      v12 = v10;
      v13 = v4;
      v14 = 0;
LABEL_11:
      PXLocalizedAssetCountForUsage(v13, v12, 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMBannerTileController bannerView](self, "bannerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSubheadline:", v15);

LABEL_12:
LABEL_13:

      return;
    case 3uLL:
      -[PXCMMBannerTileController bannerView](self, "bannerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHeadline:", 0);
      goto LABEL_12;
    default:
      goto LABEL_13;
  }
}

- (void)_updateBannerActionButton
{
  uint64_t v3;
  unint64_t activityType;
  unint64_t sourceType;
  uint64_t v6;
  void *v7;
  void *v8;
  PXAssetImportStatusManager *importStatusManager;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id location;
  id v25;

  v3 = -[PXCMMViewModel selectedCount](self->_viewModel, "selectedCount");
  activityType = self->_activityType;
  sourceType = self->_sourceType;
  v6 = -[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentation, "state");
  -[PXCMMViewModel selectionManager](self->_viewModel, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  importStatusManager = self->_importStatusManager;
  v25 = 0;
  PXCMMActionButton(activityType, sourceType, v6, v8, importStatusManager, 0, &v25);
  v10 = v25;

  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __54__PXCMMBannerTileController__updateBannerActionButton__block_invoke;
  v21 = &unk_1E5147280;
  objc_copyWeak(&v23, &location);
  v11 = v10;
  v22 = v11;
  v12 = _Block_copy(&v18);
  -[PXCMMBannerTileController bannerView](self, "bannerView", v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v3 <= 0)
    v15 = 0;
  else
    v15 = v12;
  objc_msgSend(v13, "setActionButtonWithTitle:actionBlock:", v11, v15);

  v16 = -[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentation, "state");
  if (v16 <= 6 && ((1 << v16) & 0x61) != 0)
  {
    -[PXCMMBannerTileController bannerView](self, "bannerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAddingPhotos:", 0);

  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_handleButtonActionWithTitle:(id)a3
{
  void *v4;
  id v5;

  -[PXCMMBannerTileController _configureBannerViewActionButtonWithTitle:](self, "_configureBannerViewActionButtonWithTitle:", a3);
  -[PXCMMBannerTileController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapActionButtonInBannerTileController:", self);

  if (self->_activityType == 2)
  {
    -[PXCMMBannerTileController bannerView](self, "bannerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAddingPhotos:", 1);

  }
}

- (void)_updateLoadingPeopleSuggestions
{
  _BOOL8 v3;
  id v4;

  v3 = -[PXCMMViewModel isLoadingPeopleSuggestions](self->_viewModel, "isLoadingPeopleSuggestions");
  -[PXCMMBannerTileController bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadingPeopleSuggestions:", v3);

}

- (void)_configureBannerViewActionButtonWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  if (self->_activityType == 2)
  {
    v9 = v4;
    -[PXCMMViewModel selectionManager](self->_viewModel, "selectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "areAllUnsavedAssetsSelectedWithImportStatusManager:", self->_importStatusManager);

    if (v7)
    {
      -[PXCMMBannerTileController bannerView](self, "bannerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActionButtonWithTitle:actionBlock:", v9, 0);

    }
    v4 = v9;
  }

}

- (void)_updateContainsUnverifierPersons
{
  _BOOL8 v3;
  id v4;

  v3 = -[PXCMMViewModel containsUnverifiedPersons](self->_viewModel, "containsUnverifiedPersons");
  -[PXCMMBannerTileController bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainsUnverifiedPersons:", v3);

}

- (UIView)view
{
  void *v3;
  PXCMMPosterBannerView *v4;
  PXCMMPosterBannerView *v5;

  -[PXCMMBannerTileController bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [PXCMMPosterBannerView alloc];
    v5 = -[PXCMMPosterBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PXCMMBannerTileController setBannerView:](self, "setBannerView:", v5);

    -[PXCMMBannerTileController _updateLocalizedNamesByViewModel](self, "_updateLocalizedNamesByViewModel");
    -[PXCMMBannerTileController _updateCounts](self, "_updateCounts");
    -[PXCMMBannerTileController _updateBannerActionButton](self, "_updateBannerActionButton");
    -[PXCMMBannerTileController _updateContainsUnverifierPersons](self, "_updateContainsUnverifierPersons");
  }
  return (UIView *)-[PXCMMBannerTileController bannerView](self, "bannerView");
}

- (void)becomeReusable
{
  void *v3;

  -[PXCMMBannerTileController bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXCMMBannerTileController setPeopleSuggestionsDataSourceManager:](self, "setPeopleSuggestionsDataSourceManager:", 0);
}

- (void)prepareForReuse
{
  id v2;

  -[PXCMMBannerTileController bannerView](self, "bannerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXViewModelObservationContext_179343 == a5)
  {
    v11 = v9;
    if ((*(_QWORD *)&v6 & 0x10606) == 0)
    {
      if ((v6 & 0x800) != 0)
      {
        -[PXCMMBannerTileController _updateLoadingPeopleSuggestions](self, "_updateLoadingPeopleSuggestions");
      }
      else
      {
        if ((v6 & 0x8000) == 0)
          goto LABEL_12;
        -[PXCMMBannerTileController _updateContainsUnverifierPersons](self, "_updateContainsUnverifierPersons");
      }
      goto LABEL_11;
    }
    if ((v6 & 4) != 0)
      -[PXCMMBannerTileController _updateLocalizedNamesByViewModel](self, "_updateLocalizedNamesByViewModel");
    goto LABEL_10;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext_179344 != a5)
  {
    v11 = v9;
    if ((void *)PXPeopleSuggestionsDataSourceManagerContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMBannerTileController.m"), 250, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXCMMBannerTileController _updatePeopleSuggestionNames](self, "_updatePeopleSuggestionNames");
    goto LABEL_11;
  }
  if ((v6 & 0x2000) != 0)
  {
    v11 = v9;
LABEL_10:
    -[PXCMMBannerTileController _updateCounts](self, "_updateCounts");
    -[PXCMMBannerTileController _updateBannerActionButton](self, "_updateBannerActionButton");
LABEL_11:
    v9 = v11;
  }
LABEL_12:

}

- (void)_updatePeopleSuggestionNames
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  NSArray *v12;
  NSArray *localizedNames;
  NSArray *v14;
  void *v15;
  id v16;

  -[PXCMMBannerTileController peopleSuggestionsDataSourceManager](self, "peopleSuggestionsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v16, "numberOfItemsInSection:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "personSuggestionAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "localizedName");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (const __CFString *)v9;
      else
        v11 = &stru_1E5149688;
      objc_msgSend(v5, "addObject:", v11);

    }
  }
  v12 = (NSArray *)objc_msgSend(v5, "copy");
  localizedNames = self->_localizedNames;
  self->_localizedNames = v12;

  v14 = self->_localizedNames;
  -[PXCMMBannerTileController bannerView](self, "bannerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLocalizedNamesForHeadline:", v14);

}

- (void)_updateLocalizedNamesByViewModel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *localizedNames;
  NSArray *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_sourceType == 1)
  {
    -[PXCMMViewModel recipients](self->_viewModel, "recipients");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "firstName", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {
            objc_msgSend(v10, "firstName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v10, "localizedName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "length"))
            {
              objc_msgSend(v10, "localizedName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v12 = 0;
            }

          }
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    v14 = (NSArray *)objc_msgSend(v4, "copy");
    localizedNames = self->_localizedNames;
    self->_localizedNames = v14;

    v16 = self->_localizedNames;
    -[PXCMMBannerTileController bannerView](self, "bannerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLocalizedNamesForHeadline:", v16);

  }
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (PXCMMBannerTileControllerDelegate)delegate
{
  return (PXCMMBannerTileControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCMMPosterBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __54__PXCMMBannerTileController__updateBannerActionButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleButtonActionWithTitle:", *(_QWORD *)(a1 + 32));

}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMBannerTileController.m"), 55, CFSTR("%s is not available as initializer"), "+[PXCMMBannerTileController new]");

  abort();
}

@end
