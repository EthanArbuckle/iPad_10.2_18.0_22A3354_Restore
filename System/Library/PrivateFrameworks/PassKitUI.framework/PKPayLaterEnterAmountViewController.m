@implementation PKPayLaterEnterAmountViewController

- (PKPayLaterEnterAmountViewController)initWithPayLaterAccount:(id)a3
{
  id v5;
  PKPayLaterEnterAmountViewController *v6;
  PKPayLaterEnterAmountViewController *v7;
  uint64_t v8;
  NSDecimalNumber *amount;
  void *v10;
  uint64_t v11;
  NSString *currency;
  CGPoint v13;
  CGSize v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterEnterAmountViewController;
  v6 = -[PKPayLaterEnterAmountViewController init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v7->_amount;
    v7->_amount = (NSDecimalNumber *)v8;

    objc_msgSend(v5, "payLaterDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currencyCode");
    v11 = objc_claimAutoreleasedReturnValue();
    currency = v7->_currency;
    v7->_currency = (NSString *)v11;

    v13 = (CGPoint)*MEMORY[0x1E0C9D628];
    v14 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v7->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v7->_lastKeyboardFrame.size = v14;
    v7->_keyboardFrame.origin = v13;
    v7->_keyboardFrame.size = v14;
    v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithTitle:style:target:action:", v16, 0, v7, sel_nextButtonTapped);

    -[PKPayLaterEnterAmountViewController navigationItem](v7, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

    -[PKPayLaterEnterAmountViewController _updateBarButtonEnabledState](v7, "_updateBarButtonEnabledState");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterEnterAmountViewController;
  -[PKPayLaterEnterAmountViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterEnterAmountViewController;
  -[PKPayLaterEnterAmountViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  self->_visibility = 1;
  -[PKPayLaterEnterAmountViewController currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEnterAmountViewController currencyAmountUpdated:](self, "currencyAmountUpdated:", v4);

  -[PKPayLaterEnterAmountViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterEnterAmountViewController;
  -[PKPayLaterEnterAmountViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  self->_visibility = 2;
  -[PKPayLaterEnterAmountViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterEnterAmountViewController;
  -[PKPayLaterEnterAmountViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  self->_visibility = 3;
  -[PKPayLaterEnterAmountViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)loadView
{
  void *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  UILabel *subtitleLabel;
  UILabel *v14;
  NSString *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  PKEnterCurrencyAmountView *v19;
  PKEnterCurrencyAmountView *enterAmountView;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *amountDetailsLabel;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  void *v33;
  PKNumberPadSuggestionsView *v34;
  _PKVisibilityBackdropView *v35;
  _PKVisibilityBackdropView *v36;
  _PKVisibilityBackdropView *blurringView;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)PKPayLaterEnterAmountViewController;
  -[PKPayLaterEnterAmountViewController loadView](&v43, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  v8 = self->_titleLabel;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
  v10 = self->_titleLabel;
  -[PKPayLaterEnterAmountViewController headerTitle](self, "headerTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v10, "setText:", v11);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v12;

  v14 = self->_subtitleLabel;
  v15 = (NSString *)*MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v14, "setFont:", v16);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 0);
  v17 = self->_subtitleLabel;
  -[PKPayLaterEnterAmountViewController headerSubtitle](self, "headerSubtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v17, "setText:", v18);

  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  v19 = -[PKEnterCurrencyAmountView initWithCurrency:amount:]([PKEnterCurrencyAmountView alloc], "initWithCurrency:amount:", self->_currency, self->_amount);
  enterAmountView = self->_enterAmountView;
  self->_enterAmountView = v19;

  if (PKUIGetMinScreenWidthType())
    v21 = 57.0;
  else
    v21 = 42.0;
  v22 = *MEMORY[0x1E0DC1438];
  PKRoundedSystemFontOfSizeAndWeight(v21, *MEMORY[0x1E0DC1438]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pk_fixedWidthFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  PKRoundedSystemFontOfSizeAndWeight(v21 * 0.5, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pk_fixedWidthFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKEnterCurrencyAmountView setAmountFont:](self->_enterAmountView, "setAmountFont:", v24);
  -[PKEnterCurrencyAmountView setCurrencySymbolFont:](self->_enterAmountView, "setCurrencySymbolFont:", v26);
  -[PKEnterCurrencyAmountView setCurrencySymbolFont:](self->_enterAmountView, "setCurrencySymbolFont:", v26);
  -[PKEnterCurrencyAmountView setKerning:](self->_enterAmountView, "setKerning:", &unk_1E3FACA70);
  -[PKEnterCurrencyAmountView setIgnoreIntegralNumber:](self->_enterAmountView, "setIgnoreIntegralNumber:", 1);
  -[PKEnterCurrencyAmountView setShowsDecimalPointButton:](self->_enterAmountView, "setShowsDecimalPointButton:", -[PKPayLaterEnterAmountViewController shouldAllowDecimalInput](self, "shouldAllowDecimalInput"));
  -[PKEnterCurrencyAmountView setDelegate:](self->_enterAmountView, "setDelegate:", self);
  -[PKEnterCurrencyAmountView showKeyboard](self->_enterAmountView, "showKeyboard");
  v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  amountDetailsLabel = self->_amountDetailsLabel;
  self->_amountDetailsLabel = v27;

  v29 = self->_amountDetailsLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v29, "setTextColor:", v30);

  v31 = self->_amountDetailsLabel;
  PKFontForDefaultDesign(v15, (NSString *)*MEMORY[0x1E0DC48D0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v31, "setFont:", v32);

  -[UILabel setNumberOfLines:](self->_amountDetailsLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_amountDetailsLabel, "setTextAlignment:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_amountDetailsLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  -[PKPayLaterEnterAmountViewController keypadSuggestions](self, "keypadSuggestions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count"))
  {
    v34 = -[PKNumberPadSuggestionsView initWithDefaultFrame]([PKNumberPadSuggestionsView alloc], "initWithDefaultFrame");
    -[PKNumberPadSuggestionsView setDelegate:](v34, "setDelegate:", self);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __47__PKPayLaterEnterAmountViewController_loadView__block_invoke;
    v41[3] = &unk_1E3E652B0;
    v42 = v33;
    -[PKNumberPadSuggestionsView performBatchUpdates:](v34, "performBatchUpdates:", v41);
    -[PKEnterCurrencyAmountView setInputAccessoryView:](self->_enterAmountView, "setInputAccessoryView:", v34);

  }
  v35 = [_PKVisibilityBackdropView alloc];
  v36 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v35, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  blurringView = self->_blurringView;
  self->_blurringView = v36;

  -[_PKVisibilityBackdropView setDelegate:](self->_blurringView, "setDelegate:", self);
  -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_blurringView, "setUserInteractionEnabled:", 1);
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, 0.0);
  -[PKPayLaterEnterAmountViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundColor:", v39);

  objc_msgSend(v38, "addSubview:", self->_scrollView);
  objc_msgSend(v38, "addSubview:", self->_blurringView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_titleLabel);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_subtitleLabel);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_enterAmountView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_amountDetailsLabel);
  -[PKPayLaterEnterAmountViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B58]);

}

void __47__PKPayLaterEnterAmountViewController_loadView__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonBackgroundColor:", v5);

  objc_msgSend(v6, "setSuggestions:", *(_QWORD *)(a1 + 32));
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  BOOL IsNull;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  _QWORD rect[5];
  CGRect remainder;
  objc_super v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v75.receiver = self;
  v75.super_class = (Class)PKPayLaterEnterAmountViewController;
  -[PKPayLaterEnterAmountViewController viewWillLayoutSubviews](&v75, sel_viewWillLayoutSubviews);
  -[PKPayLaterEnterAmountViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIScrollView isDragging](self->_scrollView, "isDragging"))
  {
    if (CGRectIsNull(self->_lastSeenValidBounds))
    {
      objc_msgSend(v3, "bounds");
      x = v4;
      y = v6;
      width = v8;
      height = v10;
    }
    else
    {
      x = self->_lastSeenValidBounds.origin.x;
      y = self->_lastSeenValidBounds.origin.y;
      width = self->_lastSeenValidBounds.size.width;
      height = self->_lastSeenValidBounds.size.height;
    }
  }
  else
  {
    objc_msgSend(v3, "bounds");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
    self->_lastSeenValidBounds.origin.x = v12;
    self->_lastSeenValidBounds.origin.y = v13;
    self->_lastSeenValidBounds.size.width = v14;
    self->_lastSeenValidBounds.size.height = v15;
  }
  objc_msgSend(v3, "safeAreaInsets");
  v17 = v16;
  -[UIScrollView frame](self->_scrollView, "frame");
  v78.origin.x = v18;
  v78.origin.y = v19;
  v78.size.width = v20;
  v78.size.height = v21;
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  if (!CGRectEqualToRect(v76, v78))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", x, y, width, height);
  v69 = v17;
  if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))PKUIGetMinScreenWidthType();
  if (width >= 768.0)
  {
    objc_msgSend(v3, "readableContentGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutFrame");

  }
  PKSizeAlignedInRect();
  v72 = y;
  *(double *)rect = x;
  v71 = height;
  v24 = v23;
  v25 = (double *)MEMORY[0x1E0C9D648];
  v26 = *MEMORY[0x1E0C9D648];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23 + -11.0, 1.79769313e308);
  UIRectCenteredXInRect();
  v70 = width;
  v28 = v27;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  -[UILabel frame](self->_subtitleLabel, "frame");
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v24, 1.79769313e308);
  v29 = v26;
  UIRectCenteredXInRect();
  v31 = v30;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
  v32 = v25[1];
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterAmountView, "sizeThatFits:", v24, 1.79769313e308);
  UIRectCenteredXInRect();
  v34 = v33;
  -[PKEnterCurrencyAmountView setFrame:](self->_enterAmountView, "setFrame:");
  v35 = v28 + 0.0 + 15.0 + v31 + 35.0 + v34;
  -[UILabel sizeThatFits:](self->_amountDetailsLabel, "sizeThatFits:", v24, 1.79769313e308);
  if (v36 <= 0.0)
  {
    v37 = v70;
    v38 = v25[2];
    v41 = v25[3];
  }
  else
  {
    v35 = v35 + 10.0;
    v37 = v70;
    UIRectCenteredXInRect();
    v29 = v39;
    v41 = v40;
    v32 = v35;
  }
  -[UILabel setFrame:](self->_amountDetailsLabel, "setFrame:", v29, v32, v38, v41);
  if (PKUIGetMinScreenWidthType())
  {
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      v42 = 19.0;
    }
    else
    {
      v42 = 24.0;
    }
  }
  else
  {
    v42 = 19.0;
  }
  v43 = v37;
  v68 = v35;
  if (PKViewVisibilityStateIsVisible())
  {
    v44 = *MEMORY[0x1E0C9D628];
    v45 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v47 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v46 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v48 = v41;
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      objc_msgSend(v3, "window");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v49)
      {
        objc_msgSend(v49, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        v44 = v51;
        v45 = v52;
        v47 = v53;
        v46 = v54;
      }

    }
  }
  else
  {
    v48 = v41;
    v44 = self->_lastKeyboardFrame.origin.x;
    v45 = self->_lastKeyboardFrame.origin.y;
    v47 = self->_lastKeyboardFrame.size.width;
    v46 = self->_lastKeyboardFrame.size.height;
  }
  v77.origin.x = v44;
  v77.origin.y = v45;
  v77.size.width = v47;
  v77.size.height = v46;
  IsNull = CGRectIsNull(v77);
  v57 = v71;
  v56 = v72;
  v58 = v42 + fmax(v71 + v72 - v45 - v69, 0.0);
  if (IsNull)
    v58 = v42;
  self->_lastKeyboardFrame.origin.x = v44;
  self->_lastKeyboardFrame.origin.y = v45;
  self->_lastKeyboardFrame.size.width = v47;
  self->_lastKeyboardFrame.size.height = v46;
  v59 = v69 + v58;
  v60 = rect[0];
  *(_QWORD *)&remainder.origin.x = rect[0];
  remainder.origin.y = v72;
  remainder.size.width = v43;
  remainder.size.height = v71;
  memset(&rect[1], 0, 32);
  v61 = v43;
  CGRectDivide(*(CGRect *)(&v56 - 1), (CGRect *)&rect[1], &remainder, v59, CGRectMaxYEdge);
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
  -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v43, v48 + v68);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v63 = v62;
  v65 = v64;
  v67 = v66;
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v63, v65, v59 - v69, v67);
  -[PKPayLaterEnterAmountViewController _calculateBlur](self, "_calculateBlur");

}

- (id)headerTitle
{
  return 0;
}

- (id)headerSubtitle
{
  return 0;
}

- (id)keypadSuggestions
{
  return 0;
}

- (PKCurrencyAmount)currencyAmount
{
  return (PKCurrencyAmount *)PKCurrencyAmountMake();
}

- (void)setAmountDetailsText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UILabel text](self->_amountDetailsLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  if (v6 == v10)
  {

    v9 = v10;
  }
  else
  {
    if (v10 && v6)
    {
      v7 = objc_msgSend(v10, "isEqualToString:", v6);

      v8 = v10;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v10;
    }
    -[UILabel setText:](self->_amountDetailsLabel, "setText:", v8);
    -[PKPayLaterEnterAmountViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");
  }

  v8 = v10;
LABEL_10:

}

- (BOOL)shouldAllowDecimalInput
{
  return 1;
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *hiddenRightBarButtonItem;
  _BOOL8 wasBackHidden;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *activityIndicatorView;
  UIBarButtonItem *v16;
  UIBarButtonItem *spinningItem;
  id v18;

  if (self->_showingSpinner != a3)
  {
    self->_showingSpinner = a3;
    v4 = !a3;
    -[PKPayLaterEnterAmountViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKPayLaterEnterAmountViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v8;

    objc_msgSend(v18, "setUserInteractionEnabled:", v4);
    -[PKPayLaterEnterAmountViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_showingSpinner)
    {
      self->_wasBackHidden = objc_msgSend(v9, "hidesBackButton");
      objc_msgSend(v10, "rightBarButtonItem");
      v11 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v11;

      if (!self->_spinningItem)
      {
        v14 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        v16 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicatorView);
        spinningItem = self->_spinningItem;
        self->_spinningItem = v16;

      }
      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      objc_msgSend(v10, "setRightBarButtonItem:", self->_spinningItem);
      wasBackHidden = 1;
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
      objc_msgSend(v10, "setRightBarButtonItem:", self->_hiddenRightBarButtonItem);
      wasBackHidden = self->_wasBackHidden;
    }
    objc_msgSend(v10, "setHidesBackButton:", wasBackHidden);
    -[PKPayLaterEnterAmountViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v4);
    objc_msgSend(v18, "setNeedsLayout");

  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKPayLaterEnterAmountViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKPayLaterEnterAmountViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v5;

  objc_msgSend(a4, "value", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKEnterCurrencyAmountView setCurrentAmount:](self->_enterAmountView, "setCurrentAmount:", v5);
  -[PKPayLaterEnterAmountViewController _updateAmount:](self, "_updateAmount:", v5);

}

- (void)_updateAmount:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_amount, a3);
  -[PKPayLaterEnterAmountViewController currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEnterAmountViewController currencyAmountUpdated:](self, "currencyAmountUpdated:", v4);

  -[PKPayLaterEnterAmountViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");
}

- (void)_updateBarButtonEnabledState
{
  void *v3;
  id v4;

  -[PKPayLaterEnterAmountViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setEnabled:", -[PKPayLaterEnterAmountViewController _isCurrentAmountValid](self, "_isCurrentAmountValid"));
}

- (BOOL)_isCurrentAmountValid
{
  NSDecimalNumber *amount;
  BOOL v4;
  void *v6;
  void *v7;

  amount = self->_amount;
  if (!amount
    || (-[NSDecimalNumber pk_isNotANumber](amount, "pk_isNotANumber") & 1) != 0
    || (-[NSDecimalNumber pk_isZeroNumber](self->_amount, "pk_isZeroNumber") & 1) != 0)
  {
    return 0;
  }
  -[PKPayLaterEnterAmountViewController minAllowedAmount](self, "minAllowedAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEnterAmountViewController maxAllowedAmount](self, "maxAllowedAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (!v6 || -[NSDecimalNumber compare:](self->_amount, "compare:", v6) != NSOrderedAscending)
    && (!v7 || -[NSDecimalNumber compare:](self->_amount, "compare:", v7) != NSOrderedDescending);

  return v4;
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  NSDecimalNumber *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v7 = a3;
  v8 = a5;
  if (-[PKPayLaterEnterAmountViewController _shouldShakeWithNewAmount:](self, "_shouldShakeWithNewAmount:", v8))
    objc_msgSend(v7, "pkui_smallShakeWithCompletion:", 0);
  v9 = self->_amount;
  -[PKPayLaterEnterAmountViewController minAllowedAmount](self, "minAllowedAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEnterAmountViewController maxAllowedAmount](self, "maxAllowedAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (!v10
      || objc_msgSend(v8, "compare:", v10) != -1
      || -[NSDecimalNumber compare:](v9, "compare:", v10) == NSOrderedAscending
      || -[NSDecimalNumber compare:](v9, "compare:", v8) != NSOrderedAscending)
     && (!v11
      || objc_msgSend(v8, "compare:", v11) != 1
      || -[NSDecimalNumber compare:](v9, "compare:", v11) != NSOrderedDescending);

  return v12;
}

- (BOOL)_shouldShakeWithNewAmount:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSDecimalNumber *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (self->_amount)
  {
    if (v4 && (objc_msgSend(v4, "pk_isNotANumber") & 1) == 0)
    {
      v7 = self->_amount;
      -[PKPayLaterEnterAmountViewController minAllowedAmount](self, "minAllowedAmount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterEnterAmountViewController maxAllowedAmount](self, "maxAllowedAmount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8
        && objc_msgSend(v5, "compare:", v8) == -1
        && -[NSDecimalNumber compare:](v7, "compare:", v8) != NSOrderedAscending
        || v9 && objc_msgSend(v5, "compare:", v9) == 1;

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentAmount");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEnterAmountViewController _updateAmount:](self, "_updateAmount:", v4);

}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2)
    return 2030;
  else
    return 2010;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPayLaterEnterAmountViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKPayLaterEnterAmountViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPayLaterEnterAmountViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __57__PKPayLaterEnterAmountViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 1072);
  v4 = *(double *)(v2 + 1080);
  v5 = *(double *)(v2 + 1088);
  v6 = *(double *)(v2 + 1096);
  *(_BYTE *)(v2 + 1066) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1072);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1088) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1072), v16);
}

- (void)_keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__PKPayLaterEnterAmountViewController__keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKPayLaterEnterAmountViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __59__PKPayLaterEnterAmountViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 134;
  v4 = *((double *)v2 + 134);
  v5 = *((double *)v2 + 135);
  v6 = *((double *)v2 + 136);
  v7 = *((double *)v2 + 137);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1072), v13);
}

- (void)_keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__PKPayLaterEnterAmountViewController__keyboardWillHide___block_invoke;
    v3[3] = &unk_1E3E61918;
    v3[4] = self;
    -[PKPayLaterEnterAmountViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
  }
}

BOOL __57__PKPayLaterEnterAmountViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1072);
  *(_BYTE *)(v1 + 1066) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1072);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t (**v4)(_QWORD);
  int v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (uint64_t (**)(_QWORD))a3;
    -[PKPayLaterEnterAmountViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4[2](v4);

    v6 = v7;
    if (v7)
    {
      if (v5)
      {
        objc_msgSend(v7, "setNeedsLayout");
        v6 = v7;
      }
    }

  }
}

- (void)_calculateBlur
{
  UIScrollView *scrollView;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;

  scrollView = self->_scrollView;
  -[_PKVisibilityBackdropView bounds](self->_blurringView, "bounds");
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_blurringView);
  v5 = v4;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v15.size.height = fmin(v13, v14 - v9);
  v15.origin.x = v7;
  v15.origin.y = v9;
  v15.size.width = v11;
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, fmin(fmax(CGRectGetMaxY(v15) - v5, 0.0), 30.0) / 30.0);
}

- (NSDecimalNumber)minAllowedAmount
{
  return self->_minAllowedAmount;
}

- (void)setMinAllowedAmount:(id)a3
{
  objc_storeStrong((id *)&self->_minAllowedAmount, a3);
}

- (NSDecimalNumber)maxAllowedAmount
{
  return self->_maxAllowedAmount;
}

- (void)setMaxAllowedAmount:(id)a3
{
  objc_storeStrong((id *)&self->_maxAllowedAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAllowedAmount, 0);
  objc_storeStrong((id *)&self->_minAllowedAmount, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningItem, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_amountDetailsLabel, 0);
  objc_storeStrong((id *)&self->_enterAmountView, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
