@implementation PKSuperscriptedCurrencyAmountLabel

- (PKSuperscriptedCurrencyAmountLabel)initWithPrimaryFont:(id)a3 superscriptFont:(id)a4 positiveValueTextColor:(id)a5 negativeValueTextColor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKSuperscriptedCurrencyAmountLabel *v15;
  PKSuperscriptedCurrencyAmountLabel *v16;
  UILabel *v17;
  UILabel *label;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKSuperscriptedCurrencyAmountLabel;
  v15 = -[PKSuperscriptedCurrencyAmountLabel initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_primaryFont, a3);
    objc_storeStrong((id *)&v16->_superscriptFont, a4);
    objc_storeStrong((id *)&v16->_positiveValueTextColor, a5);
    objc_storeStrong((id *)&v16->_negativeValueTextColor, a6);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v16->_label;
    v16->_label = v17;

    -[UILabel setTextAlignment:](v16->_label, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v16->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v16->_label, "setNumberOfLines:", 1);
    v16->_labelScaleFactor = 1.0;
    -[PKSuperscriptedCurrencyAmountLabel addSubview:](v16, "addSubview:", v16->_label);
  }

  return v16;
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
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)setAmount:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;

  v5 = (NSDecimalNumber *)a3;
  if (self->_amount != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_amount, a3);
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)setAmount:(id)a3 currencyCode:(id)a4
{
  NSString *v7;
  NSString **p_currencyCode;
  NSDecimalNumber *v9;

  v9 = (NSDecimalNumber *)a3;
  v7 = (NSString *)a4;
  if (self->_amount != v9)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    p_currencyCode = &self->_currencyCode;
    if (self->_currencyCode == v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  p_currencyCode = &self->_currencyCode;
  if (self->_currencyCode != v7)
  {
LABEL_5:
    objc_storeStrong((id *)p_currencyCode, a4);
LABEL_6:
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
  }

}

- (void)setPrimaryFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (v5 && self->_primaryFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_primaryFont, a3);
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)setSuperscriptFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (v5 && self->_superscriptFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_superscriptFont, a3);
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)setPositiveValueTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (v5 && self->_positiveValueTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_positiveValueTextColor, a3);
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)setNegativeValueTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (v5 && self->_negativeValueTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_negativeValueTextColor, a3);
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)setShowsPositiveValueDesignation:(BOOL)a3
{
  if (self->_showsPositiveValueDesignation != a3)
  {
    self->_showsPositiveValueDesignation = a3;
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
  }
}

- (void)setShowsNegativeValueDesignation:(BOOL)a3
{
  if (self->_showsNegativeValueDesignation != a3)
  {
    self->_showsNegativeValueDesignation = a3;
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSuperscriptedCurrencyAmountLabel;
  -[PKSuperscriptedCurrencyAmountLabel layoutSubviews](&v9, sel_layoutSubviews);
  -[PKSuperscriptedCurrencyAmountLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel setFrame:](self->_label, "setFrame:");
  if (v4 != self->_lastLayedOutBoundsSize.width || v6 != self->_lastLayedOutBoundsSize.height)
  {
    self->_lastLayedOutBoundsSize.width = v4;
    self->_lastLayedOutBoundsSize.height = v6;
    -[UILabel _actualScaleFactor](self->_label, "_actualScaleFactor");
    self->_labelScaleFactor = v8;
    -[PKSuperscriptedCurrencyAmountLabel _updateLabel](self, "_updateLabel");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateLabel
{
  id v3;

  self->_lastLayedOutBoundsSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PKSuperscriptedCurrencyAmountLabel _attributedString](self, "_attributedString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v3);

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
        -[PKSuperscriptedCurrencyAmountLabel _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v12, v15 - v12);
      if (v12 + v14 > v15 + v17)
        -[PKSuperscriptedCurrencyAmountLabel _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v15 + v17, v12 + v14 - (v15 + v17));
    }

    v8 = v18;
  }

}

- (void)_addSuperscriptToAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  UIFont *primaryFont;
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
    primaryFont = self->_primaryFont;
    v14 = a3;
    -[UIFont capHeight](primaryFont, "capHeight");
    v9 = v8;
    -[UIFont capHeight](self->_superscriptFont, "capHeight");
    v11 = (unint64_t)((v9 - v10) * self->_labelScaleFactor);
    objc_msgSend(v14, "beginEditing");
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], self->_superscriptFont, location, length);
    v12 = *MEMORY[0x1E0DC1108];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v12, v13, location, length);

    objc_msgSend(v14, "endEditing");
  }
}

- (id)_attributedString
{
  NSDecimalNumber *amount;
  UIColor **p_positiveValueTextColor;
  void *v5;
  uint64_t v6;
  NSDecimalNumber *v7;
  NSDecimalNumber *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  UIColor *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  amount = self->_amount;
  if (amount)
  {
    if (self->_currencyCode)
    {
      if (self->_primaryFont)
      {
        if (self->_superscriptFont)
        {
          p_positiveValueTextColor = &self->_positiveValueTextColor;
          if (self->_positiveValueTextColor)
          {
            if (self->_negativeValueTextColor)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = -[NSDecimalNumber compare:](amount, "compare:", v5);

              v7 = self->_amount;
              if (v6 == -1)
              {
                v8 = self->_amount;
                objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 1, 0, 1);
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDecimalNumber decimalNumberByMultiplyingBy:](v8, "decimalNumberByMultiplyingBy:", v9);
                v10 = objc_claimAutoreleasedReturnValue();

                p_positiveValueTextColor = &self->_negativeValueTextColor;
                v7 = (NSDecimalNumber *)v10;
              }
              v22[0] = *MEMORY[0x1E0DC1100];
              objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = *MEMORY[0x1E0DC1140];
              v13 = *p_positiveValueTextColor;
              v23[0] = v11;
              v23[1] = v13;
              v14 = *MEMORY[0x1E0DC1138];
              v22[1] = v12;
              v22[2] = v14;
              v23[2] = self->_primaryFont;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              PKFormattedCurrencyStringFromNumber();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              PKFormattedCurrencyStringExcludingCurrencySymbolsFromNumber();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v6 == -1)
              {
                if (self->_showsNegativeValueDesignation)
                {
                  PKLocalizedPaymentString(CFSTR("SUPERSCRIPTED_CURRENCY_AMOUNT_LABEL_NEGATIVE_VALUE_FORMAT"), CFSTR("%@"), v16);
                  goto LABEL_16;
                }
              }
              else if (self->_showsPositiveValueDesignation)
              {
                PKLocalizedPaymentString(CFSTR("SUPERSCRIPTED_CURRENCY_AMOUNT_LABEL_POSITIVE_VALUE_FORMAT"), CFSTR("%@"), v16);
LABEL_16:
                v20 = objc_claimAutoreleasedReturnValue();
LABEL_18:
                v21 = (void *)v20;
                v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v20, v15);
                -[PKSuperscriptedCurrencyAmountLabel _addSuperscriptToAttributedString:formattedCurrencyAmount:currencyAmountWithoutSymbols:](self, "_addSuperscriptToAttributedString:formattedCurrencyAmount:currencyAmountWithoutSymbols:", v18, v16, v17);

                return v18;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v16);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_18;
            }
          }
        }
      }
    }
  }
  v18 = 0;
  return v18;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)superscriptFont
{
  return self->_superscriptFont;
}

- (UIColor)positiveValueTextColor
{
  return self->_positiveValueTextColor;
}

- (UIColor)negativeValueTextColor
{
  return self->_negativeValueTextColor;
}

- (BOOL)showsPositiveValueDesignation
{
  return self->_showsPositiveValueDesignation;
}

- (BOOL)showsNegativeValueDesignation
{
  return self->_showsNegativeValueDesignation;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CGSize)lastLayedOutBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastLayedOutBoundsSize.width;
  height = self->_lastLayedOutBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastLayedOutBoundsSize:(CGSize)a3
{
  self->_lastLayedOutBoundsSize = a3;
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_negativeValueTextColor, 0);
  objc_storeStrong((id *)&self->_positiveValueTextColor, 0);
  objc_storeStrong((id *)&self->_superscriptFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
