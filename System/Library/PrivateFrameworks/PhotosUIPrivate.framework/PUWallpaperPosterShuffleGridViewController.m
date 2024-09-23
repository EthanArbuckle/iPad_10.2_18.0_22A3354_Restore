@implementation PUWallpaperPosterShuffleGridViewController

- (PUWallpaperPosterShuffleGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 86, CFSTR("%s is not available as initializer"), "-[PUWallpaperPosterShuffleGridViewController initWithNibName:bundle:]");

  abort();
}

- (PUWallpaperPosterShuffleGridViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 90, CFSTR("%s is not available as initializer"), "-[PUWallpaperPosterShuffleGridViewController initWithCoder:]");

  abort();
}

- (PUWallpaperPosterShuffleGridViewController)initWithResourceManager:(id)a3 posterMedia:(id)a4
{
  id v6;
  id v7;
  PUWallpaperPosterShuffleGridViewController *v8;
  PUWallpaperPosterShuffleGridViewController *v9;
  uint64_t v10;
  NSURL *posterMediaDirectory;
  uint64_t v12;
  NSOrderedSet *initialPosterMedia;
  uint64_t v14;
  PHPhotoLibrary *photoLibrary;
  PUWallpaperShuffleMediaProvider *v16;
  id v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PXMediaProvider *mediaProvider;
  uint64_t v28;
  PXUpdater *updater;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  v8 = -[PUWallpaperPosterShuffleGridViewController initWithNibName:bundle:](&v31, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[PUWallpaperPosterShuffleGridViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
    objc_msgSend(v6, "assetDirectory");
    v10 = objc_claimAutoreleasedReturnValue();
    posterMediaDirectory = v9->_posterMediaDirectory;
    v9->_posterMediaDirectory = (NSURL *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v7);
    initialPosterMedia = v9->_initialPosterMedia;
    v9->_initialPosterMedia = (NSOrderedSet *)v12;

    objc_storeStrong((id *)&v9->_posterMedia, v9->_initialPosterMedia);
    objc_msgSend(v6, "photoLibrary");
    v14 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v9->_photoLibrary;
    v9->_photoLibrary = (PHPhotoLibrary *)v14;

    v16 = -[PUWallpaperShuffleMediaProvider initWithResourceManager:]([PUWallpaperShuffleMediaProvider alloc], "initWithResourceManager:", v6);
    v17 = objc_alloc(MEMORY[0x1E0D7B558]);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v33[0] = v16;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    v22 = (void *)MEMORY[0x1E0D7B768];
    -[PUWallpaperPosterShuffleGridViewController photoLibrary](v9, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mediaProviderWithLibrary:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v17, "initWithMediaProvidersByAssetClassName:", v25);
    mediaProvider = v9->_mediaProvider;
    v9->_mediaProvider = (PXMediaProvider *)v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:needsUpdateSelector:", v9, sel__setNeedsUpdate);
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v28;

    -[PXUpdater addUpdateSelector:needsUpdate:](v9->_updater, "addUpdateSelector:needsUpdate:", sel__updateDataSource, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v9->_updater, "addUpdateSelector:needsUpdate:", sel__updateBarItems, 1);
    -[PUWallpaperPosterShuffleGridViewController px_enableExtendedTraitCollection](v9, "px_enableExtendedTraitCollection");

  }
  return v9;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[PUWallpaperPosterShuffleGridViewController gridContentController](self, "gridContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewWillAppear:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  -[PUWallpaperPosterShuffleGridViewController gridContentController](self, "gridContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewDidAppear:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  -[PUWallpaperPosterShuffleGridViewController gridContentController](self, "gridContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewDidDisappear:", v3);

}

- (void)setPosterMedia:(id)a3
{
  NSOrderedSet *v4;
  char v5;
  NSOrderedSet *v6;
  NSOrderedSet *posterMedia;
  NSOrderedSet *v8;

  v8 = (NSOrderedSet *)a3;
  v4 = self->_posterMedia;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSOrderedSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSOrderedSet *)-[NSOrderedSet copy](v8, "copy");
      posterMedia = self->_posterMedia;
      self->_posterMedia = v6;

      -[PUWallpaperPosterShuffleGridViewController _invalidateDataSource](self, "_invalidateDataSource");
    }
  }

}

- (void)setGridContentController:(id)a3
{
  PXPhotosContentController **p_gridContentController;
  PXPhotosContentController *v6;
  void *v7;
  char v8;
  void *v9;
  PXPhotosContentController *v10;

  v10 = (PXPhotosContentController *)a3;
  p_gridContentController = &self->_gridContentController;
  v6 = self->_gridContentController;
  v7 = v10;
  if (v6 == v10)
    goto LABEL_4;
  v8 = -[PXPhotosContentController isEqual:](v10, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    -[PXPhotosContentController setDelegate:](*p_gridContentController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_gridContentController, a3);
    -[PXPhotosContentController setDelegate:](*p_gridContentController, "setDelegate:", self);
    -[PXPhotosContentController layout](*p_gridContentController, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterShuffleGridViewController setTungstenLayout:](self, "setTungstenLayout:", v9);

    -[PXPhotosContentController viewModel](*p_gridContentController, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterShuffleGridViewController setGridViewModel:](self, "setGridViewModel:", v7);
LABEL_4:

  }
}

- (void)setTungstenLayout:(id)a3
{
  id v4;
  PXGView *tungstenView;
  id v6;
  void *v7;
  PXGView *v8;
  PXGView *v9;
  PXGView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  tungstenView = self->_tungstenView;
  v16 = v4;
  if (!tungstenView)
  {
    v6 = objc_alloc(MEMORY[0x1E0D7B480]);
    -[PUWallpaperPosterShuffleGridViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = (PXGView *)objc_msgSend(v6, "initWithFrame:");
    v9 = self->_tungstenView;
    self->_tungstenView = v8;

    -[PXGView setAutoresizingMask:](self->_tungstenView, "setAutoresizingMask:", 18);
    v10 = self->_tungstenView;
    -[PUWallpaperPosterShuffleGridViewController mediaProvider](self, "mediaProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGView registerAllTextureProvidersWithMediaProvider:](v10, "registerAllTextureProvidersWithMediaProvider:", v11);

    -[PXGView scrollViewController](self->_tungstenView, "scrollViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUWallpaperPosterShuffleGridViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v13, 5);
    v4 = v16;
    tungstenView = self->_tungstenView;
  }
  -[PXGView setRootLayout:](tungstenView, "setRootLayout:", v4);
  -[PXGView superview](self->_tungstenView, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[PUWallpaperPosterShuffleGridViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_tungstenView);

  }
}

- (void)setGridViewModel:(id)a3
{
  PXPhotosViewModel **p_gridViewModel;
  PXPhotosViewModel *v6;
  char v7;
  PXPhotosViewModel *v8;

  v8 = (PXPhotosViewModel *)a3;
  p_gridViewModel = &self->_gridViewModel;
  v6 = self->_gridViewModel;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXPhotosViewModel isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXPhotosViewModel unregisterChangeObserver:context:](*p_gridViewModel, "unregisterChangeObserver:context:", self, GridViewModelObservationContext);
      objc_storeStrong((id *)&self->_gridViewModel, a3);
      -[PXPhotosViewModel registerChangeObserver:context:](*p_gridViewModel, "registerChangeObserver:context:", self, GridViewModelObservationContext);
      -[PUWallpaperPosterShuffleGridViewController _invalidateBarItems](self, "_invalidateBarItems");
    }
  }

}

- (void)_createBarButtonItemsIfNeeded
{
  UIBarButtonItem *v3;
  UIBarButtonItem *doneBarButtonItem;
  id v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *addPhotosBarButtonItem;
  id v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *removePhotosBarButtonItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *enterSelectModeBarButtonItem;
  UIBarButtonItem *v15;
  UIBarButtonItem *exitSelectModeBarButtonItem;
  UIBarButtonItem *v17;
  UIBarButtonItem *selectAllBarButtonItem;
  UIBarButtonItem *v19;
  UIBarButtonItem *deselectAllBarButtonItem;

  if (!self->_doneBarButtonItem)
  {
    v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDone_);
    doneBarButtonItem = self->_doneBarButtonItem;
    self->_doneBarButtonItem = v3;

    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_PICKER_ADD_PHOTOS_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, self, sel__handleAddPhotos_);
    addPhotosBarButtonItem = self->_addPhotosBarButtonItem;
    self->_addPhotosBarButtonItem = v7;

    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIBarButtonItem *)objc_msgSend(v9, "initWithImage:style:target:action:", v10, 0, self, sel__handleRemovePhotos_);
    removePhotosBarButtonItem = self->_removePhotosBarButtonItem;
    self->_removePhotosBarButtonItem = v11;

    objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedSelectBarButtonItem");
    v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    enterSelectModeBarButtonItem = self->_enterSelectModeBarButtonItem;
    self->_enterSelectModeBarButtonItem = v13;

    -[UIBarButtonItem setTarget:](self->_enterSelectModeBarButtonItem, "setTarget:", self);
    -[UIBarButtonItem setAction:](self->_enterSelectModeBarButtonItem, "setAction:", sel__handleEnterSelectMode_);
    v15 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleExitSelectMode_);
    exitSelectModeBarButtonItem = self->_exitSelectModeBarButtonItem;
    self->_exitSelectModeBarButtonItem = v15;

    objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedSelectAllBarButtonItem");
    v17 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v17;

    -[UIBarButtonItem setTarget:](self->_selectAllBarButtonItem, "setTarget:", self);
    -[UIBarButtonItem setAction:](self->_selectAllBarButtonItem, "setAction:", sel__handleSelectAll_);
    objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedDeselectAllBarButtonItem");
    v19 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    deselectAllBarButtonItem = self->_deselectAllBarButtonItem;
    self->_deselectAllBarButtonItem = v19;

    -[UIBarButtonItem setTarget:](self->_deselectAllBarButtonItem, "setTarget:", self);
    -[UIBarButtonItem setAction:](self->_deselectAllBarButtonItem, "setAction:", sel__handleDeselectAll_);
  }
}

- (BOOL)_canAddMorePhotos
{
  void *v2;
  BOOL v3;

  -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") < 0x32;

  return v3;
}

- (void)_exitSelectMode
{
  id v2;

  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_15430);

}

- (void)_finishWithSelectedPosterMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterShuffleGridViewController initialPosterMedia](self, "initialPosterMedia");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "differenceFromOrderedSet:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterShuffleGridViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wallpaperPosterShuffleGridViewController:didFinishWithChange:selectedPosterMedia:", self, v8, v4);

}

- (void)_handleDone:(id)a3
{
  -[PUWallpaperPosterShuffleGridViewController _finishWithSelectedPosterMedia:](self, "_finishWithSelectedPosterMedia:", 0);
}

- (void)_handleAddPhotos:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0CD2168]);
  -[PUWallpaperPosterShuffleGridViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v5);

  -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreselectedAssetIdentifiers:", v7);

  objc_msgSend(v11, "setSelectionLimit:", 50);
  objc_msgSend(MEMORY[0x1E0CD2170], "imagesFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFilter:", v8);

  objc_msgSend(v11, "setDisabledCapabilities:", 18);
  objc_msgSend(v11, "_setDisabledPrivateCapabilities:", 12);
  objc_msgSend(MEMORY[0x1E0CD21F8], "shuffleWallpaperSuggestionGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set_suggestionGroup:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v11);
  objc_msgSend(v10, "setDelegate:", self);
  -[PUWallpaperPosterShuffleGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)_handleRemovePhotos:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionSnapshot");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke;
  v11[3] = &unk_1E589D128;
  v12 = v6;
  v13 = a2;
  v11[4] = self;
  v8 = v6;
  objc_msgSend(v10, "enumerateSelectedObjectsUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[PUWallpaperPosterShuffleGridViewController setPosterMedia:](self, "setPosterMedia:", v9);

  -[PUWallpaperPosterShuffleGridViewController _exitSelectMode](self, "_exitSelectMode");
}

- (void)_handleEnterSelectMode:(id)a3
{
  id v3;

  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_211);

}

- (void)_handleSelectAll:(id)a3
{
  id v3;

  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_212);

}

- (void)_handleDeselectAll:(id)a3
{
  id v3;

  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_213);

}

- (void)_setNeedsUpdate
{
  id v2;

  -[PUWallpaperPosterShuffleGridViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_invalidateDataSource
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateDataSource);
}

- (void)_updateDataSource
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CD13B8];
  -[PUWallpaperPosterShuffleGridViewController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterShuffleGridViewController _fetchResultWithAssetsFetchedFromPosterMedia:](self, "_fetchResultWithAssetsFetchedFromPosterMedia:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D7B9D0]);
  v29[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", v10, v11, 0, 0, 0);

  -[PUWallpaperPosterShuffleGridViewController gridContentController](self, "gridContentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B660]), "initWithDataSource:", v12);
    v16 = objc_alloc(MEMORY[0x1E0D7B818]);
    -[PUWallpaperPosterShuffleGridViewController mediaProvider](self, "mediaProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v15, v17, 0, 0, 0);

    objc_msgSend(v18, "setDelegate:", self);
    objc_msgSend(v18, "setIsEmbedded:", 1);
    objc_msgSend(v18, "setIgnoreContentFilterStateWhenNotFiltering:", 1);
    objc_msgSend(v18, "setSectionBodyStyle:", 1);
    objc_msgSend(v18, "setGridStyle:", 0);
    objc_msgSend(v18, "setNavBarStyle:", 4);
    objc_msgSend(v18, "setAllowsUserDefaults:", 0);
    objc_msgSend(v18, "setAllowsDragOut:", 0);
    objc_msgSend(v18, "setAllowsDragIn:", 0);
    objc_msgSend(v18, "setForbiddenBadges:", 0);
    objc_msgSend(v18, "setItemAspectRatio:", *MEMORY[0x1E0D7C690]);
    objc_msgSend(v18, "setPreferredAssetCropDelegate:", self);
    objc_msgSend(v18, "setAllowedActions:", *MEMORY[0x1E0D7C658] & 0xFFFFFFFFFFFFFFFELL ^ 0x81);
    objc_msgSend(v18, "setAllowedBehaviors:", 0);
    v19 = objc_alloc(MEMORY[0x1E0D7B780]);
    -[PUWallpaperPosterShuffleGridViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithConfiguration:traitCollection:", v18, v20);
    -[PUWallpaperPosterShuffleGridViewController setGridContentController:](self, "setGridContentController:", v21);

    goto LABEL_6;
  }
  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataSourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 349, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.gridViewModel.dataSourceManager"), v24);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v27;
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 349, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.gridViewModel.dataSourceManager"), v24, v26);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v15, "setDataSource:changeDetails:", v12, 0);
LABEL_6:

}

- (void)_invalidateBarItems
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBarItems);
}

- (void)_updateBarItems
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int *v15;
  UIBarButtonItem **p_selectAllBarButtonItem;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterShuffleGridViewController _createBarButtonItemsIfNeeded](self, "_createBarButtonItemsIfNeeded");
  -[PUWallpaperPosterShuffleGridViewController gridViewModel](self, "gridViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isInSelectMode");
  v6 = objc_msgSend(v4, "isAnyItemSelected");
  v7 = objc_msgSend(v4, "areAllItemsSelected");
  objc_msgSend(v4, "selectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v3, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "totalNumberOfItems");

  if (v5)
  {
    if (v6)
    {
      PULocalizedString(CFSTR("REVIEW_COUNT_SELECTED_TITLE_TEXT"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v9;
      PULocalizedStringWithValidatedFormat(v13, CFSTR("%lu"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = &OBJC_IVAR___PUWallpaperPosterShuffleGridViewController__removePhotosBarButtonItem;
    }
    else
    {
      PXLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = &OBJC_IVAR___PUWallpaperPosterShuffleGridViewController__exitSelectModeBarButtonItem;
    }
    p_selectAllBarButtonItem = &self->_selectAllBarButtonItem;
    -[UIBarButtonItem setEnabled:](self->_selectAllBarButtonItem, "setEnabled:", v12 > 0, v21);
    v23[0] = *(Class *)((char *)&self->super.super.super.isa + *v15);
    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v17;
    if (v7)
      p_selectAllBarButtonItem = &self->_deselectAllBarButtonItem;
    v18 = v23;
  }
  else
  {
    PLLocalizedCountDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_addPhotosBarButtonItem, "setEnabled:", -[PUWallpaperPosterShuffleGridViewController _canAddMorePhotos](self, "_canAddMorePhotos"));
    p_selectAllBarButtonItem = &self->_enterSelectModeBarButtonItem;
    -[UIBarButtonItem setEnabled:](self->_enterSelectModeBarButtonItem, "setEnabled:", v12 > 0);
    -[UIBarButtonItem setEnabled:](self->_doneBarButtonItem, "setEnabled:", v12 > 0);
    v22[0] = self->_addPhotosBarButtonItem;
    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    v18 = v22;
  }
  v18[2] = *p_selectAllBarButtonItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterShuffleGridViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", self->_doneBarButtonItem);

  -[PUWallpaperPosterShuffleGridViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v19, 1);
  -[PUWallpaperPosterShuffleGridViewController setTitle:](self, "setTitle:", v14);

}

- (id)_fetchResultWithAssetsFetchedFromPosterMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  v4 = a3;
  PXMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterShuffleGridViewController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  PXMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:forKeys:", v9, v11);

  v17 = v12;
  v13 = v12;
  PXMap();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PXDisplayAssetFetchResultFromArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)GridViewModelObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 430, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 6) != 0)
  {
    v11 = v9;
    -[PUWallpaperPosterShuffleGridViewController _invalidateBarItems](self, "_invalidateBarItems");
    v9 = v11;
  }

}

- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4
{
  -[PUWallpaperPosterShuffleGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return 1;
}

- (void)dismissPresentedViewControllerForContentController:(id)a3
{
  -[PUWallpaperPosterShuffleGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[PUWallpaperPosterShuffleGridViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUWallpaperPosterShuffleGridViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v5, 1);

  }
  return v6 != 0;
}

- (UIEdgeInsets)maskPaddingForContentController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0D7CEC0];
  v4 = *(double *)(MEMORY[0x1E0D7CEC0] + 8);
  v5 = *(double *)(MEMORY[0x1E0D7CEC0] + 16);
  v6 = *(double *)(MEMORY[0x1E0D7CEC0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)photosViewController:(id)a3 didPickAssetReference:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    PXFind();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 478, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v9, "posterMedia");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUWallpaperPosterShuffleGridViewController _finishWithSelectedPosterMedia:](self, "_finishWithSelectedPosterMedia:", v11);

  return 1;
}

- (BOOL)allowsContextMenuInteractionForPhotosViewController:(id)a3
{
  return 0;
}

- (CGRect)preferredCropForAsset:(id)a3 withAspectRatio:(double)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a3;
  v5 = *MEMORY[0x1E0D7D078];
  v6 = *(double *)(MEMORY[0x1E0D7D078] + 8);
  v7 = *(double *)(MEMORY[0x1E0D7D078] + 16);
  v8 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  v9 = v4;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v17 = v9;
LABEL_9:

    goto LABEL_10;
  }
  v10 = v9;

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    if (v13 <= v15)
      v16 = 1;
    else
      v16 = 2;
    objc_msgSend(MEMORY[0x1E0D751A8], "deviceConfigurationForOrientation:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D77EF8], "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:layoutConfiguration:", v10, 0, 0, 0, v17);
    v5 = v18;
    v6 = v19;
    v7 = v20;
    v8 = v21;
    goto LABEL_9;
  }
LABEL_10:

  v22 = v5;
  v23 = v6;
  v24 = v7;
  v25 = v8;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v26 = a4;
  -[PUWallpaperPosterShuffleGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (objc_msgSend(v26, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E40]);
    PXMap();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

    v8 = objc_alloc(MEMORY[0x1E0C99E40]);
    -[PUWallpaperPosterShuffleGridViewController posterMedia](self, "posterMedia");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);

    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "minusOrderedSet:", v7);
    if (objc_msgSend(v12, "count"))
    {
      -[PUWallpaperPosterShuffleGridViewController photoLibrary](self, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v12, "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchAssetsWithLocalIdentifiers:options:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PXMap();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(v7, "mutableCopy");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_4;
      v27[3] = &unk_1E589D2C0;
      v28 = v18;
      v20 = v19;
      v29 = v20;
      v21 = v18;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);
      v22 = v20;

      v7 = v22;
    }
    v23 = objc_alloc(MEMORY[0x1E0C99E40]);
    PXMap();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);
    -[PUWallpaperPosterShuffleGridViewController setPosterMedia:](self, "setPosterMedia:", v25);

  }
}

- (PUWallpaperPosterShuffleGridViewControllerDelegate)delegate
{
  return (PUWallpaperPosterShuffleGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)posterMediaDirectory
{
  return self->_posterMediaDirectory;
}

- (NSOrderedSet)initialPosterMedia
{
  return self->_initialPosterMedia;
}

- (NSOrderedSet)posterMedia
{
  return self->_posterMedia;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_updater, a3);
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (void)setTungstenView:(id)a3
{
  objc_storeStrong((id *)&self->_tungstenView, a3);
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXPhotosContentController)gridContentController
{
  return self->_gridContentController;
}

- (PXPhotosViewModel)gridViewModel
{
  return self->_gridViewModel;
}

- (UIBarButtonItem)doneBarButtonItem
{
  return self->_doneBarButtonItem;
}

- (void)setDoneBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneBarButtonItem, a3);
}

- (UIBarButtonItem)addPhotosBarButtonItem
{
  return self->_addPhotosBarButtonItem;
}

- (void)setAddPhotosBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addPhotosBarButtonItem, a3);
}

- (UIBarButtonItem)removePhotosBarButtonItem
{
  return self->_removePhotosBarButtonItem;
}

- (void)setRemovePhotosBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_removePhotosBarButtonItem, a3);
}

- (UIBarButtonItem)enterSelectModeBarButtonItem
{
  return self->_enterSelectModeBarButtonItem;
}

- (void)setEnterSelectModeBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_enterSelectModeBarButtonItem, a3);
}

- (UIBarButtonItem)exitSelectModeBarButtonItem
{
  return self->_exitSelectModeBarButtonItem;
}

- (void)setExitSelectModeBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_exitSelectModeBarButtonItem, a3);
}

- (UIBarButtonItem)selectAllBarButtonItem
{
  return self->_selectAllBarButtonItem;
}

- (void)setSelectAllBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, a3);
}

- (UIBarButtonItem)deselectAllBarButtonItem
{
  return self->_deselectAllBarButtonItem;
}

- (void)setDeselectAllBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deselectAllBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deselectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_exitSelectModeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_enterSelectModeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_removePhotosBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addPhotosBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_gridViewModel, 0);
  objc_storeStrong((id *)&self->_gridContentController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_tungstenView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
  objc_storeStrong((id *)&self->_initialPosterMedia, 0);
  objc_storeStrong((id *)&self->_posterMediaDirectory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

id __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D75210];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(MEMORY[0x1E0CD1390], "uuidFromLocalIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithAssetUUID:", v5);
  return v6;
}

uint64_t __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

id __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(a2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifierWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

uint64_t __89__PUWallpaperPosterShuffleGridViewController_photosViewController_didPickAssetReference___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

PUPosterMediaDisplayAsset *__91__PUWallpaperPosterShuffleGridViewController__fetchResultWithAssetsFetchedFromPosterMedia___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUPosterMediaDisplayAsset *v8;
  PUPosterMediaDisplayAsset *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = -[PUPosterMediaDisplayAsset initWithPosterMedia:]([PUPosterMediaDisplayAsset alloc], "initWithPosterMedia:", v3);
  v9 = v8;

  return v9;
}

uint64_t __91__PUWallpaperPosterShuffleGridViewController__fetchResultWithAssetsFetchedFromPosterMedia___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

id __91__PUWallpaperPosterShuffleGridViewController__fetchResultWithAssetsFetchedFromPosterMedia___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(a2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifierWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__PUWallpaperPosterShuffleGridViewController__handleDeselectAll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __63__PUWallpaperPosterShuffleGridViewController__handleSelectAll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAll");
}

uint64_t __69__PUWallpaperPosterShuffleGridViewController__handleEnterSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsInSelectMode:", 1);
}

void __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v28 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v28;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v3, "posterMedia");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "assetUUID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "px_descriptionForAssertionMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 259, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("object"), v14, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 259, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("object"), v14);
    }

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v6 = v28;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v20, v21, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 261, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("object"), v23);
LABEL_17:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("PUWallpaperPosterShuffleGridViewController.m"), 261, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("object"), v23, v27);

    goto LABEL_17;
  }
LABEL_8:
  objc_msgSend(v6, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke_2;
    v29[3] = &unk_1E58A13E8;
    v30 = v5;
    v8 = v5;
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObjectsAtIndexes:", v9);

  }
LABEL_11:

}

uint64_t __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 32))
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isEqualToString:");

  return v5;
}

id __63__PUWallpaperPosterShuffleGridViewController__handleAddPhotos___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(a2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifierWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __61__PUWallpaperPosterShuffleGridViewController__exitSelectMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsInSelectMode:", 0);
}

@end
