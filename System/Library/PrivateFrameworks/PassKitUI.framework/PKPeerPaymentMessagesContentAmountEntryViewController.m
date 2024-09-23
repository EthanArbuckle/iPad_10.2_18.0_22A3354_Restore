@implementation PKPeerPaymentMessagesContentAmountEntryViewController

- (PKPeerPaymentMessagesContentAmountEntryViewController)init
{
  PKPeerPaymentMessagesContentAmountEntryViewController *v2;
  NSDecimalNumber *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  PKCurrencyAmount *amount;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v2 = -[PKPeerPaymentMessagesContentAmountEntryViewController init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "one");
    v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesContentAmountEntryViewController _currentBalance](v2, "_currentBalance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = CFSTR("USD");
    PKCurrencyAmountCreate(v3, &v7->isa);
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v2->_amount;
    v2->_amount = (PKCurrencyAmount *)v8;

  }
  return v2;
}

- (PKPeerPaymentMessagesContentAmountEntryViewController)initWithMessagesAppController:(id)a3
{
  PKPeerPaymentMessagesContentAmountEntryViewController *v3;
  NSDecimalNumber *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  PKCurrencyAmount *amount;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v3 = -[PKPeerPaymentMessagesContentBaseViewController initWithMessagesAppController:](&v12, sel_initWithMessagesAppController_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "one");
    v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesContentAmountEntryViewController _currentBalance](v3, "_currentBalance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currency");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("USD");
    PKCurrencyAmountCreate(v4, &v8->isa);
    v9 = objc_claimAutoreleasedReturnValue();
    amount = v3->_amount;
    v3->_amount = (PKCurrencyAmount *)v9;

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PKPeerPaymentMessagesContentAmountEntryView *v9;
  PKPeerPaymentMessagesContentAmountEntryView *v10;
  PKPeerPaymentMessagesContentAmountEntryView *mainView;
  unint64_t context;
  uint64_t v13;
  void *v14;
  PKPeerPaymentMessagesContentAmountEntryView *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id WeakRetained;
  void *v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(id *, void *, uint64_t);
  void *v31;
  PKPeerPaymentMessagesContentAmountEntryViewController *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewDidLoad](&v42, sel_viewDidLoad);
  objc_initWeak(&location, self);
  -[PKPeerPaymentMessagesContentAmountEntryViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;

  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_presentationSemanticContext");

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentAlignment:", PKContentAlignmentMake());
  objc_msgSend(v8, "setVerticalPadding:", 0.0);
  objc_msgSend(v8, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v8, "setIgnoreTopSafeArea:", v7 == 2);
  v9 = [PKPeerPaymentMessagesContentAmountEntryView alloc];
  objc_msgSend(v8, "bounds");
  v10 = -[PKPeerPaymentMessagesContentAmountEntryView initWithFrame:](v9, "initWithFrame:");
  mainView = self->_mainView;
  self->_mainView = v10;

  -[PKPeerPaymentMessagesContentAmountEntryView setPresentationContext:](self->_mainView, "setPresentationContext:", v7);
  context = self->_context;
  v13 = MEMORY[0x1E0C809B0];
  if (context)
  {
    if (context == 1)
    {
      -[PKPeerPaymentMessagesContentAmountEntryView setSubtitleType:](self->_mainView, "setSubtitleType:", 1);
      -[PKPeerPaymentMessagesContentAmountEntryView memoField](self->_mainView, "memoField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", self->_memo);

      v15 = self->_mainView;
      v39[0] = v13;
      v39[1] = 3221225472;
      v39[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke;
      v39[3] = &unk_1E3E6F7D8;
      objc_copyWeak(&v40, &location);
      -[PKPeerPaymentMessagesContentAmountEntryView setMemoChangedHandler:](v15, "setMemoChangedHandler:", v39);
      objc_destroyWeak(&v40);
    }
  }
  else
  {
    -[PKPeerPaymentMessagesContentAmountEntryView setSubtitleType:](self->_mainView, "setSubtitleType:", 0);
  }
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_percentExpanded");
LABEL_7:
    v19 = v18;

    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = 1.0;
  if (WeakRetained)
  {
    v25 = WeakRetained;
    v26 = objc_loadWeakRetained((id *)&self->_delegate);
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "percentExpanded");
      goto LABEL_7;
    }
  }
LABEL_8:
  -[PKPeerPaymentMessagesContentAmountEntryView setPercentExpanded:](self->_mainView, "setPercentExpanded:", v19);
  objc_msgSend(v8, "addSubview:", self->_mainView);
  -[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAmount:", self->_amount);
  v37[0] = v13;
  v37[1] = 3221225472;
  v37[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_2;
  v37[3] = &unk_1E3E6F800;
  objc_copyWeak(&v38, &location);
  v37[4] = self;
  objc_msgSend(v20, "setAmountChangedHandler:", v37);
  v35[0] = v13;
  v35[1] = 3221225472;
  v35[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_3;
  v35[3] = &unk_1E3E61310;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v20, "setAmountTappedHandler:", v35);
  -[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (self->_showSendAndRequest)
  {
    objc_msgSend(v21, "setLeadingAction:", 2);
    objc_msgSend(v22, "setTrailingAction:", 1);
  }
  if (self->_showSetupRecurringSend)
    objc_msgSend(v22, "setCenterAction:", 7);
  v28 = v13;
  v29 = 3221225472;
  v30 = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_4;
  v31 = &unk_1E3E6F850;
  objc_copyWeak(&v34, &location);
  v32 = self;
  v23 = v20;
  v33 = v23;
  objc_msgSend(v22, "setActionHandler:", &v28);
  -[PKPeerPaymentMessagesContentAmountEntryViewController _registerForPresentationSemanticContextChanges](self, "_registerForPresentationSemanticContextChanges", v28, v29, v30, v31, v32);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke(id *a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setMemo:", v6);

  v4 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "memoDidChangeTo:", v6);

}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAmount:", v9);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1032));
  if (v4)
  {
    v5 = v4;
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1032));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1032));
      objc_msgSend(v8, "amountDidChangeTo:", v9);

    }
  }

}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationStyle");

  v12 = objc_loadWeakRetained(v1);
  objc_msgSend(v12, "appController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "presentationStyle");

    if (v7 != 1)
      return;
    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "mainView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "amountStepperView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "validateNumberPadInput");

    v12 = objc_loadWeakRetained(v1);
    objc_msgSend(v12, "appController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v5, "requestPresentationStyle:", v11);

}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[2];
  _QWORD v22[4];
  _QWORD v23[2];

  v5 = a2;
  objc_msgSend(v5, "setActivityIndicatorVisible:forAction:", 1, a3);
  objc_msgSend(v5, "setEnabled:", 0);
  v6 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "mainView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "amountStepperView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "validateNumberPadInput");

  objc_msgSend(a1[4], "sendAnalyticsForAction:", a3);
  objc_msgSend(a1[5], "setUsedKeypad:", 0);
  v10 = objc_loadWeakRetained((id *)a1[4] + 129);
  if (v10
    && (v11 = v10,
        v12 = objc_loadWeakRetained((id *)a1[4] + 129),
        v13 = objc_opt_respondsToSelector(),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v14 = objc_loadWeakRetained((id *)a1[4] + 129);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_5;
    v22[3] = &unk_1E3E6F828;
    v15 = (id *)v23;
    v23[0] = v5;
    v23[1] = a3;
    v16 = v5;
    objc_msgSend(v14, "handleAction:completion:", a3, v22);
  }
  else
  {
    v14 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v14, "appController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained(v6);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_7;
    v20[3] = &unk_1E3E6F828;
    v15 = (id *)v21;
    v21[0] = v5;
    v21[1] = a3;
    v19 = v5;
    objc_msgSend(v17, "handleAction:sender:completion:", a3, v18, v20);

  }
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_6;
  v4[3] = &unk_1E3E62010;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorVisible:forAction:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_8;
  v4[3] = &unk_1E3E62010;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorVisible:forAction:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentBaseViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPeerPaymentMessagesContentAmountEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonDisplayMode:", 2);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self->_mainView, "updateIsExpansionSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsKeypadSupported](self->_mainView, "updateIsKeypadSupported");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double Height;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[PKPeerPaymentMessagesContentAmountEntryViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v7);

  -[PKPeerPaymentMessagesContentAmountEntryView setNavigationBarHeight:](self->_mainView, "setNavigationBarHeight:", Height);
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self->_mainView, "updateIsExpansionSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsKeypadSupported](self->_mainView, "updateIsKeypadSupported");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_percentExpanded");
LABEL_3:
    v6 = v5;

    goto LABEL_4;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = 1.0;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v4, "percentExpanded");
      goto LABEL_3;
    }
  }
LABEL_4:
  -[PKPeerPaymentMessagesContentAmountEntryView setPercentExpanded:](self->_mainView, "setPercentExpanded:", v6);
}

- (void)reloadContent
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
  id v13;

  -[PKPeerPaymentMessagesContentAmountEntryViewController _currentBalance](self, "_currentBalance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_SECTION_HEADER_BALANCE_FORMAT"), CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesContentAmountEntryView balanceLabel](self->_mainView, "balanceLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self->_mainView, "updateIsExpansionSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsKeypadSupported](self->_mainView, "updateIsKeypadSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesContentAmountEntryViewController _minimumTransferAmount](self, "_minimumTransferAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinAmount:", v9);

  -[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesContentAmountEntryViewController _maximumTransferAmount](self, "_maximumTransferAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxAmount:", v11);

  if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"))
  {
    -[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "becomeFirstResponder");

  }
}

- (void)_noteAmountChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[PKCurrencyAmount amount](self->_amount, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesContentAmountEntryViewController _minimumTransferAmount](self, "_minimumTransferAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "compare:", v4) == -1)
  {
    v7 = 0;
  }
  else
  {
    -[PKCurrencyAmount amount](self->_amount, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesContentAmountEntryViewController _maximumTransferAmount](self, "_maximumTransferAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "compare:", v6) == 1)
    {
      v7 = 0;
    }
    else
    {
      -[PKCurrencyAmount amount](self->_amount, "amount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToNumber:", v9) ^ 1;

    }
  }

  -[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v7);

}

- (id)_minimumTransferAmount
{
  void *v3;
  void *v4;
  void *v5;
  PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v5;
    objc_msgSend(v5, "minimumTransferAmount");
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
    return v3;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    goto LABEL_5;
  }
  return v3;
}

- (id)_maximumTransferAmount
{
  void *v3;
  void *v4;
  void *v5;
  PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v5;
    objc_msgSend(v5, "maximumTransferAmount");
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
    return v3;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    goto LABEL_5;
  }
  return v3;
}

- (id)_currentBalance
{
  void *v3;
  void *v4;
  PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate **p_delegate;
  void *WeakRetained;
  void *v7;

  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v4;
    objc_msgSend(v4, "currentBalance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    return WeakRetained;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    goto LABEL_5;
  }
  return WeakRetained;
}

- (void)sendAnalyticsForAction:(unint64_t)a3
{
  int v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  id v17;

  -[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v17, "usedKeypad");
  v6 = (_QWORD *)MEMORY[0x1E0D685D8];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x1E0D685E0];
  MEMORY[0x1A1AE3A74](*v6, 0);
  v7 = v17;
  if (a3 == 2)
  {
    objc_msgSend(v17, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "amount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v12 = v11 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      PKAnalyticsAmountCategoryForAmount();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0D686E0]);

      objc_msgSend(v13, "setObject:forKey:", v11, *MEMORY[0x1E0D686E8]);
      v15 = self->_sourceType - 1;
      if (v15 > 2)
        v16 = CFSTR("unknown");
      else
        v16 = off_1E3E6FAA0[v15];
      objc_msgSend(v13, "setObject:forKey:", v16, *MEMORY[0x1E0D686F0]);
      PKAnalyticsSendEventWithDailyLimit();

    }
    v7 = v17;
  }

}

- (void)_registerForPresentationSemanticContextChanges
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__PKPeerPaymentMessagesContentAmountEntryViewController__registerForPresentationSemanticContextChanges__block_invoke;
  v6[3] = &unk_1E3E6F878;
  objc_copyWeak(&v7, &location);
  v5 = (id)objc_msgSend(v3, "registerForTraitChanges:withHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __103__PKPeerPaymentMessagesContentAmountEntryViewController__registerForPresentationSemanticContextChanges__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 128);
    objc_msgSend(v7, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentationContext:", objc_msgSend(v6, "_presentationSemanticContext"));

  }
}

- (void)setAmount:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_amount) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    -[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAmount:", v6);

    -[PKPeerPaymentMessagesContentAmountEntryViewController _noteAmountChanged](self, "_noteAmountChanged");
  }

}

- (void)setShowSendAndRequest:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_showSendAndRequest != a3)
  {
    v3 = a3;
    self->_showSendAndRequest = a3;
    -[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v3)
      v5 = 2;
    else
      v5 = 0;
    objc_msgSend(v4, "setLeadingAction:", v5);
    objc_msgSend(v6, "setTrailingAction:", v3);

  }
}

- (void)setShowSetupRecurringSend:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_showSetupRecurringSend != a3)
  {
    v3 = a3;
    self->_showSetupRecurringSend = a3;
    -[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v3)
      v5 = 7;
    else
      v5 = 0;
    objc_msgSend(v4, "setCenterAction:", v5);

  }
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

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)showSendAndRequest
{
  return self->_showSendAndRequest;
}

- (BOOL)showSetupRecurringSend
{
  return self->_showSetupRecurringSend;
}

- (PKPeerPaymentMessagesContentAmountEntryView)mainView
{
  return self->_mainView;
}

- (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate)delegate
{
  return (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainView, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
