@implementation PKEditSinglePassViewController

- (PKEditSinglePassViewController)initWithGroup:(id)a3 pass:(id)a4
{
  id v7;
  id v8;
  PKEditSinglePassViewController *v9;
  PKEditSinglePassViewController *v10;
  id v11;
  void *v12;
  uint64_t v13;
  UIBarButtonItem *deleteBarButton;
  uint64_t v15;
  UIBarButtonItem *flexibleSpace;
  id v17;
  void *v18;
  uint64_t v19;
  UIBarButtonItem *infoButton;
  UIBarButtonItem *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKEditSinglePassViewController;
  v9 = -[PKEditSinglePassViewController init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    objc_storeStrong((id *)&v10->_pass, a4);
    v10->_performanceTest = 0;
    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("PASS_EDITING_DELETE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 0, v10, sel__deletePassPressed);
    deleteBarButton = v10->_deleteBarButton;
    v10->_deleteBarButton = (UIBarButtonItem *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    flexibleSpace = v10->_flexibleSpace;
    v10->_flexibleSpace = (UIBarButtonItem *)v15;

    v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKUIBigInfoButtonImageWithDefaultConfiguration();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithImage:style:target:action:", v18, 0, v10, sel__moreButtonPressed);
    infoButton = v10->_infoButton;
    v10->_infoButton = (UIBarButtonItem *)v19;

    v21 = v10->_infoButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](v21, "setTintColor:", v22);

    -[PKEditSinglePassViewController navigationItem](v10, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setRightBarButtonItem:", v10->_infoButton);

    v27[0] = v10->_flexibleSpace;
    v27[1] = v10->_deleteBarButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditSinglePassViewController setToolbarItems:](v10, "setToolbarItems:", v24);

    -[PKEditSinglePassViewController passViewSetup](v10, "passViewSetup");
  }

  return v10;
}

- (void)setPerformanceTest:(int64_t)a3
{
  self->_performanceTest = a3;
}

- (void)setPerformanceTestName:(id)a3
{
  objc_storeStrong((id *)&self->_performanceTestName, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEditSinglePassViewController;
  -[PKEditSinglePassViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKEditSinglePassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKEditSinglePassViewController passViewSetup](self, "passViewSetup");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEditSinglePassViewController;
  -[PKEditSinglePassViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKEditSinglePassViewController enableDeleteButton](self, "enableDeleteButton");
  -[PKEditSinglePassViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  int64_t performanceTest;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEditSinglePassViewController;
  -[PKEditSinglePassViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  performanceTest = self->_performanceTest;
  if (performanceTest == 1)
  {
    -[PKEditSinglePassViewController _moreButtonPressed](self, "_moreButtonPressed");
  }
  else if (performanceTest == 3)
  {
    -[PKEditSinglePassViewController _deletePassConfirmed](self, "_deletePassConfirmed");
  }
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
  v28.super_class = (Class)PKEditSinglePassViewController;
  -[PKEditSinglePassViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[PKEditSinglePassViewController view](self, "view");
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
  void *v4;
  PKPassView *v5;
  PKPassView *v6;
  PKPassView *passView;
  id v8;

  -[PKPass localizedDescription](self->_pass, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditSinglePassViewController setTitle:](self, "setTitle:", v3);

  -[PKEditSinglePassViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    v5 = self->_passView;
    v6 = -[PKPassView initWithPass:content:]([PKPassView alloc], "initWithPass:content:", self->_pass, 5);
    passView = self->_passView;
    self->_passView = v6;

    -[PKPassView setModallyPresented:](self->_passView, "setModallyPresented:", 1);
    objc_msgSend(v8, "addSubview:", self->_passView);
    objc_msgSend(v8, "setNeedsLayout");
    if (v5)
      -[PKPassView removeFromSuperview](v5, "removeFromSuperview");

    v4 = v8;
  }

}

- (void)passWasUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
  -[PKEditSinglePassViewController passViewSetup](self, "passViewSetup");
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  id v5;

  v5 = a4;
  -[PKEditSinglePassViewController _deletePassConfirmed](self, "_deletePassConfirmed");
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  return 1;
}

- (void)_deletePassPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("PASS_EDITING_DELETE_CONFIRMATION_SINGLE_PASS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PKEditSinglePassViewController__deletePassPressed__block_invoke;
  v8[3] = &unk_1E3E61D68;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v4, 2, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7);

  -[PKEditSinglePassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

uint64_t __52__PKEditSinglePassViewController__deletePassPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deletePassConfirmed");
}

- (void)_deletePassConfirmed
{
  id v3;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68308], 0);
  -[PKEditSinglePassViewController disableDeleteButton](self, "disableDeleteButton");
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePass:", self->_pass);

}

- (void)_moreButtonPressed
{
  PKPassType v3;
  void *v4;
  PKNavigationController *v5;
  void *v6;
  _QWORD v7[5];

  v3 = -[PKPass passType](self->_pass, "passType");
  if (v3 == PKPassTypeSecureElement)
  {
    -[PKPass paymentPass](self->_pass, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditSinglePassViewController _paymentPassDetailsViewControllerForPaymentPass:](self, "_paymentPassDetailsViewControllerForPaymentPass:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_4:
      v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __52__PKEditSinglePassViewController__moreButtonPressed__block_invoke;
      v7[3] = &unk_1E3E612E8;
      v7[4] = self;
      -[PKEditSinglePassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, v7);

      return;
    }
  }
  else if (v3 == PKPassTypeBarcode)
  {
    -[PKEditSinglePassViewController _barcodePassDetailsViewControllerForBarcodePass:](self, "_barcodePassDetailsViewControllerForBarcodePass:", self->_pass);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_4;
  }
  -[PKEditSinglePassViewController _didPresentDetailViewController](self, "_didPresentDetailViewController");
}

uint64_t __52__PKEditSinglePassViewController__moreButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresentDetailViewController");
}

- (void)_doneButtonPressed
{
  -[PKEditSinglePassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  PKPaymentPassDetailViewController *v7;
  PKGroup *group;
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
    group = self->_group;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    v12 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:](v7, "initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:", v5, group, 0, v9, v10, 0, v11, v6);

    -[PKPaymentPassDetailViewController setDeleteOverrider:](v12, "setDeleteOverrider:", self);
    -[PKPaymentPassDetailViewController setShowDoneButton:](v12, "setShowDoneButton:", 1);

  }
  else
  {
    v12 = 0;
  }
  return v12;
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

- (void)enableDeleteButton
{
  UIBarButtonItem *deleteBarButton;
  void *v4;
  void *v5;
  id v6;

  -[UIBarButtonItem setEnabled:](self->_deleteBarButton, "setEnabled:", 1);
  deleteBarButton = self->_deleteBarButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](deleteBarButton, "setTintColor:", v4);

  -[PKEditSinglePassViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)disableDeleteButton
{
  UIBarButtonItem *deleteBarButton;
  void *v4;
  void *v5;
  id v6;

  -[UIBarButtonItem setEnabled:](self->_deleteBarButton, "setEnabled:", 0);
  deleteBarButton = self->_deleteBarButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](deleteBarButton, "setTintColor:", v4);

  -[PKEditSinglePassViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_didPresentDetailViewController
{
  _QWORD v2[5];

  if (self->_performanceTest == 1)
  {
    self->_performanceTest = 0;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __65__PKEditSinglePassViewController__didPresentDetailViewController__block_invoke;
    v2[3] = &unk_1E3E612E8;
    v2[4] = self;
    -[PKEditSinglePassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
  }
}

void __65__PKEditSinglePassViewController__didPresentDetailViewController__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popToRootViewControllerAnimated:", 1);

}

- (id)group
{
  return self->_group;
}

- (id)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceTestName, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_flexibleSpace, 0);
  objc_storeStrong((id *)&self->_deleteBarButton, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
