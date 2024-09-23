@implementation PKAddPaymentPassDevicePickerViewController

- (PKAddPaymentPassDevicePickerViewController)initWithStyle:(int64_t)a3
{
  return -[PKAddPaymentPassDevicePickerViewController initWithPaymentWebServices:configuration:reporter:](self, "initWithPaymentWebServices:configuration:reporter:", 0, 0, 0);
}

- (PKAddPaymentPassDevicePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PKAddPaymentPassDevicePickerViewController initWithPaymentWebServices:configuration:reporter:](self, "initWithPaymentWebServices:configuration:reporter:", 0, 0, 0);
}

- (PKAddPaymentPassDevicePickerViewController)initWithPaymentWebServices:(id)a3 configuration:(id)a4 reporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAddPaymentPassDevicePickerViewController *v11;
  uint64_t v12;
  NSArray *webServices;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  v11 = -[PKAddPaymentPassDevicePickerViewController initWithStyle:](&v16, sel_initWithStyle_, 1);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    webServices = v11->_webServices;
    v11->_webServices = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_storeStrong((id *)&v11->_reporter, a5);
    -[PKAddPaymentPassDevicePickerViewController navigationItem](v11, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v14, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  -[PKAddPaymentPassDevicePickerViewController dealloc](&v2, sel_dealloc);
}

- (void)reloadContentFromWebServices
{
  id v2;

  -[PKAddPaymentPassDevicePickerViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)loadView
{
  void *v3;
  void *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  PKTableHeaderView *headerView;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  -[PKAddPaymentPassDevicePickerViewController loadView](&v20, sel_loadView);
  -[PKAddPaymentPassDevicePickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 1);
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v6;

  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  -[PKAddPaymentPassRequestConfiguration paymentNetwork](self->_configuration, "paymentNetwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D6AD60]);

  -[PKAddPaymentPassRequestConfiguration localizedDescription](self->_configuration, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    PKLocalizedPaymentString(CFSTR("ISSUER_ADD_PICKER_DESCRIPTION"), CFSTR("%@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
      PKLocalizedAquamanString(CFSTR("ISSUER_ADD_ACCOUNT_PICKER_DESCRIPTION_GENERIC"));
    else
      PKLocalizedPaymentString(CFSTR("ISSUER_ADD_PICKER_DESCRIPTION_GENERIC"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  -[PKAddPaymentPassRequestConfiguration paymentNetwork](self->_configuration, "paymentNetwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D6AD68]);

  if (v14)
    goto LABEL_11;
  if (!v9)
  {
    if (-[PKAddPaymentPassRequestConfiguration style](self->_configuration, "style") != PKAddPaymentPassStyleAccess)
    {
      v16 = CFSTR("ISSUER_ADD_CARD");
      goto LABEL_12;
    }
LABEL_11:
    v16 = CFSTR("ISSUER_ADD_CARD_WALLET");
LABEL_12:
    PKLocalizedPaymentString(&v16->isa);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  PKLocalizedAquamanString(CFSTR("ISSUER_ADD_ACCOUNT_WALLET"));
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v17 = (void *)v15;
  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v12);

  -[PKTableHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");
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
  PKTableHeaderView *headerView;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  -[PKAddPaymentPassDevicePickerViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[PKAddPaymentPassDevicePickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[PKTableHeaderView frame](self->_headerView, "frame");
  v7 = v6;
  v9 = v8;
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v5, 1.79769313e308);
  if (v7 != v11 || v9 != v10)
  {
    headerView = self->_headerView;
    objc_msgSend(v3, "_rectForTableHeaderView");
    -[PKTableHeaderView setFrame:](headerView, "setFrame:");
    objc_msgSend(v3, "setTableHeaderView:", 0);
    objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  }
  -[PKAddPaymentPassDevicePickerViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v14);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  -[PKAddPaymentPassDevicePickerViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return -[NSArray count](self->_webServices, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
    objc_msgSend(v7, "setSelectionStyle:", 3);
  }
  -[NSArray objectAtIndexedSubscript:](self->_webServices, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 19.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_msgSend(v8, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceDescriptionForPaymentWebService:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v12);

  PKProvisioningBackgroundColor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v13);

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  int v6;
  void *v7;

  if (-[PKAddPaymentPassRequestConfiguration style](self->_configuration, "style", a3, a4) == PKAddPaymentPassStyleAccess
    || (-[PKAddPaymentPassRequestConfiguration paymentNetwork](self->_configuration, "paymentNetwork"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AD68]),
        v5,
        v6))
  {
    PKLocalizedPaymentString(CFSTR("ISSUER_ADD_PICKER_LIMITED_FOOTER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKAddPaymentPassDevicePickerViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v14, 1);
  -[NSArray objectAtIndexedSubscript:](self->_webServices, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentPassbookState");
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    objc_msgSend(v7, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Apple Watch"));

    if ((v9 & 1) != 0)
      v10 = PKCreateAlertControllerForWatchWalletUninstalled(0);
    else
      v10 = PKCreateAlertControllerForWalletUninstalled(0);
    v13 = v10;
    -[PKAddPaymentPassDevicePickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndexedSubscript:](self->_webServices, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pickerViewController:didPickWebService:", self, v12);

    -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  }

}

- (PKAddPaymentPassDevicePickerDelegate)delegate
{
  return (PKAddPaymentPassDevicePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_webServices, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
