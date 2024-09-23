@implementation PKAccountScheduledPaymentCell

- (PKAccountScheduledPaymentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKAccountScheduledPaymentCell *v5;
  uint64_t v6;
  UITableViewCellLayoutManager *layoutManager;
  void *v8;
  UILabel *v9;
  UILabel *frequencyLabel;
  double v11;
  UILabel *v12;
  UILabel *statusLabel;
  double v14;
  UILabel *v15;
  UILabel *amountLabel;
  double v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKAccountScheduledPaymentCell;
  v5 = -[PKAccountScheduledPaymentCell initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3D58], "layoutManagerForTableViewCellStyle:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    layoutManager = v5->_layoutManager;
    v5->_layoutManager = (UITableViewCellLayoutManager *)v6;

    v5->_featureIdentifier = 2;
    -[PKAccountScheduledPaymentCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    frequencyLabel = v5->_frequencyLabel;
    v5->_frequencyLabel = v9;

    -[UILabel setNumberOfLines:](v5->_frequencyLabel, "setNumberOfLines:", 0);
    LODWORD(v11) = 1036831949;
    -[UILabel _setHyphenationFactor:](v5->_frequencyLabel, "_setHyphenationFactor:", v11);
    objc_msgSend(v8, "addSubview:", v5->_frequencyLabel);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v12;

    -[UILabel setNumberOfLines:](v5->_statusLabel, "setNumberOfLines:", 0);
    LODWORD(v14) = 1036831949;
    -[UILabel _setHyphenationFactor:](v5->_statusLabel, "_setHyphenationFactor:", v14);
    objc_msgSend(v8, "addSubview:", v5->_statusLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    amountLabel = v5->_amountLabel;
    v5->_amountLabel = v15;

    -[UILabel setNumberOfLines:](v5->_amountLabel, "setNumberOfLines:", 0);
    LODWORD(v17) = 1036831949;
    -[UILabel _setHyphenationFactor:](v5->_amountLabel, "_setHyphenationFactor:", v17);
    objc_msgSend(v8, "addSubview:", v5->_amountLabel);

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_sizing = 1;
  -[PKAccountScheduledPaymentCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 1.79769313e308);
  self->_sizing = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountScheduledPaymentCell;
  -[PKAccountScheduledPaymentCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAccountScheduledPaymentCell bounds](self, "bounds");
  -[PKAccountScheduledPaymentCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  UILabel *frequencyLabel;
  double v18;
  CGFloat v19;
  UILabel *amountLabel;
  double v21;
  double v22;
  CGFloat v23;
  UILabel *statusLabel;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  UILabel *v34;
  UILabel *v35;
  UILabel *v36;
  float v37;
  double v38;
  double v39;
  double v40;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, 0, a3.size.width);
  v9 = v8;
  memset(&slice, 0, sizeof(slice));
  -[PKAccountScheduledPaymentCell _effectiveLayoutMargins](self, "_effectiveLayoutMargins");
  v11 = x + v10;
  v12 = y + 14.0;
  v14 = v9 - (v10 + v13);
  remainder.origin.x = v11;
  remainder.origin.y = v12;
  remainder.size.width = v14;
  remainder.size.height = height + -28.0;
  -[PKAccountScheduledPaymentCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  PKContentAlignmentMake();
  if (-[PKAccountScheduledPaymentCell _useStackedLayoutForUsableWidth:](self, "_useStackedLayoutForUsableWidth:", v14))
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_frequencyLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v14, height + -28.0);
    v16 = v15;
    if (!self->_sizing)
    {
      frequencyLabel = self->_frequencyLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](frequencyLabel, "setFrame:");
    }
    v44.origin.x = v11;
    v44.origin.y = v12;
    v44.size.width = v14;
    v44.size.height = height + -28.0;
    CGRectDivide(v44, &slice, &remainder, v16, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_amountLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v19 = v18;
    if (!self->_sizing)
    {
      amountLabel = self->_amountLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](amountLabel, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, v19, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
    v21 = v16 + 4.0 + 28.0 + v19 + 4.0;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_statusLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v23 = v22;
    if (!self->_sizing)
    {
      statusLabel = self->_statusLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](statusLabel, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
    v25 = v21 + v23;
  }
  else
  {
    v40 = width;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_amountLabel, "pkui_sizeThatFits:forceWordWrap:", 1, (v14 + -16.0) * 0.5, height + -28.0);
    v27 = v26;
    v29 = v14 - (v28 + 16.0);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_frequencyLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, height + -28.0);
    v31 = v30 + 2.0;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_statusLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, height + -28.0 - (v30 + 2.0));
    v33 = fmax(v27, v31 + v32);
    v45.origin.x = v11;
    v45.origin.y = v12;
    v45.size.width = v14;
    v45.size.height = height + -28.0;
    CGRectDivide(v45, &slice, &remainder, v33, CGRectMinYEdge);
    v25 = v33 + 28.0;
    if (!self->_sizing)
    {
      v34 = self->_frequencyLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v34, "setFrame:");
      v35 = self->_amountLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v35, "setFrame:");
      v36 = self->_statusLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v36, "setFrame:");
    }
    width = v40;
  }
  v37 = v25;
  v38 = ceilf(v37);
  v39 = width;
  result.height = v38;
  result.width = v39;
  return result;
}

- (BOOL)_useStackedLayoutForUsableWidth:(double)a3
{
  double v4;
  double v5;
  BOOL result;

  v4 = (a3 + -16.0) * 0.5;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_amountLabel, "pkui_sizeThatFits:forceWordWrap:", 1, 1.79769313e308, 1.79769313e308);
  result = v5 > v4;
  self->_useStackedLayout = v5 > v4;
  return result;
}

- (UIEdgeInsets)_effectiveLayoutMargins
{
  int v3;
  void *v4;
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
  UIEdgeInsets result;

  v3 = -[PKAccountScheduledPaymentCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKAccountScheduledPaymentCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountScheduledPaymentCell separatorInset](self, "separatorInset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "layoutMargins");
  if (v3)
    v11 = v8;
  else
    v11 = v6;
  v12 = fmax(v11, v9);
  if (v3)
    v13 = v6;
  else
    v13 = v8;
  v14 = fmax(v13, v10);

  v15 = 0.0;
  v16 = 0.0;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v16;
  result.left = v17;
  result.top = v15;
  return result;
}

- (void)setPayment:(id)a3 forAccount:(id)a4
{
  id v6;
  int v7;
  void *v8;
  NSTimeZone *v9;
  NSTimeZone *timeZone;
  void *v11;
  void *v12;
  void *v13;
  UILabel *frequencyLabel;
  void *v15;
  UILabel *amountLabel;
  void *v17;
  UILabel *statusLabel;
  void *v19;
  id obj;

  obj = a3;
  v6 = a4;
  objc_storeWeak((id *)&self->_payment, obj);
  v7 = objc_msgSend(obj, "isOnHoldForAccount:", v6);
  if (v7)
    LOBYTE(v7) = objc_msgSend(obj, "isBeforeNextCycleForAccount:", v6);
  self->_onHold = v7;
  objc_msgSend(v6, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productTimeZone");
  v9 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  self->_timeZone = v9;

  objc_msgSend(v6, "creditDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentDueDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasPaymentDueDate = v13 != 0;

  frequencyLabel = self->_frequencyLabel;
  -[PKAccountScheduledPaymentCell _frequencyAttributedString](self, "_frequencyAttributedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](frequencyLabel, "setAttributedText:", v15);

  amountLabel = self->_amountLabel;
  -[PKAccountScheduledPaymentCell _amountAttributedString](self, "_amountAttributedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](amountLabel, "setAttributedText:", v17);

  statusLabel = self->_statusLabel;
  -[PKAccountScheduledPaymentCell _statusAttributedString](self, "_statusAttributedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](statusLabel, "setAttributedText:", v19);

  -[PKAccountScheduledPaymentCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountScheduledPaymentCell;
  -[PKAccountScheduledPaymentCell prepareForReuse](&v3, sel_prepareForReuse);
  objc_storeWeak((id *)&self->_payment, 0);
}

- (id)_frequencyAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[PKAccountScheduledPaymentCell _frequencyString](self, "_frequencyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48C0], 0x8000, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E0DC1140];
  -[PKAccountScheduledPaymentCell titleColor](self, "titleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v3, v7);
  return v8;
}

- (id)_statusAttributedString
{
  PKAccountPayment **p_payment;
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  p_payment = &self->_payment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  if ((objc_msgSend(WeakRetained, "isRecurring") & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_payment);
    v6 = objc_msgSend(v5, "state");

    if (v6 == 4)
    {
      PKLocalizedFeatureString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[PKAccountScheduledPaymentCell _dateString](self, "_dateString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_6:
  if (objc_msgSend(v7, "length"))
  {
    v14[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48C8], 0x8000, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v14[1] = *MEMORY[0x1E0DC1140];
    if (v8)
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_frequencyString
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  objc_msgSend(WeakRetained, "scheduleDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "frequency");

  if ((unint64_t)(v4 - 1) > 6)
  {
    v5 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_amountString
{
  PKAccountPayment **p_payment;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  p_payment = &self->_payment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  objc_msgSend(WeakRetained, "scheduleDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "preset");

  if (v5 == 3 || v5 == 2)
  {
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 1)
  {
    v6 = objc_loadWeakRetained((id *)p_payment);
    objc_msgSend(v6, "currencyAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_payment);
    objc_msgSend(v9, "currencyAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKFormattedCurrencyStringFromNumber();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_amountAttributedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PKAccountScheduledPaymentCell _amountString](self, "_amountString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v8[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48C0], 0x8000, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v8[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v2, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_dateString
{
  id v3;
  PKAccountPayment **p_payment;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
  objc_msgSend(v3, "setTimeZone:", self->_timeZone);
  p_payment = &self->_payment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  objc_msgSend(WeakRetained, "paymentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_onHold)
  {
    PKLocalizedFeatureString();
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_4;
  }
  if (v6)
  {
    v10 = objc_loadWeakRetained((id *)p_payment);
    v11 = objc_msgSend(v10, "isRecurring");

    if (v11)
    {
      PKLocalizedFeatureString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringFromDate:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    objc_msgSend(v3, "stringFromDate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_loadWeakRetained((id *)p_payment);
    *(_DWORD *)buf = 138412290;
    v17 = v14;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Payment is missing payment date: %@", buf, 0xCu);

  }
  v8 = 0;
LABEL_4:

  return v8;
}

- (PKAccountPayment)payment
{
  return (PKAccountPayment *)objc_loadWeakRetained((id *)&self->_payment);
}

- (void)setPayment:(id)a3
{
  objc_storeWeak((id *)&self->_payment, a3);
}

- (BOOL)onHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)a3
{
  self->_onHold = a3;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_payment);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_frequencyLabel, 0);
}

@end
