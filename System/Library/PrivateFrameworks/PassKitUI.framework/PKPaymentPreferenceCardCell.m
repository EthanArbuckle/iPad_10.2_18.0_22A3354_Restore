@implementation PKPaymentPreferenceCardCell

- (PKPaymentPreferenceCardCell)initWithReuseIdentifier:(id)a3
{
  PKPaymentPreferenceCardCell *v3;
  void *v4;
  uint64_t v5;
  UIColor *mainLabelColor;
  uint64_t v7;
  UIColor *subtitleLabelColor;
  uint64_t v9;
  UIColor *disabledMainLabelColor;
  uint64_t v11;
  UIColor *disabledSubtitleLabelColor;
  UILabel *v13;
  UILabel *displayLabel;
  UILabel *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *subtitleLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  UILabel *additionalContextLabel;
  UILabel *v24;
  void *v25;
  UIImageView *v26;
  UIImageView *cardArtView;
  id v28;
  uint64_t v29;
  UIStackView *labelStackView;
  uint64_t v31;
  UIActivityIndicatorView *activityIndicator;
  UISwitch *v33;
  UISwitch *actionSwitch;
  id v35;
  void *v36;
  uint64_t v37;
  UIImageView *disclosureView;
  UIImageView *v39;
  void *v40;
  UILabel *v41;
  UILabel *disclosureLabel;
  UILabel *v43;
  void *v44;
  UILabel *v45;
  void *v46;
  void *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PKPaymentPreferenceCardCell;
  v3 = -[PKPaymentPreferenceCell initWithReuseIdentifier:](&v49, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isRightToLeft = objc_msgSend(v4, "userInterfaceLayoutDirection") == 1;

    v3->_editing = 0;
    v3->_accessoryViewType = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    mainLabelColor = v3->_mainLabelColor;
    v3->_mainLabelColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = objc_claimAutoreleasedReturnValue();
    subtitleLabelColor = v3->_subtitleLabelColor;
    v3->_subtitleLabelColor = (UIColor *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = objc_claimAutoreleasedReturnValue();
    disabledMainLabelColor = v3->_disabledMainLabelColor;
    v3->_disabledMainLabelColor = (UIColor *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v11 = objc_claimAutoreleasedReturnValue();
    disabledSubtitleLabelColor = v3->_disabledSubtitleLabelColor;
    v3->_disabledSubtitleLabelColor = (UIColor *)v11;

    -[PKPaymentPreferenceCardCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    displayLabel = v3->_displayLabel;
    v3->_displayLabel = v13;

    v15 = v3->_displayLabel;
    v16 = (void *)*MEMORY[0x1E0DC48C8];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48C8], 16.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v17);

    -[UILabel setTextColor:](v3->_displayLabel, "setTextColor:", v3->_mainLabelColor);
    -[UILabel setNumberOfLines:](v3->_displayLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_displayLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v18;

    v20 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v16, 12.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v3->_subtitleLabelColor);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    additionalContextLabel = v3->_additionalContextLabel;
    v3->_additionalContextLabel = v22;

    v24 = v3->_additionalContextLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v16, 12.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setTextColor:](v3->_additionalContextLabel, "setTextColor:", v3->_subtitleLabelColor);
    -[UILabel setNumberOfLines:](v3->_additionalContextLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_additionalContextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    cardArtView = v3->_cardArtView;
    v3->_cardArtView = v26;

    -[UIImageView setContentMode:](v3->_cardArtView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_cardArtView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_cardArtView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v48, "addSubview:", v3->_cardArtView);
    v28 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v29 = objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    labelStackView = v3->_labelStackView;
    v3->_labelStackView = (UIStackView *)v29;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_labelStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_labelStackView, "setDistribution:", 0);
    -[UIStackView addArrangedSubview:](v3->_labelStackView, "addArrangedSubview:", v3->_displayLabel);
    -[UIStackView addArrangedSubview:](v3->_labelStackView, "addArrangedSubview:", v3->_subtitleLabel);
    -[UIStackView addArrangedSubview:](v3->_labelStackView, "addArrangedSubview:", v3->_additionalContextLabel);
    objc_msgSend(v48, "addSubview:", v3->_labelStackView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v31;

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_activityIndicator, "setHidesWhenStopped:", 1);
    v33 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    actionSwitch = v3->_actionSwitch;
    v3->_actionSwitch = v33;

    -[UISwitch addTarget:action:forControlEvents:](v3->_actionSwitch, "addTarget:action:forControlEvents:", v3, sel__performSwitchToggle_, 4096);
    v35 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "initWithImage:", v36);
    disclosureView = v3->_disclosureView;
    v3->_disclosureView = (UIImageView *)v37;

    v39 = v3->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v39, "setTintColor:", v40);

    v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    disclosureLabel = v3->_disclosureLabel;
    v3->_disclosureLabel = v41;

    v43 = v3->_disclosureLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v16, 16.0));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v43, "setFont:", v44);

    v45 = v3->_disclosureLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v45, "setTextColor:", v46);

    -[PKPaymentPreferenceCardCell _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)prepareForReuse
{
  PKPaymentPass *pass;
  NSString *additionalContextString;
  NSString *disclosureString;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceCardCell;
  -[PKPaymentPreferenceCell prepareForReuse](&v6, sel_prepareForReuse);
  -[PKPaymentPreferenceCardCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  ++self->_snapshotCounter;
  pass = self->_pass;
  self->_pass = 0;

  additionalContextString = self->_additionalContextString;
  self->_additionalContextString = 0;

  disclosureString = self->_disclosureString;
  self->_disclosureString = 0;

  -[UIImageView setImage:](self->_cardArtView, "setImage:", 0);
  -[UILabel setText:](self->_displayLabel, "setText:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
  -[UILabel setText:](self->_additionalContextLabel, "setText:", 0);
  -[UILabel setText:](self->_disclosureLabel, "setText:", 0);
  -[PKPaymentPreferenceCardCell setAccessoryViewType:](self, "setAccessoryViewType:", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)setHasError:(BOOL)a3
{
  _BOOL4 v3;
  UIColor *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceCardCell;
  -[PKPaymentPreferenceCell setHasError:](&v6, sel_setHasError_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (self->_subtitleLabelColorOverride != v5)
  {
    objc_storeStrong((id *)&self->_subtitleLabelColorOverride, v5);
    -[PKPaymentPreferenceCardCell _updateLabelTextColors](self, "_updateLabelTextColors");
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPreferenceCardCell;
  -[PKPaymentPreferenceCardCell setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  -[UISwitch setEnabled:](self->_actionSwitch, "setEnabled:", v3);
  -[PKPaymentPreferenceCardCell _updateLabelTextColors](self, "_updateLabelTextColors");
}

- (void)setAccessoryViewType:(int64_t)a3
{
  if (self->_accessoryViewType != a3)
  {
    self->_accessoryViewType = a3;
    -[PKPaymentPreferenceCardCell _updateAccessoryView](self, "_updateAccessoryView");
  }
}

- (void)setMainLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_mainLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mainLabelColor, a3);
    -[PKPaymentPreferenceCardCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setSubtitleLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_subtitleLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subtitleLabelColor, a3);
    -[PKPaymentPreferenceCardCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setDisabledMainLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_disabledMainLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledMainLabelColor, a3);
    -[PKPaymentPreferenceCardCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setDisabledSubtitleLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_disabledSubtitleLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledSubtitleLabelColor, a3);
    -[PKPaymentPreferenceCardCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setActivityIndicatorColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_activityIndicatorColor != v5)
  {
    objc_storeStrong((id *)&self->_activityIndicatorColor, a3);
    -[UIActivityIndicatorView setColor:](self->_activityIndicator, "setColor:", v5);
  }

}

- (void)setActivityIndicatorActive:(BOOL)a3
{
  if (((!self->_activityIndicatorActive ^ a3) & 1) == 0)
  {
    self->_activityIndicatorActive = a3;
    -[PKPaymentPreferenceCardCell _updateAccessoryView](self, "_updateAccessoryView");
  }
}

- (void)setDimCardArt:(BOOL)a3
{
  if (((!self->_dimCardArt ^ a3) & 1) == 0)
  {
    self->_dimCardArt = a3;
    -[PKPaymentPreferenceCardCell _updateCellContent](self, "_updateCellContent");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  uint64_t v7;
  _QWORD v8[6];

  if (((!self->_editing ^ a3) & 1) == 0)
  {
    v4 = a4;
    self->_editing = a3;
    if (a3)
      v6 = 0.2;
    else
      v6 = 1.0;
    if (a3)
      v7 = 0;
    else
      v7 = 3;
    -[PKPaymentPreferenceCardCell setSelectionStyle:](self, "setSelectionStyle:", v7);
    if (v4)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __51__PKPaymentPreferenceCardCell_setEditing_animated___block_invoke;
      v8[3] = &unk_1E3E62010;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8, 0);
    }
    else
    {
      -[PKPaymentPreferenceCardCell setAlpha:](self, "setAlpha:", v6);
    }
  }
}

uint64_t __51__PKPaymentPreferenceCardCell_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setPass:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    -[PKPaymentPreferenceCardCell _updateCellContent](self, "_updateCellContent");
  }

}

- (void)setTransitBalanceModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transitBalanceModel, a3);
    -[PKPaymentPreferenceCardCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  }

}

- (void)setSubtitleOverrideString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitleOverrideString;
  NSString *v10;

  v4 = a3;
  v5 = self->_subtitleOverrideString;
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
    subtitleOverrideString = self->_subtitleOverrideString;
    self->_subtitleOverrideString = v8;

    -[PKPaymentPreferenceCardCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  }
LABEL_9:

}

- (void)setDisclosureString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *disclosureString;
  NSString *v10;

  v4 = a3;
  v5 = self->_disclosureString;
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
    disclosureString = self->_disclosureString;
    self->_disclosureString = v8;

    -[PKPaymentPreferenceCardCell _updateDisclosureLabel](self, "_updateDisclosureLabel");
  }
LABEL_9:

}

- (void)setAdditionalContextString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *additionalContextString;
  NSString *v10;

  v4 = a3;
  v5 = self->_additionalContextString;
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
    additionalContextString = self->_additionalContextString;
    self->_additionalContextString = v8;

    -[PKPaymentPreferenceCardCell _updateAdditionalContextLabel](self, "_updateAdditionalContextLabel");
  }
LABEL_9:

}

- (void)_performSwitchToggle:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "paymentPreferenceCardCell:didChangeSwitchState:", self, objc_msgSend(v5, "isOn"));

}

- (void)_updateSubtitleLabel
{
  int v3;
  PKPaymentPass *pass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *subtitleLabel;
  void *v19;
  id v20;

  if (-[NSString length](self->_subtitleOverrideString, "length"))
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleOverrideString);
    return;
  }
  v3 = -[PKPaymentPass isAccessPass](self->_pass, "isAccessPass");
  pass = self->_pass;
  if (!v3)
  {
    if (-[PKPaymentPass isTransitPass](pass, "isTransitPass"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      PKSanitizedPrimaryAccountRepresentationForPass();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
        objc_msgSend(v6, "addObject:", v7);
      -[PKTransitBalanceModel primaryDisplayableBalance](self->_transitBalanceModel, "primaryDisplayableBalance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safelyAddObject:", v8);

      -[PKTransitBalanceModel displayableCommutePlanCount](self->_transitBalanceModel, "displayableCommutePlanCount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safelyAddObject:", v9);

      if (!objc_msgSend(v6, "count"))
      {

        goto LABEL_16;
      }
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[PKPaymentPass hasAssociatedPeerPaymentAccount](self->_pass, "hasAssociatedPeerPaymentAccount"))goto LABEL_16;
      -[PKPaymentPass peerPaymentBalance](self->_pass, "peerPaymentBalance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_16;
      -[PKPaymentPass peerPaymentBalance](self->_pass, "peerPaymentBalance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minimalFormattedStringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v7);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (id)v10;

    if (v20)
      goto LABEL_17;
LABEL_16:
    PKSanitizedPrimaryAccountRepresentationForPass();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[PKPaymentPass fieldForKey:](pass, "fieldForKey:", *MEMORY[0x1E0D6ADB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  v12 = self->_availabilityString;
  if (objc_msgSend(v20, "length") && -[NSString length](v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v20, v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
    v14 = v13;
    goto LABEL_25;
  }
  if (objc_msgSend(v20, "length"))
  {
    v13 = (NSString *)v20;
    goto LABEL_24;
  }
  if (-[NSString length](v12, "length"))
  {
    v13 = v12;
    goto LABEL_24;
  }
  v14 = 0;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "defaultBillingAddressForPaymentPass:", self->_pass);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_showBillingAddress && v16)
  {
    objc_msgSend(v16, "pkSingleLineFormattedContactAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v14, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](subtitleLabel, "setText:", v19);

  }
  else
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", v14);
  }

}

- (void)_updateAdditionalContextLabel
{
  -[UILabel setText:](self->_additionalContextLabel, "setText:", self->_additionalContextString);
  -[PKPaymentPreferenceCardCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateDisclosureLabel
{
  -[UILabel setText:](self->_disclosureLabel, "setText:", self->_disclosureString);
  -[PKPaymentPreferenceCardCell _calculateAccessoryLayout](self, "_calculateAccessoryLayout");
  -[PKPaymentPreferenceCardCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateCellContent
{
  UILabel *displayLabel;
  void *v4;
  unsigned int v5;
  PKPassSnapshotter *passSnapshotter;
  PKPaymentPass *pass;
  double v8;
  _QWORD v9[5];
  unsigned int v10;

  displayLabel = self->_displayLabel;
  -[PKPaymentPass localizedDescription](self->_pass, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](displayLabel, "setText:", v4);

  -[PKPaymentPreferenceCardCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  -[PKPaymentPreferenceCardCell _updateAdditionalContextLabel](self, "_updateAdditionalContextLabel");
  -[PKPaymentPreferenceCardCell _updateDisclosureLabel](self, "_updateDisclosureLabel");
  v5 = self->_snapshotCounter + 1;
  self->_snapshotCounter = v5;
  if (self->_pass && self->_passSnapshotter)
  {
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    -[PKPaymentPreferenceCardCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 90.0, 0.0, 0.0);
    -[UIImageView setImage:](self->_cardArtView, "setImage:", 0);
    passSnapshotter = self->_passSnapshotter;
    pass = self->_pass;
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke;
    v9[3] = &unk_1E3E71E28;
    v10 = v5;
    v9[4] = self;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](passSnapshotter, "snapshotWithPass:size:completion:", pass, v9, 66.0, v8);
  }
  else
  {
    -[UIImageView setImage:](self->_cardArtView, "setImage:", 0);
    -[PKPaymentPreferenceCardCell setSeparatorInset:](self, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }
}

void __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  int v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke_2;
  block[3] = &unk_1E3E71E00;
  v7 = *(_DWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PKPaymentPreferenceCardCell__updateCellContent__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) == *(_DWORD *)(v1 + 1120))
  {
    if (*(_QWORD *)(v1 + 1144))
    {
      v2 = *(void **)(v1 + 1232);
      v3 = *(void **)(a1 + 40);
      if (*(_BYTE *)(v1 + 1125))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.7);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "pkui_imageOverlaidWithColor:", v7);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setImage:", v4);

        return;
      }
      v5 = *(void **)(v1 + 1232);
      v6 = v3;
    }
    else
    {
      v5 = *(void **)(v1 + 1232);
      v6 = 0;
    }
    objc_msgSend(v5, "setImage:", v6);
  }
}

- (void)_updateLabelTextColors
{
  int v3;
  UILabel *displayLabel;
  UIColor *subtitleLabelColorOverride;
  UILabel *additionalContextLabel;
  UIColor *subtitleLabelColor;

  v3 = -[PKPaymentPreferenceCardCell isUserInteractionEnabled](self, "isUserInteractionEnabled");
  displayLabel = self->_displayLabel;
  if (v3)
  {
    -[UILabel setTextColor:](displayLabel, "setTextColor:", self->_mainLabelColor);
    subtitleLabelColorOverride = self->_subtitleLabelColorOverride;
    if (!subtitleLabelColorOverride)
      subtitleLabelColorOverride = self->_subtitleLabelColor;
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", subtitleLabelColorOverride);
    additionalContextLabel = self->_additionalContextLabel;
    subtitleLabelColor = self->_subtitleLabelColorOverride;
    if (!subtitleLabelColor)
      subtitleLabelColor = self->_subtitleLabelColor;
  }
  else
  {
    -[UILabel setTextColor:](displayLabel, "setTextColor:", self->_disabledMainLabelColor);
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", self->_disabledSubtitleLabelColor);
    additionalContextLabel = self->_additionalContextLabel;
    subtitleLabelColor = self->_disabledSubtitleLabelColor;
  }
  -[UILabel setTextColor:](additionalContextLabel, "setTextColor:", subtitleLabelColor);
}

- (double)heightThatFitsLabels
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPreferenceCardCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PKPaymentPreferenceCardCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xHeight");
    v9 = v8;

    return fmax(v9 + 36.0, 44.0);
  }
  else
  {
    -[UIStackView spacing](self->_labelStackView, "spacing");
    v12 = 16.0 - v11;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[UIStackView arrangedSubviews](self->_labelStackView, "arrangedSubviews", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      v17 = *MEMORY[0x1E0DC1138];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
          {
            v30 = v17;
            objc_msgSend(v19, "font");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sizeWithAttributes:", v22);
            v24 = v23;

            -[UIStackView spacing](self->_labelStackView, "spacing");
            v12 = v12 + v24 + v25;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v15);
    }

    return fmax(v12, 67.0);
  }
}

- (void)_calculateAccessoryLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t i;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGRect slice;
  CGRect remainder;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPreferenceCardCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKPaymentPreferenceCardCell accessoryView](self, "accessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    v11 = 0.0;
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v34;
      v14 = 0.0;
      v15 = 0.0;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "sizeThatFits:", v4, v6);
          v14 = v14 + v18 + 8.0;
          if (v17 > v15)
            v15 = v17;
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v12);
      v19 = v14 + -8.0;
    }
    else
    {
      v19 = -8.0;
      v15 = 0.0;
    }

    if (v19 >= 0.0)
      v11 = v19;
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v15);
    remainder.origin.x = 0.0;
    remainder.origin.y = 0.0;
    remainder.size.width = v11;
    remainder.size.height = v15;
    memset(&slice, 0, sizeof(slice));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v25, "sizeThatFits:", v4, v6, (_QWORD)v27);
          CGRectDivide(remainder, &slice, &remainder, v26, CGRectMaxXEdge);
          PKSizeAlignedInRect();
          objc_msgSend(v25, "setFrame:");
          CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMaxXEdge);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v22);
    }

  }
}

- (void)_updateAccessoryView
{
  BOOL v3;
  BOOL v4;
  id v5;
  int64_t accessoryViewType;
  int *v7;
  char v8;
  UIActivityIndicatorView *activityIndicator;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = !self->_activityIndicatorActive;
  v4 = -[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating");
  v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  accessoryViewType = self->_accessoryViewType;
  v13 = v5;
  if (accessoryViewType == 1)
  {
    v7 = &OBJC_IVAR___PKPaymentPreferenceCardCell__actionSwitch;
  }
  else
  {
    if (accessoryViewType != 2)
      goto LABEL_6;
    v7 = &OBJC_IVAR___PKPaymentPreferenceCardCell__disclosureLabel;
    objc_msgSend(v5, "addSubview:", self->_disclosureView);
  }
  objc_msgSend(v13, "addSubview:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v7));
  v5 = v13;
LABEL_6:
  v8 = v3 ^ v4;
  if (self->_activityIndicatorActive)
  {
    objc_msgSend(v13, "addSubview:", self->_activityIndicator);
    v5 = v13;
  }
  if ((v8 & 1) == 0)
  {
    activityIndicator = self->_activityIndicator;
    if (self->_activityIndicatorActive)
      -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
    v5 = v13;
  }
  objc_msgSend(v5, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
    v12 = v13;
  else
    v12 = 0;
  -[PKPaymentPreferenceCardCell setAccessoryView:](self, "setAccessoryView:", v12);
  -[PKPaymentPreferenceCardCell _calculateAccessoryLayout](self, "_calculateAccessoryLayout");
  -[PKPaymentPreferenceCardCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_setupConstraints
{
  double v3;
  double v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *labelStackTrailingAnchorToCell;
  void *v40;
  void *v41;
  id v42;

  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v4 = v3;
  -[PKPaymentPreferenceCardCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerYAnchor](self->_cardArtView, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v8);

  -[UIImageView leadingAnchor](self->_cardArtView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 16.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v11);

  -[UIImageView heightAnchor](self->_cardArtView, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v13);

  -[UIImageView widthAnchor](self->_cardArtView, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 66.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v15);

  LODWORD(v16) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_displayLabel, "setContentHuggingPriority:forAxis:", 1, v16);
  LODWORD(v17) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_displayLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  LODWORD(v18) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v18);
  LODWORD(v19) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v19);
  LODWORD(v20) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_additionalContextLabel, "setContentHuggingPriority:forAxis:", 1, v20);
  LODWORD(v21) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_additionalContextLabel, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  LODWORD(v22) = 1148846080;
  -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_labelStackView, "setContentCompressionResistancePriority:forAxis:", 1, v22);
  LODWORD(v23) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_labelStackView, "setContentHuggingPriority:forAxis:", 1, v23);
  -[UIStackView centerYAnchor](self->_labelStackView, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v26);

  -[UIStackView leadingAnchor](self->_labelStackView, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_cardArtView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 8.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v29);

  -[UIStackView topAnchor](self->_labelStackView, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", v31, 8.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v32);

  -[UIStackView bottomAnchor](self->_labelStackView, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", v34, -8.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v35);

  -[UIStackView trailingAnchor](self->_labelStackView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v37, 0.0);
  v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelStackTrailingAnchorToCell = self->_labelStackTrailingAnchorToCell;
  self->_labelStackTrailingAnchorToCell = v38;

  objc_msgSend(v42, "addObject:", self->_labelStackTrailingAnchorToCell);
  objc_msgSend(v5, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintGreaterThanOrEqualToConstant:", v4 + 16.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v42);
}

+ (double)textOffset
{
  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  return 90.0;
}

- (PKPaymentPreferenceCardCellAccessoryViewDelegate)delegate
{
  return (PKPaymentPreferenceCardCellAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPassSnapshotter)passSnapshotter
{
  return self->_passSnapshotter;
}

- (void)setPassSnapshotter:(id)a3
{
  objc_storeStrong((id *)&self->_passSnapshotter, a3);
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (UIColor)mainLabelColor
{
  return self->_mainLabelColor;
}

- (UIColor)subtitleLabelColor
{
  return self->_subtitleLabelColor;
}

- (UIColor)disabledMainLabelColor
{
  return self->_disabledMainLabelColor;
}

- (UIColor)disabledSubtitleLabelColor
{
  return self->_disabledSubtitleLabelColor;
}

- (UIColor)activityIndicatorColor
{
  return self->_activityIndicatorColor;
}

- (UILabel)displayLabel
{
  return self->_displayLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)additionalContextLabel
{
  return self->_additionalContextLabel;
}

- (UIImageView)cardArtView
{
  return self->_cardArtView;
}

- (UISwitch)actionSwitch
{
  return self->_actionSwitch;
}

- (UILabel)disclosureLabel
{
  return self->_disclosureLabel;
}

- (UIImageView)disclosureView
{
  return self->_disclosureView;
}

- (NSString)availabilityString
{
  return self->_availabilityString;
}

- (void)setAvailabilityString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (NSString)subtitleOverrideString
{
  return self->_subtitleOverrideString;
}

- (NSString)additionalContextString
{
  return self->_additionalContextString;
}

- (NSString)disclosureString
{
  return self->_disclosureString;
}

- (BOOL)showBillingAddress
{
  return self->_showBillingAddress;
}

- (void)setShowBillingAddress:(BOOL)a3
{
  self->_showBillingAddress = a3;
}

- (BOOL)dimCardArt
{
  return self->_dimCardArt;
}

- (BOOL)isActivityIndicatorActive
{
  return self->_activityIndicatorActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureString, 0);
  objc_storeStrong((id *)&self->_additionalContextString, 0);
  objc_storeStrong((id *)&self->_subtitleOverrideString, 0);
  objc_storeStrong((id *)&self->_availabilityString, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_disclosureLabel, 0);
  objc_storeStrong((id *)&self->_actionSwitch, 0);
  objc_storeStrong((id *)&self->_cardArtView, 0);
  objc_storeStrong((id *)&self->_additionalContextLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorColor, 0);
  objc_storeStrong((id *)&self->_disabledSubtitleLabelColor, 0);
  objc_storeStrong((id *)&self->_disabledMainLabelColor, 0);
  objc_storeStrong((id *)&self->_subtitleLabelColor, 0);
  objc_storeStrong((id *)&self->_mainLabelColor, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelStackTrailingAnchorToCell, 0);
  objc_storeStrong((id *)&self->_subtitleLabelColorOverride, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferenceCardCell;
  v4 = a3;
  -[PKTableViewCell pk_applyAppearance:](&v10, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "textColor", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceCardCell setMainLabelColor:](self, "setMainLabelColor:", v5);

  objc_msgSend(v4, "altTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceCardCell setSubtitleLabelColor:](self, "setSubtitleLabelColor:", v6);

  objc_msgSend(v4, "altTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceCardCell setDisabledMainLabelColor:](self, "setDisabledMainLabelColor:", v7);

  objc_msgSend(v4, "altTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceCardCell setDisabledSubtitleLabelColor:](self, "setDisabledSubtitleLabelColor:", v8);

  objc_msgSend(v4, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPreferenceCardCell setTintColor:](self, "setTintColor:", v9);
}

@end
