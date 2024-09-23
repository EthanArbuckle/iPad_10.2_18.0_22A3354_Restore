@implementation PKPeerPaymentMessagesContentAmountEntryView

- (PKPeerPaymentMessagesContentAmountEntryView)initWithFrame:(CGRect)a3
{
  PKPeerPaymentMessagesContentAmountEntryView *v3;
  void *v4;
  NSString *v5;
  id v6;
  void *v7;
  UIView *v8;
  UIView *containerView;
  UIView *v10;
  PKPeerPaymentMessagesAmountStepperView *v11;
  PKPeerPaymentMessagesAmountStepperView *amountStepperView;
  int v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  UILabel *v18;
  UILabel *balanceLabel;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  UITextField *v24;
  UITextField *memoField;
  UITextField *v26;
  void *v27;
  UITextField *v28;
  void *v29;
  UITextField *v30;
  void *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  UILabel *showKeypadHint;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UIButton *showKeypadButton;
  UIButton *v45;
  void *v46;
  UIButton *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  PKPeerPaymentMessagesNumberPadView *v55;
  PKPeerPaymentMessagesNumberPadView *numberPadView;
  void *v57;
  void *v58;
  void *v59;
  PKPeerPaymentMessagesNumberPadView *v60;
  PKPeerPaymentMessagesMultiActionView *v61;
  PKPeerPaymentMessagesMultiActionView *actionView;
  void *v63;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id location;
  objc_super v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
  v3 = -[PKPeerPaymentMessagesContentAmountEntryView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    -[PKPeerPaymentMessagesContentAmountEntryView traitCollection](v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v3->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;

    v3->_presentationContext = 1;
    v65 = -[PKPeerPaymentMessagesContentAmountEntryView sizeCategory](v3, "sizeCategory");
    v6 = objc_alloc(MEMORY[0x1E0CD2780]);
    v7 = (void *)objc_msgSend(v6, "initWithType:", *MEMORY[0x1E0CD2C88]);
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v3->_containerView;
    v3->_containerView = v8;

    -[PKPeerPaymentMessagesContentAmountEntryView addSubview:](v3, "addSubview:", v3->_containerView);
    v10 = v3->_containerView;
    v11 = -[PKPeerPaymentMessagesAmountStepperView initWithSizeCategory:]([PKPeerPaymentMessagesAmountStepperView alloc], "initWithSizeCategory:", v65);
    amountStepperView = v3->_amountStepperView;
    v3->_amountStepperView = v11;

    -[UIView addSubview:](v10, "addSubview:", v3->_amountStepperView);
    v13 = PKIsPad();
    v14 = (NSString *)*MEMORY[0x1E0DC4A88];
    if (v13)
      v15 = (NSString *)*MEMORY[0x1E0DC4A88];
    else
      v15 = (NSString *)*MEMORY[0x1E0DC4AB8];
    v16 = (NSString *)*MEMORY[0x1E0DC48F8];
    PKFontForDefaultDesign(v15, (NSString *)*MEMORY[0x1E0DC48F8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    balanceLabel = v3->_balanceLabel;
    v3->_balanceLabel = v18;

    -[UILabel setTextAlignment:](v3->_balanceLabel, "setTextAlignment:", 1);
    v20 = v3->_balanceLabel;
    +[PKPeerPaymentTheme secondaryTextColor](PKPeerPaymentTheme, "secondaryTextColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    -[UILabel setFont:](v3->_balanceLabel, "setFont:", v17);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_balanceLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAccessibilityIdentifier:](v3->_balanceLabel, "setAccessibilityIdentifier:", CFSTR("AppleCash.Balance.Label"));
    -[UILabel layer](v3->_balanceLabel, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFilters:", v23);

    -[UIView addSubview:](v10, "addSubview:", v3->_balanceLabel);
    v24 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    memoField = v3->_memoField;
    v3->_memoField = v24;

    -[UITextField setTextAlignment:](v3->_memoField, "setTextAlignment:", 1);
    v26 = v3->_memoField;
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v26, "setTextColor:", v27);

    v28 = v3->_memoField;
    PKLocalizedNearbyPeerPaymentString(CFSTR("NEARBY_AMOUNT_ENTRY_MEMO"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v28, "setPlaceholder:", v29);

    v30 = v3->_memoField;
    PKFontForDefaultDesign(v14, v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v30, "setFont:", v31);

    -[UITextField setReturnKeyType:](v3->_memoField, "setReturnKeyType:", 9);
    -[UITextField setDelegate:](v3->_memoField, "setDelegate:", v3);
    -[UITextField layer](v3->_memoField, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFilters:", v33);

    -[UITextField setAlpha:](v3->_memoField, "setAlpha:", 0.0);
    -[UITextField addTarget:action:forControlEvents:](v3->_memoField, "addTarget:action:forControlEvents:", v3, sel_textFieldDidChange_, 0x20000);
    -[UITextField setAccessibilityIdentifier:](v3->_memoField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D38]);
    -[UIView addSubview:](v10, "addSubview:", v3->_memoField);
    -[PKPeerPaymentMessagesContentAmountEntryView _setSubtitleType:updateLayout:](v3, "_setSubtitleType:updateLayout:", 0, 0);
    if (PKIsPad())
    {
      v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      showKeypadHint = v3->_showKeypadHint;
      v3->_showKeypadHint = v34;

      -[UILabel setTextAlignment:](v3->_showKeypadHint, "setTextAlignment:", 1);
      v36 = v3->_showKeypadHint;
      +[PKPeerPaymentTheme secondaryTextColor](PKPeerPaymentTheme, "secondaryTextColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v36, "setTextColor:", v37);

      -[UILabel setFont:](v3->_showKeypadHint, "setFont:", v17);
      v38 = v3->_showKeypadHint;
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_AMOUNT_STEPPER_RESIZE_FOR_KEYPAD_TITLE"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v38, "setText:", v39);

      -[UIView addSubview:](v10, "addSubview:", v3->_showKeypadHint);
    }
    v40 = (void *)MEMORY[0x1E0DC3518];
    v41 = (void *)MEMORY[0x1E0DC3428];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke;
    v68[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v69, &location);
    objc_msgSend(v41, "actionWithHandler:", v68);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "systemButtonWithPrimaryAction:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    showKeypadButton = v3->_showKeypadButton;
    v3->_showKeypadButton = (UIButton *)v43;

    v45 = v3->_showKeypadButton;
    +[PKPeerPaymentTheme secondaryTextColor](PKPeerPaymentTheme, "secondaryTextColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v45, "setTitleColor:forState:", v46, 0);

    v47 = v3->_showKeypadButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v47, "setBackgroundColor:", v48);

    v49 = objc_alloc(MEMORY[0x1E0CB3498]);
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_AMOUNT_STEPPER_SHOW_KEYPAD_TITLE"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = *MEMORY[0x1E0DC1138];
    v75 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v49, "initWithString:attributes:", v50, v51);

    -[UIButton setAttributedTitle:forState:](v3->_showKeypadButton, "setAttributedTitle:forState:", v52, 0);
    -[UIButton layer](v3->_showKeypadButton, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFilters:", v54);

    -[UIButton setAccessibilityIdentifier:](v3->_showKeypadButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    -[UIView addSubview:](v10, "addSubview:", v3->_showKeypadButton);
    v55 = -[PKPeerPaymentMessagesNumberPadView initWithSizeCategory:]([PKPeerPaymentMessagesNumberPadView alloc], "initWithSizeCategory:", v65);
    numberPadView = v3->_numberPadView;
    v3->_numberPadView = v55;

    -[PKPeerPaymentMessagesNumberPadView layer](v3->_numberPadView, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setMasksToBounds:", 0);

    -[PKPeerPaymentMessagesNumberPadView layer](v3->_numberPadView, "layer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFilters:", v59);

    -[UIView addSubview:](v10, "addSubview:", v3->_numberPadView);
    v60 = v3->_numberPadView;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke_2;
    v66[3] = &unk_1E3E6BD38;
    objc_copyWeak(&v67, &location);
    -[PKPeerPaymentMessagesNumberPadView setActionHandler:](v60, "setActionHandler:", v66);
    v61 = objc_alloc_init(PKPeerPaymentMessagesMultiActionView);
    actionView = v3->_actionView;
    v3->_actionView = v61;

    -[PKPeerPaymentMessagesMultiActionView layer](v3->_actionView, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setMasksToBounds:", 0);

    -[PKPeerPaymentMessagesContentAmountEntryView addSubview:](v3, "addSubview:", v3->_actionView);
    -[PKPeerPaymentMessagesContentAmountEntryView _setNumberPadVisible:animated:](v3, "_setNumberPadVisible:animated:", 1, 0);
    -[PKPeerPaymentMessagesContentAmountEntryView _setActiveSubtitleVisible:animated:](v3, "_setActiveSubtitleVisible:animated:", 0, 0);
    -[PKPeerPaymentMessagesContentAmountEntryView _setShowKeypadHintVisible:animated:](v3, "_setShowKeypadHintVisible:animated:", 1, 0);
    -[PKPeerPaymentMessagesContentAmountEntryView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
    objc_destroyWeak(&v67);

    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[62], "amountTappedHandler");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);

    WeakRetained = v4;
  }

}

void __61__PKPeerPaymentMessagesContentAmountEntryView_initWithFrame___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[62], "handleNumberPadAction:", a3);

}

- (unint64_t)_style
{
  return self->_percentExpanded >= 0.75;
}

- (unint64_t)sizeCategory
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  unint64_t result;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v31 = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentMessagesContentAmountEntryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[PKPeerPaymentMessagesContentAmountEntryView _isPresentedAsSheet](self, "_isPresentedAsSheet"))
  {
    -[PKPeerPaymentMessagesContentAmountEntryView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_rootSheetPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_detentValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") != 2)
    {
      PKLogFacilityTypeGetObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Root sheet controller did not contain expected detent values. Actual: %@. Defaulting layout to small", buf, 0xCu);
      }

      return 0;
    }
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v10 = v15;

  }
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  if (CGRectEqualToRect(self->_lastMaxBounds, v33))
    return self->_sizeCategory;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  result = objc_msgSend(&unk_1E3FAE770, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (result)
  {
    v17 = result;
    v18 = *(_QWORD *)v25;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(&unk_1E3FAE770);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
        -[PKPeerPaymentMessagesContentAmountEntryView _layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:](self, "_layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:", objc_msgSend(v20, "integerValue"), 1, v4, v6, v8, v10, 1.0);
        v22 = v21;
        v32.origin.x = v4;
        v32.origin.y = v6;
        v32.size.width = v8;
        v32.size.height = v10;
        if (v22 <= CGRectGetHeight(v32))
        {
          result = objc_msgSend(v20, "integerValue");
          goto LABEL_19;
        }
        ++v19;
      }
      while (v17 != v19);
      result = objc_msgSend(&unk_1E3FAE770, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v17 = result;
      if (result)
        continue;
      break;
    }
  }
LABEL_19:
  self->_lastMaxBounds.origin.x = v4;
  self->_lastMaxBounds.origin.y = v6;
  self->_lastMaxBounds.size.width = v8;
  self->_lastMaxBounds.size.height = v10;
  self->_sizeCategory = result;
  return result;
}

- (void)updateIsExpansionSupported
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  CGSize v7;
  id v8;

  -[PKPeerPaymentMessagesContentAmountEntryView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v4 = -[PKPeerPaymentMessagesContentAmountEntryView _isPresentedAsSheet](self, "_isPresentedAsSheet");
    if (PKIsPhone())
      v5 = (unint64_t)(objc_msgSend(v8, "interfaceOrientation") - 5) < 0xFFFFFFFFFFFFFFFELL;
    else
      v5 = 1;
    v6 = v4 && v5;
    if (self->_isExpansionSupported != v6)
    {
      self->_isExpansionSupported = v6;
      v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_lastMaxBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_lastMaxBounds.size = v7;
      -[PKPeerPaymentMessagesContentAmountEntryView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)updateIsKeypadSupported
{
  void *v3;
  _BOOL4 v4;
  CGSize v5;
  id v6;

  -[PKPeerPaymentMessagesContentAmountEntryView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (PKIsPhone())
      v4 = (unint64_t)(objc_msgSend(v6, "interfaceOrientation") - 5) < 0xFFFFFFFFFFFFFFFELL;
    else
      v4 = 1;
    if (self->_isKeypadSupported != v4)
    {
      self->_isKeypadSupported = v4;
      v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_lastMaxBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_lastMaxBounds.size = v5;
      -[PKPeerPaymentMessagesContentAmountEntryView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setPercentExpanded:(double)a3
{
  if (self->_percentExpanded != a3)
  {
    self->_percentExpanded = a3;
    -[PKPeerPaymentMessagesContentAmountEntryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPresentationContext:(int64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (!a3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Unspecified semantic presentation context, defaulting to normal", v5, 2u);
    }

    a3 = 1;
  }
  if (self->_presentationContext != a3)
  {
    self->_presentationContext = a3;
    -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self, "updateIsExpansionSupported");
    -[PKPeerPaymentMessagesContentAmountEntryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSubtitleType:(unint64_t)a3
{
  -[PKPeerPaymentMessagesContentAmountEntryView _setSubtitleType:updateLayout:](self, "_setSubtitleType:updateLayout:", a3, 1);
}

- (void)_setSubtitleType:(unint64_t)a3 updateLayout:(BOOL)a4
{
  _BOOL4 v4;
  UIView **p_activeSubtitleView;
  UIView *activeSubtitleView;
  int *v9;

  v4 = a4;
  p_activeSubtitleView = &self->_activeSubtitleView;
  activeSubtitleView = self->_activeSubtitleView;
  if (!activeSubtitleView || self->_subtitleType != a3)
  {
    -[UIView setAlpha:](activeSubtitleView, "setAlpha:", 0.0);
    v9 = &OBJC_IVAR___PKPeerPaymentMessagesContentAmountEntryView__balanceLabel;
    self->_subtitleType = a3;
    if (a3)
    {
      if (a3 != 1)
        goto LABEL_7;
      v9 = &OBJC_IVAR___PKPeerPaymentMessagesContentAmountEntryView__memoField;
    }
    objc_storeStrong((id *)p_activeSubtitleView, *(id *)((char *)&self->super.super.super.isa + *v9));
LABEL_7:
    -[UIView setAlpha:](*p_activeSubtitleView, "setAlpha:", 1.0);
    if (v4)
      -[PKPeerPaymentMessagesContentAmountEntryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_isPresentedAsSheet
{
  return self->_presentationContext == 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
  v4 = a3;
  -[PKPeerPaymentMessagesContentAmountEntryView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PKPeerPaymentMessagesContentAmountEntryView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v6);
  if ((v4 & 1) == 0)
  {
    self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;
    -[PKPeerPaymentMessagesContentAmountEntryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double percentExpanded;
  unint64_t v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
  -[PKPeerPaymentMessagesContentAmountEntryView layoutSubviews](&v15, sel_layoutSubviews);
  -[PKPeerPaymentMessagesContentAmountEntryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  percentExpanded = self->_percentExpanded;
  v12 = -[PKPeerPaymentMessagesContentAmountEntryView sizeCategory](self, "sizeCategory");
  if (PKIsPad() && self->_presentationContext == 3)
  {
    -[PKPeerPaymentMessagesContentAmountEntryView _layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:](self, "_layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:", v12, 1, v4, v6, v8, v10, 1.0);
    v14 = v13;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    if (CGRectGetHeight(v16) < v14)
      percentExpanded = 0.0;
    else
      percentExpanded = 1.0;
  }
  -[PKPeerPaymentMessagesContentAmountEntryView _layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:](self, "_layoutWithBounds:progressToExpanded:sizeCategory:isTemplate:", v12, 0, v4, v6, v8, v10, percentExpanded);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 progressToExpanded:(double)a4 sizeCategory:(unint64_t)a5 isTemplate:(BOOL)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  int v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  void *v39;
  _BOOL4 isExpansionSupported;
  BOOL v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  PKPeerPaymentMessagesNumberPadView *numberPadView;
  _BOOL8 v52;
  _BOOL8 v53;
  _BOOL8 v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGAffineTransform v63;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&slice, 0, sizeof(slice));
  remainder = a3;
  if (!a6)
  {
    -[PKPeerPaymentMessagesMultiActionView setStyle:](self->_actionView, "setStyle:", a4 >= 0.75, 0.75);
    -[PKPeerPaymentMessagesMultiActionView setUsesFlexibleButtonWidth:](self->_actionView, "setUsesFlexibleButtonWidth:", PKIsPad() ^ 1);
    -[PKPeerPaymentMessagesAmountStepperView setStyle:](self->_amountStepperView, "setStyle:", a4 >= 0.75);
    -[PKPeerPaymentMessagesAmountStepperView setSizeCategory:](self->_amountStepperView, "setSizeCategory:", a5);
    -[PKPeerPaymentMessagesNumberPadView setStyle:](self->_numberPadView, "setStyle:", a4 >= 0.75);
    -[PKPeerPaymentMessagesNumberPadView setSizeCategory:](self->_numberPadView, "setSizeCategory:", a5);
    v14 = 24.0;
    if (!-[PKPeerPaymentMessagesMultiActionView usesFlexibleButtonWidth](self->_actionView, "usesFlexibleButtonWidth"))
    {
      v67.origin.x = x;
      v67.origin.y = y;
      v67.size.width = width;
      v67.size.height = height;
      v15 = CGRectGetWidth(v67);
      -[PKPeerPaymentMessagesMultiActionView sizeThatFits:](self->_actionView, "sizeThatFits:", width + -48.0, height);
      v14 = (v15 - v16) * 0.5;
    }
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    CGRectDivide(v68, &slice, &remainder, v14, CGRectMinXEdge);
    CGRectDivide(remainder, &slice, &remainder, v14, CGRectMaxXEdge);
  }
  v17 = PKIsPad();
  v18 = -[PKPeerPaymentMessagesContentAmountEntryView _isPresentedAsSheet](self, "_isPresentedAsSheet");
  if (((a5 == 0) & v17) != 0)
    v19 = 0.0;
  else
    v19 = 16.0;
  if (!a6)
    CGRectDivide(remainder, &slice, &remainder, v19, CGRectMaxYEdge);
  v60 = v19;
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:forStyle:](self->_actionView, "sizeThatFits:forStyle:", 0, remainder.size.width, remainder.size.height);
  v21 = v20;
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:forStyle:](self->_actionView, "sizeThatFits:forStyle:", 1, remainder.size.width, remainder.size.height);
  v23 = v21 + (v22 - v21) * a4;
  if (!a6)
  {
    CGRectDivide(remainder, &slice, &remainder, v23, CGRectMaxYEdge);
    -[PKPeerPaymentMessagesMultiActionView setFrame:](self->_actionView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  if (a5 - 1 < 2)
  {
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    v25 = CGRectGetHeight(v70);
    if (!v17)
    {
      v26 = 0.1;
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (a5 == 3)
  {
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    v25 = CGRectGetHeight(v71);
    v26 = 0.12;
    goto LABEL_21;
  }
  v24 = 0.0;
  if (!a5 && (v17 & 1) == 0)
  {
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    v25 = CGRectGetHeight(v69);
LABEL_18:
    v26 = 0.04;
LABEL_21:
    v24 = v25 * v26;
  }
  v59 = v23;
  v61 = x;
  v62 = a4;
  v27 = v24 * a4;
  if (!a6)
    CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
  v58 = v27;
  -[UIView setFrame:](self->_containerView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  remainder.origin = (CGPoint)*MEMORY[0x1E0C9D538];
  +[PKPeerPaymentMessagesAmountStepperView sizeThatFits:forSizeCategory:](PKPeerPaymentMessagesAmountStepperView, "sizeThatFits:forSizeCategory:", a5, remainder.size.width, remainder.size.height);
  v29 = v28;
  -[UIView sizeThatFits:](self->_activeSubtitleView, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v31 = v30;
  v33 = v32;
  v34 = 54;
  if (v18)
    v34 = 55;
  v35 = OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v34];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "sizeThatFits:", remainder.size.width, remainder.size.height);
  if (v33 <= v36)
    v37 = v36;
  else
    v37 = v33;
  if (!a6)
  {
    v57 = v31;
    PKSizeAlignedInRect();
    CGRectDivide(remainder, &slice, &remainder, (1.0 - v62) * v38, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v29, CGRectMinYEdge);
    -[PKPeerPaymentMessagesAmountStepperView setFrame:](self->_amountStepperView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, v37, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIView setFrame:](self->_activeSubtitleView, "setFrame:");
    v39 = *(Class *)((char *)&self->super.super.super.isa + v35);
    PKSizeAlignedInRect();
    objc_msgSend(v39, "setFrame:");
  }
  isExpansionSupported = self->_isExpansionSupported;
  v41 = !self->_isExpansionSupported && v62 < 0.75;
  v42 = 0.0;
  v43 = v29 + 0.0 + v37;
  v44 = 0.001;
  if (!v41 && self->_isKeypadSupported)
  {
    +[PKPeerPaymentMessagesNumberPadView referenceSizeForSizeCategory:](PKPeerPaymentMessagesNumberPadView, "referenceSizeForSizeCategory:", a5);
    if (isExpansionSupported)
    {
      v42 = v45 * v62;
      if (v62 >= 0.001)
        v44 = v62;
      else
        v44 = 0.001;
    }
    else
    {
      if (v62 >= 0.75)
        v42 = v45;
      else
        v42 = 0.0;
      if (v62 >= 0.75)
        v44 = 1.0;
      else
        v44 = 0.001;
    }
    v46 = v42;
    if (!a6)
      v46 = remainder.size.height;
    v43 = v43 + v46;
  }
  if (!a6)
  {
    CGRectDivide(remainder, &slice, &remainder, v42, CGRectMinYEdge);
    UIRectCenteredYInRect();
    slice.origin.x = v47;
    slice.origin.y = v48;
    slice.size.width = v49;
    slice.size.height = v50;
    numberPadView = self->_numberPadView;
    CGAffineTransformMakeScale(&v63, 1.0, v44);
    -[PKPeerPaymentMessagesNumberPadView setTransform:](numberPadView, "setTransform:", &v63);
    -[PKPeerPaymentMessagesNumberPadView setFrame:](self->_numberPadView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    v52 = v62 >= 0.75 && self->_isKeypadSupported;
    v53 = v62 >= 0.75;
    v54 = -[PKPeerPaymentMessagesContentAmountEntryView _isAnimationAllowed](self, "_isAnimationAllowed", 0.75, v62, v57);
    -[PKPeerPaymentMessagesContentAmountEntryView _setNumberPadVisible:animated:](self, "_setNumberPadVisible:animated:", v52, v54);
    -[PKPeerPaymentMessagesContentAmountEntryView _setActiveSubtitleVisible:animated:](self, "_setActiveSubtitleVisible:animated:", v53, v54);
    -[PKPeerPaymentMessagesContentAmountEntryView _setShowKeypadHintVisible:animated:](self, "_setShowKeypadHintVisible:animated:", v62 < 0.75, v54);
    -[PKPeerPaymentMessagesMultiActionView setCenterButtonVisible:animated:](self->_actionView, "setCenterButtonVisible:animated:", v53, v54);
    -[PKPeerPaymentMessagesAmountStepperView setPlusMinusVisible:animated:](self->_amountStepperView, "setPlusMinusVisible:animated:", v52 ^ 1, v54);
  }
  v72.origin.x = v61;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  v55 = CGRectGetWidth(v72);
  v56 = v58 + v60 + v59 + v43;
  result.height = v56;
  result.width = v55;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[16];
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetHeight(a3);
  -[PKPeerPaymentMessagesContentAmountEntryView bounds](self, "bounds");
  if (v8 - CGRectGetHeight(v12) == 100.0)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring frame update. (<rdar://problem/31900645>)", buf, 2u);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryView;
    -[PKPeerPaymentMessagesContentAmountEntryView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  }
}

- (void)_setNumberPadVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v4 = a4;
  v5 = a3;
  -[PKPeerPaymentMessagesNumberPadView layer](self->_numberPadView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "opacity");
  if (*(float *)&v7 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        v19 = 0;
        v20 = 0;
        ContentViewVisibilityAnimations(0, &v20, &v19, 0);
        v8 = v20;
        v9 = v19;
        v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v8);
        v11 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

LABEL_6:
        LODWORD(v7) = 1.0;
        objc_msgSend(v6, "setOpacity:", v7);
        objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
        goto LABEL_9;
      }
      v17 = 0;
      v18 = 0;
      ContentViewVisibilityAnimations(&v18, 0, 0, &v17);
      v12 = v18;
      v13 = v17;
      v14 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v13);
      v15 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v12);

    }
    else if (v5)
    {
      goto LABEL_6;
    }
    objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
    LODWORD(v16) = 0;
    objc_msgSend(v6, "setOpacity:", v16);
  }
LABEL_9:

}

- (void)_setActiveSubtitleVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v4 = a4;
  v5 = a3;
  -[UIView layer](self->_activeSubtitleView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "opacity");
  if (*(float *)&v7 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        v19 = 0;
        v20 = 0;
        ContentViewVisibilityAnimations(0, &v20, &v19, 0);
        v8 = v20;
        v9 = v19;
        v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v8);
        v11 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

LABEL_6:
        LODWORD(v7) = 1.0;
        objc_msgSend(v6, "setOpacity:", v7);
        objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
        goto LABEL_9;
      }
      v17 = 0;
      v18 = 0;
      ContentViewVisibilityAnimations(&v18, 0, 0, &v17);
      v12 = v18;
      v13 = v17;
      v14 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v12);
      v15 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v13);

    }
    else if (v5)
    {
      goto LABEL_6;
    }
    objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
    LODWORD(v16) = 0;
    objc_msgSend(v6, "setOpacity:", v16);
  }
LABEL_9:

}

- (void)_setShowKeypadHintVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v4 = a4;
  v5 = a3;
  v7 = -[PKPeerPaymentMessagesContentAmountEntryView _isPresentedAsSheet](self, "_isPresentedAsSheet");
  if (v7)
    v8 = 55;
  else
    v8 = 54;
  if (v7)
    v9 = 54;
  else
    v9 = 55;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v8]), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v9]), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  objc_msgSend(v10, "setHidden:", 0);
  objc_msgSend(v10, "opacity");
  if (*(float *)&v12 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        v24 = 0;
        v25 = 0;
        ContentViewVisibilityAnimations(0, &v25, &v24, 0);
        v13 = v25;
        v14 = v24;
        v15 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v13);
        v16 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v14);

LABEL_12:
        LODWORD(v12) = 1.0;
        objc_msgSend(v10, "setOpacity:", v12);
        objc_msgSend(v10, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
        goto LABEL_15;
      }
      v22 = 0;
      v23 = 0;
      ContentViewVisibilityAnimations(&v23, 0, 0, &v22);
      v17 = v23;
      v18 = v22;
      v19 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v17);
      v20 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v18);

    }
    else if (v5)
    {
      goto LABEL_12;
    }
    objc_msgSend(v10, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
    LODWORD(v21) = 0;
    objc_msgSend(v10, "setOpacity:", v21);
  }
LABEL_15:

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void (**memoChangedHandler)(id, void *);
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "resignFirstResponder");
  memoChangedHandler = (void (**)(id, void *))self->_memoChangedHandler;
  if (memoChangedHandler)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    memoChangedHandler[2](memoChangedHandler, v6);

  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  PKPeerPaymentMessagesNumberPadView *numberPadView;
  uint64_t v5;

  numberPadView = self->_numberPadView;
  v5 = 0;
  _PKViewSetAlphaAnimated(numberPadView, 0, (double *)&v5, 0.3, 0.0);
  -[PKPeerPaymentMessagesNumberPadView setUserInteractionEnabled:](self->_numberPadView, "setUserInteractionEnabled:", 0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  PKPeerPaymentMessagesNumberPadView *numberPadView;
  uint64_t v5;

  numberPadView = self->_numberPadView;
  v5 = 0;
  _PKViewSetAlphaAnimated(numberPadView, 0, (double *)&v5, 1.0, 0.0);
  -[PKPeerPaymentMessagesNumberPadView setUserInteractionEnabled:](self->_numberPadView, "setUserInteractionEnabled:", 1);
}

- (void)textFieldDidChange:(id)a3
{
  void (**memoChangedHandler)(id, id);
  id v4;

  memoChangedHandler = (void (**)(id, id))self->_memoChangedHandler;
  if (memoChangedHandler)
  {
    objc_msgSend(a3, "text");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    memoChangedHandler[2](memoChangedHandler, v4);

  }
}

- (PKPeerPaymentMessagesAmountStepperView)amountStepperView
{
  return self->_amountStepperView;
}

- (PKPeerPaymentMessagesNumberPadView)numberPadView
{
  return self->_numberPadView;
}

- (PKPeerPaymentMessagesMultiActionView)actionView
{
  return self->_actionView;
}

- (UILabel)balanceLabel
{
  return self->_balanceLabel;
}

- (UITextField)memoField
{
  return self->_memoField;
}

- (id)memoChangedHandler
{
  return self->_memoChangedHandler;
}

- (void)setMemoChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (double)percentExpanded
{
  return self->_percentExpanded;
}

- (double)navigationBarHeight
{
  return self->_navigationBarHeight;
}

- (void)setNavigationBarHeight:(double)a3
{
  self->_navigationBarHeight = a3;
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (unint64_t)subtitleType
{
  return self->_subtitleType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_memoChangedHandler, 0);
  objc_storeStrong((id *)&self->_memoField, 0);
  objc_storeStrong((id *)&self->_balanceLabel, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_numberPadView, 0);
  objc_storeStrong((id *)&self->_amountStepperView, 0);
  objc_storeStrong((id *)&self->_activeSubtitleView, 0);
  objc_storeStrong((id *)&self->_showKeypadButton, 0);
  objc_storeStrong((id *)&self->_showKeypadHint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
