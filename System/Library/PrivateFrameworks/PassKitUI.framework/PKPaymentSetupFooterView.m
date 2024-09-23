@implementation PKPaymentSetupFooterView

- (PKPaymentSetupFooterView)initWithFrame:(CGRect)a3 context:(int64_t)a4
{
  PKPaymentSetupFooterView *v5;
  PKPaymentSetupFooterView *v6;
  void *v7;
  uint64_t v8;
  UIButton *manualEntryButton;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFooterView;
  v5 = -[PKPaymentSetupFooterView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_context = a4;
    PKLocalizedPaymentString(CFSTR("ADD_A_DIFFERENT_CARD"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFooterView _alternateActionButtonWithTitle:](v6, "_alternateActionButtonWithTitle:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    manualEntryButton = v6->_manualEntryButton;
    v6->_manualEntryButton = (UIButton *)v8;

    -[PKPaymentSetupFooterView addSubview:](v6, "addSubview:", v6->_manualEntryButton);
    -[PKPaymentSetupFooterView _createSetupLaterButton](v6, "_createSetupLaterButton");
    -[PKPaymentSetupFooterView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
  }
  return v6;
}

- (void)setNotificationText:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_notificationText);
}

- (void)setPrimaryButton:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_primaryButton);
}

- (void)setSkipCardButton:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_skipCardButton);
}

- (void)setManualEntryButton:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_manualEntryButton);
}

- (void)setSetupLaterButton:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_setupLaterButton);
}

- (void)setForceShowSetupLaterButton:(BOOL)a3
{
  if (self->_forceShowSetupLaterButton != a3)
  {
    self->_forceShowSetupLaterButton = a3;
    -[PKPaymentSetupFooterView setSetupLaterButton:](self, "setSetupLaterButton:", 0);
    -[PKPaymentSetupFooterView _createSetupLaterButton](self, "_createSetupLaterButton");
    -[PKPaymentSetupFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setUIView:(id)a3 forVariable:(id *)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (a4 && *a4 != v7)
  {
    v8 = v7;
    objc_msgSend(*a4, "removeFromSuperview");
    objc_storeStrong(a4, a3);
    if (*a4)
      -[PKPaymentSetupFooterView addSubview:](self, "addSubview:");
    -[PKPaymentSetupFooterView setNeedsLayout](self, "setNeedsLayout");
    v7 = v8;
  }

}

- (UILabel)notificationText
{
  UILabel *notificationText;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  notificationText = self->_notificationText;
  if (!notificationText)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_notificationText;
    self->_notificationText = v4;

    -[UILabel setText:](self->_notificationText, "setText:", &stru_1E3E7D690);
    -[UILabel setNumberOfLines:](self->_notificationText, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_notificationText, "setLineBreakMode:", 0);
    v6 = self->_notificationText;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setTextAlignment:](self->_notificationText, "setTextAlignment:", 1);
    -[PKPaymentSetupFooterView addSubview:](self, "addSubview:", self->_notificationText);
    -[PKPaymentSetupFooterView setNeedsLayout](self, "setNeedsLayout");
    notificationText = self->_notificationText;
  }
  return notificationText;
}

- (UIButton)skipCardButton
{
  UIButton *skipCardButton;
  void *v4;
  UIButton *v5;
  UIButton *v6;

  skipCardButton = self->_skipCardButton;
  if (!skipCardButton)
  {
    PKLocalizedPaymentString(CFSTR("ADD_TO_WALLET_LATER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFooterView _alternateActionButtonWithTitle:](self, "_alternateActionButtonWithTitle:", v4);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->_skipCardButton;
    self->_skipCardButton = v5;

    -[PKPaymentSetupFooterView addSubview:](self, "addSubview:", self->_skipCardButton);
    -[PKPaymentSetupFooterView setNeedsLayout](self, "setNeedsLayout");
    skipCardButton = self->_skipCardButton;
  }
  -[UIButton setAccessibilityIdentifier:](skipCardButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
  return self->_skipCardButton;
}

- (UIButton)secondaryActionButton
{
  UIButton *secondaryActionButton;
  UIButton *v4;
  UIButton *v5;

  secondaryActionButton = self->_secondaryActionButton;
  if (!secondaryActionButton)
  {
    -[PKPaymentSetupFooterView _alternateActionButtonWithTitle:](self, "_alternateActionButtonWithTitle:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_secondaryActionButton;
    self->_secondaryActionButton = v4;

    -[PKPaymentSetupFooterView addSubview:](self, "addSubview:", self->_secondaryActionButton);
    -[PKPaymentSetupFooterView setNeedsLayout](self, "setNeedsLayout");
    secondaryActionButton = self->_secondaryActionButton;
  }
  -[UIButton setAccessibilityIdentifier:](secondaryActionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
  return self->_secondaryActionButton;
}

- (void)setSecondaryActionButton:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_secondaryActionButton);
}

- (UIButton)tertiaryActionButton
{
  UIButton *tertiaryActionButton;
  UIButton *v4;
  UIButton *v5;

  tertiaryActionButton = self->_tertiaryActionButton;
  if (!tertiaryActionButton)
  {
    -[PKPaymentSetupFooterView _alternateActionButtonWithTitle:](self, "_alternateActionButtonWithTitle:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tertiaryActionButton;
    self->_tertiaryActionButton = v4;

    -[PKPaymentSetupFooterView addSubview:](self, "addSubview:", self->_tertiaryActionButton);
    -[PKPaymentSetupFooterView setNeedsLayout](self, "setNeedsLayout");
    tertiaryActionButton = self->_tertiaryActionButton;
  }
  -[UIButton setAccessibilityIdentifier:](tertiaryActionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
  return self->_tertiaryActionButton;
}

- (void)setTertiaryActionButton:(id)a3
{
  -[PKPaymentSetupFooterView _setUIView:forVariable:](self, "_setUIView:forVariable:", a3, &self->_tertiaryActionButton);
}

- (CGSize)_sizeForLabel:(id)a3 maxText:(id)a4 constrainedToSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  double *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[2];
  _QWORD v25[3];
  CGSize result;

  height = a5.height;
  width = a5.width;
  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = (double *)MEMORY[0x1E0C9D820];
  if (v8 && !v9)
  {
    objc_msgSend(v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = *v11;
  v13 = v11[1];
  if (v8 && v10)
  {
    objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setAlignment:", objc_msgSend(v8, "textAlignment"));
    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    v24[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(v8, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = *MEMORY[0x1E0DC1178];
    v25[0] = v17;
    v25[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithString:attributes:", v10, v18);

    objc_msgSend(v19, "pkui_sizeThatFits:", width, height);
    v12 = v20;
    v13 = v21;

  }
  v22 = v12;
  v23 = v13;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)_adjacentButtonSizeConstrainedToSize:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  UIButton *setupLaterButton;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  v5 = (a3.width + -12.0) * 0.5;
  -[PKLegacyButtonInterface sizeThatFits:](self->_primaryButton, "sizeThatFits:", v5, a3.height);
  v6 = 50.0;
  if (v7 >= 50.0)
  {
    -[PKLegacyButtonInterface sizeThatFits:](self->_primaryButton, "sizeThatFits:", v5, height);
    v6 = v8;
  }
  setupLaterButton = self->_setupLaterButton;
  if (setupLaterButton)
  {
    -[UIButton sizeThatFits:](setupLaterButton, "sizeThatFits:", v5, height);
    if (v6 <= v10)
    {
      -[UIButton sizeThatFits:](self->_setupLaterButton, "sizeThatFits:", v5, height);
      v6 = v11;
    }
  }
  v12 = v5;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)_useAdjacentLayout
{
  return self->_primaryButton != 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  UILabel *notificationText;
  double v7;
  double v8;
  double v9;
  UIButton *skipCardButton;
  double v11;
  UIButton *manualEntryButton;
  double v13;
  UIButton *secondaryActionButton;
  double v15;
  UIButton *tertiaryActionButton;
  double v17;
  double v18;
  double v19;
  UIButton *setupLaterButton;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  notificationText = self->_notificationText;
  if (notificationText)
  {
    -[PKPaymentSetupFooterView _sizeForLabel:maxText:constrainedToSize:](self, "_sizeForLabel:maxText:constrainedToSize:", notificationText, 0, a3.width + -24.0, 120.0);
    v8 = v7 + 0.0;
    v9 = 1.0;
  }
  else
  {
    v9 = 0.0;
    v8 = 0.0;
  }
  skipCardButton = self->_skipCardButton;
  if (skipCardButton)
  {
    -[UIButton sizeThatFits:](skipCardButton, "sizeThatFits:", width, height);
    v8 = v8 + v11;
    v9 = v9 + 1.0;
  }
  manualEntryButton = self->_manualEntryButton;
  if (manualEntryButton)
  {
    -[UIButton sizeThatFits:](manualEntryButton, "sizeThatFits:", width, height);
    v8 = v8 + v13;
    v9 = v9 + 1.0;
  }
  secondaryActionButton = self->_secondaryActionButton;
  if (secondaryActionButton)
  {
    -[UIButton sizeThatFits:](secondaryActionButton, "sizeThatFits:", width, height);
    v8 = v8 + v15;
    v9 = v9 + 1.0;
  }
  tertiaryActionButton = self->_tertiaryActionButton;
  if (tertiaryActionButton)
  {
    -[UIButton sizeThatFits:](tertiaryActionButton, "sizeThatFits:", width, height);
    v8 = v8 + v17;
    v9 = v9 + 1.0;
  }
  if (-[PKPaymentSetupFooterView _useAdjacentLayout](self, "_useAdjacentLayout"))
  {
    -[PKPaymentSetupFooterView _adjacentButtonSizeConstrainedToSize:](self, "_adjacentButtonSizeConstrainedToSize:", width, height);
    if (v18 != 0.0)
      v9 = v9 + 1.0;
    v19 = -0.0;
    if (v18 != 0.0)
      v19 = v18;
    v8 = v8 + v19;
  }
  else
  {
    setupLaterButton = self->_setupLaterButton;
    if (setupLaterButton)
    {
      -[UIButton sizeThatFits:](setupLaterButton, "sizeThatFits:", width, height);
      v8 = v8 + v21;
      v9 = v9 + 1.0;
    }
  }
  if (v9 == 1.0)
  {
    v8 = v8 + 0.0;
  }
  else if (v9 > 1.0)
  {
    v8 = v8 + (v9 + -1.0) * 5.0 + 0.0;
  }
  v22 = width;
  v23 = v8;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
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
  UILabel *notificationText;
  _BOOL4 v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MaxY;
  UIButton *skipCardButton;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  UIButton *manualEntryButton;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  UIButton *secondaryActionButton;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  UIButton *tertiaryActionButton;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  UIButton *setupLaterButton;
  id *p_primaryButton;
  objc_super v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v66.receiver = self;
  v66.super_class = (Class)PKPaymentSetupFooterView;
  -[PKPaymentSetupFooterView layoutSubviews](&v66, sel_layoutSubviews);
  -[PKPaymentSetupFooterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1 && (PKPaymentSetupContextIsSetupAssistant() & 1) != 0)
  {
    -[PKPaymentSetupFooterView readableContentGuide](self, "readableContentGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    -[PKPaymentSetupFooterView bounds](self, "bounds");
    v6 = v11;
    v8 = v12;
    v10 = v13;
  }

  notificationText = self->_notificationText;
  v15 = notificationText != 0;
  if (notificationText)
  {
    -[PKPaymentSetupFooterView _sizeForLabel:maxText:constrainedToSize:](self, "_sizeForLabel:maxText:constrainedToSize:", self->_notificationText, 0, v8 + -24.0, v10);
    UIRectCenteredXInRect();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UILabel setFrame:](self->_notificationText, "setFrame:");
    v67.origin.y = 0.0;
    v67.origin.x = v17;
    v67.size.width = v19;
    v67.size.height = v21;
    MaxY = CGRectGetMaxY(v67);
  }
  else
  {
    MaxY = 0.0;
  }
  skipCardButton = self->_skipCardButton;
  if (skipCardButton)
  {
    -[UIButton sizeThatFits:](skipCardButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = 0.0;
    if (notificationText)
      v30 = 5.0;
    v31 = v30 + MaxY;
    -[UIButton pkui_setBoundsAndPositionFromFrame:](self->_skipCardButton, "pkui_setBoundsAndPositionFromFrame:", v25, v31);
    v68.origin.x = v25;
    v68.origin.y = v31;
    v68.size.width = v27;
    v68.size.height = v29;
    MaxY = CGRectGetMaxY(v68);
    v15 = 1;
  }
  manualEntryButton = self->_manualEntryButton;
  if (manualEntryButton)
  {
    -[UIButton sizeThatFits:](manualEntryButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v39 = 0.0;
    if (v15)
      v39 = 5.0;
    v40 = MaxY + v39;
    -[UIButton pkui_setBoundsAndPositionFromFrame:](self->_manualEntryButton, "pkui_setBoundsAndPositionFromFrame:", v34, v40);
    v69.origin.x = v34;
    v69.origin.y = v40;
    v69.size.width = v36;
    v69.size.height = v38;
    MaxY = CGRectGetMaxY(v69);
    v15 = 1;
  }
  secondaryActionButton = self->_secondaryActionButton;
  if (secondaryActionButton)
  {
    -[UIButton sizeThatFits:](secondaryActionButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v48 = 0.0;
    if (v15)
      v48 = 5.0;
    v49 = MaxY + v48;
    -[UIButton setFrame:](self->_secondaryActionButton, "setFrame:", v43, v49);
    v70.origin.x = v43;
    v70.origin.y = v49;
    v70.size.width = v45;
    v70.size.height = v47;
    MaxY = CGRectGetMaxY(v70);
    v15 = 1;
  }
  tertiaryActionButton = self->_tertiaryActionButton;
  if (tertiaryActionButton)
  {
    -[UIButton sizeThatFits:](tertiaryActionButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = 0.0;
    if (v15)
      v57 = 5.0;
    v58 = MaxY + v57;
    -[UIButton setFrame:](self->_tertiaryActionButton, "setFrame:", v52, v58);
    v71.origin.x = v52;
    v71.origin.y = v58;
    v71.size.width = v54;
    v71.size.height = v56;
    MaxY = CGRectGetMaxY(v71);
    v15 = 1;
  }
  if (-[PKPaymentSetupFooterView _useAdjacentLayout](self, "_useAdjacentLayout"))
  {
    -[PKPaymentSetupFooterView _adjacentButtonSizeConstrainedToSize:](self, "_adjacentButtonSizeConstrainedToSize:", v8, v10);
    v61 = v60;
    v62 = 0.0;
    if (v15)
      v62 = 5.0;
    v63 = MaxY + v62;
    setupLaterButton = self->_setupLaterButton;
    if (setupLaterButton)
      -[UIButton pkui_setBoundsAndPositionFromFrame:](setupLaterButton, "pkui_setBoundsAndPositionFromFrame:", v6, v63, v61, v59);
    else
      PKRectCenteredXInRect();
    p_primaryButton = (id *)&self->_primaryButton;
  }
  else
  {
    p_primaryButton = (id *)&self->_setupLaterButton;
    if (!*p_primaryButton)
      return;
    objc_msgSend(*p_primaryButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
  }
  objc_msgSend(*p_primaryButton, "pkui_setBoundsAndPositionFromFrame:");
}

- (void)setButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIButton setEnabled:](self->_setupLaterButton, "setEnabled:");
  -[UIButton setEnabled:](self->_manualEntryButton, "setEnabled:", v3);
  -[UIButton setEnabled:](self->_secondaryActionButton, "setEnabled:", v3);
  -[UIButton setEnabled:](self->_skipCardButton, "setEnabled:", v3);
}

- (void)_createSetupLaterButton
{
  void *v3;
  id v4;

  if ((PKPaymentSetupContextIsSetupAssistant() & 1) != 0 || self->_forceShowSetupLaterButton)
  {
    PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFooterView _alternateActionButtonWithTitle:](self, "_alternateActionButtonWithTitle:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
    -[PKPaymentSetupFooterView setSetupLaterButton:](self, "setSetupLaterButton:", v3);

  }
}

- (id)_alternateActionButtonWithTitle:(id)a3
{
  NSString *v3;
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (NSString *)*MEMORY[0x1E0DC4A88];
  v4 = (NSString *)*MEMORY[0x1E0DC48D0];
  v5 = a3;
  PKFontForDefaultDesign(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "pkui_plainConfigurationWithTitle:font:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContentInsets:", 15.0, 0.0, 15.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v7);
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", 1);

  objc_msgSend(v8, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v6);

  objc_msgSend(v8, "setExclusiveTouch:", 1);
  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);

  return v8;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (BOOL)forceShowSetupLaterButton
{
  return self->_forceShowSetupLaterButton;
}

- (UIButton)manualEntryButton
{
  return self->_manualEntryButton;
}

- (UIButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (PKLegacyButtonInterface)primaryButton
{
  return self->_primaryButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_manualEntryButton, 0);
  objc_storeStrong((id *)&self->_tertiaryActionButton, 0);
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_notificationText, 0);
  objc_storeStrong((id *)&self->_skipCardButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end
