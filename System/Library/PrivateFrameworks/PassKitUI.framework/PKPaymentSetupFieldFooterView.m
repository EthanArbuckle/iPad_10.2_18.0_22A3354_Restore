@implementation PKPaymentSetupFieldFooterView

- (void)setField:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_field, a3);
    -[PKPaymentSetupFieldFooterView _updateDisplayForFieldTypeLabel](self, "_updateDisplayForFieldTypeLabel");
  }

}

- (void)_updateDisplayForFieldTypeLabel
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  UIButton *button;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  UIButton *v25;
  UIButton *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;

  -[PKPaymentSetupFieldFooterView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)*MEMORY[0x1E0DC4AB8];
  if (-[PKPaymentSetupFieldLabel isFieldTypeFooter](self->_field, "isFieldTypeFooter"))
  {
    -[PKPaymentSetupFieldLabel footerFieldObject](self->_field, "footerFieldObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fontScale");

    if (v6 == 1)
    {
      v7 = (id)*MEMORY[0x1E0DC4B10];

      v4 = v7;
    }
  }
  v8 = (NSString *)*MEMORY[0x1E0DC48B8];
  PKFontForDefaultDesign((NSString *)v4, (NSString *)*MEMORY[0x1E0DC48B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v10);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  -[PKPaymentSetupFieldLabel title](self->_field, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)v4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByParsingEmphasisInString(v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAttributedText:", v13);
  v14 = -[PKPaymentSetupFieldLabel alingment](self->_field, "alingment");
  if (v14 == 1)
  {
    v15 = 0;
  }
  else
  {
    if (v14 != 2)
      goto LABEL_9;
    v15 = 1;
  }
  objc_msgSend(v3, "setTextAlignment:", v15);
LABEL_9:
  -[PKPaymentSetupFieldLabel buttonTitle](self->_field, "buttonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  button = self->_button;
  if (v17)
  {
    if (!button)
    {
      v19 = (void *)MEMORY[0x1E0DC3520];
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pkui_plainConfigurationWithTitle:font:", v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v22 = (void *)MEMORY[0x1E0DC3428];
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __64__PKPaymentSetupFieldFooterView__updateDisplayForFieldTypeLabel__block_invoke;
      v30 = &unk_1E3E62BD0;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v22, "actionWithHandler:", &v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v21, v23, v27, v28, v29, v30);
      v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v25 = self->_button;
      self->_button = v24;

      -[UIButton setConfigurationUpdateHandler:](self->_button, "setConfigurationUpdateHandler:", &__block_literal_global_183);
      -[PKPaymentSetupFieldFooterView addSubview:](self, "addSubview:", self->_button);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v26 = self->_button;
    self->_button = 0;

  }
  -[PKPaymentSetupFieldFooterView setNeedsLayout](self, "setNeedsLayout");

}

void __64__PKPaymentSetupFieldFooterView__updateDisplayForFieldTypeLabel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_buttonTapped");

}

void __64__PKPaymentSetupFieldFooterView__updateDisplayForFieldTypeLabel__block_invoke_2(uint64_t a1, void *a2)
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
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  UIButton *button;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  PKFloatCeilToPixel();
  v7 = v6;
  v8 = width + PKTableViewCellTextInset() * -2.0;
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutMargins");

  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMargins");
  v13 = v12;
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  v16 = height - (v13 + v15);

  -[PKPaymentSetupFieldFooterView textLabel](self, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pkui_sizeThatFits:forceWordWrap:", 1, v8, v16);

  PKFloatCeilToPixel();
  v19 = v18 + 10.0 + 12.0;
  button = self->_button;
  if (button)
  {
    v21 = v19 + 25.0;
    -[UIButton sizeThatFits:](button, "sizeThatFits:", v8, 1.79769313e308);
    PKFloatCeilToPixel();
    v19 = v21 + v22;
  }
  v23 = v7;
  result.height = v19;
  result.width = v23;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MinX;
  double MaxX;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  UIButton *button;
  double v35;
  CGFloat v36;
  double v37;
  CGRect recta;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  *(_QWORD *)&recta.size.width = self;
  *(_QWORD *)&recta.size.height = PKPaymentSetupFieldFooterView;
  -[CGSize layoutSubviews]((objc_super *)&recta.size, sel_layoutSubviews);
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  recta.origin.x = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPaymentSetupFieldFooterView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  MinX = CGRectGetMinX(v39);
  v40.origin.x = v13;
  v40.origin.y = v15;
  v40.size.width = v17;
  v40.size.height = v19;
  recta.origin.y = MinX - CGRectGetMinX(v40);
  v41.origin.x = v13;
  v41.origin.y = v15;
  v41.size.width = v17;
  v41.size.height = v19;
  MaxX = CGRectGetMaxX(v41);
  v42.origin.x = recta.origin.x;
  v42.origin.y = v7;
  v42.size.width = v9;
  v42.size.height = v11;
  v22 = MaxX - CGRectGetMaxX(v42);
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v22 + recta.origin.y + v24 + PKTableViewCellTextInset() * -2.0;

  v26 = PKTableViewCellTextInset();
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v26 - v28;

  -[PKPaymentSetupFieldFooterView textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  -[PKPaymentSetupFieldFooterView contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  objc_msgSend(v30, "pkui_sizeThatFits:forceWordWrap:", 1, v25, CGRectGetHeight(v43) + 10.0 + 12.0);

  PKFloatCeilToPixel();
  v33 = v32;
  objc_msgSend(v30, "setFrame:", v29, 10.0, v25, v32);
  button = self->_button;
  if (button)
  {
    -[UIButton frame](button, "frame");
    v35 = PKTableViewCellTextInset();
    v44.origin.y = 10.0;
    v44.origin.x = v29;
    v44.size.width = v25;
    v44.size.height = v33;
    v36 = CGRectGetMaxY(v44) + 12.0 + 25.0;
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v25, 1.79769313e308);
    PKFloatCeilToPixel();
    -[UIButton setFrame:](self->_button, "setFrame:", v35, v36, v25, v37);
  }

}

- (void)_buttonTapped
{
  id v3;

  -[PKPaymentSetupFieldFooterView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "fieldFooterViewDidTapButton:", self->_field);

}

- (PKPaymentSetupFieldLabel)field
{
  return self->_field;
}

- (PKPaymentSetupFieldFooterViewDelegate)delegate
{
  return (PKPaymentSetupFieldFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
