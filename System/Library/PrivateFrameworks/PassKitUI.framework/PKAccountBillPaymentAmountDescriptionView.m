@implementation PKAccountBillPaymentAmountDescriptionView

- (PKAccountBillPaymentAmountDescriptionView)initWithSuggestedAmountList:(id)a3 account:(id)a4 configuration:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKAccountBillPaymentAmountDescriptionView *v15;
  PKAccountBillPaymentAmountDescriptionView *v16;
  uint64_t v17;
  NSString *learnMoreString;
  UILabel *v19;
  UILabel *suggestedAmountTitleLabel;
  uint64_t v21;
  UITextView *suggestedAmountDescriptionView;
  PKAccountBillPaymentAmountContainerView *v23;
  void *v24;
  uint64_t v25;
  PKAccountBillPaymentAmountContainerView *amountContainerView;
  void *v27;
  void *v28;
  PKNumberPadSuggestionsView *v29;
  PKNumberPadSuggestionsView *suggestionView;
  PKNumberPadSuggestionsView *v31;
  id v32;
  void *v34;
  _QWORD v35[4];
  id v36;
  objc_super v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountBillPaymentAmountDescriptionView;
  v15 = -[PKAccountBillPaymentAmountDescriptionView init](&v37, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v16->_suggestionList, a3);
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v16->_configuration, a5);
    v16->_showDescriptionLabels = 1;
    v16->_showDescriptionSubtitle = 1;
    PKLocalizedFeatureString();
    v17 = objc_claimAutoreleasedReturnValue();
    learnMoreString = v16->_learnMoreString;
    v16->_learnMoreString = (NSString *)v17;

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    suggestedAmountTitleLabel = v16->_suggestedAmountTitleLabel;
    v16->_suggestedAmountTitleLabel = v19;

    -[UILabel setTextAlignment:](v16->_suggestedAmountTitleLabel, "setTextAlignment:", 1);
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B08], (void *)*MEMORY[0x1E0DC48D0], 32770, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16->_suggestedAmountTitleLabel, "setFont:", v34);
    -[UILabel setNumberOfLines:](v16->_suggestedAmountTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v16->_suggestedAmountTitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v21 = objc_claimAutoreleasedReturnValue();
    suggestedAmountDescriptionView = v16->_suggestedAmountDescriptionView;
    v16->_suggestedAmountDescriptionView = (UITextView *)v21;

    -[UITextView setDelegate:](v16->_suggestedAmountDescriptionView, "setDelegate:", v16);
    -[UITextView setSelectable:](v16->_suggestedAmountDescriptionView, "setSelectable:", 1);
    -[UITextView setUserInteractionEnabled:](v16->_suggestedAmountDescriptionView, "setUserInteractionEnabled:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](v16->_suggestedAmountDescriptionView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTextContainerInset:](v16->_suggestedAmountDescriptionView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setAccessibilityIdentifier:](v16->_suggestedAmountDescriptionView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    v23 = [PKAccountBillPaymentAmountContainerView alloc];
    -[PKBillPaymentSuggestedAmountList currencyCode](v16->_suggestionList, "currencyCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PKAccountBillPaymentAmountContainerView initWithCurrencyCode:minimumAmount:](v23, "initWithCurrencyCode:minimumAmount:", v24, v16->_minimumAmount);
    amountContainerView = v16->_amountContainerView;
    v16->_amountContainerView = (PKAccountBillPaymentAmountContainerView *)v25;

    -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](v16, "_enterCurrencyAmountView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", v16);
    -[PKAccountBillPaymentAmountDescriptionView _keypadSuggestions](v16, "_keypadSuggestions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PKNumberPadSuggestionsView initWithDefaultFrame]([PKNumberPadSuggestionsView alloc], "initWithDefaultFrame");
    suggestionView = v16->_suggestionView;
    v16->_suggestionView = v29;

    -[PKNumberPadSuggestionsView setDelegate:](v16->_suggestionView, "setDelegate:", v16);
    v31 = v16->_suggestionView;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __104__PKAccountBillPaymentAmountDescriptionView_initWithSuggestedAmountList_account_configuration_delegate___block_invoke;
    v35[3] = &unk_1E3E652B0;
    v36 = v28;
    v32 = v28;
    -[PKNumberPadSuggestionsView performBatchUpdates:](v31, "performBatchUpdates:", v35);
    objc_msgSend(v27, "setInputAccessoryView:", v16->_suggestionView);
    -[PKAccountBillPaymentAmountDescriptionView addSubview:](v16, "addSubview:", v16->_suggestedAmountTitleLabel);
    -[PKAccountBillPaymentAmountDescriptionView addSubview:](v16, "addSubview:", v16->_suggestedAmountDescriptionView);
    -[PKAccountBillPaymentAmountDescriptionView addSubview:](v16, "addSubview:", v16->_amountContainerView);
    -[PKAccountBillPaymentAmountDescriptionView setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE0]);

  }
  return v16;
}

void __104__PKAccountBillPaymentAmountDescriptionView_initWithSuggestedAmountList_account_configuration_delegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v6 = a2;
  objc_msgSend(v3, "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonTextColor:", v4);

  +[PKAccountBillPaymentViewController backgroundColor](PKAccountBillPaymentViewController, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonBackgroundColor:", v5);

  objc_msgSend(v6, "setSuggestions:", *(_QWORD *)(a1 + 32));
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
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
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v26.receiver = self;
  v26.super_class = (Class)PKAccountBillPaymentAmountDescriptionView;
  -[PKAccountBillPaymentAmountDescriptionView layoutSubviews](&v26, sel_layoutSubviews);
  -[PKAccountBillPaymentAmountDescriptionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKAccountBillPaymentAmountContainerView frame](self->_amountContainerView, "frame");
  -[PKAccountBillPaymentAmountContainerView sizeThatFits:](self->_amountContainerView, "sizeThatFits:", v6, 1.79769313e308);
  PKRectCenteredXInRect();
  v8 = v7;
  v24 = v10;
  v25 = v9;
  -[PKAccountBillPaymentAmountContainerView setFrame:](self->_amountContainerView, "setFrame:");
  -[UILabel frame](self->_suggestedAmountTitleLabel, "frame");
  -[UILabel sizeThatFits:](self->_suggestedAmountTitleLabel, "sizeThatFits:", v6, 1.79769313e308);
  PKRectCenteredXInRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = v4;
  if (-[PKAccountBillPaymentAmountDescriptionView showAmount](self, "showAmount"))
  {
    v27.origin.x = v8;
    v27.origin.y = v4;
    v27.size.height = v24;
    v27.size.width = v25;
    v17 = CGRectGetMaxY(v27) + 17.0;
  }
  -[UILabel setFrame:](self->_suggestedAmountTitleLabel, "setFrame:", v12, v17, v14, v16);
  -[UITextView frame](self->_suggestedAmountDescriptionView, "frame");
  -[UITextView sizeThatFits:](self->_suggestedAmountDescriptionView, "sizeThatFits:", v6, 1.79769313e308);
  PKRectCenteredXInRect();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v28.origin.x = v12;
  v28.origin.y = v17;
  v28.size.width = v14;
  v28.size.height = v16;
  -[UITextView setFrame:](self->_suggestedAmountDescriptionView, "setFrame:", v19, CGRectGetMaxY(v28) + 6.0, v21, v23);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  if (self->_showDescriptionLabels)
  {
    -[UILabel sizeThatFits:](self->_suggestedAmountTitleLabel, "sizeThatFits:", a3.width, 1.79769313e308);
    v6 = v5 + 0.0;
    if (self->_showDescriptionSubtitle)
    {
      -[UITextView sizeThatFits:](self->_suggestedAmountDescriptionView, "sizeThatFits:", width, 1.79769313e308);
      v6 = v6 + 6.0 + v7;
    }
  }
  else
  {
    v6 = 0.0;
  }
  if (-[PKAccountBillPaymentAmountDescriptionView showAmount](self, "showAmount"))
  {
    -[PKAccountBillPaymentAmountContainerView sizeThatFits:](self->_amountContainerView, "sizeThatFits:", width, 1.79769313e308);
    v9 = v6 + v8;
    v10 = v6 + v8 + 17.0;
    if (self->_showDescriptionLabels)
      v6 = v10;
    else
      v6 = v9;
  }
  v11 = width;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "value", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentAmountDescriptionView _updateEnteredAmount:](self, "_updateEnteredAmount:", v6);
  if (-[PKAccountBillPaymentAmountDescriptionView _shouldShakeWithNewAmount:](self, "_shouldShakeWithNewAmount:", v6))
  {
    -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](self, "_enterCurrencyAmountView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pkui_smallShakeWithCompletion:", 0);

  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "billPaymentAmountDescriptionViewHasTappedLearnMore:", self);

  return 0;
}

- (void)setTitleText:(id)a3
{
  NSString **p_titleText;
  id v6;

  p_titleText = &self->_titleText;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    -[UILabel setText:](self->_suggestedAmountTitleLabel, "setText:", *p_titleText);
    -[PKAccountBillPaymentAmountDescriptionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDescriptionText:(id)a3
{
  NSString *v4;
  NSString *descriptionText;
  UITextView *suggestedAmountDescriptionView;
  void *v7;
  id v8;

  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, self->_learnMoreString);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    descriptionText = self->_descriptionText;
    self->_descriptionText = v4;

    suggestedAmountDescriptionView = self->_suggestedAmountDescriptionView;
    -[PKAccountBillPaymentAmountDescriptionView _sugestedAmountDescriptionAttributedString](self, "_sugestedAmountDescriptionAttributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](suggestedAmountDescriptionView, "setAttributedText:", v7);

    -[PKAccountBillPaymentAmountDescriptionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_sugestedAmountDescriptionAttributedString
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (-[NSString length](self->_descriptionText, "length"))
  {
    v3 = -[NSString length](self->_descriptionText, "length");
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3E7D690);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSString rangeOfString:](self->_descriptionText, "rangeOfString:", self->_learnMoreString);
    v7 = v6;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B08], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", self->_descriptionText);
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_addLinkURL:toRange:withColor:isUnderlined:", v4, v5, v7, v10, 0);

    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v12, "setAlignment:", 1);
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v12, 0, v3);
    v13 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, v3);

    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v8, 0, v3);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)setShowAmount:(BOOL)a3
{
  -[PKAccountBillPaymentAmountContainerView setShowAmount:](self->_amountContainerView, "setShowAmount:", a3);
  -[PKAccountBillPaymentAmountDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)showAmount
{
  return -[PKAccountBillPaymentAmountContainerView showAmount](self->_amountContainerView, "showAmount");
}

- (void)setShowDescriptionLabels:(BOOL)a3
{
  if (((!self->_showDescriptionLabels ^ a3) & 1) == 0)
  {
    self->_showDescriptionLabels = a3;
    -[PKAccountBillPaymentAmountDescriptionView _updateDescriptionAlpha](self, "_updateDescriptionAlpha");
    -[PKAccountBillPaymentAmountDescriptionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowDescriptionSubtitle:(BOOL)a3
{
  if (((!self->_showDescriptionSubtitle ^ a3) & 1) == 0)
  {
    self->_showDescriptionSubtitle = a3;
    -[PKAccountBillPaymentAmountDescriptionView _updateDescriptionAlpha](self, "_updateDescriptionAlpha");
    -[PKAccountBillPaymentAmountDescriptionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateDescriptionAlpha
{
  unint64_t v2;
  unint64_t v4;
  double v5;

  LOBYTE(v2) = self->_showDescriptionLabels;
  -[UILabel setAlpha:](self->_suggestedAmountTitleLabel, "setAlpha:", (double)v2);
  if (self->_showDescriptionLabels)
  {
    LOBYTE(v4) = self->_showDescriptionSubtitle;
    v5 = (double)v4;
  }
  else
  {
    v5 = 0.0;
  }
  -[UITextView setAlpha:](self->_suggestedAmountDescriptionView, "setAlpha:", v5);
}

- (NSDecimalNumber)amount
{
  return self->_enteredAmount;
}

- (void)showKeyboard
{
  id v2;

  -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](self, "_enterCurrencyAmountView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showKeyboard");

}

- (void)dismissKeyboard
{
  id v2;

  -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](self, "_enterCurrencyAmountView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissKeyboard");

}

- (void)normalizeEnteredAmount
{
  NSDecimalNumber *v3;
  NSDecimalNumber **p_maximumAmount;
  NSDecimalNumber *maximumAmount;
  NSDecimalNumber *minimumAmount;
  NSDecimalNumber *v7;
  id v8;

  -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](self, "_enterCurrencyAmountView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self->_enteredAmount;
  p_maximumAmount = &self->_maximumAmount;
  maximumAmount = self->_maximumAmount;
  if (maximumAmount
    && -[NSDecimalNumber compare:](maximumAmount, "compare:", self->_enteredAmount) == NSOrderedAscending
    || (p_maximumAmount = &self->_minimumAmount, (minimumAmount = self->_minimumAmount) != 0)
    && -[NSDecimalNumber compare:](minimumAmount, "compare:", self->_enteredAmount) == NSOrderedDescending)
  {
    v7 = *p_maximumAmount;

    v3 = v7;
  }
  -[PKAccountBillPaymentAmountDescriptionView _updateEnteredAmount:](self, "_updateEnteredAmount:", v3);
  objc_msgSend(v8, "setCurrentAmount:forceFormatForDisplay:", v3, 1);

}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSDecimalNumber *maximumAmount;
  BOOL v11;
  void *v13;
  void *v14;
  uint64_t v15;

  v7 = a4;
  v8 = a5;
  if (-[PKAccountBillPaymentAmountDescriptionView _shouldShakeWithNewAmount:](self, "_shouldShakeWithNewAmount:", v8))
  {
    -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](self, "_enterCurrencyAmountView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pkui_smallShakeWithCompletion:", 0);

  }
  if (self->_minimumAmount
    && objc_msgSend(v7, "compare:") == -1
    && objc_msgSend(v8, "compare:", self->_minimumAmount) == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", v13))
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "compare:", v14);

      if (v15)
      {
        v11 = 0;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  maximumAmount = self->_maximumAmount;
  v11 = !maximumAmount
     || -[NSDecimalNumber compare:](maximumAmount, "compare:", v7) != NSOrderedAscending
     || -[NSDecimalNumber compare:](self->_maximumAmount, "compare:", v8) != NSOrderedAscending;
LABEL_10:

  return v11;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  NSDecimalNumber *v4;
  NSDecimalNumber *enteredAmount;
  NSDecimalNumber *v6;

  objc_msgSend(a3, "currentAmount");
  v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  enteredAmount = self->_enteredAmount;
  self->_enteredAmount = v4;
  v6 = v4;

  -[PKAccountBillPaymentAmountDescriptionView _enteredAmountDidChangeTo:](self, "_enteredAmountDidChangeTo:", v6);
}

- (void)_updateEnteredAmount:(id)a3
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_enteredAmount, a3);
  v6 = a3;
  -[PKAccountBillPaymentAmountDescriptionView _enterCurrencyAmountView](self, "_enterCurrencyAmountView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentAmount:forceFormatForDisplay:", v6, PKIsVision() ^ 1);

  -[PKAccountBillPaymentAmountDescriptionView _enteredAmountDidChangeTo:](self, "_enteredAmountDidChangeTo:", v6);
}

- (void)_enteredAmountDidChangeTo:(id)a3
{
  PKAccountBillPaymentAmountDescriptionViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "billPaymentAmountDescriptionView:hasChangedAmount:isValidAmount:", self, v5, -[PKAccountBillPaymentAmountDescriptionView _isEnteredAmountValid](self, "_isEnteredAmountValid"));

}

- (BOOL)_isEnteredAmountValid
{
  NSDecimalNumber *enteredAmount;
  void *v4;
  NSDecimalNumber *v5;
  void *v6;
  NSDecimalNumber *maximumAmount;
  NSDecimalNumber *minimumAmount;

  enteredAmount = self->_enteredAmount;
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enteredAmount) = -[NSDecimalNumber isEqualToNumber:](enteredAmount, "isEqualToNumber:", v4);

  if ((enteredAmount & 1) != 0)
    return 0;
  v5 = self->_enteredAmount;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:", v6);

  if ((v5 & 1) != 0)
    return 0;
  maximumAmount = self->_maximumAmount;
  if (maximumAmount)
  {
    if (-[NSDecimalNumber compare:](maximumAmount, "compare:", self->_enteredAmount) == NSOrderedAscending)
      return 0;
  }
  minimumAmount = self->_minimumAmount;
  return !minimumAmount
      || -[NSDecimalNumber compare:](minimumAmount, "compare:", self->_enteredAmount) != NSOrderedDescending;
}

- (BOOL)_shouldShakeWithNewAmount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDecimalNumber *minimumAmount;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5);

    if (v6)
    {
      -[NSDecimalNumber decimalNumberBySubtracting:](self->_maximumAmount, "decimalNumberBySubtracting:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "compare:", v8);

      if (v9 != -1)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqualToNumber:", v10) & 1) != 0 || (minimumAmount = self->_minimumAmount) == 0)
        {

        }
        else
        {
          v12 = -[NSDecimalNumber compare:](minimumAmount, "compare:", v4);

          if (v12 == 1)
            goto LABEL_7;
        }
        v13 = 0;
        goto LABEL_11;
      }
LABEL_7:
      v13 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (id)_keypadSuggestions
{
  id v3;
  _BOOL4 IsLastMonthsStatement;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  IsLastMonthsStatement = accountCurrentStatementIsLastMonthsStatement(self->_account);
  -[PKBillPaymentSuggestedAmountList currencyCode](self->_suggestionList, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentStatement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "balanceSummary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pastDueAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v8;
  if (IsLastMonthsStatement)
  {
    objc_msgSend(v8, "closingDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = 0;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v45 = v6;
  objc_msgSend(v6, "productTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v11);

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v12);

  objc_msgSend(v10, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM"));
  v46 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "compare:", v13);

    if (v14 == 1)
    {
      v15 = (void *)MEMORY[0x1E0D66E80];
      PKLocalizedFeatureString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v15, "suggestionWithTitle:value:currencyCode:", v16, v46, v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "currencyCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "suggestionWithTitle:value:currencyCode:", v16, v46, v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v3, "addObject:", v17);

    }
  }
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestionList, "suggestedAmountWithCategory:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0D66E80];
    PKLocalizedFeatureString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "amount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "suggestionWithTitle:value:currencyCode:", v21, v22, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v23);
  }
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestionList, "suggestedAmountWithCategory:", 18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v47 && (objc_msgSend(v10, "stringFromDate:"), (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v26 = (void *)v25;
      v42 = v25;
      PKLocalizedFeatureString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKLocalizedFeatureString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)MEMORY[0x1E0D66E80];
    objc_msgSend(v24, "amount", v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "suggestionWithTitle:value:currencyCode:", v27, v29, v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v30);
  }
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestionList, "suggestedAmountWithCategory:", 19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v43, "pendingPurchases");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32
      || (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend(v32, "compare:", v33),
          v33,
          v34 != 1))
    {
      -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");

    }
    PKLocalizedFeatureString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D66E80];
    objc_msgSend(v31, "amount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "suggestionWithTitle:value:currencyCode:", v35, v37, v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v38);
  }
  if ((unint64_t)objc_msgSend(v3, "count") > 3)
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, 3);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = objc_msgSend(v3, "copy");
  }
  v40 = (void *)v39;

  return v40;
}

- (id)_enterCurrencyAmountView
{
  return -[PKAccountBillPaymentAmountContainerView enterCurrencyAmountView](self->_amountContainerView, "enterCurrencyAmountView");
}

- (PKAccountBillPaymentAmountDescriptionViewDelegate)delegate
{
  return (PKAccountBillPaymentAmountDescriptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKAccountBillPaymentAmountContainerView)amountContainerView
{
  return self->_amountContainerView;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)showDescriptionLabels
{
  return self->_showDescriptionLabels;
}

- (BOOL)showDescriptionSubtitle
{
  return self->_showDescriptionSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_amountContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_learnMoreString, 0);
  objc_storeStrong((id *)&self->_enteredAmount, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_suggestedAmountDescriptionView, 0);
  objc_storeStrong((id *)&self->_suggestedAmountTitleLabel, 0);
}

@end
