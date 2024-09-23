@implementation SKUIRedeemViewController

- (SKUIRedeemViewController)initWithRedeemCategory:(int64_t)a3
{
  id v5;
  SKUIRedeemViewController *v6;
  objc_super v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRedeemViewController initWithRedeemCategory:].cold.1();
  }
  v5 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemViewController;
  v6 = -[SKUIRedeemViewController initWithRootViewController:](&v8, sel_initWithRootViewController_, v5);

  if (v6)
  {
    v6->_category = a3;
    -[SKUIRedeemViewController _setup](v6, "_setup");
  }
  return v6;
}

+ (BOOL)redeemRequiresNationalId:(id)a3
{
  return +[SKUIRedeemViewControllerLegacy redeemRequiresNationalId:](SKUIRedeemViewControllerLegacy, "redeemRequiresNationalId:", a3);
}

- (void)_setup
{
  -[SKUIRedeemViewController setShouldPerformInitialOperationOnAppear:](self, "setShouldPerformInitialOperationOnAppear:", 1);
  -[SKUIRedeemViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[SKUIRedeemViewController _setupNavigationItem](self, "_setupNavigationItem");
}

- (void)_setupNavigationItem
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonAction);
  -[SKUIRedeemViewController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v5);

}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIRedeemViewController;
  -[SKUIRedeemViewController loadView](&v5, sel_loadView);
  -[SKUIRedeemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewDidLoad
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIRedeemViewController;
  -[SKUIRedeemViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SKUIRedeemViewController _startActivityIndicator](self, "_startActivityIndicator");
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__SKUIRedeemViewController_viewDidLoad__block_invoke;
  v3[3] = &unk_1E73A39D8;
  objc_copyWeak(&v4, &location);
  -[SKUIRedeemViewController _redeemURLWithCompletion:](self, "_redeemURLWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __39__SKUIRedeemViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SKUIRedeemViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __39__SKUIRedeemViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stopActivityIndicator");
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(WeakRetained, "_presentModernRedeemWithURL:");
  else
    objc_msgSend(WeakRetained, "_presentLegacyRedeem");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIRedeemViewController;
  -[SKUIRedeemViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[SKUIRedeemViewController activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  objc_msgSend(v3, "setCenter:");

}

- (void)_presentLegacyRedeem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIRedeemViewControllerLegacy *v8;

  -[SKUIRedeemViewController _stopActivityIndicator](self, "_stopActivityIndicator");
  v8 = -[SKUIRedeemViewControllerLegacy initWithRedeemCategory:]([SKUIRedeemViewControllerLegacy alloc], "initWithRedeemCategory:", -[SKUIRedeemViewController category](self, "category"));
  -[SKUIRedeemViewControllerLegacy setAttempsAutomaticRedeem:](v8, "setAttempsAutomaticRedeem:", -[SKUIRedeemViewController attempsAutomaticRedeem](self, "attempsAutomaticRedeem"));
  -[SKUIRedeemViewController cameraDelegate](self, "cameraDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewControllerLegacy setCameraDelegate:](v8, "setCameraDelegate:", v3);

  -[SKUIRedeemViewController initialCode](self, "initialCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewControllerLegacy setInitialCode:](v8, "setInitialCode:", v4);

  -[SKUIRedeemViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewControllerLegacy setClientContext:](v8, "setClientContext:", v5);

  -[SKUIRedeemViewControllerLegacy setCameraRedeemVisible:](v8, "setCameraRedeemVisible:", -[SKUIRedeemViewController cameraRedeemVisible](self, "cameraRedeemVisible"));
  -[SKUIRedeemViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewControllerLegacy setOperationQueue:](v8, "setOperationQueue:", v6);

  -[SKUIRedeemViewController redeemConfiguration](self, "redeemConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewControllerLegacy setRedeemConfiguration:](v8, "setRedeemConfiguration:", v7);

  -[SKUIRedeemViewControllerLegacy setShouldPerformInitialOperationOnAppear:](v8, "setShouldPerformInitialOperationOnAppear:", -[SKUIRedeemViewController shouldPerformInitialOperationOnAppear](self, "shouldPerformInitialOperationOnAppear"));
  -[SKUIRedeemViewController _setChildViewController:](self, "_setChildViewController:", v8);

}

- (void)_presentModernRedeemWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
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
  dispatch_time_t v19;
  _QWORD block[5];

  v4 = a3;
  -[SKUIRedeemViewController initialCode](self, "initialCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SKUIRedeemViewController initialCode](self, "initialCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingQueryParameter:value:", CFSTR("code"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC1E0]), "initWithExternalAccountURL:", v4);
  -[SKUIRedeemViewController clientInterface](self, "clientInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v8, "setClientInterface:", v9);
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_storeStrong((id *)&self->_embeddedViewController, v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC218]), "initWithChildViewController:", v8);
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  -[SKUIRedeemViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SKUIRedeemViewController _setChildViewController:](self, "_setChildViewController:", v12);
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v12);
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    -[SKUIRedeemViewController _setChildViewController:](self, "_setChildViewController:", v16);
  }
  v19 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SKUIRedeemViewController__presentModernRedeemWithURL___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_after(v19, MEMORY[0x1E0C80D38], block);

}

void __56__SKUIRedeemViewController__presentModernRedeemWithURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1410))
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel__cancelButtonAction);
    objc_msgSend(v4, "setTag:", 999);
    objc_msgSend(*(id *)(a1 + 32), "embeddedViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftBarButtonItem:animated:", v4, 1);

  }
}

- (void)_redeemURLWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC170]), "initWithBagContext:", v4);
  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SKUIRedeemViewController__redeemURLWithCompletion___block_invoke;
  v8[3] = &unk_1E73A3A00;
  v6 = v3;
  v9 = v6;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setCompletionBlock:", v8);
  objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __53__SKUIRedeemViewController__redeemURLWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0C99E98];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "URLBag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("redeemCodeLanding"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);

  }
}

- (void)_cancelButtonAction
{
  -[SKUIRedeemViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)clientInterfaceDidFinishLoading:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_finishedLoading = 1;
  -[SKUIRedeemViewController embeddedViewController](self, "embeddedViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "leftBarButtonItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "tag") == 999)
        {
          objc_msgSend(v4, "leftBarButtonItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v13, "removeObjectAtIndex:", v8 + v10);
          objc_msgSend(v4, "setLeftBarButtonItems:animated:", v13, 1);

          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_setChildViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SKUIRedeemViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
  objc_msgSend(v9, "willMoveToParentViewController:", self);
  objc_msgSend(v9, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v9, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[SKUIRedeemViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[SKUIRedeemViewController addChildViewController:](self, "addChildViewController:", v9);
  objc_msgSend(v9, "didMoveToParentViewController:", self);

}

- (void)_startActivityIndicator
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
  objc_msgSend(v4, "startAnimating");
  -[SKUIRedeemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[SKUIRedeemViewController setActivityIndicator:](self, "setActivityIndicator:", v4);
}

- (void)_stopActivityIndicator
{
  id v3;

  -[SKUIRedeemViewController activityIndicator](self, "activityIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");
  objc_msgSend(v3, "removeFromSuperview");
  -[SKUIRedeemViewController setActivityIndicator:](self, "setActivityIndicator:", 0);

}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)attempsAutomaticRedeem
{
  return self->_attempsAutomaticRedeem;
}

- (void)setAttempsAutomaticRedeem:(BOOL)a3
{
  self->_attempsAutomaticRedeem = a3;
}

- (SKUIRedeemViewCameraOverrideDelegate)cameraDelegate
{
  return (SKUIRedeemViewCameraOverrideDelegate *)objc_loadWeakRetained((id *)&self->_cameraDelegate);
}

- (void)setCameraDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cameraDelegate, a3);
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
  objc_storeStrong((id *)&self->_clientInterface, a3);
}

- (BOOL)cameraRedeemVisible
{
  return self->_cameraRedeemVisible;
}

- (void)setCameraRedeemVisible:(BOOL)a3
{
  self->_cameraRedeemVisible = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIViewController)embeddedViewController
{
  return self->_embeddedViewController;
}

- (void)setEmbeddedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedViewController, a3);
}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (void)setFinishedLoading:(BOOL)a3
{
  self->_finishedLoading = a3;
}

- (SKUIRedeemConfiguration)redeemConfiguration
{
  return self->_redeemConfiguration;
}

- (void)setRedeemConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_redeemConfiguration, a3);
}

- (BOOL)shouldPerformInitialOperationOnAppear
{
  return self->_shouldPerformInitialOperationOnAppear;
}

- (void)setShouldPerformInitialOperationOnAppear:(BOOL)a3
{
  self->_shouldPerformInitialOperationOnAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_destroyWeak((id *)&self->_cameraDelegate);
}

- (void)initWithRedeemCategory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemViewController initWithRedeemCategory:]";
}

@end
