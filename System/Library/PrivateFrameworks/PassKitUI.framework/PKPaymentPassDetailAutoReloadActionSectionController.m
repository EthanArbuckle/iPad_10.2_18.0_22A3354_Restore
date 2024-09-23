@implementation PKPaymentPassDetailAutoReloadActionSectionController

- (PKPaymentPassDetailAutoReloadActionSectionController)initWithPass:(id)a3 paymentDataProvider:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentPassDetailAutoReloadActionSectionController *v14;
  PKPaymentPassDetailAutoReloadActionSectionController *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *name;
  void *v22;
  uint64_t v23;
  NSString *threshold;
  uint64_t v25;
  NSString *reloadAmount;
  PKPaymentAutoReloadSetupController *v27;
  PKPaymentAutoReloadSetupController *autoReloadSetupController;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentPassDetailAutoReloadActionSectionController;
  v14 = -[PKPaymentPassDetailSectionController init](&v30, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_msgSend(v11, "autoTopUpMerchantTokenIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = 0;
    else
      v17 = objc_msgSend(v11, "isAutoTopEnabled");
    v15->_isMerchantAutoTopEnabled = v17;

    objc_msgSend(v11, "autoTopUpMerchantTokenIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      LOBYTE(v18) = objc_msgSend(v11, "isAutoTopEnabled");
    v15->_isWalletAutoTopEnabled = v18;

    objc_msgSend(v11, "localizedDescription");
    v20 = objc_claimAutoreleasedReturnValue();
    name = v15->_name;
    v15->_name = (NSString *)v20;

    v15->_viewStyle = a5;
    +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "autoTopUpActionForPass:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentPassDetailAutoReloadSectionController autoReloadThresholdForPass:action:](PKPaymentPassDetailAutoReloadSectionController, "autoReloadThresholdForPass:action:", v11, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    threshold = v15->_threshold;
    v15->_threshold = (NSString *)v23;

    +[PKPaymentPassDetailAutoReloadSectionController autoReloadAmountForPass:action:](PKPaymentPassDetailAutoReloadSectionController, "autoReloadAmountForPass:action:", v11, v22);
    v25 = objc_claimAutoreleasedReturnValue();
    reloadAmount = v15->_reloadAmount;
    v15->_reloadAmount = (NSString *)v25;

    v27 = -[PKPaymentAutoReloadSetupController initWithPass:paymentDataProvider:viewStyle:delegate:]([PKPaymentAutoReloadSetupController alloc], "initWithPass:paymentDataProvider:viewStyle:delegate:", v11, v12, v15->_viewStyle, v15);
    autoReloadSetupController = v15->_autoReloadSetupController;
    v15->_autoReloadSetupController = v27;

  }
  return v15;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AutoReloadActionSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPaymentPassDetailAutoReloadActionSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "activationState"))
  {
    v4 = 0;
  }
  else
  {
    +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "autoTopUpActionForPass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isAutoTopEnabled");

  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6;
  void *v7;
  _BOOL4 isMerchantAutoTopEnabled;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;

  v6 = a3;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AutoReloadCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AutoReloadCellIdentifier"));
  isMerchantAutoTopEnabled = self->_isMerchantAutoTopEnabled;
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (isMerchantAutoTopEnabled)
  {
    -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v9, self->_name, 1, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_isWalletAutoTopEnabled)
      v11 = CFSTR("STATE_ON");
    else
      v11 = CFSTR("STATE_OFF");
    PKLocalizedPaymentString(&v11->isa);
    v12 = objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v9, v12, 1, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  objc_msgSend(v10, "setAccessoryType:", 1);
  return v10;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  id v4;
  void *v6;

  v4 = a3;
  if (*(_WORD *)&self->_isMerchantAutoTopEnabled)
  {
    v6 = 0;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_SETUP_AUTO_RELOAD_FOOTER_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)launchURL:(id)a3
{
  PKPaymentPassDetailAutoReloadActionSectionControllerDelegate **p_setupDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_setupDelegate = &self->_setupDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_setupDelegate);
    objc_msgSend(v7, "launchURL:", v8);

  }
}

- (void)presentAutoReloadSetupViewController
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
  void *v12;
  id WeakRetained;
  _QWORD v14[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_WITH_APPLE_PAY_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_WITH_APPLE_PAY_MESSAGE"), CFSTR("%@"), self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_SETUP_WITH_APPLE_PAY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__PKPaymentPassDetailAutoReloadActionSectionController_presentAutoReloadSetupViewController__block_invoke;
  v14[3] = &unk_1E3E61D68;
  v14[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_SETUP_KEEP_SETTINGS"), CFSTR("%@"), self->_name);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __92__PKPaymentPassDetailAutoReloadActionSectionController_presentAutoReloadSetupViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "presentAutoTopUpFlow");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  PKPaymentPassDetailAutoReloadMerchantViewController *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (PKEqualObjects())
  {
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v7, 1);
    if (self->_isMerchantAutoTopEnabled)
    {
      v8 = -[PKPaymentPassDetailAutoReloadMerchantViewController initWithPass:viewStyle:delegate:]([PKPaymentPassDetailAutoReloadMerchantViewController alloc], "initWithPass:viewStyle:delegate:", self->_pass, self->_viewStyle, self);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pushViewController:animated:", v8, 1);

    }
    else
    {
      -[PKPaymentAutoReloadSetupController presentAutoTopUpFlow](self->_autoReloadSetupController, "presentAutoTopUpFlow");
    }
  }

}

- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  objc_msgSend(WeakRetained, "autoReloadSetupControllerDidComplete");

}

- (void)autoReloadSetupControllerDidCancel:(id)a3
{
  id WeakRetained;

  self->_isWalletAutoTopEnabled = 0;
  self->_isMerchantAutoTopEnabled = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSectionIdentifier:", CFSTR("AutoReloadActionSection"));

}

- (void)autoReloadSetupController:(id)a3 requestsPushViewController:(id)a4
{
  PKPaymentPassDetailWrapperSectionControllerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4
{
  PKPaymentPassDetailWrapperSectionControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)autoReloadSetupController:(id)a3 requestsPopViewController:(id)a4
{
  void *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate)setupDelegate
{
  return (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoReloadSetupController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_reloadAmount, 0);
}

@end
