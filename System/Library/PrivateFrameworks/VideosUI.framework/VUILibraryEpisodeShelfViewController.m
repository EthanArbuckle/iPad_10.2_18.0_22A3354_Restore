@implementation VUILibraryEpisodeShelfViewController

- (VUILibraryEpisodeShelfViewController)initWithEpisodes:(id)a3
{
  id v4;
  VUILibraryEpisodeShelfViewController *v5;
  VUILibraryEpisodeShelfViewController *v6;
  uint64_t v7;
  NSArray *episodeViewModels;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUILibraryEpisodeShelfViewController;
  v5 = -[VUIShelfViewController initWithGridStyle:](&v10, sel_initWithGridStyle_, 0);
  v6 = v5;
  if (v5)
  {
    -[VUILibraryEpisodeShelfViewController _episodeViewModelsWithFetchedEpisodes:](v5, "_episodeViewModelsWithFetchedEpisodes:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    episodeViewModels = v6->_episodeViewModels;
    v6->_episodeViewModels = (NSArray *)v7;

    -[VUILibraryEpisodeShelfViewController _updateHeaderView](v6, "_updateHeaderView");
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUILibraryEpisodeShelfViewController viewWillAppear:](&v17, sel_viewWillAppear_);
  -[VUIShelfViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUILibraryEpisodeShelfViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke;
      v13[3] = &unk_1E9F98F00;
      v14 = v5;
      v15 = v7;
      v16 = a3;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke_2;
      v10[3] = &unk_1E9F98F28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v7, 1);
    }

  }
  -[VUILibraryEpisodeShelfViewController setEpisodeDetailViewController:](self, "setEpisodeDetailViewController:", 0);

}

uint64_t __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  VUILibraryDownloadPopoverViewController *v5;
  VUIDialogInteractionController *v6;
  void *v7;
  VUIDialogInteractionController *v8;
  VUIDialogInteractionController *dialogInteractionController;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUILibraryEpisodeShelfViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[VUILibraryEpisodeShelfViewController diffableDataSource](self, "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryEpisodeShelfViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applySnapshot:animatingDifferences:", v4, 1);

  if (!self->_dialogInteractionController)
  {
    v5 = objc_alloc_init(VUILibraryDownloadPopoverViewController);
    -[VUILibraryDownloadPopoverViewController setDelegate:](v5, "setDelegate:", self);
    v6 = [VUIDialogInteractionController alloc];
    -[VUIShelfViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VUIDialogInteractionController initWithPresentingViewController:collectionView:controllerToPresent:](v6, "initWithPresentingViewController:collectionView:controllerToPresent:", self, v7, v5);
    dialogInteractionController = self->_dialogInteractionController;
    self->_dialogInteractionController = v8;

    if ((objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") & 1) == 0)
      -[VUIDialogInteractionController setDelegate:](self->_dialogInteractionController, "setDelegate:", self);

  }
  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
  {
    -[VUIShelfViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipsToBounds:", 0);

    -[VUIShelfViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setVisibleRectEdgeInsets:", 0.0, -400.0, 0.0, 0.0);

  }
}

- (void)updateWithEpisodes:(id)a3
{
  NSArray *v4;
  NSArray *episodeViewModels;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[VUILibraryEpisodeShelfViewController _episodeViewModelsWithFetchedEpisodes:](self, "_episodeViewModelsWithFetchedEpisodes:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  episodeViewModels = self->_episodeViewModels;
  self->_episodeViewModels = v4;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryEpisodeShelfViewController updateShelfLayout:](self, "updateShelfLayout:", v7);

  -[VUILibraryEpisodeShelfViewController _updateHeaderView](self, "_updateHeaderView");
  -[VUILibraryEpisodeShelfViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryEpisodeShelfViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__VUILibraryEpisodeShelfViewController_updateWithEpisodes___block_invoke;
  v10[3] = &unk_1E9F98DF0;
  v10[4] = self;
  objc_msgSend(v8, "applySnapshot:animatingDifferences:completion:", v9, 1, v10);

}

void __59__VUILibraryEpisodeShelfViewController_updateWithEpisodes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "episodeDetailViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(v2, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v7;
    if (v3)
    {
      objc_msgSend(v7, "mediaItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_episodeWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
        objc_msgSend(*(id *)(a1 + 32), "setEpisodeDetailViewController:", 0);
      }

      v2 = v7;
    }
  }

}

- (void)configureWithCollectionView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("EpisodeList"));
  -[VUILibraryEpisodeShelfViewController _createDiffableDataSourceForCollectionView:](self, "_createDiffableDataSourceForCollectionView:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VUILibraryEpisodeShelfViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5);
}

- (void)updateShelfLayout:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  id v8;
  CGRect v9;

  v8 = a3;
  v4 = (void *)MEMORY[0x1E0DC3F98];
  -[VUILibraryEpisodeShelfViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = objc_msgSend(v4, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v9));

  if ((unint64_t)(v6 - 3) >= 6)
    v7 = -[NSArray count](self->_episodeViewModels, "count");
  else
    v7 = qword_1DA1C1888[v6 - 3];
  objc_msgSend(v8, "setRowCount:", v7);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  VUILibraryEpisodeListCell *v7;
  VUILibraryEpisodeListCell *v8;
  VUILibraryEpisodeListCell *sizingCell;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  VUILibraryEpisodeListCell *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;
  CGRect v25;

  v6 = a5;
  if (!self->_sizingCell)
  {
    v7 = [VUILibraryEpisodeListCell alloc];
    v8 = -[VUILibraryEpisodeListCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sizingCell = self->_sizingCell;
    self->_sizingCell = v8;

  }
  v10 = (void *)MEMORY[0x1E0DC3F98];
  -[VUILibraryEpisodeShelfViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v10, "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", 0, 0, 1, CGRectGetWidth(v25));
  v13 = v12;

  -[NSArray objectAtIndex:](self->_episodeViewModels, "objectAtIndex:", objc_msgSend(v6, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "episode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_sizingCell;
  objc_msgSend(v14, "assetController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILibraryEpisodeListCell configureVUILibraryEpisodeListCell:withMedia:andAssetController:](VUILibraryEpisodeListCell, "configureVUILibraryEpisodeListCell:withMedia:andAssetController:", v16, v15, v17);

  -[VUILibraryEpisodeListCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", v13, 1.79769313e308);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return !self->_shouldIgnoreSelectEvent;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  unint64_t v5;
  void *v6;
  VUIEpisodeDetailViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double MidX;
  void *v15;
  double MidY;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v5 = objc_msgSend(a4, "row", a3);
  if (v5 < -[NSArray count](self->_episodeViewModels, "count"))
  {
    -[NSArray objectAtIndex:](self->_episodeViewModels, "objectAtIndex:", v5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "episode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VUIEpisodeDetailViewController initWithMediaItem:]([VUIEpisodeDetailViewController alloc], "initWithMediaItem:", v6);
    -[VUILibraryEpisodeShelfViewController setEpisodeDetailViewController:](self, "setEpisodeDetailViewController:", v7);
    -[VUILibraryEpisodeShelfViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[VUILibraryEpisodeShelfViewController traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
      -[UIViewController vui_presentViewController:animated:completion:](self, "vui_presentViewController:animated:completion:", v11, 1, 0);
      -[VUILibraryEpisodeShelfViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryEpisodeShelfViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      MidX = CGRectGetMidX(v19);
      -[VUILibraryEpisodeShelfViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      MidY = CGRectGetMidY(v20);

      -[VUIEpisodeDetailViewController popoverPresentationController](v7, "popoverPresentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSourceView:", v12);
      objc_msgSend(v17, "setSourceRect:", MidX, MidY, 0.0, 0.0);
      objc_msgSend(v17, "setPermittedArrowDirections:", -1);

    }
    else
    {
      objc_msgSend(v8, "pushViewController:animated:", v7, 1);
    }

  }
}

- (void)episodeDetailViewControllerWasDismissed:(id)a3
{
  -[VUILibraryEpisodeShelfViewController setEpisodeDetailViewController:](self, "setEpisodeDetailViewController:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUIShelfViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  if (-[VUIDialogInteractionController isPresenting](self->_dialogInteractionController, "isPresenting"))
    -[VUIDialogInteractionController dismissConfirmation](self->_dialogInteractionController, "dismissConfirmation");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUILibraryEpisodeShelfViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[VUIDialogInteractionController isPresenting](self->_dialogInteractionController, "isPresenting"))
    -[VUIDialogInteractionController dismissConfirmation](self->_dialogInteractionController, "dismissConfirmation");
}

- (void)willMoveToParentViewController:(id)a3
{
  VUIDialogInteractionController *dialogInteractionController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUILibraryEpisodeShelfViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    dialogInteractionController = self->_dialogInteractionController;
    self->_dialogInteractionController = 0;

  }
}

- (void)removeDownloadPressed
{
  NSIndexPath *popoverIndexPath;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  VUIDialogInteractionController *dialogInteractionController;
  id v9;

  popoverIndexPath = self->_popoverIndexPath;
  if (popoverIndexPath)
  {
    v4 = -[NSIndexPath row](popoverIndexPath, "row");
    if (v4 < -[NSArray count](self->_episodeViewModels, "count"))
    {
      -[NSArray objectAtIndex:](self->_episodeViewModels, "objectAtIndex:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "cancelAndRemoveDownload");
        -[VUILibraryEpisodeShelfViewController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "libraryEpisodesShelfViewController:didRemoveDownloadForAssetController:", self, v6);
        dialogInteractionController = self->_dialogInteractionController;
        if (dialogInteractionController)
          -[VUIDialogInteractionController dismissConfirmation](dialogInteractionController, "dismissConfirmation");

      }
    }
  }
}

- (void)removeDownloadDismissed
{
  -[VUIDialogInteractionController setIsPresenting:](self->_dialogInteractionController, "setIsPresenting:", 0);
  self->_shouldIgnoreSelectEvent = 0;
}

- (BOOL)dialogInteractionController:(id)a3 shouldBeginInteractionForIndexPath:(id)a4
{
  BOOL result;

  result = -[VUILibraryEpisodeShelfViewController _canRemoveEpisodeAtIndexPath:](self, "_canRemoveEpisodeAtIndexPath:", a4);
  self->_shouldIgnoreSelectEvent = result;
  return result;
}

- (void)dialogInteractionController:(id)a3 interactionDidBeginForIndexPath:(id)a4
{
  objc_storeStrong((id *)&self->_popoverIndexPath, a4);
}

- (void)dialogInteractionController:(id)a3 interactionDidEndForIndexPath:(id)a4
{
  NSIndexPath *popoverIndexPath;

  self->_shouldIgnoreSelectEvent = 0;
  popoverIndexPath = self->_popoverIndexPath;
  self->_popoverIndexPath = 0;

}

- (id)_createDiffableDataSourceForCollectionView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__VUILibraryEpisodeShelfViewController__createDiffableDataSourceForCollectionView___block_invoke;
  v8[3] = &unk_1E9F98F50;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

id __83__VUILibraryEpisodeShelfViewController__createDiffableDataSourceForCollectionView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("EpisodeList"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "episodeViewModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "episode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILibraryEpisodeListCell configureVUILibraryEpisodeListCell:withMedia:andAssetController:](VUILibraryEpisodeListCell, "configureVUILibraryEpisodeListCell:withMedia:andAssetController:", v8, v12, v13);

  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v7[0] = CFSTR("ShelfMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUILibraryEpisodeShelfViewController _getEntityIdentifiersFromViewModels](self, "_getEntityIdentifiersFromViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("ShelfMainSection"));

  return v3;
}

- (id)_getEntityIdentifiersFromViewModels
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUILibraryEpisodeShelfViewController episodeViewModels](self, "episodeViewModels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "episode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (void)setEpisodeDetailViewController:(id)a3
{
  VUIEpisodeDetailViewController *v5;
  VUIEpisodeDetailViewController **p_episodeDetailViewController;
  VUIEpisodeDetailViewController *episodeDetailViewController;
  VUIEpisodeDetailViewController *v8;

  v5 = (VUIEpisodeDetailViewController *)a3;
  p_episodeDetailViewController = &self->_episodeDetailViewController;
  episodeDetailViewController = self->_episodeDetailViewController;
  v8 = v5;
  if (episodeDetailViewController != v5)
  {
    if (episodeDetailViewController)
      -[VUIEpisodeDetailViewController setDelegate:](episodeDetailViewController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_episodeDetailViewController, a3);
    if (*p_episodeDetailViewController)
      -[VUIEpisodeDetailViewController setDelegate:](*p_episodeDetailViewController, "setDelegate:", self);
  }

}

- (id)_episodeViewModelsWithFetchedEpisodes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  VUILibraryEpisodeShelfEpisodeViewModel *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc_init(VUILibraryEpisodeShelfEpisodeViewModel);
        -[VUILibraryEpisodeShelfEpisodeViewModel setEpisode:](v11, "setEpisode:", v10, (_QWORD)v14);
        objc_msgSend(v10, "assetController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryEpisodeShelfEpisodeViewModel setAssetController:](v11, "setAssetController:", v12);
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_episodeWithIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_episodeViewModels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "episode", (_QWORD)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (void)_configureShelfLayout:(id)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  id v7;

  v7 = a3;
  -[VUILibraryEpisodeShelfViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
    v6 = 4;
  else
    v6 = -[NSArray count](self->_episodeViewModels, "count");
  objc_msgSend(v7, "setRowCount:", v6);

}

- (BOOL)_canRemoveEpisodeAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 >= -[NSArray count](self->_episodeViewModels, "count"))
    goto LABEL_4;
  -[NSArray objectAtIndex:](self->_episodeViewModels, "objectAtIndex:", objc_msgSend(v4, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "episode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isLocal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
    v10 = 1;
  else
LABEL_4:
    v10 = 0;

  return v10;
}

- (void)_updateHeaderView
{
  NSUInteger v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[NSArray count](self->_episodeViewModels, "count");
  v4 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("NUMBER_OF_EPISODES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%d"), 0, v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
  +[VUICollectionHeaderView configureCollectionHeaderViewWithTitle:subtitle:buttonString:existingView:](VUICollectionHeaderView, "configureCollectionHeaderViewWithTitle:subtitle:buttonString:existingView:", v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIShelfViewController setHeaderView:](self, "setHeaderView:", v8);

}

- (VUILibraryEpisodeShelfViewControllerDelegate)delegate
{
  return (VUILibraryEpisodeShelfViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)episodeViewModels
{
  return self->_episodeViewModels;
}

- (void)setEpisodeViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (VUIEpisodeDetailViewController)episodeDetailViewController
{
  return self->_episodeDetailViewController;
}

- (NSIndexPath)popoverIndexPath
{
  return self->_popoverIndexPath;
}

- (void)setPopoverIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_popoverIndexPath, a3);
}

- (BOOL)shouldIgnoreSelectEvent
{
  return self->_shouldIgnoreSelectEvent;
}

- (void)setShouldIgnoreSelectEvent:(BOOL)a3
{
  self->_shouldIgnoreSelectEvent = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_popoverIndexPath, 0);
  objc_storeStrong((id *)&self->_episodeDetailViewController, 0);
  objc_storeStrong((id *)&self->_episodeViewModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogInteractionController, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end
