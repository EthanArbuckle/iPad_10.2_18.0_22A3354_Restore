@implementation PKPeerPaymentActionTransferToBankAmountPickerViewController

- (PKPeerPaymentActionTransferToBankAmountPickerViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKPeerPaymentActionTransferToBankAmountPickerViewController *v13;
  PKPeerPaymentActionTransferToBankAmountPickerViewController *v14;
  CGPoint v15;
  CGSize v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  v13 = -[PKPeerPaymentActionViewController initWithPaymentPass:webService:passLibraryDataProvider:context:](&v35, sel_initWithPaymentPass_webService_passLibraryDataProvider_context_, v10, v11, v12, a6);
  v14 = v13;
  if (v13)
  {
    v15 = (CGPoint)*MEMORY[0x1E0C9D628];
    v16 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v13->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v13->_lastKeyboardFrame.size = v16;
    v13->_keyboardFrame.origin = v15;
    v13->_keyboardFrame.size = v16;
    -[PKPeerPaymentActionViewController account](v13, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentBalance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "amount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionViewController setCurrentAmount:](v14, "setCurrentAmount:", v19);

    -[PKPeerPaymentActionViewController currentAmount](v14, "currentAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](v14, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v20, 1);

    -[PKPeerPaymentActionTransferToBankAmountPickerViewController navigationItem](v14, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PERFORM_ACTION_TRANSFER_TO_BANK"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v22);

    objc_msgSend(v21, "setBackButtonDisplayMode:", 2);
    v23 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v23, "configureWithTransparentBackground");
    +[PKPeerPaymentActionViewController navigationBarBackgroundColor](PKPeerPaymentActionViewController, "navigationBarBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v21, "setStandardAppearance:", v23);
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _nextBarButton](v14, "_nextBarButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRightBarButtonItem:", v25);

    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateBarButtonEnabledState](v14, "_updateBarButtonEnabledState");
    objc_initWeak(&location, v14);
    objc_msgSend(v11, "peerPaymentService");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke;
    v32 = &unk_1E3E61BE0;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v26, "recurringPaymentsWithCompletion:", &v29);

    v27 = *MEMORY[0x1E0D6B130];
    objc_msgSend(v11, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], 0, 2, v29, v30, v31, v32);
    objc_msgSend(v11, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", v27, 0, 4);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v14;
}

void __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "type") == 3)
        {

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2;
          block[3] = &unk_1E3E61310;
          objc_copyWeak(&v9, (id *)(a1 + 32));
          dispatch_async(MEMORY[0x1E0C80D38], block);
          objc_destroyWeak(&v9);
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

LABEL_11:
}

void __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setCurrentAmount:", v1);

    objc_msgSend(WeakRetained, "currentAmount");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v2, 1);

  }
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  -[PKPeerPaymentActionViewController webService](self, "webService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D6B130];
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], 0, 2);
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", v4, 0, 4);

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController dealloc](&v5, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  self->_visibility = 1;
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");
  objc_msgSend(v4, "layoutIfNeeded");
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController updateFirstResponder](self, "updateFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  self->_visibility = 3;
  if (self->_keyboardVisible)
  {
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  self->_visibility = 2;
  if (self->_keyboardVisible)
  {
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  self->_visibility = 0;
  if (self->_keyboardVisible)
  {
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)loadView
{
  void *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  NSDecimalNumber *v6;
  void *v7;
  NSString *v8;
  void *v9;
  PKEnterCurrencyAmountPassView *v10;
  void *v11;
  PKEnterCurrencyAmountPassView *v12;
  PKEnterCurrencyAmountPassView *amountPassView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController loadView](&v19, sel_loadView);
  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currency");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [PKEnterCurrencyAmountPassView alloc];
  -[PKPeerPaymentActionViewController pass](self, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKEnterCurrencyAmountPassView initWithCurrenyAmount:pass:withdrawal:](v10, "initWithCurrenyAmount:pass:withdrawal:", v9, v11, 1);
  amountPassView = self->_amountPassView;
  self->_amountPassView = v12;

  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setClearAmountOnFirstKeyboardInput:", 1);
  if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"))
  {
    objc_msgSend(v14, "amountTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDisablePrediction:", 1);

  }
  -[PKEnterCurrencyAmountPassView setDelegate:](self->_amountPassView, "setDelegate:", self);
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_scrollView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_amountPassView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68160]);

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
  CGFloat x;
  double y;
  CGFloat height;
  CGFloat width;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;

  v45.receiver = self;
  v45.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController viewWillLayoutSubviews](&v45, sel_viewWillLayoutSubviews);
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "bounds");
  v13 = v7 + v12;
  v15 = v5 + v14;
  v17 = v16 - (v7 + v11);
  v19 = v18 - (v5 + v9);
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v13, v15, v17, v19);
  if (PKViewVisibilityStateIsVisible())
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      objc_msgSend(v3, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        x = v26;
        y = v27;
        width = v28;
        height = v29;
      }

    }
  }
  else
  {
    x = self->_lastKeyboardFrame.origin.x;
    y = self->_lastKeyboardFrame.origin.y;
    width = self->_lastKeyboardFrame.size.width;
    height = self->_lastKeyboardFrame.size.height;
  }
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v30 = 0.0;
  if (!CGRectIsNull(v46))
  {
    objc_msgSend(v3, "bounds");
    v30 = fmax(v31 + v32 - y, 0.0);
  }
  -[PKEnterCurrencyAmountPassView frame](self->_amountPassView, "frame", *(_QWORD *)&width, *(_QWORD *)&height);
  v33 = y;
  v35 = v34;
  v37 = v36;
  -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", v17, v19 - v30 + -15.0);
  v39 = v38;
  v40 = v17;
  v42 = v41;
  -[PKEnterCurrencyAmountPassView setFrame:](self->_amountPassView, "setFrame:", v35, v37, v38, v41);
  v47.origin.x = v35;
  v47.origin.y = v37;
  v47.size.width = v39;
  v47.size.height = v42;
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v40, v30 + CGRectGetMaxY(v47) + 15.0);
  self->_lastKeyboardFrame.origin.x = x;
  self->_lastKeyboardFrame.origin.y = v33;
  self->_lastKeyboardFrame.size.width = v43;
  self->_lastKeyboardFrame.size.height = v44;

}

- (void)willDismissViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController willDismissViewController](&v4, sel_willDismissViewController);
  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

}

- (void)updateFirstResponder
{
  void *v2;
  id v3;

  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "amountTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)updateAccountValues
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
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController updateAccountValues](&v16, sel_updateAccountValues);
  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");
  if (v3)
  {
    objc_msgSend(v3, "currentBalance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrency:", v7);

    objc_msgSend(v6, "sizeToFit");
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCurrencyCode:", v9);

    -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaxLoadAmount:", v10);

    -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinLoadAmount:", v11);

    objc_msgSend(v8, "setMaxBalance:", v5);
    -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinBalance:", v12);

    objc_msgSend(v4, "amount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCardBalance:", v13);

    objc_msgSend(v8, "sizeToFit");
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController setMaxBalance:](self, "setMaxBalance:", v5);
    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v14, 1);

    -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

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
  v7[2] = __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillShow___block_invoke(uint64_t a1)
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
  v3 = *(double *)(v2 + 1104);
  v4 = *(double *)(v2 + 1112);
  v5 = *(double *)(v2 + 1120);
  v6 = *(double *)(v2 + 1128);
  *(_BYTE *)(v2 + 1097) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1104);
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
    *(_OWORD *)(v8 + 1120) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1104), v16);
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
      v7[2] = __82__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __82__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillChange___block_invoke(uint64_t a1)
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
  v3 = v2 + 138;
  v4 = *((double *)v2 + 138);
  v5 = *((double *)v2 + 139);
  v6 = *((double *)v2 + 140);
  v7 = *((double *)v2 + 141);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1104), v13);
}

- (void)keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E3E61918;
    v3[4] = self;
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
  }
}

BOOL __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1104);
  *(_BYTE *)(v1 + 1097) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1104);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (v4)
  {
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      if (v4[2](v4))
      {
        objc_msgSend(v6, "setNeedsLayout");
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __94__PKPeerPaymentActionTransferToBankAmountPickerViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E3E612E8;
        v9 = v6;
        objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v8, 0);

      }
    }
    else
    {
      v4[2](v4);
    }

  }
}

uint64_t __94__PKPeerPaymentActionTransferToBankAmountPickerViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3
{
  id v3;

  -[PKPeerPaymentActionTransferToBankAmountPickerViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

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
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController setMaxBalance:](&v8, sel_setMaxBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaxBalance:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

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
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController setMinBalance:](&v8, sel_setMinBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinBalance:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

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
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController setMaxLoadAmount:](&v8, sel_setMaxLoadAmount_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaxLoadAmount:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

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
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController setMinLoadAmount:](&v8, sel_setMinLoadAmount_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinLoadAmount:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
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
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  -[PKPeerPaymentActionViewController setCardBalance:](&v8, sel_setCardBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKEnterCurrencyAmountPassView balanceView](self->_amountPassView, "balanceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCardBalance:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v7, 1);

  }
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
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
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v25;

  v7 = a4;
  v8 = a5;
  if (-[PKPeerPaymentActionTransferToBankAmountPickerViewController _shouldShakeWithNewAmount:](self, "_shouldShakeWithNewAmount:", v8))
  {
    -[PKEnterCurrencyAmountPassView shakePassView](self->_amountPassView, "shakePassView");
  }
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decimalNumberBySubtracting:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decimalNumberBySubtracting:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "compare:", v15) == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v25 = v12;
    v16 = v9;
    v17 = v11;
    v18 = v8;
    v19 = v10;
    v20 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v13, "compare:", v21);

    v7 = v20;
    v10 = v19;
    v8 = v18;
    v11 = v17;
    v9 = v16;
    v12 = v25;

    if (v22 == -1)
    {
LABEL_16:
      v23 = 0;
      goto LABEL_17;
    }
  }
  else
  {

  }
  if (v12 && objc_msgSend(v12, "compare:", v7) == -1 && objc_msgSend(v12, "compare:", v8) == -1
    || v11 && objc_msgSend(v11, "compare:", v14) == -1 && objc_msgSend(v11, "compare:", v13) == -1)
  {
    goto LABEL_16;
  }
  v23 = !v10 || objc_msgSend(v10, "compare:", v14) != 1 || objc_msgSend(v10, "compare:", v13) != 1;
LABEL_17:

  return v23;
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
  objc_msgSend(v4, "subtractAmountFromBalance:", v5);

  -[PKPeerPaymentActionTransferToBankAmountPickerViewController _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v5, 1);
}

- (id)_nextBarButton
{
  void *v3;
  void *v4;

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PERFORM_ACTION_NEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v3, 2, self, sel__nextBarButtonPressed_);
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);

  return v4;
}

- (void)_updateBarButtonEnabledState
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[PKPeerPaymentActionTransferToBankAmountPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentActionViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[PKPeerPaymentActionTransferToBankAmountPickerViewController _isCurrentAmountValid](self, "_isCurrentAmountValid");
  else
    v5 = 0;
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)_nextBarButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD aBlock[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v14, &location);
  v6 = _Block_copy(aBlock);
  -[PKPeerPaymentActionViewController webService](self, "webService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peerPaymentService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_2;
  v10[3] = &unk_1E3E6F600;
  v10[4] = self;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "recurringPaymentsWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke(uint64_t a1)
{
  PKPeerPaymentActionTransferToBankViewController *v1;
  void *v2;
  void *v3;
  void *v4;
  PKPeerPaymentActionTransferToBankViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKPeerPaymentActionTransferToBankViewController alloc];
    objc_msgSend(WeakRetained, "pass");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "webService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passLibraryDataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPeerPaymentActionTransferToBankViewController initWithPaymentPass:webService:passLibraryDataProvider:context:](v1, "initWithPaymentPass:webService:passLibraryDataProvider:context:", v2, v3, v4, objc_msgSend(WeakRetained, "context"));

    v6 = objc_msgSend(WeakRetained, "controllerAction");
    objc_msgSend(WeakRetained, "currentAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionViewController setCurrentAmount:](v5, "setCurrentAmount:", v7);

    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionViewController setDelegate:](v5, "setDelegate:", v8);

    -[PKPeerPaymentActionViewController setControllerAction:](v5, "setControllerAction:", v6);
    objc_msgSend(WeakRetained, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v5, 1);

  }
}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "type") == 3)
        {
          v4 = v7;
          objc_msgSend(a1[4], "account");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "currentBalance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "amount");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[4], "currentAmount");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "pk_isNotANumber") & 1) != 0 || (objc_msgSend(v12, "pk_isNotANumber") & 1) != 0)
          {
            v8 = 0;
          }
          else
          {
            objc_msgSend(v11, "decimalNumberBySubtracting:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "threshold");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v14, "compare:", v13) == 1;

          }
          goto LABEL_15;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_15:

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_3;
  v16[3] = &unk_1E3E687B0;
  objc_copyWeak(&v19, a1 + 6);
  v20 = v8;
  v17 = v4;
  v18 = a1[5];
  v15 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

  objc_destroyWeak(&v19);
}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "currencyThreshold");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "minimalFormattedStringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currencyAmount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minimalFormattedStringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_TRANSFER_MINIMUM_BALANCE_MESSAGE"), CFSTR("%@%@"), v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_TRANSFER_MINIMUM_BALANCE_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v7, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_TRANSFER_MINIMUM_BALANCE_EDIT_AMOUNT"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, &__block_literal_global_149);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v13);
      v14 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_TRANSFER_MINIMUM_BALANCE_EDIT_AUTO_RELOAD"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, &__block_literal_global_72);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v16);

      v17 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_TRANSFER_MINIMUM_BALANCE_CONTINUE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_6;
      v21[3] = &unk_1E3E61CA8;
      v22 = *(id *)(a1 + 40);
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v19);

      objc_msgSend(v10, "setPreferredAction:", v13);
      objc_msgSend(WeakRetained, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentViewController:animated:completion:", v10, 1, 0);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_5()
{
  __CFString *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), *MEMORY[0x1E0D6BB10], *MEMORY[0x1E0D6BAF8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((PKRunningInPassbook() & 1) != 0)
  {
    v0 = CFSTR("wallet://");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/"), *MEMORY[0x1E0D6BCB0]);
    v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)MEMORY[0x1E0C99E98];
  -[__CFString stringByAppendingString:](v0, "stringByAppendingString:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

uint64_t __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  objc_msgSend(v6, "subtractAmountFromBalance:", v8);

  -[PKEnterCurrencyAmountPassView enterCurrencyAmountView](self->_amountPassView, "enterCurrencyAmountView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentAmount:", v8);

  -[PKPeerPaymentActionTransferToBankAmountPickerViewController _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v8, v4);
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  id v5;

  -[PKPeerPaymentActionTransferToBankAmountPickerViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState", a3, a4);
  -[PKPeerPaymentActionTransferToBankAmountPickerViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (BOOL)_shouldShakeWithNewAmount:(id)a3
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
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
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
      objc_msgSend(v5, "decimalNumberBySubtracting:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = v7 && objc_msgSend(v7, "compare:", v4) == -1 || v6 && objc_msgSend(v6, "compare:", v10) == 1;

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
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

  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decimalNumberBySubtracting:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToNumber:", v10);

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  if (!v13
    || v6 && objc_msgSend(v6, "compare:", v8) == -1
    || v7 && objc_msgSend(v7, "compare:", v8) == 1
    || v4 && objc_msgSend(v4, "compare:", v9) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = v11 ^ 1;
    if (v5 && objc_msgSend(v5, "compare:", v9) == -1)
      v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountPassView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
