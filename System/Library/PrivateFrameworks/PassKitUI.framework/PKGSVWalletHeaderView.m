@implementation PKGSVWalletHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKGSVWalletHeaderView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)needsRemoval
{
  int shouldShowInbox;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;

  if (self->_passType == 1)
  {
    shouldShowInbox = -[PKGSVWalletHeaderView _shouldShowInboxButton]((uint64_t)self);
    -[PKGSVWalletHeaderView _inboxBadgeValue]((id *)&self->super.super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldShowInbox == (self->_inboxButton == 0))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      -[PKBadgedView text](self->_badgedInboxButton, "text");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      v7 = v6;
      if (v5 == v6)
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        LOBYTE(v8) = 1;
        if (v6 && v5)
          v8 = objc_msgSend(v5, "isEqualToString:", v6) ^ 1;
      }

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (uint64_t)_shouldShowInboxButton
{
  uint64_t v1;
  id WeakRetained;
  void *v3;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 568));
    v3 = WeakRetained;
    if (WeakRetained)
      v1 = objc_msgSend(WeakRetained, "inboxVisibleForSectionHeaderView:", v1);
    else
      v1 = 0;

  }
  return v1;
}

- (id)_inboxBadgeValue
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 71);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v1 = (id)objc_msgSend(WeakRetained, "inboxBadgeCountForSectionHeaderView:", v1);
      if (v1)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend(v4, "setMaximumFractionDigits:", 0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringFromNumber:", v5);
        v1 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)setShowBackgroundProvisioningHint:(BOOL)a3 animated:(BOOL)a4
{
  PKPGSVSectionHeader_BackgroundProvisioningHintView *backgroundProvisioningHintView;
  _BOOL4 v5;
  PKPGSVSectionHeader_BackgroundProvisioningHintView *v7;
  PKPGSVSectionHeader_BackgroundProvisioningHintView *v8;
  PKPGSVSectionHeader_BackgroundProvisioningHintView *v9;
  _QWORD *v10;
  void *v11;
  id observer;
  UILabel *v13;
  UILabel *label;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  UIActivityIndicatorView *activityIndicator;
  void *v21;
  id v22;
  PKPGSVSectionHeader_BackgroundProvisioningHintView *v23;
  id WeakRetained;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  PKPGSVSectionHeader_BackgroundProvisioningHintView *v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  backgroundProvisioningHintView = self->_backgroundProvisioningHintView;
  if ((backgroundProvisioningHintView != 0) != a3)
  {
    v5 = a4;
    if (backgroundProvisioningHintView)
    {
      v7 = backgroundProvisioningHintView;
      v8 = self->_backgroundProvisioningHintView;
      self->_backgroundProvisioningHintView = 0;

      if (v5)
      {
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke_2;
        v28 = &unk_1E3E62288;
        v29 = v7;
        -[UIView pkui_setAlpha:animated:withCompletion:](v29, "pkui_setAlpha:animated:withCompletion:", 1, &v25, 0.0);

      }
      else
      {
        -[PKPGSVSectionHeader_BackgroundProvisioningHintView removeFromSuperview](v7, "removeFromSuperview");
      }

    }
    else
    {
      objc_initWeak(&location, self);
      v9 = [PKPGSVSectionHeader_BackgroundProvisioningHintView alloc];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke;
      v30[3] = &unk_1E3E61310;
      objc_copyWeak(&v31, &location);
      v10 = v30;
      if (v9)
      {
        v33.receiver = v9;
        v33.super_class = (Class)PKPGSVSectionHeader_BackgroundProvisioningHintView;
        v9 = -[PKGSVWalletHeaderView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        if (v9)
        {
          v11 = _Block_copy(v10);
          observer = v9->_observer;
          v9->_observer = v11;

          -[PKPGSVSectionHeader_BackgroundProvisioningHintView setAnchorPoint:](v9, "setAnchorPoint:", 0.5, 0.0);
          -[PKPGSVSectionHeader_BackgroundProvisioningHintView setMaximumContentSizeCategory:](v9, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48C8]);
          v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
          label = v9->_label;
          v9->_label = v13;

          v15 = v9->_label;
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v15, "setTextColor:", v16);

          -[UILabel setNumberOfLines:](v9->_label, "setNumberOfLines:", 0);
          -[UILabel setTextAlignment:](v9->_label, "setTextAlignment:", 1);
          v17 = v9->_label;
          PKLocalizedPaymentString(CFSTR("ADDING_CARDS_TO_WALLET"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setText:](v17, "setText:", v18);

          -[PKPGSVSectionHeader_BackgroundProvisioningHintView addSubview:](v9, "addSubview:", v9->_label);
          v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
          activityIndicator = v9->_activityIndicator;
          v9->_activityIndicator = (UIActivityIndicatorView *)v19;

          -[UIActivityIndicatorView startAnimating](v9->_activityIndicator, "startAnimating");
          -[PKPGSVSectionHeader_BackgroundProvisioningHintView addSubview:](v9, "addSubview:", v9->_activityIndicator);
          v34[0] = objc_opt_class();
          v34[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id)-[PKPGSVSectionHeader_BackgroundProvisioningHintView registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v21, &__block_literal_global_57);

          -[PKPGSVSectionHeader_BackgroundProvisioningHintView _updateFonts:]((uint64_t)v9, 1);
        }
      }

      v23 = self->_backgroundProvisioningHintView;
      self->_backgroundProvisioningHintView = v9;

      -[PKGSVWalletHeaderView addSubview:](self, "addSubview:", self->_backgroundProvisioningHintView);
      if (v5)
      {
        -[UIView pkui_setAlpha:animated:](self->_backgroundProvisioningHintView, "pkui_setAlpha:animated:", 0, 0.0);
        -[UIView pkui_setAlpha:animated:](self->_backgroundProvisioningHintView, "pkui_setAlpha:animated:", 1, 1.0);
      }
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    -[PKGSVWalletHeaderView setNeedsLayout](self, "setNeedsLayout", v25, v26, v27, v28);
    WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);
    objc_msgSend(WeakRetained, "setNeedsUpdateForGroupStackViewSectionHeaderView:", self);

  }
}

- (void)setHeaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_headerDelegate, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKGSVWalletHeaderView;
  -[PKGSVWalletHeaderView layoutSubviews](&v7, sel_layoutSubviews);
  -[PKGSVWalletHeaderView bounds](self, "bounds");
  -[PKGSVWalletHeaderView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 1, v3, v4, v5, v6);
}

- (PKGSVWalletHeaderView)initWithPassType:(unint64_t)a3 state:(id *)a4 delegate:(id)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  PKGSVWalletHeaderView *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_time_t v21;
  id v22;
  id v23;
  uint64_t (**v24)(void);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKBadgedView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v50;
  id *v51;
  id obj;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD aBlock[4];
  id v58;
  id v59;
  _QWORD block[4];
  id v61;
  id v62;
  id location;
  objc_super v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  obj = a5;
  v64.receiver = self;
  v64.super_class = (Class)PKGSVWalletHeaderView;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[PKGSVWalletHeaderView initWithFrame:](&v64, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  v12 = (uint64_t)v11;
  if (v11)
  {
    -[PKGSVWalletHeaderView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
    objc_msgSend((id)v12, "setAnchorPoint:", 0.5, 0.0);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    v14 = *(void **)(v12 + 496);
    *(_QWORD *)(v12 + 496) = v13;

    objc_msgSend(*(id *)(v12 + 496), "setAnchorPoint:", 0.5, 0.0);
    objc_msgSend(*(id *)(v12 + 496), "setMinimumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    objc_msgSend(*(id *)(v12 + 496), "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    objc_msgSend((id)v12, "addSubview:", *(_QWORD *)(v12 + 496));
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassGroupStackView backgroundColor](PKPassGroupStackView, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v12 + 592) = a3;
    objc_storeWeak((id *)(v12 + 568), obj);
    v17 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v18 = *(void **)(v12 + 504);
    *(_QWORD *)(v12 + 504) = v17;

    objc_msgSend(*(id *)(v12 + 504), "setTextColor:", v15);
    v19 = *(void **)(v12 + 504);
    PKLocalizedString(CFSTR("WALLET"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v20);

    objc_msgSend(*(id *)(v12 + 504), "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(*(id *)(v12 + 504), "sizeToFit");
    objc_msgSend(*(id *)(v12 + 496), "addSubview:", *(_QWORD *)(v12 + 504));
    objc_initWeak(&location, (id)v12);
    v21 = dispatch_time(0, 2500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke;
    block[3] = &unk_1E3E61B68;
    v51 = &v62;
    objc_copyWeak(&v62, &location);
    v22 = v15;
    v61 = v22;
    dispatch_after(v21, MEMORY[0x1E0C80D38], block);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_2;
    aBlock[3] = &unk_1E3E67CD8;
    v50 = v22;
    v58 = v50;
    v23 = v16;
    v59 = v23;
    v24 = (uint64_t (**)(void))_Block_copy(aBlock);
    v25 = (void *)v24[2]();
    objc_msgSend(v25, "setImageEnabled:forState:", 0, 2);
    PKLocalizedPaymentString(CFSTR("ADD_CARD"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAccessibilityLabel:", v26);

    objc_storeStrong((id *)(v12 + 520), v25);
    objc_msgSend(*(id *)(v12 + 520), "setAccessibilityIdentifier:", *MEMORY[0x1E0D67848]);
    objc_msgSend(*(id *)(v12 + 520), "addTarget:action:forControlEvents:", v12, sel_addTapped, 64);
    objc_msgSend(*(id *)(v12 + 496), "addSubview:", *(_QWORD *)(v12 + 520));
    if (*(_QWORD *)(v12 + 592) == 1 && -[PKGSVWalletHeaderView _shouldShowInboxButton](v12))
    {
      v27 = (void *)((uint64_t (*)(uint64_t (**)(void)))v24[2])(v24);
      objc_storeStrong((id *)(v12 + 528), v27);
      -[PKGSVWalletHeaderView _inboxBadgeValue]((id *)v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = -[PKBadgedView initWithView:text:]([PKBadgedView alloc], "initWithView:text:", *(_QWORD *)(v12 + 528), v28, v50, &v62);
        v30 = *(void **)(v12 + 536);
        *(_QWORD *)(v12 + 536) = v29;

      }
      objc_msgSend(v27, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E88], v50);

    }
    v31 = *(void **)(v12 + 528);
    if (v31)
    {
      objc_msgSend(v31, "addTarget:action:forControlEvents:", v12, sel_inboxTapped, 64);
      v32 = *(void **)(v12 + 496);
      if (*(_QWORD *)(v12 + 536))
        objc_msgSend(v32, "addSubview:");
      else
        objc_msgSend(v32, "addSubview:", *(_QWORD *)(v12 + 528));
    }
    if (_os_feature_enabled_impl())
    {
      v33 = (void *)((uint64_t (*)(uint64_t (**)(void)))v24[2])(v24);
      PKLocalizedOrderManagementString(CFSTR("ORDERS_TOOLBAR_ACCESSIBILITY_LABEL"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAccessibilityLabel:", v34);

      objc_msgSend(v33, "addTarget:action:forControlEvents:", v12, sel_ordersTapped, 64);
      objc_storeStrong((id *)(v12 + 544), v33);
      objc_msgSend(v33, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DA8]);
      objc_msgSend(*(id *)(v12 + 496), "addSubview:", *(_QWORD *)(v12 + 544));

    }
    v35 = PKUIGetMinScreenType();
    v36 = (double *)((char *)&unk_19DF15850 + 8 * v35);
    if (v35 >= 0x12)
      v36 = (double *)MEMORY[0x1E0C9D820];
    v37 = *v36;
    PKPassMaxFrontSize();
    v39 = 16.0;
    v40 = 16.0;
    if (v37 > v38)
    {
      v41 = v37 - v38;
      PKFloatRoundToPixel();
      v39 = v42 + 6.0;
      v40 = v41 - v42 + 6.0;
    }
    *(_QWORD *)(v12 + 424) = 0;
    *(double *)(v12 + 432) = v39;
    *(_QWORD *)(v12 + 440) = 0;
    *(double *)(v12 + 448) = v40;
    v43 = *(void **)(v12 + 496);
    v66[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_3;
    v55[3] = &unk_1E3E67D00;
    objc_copyWeak(&v56, &location);
    v45 = (id)objc_msgSend(v43, "registerForTraitChanges:withHandler:", v44, v55);

    v46 = *(void **)(v12 + 496);
    v65 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_4;
    v53[3] = &unk_1E3E67D00;
    objc_copyWeak(&v54, &location);
    v48 = (id)objc_msgSend(v46, "registerForTraitChanges:withHandler:", v47, v53);

    -[PKGSVWalletHeaderView _updateFonts:](v12, 1);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);

    objc_destroyWeak(v51);
    objc_destroyWeak(&location);

  }
  return (PKGSVWalletHeaderView *)v12;
}

void __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    PKLocalizedEnvironmentHint();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)_PKFontForDesign(v4, (void *)*MEMORY[0x1E0DC1398], (void *)*MEMORY[0x1E0DC4AB8], 64, 0, 0);
      v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = v9[64];
      v9[64] = v6;

      objc_msgSend(v9[64], "setText:", v3);
      objc_msgSend(v9[64], "setFont:", v5);
      objc_msgSend(v9[64], "setTextColor:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v9[64], "setTextAlignment:", 2);
      objc_msgSend(v9[64], "sizeToFit");
      objc_msgSend(v9[64], "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B68]);
      objc_msgSend(v9[64], "setAlpha:", 0.0);
      objc_msgSend(v9[62], "insertSubview:atIndex:", v9[64], 0);
      objc_msgSend(v9, "setNeedsLayout");
      objc_msgSend(v9[64], "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pkui_animateToOpacity:withCompletion:", 0, 0.3);

    }
    WeakRetained = v9;
  }

}

PKContinuousButton *__57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_2(uint64_t a1)
{
  PKContinuousButton *v2;
  void *v3;
  _QWORD v5[2];
  int64x2_t v6;
  uint64_t v7;

  v5[0] = 0;
  v5[1] = 0;
  v6 = vdupq_n_s64(2uLL);
  v7 = 2;
  v2 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", v5);
  -[PKContinuousButton setTintColor:](v2, "setTintColor:", *(_QWORD *)(a1 + 32));
  -[PKContinuousButton _setTouchInsets:](v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  -[PKContinuousButton imageView](v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", *(_QWORD *)(a1 + 40));

  return v2;
}

void __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[57];
    WeakRetained[57] = 0;
    v3 = WeakRetained;

    -[PKGSVWalletHeaderView _updateFonts:]((uint64_t)v3, 0);
    WeakRetained = v3;
  }

}

- (void)_updateFonts:(uint64_t)a1
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(void *, const __CFString *, uint64_t, uint64_t, uint64_t);
  void *v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  BOOL v34;
  _QWORD v35[5];

  if (!a1)
    return;
  objc_msgSend((id)a1, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    __break(1u);
    goto LABEL_21;
  }
  v5 = v4;
  v6 = (NSString *)(id)*MEMORY[0x1E0DC4918];
  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  if (v7 && UIContentSizeCategoryCompareToCategory(v7, v6) == NSOrderedSame)
  {
    v10 = v5;
  }
  else
  {
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __ReferenceTraitCollection_block_invoke;
    v35[3] = &unk_1E3E67D78;
    v35[4] = v6;
    objc_msgSend(v5, "traitCollectionByModifyingTraits:", v35);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = (void *)*MEMORY[0x1E0DC1398];
  v13 = _PKFontForDesign(v5, (void *)*MEMORY[0x1E0DC1398], (void *)*MEMORY[0x1E0DC4AE8], 2, 0, 0);
  objc_msgSend(*(id *)(a1 + 504), "setFont:", v13);
  v14 = (void *)*MEMORY[0x1E0DC4AD0];
  v15 = (void *)_PKFontForDesign(v5, v12, (void *)*MEMORY[0x1E0DC4AD0], 2, 0, 0);
  v16 = v15;
  if (v5 == v11)
  {
    v19 = v15;
  }
  else
  {
    v17 = v11;
    if (!v17)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v18 = v17;
    v19 = (id)_PKFontForDesign(v17, v12, v14, 2, 0, 0);

  }
  v30 = (void *)v13;
  v20 = v16;
  if (!v20)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = v20;
  v22 = a2;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v20, -1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v11)
  {
    v26 = v23;
    goto LABEL_16;
  }
  v24 = v19;
  if (!v24)
  {
LABEL_23:
    __break(1u);
    return;
  }
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v24, -1);
  v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PKGSVWalletHeaderView__updateFonts___block_invoke;
  aBlock[3] = &unk_1E3E67D28;
  v34 = v5 == v11;
  v27 = v23;
  v32 = v27;
  v28 = v26;
  v33 = v28;
  v29 = (void (**)(void *, const __CFString *, uint64_t, uint64_t, uint64_t))_Block_copy(aBlock);
  v29[2](v29, CFSTR("plus"), a1 + 456, a1 + 464, a1 + 472);
  v29[2](v29, CFSTR("person.crop.circle"), 0, 0, a1 + 480);
  v29[2](v29, CFSTR("shippingbox.fill"), 0, 0, a1 + 488);
  objc_msgSend(*(id *)(a1 + 520), "updateWithImage:", *(_QWORD *)(a1 + 472));
  objc_msgSend(*(id *)(a1 + 528), "updateWithImage:", *(_QWORD *)(a1 + 480));
  objc_msgSend(*(id *)(a1 + 544), "updateWithImage:", *(_QWORD *)(a1 + 488));
  *(_BYTE *)(a1 + 416) = 1;
  objc_msgSend((id)a1, "setNeedsLayout");
  if ((v22 & 1) == 0)
    -[PKGSVWalletHeaderView _setSizeMayChange](a1);

}

void __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKGSVWalletHeaderView _updateFonts:]((uint64_t)WeakRetained, 0);

}

- (void)_layoutSubviewsInBounds:(double)a3 withCommitMode:(double)a4
{
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGRect *v28;
  double v29;
  double v30;
  CGFloat x;
  CGSize size;
  CGFloat y;
  CGFloat height;
  double v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  void *v39;
  CGRect *v40;
  CGFloat v41;
  void *v42;
  CGRect *v43;
  CGSize v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect *v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  _QWORD aBlock[9];
  int v63;
  int v64;
  char v65;
  CGPoint origin;
  CGSize v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  CGRect *v73;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  CGRect *v79;
  uint64_t v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  CGRect v85;
  CGRect v86;

  if (a1)
  {
    v84.receiver = (id)a1;
    v84.super_class = (Class)PKGSVWalletHeaderView;
    objc_msgSendSuper2(&v84, sel_layoutSubviews);
    v59 = a3;
    v60 = a4;
    if (*(_BYTE *)(a1 + 416))
    {
      objc_msgSend(*(id *)(a1 + 504), "sizeToFit");
      v11 = *(id *)(a1 + 472);
      if (!v11)
      {
        __break(1u);
        return;
      }
      v12 = v11;
      objc_msgSend(v11, "size");
      objc_msgSend(v12, "alignmentRectInsets");
      PKFloatRoundToPixel();
      v14 = v13;

      v15 = fmax(v14, 5.0);
      v16 = *MEMORY[0x1E0C9D538];
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(*(id *)(a1 + 520), "setFrame:", *MEMORY[0x1E0C9D538], v17, v15, v15);
      objc_msgSend(*(id *)(a1 + 528), "setFrame:", v16, v17, v15, v15);
      objc_msgSend(*(id *)(a1 + 536), "sizeToFit");
      objc_msgSend(*(id *)(a1 + 544), "setFrame:", v16, v17, v15, v15);
      *(_BYTE *)(a1 + 416) = 0;
    }
    else
    {
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    v18 = objc_msgSend((id)a1, "_shouldReverseLayoutDirection");
    if (v18)
      v19 = 2;
    else
      v19 = 0x200000000;
    v20 = *(double *)(a1 + 424);
    v21 = *(double *)(a1 + 440);
    if (v18)
      v22 = *(double *)(a1 + 448);
    else
      v22 = *(double *)(a1 + 432);
    if (v18)
      v23 = *(double *)(a1 + 432);
    else
      v23 = *(double *)(a1 + 448);
    v78 = 0;
    v79 = (CGRect *)&v78;
    v80 = 0x4010000000;
    v81 = &unk_19E0C78CE;
    v82 = 0u;
    v83 = 0u;
    v72 = 0;
    v73 = (CGRect *)&v72;
    v74 = 0x4010000000;
    v75 = &unk_19E0C78CE;
    v76 = 0u;
    v77 = 0u;
    v68 = 0;
    v69 = (double *)&v68;
    v70 = 0x2020000000;
    v71 = v17;
    objc_msgSend(*(id *)(a1 + 504), "frame");
    v25 = v24;
    v58 = v22;
    v26 = a5 - (v22 + v23);
    v27 = a6 - (v20 + v21);
    PKSizeAlignedInRect();
    v28 = v73;
    v73[1].origin.x = v85.origin.x;
    v28[1].origin.y = v85.origin.y;
    ++v28;
    v28->size.width = v85.size.width;
    v28->size.height = v85.size.height;
    CGRectDivide(v85, v79 + 1, v28, v25, (CGRectEdge)v19);
    PKSizeAlignedInRect();
    v69[3] = fmax(v29 + v30, v69[3]);
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 504), "setFrame:");
      if (*(_QWORD *)(a1 + 512))
      {
        size = v73[1].size;
        origin = v73[1].origin;
        x = origin.x;
        v67 = size;
        y = v73[1].origin.y;
        size.width = v73[1].size.width;
        height = v73[1].size.height;
        CGRectDivide(*(CGRect *)(&size - 1), v79 + 1, v73 + 1, 10.0, (CGRectEdge)v19);
        objc_msgSend(*(id *)(a1 + 512), "frame");
        v36 = v35;
        CGRectDivide(v73[1], v79 + 1, v73 + 1, v37, (CGRectEdge)v19);
        objc_msgSend(*(id *)(a1 + 504), "font");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 512), "font");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "descender");
        objc_msgSend(v39, "ascender");
        PKFloatRoundToPixel();
        v40 = v79;
        v79[1].origin.y = v41;
        v40[1].size.height = v36;
        v42 = *(void **)(a1 + 512);
        PKSizeAlignedInRect();
        objc_msgSend(v42, "setFrame:");
        v43 = v73;
        v44 = v67;
        v73[1].origin = origin;
        v43[1].size = v44;

      }
    }
    origin.x = 0.0;
    *(_QWORD *)&origin.y = &origin;
    *(_QWORD *)&v67.width = 0x2020000000;
    LOBYTE(v67.height) = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKGSVWalletHeaderView__layoutSubviewsInBounds_withCommitMode___block_invoke;
    aBlock[3] = &unk_1E3E67D50;
    aBlock[4] = &origin;
    aBlock[5] = &v72;
    aBlock[8] = v19;
    v63 = HIDWORD(v19);
    v64 = 1;
    aBlock[6] = &v78;
    aBlock[7] = &v68;
    v65 = a2;
    v45 = _Block_copy(aBlock);
    (*((void (**)(void *, _QWORD, _QWORD))v45 + 2))(v45, *(_QWORD *)(a1 + 520), 0);
    objc_msgSend(*(id *)(a1 + 552), "frame");
    v46 = *(void **)(a1 + 552);
    PKSizeAlignedInRect();
    objc_msgSend(v46, "setFrame:");
    v47 = *(_QWORD *)(a1 + 544);
    if (v47)
      (*((void (**)(void *, uint64_t, _QWORD))v45 + 2))(v45, v47, 0);
    if (*(_QWORD *)(a1 + 528))
    {
      v48 = *(_QWORD *)(a1 + 536);
      if (v48)
        v49 = *(_QWORD *)(a1 + 536);
      else
        v49 = *(_QWORD *)(a1 + 528);
      (*((void (**)(void *, uint64_t, BOOL))v45 + 2))(v45, v49, v48 != 0);
    }
    v50 = v60 + v20;
    PKSizeAlignedInRect();
    v52 = v51;
    v54 = v53;
    if (a2)
      objc_msgSend(*(id *)(a1 + 496), "setFrame:");
    v55 = fmax(v52 + v54, v50);

    _Block_object_dispose(&origin, 8);
    _Block_object_dispose(&v68, 8);
    if (*(_QWORD *)(a1 + 560))
    {
      v56 = v73;
      v73[1].origin.x = v59 + v58;
      v56[1].origin.y = v50;
      ++v56;
      v56->size.width = v26;
      v56->size.height = v27;
      v86.origin.x = v59 + v58;
      v86.origin.y = v60 + v20;
      v86.size.width = v26;
      v86.size.height = v27;
      CGRectDivide(v86, v79 + 1, v56, v55 - v50, CGRectMinYEdge);
      CGRectDivide(v73[1], v79 + 1, v73 + 1, 30.0, CGRectMinYEdge);
      objc_msgSend(*(id *)(a1 + 560), "sizeThatFits:", v73[1].size.width, 1.79769313e308);
      CGRectDivide(v73[1], v79 + 1, v73 + 1, v57, CGRectMinYEdge);
      PKSizeAlignedInRect();
      if (a2)
        objc_msgSend(*(id *)(a1 + 560), "setFrame:");
      CGRectDivide(v73[1], v79 + 1, v73 + 1, 10.0, CGRectMinYEdge);
    }
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v78, 8);
  }
}

void __38__PKGSVWalletHeaderView__updateFonts___block_invoke(uint64_t a1, void *a2, id *a3, double *a4, id *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  double v25;
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
  id v38;

  v38 = a2;
  if (a3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v9 = *a3;
      v10 = *a3;
      if (v10)
      {
        v11 = v10;
        objc_storeStrong(a5, v9);
        goto LABEL_8;
      }
    }
  }
  v12 = *(void **)(a1 + 32);
  v13 = v38;
  v14 = v12;
  if (!v13)
  {
    __break(1u);
    goto LABEL_21;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong(a5, v11);
  if (!a3)
  {
LABEL_19:

    return;
  }
LABEL_8:
  if (*a3)
    goto LABEL_19;
  if (*(_BYTE *)(a1 + 48))
  {
    v17 = *a5;
    goto LABEL_14;
  }
  v18 = *(void **)(a1 + 40);
  v19 = v38;
  v20 = v18;
  if (!v19)
    goto LABEL_22;
  v21 = v20;
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithRenderingMode:", 2);
    v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v23 = *a3;
    *a3 = v17;

    if (a4)
    {
      if (*a3)
      {
        v24 = *a3;
        objc_msgSend(v24, "size");
        v26 = v25;
        v28 = v27;
        objc_msgSend(v24, "alignmentRectInsets");
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;

        v37 = 32.0 / fmax(v26 - (v32 + v36), v28 - (v30 + v34));
      }
      else
      {
        v37 = 1.0;
      }
      *a4 = v37;
    }
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

- (void)_setSizeMayChange
{
  _QWORD block[5];

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 417))
    {
      *(_BYTE *)(a1 + 417) = 1;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PKGSVWalletHeaderView__setSizeMayChange__block_invoke;
      block[3] = &unk_1E3E612E8;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __42__PKGSVWalletHeaderView__setSizeMayChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 417) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 576));
  objc_msgSend(WeakRetained, "setNeedsUpdateForGroupStackViewSectionHeaderView:", *(_QWORD *)(a1 + 32));

}

double __64__PKGSVWalletHeaderView__layoutSubviewsInBounds_withCommitMode___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGRect *v9;
  CGRect *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;

  v5 = a2;
  objc_msgSend(v5, "frame");
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v5, "alignmentRectForFrame:");
    v7 = v8;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v9 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
    v17.origin.x = v9[1].origin.x;
    v17.origin.y = v9[1].origin.y;
    ++v9;
    v17.size.width = v9->size.width;
    v17.size.height = v9->size.height;
    CGRectDivide(v17, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v9, 12.0, *(CGRectEdge *)(a1 + 68));
  }
  v10 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  v18.origin.x = v10[1].origin.x;
  v18.origin.y = v10[1].origin.y;
  ++v10;
  v18.size.width = v10->size.width;
  v18.size.height = v10->size.height;
  CGRectDivide(v18, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v10, v7, *(CGRectEdge *)(a1 + 68));
  PKSizeAlignedInRect();
  v15 = v11;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = fmax(v12 + v14, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 24));
  if (a3)
    objc_msgSend(v5, "frameForAlignmentRect:", v11, v12, v13, v14);
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(v5, "setFrame:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

  return v15;
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  _BOOL8 v5;
  BOOL v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v9;
  void *v10;
  UIActivityIndicatorView *v11;
  void *v12;
  uint64_t v13;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *v15;
  _QWORD v16[4];
  UIActivityIndicatorView *v17;
  BOOL v18;
  _QWORD v19[4];
  UIActivityIndicatorView *v20;
  BOOL v21;

  if (self->_showActivityIndicator != a3)
  {
    self->_showActivityIndicator = a3;
    v5 = !a3;
    if (self->_activityIndicator)
      v6 = 1;
    else
      v6 = !a3;
    if (!v6)
    {
      v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      activityIndicator = self->_activityIndicator;
      self->_activityIndicator = v7;

      v9 = self->_activityIndicator;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](v9, "setColor:", v10);

      -[UIActivityIndicatorView setAlpha:](self->_activityIndicator, "setAlpha:", 0.0);
      -[UIView addSubview:](self->_headerContainer, "addSubview:", self->_activityIndicator);
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
      -[PKGSVWalletHeaderView setNeedsLayout](self, "setNeedsLayout");
      -[PKGSVWalletHeaderView layoutIfNeeded](self, "layoutIfNeeded");
    }
    -[PKContinuousButton setEnabled:](self->_actionButton, "setEnabled:", v5);
    v11 = self->_activityIndicator;
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke;
    v19[3] = &unk_1E3E64C10;
    v20 = v11;
    v21 = a3;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke_2;
    v16[3] = &unk_1E3E65288;
    v18 = a3;
    v14 = v20;
    v17 = v14;
    objc_msgSend(v12, "pkui_animateUsingOptions:animations:completion:", 6, v19, v16);
    v15 = self->_activityIndicator;
    if (v15)
    {
      if (!a3)
      {
        self->_activityIndicator = 0;

      }
    }

  }
}

uint64_t __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "stopAnimating");
    return objc_msgSend(*(id *)(v1 + 32), "removeFromSuperview");
  }
  return result;
}

void __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKGSVWalletHeaderView _setSizeMayChange]((uint64_t)WeakRetained);

}

uint64_t __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)addTapped
{
  _BOOL4 v3;
  id WeakRetained;
  id v5;

  v3 = PKUIStoreDemoGatewayWithView(self);
  if (self && v3 && self->_passType <= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "presentPaymentSetupForHeaderView:", self);
      WeakRetained = v5;
    }

  }
}

- (void)ordersTapped
{
  _BOOL4 v3;
  id WeakRetained;
  id v5;

  v3 = PKUIStoreDemoGatewayWithView(self);
  if (self && v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "presentOrderManagementForHeaderView:", self);
      WeakRetained = v5;
    }

  }
}

- (void)inboxTapped
{
  _BOOL4 v3;
  id WeakRetained;
  id v5;

  v3 = PKUIStoreDemoGatewayWithView(self);
  if (self && v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "presentInvitationsForHeaderView:", self);
      WeakRetained = v5;
    }

  }
}

- (id)leadingViewsForInterstitialController:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_titleView)
  {
    v5[0] = self->_titleView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)trailingViewsForInterstitialController:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *badgedInboxButton;

  if (self->_showActivityIndicator)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = v5;
    if (self->_actionButton)
      objc_msgSend(v5, "addObject:");
    if (self->_orderManagementButton)
      objc_msgSend(v6, "addObject:");
    if (self->_inboxButton)
    {
      if (self->_badgedInboxButton)
        badgedInboxButton = self->_badgedInboxButton;
      else
        badgedInboxButton = self->_inboxButton;
      objc_msgSend(v6, "addObject:", badgedInboxButton);
    }
    if (objc_msgSend(v6, "count"))
      v3 = (void *)objc_msgSend(v6, "copy");
    else
      v3 = (void *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)interstitialProvider
{
  if (self->_titleView
    || !self->_showActivityIndicator && (self->_actionButton || self->_orderManagementButton || self->_inboxButton))
  {
    return self;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)passType
{
  return self->_passType;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundProvisioningHintView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_orderManagementButton, 0);
  objc_storeStrong((id *)&self->_badgedInboxButton, 0);
  objc_storeStrong((id *)&self->_inboxButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_environmentLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_headerContainer, 0);
  objc_storeStrong((id *)&self->_orderImage, 0);
  objc_storeStrong((id *)&self->_inboxImage, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_templateActionImage, 0);
}

@end
