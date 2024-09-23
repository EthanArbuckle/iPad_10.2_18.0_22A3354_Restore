@implementation VUILibraryMediaCollectionViewController

- (VUILibraryMediaCollectionViewController)initWithTitle:(id)a3 withSeasonsDataSource:(id)a4 withEpisodesDataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUILibraryMediaCollectionViewController *v12;
  VUILibraryMediaCollectionViewController *v13;
  VUIViewControllerContentPresenter *v14;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)VUILibraryMediaCollectionViewController;
  v12 = -[VUILibraryStackViewController init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_seasonsDataSource, a4);
    objc_storeStrong((id *)&v13->_episodesDataSource, a5);
    v14 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v13->_contentPresenter;
    v13->_contentPresenter = v14;

    -[VUIViewControllerContentPresenter setLogName:](v13->_contentPresenter, "setLogName:", CFSTR("VUILibraryMediaCollectionViewController"));
    objc_storeStrong((id *)&v13->_showTitle, a3);
    objc_initWeak(&location, v13);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __102__VUILibraryMediaCollectionViewController_initWithTitle_withSeasonsDataSource_withEpisodesDataSource___block_invoke;
    v19[3] = &unk_1E9F99F98;
    objc_copyWeak(&v20, &location);
    v17 = (id)-[VUILibraryMediaCollectionViewController registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v16, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __102__VUILibraryMediaCollectionViewController_initWithTitle_withSeasonsDataSource_withEpisodesDataSource___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (!v2)
  {
    objc_msgSend(WeakRetained, "showTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setTitle:", v3);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibraryMediaCollectionViewController;
  -[VUILibraryStackViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryTvShowSeason"));
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryMediaCollectionViewController;
  -[VUILibraryMediaCollectionViewController loadView](&v4, sel_loadView);
  -[VUILibraryMediaCollectionViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILibraryMediaCollectionViewController;
  -[VUILibraryMediaCollectionViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[VUILibraryMediaCollectionViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMediaCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryMediaCollectionViewController;
  -[VUILibraryStackViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[VUILibraryMediaCollectionViewController start](self, "start");
  -[VUILibraryStackViewController stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMediaCollectionViewController contentPresenter](self, "contentPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentView:", v3);

  -[VUILibraryMediaCollectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSupportsTwoLineLargeTitles:", 1);
  -[VUILibraryMediaCollectionViewController setTitle:](self, "setTitle:", self->_showTitle);

}

- (void)configureWithCollectionView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUICollectionViewWrapperCellReuseIdentifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUILibraryEpisodeFooterCellReuseIdentifier"));
  -[VUILibraryMediaCollectionViewController _createDiffableDataSourceForCollectionView:](self, "_createDiffableDataSourceForCollectionView:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VUILibraryMediaCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5);
}

- (void)start
{
  VUIViewControllerContentPresenter *contentPresenter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  contentPresenter = self->_contentPresenter;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("LIBRARY_GENERIC_FETCH_ERROR_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIViewControllerContentPresenter setNoContentErrorTitle:](contentPresenter, "setNoContentErrorTitle:", v5);

  -[VUIViewControllerContentPresenter setCurrentContentViewType:](self->_contentPresenter, "setCurrentContentViewType:", 1);
  -[VUILibraryMediaCollectionViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setSupportsTwoLineLargeTitles:", 1);
  -[VUILibraryMediaCollectionViewController episodesDataSource](self, "episodesDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[VUILibraryMediaCollectionViewController seasonsDataSource](self, "seasonsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[VUILibraryMediaCollectionViewController episodesDataSource](self, "episodesDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startFetch");

  -[VUILibraryMediaCollectionViewController seasonsDataSource](self, "seasonsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startFetch");

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  VUILibraryEpisodeFooterCell *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = a5;
  -[VUILibraryMediaCollectionViewController diffableDataSource](self, "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUILibraryMediaCollectionViewController _seasonViewModelByIdentifier:](self, "_seasonViewModelByIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_15;
  -[VUILibraryMediaCollectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
  {
    v15 = -[VUILibraryMediaCollectionViewController vuiIsRTL](self, "vuiIsRTL");
    -[VUILibraryMediaCollectionViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeAreaInsets");
    v18 = v17;
    v20 = v19;

    if ((v15 & 1) != 0)
      v14 = v14 - v20;
    else
      v14 = v14 - v18;
  }
  v21 = objc_msgSend(v11, "type");
  switch(v21)
  {
    case 2:
      v22 = objc_alloc_init(VUILibraryEpisodeFooterCell);
      -[VUILibraryEpisodeFooterCell sizeThatFits:](v22, "sizeThatFits:", v14, 1.79769313e308);
      v6 = v31;
      v7 = v32;
LABEL_14:

      break;
    case 1:
      -[VUILibraryMediaCollectionViewModel episodeShelfViewControllerBySeasonIdentifier](self->_mediaCollectionViewModel, "episodeShelfViewControllerBySeasonIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "seasonIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", v34);
      v22 = (VUILibraryEpisodeFooterCell *)objc_claimAutoreleasedReturnValue();

      -[VUILibraryEpisodeFooterCell view](v22, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sizeThatFits:", v14, 1.79769313e308);
      v6 = v36;
      v7 = v37;

      goto LABEL_14;
    case 0:
      objc_msgSend(v11, "seasonIdentifier");
      v22 = (VUILibraryEpisodeFooterCell *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaCollectionViewModel productLockupViewBySeasonIdentifier](self->_mediaCollectionViewModel, "productLockupViewBySeasonIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        -[VUILibraryMediaCollectionViewModel seasonBySeasonIdentifier](self->_mediaCollectionViewModel, "seasonBySeasonIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUILibraryMediaCollectionViewController _productLockupViewWithSeason:](self, "_productLockupViewWithSeason:", v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryMediaCollectionViewModel productLockupViewBySeasonIdentifier](self->_mediaCollectionViewModel, "productLockupViewBySeasonIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "mutableCopy");

        objc_msgSend(v28, "setObject:forKey:", v24, v22);
        -[VUILibraryMediaCollectionViewModel setProductLockupViewBySeasonIdentifier:](self->_mediaCollectionViewModel, "setProductLockupViewBySeasonIdentifier:", v28);

      }
      objc_msgSend(v24, "sizeThatFits:", v14, 1.79769313e308);
      v6 = v29;
      v7 = v30;

      goto LABEL_14;
  }
LABEL_15:

  v38 = v6;
  v39 = v7;
  result.height = v39;
  result.width = v38;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB", a3, a4, a5);
  v7 = v6;
  -[VUILibraryMediaCollectionViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v8, v7);
  v10 = v9;

  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = v10;
  result.right = v13;
  result.bottom = v14;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUILibraryMediaCollectionViewController seasonsDataSource](self, "seasonsDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[VUILibraryMediaCollectionViewController setSeasonsFetchHasCompleted:](self, "setSeasonsFetchHasCompleted:", 1);
  else
    -[VUILibraryMediaCollectionViewController setEpisodesFetchHasCompleted:](self, "setEpisodesFetchHasCompleted:", 1);
  if (-[VUILibraryMediaCollectionViewController _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
  {
    v6 = -[VUILibraryMediaCollectionViewController _usingEpisodesGroupFetch](self, "_usingEpisodesGroupFetch");
    -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryMediaCollectionViewController seasonsDataSource](self, "seasonsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryMediaCollectionViewController setSeasons:](self, "setSeasons:", v9);

    -[VUILibraryMediaCollectionViewController episodesDataSource](self, "episodesDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryMediaCollectionViewController setEpisodes:](self, "setEpisodes:", v11);

    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[VUILibraryMediaCollectionViewController seasons](self, "seasons");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      -[VUILibraryMediaCollectionViewController episodes](self, "episodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v36 = v14;
      v37 = 2048;
      v38 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUILibraryMediaCollectionViewController:Setting %lu seasons, %lu episodes", buf, 0x16u);

    }
    if (v6)
    {
      -[VUILibraryMediaCollectionViewController episodesDataSource](self, "episodesDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "grouping");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaCollectionViewController setEpisodeGroups:](self, "setEpisodeGroups:", v17);

    }
    -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[VUILibraryMediaCollectionViewController seasonsDataSource](self, "seasonsDataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mediaEntities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaCollectionViewController setSeasons:](self, "setSeasons:", v20);

      -[VUILibraryMediaCollectionViewController episodesDataSource](self, "episodesDataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mediaEntities");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaCollectionViewController setEpisodes:](self, "setEpisodes:", v22);

      -[VUILibraryMediaCollectionViewController _updateMediaCollectionViewModelForSeasons](self, "_updateMediaCollectionViewModelForSeasons");
      -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v23, "hasContent");

      -[VUILibraryMediaCollectionViewController contentPresenter](self, "contentPresenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!(_DWORD)v22)
      {
        objc_msgSend(v24, "setCurrentContentViewType:", 2);

        goto LABEL_15;
      }
      objc_msgSend(v24, "setCurrentContentViewType:", 3);

      -[VUILibraryMediaCollectionViewController diffableDataSource](self, "diffableDataSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke_2;
      v31[3] = &unk_1E9F98FD8;
      v31[4] = self;
      v32 = v7;
      objc_msgSend(v26, "applySnapshot:animatingDifferences:completion:", v27, 1, v31);

      v28 = v32;
    }
    else
    {
      -[VUILibraryMediaCollectionViewController _buildMediaCollectionViewModel](self, "_buildMediaCollectionViewModel");
      -[VUILibraryMediaCollectionViewController _updateDeletedContentErrorMessage](self, "_updateDeletedContentErrorMessage");
      -[VUILibraryMediaCollectionViewController diffableDataSource](self, "diffableDataSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke;
      v33[3] = &unk_1E9F98FD8;
      v33[4] = self;
      v34 = v7;
      objc_msgSend(v29, "applySnapshot:animatingDifferences:completion:", v30, 1, v33);

      v28 = v34;
    }

LABEL_15:
  }
}

void __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mediaCollectionViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasContent");

  objc_msgSend(*(id *)(a1 + 32), "contentPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = 3;
  else
    v6 = 2;
  objc_msgSend(v4, "setCurrentContentViewType:", v6);

  objc_msgSend(*(id *)(a1 + 40), "collectionViewLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayout");

}

void __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateEpisodeShelvesWithLatestEpisodes");
  objc_msgSend(*(id *)(a1 + 40), "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 32), "stackCollectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)contentDescriptionExpanded
{
  void *v2;
  id v3;

  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

- (void)libraryEpisodesShelfViewController:(id)a3 didRemoveDownloadForAssetController:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  -[VUILibraryMediaCollectionViewController episodes](self, "episodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
    -[VUILibraryMediaCollectionViewController _updateAfterContentWasManuallyDeleted:](self, "_updateAfterContentWasManuallyDeleted:", objc_msgSend(v7, "supportsStartingDownload"));

}

- (void)titleButtonPressedForStoreId:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  VUIDocumentDataSource *v12;
  VUIDocumentContextDataTVShow *v13;
  VUIDocumentUIConfiguration *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  objc_msgSend(a3, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[VUILibraryMediaCollectionViewController titleButtonPressedForStoreId:].cold.1(v4);

  }
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[VUITVAppLauncher isSidebarEnabled](VUITVAppLauncher, "isSidebarEnabled"))
  {
    objc_msgSend(v7, "splitViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isTabbarMode");

  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(v7, "switchTabHandler");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v6, "storeTabIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v10)[2](v10, v11);

  v12 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", CFSTR("TVShowCanonical"));
  -[VUIDocumentDataSource setControllerRef:](v12, "setControllerRef:", CFSTR("TVShowCanonical"));
  -[VUIDocumentDataSource setDocumentType:](v12, "setDocumentType:", CFSTR("canonical"));
  v13 = -[VUIDocumentContextDataTVShow initWithAdamID:]([VUIDocumentContextDataTVShow alloc], "initWithAdamID:", v3);
  -[VUIDocumentDataSource setContextData:](v12, "setContextData:", v13);
  v14 = objc_alloc_init(VUIDocumentUIConfiguration);
  -[VUIDocumentUIConfiguration setType:](v14, "setType:", 1);
  -[VUIDocumentUIConfiguration setAnimated:](v14, "setAnimated:", 1);
  -[VUIDocumentDataSource setUiConfiguration:](v12, "setUiConfiguration:", v14);
  objc_msgSend(v7, "appController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewControllerWithDocumentDataSource:appContext:", v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v7, "appController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "tabBarController");
    else
      objc_msgSend(v7, "splitViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v21, "vuiPresentedViewController"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          v22))
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __72__VUILibraryMediaCollectionViewController_titleButtonPressedForStoreId___block_invoke;
      v25[3] = &unk_1E9F98FD8;
      v26 = v20;
      v27 = v18;
      objc_msgSend(v21, "vui_dismissViewControllerAnimated:completion:", 1, v25);

    }
    else
    {
      objc_msgSend(v20, "pushViewController:animated:", v18, 1);
    }

  }
  else
  {
    -[VUILibraryMediaCollectionViewController showItemNotAvailableDialog](self, "showItemNotAvailableDialog");
  }

}

uint64_t __72__VUILibraryMediaCollectionViewController_titleButtonPressedForStoreId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)showItemNotAvailableDialog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("TV.Library.Item.Not.Available.Title"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("TV.Library.Item.Not.Available.Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v10, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vui_addAction:", v9);
  objc_msgSend(v6, "vui_presentAlertFromPresentingController:animated:completion:", self, 1, 0);

}

- (id)_createDiffableDataSourceForCollectionView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__VUILibraryMediaCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke;
  v9[3] = &unk_1E9FA4BA8;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v6, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

id __86__VUILibraryMediaCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_seasonViewModelByIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  if (v10 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryEpisodeFooterCellReuseIdentifier"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mediaCollectionViewModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "seasonBySeasonIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seasonIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "storeID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreID:", v30);

    v31 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:", CFSTR("GET_MORE_EPISODES"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:", CFSTR("PRODUCT_DESCRIPTION_MORE_ELLIPSES"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@%@"), v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v36);

    objc_msgSend(v11, "setDelegate:", WeakRetained);
  }
  else if (v10 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryCollectionCellReuseIdentifier"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mediaCollectionViewModel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "episodeShelfViewControllerBySeasonIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seasonIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setViewController:", v12);
  }
  else
  {
    if (v10)
    {
      v11 = 0;
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUICollectionViewWrapperCellReuseIdentifier"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seasonIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mediaCollectionViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "productLockupViewBySeasonIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(WeakRetained, "mediaCollectionViewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(MEMORY[0x1E0C99D80]);
      objc_msgSend(v15, "setProductLockupViewBySeasonIdentifier:", v16);

    }
    objc_msgSend(WeakRetained, "mediaCollectionViewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "productLockupViewBySeasonIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(WeakRetained, "mediaCollectionViewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "seasonBySeasonIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "_productLockupViewWithSeason:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "mediaCollectionViewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "productLockupViewBySeasonIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");

      objc_msgSend(v25, "setObject:forKey:", v19, v12);
      objc_msgSend(WeakRetained, "mediaCollectionViewModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setProductLockupViewBySeasonIdentifier:", v25);

    }
    objc_msgSend(v11, "setChildView:", v19);

  }
LABEL_13:

  return v11;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10[0] = CFSTR("MediaCollectionMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUILibraryMediaCollectionViewController _seasonViewModelIdentifiers](self, "_seasonViewModelIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("MediaCollectionMainSection"));
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUILibraryMediaCollectionViewController:Creating snapshot with %lu season view models", (uint8_t *)&v8, 0xCu);
  }

  return v3;
}

- (id)_seasonViewModelIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seasonViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_seasonViewModelByIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
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
  -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seasonViewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_updateEpisodeShelvesWithLatestEpisodes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seasonViewModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "type");
        objc_msgSend(v9, "seasonIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (v10 == 1)
          {
            -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "episodeShelfViewControllerBySeasonIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            -[VUILibraryMediaCollectionViewController mediaCollectionViewModel](self, "mediaCollectionViewModel");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "episodesBySeasonIdentifer");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14 && v17)
              objc_msgSend(v14, "updateWithEpisodes:", v17);
            -[VUILibraryMediaCollectionViewController _updateProductLockupViewWithSeasonIdentifier:](self, "_updateProductLockupViewWithSeasonIdentifier:", v11);

          }
        }
        else
        {
          -[VUILibraryMediaCollectionViewController _updateProductLockupViewWithSeasonIdentifier:](self, "_updateProductLockupViewWithSeasonIdentifier:", v11);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (void)_updateAfterContentWasManuallyDeleted:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (!a3)
  {
    -[VUILibraryMediaCollectionViewController contentPresenter](self, "contentPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentHasBeenManuallyDeleted:", 1);

    -[VUILibraryDataSource setDelegate:](self->_episodesDataSource, "setDelegate:", 0);
    -[VUILibraryDataSource setDelegate:](self->_seasonsDataSource, "setDelegate:", 0);
    -[VUILibraryMediaCollectionViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (void)_updateDeletedContentErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (-[VUILibraryMediaCollectionViewController canShowMultipleSeasons](self, "canShowMultipleSeasons"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("GENERIC_DELETED_ERROR_MESSAGE_FORMAT");
LABEL_6:
    objc_msgSend(v4, "localizedStringForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, self->_showTitle, v10);
    goto LABEL_7;
  }
  -[VUIMediaEntity seasonNumber](self->_mediaCollection, "seasonNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v8)
  {
    v6 = CFSTR("GENERIC_SEASON_DELETED_ERROR_MESSAGE_FORMAT");
    goto LABEL_6;
  }
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SPECIFIC_SEASON_DELETED_ERROR_MESSAGE_FORMAT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%lu %@"), 0, v8, self->_showTitle);
LABEL_7:
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIViewControllerContentPresenter setDeletedContentErrorMessage:](self->_contentPresenter, "setDeletedContentErrorMessage:", v11);
}

- (id)_episodesBySeasonIdentifier
{
  id v3;
  NSArray *episodeGroups;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_episodeGroups)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    episodeGroups = self->_episodeGroups;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __70__VUILibraryMediaCollectionViewController__episodesBySeasonIdentifier__block_invoke;
    v11 = &unk_1E9FA40F8;
    v12 = v3;
    v5 = v3;
    -[NSArray enumerateObjectsUsingBlock:](episodeGroups, "enumerateObjectsUsingBlock:", &v8);
    v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  }
  else
  {
    -[VUIMediaEntity identifier](self->_mediaCollection, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    v14[0] = self->_episodes;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __70__VUILibraryMediaCollectionViewController__episodesBySeasonIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "mediaEntities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);
}

- (BOOL)_usingEpisodesGroupFetch
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VUIMediaEntity type](self->_mediaCollection, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (void)_buildMediaCollectionViewModel
{
  VUILibraryMediaCollectionViewModel *v3;
  VUILibraryMediaCollectionViewModel *mediaCollectionViewModel;

  v3 = objc_alloc_init(VUILibraryMediaCollectionViewModel);
  mediaCollectionViewModel = self->_mediaCollectionViewModel;
  self->_mediaCollectionViewModel = v3;

  -[VUILibraryMediaCollectionViewController _updateMediaCollectionViewModelForSeasons](self, "_updateMediaCollectionViewModelForSeasons");
}

- (void)_updateMediaCollectionViewModelForSeasons
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUILibrarySeasonViewModel *v11;
  VUILibrarySeasonViewModel *v12;
  void *v13;
  uint64_t v14;
  VUILibrarySeasonViewModel *v15;
  VUILibraryMediaCollectionViewModel *mediaCollectionViewModel;
  void *v17;
  VUILibraryMediaCollectionViewController *v18;
  void *v19;
  NSArray *obj;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[VUILibraryMediaCollectionViewController _episodesBySeasonIdentifier](self, "_episodesBySeasonIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUILibraryMediaCollectionViewModel episodeShelfViewControllerBySeasonIdentifier](self->_mediaCollectionViewModel, "episodeShelfViewControllerBySeasonIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self;
  obj = self->_seasons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v7, v8);
        objc_msgSend(v23, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(v19, "objectForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUILibraryMediaCollectionViewController _episodeShelfViewControllerWithSeason:episodes:](v18, "_episodeShelfViewControllerWithSeason:episodes:", v7, v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v22, "setObject:forKey:", v9, v8);
        v11 = -[VUILibrarySeasonViewModel initWithSeasonIdentifier:type:]([VUILibrarySeasonViewModel alloc], "initWithSeasonIdentifier:type:", v8, 0);
        objc_msgSend(v3, "addObject:", v11);
        v12 = -[VUILibrarySeasonViewModel initWithSeasonIdentifier:type:]([VUILibrarySeasonViewModel alloc], "initWithSeasonIdentifier:type:", v8, 1);
        objc_msgSend(v3, "addObject:", v12);
        objc_msgSend(v7, "storeID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if (v14)
        {
          v15 = -[VUILibrarySeasonViewModel initWithSeasonIdentifier:type:]([VUILibrarySeasonViewModel alloc], "initWithSeasonIdentifier:type:", v8, 2);
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  mediaCollectionViewModel = v18->_mediaCollectionViewModel;
  v17 = (void *)objc_msgSend(v3, "copy");
  -[VUILibraryMediaCollectionViewModel setSeasonViewModels:](mediaCollectionViewModel, "setSeasonViewModels:", v17);

  -[VUILibraryMediaCollectionViewModel setSeasonBySeasonIdentifier:](v18->_mediaCollectionViewModel, "setSeasonBySeasonIdentifier:", v24);
  -[VUILibraryMediaCollectionViewModel setEpisodeShelfViewControllerBySeasonIdentifier:](v18->_mediaCollectionViewModel, "setEpisodeShelfViewControllerBySeasonIdentifier:", v22);
  -[VUILibraryMediaCollectionViewModel setEpisodesBySeasonIdentifer:](v18->_mediaCollectionViewModel, "setEpisodesBySeasonIdentifer:", v19);

}

- (id)_productLockupViewWithSeason:(id)a3
{
  id v4;
  VUIProductLockupView *v5;
  VUIProductLockupView *v6;

  v4 = a3;
  v5 = [VUIProductLockupView alloc];
  v6 = -[VUIProductLockupView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VUIProductLockupView setDelegate:](v6, "setDelegate:", self);
  -[VUILibraryMediaCollectionViewController _updateProductLockupView:withSeason:](self, "_updateProductLockupView:withSeason:", v6, v4);

  return v6;
}

- (void)_updateProductLockupViewWithSeasonIdentifier:(id)a3
{
  VUILibraryMediaCollectionViewModel *mediaCollectionViewModel;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;

  mediaCollectionViewModel = self->_mediaCollectionViewModel;
  v5 = a3;
  -[VUILibraryMediaCollectionViewModel productLockupViewBySeasonIdentifier](mediaCollectionViewModel, "productLockupViewBySeasonIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[VUILibraryMediaCollectionViewModel seasonBySeasonIdentifier](self->_mediaCollectionViewModel, "seasonBySeasonIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
    -[VUILibraryMediaCollectionViewController _updateProductLockupView:withSeason:](self, "_updateProductLockupView:withSeason:", v10, v8);

}

- (void)_updateProductLockupView:(id)a3 withSeason:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "updateWithMediaEntity:", v6);
  -[VUILibraryMediaCollectionViewController addDownloadButtonToProductLockupView:forSeason:](self, "addDownloadButtonToProductLockupView:forSeason:", v7, v6);

}

- (id)_episodeShelfViewControllerWithSeason:(id)a3 episodes:(id)a4
{
  id v5;
  VUILibraryEpisodeShelfViewController *v6;

  v5 = a4;
  v6 = -[VUILibraryEpisodeShelfViewController initWithEpisodes:]([VUILibraryEpisodeShelfViewController alloc], "initWithEpisodes:", v5);

  -[VUILibraryEpisodeShelfViewController setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (void)addDownloadButtonToProductLockupView:(id)a3 forSeason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  VUIDownloadButton *v10;
  char v11;
  _QWORD v12[4];
  id v13;
  char v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "downloadView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v7, "assetController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = -[VUIDownloadButton initWithMediaEntity:type:]([VUIDownloadButton alloc], "initWithMediaEntity:type:", v7, 8);
    else
      v10 = 0;
    -[VUIDownloadButton setUsesDefaultConfiguration:](v10, "setUsesDefaultConfiguration:", 1);
    -[VUIDownloadButton setPresentingViewController:](v10, "setPresentingViewController:", self);
    if (v10)
    {
      v11 = objc_msgSend(v9, "supportsStartingDownload");
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __90__VUILibraryMediaCollectionViewController_addDownloadButtonToProductLockupView_forSeason___block_invoke;
      v12[3] = &unk_1E9FA4BD0;
      objc_copyWeak(&v13, &location);
      v14 = v11;
      -[VUIDownloadButton setDownloadStateChangeHandler:](v10, "setDownloadStateChangeHandler:", v12);
      objc_msgSend(v6, "setDownloadView:", v10);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

void __90__VUILibraryMediaCollectionViewController_addDownloadButtonToProductLockupView_forSeason___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a3)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "seasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    WeakRetained = v8;
    if (v7 == 1)
    {
      objc_msgSend(v8, "_updateAfterContentWasManuallyDeleted:", *(unsigned __int8 *)(a1 + 40));
      WeakRetained = v8;
    }
  }

}

- (BOOL)_allFetchesHaveCompleted
{
  _BOOL4 v3;

  v3 = -[VUILibraryMediaCollectionViewController episodesFetchHasCompleted](self, "episodesFetchHasCompleted");
  if (v3)
    LOBYTE(v3) = -[VUILibraryMediaCollectionViewController seasonsFetchHasCompleted](self, "seasonsFetchHasCompleted");
  return v3;
}

- (BOOL)canShowMultipleSeasons
{
  return self->_canShowMultipleSeasons;
}

- (void)setCanShowMultipleSeasons:(BOOL)a3
{
  self->_canShowMultipleSeasons = a3;
}

- (VUIMediaCollection)mediaCollection
{
  return self->_mediaCollection;
}

- (void)setMediaCollection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaCollection, a3);
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (NSArray)seasons
{
  return self->_seasons;
}

- (void)setSeasons:(id)a3
{
  objc_storeStrong((id *)&self->_seasons, a3);
}

- (NSArray)episodes
{
  return self->_episodes;
}

- (void)setEpisodes:(id)a3
{
  objc_storeStrong((id *)&self->_episodes, a3);
}

- (NSArray)episodeGroups
{
  return self->_episodeGroups;
}

- (void)setEpisodeGroups:(id)a3
{
  objc_storeStrong((id *)&self->_episodeGroups, a3);
}

- (VUILibraryMediaCollectionViewModel)mediaCollectionViewModel
{
  return self->_mediaCollectionViewModel;
}

- (void)setMediaCollectionViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_mediaCollectionViewModel, a3);
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_showTitle, a3);
}

- (VUIMediaEntitiesDataSource)seasonsDataSource
{
  return self->_seasonsDataSource;
}

- (void)setSeasonsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_seasonsDataSource, a3);
}

- (VUIMediaEntitiesDataSource)episodesDataSource
{
  return self->_episodesDataSource;
}

- (void)setEpisodesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_episodesDataSource, a3);
}

- (BOOL)seasonsFetchHasCompleted
{
  return self->_seasonsFetchHasCompleted;
}

- (void)setSeasonsFetchHasCompleted:(BOOL)a3
{
  self->_seasonsFetchHasCompleted = a3;
}

- (BOOL)episodesFetchHasCompleted
{
  return self->_episodesFetchHasCompleted;
}

- (void)setEpisodesFetchHasCompleted:(BOOL)a3
{
  self->_episodesFetchHasCompleted = a3;
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
  objc_storeStrong((id *)&self->_episodesDataSource, 0);
  objc_storeStrong((id *)&self->_seasonsDataSource, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_mediaCollectionViewModel, 0);
  objc_storeStrong((id *)&self->_episodeGroups, 0);
  objc_storeStrong((id *)&self->_episodes, 0);
  objc_storeStrong((id *)&self->_seasons, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_mediaCollection, 0);
}

- (void)titleButtonPressedForStoreId:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUILibraryMediaCollectionViewController:: Show more episodes button pressed - missing adamId", v1, 2u);
}

@end
