@implementation PKPerformActionEnterValueView

- (PKPerformActionEnterValueView)init
{
  return -[PKPerformActionEnterValueView initWithPass:action:paymentDataProvider:](self, "initWithPass:action:paymentDataProvider:", 0, 0, 0);
}

- (PKPerformActionEnterValueView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPerformActionEnterValueView *v12;
  PKPerformActionEnterValueView *v13;
  uint64_t v14;
  NSDecimalNumber *cardBalance;
  uint64_t v16;
  NSDecimalNumber *currentAmount;
  void *v18;
  int v19;
  uint64_t v20;
  PKPeerPaymentService *peerPaymentService;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDecimalNumber *minLoadAmount;
  void *v26;
  uint64_t v27;
  NSDecimalNumber *maxLoadAmount;
  void *v29;
  uint64_t v30;
  NSDecimalNumber *minLoadedBalance;
  void *v32;
  uint64_t v33;
  NSDecimalNumber *maxLoadedBalance;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  PKNumericSuggestionLastInput *lastInput;
  uint64_t v43;
  PKNumericSuggestionsEnterValueAlgorithm *suggestionGenerator;
  PKNumericSuggestionsEnterValueAlgorithm *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  objc_super v50;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "type") == 1)
  {
    v50.receiver = self;
    v50.super_class = (Class)PKPerformActionEnterValueView;
    v12 = -[PKPerformActionEnterValueView init](&v50, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_pass, a3);
      objc_storeStrong((id *)&v13->_action, a4);
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v14 = objc_claimAutoreleasedReturnValue();
      cardBalance = v13->_cardBalance;
      v13->_cardBalance = (NSDecimalNumber *)v14;

      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v16 = objc_claimAutoreleasedReturnValue();
      currentAmount = v13->_currentAmount;
      v13->_currentAmount = (NSDecimalNumber *)v16;

      objc_msgSend(v9, "paymentPass");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasAssociatedPeerPaymentAccount");

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
        v20 = objc_claimAutoreleasedReturnValue();
        peerPaymentService = v13->_peerPaymentService;
        v13->_peerPaymentService = (PKPeerPaymentService *)v20;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObserver:selector:name:object:", v13, sel__peerPaymentAccountChanged_, *MEMORY[0x1E0D6B288], v13->_peerPaymentService);

        -[PKPerformActionEnterValueView _updatePeerPaymentAccount](v13, "_updatePeerPaymentAccount");
      }
      objc_msgSend(v10, "enteredValueItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "minLoadAmount");
      v24 = objc_claimAutoreleasedReturnValue();
      minLoadAmount = v13->_minLoadAmount;
      v13->_minLoadAmount = (NSDecimalNumber *)v24;

      objc_msgSend(v10, "enteredValueItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "maxLoadAmount");
      v27 = objc_claimAutoreleasedReturnValue();
      maxLoadAmount = v13->_maxLoadAmount;
      v13->_maxLoadAmount = (NSDecimalNumber *)v27;

      objc_msgSend(v10, "enteredValueItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "minLoadedBalance");
      v30 = objc_claimAutoreleasedReturnValue();
      minLoadedBalance = v13->_minLoadedBalance;
      v13->_minLoadedBalance = (NSDecimalNumber *)v30;

      objc_msgSend(v10, "enteredValueItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "maxLoadedBalance");
      v33 = objc_claimAutoreleasedReturnValue();
      maxLoadedBalance = v13->_maxLoadedBalance;
      v13->_maxLoadedBalance = (NSDecimalNumber *)v33;

      -[PKPass paymentPass](v13->_pass, "paymentPass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = +[PKPaymentAutoReloadSetupController shouldOfferAutoReloadForPass:](PKPaymentAutoReloadSetupController, "shouldOfferAutoReloadForPass:", v35);

      if ((_DWORD)v32)
        v13->_shouldShowAutoReloadButton = 1;
      objc_storeStrong((id *)&v13->_paymentServiceDataProvider, a5);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PKPaymentDataProvider addDelegate:](v13->_paymentServiceDataProvider, "addDelegate:", v13);
      objc_msgSend(v10, "enteredValueItem", 552);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "currency");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = PKMaximumFractionDigitsForCurrencyCode();
      v39 = objc_alloc(MEMORY[0x1E0D66E88]);
      objc_msgSend(v9, "serialNumber");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "initWithPassSerialNumber:", v40);
      lastInput = v13->_lastInput;
      v13->_lastInput = (PKNumericSuggestionLastInput *)v41;

      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66E90]), "initWithLastInput:", v13->_lastInput);
      suggestionGenerator = v13->_suggestionGenerator;
      v13->_suggestionGenerator = (PKNumericSuggestionsEnterValueAlgorithm *)v43;

      -[PKNumericSuggestionsEnterValueAlgorithm setPowerOfTenFactor:](v13->_suggestionGenerator, "setPowerOfTenFactor:", 3 - v38);
      -[PKNumericSuggestionsEnterValueAlgorithm setDecimalPrecision:](v13->_suggestionGenerator, "setDecimalPrecision:", v38);
      -[PKNumericSuggestionsEnterValueAlgorithm setCurrencyCode:](v13->_suggestionGenerator, "setCurrencyCode:", v37);
      -[PKNumericSuggestionsEnterValueAlgorithm setCardBalance:](v13->_suggestionGenerator, "setCardBalance:", v13->_cardBalance);
      -[PKNumericSuggestionsEnterValueAlgorithm setMaxLoadAmount:](v13->_suggestionGenerator, "setMaxLoadAmount:", *(Class *)((char *)&v13->super.super.super.isa + v49));
      -[PKNumericSuggestionsEnterValueAlgorithm setMinLoadAmount:](v13->_suggestionGenerator, "setMinLoadAmount:", v13->_minLoadAmount);
      -[PKNumericSuggestionsEnterValueAlgorithm setMinBalance:](v13->_suggestionGenerator, "setMinBalance:", v13->_minLoadedBalance);
      -[PKNumericSuggestionsEnterValueAlgorithm setMaxBalance:](v13->_suggestionGenerator, "setMaxBalance:", v13->_maxLoadedBalance);
      v45 = v13->_suggestionGenerator;
      -[PKPaymentPassAction enteredValueItem](v13->_action, "enteredValueItem");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "defaultSuggestions");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKNumericSuggestionsEnterValueAlgorithm setDefaultValues:](v45, "setDefaultValues:", v47);

      -[PKPerformActionEnterValueView _createSubviews](v13, "_createSubviews");
      -[PKPerformActionEnterValueView _updateCurrentAmount:shouldGenerateNewSuggestions:](v13, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v13->_currentAmount, 1);
      -[PKPerformActionEnterValueView _readCurrentBalance](v13, "_readCurrentBalance");

    }
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentDataProvider removeDelegate:](self->_paymentServiceDataProvider, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPerformActionEnterValueView;
  -[PKPerformActionEnterValueView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double Width;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MinX;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v37.receiver = self;
  v37.super_class = (Class)PKPerformActionEnterValueView;
  -[PKPerformActionEnterValueView layoutSubviews](&v37, sel_layoutSubviews);
  -[PKPerformActionEnterValueView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPerformActionEnterValueView _amountTopPadding](self, "_amountTopPadding");
  v35 = v11;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v8, 1.79769313e308);
  v13 = v12;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  MinX = CGRectGetMinX(v38);
  v39.origin.x = v4;
  v39.origin.y = v6;
  v14 = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  Width = CGRectGetWidth(v39);
  -[PKEnterCurrencyAmountView setFrame:](self->_enterCurrencyAmountView, "setFrame:", MinX, v35, Width, v13);
  -[PKEnterValueNewBalanceView sizeThatFits:](self->_newBalanceView, "sizeThatFits:", v8, 1.79769313e308);
  v17 = v16;
  v40.origin.x = v4;
  v40.origin.y = v14;
  v40.size.width = v8;
  v40.size.height = v10;
  v18 = CGRectGetMinX(v40);
  v41.origin.x = MinX;
  v41.origin.y = v35;
  v41.size.width = Width;
  v41.size.height = v13;
  v19 = CGRectGetMaxY(v41) + 6.0;
  v42.origin.x = v4;
  v42.origin.y = v14;
  v42.size.width = v8;
  v42.size.height = v10;
  v36 = v17;
  -[PKEnterValueNewBalanceView setFrame:](self->_newBalanceView, "setFrame:", v18, v19, CGRectGetWidth(v42), v17);
  -[PKNumberPadSuggestionsView frame](self->_suggestionView, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[PKNumberPadSuggestionsView setFrame:](self->_suggestionView, "setFrame:");
  if (self->_shouldShowAutoReloadButton)
  {
    -[PKEnterCurrencyAmountView defaultKeyboardSize](self->_enterCurrencyAmountView, "defaultKeyboardSize");
    v33 = v19;
    v27 = v26;
    v43.origin.x = v21;
    v43.origin.y = v23;
    v43.size.width = v8;
    v43.size.height = v25;
    v28 = v27 + CGRectGetHeight(v43);
    -[UIButton sizeThatFits:](self->_autoReloadButton, "sizeThatFits:", v8, 1.79769313e308);
    v30 = v29;
    v44.origin.x = v4;
    v44.origin.y = v14;
    v44.size.width = v8;
    v44.size.height = v10;
    v31 = CGRectGetMinX(v44);
    v45.origin.x = v4;
    v45.origin.y = v14;
    v45.size.width = v8;
    v45.size.height = v10;
    v32 = CGRectGetWidth(v45);
    v46.origin.x = v4;
    v46.origin.y = v14;
    v46.size.width = v8;
    v46.size.height = v10;
    -[UIButton setFrame:](self->_autoReloadButton, "setFrame:", v31, v36 + v33 + (CGRectGetMaxY(v46) - v28 - v30 - v33 - v36 + 15.0) * 0.5, v32, v30);
  }
}

- (id)pass
{
  return self->_pass;
}

- (id)transactionAmount
{
  return self->_currentAmount;
}

- (id)transactionCurrency
{
  void *v2;
  void *v3;

  -[PKPaymentPassAction enteredValueItem](self->_action, "enteredValueItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  PKPaymentPassAction *action;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  NSDecimalNumber *currentAmount;
  void *v9;
  id v10;

  action = self->_action;
  v5 = (void (**)(id, void *))a3;
  -[PKPaymentPassAction enteredValueItem](action, "enteredValueItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceProviderData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  currentAmount = self->_currentAmount;
  if (currentAmount)
    objc_msgSend(v10, "setObject:forKey:", currentAmount, *MEMORY[0x1E0D6B598]);
  v9 = (void *)objc_msgSend(v10, "copy");
  v5[2](v5, v9);

}

- (void)willDismissViewController
{
  -[PKEnterCurrencyAmountView dismissKeyboard](self->_enterCurrencyAmountView, "dismissKeyboard");
}

- (void)setCardBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_cardBalance;
  char v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  void *v11;
  NSDecimalNumber *v12;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_cardBalance = &self->_cardBalance;
  if (self->_cardBalance != v5)
  {
    v12 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v12;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cardBalance, a3);
      if (!*p_cardBalance)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *p_cardBalance;
        *p_cardBalance = (NSDecimalNumber *)v9;

      }
      -[PKNumericSuggestionsEnterValueAlgorithm setCardBalance:](self->_suggestionGenerator, "setCardBalance:");
      -[PKEnterValueNewBalanceView setCardBalance:](self->_newBalanceView, "setCardBalance:", *p_cardBalance);
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPerformActionEnterValueView _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v11, 1);

      v6 = v12;
    }
  }

}

- (void)setMaxLoadedBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_maxLoadedBalance;
  char v8;
  void *v9;
  NSDecimalNumber *v10;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_maxLoadedBalance = &self->_maxLoadedBalance;
  if (self->_maxLoadedBalance != v5)
  {
    v10 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v10;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maxLoadedBalance, a3);
      -[PKNumericSuggestionsEnterValueAlgorithm setMaxBalance:](self->_suggestionGenerator, "setMaxBalance:", *p_maxLoadedBalance);
      -[PKEnterValueNewBalanceView setMaxBalance:](self->_newBalanceView, "setMaxBalance:", *p_maxLoadedBalance);
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPerformActionEnterValueView _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v9, 1);

      v6 = v10;
    }
  }

}

- (void)setMinBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  char v7;
  void *v8;
  NSDecimalNumber *v9;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  if (self->_minLoadedBalance != v5)
  {
    v9 = v5;
    v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_minLoadedBalance, a3);
      -[PKNumericSuggestionsEnterValueAlgorithm setMinBalance:](self->_suggestionGenerator, "setMinBalance:", self->_minLoadedBalance);
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPerformActionEnterValueView _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, 1);

      v6 = v9;
    }
  }

}

- (void)setDelegate:(id)a3
{
  PKPerformActionViewDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v6);
  objc_msgSend(v6, "setRightBarButtonEnabled:", -[PKPerformActionEnterValueView _isCurrentAmountValid](self, "_isCurrentAmountValid"));

}

- (void)saveLastInputValues
{
  void *v3;
  uint64_t v4;

  if (self->_maxLoadedBalance)
  {
    -[NSDecimalNumber decimalNumberByAdding:](self->_currentAmount, "decimalNumberByAdding:", self->_cardBalance);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToNumber:", self->_maxLoadedBalance);

  }
  else
  {
    v4 = 0;
  }
  -[PKNumericSuggestionLastInput setWentToMax:](self->_lastInput, "setWentToMax:", v4);
  -[PKNumericSuggestionLastInput setValue:](self->_lastInput, "setValue:", self->_currentAmount);
  -[PKNumericSuggestionLastInput save](self->_lastInput, "save");
}

- (UITextField)amountTextField
{
  return -[PKEnterCurrencyAmountView amountTextField](self->_enterCurrencyAmountView, "amountTextField");
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPerformActionEnterValueView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPerformActionEnterValueView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "uniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    v2 = PKEqualObjects();

    if ((v2 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 488), *(id *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_updateCurrentBalanceWithUpdatedTransitProperties");
    }
  }
  else
  {

  }
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPerformActionEnterValueView _shouldShakeCard:](self, "_shouldShakeCard:", v6);

  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "usedMaximumSuggestion");

  -[PKPerformActionEnterValueView _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, v9 | v7);
  if (v7)
  {
    -[PKPerformActionEnterValueView delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shakeCard");

  }
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSDecimalNumber *maxLoadedBalance;
  BOOL v13;

  v7 = a4;
  v8 = a5;
  if (-[PKPerformActionEnterValueView _shouldShakeCard:](self, "_shouldShakeCard:", v8))
  {
    -[PKPerformActionEnterValueView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shakeCard");

  }
  -[NSDecimalNumber decimalNumberByAdding:](self->_cardBalance, "decimalNumberByAdding:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberByAdding:](self->_cardBalance, "decimalNumberByAdding:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  maxLoadedBalance = self->_maxLoadedBalance;
  v13 = !maxLoadedBalance
     || -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", v10) != NSOrderedAscending
     || -[NSDecimalNumber compare:](self->_maxLoadedBalance, "compare:", v11) != NSOrderedAscending
     || objc_msgSend(v10, "compare:", v11) == 1;

  return v13;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  NSDecimalNumber *v4;
  NSDecimalNumber *currentAmount;
  NSDecimalNumber *v6;

  objc_msgSend(a3, "currentAmount");
  v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  currentAmount = self->_currentAmount;
  self->_currentAmount = v4;
  v6 = v4;

  -[PKEnterValueNewBalanceView addAmountToBalance:](self->_newBalanceView, "addAmountToBalance:", v6);
  -[PKPerformActionEnterValueView _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v6, 1);

}

- (void)_updatePeerPaymentAccount
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKPerformActionEnterValueView__updatePeerPaymentAccount__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__PKPerformActionEnterValueView__updatePeerPaymentAccount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "account");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 528);
  *(_QWORD *)(v3 + 528) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v10, "isEqual:", v6),
        v6,
        !v7))
  {
    v9 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v8;
  }
  v11 = v9;
  objc_msgSend(*(id *)(a1 + 32), "setCardBalance:", v9);

}

- (void)_readCurrentBalance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  PKPaymentDataProvider *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[7];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  PKPerformActionEnterValueView *v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[5];
  id v39;

  -[PKPass paymentPass](self->_pass, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasAssociatedPeerPaymentAccount"))
    {
      -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "amount");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6
        || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v6, "isEqual:", v7),
            v7,
            v8))
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      -[PKPerformActionEnterValueView setCardBalance:](self, "setCardBalance:", v6);
      goto LABEL_20;
    }
    objc_msgSend(v4, "devicePrimaryPaymentApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__60;
    v38[4] = __Block_byref_object_dispose__60;
    -[PKPaymentPassAction associatedEnteredValueIdentifier](self->_action, "associatedEnteredValueIdentifier");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = 0;
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke;
    aBlock[3] = &unk_1E3E78EB0;
    v6 = v10;
    v32 = v6;
    v33 = v4;
    v34 = self;
    v35 = v36;
    v12 = _Block_copy(aBlock);
    if (-[PKPass isRemotePass](self->_pass, "isRemotePass"))
    {
      v13 = objc_alloc_init(getNPKCompanionAgentConnectionClass_7());
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKPass uniqueID](self->_pass, "uniqueID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v11;
        v29[1] = 3221225472;
        v29[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_2;
        v29[3] = &unk_1E3E78ED8;
        v30 = v12;
        objc_msgSend(v13, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v14, v6, v29);

      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_13;
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      -[PKPass uniqueID](self->_pass, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_4;
      v27[3] = &unk_1E3E78ED8;
      v28 = v12;
      -[PKPaymentDataProvider transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentServiceDataProvider, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v16, v6, v27);

      v13 = v28;
    }

LABEL_13:
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_6;
    v26[3] = &unk_1E3E78F28;
    v26[5] = v38;
    v26[6] = v36;
    v26[4] = self;
    v17 = _Block_copy(v26);
    if (-[PKPass isRemotePass](self->_pass, "isRemotePass"))
    {
      v18 = objc_alloc_init(getNPKCompanionAgentConnectionClass_7());
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKPass uniqueID](self->_pass, "uniqueID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v11;
        v24[1] = 3221225472;
        v24[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_8;
        v24[3] = &unk_1E3E617C0;
        v25 = v17;
        objc_msgSend(v18, "balancesForPaymentPassWithUniqueIdentifier:completion:", v19, v24);

      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:

        _Block_object_dispose(v36, 8);
        _Block_object_dispose(v38, 8);

LABEL_20:
        goto LABEL_21;
      }
      v20 = self->_paymentServiceDataProvider;
      -[PKPass uniqueID](self->_pass, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_10;
      v22[3] = &unk_1E3E617C0;
      v23 = v17;
      -[PKPaymentDataProvider balancesForPaymentPassWithUniqueIdentifier:completion:](v20, "balancesForPaymentPassWithUniqueIdentifier:completion:", v21, v22);

      v18 = v23;
    }

    goto LABEL_19;
  }
LABEL_21:

}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  id obj;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "balanceAmount");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = PKEqualObjects();

    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 488), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 48), "_updateCurrentBalanceWithUpdatedTransitProperties");
    }
  }

}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_3;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_5;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_6(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a2, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    v16 = (id)*MEMORY[0x1E0D6ACB8];
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1[5] + 8);
        v11 = *(_QWORD *)(v9 + 40);
        v10 = (id *)(v9 + 40);
        if (!v11 && !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
          objc_storeStrong(v10, v16);
        objc_msgSend(v8, "identifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v6;
        v18[1] = 3221225472;
        v18[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_7;
        v18[3] = &unk_1E3E78F00;
        v18[4] = a1[5];
        v13 = objc_msgSend(v12, "pk_hasObjectPassingTest:", v18);

        if (v13)
        {
          v14 = (void *)a1[4];
          objc_msgSend(v8, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setCardBalance:", v15);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

}

BOOL __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v5 && v4)
      v7 = objc_msgSend(v4, "caseInsensitiveCompare:", v5) == 0;
  }

  return v7;
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_9;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_11;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_updateCurrentBalanceWithUpdatedTransitProperties
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[PKTransitPassProperties balance](self->_transitProperties, "balance");
  v3 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v7, "isEqualToNumber:", v4),
        v4,
        v3 = (uint64_t)v7,
        (v5 & 1) == 0))
  {
    -[PKPerformActionEnterValueView setCardBalance:](self, "setCardBalance:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPerformActionEnterValueView setCardBalance:](self, "setCardBalance:", v6);

  }
}

- (BOOL)_shouldShakeCard:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  NSDecimalNumber *maxLoadAmount;
  NSDecimalNumber *maxLoadedBalance;

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "compare:", v5),
        v5,
        v6))
  {
    objc_msgSend(v4, "decimalNumberByAdding:", self->_cardBalance);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    v10 = 1;
    if (v9 <= 7)
    {
      maxLoadAmount = self->_maxLoadAmount;
      if (!maxLoadAmount || -[NSDecimalNumber compare:](maxLoadAmount, "compare:", v4) != NSOrderedAscending)
      {
        maxLoadedBalance = self->_maxLoadedBalance;
        if (!maxLoadedBalance || -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", v7) != NSOrderedAscending)
          v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)_amountTopPadding
{
  void *v3;
  uint64_t v4;

  if (PKUIGetMinScreenWidthType()
    && (-[PKPerformActionEnterValueView traitCollection](self, "traitCollection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "verticalSizeClass"),
        v3,
        v4 != 1))
  {
    return 44.0;
  }
  else
  {
    return 6.0;
  }
}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  objc_storeStrong((id *)&self->_currentAmount, a3);
  v7 = a3;
  -[PKEnterValueNewBalanceView addAmountToBalance:](self->_newBalanceView, "addAmountToBalance:", v7);
  -[PKEnterCurrencyAmountView setCurrentAmount:](self->_enterCurrencyAmountView, "setCurrentAmount:", v7);
  -[PKPerformActionEnterValueView _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v7, v4);

}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  void *v5;
  id WeakRetained;

  if (a4)
  {
    -[PKNumericSuggestionsEnterValueAlgorithm suggestionsWithAmount:](self->_suggestionGenerator, "suggestionsWithAmount:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumberPadSuggestionsView setSuggestions:](self->_suggestionView, "setSuggestions:", v5);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", -[PKPerformActionEnterValueView _isCurrentAmountValid](self, "_isCurrentAmountValid"));

  -[PKPerformActionEnterValueView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isCurrentAmountValid
{
  NSDecimalNumber *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDecimalNumber *maxLoadedBalance;
  NSDecimalNumber *minLoadedBalance;
  char v11;

  v3 = self->_currentAmount;
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDecimalNumber isEqualToNumber:](v3, "isEqualToNumber:", v4);

  -[NSDecimalNumber decimalNumberByAdding:](v3, "decimalNumberByAdding:", self->_cardBalance);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSDecimalNumber compare:](v3, "compare:", v7);

  if (!v8
    || (maxLoadedBalance = self->_maxLoadedBalance) != 0
    && -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", v6) == NSOrderedAscending
    || (minLoadedBalance = self->_minLoadedBalance) != 0
    && -[NSDecimalNumber compare:](minLoadedBalance, "compare:", v6) == NSOrderedDescending
    || self->_minLoadAmount && -[NSDecimalNumber compare:](self->_currentAmount, "compare:") == NSOrderedAscending)
  {
    v11 = 0;
  }
  else
  {
    v11 = v5 ^ 1;
    if (self->_maxLoadAmount && -[NSDecimalNumber compare:](self->_currentAmount, "compare:") == NSOrderedDescending)
      v11 = 0;
  }

  return v11;
}

- (void)_createSubviews
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  PKEnterCurrencyAmountView *v7;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  PKNumberPadSuggestionsView *v9;
  PKNumberPadSuggestionsView *suggestionView;
  PKEnterValueNewBalanceView *v11;
  void *v12;
  void *v13;
  PKEnterValueNewBalanceView *v14;
  PKEnterValueNewBalanceView *newBalanceView;
  UIButton *v16;
  UIButton *autoReloadButton;
  void *v18;
  void *v19;
  id v20;

  v3 = *MEMORY[0x1E0DC1448];
  PKRoundedSystemFontOfSizeAndWeight(60.0, *MEMORY[0x1E0DC1448]);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  PKRoundedSystemFontOfSizeAndWeight(36.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction enteredValueItem](self->_action, "enteredValueItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKEnterCurrencyAmountView initWithCurrency:amount:]([PKEnterCurrencyAmountView alloc], "initWithCurrency:amount:", v6, self->_currentAmount);
  enterCurrencyAmountView = self->_enterCurrencyAmountView;
  self->_enterCurrencyAmountView = v7;

  -[PKEnterCurrencyAmountView setDelegate:](self->_enterCurrencyAmountView, "setDelegate:", self);
  -[PKEnterCurrencyAmountView setAmountFont:](self->_enterCurrencyAmountView, "setAmountFont:", v20);
  -[PKEnterCurrencyAmountView setCurrencySymbolFont:](self->_enterCurrencyAmountView, "setCurrencySymbolFont:", v4);
  -[PKEnterCurrencyAmountView setKerning:](self->_enterCurrencyAmountView, "setKerning:", &unk_1E3FACB60);
  -[PKPerformActionEnterValueView addSubview:](self, "addSubview:", self->_enterCurrencyAmountView);
  if (-[PKNumericSuggestionsEnterValueAlgorithm hasValidDefaultSuggestions](self->_suggestionGenerator, "hasValidDefaultSuggestions"))
  {
    v9 = -[PKNumberPadSuggestionsView initWithDefaultFrame]([PKNumberPadSuggestionsView alloc], "initWithDefaultFrame");
    suggestionView = self->_suggestionView;
    self->_suggestionView = v9;

    -[PKNumberPadSuggestionsView setDelegate:](self->_suggestionView, "setDelegate:", self);
    -[PKEnterCurrencyAmountView setInputAccessoryView:](self->_enterCurrencyAmountView, "setInputAccessoryView:", self->_suggestionView);
  }
  v11 = [PKEnterValueNewBalanceView alloc];
  -[PKPaymentPassAction enteredValueItem](self->_action, "enteredValueItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currency");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKEnterValueNewBalanceView initWithCurrencyCode:](v11, "initWithCurrencyCode:", v13);
  newBalanceView = self->_newBalanceView;
  self->_newBalanceView = v14;

  -[PKEnterValueNewBalanceView setMaxBalance:](self->_newBalanceView, "setMaxBalance:", self->_maxLoadedBalance);
  -[PKEnterValueNewBalanceView setMinBalance:](self->_newBalanceView, "setMinBalance:", self->_minLoadedBalance);
  -[PKEnterValueNewBalanceView setMinLoadAmount:](self->_newBalanceView, "setMinLoadAmount:", self->_minLoadAmount);
  -[PKEnterValueNewBalanceView setMaxLoadAmount:](self->_newBalanceView, "setMaxLoadAmount:", self->_maxLoadAmount);
  -[PKEnterValueNewBalanceView setCardBalance:](self->_newBalanceView, "setCardBalance:", self->_cardBalance);
  -[PKEnterValueNewBalanceView sizeToFit](self->_newBalanceView, "sizeToFit");
  -[PKPerformActionEnterValueView addSubview:](self, "addSubview:", self->_newBalanceView);
  if (self->_shouldShowAutoReloadButton)
  {
    v16 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    autoReloadButton = self->_autoReloadButton;
    self->_autoReloadButton = v16;

    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitleLineBreakMode:", 4);
    objc_msgSend(v18, "setTitleAlignment:", 2);
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_SETUP_AUTO_RELOAD"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    -[UIButton setConfiguration:](self->_autoReloadButton, "setConfiguration:", v18);
    -[UIButton addTarget:action:forControlEvents:](self->_autoReloadButton, "addTarget:action:forControlEvents:", self, sel__didTapSetUpAutoReloadButton, 64);
    -[UIButton setAccessibilityIdentifier:](self->_autoReloadButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678D8]);
    -[PKPerformActionEnterValueView addSubview:](self, "addSubview:", self->_autoReloadButton);

  }
}

- (void)_didTapSetUpAutoReloadButton
{
  PKPerformActionViewDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "didTapSetUpAutoReloadButton");

    }
  }
}

- (PKPerformActionViewDelegate)delegate
{
  return (PKPerformActionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (void)setMinLoadAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (void)setMaxLoadAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (void)setMinLoadedBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_autoReloadButton, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_newBalanceView, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
}

@end
