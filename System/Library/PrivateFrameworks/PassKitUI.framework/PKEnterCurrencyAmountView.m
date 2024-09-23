@implementation PKEnterCurrencyAmountView

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKEnterCurrencyAmountView;
  v4 = a3;
  -[UIView pk_applyAppearance:](&v6, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "buttonTextColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKEnterCurrencyAmountView setTextColor:](self, "setTextColor:", v5);
}

- (id)pk_childrenForAppearance
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PKEnterCurrencyAmountView amountTextField](self, "amountTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (PKEnterCurrencyAmountView)initWithCurrency:(id)a3 amount:(id)a4
{
  __CFString *v6;
  id v7;
  PKEnterCurrencyAmountView *v8;
  PKEnterCurrencyAmountView *v9;
  __CFString *v10;
  uint64_t v11;
  UIFont *currencySymbolFont;
  uint64_t v13;
  UIFont *amountFont;
  uint64_t v15;
  UIColor *textColor;
  objc_super v18;

  v6 = (__CFString *)a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKEnterCurrencyAmountView;
  v8 = -[PKEnterCurrencyAmountView init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isFirstKeyboardInput = 1;
    if (v6)
      v10 = v6;
    else
      v10 = CFSTR("USD");
    objc_storeStrong((id *)&v8->_currency, v10);
    v9->_labelScaleFactor = 1.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 70.0);
    v11 = objc_claimAutoreleasedReturnValue();
    currencySymbolFont = v9->_currencySymbolFont;
    v9->_currencySymbolFont = (UIFont *)v11;

    objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 70.0);
    v13 = objc_claimAutoreleasedReturnValue();
    amountFont = v9->_amountFont;
    v9->_amountFont = (UIFont *)v13;

    objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
    v15 = objc_claimAutoreleasedReturnValue();
    textColor = v9->_textColor;
    v9->_textColor = (UIColor *)v15;

    -[PKEnterCurrencyAmountView _createAmountFormatter](v9, "_createAmountFormatter");
    -[PKEnterCurrencyAmountView _createSubviews](v9, "_createSubviews");
    -[PKEnterCurrencyAmountView setCurrentAmount:](v9, "setCurrentAmount:", v7);
    -[PKEnterCurrencyAmountView setShowsDecimalPointButton:](v9, "setShowsDecimalPointButton:", 0);
    -[PKEnterCurrencyAmountView setEnabled:](v9, "setEnabled:", 1);
    -[PKEnterCurrencyAmountView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
  }

  return v9;
}

- (void)setShowsDecimalPointButton:(BOOL)a3
{
  self->_showsDecimalPointButton = a3;
  -[PKNumberPadInputView setShowsDecimalPointButton:](self->_numberPad, "setShowsDecimalPointButton:");
}

- (void)setCurrentAmount:(id)a3
{
  -[PKEnterCurrencyAmountView setCurrentAmount:forceFormatForDisplay:](self, "setCurrentAmount:forceFormatForDisplay:", a3, 1);
}

- (void)setCurrentAmount:(id)a3 forceFormatForDisplay:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = v6;
  if (a4)
  {
    v7 = v6;
    v8 = 0;
    if (!v6)
      goto LABEL_9;
  }
  else
  {
    -[PKEnterCurrencyAmountView currentAmount](self, "currentAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKEqualObjects();

    v7 = v11;
    if (!v11)
      goto LABEL_9;
  }
  if ((v8 & 1) == 0)
  {
    -[PKEnterCurrencyAmountView _formattedStringForAmount:](self, "_formattedStringForAmount:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_amountString, v10);
      -[PKEnterCurrencyAmountView _updateContent](self, "_updateContent");
    }

    v7 = v11;
  }
LABEL_9:

}

- (NSDecimalNumber)currentAmount
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PKEnterCurrencyAmountView _decimalNumberFromString:](self, "_decimalNumberFromString:", self->_amountString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToNumber:", v3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2;
  }
  v5 = v4;

  return (NSDecimalNumber *)v5;
}

- (NSString)amountString
{
  return self->_amountString;
}

- (void)setCurrency:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_currency, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_currency, a3);
    -[PKEnterCurrencyAmountView _createAmountFormatter](self, "_createAmountFormatter");
    -[PKEnterCurrencyAmountView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setInputAccessoryView:(id)a3
{
  UIView **p_internalInputAccessoryView;
  UIView *v6;

  p_internalInputAccessoryView = &self->_internalInputAccessoryView;
  v6 = (UIView *)a3;
  if (*p_internalInputAccessoryView != v6)
  {
    objc_storeStrong((id *)&self->_internalInputAccessoryView, a3);
    if (self->_numberPad)
      -[UITextField setInputAccessoryView:](self->_amountTextField, "setInputAccessoryView:", *p_internalInputAccessoryView);
  }

}

- (UIView)inputAccessoryView
{
  return self->_internalInputAccessoryView;
}

- (void)dismissKeyboard
{
  -[UITextField resignFirstResponder](self->_amountTextField, "resignFirstResponder");
}

- (void)showKeyboard
{
  -[PKEnterCurrencyAmountView _configureAmountTextFieldInputView](self, "_configureAmountTextFieldInputView");
  -[UITextField becomeFirstResponder](self->_amountTextField, "becomeFirstResponder");
}

- (void)setTextColor:(id)a3
{
  id v4;
  char v5;
  void *v6;
  UIColor *v7;
  UIColor *textColor;
  void *v9;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v4;
  v5 = PKEqualObjects();
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    v7 = (UIColor *)objc_msgSend(v9, "copy");
    textColor = self->_textColor;
    self->_textColor = v7;

    if (-[PKEnterCurrencyAmountView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
      -[UILabel setTextColor:](self->_amountLabel, "setTextColor:", v9);
    -[PKNumberPadInputView setTextColor:](self->_numberPad, "setTextColor:", self->_textColor);
    v6 = v9;
  }

}

- (void)setKeyboardColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_keyboardColor, a3);
  v5 = a3;
  -[PKNumberPadInputView setNumberPadColor:](self->_numberPad, "setNumberPadColor:", v5);

}

- (UIColor)keyboardColor
{
  UIColor *keyboardColor;

  keyboardColor = self->_keyboardColor;
  if (keyboardColor)
    return keyboardColor;
  -[PKNumberPadInputView numberPadColor](self->_numberPad, "numberPadColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCurrencySymbolFont:(id)a3
{
  UIFont *v5;
  UIFont **p_currencySymbolFont;
  uint64_t v7;
  UIFont *v8;
  UIFont *v9;

  v5 = (UIFont *)a3;
  p_currencySymbolFont = &self->_currencySymbolFont;
  if (self->_currencySymbolFont != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_currencySymbolFont, a3);
    if (!*p_currencySymbolFont)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 70.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *p_currencySymbolFont;
      *p_currencySymbolFont = (UIFont *)v7;

    }
    -[PKEnterCurrencyAmountView _updateContent](self, "_updateContent");
    v5 = v9;
  }

}

- (void)setAmountFont:(id)a3
{
  UIFont *v5;
  UIFont **p_amountFont;
  uint64_t v7;
  UIFont *v8;
  UIFont *v9;

  v5 = (UIFont *)a3;
  p_amountFont = &self->_amountFont;
  if (self->_amountFont != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_amountFont, a3);
    if (!*p_amountFont)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 70.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *p_amountFont;
      *p_amountFont = (UIFont *)v7;

    }
    -[UILabel setFont:](self->_amountLabel, "setFont:");
    -[UILabel sizeToFit](self->_amountLabel, "sizeToFit");
    -[PKEnterCurrencyAmountView _updateContent](self, "_updateContent");
    v5 = v9;
  }

}

- (void)setEnabled:(BOOL)a3
{
  UILabel *amountLabel;
  id v4;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    amountLabel = self->_amountLabel;
    if (a3)
    {
      -[UILabel setTextColor:](self->_amountLabel, "setTextColor:", self->_textColor);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](amountLabel, "setTextColor:", v4);

    }
  }
}

- (CGSize)defaultKeyboardSize
{
  PKNumberPadInputView *numberPad;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  numberPad = self->_numberPad;
  if (numberPad)
  {
    -[PKNumberPadInputView frame](numberPad, "frame");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    +[PKNumberPadInputView defaultSizeForInterfaceOrientation:](PKNumberPadInputView, "defaultSizeForInterfaceOrientation:", 1);
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKEnterCurrencyAmountView;
  -[PKEnterCurrencyAmountView layoutSubviews](&v10, sel_layoutSubviews);
  -[PKEnterCurrencyAmountView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel frame](self->_amountLabel, "frame");
  -[UILabel setFrame:](self->_amountLabel, "setFrame:", v4 * 0.5 - v7 * 0.5, 0.0);
  if (v4 != self->_lastLayoutBoundsSize.width || v6 != self->_lastLayoutBoundsSize.height)
  {
    self->_lastLayoutBoundsSize.width = v4;
    self->_lastLayoutBoundsSize.height = v6;
    -[UILabel _actualScaleFactor](self->_amountLabel, "_actualScaleFactor");
    self->_labelScaleFactor = v9;
    -[PKEnterCurrencyAmountView _updateContent](self, "_updateContent");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_amountLabel, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_amountLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_amountLabel;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKEnterCurrencyAmountView;
  -[PKEnterCurrencyAmountView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PKEnterCurrencyAmountView _createNumberPad](self, "_createNumberPad");
}

- (void)_createNumberPad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKNumberPadInputView *v11;
  PKNumberPadInputView *v12;
  PKNumberPadInputView *numberPad;
  id WeakRetained;
  id v15;
  _QWORD v16[5];

  if (!self->_numberPad)
  {
    -[PKEnterCurrencyAmountView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v15 = v3;
      objc_msgSend(v3, "windowScene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        +[PKNumberPadInputView defaultSizeForInterfaceOrientation:](PKNumberPadInputView, "defaultSizeForInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));
        v7 = v6;
        v9 = v8;
        if ((PKHomeButtonIsAvailable() & 1) == 0)
        {
          objc_msgSend(v15, "safeAreaInsets");
          v9 = v9 + v10;
        }
        v11 = [PKNumberPadInputView alloc];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __45__PKEnterCurrencyAmountView__createNumberPad__block_invoke;
        v16[3] = &unk_1E3E751B8;
        v16[4] = self;
        v12 = -[PKNumberPadInputView initWithFrame:delegate:configurator:](v11, "initWithFrame:delegate:configurator:", self, v16, 0.0, 0.0, v7, v9);
        numberPad = self->_numberPad;
        self->_numberPad = v12;

        -[PKEnterCurrencyAmountView _configureAmountTextFieldInputView](self, "_configureAmountTextFieldInputView");
        if (self->_internalInputAccessoryView)
          -[UITextField setInputAccessoryView:](self->_amountTextField, "setInputAccessoryView:");
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "enterCurrencyAmountViewDidLayoutKeyboard:", self);

      }
      v3 = v15;
    }

  }
}

void __45__PKEnterCurrencyAmountView__createNumberPad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 432);
  v4 = a2;
  objc_msgSend(v4, "setShowsDecimalPointButton:", v3);
  objc_msgSend(v4, "setNumberPadColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(v4, "setTextColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));

}

- (void)_configureAmountTextFieldInputView
{
  PKNumberPadInputView *numberPad;

  if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) != 0)
    numberPad = 0;
  else
    numberPad = self->_numberPad;
  -[UITextField setInputView:](self->_amountTextField, "setInputView:", numberPad);
}

- (void)numberPadInputView:(id)a3 requestReplaceSelectedTextFieldRangeWithText:(id)a4
{
  void *v5;
  UITextField *amountTextField;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  -[UITextField selectedTextRange](self->_amountTextField, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    amountTextField = self->_amountTextField;
    v7 = -[UITextField selectionRange](amountTextField, "selectionRange");
    if (-[PKEnterCurrencyAmountView textField:shouldChangeCharactersInRange:replacementString:](self, "textField:shouldChangeCharactersInRange:replacementString:", amountTextField, v7, v8, v9))
    {
      -[UITextField replaceRange:withText:](self->_amountTextField, "replaceRange:withText:", v5, v9);
    }
  }

}

- (void)numberPadInputViewRequestDeleteText:(id)a3
{
  void *v4;
  UITextField *amountTextField;
  void *v6;
  void *v7;
  UITextField *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  UITextField *v13;
  void *v14;
  uint64_t v15;
  UITextField *v16;
  void *v17;
  uint64_t v18;
  id v19;

  -[UITextField selectedTextRange](self->_amountTextField, "selectedTextRange", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v19 = v4;
    if (objc_msgSend(v4, "isEmpty"))
    {
      amountTextField = self->_amountTextField;
      objc_msgSend(v19, "start");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField positionFromPosition:offset:](amountTextField, "positionFromPosition:offset:", v6, -1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_10:

        return;
      }
      v8 = self->_amountTextField;
      objc_msgSend(v19, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField textRangeFromPosition:toPosition:](v8, "textRangeFromPosition:toPosition:", v7, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v10;
      if (!v10)
        return;
    }
    else
    {
      v11 = v19;
    }
    v19 = v11;
    -[UITextField beginningOfDocument](self->_amountTextField, "beginningOfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_amountTextField;
    objc_msgSend(v19, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UITextField offsetFromPosition:toPosition:](v13, "offsetFromPosition:toPosition:", v12, v14);

    v16 = self->_amountTextField;
    objc_msgSend(v19, "end");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UITextField offsetFromPosition:toPosition:](v16, "offsetFromPosition:toPosition:", v12, v17);

    if (-[PKEnterCurrencyAmountView textField:shouldChangeCharactersInRange:replacementString:](self, "textField:shouldChangeCharactersInRange:replacementString:", self->_amountTextField, v15, v18 - v15, &stru_1E3E7D690))
    {
      -[UITextField replaceRange:withText:](self->_amountTextField, "replaceRange:withText:", v19, &stru_1E3E7D690);
    }

    goto LABEL_10;
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  NSString *v15;
  NSString *amountString;
  void *v17;
  NSString *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  unint64_t v37;
  void *v38;
  int v39;
  NSString *v40;
  NSString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  id WeakRetained;
  int v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  unint64_t v56;
  BOOL v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  length = a4.length;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_enabled)
  {
    v55 = v8;
    objc_msgSend(v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    v13 = 0x1E0CB3000uLL;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEnterCurrencyAmountView _formatAmount:minimumFractionDigits:](self, "_formatAmount:minimumFractionDigits:", v14, 0);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      amountString = self->_amountString;
      self->_amountString = v15;

    }
    if (self->_isFirstKeyboardInput && self->_clearAmountOnFirstKeyboardInput)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEnterCurrencyAmountView _formatAmount:minimumFractionDigits:](self, "_formatAmount:minimumFractionDigits:", v17, 0);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_amountString;
      self->_amountString = v18;

    }
    self->_isFirstKeyboardInput = 0;
    v56 = -[NSNumberFormatter maximumFractionDigits](self->_amountFormatter, "maximumFractionDigits");
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "decimalSeparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_amountString;
    v22 = -[NSString rangeOfString:](v21, "rangeOfString:", v20);
    v57 = v22 != 0x7FFFFFFFFFFFFFFFLL;
    -[NSNumberFormatter groupingSeparator](self->_amountFormatter, "groupingSeparator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v23, &stru_1E3E7D690);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKEnterCurrencyAmountView _decimalNumberFromString:](self, "_decimalNumberFromString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v25;
    if (((objc_msgSend(v24, "isEqualToString:", v20) & 1) != 0
       || v25
       && (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
           v26 = (void *)objc_claimAutoreleasedReturnValue(),
           v27 = objc_msgSend(v25, "isEqualToNumber:", v26),
           v26,
           (v27 & 1) == 0))
      && objc_msgSend(v24, "length"))
    {
      if (objc_msgSend(v24, "length"))
      {
        v28 = 0;
        v52 = v20;
        do
        {
          objc_msgSend(v24, "substringWithRange:", v28, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "isEqualToString:", v20))
          {
            if (v57 || v56 == 0)
            {
              PKLogFacilityTypeGetObject();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D178000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring decimal character input, input already has a decimal character", buf, 2u);
              }
            }
            else
            {
              -[NSString stringByAppendingString:](v21, "stringByAppendingString:", v29);
              v30 = v21;
              v57 = 1;
              v21 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_32;
          }
          -[PKEnterCurrencyAmountView _decimalNumberFromString:](self, "_decimalNumberFromString:", v29);
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v13 + 1432), "notANumber");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[NSObject isEqualToNumber:](v30, "isEqualToNumber:", v31);

          if ((v32 & 1) != 0)
          {
            PKLogFacilityTypeGetObject();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v29;
              v34 = v33;
              v35 = "Ignoring non-numeric input: %@";
              v36 = 12;
LABEL_28:
              _os_log_impl(&dword_19D178000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
            }
          }
          else
          {
            if (!v57)
            {
              -[PKEnterCurrencyAmountView _decimalNumberFromString:](self, "_decimalNumberFromString:", v21);
              v33 = objc_claimAutoreleasedReturnValue();
              v37 = v13;
              objc_msgSend(*(id *)(v13 + 1432), "zero");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[NSObject isEqualToNumber:](v33, "isEqualToNumber:", v38);

              if (v39)
              {
                v40 = v29;
              }
              else
              {
                -[NSString stringByAppendingString:](v21, "stringByAppendingString:", v29);
                v40 = (NSString *)objc_claimAutoreleasedReturnValue();
              }
              v41 = v40;

              v21 = v41;
              v13 = v37;
              v20 = v52;
              goto LABEL_31;
            }
            if (-[PKEnterCurrencyAmountView _numberOfDecimalPlacesInString:decimalSeperator:](self, "_numberOfDecimalPlacesInString:decimalSeperator:", v21, v20) >= v56)
            {
              PKLogFacilityTypeGetObject();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v34 = v33;
                v35 = "Ignoring input beyond maximum number of decimal places";
                v36 = 2;
                goto LABEL_28;
              }
            }
            else
            {
              -[NSString stringByAppendingString:](v21, "stringByAppendingString:", v29);
              v33 = v21;
              v21 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
          }
LABEL_31:

LABEL_32:
          ++v28;
        }
        while (v28 < objc_msgSend(v24, "length"));
      }
    }
    else if (length && -[NSString length](v21, "length"))
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL || self->_showsDecimalPointButton)
        v42 = -[NSString length](v21, "length") - 1;
      else
        v42 = -[NSString rangeOfString:](v21, "rangeOfString:", v20);
      -[NSString substringWithRange:](v21, "substringWithRange:", 0, v42);
      v43 = objc_claimAutoreleasedReturnValue();

      v21 = (NSString *)v43;
    }
    -[PKEnterCurrencyAmountView currentAmount](self, "currentAmount");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v21, "length"))
      -[PKEnterCurrencyAmountView _decimalNumberFromString:](self, "_decimalNumberFromString:", v21);
    else
      objc_msgSend(*(id *)(v13 + 1432), "zero");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(*(id *)(v13 + 1432), "notANumber");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqualToNumber:", v46);

      if ((v47 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v49 = objc_msgSend(WeakRetained, "enterCurrencyAmountView:shouldChangeAmountFrom:to:", self, v44, v45);

        if (v49)
        {
          objc_storeStrong((id *)&self->_amountString, v21);
          -[PKEnterCurrencyAmountView _updateContent](self, "_updateContent");
          v50 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v50, "enterCurrencyAmountViewDidChangeAmount:", self);

        }
      }
    }

    v8 = v55;
  }
  else
  {
    v24 = v9;
  }

  return 0;
}

- (unint64_t)_numberOfDecimalPlacesInString:(id)a3 decimalSeperator:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:options:", a4, 4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = objc_msgSend(v5, "length") - (v6 + v7);

  return v8;
}

- (void)_createAmountFormatter
{
  NSNumberFormatter *v3;
  NSNumberFormatter *amountFormatter;
  NSNumberFormatter *v5;
  NSNumberFormatter *currencySymbolAmountFormatter;
  __int16 v7;
  NSDecimalNumberHandler *v8;
  NSDecimalNumberHandler *roundingBehavior;

  PKMutableNumberFormatterForCurrencyCodeExcludingCurrencySymbols();
  v3 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
  amountFormatter = self->_amountFormatter;
  self->_amountFormatter = v3;

  -[NSNumberFormatter setUsesGroupingSeparator:](self->_amountFormatter, "setUsesGroupingSeparator:", 0);
  -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](self->_amountFormatter, "setAlwaysShowsDecimalSeparator:", 0);
  -[NSNumberFormatter setMinimumFractionDigits:](self->_amountFormatter, "setMinimumFractionDigits:", 0);
  -[NSNumberFormatter setGeneratesDecimalNumbers:](self->_amountFormatter, "setGeneratesDecimalNumbers:", 1);
  -[NSNumberFormatter setPositivePrefix:](self->_amountFormatter, "setPositivePrefix:", &stru_1E3E7D690);
  -[NSNumberFormatter setPositiveSuffix:](self->_amountFormatter, "setPositiveSuffix:", &stru_1E3E7D690);
  -[NSNumberFormatter setNegativeSuffix:](self->_amountFormatter, "setNegativeSuffix:", &stru_1E3E7D690);
  PKMutableNumberFormatterForCurrencyCode();
  v5 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
  currencySymbolAmountFormatter = self->_currencySymbolAmountFormatter;
  self->_currencySymbolAmountFormatter = v5;

  -[NSNumberFormatter setGeneratesDecimalNumbers:](self->_currencySymbolAmountFormatter, "setGeneratesDecimalNumbers:", 1);
  v7 = -[NSNumberFormatter maximumFractionDigits](self->_amountFormatter, "maximumFractionDigits");
  objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, v7, 0, 0, 0, 0);
  v8 = (NSDecimalNumberHandler *)objc_claimAutoreleasedReturnValue();
  roundingBehavior = self->_roundingBehavior;
  self->_roundingBehavior = v8;

}

- (id)_formatAmountForDisplay:(id)a3 alwaysShowDecimalSeparator:(BOOL)a4 minimumFractionDigits:(unint64_t)a5 useGroupingSeparator:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  NSNumberFormatter *currencySymbolAmountFormatter;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v8 = a4;
  currencySymbolAmountFormatter = self->_currencySymbolAmountFormatter;
  v11 = a3;
  -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](currencySymbolAmountFormatter, "setAlwaysShowsDecimalSeparator:", v8);
  -[NSNumberFormatter setMinimumFractionDigits:](self->_currencySymbolAmountFormatter, "setMinimumFractionDigits:", a5);
  -[NSNumberFormatter setUsesGroupingSeparator:](self->_currencySymbolAmountFormatter, "setUsesGroupingSeparator:", v6);
  -[NSNumberFormatter stringFromNumber:](self->_currencySymbolAmountFormatter, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_addSuperscriptToAttributedString:(id)a3 formattedCurrencyAmount:(id)a4 currencyAmountWithoutSymbols:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v8 = a3;
  if (v8 && a4 && a5)
  {
    v18 = v8;
    v9 = a5;
    v10 = a4;
    objc_msgSend(v18, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeOfString:options:", v10, 0);
    v14 = v13;

    v15 = objc_msgSend(v11, "rangeOfString:options:", v9, 0);
    v17 = v16;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 > v12)
        -[PKEnterCurrencyAmountView _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v12, v15 - v12);
      if (v12 + v14 > v15 + v17)
        -[PKEnterCurrencyAmountView _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v15 + v17, v12 + v14 - (v15 + v17));
    }

    v8 = v18;
  }

}

- (void)_addSuperscriptToAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  UIFont *amountFont;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (a4.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = a4.length;
    location = a4.location;
    amountFont = self->_amountFont;
    v14 = a3;
    -[UIFont capHeight](amountFont, "capHeight");
    v9 = v8;
    -[UIFont capHeight](self->_currencySymbolFont, "capHeight");
    v11 = (unint64_t)((v9 - v10) * self->_labelScaleFactor);
    objc_msgSend(v14, "beginEditing");
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], self->_currencySymbolFont, location, length);
    v12 = *MEMORY[0x1E0DC1108];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v12, v13, location, length);

    objc_msgSend(v14, "endEditing");
  }
}

- (id)_formatAmount:(id)a3 minimumFractionDigits:(unint64_t)a4
{
  NSNumberFormatter *amountFormatter;
  id v7;
  void *v8;

  amountFormatter = self->_amountFormatter;
  v7 = a3;
  -[NSNumberFormatter setMinimumFractionDigits:](amountFormatter, "setMinimumFractionDigits:", a4);
  -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_decimalNumberFromString:(id)a3
{
  void *v4;
  void *v5;

  -[NSNumberFormatter numberFromString:](self->_amountFormatter, "numberFromString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberByRoundingAccordingToBehavior:", self->_roundingBehavior);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateContent
{
  void *v3;
  NSString *v4;
  NSString *amountString;
  void *v6;
  void *v7;
  _BOOL8 v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSNumber *kerning;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_amountString, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterCurrencyAmountView _formatAmount:minimumFractionDigits:](self, "_formatAmount:minimumFractionDigits:", v3, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    amountString = self->_amountString;
    self->_amountString = v4;

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decimalSeparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSString rangeOfString:](self->_amountString, "rangeOfString:", v7) != 0x7FFFFFFFFFFFFFFFLL;
  v9 = -[PKEnterCurrencyAmountView _numberOfDecimalPlacesInString:decimalSeperator:](self, "_numberOfDecimalPlacesInString:decimalSeperator:", self->_amountString, v7);
  -[PKEnterCurrencyAmountView currentAmount](self, "currentAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnterCurrencyAmountView _formatAmountForDisplay:alwaysShowDecimalSeparator:minimumFractionDigits:useGroupingSeparator:](self, "_formatAmountForDisplay:alwaysShowDecimalSeparator:minimumFractionDigits:useGroupingSeparator:", v10, v8, v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3778]);
    if (self->_kerning)
      kerning = self->_kerning;
    else
      kerning = (NSNumber *)&unk_1E3FADB28;
    v18 = *MEMORY[0x1E0DC1150];
    v19[0] = kerning;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v14);

  }
  else
  {
    v15 = 0;
  }
  -[NSNumberFormatter currencySymbol](self->_currencySymbolAmountFormatter, "currencySymbol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v16, &stru_1E3E7D690);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnterCurrencyAmountView _addSuperscriptToAttributedString:formattedCurrencyAmount:currencyAmountWithoutSymbols:](self, "_addSuperscriptToAttributedString:formattedCurrencyAmount:currencyAmountWithoutSymbols:", v15, v11, v17);
  -[UILabel setAttributedText:](self->_amountLabel, "setAttributedText:", v15);
  -[UITextField setText:](self->_amountTextField, "setText:", v11);
  -[UILabel sizeToFit](self->_amountLabel, "sizeToFit");
  -[PKEnterCurrencyAmountView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *amountLabel;
  UILabel *v5;
  void *v6;
  _PKEnterCurrencyWithSuggestionsTextField *v7;
  uint64_t v8;
  UITextField *amountTextField;
  _PKEnterCurrencyWithSuggestionsTextField *v10;
  id v11;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  amountLabel = self->_amountLabel;
  self->_amountLabel = v3;

  v5 = self->_amountLabel;
  -[PKEnterCurrencyAmountView amountFont](self, "amountFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  -[UILabel setTextAlignment:](self->_amountLabel, "setTextAlignment:", 1);
  -[UILabel sizeToFit](self->_amountLabel, "sizeToFit");
  -[UILabel setAccessibilityIdentifier:](self->_amountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
  -[PKEnterCurrencyAmountView addSubview:](self, "addSubview:", self->_amountLabel);
  v7 = objc_alloc_init(_PKEnterCurrencyWithSuggestionsTextField);
  -[_PKEnterCurrencyWithSuggestionsTextField setHidden:](v7, "setHidden:", 1);
  -[_PKEnterCurrencyWithSuggestionsTextField setDelegate:](v7, "setDelegate:", self);
  -[_PKEnterCurrencyWithSuggestionsTextField inputAssistantItem](v7, "inputAssistantItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v11, "setLeadingBarButtonGroups:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v11, "setTrailingBarButtonGroups:", v8);
  amountTextField = self->_amountTextField;
  self->_amountTextField = &v7->super;
  v10 = v7;

  -[PKEnterCurrencyAmountView addSubview:](self, "addSubview:", self->_amountTextField);
}

- (id)_formattedStringForAmount:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "pk_isIntegralNumber") && !self->_ignoreIntegralNumber)
    v5 = 0;
  else
    v5 = -[NSNumberFormatter maximumFractionDigits](self->_amountFormatter, "maximumFractionDigits");
  -[PKEnterCurrencyAmountView _formatAmount:minimumFractionDigits:](self, "_formatAmount:minimumFractionDigits:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)showsDecimalPointButton
{
  return self->_showsDecimalPointButton;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)ignoreIntegralNumber
{
  return self->_ignoreIntegralNumber;
}

- (void)setIgnoreIntegralNumber:(BOOL)a3
{
  self->_ignoreIntegralNumber = a3;
}

- (BOOL)clearAmountOnFirstKeyboardInput
{
  return self->_clearAmountOnFirstKeyboardInput;
}

- (void)setClearAmountOnFirstKeyboardInput:(BOOL)a3
{
  self->_clearAmountOnFirstKeyboardInput = a3;
}

- (UITextField)amountTextField
{
  return self->_amountTextField;
}

- (void)setAmountString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)currency
{
  return self->_currency;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (UIFont)currencySymbolFont
{
  return self->_currencySymbolFont;
}

- (NSNumber)kerning
{
  return self->_kerning;
}

- (void)setKerning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (PKEnterCurrencyAmountViewDelegate)delegate
{
  return (PKEnterCurrencyAmountViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)amountLabel
{
  return self->_amountLabel;
}

- (void)setAmountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_amountLabel, a3);
}

- (PKNumberPadInputView)numberPad
{
  return self->_numberPad;
}

- (void)setNumberPad:(id)a3
{
  objc_storeStrong((id *)&self->_numberPad, a3);
}

- (NSDecimalNumberHandler)roundingBehavior
{
  return self->_roundingBehavior;
}

- (void)setRoundingBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_roundingBehavior, a3);
}

- (NSNumberFormatter)amountFormatter
{
  return self->_amountFormatter;
}

- (void)setAmountFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_amountFormatter, a3);
}

- (NSNumberFormatter)currencySymbolAmountFormatter
{
  return self->_currencySymbolAmountFormatter;
}

- (void)setCurrencySymbolAmountFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_currencySymbolAmountFormatter, a3);
}

- (BOOL)isFirstKeyboardInput
{
  return self->_isFirstKeyboardInput;
}

- (void)setIsFirstKeyboardInput:(BOOL)a3
{
  self->_isFirstKeyboardInput = a3;
}

- (CGSize)lastLayoutBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastLayoutBoundsSize.width;
  height = self->_lastLayoutBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastLayoutBoundsSize:(CGSize)a3
{
  self->_lastLayoutBoundsSize = a3;
}

- (double)labelScaleFactor
{
  return self->_labelScaleFactor;
}

- (void)setLabelScaleFactor:(double)a3
{
  self->_labelScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencySymbolAmountFormatter, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_roundingBehavior, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_kerning, 0);
  objc_storeStrong((id *)&self->_currencySymbolFont, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amountString, 0);
  objc_storeStrong((id *)&self->_amountTextField, 0);
  objc_storeStrong((id *)&self->_keyboardColor, 0);
  objc_storeStrong((id *)&self->_internalInputAccessoryView, 0);
}

@end
