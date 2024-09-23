@implementation SKUIProductPageOverlayController

- (SKUIProductPageOverlayController)initWithParentViewController:(id)a3
{
  id v4;
  SKUIProductPageOverlayController *v5;
  SKUIProductPageOverlayController *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageOverlayController initWithParentViewController:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIProductPageOverlayController;
  v5 = -[SKUIProductPageOverlayController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parentViewController, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_overlayViewController)
    -[SKUIProductPageOverlayController _removeOverlayViewController](self, "_removeOverlayViewController");
  v3.receiver = self;
  v3.super_class = (Class)SKUIProductPageOverlayController;
  -[SKUIProductPageOverlayController dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfVisibleOverlays
{
  void *v2;
  int64_t v3;

  -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)showWithInitialItem:(id)a3
{
  SKUIItem *v4;
  SKUIItem *initialItem;
  SKUIIPadProductPageViewController *v6;

  v4 = (SKUIItem *)a3;
  v6 = -[SKUIIPadProductPageViewController initWithItem:]([SKUIIPadProductPageViewController alloc], "initWithItem:", v4);
  initialItem = self->_initialItem;
  self->_initialItem = v4;

  -[SKUIProductPageOverlayController _showWithInitialViewController:](self, "_showWithInitialViewController:", v6);
}

- (void)showWithInitialItemIdentifier:(int64_t)a3
{
  SKUIIPadProductPageViewController *v4;

  v4 = -[SKUIIPadProductPageViewController initWithItemIdentifier:]([SKUIIPadProductPageViewController alloc], "initWithItemIdentifier:", a3);
  -[SKUIProductPageOverlayController _showWithInitialViewController:](self, "_showWithInitialViewController:", v4);

}

- (void)showWithInitialProductPage:(id)a3 metricsPageEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SKUIIPadProductPageViewController *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[SKUIIPadProductPageViewController initWithProductPage:]([SKUIIPadProductPageViewController alloc], "initWithProductPage:", v7);

  -[SKUIProductPageOverlayController clientContext](self, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIIPadProductPageViewController setClientContext:](v9, "setClientContext:", v8);

  -[SKUIIPadProductPageViewController configureMetricsWithPageEvent:](v9, "configureMetricsWithPageEvent:", v6);
  -[SKUIProductPageOverlayController _showWithInitialViewController:](self, "_showWithInitialViewController:", v9);

}

- (void)showWithInitialURL:(id)a3
{
  id v4;
  SKUIIPadProductPageViewController *v5;

  v4 = a3;
  v5 = -[SKUIIPadProductPageViewController initWithURL:]([SKUIIPadProductPageViewController alloc], "initWithURL:", v4);

  -[SKUIProductPageOverlayController _showWithInitialViewController:](self, "_showWithInitialViewController:", v5);
}

- (void)showWithInitialURLRequest:(id)a3
{
  id v4;
  SKUIIPadProductPageViewController *v5;

  v4 = a3;
  v5 = -[SKUIIPadProductPageViewController initWithURLRequest:]([SKUIIPadProductPageViewController alloc], "initWithURLRequest:", v4);

  -[SKUIProductPageOverlayController _showWithInitialViewController:](self, "_showWithInitialViewController:", v5);
}

- (void)showWithInitialURLs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIIPadProductPageViewController *v12;
  SKUIIPadProductPageViewController *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIProductPageOverlayController _showOverlayViewController](self, "_showOverlayViewController");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [SKUIIPadProductPageViewController alloc];
        v13 = -[SKUIIPadProductPageViewController initWithURL:](v12, "initWithURL:", v11, (_QWORD)v15);
        -[SKUIProductPageOverlayController clientContext](self, "clientContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIIPadProductPageViewController setClientContext:](v13, "setClientContext:", v14);

        -[SKUIIPadProductPageViewController setDelegate:](v13, "setDelegate:", self);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[SKUIOverlayContainerViewController showViewControllers:](self->_overlayViewController, "showViewControllers:", v5);
}

- (NSArray)URLs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (UIView)view
{
  return (UIView *)-[SKUIOverlayContainerViewController view](self->_overlayViewController, "view");
}

- (void)iPadProductPage:(id)a3 openItem:(id)a4
{
  id v5;
  void *v6;
  SKUIIPadProductPageViewController *v7;

  v5 = a4;
  v7 = -[SKUIIPadProductPageViewController initWithItem:]([SKUIIPadProductPageViewController alloc], "initWithItem:", v5);

  -[SKUIProductPageOverlayController clientContext](self, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIIPadProductPageViewController setClientContext:](v7, "setClientContext:", v6);

  -[SKUIIPadProductPageViewController setDelegate:](v7, "setDelegate:", self);
  -[SKUIOverlayContainerViewController showViewController:withCompletionBlock:](self->_overlayViewController, "showViewController:withCompletionBlock:", v7, 0);

}

- (void)iPadProductPage:(id)a3 openURL:(id)a4 viewControllerBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SKUIClientContext *clientContext;
  id WeakRetained;
  void *v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  SKUIOverlayFlipTransition *v21;
  SKUIOverlayContainerViewController *overlayViewController;
  id v23;
  SKUIOverlayContainerViewController *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && ((*((void (**)(id))v10 + 2))(v10), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    clientContext = self->_clientContext;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    -[SKUIClientContext metricsPageContextForViewController:](clientContext, "metricsPageContextForViewController:", WeakRetained);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIClientContext setMetricsPageContext:forViewController:](self->_clientContext, "setMetricsPageContext:forViewController:", v16, v13);
    if (self->_initialItem
      && (v17 = objc_loadWeakRetained((id *)&self->_delegate),
          v18 = objc_opt_respondsToSelector(),
          v17,
          (v18 & 1) != 0)
      && (v19 = objc_loadWeakRetained((id *)&self->_delegate),
          objc_msgSend(v19, "productPageOverlay:flipSourceViewToDismissItem:", self, self->_initialItem),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v20))
    {
      v21 = objc_alloc_init(SKUIOverlayFlipTransition);
      -[SKUIOverlayFlipTransition setFlipSourceView:](v21, "setFlipSourceView:", v20);
      overlayViewController = self->_overlayViewController;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __80__SKUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke_2;
      v26[3] = &unk_1E739FD10;
      v26[4] = self;
      v27 = v13;
      v23 = v13;
      -[SKUIOverlayContainerViewController dismissWithFlipTransition:completionBlock:](overlayViewController, "dismissWithFlipTransition:completionBlock:", v21, v26);

    }
    else
    {
      v24 = self->_overlayViewController;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __80__SKUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke;
      v28[3] = &unk_1E739FD10;
      v28[4] = self;
      v29 = v13;
      v25 = v13;
      -[SKUIOverlayContainerViewController dismissWithFadeTransitionCompletionBlock:](v24, "dismissWithFadeTransitionCompletionBlock:", v28);

    }
  }
  else if (v9)
  {
    SKUIMetricsOpenURL(v9);
  }

}

uint64_t __80__SKUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishDismissAndNotifyDelegate:withViewController:", 1, *(_QWORD *)(a1 + 40));
}

uint64_t __80__SKUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishDismissAndNotifyDelegate:withViewController:", 1, *(_QWORD *)(a1 + 40));
}

- (void)iPadProductPageCannotOpen:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "URL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageOverlayController _finishDismissAndNotifyDelegate:withViewController:](self, "_finishDismissAndNotifyDelegate:withViewController:", 0, 0);
  v4 = objc_alloc_init(MEMORY[0x1E0CD8070]);
  objc_msgSend(v4, "loadProductWithURL:completionBlock:", v8, 0);
  objc_msgSend(v4, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)_backstopViewAction:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  SKUIOverlayFlipTransition *v9;
  SKUIOverlayContainerViewController *overlayViewController;
  SKUIOverlayContainerViewController *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  if (self->_initialItem
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0)
    && (v7 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v7, "productPageOverlay:flipSourceViewToDismissItem:", self, self->_initialItem),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    v9 = objc_alloc_init(SKUIOverlayFlipTransition);
    -[SKUIOverlayFlipTransition setFlipSourceView:](v9, "setFlipSourceView:", v8);
    overlayViewController = self->_overlayViewController;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__SKUIProductPageOverlayController__backstopViewAction___block_invoke_2;
    v12[3] = &unk_1E739FD38;
    v12[4] = self;
    -[SKUIOverlayContainerViewController dismissWithFlipTransition:completionBlock:](overlayViewController, "dismissWithFlipTransition:completionBlock:", v9, v12);

  }
  else
  {
    v11 = self->_overlayViewController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__SKUIProductPageOverlayController__backstopViewAction___block_invoke;
    v13[3] = &unk_1E739FD38;
    v13[4] = self;
    -[SKUIOverlayContainerViewController dismissWithFadeTransitionCompletionBlock:](v11, "dismissWithFadeTransitionCompletionBlock:", v13);
  }

}

uint64_t __56__SKUIProductPageOverlayController__backstopViewAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishDismissAndNotifyDelegate:withViewController:", 1, 0);
}

uint64_t __56__SKUIProductPageOverlayController__backstopViewAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishDismissAndNotifyDelegate:withViewController:", 1, 0);
}

- (void)productViewControllerDidFinish:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SKUIProductPageOverlayController _finishDismissAndNotifyDelegate:withViewController:](self, "_finishDismissAndNotifyDelegate:withViewController:", 1, 0);
}

- (void)_finishDismissAndNotifyDelegate:(BOOL)a3 withViewController:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  SKUIOverlayContainerViewController *overlayViewController;
  SKUIItem *initialItem;
  id WeakRetained;
  char v12;
  id v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  v19 = a4;
  if (-[SKUIOverlayContainerViewController isViewLoaded](self->_overlayViewController, "isViewLoaded"))
  {
    -[SKUIOverlayContainerViewController view](self->_overlayViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_32);

  -[SKUIOverlayContainerViewController backstopControl](self->_overlayViewController, "backstopControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIOverlayContainerViewController removeFromParentViewController](self->_overlayViewController, "removeFromParentViewController");
  overlayViewController = self->_overlayViewController;
  self->_overlayViewController = 0;

  initialItem = self->_initialItem;
  self->_initialItem = 0;

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v13, "productPageOverlayDidDismiss:toPresentViewController:", self, v19);
LABEL_10:

      v17 = v19;
      goto LABEL_11;
    }
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "productPageOverlayDidDismiss:", self);

    }
  }
  v17 = v19;
  if (v19)
  {
    v14 = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_msgSend(v14, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pushViewController:animated:", v19, 1);

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __87__SKUIProductPageOverlayController__finishDismissAndNotifyDelegate_withViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (void)_removeOverlayViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SKUIOverlayContainerViewController *overlayViewController;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  if (-[SKUIOverlayContainerViewController isViewLoaded](self->_overlayViewController, "isViewLoaded"))
  {
    -[SKUIOverlayContainerViewController backstopControl](self->_overlayViewController, "backstopControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

    -[SKUIOverlayContainerViewController view](self->_overlayViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

  }
  -[SKUIOverlayContainerViewController removeFromParentViewController](self->_overlayViewController, "removeFromParentViewController");
  overlayViewController = self->_overlayViewController;
  self->_overlayViewController = 0;

}

- (void)_showOverlayViewController
{
  UIViewController **p_parentViewController;
  id WeakRetained;
  SKUIOverlayContainerViewController *v5;
  SKUIOverlayContainerViewController *overlayViewController;
  void *v7;
  SKUIClientContext *clientContext;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  p_parentViewController = &self->_parentViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  SKUIViewControllerGetAncestorTabBarController(WeakRetained);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_overlayViewController)
  {
    v5 = objc_alloc_init(SKUIOverlayContainerViewController);
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = v5;

    objc_msgSend(v21, "addChildViewController:", self->_overlayViewController);
    -[SKUIOverlayContainerViewController backstopControl](self->_overlayViewController, "backstopControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__backstopViewAction_, 64);

    clientContext = self->_clientContext;
    v9 = objc_loadWeakRetained((id *)p_parentViewController);
    -[SKUIClientContext metricsPageContextForViewController:](clientContext, "metricsPageContextForViewController:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIClientContext setMetricsPageContext:forViewController:](self->_clientContext, "setMetricsPageContext:forViewController:", v10, self->_overlayViewController);
  }
  objc_msgSend(v21, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SKUIOverlayContainerViewController view](self->_overlayViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 18);
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  objc_msgSend(v11, "addSubview:", v20);

}

- (void)_showWithInitialViewController:(id)a3
{
  SKUIOverlayFlipTransition *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  SKUIOverlayFlipTransition *v9;
  SKUIOverlayFlipTransition *v10;
  SKUIOverlayContainerViewController *overlayViewController;
  SKUIOverlayFlipTransition *v12;
  SKUIOverlayContainerViewController *v13;
  _QWORD v14[4];
  SKUIOverlayFlipTransition *v15;
  _QWORD v16[4];
  SKUIOverlayFlipTransition *v17;

  v4 = (SKUIOverlayFlipTransition *)a3;
  -[SKUIProductPageOverlayController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOverlayFlipTransition setClientContext:](v4, "setClientContext:", v5);

  -[SKUIOverlayFlipTransition setDelegate:](v4, "setDelegate:", self);
  -[SKUIProductPageOverlayController _showOverlayViewController](self, "_showOverlayViewController");
  if (self->_initialItem
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v7 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v7 & 1) != 0)
    && (v8 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v8, "productPageOverlay:flipSourceViewToPresentItem:", self, self->_initialItem),
        v9 = (SKUIOverlayFlipTransition *)objc_claimAutoreleasedReturnValue(),
        v8,
        v9))
  {
    v10 = objc_alloc_init(SKUIOverlayFlipTransition);
    -[SKUIOverlayFlipTransition setFlipSourceView:](v10, "setFlipSourceView:", v9);
    overlayViewController = self->_overlayViewController;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__SKUIProductPageOverlayController__showWithInitialViewController___block_invoke_2;
    v14[3] = &unk_1E739FD38;
    v15 = v4;
    v12 = v4;
    -[SKUIOverlayContainerViewController showViewController:withFlipTransition:completionBlock:](overlayViewController, "showViewController:withFlipTransition:completionBlock:", v12, v10, v14);

  }
  else
  {
    v13 = self->_overlayViewController;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__SKUIProductPageOverlayController__showWithInitialViewController___block_invoke;
    v16[3] = &unk_1E739FD38;
    v17 = v4;
    v9 = v4;
    -[SKUIOverlayContainerViewController showViewController:withCompletionBlock:](v13, "showViewController:withCompletionBlock:", v9, v16);
    v10 = v17;
  }

}

uint64_t __67__SKUIProductPageOverlayController__showWithInitialViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

uint64_t __67__SKUIProductPageOverlayController__showWithInitialViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIProductPageOverlayDelegate)delegate
{
  return (SKUIProductPageOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_initialItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithParentViewController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageOverlayController initWithParentViewController:]";
}

@end
