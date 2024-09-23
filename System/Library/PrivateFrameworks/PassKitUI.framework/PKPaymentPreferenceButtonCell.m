@implementation PKPaymentPreferenceButtonCell

- (PKPaymentPreferenceButtonCell)initWithReuseIdentifier:(id)a3
{
  id v4;
  PKPaymentPreferenceButtonCell *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  UIButton *button;
  UIButton *v18;
  void *v19;
  _QWORD v21[4];
  BOOL v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPreferenceButtonCell;
  v5 = -[PKPaymentPreferenceCell initWithReuseIdentifier:](&v26, sel_initWithReuseIdentifier_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceLayoutDirection");

    v8 = (void *)MEMORY[0x1E0DC3520];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pkui_plainConfigurationWithTitle:font:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBaseForegroundColor:", v11);

    if (v7 == 1)
      v12 = 0.0;
    else
      v12 = 16.0;
    objc_msgSend(v10, "setContentInsets:", 0.0, v12);
    objc_initWeak(&location, v5);
    v13 = (void *)MEMORY[0x1E0DC3428];
    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke;
    v23[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v13, "actionWithHandler:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    button = v5->_button;
    v5->_button = (UIButton *)v16;

    v18 = v5->_button;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke_2;
    v21[3] = &__block_descriptor_33_e18_v16__0__UIButton_8l;
    v22 = v7 == 1;
    -[UIButton setConfigurationUpdateHandler:](v18, "setConfigurationUpdateHandler:", v21);
    -[PKPaymentPreferenceButtonCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v5->_button);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "buttonTapped:", v4);
}

void __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 2 * *(unsigned __int8 *)(a1 + 32));

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPreferenceButtonCell;
  -[PKPaymentPreferenceButtonCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKPaymentPreferenceButtonCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIButton setFrame:](self->_button, "setFrame:", v5, v7, v9, v11);
}

- (void)setButtonTitle:(id)a3
{
  UIButton *button;
  id v5;
  NSString *v6;
  NSString *buttonTitle;

  button = self->_button;
  v5 = a3;
  -[UIButton pkui_updateConfigurationWithTitle:](button, "pkui_updateConfigurationWithTitle:", v5);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  buttonTitle = self->_buttonTitle;
  self->_buttonTitle = v6;

}

- (void)buttonTapped:(id)a3
{
  void (**handler)(void);

  handler = (void (**)(void))self->_handler;
  if (handler)
    handler[2]();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  width = a3.width;
  v5 = 0.0;
  if (-[PKPaymentPreferenceButtonCell isEditing](self, "isEditing", a3.width, a3.height))
  {
    -[PKPaymentPreferenceButtonCell bounds](self, "bounds");
    v6 = CGRectGetWidth(v16);
    -[PKPaymentPreferenceButtonCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v5 = v6 - CGRectGetWidth(v17);

  }
  -[UIButton titleLabel](self->_button, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width - v5 + -16.0, 1.79769313e308);
  v10 = v9;
  v12 = v11;

  v13 = v12 + 10.0;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (id)pk_childrenForAppearance
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_button;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
