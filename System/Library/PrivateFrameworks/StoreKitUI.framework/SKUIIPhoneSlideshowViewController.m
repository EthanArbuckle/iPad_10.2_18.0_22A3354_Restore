@implementation SKUIIPhoneSlideshowViewController

- (SKUIIPhoneSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIIPhoneSlideshowViewController *v8;
  NSMutableArray *v9;
  NSMutableArray *images;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v13;
  NSOperationQueue *placeholderQueue;
  uint64_t v15;
  NSMutableDictionary *placeholderImages;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneSlideshowViewController initWithNibName:bundle:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIIPhoneSlideshowViewController;
  v8 = -[SKUIIPhoneSlideshowViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    images = v8->_images;
    v8->_images = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    placeholderQueue = v8->_placeholderQueue;
    v8->_placeholderQueue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_placeholderQueue, "setMaxConcurrentOperationCount:", 2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    placeholderImages = v8->_placeholderImages;
    v8->_placeholderImages = (NSMutableDictionary *)v15;

    v8->_indexToScrollToOnLoadView = 0x7FFFFFFFFFFFFFFFLL;
    -[SKUIIPhoneSlideshowViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
    -[SKUIIPhoneSlideshowViewController setEdgesForExtendedLayout:](v8, "setEdgesForExtendedLayout:", 0);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSOperationQueue operations](self->_operationQueue, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setOutputBlock:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_placeholderQueue, "cancelAllOperations");
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPhoneSlideshowViewController;
  -[SKUIIPhoneSlideshowViewController dealloc](&v8, sel_dealloc);
}

- (void)loadView
{
  SKUIScrollForwardingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  SKUIItemGridCollectionViewLayout *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  SKUIGiftThemeCollectionView *v18;
  SKUIGiftThemeCollectionView *collectionView;
  SKUIGiftThemeCollectionView *v20;
  void *v21;
  SKUIGiftThemeCollectionView *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  UIPageControl *v28;
  UIPageControl *pageControl;
  UIPageControl *v30;
  void *v31;
  UIPageControl *v32;
  void *v33;
  UIPageControl *v34;
  void *v35;
  id v36;
  SKUIClientContext *clientContext;
  void *v38;
  void *v39;
  SKUIClientContext *v40;
  void *v41;
  SKUIScrollForwardingView *v42;

  v3 = [SKUIScrollForwardingView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v42 = -[SKUIScrollForwardingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollForwardingView setBackgroundColor:](v42, "setBackgroundColor:", v8);

  -[SKUIIPhoneSlideshowViewController setView:](self, "setView:", v42);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 10060);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  -[SKUIScrollForwardingView bounds](v42, "bounds");
  objc_msgSend(v9, "setFrame:");
  -[SKUIScrollForwardingView addSubview:](v42, "addSubview:", v9);
  v10 = objc_alloc_init(SKUIItemGridCollectionViewLayout);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemGridCollectionViewLayout setOddRowBackgroundColor:](v10, "setOddRowBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemGridCollectionViewLayout setEvenRowBackgroundColor:](v10, "setEvenRowBackgroundColor:", v12);

  -[UICollectionViewFlowLayout setScrollDirection:](v10, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v10, "setMinimumLineSpacing:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14 + -54.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  -[UICollectionViewFlowLayout setItemSize:](v10, "setItemSize:", v15, v17 + -64.0);

  v18 = -[SKUIGiftThemeCollectionView initWithFrame:collectionViewLayout:]([SKUIGiftThemeCollectionView alloc], "initWithFrame:collectionViewLayout:", v10, v4, v5, v6, v7);
  collectionView = self->_collectionView;
  self->_collectionView = v18;

  v20 = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftThemeCollectionView setBackgroundColor:](v20, "setBackgroundColor:", v21);

  -[SKUIGiftThemeCollectionView setVisibleBoundsInsets:](self->_collectionView, "setVisibleBoundsInsets:", 0.0, -27.0, 0.0, -27.0);
  -[SKUIGiftThemeCollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[SKUIGiftThemeCollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[SKUIGiftThemeCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("a"));
  -[SKUIGiftThemeCollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
  -[SKUIGiftThemeCollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[SKUIGiftThemeCollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[SKUIGiftThemeCollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
  -[SKUIGiftThemeCollectionView setPagingEnabled:](self->_collectionView, "setPagingEnabled:", 1);
  v22 = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24 + -54.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  -[SKUIGiftThemeCollectionView setFrame:](v22, "setFrame:", 27.0, 0.0, v25, v27 + -64.0);

  -[SKUIScrollForwardingView addSubview:](v42, "addSubview:", self->_collectionView);
  -[SKUIScrollForwardingView setScrollView:](v42, "setScrollView:", self->_collectionView);
  v28 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
  pageControl = self->_pageControl;
  self->_pageControl = v28;

  v30 = self->_pageControl;
  -[UIPageControl tintColor](v30, "tintColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setCurrentPageIndicatorTintColor:](v30, "setCurrentPageIndicatorTintColor:", v31);

  v32 = self->_pageControl;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setPageIndicatorTintColor:](v32, "setPageIndicatorTintColor:", v33);

  v34 = self->_pageControl;
  -[SKUIScrollForwardingView bounds](v42, "bounds");
  -[UIPageControl setFrame:](v34, "setFrame:", 0.0, -25.0);
  -[UIPageControl setAutoresizingMask:](self->_pageControl, "setAutoresizingMask:", 10);
  -[UIPageControl setUserInteractionEnabled:](self->_pageControl, "setUserInteractionEnabled:", 0);
  -[SKUIScrollForwardingView addSubview:](v42, "addSubview:", self->_pageControl);
  -[SKUIIPhoneSlideshowViewController _reloadPageControl](self, "_reloadPageControl");
  -[SKUIIPhoneSlideshowViewController navigationItem](self, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidesBackButton:", 1);
  v36 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v36, "setAction:", sel__doneAction_);
  objc_msgSend(v36, "setTarget:", self);
  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SCREENSHOTS_BUTTON_DONE"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SCREENSHOTS_BUTTON_DONE"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitle:", v38);

  objc_msgSend(v36, "setStyle:", 2);
  objc_msgSend(v35, "setRightBarButtonItem:", v36);
  -[SKUIIPhoneSlideshowViewController title](self, "title");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    v40 = self->_clientContext;
    if (v40)
      -[SKUIClientContext localizedStringForKey:](v40, "localizedStringForKey:", CFSTR("SCREENSHOTS_TITLE"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SCREENSHOTS_TITLE"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPhoneSlideshowViewController setTitle:](self, "setTitle:", v41);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
    return 30;
  if (SKUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIIPhoneSlideshowViewController;
  -[SKUIIPhoneSlideshowViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SKUIIPhoneSlideshowViewController _reloadSize](self, "_reloadSize");
}

- (int64_t)currentIndex
{
  SKUIGiftThemeCollectionView *collectionView;
  int64_t indexToScrollToOnLoadView;

  collectionView = self->_collectionView;
  if (collectionView)
    return SKUIPageForCollectionView(collectionView);
  indexToScrollToOnLoadView = self->_indexToScrollToOnLoadView;
  if (indexToScrollToOnLoadView == 0x7FFFFFFFFFFFFFFFLL)
    return SKUIPageForCollectionView(collectionView);
  else
    return indexToScrollToOnLoadView;
}

- (void)reloadData
{
  void *v2;
  SKUISlideshowViewControllerDataSource **p_dataSource;
  id WeakRetained;
  uint64_t v6;
  char *v7;
  char *i;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSMutableArray *images;
  void *v32;
  _QWORD v33[4];
  id v34[2];
  id location;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_msgSend(WeakRetained, "numberOfItemsInSlideshowViewController:", self);

  -[NSMutableArray removeAllObjects](self->_images, "removeAllObjects");
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_placeholderQueue, "cancelAllOperations");
  if (v6 >= 1)
  {
    v7 = (char *)v6;
    for (i = 0; v7 != i; ++i)
    {
      v9 = objc_loadWeakRetained((id *)p_dataSource);
      objc_msgSend(v9, "slideshowViewController:imageURLAtIndex:", self, i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_loadWeakRetained((id *)p_dataSource);
      objc_msgSend(v11, "slideshowViewController:dataConsumerAtIndex:", self, i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imageSize");
      v14 = v13;
      v16 = v15;
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      v19 = v18 & 0xFFFFFFFFFFFFFFFBLL;
      v20 = 250.0;
      if (v19 != 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "bounds");
        v20 = v21 + -70.0;
      }
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;

      if (v19 != 1)
      v25 = v24 + -125.0;
      if (v14 > v20 || v16 > v25)
      {
        if (objc_msgSend(v12, "forcesPortrait") && v14 > v16)
        {
          v26 = fmin(v20 / v16, v25 / v14);
          v27 = floor(v16 * v26);
          v28 = v14 * v26;
        }
        else
        {
          v29 = fmin(v20 / v14, v25 / v16);
          v27 = floor(v14 * v29);
          v28 = v16 * v29;
        }
        objc_msgSend(v12, "setImageSize:", v27, floor(v28));
        if (!v10)
          goto LABEL_17;
      }
      else if (!v10)
      {
        goto LABEL_17;
      }
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v10);
      objc_msgSend(v30, "setDataConsumer:", v12);
      objc_msgSend(v30, "setITunesStoreRequest:", 0);
      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __47__SKUIIPhoneSlideshowViewController_reloadData__block_invoke;
      v33[3] = &unk_1E73A1F30;
      objc_copyWeak(v34, &location);
      v34[1] = i;
      objc_msgSend(v30, "setOutputBlock:", v33);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v30);
      objc_destroyWeak(v34);
      objc_destroyWeak(&location);

LABEL_17:
      images = self->_images;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](images, "addObject:", v32);

    }
  }
  -[SKUIGiftThemeCollectionView reloadData](self->_collectionView, "reloadData");
  -[SKUIIPhoneSlideshowViewController _reloadPageControl](self, "_reloadPageControl");
}

void __47__SKUIIPhoneSlideshowViewController_reloadData__block_invoke(uint64_t a1, void *a2)
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
  block[2] = __47__SKUIIPhoneSlideshowViewController_reloadData__block_invoke_2;
  block[3] = &unk_1E73A6420;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v7 = v3;
  v8[1] = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __47__SKUIIPhoneSlideshowViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setImage:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)setCurrentIndex:(int64_t)a3
{
  SKUIGiftThemeCollectionView *collectionView;
  double v6;
  double v7;
  id v8;

  collectionView = self->_collectionView;
  if (collectionView)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v7 = (v6 + -54.0) * (double)a3;
    -[SKUIGiftThemeCollectionView contentOffset](self->_collectionView, "contentOffset");
    -[SKUIGiftThemeCollectionView setContentOffset:](collectionView, "setContentOffset:", v7);

  }
  else
  {
    self->_indexToScrollToOnLoadView = a3;
  }
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SKUIIPhoneSlideshowViewController reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_images, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  SKUIGiftThemeCollectionView *collectionView;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  collectionView = self->_collectionView;
  v6 = a4;
  -[SKUIGiftThemeCollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v8 = objc_msgSend(v6, "row");

  -[SKUIIPhoneSlideshowViewController _imageAtIndex:](self, "_imageAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v9);

  return v7;
}

- (void)_doneAction:(id)a3
{
  id v4;

  -[SKUIIPhoneSlideshowViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "slideshowViewControllerDidFinish:", self);
  else
    -[SKUIIPhoneSlideshowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_imageAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[NSMutableArray objectAtIndex:](self->_images, "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[SKUIIPhoneSlideshowViewController _placeholderImageAtIndex:](self, "_placeholderImageAtIndex:", a3);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (id)_placeholderImageAtIndex:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *placeholderImages;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  SKUIIPhoneSlideshowViewController *v24;
  id v25[2];
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "slideshowViewController:dataConsumerAtIndex:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v7, "slideshowViewController:placeholderImageAtIndex:", self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB34C8];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __62__SKUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke;
    v21 = &unk_1E73A7A10;
    v22 = v6;
    v23 = v8;
    v24 = self;
    v25[1] = (id)a3;
    objc_copyWeak(v25, &location);
    objc_msgSend(v9, "blockOperationWithBlock:", &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperation:](self->_placeholderQueue, "addOperation:", v10, v18, v19, v20, v21);

    objc_destroyWeak(v25);
  }
  placeholderImages = self->_placeholderImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](placeholderImages, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageForColor:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_placeholderImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v13, v16);

  }
  objc_destroyWeak(&location);
  return v13;
}

void __62__SKUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8[2];

  objc_msgSend(*(id *)(a1 + 32), "imageForImage:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SKUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke_2;
  v5[3] = &unk_1E73A79E8;
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8[1] = *(id *)(a1 + 64);
  v4 = v2;
  objc_copyWeak(v8, (id *)(a1 + 56));
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(v8);

}

void __62__SKUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "objectAtIndex:", *(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "_setImage:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

    }
  }
}

- (void)_setImage:(id)a3 atIndex:(int64_t)a4
{
  NSMutableArray *images;
  id v7;
  SKUIGiftThemeCollectionView *collectionView;
  void *v9;
  id v10;

  if (a3)
  {
    images = self->_images;
    v7 = a3;
    -[NSMutableArray replaceObjectAtIndex:withObject:](images, "replaceObjectAtIndex:withObject:", a4, v7);
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setImage:", v7);
  }
}

- (void)_reloadPageControl
{
  -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", -[NSMutableArray count](self->_images, "count"));
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", SKUIPageForCollectionView(self->_collectionView));
}

- (void)_reloadSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int64_t indexToScrollToOnLoadView;
  SKUIGiftThemeCollectionView *collectionView;
  void *v12;
  double v13;
  double v14;

  -[SKUIIPhoneSlideshowViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 + -54.0;

  -[SKUIIPhoneSlideshowViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7 + -64.0;

  -[SKUIGiftThemeCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemSize:", v5, v8);

  -[SKUIGiftThemeCollectionView setFrame:](self->_collectionView, "setFrame:", 27.0, 32.0, v5, v8);
  indexToScrollToOnLoadView = self->_indexToScrollToOnLoadView;
  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13 + -54.0;
  if (indexToScrollToOnLoadView == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SKUIGiftThemeCollectionView setContentOffset:](collectionView, "setContentOffset:", v14 * (double)(uint64_t)SKUIPageForCollectionView(self->_collectionView), 0.0);

  }
  else
  {
    -[SKUIGiftThemeCollectionView setContentOffset:](collectionView, "setContentOffset:", v14 * (double)self->_indexToScrollToOnLoadView, 0.0);

    self->_indexToScrollToOnLoadView = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[SKUIGiftThemeCollectionView reloadData](self->_collectionView, "reloadData");
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUISlideshowViewControllerDataSource)dataSource
{
  return (SKUISlideshowViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SKUISlideshowViewControllerDelegate)delegate
{
  return (SKUISlideshowViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImages, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_placeholderQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIPhoneSlideshowViewController initWithNibName:bundle:]";
}

@end
