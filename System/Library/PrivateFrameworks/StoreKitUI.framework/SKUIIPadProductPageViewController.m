@implementation SKUIIPadProductPageViewController

- (id)_initSKUIIPadProductPageViewController
{
  SKUIIPadProductPageViewController *v3;
  NSOperationQueue *v4;
  NSOperationQueue *operationQueue;
  void *v6;
  objc_super v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPadProductPageViewController;
  v3 = -[SKUIIPadProductPageViewController init](&v8, sel_init);
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    v3->_defaultSelectedSectionIndex = 0;
    v3->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__metricsEnterEventNotification_, CFSTR("SKUIMetricsDidRecordEnterEventNotification"), 0);

  }
  return v3;
}

- (SKUIIPadProductPageViewController)initWithItem:(id)a3
{
  id v5;
  id *v6;
  SKUIIPadProductPageViewController *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSURLRequest *urlRequest;

  v5 = a3;
  v6 = -[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController](self, "_initSKUIIPadProductPageViewController");
  v7 = (SKUIIPadProductPageViewController *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 130, a3);
    v7->_lookupItemIdentifier = objc_msgSend(v5, "itemIdentifier");
    objc_msgSend(v5, "productPageURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0C92C80]);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithURL:", v10);
      urlRequest = v7->_urlRequest;
      v7->_urlRequest = (NSURLRequest *)v11;

    }
  }

  return v7;
}

- (SKUIIPadProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  SKUIIPadProductPageViewController *result;

  result = -[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController](self, "_initSKUIIPadProductPageViewController");
  if (result)
    result->_lookupItemIdentifier = a3;
  return result;
}

- (SKUIIPadProductPageViewController)initWithProductPage:(id)a3
{
  id v5;
  void *v6;
  SKUIIPadProductPageViewController *v7;

  v5 = a3;
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKUIIPadProductPageViewController initWithItem:](self, "initWithItem:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    -[SKUIIPadProductPageViewController _setDefaultSectionIndexWithFragment:](v7, "_setDefaultSectionIndexWithFragment:", -[SKUIProductPage defaultPageFragment](v7->_productPage, "defaultPageFragment"));
  }

  return v7;
}

- (SKUIIPadProductPageViewController)initWithURL:(id)a3
{
  void *v4;
  SKUIIPadProductPageViewController *v5;

  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKUIIPadProductPageViewController initWithURLRequest:](self, "initWithURLRequest:", v4);

  return v5;
}

- (SKUIIPadProductPageViewController)initWithURLRequest:(id)a3
{
  id v4;
  SKUIIPadProductPageViewController *v5;
  uint64_t v6;
  NSURLRequest *urlRequest;
  void *v8;

  v4 = a3;
  v5 = -[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController](self, "_initSKUIIPadProductPageViewController");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;

    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPadProductPageViewController _setDefaultSectionIndexWithFragment:](v5, "_setDefaultSectionIndexWithFragment:", SKUIProductPageFragmentWithURL(v8));

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SKUIMetricsDidRecordEnterEventNotification"), 0);
  -[SKUIProductPageHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", 0);
  -[SKUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", 0);
  -[SKUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", 0);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)SKUIIPadProductPageViewController;
  -[SKUIIPadProductPageViewController dealloc](&v4, sel_dealloc);
}

- (void)configureMetricsWithPageEvent:(id)a3
{
  id v4;
  SKUIMetricsController *metricsController;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  metricsController = self->_metricsController;
  if (metricsController)
  {
    -[SKUIMetricsController recordEvent:](metricsController, "recordEvent:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[SKUIIPadProductPageViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SKUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_1E73A67C8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "getDefaultMetricsControllerWithCompletionBlock:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __67__SKUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_setMetricsController:", v6);

  objc_msgSend(*(id *)(a1 + 32), "pageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPageURL:", v5);

  objc_msgSend(v6, "recordEvent:", *(_QWORD *)(a1 + 32));
}

- (void)reloadData
{
  SKUIClientContext *clientContext;
  SKUILoadProductPageOperation *v4;
  SKUILoadProductPageOperation *loadOperation;
  SKUILoadProductPageOperation *v6;
  SSMetricsPageEvent *lastPageEvent;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  if (!self->_metricsController)
  {
    clientContext = self->_clientContext;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__SKUIIPadProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_1E73A32A0;
    objc_copyWeak(&v11, &location);
    -[SKUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", v10);
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      v4 = -[SKUILoadProductPageOperation initWithProductPageURLRequest:clientContext:]([SKUILoadProductPageOperation alloc], "initWithProductPageURLRequest:clientContext:", self->_urlRequest, self->_clientContext);
    }
    else
    {
      if (!self->_lookupItemIdentifier)
        goto LABEL_10;
      v4 = -[SKUILoadProductPageOperation initWithItemIdentifier:clientContext:]([SKUILoadProductPageOperation alloc], "initWithItemIdentifier:clientContext:", self->_lookupItemIdentifier, self->_clientContext);
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __47__SKUIIPadProductPageViewController_reloadData__block_invoke_2;
      v8[3] = &unk_1E73A67F0;
      objc_copyWeak(&v9, &location);
      -[SKUILoadProductPageOperation setOutputBlock:](v6, "setOutputBlock:", v8);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_loadOperation);
      lastPageEvent = self->_lastPageEvent;
      self->_lastPageEvent = 0;

      objc_destroyWeak(&v9);
    }
  }
  objc_destroyWeak(&location);
}

void __47__SKUIIPadProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setMetricsController:", v3);

}

void __47__SKUIIPadProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKUIIPadProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __47__SKUIIPadProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setProductPage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    -[SKUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:");
    -[SKUIProductPageReviewsViewController setAskPermission:](self->_reviewsViewController, "setAskPermission:", self->_askPermission);
    -[SKUISwooshArrayViewController setAskPermission:](self->_relatedViewController, "setAskPermission:", self->_askPermission);
    -[SKUIProductPageHeaderViewController setAskPermission:](self->_headerViewController, "setAskPermission:", self->_askPermission);
  }
}

- (NSURL)URL
{
  return -[NSURLRequest URL](self->_urlRequest, "URL");
}

- (void)setBannerText:(id)a3
{
  NSString **p_bannerText;
  NSString *v6;

  p_bannerText = &self->_bannerText;
  v6 = (NSString *)a3;
  if (*p_bannerText != v6)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    if (*p_bannerText)
      -[SKUIIPadProductPageViewController _showBanner](self, "_showBanner");
  }

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  SKUIMetricsController *metricsController;
  void *v6;
  objc_super v7;

  metricsController = self->_metricsController;
  SKUIMetricsWindowOrientationForInterfaceOrientation(-[SKUIIPadProductPageViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMetricsController setWindowOrientation:](metricsController, "setWindowOrientation:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SKUIIPadProductPageViewController;
  -[SKUIIPadProductPageViewController didRotateFromInterfaceOrientation:](&v7, sel_didRotateFromInterfaceOrientation_, a3);
}

- (void)loadView
{
  UIView *overlayView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  overlayView = self->_overlayView;
  if (!overlayView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 630.0, 630.0);
    v5 = self->_overlayView;
    self->_overlayView = v4;

    v6 = self->_overlayView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    overlayView = self->_overlayView;
  }
  -[SKUIIPadProductPageViewController setView:](self, "setView:", overlayView);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  if (self->_productPage && self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SKUIIPadProductPageViewController _selectSectionIndex:](self, "_selectSectionIndex:", self->_defaultSelectedSectionIndex);
    -[SKUIIPadProductPageViewController _reviewsViewController](self, "_reviewsViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIIPadProductPageViewController;
  -[SKUIIPadProductPageViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  SKUIItem *item;
  SSMetricsPageEvent *lastPageEvent;
  void *v7;
  objc_super v8;
  _QWORD block[5];

  v3 = a3;
  item = self->_item;
  if (item && !SKUIItemKindIsSoftwareKind(-[SKUIItem itemKind](item, "itemKind")))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SKUIIPadProductPageViewController_viewWillAppear___block_invoke;
    block[3] = &unk_1E739FD38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v7);

      -[SKUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
  -[SKUIIPadProductPageViewController reloadData](self, "reloadData");
  -[SKUIIPadProductPageViewController _reloadHeaderViewController](self, "_reloadHeaderViewController");
  -[SKUIProductPageHeaderViewController reloadData](self->_headerViewController, "reloadData");
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPadProductPageViewController;
  -[SKUIIPadProductPageViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
}

uint64_t __52__SKUIIPadProductPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCannotOpen");
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4;
  SKUINetworkErrorViewController *networkErrorViewController;
  void *v6;
  SKUINetworkErrorViewController *v7;
  int IsVisible;
  id v9;

  v4 = a3;
  networkErrorViewController = self->_networkErrorViewController;
  if (networkErrorViewController)
  {
    v9 = v4;
    -[SKUINetworkErrorViewController view](networkErrorViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SKUINetworkErrorViewController removeFromParentViewController](self->_networkErrorViewController, "removeFromParentViewController");
    -[SKUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", 0);
    v7 = self->_networkErrorViewController;
    self->_networkErrorViewController = 0;

    IsVisible = SKUIViewControllerIsVisible(self);
    v4 = v9;
    if (IsVisible)
    {
      self->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      -[SKUIIPadProductPageViewController reloadData](self, "reloadData");
      v4 = v9;
    }
  }

}

- (id)metricsControllerForProductPageHeader:(id)a3
{
  return self->_metricsController;
}

- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4
{
  -[SKUIIPadProductPageViewController _selectSectionIndex:](self, "_selectSectionIndex:", a4);
}

- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SKUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_1E73A6818;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[SKUIIPadProductPageViewController productPageChildOpenURL:viewControllerBlock:](self, "productPageChildOpenURL:viewControllerBlock:", v6, v7);

}

SKUIStorePageViewController *__72__SKUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  SKUIStorePageViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(SKUIStorePageViewController);
  objc_msgSend(*(id *)(a1 + 32), "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageViewController setClientContext:](v2, "setClientContext:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageViewController setTitle:](v2, "setTitle:", v5);

  -[SKUIStorePageViewController loadURL:withCompletionBlock:](v2, "loadURL:withCompletionBlock:", *(_QWORD *)(a1 + 40), 0);
  return v2;
}

- (void)productPageChildOpenItem:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "iPadProductPage:openItem:", self, v7);

  }
}

- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "iPadProductPage:openURL:viewControllerBlock:", self, v10, v6);

  }
}

- (CGPoint)topContentOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  int64_t v8;
  id v9;

  if (!self->_bannerText)
  {
    v4 = SKUIAskPermissionFramework();
    v5 = SKUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v4);
    v6 = (void *)SKUIAskPermissionFramework();
    v7 = *(id *)SKUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6);
    objc_msgSend(v5, "_requestQueueForIdentifier:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUIItem itemIdentifier](self->_item, "itemIdentifier");

    objc_msgSend(v9, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v8, 0);
  }
}

- (void)_metricsEnterEventNotification:(id)a3
{
  SSMetricsPageEvent *lastPageEvent;
  void *v5;

  if (SKUIViewControllerIsVisible(self))
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v5);

      -[SKUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
}

- (id)_detailsViewController
{
  SKUIProductPageDetailsViewController *detailsViewController;
  SKUIProductPageDetailsViewController *v4;
  SKUIProductPageDetailsViewController *v5;
  SKUIProductPageDetailsViewController *v6;
  void *v7;

  detailsViewController = self->_detailsViewController;
  if (!detailsViewController)
  {
    v4 = -[SKUIProductPageDetailsViewController initWithProductPage:]([SKUIProductPageDetailsViewController alloc], "initWithProductPage:", self->_productPage);
    v5 = self->_detailsViewController;
    self->_detailsViewController = v4;

    v6 = self->_detailsViewController;
    -[SKUIIPadProductPageViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageDetailsViewController setClientContext:](v6, "setClientContext:", v7);

    -[SKUIProductPageDetailsViewController setDelegate:](self->_detailsViewController, "setDelegate:", self);
    -[SKUIProductPageDetailsViewController setOperationQueue:](self->_detailsViewController, "setOperationQueue:", self->_operationQueue);
    -[SKUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:", self->_askPermission);
    detailsViewController = self->_detailsViewController;
  }
  return detailsViewController;
}

- (BOOL)_isIncompatibleItem
{
  SKUIItem *v3;
  SKUIItem *item;
  SKUIItem *v5;
  uint64_t v6;

  -[SKUIProductPage item](self->_productPage, "item");
  v3 = (SKUIItem *)objc_claimAutoreleasedReturnValue();
  item = v3;
  if (!v3)
    item = self->_item;
  v5 = item;

  v6 = -[SKUIItem itemKind](v5, "itemKind");
  return v6 == 5;
}

- (id)_placeholderViewController
{
  SKUIProductPagePlaceholderViewController *placeholderViewController;
  SKUIProductPagePlaceholderViewController *v4;
  SKUIProductPagePlaceholderViewController *v5;
  SKUIProductPagePlaceholderViewController *v6;
  void *v7;
  void *v8;

  placeholderViewController = self->_placeholderViewController;
  if (!placeholderViewController)
  {
    v4 = objc_alloc_init(SKUIProductPagePlaceholderViewController);
    v5 = self->_placeholderViewController;
    self->_placeholderViewController = v4;

    v6 = self->_placeholderViewController;
    -[SKUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPagePlaceholderViewController setColorScheme:](v6, "setColorScheme:", v8);

    -[SKUIProductPagePlaceholderViewController setClientContext:](self->_placeholderViewController, "setClientContext:", self->_clientContext);
    placeholderViewController = self->_placeholderViewController;
  }
  return placeholderViewController;
}

- (id)_relatedViewController
{
  SKUISwooshArrayViewController *relatedViewController;
  SKUISwooshArrayViewController *v4;
  void *v5;
  SKUISwooshArrayViewController *v6;
  SKUISwooshArrayViewController *v7;
  SKUISwooshArrayViewController *v8;
  void *v9;
  void *v10;

  relatedViewController = self->_relatedViewController;
  if (!relatedViewController)
  {
    v4 = [SKUISwooshArrayViewController alloc];
    -[SKUIProductPage relatedContentSwooshes](self->_productPage, "relatedContentSwooshes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUISwooshArrayViewController initWithSwooshComponents:](v4, "initWithSwooshComponents:", v5);
    v7 = self->_relatedViewController;
    self->_relatedViewController = v6;

    -[SKUISwooshArrayViewController setClientContext:](self->_relatedViewController, "setClientContext:", self->_clientContext);
    v8 = self->_relatedViewController;
    -[SKUIProductPage uber](self->_productPage, "uber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshArrayViewController setColorScheme:](v8, "setColorScheme:", v10);

    -[SKUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", self);
    -[SKUISwooshArrayViewController setOperationQueue:](self->_relatedViewController, "setOperationQueue:", self->_operationQueue);
    -[SKUISwooshArrayViewController setMetricsController:](self->_relatedViewController, "setMetricsController:", self->_metricsController);
    -[SKUISwooshArrayViewController setAskPermission:](self->_relatedViewController, "setAskPermission:", self->_askPermission);
    relatedViewController = self->_relatedViewController;
  }
  return relatedViewController;
}

- (void)_reloadHeaderViewController
{
  SKUIProductPageHeaderViewController *headerViewController;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SKUIProductPageHeaderViewController *v15;
  SKUIProductPageHeaderViewController *v16;
  SKUIProductPageHeaderViewController *v17;
  void *v18;
  id v19;
  CGRect v20;

  headerViewController = self->_headerViewController;
  if (headerViewController)
    goto LABEL_2;
  if (self->_item)
  {
    v15 = -[SKUIProductPageHeaderViewController initWithItem:]([SKUIProductPageHeaderViewController alloc], "initWithItem:", self->_item);
    v16 = self->_headerViewController;
    self->_headerViewController = v15;

    v17 = self->_headerViewController;
    -[SKUIIPadProductPageViewController clientContext](self, "clientContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageHeaderViewController setClientContext:](v17, "setClientContext:", v18);

    -[SKUIProductPageHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", self);
    -[SKUIProductPageHeaderViewController setOperationQueue:](self->_headerViewController, "setOperationQueue:", self->_operationQueue);
    -[SKUIProductPageHeaderViewController setProductPage:](self->_headerViewController, "setProductPage:", self->_productPage);
    -[SKUIProductPageHeaderViewController setSelectedSectionIndex:](self->_headerViewController, "setSelectedSectionIndex:", self->_defaultSelectedSectionIndex);
    -[SKUIProductPageHeaderViewController setAskPermission:](self->_headerViewController, "setAskPermission:", self->_askPermission);
    -[SKUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", self->_headerViewController);
    headerViewController = self->_headerViewController;
    if (headerViewController)
    {
LABEL_2:
      -[SKUIProductPageHeaderViewController view](headerViewController, "view");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v5 = v4;
      v7 = v6;
      -[SKUIMessageBanner frame](self->_banner, "frame");
      v9 = v8;
      objc_msgSend(v19, "setFrame:", v5, v8, 630.0, v7);
      -[UIView addSubview:](self->_overlayView, "addSubview:", v19);
      -[SKUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeToFit");
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v20.origin.x = v5;
      v20.origin.y = v9;
      v20.size.width = 630.0;
      v20.size.height = v7;
      objc_msgSend(v10, "setFrame:", v12, CGRectGetMaxY(v20), 630.0, v14);
      -[UIView addSubview:](self->_overlayView, "addSubview:", v10);

    }
  }
}

- (id)_reviewsViewController
{
  SKUIProductPageReviewsViewController *reviewsViewController;
  SKUIProductPageReviewsViewController *v4;
  SKUIProductPageReviewsViewController *v5;

  reviewsViewController = self->_reviewsViewController;
  if (!reviewsViewController)
  {
    v4 = -[SKUIProductPageReviewsViewController initWithProductPage:]([SKUIProductPageReviewsViewController alloc], "initWithProductPage:", self->_productPage);
    v5 = self->_reviewsViewController;
    self->_reviewsViewController = v4;

    -[SKUIProductPageReviewsViewController setClientContext:](self->_reviewsViewController, "setClientContext:", self->_clientContext);
    -[SKUIProductPageReviewsViewController setAskPermission:](self->_reviewsViewController, "setAskPermission:", self->_askPermission);
    reviewsViewController = self->_reviewsViewController;
  }
  return reviewsViewController;
}

- (void)_selectSectionIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_selectedSectionIndex != a3)
  {
    -[SKUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isViewLoaded"))
    {
      objc_msgSend(v7, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

    }
    objc_msgSend(v7, "removeFromParentViewController");
    self->_selectedSectionIndex = a3;
    -[SKUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SKUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", v6);
      -[SKUIIPadProductPageViewController _showViewController:](self, "_showViewController:", v6);
    }

  }
}

- (void)_sendCannotOpen
{
  SKUIIPadProductPageDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  if (!self->_didSendCannotOpen)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      self->_didSendCannotOpen = 1;
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "iPadProductPageCannotOpen:", self);

    }
  }
}

- (void)_setDefaultSectionIndexWithFragment:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self->_defaultSelectedSectionIndex = a3;
}

- (void)_setMetricsController:(id)a3
{
  id v5;
  id *p_metricsController;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v5 = a3;
  p_metricsController = (id *)&self->_metricsController;
  if (!self->_metricsController)
  {
    v21 = v5;
    -[SKUIProductPage metricsConfiguration](self->_productPage, "metricsConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_metricsController, a3);
    v8 = *p_metricsController;
    -[SKUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setApplicationIdentifier:", v10);

    objc_msgSend(*p_metricsController, "setPageConfiguration:", v7);
    v11 = *p_metricsController;
    -[SKUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPageContext:", v12);

    v13 = *p_metricsController;
    -[SKUIProductPage pageURL](self->_productPage, "pageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPageURL:", v15);

    v16 = *p_metricsController;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIMetricsWindowOrientationForInterfaceOrientation(objc_msgSend(v17, "statusBarOrientation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWindowOrientation:", v18);

    -[SKUISwooshArrayViewController setMetricsController:](self->_relatedViewController, "setMetricsController:", *p_metricsController);
    v19 = *p_metricsController;
    objc_msgSend(v7, "pingURLs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pingURLs:withClientContext:", v20, self->_clientContext);

    objc_msgSend(*p_metricsController, "recordEvent:", self->_lastPageEvent);
    v5 = v21;
  }

}

- (void)_setProductPage:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKUIProductPage **p_productPage;
  SKUIMetricsController *metricsController;
  void *v14;
  void *v15;
  SKUIItem *v16;
  SKUIItem *item;
  void *v18;
  void *v19;
  void *v20;
  SKUIMetricsController *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  SKUILoadProductPageOperation *loadOperation;
  id v26;

  v26 = a3;
  v7 = a4;
  objc_msgSend(v26, "ITMLData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SKUIIPadProductPageViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ITMLData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ITMLResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", 0, v10, v11, 0);
  }
  else
  {
    if (!v26)
      goto LABEL_12;
    p_productPage = &self->_productPage;
    objc_storeStrong((id *)&self->_productPage, a3);
    -[SKUIProductPage metricsConfiguration](self->_productPage, "metricsConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMetricsController setPageConfiguration:](self->_metricsController, "setPageConfiguration:", v9);
    metricsController = self->_metricsController;
    -[SKUIProductPage pageURL](self->_productPage, "pageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMetricsController setPageURL:](metricsController, "setPageURL:", v15);

    if (!self->_item)
    {
      objc_msgSend(v26, "item");
      v16 = (SKUIItem *)objc_claimAutoreleasedReturnValue();
      item = self->_item;
      self->_item = v16;

      -[SKUIIPadProductPageViewController _reloadHeaderViewController](self, "_reloadHeaderViewController");
    }
    -[SKUIProductPageHeaderViewController setProductPage:](self->_headerViewController, "setProductPage:", *p_productPage);
    if (self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
      -[SKUIIPadProductPageViewController _selectSectionIndex:](self, "_selectSectionIndex:", self->_defaultSelectedSectionIndex);
    -[SKUIProductPage uber](*p_productPage, "uber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIProductPagePlaceholderViewController setColorScheme:](self->_placeholderViewController, "setColorScheme:", v10);
    -[SKUISwooshArrayViewController setColorScheme:](self->_relatedViewController, "setColorScheme:", v10);
    -[SKUIIPadProductPageViewController _reviewsViewController](self, "_reviewsViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadData");

    -[SKUIProductPageHeaderViewController reloadData](self->_headerViewController, "reloadData");
    -[SKUILoadProductPageOperation metricsPageEvent](self->_loadOperation, "metricsPageEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSince1970");
      objc_msgSend(v11, "setPageRenderTime:");

      -[SKUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v11);
      objc_storeStrong((id *)&self->_lastPageEvent, v11);
    }
    v21 = self->_metricsController;
    objc_msgSend(v9, "pingURLs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMetricsController pingURLs:withClientContext:](v21, "pingURLs:withClientContext:", v22, self->_clientContext);

  }
LABEL_12:
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("SKUIErrorDomain")))
    {
      v24 = objc_msgSend(v7, "code");

      if (v24 == 1)
      {
        -[SKUIIPadProductPageViewController _sendCannotOpen](self, "_sendCannotOpen");
        goto LABEL_18;
      }
    }
    else
    {

    }
    -[SKUIIPadProductPageViewController _showError:](self, "_showError:", v7);
  }
LABEL_18:
  -[SKUILoadProductPageOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

}

- (void)_showError:(id)a3
{
  id v4;
  _BOOL4 v5;
  SKUINetworkErrorViewController *v6;
  SKUINetworkErrorViewController *networkErrorViewController;
  id v8;

  v4 = a3;
  if (!self->_networkErrorViewController)
  {
    v8 = v4;
    v5 = +[SKUINetworkErrorViewController canDisplayError:](SKUINetworkErrorViewController, "canDisplayError:", v4);
    v4 = v8;
    if (v5)
    {
      v6 = -[SKUINetworkErrorViewController initWithError:]([SKUINetworkErrorViewController alloc], "initWithError:", v8);
      networkErrorViewController = self->_networkErrorViewController;
      self->_networkErrorViewController = v6;

      -[SKUINetworkErrorViewController setClientContext:](self->_networkErrorViewController, "setClientContext:", self->_clientContext);
      -[SKUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", self);
      -[SKUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", self->_networkErrorViewController);
      -[SKUIIPadProductPageViewController _showViewController:](self, "_showViewController:", self->_networkErrorViewController);
      v4 = v8;
    }
  }

}

- (void)_showIncompatibleView
{
  SKUIIncompatibleAppViewController *incompatibleViewController;
  SKUIIncompatibleAppViewController *v4;
  void *v5;
  SKUIIncompatibleAppViewController *v6;
  SKUIIncompatibleAppViewController *v7;
  void *v8;
  UIView *overlayView;
  id v10;

  incompatibleViewController = self->_incompatibleViewController;
  if (!incompatibleViewController)
  {
    v4 = [SKUIIncompatibleAppViewController alloc];
    -[SKUIProductPage item](self->_productPage, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIIncompatibleAppViewController initWithIncompatibleItem:](v4, "initWithIncompatibleItem:", v5);
    v7 = self->_incompatibleViewController;
    self->_incompatibleViewController = v6;

    -[SKUIViewController setClientContext:](self->_incompatibleViewController, "setClientContext:", self->_clientContext);
    -[SKUIIncompatibleAppViewController setOperationQueue:](self->_incompatibleViewController, "setOperationQueue:", self->_operationQueue);
    -[SKUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", self->_incompatibleViewController);
    -[SKUIIncompatibleAppViewController view](self->_incompatibleViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    -[UIView bounds](self->_overlayView, "bounds");
    objc_msgSend(v8, "setFrame:");
    -[UIView addSubview:](self->_overlayView, "addSubview:", v8);

    incompatibleViewController = self->_incompatibleViewController;
  }
  overlayView = self->_overlayView;
  -[SKUIIncompatibleAppViewController view](incompatibleViewController, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bringSubviewToFront:](overlayView, "bringSubviewToFront:", v10);

}

- (void)_showBanner
{
  SKUIMessageBanner *v3;
  SKUIMessageBanner *banner;
  SKUIMessageBanner *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  if (!self->_banner)
  {
    v3 = objc_alloc_init(SKUIMessageBanner);
    banner = self->_banner;
    self->_banner = v3;

    -[SKUIMessageBanner setDelegate:](self->_banner, "setDelegate:", self);
    v5 = self->_banner;
    if (self->_bannerText)
    {
      -[SKUIMessageBanner setMessage:](self->_banner, "setMessage:");
    }
    else
    {
      -[SKUIIPadProductPageViewController clientContext](self, "clientContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIIPadProductPageViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIMessageBannerAttributedString(v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIMessageBanner setAttributedMessage:](v5, "setAttributedMessage:", v9);

    }
    -[SKUIIPadProductPageViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_banner);

    -[SKUIIPadProductPageViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    -[SKUIMessageBanner sizeThatFits:](self->_banner, "sizeThatFits:", 630.0, 630.0);
    -[SKUIMessageBanner setFrame:](self->_banner, "setFrame:", v13, v15, v16, v17);
    -[SKUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:", self->_selectedSectionIndex);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIIPadProductPageViewController _showViewController:](self, "_showViewController:", v18);

  }
}

- (void)_showViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SKUIIPadProductPageViewController _reloadHeaderViewController](self, "_reloadHeaderViewController");
  objc_msgSend(v4, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIMessageBanner frame](self->_banner, "frame");
  -[SKUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  -[SKUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");

  -[UIView bounds](self->_overlayView, "bounds");
  objc_msgSend(v7, "setFrame:");
  -[UIView insertSubview:atIndex:](self->_overlayView, "insertSubview:atIndex:", v7, 0);
  if (-[SKUIIPadProductPageViewController _isIncompatibleItem](self, "_isIncompatibleItem"))
    -[SKUIIPadProductPageViewController _showIncompatibleView](self, "_showIncompatibleView");

}

- (id)_viewControllerForSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3 == 2)
  {
    -[SKUIProductPage relatedContentSwooshes](self->_productPage, "relatedContentSwooshes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      -[SKUIIPadProductPageViewController _relatedViewController](self, "_relatedViewController");
    else
      -[SKUIIPadProductPageViewController _placeholderViewController](self, "_placeholderViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[SKUIIPadProductPageViewController _reviewsViewController](self, "_reviewsViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v4 = 0;
  }
  else
  {
    -[SKUIIPadProductPageViewController _detailsViewController](self, "_detailsViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIIPadProductPageDelegate)delegate
{
  return (SKUIIPadProductPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIItem)item
{
  return self->_item;
}

- (SKUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_reviewsViewController, 0);
  objc_storeStrong((id *)&self->_relatedViewController, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_networkErrorViewController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_incompatibleViewController, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

- (void)_initSKUIIPadProductPageViewController
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController]";
}

@end
