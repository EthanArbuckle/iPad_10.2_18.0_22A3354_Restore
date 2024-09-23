@implementation VUILibraryProductViewController

- (VUILibraryProductViewController)initWithMediaItem:(id)a3
{
  id v5;
  VUILibraryProductViewController *v6;
  VUILibraryProductViewController *v7;
  VUIViewControllerContentPresenter *v8;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUILibraryProductViewController;
  v6 = -[VUILibraryStackViewController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaItem, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    -[VUIViewControllerContentPresenter setLogName:](v7->_contentPresenter, "setLogName:", CFSTR("VUILibraryProductViewController"));
    objc_initWeak(&location, v7);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__VUILibraryProductViewController_initWithMediaItem___block_invoke;
    v13[3] = &unk_1E9F99F98;
    objc_copyWeak(&v14, &location);
    v11 = (id)-[VUILibraryProductViewController registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v10, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__VUILibraryProductViewController_initWithMediaItem___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    WeakRetained = v5;
    if (!v3)
    {
      objc_msgSend(v5[126], "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v4);

      WeakRetained = v5;
    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILibraryProductViewController;
  -[VUILibraryStackViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[VUILibraryProductViewController start](self, "start");
  -[VUILibraryProductViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSupportsTwoLineLargeTitles:", 1);
  -[VUIMediaEntity title](self->_mediaItem, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductViewController setTitle:](self, "setTitle:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryProductViewController;
  -[VUILibraryStackViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VUILibraryProductViewController reportMetricsPageEvent](self, "reportMetricsPageEvent");
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryProductViewController;
  -[VUILibraryProductViewController loadView](&v4, sel_loadView);
  -[VUILibraryProductViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILibraryProductViewController;
  -[VUILibraryProductViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[VUILibraryProductViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

}

- (void)configureWithCollectionView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUICollectionViewWrapperCellReuseIdentifier"));

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VUIProductLockupView *v8;
  VUIProductLockupView *productLockupView;
  char isKindOfClass;
  VUIMediaItem *mediaItem;
  void *v12;
  char v13;
  VUIDownloadButton *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  VUILibraryProductInfoView *v20;
  VUILibraryProductInfoView *productInfoView;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  -[VUILibraryStackViewController stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductViewController contentPresenter](self, "contentPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentView:", v3);

  -[VUILibraryProductViewController contentPresenter](self, "contentPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("LIBRARY_GENERIC_FETCH_ERROR_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNoContentErrorTitle:", v7);

  -[VUILibraryProductViewController _productLockupViewWithMediaItem:](self, "_productLockupViewWithMediaItem:", self->_mediaItem);
  v8 = (VUIProductLockupView *)objc_claimAutoreleasedReturnValue();
  productLockupView = self->_productLockupView;
  self->_productLockupView = v8;

  if (self->_mediaItem)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    mediaItem = self->_mediaItem;
    if ((isKindOfClass & 1) != 0)
    {
      -[VUIMediaItem mediaItem](mediaItem, "mediaItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "vui_isHomeSharingMediaItem");

      if ((v13 & 1) != 0)
      {
        v14 = 0;
        goto LABEL_14;
      }
      mediaItem = self->_mediaItem;
    }
  }
  else
  {
    mediaItem = 0;
  }
  -[VUIMediaEntity assetController](mediaItem, "assetController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "supportsStartingDownload"))
    v14 = -[VUIDownloadButton initWithMediaEntity:type:]([VUIDownloadButton alloc], "initWithMediaEntity:type:", self->_mediaItem, 8);
  else
    v14 = 0;
  -[VUIDownloadButton setUsesDefaultConfiguration:](v14, "setUsesDefaultConfiguration:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 == 1)
    -[VUIDownloadButton setShowsTextInDownloadedState:](v14, "setShowsTextInDownloadedState:", 1);
  -[VUIDownloadButton setPresentingViewController:](v14, "setPresentingViewController:", self);
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __40__VUILibraryProductViewController_start__block_invoke;
  v23[3] = &unk_1E9F9DD38;
  objc_copyWeak(&v25, &location);
  v19 = v16;
  v24 = v19;
  -[VUIDownloadButton setDownloadStateChangeHandler:](v14, "setDownloadStateChangeHandler:", v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

LABEL_14:
  -[VUILibraryProductViewController setDownloadButton:](self, "setDownloadButton:", v14);
  -[VUILibraryProductViewController _productInfoViewWithMediaItem:](self, "_productInfoViewWithMediaItem:", self->_mediaItem);
  v20 = (VUILibraryProductInfoView *)objc_claimAutoreleasedReturnValue();
  productInfoView = self->_productInfoView;
  self->_productInfoView = v20;

  -[VUILibraryProductViewController contentPresenter](self, "contentPresenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCurrentContentViewType:", 3);

}

void __40__VUILibraryProductViewController_start__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id *WeakRetained;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "_updateAfterContentWasManuallyDeleted:", objc_msgSend(*(id *)(a1 + 32), "supportsStartingDownload"));
    WeakRetained = v6;
  }
  if (WeakRetained)
  {
    objc_msgSend(v6[127], "setNeedsLayout");
    WeakRetained = v6;
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int *v9;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUICollectionViewWrapperCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "section");

  v9 = &OBJC_IVAR___VUILibraryProductViewController__productInfoView;
  if (!v8)
    v9 = &OBJC_IVAR___VUILibraryProductViewController__productLockupView;
  objc_msgSend(v7, "setChildView:", *(Class *)((char *)&self->super.super.super.super.isa + *v9));
  return v7;
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
  -[VUILibraryProductViewController traitCollection](self, "traitCollection");
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  double Width;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  v7 = a5;
  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v22);
  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
  {
    v9 = -[VUILibraryProductViewController vuiIsRTL](self, "vuiIsRTL");
    -[VUILibraryProductViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v12 = v11;
    v14 = v13;

    if ((v9 & 1) != 0)
      Width = Width - v14;
    else
      Width = Width - v12;
  }
  v15 = objc_msgSend(v7, "section");
  v16 = &OBJC_IVAR___VUILibraryProductViewController__productInfoView;
  if (!v15)
    v16 = &OBJC_IVAR___VUILibraryProductViewController__productLockupView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v16), "sizeThatFits:", Width, 1.79769313e308);
  v18 = v17;

  v19 = Width;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
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

- (void)didSelectButton:(id)a3
{
  VUIMediaItem *v3;
  void *v4;
  VUIMediaInfo *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  VUIMediaInfo *v9;
  _QWORD v10[4];
  VUIMediaItem *v11;
  VUIMediaItem *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_mediaItem;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUIMediaItem videosPlayable](v3, "videosPlayable");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = [VUIMediaInfo alloc];
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](v5, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", 3, v6, 0, 0);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setUserPlaybackInitiationDate:openURLCompletionDate:](v7, "setUserPlaybackInitiationDate:openURLCompletionDate:", v8, 0);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_10:
        VUIDefaultLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[VUIDownloadShowTableViewController tableView:didSelectRowAtIndexPath:].cold.1((uint64_t)v3, v7);
        goto LABEL_12;
      }
      v9 = [VUIMediaInfo alloc];
      v12 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[VUIMediaInfo initWithPlaybackContext:vuiMediaItems:](v9, "initWithPlaybackContext:vuiMediaItems:", 3, v4);
    }

    if (v7)
    {
      -[NSObject setIntent:](v7, "setIntent:", 1);
      -[NSObject setAutomaticPlaybackStart:](v7, "setAutomaticPlaybackStart:", 0);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__VUILibraryProductViewController_didSelectButton___block_invoke;
      v10[3] = &unk_1E9F98DF0;
      v11 = v3;
      +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:completion:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:completion:", v7, 0, 0, v10);

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_1(v7);
LABEL_12:

}

uint64_t __51__VUILibraryProductViewController_didSelectButton___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:isLaunchingExtras:](VUILibraryMetrics, "recordPlayOfMediaEntity:isLaunchingExtras:", *(_QWORD *)(a1 + 32), 0);
}

- (void)setDownloadButton:(id)a3
{
  VUIDownloadButton *v5;
  VUIDownloadButton **p_downloadButton;
  VUIDownloadButton *downloadButton;
  void *v8;
  _BOOL8 v9;
  VUIDownloadButton *v10;

  v5 = (VUIDownloadButton *)a3;
  p_downloadButton = &self->_downloadButton;
  downloadButton = self->_downloadButton;
  v10 = v5;
  if (downloadButton != v5)
  {
    if (downloadButton)
      -[VUIDownloadButton removeFromSuperview](downloadButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_downloadButton, a3);
    if (*p_downloadButton)
    {
      -[VUILibraryProductViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection") == 1;

      -[VUIButton setImageTrailsTextContent:](*p_downloadButton, "setImageTrailsTextContent:", v9);
      -[VUIProductLockupView setDownloadView:](self->_productLockupView, "setDownloadView:", *p_downloadButton);
    }
  }

}

- (id)_productLockupViewWithMediaItem:(id)a3
{
  void *v4;
  void *v5;

  +[VUIProductLockupView productLockupViewWithMedia:](VUIProductLockupView, "productLockupViewWithMedia:", self->_mediaItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "leftButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  return v4;
}

- (id)_productInfoViewWithMediaItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  VUILibraryProductInfoView *v38;
  VUILibraryProductInfoView *v39;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "credits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("PRODUCT_INFO_CAST_HEADER"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cast");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryProductViewController _productSectionForHeader:data:group:maxItemCount:](self, "_productSectionForHeader:data:group:maxItemCount:", v10, v12, 0, 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v13);
  }
  objc_msgSend(v4, "credits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "directors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:", CFSTR("PRODUCT_INFO_DIRECTORS_HEADER"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "directors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryProductViewController _productSectionForHeader:data:group:maxItemCount:](self, "_productSectionForHeader:data:group:maxItemCount:", v18, v20, CFSTR("InfoAllOthersGroup"), 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v21);
  }
  objc_msgSend(v4, "credits");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "producers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:", CFSTR("PRODUCT_INFO_PRODUCERS_HEADER"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credits");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "producers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryProductViewController _productSectionForHeader:data:group:maxItemCount:](self, "_productSectionForHeader:data:group:maxItemCount:", v26, v28, CFSTR("InfoAllOthersGroup"), 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v29);
  }
  objc_msgSend(v4, "credits");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "screenwriters");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:", CFSTR("PRODUCT_INFO_SCREENWRITERS_HEADER"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credits");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "screenwriters");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryProductViewController _productSectionForHeader:data:group:maxItemCount:](self, "_productSectionForHeader:data:group:maxItemCount:", v34, v36, CFSTR("InfoAllOthersGroup"), 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v37);
  }
  if (objc_msgSend(v5, "count"))
  {
    v38 = [VUILibraryProductInfoView alloc];
    v39 = -[VUILibraryProductInfoView initWithFrame:](v38, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[VUILibraryProductInfoView setInfos:](v39, "setInfos:", v5);
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)_productSectionForHeader:(id)a3 data:(id)a4 group:(id)a5 maxItemCount:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  VUILibraryProductInfoSection *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v21;
  id v22;
  unint64_t v23;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(VUILibraryProductInfoSection);
  v13 = (void *)objc_opt_new();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __84__VUILibraryProductViewController__productSectionForHeader_data_group_maxItemCount___block_invoke;
  v21 = &unk_1E9F9DD60;
  v22 = v13;
  v23 = a6;
  v14 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v18);

  v15 = (void *)objc_msgSend(v14, "copy", v18, v19, v20, v21);
  -[VUILibraryProductInfoSection setDataViews:](v12, "setDataViews:", v15);

  +[VUILibraryProductInfoSection headerViewWithString:](VUILibraryProductInfoSection, "headerViewWithString:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUILibraryProductInfoSection setHeaderContentView:](v12, "setHeaderContentView:", v16);
  -[VUILibraryProductInfoSection setGroupName:](v12, "setGroupName:", v9);

  return v12;
}

void __84__VUILibraryProductViewController__productSectionForHeader_data_group_maxItemCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  +[VUILibraryProductInfoSection dataViewWithString:](VUILibraryProductInfoSection, "dataViewWithString:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if (a3 + 1 == *(_QWORD *)(a1 + 40))
    *a4 = 1;

}

- (void)_updateAfterContentWasManuallyDeleted:(BOOL)a3
{
  id v3;
  id v4;

  if (!a3)
  {
    -[VUILibraryProductViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

- (void)reportMetricsPageEvent
{
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryMovieProduct"));
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_storeStrong((id *)&self->_productInfoView, 0);
  objc_storeStrong((id *)&self->_productLockupView, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end
