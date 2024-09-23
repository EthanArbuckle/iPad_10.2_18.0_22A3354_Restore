@implementation PKPaymentSetupPurchaseAmountView

- (PKPaymentSetupPurchaseAmountView)initWithProduct:(id)a3 provisioningMethodMetadata:(id)a4
{
  id v7;
  id v8;
  PKPaymentSetupPurchaseAmountView *v9;
  uint64_t v10;
  NSDecimalNumber *currentAmount;
  uint64_t v12;
  NSString *currency;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDecimalNumber *minLoadedBalance;
  uint64_t v18;
  NSDecimalNumber *maxLoadedBalance;
  uint64_t v20;
  PKNumericSuggestionsEnterValueAlgorithm *v21;
  PKNumericSuggestionsEnterValueAlgorithm *suggestionGenerator;
  PKNumericSuggestionsEnterValueAlgorithm *v23;
  void *v24;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupPurchaseAmountView;
  v9 = -[PKPaymentSetupPurchaseAmountView init](&v26, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v10 = objc_claimAutoreleasedReturnValue();
    currentAmount = v9->_currentAmount;
    v9->_currentAmount = (NSDecimalNumber *)v10;

    objc_storeStrong((id *)&v9->_product, a3);
    objc_storeStrong((id *)&v9->_provisioningMethodMetadata, a4);
    objc_msgSend(v8, "currency");
    v12 = objc_claimAutoreleasedReturnValue();
    currency = v9->_currency;
    v9->_currency = (NSString *)v12;

    objc_msgSend(v8, "depositAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v9->_depositAmount, v15);
    if (!v14)

    objc_msgSend(v8, "minLoadedBalance");
    v16 = objc_claimAutoreleasedReturnValue();
    minLoadedBalance = v9->_minLoadedBalance;
    v9->_minLoadedBalance = (NSDecimalNumber *)v16;

    objc_msgSend(v8, "maxLoadedBalance");
    v18 = objc_claimAutoreleasedReturnValue();
    maxLoadedBalance = v9->_maxLoadedBalance;
    v9->_maxLoadedBalance = (NSDecimalNumber *)v18;

    v20 = PKMaximumFractionDigitsForCurrencyCode();
    v21 = (PKNumericSuggestionsEnterValueAlgorithm *)objc_alloc_init(MEMORY[0x1E0D66E90]);
    suggestionGenerator = v9->_suggestionGenerator;
    v9->_suggestionGenerator = v21;

    -[PKNumericSuggestionsEnterValueAlgorithm setMinBalance:](v9->_suggestionGenerator, "setMinBalance:", v9->_minLoadedBalance);
    -[PKNumericSuggestionsEnterValueAlgorithm setMaxBalance:](v9->_suggestionGenerator, "setMaxBalance:", v9->_maxLoadedBalance);
    -[PKNumericSuggestionsEnterValueAlgorithm setCardBalance:](v9->_suggestionGenerator, "setCardBalance:", v9->_currentAmount);
    -[PKNumericSuggestionsEnterValueAlgorithm setCurrencyCode:](v9->_suggestionGenerator, "setCurrencyCode:", v9->_currency);
    -[PKNumericSuggestionsEnterValueAlgorithm setPowerOfTenFactor:](v9->_suggestionGenerator, "setPowerOfTenFactor:", 3 - v20);
    -[PKNumericSuggestionsEnterValueAlgorithm setDecimalPrecision:](v9->_suggestionGenerator, "setDecimalPrecision:", v20);
    v23 = v9->_suggestionGenerator;
    -[PKPaymentSetupPurchaseAmountView _defaultValues](v9, "_defaultValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNumericSuggestionsEnterValueAlgorithm setDefaultValues:](v23, "setDefaultValues:", v24);

    -[PKPaymentSetupPurchaseAmountView _createSubviews](v9, "_createSubviews");
    -[PKPaymentSetupPurchaseAmountView _createConstraints](v9, "_createConstraints");
    -[PKPaymentSetupPurchaseAmountView _updateCurrentAmount:](v9, "_updateCurrentAmount:", v9->_currentAmount);
    -[PKPaymentSetupPurchaseAmountView _updateMessageLabelForAmount:](v9, "_updateMessageLabelForAmount:", v9->_currentAmount);
  }

  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupPurchaseAmountView;
  -[PKPaymentSetupPurchaseAmountView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaymentSetupPurchaseAmountView bounds](self, "bounds");
  -[PKNumberPadSuggestionsView frame](self->_suggestionView, "frame");
  -[PKNumberPadSuggestionsView setFrame:](self->_suggestionView, "setFrame:");
}

- (void)updateConstraints
{
  NSLayoutConstraint *fixedConstraint;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *centeringConstraint;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupPurchaseAmountView;
  -[PKPaymentSetupPurchaseAmountView updateConstraints](&v13, sel_updateConstraints);
  if (-[PKPaymentSetupPurchaseAmountView displayingBalanceErrorMessage](self, "displayingBalanceErrorMessage")
    && !-[NSLayoutConstraint isActive](self->_fixedConstraint, "isActive"))
  {
    fixedConstraint = self->_fixedConstraint;
    -[UIStackView frame](self->_amountStackView, "frame");
    -[NSLayoutConstraint setConstant:](fixedConstraint, "setConstant:", v4);
    v5 = (void *)MEMORY[0x1E0CB3718];
    v17[0] = self->_fixedConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v6);

    v7 = (void *)MEMORY[0x1E0CB3718];
    centeringConstraint = self->_centeringConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &centeringConstraint, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v8);

  }
  if (!-[PKPaymentSetupPurchaseAmountView displayingBalanceErrorMessage](self, "displayingBalanceErrorMessage")
    && !-[NSLayoutConstraint isActive](self->_centeringConstraint, "isActive"))
  {
    v9 = (void *)MEMORY[0x1E0CB3718];
    v15 = self->_centeringConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    v14 = self->_fixedConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deactivateConstraints:", v12);

  }
}

- (UITextField)amountTextField
{
  return -[PKEnterCurrencyAmountView amountTextField](self->_enterCurrencyAmountView, "amountTextField");
}

- (CGSize)defaultKeyboardSize
{
  double v2;
  double v3;
  CGSize result;

  -[PKEnterCurrencyAmountView defaultKeyboardSize](self->_enterCurrencyAmountView, "defaultKeyboardSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  NSDecimalNumber *maxLoadedBalance;
  BOOL v11;

  v7 = a4;
  v8 = a5;
  if (-[PKPaymentSetupPurchaseAmountView _shouldShakeCard:](self, "_shouldShakeCard:", v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shakeCard");

  }
  maxLoadedBalance = self->_maxLoadedBalance;
  v11 = !maxLoadedBalance
     || -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", v7) != NSOrderedAscending
     || -[NSDecimalNumber compare:](self->_maxLoadedBalance, "compare:", v8) != NSOrderedAscending;

  return v11;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentAmount");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupPurchaseAmountView _updateCurrentAmount:](self, "_updateCurrentAmount:", v4);

}

- (void)enterCurrencyAmountViewDidLayoutKeyboard:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "paymentSetupPurchaseAmountViewDidLayoutKeyboard:", self);

}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id WeakRetained;
  id v6;

  objc_msgSend(a4, "value", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKEnterCurrencyAmountView setCurrentAmount:](self->_enterCurrencyAmountView, "setCurrentAmount:", v6);
  -[PKPaymentSetupPurchaseAmountView _updateCurrentAmount:](self, "_updateCurrentAmount:", v6);
  if (-[PKPaymentSetupPurchaseAmountView _shouldShakeCard:](self, "_shouldShakeCard:", v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shakeCard");

  }
}

- (void)_createSubviews
{
  UIView *v3;
  UIView *centeringView;
  double v5;
  void *v6;
  void *v7;
  PKEnterCurrencyAmountView *v8;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  UILabel *v10;
  UILabel *messageLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;
  UILabel *v17;
  void *v18;
  UIStackView *v19;
  UIStackView *amountStackView;
  void *v21;
  PKNumberPadSuggestionsView *v22;
  PKNumberPadSuggestionsView *suggestionView;
  PKNumberPadSuggestionsView *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  centeringView = self->_centeringView;
  self->_centeringView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_centeringView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setHidden:](self->_centeringView, "setHidden:", 1);
  -[PKPaymentSetupPurchaseAmountView addSubview:](self, "addSubview:", self->_centeringView);
  v5 = *MEMORY[0x1E0DC1448];
  PKRoundedSystemFontOfSizeAndWeight(60.0, *MEMORY[0x1E0DC1448]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKRoundedSystemFontOfSizeAndWeight(36.0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKEnterCurrencyAmountView initWithCurrency:amount:]([PKEnterCurrencyAmountView alloc], "initWithCurrency:amount:", self->_currency, self->_currentAmount);
  enterCurrencyAmountView = self->_enterCurrencyAmountView;
  self->_enterCurrencyAmountView = v8;

  -[PKEnterCurrencyAmountView setDelegate:](self->_enterCurrencyAmountView, "setDelegate:", self);
  -[PKEnterCurrencyAmountView setAmountFont:](self->_enterCurrencyAmountView, "setAmountFont:", v6);
  -[PKEnterCurrencyAmountView setCurrencySymbolFont:](self->_enterCurrencyAmountView, "setCurrencySymbolFont:", v7);
  -[PKEnterCurrencyAmountView setKerning:](self->_enterCurrencyAmountView, "setKerning:", &unk_1E3FACA60);
  -[PKEnterCurrencyAmountView setTranslatesAutoresizingMaskIntoConstraints:](self->_enterCurrencyAmountView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v10;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = self->_messageLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  v14 = self->_messageLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], (NSString *)*MEMORY[0x1E0DC48D0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v14, "setFont:", v15);

  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 2);
  v16 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v17 = self->_messageLabel;
  v31[0] = self->_enterCurrencyAmountView;
  v31[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (UIStackView *)objc_msgSend(v16, "initWithArrangedSubviews:", v18);
  amountStackView = self->_amountStackView;
  self->_amountStackView = v19;

  -[UIStackView setAxis:](self->_amountStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_amountStackView, "setAlignment:", 3);
  -[UIStackView setDistribution:](self->_amountStackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_amountStackView, "setSpacing:", 32.0);
  -[UIStackView setBaselineRelativeArrangement:](self->_amountStackView, "setBaselineRelativeArrangement:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_amountStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaymentSetupPurchaseAmountView addSubview:](self, "addSubview:", self->_amountStackView);
  if (-[PKNumericSuggestionsEnterValueAlgorithm hasValidDefaultSuggestions](self->_suggestionGenerator, "hasValidDefaultSuggestions"))
  {
    -[PKPaymentSetupPurchaseAmountView _defaultSuggestions](self, "_defaultSuggestions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PKNumberPadSuggestionsView initWithDefaultFrame]([PKNumberPadSuggestionsView alloc], "initWithDefaultFrame");
    suggestionView = self->_suggestionView;
    self->_suggestionView = v22;

    -[PKNumberPadSuggestionsView setDelegate:](self->_suggestionView, "setDelegate:", self);
    v24 = self->_suggestionView;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __51__PKPaymentSetupPurchaseAmountView__createSubviews__block_invoke;
    v29 = &unk_1E3E652B0;
    v30 = v21;
    v25 = v21;
    -[PKNumberPadSuggestionsView performBatchUpdates:](v24, "performBatchUpdates:", &v26);
    -[PKEnterCurrencyAmountView setInputAccessoryView:](self->_enterCurrencyAmountView, "setInputAccessoryView:", self->_suggestionView, v26, v27, v28, v29);

  }
}

void __51__PKPaymentSetupPurchaseAmountView__createSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v5 = a2;
  objc_msgSend(v3, "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonTextColor:", v4);

  objc_msgSend(v5, "setSuggestions:", *(_QWORD *)(a1 + 32));
}

- (void)_createConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *centeringConstraint;
  double v12;
  void *v13;
  UIStackView *amountStackView;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *fixedConstraint;
  double v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountStackView, 5, 0, self, 5, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountStackView, 6, 0, self, 6, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centeringView, 5, 0, self, 5, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centeringView, 6, 0, self, 6, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centeringView, 3, 0, self, 3, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centeringView, 4, 0, self, 4, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountStackView, 10, 0, self->_centeringView, 10, 1.0, 0.0);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  centeringConstraint = self->_centeringConstraint;
  self->_centeringConstraint = v10;

  LODWORD(v12) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_centeringConstraint, "setPriority:", v12);
  v13 = (void *)MEMORY[0x1E0CB3718];
  amountStackView = self->_amountStackView;
  -[UIStackView frame](amountStackView, "frame");
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", amountStackView, 3, 0, self, 3, 1.0);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  fixedConstraint = self->_fixedConstraint;
  self->_fixedConstraint = v15;

  LODWORD(v17) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_fixedConstraint, "setPriority:", v17);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v3;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v18);
        LODWORD(v20) = 1144750080;
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setPriority:", v20, (_QWORD)v24);
      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v21);
  }

  objc_msgSend(v18, "addObject:", self->_centeringConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);

}

- (id)_defaultValues
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PKPaymentProvisioningMethodMetadata digitalIssuanceMetadata](self->_provisioningMethodMetadata, "digitalIssuanceMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("100"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("200"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_defaultSuggestions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  PKPaymentSetupPurchaseAmountView *v13;

  -[PKPaymentSetupPurchaseAmountView _defaultValues](self, "_defaultValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55__PKPaymentSetupPurchaseAmountView__defaultSuggestions__block_invoke;
  v11 = &unk_1E3E660C0;
  v12 = v4;
  v13 = self;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

void __55__PKPaymentSetupPurchaseAmountView__defaultSuggestions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D66E80], "suggestionWithValue:currencyCode:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 448));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)_isAmountValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSDecimalNumber *maxLoadedBalance;
  NSDecimalNumber *minLoadedBalance;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToNumber:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "compare:", v7)
      || (maxLoadedBalance = self->_maxLoadedBalance) != 0
      && -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", v4) == NSOrderedAscending)
    {
      v6 = 1;
    }
    else
    {
      minLoadedBalance = self->_minLoadedBalance;
      if (minLoadedBalance)
        v6 = -[NSDecimalNumber compare:](minLoadedBalance, "compare:", v4) == NSOrderedDescending;
      else
        v6 = 0;
    }

  }
  return !v6;
}

- (BOOL)_shouldShakeCard:(id)a3
{
  NSDecimalNumber *maxLoadedBalance;

  maxLoadedBalance = self->_maxLoadedBalance;
  if (maxLoadedBalance)
    LOBYTE(maxLoadedBalance) = -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", a3) == NSOrderedAscending;
  return (char)maxLoadedBalance;
}

- (void)_updateCurrentAmount:(id)a3
{
  NSDecimalNumber **p_currentAmount;
  id v6;
  _BOOL8 v7;
  id WeakRetained;
  id v9;

  p_currentAmount = &self->_currentAmount;
  objc_storeStrong((id *)&self->_currentAmount, a3);
  v6 = a3;
  v7 = -[PKPaymentSetupPurchaseAmountView _isAmountValid:](self, "_isAmountValid:", *p_currentAmount);
  -[PKNumericSuggestionsEnterValueAlgorithm suggestionsWithAmount:](self->_suggestionGenerator, "suggestionsWithAmount:", *p_currentAmount);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKNumberPadSuggestionsView setSuggestions:](self->_suggestionView, "setSuggestions:", v9);
  -[PKPaymentSetupPurchaseAmountView _updateMessageLabelForAmount:](self, "_updateMessageLabelForAmount:", *p_currentAmount);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didUpdateAmount:isValid:", *p_currentAmount, v7);

}

- (void)_updateMessageLabelForAmount:(id)a3
{
  NSDecimalNumber *maxLoadedBalance;
  NSDecimalNumber *minLoadedBalance;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDecimalNumber *depositAmount;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  maxLoadedBalance = self->_maxLoadedBalance;
  if (maxLoadedBalance
    && -[NSDecimalNumber compare:](maxLoadedBalance, "compare:", self->_currentAmount) == NSOrderedAscending)
  {
    -[PKPaymentSetupPurchaseAmountView setDisplayingBalanceErrorMessage:](self, "setDisplayingBalanceErrorMessage:", 1);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", self->_maxLoadedBalance, self->_currency, 0);
    objc_msgSend(v18, "minimalFormattedStringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ENTERED_VALUE_MAXIMUM_AMOUNT_FORMAT"), CFSTR("%@"), v9);
    goto LABEL_15;
  }
  minLoadedBalance = self->_minLoadedBalance;
  if (minLoadedBalance)
  {
    if (-[NSDecimalNumber compare:](minLoadedBalance, "compare:", v19) == NSOrderedDescending)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v19, "compare:", v6);

      if (v7)
      {
        -[PKPaymentSetupPurchaseAmountView setDisplayingBalanceErrorMessage:](self, "setDisplayingBalanceErrorMessage:", 1);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", self->_minLoadedBalance, self->_currency, 0);
        objc_msgSend(v8, "minimalFormattedStringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ENTERED_VALUE_MINIMUM_AMOUNT_FORMAT"), CFSTR("%@"), v9);
LABEL_15:
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
  }
  depositAmount = self->_depositAmount;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSDecimalNumber compare:](depositAmount, "compare:", v11);

  -[PKPaymentSetupPurchaseAmountView setDisplayingBalanceErrorMessage:](self, "setDisplayingBalanceErrorMessage:", 0);
  if (!v12)
  {
    -[UILabel setText:](self->_messageLabel, "setText:", 0);
    goto LABEL_18;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", self->_depositAmount, self->_currency, 0);
  objc_msgSend(v13, "minimalFormattedStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PKPaymentProvisioningMethodMetadata depositType](self->_provisioningMethodMetadata, "depositType");
  v15 = CFSTR("SETUP_PURCHASE_REFUNDABLE_SERVICE_FEE_AMOUNT_MESSAGE");
  if (v14 == 2)
    v15 = CFSTR("SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_AMOUNT_MESSAGE");
  if (v14 == 1)
    v16 = CFSTR("SETUP_PURCHASE_REFUNDABLE_DEPOSIT_AMOUNT_MESSAGE");
  else
    v16 = (__CFString *)v15;
  PKLocalizedPaymentString(&v16->isa, CFSTR("%@"), v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  -[UILabel setText:](self->_messageLabel, "setText:", v17);

LABEL_18:
  -[PKPaymentSetupPurchaseAmountView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (PKPaymentSetupPurchaseAmountViewDelegate)delegate
{
  return (PKPaymentSetupPurchaseAmountViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (PKPaymentProvisioningMethodMetadata)provisioningMethodMetadata
{
  return self->_provisioningMethodMetadata;
}

- (void)setProvisioningMethodMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSDecimalNumber)depositAmount
{
  return self->_depositAmount;
}

- (void)setDepositAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (void)setMinLoadedBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (void)setMaxLoadedBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (UIStackView)amountStackView
{
  return self->_amountStackView;
}

- (void)setAmountStackView:(id)a3
{
  objc_storeStrong((id *)&self->_amountStackView, a3);
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (void)setEnterCurrencyAmountView:(id)a3
{
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, a3);
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (void)setCurrentAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currentAmount, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UIView)centeringView
{
  return self->_centeringView;
}

- (void)setCenteringView:(id)a3
{
  objc_storeStrong((id *)&self->_centeringView, a3);
}

- (NSLayoutConstraint)fixedConstraint
{
  return self->_fixedConstraint;
}

- (void)setFixedConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_fixedConstraint, a3);
}

- (NSLayoutConstraint)centeringConstraint
{
  return self->_centeringConstraint;
}

- (void)setCenteringConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centeringConstraint, a3);
}

- (BOOL)displayingBalanceErrorMessage
{
  return self->_displayingBalanceErrorMessage;
}

- (void)setDisplayingBalanceErrorMessage:(BOOL)a3
{
  self->_displayingBalanceErrorMessage = a3;
}

- (PKNumberPadSuggestionsView)suggestionView
{
  return self->_suggestionView;
}

- (void)setSuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionView, a3);
}

- (PKNumericSuggestionsEnterValueAlgorithm)suggestionGenerator
{
  return self->_suggestionGenerator;
}

- (void)setSuggestionGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_centeringConstraint, 0);
  objc_storeStrong((id *)&self->_fixedConstraint, 0);
  objc_storeStrong((id *)&self->_centeringView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
  objc_storeStrong((id *)&self->_amountStackView, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_depositAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
