@implementation VUIBuyButtonLockup

- (VUIBuyButtonLockup)initWithFrame:(CGRect)a3
{
  VUIBuyButtonLockup *v3;
  uint64_t v4;
  UIButton *button;
  UIButton *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *buttonHeightConstraint;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  UILabel *iAPLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VUIBuyButtonLockup;
  v3 = -[VUIUIStackView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    v6 = v3->_button;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = v3->_button;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v8, "setTitleColor:forState:", v9, 0);

    -[VUIBuyButtonLockup addArrangedSubview:](v3, "addArrangedSubview:", v3->_button);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContentEdgeInsets:](v3->_button, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
    -[UIButton heightAnchor](v3->_button, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 28.0);
    v11 = objc_claimAutoreleasedReturnValue();
    buttonHeightConstraint = v3->_buttonHeightConstraint;
    v3->_buttonHeightConstraint = (NSLayoutConstraint *)v11;

    -[NSLayoutConstraint setActive:](v3->_buttonHeightConstraint, "setActive:", 1);
    -[UIButton widthAnchor](v3->_button, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:", 68.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    v15 = objc_alloc(MEMORY[0x1E0DC3990]);
    v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    iAPLabel = v3->_iAPLabel;
    v3->_iAPLabel = (UILabel *)v16;

    -[VUIBuyButtonLockup addArrangedSubview:](v3, "addArrangedSubview:", v3->_iAPLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_iAPLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_iAPLabel, "setNumberOfLines:", 0);
    v18 = v3->_iAPLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 8.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v3->_iAPLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    v22 = v3->_iAPLabel;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("APP_INSTALL_OFFERS_IN_APP_PURCHASES"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v22, "setText:", v24);

    -[UILabel setHidden:](v3->_iAPLabel, "setHidden:", 1);
    -[VUIBuyButtonLockup _updateForPreferredContentSize](v3, "_updateForPreferredContentSize");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIBuyButtonLockup;
  -[VUIBuyButtonLockup dealloc](&v4, sel_dealloc);
}

- (void)setHasIAP:(BOOL)a3
{
  if (self->_hasIAP != a3)
  {
    -[UILabel setHidden:](self->_iAPLabel, "setHidden:", !a3);
    -[VUIBuyButtonLockup invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (BOOL)_isLargeContentSize
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48B8]);

  return v4;
}

- (void)_updateForPreferredContentSize
{
  _BOOL4 v3;
  NSLayoutConstraint *buttonHeightConstraint;
  UIButton **p_button;
  UIButton *button;
  void *v7;
  double v8;
  UIButton *v9;

  v3 = -[VUIBuyButtonLockup _isLargeContentSize](self, "_isLargeContentSize");
  buttonHeightConstraint = self->_buttonHeightConstraint;
  if (v3)
  {
    -[NSLayoutConstraint setConstant:](buttonHeightConstraint, "setConstant:", 34.0);
    p_button = &self->_button;
    button = self->_button;
    objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 4, 2, 21.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _setFont:](button, "_setFont:", v7);
    v8 = 17.0;
  }
  else
  {
    -[NSLayoutConstraint setConstant:](buttonHeightConstraint, "setConstant:", 28.0);
    p_button = &self->_button;
    v9 = self->_button;
    objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 4, 2, 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _setFont:](v9, "_setFont:", v7);
    v8 = 14.0;
  }

  -[UIButton _setContinuousCornerRadius:](*p_button, "_setContinuousCornerRadius:", v8);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)hasIAP
{
  return self->_hasIAP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_iAPLabel, 0);
}

@end
