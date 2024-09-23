@implementation SULegacyClientBridge

- (SULegacyClientBridge)initWithClientInterface:(id)a3
{
  id v5;
  SULegacyClientBridge *v6;
  SULegacyClientBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SULegacyClientBridge;
  v6 = -[SULegacyClientBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientInterface, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SUOverlayBackgroundViewController setDelegate:](self->_overlayBackgroundViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SULegacyClientBridge;
  -[SULegacyClientBridge dealloc](&v3, sel_dealloc);
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  objc_msgSend(v8, "setKeyboardVisible:", 1);
  objc_msgSend(v8, "setMailComposeDelegate:", self);
  objc_msgSend(v8, "setSubject:", v7);

  objc_msgSend(v8, "setMessageBody:isHTML:", v6, 1);
  -[UITabBarController presentViewController:animated:completion:](self->_rootViewController, "presentViewController:animated:completion:", v8, 1, 0);

}

- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__SULegacyClientBridge_composeReviewWithViewController_animated___block_invoke;
  v8[3] = &unk_24DE7DD88;
  objc_copyWeak(&v10, &location);
  v6 = v5;
  v9 = v6;
  objc_msgSend(v6, "prepareWithCompletionBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return 1;
}

void __65__SULegacyClientBridge_composeReviewWithViewController_animated___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

  }
}

- (void)dismissOverlayBackgroundViewController
{
  -[SUOverlayBackgroundViewController dismissAnimated:](self->_overlayBackgroundViewController, "dismissAnimated:", 1);
}

- (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SUNavigationController *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v6);
  objc_msgSend(v6, "clientInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUNavigationController setClientInterface:](v7, "setClientInterface:", v8);
  -[SUNavigationController setNavigationBarHidden:](v7, "setNavigationBarHidden:", 1);
  -[SUNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  -[UITabBarController presentViewController:animated:completion:](self->_rootViewController, "presentViewController:animated:completion:", v7, v4, 0);

  return 1;
}

- (void)hidePreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  SUPreviewOverlayViewController *previewOverlayViewController;
  _QWORD v9[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    -[SUPreviewOverlayViewController hideInViewController:animated:completionBlock:](self->_previewOverlayViewController, "hideInViewController:animated:completionBlock:", self->_rootViewController, v3, 0);
  }
  else
  {
    -[UITabBarController selectedViewController](self->_rootViewController, "selectedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      previewOverlayViewController = self->_previewOverlayViewController;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __51__SULegacyClientBridge_hidePreviewOverlayAnimated___block_invoke;
      v9[3] = &unk_24DE7B230;
      v9[4] = self;
      -[SUPreviewOverlayViewController hideInNavigationController:animated:completionBlock:](previewOverlayViewController, "hideInNavigationController:animated:completionBlock:", v7, v3, v9);
    }
    else
    {
      -[SULegacyClientBridge _removePreviewOverlayViewController](self, "_removePreviewOverlayViewController");
    }

  }
}

uint64_t __51__SULegacyClientBridge_hidePreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePreviewOverlayViewController");
}

- (BOOL)performActionForDialog:(id)a3 button:(id)a4
{
  return 0;
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (self->_overlayBackgroundViewController || !self->_rootViewController)
  {
    v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_overlayBackgroundViewController, a3);
    -[SUOverlayBackgroundViewController setDelegate:](self->_overlayBackgroundViewController, "setDelegate:", self);
    -[UITabBarController addChildViewController:](self->_rootViewController, "addChildViewController:", self->_overlayBackgroundViewController);
    -[UITabBarController view](self->_rootViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUOverlayBackgroundViewController view](self->_overlayBackgroundViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(v7, "addSubview:", v8);

    v6 = 1;
  }

  return v6;
}

- (void)showPreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  id location;

  v3 = a3;
  -[SULegacyClientBridge _previewOverlayViewController](self, "_previewOverlayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isViewLoaded")
    || (objc_msgSend(v5, "view"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "window"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    if (objc_msgSend(v5, "isContentLoaded"))
    {
      -[SULegacyClientBridge _showPreviewOverlayAnimated:](self, "_showPreviewOverlayAnimated:", v3);
    }
    else if ((objc_msgSend(v5, "isSkLoading") & 1) == 0)
    {
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __51__SULegacyClientBridge_showPreviewOverlayAnimated___block_invoke;
      v8[3] = &unk_24DE7DDB0;
      objc_copyWeak(&v9, &location);
      v10 = v3;
      objc_msgSend(v5, "loadWithCompletionBlock:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }

}

void __51__SULegacyClientBridge_showPreviewOverlayAnimated___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_showPreviewOverlayAnimated:", *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", 0);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)scriptOverlayBackgroundDidDismiss:(id)a3
{
  void *v4;
  SUOverlayBackgroundViewController *overlayBackgroundViewController;

  if (-[SUOverlayBackgroundViewController isViewLoaded](self->_overlayBackgroundViewController, "isViewLoaded", a3))
  {
    -[SUOverlayBackgroundViewController view](self->_overlayBackgroundViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  -[SUOverlayBackgroundViewController removeFromParentViewController](self->_overlayBackgroundViewController, "removeFromParentViewController");
  -[SUOverlayBackgroundViewController setDelegate:](self->_overlayBackgroundViewController, "setDelegate:", 0);
  overlayBackgroundViewController = self->_overlayBackgroundViewController;
  self->_overlayBackgroundViewController = 0;

}

- (id)_previewOverlayViewController
{
  SUPreviewOverlayViewController *previewOverlayViewController;
  SUPreviewOverlayViewController *v4;
  SUPreviewOverlayViewController *v5;
  SUPreviewOverlayViewController *v6;
  void *v7;

  previewOverlayViewController = self->_previewOverlayViewController;
  if (!previewOverlayViewController)
  {
    v4 = objc_alloc_init(SUPreviewOverlayViewController);
    v5 = self->_previewOverlayViewController;
    self->_previewOverlayViewController = v4;

    v6 = self->_previewOverlayViewController;
    -[SULegacyClientBridge clientInterface](self, "clientInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUViewController setClientInterface:](v6, "setClientInterface:", v7);

    previewOverlayViewController = self->_previewOverlayViewController;
  }
  return previewOverlayViewController;
}

- (void)_removePreviewOverlayViewController
{
  void *v3;
  SUPreviewOverlayViewController *previewOverlayViewController;

  if (-[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))
  {
    -[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
  previewOverlayViewController = self->_previewOverlayViewController;
  if (previewOverlayViewController)
    -[SUPreviewOverlayViewController removeFromParentViewController](previewOverlayViewController, "removeFromParentViewController");
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  SULegacyClientBridge *v11;

  v3 = a3;
  -[SULegacyClientBridge _previewOverlayViewController](self, "_previewOverlayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1)
  {
    objc_msgSend(v5, "showInViewController:animated:completionBlock:", self->_rootViewController, v3, 0);
  }
  else
  {
    -[UITabBarController selectedViewController](self->_rootViewController, "selectedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __52__SULegacyClientBridge__showPreviewOverlayAnimated___block_invoke;
      v9[3] = &unk_24DE7B0F0;
      v10 = v5;
      v11 = self;
      objc_msgSend(v10, "showInNavigationController:animated:completionBlock:", v8, v3, v9);

    }
  }

}

void __52__SULegacyClientBridge__showPreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromView:", v11, v3, v5, v7, v9);
  objc_msgSend(v12, "setFrame:");

  objc_msgSend(v10, "addSubview:", v12);
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (SUOverlayBackgroundViewController)overlayBackgroundViewController
{
  return self->_overlayBackgroundViewController;
}

- (UITabBarController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_previewOverlayViewController, 0);
  objc_storeStrong((id *)&self->_overlayBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end
