@implementation PKExpiredSinglePassViewController

- (PKExpiredSinglePassViewController)initWithPass:(id)a3
{
  id v5;
  PKExpiredSinglePassViewController *v6;
  PKExpiredSinglePassViewController *v7;
  id *p_pass;
  id v9;
  void *v10;
  uint64_t v11;
  UIBarButtonItem *deleteBarButton;
  id v13;
  void *v14;
  uint64_t v15;
  UIBarButtonItem *recoverBarButton;
  uint64_t v17;
  UIBarButtonItem *flexibleSpace;
  id v19;
  void *v20;
  uint64_t v21;
  UIBarButtonItem *infoButton;
  uint64_t v23;
  UIBarButtonItem *shareButton;
  void *v25;
  UIBarButtonItem *v26;
  void *v27;
  UIBarButtonItem **v28;
  uint64_t v29;
  void *v30;
  PKLinkedApplication *v31;
  PKLinkedApplication *linkedApplication;
  void *v33;
  objc_super v35;
  _QWORD v36[3];
  UIBarButtonItem *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKExpiredSinglePassViewController;
  v6 = -[PKExpiredSinglePassViewController init](&v35, sel_init);
  v7 = v6;
  if (v6)
  {
    p_pass = (id *)&v6->_pass;
    objc_storeStrong((id *)&v6->_pass, a3);
    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_DELETE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, v7, sel__deletePassPressed);
    deleteBarButton = v7->_deleteBarButton;
    v7->_deleteBarButton = (UIBarButtonItem *)v11;

    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_deleteBarButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F60]);
    v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_UNHIDE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, v7, sel__recoverPassPressed);
    recoverBarButton = v7->_recoverBarButton;
    v7->_recoverBarButton = (UIBarButtonItem *)v15;

    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_recoverBarButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    flexibleSpace = v7->_flexibleSpace;
    v7->_flexibleSpace = (UIBarButtonItem *)v17;

    v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PKExpiredSinglePassViewController _infoButton](v7, "_infoButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithCustomView:", v20);
    infoButton = v7->_infoButton;
    v7->_infoButton = (UIBarButtonItem *)v21;

    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_infoButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C78]);
    if (objc_msgSend(*p_pass, "supportsSharing"))
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, v7, sel__sharePass);
      shareButton = v7->_shareButton;
      v7->_shareButton = (UIBarButtonItem *)v23;

      -[UIBarButtonItem setAccessibilityIdentifier:](v7->_shareButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68048]);
    }
    -[PKExpiredSinglePassViewController navigationItem](v7, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7->_shareButton;
    if (v26)
    {
      v38[0] = v7->_infoButton;
      v38[1] = v26;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = (UIBarButtonItem **)v38;
      v29 = 2;
    }
    else
    {
      v37 = v7->_infoButton;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v37;
      v29 = 1;
    }
    objc_msgSend(v27, "arrayWithObjects:count:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItems:", v30);

    v31 = -[PKLinkedApplication initWithPass:]([PKLinkedApplication alloc], "initWithPass:", *p_pass);
    linkedApplication = v7->_linkedApplication;
    v7->_linkedApplication = v31;

    v36[0] = v7->_deleteBarButton;
    v36[1] = v7->_flexibleSpace;
    v36[2] = v7->_recoverBarButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpiredSinglePassViewController setToolbarItems:](v7, "setToolbarItems:", v33);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKExpiredSinglePassViewController;
  -[PKExpiredSinglePassViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExpiredSinglePassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKExpiredSinglePassViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B90]);

  -[PKExpiredSinglePassViewController passViewSetup](self, "passViewSetup");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExpiredSinglePassViewController;
  -[PKExpiredSinglePassViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKExpiredSinglePassViewController enableButtons](self, "enableButtons");
  -[PKExpiredSinglePassViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PKPassView *passView;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKExpiredSinglePassViewController;
  -[PKExpiredSinglePassViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[PKExpiredSinglePassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  v17 = v5 + v16;
  v18 = v7 + v12;
  v20 = v9 - (v16 + v19);
  -[PKPassView sizeOfFront](self->_passView, "sizeOfFront");
  passView = self->_passView;
  if (v21 >= v20)
  {
    PKFloatRoundToPixel();
    v25 = v27;
    v26 = -16.0;
  }
  else
  {
    v23 = v21;
    PKFloatRoundToPixel();
    v17 = v24;
    v25 = v18 + 16.0;
    v26 = -32.0;
    v20 = v23;
  }
  -[PKPassView setFrame:](passView, "setFrame:", v17, v25, v20, v11 - (v13 + v15) + v26);

}

- (void)passViewSetup
{
  void *v3;
  PKPassView *v4;
  PKPassView *v5;
  PKPassView *passView;
  id v7;

  -[PKExpiredSinglePassViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    v4 = self->_passView;
    v5 = -[PKPassView initWithPass:content:]([PKPassView alloc], "initWithPass:content:", self->_pass, 5);
    passView = self->_passView;
    self->_passView = v5;

    -[PKPassView setModallyPresented:](self->_passView, "setModallyPresented:", 1);
    objc_msgSend(v7, "addSubview:", self->_passView);
    objc_msgSend(v7, "setNeedsLayout");
    if (v4)
      -[PKPassView removeFromSuperview](v4, "removeFromSuperview");

    v3 = v7;
  }

}

- (void)passWasUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
  -[PKExpiredSinglePassViewController passViewSetup](self, "passViewSetup");
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PKExpiredSinglePassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  -[PKExpiredSinglePassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
  return 1;
}

uint64_t __87__PKExpiredSinglePassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deletePassConfirmed");
}

- (id)_infoButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  PKUIBigInfoButtonImageWithDefaultConfiguration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3520];
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __48__PKExpiredSinglePassViewController__infoButton__block_invoke;
  v16 = &unk_1E3E62BD0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "actionWithHandler:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v7, v9, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfigurationUpdateHandler:", &__block_literal_global_12);
  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(v10, "setShowsLargeContentViewer:", 1);
  PKLocalizedString(CFSTR("MORE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLargeContentTitle:", v11);

  objc_msgSend(v10, "setLargeContentImage:", v3);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

void __48__PKExpiredSinglePassViewController__infoButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_moreButtonPressed");

}

uint64_t __48__PKExpiredSinglePassViewController__infoButton__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)_deletePassPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("EXPIRED_PASSES_DELETE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedString(CFSTR("EXPIRED_PASSES_DELETE_CONFIRMATION"), CFSTR("%lu"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v3, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PKExpiredSinglePassViewController__deletePassPressed__block_invoke;
  v10[3] = &unk_1E3E61D68;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v4, 2, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v9);

  -[PKExpiredSinglePassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __55__PKExpiredSinglePassViewController__deletePassPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deletePassConfirmed");
}

- (void)_recoverPassPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("EXPIRED_PASSES_UNHIDE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedString(CFSTR("EXPIRED_PASSES_UNHIDE_CONFIRMATION"), CFSTR("%lu"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v3, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PKExpiredSinglePassViewController__recoverPassPressed__block_invoke;
  v10[3] = &unk_1E3E61D68;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v4, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v9);

  -[PKExpiredSinglePassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __56__PKExpiredSinglePassViewController__recoverPassPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverPassConfirmed");
}

- (void)_deletePassConfirmed
{
  -[PKExpiredSinglePassViewController disableButtons](self, "disableButtons");
  -[PKExpiredSinglePassViewController _expiredPassRemovalConfirmedAsDeletion:](self, "_expiredPassRemovalConfirmedAsDeletion:", 1);
}

- (void)_recoverPassConfirmed
{
  -[PKExpiredSinglePassViewController disableButtons](self, "disableButtons");
  -[PKExpiredSinglePassViewController _expiredPassRemovalConfirmedAsDeletion:](self, "_expiredPassRemovalConfirmedAsDeletion:", 0);
}

- (void)_expiredPassRemovalConfirmedAsDeletion:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  -[PKExpiredSinglePassViewController parentViewController](self, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v11, "expiredPassesViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKPass uniqueID](self->_pass, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeExpiredSectionPassWithUniqueID:isDeletion:", v8, v3);

      -[PKExpiredSinglePassViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "popToRootViewControllerAnimated:", 1);

    }
    v6 = v11;
  }

}

- (void)_moreButtonPressed
{
  PKPassType v3;
  uint64_t v4;
  PKNavigationController *v5;
  id v6;

  v3 = -[PKPass passType](self->_pass, "passType");
  if (v3 == PKPassTypeSecureElement)
  {
    -[PKExpiredSinglePassViewController _paymentPassDetailsViewControllerForPaymentPass:](self, "_paymentPassDetailsViewControllerForPaymentPass:", self->_pass);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
LABEL_4:
      v6 = (id)v4;
      v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
      -[PKExpiredSinglePassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

      return;
    }
  }
  else if (v3 == PKPassTypeBarcode)
  {
    -[PKExpiredSinglePassViewController _barcodePassDetailsViewControllerForBarcodePass:](self, "_barcodePassDetailsViewControllerForBarcodePass:", self->_pass);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_4;
  }
  -[PKExpiredSinglePassViewController _didPresentDetailViewController](self, "_didPresentDetailViewController");
}

- (void)_sharePass
{
  void *v3;
  PKPass *v4;
  PKPass *v5;
  _QWORD v6[4];
  PKPass *v7;

  objc_msgSend(MEMORY[0x1E0D96D28], "pkui_activityControllerForPass:passView:passLinkedApplication:", self->_pass, self->_passView, self->_linkedApplication);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_pass;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__PKExpiredSinglePassViewController__sharePass__block_invoke;
    v6[3] = &unk_1E3E62C38;
    v7 = v4;
    v5 = v4;
    objc_msgSend(v3, "setCompletionWithItemsHandler:", v6);
    -[PKExpiredSinglePassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

void __47__PKExpiredSinglePassViewController__sharePass__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteShared");
    v6 = *MEMORY[0x1E0D68348];
    v8 = CFSTR("activity");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v6, v7);

  }
  else
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68350], 0);
  }

}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  id v4;
  PKBarcodePassDetailViewController *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[PKBarcodePassDetailViewController initWithPass:]([PKBarcodePassDetailViewController alloc], "initWithPass:", v4);

    -[PKBarcodePassDetailViewController setDeleteOverrider:](v5, "setDeleteOverrider:", self);
    -[PKBarcodePassDetailViewController setShowDoneButton:](v5, "setShowDoneButton:", 1);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  PKPaymentPassDetailViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PKPaymentPassDetailViewController *v12;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D67100];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    v7 = [PKPaymentPassDetailViewController alloc];
    objc_msgSend(v5, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    v12 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:](v7, "initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:", v8, 0, 0, v9, v10, 0, v11, v6);

    -[PKPaymentPassDetailViewController setDeleteOverrider:](v12, "setDeleteOverrider:", self);
    -[PKPaymentPassDetailViewController setShowDoneButton:](v12, "setShowDoneButton:", 1);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)enableButtons
{
  UIBarButtonItem *deleteBarButton;
  void *v4;
  UIBarButtonItem *recoverBarButton;
  void *v6;
  void *v7;
  id v8;

  -[UIBarButtonItem setEnabled:](self->_deleteBarButton, "setEnabled:", 1);
  deleteBarButton = self->_deleteBarButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](deleteBarButton, "setTintColor:", v4);

  -[UIBarButtonItem setEnabled:](self->_recoverBarButton, "setEnabled:", 1);
  recoverBarButton = self->_recoverBarButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](recoverBarButton, "setTintColor:", v6);

  -[PKExpiredSinglePassViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)disableButtons
{
  UIBarButtonItem *deleteBarButton;
  void *v4;
  UIBarButtonItem *recoverBarButton;
  void *v6;
  void *v7;
  id v8;

  -[UIBarButtonItem setEnabled:](self->_deleteBarButton, "setEnabled:", 0);
  deleteBarButton = self->_deleteBarButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](deleteBarButton, "setTintColor:", v4);

  -[UIBarButtonItem setEnabled:](self->_recoverBarButton, "setEnabled:", 0);
  recoverBarButton = self->_recoverBarButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](recoverBarButton, "setTintColor:", v6);

  -[PKExpiredSinglePassViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_didPresentDetailViewController
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PKExpiredSinglePassViewController__didPresentDetailViewController__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKExpiredSinglePassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __68__PKExpiredSinglePassViewController__didPresentDetailViewController__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popToRootViewControllerAnimated:", 1);

}

- (id)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_flexibleSpace, 0);
  objc_storeStrong((id *)&self->_recoverBarButton, 0);
  objc_storeStrong((id *)&self->_deleteBarButton, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
