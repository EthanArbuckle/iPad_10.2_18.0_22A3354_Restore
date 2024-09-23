@implementation PKAccountBillPaymentPayInterestDescriptionView

- (PKAccountBillPaymentPayInterestDescriptionView)initWithAccount:(id)a3
{
  id v5;
  PKAccountBillPaymentPayInterestDescriptionView *v6;
  PKAccountBillPaymentPayInterestDescriptionView *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSNumberFormatter *amountFormatter;
  uint64_t v12;
  NSString *learnMoreString;
  uint64_t v14;
  UITextView *cancellationView;
  UILabel *v16;
  UILabel *estimatedChargeLabel;
  UILabel *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  UILabel *interestLabel;
  UILabel *v25;
  void *v26;
  NSDateFormatter *v27;
  NSDateFormatter *productDateFormatter;
  NSDateFormatter *v29;
  void *v30;
  NSDateFormatter *v31;
  void *v32;
  void *v33;
  NSDateFormatter *v34;
  NSDateFormatter *localDateFormatter;
  NSDateFormatter *v36;
  void *v37;
  NSDateFormatter *v38;
  NSDateFormatter *localTimeFormatter;
  NSDateFormatter *v40;
  void *v41;
  void *v43;
  objc_super v44;

  v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PKAccountBillPaymentPayInterestDescriptionView;
  v6 = -[PKAccountBillPaymentPayInterestDescriptionView init](&v44, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    objc_msgSend(v5, "creditDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currencyCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v10 = objc_claimAutoreleasedReturnValue();
    amountFormatter = v7->_amountFormatter;
    v7->_amountFormatter = (NSNumberFormatter *)v10;

    objc_msgSend(v5, "feature");
    PKLocalizedFeatureString();
    v12 = objc_claimAutoreleasedReturnValue();
    learnMoreString = v7->_learnMoreString;
    v7->_learnMoreString = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v14 = objc_claimAutoreleasedReturnValue();
    cancellationView = v7->_cancellationView;
    v7->_cancellationView = (UITextView *)v14;

    -[UITextView setDelegate:](v7->_cancellationView, "setDelegate:", v7);
    -[UITextView setSelectable:](v7->_cancellationView, "setSelectable:", 1);
    -[UITextView setUserInteractionEnabled:](v7->_cancellationView, "setUserInteractionEnabled:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](v7->_cancellationView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTextContainerInset:](v7->_cancellationView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setAccessibilityIdentifier:](v7->_cancellationView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679C8]);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    estimatedChargeLabel = v7->_estimatedChargeLabel;
    v7->_estimatedChargeLabel = v16;

    -[UILabel setTextAlignment:](v7->_estimatedChargeLabel, "setTextAlignment:", 1);
    v18 = v7->_estimatedChargeLabel;
    v19 = (void *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v20);

    v21 = v7->_estimatedChargeLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setNumberOfLines:](v7->_estimatedChargeLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v7->_estimatedChargeLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B78]);
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    interestLabel = v7->_interestLabel;
    v7->_interestLabel = v23;

    PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B58], v19, 0x8000, 32);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_interestLabel, "setFont:", v43);
    -[UILabel setBaselineAdjustment:](v7->_interestLabel, "setBaselineAdjustment:", 1);
    -[UILabel setTextAlignment:](v7->_interestLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7->_interestLabel, "setNumberOfLines:", 1);
    v25 = v7->_interestLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.992, 0.71, 0.227, 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    -[UILabel setAccessibilityIdentifier:](v7->_interestLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CA0]);
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    productDateFormatter = v7->_productDateFormatter;
    v7->_productDateFormatter = v27;

    v29 = v7->_productDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v29, "setLocale:", v30);

    v31 = v7->_productDateFormatter;
    -[PKAccount creditDetails](v7->_account, "creditDetails");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "productTimeZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v31, "setTimeZone:", v33);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_productDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    v34 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    localDateFormatter = v7->_localDateFormatter;
    v7->_localDateFormatter = v34;

    v36 = v7->_localDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v36, "setLocale:", v37);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_localDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    v38 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    localTimeFormatter = v7->_localTimeFormatter;
    v7->_localTimeFormatter = v38;

    v40 = v7->_localTimeFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v40, "setLocale:", v41);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_localTimeFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("j:mm a z"));
    -[PKAccountBillPaymentPayInterestDescriptionView addSubview:](v7, "addSubview:", v7->_cancellationView);
    -[PKAccountBillPaymentPayInterestDescriptionView addSubview:](v7, "addSubview:", v7->_estimatedChargeLabel);
    -[PKAccountBillPaymentPayInterestDescriptionView addSubview:](v7, "addSubview:", v7->_interestLabel);
    -[PKAccountBillPaymentPayInterestDescriptionView _updateLabels](v7, "_updateLabels");

  }
  return v7;
}

- (void)setInterest:(id)a3
{
  NSDecimalNumber **p_interest;
  NSDecimalNumber *v6;
  void *v7;
  uint64_t v8;
  NSDecimalNumber *v9;
  id v10;

  p_interest = &self->_interest;
  v10 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_interest, a3);
    v6 = *p_interest;
    objc_msgSend(MEMORY[0x1E0D66BF0], "roundingHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDecimalNumber decimalNumberByRoundingAccordingToBehavior:](v6, "decimalNumberByRoundingAccordingToBehavior:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *p_interest;
    *p_interest = (NSDecimalNumber *)v8;

    -[PKAccountBillPaymentPayInterestDescriptionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSelectedPaymentDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPaymentDate, a3);
  -[PKAccountBillPaymentPayInterestDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setInterestChargeDate:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_interestChargeDate, a3);
    -[PKAccountBillPaymentPayInterestDescriptionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat MaxY;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28.receiver = self;
  v28.super_class = (Class)PKAccountBillPaymentPayInterestDescriptionView;
  -[PKAccountBillPaymentPayInterestDescriptionView layoutSubviews](&v28, sel_layoutSubviews);
  -[PKAccountBillPaymentPayInterestDescriptionView _updateLabels](self, "_updateLabels");
  v3 = -[PKAccountBillPaymentPayInterestDescriptionView _showInterest](self, "_showInterest");
  -[PKAccountBillPaymentPayInterestDescriptionView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UITextView frame](self->_cancellationView, "frame");
  -[UITextView sizeThatFits:](self->_cancellationView, "sizeThatFits:", v9);
  PKRectCenteredXInRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  MaxY = CGRectGetMaxY(v29);
  v19 = MaxY - v17;
  -[UITextView setFrame:](self->_cancellationView, "setFrame:", v13, MaxY - v17, v15, v17);
  if (v3)
  {
    -[UILabel frame](self->_estimatedChargeLabel, "frame");
    -[UILabel sizeThatFits:](self->_estimatedChargeLabel, "sizeThatFits:", v9, 3.40282347e38);
    v30.origin.x = v13;
    v30.origin.y = v19;
    v30.size.width = v15;
    v30.size.height = v17;
    CGRectGetMinY(v30);
    PKRectCenteredXInRect();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[UILabel setFrame:](self->_estimatedChargeLabel, "setFrame:");
    -[UILabel frame](self->_interestLabel, "frame");
    -[UILabel sizeThatFits:](self->_interestLabel, "sizeThatFits:", v9, 3.40282347e38);
    v31.origin.x = v21;
    v31.origin.y = v23;
    v31.size.width = v25;
    v31.size.height = v27;
    CGRectGetMinY(v31);
    PKRectCenteredXInRect();
    -[UILabel setFrame:](self->_interestLabel, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = 0.0;
  if (-[PKAccountBillPaymentPayInterestDescriptionView _showInterest](self, "_showInterest"))
  {
    -[UILabel sizeThatFits:](self->_interestLabel, "sizeThatFits:", width, height);
    v8 = v7 + 0.0 + 6.0;
    -[UILabel sizeThatFits:](self->_estimatedChargeLabel, "sizeThatFits:", width, height);
    v6 = v8 + v9 + 20.0;
  }
  -[UITextView sizeThatFits:](self->_cancellationView, "sizeThatFits:", width, height);
  v11 = v6 + v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "billPaymentPayInterestDescriptionViewHasTappedLearnMore:", self);

  return 0;
}

- (BOOL)_showInterest
{
  NSDecimalNumber *interest;
  void *v3;

  interest = self->_interest;
  if (interest)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(interest) = -[NSDecimalNumber compare:](interest, "compare:", v3) == NSOrderedDescending;

  }
  return (char)interest;
}

- (void)_updateLabels
{
  void *interest;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *cancellationDate;
  NSDate *v16;
  NSDate *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UITextView *cancellationView;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  -[PKAccount feature](self->_account, "feature");
  interest = self->_interest;
  if (!interest)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(interest, "compare:", v4);

  if (v5 != 1)
  {
    interest = 0;
LABEL_6:
    v26 = 0;
    goto LABEL_9;
  }
  -[NSDateFormatter stringFromDate:](self->_productDateFormatter, "stringFromDate:", self->_interestChargeDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v25 = v6;
    PKLocalizedFeatureString();
  }
  else
  {
    PKLocalizedFeatureString();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale", v25);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", self->_interest);
  interest = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_selectedPaymentDate)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D48]);
    v12 = (void *)objc_msgSend(v11, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v12, "setTimeZone:", v9);
    objc_msgSend(v12, "components:fromDate:", 28, self->_selectedPaymentDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v13);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cancellationDate = self->_cancellationDate;
    self->_cancellationDate = v14;

    -[NSDate dateByAddingTimeInterval:](self->_cancellationDate, "dateByAddingTimeInterval:", -60.0);
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v17 = self->_cancellationDate;
    self->_cancellationDate = v16;

  }
  if (self->_cancellationDate)
  {
    -[NSDateFormatter stringFromDate:](self->_localTimeFormatter, "stringFromDate:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](self->_localDateFormatter, "stringFromDate:", self->_cancellationDate);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v20, self->_learnMoreString);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    cancellationView = self->_cancellationView;
    -[PKAccountBillPaymentPayInterestDescriptionView _learnMoreAttributedStringWithText:](self, "_learnMoreAttributedStringWithText:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](cancellationView, "setAttributedText:", v23);

  }
  -[UILabel setText:](self->_estimatedChargeLabel, "setText:", v26);
  -[UILabel sizeToFit](self->_estimatedChargeLabel, "sizeToFit");
  -[UILabel setText:](self->_interestLabel, "setText:", interest);
  -[UILabel sizeToFit](self->_interestLabel, "sizeToFit");
  v24 = -[PKAccountBillPaymentPayInterestDescriptionView _showInterest](self, "_showInterest") ^ 1;
  -[UILabel setHidden:](self->_interestLabel, "setHidden:", v24);
  -[UILabel setHidden:](self->_estimatedChargeLabel, "setHidden:", v24);

}

- (id)_learnMoreAttributedStringWithText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "length");
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3E7D690);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "rangeOfString:", self->_learnMoreString);
    v9 = v8;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B08], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_fixedWidthFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pk_addLinkURL:toRange:withColor:isUnderlined:", v6, v7, v9, v13, 0);

    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setLineBreakMode:", 0);
    objc_msgSend(v15, "setAlignment:", 1);
    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v15, 0, v5);
    v16 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttribute:value:range:", v16, v17, 0, v5);

    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v11, 0, v5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSDecimalNumber)interest
{
  return self->_interest;
}

- (NSDate)interestChargeDate
{
  return self->_interestChargeDate;
}

- (NSDate)selectedPaymentDate
{
  return self->_selectedPaymentDate;
}

- (PKAccountBillPaymentPayInterestDescriptionViewDelegate)delegate
{
  return (PKAccountBillPaymentPayInterestDescriptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPaymentDate, 0);
  objc_storeStrong((id *)&self->_interestChargeDate, 0);
  objc_storeStrong((id *)&self->_interest, 0);
  objc_storeStrong((id *)&self->_cancellationDate, 0);
  objc_storeStrong((id *)&self->_learnMoreString, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_localTimeFormatter, 0);
  objc_storeStrong((id *)&self->_localDateFormatter, 0);
  objc_storeStrong((id *)&self->_productDateFormatter, 0);
  objc_storeStrong((id *)&self->_interestLabel, 0);
  objc_storeStrong((id *)&self->_cancellationView, 0);
  objc_storeStrong((id *)&self->_estimatedChargeLabel, 0);
}

@end
