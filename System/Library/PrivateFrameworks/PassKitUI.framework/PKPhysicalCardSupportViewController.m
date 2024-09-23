@implementation PKPhysicalCardSupportViewController

- (PKPhysicalCardSupportViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPhysicalCardSupportViewController *v17;
  PKPhysicalCardSupportViewController *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  UIBarButtonItem *nextButton;
  id v25;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v25 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPhysicalCardSupportViewController;
  v17 = -[PKPhysicalCardSupportViewController initWithStyle:](&v26, sel_initWithStyle_, 1);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountService, a3);
    objc_storeStrong((id *)&v18->_account, a4);
    objc_storeStrong((id *)&v18->_accountUser, a5);
    objc_storeStrong((id *)&v18->_paymentPass, a6);
    objc_storeStrong((id *)&v18->_physicalCard, a7);
    -[PKPhysicalCardSupportViewController navigationItem](v18, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v19, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithTitle:style:target:action:", v21, 0, v18, sel__nextButtonTapped_);
    nextButton = v18->_nextButton;
    v18->_nextButton = (UIBarButtonItem *)v22;

    -[UIBarButtonItem setEnabled:](v18->_nextButton, "setEnabled:", 0);
    objc_msgSend(v19, "setRightBarButtonItem:", v18->_nextButton);

  }
  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  PKTableHeaderView *tableHeaderView;
  void *v8;
  void *v9;
  PKTableHeaderView *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PKPhysicalCardSupportViewController;
  -[PKPhysicalCardSupportViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PKAccount feature](self->_account, "feature");
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableHeaderView = self->_tableHeaderView;
  self->_tableHeaderView = v6;

  -[PKTableHeaderView titleLabel](self->_tableHeaderView, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v3);

  -[PKTableHeaderView subtitleLabel](self->_tableHeaderView, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v4);

  -[PKTableHeaderView setTopPadding:](self->_tableHeaderView, "setTopPadding:", 5.0);
  v10 = self->_tableHeaderView;
  -[PKPhysicalCardSupportViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[PKTableHeaderView sizeThatFits:](v10, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
  v13 = v12;
  v15 = v14;

  -[PKTableHeaderView setFrame:](self->_tableHeaderView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v13, v15);
  -[PKPhysicalCardSupportViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PhysicalCardSupportReuseIdentifier"));
  objc_msgSend(v16, "setTableHeaderView:", self->_tableHeaderView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicalCardSupportViewController;
  -[PKPhysicalCardSupportViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKPhysicalCardSupportViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPhysicalCardSupportViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPhysicalCardSupportViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  int64_t selectedReason;
  id v8;
  void *v9;
  void *v10;
  UIBarButtonItem *nextButton;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  if (self->_hasSelectedReason)
  {
    v6 = (void *)MEMORY[0x1E0CB36B0];
    selectedReason = self->_selectedReason;
    v8 = a4;
    objc_msgSend(v6, "indexPathForRow:inSection:", selectedReason, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryType:", 0);

  }
  else
  {
    nextButton = self->_nextButton;
    v12 = a4;
    -[UIBarButtonItem setEnabled:](nextButton, "setEnabled:", 1);
  }
  self->_hasSelectedReason = 1;
  self->_selectedReason = objc_msgSend(a4, "row");
  objc_msgSend(v14, "cellForRowAtIndexPath:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessoryType:", 3);
  objc_msgSend(v14, "deselectRowAtIndexPath:animated:", a4, 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ISSUE_WITH"));
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PhysicalCardSupportReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v8 > 2)
  {
    v9 = 0;
  }
  else
  {
    -[PKAccount feature](self->_account, "feature");
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_hasSelectedReason)
  {
    if (v8 == self->_selectedReason)
      v10 = 3;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v10);
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  objc_msgSend(v7, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  return v7;
}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[PKPhysicalCardSupportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, a6);
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  -[PKPhysicalCardSupportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a4, a5);
}

- (void)_nextButtonTapped:(id)a3
{
  id v4;
  int64_t selectedReason;
  PKBusinessChatPhysicalCardContext *v6;
  PKPaymentPass *paymentPass;
  uint64_t v8;
  PKBusinessChatPhysicalCardContext *v9;
  id v10;

  v4 = a3;
  if (!self->_hasSelectedReason)
    goto LABEL_13;
  selectedReason = self->_selectedReason;
  switch(selectedReason)
  {
    case 2:
      v10 = v4;
      if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
      {
        v6 = [PKBusinessChatPhysicalCardContext alloc];
        paymentPass = self->_paymentPass;
        v8 = 7;
        goto LABEL_10;
      }
LABEL_11:
      -[PKPhysicalCardSupportViewController _presentCallSupport](self, "_presentCallSupport");
      goto LABEL_12;
    case 1:
      v10 = v4;
      if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
      {
        v6 = [PKBusinessChatPhysicalCardContext alloc];
        paymentPass = self->_paymentPass;
        v8 = 5;
LABEL_10:
        v9 = -[PKBusinessChatPhysicalCardContext initWithPaymentPass:intent:](v6, "initWithPaymentPass:intent:", paymentPass, v8);
        -[PKPhysicalCardSupportViewController _presentBusinessChatWithContext:](self, "_presentBusinessChatWithContext:", v9);

        goto LABEL_12;
      }
      goto LABEL_11;
    case 0:
      v10 = v4;
      -[PKPhysicalCardSupportViewController _presentManualActivation](self, "_presentManualActivation");
LABEL_12:
      v4 = v10;
      break;
  }
LABEL_13:

}

- (void)_presentBusinessChatWithContext:(id)a3
{
  id v4;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v6;
  PKBusinessChatController *v7;
  _QWORD v8[5];

  v4 = a3;
  businessChatController = self->_businessChatController;
  if (!businessChatController)
  {
    v6 = objc_alloc_init(PKBusinessChatController);
    v7 = self->_businessChatController;
    self->_businessChatController = v6;

    businessChatController = self->_businessChatController;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke;
  v8[3] = &unk_1E3E646D0;
  v8[4] = self;
  -[PKBusinessChatController openBusinessChatWithContext:completion:](businessChatController, "openBusinessChatWithContext:completion:", v4, v8);

}

void __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v3, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_presentManualActivation
{
  void *v3;
  PKPhysicalCardManualActivationViewController *v4;

  v4 = -[PKPhysicalCardManualActivationViewController initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:]([PKPhysicalCardManualActivationViewController alloc], "initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:", self->_accountService, self->_account, self->_accountUser, self->_paymentPass, self->_physicalCard, 0);
  -[PKPhysicalCardSupportViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

}

- (void)_presentCallSupport
{
  id v2;

  -[PKPhysicalCardSupportViewController contactIssuerHelper](self, "contactIssuerHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentContactViewController:", 1);

}

- (id)contactIssuerHelper
{
  PKSecureElementPassContactIssuerHelper *contactIssuerHelper;
  PKSecureElementPassContactIssuerHelper *v4;
  PKSecureElementPassContactIssuerHelper *v5;

  contactIssuerHelper = self->_contactIssuerHelper;
  if (!contactIssuerHelper)
  {
    v4 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    v5 = self->_contactIssuerHelper;
    self->_contactIssuerHelper = v4;

    -[PKSecureElementPassContactIssuerHelper setDelegate:](self->_contactIssuerHelper, "setDelegate:", self);
    -[PKSecureElementPassContactIssuerHelper setPass:](self->_contactIssuerHelper, "setPass:", self->_paymentPass);
    -[PKSecureElementPassContactIssuerHelper setFeatureIdentifier:](self->_contactIssuerHelper, "setFeatureIdentifier:", 2);
    contactIssuerHelper = self->_contactIssuerHelper;
  }
  return contactIssuerHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
