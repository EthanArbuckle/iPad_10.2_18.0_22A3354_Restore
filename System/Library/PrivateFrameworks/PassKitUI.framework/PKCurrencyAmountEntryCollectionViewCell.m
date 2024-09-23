@implementation PKCurrencyAmountEntryCollectionViewCell

- (PKCurrencyAmountEntryCollectionViewCell)init
{
  return -[PKCurrencyAmountEntryCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKCurrencyAmountEntryCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKCurrencyAmountEntryCollectionViewCell *v3;
  PKCurrencyAmountEntryCollectionViewCell *v4;
  void *v5;
  uint64_t v6;
  UIColor *titleColor;
  id v8;
  uint64_t v9;
  UILabel *titleLabel;
  UILabel *v11;
  NSString *v12;
  void *v13;
  UITextField *v14;
  UITextField *amountTextField;
  uint64_t v16;
  UITextField *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKCurrencyAmountEntryCollectionViewCell;
  v3 = -[PKCurrencyAmountEntryCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKCurrencyAmountEntryCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = objc_claimAutoreleasedReturnValue();
    titleColor = v4->_titleColor;
    v4->_titleColor = (UIColor *)v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3990]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v9;

    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v4->_titleColor);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1);
    v11 = v4->_titleLabel;
    v12 = (NSString *)*MEMORY[0x1E0DC4A88];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v13);

    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    LODWORD(v11) = -[PKCurrencyAmountEntryCollectionViewCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection");
    v14 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    amountTextField = v4->_amountTextField;
    v4->_amountTextField = v14;

    -[UITextField setKeyboardType:](v4->_amountTextField, "setKeyboardType:", 8);
    if ((_DWORD)v11)
      v16 = 0;
    else
      v16 = 2;
    -[UITextField setTextAlignment:](v4->_amountTextField, "setTextAlignment:", v16);
    v17 = v4->_amountTextField;
    PKFontForDefaultDesign(v12, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v17, "setFont:", v18);

    -[UITextField setDelegate:](v4->_amountTextField, "setDelegate:", v4);
    objc_msgSend(v5, "addSubview:", v4->_amountTextField);

  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  NSString *v10;

  v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    title = self->_title;
    self->_title = v8;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[PKCurrencyAmountEntryCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTitleColor:(id)a3
{
  UIColor **p_titleColor;
  id v6;

  p_titleColor = &self->_titleColor;
  objc_storeStrong((id *)&self->_titleColor, a3);
  v6 = a3;
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", *p_titleColor);

}

- (void)setCurrencyAmount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSNumberFormatter *v11;
  NSNumberFormatter *currencyFormatter;
  char v13;
  NSNumberFormatter *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v17 = v5;
    if (!self->_currencyFormatter)
      goto LABEL_4;
    objc_msgSend(v5, "currency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    v6 = v17;
    if ((v9 & 1) == 0)
    {
LABEL_4:
      objc_msgSend(v6, "currency");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKMutableNumberFormatterForCurrencyCode();
      v11 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
      currencyFormatter = self->_currencyFormatter;
      self->_currencyFormatter = v11;

    }
    v13 = PKEqualObjects();
    v6 = v17;
    if ((v13 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currencyAmount, a3);
      v14 = self->_currencyFormatter;
      -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](v14, "stringFromNumber:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextField setText:](self->_amountTextField, "setText:", v16);
      v6 = v17;
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  -[PKCurrencyAmountEntryCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  v6 = fmin(height, 44.0);
  if (v5 < 44.0)
    v5 = v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITextField *amountTextField;
  void *v13;
  void *v14;
  _QWORD v15[5];
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKCurrencyAmountEntryCollectionViewCell;
  -[PKCurrencyAmountEntryCollectionViewCell layoutSubviews](&v16, sel_layoutSubviews);
  v3 = objc_alloc(MEMORY[0x1E0DC3E68]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v6 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("DONE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PKCurrencyAmountEntryCollectionViewCell_layoutSubviews__block_invoke;
  v15[3] = &unk_1E3E6D580;
  v15[4] = self;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithPrimaryAction:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v17[0] = v10;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v11);

  objc_msgSend(v4, "sizeToFit");
  -[UITextField setInputAccessoryView:](self->_amountTextField, "setInputAccessoryView:", v4);
  amountTextField = self->_amountTextField;
  if (self->_isEditable)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](amountTextField, "setTextColor:", v13);

  -[UITextField setUserInteractionEnabled:](self->_amountTextField, "setUserInteractionEnabled:", self->_isEditable);
  -[PKCurrencyAmountEntryCollectionViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  -[PKCurrencyAmountEntryCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

uint64_t __57__PKCurrencyAmountEntryCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 880), "resignFirstResponder");
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width;
  CGFloat x;
  CGFloat y;
  double v9;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect *p_slice;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CGRectEdge v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect slice;
  CGSize result;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  width = a3.size.width;
  v42 = CGRectInset(a3, 16.0, 13.0);
  x = v42.origin.x;
  y = v42.origin.y;
  v9 = v42.size.width;
  height = v42.size.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v42.size.width, v42.size.height);
  v12 = v11;
  v14 = v13;
  -[UITextField sizeThatFits:](self->_amountTextField, "sizeThatFits:", v9, height);
  v16 = v15;
  memset(&slice, 0, sizeof(slice));
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = v9;
  v39.size.height = height;
  if (v12 + 8.0 + v17 > v9)
  {
    v18 = v14 + 2.0 + v15;
    v39.size.height = v18;
    p_slice = &slice;
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = v9;
    v43.size.height = v14 + 2.0 + v16;
    CGRectDivide(v43, &slice, &v39, v14, CGRectMinYEdge);
    v20 = slice.origin.x;
    v21 = slice.origin.y;
    v22 = slice.size.width;
    v23 = slice.size.height;
    CGRectDivide(v39, &slice, &v39, 2.0, CGRectMinYEdge);
    CGRectDivide(v39, &slice, &v39, v16, CGRectMinYEdge);
    if (a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (-[PKCurrencyAmountEntryCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v24 = CGRectMaxXEdge;
  else
    v24 = CGRectMinXEdge;
  p_slice = &v39;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = v9;
  v44.size.height = height;
  CGRectDivide(v44, &slice, &v39, fmin(v9, v12), v24);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v20 = v25;
  v21 = v26;
  v22 = v27;
  v23 = v28;
  CGRectDivide(v39, &slice, &v39, 8.0, v24);
  v18 = v23;
  if (!a4)
  {
LABEL_8:
    v30 = p_slice->size.width;
    v29 = p_slice->size.height;
    v31 = v21;
    v32 = width;
    v33 = v20;
    v35 = p_slice->origin.x;
    v34 = p_slice->origin.y;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v33, v31, v22, v23, *(_QWORD *)&v39.origin.x, *(_QWORD *)&v39.origin.y, *(_QWORD *)&v39.size.width);
    v36 = v34;
    width = v32;
    -[UITextField setFrame:](self->_amountTextField, "setFrame:", v35, v36, v30, v29);
  }
LABEL_9:
  v37 = v18 + 26.0;
  v38 = width;
  result.height = v37;
  result.width = v38;
  return result;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_isEditable;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmountEntryCollectionViewCell _amountFromInput:](self, "_amountFromInput:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PKCurrencyAmountEntryCollectionViewCell _inputIsValid:](self, "_inputIsValid:", v11);
  if (v12)
  {
    -[PKCurrencyAmountEntryCollectionViewCell _amountFromInput:](self, "_amountFromInput:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "amountDidChange:", v13);

  }
  return v12;
}

- (BOOL)_inputIsValid:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  char v19;
  char v20;

  v4 = a3;
  v5 = -[NSNumberFormatter maximumFractionDigits](self->_currencyFormatter, "maximumFractionDigits");
  -[NSNumberFormatter currencySymbol](self->_currencyFormatter, "currencySymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v6, &stru_1E3E7D690);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "pk_isNotANumber") ^ 1;
  else
    LOBYTE(v10) = 0;
  v11 = objc_msgSend(v7, "pk_posixStringDecimalPlaces");
  v12 = v4;
  v13 = v6;
  v14 = v13;
  if (v13 == v12)
  {
    v15 = 1;
  }
  else
  {
    v15 = 0;
    if (v12 && v13)
      v15 = objc_msgSend(v12, "isEqualToString:", v13);
  }

  v16 = v7;
  v17 = v16;
  if (v16 == CFSTR("."))
  {
    v18 = 1;
  }
  else if (v16)
  {
    v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("."));
  }
  else
  {
    v18 = 0;
  }

  if (v11 <= v5)
    v19 = v10;
  else
    v19 = 0;
  v20 = v19 | v15 | v18;

  return v20;
}

- (id)_amountFromInput:(id)a3
{
  NSNumberFormatter *currencyFormatter;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];
  int v14;

  currencyFormatter = self->_currencyFormatter;
  v5 = a3;
  -[NSNumberFormatter currencySymbol](currencyFormatter, "currencySymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsString:", v6);

  if (v7)
  {
    -[NSNumberFormatter numberFromString:](self->_currencyFormatter, "numberFromString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3598];
    if (v8)
    {
      objc_msgSend(v8, "decimalValue");
    }
    else
    {
      v13[0] = 0;
      v13[1] = 0;
      v14 = 0;
    }
    objc_msgSend(v9, "decimalNumberWithDecimal:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (PKCurrencyAmountEntryCollectionViewCellDelegate)delegate
{
  return (PKCurrencyAmountEntryCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_amountTextField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
