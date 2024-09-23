@implementation SKProductPageViewController

- (id)_initSKProductPageViewController
{
  SKProductPageViewController *v3;
  SKProductPageViewController *v4;
  SKUIBannerViewController *v5;
  SKUIBannerViewController *bannerViewController;
  void *v7;
  id v8;
  SKUIITunesStoreUIPageViewController *v9;
  SKUIITunesStoreUIPageViewController *storePageViewController;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SKUIItemStateCenter *itemStateCenter;
  int64_t style;
  uint64_t v17;
  void *v18;
  objc_super v20;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKProductPageViewController _initSKProductPageViewController].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKProductPageViewController;
  v3 = -[SUViewController init](&v20, sel_init);
  v4 = v3;
  if (v3)
  {
    if (v3->_style == 1)
    {
      v5 = objc_alloc_init(SKUIBannerViewController);
      bannerViewController = v4->_bannerViewController;
      v4->_bannerViewController = v5;

      -[SKUIBannerViewController setDelegate:](v4->_bannerViewController, "setDelegate:", v4);
      -[SKProductPageViewController addChildViewController:](v4, "addChildViewController:", v4->_bannerViewController);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_defaultClientInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0DDC228]);
      objc_msgSend(v8, "setLeftItemsSupplementBackButton:", 1);
      -[SUViewController _setExistingNavigationItem:](v4, "_setExistingNavigationItem:", v8);
      v4->_showsStoreButton = 1;
      v4->_preview = 0;
      v9 = -[SUViewController initWithSection:]([SKUIITunesStoreUIPageViewController alloc], "initWithSection:", 0);
      storePageViewController = v4->_storePageViewController;
      v4->_storePageViewController = v9;

      v11 = -[SUStorePageViewController copyScriptProperties](v4->_storePageViewController, "copyScriptProperties");
      if (v4->_style == 1)
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.921568627, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v12);

      -[SUStorePageViewController setScriptProperties:](v4->_storePageViewController, "setScriptProperties:", v11);
      -[SUStorePageViewController setCanMoveToOverlay:](v4->_storePageViewController, "setCanMoveToOverlay:", 0);
      -[SUViewController _setExistingNavigationItem:](v4->_storePageViewController, "_setExistingNavigationItem:", v8);
      -[SUStorePageViewController setLoadsWhenHidden:](v4->_storePageViewController, "setLoadsWhenHidden:", 1);
      -[SUStorePageViewController _setReloadsWhenCacheExpired:](v4->_storePageViewController, "_setReloadsWhenCacheExpired:", 0);
      -[SKUIITunesStoreUIPageViewController setProductPageViewController:](v4->_storePageViewController, "setProductPageViewController:", v4);
      -[SKProductPageViewController addChildViewController:](v4, "addChildViewController:", v4->_storePageViewController);
      -[SKProductPageViewController setClientInterface:](v4, "setClientInterface:", v7);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__purchaseFailedNotification_, *MEMORY[0x1E0DDC2A8], 0);
      objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__purchaseFinishedNotification_, *MEMORY[0x1E0DDC2B0], 0);
      +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
      v14 = objc_claimAutoreleasedReturnValue();
      itemStateCenter = v4->_itemStateCenter;
      v4->_itemStateCenter = (SKUIItemStateCenter *)v14;

      -[SKUIItemStateCenter addObserver:](v4->_itemStateCenter, "addObserver:", v4);
      style = v4->_style;
      if (style)
      {
        v17 = 0;
        if (style != 3)
          v17 = 15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "userInterfaceIdiom") == 1)
          v17 = 0;
        else
          v17 = 15;

      }
      -[SKProductPageViewController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", v17);

    }
  }
  return v4;
}

- (SKProductPageViewController)initWithProductPageStyle:(int64_t)a3
{
  self->_style = a3;
  return (SKProductPageViewController *)-[SKProductPageViewController _initSKProductPageViewController](self, "_initSKProductPageViewController");
}

- (SKProductPageViewController)initWithTabBarItem:(id)a3
{
  SKProductPageViewController *v3;
  SKProductPageViewController *v4;

  v3 = -[SKProductPageViewController _initSKProductPageViewController](self, "_initSKProductPageViewController", a3);
  v4 = v3;
  if (v3)
    -[SKProductPageViewController _setShowsCancelButton:](v3, "_setShowsCancelButton:", 1);
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  SKProductPageViewController *v5;
  SKProductPageViewController *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC2A8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC2B0], 0);
  -[SKUIItemStateCenter removeObserver:](self->_itemStateCenter, "removeObserver:", self);
  -[SKUIITunesStoreUIPageViewController setProductPageViewController:](self->_storePageViewController, "setProductPageViewController:", 0);
  -[SKUIITunesStoreUIPageViewController removeFromParentViewController](self->_storePageViewController, "removeFromParentViewController");
  -[SUViewController clientInterface](self, "clientInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[SKUIBannerViewController setDelegate:](self->_bannerViewController, "setDelegate:", 0);
  -[SKUIIPadProductPageViewController setDelegate:](self->_ipadProductPageViewController, "setDelegate:", 0);
  -[SKUIIPhoneProductPageViewController setDelegate:](self->_iphoneProductPageViewController, "setDelegate:", 0);
  -[SUPurchaseManager setDelegate:](self->_purchaseManager, "setDelegate:", 0);
  -[SUPreviewOverlayViewController removeFromParentViewController](self->_previewOverlay, "removeFromParentViewController");
  -[SUBarButtonItem target](self->_gotoStoreButtonItem, "target");
  v5 = (SKProductPageViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[SUBarButtonItem setTarget:](self->_gotoStoreButtonItem, "setTarget:", 0);
  -[SUBarButtonItem target](self->_rightBarButtonItem, "target");
  v6 = (SKProductPageViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    -[SUBarButtonItem setTarget:](self->_rightBarButtonItem, "setTarget:", 0);

  v7.receiver = self;
  v7.super_class = (Class)SKProductPageViewController;
  -[SUViewController dealloc](&v7, sel_dealloc);
}

+ (void)getCanLoadWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22[2];
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOnDeviceAppInstallationAllowed");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC1B8], "sharedCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLBagForContext:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(a1, "_validateURL:withURLBag:completionBlock:", v6, v12, v7);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC170]), "initWithBagContext:", v10);
      objc_initWeak(&location, v13);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __65__SKProductPageViewController_getCanLoadWithURL_completionBlock___block_invoke;
      v18 = &unk_1E739FCE8;
      objc_copyWeak(v22, &location);
      v22[1] = a1;
      v19 = v6;
      v20 = v10;
      v21 = v7;
      objc_msgSend(v13, "setCompletionBlock:", &v15);
      objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue", v15, v16, v17, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addOperation:", v13);

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __65__SKProductPageViewController_getCanLoadWithURL_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "success");

  v4 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DDC1B8], "sharedCache");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLBagForContext:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_validateURL:withURLBag:completionBlock:", v5, v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "_validateURL:withURLBag:completionBlock:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 48));
  }
}

- (void)loadProductWithParameters:(id)a3
{
  NSDictionary *v4;
  NSDictionary *productParameters;

  if (self->_productParameters != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    productParameters = self->_productParameters;
    self->_productParameters = v4;

    -[SKProductPageViewController _loadRequestForProductParameters](self, "_loadRequestForProductParameters");
  }
}

- (void)loadProductWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC1B8], "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLBagForContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SKProductPageViewController _loadProductWithRequest:](self, "_loadProductWithRequest:", v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC170]), "initWithBagContext:", v5);
    objc_msgSend(MEMORY[0x1E0DAF6F0], "weakReferenceWithObject:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __54__SKProductPageViewController_loadProductWithRequest___block_invoke;
    v15 = &unk_1E739FD10;
    v16 = v9;
    v17 = v4;
    v10 = v9;
    objc_msgSend(v8, "setCompletionBlock:", &v12);
    objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue", v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v8);

  }
}

void __54__SKProductPageViewController_loadProductWithRequest___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SKProductPageViewController_loadProductWithRequest___block_invoke_2;
  v2[3] = &unk_1E739FD10;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __54__SKProductPageViewController_loadProductWithRequest___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_loadProductWithRequest:", *(_QWORD *)(a1 + 40));

}

- (NSDictionary)scriptContextDictionary
{
  id v2;
  void *v3;

  v2 = -[SUStorePageViewController copyScriptProperties](self->_storePageViewController, "copyScriptProperties");
  objc_msgSend(v2, "contextDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setAdditionalPurchaseParameters:(id)a3
{
  NSString *v4;
  NSString *additionalPurchaseParameters;

  if (self->_additionalPurchaseParameters != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    additionalPurchaseParameters = self->_additionalPurchaseParameters;
    self->_additionalPurchaseParameters = v4;

    -[SKUIClientContext _setAdditionalPurchaseParameters:](self->_clientContext, "_setAdditionalPurchaseParameters:", self->_additionalPurchaseParameters);
  }
}

- (void)setAffiliateIdentifier:(id)a3
{
  NSString *v4;
  NSString *affiliateIdentifier;

  if (self->_affiliateIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    affiliateIdentifier = self->_affiliateIdentifier;
    self->_affiliateIdentifier = v4;

    -[SKUIClientContext _setPurchaseAffiliateIdentifier:](self->_clientContext, "_setPurchaseAffiliateIdentifier:", self->_affiliateIdentifier);
  }
}

- (void)setAskToBuy:(BOOL)a3
{
  id v4;

  if (self->_askToBuy != a3)
  {
    self->_askToBuy = a3;
    -[SKUIIPhoneProductPageViewController setAskPermission:](self->_iphoneProductPageViewController, "setAskPermission:");
    -[SKUIIPadProductPageViewController setAskPermission:](self->_ipadProductPageViewController, "setAskPermission:", self->_askToBuy);
    -[SUViewController clientInterface](self, "clientInterface");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInAskToBuyApprovalFlow:", self->_askToBuy);

  }
}

- (void)setPromptString:(id)a3
{
  NSString *v5;
  NSString **p_promptString;
  void *v7;
  NSString *v8;

  v5 = (NSString *)a3;
  p_promptString = &self->_promptString;
  if (self->_promptString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_promptString, a3);
    -[SKUIIPhoneProductPageViewController setBannerText:](self->_iphoneProductPageViewController, "setBannerText:", *p_promptString);
    -[SKUIIPadProductPageViewController setBannerText:](self->_ipadProductPageViewController, "setBannerText:", *p_promptString);
    -[SUViewController clientInterface](self, "clientInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAskToBuyApprovalPrompt:", *p_promptString);

    v5 = v8;
  }

}

- (void)setProductPageStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3)
    {
      if (a3 == 3)
        v4 = 0;
      else
        v4 = 15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
        v4 = 0;
      else
        v4 = 15;

    }
    -[SKProductPageViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", v4);
  }
}

- (void)setScriptContextDictionary:(id)a3
{
  SKUIITunesStoreUIPageViewController *storePageViewController;
  id v5;
  id v6;

  storePageViewController = self->_storePageViewController;
  v5 = a3;
  v6 = -[SUStorePageViewController copyScriptProperties](storePageViewController, "copyScriptProperties");
  objc_msgSend(v6, "setContextDictionary:", v5);
  -[SKUIBannerViewController setScriptContextDictionary:](self->_bannerViewController, "setScriptContextDictionary:", v5);

  -[SUStorePageViewController setScriptProperties:](self->_storePageViewController, "setScriptProperties:", v6);
}

- (void)setURLBagType:(int64_t)a3
{
  self->_urlBagType = a3;
  -[SKUIClientContext _setPurchaseURLBagType:](self->_clientContext, "_setPurchaseURLBagType:");
}

- (void)setCancelButtonTitle:(id)a3
{
  -[SKUIITunesStoreUIPageViewController setCancelButtonTitle:](self->_storePageViewController, "setCancelButtonTitle:", a3);
}

- (id)cancelButtonTitle:(id)a3
{
  return -[SKUIITunesStoreUIPageViewController cancelButtonTitle](self->_storePageViewController, "cancelButtonTitle", a3);
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  id WeakRetained;
  char v6;
  id v7;

  if (a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "productPageDidFinishLoad:", self);

    }
    -[SKProductPageViewController _reloadGotoStoreButton](self, "_reloadGotoStoreButton");
  }
  else
  {
    -[SKProductPageViewController _failWithError:](self, "_failWithError:", 0);
  }
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.88, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SKProductPageViewController setView:](self, "setView:", v4);
  -[SKProductPageViewController _reloadViews](self, "_reloadViews");

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  if (SKUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 == 1 || v5 != 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKProductPageViewController;
  -[SUViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SUStorePageViewController _setReloadsWhenCacheExpired:](self->_storePageViewController, "_setReloadsWhenCacheExpired:", 1);
}

- (void)setClientInterface:(id)a3
{
  id v4;
  id v5;
  void *v6;
  SUPurchaseManager *v7;
  SUPurchaseManager *purchaseManager;
  objc_super v9;

  v4 = a3;
  -[SUViewController clientInterface](self, "clientInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v4)
  {
    objc_msgSend(v5, "setDelegate:", 0);
    if (!self->_purchaseManager)
    {
      v7 = (SUPurchaseManager *)objc_alloc_init(MEMORY[0x1E0DDC240]);
      purchaseManager = self->_purchaseManager;
      self->_purchaseManager = v7;

      -[SUPurchaseManager setDelegate:](self->_purchaseManager, "setDelegate:", self);
    }
    objc_msgSend(v4, "setDelegate:", self);
    objc_msgSend(v4, "setPurchaseManager:", self->_purchaseManager);
    objc_msgSend(v4, "setInAskToBuyApprovalFlow:", self->_askToBuy);
    objc_msgSend(v4, "setAskToBuyApprovalPrompt:", self->_promptString);
    -[SUViewController setClientInterface:](self->_storePageViewController, "setClientInterface:", v4);
  }
  v9.receiver = self;
  v9.super_class = (Class)SKProductPageViewController;
  -[SUViewController setClientInterface:](&v9, sel_setClientInterface_, v4);

}

- (void)bannerView:(id)a3 didFailWithError:(id)a4
{
  -[SKProductPageViewController _sendDidFailLoadWithError:](self, "_sendDidFailLoadWithError:", a4);
}

- (void)bannerViewDidClose:(id)a3
{
  -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 1);
}

- (BOOL)iPhoneProductPage:(id)a3 shouldOpenItem:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x1E0C99E98];
  v5 = a4;
  v6 = [v4 alloc];
  objc_msgSend(v5, "productPageURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);
  UIITunesStoreResolvedURLForHTTPURL();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openURL:options:completionHandler:", v12, MEMORY[0x1E0C9AA70], 0);

  return 0;
}

- (BOOL)iPhoneProductPage:(id)a3 shouldOpenURL:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a4;
  UIITunesStoreResolvedURLForHTTPURL();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:options:completionHandler:", v8, MEMORY[0x1E0C9AA70], 0);

  return 0;
}

- (void)iPadProductPage:(id)a3 openItem:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99E98];
  v5 = a4;
  v6 = [v4 alloc];
  objc_msgSend(v5, "productPageURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);
  UIITunesStoreResolvedURLForHTTPURL();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openURL:options:completionHandler:", v12, MEMORY[0x1E0C9AA70], 0);

}

- (void)iPadProductPage:(id)a3 openURL:(id)a4 viewControllerBlock:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
    goto LABEL_2;
  objc_msgSend(v16, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "productPageURLString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_2:
      UIITunesStoreResolvedURLForHTTPURL();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = v7;
      v12 = v11;

      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "openURL:options:completionHandler:", v12, MEMORY[0x1E0C9AA70], 0);

    }
  }

}

- (void)clientInterface:(id)a3 exitStoreWithReason:(int64_t)a4
{
  int64_t v4;

  if ((unint64_t)(a4 - 3) >= 3)
    v4 = 0;
  else
    v4 = a4 - 2;
  -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", v4);
}

- (void)clientInterface:(id)a3 hidePreviewOverlayAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  SUPreviewOverlayViewController *previewOverlay;
  _QWORD v8[5];

  if (self->_previewOverlay)
  {
    v4 = a4;
    -[SUViewController navigationController](self, "navigationController", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    previewOverlay = self->_previewOverlay;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__SKProductPageViewController_clientInterface_hidePreviewOverlayAnimated___block_invoke;
    v8[3] = &unk_1E739FD38;
    v8[4] = self;
    -[SUPreviewOverlayViewController hideInNavigationController:animated:completionBlock:](previewOverlay, "hideInNavigationController:animated:completionBlock:", v6, v4, v8);

  }
}

void __74__SKProductPageViewController_clientInterface_hidePreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "removeFromParentViewController");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0DDC2A0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224));

}

- (void)clientInterface:(id)a3 presentDialog:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  SUDialogManager *dialogManager;
  SUDialogManager *v10;
  SUDialogManager *v11;
  _QWORD v12[4];
  id v13;
  SKProductPageViewController *v14;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "productPage:presentAlertForDialog:", self, v5);

  }
  else
  {
    dialogManager = self->_dialogManager;
    if (!dialogManager)
    {
      v10 = (SUDialogManager *)objc_alloc_init(MEMORY[0x1E0DDC200]);
      v11 = self->_dialogManager;
      self->_dialogManager = v10;

      dialogManager = self->_dialogManager;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SKProductPageViewController_clientInterface_presentDialog___block_invoke;
    v12[3] = &unk_1E739FD60;
    v13 = v5;
    v14 = self;
    -[SUDialogManager presentDialog:withCompletionBlock:](dialogManager, "presentDialog:withCompletionBlock:", v13, v12);

  }
}

void __61__SKProductPageViewController_clientInterface_presentDialog___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 0x8000000000000000) == 0)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "count") > a2;
    v4 = v7;
    if (v5)
    {
      objc_msgSend(v7, "objectAtIndex:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "actionType") == 5)
        objc_msgSend(*(id *)(a1 + 40), "_sendDidFinishWithResult:", 0);

      v4 = v7;
    }
  }

}

- (void)clientInterface:(id)a3 setStatusBarHidden:(BOOL)a4 withAnimation:(int64_t)a5
{
  _BOOL8 v6;
  SKProductPageViewControllerDelegatePrivate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "productPage:setStatusBarHidden:withAnimation:", self, v6, a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStatusBarHidden:withAnimation:", v6, a5);
  }

}

- (void)clientInterface:(id)a3 setStatusBarStyle:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  SKProductPageViewControllerDelegatePrivate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  v5 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "productPage:setStatusBarStyle:animated:", self, a4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStatusBarStyle:animated:", a4, v5);
  }

}

- (void)clientInterface:(id)a3 showPreviewOverlayAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  -[SKProductPageViewController _previewOverlay](self, "_previewOverlay", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isContentLoaded"))
  {
    -[SKProductPageViewController _showPreviewOverlayAnimated:](self, "_showPreviewOverlayAnimated:", v4);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultRequestProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__SKProductPageViewController_clientInterface_showPreviewOverlayAnimated___block_invoke;
    v8[3] = &unk_1E739FD88;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v6, "loadWithRequestProperties:completionBlock:", v7, v8);

  }
}

uint64_t __74__SKProductPageViewController_clientInterface_showPreviewOverlayAnimated___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_showPreviewOverlayAnimated:", *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)clientInterface:(id)a3 willDismissViewController:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "productPage:willDismissViewController:", self, v8);

  }
}

- (void)clientInterface:(id)a3 willPresentViewController:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "productPage:willPresentViewController:", self, v8);

  }
}

- (id)scriptInterfaceForClientInterface:(id)a3
{
  SKScriptInterface *v4;

  v4 = objc_alloc_init(SKScriptInterface);
  -[SKScriptInterface setParentProductPageViewController:](v4, "setParentProductPageViewController:", self);
  return v4;
}

- (void)purchaseManager:(id)a3 didFinishPurchaseRequest:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id WeakRetained;
  char v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v10)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      v13 &= 2u;
    if (v13)
    {
      *(_DWORD *)v24 = 138412290;
      *(_QWORD *)&v24[4] = objc_opt_class();
      v21 = *(id *)&v24[4];
      LODWORD(v23) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_19:

        -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 4);
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, v24, v23, *(_QWORD *)v24, *(_QWORD *)&v24[8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog();
    }

    goto LABEL_19;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (v13)
  {
    *(_DWORD *)v24 = 138412546;
    *(_QWORD *)&v24[4] = objc_opt_class();
    *(_WORD *)&v24[12] = 2112;
    *(_QWORD *)&v24[14] = v10;
    v16 = *(id *)&v24[4];
    LODWORD(v23) = 22;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, v24, v23, *(_OWORD *)v24, *(_QWORD *)&v24[16], v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog();
  }

LABEL_11:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v20, "productPage:purchaseBatchFailedWithError:", self, v10);

  }
LABEL_20:

}

- (void)purchaseManager:(id)a3 willAddPurchases:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  id WeakRetained;
  char v25;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[NSString length](self->_additionalPurchaseParameters, "length"))
          {
            objc_msgSend(v11, "buyParameters");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@&%@"), v12, self->_additionalPurchaseParameters);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setBuyParameters:", v13);

            }
          }
          if (self->_affiliateIdentifier)
            objc_msgSend(v11, "setAffiliateIdentifier:");
          if (self->_urlBagType)
          {
            objc_msgSend(v11, "requestProperties");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (id)objc_msgSend(v14, "mutableCopy");

            if (!v15)
              v15 = objc_alloc_init(MEMORY[0x1E0DAF5C8]);
            objc_msgSend(v15, "setURLBagType:", self->_urlBagType);
            objc_msgSend(v11, "setRequestProperties:", v15);

          }
          objc_msgSend(v28, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldLog");
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    v20 = v18;
  else
    v20 = v18 & 2;
  if (v20)
  {
    v21 = (void *)objc_opt_class();
    v33 = 138412546;
    v34 = v21;
    v35 = 2112;
    v36 = v28;
    v22 = v21;
    LODWORD(v27) = 22;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (!v23)
      goto LABEL_30;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v33, v27);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v23);
    SSFileLog();
  }

LABEL_30:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    v26 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v26, "productPage:willMakePurchases:", self, v28);

  }
}

- (void)itemStateCenter:(id)a3 didFinishPurchases:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  char v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
      objc_msgSend(v10, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v10, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v15 &= 2u;
    if (v15)
    {
      v17 = (void *)objc_opt_class();
      v35 = 138412546;
      v36 = v17;
      v37 = 2112;
      v38 = v12;
      v18 = v17;
      LODWORD(v30) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v35, v30, (_QWORD)v31);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();
    }

LABEL_20:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v22, "productPage:purchaseBatchFailedWithError:", self, v12);

    }
    goto LABEL_32;
  }
LABEL_9:

LABEL_22:
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldLog");
  if (objc_msgSend(v23, "shouldLogToDisk"))
    v25 = v24 | 2;
  else
    v25 = v24;
  objc_msgSend(v23, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    v25 &= 2u;
  if (!v25)
    goto LABEL_30;
  v27 = (void *)objc_opt_class();
  v35 = 138412290;
  v36 = v27;
  v28 = v27;
  LODWORD(v30) = 12;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v35, v30, (_QWORD)v31);
    v26 = objc_claimAutoreleasedReturnValue();
    free(v29);
    SSFileLog();
LABEL_30:

  }
  -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 4);
  v12 = 0;
LABEL_32:

}

- (void)itemStateCenter:(id)a3 didFinishSoftwarePurchases:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  char v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
      objc_msgSend(v10, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v10, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v15 &= 2u;
    if (v15)
    {
      v17 = (void *)objc_opt_class();
      v35 = 138412546;
      v36 = v17;
      v37 = 2112;
      v38 = v12;
      v18 = v17;
      LODWORD(v30) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v35, v30, (_QWORD)v31);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();
    }

LABEL_20:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v22, "productPage:purchaseBatchFailedWithError:", self, v12);

    }
    goto LABEL_32;
  }
LABEL_9:

LABEL_22:
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldLog");
  if (objc_msgSend(v23, "shouldLogToDisk"))
    v25 = v24 | 2;
  else
    v25 = v24;
  objc_msgSend(v23, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    v25 &= 2u;
  if (!v25)
    goto LABEL_30;
  v27 = (void *)objc_opt_class();
  v35 = 138412290;
  v36 = v27;
  v28 = v27;
  LODWORD(v30) = 12;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v35, v30, (_QWORD)v31);
    v26 = objc_claimAutoreleasedReturnValue();
    free(v29);
    SSFileLog();
LABEL_30:

  }
  -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 4);
  v12 = 0;
LABEL_32:

}

- (void)_gotoStoreButtonAction:(id)a3
{
  NSURL *nativeURL;
  NSURL *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  nativeURL = self->_nativeURL;
  if (nativeURL)
  {
    v5 = nativeURL;
LABEL_4:
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIITunesStoreResolvedURLForHTTPURL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:", v7);

    goto LABEL_5;
  }
  -[SUStorePageViewController displayedURL](self->_storePageViewController, "displayedURL");
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_4;
LABEL_5:
  -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 3);

}

- (void)_rightBarButtonAction:(id)a3
{
  -[SKProductPageViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 5);
}

- (void)_purchaseFailedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  id WeakRetained;
  char v15;
  id v16;
  uint64_t v17;
  _BYTE v18[24];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DDC2B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    v10 &= 2u;
  if (v10)
  {
    *(_DWORD *)v18 = 138412802;
    *(_QWORD *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2112;
    *(_QWORD *)&v18[14] = v5;
    *(_WORD *)&v18[22] = 2112;
    v19 = v7;
    v12 = *(id *)&v18[4];
    LODWORD(v17) = 32;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, v18, v17, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog();
  }

LABEL_10:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "productPage:didFinishPurchase:withError:", self, v5, v7);

  }
}

- (void)_purchaseFinishedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v7 &= 2u;
  if (v7)
  {
    *(_DWORD *)v15 = 138412546;
    *(_QWORD *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2112;
    *(_QWORD *)&v15[14] = v4;
    v9 = *(id *)&v15[4];
    LODWORD(v14) = 22;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16]);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
  }

LABEL_10:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "productPage:didFinishPurchase:withError:", self, v4, 0);

  }
}

- (void)_applicationWillEnterForeground
{
  SSMetricsPageEvent *lastPageEvent;
  void *v4;
  int64_t style;
  void *v6;
  uint64_t v7;
  int *v8;

  lastPageEvent = self->_lastPageEvent;
  if (lastPageEvent)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v4);

    style = self->_style;
    if (style == 3
      || !style
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "userInterfaceIdiom"),
          v6,
          v7 == 1))
    {
      v8 = &OBJC_IVAR___SKProductPageViewController__ipadProductPageViewController;
    }
    else
    {
      v8 = &OBJC_IVAR___SKProductPageViewController__iphoneProductPageViewController;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v8), "configureMetricsWithPageEvent:", self->_lastPageEvent);
  }
}

- (void)loadWithProductPage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SKProductPageViewController_loadWithProductPage___block_invoke;
  v6[3] = &unk_1E739FDB0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SKProductPageViewController _loadClientContextWithCompletionBlock:](self, "_loadClientContextWithCompletionBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __51__SKProductPageViewController_loadWithProductPage___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_showProductPage:pageEvent:", *(_QWORD *)(a1 + 32), 0);
  else
    objc_msgSend(WeakRetained, "_sendDidFailLoadWithError:", v7);

}

- (void)loadWithStorePageRequest:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[SKProductPageViewController setProductPageStyle:](self, "setProductPageStyle:", objc_msgSend(v8, "productPageStyle"));
  objc_msgSend(v8, "productURL");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProductPageViewController loadProductWithRequest:](self, "loadProductWithRequest:", v6);

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v8, "productParameters");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = (void *)v7;
    -[SKProductPageViewController loadProductWithParameters:](self, "loadProductWithParameters:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)_defaultClientInterface
{
  id v3;
  void *v4;
  SKUIViewControllerFactory *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DDC1F8]);
  objc_msgSend(a1, "_defaultClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentifier:", v4);

  v5 = objc_alloc_init(SKUIViewControllerFactory);
  objc_msgSend(v3, "setViewControllerFactory:", v5);

  return v3;
}

- (void)_sendDidFinishWithResult:(int64_t)a3
{
  SKProductPageViewControllerDelegatePrivate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "productPage:didFinishWithResult:", self, a3);

  }
}

- (void)_setClientContext:(id)a3
{
  SKUIClientContext *v5;
  SKUIClientContext *v6;

  v5 = (SKUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    -[SKUIClientContext setMetricsPageContext:forViewController:](self->_clientContext, "setMetricsPageContext:forViewController:", CFSTR("Sheet"), self);
    v5 = v6;
  }

}

- (void)_setShowsCancelButton:(BOOL)a3
{
  -[SKUIITunesStoreUIPageViewController setShowsCancelButton:](self->_storePageViewController, "setShowsCancelButton:", a3);
}

- (void)_showPageWithRequest:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  SKProductPageViewController *v8;
  SKProductPageViewController *v9;
  char v10;
  void *v11;
  id v12;
  id v13;

  v4 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  v8 = (SKProductPageViewController *)objc_loadWeakRetained((id *)&self->_delegate);
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    -[SKProductPageViewController productPage:presentProductPageWithRequest:animated:](v8, "productPage:presentProductPageWithRequest:animated:", self, v13, v4);
LABEL_5:

    goto LABEL_6;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v9 = objc_alloc_init(SKProductPageViewController);
    -[SUViewController clientInterface](self, "clientInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProductPageViewController setClientInterface:](v9, "setClientInterface:", v11);

    -[SKProductPageViewController loadWithStorePageRequest:](v9, "loadWithStorePageRequest:", v13);
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "productPage:presentProductPage:animated:", self, v9, v4);

    goto LABEL_5;
  }
LABEL_6:

}

+ (id)_defaultClientIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService")) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("ThirdParty");
  v6 = v5;

  return v6;
}

+ (void)_validateURL:(id)a3 withURLBag:(id)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(a4, "valueForKey:", CFSTR("ix-store-sheet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("host-patterns"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = 0;
LABEL_35:

        goto LABEL_36;
      }
      objc_msgSend(v7, "host");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v13)
      {
        v14 = v13;
        v30 = v10;
        v32 = v9;
        v29 = v7;
        v15 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v39 != v15)
              objc_enumerationMutation(v12);
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), 1, 0);
            v18 = objc_msgSend(v17, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));

            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {

              v7 = v29;
              v10 = v30;
              v9 = v32;
              goto LABEL_16;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          if (v14)
            continue;
          break;
        }
        v19 = 0;
        v20 = 0;
        v7 = v29;
        v10 = v30;
        v9 = v32;
      }
      else
      {
        v19 = 0;
        v20 = 0;
      }
      goto LABEL_33;
    }
LABEL_16:
    objc_msgSend(v9, "objectForKey:", CFSTR("path-patterns"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "path");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v11 = v11;
        v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v22)
        {
          v23 = v22;
          v31 = v10;
          v33 = v9;
          v24 = v7;
          v25 = *(_QWORD *)v35;
LABEL_20:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v11);
            v20 = 1;
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26), 1, 0);
            v28 = objc_msgSend(v27, "rangeOfFirstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length"));

            if (v28 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            if (v23 == ++v26)
            {
              v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v23)
                goto LABEL_20;
              v20 = 0;
              break;
            }
          }
          v7 = v24;
          v10 = v31;
          v9 = v33;
        }
        else
        {
          v20 = 0;
        }

        v19 = 1;
LABEL_33:

        goto LABEL_34;
      }
      v20 = 0;
      v19 = 1;
    }
    else
    {
      v19 = 1;
      v20 = 1;
    }
LABEL_34:

    v21 = v19 & v20;
    goto LABEL_35;
  }
  v21 = 0;
LABEL_36:
  v8[2](v8, v21);

}

- (void)_failWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CD80A8];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_1E73A9FB0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v9);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[SUStorePageViewController setSkLoading:](self->_storePageViewController, "setSkLoading:", 0);
  -[SKProductPageViewController _sendDidFailLoadWithError:](self, "_sendDidFailLoadWithError:", v4);

}

- (void)_loadClientContextWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKUIClientContext *v7;
  SKUIClientContext *clientContext;
  void *v9;
  SKUIReloadConfigurationOperation *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  SKProductPageViewController *v23;
  id v24;
  id v25;
  id location;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUViewController clientInterface](self, "clientInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultClientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_clientContext)
  {
    +[SKUIClientContext defaultContext](SKUIClientContext, "defaultContext");
    v7 = (SKUIClientContext *)objc_claimAutoreleasedReturnValue();
    clientContext = self->_clientContext;
    self->_clientContext = v7;

    -[SKUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientIdentifier:", v6);

    -[SKUIClientContext setMetricsPageContext:forViewController:](self->_clientContext, "setMetricsPageContext:forViewController:", CFSTR("Sheet"), self);
    -[SKUIClientContext _setAdditionalPurchaseParameters:](self->_clientContext, "_setAdditionalPurchaseParameters:", self->_additionalPurchaseParameters);
    -[SKUIClientContext _setPurchaseAffiliateIdentifier:](self->_clientContext, "_setPurchaseAffiliateIdentifier:", self->_affiliateIdentifier);
    -[SKUIClientContext _setPurchaseURLBagType:](self->_clientContext, "_setPurchaseURLBagType:", self->_urlBagType);
    if (!self->_clientContext)
    {
      v10 = objc_alloc_init(SKUIReloadConfigurationOperation);
      objc_initWeak(&location, self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke;
      v21[3] = &unk_1E739FE00;
      objc_copyWeak(&v25, &location);
      v22 = v6;
      v23 = self;
      v24 = v4;
      -[SKUIReloadConfigurationOperation setOutputBlock:](v10, "setOutputBlock:", v21);
      objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "shouldLog");
      v13 = objc_msgSend(v11, "shouldLogToDisk");
      objc_msgSend(v11, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
        v12 |= 2u;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        v12 &= 2u;
      if (v12)
      {
        v16 = (void *)objc_opt_class();
        v27 = 138412290;
        v28 = v16;
        v17 = v16;
        LODWORD(v20) = 12;
        v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_15:

          v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
          objc_msgSend(v19, "addOperation:", v10);

          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);

          goto LABEL_6;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v27, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        free(v18);
        SSFileLog();
      }

      goto LABEL_15;
    }
  }
  (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
LABEL_6:

}

void __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke_2;
  v12[3] = &unk_1E739FDD8;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v13 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v18);
}

void __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  SKUIClientContext *v2;
  void *v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v2 = -[SKUIClientContext initWithConfigurationDictionary:]([SKUIClientContext alloc], "initWithConfigurationDictionary:", *(_QWORD *)(a1 + 32));
    -[SKUIClientContext clientInterface](v2, "clientInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClientIdentifier:", *(_QWORD *)(a1 + 40));

    -[SKUIClientContext setMetricsPageContext:forViewController:](v2, "setMetricsPageContext:forViewController:", CFSTR("Sheet"), *(_QWORD *)(a1 + 48));
    -[SKUIClientContext _setAdditionalPurchaseParameters:](v2, "_setAdditionalPurchaseParameters:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1112));
    -[SKUIClientContext _setPurchaseAffiliateIdentifier:](v2, "_setPurchaseAffiliateIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1120));
    -[SKUIClientContext _setPurchaseURLBagType:](v2, "_setPurchaseURLBagType:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1288));
    v4 = (void *)WeakRetained[143];
    WeakRetained[143] = v2;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)_loadProductWithRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SKProductPageViewController__loadProductWithRequest___block_invoke;
  v6[3] = &unk_1E739FDB0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SKProductPageViewController _loadClientContextWithCompletionBlock:](self, "_loadClientContextWithCompletionBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __55__SKProductPageViewController__loadProductWithRequest___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)objc_msgSend(WeakRetained, "_newRequestPropertiesWithRequest:", *(_QWORD *)(a1 + 32));

  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v13 = v11;
    else
      v13 = v11 & 2;
    if (v13)
    {
      v14 = objc_loadWeakRetained((id *)(a1 + 40));
      v15 = (void *)objc_opt_class();
      v16 = *(void **)(a1 + 32);
      v17 = v15;
      objc_msgSend(v16, "URL");
      v26 = 138412546;
      v27 = v15;
      v28 = 2112;
      v29 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v26, v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        free(v18);
        SSFileLog();

      }
    }
    else
    {

    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF668]), "initWithRequestProperties:", v8);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__SKProductPageViewController__loadProductWithRequest___block_invoke_97;
    v23[3] = &unk_1E739FE50;
    objc_copyWeak(&v25, v6);
    v24 = v8;
    objc_msgSend(v21, "startWithConnectionResponseBlock:", v23);

    objc_destroyWeak(&v25);
  }
  else
  {
    v20 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v20, "_setResponse:forProperties:error:", 0, v8, v5);

  }
}

void __55__SKProductPageViewController__loadProductWithRequest___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SKProductPageViewController__loadProductWithRequest___block_invoke_2;
  v9[3] = &unk_1E739FE28;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __55__SKProductPageViewController__loadProductWithRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setResponse:forProperties:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_loadRequestForProductParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  _QWORD v33[5];
  id v34;
  _BYTE location[12];
  __int16 v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (-[NSDictionary count](self->_productParameters, "count"))
  {
    if (self->_bannerViewController)
    {
      objc_initWeak((id *)location, self);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke;
      v33[3] = &unk_1E739FDB0;
      objc_copyWeak(&v34, (id *)location);
      v33[4] = self;
      -[SKProductPageViewController _loadClientContextWithCompletionBlock:](self, "_loadClientContextWithCompletionBlock:", v33);
      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DDC1B8], "sharedCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLBagForContext:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v5, "valueForKey:", CFSTR("ix-store-sheet"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (-[SKProductPageViewController productPageStyle](self, "productPageStyle") == 1
           && (objc_msgSend(v6, "objectForKey:", CFSTR("banner-lookup-url")),
               (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
           || (objc_msgSend(v6, "objectForKey:", CFSTR("lookup-url")),
               (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          && (v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7), v7, v8))
        {
          objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "shouldLog");
          if (objc_msgSend(v9, "shouldLogToDisk"))
            v11 = v10 | 2;
          else
            v11 = v10;
          objc_msgSend(v9, "OSLogObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            v11 &= 2u;
          if (v11)
          {
            *(_DWORD *)location = 138412546;
            *(_QWORD *)&location[4] = objc_opt_class();
            v36 = 2112;
            v37 = v8;
            v13 = *(id *)&location[4];
            LODWORD(v28) = 22;
            v14 = (void *)_os_log_send_and_compose_impl();

            if (v14)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, location, v28);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              free(v14);
              SSFileLog();

            }
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKProductPageViewController loadProductWithRequest:](self, "loadProductWithRequest:", v25);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "shouldLog");
          if (objc_msgSend(v16, "shouldLogToDisk"))
            v18 = v17 | 2;
          else
            v18 = v17;
          objc_msgSend(v16, "OSLogObject");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            v18 &= 2u;
          if (v18)
          {
            *(_DWORD *)location = 138412290;
            *(_QWORD *)&location[4] = objc_opt_class();
            v20 = *(id *)&location[4];
            LODWORD(v28) = 12;
            v21 = (void *)_os_log_send_and_compose_impl();

            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, location, v28);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              free(v21);
              SSFileLog();

            }
          }
          else
          {

          }
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v38 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_1E73A9FB0, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD80A8], 5, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKProductPageViewController _failWithError:](self, "_failWithError:", v27);

        }
      }
      else
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC170]), "initWithBagContext:", v3);
        objc_initWeak((id *)location, v6);
        objc_initWeak(&from, self);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_103;
        v29[3] = &unk_1E739FEA0;
        objc_copyWeak(&v30, (id *)location);
        objc_copyWeak(&v31, &from);
        objc_msgSend(v6, "setCompletionBlock:", v29);
        -[SUStorePageViewController setSkLoading:](self->_storePageViewController, "setSkLoading:", 1);
        objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addOperation:", v6);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&from);
        objc_destroyWeak((id *)location);
      }

    }
  }
}

void __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke(uint64_t a1, char a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[142], "setClientContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144));
      v7 = v6[142];
      v8 = v6[154];
      objc_msgSend(*(id *)(a1 + 32), "mainDocumentURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadWithProductParameters:mainDocumentURL:", v8, v9);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_sendDidFailLoadWithError:", v10);
  }

}

void __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_103(uint64_t a1)
{
  id WeakRetained;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_2;
  v4[3] = &unk_1E739FE78;
  v5 = WeakRetained;
  v3 = WeakRetained;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v6);

}

void __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "success"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_loadRequestForProductParameters");

    return;
  }
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)objc_opt_class();
  v8 = *(void **)(a1 + 32);
  v9 = v7;
  objc_msgSend(v8, "error");
  v22 = 138412546;
  v23 = v7;
  v24 = 2112;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v18);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
LABEL_11:

  }
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0CD80A8];
  v20 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_1E73A9FB0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 5, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_failWithError:", v17);

}

- (id)_newRequestPropertiesWithRequest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  id v17;
  id v18;
  NSDictionary *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C8]), "initWithURLRequest:", v17);
  objc_msgSend(v16, "setITunesStoreRequest:", 1);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_productParameters;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_productParameters, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "stringValue");
          v10 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v10;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v18, "setObject:forKey:", v9, v8);

      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  objc_msgSend(v16, "setRequestParameters:", v18);
  v11 = self->_style - 1;
  if (v11 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 == 1)
      v12 = CFSTR("iPad");
    else
      v12 = CFSTR("iPhone");
  }
  else
  {
    v12 = off_1E739FEC0[v11];
  }
  objc_msgSend(v16, "setValue:forRequestParameter:", v12, CFSTR("style"));

  return v16;
}

- (id)_previewOverlay
{
  SUPreviewOverlayViewController *previewOverlay;
  SUPreviewOverlayViewController *v4;
  SUPreviewOverlayViewController *v5;
  SUPreviewOverlayViewController *v6;
  void *v7;

  previewOverlay = self->_previewOverlay;
  if (!previewOverlay)
  {
    v4 = (SUPreviewOverlayViewController *)objc_alloc_init(MEMORY[0x1E0DDC238]);
    v5 = self->_previewOverlay;
    self->_previewOverlay = v4;

    v6 = self->_previewOverlay;
    -[SUViewController clientInterface](self, "clientInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUPreviewOverlayViewController setClientInterface:](v6, "setClientInterface:", v7);

    previewOverlay = self->_previewOverlay;
  }
  return previewOverlay;
}

- (void)_reloadGotoStoreButton
{
  NSURL *nativeURL;
  NSURL *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  SUBarButtonItem *rightBarButtonItem;
  SUBarButtonItem *v10;
  SUBarButtonItem *gotoStoreButtonItem;
  SUBarButtonItem *v12;
  SUBarButtonItem *v13;
  SUBarButtonItem *v14;
  void *v15;
  void *v16;
  SUBarButtonItem *v17;
  SKProductPageViewController *v18;
  SUBarButtonItem *v19;
  SUBarButtonItem *v20;
  SUBarButtonItem *v21;
  SUBarButtonItem *v22;
  SUBarButtonItem *v23;
  SUBarButtonItem *v24;
  SKProductPageViewController *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSURL *v30;

  nativeURL = self->_nativeURL;
  if (nativeURL)
  {
    v4 = nativeURL;
  }
  else
  {
    -[SUStorePageViewController displayedURL](self->_storePageViewController, "displayedURL");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v30 = 0;
      v7 = 0;
      goto LABEL_9;
    }
  }
  v30 = v4;
  UIITunesStoreResolvedURLForHTTPURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("http")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "canOpenURL:", v5);

  }
LABEL_9:
  rightBarButtonItem = self->_rightBarButtonItem;
  if (!rightBarButtonItem)
    rightBarButtonItem = self->_gotoStoreButtonItem;
  v10 = rightBarButtonItem;
  if ((v7 & 1) != 0 && self->_showsStoreButton)
  {
    gotoStoreButtonItem = self->_gotoStoreButtonItem;
    if (!gotoStoreButtonItem)
    {
      v12 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DDC1F0]);
      v13 = self->_gotoStoreButtonItem;
      self->_gotoStoreButtonItem = v12;

      -[SUBarButtonItem setAction:](self->_gotoStoreButtonItem, "setAction:", sel__gotoStoreButtonAction_);
      -[SUBarButtonItem setTarget:](self->_gotoStoreButtonItem, "setTarget:", self);
      v14 = self->_gotoStoreButtonItem;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GOTO_STORE_BUTTON"), &stru_1E73A9FB0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUBarButtonItem setTitle:](v14, "setTitle:", v16);

      gotoStoreButtonItem = self->_gotoStoreButtonItem;
    }
    v17 = gotoStoreButtonItem;
  }
  else
  {
    -[SUBarButtonItem target](self->_gotoStoreButtonItem, "target");
    v18 = (SKProductPageViewController *)objc_claimAutoreleasedReturnValue();

    if (v18 == self)
      -[SUBarButtonItem setTarget:](self->_gotoStoreButtonItem, "setTarget:", 0);
    v19 = self->_gotoStoreButtonItem;
    self->_gotoStoreButtonItem = 0;

    v17 = 0;
  }
  v20 = self->_rightBarButtonItem;
  if (self->_showsRightBarButton)
  {
    if (!v20)
    {
      v21 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DDC1F0]);
      v22 = self->_rightBarButtonItem;
      self->_rightBarButtonItem = v21;

      -[SUBarButtonItem setAction:](self->_rightBarButtonItem, "setAction:", sel__rightBarButtonAction_);
      -[SUBarButtonItem setTarget:](self->_rightBarButtonItem, "setTarget:", self);
      -[SUBarButtonItem setTitle:](self->_rightBarButtonItem, "setTitle:", self->_rightBarButtonTitle);
      v20 = self->_rightBarButtonItem;
    }
    v23 = v20;
    v24 = v17;
    v17 = v23;
  }
  else
  {
    -[SUBarButtonItem target](v20, "target");
    v25 = (SKProductPageViewController *)objc_claimAutoreleasedReturnValue();

    if (v25 == self)
      -[SUBarButtonItem setTarget:](self->_rightBarButtonItem, "setTarget:", 0);
    v24 = self->_rightBarButtonItem;
    self->_rightBarButtonItem = 0;
  }

  -[SUViewController navigationItem](self, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rightBarButtonItems");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v27, "mutableCopy");

  if (v10 != v17 || (objc_msgSend(v28, "containsObject:", v10) & 1) == 0)
  {
    if (!v28 && v17)
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v28 && (v29 = objc_msgSend(v28, "indexOfObjectIdenticalTo:", v10), v29 != 0x7FFFFFFFFFFFFFFFLL))
    {
      if (v17)
        objc_msgSend(v28, "replaceObjectAtIndex:withObject:", v29, v17);
      else
        objc_msgSend(v28, "removeObjectAtIndex:", v29);
    }
    else if (v17)
    {
      objc_msgSend(v28, "addObject:", v17);
    }
    -[SKUIITunesStoreUIPageViewController resetNavigationItem:](self->_storePageViewController, "resetNavigationItem:", v26);
    objc_msgSend(v26, "setRightBarButtonItems:", v28);
  }

}

- (void)_reloadViews
{
  void *bannerViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIITunesStoreUIPageViewController *storePageViewController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  if (-[SKProductPageViewController isViewLoaded](self, "isViewLoaded"))
  {
    bannerViewController = self->_bannerViewController;
    if (bannerViewController)
      goto LABEL_5;
    if (self->_ipadProductPageViewController)
    {
      -[SKUIITunesStoreUIPageViewController view](self->_storePageViewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      -[SKUIIPhoneProductPageViewController view](self->_iphoneProductPageViewController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      bannerViewController = self->_ipadProductPageViewController;
      goto LABEL_5;
    }
    storePageViewController = self->_storePageViewController;
    if (self->_iphoneProductPageViewController)
    {
      -[SKUIITunesStoreUIPageViewController view](storePageViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      -[SKUIIPadProductPageViewController view](self->_ipadProductPageViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[SKUIIPhoneProductPageViewController view](self->_iphoneProductPageViewController, "view");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIViewController _setWishlistButtonHidden:](self->_iphoneProductPageViewController, "_setWishlistButtonHidden:", 1);
      -[SKUIViewController showDefaultNavigationItems](self->_iphoneProductPageViewController, "showDefaultNavigationItems");
      -[SKProductPageViewController _reloadGotoStoreButton](self, "_reloadGotoStoreButton");
      v6 = v15;
      if (v15)
      {
LABEL_6:
        v14 = v6;
        objc_msgSend(v6, "setAutoresizingMask:", 18);
        -[SKProductPageViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bounds");
        objc_msgSend(v14, "setFrame:");

        -[SKProductPageViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", v14);

      }
    }
    else if (storePageViewController)
    {
      objc_msgSend(0, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[SKUIIPadProductPageViewController view](self->_ipadProductPageViewController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");

      bannerViewController = self->_storePageViewController;
LABEL_5:
      objc_msgSend(bannerViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        return;
      goto LABEL_6;
    }
  }
}

- (void)_setResponse:(id)a3 forProperties:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSURL *nativeURL;
  SSMetricsPageEvent *lastPageEvent;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  SSMetricsPageEvent *v19;
  SSMetricsPageEvent *v20;
  id v21;
  void *v22;
  int v23;
  SKUIITunesStoreUIPageViewController *storePageViewController;
  void *v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  nativeURL = self->_nativeURL;
  self->_nativeURL = 0;

  lastPageEvent = self->_lastPageEvent;
  self->_lastPageEvent = 0;

  objc_msgSend(v8, "bodyData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[SSVURLDataConsumer consumer](SKUIProductPageDataConsumer, "consumer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    objc_msgSend(v14, "objectForData:response:error:", v13, 0, &v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v26;

    if (v15)
    {
      objc_msgSend(v8, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPageURL:", v17);

      objc_msgSend(v8, "metricsPageEvent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKProductPageViewController _showProductPage:pageEvent:](self, "_showProductPage:pageEvent:", v15, v18);

      objc_msgSend(v8, "metricsPageEvent");
      v19 = (SSMetricsPageEvent *)objc_claimAutoreleasedReturnValue();
      v20 = self->_lastPageEvent;
      self->_lastPageEvent = v19;

    }
    else
    {
      v21 = (id)-[SKProductPageViewController view](self, "view");
      objc_msgSend(v8, "MIMEType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("text/html"));

      storePageViewController = self->_storePageViewController;
      if (v23)
      {
        objc_msgSend(v9, "URL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUStorePageViewController reloadWithStorePage:ofType:forURL:](storePageViewController, "reloadWithStorePage:ofType:forURL:", v13, 1, v25);

      }
      else
      {
        -[SUStorePageViewController reloadWithURLRequestProperties:](self->_storePageViewController, "reloadWithURLRequestProperties:", v9);
      }
      -[SKProductPageViewController _reloadGotoStoreButton](self, "_reloadGotoStoreButton");
    }

    v10 = v16;
  }
  else
  {
    -[SKProductPageViewController _sendDidFailLoadWithError:](self, "_sendDidFailLoadWithError:", v10);
  }

}

- (void)_sendDidFailLoadWithError:(id)a3
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
    objc_msgSend(v6, "productPage:didFailLoadWithError:", self, v7);

  }
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  -[SKProductPageViewController _previewOverlay](self, "_previewOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addChildViewController:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SKProductPageViewController__showPreviewOverlayAnimated___block_invoke;
  v8[3] = &unk_1E739FD38;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v7, "showInNavigationController:animated:completionBlock:", v6, v3, v8);

}

void __59__SKProductPageViewController__showPreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0DDC2A0], *(_QWORD *)(a1 + 32));

}

- (void)_showProductPage:(id)a3 pageEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *nativeURL;
  int64_t style;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __objc2_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *promptString;
  id WeakRetained;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "productPageURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v10);
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  nativeURL = self->_nativeURL;
  self->_nativeURL = v11;

  style = self->_style;
  if (style == 3
    || !style
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "userInterfaceIdiom"),
        v14,
        v15 == 1))
  {
    -[SKUIClientContext setUserInterfaceIdiomOverride:](self->_clientContext, "setUserInterfaceIdiomOverride:", 1);
    v16 = 1184;
    -[SKUIIPadProductPageViewController removeFromParentViewController](self->_ipadProductPageViewController, "removeFromParentViewController");
    v17 = SKUIIPadProductPageViewController;
  }
  else
  {
    -[SKUIClientContext setUserInterfaceIdiomOverride:](self->_clientContext, "setUserInterfaceIdiomOverride:", 0);
    v16 = 1192;
    -[SKUIIPhoneProductPageViewController removeFromParentViewController](self->_iphoneProductPageViewController, "removeFromParentViewController");
    v17 = SKUIIPhoneProductPageViewController;
  }
  v18 = (objc_class *)objc_msgSend([v17 alloc], "initWithProductPage:", v6);
  v19 = *(Class *)((char *)&self->super.super.super.super.isa + v16);
  *(Class *)((char *)&self->super.super.super.super.isa + v16) = v18;

  v20 = *(Class *)((char *)&self->super.super.super.super.isa + v16);
  -[SUViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setExistingNavigationItem:", v21);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "setClientContext:", self->_clientContext);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "setDelegate:", self);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "configureMetricsWithPageEvent:", v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "setAskPermission:", self->_askToBuy);
  if (self->_askToBuy)
    promptString = self->_promptString;
  else
    promptString = 0;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "setBannerText:", promptString);
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v16))
  {
    -[SKProductPageViewController _reloadViews](self, "_reloadViews");
    -[SKProductPageViewController _reloadGotoStoreButton](self, "_reloadGotoStoreButton");
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CD80A8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_1E73A9FB0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 5, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProductPageViewController _sendDidFailLoadWithError:](self, "_sendDidFailLoadWithError:", v30);

    goto LABEL_13;
  }
  -[SKProductPageViewController addChildViewController:](self, "addChildViewController:");
  -[SKProductPageViewController _reloadViews](self, "_reloadViews");
  -[SKProductPageViewController _reloadGotoStoreButton](self, "_reloadGotoStoreButton");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "productPageDidFinishLoad:", self);
LABEL_13:

  }
}

- (NSString)additionalPurchaseParameters
{
  return self->_additionalPurchaseParameters;
}

- (NSString)affiliateIdentifier
{
  return self->_affiliateIdentifier;
}

- (SKProductPageViewControllerDelegate)delegate
{
  return (SKProductPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)productPageStyle
{
  return self->_style;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (void)setRightBarButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (void)setPreview:(BOOL)a3
{
  self->_preview = a3;
}

- (BOOL)showsRightBarButton
{
  return self->_showsRightBarButton;
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  self->_showsRightBarButton = a3;
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (void)setShowsStoreButton:(BOOL)a3
{
  self->_showsStoreButton = a3;
}

- (int64_t)URLBagType
{
  return self->_urlBagType;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setMainDocumentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_storePageViewController, 0);
  objc_storeStrong((id *)&self->_promptString, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
  objc_storeStrong((id *)&self->_previewOverlay, 0);
  objc_storeStrong((id *)&self->_nativeURL, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_itemStateCenter, 0);
  objc_storeStrong((id *)&self->_iphoneProductPageViewController, 0);
  objc_storeStrong((id *)&self->_ipadProductPageViewController, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_gotoStoreButtonItem, 0);
  objc_storeStrong((id *)&self->_dialogManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalPurchaseParameters, 0);
}

- (void)_initSKProductPageViewController
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKProductPageViewController _initSKProductPageViewController]";
}

@end
