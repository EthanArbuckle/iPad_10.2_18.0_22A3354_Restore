@implementation SKUIAccountButtonsView

- (SKUIAccountButtonsView)initWithClientContext:(id)a3
{
  id v5;
  SKUIAccountButtonsView *v6;
  SKUIAccountButtonsView *v7;
  SKUIRoundedRectButton *v8;
  SKUIRoundedRectButton *appleIDButton;
  SKUIRoundedRectButton *v10;
  UIButton *redeemButton;
  UIButton *v12;
  void *v13;
  SKUIRoundedRectButton *v14;
  SKUIRoundedRectButton *giftingButton;
  SKUIRoundedRectButton *v16;
  void *v17;
  uint64_t v18;
  SKUILinkButton *ecommerceButton;
  void *v20;
  uint64_t v21;
  UIButton *termsAndConditionsButton;
  void *v23;
  objc_super v25;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAccountButtonsView initWithClientContext:].cold.1();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIAccountButtonsView;
  v6 = -[SKUIAccountButtonsView init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = objc_alloc_init(SKUIRoundedRectButton);
    appleIDButton = v7->_appleIDButton;
    v7->_appleIDButton = v8;

    -[SKUIAccountButtonsView addSubview:](v7, "addSubview:", v7->_appleIDButton);
    v10 = objc_alloc_init(SKUIRoundedRectButton);
    redeemButton = v7->_redeemButton;
    v7->_redeemButton = &v10->super;

    v12 = v7->_redeemButton;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("REDEEM_BUTTON"), CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_BUTTON"), 0, CFSTR("Redeem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

    -[SKUIAccountButtonsView addSubview:](v7, "addSubview:", v7->_redeemButton);
    v14 = objc_alloc_init(SKUIRoundedRectButton);
    giftingButton = v7->_giftingButton;
    v7->_giftingButton = v14;

    v16 = v7->_giftingButton;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("GIFT_BUTTON"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("GIFT_BUTTON"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRoundedRectButton setTitle:forState:](v16, "setTitle:forState:", v17, 0);

    v7->_giftingVisibilityHidden = 0;
    -[SKUIAccountButtonsView addSubview:](v7, "addSubview:", v7->_giftingButton);
    v18 = -[SKUIAccountButtonsView _newLinkButtonWithTitle:](v7, "_newLinkButtonWithTitle:", 0);
    ecommerceButton = v7->_ecommerceButton;
    v7->_ecommerceButton = (SKUILinkButton *)v18;

    v7->_ecommerceVisibilityHidden = 1;
    -[SKUIAccountButtonsView addSubview:](v7, "addSubview:", v7->_ecommerceButton);
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("TERMS_LINK"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("TERMS_LINK"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SKUIAccountButtonsView _newLinkButtonWithTitle:](v7, "_newLinkButtonWithTitle:", v20);
    termsAndConditionsButton = v7->_termsAndConditionsButton;
    v7->_termsAndConditionsButton = (UIButton *)v21;

    -[SKUIAccountButtonsView addSubview:](v7, "addSubview:", v7->_termsAndConditionsButton);
    -[SKUIAccountButtonsView _reloadFonts](v7, "_reloadFonts");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v7, sel__reloadFonts, *MEMORY[0x1E0DC48E8], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIAccountButtonsView;
  -[SKUIAccountButtonsView dealloc](&v4, sel_dealloc);
}

- (NSString)accountCredits
{
  return -[UILabel text](self->_accountCreditsLabel, "text");
}

- (NSString)ECommerceLinkTitle
{
  return (NSString *)-[SKUILinkButton titleForState:](self->_ecommerceButton, "titleForState:", 0);
}

- (void)setECommerceLinkTitle:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[SKUILinkButton titleForState:](self->_ecommerceButton, "titleForState:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    self->_ecommerceVisibilityHidden = v5 == 0;
    -[SKUILinkButton setTitle:forState:](self->_ecommerceButton, "setTitle:forState:");
    -[SKUIAccountButtonsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)isEcommerceHidden
{
  return self->_ecommerceVisibilityHidden
      || -[SKUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID");
}

- (BOOL)isGiftingHidden
{
  return self->_giftingVisibilityHidden
      || -[SKUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID");
}

- (BOOL)isTermsAndConditionsHidden
{
  return -[UIButton isHidden](self->_termsAndConditionsButton, "isHidden");
}

- (BOOL)isRedeemHidden
{
  return -[SKUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID");
}

- (void)setAccountCredits:(id)a3
{
  id v4;
  void *v5;
  UILabel *v6;
  UILabel *accountCreditsLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  SKUIClientContext *clientContext;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_accountCreditsLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v16;
  if (v4 != v16)
  {
    if (objc_msgSend(v16, "length"))
    {
      if (!self->_accountCreditsLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        accountCreditsLabel = self->_accountCreditsLabel;
        self->_accountCreditsLabel = v6;

        v8 = self->_accountCreditsLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_accountCreditsLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setLineBreakMode:](self->_accountCreditsLabel, "setLineBreakMode:", 3);
        -[UILabel setTextAlignment:](self->_accountCreditsLabel, "setTextAlignment:", 1);
        -[SKUIRoundedRectButton setSubtitleWithLabel:](self->_appleIDButton, "setSubtitleWithLabel:", self->_accountCreditsLabel);
      }
      clientContext = self->_clientContext;
      if (clientContext)
        -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACCOUNT_CREDITS"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACCOUNT_CREDITS"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_accountCreditsLabel;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v14, "setText:", v15);

      -[UILabel sizeToFit](self->_accountCreditsLabel, "sizeToFit");
      -[SKUIRoundedRectButton setNeedsLayout](self->_appleIDButton, "setNeedsLayout");
    }
    else
    {
      -[SKUIRoundedRectButton setSubtitleWithLabel:](self->_appleIDButton, "setSubtitleWithLabel:", 0);
      v13 = self->_accountCreditsLabel;
      self->_accountCreditsLabel = 0;
    }

    v5 = v16;
  }

}

- (void)setGiftingHidden:(BOOL)a3
{
  if (self->_giftingVisibilityHidden != a3)
  {
    self->_giftingVisibilityHidden = a3;
    -[SKUIAccountButtonsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTermsAndConditionsHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_termsAndConditionsButton, "setHidden:", a3);
}

- (void)layoutSubviews
{
  double v3;

  -[SKUIAccountButtonsView bounds](self, "bounds");
  if (v3 >= 696.0)
    -[SKUIAccountButtonsView _layoutOneRow](self, "_layoutOneRow");
  else
    -[SKUIAccountButtonsView _layoutTwoRows](self, "_layoutTwoRows");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[SKUIAccountButtonsView isEcommerceHidden](self, "isEcommerceHidden");
  v7 = !v6;
  v8 = -[UIButton isHidden](self->_termsAndConditionsButton, "isHidden");
  v9 = v8;
  v10 = 1;
  if (!v6)
    v10 = 2;
  if (!v8)
    v7 = v10;
  if (width >= 0.00000011920929)
  {
    if (width < 696.0)
      goto LABEL_7;
  }
  else if (SKUIUserInterfaceIdiom(self->_clientContext) != 1)
  {
LABEL_7:
    -[SKUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", width, height);
    v12 = v11 + 0.0;
    if (!-[SKUIAccountButtonsView isRedeemHidden](self, "isRedeemHidden"))
    {
      -[UIButton sizeThatFits:](self->_redeemButton, "sizeThatFits:", width, v12);
      v12 = v12 + v13 + 10.0;
    }
    if ((v9 & v6 & 1) != 0)
      v14 = 44.0;
    else
      v14 = (float)((float)v7 * 44.0);
    v17 = v12 + v14;
    goto LABEL_17;
  }
  -[SKUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", width, height);
  v16 = v15 + 0.0;
  v17 = v15 + 0.0 + 64.0;
  if ((v9 & v6) != 0)
    v17 = v16;
LABEL_17:
  v18 = width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  -[SKUIAccountButtonsView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton setTitleColor:forState:](self->_ecommerceButton, "setTitleColor:forState:", v3, 0);
  -[UIButton setTitleColor:forState:](self->_termsAndConditionsButton, "setTitleColor:forState:", v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIAccountButtonsView;
  -[SKUIAccountButtonsView tintColorDidChange](&v4, sel_tintColorDidChange);

}

- (void)_layoutOneRow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  double v32;
  float v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[SKUIAccountButtonsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = 30.0;
  if (v3 / 3.0 < 300.0)
    v7 = 15.0;
  v8 = v3 - v7 * 2.0 + -30.0;
  v9 = v8 / 3.0;
  v10 = floorf(v9);
  -[SKUIRoundedRectButton frame](self->_appleIDButton, "frame");
  -[SKUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", v4, v6);
  v12 = v11;
  -[UIButton frame](self->_redeemButton, "frame");
  -[UIButton sizeThatFits:](self->_redeemButton, "sizeThatFits:", v4, v6);
  v14 = v13;
  if (-[SKUIAccountButtonsView isGiftingHidden](self, "isGiftingHidden")
    && !-[SKUIAccountButtonsView isRedeemHidden](self, "isRedeemHidden"))
  {
    v22 = (v4 - (v10 * 2.0 + 15.0)) * 0.5;
    v20 = floorf(v22);
    v35.origin.y = 0.0;
    v35.origin.x = v20;
    v35.size.width = v10;
    v35.size.height = v12;
    v18 = CGRectGetMaxX(v35) + 15.0;
    v16 = v10;
  }
  else
  {
    v15 = v8 - v10 * 2.0;
    v16 = ceilf(v15);
    v17 = (v4 - v16) * 0.5;
    v18 = floorf(v17);
    if (-[SKUIAccountButtonsView isGiftingHidden](self, "isGiftingHidden"))
    {
      v34.origin.x = 15.0;
      v34.origin.y = 0.0;
      v34.size.width = v10;
      v34.size.height = v12;
      v19 = (v4 - CGRectGetWidth(v34)) * 0.5;
      v20 = floorf(v19);
    }
    else
    {
      -[SKUIRoundedRectButton frame](self->_giftingButton, "frame");
      -[SKUIRoundedRectButton sizeThatFits:](self->_giftingButton, "sizeThatFits:", v4, v6);
      -[SKUIRoundedRectButton setFrame:](self->_giftingButton, "setFrame:", v4 + -15.0 - v10, 0.0, v10, v21);
      v20 = 15.0;
    }
  }
  -[SKUIRoundedRectButton setHidden:](self->_giftingButton, "setHidden:", -[SKUIAccountButtonsView isGiftingHidden](self, "isGiftingHidden"));
  -[UIButton setHidden:](self->_redeemButton, "setHidden:", -[SKUIAccountButtonsView isRedeemHidden](self, "isRedeemHidden"));
  -[SKUIRoundedRectButton setFrame:](self->_appleIDButton, "setFrame:", v20, 0.0, v10, v12);
  -[UIButton setFrame:](self->_redeemButton, "setFrame:", v18, 0.0, v16, v14);
  v36.origin.y = 0.0;
  v36.origin.x = v20;
  v36.size.width = v10;
  v36.size.height = v12;
  v23 = CGRectGetMaxY(v36) + 20.0;
  -[UIButton frame](self->_termsAndConditionsButton, "frame");
  v24 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  -[UIButton sizeThatFits:](self->_termsAndConditionsButton, "sizeThatFits:", v24, v25);
  v27 = v26;
  *(float *)&v26 = (v4 - v26) * 0.5;
  v28 = floorf(*(float *)&v26);
  if (!-[SKUIAccountButtonsView isEcommerceHidden](self, "isEcommerceHidden"))
  {
    -[SKUILinkButton frame](self->_ecommerceButton, "frame");
    -[SKUILinkButton sizeThatFits:](self->_ecommerceButton, "sizeThatFits:", v24, v25);
    v30 = v29;
    if (-[UIButton isHidden](self->_termsAndConditionsButton, "isHidden"))
    {
      v31 = (v4 - v30) * 0.5;
      v32 = floorf(v31);
    }
    else
    {
      v33 = (v4 - (v27 + 40.0 + v30)) * 0.5;
      v28 = floorf(v33);
      v37.size.height = 44.0;
      v37.origin.x = v28;
      v37.origin.y = v23;
      v37.size.width = v27;
      v32 = CGRectGetMaxX(v37) + 40.0;
    }
    -[SKUILinkButton setFrame:](self->_ecommerceButton, "setFrame:", v32, v23, v30, 44.0);
  }
  -[SKUILinkButton setHidden:](self->_ecommerceButton, "setHidden:", -[SKUIAccountButtonsView isEcommerceHidden](self, "isEcommerceHidden"));
  -[UIButton setFrame:](self->_termsAndConditionsButton, "setFrame:", v28, v23, v27, 44.0);
}

- (void)_layoutTwoRows
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MaxY;
  char v18;
  uint64_t v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[SKUIAccountButtonsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 + -30.0;
  v8 = -[SKUIAccountButtonsView isGiftingHidden](self, "isGiftingHidden");
  v9 = floor((v7 + -10.0) * 0.5);
  if (v8)
    v10 = v7;
  else
    v10 = v9;
  -[UIButton frame](self->_redeemButton, "frame");
  -[UIButton sizeThatFits:](self->_redeemButton, "sizeThatFits:", v4, v6);
  v11 = 0.0;
  -[UIButton setFrame:](self->_redeemButton, "setFrame:", 15.0, 0.0, v10, v12);
  -[UIButton setHidden:](self->_redeemButton, "setHidden:", -[SKUIAccountButtonsView isRedeemHidden](self, "isRedeemHidden"));
  -[SKUIRoundedRectButton frame](self->_giftingButton, "frame");
  -[SKUIRoundedRectButton sizeThatFits:](self->_giftingButton, "sizeThatFits:", v4, v6);
  v14 = v13;
  -[SKUIRoundedRectButton setFrame:](self->_giftingButton, "setFrame:", v4 + -15.0 - v10, 0.0, v10, v13);
  -[SKUIRoundedRectButton setHidden:](self->_giftingButton, "setHidden:", -[SKUIAccountButtonsView isGiftingHidden](self, "isGiftingHidden"));
  if (!-[SKUIAccountButtonsView isRedeemHidden](self, "isRedeemHidden")
    || !-[SKUIAccountButtonsView isGiftingHidden](self, "isGiftingHidden"))
  {
    v25.origin.y = 0.0;
    v25.origin.x = v4 + -15.0 - v10;
    v25.size.width = v10;
    v25.size.height = v14;
    v11 = CGRectGetMaxY(v25) + 10.0;
  }
  -[SKUIRoundedRectButton frame](self->_appleIDButton, "frame");
  -[SKUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", v4, v6);
  v16 = v15;
  -[SKUIRoundedRectButton setFrame:](self->_appleIDButton, "setFrame:", 15.0, v11, v7, v15);
  v26.origin.x = 15.0;
  v26.origin.y = v11;
  v26.size.width = v7;
  v26.size.height = v16;
  MaxY = CGRectGetMaxY(v26);
  v18 = -[UIButton isHidden](self->_termsAndConditionsButton, "isHidden");
  v19 = MEMORY[0x1E0C9D5E0];
  if ((v18 & 1) == 0)
  {
    -[UIButton frame](self->_termsAndConditionsButton, "frame");
    -[UIButton sizeThatFits:](self->_termsAndConditionsButton, "sizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
    v21 = v20;
    *(float *)&v20 = (v4 - v20) * 0.5;
    v22 = floorf(*(float *)&v20);
    -[UIButton setFrame:](self->_termsAndConditionsButton, "setFrame:", v22, MaxY, v21, 44.0);
    v27.origin.x = v22;
    v27.origin.y = MaxY;
    v27.size.width = v21;
    v27.size.height = 44.0;
    MaxY = CGRectGetMaxY(v27);
  }
  if (!-[SKUIAccountButtonsView isEcommerceHidden](self, "isEcommerceHidden"))
  {
    -[SKUILinkButton frame](self->_ecommerceButton, "frame");
    -[SKUILinkButton sizeThatFits:](self->_ecommerceButton, "sizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
    v24 = v23;
    *(float *)&v23 = (v4 - v23) * 0.5;
    -[SKUILinkButton setFrame:](self->_ecommerceButton, "setFrame:", floorf(*(float *)&v23), MaxY, v24, 44.0);
  }
  -[SKUILinkButton setHidden:](self->_ecommerceButton, "setHidden:", -[SKUIAccountButtonsView isEcommerceHidden](self, "isEcommerceHidden"));
}

- (id)_newLinkButtonWithTitle:(id)a3
{
  id v4;
  SKUILinkButton *v5;
  void *v6;

  v4 = a3;
  v5 = -[SKUILinkButton initWithArrowStyle:]([SKUILinkButton alloc], "initWithArrowStyle:", 0);
  -[SKUILinkButton setTitle:forState:](v5, "setTitle:forState:", v4, 0);

  -[SKUIAccountButtonsView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton setTitleColor:forState:](v5, "setTitleColor:forState:", v6, 0);

  return v5;
}

- (void)_reloadFonts
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton titleLabel](self->_ecommerceButton, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[UIButton titleLabel](self->_termsAndConditionsButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (UIButton)appleIDButton
{
  return &self->_appleIDButton->super;
}

- (UIControl)ECommerceButton
{
  return &self->_ecommerceButton->super.super;
}

- (UIButton)giftingButton
{
  return &self->_giftingButton->super;
}

- (UIButton)redeemButton
{
  return self->_redeemButton;
}

- (UIButton)termsAndConditionsButton
{
  return self->_termsAndConditionsButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_usernameButton, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsButton, 0);
  objc_storeStrong((id *)&self->_giftingButton, 0);
  objc_storeStrong((id *)&self->_ecommerceButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_appleIDButton, 0);
  objc_storeStrong((id *)&self->_accountCreditsLabel, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAccountButtonsView initWithClientContext:]";
}

@end
