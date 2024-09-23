@implementation PKPeerPaymentBankAccountsViewController

- (PKPeerPaymentBankAccountsViewController)initWithPeerPaymentAccount:(id)a3 detailViewStyle:(int64_t)a4
{
  id v7;
  PKPeerPaymentBankAccountsViewController *v8;
  PKBankAccountInformation *v9;
  PKBankAccountInformation *bankInformation;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentBankAccountsViewController;
  v8 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v14, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 1);
  if (v8)
  {
    v9 = (PKBankAccountInformation *)objc_alloc_init(MEMORY[0x1E0D66BC8]);
    bankInformation = v8->_bankInformation;
    v8->_bankInformation = v9;

    objc_storeStrong((id *)&v8->_account, a3);
    v8->_detailViewStyle = a4;
    -[PKPeerPaymentBankAccountsViewController navigationItem](v8, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v11, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_ACCOUNTS_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

  }
  return v8;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentBankAccountsViewController;
  -[PKPeerPaymentBankAccountsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKPeerPaymentBankAccountsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBankAccountsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPeerPaymentBankAccountsViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PKBankAccountInformation *bankInformation;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  bankInformation = self->_bankInformation;
  v6 = a3;
  if (-[PKBankAccountInformation isValid](bankInformation, "isValid"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentBankAccountsViewControllerBankAccountCellReuseIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PKPeerPaymentBankAccountsViewControllerBankAccountCellReuseIdentifier"));
    objc_msgSend(v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBankAccountInformation bankName](self->_bankInformation, "bankName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    objc_msgSend(v7, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBankAccountInformation maskedAccountNumber](self->_bankInformation, "maskedAccountNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    objc_msgSend(v7, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v13);

    objc_msgSend(v7, "setAccessoryType:", 1);
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentBankAccountsViewControllerAddBankAccountCellReuseIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("PKPeerPaymentBankAccountsViewControllerAddBankAccountCellReuseIdentifier"));
      objc_msgSend(v7, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v15);

    }
    objc_msgSend(v7, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_ACCOUNTS_ADD_BANK_ACCOUNT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v17);

    objc_msgSend(v7, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", 0);

    if (self->_detailViewStyle == 2)
    {
      objc_msgSend(v7, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PKBridgeAppearanceGetAppearanceSpecifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "buttonTextColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTextColor:", v21);

    }
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  PKACHBankCredentialPickerViewController *v8;
  PKAddBankAccountInformationViewController *v9;
  PKBankAccountInformation *bankInformation;
  void *v11;
  PKAddBankAccountInformationViewController *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD aBlock[5];

  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  if (!PKBankCredentialCenterEnabled())
    goto LABEL_3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E3E74568;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v15[3] = &unk_1E3E612E8;
  v15[4] = self;
  v7 = _Block_copy(v15);
  v8 = -[PKACHBankCredentialPickerViewController initWithCurrentBankInformation:selectAction:cancelAction:]([PKACHBankCredentialPickerViewController alloc], "initWithCurrentBankInformation:selectAction:cancelAction:", self->_bankInformation, v6, v7);

  if (!v8)
  {
LABEL_3:
    v9 = [PKAddBankAccountInformationViewController alloc];
    bankInformation = self->_bankInformation;
    -[PKPeerPaymentAccount countryCode](self->_account, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKAddBankAccountInformationViewController initWithDelegate:bankInformation:accountCountryCode:](v9, "initWithDelegate:bankInformation:accountCountryCode:", self, bankInformation, v11);

    v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v12);
    -[PKACHBankCredentialPickerViewController setSupportedInterfaceOrientations:](v8, "setSupportedInterfaceOrientations:", 2);

  }
  if ((PKIsPad() & 1) != 0)
  {
    v13 = 2;
LABEL_8:
    -[PKACHBankCredentialPickerViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", v13);
    goto LABEL_9;
  }
  if (PKIsVision())
  {
    v13 = 1;
    goto LABEL_8;
  }
LABEL_9:
  -[PKPeerPaymentBankAccountsViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v8, 1, 0);

}

void __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  v4 = a2;
  objc_msgSend(v4, "routingNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoutingNumber:", v5);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  objc_msgSend(v4, "accountNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccountNumber:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  objc_msgSend(v4, "bankName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBankName:", v9);

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIdentifier:", v11);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3
{
  id v3;

  -[PKPeerPaymentBankAccountsViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_doneButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[PKPeerPaymentBankAccountsViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PKPeerPaymentBankAccountsViewController presentingViewController](self, "presentingViewController");
  else
    -[PKPeerPaymentBankAccountsViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_bankInformation, 0);
}

@end
