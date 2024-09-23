@implementation SUSKUIStorePageViewController

- (SUSKUIStorePageViewController)initWithSection:(id)a3
{
  SUSKUIStorePageViewController *v3;
  SUSKUIStorePageViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSKUIStorePageViewController;
  v3 = -[SUViewController initWithSection:](&v6, sel_initWithSection_, a3);
  v4 = v3;
  if (v3)
    -[SUSKUIStorePageViewController setContainmentSupport:](v3, "setContainmentSupport:", 1);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIIPhoneProductPageViewController setDelegate:](self->_iphoneProductPageViewController, "setDelegate:", 0);

  -[SKStoreProductViewController setDelegate:](self->_remoteProductViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUSKUIStorePageViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && a3)
  {
    v6 = (void *)ISUIMobileStoreUIFramework();
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", ISUIVWeakLinkedStringConstantForString("SUUIProtocolKeyPageType", v6)), "isEqualToString:", CFSTR("software")))-[SUSKUIStorePageViewController _showProductPageWithPageDictionary:](self, "_showProductPageWithPageDictionary:", a3);
    else
      -[SUSKUIStorePageViewController _showStorePageWithPageDictionary:](self, "_showStorePageWithPageDictionary:", a3);
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SKStoreProductViewController *v5;
  _QWORD v6[6];
  BOOL v7;
  objc_super v8;

  v3 = a3;
  if (-[SKStoreProductViewController presentingViewController](self->_remoteProductViewController, "presentingViewController"))
  {
    v5 = self->_remoteProductViewController;
    -[SKStoreProductViewController setDelegate:](self->_remoteProductViewController, "setDelegate:", 0);

    self->_remoteProductViewController = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__SUSKUIStorePageViewController_dismissAnimated___block_invoke;
    v6[3] = &unk_24DE7C310;
    v7 = v3;
    v6[4] = v5;
    v6[5] = self;
    -[SKStoreProductViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", v3, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUSKUIStorePageViewController;
    -[UIViewController dismissAnimated:](&v8, sel_dismissAnimated_, v3);
  }
}

id __49__SUSKUIStorePageViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)SUSKUIStorePageViewController;
  return objc_msgSendSuper2(&v4, sel_dismissAnimated_, v2);
}

- (void)loadView
{
  UIViewController *activeChildViewController;
  UIView *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor"));
  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController)
  {
    v4 = -[UIViewController view](activeChildViewController, "view");
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "bounds");
    -[UIView setFrame:](v4, "setFrame:");
    objc_msgSend(v5, "addSubview:", v4);
  }
  -[SUSKUIStorePageViewController setView:](self, "setView:", v5);

}

- (BOOL)iPhoneProductPage:(id)a3 shouldOpenItem:(id)a4
{
  id v4;
  uint64_t v5;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", objc_msgSend(a4, "productPageURLString"));
  v5 = UIITunesStoreResolvedURLForHTTPURL();
  if (v5)
    v4 = (id)v5;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "openURL:", v4);
  return 0;
}

- (BOOL)iPhoneProductPage:(id)a3 shouldOpenURL:(id)a4
{
  void *v5;

  v5 = (void *)UIITunesStoreResolvedURLForHTTPURL();
  if (v5)
    a4 = v5;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "openURL:", a4);
  return 0;
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  -[SUSKUIStorePageViewController dismissAnimated:](self, "dismissAnimated:", 1, a4);
}

- (void)productViewController:(id)a3 presentProductWithRequest:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;

  if (objc_msgSend(a4, "productURL", a3))
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace"), "URLOverrideForURL:", objc_msgSend(a4, "productURL"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "openURL:", v6);
  }
}

- (void)_loadClientContextWithCompletionBlock:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[6];
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = ISUIMobileStoreUIFramework();
  v5 = ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v4);
  v6 = objc_msgSend(v5, "defaultContext");
  if (v6)
  {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
  }
  else
  {
    v7 = ISUIMobileStoreUIFramework();
    v8 = objc_alloc_init((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIReloadConfigurationOperation"), v7));
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __71__SUSKUIStorePageViewController__loadClientContextWithCompletionBlock___block_invoke;
    v17[3] = &unk_24DE7E420;
    v17[4] = v5;
    v17[5] = a3;
    objc_msgSend(v8, "setOutputBlock:", v17);
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v11 &= 2u;
    if (v11)
    {
      v12 = objc_opt_class();
      v18 = 138412290;
      v19 = v12;
      LODWORD(v16) = 12;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v18, v16);
        free(v14);
        SSFileLog();
      }
    }
    v15 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v15, "addOperation:", v8);

  }
}

void __71__SUSKUIStorePageViewController__loadClientContextWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__SUSKUIStorePageViewController__loadClientContextWithCompletionBlock___block_invoke_2;
  block[3] = &unk_24DE7C820;
  v2 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __71__SUSKUIStorePageViewController__loadClientContextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithConfigurationDictionary:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_setActiveChildViewController:(id)a3
{
  UIViewController *activeChildViewController;
  UIViewController *v6;
  void *v7;
  UIView *v8;

  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController != a3)
  {
    if (-[UIViewController isViewLoaded](activeChildViewController, "isViewLoaded"))
      -[UIView removeFromSuperview](-[UIViewController view](self->_activeChildViewController, "view"), "removeFromSuperview");
    -[UIViewController removeFromParentViewController](self->_activeChildViewController, "removeFromParentViewController");

    v6 = (UIViewController *)a3;
    self->_activeChildViewController = v6;
    if (v6)
    {
      -[SUSKUIStorePageViewController addChildViewController:](self, "addChildViewController:", v6);
      if (-[SUSKUIStorePageViewController isViewLoaded](self, "isViewLoaded"))
      {
        v7 = (void *)-[SUSKUIStorePageViewController view](self, "view");
        v8 = -[UIViewController view](self->_activeChildViewController, "view");
        -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
        objc_msgSend(v7, "bounds");
        -[UIView setFrame:](v8, "setFrame:");
        objc_msgSend(v7, "addSubview:", v8);
      }
    }
  }
}

- (void)_showIPhoneProductPageWithPage:(id)a3 clientContext:(id)a4
{
  uint64_t v7;
  SUUIIPhoneProductPageViewController *v8;

  -[SUUIIPhoneProductPageViewController setDelegate:](self->_iphoneProductPageViewController, "setDelegate:", 0);
  -[SUUIIPhoneProductPageViewController _setExistingNavigationItem:](self->_iphoneProductPageViewController, "_setExistingNavigationItem:", 0);
  -[SUUIIPhoneProductPageViewController removeFromParentViewController](self->_iphoneProductPageViewController, "removeFromParentViewController");

  self->_iphoneProductPageViewController = 0;
  v7 = ISUIMobileStoreUIFramework();
  v8 = (SUUIIPhoneProductPageViewController *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIIPhoneProductPageViewController"), v7)), "initWithProductPage:", a3);
  self->_iphoneProductPageViewController = v8;
  -[SUUIIPhoneProductPageViewController setDelegate:](v8, "setDelegate:", self);
  -[SUUIIPhoneProductPageViewController _setExistingNavigationItem:](self->_iphoneProductPageViewController, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
  -[SUUIIPhoneProductPageViewController setClientContext:](self->_iphoneProductPageViewController, "setClientContext:", a4);
  -[SUSKUIStorePageViewController _setActiveChildViewController:](self, "_setActiveChildViewController:", self->_iphoneProductPageViewController);
}

- (void)_showProductPageWithPageDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  if (_UIApplicationUsesLegacyUI())
  {
    -[SUSKUIStorePageViewController _showRemoteViewControllerWithPageDictionary:](self, "_showRemoteViewControllerWithPageDictionary:", a3);
  }
  else
  {
    v5 = ISUIMobileStoreUIFramework();
    v6 = objc_msgSend((id)objc_msgSend(ISUIWeakLinkedClassForString(CFSTR("SUUIProductPageDataConsumer"), v5), "consumer"), "productPageWithDictionary:", a3);
    if (v6)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __68__SUSKUIStorePageViewController__showProductPageWithPageDictionary___block_invoke;
      v7[3] = &unk_24DE7E448;
      v7[4] = self;
      v7[5] = v6;
      -[SUSKUIStorePageViewController _loadClientContextWithCompletionBlock:](self, "_loadClientContextWithCompletionBlock:", v7);
    }
  }
}

uint64_t __68__SUSKUIStorePageViewController__showProductPageWithPageDictionary___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_showIPhoneProductPageWithPage:clientContext:", *(_QWORD *)(result + 40), a2);
  return result;
}

- (void)_showRemoteViewControllerWithPageDictionary:(id)a3
{
  SKStoreProductViewController *v5;
  SKStoreProductViewController *remoteProductViewController;
  _QWORD v7[5];

  -[SKStoreProductViewController setDelegate:](self->_remoteProductViewController, "setDelegate:", 0);
  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self->_remoteProductViewController, "dismissViewControllerAnimated:completion:", 0, 0);

  self->_remoteProductViewController = 0;
  v5 = (SKStoreProductViewController *)objc_alloc_init((Class)ISWeakLinkedClassForString());
  self->_remoteProductViewController = v5;
  -[SKStoreProductViewController setDelegate:](v5, "setDelegate:", self);
  remoteProductViewController = self->_remoteProductViewController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__SUSKUIStorePageViewController__showRemoteViewControllerWithPageDictionary___block_invoke;
  v7[3] = &unk_24DE7E470;
  v7[4] = self;
  -[SKStoreProductViewController loadProductWithPageDictionary:completionBlock:](remoteProductViewController, "loadProductWithPageDictionary:completionBlock:", a3, v7);
}

_QWORD *__77__SUSKUIStorePageViewController__showRemoteViewControllerWithPageDictionary___block_invoke(uint64_t a1, int a2)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  if (result)
  {
    if (a2 && (v3 = result[141]) != 0)
      return (_QWORD *)objc_msgSend(result, "presentViewController:animated:completion:", v3, 1, 0);
    else
      return (_QWORD *)objc_msgSend(result, "dismissAnimated:", 1);
  }
  return result;
}

- (void)_showStorePageWithPageDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v5 = ISUIMobileStoreUIFramework();
  v6 = objc_msgSend((id)objc_msgSend(ISUIWeakLinkedClassForString(CFSTR("SUUIStorePageDataConsumer"), v5), "consumer"), "storePageWithDictionary:response:", a3, 0);
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__SUSKUIStorePageViewController__showStorePageWithPageDictionary___block_invoke;
    v7[3] = &unk_24DE7E448;
    v7[4] = self;
    v7[5] = v6;
    -[SUSKUIStorePageViewController _loadClientContextWithCompletionBlock:](self, "_loadClientContextWithCompletionBlock:", v7);
  }
}

uint64_t __66__SUSKUIStorePageViewController__showStorePageWithPageDictionary___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;

  if (a2)
  {
    v2 = result;
    v3 = *(void **)(*(_QWORD *)(result + 32) + 1136);
    if (!v3)
    {
      v5 = ISUIMobileStoreUIFramework();
      *(_QWORD *)(*(_QWORD *)(v2 + 32) + 1136) = objc_alloc_init((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIStorePageViewController"), v5));
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1136), "setClientContext:", a2);
      v3 = *(void **)(*(_QWORD *)(v2 + 32) + 1136);
    }
    objc_msgSend(v3, "setStorePage:", *(_QWORD *)(v2 + 40));
    return objc_msgSend(*(id *)(v2 + 32), "_setActiveChildViewController:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 1136));
  }
  return result;
}

@end
