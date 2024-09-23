@implementation SKUIScreenshotsViewController

- (SKUIScreenshotsViewController)initWithTrailers:(id)a3 screenshots:(id)a4 clientContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIScreenshotsViewController *v11;
  SKUIScreenshotsViewController *v12;
  void **p_clientContext;
  NSMutableArray *v14;
  NSMutableArray *screenshotRawImages;
  NSMutableArray *v16;
  NSMutableArray *screenshotImages;
  NSMutableArray *v18;
  NSMutableArray *trailerImages;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t i;
  double v29;
  double v30;
  double v31;
  double v33;
  uint64_t v34;
  double v35;
  double width;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double height;
  uint64_t v42;
  SKUIScreenshotDataConsumer *dataConsumer;
  uint64_t v44;
  uint64_t v45;
  SKUIVideoImageDataConsumer *trailerConsumer;
  uint64_t v47;
  SKUIVideoImageDataConsumer *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScreenshotsViewController initWithTrailers:screenshots:clientContext:].cold.1();
  }
  v55.receiver = self;
  v55.super_class = (Class)SKUIScreenshotsViewController;
  v11 = -[SKUIScreenshotsViewController init](&v55, sel_init);
  v12 = v11;
  if (v11)
  {
    v50 = v10;
    p_clientContext = (void **)&v11->_clientContext;
    objc_storeStrong((id *)&v11->_clientContext, a5);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    screenshotRawImages = v12->_screenshotRawImages;
    v12->_screenshotRawImages = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    screenshotImages = v12->_screenshotImages;
    v12->_screenshotImages = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    trailerImages = v12->_trailerImages;
    v12->_trailerImages = v18;

    v20 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_screenshots, v20);
    if (!v9)

    v21 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_trailers, v21);
    if (!v8)

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v22 = v12->_screenshots;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v52;
      v26 = 1.0;
      v27 = 1.0;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v52 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "sizeForVariant:", CFSTR("low-dpi"));
          v31 = v30 / v29;
          if (v31 <= v27 || v31 <= 1.0)
            v33 = v27;
          else
            v33 = v31;
          if (v31 < 1.0 && v31 < v26)
            v26 = v31;
          else
            v27 = v33;
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 1.0;
      v27 = 1.0;
    }

    v34 = SKUIUserInterfaceIdiom(*p_clientContext);
    if (v34)
    {
      if (v27 == 1.0)
        v35 = v26;
      else
        v35 = v27;
      v12->_screenshotMaxSize = (CGSize)vdupq_n_s64(0x4072C00000000000uLL);
      width = 300.0;
      if (v35 < 1.0)
        v12->_screenshotMaxSize.height = v35 * 300.0;
    }
    else
    {
      if (1.0 / v26 <= v27)
        v37 = v27;
      else
        v37 = 1.0 / v26;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bounds");
      v40 = dbl_1BBED2090[v39 > 480.0];
      v12->_screenshotMaxSize.width = 196.0;
      v12->_screenshotMaxSize.height = v40;

      width = v12->_screenshotMaxSize.width;
      height = v12->_screenshotMaxSize.height;
      if (v37 < height / width)
        v12->_screenshotMaxSize.height = height * (v37 / (height / width));
    }
    +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:](SKUIScreenshotDataConsumer, "consumerWithScreenshotSize:", width, v12->_screenshotMaxSize.height);
    v42 = objc_claimAutoreleasedReturnValue();
    dataConsumer = v12->_dataConsumer;
    v12->_dataConsumer = (SKUIScreenshotDataConsumer *)v42;

    -[SKUIScreenshotDataConsumer setForcesPortrait:](v12->_dataConsumer, "setForcesPortrait:", v34 == 0);
    v10 = v50;
    if (-[NSArray count](v12->_trailers, "count"))
    {
      if (v34)
        v44 = 3;
      else
        v44 = 1;
      +[SSVURLDataConsumer consumer](SKUIVideoImageDataConsumer, "consumer");
      v45 = objc_claimAutoreleasedReturnValue();
      trailerConsumer = v12->_trailerConsumer;
      v12->_trailerConsumer = (SKUIVideoImageDataConsumer *)v45;

      -[SKUIVideoImageDataConsumer setAllowedOrientations:](v12->_trailerConsumer, "setAllowedOrientations:", v44);
      v47 = SKUIUserInterfaceIdiom(*p_clientContext);
      v48 = v12->_trailerConsumer;
      if (v47 == 1)
      {
        -[SKUIVideoImageDataConsumer setLandscapeSize:](v48, "setLandscapeSize:", 300.0, 225.0);
        -[SKUIVideoImageDataConsumer setPortraitSize:](v12->_trailerConsumer, "setPortraitSize:", 225.0, 300.0);
      }
      else
      {
        -[SKUIVideoImageDataConsumer setLandscapeSize:](v48, "setLandscapeSize:", 348.0, 196.0);
        -[SKUIVideoImageDataConsumer setPortraitSize:](v12->_trailerConsumer, "setPortraitSize:", 196.0, 348.0);
        v12->_screenshotMaxSize = (CGSize)xmmword_1BBED20A0;
      }
    }
  }

  return v12;
}

- (void)reloadData
{
  NSMutableArray *v3;
  NSMutableArray *screenshotRawImages;
  NSMutableArray *v5;
  NSMutableArray *screenshotImages;
  NSMutableArray *v7;
  NSMutableArray *trailerImages;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SKUIScreenshotDataConsumer *dataConsumer;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  SKUIVideoImageDataConsumer *trailerConsumer;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38[2];
  _QWORD v39[4];
  id v40[2];
  id location[2];

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  screenshotRawImages = self->_screenshotRawImages;
  self->_screenshotRawImages = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  screenshotImages = self->_screenshotImages;
  self->_screenshotImages = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  trailerImages = self->_trailerImages;
  self->_trailerImages = v7;

  if (-[NSArray count](self->_screenshots, "count"))
  {
    v9 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_screenshots, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLForVariant:", CFSTR("low-dpi"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v11);
        +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDataConsumer:", v13);

        objc_msgSend(v12, "setITunesStoreRequest:", 0);
        objc_initWeak(location, self);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke;
        v39[3] = &unk_1E73A1F30;
        objc_copyWeak(v40, location);
        v40[1] = v9;
        objc_msgSend(v12, "setOutputBlock:", v39);
        -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);
        objc_destroyWeak(v40);
        objc_destroyWeak(location);

      }
      objc_msgSend(v10, "sizeForVariant:", CFSTR("low-dpi"));
      v15 = v14;
      v17 = v16;
      dataConsumer = self->_dataConsumer;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIScreenshotDataConsumer imageForColor:size:](dataConsumer, "imageForColor:size:", v19, v15, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObject:](self->_screenshotImages, "addObject:", v20);
      v21 = self->_screenshotRawImages;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v21, "addObject:", v22);

      ++v9;
    }
    while ((unint64_t)v9 < -[NSArray count](self->_screenshots, "count"));
  }
  if (-[NSArray count](self->_trailers, "count"))
  {
    v23 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_trailers, "objectAtIndex:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "artworks");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bestArtworkForScaledSize:", self->_screenshotMaxSize.width, self->_screenshotMaxSize.height);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_alloc(MEMORY[0x1E0DAF698]);
        objc_msgSend(v26, "URL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithURL:", v29);

        objc_msgSend(v30, "setDataConsumer:", self->_trailerConsumer);
        objc_msgSend(v30, "setITunesStoreRequest:", 0);
        objc_initWeak(location, self);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke_3;
        v37[3] = &unk_1E73A1F30;
        objc_copyWeak(v38, location);
        v38[1] = v23;
        objc_msgSend(v30, "setOutputBlock:", v37);
        -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v30);
        objc_destroyWeak(v38);
        objc_destroyWeak(location);

      }
      if (v26
        && (-[SKUIVideoImageDataConsumer allowedOrientations](self->_trailerConsumer, "allowedOrientations") & 2) != 0)
      {
        objc_msgSend(v26, "size");
        if (v32 <= v33)
          v31 = 1;
        else
          v31 = 2;
      }
      else
      {
        v31 = 1;
      }
      trailerConsumer = self->_trailerConsumer;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIVideoImageDataConsumer imageForColor:orientation:](trailerConsumer, "imageForColor:orientation:", v35, v31);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObject:](self->_trailerImages, "addObject:", v36);
      ++v23;
    }
    while ((unint64_t)v23 < -[NSArray count](self->_trailers, "count"));
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 8.0, 0.0, 8.0);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke_2;
  block[3] = &unk_1E73A6420;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v7 = v3;
  v8[1] = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setImage:forIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke_4;
  block[3] = &unk_1E73A6420;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v7 = v3;
  v8[1] = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setTrailerImage:forIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)loadView
{
  SKUISwooshCollectionViewLayout *v3;
  id v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;
  void *v8;
  UICollectionView *v9;
  float v10;
  SKUIScreenshotsView *v11;

  v11 = -[SKUIScreenshotsView initWithFrame:]([SKUIScreenshotsView alloc], "initWithFrame:", 0.0, 0.0, 1.0, self->_screenshotMaxSize.height + 30.0);
  -[SKUIScreenshotsViewController setView:](self, "setView:", v11);
  v3 = objc_alloc_init(SKUISwooshCollectionViewLayout);
  -[SKUISwooshCollectionViewLayout setSnapsToItemBoundaries:](v3, "setSnapsToItemBoundaries:", 1);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 1);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[SKUIScreenshotsView bounds](v11, "bounds");
  v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  v7 = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 0);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("a"));
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
  -[UICollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);
  v9 = self->_collectionView;
  +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate](SKUISwooshCollectionViewLayout, "snapToBoundariesDecelerationRate");
  -[UICollectionView setDecelerationRate:](v9, "setDecelerationRate:", v10);
  -[SKUIScreenshotsView setPrimaryView:](v11, "setPrimaryView:", self->_collectionView);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  SKUISlideshowViewController *v7;
  SKUIPlayableAsset *v8;
  SKUIPlayableAsset *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  if (!objc_msgSend(v12, "section"))
  {
    -[NSArray objectAtIndex:](self->_trailers, "objectAtIndex:", objc_msgSend(v12, "item"));
    v7 = (SKUISlideshowViewController *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    v8 = -[SKUIPlayableAsset initWithVideo:]([SKUIPlayableAsset alloc], "initWithVideo:", v7);
    -[SKUIScreenshotsViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIVideoPreviewPlayPlayableAsset(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v12, "section") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v7 = objc_alloc_init(SKUISlideshowViewController);
      -[SKUISlideshowViewController setClientContext:](v7, "setClientContext:", self->_clientContext);
      -[SKUISlideshowViewController setDataSource:](v7, "setDataSource:", self);
      -[SKUISlideshowViewController setDelegate:](v7, "setDelegate:", self);
      -[SKUISlideshowViewController setCurrentIndex:](v7, "setCurrentIndex:", objc_msgSend(v12, "item"));
      v8 = (SKUIPlayableAsset *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
      -[SKUIPlayableAsset setTransitioningDelegate:](v8, "setTransitioningDelegate:", v7);
      v9 = v8;
    }
    else
    {
      v7 = objc_alloc_init(SKUIIPhoneSlideshowViewController);
      -[SKUISlideshowViewController setClientContext:](v7, "setClientContext:", self->_clientContext);
      -[SKUISlideshowViewController setDataSource:](v7, "setDataSource:", self);
      -[SKUISlideshowViewController setCurrentIndex:](v7, "setCurrentIndex:", objc_msgSend(v12, "item"));
      v9 = (SKUIPlayableAsset *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
      v8 = v9;
    }
    -[SKUIPlayableAsset setModalPresentationStyle:](v9, "setModalPresentationStyle:", 17);
    -[SKUIScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
    goto LABEL_9;
  }
LABEL_11:

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  int *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a5;
  if (objc_msgSend(v6, "section"))
  {
    if (objc_msgSend(v6, "section") != 1)
    {
      v10 = *MEMORY[0x1E0C9D820];
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___SKUIScreenshotsViewController__screenshotImages;
  }
  else
  {
    v7 = &OBJC_IVAR___SKUIScreenshotsViewController__trailerImages;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "objectAtIndex:", objc_msgSend(v6, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9 + 15.0;

LABEL_7:
  v11 = self->_screenshotMaxSize.height + 30.0;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int *v7;
  int64_t v8;

  v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___SKUIScreenshotsViewController__screenshotImages;
  }
  else
  {
    v7 = &OBJC_IVAR___SKUIScreenshotsViewController__trailerImages;
  }
  v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "count");
LABEL_7:

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    if (objc_msgSend(v5, "section") == 1)
    {
      -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_screenshotImages, "objectAtIndex:", objc_msgSend(v5, "row"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v7);

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_trailerImages, "objectAtIndex:", objc_msgSend(v5, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v8);

    objc_msgSend(v6, "setVideo:", 1);
  }

  return v6;
}

- (int64_t)numberOfItemsInSlideshowViewController:(id)a3
{
  return -[NSArray count](self->_screenshots, "count", a3);
}

- (id)slideshowViewController:(id)a3 placeholderImageAtIndex:(int64_t)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = -[NSMutableArray count](self->_screenshotRawImages, "count", a3);
  v7 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v6 > a4)
  {
    -[NSMutableArray objectAtIndex:](self->_screenshotRawImages, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v7 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_screenshotRawImages, "objectAtIndex:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (id)slideshowViewController:(id)a3 imageURLAtIndex:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_screenshots, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForVariant:", CFSTR("high-dpi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)slideshowViewController:(id)a3 dataConsumerAtIndex:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[NSArray objectAtIndex:](self->_screenshots, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeForVariant:", CFSTR("high-dpi"));
  +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:](SKUIScreenshotDataConsumer, "consumerWithScreenshotSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    objc_msgSend(v5, "setForcesPortrait:", 1);

  return v5;
}

- (void)slideshowViewController:(id)a3 scrollToImageAtIndex:(int64_t)a4
{
  void *v5;
  char v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v7);

  if ((v6 & 1) == 0)
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 8, 0);

}

- (id)slideshowViewController:(id)a3 poppedImageViewAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  SKUIIPhoneSlideshowCell *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(SKUIIPhoneSlideshowCell);
    objc_msgSend(v7, "frame");
    -[SKUIIPhoneSlideshowCell setFrame:](v8, "setFrame:");
    -[NSMutableArray objectAtIndex:](self->_screenshotImages, "objectAtIndex:", objc_msgSend(v5, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPhoneSlideshowCell setImage:](v8, "setImage:", v9);

    -[SKUIIPhoneSlideshowCell layoutSubviews](v8, "layoutSubviews");
    -[UICollectionView addSubview:](self->_collectionView, "addSubview:", v8);
    -[SKUIScreenshotsViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPhoneSlideshowCell imageFrame](v8, "imageFrame");
    objc_msgSend(v10, "convertRect:fromView:", v8);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[SKUIIPhoneSlideshowCell removeFromSuperview](v8, "removeFromSuperview");
    -[NSMutableArray objectAtIndex:](self->_screenshotImages, "objectAtIndex:", objc_msgSend(v5, "item"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v20)
      v21 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    else
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v23);

    objc_msgSend(v22, "setFrame:", v12, v14, v16, v18);
    objc_msgSend(v22, "setContentMode:", 1);
    -[SKUIScreenshotsViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v22);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  SKUIScreenshotsDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "screenshotsWillBeginDragging:", self);

    }
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)_setImage:(id)a3 forIndex:(int64_t)a4
{
  SKUIScreenshotDataConsumer *dataConsumer;
  id v7;
  UICollectionView *collectionView;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    dataConsumer = self->_dataConsumer;
    v7 = a3;
    -[SKUIScreenshotDataConsumer imageForImage:](dataConsumer, "imageForImage:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_screenshotRawImages, "replaceObjectAtIndex:withObject:", a4, v7);

    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_screenshotImages, "replaceObjectAtIndex:withObject:", a4, v11);
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setImage:", v11);
  }
}

- (void)_setTrailerImage:(id)a3 forIndex:(int64_t)a4
{
  NSMutableArray *trailerImages;
  id v7;
  UICollectionView *collectionView;
  void *v9;
  id v10;

  if (a3)
  {
    trailerImages = self->_trailerImages;
    v7 = a3;
    -[NSMutableArray replaceObjectAtIndex:withObject:](trailerImages, "replaceObjectAtIndex:withObject:", a4, v7);
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setImage:", v7);
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIScreenshotsDelegate)delegate
{
  return (SKUIScreenshotsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailerImages, 0);
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_trailerConsumer, 0);
  objc_storeStrong((id *)&self->_screenshotRawImages, 0);
  objc_storeStrong((id *)&self->_screenshotImages, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithTrailers:screenshots:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScreenshotsViewController initWithTrailers:screenshots:clientContext:]";
}

@end
