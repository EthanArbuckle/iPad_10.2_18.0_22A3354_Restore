@implementation PKPaymentSetupLabelFieldCell

- (PKPaymentSetupLabelFieldCell)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupLabelFieldCell;
  return -[PKPaymentSetupFieldCell init](&v3, sel_init);
}

- (id)editableTextField
{
  return 0;
}

- (double)minimumTextFieldOffset
{
  return 0.0;
}

- (void)_updateDisplay:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
    -[PKPaymentSetupFieldCell _applyDefaultValues](self, "_applyDefaultValues");
  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelFieldObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupLabelFieldCell _updateDisplayForFieldTypeLabel:](self, "_updateDisplayForFieldTypeLabel:", v4);

}

- (void)_updateDisplayForFieldTypeLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  UIButton *button;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *v20;
  void *v21;
  UIButton *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  v4 = a3;
  -[PKPaymentSetupLabelFieldCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC48B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v8);

  objc_msgSend(v5, "setNumberOfLines:", 0);
  v9 = objc_msgSend(v4, "alingment");
  if (v9 == 1)
  {
    v10 = 0;
  }
  else
  {
    if (v9 != 2)
      goto LABEL_6;
    v10 = 1;
  }
  objc_msgSend(v5, "setTextAlignment:", v10);
LABEL_6:
  objc_msgSend(v4, "buttonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  button = self->_button;
  if (v12)
  {
    if (!button)
    {
      v14 = (void *)MEMORY[0x1E0DC3520];
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pkui_plainConfigurationWithTitle:font:", v11, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x1E0DC3428];
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __64__PKPaymentSetupLabelFieldCell__updateDisplayForFieldTypeLabel___block_invoke;
      v26 = &unk_1E3E62BD0;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v17, "actionWithHandler:", &v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v16, v18, v23, v24, v25, v26);
      v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v20 = self->_button;
      self->_button = v19;

      -[UIButton setConfigurationUpdateHandler:](self->_button, "setConfigurationUpdateHandler:", &__block_literal_global_126);
      -[PKPaymentSetupLabelFieldCell contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", self->_button);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v22 = self->_button;
    self->_button = 0;

  }
}

void __64__PKPaymentSetupLabelFieldCell__updateDisplayForFieldTypeLabel___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_buttonTapped");

}

void __64__PKPaymentSetupLabelFieldCell__updateDisplayForFieldTypeLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTextAlignment:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  UIButton *button;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  PKFloatCeilToPixel();
  v7 = v6;
  v8 = width + PKTableViewCellTextInset() * -2.0;
  -[PKPaymentSetupLabelFieldCell layoutMargins](self, "layoutMargins");
  -[PKPaymentSetupLabelFieldCell layoutMargins](self, "layoutMargins");
  -[PKPaymentSetupLabelFieldCell layoutMargins](self, "layoutMargins");
  v10 = v9;
  -[PKPaymentSetupLabelFieldCell layoutMargins](self, "layoutMargins");
  v12 = height - (v10 + v11);
  -[PKPaymentSetupLabelFieldCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pkui_sizeThatFits:forceWordWrap:", 1, v8, v12);

  PKFloatCeilToPixel();
  v15 = v14 + 10.0 + 25.0;
  button = self->_button;
  if (button)
  {
    -[UIButton sizeThatFits:](button, "sizeThatFits:", v8, 1.79769313e308);
    PKFloatCeilToPixel();
    v15 = v15 + 25.0 + v17;
  }
  objc_msgSend((id)objc_opt_class(), "minimumCellHeight");
  if (v15 <= v18)
  {
    objc_msgSend((id)objc_opt_class(), "minimumCellHeight");
    v15 = v19;
  }
  v20 = v7;
  v21 = v15;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  UIButton *button;
  double v11;
  CGFloat v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupLabelFieldCell;
  -[PKPaymentSetupFieldCell layoutSubviews](&v14, sel_layoutSubviews);
  -[PKPaymentSetupLabelFieldCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 + PKTableViewCellTextInset() * -2.0;

  -[PKPaymentSetupLabelFieldCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = PKTableViewCellTextInset();
  -[PKPaymentSetupLabelFieldCell bounds](self, "bounds");
  objc_msgSend(v6, "pkui_sizeThatFits:forceWordWrap:", 1, v5, CGRectGetHeight(v15) + -10.0 + -25.0);
  PKFloatCeilToPixel();
  v9 = v8;
  objc_msgSend(v6, "setFrame:", v7, 10.0, v5, v8);
  button = self->_button;
  if (button)
  {
    -[UIButton frame](button, "frame");
    v11 = PKTableViewCellTextInset();
    v16.origin.y = 10.0;
    v16.origin.x = v7;
    v16.size.width = v5;
    v16.size.height = v9;
    v12 = CGRectGetMaxY(v16) + 25.0 + 25.0;
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v5, 1.79769313e308);
    PKFloatCeilToPixel();
    -[UIButton setFrame:](self->_button, "setFrame:", v11, v12, v5, v13);
  }

}

- (void)_buttonTapped
{
  id v3;

  -[PKPaymentSetupFieldCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "fieldCellDidTapButton:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupLabelFieldCell;
  v4 = a3;
  -[PKPaymentSetupFieldCell pk_applyAppearance:](&v6, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "backgroundColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupLabelFieldCell setBackgroundColor:](self, "setBackgroundColor:", v5);
}

@end
