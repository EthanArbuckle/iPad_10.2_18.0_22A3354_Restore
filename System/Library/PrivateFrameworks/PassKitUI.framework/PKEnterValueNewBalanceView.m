@implementation PKEnterValueNewBalanceView

- (PKEnterValueNewBalanceView)init
{
  return -[PKEnterValueNewBalanceView initWithCurrencyCode:](self, "initWithCurrencyCode:", 0);
}

- (PKEnterValueNewBalanceView)initWithCurrencyCode:(id)a3
{
  id v4;
  PKEnterValueNewBalanceView *v5;
  uint64_t v6;
  NSString *currencyCode;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDecimalNumber *cardBalance;
  uint64_t v13;
  NSDecimalNumber *additionalAmount;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKEnterValueNewBalanceView;
  v5 = -[PKEnterValueNewBalanceView init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_CURRENT_BALANCE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterValueNewBalanceView setPromptText:](v5, "setPromptText:", v8);

    PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_NEW_BALANCE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterValueNewBalanceView setUpdatedBalancePromptText:](v5, "setUpdatedBalancePromptText:", v9);

    PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_MAXIMUM_AMOUNT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterValueNewBalanceView setMaxLoadAmountText:](v5, "setMaxLoadAmountText:", v10);

    -[PKEnterValueNewBalanceView _createAmountFormatter](v5, "_createAmountFormatter");
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v11 = objc_claimAutoreleasedReturnValue();
    cardBalance = v5->_cardBalance;
    v5->_cardBalance = (NSDecimalNumber *)v11;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v13 = objc_claimAutoreleasedReturnValue();
    additionalAmount = v5->_additionalAmount;
    v5->_additionalAmount = (NSDecimalNumber *)v13;

    -[PKEnterValueNewBalanceView _addSubviews](v5, "_addSubviews");
  }

  return v5;
}

- (void)layoutSubviews
{
  UILabel *label;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)PKEnterValueNewBalanceView;
  -[PKEnterValueNewBalanceView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKEnterValueNewBalanceView bounds](self, "bounds");
  label = self->_label;
  v6 = CGRectInset(v5, 13.0, 0.0);
  -[UILabel setFrame:](label, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double v8;
  CGSize result;

  if (self->_showSpinner)
  {
    -[UIActivityIndicatorView frame](self->_spinner, "frame", a3.width, a3.height);
    v4 = v3;
    v6 = v5;
  }
  else
  {
    width = a3.width;
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width + -26.0, a3.height);
    v4 = fmin(v8 + 26.0, width);
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)showSpinner:(BOOL)a3
{
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;

  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    spinner = self->_spinner;
    if (a3)
    {
      if (!spinner)
      {
        v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        v6 = self->_spinner;
        self->_spinner = v5;

        -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
        -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
        -[PKEnterValueNewBalanceView addSubview:](self, "addSubview:", self->_spinner);
      }
      -[UILabel removeFromSuperview](self->_label, "removeFromSuperview");
    }
    else
    {
      -[UIActivityIndicatorView removeFromSuperview](spinner, "removeFromSuperview");
      -[UILabel superview](self->_label, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[PKEnterValueNewBalanceView addSubview:](self, "addSubview:", self->_label);
    }
    -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
    -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)addAmountToBalance:(id)a3
{
  -[PKEnterValueNewBalanceView _updateAdditionalAmount:subtractAdditionalAmountFromCurrentAmount:](self, "_updateAdditionalAmount:subtractAdditionalAmountFromCurrentAmount:", a3, 0);
}

- (void)subtractAmountFromBalance:(id)a3
{
  -[PKEnterValueNewBalanceView _updateAdditionalAmount:subtractAdditionalAmountFromCurrentAmount:](self, "_updateAdditionalAmount:subtractAdditionalAmountFromCurrentAmount:", a3, 1);
}

- (void)_updateAdditionalAmount:(id)a3 subtractAdditionalAmountFromCurrentAmount:(BOOL)a4
{
  NSDecimalNumber *v7;
  NSDecimalNumber **p_additionalAmount;
  void *v9;
  int v10;
  uint64_t v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;

  v7 = (NSDecimalNumber *)a3;
  p_additionalAmount = &self->_additionalAmount;
  if (self->_additionalAmount != v7)
  {
    v13 = v7;
    objc_storeStrong((id *)&self->_additionalAmount, a3);
    self->_subtractAdditionalAmountFromCurrentAmount = a4;
    if (!*p_additionalAmount
      || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = -[NSDecimalNumber isEqual:](v13, "isEqual:", v9),
          v9,
          v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *p_additionalAmount;
      *p_additionalAmount = (NSDecimalNumber *)v11;

    }
    -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
    -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
    -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
    v7 = v13;
  }

}

- (void)setMaxBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  char v7;
  NSDecimalNumber *v8;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  if (self->_maxBalance != v5)
  {
    v8 = v5;
    v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maxBalance, a3);
      -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
      -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
      -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
      v6 = v8;
    }
  }

}

- (void)setMinBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  char v7;
  NSDecimalNumber *v8;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  if (self->_minBalance != v5)
  {
    v8 = v5;
    v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_minBalance, a3);
      -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
      -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
      -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
      v6 = v8;
    }
  }

}

- (void)setMaxLoadAmount:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  char v7;
  NSDecimalNumber *v8;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  if (self->_maxLoadAmount != v5)
  {
    v8 = v5;
    v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maxLoadAmount, a3);
      -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
      -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
      -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
      v6 = v8;
    }
  }

}

- (void)setMinLoadAmount:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  char v7;
  NSDecimalNumber *v8;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  if (self->_minLoadAmount != v5)
  {
    v8 = v5;
    v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_minLoadAmount, a3);
      -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
      -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
      -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
      v6 = v8;
    }
  }

}

- (void)setCardBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_cardBalance;
  char v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_cardBalance = &self->_cardBalance;
  if (self->_cardBalance != v5)
  {
    v13 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cardBalance, a3);
      if (!*p_cardBalance
        || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[NSDecimalNumber isEqual:](v13, "isEqual:", v9),
            v9,
            v10))
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *p_cardBalance;
        *p_cardBalance = (NSDecimalNumber *)v11;

      }
      -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
      -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
      -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
      v6 = v13;
    }
  }

}

- (void)setCurrencyCode:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_currencyCode != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currencyCode, a3);
    if (self->_currencyCode)
    {
      -[PKEnterValueNewBalanceView addSubview:](self, "addSubview:", self->_label);
      -[PKEnterValueNewBalanceView _createAmountFormatter](self, "_createAmountFormatter");
    }
    else
    {
      -[UILabel removeFromSuperview](self->_label, "removeFromSuperview");
    }
    -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
    -[PKEnterValueNewBalanceView sizeToFit](self, "sizeToFit");
    -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setPromptText:(id)a3
{
  id v5;
  NSString **p_promptText;
  NSString *promptText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  NSString *v13;

  v5 = a3;
  p_promptText = &self->_promptText;
  promptText = self->_promptText;
  v13 = (NSString *)v5;
  v8 = promptText;
  if (v8 == v13)
  {

  }
  else
  {
    if (v13 && v8)
    {
      v9 = -[NSString isEqualToString:](v13, "isEqualToString:", v8);

      v10 = v13;
      if (v9)
        goto LABEL_12;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_promptText, a3);
    if (!*p_promptText)
    {
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_CURRENT_BALANCE"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *p_promptText;
      *p_promptText = (NSString *)v11;

    }
    -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
  }
  v10 = v13;
LABEL_12:

}

- (void)setUpdatedBalancePromptText:(id)a3
{
  id v5;
  NSString **p_updatedBalancePromptText;
  NSString *updatedBalancePromptText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  NSString *v13;

  v5 = a3;
  p_updatedBalancePromptText = &self->_updatedBalancePromptText;
  updatedBalancePromptText = self->_updatedBalancePromptText;
  v13 = (NSString *)v5;
  v8 = updatedBalancePromptText;
  if (v8 == v13)
  {

  }
  else
  {
    if (v13 && v8)
    {
      v9 = -[NSString isEqualToString:](v13, "isEqualToString:", v8);

      v10 = v13;
      if (v9)
        goto LABEL_12;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_updatedBalancePromptText, a3);
    if (!*p_updatedBalancePromptText)
    {
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_NEW_BALANCE"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *p_updatedBalancePromptText;
      *p_updatedBalancePromptText = (NSString *)v11;

    }
    -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
  }
  v10 = v13;
LABEL_12:

}

- (void)setMaxLoadAmountText:(id)a3
{
  id v5;
  NSString **p_maxLoadAmountText;
  NSString *maxLoadAmountText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  NSString *v13;

  v5 = a3;
  p_maxLoadAmountText = &self->_maxLoadAmountText;
  maxLoadAmountText = self->_maxLoadAmountText;
  v13 = (NSString *)v5;
  v8 = maxLoadAmountText;
  if (v8 == v13)
  {

  }
  else
  {
    if (v13 && v8)
    {
      v9 = -[NSString isEqualToString:](v13, "isEqualToString:", v8);

      v10 = v13;
      if (v9)
        goto LABEL_12;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_maxLoadAmountText, a3);
    if (!*p_maxLoadAmountText)
    {
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_MAXIMUM_AMOUNT"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *p_maxLoadAmountText;
      *p_maxLoadAmountText = (NSString *)v11;

    }
    -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
  }
  v10 = v13;
LABEL_12:

}

- (id)_minimalFormattedStringForAmount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && self->_currencyCode)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, self->_currencyCode, 0);
    objc_msgSend(v5, "minimalFormattedStringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_textForPrompt:(id)a3 amount:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PKEnterValueNewBalanceView _minimalFormattedStringForAmount:](self, "_minimalFormattedStringForAmount:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateBalanceText
{
  _BOOL4 subtractAdditionalAmountFromCurrentAmount;
  NSDecimalNumber **p_cardBalance;
  NSDecimalNumber *cardBalance;
  NSDecimalNumber *additionalAmount;
  uint64_t v7;
  NSDecimalNumber *maxBalance;
  _BOOL4 v9;
  id *p_maxLoadAmount;
  NSDecimalNumber *maxLoadAmount;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  NSDecimalNumber *v15;
  void *v16;
  uint64_t v17;
  UILabel *v18;
  void *v19;
  NSDecimalNumber **v20;
  void *v21;
  UILabel *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UILabel *label;
  void *v28;
  NSDecimalNumber *v29;
  void *v30;
  void *v31;
  NSDecimalNumber *minLoadAmount;
  NSDecimalNumber *minBalance;
  NSDecimalNumber **v34;
  NSDecimalNumber **v35;
  id v36;

  subtractAdditionalAmountFromCurrentAmount = self->_subtractAdditionalAmountFromCurrentAmount;
  p_cardBalance = &self->_cardBalance;
  cardBalance = self->_cardBalance;
  additionalAmount = self->_additionalAmount;
  if (subtractAdditionalAmountFromCurrentAmount)
    -[NSDecimalNumber decimalNumberBySubtracting:](cardBalance, "decimalNumberBySubtracting:", additionalAmount);
  else
    -[NSDecimalNumber decimalNumberByAdding:](cardBalance, "decimalNumberByAdding:", additionalAmount);
  v7 = objc_claimAutoreleasedReturnValue();
  maxBalance = self->_maxBalance;
  v36 = (id)v7;
  if (maxBalance)
    v9 = -[NSDecimalNumber compare:](maxBalance, "compare:", v7) != NSOrderedAscending;
  else
    v9 = 1;
  p_maxLoadAmount = (id *)&self->_maxLoadAmount;
  maxLoadAmount = self->_maxLoadAmount;
  v34 = p_cardBalance;
  if (maxLoadAmount)
  {
    v12 = -[NSDecimalNumber compare:](maxLoadAmount, "compare:", self->_additionalAmount) == NSOrderedAscending;
    if (*p_maxLoadAmount && self->_maxBalance && !self->_subtractAdditionalAmountFromCurrentAmount)
    {
      -[NSDecimalNumber decimalNumberByAdding:](*p_cardBalance, "decimalNumberByAdding:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "compare:", self->_maxBalance) == -1;

      goto LABEL_14;
    }
  }
  else
  {
    v12 = 0;
  }
  v14 = 0;
LABEL_14:
  v15 = self->_additionalAmount;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero", v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSDecimalNumber compare:](v15, "compare:", v16);

  if (v17)
  {
    if (!v9 && !v14)
    {
      label = self->_label;
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_MAXIMUM_BALANCE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self->_maxBalance;
LABEL_24:
      -[PKEnterValueNewBalanceView _textForPrompt:amount:](self, "_textForPrompt:amount:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](label, "setText:", v30);

LABEL_25:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (v12)
    {
      v18 = self->_label;
      -[PKEnterValueNewBalanceView maxLoadAmountText](self, "maxLoadAmountText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v35;
      if (!self->_amountIsWithdrawal || objc_msgSend(*p_maxLoadAmount, "compare:", *v35) != 1)
        v20 = &self->_maxLoadAmount;
      -[PKEnterValueNewBalanceView _textForPrompt:amount:](self, "_textForPrompt:amount:", v19, *v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v18, "setText:", v21);

      goto LABEL_25;
    }
    minLoadAmount = self->_minLoadAmount;
    if (minLoadAmount
      && -[NSDecimalNumber compare:](minLoadAmount, "compare:", self->_additionalAmount) == NSOrderedDescending)
    {
      label = self->_label;
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_MINIMUM_AMOUNT"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self->_minLoadAmount;
      goto LABEL_24;
    }
    minBalance = self->_minBalance;
    if (minBalance
      && -[NSDecimalNumber compare:](minBalance, "compare:", v36) == NSOrderedDescending
      && self->_subtractAdditionalAmountFromCurrentAmount)
    {
      label = self->_label;
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_MAXIMUM_TRANSFER"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *v35;
      goto LABEL_24;
    }
    v22 = self->_label;
    -[PKEnterValueNewBalanceView updatedBalancePromptText](self, "updatedBalancePromptText");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = self->_label;
    -[PKEnterValueNewBalanceView promptText](self, "promptText");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;
  -[PKEnterValueNewBalanceView _textForPrompt:amount:](self, "_textForPrompt:amount:", v23, v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v22, "setText:", v25);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v26 = objc_claimAutoreleasedReturnValue();
LABEL_26:
  v31 = (void *)v26;
  -[UILabel setTextColor:](self->_label, "setTextColor:", v26);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[PKEnterValueNewBalanceView setNeedsLayout](self, "setNeedsLayout");

}

- (void)currentBalanceTapRecognized
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "didTapNewBalanceView");
      v3 = v5;
    }
  }

}

- (void)_createAmountFormatter
{
  NSNumberFormatter *v3;
  NSNumberFormatter *currentAmountFormatter;

  PKMutableNumberFormatterForCurrencyCode();
  v3 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
  currentAmountFormatter = self->_currentAmountFormatter;
  self->_currentAmountFormatter = v3;

  -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](self->_currentAmountFormatter, "setAlwaysShowsDecimalSeparator:", 0);
  -[NSNumberFormatter setMinimumFractionDigits:](self->_currentAmountFormatter, "setMinimumFractionDigits:", 0);
}

- (void)_addSubviews
{
  UILabel *v3;
  UILabel *label;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *tapRecognizer;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  label = self->_label;
  self->_label = v3;

  v5 = self->_label;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  v7 = self->_label;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7, "setFont:", v8);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
  -[UILabel setMinimumScaleFactor:](self->_label, "setMinimumScaleFactor:", 0.5);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel setUserInteractionEnabled:](self->_label, "setUserInteractionEnabled:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_currentBalanceTapRecognized);
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v9;

  -[UITapGestureRecognizer setDelegate:](self->_tapRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapRecognizer, "setNumberOfTapsRequired:", 1);
  -[UILabel addGestureRecognizer:](self->_label, "addGestureRecognizer:", self->_tapRecognizer);
  -[PKEnterValueNewBalanceView addSubview:](self, "addSubview:", self->_label);
  -[PKEnterValueNewBalanceView _updateBalanceText](self, "_updateBalanceText");
}

- (NSString)promptText
{
  return self->_promptText;
}

- (NSString)updatedBalancePromptText
{
  return self->_updatedBalancePromptText;
}

- (NSString)maxLoadAmountText
{
  return self->_maxLoadAmountText;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (NSDecimalNumber)minBalance
{
  return self->_minBalance;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (PKEnterValueNewBalanceViewDelegate)delegate
{
  return (PKEnterValueNewBalanceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)amountIsWithdrawal
{
  return self->_amountIsWithdrawal;
}

- (void)setAmountIsWithdrawal:(BOOL)a3
{
  self->_amountIsWithdrawal = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minBalance, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_maxLoadAmountText, 0);
  objc_storeStrong((id *)&self->_updatedBalancePromptText, 0);
  objc_storeStrong((id *)&self->_promptText, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_currentAmountFormatter, 0);
  objc_storeStrong((id *)&self->_additionalAmount, 0);
}

@end
