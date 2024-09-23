@implementation PKFeatureTermsAndConditionsViewController

- (PKFeatureTermsAndConditionsViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4
{
  id v6;
  PKFeatureTermsAndConditionsViewController *v7;
  PKFeatureTermsAndConditionsViewController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKFeatureTermsAndConditionsViewController;
  v7 = -[PKFeatureTermsAndConditionsViewController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_context = a4;
    objc_storeWeak((id *)&v7->_setupDelegate, v6);
    -[PKFeatureTermsAndConditionsViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v8, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKFeatureTermsAndConditionsViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 3);
    }
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFeatureTermsAndConditionsViewController;
  -[PKFeatureTermsAndConditionsViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKFeatureTermsAndConditionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  PKPaymentSetupApplyContextAppearance(self->_context, self);
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKFeatureTermsAndConditionsViewController;
  -[PKFeatureTermsAndConditionsViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  if (!self->_performedInitialLoad)
  {
    self->_performedInitialLoad = 1;
    if (self->_pdfData || self->_htmlData)
    {
      -[PKFeatureTermsAndConditionsViewController _renderTermsView](self, "_renderTermsView");
    }
    else
    {
      objc_initWeak(&location, self);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __60__PKFeatureTermsAndConditionsViewController_viewWillAppear___block_invoke;
      v4[3] = &unk_1E3E61C58;
      objc_copyWeak(&v5, &location);
      -[PKFeatureTermsAndConditionsViewController preflightWithCompletion:](self, "preflightWithCompletion:", v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PKFeatureTermsAndConditionsViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_renderTermsView");
    WeakRetained = v2;
  }

}

- (void)preflightWithCompletion:(id)a3
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
  v6[2] = __69__PKFeatureTermsAndConditionsViewController_preflightWithCompletion___block_invoke;
  v6[3] = &unk_1E3E75E58;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[PKFeatureTermsAndConditionsViewController initalTermsDataWithCompletion:](self, "initalTermsDataWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __69__PKFeatureTermsAndConditionsViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v13 || a4)
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
      {
        v11 = *(void (**)(void))(v12 + 16);
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_updateTermsData:termsFileName:", v13, v7);
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
      {
        v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
        v11();
      }
    }
  }

}

- (void)_updateTermsData:(id)a3 termsFileName:(id)a4
{
  id v6;
  NSString *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *termsFileName;
  id v13;

  v6 = a3;
  v7 = (NSString *)a4;
  v8 = objc_msgSend(v6, "hasPDFMIMEType");
  v9 = 4;
  if (v8)
    v9 = 3;
  v10 = OBJC_IVAR___PKFeatureTermsAndConditionsViewController__context[v9];
  v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)v6;
  v13 = v6;

  termsFileName = self->_termsFileName;
  self->_termsFileName = v7;

}

- (void)presentWithNavigationController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v6;
  UINavigationController *v8;
  UINavigationController *containerNavigationController;
  UINavigationController *v10;
  id v11;

  v6 = a4;
  v8 = (UINavigationController *)a3;
  if ((_DWORD)v6)
  {
    if (self->_useModalPresentation)
      v6 = 8;
    else
      v6 = 1;
  }
  containerNavigationController = self->_containerNavigationController;
  self->_containerNavigationController = v8;
  v10 = v8;
  v11 = a5;

  -[UINavigationController presentViewController:withTransition:completion:](v10, "presentViewController:withTransition:completion:", self, v6, v11);
}

- (void)dismissViewControllerWithCompletion:(id)a3
{
  uint64_t v4;

  if (self->_useModalPresentation)
    v4 = 9;
  else
    v4 = 1;
  -[PKFeatureTermsAndConditionsViewController _pk_dismissViewControllerWithTransition:completion:](self, "_pk_dismissViewControllerWithTransition:completion:", v4, a3);
}

- (void)popViewControllerWithCompletion:(id)a3
{
  uint64_t v4;

  if (self->_useModalPresentation)
    v4 = 9;
  else
    v4 = 2;
  -[PKFeatureTermsAndConditionsViewController _pk_dismissViewControllerWithTransition:completion:](self, "_pk_dismissViewControllerWithTransition:completion:", v4, a3);
}

- (void)_pk_dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  RemoteUIController *termsUIController;
  id v7;

  v4 = *(_QWORD *)&a3;
  termsUIController = self->_termsUIController;
  v7 = a4;
  -[RemoteUIController setDelegate:](termsUIController, "setDelegate:", 0);
  -[PKFeatureTermsAndConditionsViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", v4, v7);

}

- (id)displayTitle
{
  return 0;
}

- (void)_renderTermsView
{
  if (self->_htmlData)
  {
    -[PKFeatureTermsAndConditionsViewController _loadHTMLViewController](self, "_loadHTMLViewController");
  }
  else if (self->_pdfData)
  {
    -[PKFeatureTermsAndConditionsViewController _loadPDF](self, "_loadPDF");
  }
  else
  {
    -[PKFeatureTermsAndConditionsViewController presentErrorAlert](self, "presentErrorAlert");
  }
}

- (void)_loadHTML
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_termsUIController)
  {
    if (self->_htmlData)
    {
      -[PKFeatureTermsAndConditionsViewController _loadHTMLViewController](self, "_loadHTMLViewController");
    }
    else
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke;
      v3[3] = &unk_1E3E75E80;
      objc_copyWeak(&v4, &location);
      -[PKFeatureTermsAndConditionsViewController htmlTermsDataWithCompletion:](self, "htmlTermsDataWithCompletion:", v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!v7 || v9)
    {
      objc_msgSend(WeakRetained, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke_2;
      v14[3] = &unk_1E3E61388;
      v15 = v9;
      v16 = v12;
      v13 = v12;
      objc_msgSend(v11, "popViewControllerWithCompletion:", v14);

    }
    else
    {
      objc_msgSend(WeakRetained, "_updateTermsData:termsFileName:", v7, v8);
      objc_msgSend(v11, "_renderTermsView");
    }
  }

}

void __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);

}

- (void)_loadHTMLViewController
{
  RemoteUIController *v3;
  RemoteUIController *termsUIController;
  RemoteUIController *v5;
  uint64_t v6;
  RemoteUIController *v7;
  RemoteUIController *v8;
  RemoteUIController *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[PKFeatureTermsAndConditionsViewController termsShown](self, "termsShown");
  v3 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
  termsUIController = self->_termsUIController;
  self->_termsUIController = v3;

  -[RemoteUIController setDelegate:](self->_termsUIController, "setDelegate:", self);
  -[RemoteUIController setNavigationController:](self->_termsUIController, "setNavigationController:", self);
  -[RemoteUIController loadData:baseURL:](self->_termsUIController, "loadData:baseURL:", self->_htmlData, 0);
  objc_initWeak(&location, self);
  v5 = self->_termsUIController;
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke;
  v16[3] = &unk_1E3E72528;
  objc_copyWeak(&v17, &location);
  -[RemoteUIController setHandlerForElementName:handler:](v5, "setHandlerForElementName:handler:", CFSTR("agree"), v16);
  v7 = self->_termsUIController;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_4;
  v14[3] = &unk_1E3E72528;
  objc_copyWeak(&v15, &location);
  -[RemoteUIController setHandlerForElementName:handler:](v7, "setHandlerForElementName:handler:", CFSTR("disagree"), v14);
  v8 = self->_termsUIController;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_7;
  v12[3] = &unk_1E3E72528;
  objc_copyWeak(&v13, &location);
  -[RemoteUIController setHandlerForElementName:handler:](v8, "setHandlerForElementName:handler:", CFSTR("done"), v12);
  v9 = self->_termsUIController;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_9;
  v10[3] = &unk_1E3E72528;
  objc_copyWeak(&v11, &location);
  -[RemoteUIController setHandlerForElementName:handler:](v9, "setHandlerForElementName:handler:", CFSTR("wallet_terms_link"), v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showTermsSpinner:objectModel:", 1, *(_QWORD *)(a1 + 32));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_3;
    v4[3] = &unk_1E3E61388;
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v5, "termsAccepted:completion:", 1, v4);

  }
}

uint64_t __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTermsSpinner:objectModel:", 0, *(_QWORD *)(a1 + 40));
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_5;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showTermsSpinner:objectModel:", 1, *(_QWORD *)(a1 + 32));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_6;
    v4[3] = &unk_1E3E61388;
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v5, "termsAccepted:completion:", 0, v4);

  }
}

uint64_t __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTermsSpinner:objectModel:", 0, *(_QWORD *)(a1 + 40));
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_7(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_8;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerWithCompletion:", 0);
    WeakRetained = v2;
  }

}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_10;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showTermsSpinner:objectModel:", 1, *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_11;
    v5[3] = &unk_1E3E61388;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v6, "_handleWalletTermsLink:withCompletion:", v4, v5);

  }
}

uint64_t __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTermsSpinner:objectModel:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_handleWalletTermsLink:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  PKFeatureTermsAndConditionsViewController *v15;
  void (**v16)(_QWORD);
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Wallet terms link detected with attributes: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "PKStringForKey:", CFSTR("termsIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PKStringForKey:", CFSTR("termsDataFormat"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PKStringForKey:", CFSTR("termsFileName"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9 && v10 && v11 && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D6BA28]) & 1) != 0)
  {
    -[PKFeatureTermsAndConditionsViewController reportAnalyticsForTermsLink:](self, "reportAnalyticsForTermsLink:", v6);
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke;
    v13[3] = &unk_1E3E75EA8;
    objc_copyWeak(&v17, (id *)buf);
    v14 = v12;
    v15 = self;
    v16 = v7;
    -[PKFeatureTermsAndConditionsViewController pdfTermsDataWithIdentifier:completion:](self, "pdfTermsDataWithIdentifier:completion:", v9, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[PKFeatureTermsAndConditionsViewController presentErrorAlert](self, "presentErrorAlert");
    v7[2](v7);
  }

}

void __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v6 = a2;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke_2;
  v13[3] = &unk_1E3E68530;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v14 = v6;
  v15 = v7;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v19);
}

void __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v8 = WeakRetained;
    if (v4 && !*(_QWORD *)(a1 + 40))
    {
      objc_storeStrong(WeakRetained + 179, v4);
      objc_msgSend(v8, "_loadPDFViewControllerWithFileName:", *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "pushViewController:animated:", v6, 1);
      v7 = *(_QWORD *)(a1 + 64);
      if (v7)
        (*(void (**)(void))(v7 + 16))();

      goto LABEL_9;
    }
    objc_msgSend(WeakRetained, "presentErrorAlert");
    v3 = v8;
    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
LABEL_9:
      v3 = v8;
    }
  }

}

- (void)_loadPDF
{
  id v3;

  if (!self->_previewController)
  {
    -[PKFeatureTermsAndConditionsViewController _loadPDFViewControllerWithFileName:](self, "_loadPDFViewControllerWithFileName:", self->_termsFileName);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PKFeatureTermsAndConditionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 0, 0);

  }
}

- (id)_loadPDFViewControllerWithFileName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  QLItem *v7;
  QLItem *pdfItem;
  QLPreviewController *v9;
  QLPreviewController *previewController;
  QLPreviewController *v11;

  v4 = (void *)*MEMORY[0x1E0CEC570];
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (QLItem *)objc_msgSend(objc_alloc(_MergedGlobals_5_0()), "initWithDataProvider:contentType:previewTitle:", self, v6, v5);

  pdfItem = self->_pdfItem;
  self->_pdfItem = v7;

  v9 = (QLPreviewController *)objc_alloc_init((Class)off_1EE4C5F90());
  previewController = self->_previewController;
  self->_previewController = v9;

  -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", self);
  -[QLPreviewController setDataSource:](self->_previewController, "setDataSource:", self);
  -[QLPreviewController setModalPresentationStyle:](self->_previewController, "setModalPresentationStyle:", 3);
  v11 = self->_previewController;

  return v11;
}

- (void)_showTermsSpinner:(BOOL)a3 objectModel:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    -[PKFeatureTermsAndConditionsViewController displayTitle](self, "displayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startNavigationBarSpinnerWithTitle:", v8);

  }
  else
  {
    objc_msgSend(v6, "stopNavigationBarSpinner");
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v7, "allPages", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v13 = !v4;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "rightToolbarItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEnabled:", v13);

        objc_msgSend(v15, "leftToolbarItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setEnabled:", v13);

        objc_msgSend(v15, "middleToolbarItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEnabled:", v13);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (self->_termsUIController == a3)
    PKPaymentSetupApplyContextAppearance(self->_context, a4);
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Error loading terms: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[PKFeatureTermsAndConditionsViewController dismissViewControllerWithCompletion:](self, "dismissViewControllerWithCompletion:", 0);
  }

}

- (id)provideDataForItem:(id)a3
{
  return self->_pdfData;
}

- (void)previewControllerWillDismiss:(id)a3
{
  NSData *pdfData;
  QLPreviewController *previewController;
  id v6;

  pdfData = self->_pdfData;
  self->_pdfData = 0;

  previewController = self->_previewController;
  self->_previewController = 0;

  -[PKFeatureTermsAndConditionsViewController presentingViewController](self, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_pdfItem != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_pdfItem;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (BOOL)useModalPresentation
{
  return self->_useModalPresentation;
}

- (void)setUseModalPresentation:(BOOL)a3
{
  self->_useModalPresentation = a3;
}

- (UINavigationController)containerNavigationController
{
  return self->_containerNavigationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerNavigationController, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_termsFileName, 0);
  objc_storeStrong((id *)&self->_htmlData, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_pdfItem, 0);
  objc_storeStrong((id *)&self->_termsUIController, 0);
}

@end
