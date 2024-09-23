@implementation PKPeerPaymentMessagesAmountStepperView

+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "sizeThatFits:forSizeCategory:", a3, 300.0, 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKPeerPaymentMessagesAmountStepperView)initWithSizeCategory:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PKPeerPaymentMessagesAmountStepperView *v10;
  uint64_t v11;
  NSDecimalNumber *minAmount;
  NSString *amountCurrency;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  UIView *centerView;
  UIView *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  UILabel *compactAmountLabel;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  UILabel *amountLabel;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  void *v41;
  PKPeerPaymentMessagesRoundedButton *v42;
  uint64_t v43;
  PKPeerPaymentMessagesRoundedButton *plusButton;
  PKPeerPaymentMessagesRoundedButton *v45;
  void *v46;
  void *v47;
  void *v48;
  PKPeerPaymentMessagesRoundedButton *v49;
  void *v50;
  PKPeerPaymentMessagesRoundedButton *v51;
  uint64_t v52;
  PKPeerPaymentMessagesRoundedButton *minusButton;
  PKPeerPaymentMessagesRoundedButton *v54;
  void *v55;
  void *v56;
  void *v57;
  PKPeerPaymentMessagesRoundedButton *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v66;
  objc_super v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "referenceSizeForSizeCategory:", a3);
  v5 = v4;
  v7 = v6;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v68.receiver = self;
  v68.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  v10 = -[PKPeerPaymentMessagesAmountStepperView initWithFrame:](&v68, sel_initWithFrame_, v8, v9, v5, v7);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v11 = objc_claimAutoreleasedReturnValue();
    minAmount = v10->_minAmount;
    v10->_minAmount = (NSDecimalNumber *)v11;

    amountCurrency = v10->_amountCurrency;
    v10->_amountCurrency = (NSString *)CFSTR("USD");

    -[PKPeerPaymentMessagesAmountStepperView traitCollection](v10, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredContentSizeCategory");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v15, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesAmountStepperView setBackgroundColor:](v10, "setBackgroundColor:", v16);

    v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PKPeerPaymentMessagesAmountStepperView bounds](v10, "bounds");
    v18 = objc_msgSend(v17, "initWithFrame:");
    centerView = v10->_centerView;
    v10->_centerView = (UIView *)v18;

    v20 = v10->_centerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[PKPeerPaymentMessagesAmountStepperView addSubview:](v10, "addSubview:", v10->_centerView);
    v22 = objc_alloc(MEMORY[0x1E0CD2780]);
    v23 = (void *)objc_msgSend(v22, "initWithType:", *MEMORY[0x1E0CD2C88]);
    objc_msgSend(v23, "setName:", CFSTR("gaussianBlur"));
    v24 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PKPeerPaymentMessagesAmountStepperView bounds](v10, "bounds");
    v25 = objc_msgSend(v24, "initWithFrame:");
    compactAmountLabel = v10->_compactAmountLabel;
    v10->_compactAmountLabel = (UILabel *)v25;

    v27 = v10->_compactAmountLabel;
    -[PKPeerPaymentMessagesAmountStepperView _amountLabelFont](v10, "_amountLabelFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v27, "setFont:", v28);

    v29 = v10->_compactAmountLabel;
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v29, "setTextColor:", v30);

    -[UILabel setTextAlignment:](v10->_compactAmountLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_compactAmountLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAccessibilityIdentifier:](v10->_compactAmountLabel, "setAccessibilityIdentifier:", CFSTR("AppleCash.Amount.Label"));
    -[UILabel layer](v10->_compactAmountLabel, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFilters:", v32);

    -[UIView addSubview:](v10->_centerView, "addSubview:", v10->_compactAmountLabel);
    v33 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PKPeerPaymentMessagesAmountStepperView bounds](v10, "bounds");
    v34 = objc_msgSend(v33, "initWithFrame:");
    amountLabel = v10->_amountLabel;
    v10->_amountLabel = (UILabel *)v34;

    v36 = v10->_amountLabel;
    -[PKPeerPaymentMessagesAmountStepperView _amountLabelFont](v10, "_amountLabelFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v36, "setFont:", v37);

    v38 = v10->_amountLabel;
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v38, "setTextColor:", v39);

    -[UILabel setTextAlignment:](v10->_amountLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_amountLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAccessibilityIdentifier:](v10->_amountLabel, "setAccessibilityIdentifier:", CFSTR("AppleCash.Amount.Label"));
    -[UILabel layer](v10->_amountLabel, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFilters:", v41);

    -[PKPeerPaymentMessagesAmountStepperView addSubview:](v10, "addSubview:", v10->_amountLabel);
    v42 = [PKPeerPaymentMessagesRoundedButton alloc];
    -[PKPeerPaymentMessagesAmountStepperView bounds](v10, "bounds");
    v43 = -[PKPeerPaymentMessagesRoundedButton initWithFrame:](v42, "initWithFrame:");
    plusButton = v10->_plusButton;
    v10->_plusButton = (PKPeerPaymentMessagesRoundedButton *)v43;

    -[PKPeerPaymentMessagesRoundedButton addTarget:action:forControlEvents:](v10->_plusButton, "addTarget:action:forControlEvents:", v10, sel__incrementAmount, 64);
    v45 = v10->_plusButton;
    v46 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 26.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "systemImageNamed:withConfiguration:", CFSTR("plus"), v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton setImage:forState:](v45, "setImage:forState:", v48, 0);

    v49 = v10->_plusButton;
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton setTintColor:](v49, "setTintColor:", v50);

    -[PKPeerPaymentMessagesRoundedButton setAccessibilityIdentifier:](v10->_plusButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67848]);
    -[PKPeerPaymentMessagesAmountStepperView addSubview:](v10, "addSubview:", v10->_plusButton);
    v51 = [PKPeerPaymentMessagesRoundedButton alloc];
    -[PKPeerPaymentMessagesAmountStepperView bounds](v10, "bounds");
    v52 = -[PKPeerPaymentMessagesRoundedButton initWithFrame:](v51, "initWithFrame:");
    minusButton = v10->_minusButton;
    v10->_minusButton = (PKPeerPaymentMessagesRoundedButton *)v52;

    -[PKPeerPaymentMessagesRoundedButton addTarget:action:forControlEvents:](v10->_minusButton, "addTarget:action:forControlEvents:", v10, sel__decrementAmount, 64);
    v54 = v10->_minusButton;
    v55 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 26.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "systemImageNamed:withConfiguration:", CFSTR("minus"), v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton setImage:forState:](v54, "setImage:forState:", v57, 0);

    v58 = v10->_minusButton;
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton setTintColor:](v58, "setTintColor:", v59);

    -[PKPeerPaymentMessagesRoundedButton setAccessibilityIdentifier:](v10->_minusButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F60]);
    -[PKPeerPaymentMessagesAmountStepperView addSubview:](v10, "addSubview:", v10->_minusButton);
    -[PKPeerPaymentMessagesRoundedButton layer](v10->_plusButton, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFilters:", v61);

    -[PKPeerPaymentMessagesRoundedButton layer](v10->_minusButton, "layer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setFilters:", v63);

    -[PKPeerPaymentMessagesAmountStepperView setPlusMinusVisible:animated:](v10, "setPlusMinusVisible:animated:", 1, 0);
    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v10, sel__handleTap_);
    tapGestureRecognizer = v10->_tapGestureRecognizer;
    v10->_tapGestureRecognizer = (UITapGestureRecognizer *)v64;

    -[UITapGestureRecognizer setDelegate:](v10->_tapGestureRecognizer, "setDelegate:", v10);
    -[PKPeerPaymentMessagesAmountStepperView addGestureRecognizer:](v10, "addGestureRecognizer:", v10->_tapGestureRecognizer);
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v10, sel__handleLongPress_);
    objc_msgSend(v66, "setMinimumPressDuration:", 0.2);
    -[PKPeerPaymentMessagesAmountStepperView addGestureRecognizer:](v10, "addGestureRecognizer:", v66);

  }
  return v10;
}

- (void)dealloc
{
  NSObject *longPressTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  longPressTimer = self->_longPressTimer;
  if (longPressTimer)
  {
    if (self->_longPressTimerSuspended)
    {
      dispatch_resume(longPressTimer);
      longPressTimer = self->_longPressTimer;
    }
    dispatch_source_cancel(longPressTimer);
    v4 = self->_longPressTimer;
    self->_longPressTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  -[PKPeerPaymentMessagesAmountStepperView dealloc](&v5, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  +[PKPeerPaymentMessagesAmountStepperView sizeThatFits:forSizeCategory:](PKPeerPaymentMessagesAmountStepperView, "sizeThatFits:forSizeCategory:", self->_sizeCategory, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 forSizeCategory:(unint64_t)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "_amountLabelFontForSizeCategory:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "pkui_attriutedStringWithString:font:paragraphStyle:", CFSTR("$"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pkui_sizeThatFits:", width, height);
  *(double *)&v8 = 50.0;
  if (v9 > 50.0)
  {
    objc_msgSend(v7, "pkui_sizeThatFits:", width, height);
    v8 = v10;
  }

  v11 = width;
  v12 = *(double *)&v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int v11;
  double Height;
  double v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v18;
  double MinX;
  double v20;
  CGRect v21;
  CGRect slice;
  CGRect remainder;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  -[PKPeerPaymentMessagesAmountStepperView layoutSubviews](&v24, sel_layoutSubviews);
  -[PKPeerPaymentMessagesAmountStepperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel setFrame:](self->_amountLabel, "setFrame:");
  v11 = PKIsPad();
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  Height = CGRectGetHeight(v25);
  if (Height >= 50.0)
    v13 = 50.0;
  else
    v13 = Height;
  if (v11)
    v14 = 0.0;
  else
    v14 = 44.0;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  remainder = CGRectInset(v26, v14, 0.0);
  memset(&slice, 0, sizeof(slice));
  memset(&v21, 0, sizeof(v21));
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinXEdge);
  CGRectDivide(remainder, &v21, &remainder, v13, CGRectMaxXEdge);
  -[UIView setFrame:](self->_centerView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  -[UIView bounds](self->_centerView, "bounds");
  v28 = CGRectInset(v27, 6.0, 0.0);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  v18 = v28.size.height;
  -[UILabel setFrame:](self->_compactAmountLabel, "setFrame:");
  MinX = CGRectGetMinX(slice);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = v18;
  -[PKPeerPaymentMessagesRoundedButton setFrame:](self->_minusButton, "setFrame:", MinX, CGRectGetMidY(v29) - v13 * 0.5, v13, v13);
  v20 = CGRectGetMinX(v21);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = v18;
  -[PKPeerPaymentMessagesRoundedButton setFrame:](self->_plusButton, "setFrame:", v20, CGRectGetMidY(v30) - v13 * 0.5, v13, v13);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  v4 = a3;
  -[PKPeerPaymentMessagesAmountStepperView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PKPeerPaymentMessagesAmountStepperView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v6);
  if ((v4 & 1) == 0)
  {
    self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;
    -[PKPeerPaymentMessagesAmountStepperView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)handleNumberPadAction:(unint64_t)a3
{
  char v5;
  NSString *amountString;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**amountChangedHandler)(id, void *);
  void *v11;
  NSDecimalNumber *minAmount;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;

  self->_usedKeypad = 1;
  if (self->_nextNumberPadActionCausesReset)
  {
    self->_nextNumberPadActionCausesReset = 0;
    v5 = -[NSString pk_posixStringHasPeriod](self->_amountString, "pk_posixStringHasPeriod");
    if (a3 - 10 >= 3 && (v5 & 1) == 0)
    {
      amountString = self->_amountString;
      self->_amountString = (NSString *)&stru_1E3E7D690;

    }
  }
  if (self->_maxAmount)
  {
    -[PKPeerPaymentMessagesAmountStepperView _posixStringFromDecimalNumber:](self, "_posixStringFromDecimalNumber:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

  }
  else
  {
    v8 = 5;
  }
  -[PKPeerPaymentMessagesAmountStepperView _updatePosixString:withAction:maxDigits:maxDecimalPlaces:](self, "_updatePosixString:withAction:maxDigits:maxDecimalPlaces:", self->_amountString, a3, v8, -[NSNumberFormatter maximumFractionDigits](self->_currencyFormatter, "maximumFractionDigits"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_amountString, v16);
  -[PKPeerPaymentMessagesAmountStepperView _updateContent](self, "_updateContent");
  -[PKPeerPaymentMessagesAmountStepperView amount](self, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  amountChangedHandler = (void (**)(id, void *))self->_amountChangedHandler;
  if (amountChangedHandler)
    amountChangedHandler[2](amountChangedHandler, v9);
  objc_msgSend(v9, "amount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    minAmount = self->_minAmount;
    if (minAmount)
    {
      v13 = -[NSDecimalNumber compare:](minAmount, "compare:", v11);
      if (!self->_maxAmount || v13 == 1)
      {
LABEL_17:
        if (v13 == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "isEqualToNumber:", v14);

          if ((v15 & 1) == 0)
            -[PKPeerPaymentMessagesAmountStepperView _shakeAmountLabel](self, "_shakeAmountLabel");
        }
        goto LABEL_20;
      }
    }
    else if (!self->_maxAmount)
    {
      goto LABEL_20;
    }
    v13 = objc_msgSend(v11, "compare:");
    goto LABEL_17;
  }
LABEL_20:

}

- (void)validateNumberPadInput
{
  -[PKPeerPaymentMessagesAmountStepperView _cleanupPosixString](self, "_cleanupPosixString");
  -[PKPeerPaymentMessagesAmountStepperView _updateContent](self, "_updateContent");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  -[PKPeerPaymentMessagesAmountStepperView pressesBegan:withEvent:](&v4, sel_pressesBegan_withEvent_, a3, a4);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  -[PKPeerPaymentMessagesAmountStepperView pressesChanged:withEvent:](&v4, sel_pressesChanged_withEvent_, a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  -[PKPeerPaymentMessagesAmountStepperView pressesCancelled:withEvent:](&v4, sel_pressesCancelled_withEvent_, a3, a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v8)
  {
LABEL_41:
    v19.receiver = self;
    v19.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
    -[PKPeerPaymentMessagesAmountStepperView pressesEnded:withEvent:](&v19, sel_pressesEnded_withEvent_, v6, v7);
    goto LABEL_42;
  }
  v9 = v8;
  v18 = v7;
  v10 = 0;
  v11 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "key");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "characters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("1")) & 1) != 0)
        {
          v16 = 1;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("2")) & 1) != 0)
        {
          v16 = 2;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("3")) & 1) != 0)
        {
          v16 = 3;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("4")) & 1) != 0)
        {
          v16 = 4;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("5")) & 1) != 0)
        {
          v16 = 5;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("6")) & 1) != 0)
        {
          v16 = 6;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("7")) & 1) != 0)
        {
          v16 = 7;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("8")) & 1) != 0)
        {
          v16 = 8;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("9")) & 1) != 0)
        {
          v16 = 9;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR(".")) & 1) != 0)
        {
          v16 = 10;
          goto LABEL_31;
        }
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("0")) & 1) != 0)
        {
          v16 = 11;
          goto LABEL_31;
        }
        if (objc_msgSend(v14, "keyCode") == 42)
        {
          v16 = 12;
LABEL_31:
          if (self->_nextNumberPadActionCausesReset)
            v17 = 1;
          else
            v17 = !self->_usedKeypad && !self->_usedStepper;
          self->_nextNumberPadActionCausesReset = v17;
          -[PKPeerPaymentMessagesAmountStepperView handleNumberPadAction:](self, "handleNumberPadAction:", v16);
          v10 = 1;
        }

      }
    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v9);
  v7 = v18;
  if ((v10 & 1) == 0)
    goto LABEL_41;
LABEL_42:

}

- (id)_stringForAction:(unint64_t)a3
{
  if (a3 - 10 < 3)
    return off_1E3E6BD58[a3 - 10];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_posixLocale
{
  void *v2;
  void *v3;

  -[PKPeerPaymentMessagesAmountStepperView _posixFormatter](self, "_posixFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_posixFormatter
{
  if (qword_1EE4F9178 != -1)
    dispatch_once(&qword_1EE4F9178, &__block_literal_global_95);
  return (id)_MergedGlobals_6;
}

uint64_t __57__PKPeerPaymentMessagesAmountStepperView__posixFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_6, "setNumberStyle:", 1);
  v2 = (void *)_MergedGlobals_6;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)_MergedGlobals_6, "setAllowsFloats:", 1);
  objc_msgSend((id)_MergedGlobals_6, "setGroupingSeparator:", &stru_1E3E7D690);
  return objc_msgSend((id)_MergedGlobals_6, "setDecimalSeparator:", CFSTR("."));
}

- (id)_decimalNumberFromPosixString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  if (!v4)
  {
    v7 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v5 = (void *)MEMORY[0x1E0CB3598];
  -[PKPeerPaymentMessagesAmountStepperView _posixLocale](self, "_posixLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decimalNumberWithString:locale:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  v10 = v7;
  if (v9)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (id)_posixStringFromDecimalNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPeerPaymentMessagesAmountStepperView _posixFormatter](self, "_posixFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_updatePosixString:(id)a3 withAction:(unint64_t)a4 maxDigits:(unint64_t)a5 maxDecimalPlaces:(unint64_t)a6
{
  __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  char v19;
  PKPeerPaymentMessagesAmountStepperView *v20;
  unint64_t v21;

  v10 = (__CFString *)a3;
  if (v10)
    v11 = v10;
  else
    v11 = &stru_1E3E7D690;
  v12 = -[__CFString length](v11, "length");
  v13 = -[__CFString pk_posixStringHasPeriod](v11, "pk_posixStringHasPeriod");
  v14 = -[__CFString pk_posixStringDecimalPlaces](v11, "pk_posixStringDecimalPlaces");
  v15 = v11;
  v16 = v15;
  if (a4 == 10)
  {
    if (a6)
      v19 = v13;
    else
      v19 = 1;
    v17 = v15;
    if ((v19 & 1) != 0)
      goto LABEL_18;
    v20 = self;
    v21 = 10;
LABEL_16:
    -[PKPeerPaymentMessagesAmountStepperView _stringForAction:](v20, "_stringForAction:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (a4 != 12)
  {
    if (v13)
    {
      v17 = v15;
      if (v14 >= a6)
        goto LABEL_18;
    }
    else
    {
      v17 = v15;
      if (v12 >= a5)
        goto LABEL_18;
      if (a4 == 11)
      {
        v17 = v15;
        if (!v12)
          goto LABEL_18;
      }
    }
    v20 = self;
    v21 = a4;
    goto LABEL_16;
  }
  v17 = v15;
  if (-[__CFString length](v15, "length"))
  {
    -[__CFString substringWithRange:](v16, "substringWithRange:", 0, v12 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
LABEL_17:

  }
LABEL_18:

  return v17;
}

- (void)_handleTap:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  __n128 v9;
  void (**amountTappedHandler)(id, id, __n128);
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "state");
  v5 = v11;
  if (v4 == 3)
  {
    objc_msgSend(v11, "locationInView:", self);
    v7 = v6;
    -[PKPeerPaymentMessagesAmountStepperView bounds](self, "bounds");
    v9.n128_f64[0] = v8 / 3.0;
    if (self->_plusMinusVisible && v7 < v9.n128_f64[0])
    {
      -[PKPeerPaymentMessagesAmountStepperView _decrementAmount](self, "_decrementAmount");
LABEL_10:
      v5 = v11;
      goto LABEL_11;
    }
    if (self->_plusMinusVisible)
    {
      v9.n128_f64[0] = v9.n128_f64[0] + v9.n128_f64[0];
      if (v7 > v9.n128_f64[0])
      {
        -[PKPeerPaymentMessagesAmountStepperView _incrementAmount](self, "_incrementAmount");
        goto LABEL_10;
      }
    }
    amountTappedHandler = (void (**)(id, id, __n128))self->_amountTappedHandler;
    v5 = v11;
    if (amountTappedHandler)
    {
      amountTappedHandler[2](amountTappedHandler, v11, v9);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_handleLongPress:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *longPressTimer;
  NSObject *v7;
  _QWORD handler[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (self->_plusMinusVisible)
  {
    if (!self->_longPressTimer)
    {
      v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      longPressTimer = self->_longPressTimer;
      self->_longPressTimer = v5;

      dispatch_source_set_timer((dispatch_source_t)self->_longPressTimer, 0, 0x2FAF080uLL, 0x2FAF080uLL);
      objc_initWeak(&location, self);
      v7 = self->_longPressTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __59__PKPeerPaymentMessagesAmountStepperView__handleLongPress___block_invoke;
      handler[3] = &unk_1E3E61B68;
      objc_copyWeak(&v10, &location);
      v9 = v4;
      dispatch_source_set_event_handler(v7, handler);
      self->_longPressTimerSuspended = 1;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    if (objc_msgSend(v4, "state") == 1)
    {
      if (self->_longPressTimerSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_longPressTimer);
        self->_longPressTimerSuspended = 0;
      }
    }
    else if (objc_msgSend(v4, "state") != 2 && !self->_longPressTimerSuspended)
    {
      dispatch_suspend((dispatch_object_t)self->_longPressTimer);
      self->_longPressTimerSuspended = 1;
    }
  }

}

void __59__PKPeerPaymentMessagesAmountStepperView__handleLongPress___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "locationInView:", WeakRetained);
    v4 = v3;
    objc_msgSend(v6, "bounds");
    if (v4 < v5 / 3.0)
    {
      objc_msgSend(v6, "_decrementAmount");
LABEL_6:
      WeakRetained = v6;
      goto LABEL_7;
    }
    WeakRetained = v6;
    if (v4 > v5 / 3.0 + v5 / 3.0)
    {
      objc_msgSend(v6, "_incrementAmount");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_decrementAmount
{
  void *v3;
  void *v4;
  NSDecimalNumber *v5;
  uint64_t v6;
  NSDecimalNumber *minAmount;
  NSDecimalNumber *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;
  uint64_t v14;
  NSString *v15;
  NSString *amountString;
  NSString *v17;
  NSString *v18;
  void (**amountChangedHandler)(id, void *);
  void *v20;
  id v21;

  -[PKPeerPaymentMessagesAmountStepperView _decimalNumberFromPosixString:](self, "_decimalNumberFromPosixString:", self->_amountString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0CB3598], "one");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "decimalNumberBySubtracting:", v4);
    v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    if (self->_minAmount)
    {
      v6 = -[NSDecimalNumber compare:](v5, "compare:");
      minAmount = v5;
      if (v6 != 1)
        minAmount = self->_minAmount;
      v8 = minAmount;

      v5 = v8;
    }
    if (!self->_style)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "one");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSDecimalNumber compare:](v5, "compare:", v9);

      if (v10 == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "one");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "compare:", v11) == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "one");
          v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = (NSDecimalNumber *)v21;
        }
        v13 = v12;

        v5 = v13;
      }
    }
    v14 = -[NSString pk_posixStringDecimalPlaces](self->_amountString, "pk_posixStringDecimalPlaces");
    -[PKPeerPaymentMessagesAmountStepperView _posixStringFromDecimalNumber:](self, "_posixStringFromDecimalNumber:", v5);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    amountString = self->_amountString;
    self->_amountString = v15;

    -[NSString pk_posixStringWithMinimumDecimalPlaces:](self->_amountString, "pk_posixStringWithMinimumDecimalPlaces:", v14);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_amountString;
    self->_amountString = v17;

    -[PKPeerPaymentMessagesAmountStepperView _updateContent](self, "_updateContent");
    amountChangedHandler = (void (**)(id, void *))self->_amountChangedHandler;
    if (amountChangedHandler)
    {
      -[PKPeerPaymentMessagesAmountStepperView amount](self, "amount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      amountChangedHandler[2](amountChangedHandler, v20);

    }
    self->_nextNumberPadActionCausesReset = 0;
    self->_usedStepper = 1;

    v3 = v21;
  }

}

- (void)_incrementAmount
{
  void *v3;
  void *v4;
  NSDecimalNumber *v5;
  uint64_t v6;
  NSDecimalNumber *maxAmount;
  NSDecimalNumber *v8;
  uint64_t v9;
  NSString *v10;
  NSString *amountString;
  NSString *v12;
  NSString *v13;
  void (**amountChangedHandler)(id, void *);
  void *v15;
  id v16;

  -[PKPeerPaymentMessagesAmountStepperView _decimalNumberFromPosixString:](self, "_decimalNumberFromPosixString:", self->_amountString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    objc_msgSend(MEMORY[0x1E0CB3598], "one");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "decimalNumberByAdding:", v4);
    v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    if (self->_maxAmount)
    {
      v6 = -[NSDecimalNumber compare:](v5, "compare:");
      maxAmount = v5;
      if (v6 != -1)
        maxAmount = self->_maxAmount;
      v8 = maxAmount;

      v5 = v8;
    }
    v9 = -[NSString pk_posixStringDecimalPlaces](self->_amountString, "pk_posixStringDecimalPlaces");
    -[PKPeerPaymentMessagesAmountStepperView _posixStringFromDecimalNumber:](self, "_posixStringFromDecimalNumber:", v5);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    amountString = self->_amountString;
    self->_amountString = v10;

    -[NSString pk_posixStringWithMinimumDecimalPlaces:](self->_amountString, "pk_posixStringWithMinimumDecimalPlaces:", v9);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_amountString;
    self->_amountString = v12;

    -[PKPeerPaymentMessagesAmountStepperView _updateContent](self, "_updateContent");
    amountChangedHandler = (void (**)(id, void *))self->_amountChangedHandler;
    if (amountChangedHandler)
    {
      -[PKPeerPaymentMessagesAmountStepperView amount](self, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      amountChangedHandler[2](amountChangedHandler, v15);

    }
    self->_nextNumberPadActionCausesReset = 0;
    self->_usedStepper = 1;

    v3 = v16;
  }

}

- (PKCurrencyAmount)amount
{
  NSDecimalNumber *v3;
  void *v4;

  -[PKPeerPaymentMessagesAmountStepperView _decimalNumberFromPosixString:](self, "_decimalNumberFromPosixString:", self->_amountString);
  v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v3, self->_amountCurrency);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKCurrencyAmount *)v4;
}

- (void)setAmount:(id)a3
{
  id v4;
  NSString *amountCurrency;
  void *v6;
  void *v7;
  NSNumberFormatter *v8;
  NSNumberFormatter *currencyFormatter;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *amountString;
  NSString *v17;
  NSString *v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v19 = v4;
    if (!self->_currencyFormatter
      || (amountCurrency = self->_amountCurrency,
          objc_msgSend(v4, "currency"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(amountCurrency) = -[NSString isEqualToString:](amountCurrency, "isEqualToString:", v6),
          v6,
          (amountCurrency & 1) == 0))
    {
      objc_msgSend(v19, "currency");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKMutableNumberFormatterForCurrencyCode();
      v8 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
      currencyFormatter = self->_currencyFormatter;
      self->_currencyFormatter = v8;

    }
    -[PKPeerPaymentMessagesAmountStepperView _decimalNumberFromPosixString:](self, "_decimalNumberFromPosixString:", self->_amountString);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToNumber:", v11) & 1) != 0)
    {
      v12 = self->_amountCurrency;
      objc_msgSend(v19, "currency");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(v19, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesAmountStepperView _posixStringFromDecimalNumber:](self, "_posixStringFromDecimalNumber:", v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    amountString = self->_amountString;
    self->_amountString = v15;

    objc_msgSend(v19, "currency");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_amountCurrency;
    self->_amountCurrency = v17;

    -[PKPeerPaymentMessagesAmountStepperView _cleanupPosixString](self, "_cleanupPosixString");
    -[PKPeerPaymentMessagesAmountStepperView _updateContent](self, "_updateContent");
LABEL_10:

    v4 = v19;
  }

}

- (void)_updateContent
{
  void *v3;
  NSUInteger v4;
  void *v5;
  id v6;

  -[PKPeerPaymentMessagesAmountStepperView _decimalNumberFromPosixString:](self, "_decimalNumberFromPosixString:", self->_amountString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (self->_style)
  {
    -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](self->_currencyFormatter, "setAlwaysShowsDecimalSeparator:", -[NSString pk_posixStringHasPeriod](self->_amountString, "pk_posixStringHasPeriod"));
    -[NSNumberFormatter setMinimumFractionDigits:](self->_currencyFormatter, "setMinimumFractionDigits:", -[NSString pk_posixStringDecimalPlaces](self->_amountString, "pk_posixStringDecimalPlaces"));
  }
  else
  {
    if ((objc_msgSend(v3, "pk_isIntegralNumber") & 1) != 0)
      v4 = 0;
    else
      v4 = -[NSNumberFormatter maximumFractionDigits](self->_currencyFormatter, "maximumFractionDigits");
    -[NSNumberFormatter setMinimumFractionDigits:](self->_currencyFormatter, "setMinimumFractionDigits:", v4);
    -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](self->_currencyFormatter, "setAlwaysShowsDecimalSeparator:", 0);
  }
  -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_compactAmountLabel, "setText:", v5);
  -[UILabel setText:](self->_amountLabel, "setText:", v5);
  -[PKPeerPaymentMessagesAmountStepperView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_cleanupPosixString
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *v6;
  NSString *amountString;
  id v8;

  -[PKPeerPaymentMessagesAmountStepperView _decimalNumberFromPosixString:](self, "_decimalNumberFromPosixString:", self->_amountString);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NSString rangeOfString:options:](self->_amountString, "rangeOfString:options:", CFSTR("."), 4);
  v5 = v4;
  if (objc_msgSend(v8, "pk_isIntegralNumber"))
  {
    if (v5)
    {
      -[NSString substringToIndex:](self->_amountString, "substringToIndex:", v3);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      amountString = self->_amountString;
      self->_amountString = v6;

    }
  }
  else if (v5)
  {
    -[NSString pk_posixStringWithMinimumDecimalPlaces:](self->_amountString, "pk_posixStringWithMinimumDecimalPlaces:", -[NSNumberFormatter maximumFractionDigits](self->_currencyFormatter, "maximumFractionDigits"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    self->_nextNumberPadActionCausesReset |= a3 != 0;
    if (!self->_style)
      -[PKPeerPaymentMessagesAmountStepperView _cleanupPosixString](self, "_cleanupPosixString");
    -[PKPeerPaymentMessagesAmountStepperView _updateContent](self, "_updateContent");
  }
}

- (void)setSizeCategory:(unint64_t)a3
{
  id v4;

  if (self->_sizeCategory != a3)
  {
    self->_sizeCategory = a3;
    -[PKPeerPaymentMessagesAmountStepperView _amountLabelFont](self, "_amountLabelFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_compactAmountLabel, "setFont:", v4);
    -[UILabel setFont:](self->_amountLabel, "setFont:", v4);

  }
}

- (void)_shakeAmountLabel
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = 9;
  if (!self->_plusMinusVisible)
    v2 = 10;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v2]), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");
  objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_smallShakeAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v3);

}

+ (double)_amountLabelFontSizeForSizeCategory:(unint64_t)a3
{
  double result;

  if (PKIsVision())
  {
    result = 52.0;
    if (a3 - 1 < 3)
      return 100.0;
  }
  else if (PKIsPad())
  {
    if (a3 - 1 >= 3)
      return 70.0;
    else
      return dbl_19DF16320[a3 - 1];
  }
  else if (a3 >= 4)
  {
    return 100.0;
  }
  else
  {
    return dbl_19DF16338[a3];
  }
  return result;
}

- (id)_amountLabelFont
{
  return +[PKPeerPaymentMessagesAmountStepperView _amountLabelFontForSizeCategory:](PKPeerPaymentMessagesAmountStepperView, "_amountLabelFontForSizeCategory:", self->_sizeCategory);
}

+ (id)_amountLabelFontForSizeCategory:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "_amountLabelFontSizeForSizeCategory:", a3);
  objc_msgSend(v3, "pk_peerPaymentChiseledCashFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_fixedWidthFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPlusMinusVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v4 = a4;
  v5 = a3;
  if (self->_plusMinusVisible != a3 || !a4)
  {
    self->_plusMinusVisible = a3;
    -[PKPeerPaymentMessagesRoundedButton layer](self->_plusButton, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton layer](self->_minusButton, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel layer](self->_compactAmountLabel, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel layer](self->_amountLabel, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      ContentViewVisibilityAnimations(&v43, &v42, &v41, &v40);
      v12 = v43;
      v13 = v8;
      v14 = v7;
      v15 = v42;
      v16 = v41;
      v17 = v40;
      v18 = v17;
      if (v5)
        v19 = v15;
      else
        v19 = v17;
      v20 = v12;
      v39 = v12;
      if (v5)
      {
        v12 = v16;
        v21 = v17;
      }
      else
      {
        v21 = v15;
      }
      if (!v5)
        v20 = v16;
      v37 = v21;
      v38 = v20;
      v22 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v19);
      v23 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v12);
      v24 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v19);
      v25 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v12);
      v26 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v19);
      v27 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v12);
      v28 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v37);
      v29 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v38);

      v7 = v14;
      v8 = v13;

    }
    if (v5)
    {
      LODWORD(v11) = 1.0;
      objc_msgSend(v7, "setOpacity:", v11);
      objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
      LODWORD(v30) = 1.0;
      objc_msgSend(v8, "setOpacity:", v30);
      objc_msgSend(v8, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
      LODWORD(v31) = 1.0;
      objc_msgSend(v9, "setOpacity:", v31);
      objc_msgSend(v9, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
      objc_msgSend(v10, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
      LODWORD(v32) = 0;
      objc_msgSend(v10, "setOpacity:", v32);
    }
    else
    {
      objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
      LODWORD(v33) = 0;
      objc_msgSend(v7, "setOpacity:", v33);
      objc_msgSend(v8, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
      LODWORD(v34) = 0;
      objc_msgSend(v8, "setOpacity:", v34);
      objc_msgSend(v9, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
      LODWORD(v35) = 0;
      objc_msgSend(v9, "setOpacity:", v35);
      LODWORD(v36) = 1.0;
      objc_msgSend(v10, "setOpacity:", v36);
      objc_msgSend(v10, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
    }

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_tapGestureRecognizer == a3)
  {
    objc_msgSend(a4, "locationInView:", self->_centerView);
    -[UIView bounds](self->_centerView, "bounds");
  }
  return 1;
}

- (NSDecimalNumber)minAmount
{
  return self->_minAmount;
}

- (void)setMinAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSDecimalNumber)maxAmount
{
  return self->_maxAmount;
}

- (void)setMaxAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)amountChangedHandler
{
  return self->_amountChangedHandler;
}

- (void)setAmountChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (id)amountTappedHandler
{
  return self->_amountTappedHandler;
}

- (void)setAmountTappedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)usedKeypad
{
  return self->_usedKeypad;
}

- (void)setUsedKeypad:(BOOL)a3
{
  self->_usedKeypad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_amountTappedHandler, 0);
  objc_storeStrong(&self->_amountChangedHandler, 0);
  objc_storeStrong((id *)&self->_maxAmount, 0);
  objc_storeStrong((id *)&self->_minAmount, 0);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_amountCurrency, 0);
  objc_storeStrong((id *)&self->_amountString, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_compactAmountLabel, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
}

@end
