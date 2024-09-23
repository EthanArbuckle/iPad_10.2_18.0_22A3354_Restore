@implementation PKPeerPaymentActionAddMoneyViewController

- (PKPeerPaymentActionAddMoneyViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKPeerPaymentActionAddMoneyViewController *v13;
  PKNumericSuggestionsEnterValueAlgorithm *v14;
  PKNumericSuggestionsEnterValueAlgorithm *suggestionGenerator;
  CGSize v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  v13 = -[PKPeerPaymentActionViewController initWithPaymentPass:webService:passLibraryDataProvider:context:](&v30, sel_initWithPaymentPass_webService_passLibraryDataProvider_context_, v10, v11, v12, a6);
  if (v13)
  {
    v14 = (PKNumericSuggestionsEnterValueAlgorithm *)objc_alloc_init(MEMORY[0x1E0D66E90]);
    suggestionGenerator = v13->_suggestionGenerator;
    v13->_suggestionGenerator = v14;

    -[PKPeerPaymentActionViewController setControllerAction:](v13, "setControllerAction:", 1);
    v16 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v13->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v13->_keyboardFrame.size = v16;
    -[PKPeerPaymentActionAddMoneyViewController navigationItem](v13, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v18, "configureWithTransparentBackground");
    +[PKPeerPaymentActionViewController navigationBarBackgroundColor](PKPeerPaymentActionViewController, "navigationBarBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    objc_msgSend(v17, "setStandardAppearance:", v18);
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PERFORM_ACTION_SELECT_AMOUNT"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v20);

    -[PKPeerPaymentActionAddMoneyViewController _addBarButton](v13, "_addBarButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", v21);

    -[PKPeerPaymentActionAddMoneyViewController _updateBarButtonEnabledState](v13, "_updateBarButtonEnabledState");
    objc_initWeak(&location, v13);
    -[PKPeerPaymentActionViewController account](v13, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionViewController account](v13, "account");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "supportsThresholdTopUp"))
    {
      v24 = PKIsVision();

      if ((v24 & 1) != 0)
      {
LABEL_6:
        objc_msgSend(v11, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], 0, 3);

        objc_destroyWeak(&location);
        goto LABEL_7;
      }
      v23 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke;
      v26[3] = &unk_1E3E71958;
      v27 = v22;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v23, "familyMembersWithCompletion:", v26);
      objc_destroyWeak(&v28);

    }
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", v3);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEligibleForThresholdTopUpForUser:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2;
    v8[3] = &unk_1E3E61BE0;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    objc_msgSend(v7, "recurringPaymentsWithCompletion:", v8);

    objc_destroyWeak(&v9);
  }

}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "type") == 3)
        {

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_3;
  v8[3] = &unk_1E3E61C08;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = 1;
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  objc_destroyWeak(&v9);
LABEL_11:

}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1160) = 1;
    v3 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 138), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKPeerPaymentActionViewController webService](self, "webService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], 0, 3);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  NSDecimalNumber *v4;
  void *v5;
  NSString *v6;
  void *v7;
  PKEnterCurrencyAmountPassView *v8;
  void *v9;
  PKEnterCurrencyAmountPassView *v10;
  PKEnterCurrencyAmountPassView *amountPassView;
  void *v12;
  void *v13;
  PKNumberPadSuggestionsView *v14;
  PKNumberPadSuggestionsView *suggestionView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIButton *v21;
  UIButton *actionButton;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController loadView](&v29, sel_loadView);
  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PKEnterCurrencyAmountPassView alloc];
  -[PKPeerPaymentActionViewController pass](self, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKEnterCurrencyAmountPassView initWithCurrenyAmount:pass:withdrawal:](v8, "initWithCurrenyAmount:pass:withdrawal:", v7, v9, 0);
  amountPassView = self->_amountPassView;
  self->_amountPassView = v10;

  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);
  -[PKEnterCurrencyAmountPassView setDelegate:](self->_amountPassView, "setDelegate:", self);
  if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) != 0)
  {
    objc_msgSend(v12, "amountTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDisablePrediction:", 1);

  }
  else
  {
    v14 = -[PKNumberPadSuggestionsView initWithDefaultFrame]([PKNumberPadSuggestionsView alloc], "initWithDefaultFrame");
    suggestionView = self->_suggestionView;
    self->_suggestionView = v14;

    -[PKNumberPadSuggestionsView setDelegate:](self->_suggestionView, "setDelegate:", self);
    objc_msgSend(v12, "setInputAccessoryView:", self->_suggestionView);
  }
  -[PKPeerPaymentActionAddMoneyViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v17 = (void *)MEMORY[0x1E0DC3428];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__PKPeerPaymentActionAddMoneyViewController_loadView__block_invoke;
  v26[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v17, "actionWithHandler:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_SETUP_ACTION"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v20);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v19, v18);
  v21 = (UIButton *)objc_claimAutoreleasedReturnValue();
  actionButton = self->_actionButton;
  self->_actionButton = v21;

  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLineBreakMode:", 4);

  -[UIButton setHidden:](self->_actionButton, "setHidden:", !self->_offerThresholdTopUp);
  -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678D8]);
  objc_msgSend(v16, "addSubview:", self->_actionButton);
  objc_msgSend(v16, "addSubview:", self->_amountPassView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  -[PKPeerPaymentActionAddMoneyViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67850]);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __53__PKPeerPaymentActionAddMoneyViewController_loadView__block_invoke(uint64_t a1)
{
  PKPeerPaymentThresholdTopUpController *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKPeerPaymentThresholdTopUpController alloc];
    objc_msgSend(WeakRetained, "account");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(WeakRetained, "context");
    objc_msgSend(WeakRetained, "passLibraryDataProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKPeerPaymentThresholdTopUpController initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:](v1, "initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:", v2, v3, v4, v5, WeakRetained);
    v7 = WeakRetained[144];
    WeakRetained[144] = (id)v6;

    objc_msgSend(WeakRetained[144], "presentTopUpFlowForRecurringPayment:", 0);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionAddMoneyViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPeerPaymentActionAddMoneyViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[PKPeerPaymentActionAddMoneyViewController updateFirstResponder](self, "updateFirstResponder");
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
  void *v21;
  void *v22;
  double v23;
  double v24;
  UIButton *actionButton;
  double v26;
  double v27;
  UIButton *v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionAddMoneyViewController viewWillLayoutSubviews](&v32, sel_viewWillLayoutSubviews);
  -[PKPeerPaymentActionAddMoneyViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "bounds");
  v13 = v12;
  v15 = v5 + v14;
  v17 = v16 - (v7 + v11);
  v19 = v18 - (v5 + v9);
  -[PKNumberPadSuggestionsView frame](self->_suggestionView, "frame");
  -[PKNumberPadSuggestionsView setFrame:](self->_suggestionView, "setFrame:");
  v20 = 0.0;
  if (!CGRectIsNull(self->_keyboardFrame))
  {
    if (PKIsPhone())
    {
      v20 = self->_keyboardFrame.size.height - v9;
    }
    else
    {
      objc_msgSend(v3, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        v20 = fmax(v15 + v19 - v23, 0.0);
      }

    }
  }
  v24 = v7 + v13;
  actionButton = self->_actionButton;
  if (actionButton)
  {
    -[UIButton sizeThatFits:](actionButton, "sizeThatFits:", v17, v19);
    v27 = v26;
    v28 = self->_actionButton;
    PKRectCenteredXInRect();
    -[UIButton setFrame:](v28, "setFrame:");
  }
  else
  {
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v29 = v27 + 15.0;
  if (v27 <= 0.0)
    v29 = -0.0;
  -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", v17, v19 - (v20 + 15.0 + v29));
  -[PKEnterCurrencyAmountPassView setFrame:](self->_amountPassView, "setFrame:", v24, v15, v30, v31);

}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController peerPaymentActionController:hasChangedState:](&v7, sel_peerPaymentActionController_hasChangedState_, a3);
  if (a4 != 2)
  {
    if (a4 != 1)
      return;
    -[PKPeerPaymentActionAddMoneyViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[PKPeerPaymentActionAddMoneyViewController updateFirstResponder](self, "updateFirstResponder");
  -[PKPeerPaymentActionAddMoneyViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 0);
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPeerPaymentActionAddMoneyViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)willDismissViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController willDismissViewController](&v4, sel_willDismissViewController);
  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

}

- (void)updateFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKPeerPaymentActionAddMoneyViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amountTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

- (void)updateAccountValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PKNumericSuggestionsEnterValueAlgorithm *suggestionGenerator;
  void *v9;
  PKNumericSuggestionsEnterValueAlgorithm *v10;
  void *v11;
  PKNumericSuggestionsEnterValueAlgorithm *v12;
  void *v13;
  PKNumericSuggestionsEnterValueAlgorithm *v14;
  void *v15;
  PKNumericSuggestionsEnterValueAlgorithm *v16;
  void *v17;
  PKNumericSuggestionsEnterValueAlgorithm *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController updateAccountValues](&v30, sel_updateAccountValues);
  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionAddMoneyViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");
  if (v3)
  {
    objc_msgSend(v3, "currentBalance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "maximumBalance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKMaximumFractionDigitsForCurrencyCode();

    suggestionGenerator = self->_suggestionGenerator;
    objc_msgSend(v4, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setCardBalance:](suggestionGenerator, "setCardBalance:", v9);

    v10 = self->_suggestionGenerator;
    objc_msgSend(v4, "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setCurrencyCode:](v10, "setCurrencyCode:", v11);

    -[PKNumericSuggestionsEnterValueAlgorithm setPowerOfTenFactor:](self->_suggestionGenerator, "setPowerOfTenFactor:", 3 - v7);
    -[PKNumericSuggestionsEnterValueAlgorithm setDecimalPrecision:](self->_suggestionGenerator, "setDecimalPrecision:", v7);
    v12 = self->_suggestionGenerator;
    objc_msgSend(v3, "defaultSuggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setDefaultValues:](v12, "setDefaultValues:", v13);

    v14 = self->_suggestionGenerator;
    -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setMaxLoadAmount:](v14, "setMaxLoadAmount:", v15);

    v16 = self->_suggestionGenerator;
    -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setMinLoadAmount:](v16, "setMinLoadAmount:", v17);

    -[PKNumericSuggestionsEnterValueAlgorithm setMaxBalance:](self->_suggestionGenerator, "setMaxBalance:", v5);
    v18 = self->_suggestionGenerator;
    -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setMinBalance:](v18, "setMinBalance:", v19);

    -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCurrency:", v21);

    objc_msgSend(v20, "sizeToFit");
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCurrencyCode:", v23);

    -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMinBalance:", v24);

    objc_msgSend(v22, "setMaxBalance:", v5);
    -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMinLoadAmount:", v25);

    -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMaxLoadAmount:", v26);

    objc_msgSend(v4, "amount");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCardBalance:", v27);

    objc_msgSend(v22, "sizeToFit");
    -[PKPeerPaymentActionAddMoneyViewController setMaxBalance:](self, "setMaxBalance:", v5);
    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v28, 1);

    -[PKPeerPaymentActionAddMoneyViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNeedsLayout");

  }
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPeerPaymentActionAddMoneyViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 1120);
  v4 = *(double *)(v2 + 1128);
  v5 = *(double *)(v2 + 1136);
  v6 = *(double *)(v2 + 1144);
  *(_BYTE *)(v2 + 1112) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1120);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1136) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1120), v16);
}

- (void)keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __64__PKPeerPaymentActionAddMoneyViewController_keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKPeerPaymentActionAddMoneyViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __64__PKPeerPaymentActionAddMoneyViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 140;
  v4 = *((double *)v2 + 140);
  v5 = *((double *)v2 + 141);
  v6 = *((double *)v2 + 142);
  v7 = *((double *)v2 + 143);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1120), v13);
}

- (void)keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E3E61918;
    v3[4] = self;
    -[PKPeerPaymentActionAddMoneyViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
  }
}

BOOL __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1120);
  *(_BYTE *)(v1 + 1112) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1120);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (v4)
  {
    -[PKPeerPaymentActionAddMoneyViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      if (v4[2](v4))
      {
        objc_msgSend(v6, "setNeedsLayout");
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8 = MEMORY[0x1E0C809B0];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke;
        v11[3] = &unk_1E3E612E8;
        v12 = v6;
        v9[0] = v8;
        v9[1] = 3221225472;
        v9[2] = __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_2;
        v9[3] = &unk_1E3E619E0;
        v9[4] = self;
        v10 = v12;
        objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v11, v9);

      }
    }
    else
    {
      v4[2](v4);
    }

  }
}

uint64_t __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_3;
    v5[3] = &unk_1E3E612E8;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v5, 0);

  }
}

uint64_t __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3
{
  id v3;

  -[PKPeerPaymentActionAddMoneyViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  -[PKPeerPaymentActionAddMoneyViewController didSelectSuggestion:](self, "didSelectSuggestion:", a4);
}

- (void)didSelectSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v5, objc_msgSend(v4, "usedMaximumSuggestion"));

  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = -[PKPeerPaymentActionAddMoneyViewController _shouldShakeCard:](self, "_shouldShakeCard:", v6);
  if ((_DWORD)v4)
    -[PKEnterCurrencyAmountPassView shakePassView](self->_amountPassView, "shakePassView");
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  if (-[PKPeerPaymentActionAddMoneyViewController _shouldShakeCard:](self, "_shouldShakeCard:", v8))
    -[PKEnterCurrencyAmountPassView shakePassView](self->_amountPassView, "shakePassView");
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = !v9 || objc_msgSend(v9, "compare:", v7) != -1 || objc_msgSend(v9, "compare:", v8) != -1;
  objc_msgSend(v8, "decimalNumberByAdding:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decimalNumberByAdding:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(v11, "compare:", v13) == -1 && objc_msgSend(v11, "compare:", v14) == -1)
    v12 = 0;

  return v12;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "currentAmount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController setCurrentAmount:](self, "setCurrentAmount:", v5);
  -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAmountToBalance:", v5);

  -[PKPeerPaymentActionAddMoneyViewController _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v5, 1);
}

- (void)setCardBalance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController setCardBalance:](&v8, sel_setCardBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKNumericSuggestionsEnterValueAlgorithm setCardBalance:](self->_suggestionGenerator, "setCardBalance:", v4);
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCardBalance:", v4);

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
}

- (void)setMaxBalance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController setMaxBalance:](&v8, sel_setMaxBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKNumericSuggestionsEnterValueAlgorithm setMaxBalance:](self->_suggestionGenerator, "setMaxBalance:", v4);
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaxBalance:", v4);

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
}

- (void)setMinBalance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController setMinBalance:](&v8, sel_setMinBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKNumericSuggestionsEnterValueAlgorithm setMinBalance:](self->_suggestionGenerator, "setMinBalance:", v4);
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinBalance:", v4);

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
}

- (void)setMaxLoadAmount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController setMaxLoadAmount:](&v8, sel_setMaxLoadAmount_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKNumericSuggestionsEnterValueAlgorithm setMaxLoadAmount:](self->_suggestionGenerator, "setMaxLoadAmount:", v4);
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaxLoadAmount:", v4);

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
}

- (void)setMinLoadAmount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController setMinLoadAmount:](&v8, sel_setMinLoadAmount_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKNumericSuggestionsEnterValueAlgorithm setMinLoadAmount:](self->_suggestionGenerator, "setMinLoadAmount:", v4);
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinLoadAmount:", v4);

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
}

- (id)_addBarButton
{
  void *v3;
  void *v4;

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PERFORM_ACTION_ADD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v3, 2, self, sel__addBarButtonPressed_);
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67848]);

  return v4;
}

- (id)_spinnerBarButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v2);
  objc_msgSend(v2, "startAnimating");

  return v3;
}

- (void)_updateBarButtonEnabledState
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[PKPeerPaymentActionAddMoneyViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentActionViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[PKPeerPaymentActionAddMoneyViewController _isCurrentAmountValid](self, "_isCurrentAmountValid");
  else
    v5 = 0;
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)_addBarButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PKPeerPaymentActionAddMoneyViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 1);
  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v9, v6, 0);
  -[PKPeerPaymentActionViewController actionController](self, "actionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActionWithCurrencyAmount:", v7);

}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[PKPeerPaymentActionViewController setCurrentAmount:](self, "setCurrentAmount:", v8);
  -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAmountToBalance:", v8);

  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentAmount:", v8);

  -[PKPeerPaymentActionAddMoneyViewController _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v8, v4);
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  void *v22;
  void *v23;
  void *v24;
  PKPeerPaymentActionAddMoneyViewController *val;
  id v26;
  id obj;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (v4)
  {
    val = self;
    -[PKNumericSuggestionsEnterValueAlgorithm suggestionsWithAmount:](self->_suggestionGenerator, "suggestionsWithAmount:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
    if (self->_suggestionView)
    {
      v7 = v24;
      -[PKNumberPadSuggestionsView setSuggestions:](val->_suggestionView, "setSuggestions:", v24);
    }
    else
    {
      v7 = v24;
      if (v6)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_initWeak(&location, val);
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        obj = v24;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v31 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              v13 = (void *)MEMORY[0x1E0DC3428];
              objc_msgSend(v12, "displayValue");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v28[0] = MEMORY[0x1E0C809B0];
              v28[1] = 3221225472;
              v28[2] = __100__PKPeerPaymentActionAddMoneyViewController__currentAmountDidChangeTo_shouldGenerateNewSuggestions___block_invoke;
              v28[3] = &unk_1E3E659D0;
              objc_copyWeak(&v29, &location);
              v28[4] = v12;
              objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, 0, 0, v28);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithPrimaryAction:", v15);
              objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setTintColor:", v17);

              objc_msgSend(v8, "addObject:", v16);
              objc_destroyWeak(&v29);
            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
          }
          while (v9);
        }

        -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](val->_amountPassView, "enterCurrencyAmountView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "amountTextField");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "inputAssistantItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3500]), "initWithBarButtonItems:representativeItem:", v8, 0);
        v35 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTrailingBarButtonGroups:", v22);

        objc_destroyWeak(&location);
        v7 = v24;
      }
    }

    self = val;
  }
  -[PKPeerPaymentActionAddMoneyViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");
  -[PKPeerPaymentActionAddMoneyViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNeedsLayout");

}

void __100__PKPeerPaymentActionAddMoneyViewController__currentAmountDidChangeTo_shouldGenerateNewSuggestions___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didSelectSuggestion:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_isCurrentAmountValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  char v14;

  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberByAdding:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "isEqualToNumber:", v10);

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "compare:", v12);

  if (!v13
    || v8 && objc_msgSend(v8, "compare:", v3) == -1
    || v7 && objc_msgSend(v7, "compare:", v3) == 1
    || v5 && objc_msgSend(v5, "compare:", v9) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = v11 ^ 1;
    if (v6 && objc_msgSend(v6, "compare:", v9) == -1)
      v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldShakeCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "compare:", v8);

    if (v9)
    {
      objc_msgSend(v4, "decimalNumberByAdding:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = v7 && objc_msgSend(v7, "compare:", v4) == -1 || v6 && objc_msgSend(v6, "compare:", v10) == -1;

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_showNavigationBarSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !v3;
  objc_msgSend(v5, "setEnabled:", v6);

  -[PKPeerPaymentActionAddMoneyViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PKPeerPaymentActionAddMoneyViewController _addBarButton](self, "_addBarButton");
  else
    -[PKPeerPaymentActionAddMoneyViewController _spinnerBarButton](self, "_spinnerBarButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKPeerPaymentActionAddMoneyViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
  -[PKPeerPaymentActionAddMoneyViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
  -[PKPeerPaymentActionAddMoneyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPeerPaymentActionAddMoneyViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  void *v3;
  id v4;

  -[PKPeerPaymentActionAddMoneyViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topUpController, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_amountPassView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
}

@end
