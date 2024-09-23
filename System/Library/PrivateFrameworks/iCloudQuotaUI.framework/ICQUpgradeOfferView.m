@implementation ICQUpgradeOfferView

- (UIFont)titleFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x24BEBE210], 32770);
}

- (UIFont)messageFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x24BEBE1D0], 0);
}

- (UIFont)purchaseButtonFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x24BEBE200], 0x8000);
}

- (UIFont)linkButtonFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x24BEBE1D0], 0x8000);
}

- (UIFont)fineprintFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x24BEBE1E8], 0);
}

- (id)defaultButtonColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
}

- (UIColor)fineprintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

- (id)messageTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

- (int64_t)_styleOfView:(id)a3
{
  _ICQTextView *v4;
  int64_t v5;

  v4 = (_ICQTextView *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[_ICQTextView buttonType](v4, "buttonType") == 1)
      v5 = 3;
    else
      v5 = 2;
  }
  else
  {
    v5 = self->_fineprintView == v4;
  }

  return v5;
}

- (id)_anchorForUpperView:(id)a3
{
  UIView *v4;
  UIView *v5;
  uint64_t v6;
  void *v7;

  v4 = (UIView *)a3;
  v5 = v4;
  if (self->_trayView == v4)
  {
    -[UIView topAnchor](v4, "topAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", v4) == 3
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[UIView lastBaselineAnchor](v5, "lastBaselineAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIView bottomAnchor](v5, "bottomAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_anchorForLowerView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (-[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", v4) == 3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "firstBaselineAnchor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "topAnchor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (double)_spacingFromUpperView:(id)a3 toLowerView:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  double v9;
  void *v10;
  double v11;

  v6 = a4;
  v7 = -[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", a3);
  v8 = -[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", v6);

  v9 = kViewStyleSpacing[4 * v7 + v8];
  if (v9 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scaledValueForValue:", -v9);
    v9 = v11;

  }
  return v9;
}

- (double)_marginForButton:(id)a3
{
  -[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", a3);
  return 24.0;
}

- (id)_buttons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  -[ICQUpgradeOfferView upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purchaseLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[ICQUpgradeOfferView upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchase2Link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  -[ICQUpgradeOfferView upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomLink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6)
    objc_msgSend(v15, "addObject:", self->_purchaseButton);
  if (v10)
    objc_msgSend(v16, "addObject:", self->_purchase2Button);
  if (v14)
    objc_msgSend(v16, "addObject:", self->_bottomButton);
  v17 = (void *)objc_msgSend(v16, "copy");

  return v17;
}

- (id)_makePurchaseButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICQUpgradeOfferView purchaseButtonFont](self, "purchaseButtonFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v3, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(v3, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 0);

  objc_msgSend(v3, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 1);

  objc_msgSend(v3, "titleColorForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v10, 1);
  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(v3, "_setCornerRadius:", 14.0);

  return v3;
}

- (id)_makeLinkButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICQUpgradeOfferView linkButtonFont](self, "linkButtonFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v3, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(v3, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 0);

  objc_msgSend(v3, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 1);

  return v3;
}

- (ICQUpgradeOfferView)initWithFrame:(CGRect)a3
{
  ICQUpgradeOfferView *v3;
  void *v4;
  UILayoutGuide *v5;
  UILayoutGuide *scrollVisibleLayoutGuide;
  UILayoutGuide *v7;
  UILayoutGuide *aboveSpinnerLayoutGuide;
  UILayoutGuide *v9;
  UILayoutGuide *belowSpinnerLayoutGuide;
  NSArray *v11;
  NSArray *activeConstraints;
  uint64_t v13;
  UIImageView *iconView;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  UILabel *titleLabel;
  void *v22;
  _ICQTextView *v23;
  _ICQTextView *messageView;
  void *v25;
  void *v26;
  uint64_t v27;
  UIButton *purchaseButton;
  uint64_t v29;
  UIButton *purchase2Button;
  uint64_t v31;
  UIButton *bottomButton;
  uint64_t v33;
  UIActivityIndicatorView *spinner;
  _ICQTextView *v35;
  _ICQTextView *fineprintView;
  void *v37;
  void *v38;
  void *v39;
  UIScrollView *v40;
  UIScrollView *scrollView;
  UIView *v42;
  UIView *headerView;
  UIView *v44;
  UIView *footerView;
  UIView *v46;
  UIView *contentView;
  UIView *v48;
  UIView *trayView;
  void *v50;
  uint64_t v51;
  UIVisualEffectView *blurBackdrop;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)ICQUpgradeOfferView;
  v3 = -[ICQUpgradeOfferView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BEBD718]);
    scrollVisibleLayoutGuide = v3->_scrollVisibleLayoutGuide;
    v3->_scrollVisibleLayoutGuide = v5;

    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BEBD718]);
    aboveSpinnerLayoutGuide = v3->_aboveSpinnerLayoutGuide;
    v3->_aboveSpinnerLayoutGuide = v7;

    v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BEBD718]);
    belowSpinnerLayoutGuide = v3->_belowSpinnerLayoutGuide;
    v3->_belowSpinnerLayoutGuide = v9;

    v11 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeConstraints = v3->_activeConstraints;
    v3->_activeConstraints = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v3->_iconView, "setHidden:", 1);
    v15 = objc_alloc(MEMORY[0x24BEBD708]);
    v16 = *MEMORY[0x24BDBF090];
    v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x24BDBF090], v17, v18, v19);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICQUpgradeOfferView titleFont](v3, "titleFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v22);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v23 = -[_ICQTextView initWithFrame:]([_ICQTextView alloc], "initWithFrame:", v16, v17, v18, v19);
    messageView = v3->_messageView;
    v3->_messageView = v23;

    -[_ICQTextView setTranslatesAutoresizingMaskIntoConstraints:](v3->_messageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICQUpgradeOfferView messageFont](v3, "messageFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setFont:](v3->_messageView, "setFont:", v25);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setBackgroundColor:](v3->_messageView, "setBackgroundColor:", v26);

    -[_ICQTextView setDelegate:](v3->_messageView, "setDelegate:", v3);
    -[ICQUpgradeOfferView _makePurchaseButton](v3, "_makePurchaseButton");
    v27 = objc_claimAutoreleasedReturnValue();
    purchaseButton = v3->_purchaseButton;
    v3->_purchaseButton = (UIButton *)v27;

    -[UIButton addTarget:action:forControlEvents:](v3->_purchaseButton, "addTarget:action:forControlEvents:", v3, sel_purchaseButtonTapped_, 0x2000);
    -[ICQUpgradeOfferView _makeLinkButton](v3, "_makeLinkButton");
    v29 = objc_claimAutoreleasedReturnValue();
    purchase2Button = v3->_purchase2Button;
    v3->_purchase2Button = (UIButton *)v29;

    -[UIButton addTarget:action:forControlEvents:](v3->_purchase2Button, "addTarget:action:forControlEvents:", v3, sel_purchase2ButtonTapped_, 0x2000);
    -[ICQUpgradeOfferView _makeLinkButton](v3, "_makeLinkButton");
    v31 = objc_claimAutoreleasedReturnValue();
    bottomButton = v3->_bottomButton;
    v3->_bottomButton = (UIButton *)v31;

    -[UIButton addTarget:action:forControlEvents:](v3->_bottomButton, "addTarget:action:forControlEvents:", v3, sel_bottomButtonTapped_, 0x2000);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v33;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidden:](v3->_spinner, "setHidden:", 1);
    v35 = -[_ICQTextView initWithFrame:]([_ICQTextView alloc], "initWithFrame:", v16, v17, v18, v19);
    fineprintView = v3->_fineprintView;
    v3->_fineprintView = v35;

    -[_ICQTextView setTranslatesAutoresizingMaskIntoConstraints:](v3->_fineprintView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICQUpgradeOfferView fineprintFont](v3, "fineprintFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setFont:](v3->_fineprintView, "setFont:", v37);

    -[ICQUpgradeOfferView fineprintColor](v3, "fineprintColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setTextColor:](v3->_fineprintView, "setTextColor:", v38);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setBackgroundColor:](v3->_fineprintView, "setBackgroundColor:", v39);

    -[_ICQTextView setDelegate:](v3->_fineprintView, "setDelegate:", v3);
    -[ICQUpgradeOfferView _setButtonTintColor:](v3, "_setButtonTintColor:", 0);
    v40 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v40;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v3->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setAlwaysBounceVertical:](v3->_scrollView, "setAlwaysBounceVertical:", 1);
    -[UIScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
    v42 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    headerView = v3->_headerView;
    v3->_headerView = v42;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v44 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    footerView = v3->_footerView;
    v3->_footerView = v44;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v46 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    contentView = v3->_contentView;
    v3->_contentView = v46;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v48 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    trayView = v3->_trayView;
    v3->_trayView = v48;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_trayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1100);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v50);
    blurBackdrop = v3->_blurBackdrop;
    v3->_blurBackdrop = (UIVisualEffectView *)v51;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_blurBackdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_headerView);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_iconView);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_titleLabel);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_messageView);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_footerView);
    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_contentView);
    -[ICQUpgradeOfferView addSubview:](v3, "addSubview:", v3->_scrollView);
    -[ICQUpgradeOfferView addSubview:](v3, "addSubview:", v3->_blurBackdrop);
    -[UIView addSubview:](v3->_trayView, "addSubview:", v3->_purchaseButton);
    -[UIView addSubview:](v3->_trayView, "addSubview:", v3->_purchase2Button);
    -[UIView addSubview:](v3->_trayView, "addSubview:", v3->_bottomButton);
    -[UIView addSubview:](v3->_trayView, "addSubview:", v3->_fineprintView);
    -[UIView addLayoutGuide:](v3->_trayView, "addLayoutGuide:", v3->_aboveSpinnerLayoutGuide);
    -[UIView addLayoutGuide:](v3->_trayView, "addLayoutGuide:", v3->_belowSpinnerLayoutGuide);
    -[UIView addSubview:](v3->_trayView, "addSubview:", v3->_spinner);
    -[ICQUpgradeOfferView addSubview:](v3, "addSubview:", v3->_trayView);
    -[ICQUpgradeOfferView addLayoutGuide:](v3, "addLayoutGuide:", v3->_scrollVisibleLayoutGuide);

  }
  return v3;
}

- (void)_setButton:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _PointImageOfColor(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBackgroundImage:forState:", v7, 0);
  _PointImageOfColor(v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundImage:forState:", v8, 1);

}

- (void)_setLinkTextColor:(id)a3
{
  _ICQTextView *messageView;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  messageView = self->_messageView;
  v5 = a3;
  -[_ICQTextView linkTextAttributes](messageView, "linkTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = *MEMORY[0x24BEBB368];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEBB368]);
  v9 = (void *)objc_msgSend(v7, "copy");
  -[_ICQTextView setLinkTextAttributes:](self->_messageView, "setLinkTextAttributes:", v9);

  -[_ICQTextView linkTextAttributes](self->_fineprintView, "linkTextAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, v8);
  v11 = (void *)objc_msgSend(v12, "copy");
  -[_ICQTextView setLinkTextAttributes:](self->_fineprintView, "setLinkTextAttributes:", v11);

}

- (void)_setButtonTintColor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_buttonTintColor, a3);
  if (!v5)
  {
    -[ICQUpgradeOfferView defaultButtonColor](self, "defaultButtonColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICQUpgradeOfferView _buttons](self, "_buttons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setTintColor:", v5);
        if (-[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", v11) == 2)
          -[ICQUpgradeOfferView _setButton:backgroundColor:](self, "_setButton:backgroundColor:", v11, v5);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[ICQUpgradeOfferView _setLinkTextColor:](self, "_setLinkTextColor:", v5);
}

- (void)setButtonTintColor:(id)a3
{
  unint64_t v4;
  UIColor *buttonTintColor;
  char v6;
  id v7;

  v4 = (unint64_t)a3;
  buttonTintColor = self->_buttonTintColor;
  if (v4 | (unint64_t)buttonTintColor)
  {
    v7 = (id)v4;
    v6 = -[UIColor isEqual:](buttonTintColor, "isEqual:", v4);
    v4 = (unint64_t)v7;
    if ((v6 & 1) == 0)
    {
      -[ICQUpgradeOfferView _setButtonTintColor:](self, "_setButtonTintColor:", v7);
      v4 = (unint64_t)v7;
    }
  }

}

- (void)purchaseButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQUpgradeOfferView main button tapped", (uint8_t *)&v20, 2u);
  }

  -[ICQUpgradeOfferView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUpgradeOfferView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeOfferView purchaseLink](self, "purchaseLink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "action");
      _ICQStringForAction();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeOfferView purchaseLink](self, "purchaseLink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v20, 0x20u);

    }
    -[ICQUpgradeOfferView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView purchaseLink](self, "purchaseLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "action");
    -[ICQUpgradeOfferView purchaseLink](self, "purchaseLink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sender:action:parameters:", self, v17, v19);

  }
}

- (void)purchase2ButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQUpgradeOfferView second button tapped", (uint8_t *)&v20, 2u);
  }

  -[ICQUpgradeOfferView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUpgradeOfferView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeOfferView purchase2Link](self, "purchase2Link");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "action");
      _ICQStringForAction();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeOfferView purchase2Link](self, "purchase2Link");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v20, 0x20u);

    }
    -[ICQUpgradeOfferView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView purchase2Link](self, "purchase2Link");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "action");
    -[ICQUpgradeOfferView purchase2Link](self, "purchase2Link");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sender:action:parameters:", self, v17, v19);

  }
}

- (void)bottomButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQUpgradeOfferView bottom button tapped", (uint8_t *)&v20, 2u);
  }

  -[ICQUpgradeOfferView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUpgradeOfferView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeOfferView bottomLink](self, "bottomLink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "action");
      _ICQStringForAction();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeOfferView bottomLink](self, "bottomLink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v20, 0x20u);

    }
    -[ICQUpgradeOfferView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView bottomLink](self, "bottomLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "action");
    -[ICQUpgradeOfferView bottomLink](self, "bottomLink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sender:action:parameters:", self, v17, v19);

  }
}

- (id)messageParagraphStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v2, "scaledValueForValue:", 8.0);
  objc_msgSend(v4, "setParagraphSpacing:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)messageAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BEBB360];
  -[ICQUpgradeOfferView messageFont](self, "messageFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x24BEBB368];
  -[ICQUpgradeOfferView messageTextColor](self, "messageTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = *MEMORY[0x24BEBB3A8];
  -[ICQUpgradeOfferView messageParagraphStyle](self, "messageParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fineprintParagraphStyle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setAlignment:", 1);
  objc_msgSend(v3, "setLineSpacing:", 0.0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)fineprintAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BEBB360];
  -[ICQUpgradeOfferView fineprintFont](self, "fineprintFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x24BEBB368];
  -[ICQUpgradeOfferView fineprintColor](self, "fineprintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = *MEMORY[0x24BEBB3A8];
  -[ICQUpgradeOfferView fineprintParagraphStyle](self, "fineprintParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_ICQUpgradeOfferPageSpecification)upgradeOfferPageSpecification
{
  return self->_upgradeOfferPageSpecification;
}

- (id)_imageForGenericCloud
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("iCloudImage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "_applicationIconImageForFormat:precomposed:scale:", 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_imageForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;

  v4 = a3;
  if (!objc_msgSend(v4, "length")
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.iCloudDriveApp")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.__mobilebackup__")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {
    -[ICQUpgradeOfferView _imageForGenericCloud](self, "_imageForGenericCloud");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    objc_msgSend(v7, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setUpgradeOfferPageSpecification:(id)a3
{
  _ICQUpgradeOfferPageSpecification *v5;
  _ICQUpgradeOfferPageSpecification **p_upgradeOfferPageSpecification;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *iconView;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _ICQUpgradeOfferPageSpecification *v22;
  void *v23;
  ICQLink *v24;
  ICQLink *purchaseLink;
  ICQLink *v26;
  ICQLink *purchase2Link;
  ICQLink *v28;
  ICQLink *bottomLink;
  UIButton *purchaseButton;
  void *v31;
  UIButton *purchase2Button;
  void *v33;
  UIButton *bottomButton;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = (_ICQUpgradeOfferPageSpecification *)a3;
  p_upgradeOfferPageSpecification = &self->_upgradeOfferPageSpecification;
  if (self->_upgradeOfferPageSpecification != v5)
  {
    objc_storeStrong((id *)&self->_upgradeOfferPageSpecification, a3);
    -[_ICQUpgradeOfferPageSpecification iconBundleIdentifier](v5, "iconBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView _imageForBundleIdentifier:](self, "_imageForBundleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_iconView, "setImage:", v8);

    -[UIImageView image](self->_iconView, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      iconView = self->_iconView;
      v11 = 0;
    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[_ICQUpgradeOfferPageSpecification iconBundleIdentifier](v5, "iconBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412290;
        v41 = v13;
        _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "no image available for bundle id %@", (uint8_t *)&v40, 0xCu);

      }
      iconView = self->_iconView;
      v11 = 1;
    }
    -[UIImageView setHidden:](iconView, "setHidden:", v11);
    -[_ICQUpgradeOfferPageSpecification title](v5, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v14);

    -[ICQUpgradeOfferView messageAttributes](self, "messageAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setAttributes:](self->_messageView, "setAttributes:", v15);

    v16 = (void *)MEMORY[0x24BEC7300];
    -[_ICQUpgradeOfferPageSpecification message](*p_upgradeOfferPageSpecification, "message");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification altMessage](*p_upgradeOfferPageSpecification, "altMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithPlaceholderFormat:alternateString:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setFormat:](self->_messageView, "setFormat:", v19);

    -[_ICQTextView format](self->_messageView, "format");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification altMessage](*p_upgradeOfferPageSpecification, "altMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v20, "isEqualToString:", v21);

    v22 = *p_upgradeOfferPageSpecification;
    if ((_DWORD)v18)
      -[_ICQUpgradeOfferPageSpecification altMessageLinks](v22, "altMessageLinks");
    else
      -[_ICQUpgradeOfferPageSpecification messageLinks](v22, "messageLinks");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setLinks:](self->_messageView, "setLinks:", v23);

    -[_ICQTextView setAttributedText](self->_messageView, "setAttributedText");
    -[_ICQTextView layoutIfNeeded](self->_messageView, "layoutIfNeeded");
    -[_ICQUpgradeOfferPageSpecification purchaseLink](v5, "purchaseLink");
    v24 = (ICQLink *)objc_claimAutoreleasedReturnValue();
    purchaseLink = self->_purchaseLink;
    self->_purchaseLink = v24;

    -[_ICQUpgradeOfferPageSpecification purchase2Link](v5, "purchase2Link");
    v26 = (ICQLink *)objc_claimAutoreleasedReturnValue();
    purchase2Link = self->_purchase2Link;
    self->_purchase2Link = v26;

    -[_ICQUpgradeOfferPageSpecification bottomLink](v5, "bottomLink");
    v28 = (ICQLink *)objc_claimAutoreleasedReturnValue();
    bottomLink = self->_bottomLink;
    self->_bottomLink = v28;

    purchaseButton = self->_purchaseButton;
    -[ICQLink text](self->_purchaseLink, "text");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](purchaseButton, "setTitle:forState:", v31, 0);

    purchase2Button = self->_purchase2Button;
    -[ICQLink text](self->_purchase2Link, "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](purchase2Button, "setTitle:forState:", v33, 0);

    bottomButton = self->_bottomButton;
    -[ICQLink text](self->_bottomLink, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](bottomButton, "setTitle:forState:", v35, 0);

    -[ICQUpgradeOfferView fineprintAttributes](self, "fineprintAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setAttributes:](self->_fineprintView, "setAttributes:", v36);

    -[_ICQUpgradeOfferPageSpecification fineprintFormat](*p_upgradeOfferPageSpecification, "fineprintFormat");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setFormat:](self->_fineprintView, "setFormat:", v37);

    -[_ICQUpgradeOfferPageSpecification fineprintLinks](*p_upgradeOfferPageSpecification, "fineprintLinks");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setLinks:](self->_fineprintView, "setLinks:", v38);

    -[_ICQTextView setAttributedText](self->_fineprintView, "setAttributedText");
    -[_ICQTextView layoutIfNeeded](self->_fineprintView, "layoutIfNeeded");
    -[ICQUpgradeOfferView buttonTintColor](self, "buttonTintColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView _setButtonTintColor:](self, "_setButtonTintColor:", v39);

    -[ICQUpgradeOfferView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setUpgradeMode:(int64_t)a3
{
  if (self->_upgradeMode != a3)
  {
    self->_upgradeMode = a3;
    if (a3 == 1)
    {
      -[UIButton setHidden:](self->_purchaseButton, "setHidden:");
      -[UIButton setHidden:](self->_purchase2Button, "setHidden:", 1);
      -[UIButton setHidden:](self->_bottomButton, "setHidden:", 1);
      -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 0);
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    else if (!a3)
    {
      -[UIButton setHidden:](self->_purchaseButton, "setHidden:");
      -[UIButton setHidden:](self->_purchase2Button, "setHidden:", 0);
      -[UIButton setHidden:](self->_bottomButton, "setHidden:", 0);
      -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    }
    -[ICQUpgradeOfferView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (id)horizontalConstraintsForView:(id)a3 margin:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "isHidden") & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v6, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v21;
    objc_msgSend(v6, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView readableContentGuide](self, "readableContentGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    objc_msgSend(v6, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v11;
    objc_msgSend(v6, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:constant:", v14, -a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_constraintsForView:(id)a3 equalToView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(v6, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(v6, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)updateConstraints
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  UIView *p_super;
  void *v73;
  void *v74;
  void *v75;
  _ICQTextView *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  UIView *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSArray *v131;
  NSArray *activeConstraints;
  uint64_t v133;
  void *v134;
  char v135;
  uint64_t v136;
  objc_super v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_activeConstraints);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIImageView isHidden](self->_iconView, "isHidden");
  -[ICQUpgradeOfferView _constraintsForView:equalToView:](self, "_constraintsForView:equalToView:", self->_scrollView, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[ICQUpgradeOfferView _constraintsForView:equalToView:](self, "_constraintsForView:equalToView:", self->_blurBackdrop, self->_trayView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[UIView centerXAnchor](self->_trayView, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeOfferView centerXAnchor](self, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[UIView widthAnchor](self->_trayView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeOfferView widthAnchor](self, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[UIView bottomAnchor](self->_trayView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeOfferView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView centerXAnchor](self->_scrollView, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v135 = v4;
  if ((v4 & 1) == 0)
  {
    -[UIImageView centerXAnchor](self->_iconView, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  -[ICQUpgradeOfferView horizontalConstraintsForView:margin:](self, "horizontalConstraintsForView:margin:", self->_titleLabel, 24.0, 448);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v25);

  -[ICQUpgradeOfferView horizontalConstraintsForView:margin:](self, "horizontalConstraintsForView:margin:", self->_messageView, 24.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v26);

  -[ICQUpgradeOfferView horizontalConstraintsForView:margin:](self, "horizontalConstraintsForView:margin:", self->_fineprintView, 24.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v27);

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  -[ICQUpgradeOfferView _buttons](self, "_buttons");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v143;
    v32 = *MEMORY[0x24BEBE590];
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v143 != v31)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
        -[ICQUpgradeOfferView _marginForButton:](self, "_marginForButton:", v34);
        -[ICQUpgradeOfferView horizontalConstraintsForView:margin:](self, "horizontalConstraintsForView:margin:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v35);

        objc_msgSend(v34, "widthAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintEqualToConstant:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v37);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
    }
    while (v30);
  }

  -[UILayoutGuide topAnchor](self->_scrollVisibleLayoutGuide, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeOfferView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  -[UILayoutGuide bottomAnchor](self->_scrollVisibleLayoutGuide, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_trayView, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v44);

  -[UIView heightAnchor](self->_contentView, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide heightAnchor](self->_scrollVisibleLayoutGuide, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v47);

  -[UIView topAnchor](self->_headerView, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v50);

  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v53);

  -[UIView heightAnchor](self->_headerView, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_footerView, "heightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v56);

  if ((v135 & 1) != 0)
  {
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_headerView, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 36.0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v133), "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_headerView, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 12.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v62);

    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v133), "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 20.0;
  }
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v63);

  -[_ICQTextView topAnchor](self->_messageView, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 15.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v66);

  -[UIView topAnchor](self->_footerView, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView bottomAnchor](self->_messageView, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, 15.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v69);

  -[_ICQTextView text](self->_fineprintView, "text");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "length");

  p_super = self->_trayView;
  if (v71)
  {
    -[_ICQTextView topAnchor](self->_fineprintView, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_trayView, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, 11.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v75);

    v76 = self->_fineprintView;
    p_super = &v76->super.super.super;
  }
  -[ICQUpgradeOfferView _buttons](self, "_buttons");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v138, v146, 16);
  v134 = v77;
  if (v78)
  {
    v79 = v78;
    v136 = *(_QWORD *)v139;
    do
    {
      v80 = 0;
      v81 = p_super;
      do
      {
        if (*(_QWORD *)v139 != v136)
          objc_enumerationMutation(v77);
        v82 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v80);
        -[ICQUpgradeOfferView _anchorForLowerView:](self, "_anchorForLowerView:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUpgradeOfferView _anchorForUpperView:](self, "_anchorForUpperView:", v81);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUpgradeOfferView _spacingFromUpperView:toLowerView:](self, "_spacingFromUpperView:toLowerView:", v81, v82);
        objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v85);

        if (-[ICQUpgradeOfferView _styleOfView:](self, "_styleOfView:", v82) == 2)
        {
          objc_msgSend(v82, "heightAnchor");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "constraintGreaterThanOrEqualToConstant:", 50.0);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v87);

          objc_msgSend(v82, "titleLabel");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "topAnchor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "topAnchor");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:constant:", v90, 14.0);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v91);

          objc_msgSend(v82, "bottomAnchor");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "titleLabel");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "bottomAnchor");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "constraintGreaterThanOrEqualToAnchor:constant:", v94, 14.0);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v95);

          objc_msgSend(v82, "titleLabel");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "leftAnchor");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "leftAnchor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "constraintGreaterThanOrEqualToAnchor:constant:", v98, 16.0);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v99);

          objc_msgSend(v82, "rightAnchor");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "titleLabel");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "rightAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "constraintGreaterThanOrEqualToAnchor:constant:", v102, 16.0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v103);

          v77 = v134;
        }
        p_super = v82;

        ++v80;
        v81 = p_super;
      }
      while (v79 != v80);
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v138, v146, 16);
    }
    while (v79);
  }
  if (p_super != self->_trayView)
  {
    -[ICQUpgradeOfferView _spacingFromUpperView:toLowerView:](self, "_spacingFromUpperView:toLowerView:", p_super);
    v105 = v104;
    -[ICQUpgradeOfferView safeAreaInsets](self, "safeAreaInsets");
    v107 = v105 + v106;
    -[UIView bottomAnchor](self->_trayView, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView _anchorForUpperView:](self, "_anchorForUpperView:", p_super);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, v107);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v110);

  }
  if ((-[UIActivityIndicatorView isHidden](self->_spinner, "isHidden") & 1) == 0 && objc_msgSend(v77, "count"))
  {
    -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_trayView, "centerXAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v113);

    -[UILayoutGuide topAnchor](self->_aboveSpinnerLayoutGuide, "topAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "firstObject");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "topAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v117);

    -[UILayoutGuide bottomAnchor](self->_aboveSpinnerLayoutGuide, "bottomAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView topAnchor](self->_spinner, "topAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v120);

    -[UILayoutGuide topAnchor](self->_belowSpinnerLayoutGuide, "topAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView bottomAnchor](self->_spinner, "bottomAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v123);

    -[UILayoutGuide bottomAnchor](self->_belowSpinnerLayoutGuide, "bottomAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "lastObject");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeOfferView _anchorForUpperView:](self, "_anchorForUpperView:", v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v127);

    -[UILayoutGuide heightAnchor](self->_aboveSpinnerLayoutGuide, "heightAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v134;
    -[UILayoutGuide heightAnchor](self->_belowSpinnerLayoutGuide, "heightAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v130);

  }
  v131 = (NSArray *)objc_msgSend(v3, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v131;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_activeConstraints);
  v137.receiver = self;
  v137.super_class = (Class)ICQUpgradeOfferView;
  -[ICQUpgradeOfferView updateConstraints](&v137, sel_updateConstraints);

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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICQUpgradeOfferView;
  -[ICQUpgradeOfferView layoutSubviews](&v19, sel_layoutSubviews);
  -[UIView frame](self->_contentView, "frame");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v3, v4);
  -[UIScrollView scrollIndicatorInsets](self->_scrollView, "scrollIndicatorInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_trayView, "frame");
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v6, v8, v11, v10);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView frame](self->_trayView, "frame");
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v13, v15, v18, v17);
  -[ICQUpgradeOfferView _updateTrayVisibility](self, "_updateTrayVisibility");
  -[ICQUpgradeOfferView flashScrollIndicatorsIfNeeded](self, "flashScrollIndicatorsIfNeeded");
}

- (void)flashScrollIndicatorsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v4 = v3;
  v6 = v5;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v8 = v7;
  -[UIScrollView frame](self->_scrollView, "frame");
  if (v8 > v9 - v6 - v4)
    -[UIScrollView flashScrollIndicators](self->_scrollView, "flashScrollIndicators");
}

- (void)_updateTrayVisibility
{
  UIScrollView *scrollView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxY;
  CGRect v13;
  CGRect v14;

  scrollView = self->_scrollView;
  -[UIView bounds](self->_trayView, "bounds");
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_trayView);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_ICQTextView frame](self->_messageView, "frame");
  MaxY = CGRectGetMaxY(v13);
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  -[UIVisualEffectView setHidden:](self->_blurBackdrop, "setHidden:", MaxY <= CGRectGetMinY(v14));
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  NSObject *v22;
  int v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "links");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "icqIndex");
    if (v9 > 0x7FFFFFFFFFFFFFFELL)
      goto LABEL_23;
    v10 = v9;
    if (v9 >= objc_msgSend(v8, "count"))
      goto LABEL_23;
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "action") != 6)
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "action");
        _ICQStringForAction();
        v16 = objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "tapped %@, but link action %@ unsupported in ICQTextView", (uint8_t *)&v24, 0x16u);

      }
      goto LABEL_22;
    }
    objc_msgSend(v11, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BEC71E8]);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
LABEL_19:
          _ICQGetLogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "text");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = objc_claimAutoreleasedReturnValue();
            v24 = 138412546;
            v25 = v20;
            v26 = 2112;
            v27 = v22;
            _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "tapped %@, but URL of wrong class %@", (uint8_t *)&v24, 0x16u);

          }
          goto LABEL_21;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
        v14 = v13;
      }
      _ICQGetLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v19;
        v26 = 2112;
        v27 = v14;
        _os_log_impl(&dword_21F2CC000, v18, OS_LOG_TYPE_DEFAULT, "tapped %@, opening URL %@", (uint8_t *)&v24, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "openURL:options:completionHandler:", v14, MEMORY[0x24BDBD1B8], &__block_literal_global_5);
    }
    else
    {
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v11, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v17;
      _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "tapped %@, but URL missing", (uint8_t *)&v24, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_24:

  return 0;
}

void __62__ICQUpgradeOfferView_textView_shouldInteractWithURL_inRange___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "openURL success:%d", (uint8_t *)v4, 8u);
  }

}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (int64_t)upgradeMode
{
  return self->_upgradeMode;
}

- (ICQPageDelegate)delegate
{
  return (ICQPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (_ICQTextView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_messageView, a3);
}

- (_ICQTextView)fineprintView
{
  return self->_fineprintView;
}

- (void)setFineprintView:(id)a3
{
  objc_storeStrong((id *)&self->_fineprintView, a3);
}

- (UIButton)purchaseButton
{
  return self->_purchaseButton;
}

- (void)setPurchaseButton:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseButton, a3);
}

- (UIButton)purchase2Button
{
  return self->_purchase2Button;
}

- (void)setPurchase2Button:(id)a3
{
  objc_storeStrong((id *)&self->_purchase2Button, a3);
}

- (UIButton)bottomButton
{
  return self->_bottomButton;
}

- (void)setBottomButton:(id)a3
{
  objc_storeStrong((id *)&self->_bottomButton, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (ICQLink)purchaseLink
{
  return self->_purchaseLink;
}

- (ICQLink)purchase2Link
{
  return self->_purchase2Link;
}

- (ICQLink)bottomLink
{
  return self->_bottomLink;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIView)trayView
{
  return self->_trayView;
}

- (UIVisualEffectView)blurBackdrop
{
  return self->_blurBackdrop;
}

- (UILayoutGuide)scrollVisibleLayoutGuide
{
  return self->_scrollVisibleLayoutGuide;
}

- (UILayoutGuide)aboveSpinnerLayoutGuide
{
  return self->_aboveSpinnerLayoutGuide;
}

- (UILayoutGuide)belowSpinnerLayoutGuide
{
  return self->_belowSpinnerLayoutGuide;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_belowSpinnerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_aboveSpinnerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_scrollVisibleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_blurBackdrop, 0);
  objc_storeStrong((id *)&self->_trayView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
  objc_storeStrong((id *)&self->_purchase2Link, 0);
  objc_storeStrong((id *)&self->_purchaseLink, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_bottomButton, 0);
  objc_storeStrong((id *)&self->_purchase2Button, 0);
  objc_storeStrong((id *)&self->_purchaseButton, 0);
  objc_storeStrong((id *)&self->_fineprintView, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_upgradeOfferPageSpecification, 0);
}

@end
