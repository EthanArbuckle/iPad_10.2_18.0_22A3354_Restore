@implementation PKAmountKeypadViewController

- (PKAmountKeypadViewController)initWithRemoteMessagesComposer:(id)a3 recipientAddress:(id)a4 sendFlowType:(int64_t)a5 familyCollection:(id)a6
{
  id v10;
  id v11;
  void *v12;
  PKAmountKeypadViewController *v13;

  v10 = a6;
  v11 = a3;
  -[PKAmountKeypadViewController _composeRecipientForAddress:](self, "_composeRecipientForAddress:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKAmountKeypadViewController initWithRemoteMessagesComposer:recipient:sendFlowType:familyCollection:](self, "initWithRemoteMessagesComposer:recipient:sendFlowType:familyCollection:", v11, v12, a5, v10);

  return v13;
}

- (PKAmountKeypadViewController)initWithRemoteMessagesComposer:(id)a3 recipient:(id)a4 sendFlowType:(int64_t)a5 familyCollection:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKAmountKeypadViewController *v14;
  PKAmountKeypadViewController *v15;
  PKPeerPaymentMessagesContentAmountEntryViewController *v16;
  PKPeerPaymentMessagesContentAmountEntryViewController *amountEntryViewController;
  void *v18;
  void *v19;
  PKPeerPaymentMessagesContentAmountEntryViewController *v20;
  void *v21;
  uint64_t v22;
  UIView *v23;
  UIView *containerView;
  PKAvatarView *v25;
  PKAvatarView *avatarView;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PKAmountKeypadViewController;
  v14 = -[PKAmountKeypadViewController init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recipient, a4);
    v15->_sendFlowType = a5;
    objc_storeStrong((id *)&v15->_remoteMessagesComposer, a3);
    v16 = objc_alloc_init(PKPeerPaymentMessagesContentAmountEntryViewController);
    amountEntryViewController = v15->_amountEntryViewController;
    v15->_amountEntryViewController = v16;

    -[PKPeerPaymentMessagesContentAmountEntryViewController setSourceType:](v15->_amountEntryViewController, "setSourceType:", 1);
    -[PKPeerPaymentMessagesContentAmountEntryViewController setDelegate:](v15->_amountEntryViewController, "setDelegate:", v15);
    if ((unint64_t)a5 >= 2)
    {
      if (a5 == 2)
      {
        -[PKPeerPaymentMessagesContentAmountEntryViewController setShowSendAndRequest:](v15->_amountEntryViewController, "setShowSendAndRequest:", 0);
        -[PKPeerPaymentMessagesContentAmountEntryViewController setShowSetupRecurringSend:](v15->_amountEntryViewController, "setShowSetupRecurringSend:", 0);
      }
    }
    else
    {
      -[PKPeerPaymentMessagesContentAmountEntryViewController setShowSendAndRequest:](v15->_amountEntryViewController, "setShowSendAndRequest:", 1);
      -[PKAmountKeypadViewController _peerPaymentController](v15, "_peerPaymentController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v15->_amountEntryViewController;
      if (objc_msgSend(v19, "supportsRecurringPayments"))
      {
        objc_msgSend(v13, "currentUser");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEligibleForRecurringPaymentsForUser:", v21))
          v22 = PKIsVision() ^ 1;
        else
          v22 = 0;
        -[PKPeerPaymentMessagesContentAmountEntryViewController setShowSetupRecurringSend:](v20, "setShowSetupRecurringSend:", v22);

      }
      else
      {
        -[PKPeerPaymentMessagesContentAmountEntryViewController setShowSetupRecurringSend:](v20, "setShowSetupRecurringSend:", 0);
      }

    }
    objc_storeStrong((id *)&v15->_familyCollection, a6);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v15->_containerView;
    v15->_containerView = v23;

    v25 = objc_alloc_init(PKAvatarView);
    avatarView = v15->_avatarView;
    v15->_avatarView = v25;

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0D6B138];
    objc_msgSend(v12, "address");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", v28, v29, 1);

    v30 = *MEMORY[0x1E0D6B130];
    objc_msgSend(v12, "address");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", v30, v31, 1);

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipient address](self->_recipient, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], v4, 1);
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B138], v4, 1);

  v5.receiver = self;
  v5.super_class = (Class)PKAmountKeypadViewController;
  -[PKAmountKeypadViewController dealloc](&v5, sel_dealloc);
}

- (void)setRecurringPeerPayment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)&self->_recurringPayment, a3);
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAmountKeypadViewController _peerPaymentController](self, "_peerPaymentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentBalance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PKPeerPaymentMessagesContentAmountEntryViewController setAmount:](self->_amountEntryViewController, "setAmount:", v12);

}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    -[PKAmountKeypadViewController setUpNavigationBar](self, "setUpNavigationBar");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAmountKeypadViewController;
  -[PKAmountKeypadViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKAmountKeypadViewController setUpNavigationBar](self, "setUpNavigationBar");
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAmountKeypadViewController;
  -[PKAmountKeypadViewController loadView](&v5, sel_loadView);
  -[PKAmountKeypadViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPeerPaymentTheme backgroundColor](PKPeerPaymentTheme, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKAmountKeypadViewController _configureAvatarView](self, "_configureAvatarView");
  -[PKAmountKeypadViewController setUpContainerView](self, "setUpContainerView");
}

- (void)setUpContainerView
{
  void *v3;
  UIView *containerView;
  id v5;

  -[PKAmountKeypadViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_containerView);

  -[UIView setPreservesSuperviewLayoutMargins:](self->_containerView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKAmountKeypadViewController addChildViewController:](self, "addChildViewController:", self->_amountEntryViewController);
  containerView = self->_containerView;
  -[PKPeerPaymentMessagesContentAmountEntryViewController view](self->_amountEntryViewController, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](containerView, "addSubview:", v5);

}

- (void)viewDidLayoutSubviews
{
  UIView *containerView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  containerView = self->_containerView;
  -[PKAmountKeypadViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](containerView, "setFrame:");

  -[PKPeerPaymentMessagesContentAmountEntryViewController view](self->_amountEntryViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_containerView, "bounds");
  v7 = v6;
  -[UIView bounds](self->_containerView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7);

  v8.receiver = self;
  v8.super_class = (Class)PKAmountKeypadViewController;
  -[PKAmountKeypadViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (void)setUpNavigationBar
{
  void *v3;
  void *v4;
  UIBarButtonItem *nextButton;
  id v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  id v11;

  -[PKAmountKeypadViewController navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackButtonDisplayMode:", 2);
  if (self->_showCancelButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed);
    +[PKPeerPaymentTheme secondaryTextColor](PKPeerPaymentTheme, "secondaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintColor:", v4);

    objc_msgSend(v11, "setLeftBarButtonItem:", v3);
  }
  else
  {
    objc_msgSend(v11, "setLeftBarButtonItem:", 0);
  }
  nextButton = self->_nextButton;
  if (self->_sendFlowType == 2)
  {
    if (!nextButton)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PKLocalizedPaymentString(CFSTR("NEXT"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel__presentRecurringDetailViewController);
      v9 = self->_nextButton;
      self->_nextButton = v8;

      v10 = self->_nextButton;
LABEL_9:
      objc_msgSend(v11, "setRightBarButtonItem:", v10);
    }
  }
  else if (nextButton)
  {
    self->_nextButton = 0;

    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v11, "setTitleView:", self->_avatarView);

}

- (void)_configureAvatarView
{
  uint64_t v3;
  id v4;
  id v5;

  -[CNComposeRecipient contact](self->_recipient, "contact");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    -[PKAvatarView setContact:](self->_avatarView, "setContact:", v3);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v4, "setContactType:", 0);
    -[PKAvatarView setContact:](self->_avatarView, "setContact:", v4);

  }
}

- (void)_cancelButtonPressed
{
  id v2;

  -[PKAmountKeypadViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_composeRecipientForAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAvatarView descriptorForRequiredKeys](self->_avatarView, "descriptorForRequiredKeys");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v27[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v9);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C60]), "initWithContactStore:keysToFetch:", v5, v6);
    objc_msgSend(v10, "contactForHandle:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contactFormatConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v15);
    if ((objc_msgSend(v16, "emailAddressIsValid:", v4) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
      v26 = v12;
      v19 = v11;
      v20 = v10;
      v21 = v8;
      v22 = v6;
      v23 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "phoneNumberIsValid:forCountryCode:", v24, 0))
        v17 = 1;
      else
        v17 = 5;

      v5 = v23;
      v6 = v22;
      v8 = v21;
      v10 = v20;
      v11 = v19;
      v12 = v26;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v11, v4, v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_presentRecurringDetailViewController
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  PKPeerPaymentRecurringPayment *v7;
  PKPeerPaymentRecurringPayment *recurringPayment;
  PKPeerPaymentRecurringPayment *v9;
  void *v10;
  PKPeerPaymentRecurringPayment *v11;
  void *v12;
  void *v13;
  PKPeerPaymentRecurringPayment *v14;
  void *v15;
  PKPeerPaymentRecurringPayment *v16;
  void *v17;
  void *v18;
  PKPeerPaymentRecurringPaymentDetailViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;

  -[PKAmountKeypadViewController _peerPaymentController](self, "_peerPaymentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  v5 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", 3, v4, &v25, &v24);
  v6 = v24;
  if (v5)
  {
    if (!self->_recurringPayment)
    {
      v7 = (PKPeerPaymentRecurringPayment *)objc_alloc_init(MEMORY[0x1E0D67448]);
      recurringPayment = self->_recurringPayment;
      self->_recurringPayment = v7;

      -[PKPeerPaymentRecurringPayment setType:](self->_recurringPayment, "setType:", 1);
      v9 = self->_recurringPayment;
      -[CNComposeRecipient address](self->_recipient, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentRecurringPayment setRecipientAddress:](v9, "setRecipientAddress:", v10);

      -[PKPeerPaymentRecurringPayment setFrequency:](self->_recurringPayment, "setFrequency:", 1);
      v11 = self->_recurringPayment;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentRecurringPayment setStartDate:](v11, "setStartDate:", v12);

      -[PKPeerPaymentRecurringPayment setSentByMe:](self->_recurringPayment, "setSentByMe:", 1);
    }
    -[PKPeerPaymentMessagesContentAmountEntryViewController amount](self->_amountEntryViewController, "amount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_recurringPayment;
    objc_msgSend(v13, "currency");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPayment setCurrency:](v14, "setCurrency:", v15);

    v16 = self->_recurringPayment;
    objc_msgSend(v13, "amount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPayment setAmount:](v16, "setAmount:", v17);

    objc_msgSend(v4, "recurringPaymentsFeatureDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipient:mode:context:peerPaymentController:remoteMessagesComposer:]([PKPeerPaymentRecurringPaymentDetailViewController alloc], "initWithRecurringPayment:recipient:mode:context:peerPaymentController:remoteMessagesComposer:", self->_recurringPayment, self->_recipient, 1, 0, v3, self->_remoteMessagesComposer);
    -[PKPeerPaymentRecurringPaymentDetailViewController setDelegate:](v19, "setDelegate:", self);
    objc_msgSend(v18, "minimumAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController setMinimumAmount:](v19, "setMinimumAmount:", v20);

    objc_msgSend(v18, "maximumAmount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController setMaximumAmount:](v19, "setMaximumAmount:", v21);

    -[PKPeerPaymentRecurringPaymentDetailViewController setOverrideUserInterfaceStyle:](v19, "setOverrideUserInterfaceStyle:", 2);
    -[PKAmountKeypadViewController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pushViewController:animated:", v19, 1);

  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__PKAmountKeypadViewController__presentRecurringDetailViewController__block_invoke;
    v23[3] = &unk_1E3E612E8;
    v23[4] = self;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v25, v6, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAmountKeypadViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

uint64_t __69__PKAmountKeypadViewController__presentRecurringDetailViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (id)_peerPaymentController
{
  return -[PKPeerPaymentRemoteMessagesComposer peerPaymentController](self->_remoteMessagesComposer, "peerPaymentController");
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  objc_msgSend(v9, "setAllowedPaymentNetworks:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[2];
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v11, a1 + 5);
  v12 = a2;
  v6 = a1[4];
  v11[1] = a1[6];
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v9[3] = &unk_1E3E619E0;
      v9[4] = v3;
      v10 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v9);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }

}

uint64_t __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  return v5;
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v3;

  -[PKAmountKeypadViewController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)handleAction:(unint64_t)a3 completion:(id)a4
{
  id v6;
  PKPeerPaymentRemoteMessagesComposer *remoteMessagesComposer;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a4;
  if (a3 == 1)
    goto LABEL_6;
  if (a3 != 7)
  {
    if (a3 == 2)
      a3 = 0;
    else
      a3 = 3;
LABEL_6:
    objc_initWeak(&location, self);
    -[PKPeerPaymentRemoteMessagesComposer setActionType:](self->_remoteMessagesComposer, "setActionType:", a3);
    remoteMessagesComposer = self->_remoteMessagesComposer;
    -[PKPeerPaymentMessagesContentAmountEntryViewController amount](self->_amountEntryViewController, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PKAmountKeypadViewController_handleAction_completion___block_invoke;
    v9[3] = &unk_1E3E61C30;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    -[PKPeerPaymentRemoteMessagesComposer presentRemoteMessageComposerWithAmount:requestToken:memo:sessionID:overViewController:completion:](remoteMessagesComposer, "presentRemoteMessageComposerWithAmount:requestToken:memo:sessionID:overViewController:completion:", v8, 0, 0, 0, self, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
  -[PKAmountKeypadViewController _presentRecurringDetailViewController](self, "_presentRecurringDetailViewController");
  if (v6)
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
LABEL_7:

}

void __56__PKAmountKeypadViewController_handleAction_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    v3 = v6;
  }

}

- (id)minimumTransferAmount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKAmountKeypadViewController _peerPaymentController](self, "_peerPaymentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendToUserFeatureDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)maximumTransferAmount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKAmountKeypadViewController _peerPaymentController](self, "_peerPaymentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendToUserFeatureDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentBalance
{
  void *v2;
  void *v3;
  void *v4;

  -[PKAmountKeypadViewController _peerPaymentController](self, "_peerPaymentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)percentExpanded
{
  return 1.0;
}

- (void)recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPayment, a3);
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  _BOOL8 v2;
  int64_t v3;
  $85E40A55691FE2F31975A98F57E3065D result;

  v2 = 1;
  v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_amountEntryViewController, 0);
  objc_storeStrong((id *)&self->_remoteMessagesComposer, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
