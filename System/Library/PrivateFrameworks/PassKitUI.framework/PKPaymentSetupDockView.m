@implementation PKPaymentSetupDockView

- (PKPaymentSetupDockView)initWithFrame:(CGRect)a3 context:(int64_t)a4
{
  PKPaymentSetupDockView *v5;
  PKPaymentSetupDockView *v6;
  void *v7;
  uint64_t v8;
  char IsSetupAssistant;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupDockView;
  v5 = -[PKPaymentSetupDockView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_context = a4;
    -[PKPaymentSetupDockView traitCollection](v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    else
      IsSetupAssistant = 0;
    v6->_isBuddyiPad = IsSetupAssistant;
    v6->_useAdjacentLayout = 0;
    v6->_additionalLinkBottomPadding = 30.0;
    -[PKPaymentSetupDockView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B00]);
  }
  return v6;
}

- (void)setPrivacyLink:(id)a3
{
  OBPrivacyLinkController **p_privacyLink;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_privacyLink = &self->_privacyLink;
  v6 = PKEqualObjects();
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    -[OBPrivacyLinkController view](*p_privacyLink, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_storeStrong((id *)&self->_privacyLink, a3);
    if (*p_privacyLink)
    {
      -[OBPrivacyLinkController view](*p_privacyLink, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupDockView addSubview:](self, "addSubview:", v9);

    }
    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
    v7 = v10;
  }

}

- (void)setAdditionalLinkView:(id)a3
{
  UIView *v5;
  UIView *additionalLinkView;
  UIView *v7;

  v5 = (UIView *)a3;
  additionalLinkView = self->_additionalLinkView;
  if (additionalLinkView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](additionalLinkView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_additionalLinkView, a3);
    if (self->_additionalLinkView)
      -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setButtonExplanationText:(id)a3
{
  id v4;
  void *v5;
  UITextView *buttonExplanationTextView;
  UITextView *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[PKPaymentSetupDockView buttonExplanationTextView](self, "buttonExplanationTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v8);
    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");

LABEL_5:
    v4 = v8;
    goto LABEL_6;
  }
  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (buttonExplanationTextView)
  {
    v8 = 0;
    -[UITextView removeFromSuperview](buttonExplanationTextView, "removeFromSuperview");
    v7 = self->_buttonExplanationTextView;
    self->_buttonExplanationTextView = 0;

    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_5;
  }
LABEL_6:

}

- (UITextView)buttonExplanationTextView
{
  UITextView *buttonExplanationTextView;
  UITextView *v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  void *v8;

  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (!buttonExplanationTextView)
  {
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_buttonExplanationTextView;
    self->_buttonExplanationTextView = v4;

    -[UITextView setTextAlignment:](self->_buttonExplanationTextView, "setTextAlignment:", 1);
    v6 = self->_buttonExplanationTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v6, "setTextColor:", v7);

    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC48D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](self->_buttonExplanationTextView, "setFont:", v8);
    -[UITextView setTextContainerInset:](self->_buttonExplanationTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setEditable:](self->_buttonExplanationTextView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_buttonExplanationTextView, "setSelectable:", 1);
    -[UITextView setScrollingEnabled:](self->_buttonExplanationTextView, "setScrollingEnabled:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_buttonExplanationTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[PKPaymentSetupDockView addSubview:](self, "addSubview:", self->_buttonExplanationTextView);
    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");

    buttonExplanationTextView = self->_buttonExplanationTextView;
  }
  return buttonExplanationTextView;
}

- (PKLegacyButtonInterface)primaryButton
{
  PKLegacyButtonInterface *primaryButton;
  void *v4;
  void *v5;
  void *v6;

  primaryButton = self->_primaryButton;
  if (!primaryButton)
  {
    if (self->_useAdjacentLayout)
      PKCreateLargeSolidPillButton();
    else
      PKCreateLargeSolidButton();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExclusiveTouch:", 1);
    objc_msgSend(v4, "setTintColor:", self->_primaryButtonTintColor);
    objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    objc_msgSend(v4, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 24.0);
    objc_msgSend(v4, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", 0);
    objc_msgSend(v5, "setTextAlignment:", 1);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AD0], (NSString *)*MEMORY[0x1E0DC48D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKPaymentSetupDockView setPrimaryButton:](self, "setPrimaryButton:", v4);

    primaryButton = self->_primaryButton;
  }
  return primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  PKLegacyButtonInterface *v5;
  PKLegacyButtonInterface **p_primaryButton;
  PKLegacyButtonInterface *primaryButton;
  void *v8;
  PKLegacyButtonInterface *v9;

  v5 = (PKLegacyButtonInterface *)a3;
  p_primaryButton = &self->_primaryButton;
  primaryButton = self->_primaryButton;
  if (primaryButton != v5)
  {
    v9 = v5;
    -[PKLegacyButtonInterface removeFromSuperview](primaryButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_primaryButton, a3);
    if (*p_primaryButton)
    {
      if (self->_useAdjacentLayout)
      {
        -[PKPaymentSetupDockView footerView](self, "footerView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPrimaryButton:", *p_primaryButton);

      }
      else
      {
        -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
      }
    }
    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setPrimaryButtonTintColor:(id)a3
{
  PKLegacyButtonInterface *primaryButton;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_primaryButtonTintColor, a3);
  primaryButton = self->_primaryButton;
  if (primaryButton)
    -[PKLegacyButtonInterface setTintColor:](primaryButton, "setTintColor:", v6);

}

- (UIColor)primaryButtonTintColor
{
  return self->_primaryButtonTintColor;
}

- (void)setAdditionalLinkBottomPadding:(double)a3
{
  self->_additionalLinkBottomPadding = a3;
  -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLockUpView:(id)a3
{
  ASCLockupView *v5;
  ASCLockupView *lockUpView;
  ASCLockupView *v7;

  v5 = (ASCLockupView *)a3;
  lockUpView = self->_lockUpView;
  if (lockUpView != v5)
  {
    v7 = v5;
    -[ASCLockupView removeFromSuperview](lockUpView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_lockUpView, a3);
    if (self->_lockUpView)
      -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
    -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (PKPaymentSetupFooterView)footerView
{
  PKPaymentSetupFooterView *footerView;
  PKPaymentSetupFooterView *v4;
  PKPaymentSetupFooterView *v5;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = [PKPaymentSetupFooterView alloc];
    v5 = -[PKPaymentSetupFooterView initWithFrame:context:](v4, "initWithFrame:context:", self->_context, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PKPaymentSetupDockView setFooterView:](self, "setFooterView:", v5);

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)setFooterView:(id)a3
{
  PKPaymentSetupFooterView *v5;
  PKPaymentSetupFooterView **p_footerView;
  PKPaymentSetupFooterView *footerView;
  PKPaymentSetupFooterView *v8;

  v5 = (PKPaymentSetupFooterView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v8 = v5;
    -[PKPaymentSetupFooterView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    if (*p_footerView)
    {
      if (self->_useAdjacentLayout)
        -[PKPaymentSetupFooterView setPrimaryButton:](*p_footerView, "setPrimaryButton:", self->_primaryButton);
    }
    else if (!self->_primaryButton)
    {
LABEL_7:
      -[PKPaymentSetupDockView setNeedsLayout](self, "setNeedsLayout");
      v5 = v8;
      goto LABEL_8;
    }
    -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
    goto LABEL_7;
  }
LABEL_8:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentSetupDockView _sizeThatFits:includePrivacyLink:](self, "_sizeThatFits:includePrivacyLink:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsWithoutPrivacyLink:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentSetupDockView _sizeThatFits:includePrivacyLink:](self, "_sizeThatFits:includePrivacyLink:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 includePrivacyLink:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *additionalLinkView;
  double v14;
  double v15;
  OBPrivacyLinkController *privacyLink;
  BOOL v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  UITextView *buttonExplanationTextView;
  double v24;
  double v25;
  ASCLockupView *lockUpView;
  double v27;
  double v28;
  PKLegacyButtonInterface *primaryButton;
  double v31;
  double v32;
  double v33;
  PKPaymentSetupFooterView *footerView;
  double v35;
  double v36;
  double v37;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  v9 = 24.0;
  if (v8)
  {
    v9 = 44.0;
    if (self->_useAdjacentLayout)
      v9 = 24.0;
  }
  v10 = width + v9 * -2.0;
  -[PKPaymentSetupFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v10, height);
  v12 = v11;
  additionalLinkView = self->_additionalLinkView;
  if (additionalLinkView)
  {
    -[UIView sizeThatFits:](additionalLinkView, "sizeThatFits:", v10, height);
    v15 = v14 + self->_additionalLinkBottomPadding + 11.0;
  }
  else
  {
    v15 = 0.0;
  }
  privacyLink = self->_privacyLink;
  if (privacyLink)
    v17 = !v4;
  else
    v17 = 1;
  if (!v17)
  {
    if (v15 == 0.0)
      v18 = 11.0;
    else
      v18 = 0.0;
    -[OBPrivacyLinkController view](privacyLink, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", 0.0, v15, v10, 0.0);
    objc_msgSend(v19, "setNeedsLayout");
    objc_msgSend(v19, "layoutIfNeeded");
    LODWORD(v20) = 1148846080;
    LODWORD(v21) = 1112014848;
    objc_msgSend(v19, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, height, v20, v21);
    v15 = v15 + v18 + v22 + 30.0;

  }
  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (buttonExplanationTextView)
  {
    if (v15 == 0.0)
      v24 = 24.0;
    else
      v24 = 0.0;
    -[UITextView sizeThatFits:](buttonExplanationTextView, "sizeThatFits:", v10, height);
    v15 = v15 + v24 + v25 + 25.0;
  }
  lockUpView = self->_lockUpView;
  if (lockUpView)
  {
    if (v15 == 0.0)
      v27 = 5.0;
    else
      v27 = 0.0;
    -[ASCLockupView sizeThatFits:](lockUpView, "sizeThatFits:", v10, height);
    v15 = v15 + v27 + v28 + 5.0;
  }
  primaryButton = self->_primaryButton;
  if (v15 == 0.0 && primaryButton != 0)
    v15 = v15 + 24.0;
  if (!primaryButton)
  {
    if (!self->_footerView)
      goto LABEL_51;
    goto LABEL_40;
  }
  if (self->_useAdjacentLayout && self->_footerView)
    goto LABEL_40;
  -[PKPaymentSetupDockView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", v10, height);
  if (v31 >= 50.0)
  {
    -[PKPaymentSetupDockView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", self->_primaryButton, v10, height);
    v32 = v33 + 5.0;
  }
  else
  {
    v32 = 55.0;
  }
  v15 = v15 + v32;
  footerView = self->_footerView;
  if (self->_useAdjacentLayout)
  {
    if (!footerView)
      goto LABEL_51;
    goto LABEL_40;
  }
  if (footerView && v12 != 0.0)
    goto LABEL_40;
  v35 = 43.5;
  if (!self->_requiresAdditionalPrimaryButtonPadding)
    v35 = 28.0;
  v15 = v15 + v35;
  if (footerView)
  {
LABEL_40:
    v15 = v12 + v15;
    if (!self->_primaryButton && !self->_privacyLink && !self->_lockUpView && !self->_additionalLinkView)
      v15 = v15 + 28.0;
  }
LABEL_51:
  v36 = width;
  v37 = v15;
  result.height = v37;
  result.width = v36;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
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
  double Height;
  double v19;
  UIView *additionalLinkView;
  double v21;
  CGFloat v22;
  OBPrivacyLinkController *privacyLink;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  UITextView *buttonExplanationTextView;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  ASCLockupView *lockUpView;
  double v43;
  double v44;
  CGFloat v45;
  PKLegacyButtonInterface *primaryButton;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  _BOOL4 v57;
  double v58;
  CGFloat v59;
  PKLegacyButtonInterface *v60;
  PKPaymentSetupFooterView *footerView;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  objc_super v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v67.receiver = self;
  v67.super_class = (Class)PKPaymentSetupDockView;
  -[PKPaymentSetupDockView layoutSubviews](&v67, sel_layoutSubviews);
  if (self->_isBuddyiPad)
  {
    -[PKPaymentSetupDockView readableContentGuide](self, "readableContentGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutFrame");
    v66 = v4;
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    -[PKPaymentSetupDockView bounds](self, "bounds");
    v66 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  v15 = 0.0;
  v16 = 0.0;
  if (!self->_isBuddyiPad)
  {
    v16 = 24.0;
    if (-[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      if (self->_useAdjacentLayout)
        v16 = 24.0;
      else
        v16 = 44.0;
    }
  }
  v68.origin.x = v66;
  v68.origin.y = v6;
  v68.size.width = v8;
  v68.size.height = v10;
  v17 = CGRectGetWidth(v68) + v16 * -2.0;
  v69.origin.x = v66;
  v69.origin.y = v6;
  v69.size.width = v8;
  v69.size.height = v10;
  Height = CGRectGetHeight(v69);
  v19 = v66 + v16;
  additionalLinkView = self->_additionalLinkView;
  v65 = Height;
  if (additionalLinkView)
  {
    -[UIView sizeThatFits:](additionalLinkView, "sizeThatFits:", v17, Height);
    v22 = v21;
    -[UIView setFrame:](self->_additionalLinkView, "setFrame:", v19, 11.0, v17, v21);
    v70.origin.y = 11.0;
    v70.origin.x = v66 + v16;
    v70.size.width = v17;
    v70.size.height = v22;
    Height = v65;
    v15 = CGRectGetMaxY(v70) + self->_additionalLinkBottomPadding;
  }
  privacyLink = self->_privacyLink;
  v64 = v66 + v16;
  if (privacyLink)
  {
    v24 = v6;
    v25 = v10;
    v26 = v8;
    if (v15 == 0.0)
      v27 = 11.0;
    else
      v27 = 0.0;
    -[OBPrivacyLinkController view](privacyLink, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", 0.0, 0.0, v17, 0.0);
    objc_msgSend(v28, "setNeedsLayout");
    objc_msgSend(v28, "layoutIfNeeded");
    LODWORD(v29) = 1148846080;
    LODWORD(v30) = 1112014848;
    objc_msgSend(v28, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v17, Height, v29, v30);
    v32 = v31;
    v34 = v33;
    v35 = v15 + v27;
    v8 = v26;
    v10 = v25;
    v6 = v24;
    v19 = v64;
    -[OBPrivacyLinkController view](self->_privacyLink, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PKRectCenteredXInRect();
    objc_msgSend(v36, "setFrame:");

    v71.origin.x = v64;
    v71.origin.y = v35;
    v71.size.width = v32;
    v71.size.height = v34;
    v15 = CGRectGetMaxY(v71) + 30.0;

  }
  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (buttonExplanationTextView)
  {
    if (v15 == 0.0)
      v38 = 24.0;
    else
      v38 = v15;
    v39 = v65;
    -[UITextView sizeThatFits:](buttonExplanationTextView, "sizeThatFits:", v17, v65);
    v41 = v40;
    -[UITextView setFrame:](self->_buttonExplanationTextView, "setFrame:", v19, v38, v17, v40);
    v72.origin.x = v19;
    v72.origin.y = v38;
    v72.size.width = v17;
    v72.size.height = v41;
    v15 = CGRectGetMaxY(v72) + 25.0;
  }
  else
  {
    v39 = v65;
  }
  lockUpView = self->_lockUpView;
  v63 = v6;
  if (lockUpView)
  {
    if (v15 == 0.0)
      v43 = 5.0;
    else
      v43 = v15;
    -[ASCLockupView sizeThatFits:](lockUpView, "sizeThatFits:", v17, v39, *(_QWORD *)&v6);
    v45 = v44;
    -[ASCLockupView setFrame:](self->_lockUpView, "setFrame:", v19, v43, v17, v44);
    v73.origin.x = v19;
    v73.origin.y = v43;
    v73.size.width = v17;
    v73.size.height = v45;
    v15 = CGRectGetMaxY(v73) + 5.0;
  }
  primaryButton = self->_primaryButton;
  if (v15 != 0.0 || primaryButton == 0)
    v48 = v15;
  else
    v48 = v15 + 24.0;
  if (primaryButton && (!self->_useAdjacentLayout || !self->_footerView))
  {
    -[PKPaymentSetupDockView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", v17, v65, *(_QWORD *)&v63);
    v51 = v50;
    v52 = v10;
    v53 = v8;
    if (self->_useAdjacentLayout)
      v54 = (v17 + -12.0) * 0.5;
    else
      v54 = 327.0;
    v55 = *MEMORY[0x1E0C9D648];
    if (v49 >= 50.0)
      v56 = v49;
    else
      v56 = 50.0;
    v57 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    if (v54 <= v51)
      v58 = v51;
    else
      v58 = v54;
    v8 = v53;
    v10 = v52;
    v19 = v64;
    if (v57)
      v59 = v58;
    else
      v59 = v17;
    v60 = self->_primaryButton;
    PKRectCenteredXInRect();
    -[PKLegacyButtonInterface pkui_setBoundsAndPositionFromFrame:](v60, "pkui_setBoundsAndPositionFromFrame:");
    v74.origin.x = v55;
    v74.origin.y = v48;
    v74.size.width = v59;
    v74.size.height = v56;
    v48 = CGRectGetMaxY(v74) + 5.0;
  }
  footerView = self->_footerView;
  if (footerView)
  {
    if (!self->_primaryButton && !self->_privacyLink && !self->_lockUpView)
      v48 = v48 + 28.0;
    -[PKPaymentSetupFooterView sizeThatFits:](footerView, "sizeThatFits:", v8, v10, *(_QWORD *)&v63);
    -[PKPaymentSetupFooterView setFrame:](self->_footerView, "setFrame:", v19, v48, v17, v62);
  }
}

- (void)setButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PKLegacyButtonInterface setEnabled:](self->_primaryButton, "setEnabled:");
  -[PKPaymentSetupFooterView setButtonsEnabled:](self->_footerView, "setButtonsEnabled:", v3);
  -[ASCLockupView setUserInteractionEnabled:](self->_lockUpView, "setUserInteractionEnabled:", v3);
}

- (CGSize)_sizeForButton:(id)a3 constrainedToSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[2];
  _QWORD v23[3];
  CGSize result;

  height = a4.height;
  width = a4.width;
  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v6, "currentTitle");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6 && v9)
  {
    objc_msgSend(v6, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setAlignment:", objc_msgSend(v11, "textAlignment"));
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v22[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(v11, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = *MEMORY[0x1E0DC1178];
    v23[0] = v15;
    v23[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithString:attributes:", v10, v16);

    objc_msgSend(v17, "pkui_sizeThatFits:", width, height);
    v7 = v18;
    v8 = v19;

  }
  v20 = v7;
  v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)requiresAdditionalPrimaryButtonPadding
{
  return self->_requiresAdditionalPrimaryButtonPadding;
}

- (void)setRequiresAdditionalPrimaryButtonPadding:(BOOL)a3
{
  self->_requiresAdditionalPrimaryButtonPadding = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (double)additionalLinkBottomPadding
{
  return self->_additionalLinkBottomPadding;
}

- (UIView)additionalLinkView
{
  return self->_additionalLinkView;
}

- (NSString)buttonExplanationText
{
  return self->_buttonExplanationText;
}

- (ASCLockupView)lockUpView
{
  return self->_lockUpView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockUpView, 0);
  objc_storeStrong((id *)&self->_buttonExplanationText, 0);
  objc_storeStrong((id *)&self->_additionalLinkView, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_buttonExplanationTextView, 0);
  objc_storeStrong((id *)&self->_primaryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupDockView;
  v4 = a3;
  -[UIView pk_applyAppearance:](&v6, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "continueButtonTintColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupDockView setPrimaryButtonTintColor:](self, "setPrimaryButtonTintColor:", v5);
}

@end
