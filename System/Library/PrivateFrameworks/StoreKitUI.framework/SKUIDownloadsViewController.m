@implementation SKUIDownloadsViewController

- (SKUIDownloadsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIDownloadsViewController *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  SSDownloadManager *downloadManager;
  uint64_t v22;
  SKUIImageDataConsumer *consumer;
  NSMutableDictionary *v24;
  NSMutableDictionary *imageOperations;
  NSCache *v26;
  NSCache *images;
  UIImage *v28;
  UIImage *nullImage;
  dispatch_time_t v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v34[4];
  SKUIDownloadsViewController *v35;
  _QWORD block[4];
  id v37;
  id location;
  objc_super v39;
  _QWORD v40[10];
  _QWORD v41[6];

  v41[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsViewController initWithNibName:bundle:].cold.1();
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIDownloadsViewController;
  v8 = -[SKUIDownloadsViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DAF4E0]);
    objc_msgSend(MEMORY[0x1E0DAF4C8], "ITunesDownloadKinds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDownloadKinds:", v10);

    v11 = *MEMORY[0x1E0DAF7E0];
    v41[0] = *MEMORY[0x1E0DAF7D8];
    v41[1] = v11;
    v12 = *MEMORY[0x1E0DAF7F0];
    v41[2] = *MEMORY[0x1E0DAF7E8];
    v41[3] = v12;
    v41[4] = *MEMORY[0x1E0DAF7F8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrefetchedDownloadExternalProperties:", v13);

    v14 = *MEMORY[0x1E0DAF910];
    v40[0] = *MEMORY[0x1E0DAF8D8];
    v40[1] = v14;
    v15 = *MEMORY[0x1E0DAF940];
    v40[2] = *MEMORY[0x1E0DAF928];
    v40[3] = v15;
    v16 = *MEMORY[0x1E0DAF9F8];
    v40[4] = *MEMORY[0x1E0DAF9F0];
    v40[5] = v16;
    v17 = *MEMORY[0x1E0DAF9C8];
    v40[6] = *MEMORY[0x1E0DAF900];
    v40[7] = v17;
    v18 = *MEMORY[0x1E0DAF9E0];
    v40[8] = *MEMORY[0x1E0DAF958];
    v40[9] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrefetchedDownloadProperties:", v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4C8]), "initWithManagerOptions:", v9);
    downloadManager = v8->_downloadManager;
    v8->_downloadManager = (SSDownloadManager *)v20;

    -[SSDownloadManager addObserver:](v8->_downloadManager, "addObserver:", v8);
    -[SKUIDownloadsViewController setAutomaticallyAdjustsScrollViewInsets:](v8, "setAutomaticallyAdjustsScrollViewInsets:", 0);
    +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
    v22 = objc_claimAutoreleasedReturnValue();
    consumer = v8->_consumer;
    v8->_consumer = (SKUIImageDataConsumer *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    imageOperations = v8->_imageOperations;
    v8->_imageOperations = v24;

    v26 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    images = v8->_images;
    v8->_images = v26;

    v28 = (UIImage *)objc_alloc_init(MEMORY[0x1E0DC3870]);
    nullImage = v8->_nullImage;
    v8->_nullImage = v28;

    objc_initWeak(&location, v8);
    v30 = dispatch_time(0, 60000000000);
    v31 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke;
    block[3] = &unk_1E739FF68;
    objc_copyWeak(&v37, &location);
    v32 = MEMORY[0x1E0C80D38];
    dispatch_after(v30, MEMORY[0x1E0C80D38], block);
    v34[0] = v31;
    v34[1] = 3221225472;
    v34[2] = __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke_2;
    v34[3] = &unk_1E739FD38;
    v35 = v8;
    dispatch_async(v32, v34);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadManagerFromServer");

}

uint64_t __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBadge");
}

- (void)dealloc
{
  objc_super v3;

  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SKUIDownloadsViewController;
  -[SKUIViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[SKUIDownloadsViewController setView:](self, "setView:", v3);
  -[SKUIDownloadsViewController _reloadView](self, "_reloadView");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  -[SKUIDownloadsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[SKUIDownloadsViewController _reloadViewControllerWithSize:](self, "_reloadViewControllerWithSize:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SKUIDownloadsViewController;
  -[SKUIDownloadsViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
}

- (void)childViewController:(id)a3 performActionForDownload:(id)a4
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF928]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0DAF890]);
  else
    v6 = 0;

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAF8A0]) & 1) != 0)
  {
    if (!v6)
      goto LABEL_10;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAF8C0]);
  if ((v6 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(v8, "pause");
    goto LABEL_11;
  }
  if (v7)
LABEL_10:
    objc_msgSend(v8, "resume");
LABEL_11:

}

- (void)childViewController:(id)a3 removeDownloads:(id)a4
{
  -[SSDownloadManager cancelDownloads:completionBlock:](self->_downloadManager, "cancelDownloads:completionBlock:", a4, 0);
}

- (id)childViewController:(id)a3 artworkForDownload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIImage *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0DAF9F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  -[NSCache objectForKey:](self->_images, "objectForKey:", v8);
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == self->_nullImage)
    goto LABEL_6;
  if (!v9)
  {
    -[NSMutableDictionary objectForKey:](self->_imageOperations, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_7:
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v10);
    objc_msgSend(v12, "setDataConsumer:", self->_consumer);
    objc_msgSend(v12, "setITunesStoreRequest:", 0);
    objc_msgSend(v12, "setRecordsMetrics:", 0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke;
    v16[3] = &unk_1E73A87C0;
    objc_copyWeak(&v18, &location);
    v13 = v8;
    v17 = v13;
    objc_msgSend(v12, "setOutputBlock:", v16);
    -[NSMutableDictionary setObject:forKey:](self->_imageOperations, "setObject:forKey:", v12, v13);
    -[SKUIViewController operationQueue](self, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
LABEL_6:

    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

void __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setArtwork:forURLString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SKUIDownloadsViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SKUIDownloadsViewController_downloadManager_downloadStatesDidChange___block_invoke;
  v7[3] = &unk_1E739FD10;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __71__SKUIDownloadsViewController_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "downloads", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "indexOfObject:", v8);

        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v2, "addIndex:", v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "reloadDownloadsAtIndexes:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "reloadDownloadsAtIndexes:", v2);

}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SKUIDownloadsViewController_downloadManagerDownloadsDidChange___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __65__SKUIDownloadsViewController_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v1, "_reloadViewControllerWithSize:", v2, v3);

}

- (void)_reloadViewControllerWithSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  SKUIIPadDownloadsViewController *v7;
  void *v8;
  SKUIIPadDownloadsViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *ipadViewController;
  __objc2_class *v14;
  SKUIIPhoneDownloadsViewController *iphoneViewController;
  void *v16;
  SKUIIPhoneDownloadsViewController *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  height = a3.height;
  width = a3.width;
  -[SKUIDownloadsViewController _reloadBadge](self, "_reloadBadge");
  v6 = objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", width, height);
  if (v6 == 2)
  {
    iphoneViewController = self->_iphoneViewController;
    if (iphoneViewController)
    {
      -[SKUIIPhoneDownloadsViewController view](iphoneViewController, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[SKUIIPhoneDownloadsViewController removeFromParentViewController](self->_iphoneViewController, "removeFromParentViewController");
      -[SKUIIPhoneDownloadsViewController setDelegate:](self->_iphoneViewController, "setDelegate:", 0);
      v17 = self->_iphoneViewController;
      self->_iphoneViewController = 0;

      -[SKUIDownloadsViewController navigationItem](self, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLeftBarButtonItems:", 0);

      -[SKUIDownloadsViewController navigationItem](self, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRightBarButtonItems:", 0);

    }
    v12 = 1080;
    ipadViewController = self->_ipadViewController;
    if (!ipadViewController)
    {
      v14 = SKUIIPadDownloadsViewController;
      goto LABEL_11;
    }
  }
  else
  {
    if (v6 == 1)
    {
      v7 = self->_ipadViewController;
      if (v7)
      {
        -[SKUIIPadDownloadsViewController view](v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        -[SKUIIPadDownloadsViewController removeFromParentViewController](self->_ipadViewController, "removeFromParentViewController");
        -[SKUIIPadDownloadsViewController setDelegate:](self->_ipadViewController, "setDelegate:", 0);
        v9 = self->_ipadViewController;
        self->_ipadViewController = 0;

        -[SKUIDownloadsViewController navigationItem](self, "navigationItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLeftBarButtonItems:", 0);

        -[SKUIDownloadsViewController navigationItem](self, "navigationItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRightBarButtonItems:", 0);

      }
    }
    v12 = 1072;
    ipadViewController = self->_iphoneViewController;
    if (!ipadViewController)
    {
      v14 = SKUIIPhoneDownloadsViewController;
LABEL_11:
      v20 = (objc_class *)objc_alloc_init(v14);
      v21 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      *(Class *)((char *)&self->super.super.super.super.isa + v12) = v20;

      v22 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      -[SKUIDownloadsViewController navigationItem](self, "navigationItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_setExistingNavigationItem:", v23);

      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v12), "setDelegate:", self);
      v24 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      -[SKUIViewController clientContext](self, "clientContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setClientContext:", v25);

      -[SKUIDownloadsViewController addChildViewController:](self, "addChildViewController:", *(Class *)((char *)&self->super.super.super.super.isa + v12));
      ipadViewController = *(Class *)((char *)&self->super.super.super.super.isa + v12);
    }
  }
  -[SKUIDownloadsViewController downloads](self, "downloads");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(ipadViewController, "setDownloads:", v26);

  -[SKUIDownloadsViewController _reloadView](self, "_reloadView");
}

- (void)_reloadView
{
  void *ipadViewController;
  void *v4;
  id v5;

  if (-[SKUIDownloadsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIDownloadsViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    ipadViewController = self->_ipadViewController;
    if (!ipadViewController)
      ipadViewController = self->_iphoneViewController;
    objc_msgSend(ipadViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "addSubview:", v4);

  }
}

- (void)_reloadBadge
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SKUIDownloadsViewController__reloadBadge__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__SKUIDownloadsViewController__reloadBadge__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "downloads");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDownloads:", v2);

  objc_msgSend(*(id *)(a1 + 32), "downloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v5, "setNumberStyle:", 1);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "downloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SKUIDownloadsViewController__reloadBadge__block_invoke_2;
  v11[3] = &unk_1E739FD10;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v10 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __43__SKUIDownloadsViewController__reloadBadge__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tabBarItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBadgeValue:", *(_QWORD *)(a1 + 40));

}

- (void)_reloadManagerFromServer
{
  -[SSDownloadManager reloadFromServer](self->_downloadManager, "reloadFromServer");
}

- (void)_setArtwork:(id)a3 forURLString:(id)a4
{
  id v6;
  UIImage *nullImage;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  UIImage *v18;

  v18 = (UIImage *)a3;
  v6 = a4;
  -[NSMutableDictionary removeObjectForKey:](self->_imageOperations, "removeObjectForKey:", v6);
  nullImage = v18;
  if (!v18)
    nullImage = self->_nullImage;
  -[NSCache setObject:forKey:](self->_images, "setObject:forKey:", nullImage, v6);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDownloadsViewController downloads](self, "downloads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v12 = *MEMORY[0x1E0DAF9F0];
    do
    {
      -[SKUIDownloadsViewController downloads](self, "downloads");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForProperty:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isEqualToString:", v6))
        objc_msgSend(v8, "addIndex:", v11);

      ++v11;
      -[SKUIDownloadsViewController downloads](self, "downloads");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v11 < v17);
  }
  -[SKUIIPadDownloadsViewController reloadDownloadsAtIndexes:](self->_ipadViewController, "reloadDownloadsAtIndexes:", v8);
  -[SKUIIPhoneDownloadsViewController reloadDownloadsAtIndexes:](self->_iphoneViewController, "reloadDownloadsAtIndexes:", v8);

}

+ (int64_t)_sizeClassForSize:(CGSize)a3
{
  if (a3.width <= 600.0)
    return 1;
  else
    return 2;
}

- (NSArray)downloads
{
  return (NSArray *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setDownloads:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_nullImage, 0);
  objc_storeStrong((id *)&self->_ipadViewController, 0);
  objc_storeStrong((id *)&self->_iphoneViewController, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_imageOperations, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDownloadsViewController initWithNibName:bundle:]";
}

@end
