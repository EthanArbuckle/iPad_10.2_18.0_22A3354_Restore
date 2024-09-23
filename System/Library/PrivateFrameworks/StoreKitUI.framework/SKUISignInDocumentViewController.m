@implementation SKUISignInDocumentViewController

- (SKUISignInDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SKUISignInDocumentViewController *v6;
  SKUISignInDocumentViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISignInDocumentViewController initWithTemplateElement:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUISignInDocumentViewController;
  v6 = -[SKUISignInDocumentViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);
  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", 0);
  -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUISignInDocumentViewController;
  -[SKUIViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SKUISignInTemplateView *v3;
  SKUISignInTemplateView *loginView;
  SKUISignInTemplateView *v5;
  void *v6;
  UIScrollView *scrollView;
  UIScrollView *v8;
  UIScrollView *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  if (!self->_loginView)
  {
    v3 = objc_alloc_init(SKUISignInTemplateView);
    loginView = self->_loginView;
    self->_loginView = v3;

    -[SKUISignInTemplateView setDelegate:](self->_loginView, "setDelegate:", self);
    v5 = self->_loginView;
    -[SKUISignInDocumentViewController _backgroundColor](self, "_backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewReuseView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[SKUISignInTemplateView setPreservesSuperviewLayoutMargins:](self->_loginView, "setPreservesSuperviewLayoutMargins:", 1);
  }
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v8 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    v9 = self->_scrollView;
    self->_scrollView = v8;

    -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 0);
    -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 0);
    -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_scrollView, "setPreservesSuperviewLayoutMargins:", 1);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_loginView);
    scrollView = self->_scrollView;
  }
  objc_msgSend(v10, "addSubview:", scrollView);
  -[SKUISignInDocumentViewController setView:](self, "setView:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  objc_super v7;

  v3 = a3;
  -[SKUISignInDocumentViewController _layoutScrollView](self, "_layoutScrollView");
  if (self->_loginView)
  {
    -[UIScrollView bounds](self->_scrollView, "bounds");
    -[SKUISignInDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUISignInDocumentViewController;
  -[SKUIViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUISignInTemplateView resignFirstResponder](self->_loginView, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SKUISignInDocumentViewController;
  -[SKUISignInDocumentViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  -[SKUISignInDocumentViewController _layoutScrollView](self, "_layoutScrollView");
  if (self->_loginView)
    -[SKUISignInDocumentViewController _reloadContentSize](self, "_reloadContentSize");
  v3.receiver = self;
  v3.super_class = (Class)SKUISignInDocumentViewController;
  -[SKUISignInDocumentViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SKUISignInDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", width, height);
  v8.receiver = self;
  v8.super_class = (Class)SKUISignInDocumentViewController;
  -[SKUISignInDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  SKUISignInTemplateView *loginView;
  id v7;
  id v8;
  id v9;

  loginView = self->_loginView;
  v7 = a4;
  v8 = a3;
  -[SKUISignInDocumentViewController _layoutContext](self, "_layoutContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUISignInTemplateView setImage:forArtworkRequest:context:](loginView, "setImage:forArtworkRequest:context:", v7, v8, v9);

}

- (void)documentDidUpdate:(id)a3
{
  SKUISignInTemplateViewElement *v4;
  SKUISignInTemplateViewElement *templateElement;
  SKUISignInTemplateView *loginView;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a3, "templateElement");
  v4 = (SKUISignInTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  loginView = self->_loginView;
  if (loginView)
  {
    -[SKUISignInDocumentViewController _backgroundColor](self, "_backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewReuseView setBackgroundColor:](loginView, "setBackgroundColor:", v7);

    -[UIScrollView bounds](self->_scrollView, "bounds");
    -[SKUISignInDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v8, v9);
  }
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  SKUISignInTemplateView *loginView;
  SKUISignInTemplateViewElement *templateElement;
  double v6;
  double v7;
  id v8;

  loginView = self->_loginView;
  templateElement = self->_templateElement;
  -[UIScrollView bounds](self->_scrollView, "bounds", a3);
  v7 = v6;
  -[SKUISignInDocumentViewController _layoutContext](self, "_layoutContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUISignInTemplateView reloadWithViewElement:width:context:](loginView, "reloadWithViewElement:width:context:", templateElement, v8, v7);

}

- (void)signInEntryComplete:(id)a3 accountName:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v12 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  objc_msgSend(v12, "setServiceType:", 2);
  objc_msgSend(v12, "setUsername:", v9);
  objc_msgSend(v12, "_setPassword:", v10);
  objc_msgSend(v12, "setIsUsernameEditable:", 0);
  objc_msgSend(v12, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v12, "setPresentingViewController:", self);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke;
  v14[3] = &unk_1E73A2EB8;
  objc_copyWeak(&v16, &location);
  v13 = v9;
  v15 = v13;
  objc_msgSend(v11, "authenticateWithContext:completion:", v12, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_5;
    v7[3] = &unk_1E73A1D50;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v8 = *(id *)(a1 + 32);
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_2;
    block[3] = &unk_1E73A2050;
    v12 = v5;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13 = *(id *)(a1 + 32);
    dispatch_sync(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v14);
  }

}

void __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DAF5C0], "contextForSignIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectForKey:", *MEMORY[0x1E0CFFFC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccountName:", v3);

  objc_msgSend(a1[4], "objectForKey:", *MEMORY[0x1E0CFFFA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInitialPassword:", v4);

  objc_msgSend(a1[4], "objectForKey:", *MEMORY[0x1E0CFFF40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAltDSID:", v5);

  objc_msgSend(v2, "setAllowsRetry:", 0);
  objc_msgSend(v2, "setCanSetActiveAccount:", 1);
  objc_msgSend(v2, "setPromptStyle:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF488]), "initWithAuthenticationContext:", v2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_3;
  v7[3] = &unk_1E73A2E90;
  objc_copyWeak(&v9, a1 + 6);
  v8 = a1[5];
  objc_msgSend(v6, "startWithAuthenticateResponseBlock:", v7);

  objc_destroyWeak(&v9);
}

void __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_4;
  v9[3] = &unk_1E73A2E68;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (!v2)
      return;
    goto LABEL_5;
  }
  if (v2)
  {
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_signInFailed:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "authenticatedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_signInSuccess:", v3);

LABEL_6:
}

void __77__SKUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_signInFailed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SKUISignInDocumentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;

    -[SKUISignInDocumentViewController _layoutScrollView](self, "_layoutScrollView");
    -[SKUISignInDocumentViewController _reloadContentSize](self, "_reloadContentSize");
  }

}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SKUISignInDocumentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;

    -[SKUISignInDocumentViewController _layoutScrollView](self, "_layoutScrollView");
    -[SKUISignInDocumentViewController _reloadContentSize](self, "_reloadContentSize");
  }

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  CGSize v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_keyboardFrame.size = v5;
    -[SKUISignInDocumentViewController _layoutScrollView](self, "_layoutScrollView");
    -[SKUISignInDocumentViewController _reloadContentSize](self, "_reloadContentSize");
  }

}

- (id)_backgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SKUISignInTemplateViewElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_layoutContext
{
  SKUIViewElementLayoutContext *layoutContext;
  SKUIViewElementLayoutContext *v4;
  SKUIViewElementLayoutContext *v5;
  SKUIViewElementLayoutContext *v6;
  void *v7;
  SKUILayoutCache *v8;
  SKUILayoutCache *textLayoutCache;
  SKUIViewElementTextLayoutCache *v10;
  SKUIResourceLoader *v11;
  void *v12;
  void *v13;
  SKUIResourceLoader *v14;

  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    v5 = self->_layoutContext;
    self->_layoutContext = v4;

    -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_layoutContext;
    -[SKUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_layoutContext, "setContainerViewElementType:", -[SKUISignInTemplateViewElement elementType](self->_templateElement, "elementType"));
    -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", self);
    v8 = objc_alloc_init(SKUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", self);
    v10 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:]([SKUIViewElementTextLayoutCache alloc], "initWithLayoutCache:", self->_textLayoutCache);
    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_layoutContext, "setLabelLayoutCache:", v10);
    v11 = [SKUIResourceLoader alloc];
    -[SKUIViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController clientContext](self, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIResourceLoader initWithOperationQueue:clientContext:](v11, "initWithOperationQueue:clientContext:", v12, v13);

    -[SKUIViewElementLayoutContext setResourceLoader:](self->_layoutContext, "setResourceLoader:", v14);
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_signInFailed:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
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
  id v18;

  v18 = a3;
  v6 = a4;
  -[SKUIViewController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0DC3450];
  if (v7)
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("CANNOT_LOGIN_TITLE"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANNOT_LOGIN_TITLE"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  if (v8)
    objc_msgSend(v8, "localizedStringForKey:", CFSTR("OK"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("OK"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15);

  -[SKUISignInDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  if (self->_templateElement)
  {
    objc_msgSend(v6, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("failed"), CFSTR("result"), v18, CFSTR("accountName"), v16, CFSTR("reason"), 0);
    -[SKUISignInTemplateViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_templateElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v17, 0);

  }
}

- (void)_signInSuccess:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  if (self->_templateElement)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99D80];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "accountName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", CFSTR("success"), CFSTR("result"), v7, CFSTR("accountName"), 0);
    -[SKUISignInTemplateViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_templateElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v8, 0);

  }
}

- (void)_layoutScrollView
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[SKUISignInDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v18 = CGRectIntersection(v17, self->_keyboardFrame);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;

  -[SKUISignInDocumentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v10, v12, v14, v16 - CGRectGetHeight(v19));
}

- (void)_reloadContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  SKUISignInTemplateViewElement *templateElement;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;

  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v4 = v3;
  v6 = v5;
  -[SKUISignInTemplateView layoutMargins](self->_loginView, "layoutMargins");
  v8 = v7;
  v10 = v9;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v13 = v11;
  v14 = 0.0;
  if (self->_keyboardFrame.size.height < 0.00000011920929)
    v14 = v6;
  v15 = v12 - v4 - v14;
  v16 = v11 - v8 - v10;
  v17 = floorf(v16);
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = (void *)objc_opt_class();
  templateElement = self->_templateElement;
  -[SKUISignInDocumentViewController _layoutContext](self, "_layoutContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFitsWidth:viewElement:context:", templateElement, v22, v17);
  v24 = v23;
  v26 = v25;

  if (v26 < v15)
    v26 = v15;
  if (v24 < v13)
    v24 = v13;
  -[SKUISignInTemplateView setFrame:](self->_loginView, "setFrame:", v18, v19, v24, v26);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v24, v26);
}

- (void)_reloadPanelViewWithScrollViewSize:(CGSize)a3
{
  double width;
  BOOL v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  id v13;

  width = a3.width;
  if (self->_loginView)
    v4 = a3.width <= 0.00000011920929;
  else
    v4 = 1;
  if (!v4)
  {
    -[SKUISignInDocumentViewController _layoutContext](self, "_layoutContext");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUISignInTemplateView tintColor](self->_loginView, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v6);

    objc_msgSend((id)objc_opt_class(), "prefetchResourcesForViewElement:reason:context:", self->_templateElement, 1, v13);
    -[SKUISignInTemplateView layoutMargins](self->_loginView, "layoutMargins");
    v8 = v7;
    v10 = v9;
    -[SKUISignInTemplateView setLayoutMargins:](self->_loginView, "setLayoutMargins:", 0.0);
    v11 = width - v8 - v10;
    v12 = floorf(v11);
    objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", self->_templateElement, v13, v12);
    -[SKUILayoutCache commitLayoutRequests](self->_textLayoutCache, "commitLayoutRequests");
    -[SKUISignInTemplateView reloadWithViewElement:width:context:](self->_loginView, "reloadWithViewElement:width:context:", self->_templateElement, v13, v12);
    -[SKUISignInDocumentViewController _reloadContentSize](self, "_reloadContentSize");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_loginView, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISignInDocumentViewController initWithTemplateElement:]";
}

@end
