@implementation PKPaymentSetupMenuPickerFieldCell

- (BOOL)becomeFirstResponder
{
  objc_super v3;

  if (self->_button)
  {
    -[UIButton performPrimaryAction](self->_button, "performPrimaryAction");
    return 0;
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)PKPaymentSetupMenuPickerFieldCell;
    return -[PKPaymentSetupFieldCell becomeFirstResponder](&v3, sel_becomeFirstResponder);
  }
}

- (PKPaymentSetupMenuPickerFieldCell)init
{
  PKPaymentSetupMenuPickerFieldCell *v2;
  uint64_t v3;
  UIListContentConfiguration *referenceConfiguration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupMenuPickerFieldCell;
  v2 = -[PKPaymentSetupFieldCell init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
    v3 = objc_claimAutoreleasedReturnValue();
    referenceConfiguration = v2->_referenceConfiguration;
    v2->_referenceConfiguration = (UIListContentConfiguration *)v3;

  }
  return v2;
}

- (id)editableTextField
{
  return 0;
}

- (void)_updateDisplay:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
    -[PKPaymentSetupFieldCell _applyDefaultValues](self, "_applyDefaultValues");
  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerFieldObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupMenuPickerFieldCell _updateDisplayForFieldTypePicker:](self, "_updateDisplayForFieldTypePicker:", v4);

}

- (void)_updatePaymentSetupFieldPickerItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerFieldObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCurrentValue:", v4);
  -[PKPaymentSetupMenuPickerFieldCell _pullCurrentValueFromField](self, "_pullCurrentValueFromField");

}

- (void)_pullCurrentValueFromField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  UIMenu *v16;
  UIMenu *menu;
  id v18;

  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentValue");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[UIButton configuration](self->_button, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseForegroundColor:", v7);

    -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pickerFieldObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v18);

    -[UIMenu children](self->_menu, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v12, "count"))
    {
      v14 = 0;
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setState:", v11 == v14);
        objc_msgSend(v13, "addObject:", v15);

        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
    }
    -[UIMenu menuByReplacingChildren:](self->_menu, "menuByReplacingChildren:", v13);
    v16 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    menu = self->_menu;
    self->_menu = v16;

    -[UIButton setMenu:](self->_button, "setMenu:", self->_menu);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseForegroundColor:", v12);
  }

  -[UIButton setConfiguration:](self->_button, "setConfiguration:", v4);
}

- (void)_updateDisplayForFieldTypePicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIMenu *v11;
  UIMenu *menu;
  UIButton *button;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  UIButton *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id location;

  v4 = a3;
  if (PKUIGetMinScreenWidthType())
    objc_msgSend(v4, "localizedDisplayName");
  else
    objc_msgSend(v4, "compactLocalizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupMenuPickerFieldCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_initWeak(&location, self);
  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerFieldObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pickerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke;
  v26 = &unk_1E3E6FE80;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v9, "pk_arrayByApplyingBlock:", &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v10, v23, v24, v25, v26);
  v11 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  menu = self->_menu;
  self->_menu = v11;

  button = self->_button;
  if (!button)
  {
    v14 = (void *)MEMORY[0x1E0DC3520];
    objc_msgSend(v4, "localizedDisplayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pkui_plainConfigurationWithTitle:font:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBaseForegroundColor:", v18);

    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(v4, "localizedPlaceholder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v19);

    objc_msgSend(v17, "setIndicator:", 2);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v17, 0);
    v20 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v21 = self->_button;
    self->_button = v20;

    -[UIButton setShowsMenuAsPrimaryAction:](self->_button, "setShowsMenuAsPrimaryAction:", 1);
    -[PKPaymentSetupMenuPickerFieldCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", self->_button);

    button = self->_button;
  }
  -[UIButton setMenu:](button, "setMenu:", self->_menu);
  -[PKPaymentSetupMenuPickerFieldCell _pullCurrentValueFromField](self, "_pullCurrentValueFromField");

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

id __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v3, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke_2;
  v9[3] = &unk_1E3E659D0;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v6 = v3;
  v10 = v6;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  return v7;
}

void __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePaymentSetupFieldPickerItem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  PKFloatCeilToPixel();
  v7 = v6;
  v8 = width + PKTableViewCellTextInset() * -2.0;
  -[PKPaymentSetupMenuPickerFieldCell layoutMargins](self, "layoutMargins");
  -[PKPaymentSetupMenuPickerFieldCell layoutMargins](self, "layoutMargins");
  -[PKPaymentSetupMenuPickerFieldCell layoutMargins](self, "layoutMargins");
  v10 = v9;
  -[PKPaymentSetupMenuPickerFieldCell layoutMargins](self, "layoutMargins");
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v8, height - (v10 + v11));
  PKFloatCeilToPixel();
  v13 = v12 + 0.0;
  objc_msgSend((id)objc_opt_class(), "minimumCellHeight");
  if (v13 <= v14)
  {
    objc_msgSend((id)objc_opt_class(), "minimumCellHeight");
    v13 = v15;
  }
  v16 = v7;
  v17 = v13;
  result.height = v17;
  result.width = v16;
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
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  NSString *v22;
  BOOL IsAccessibilityCategory;
  double v24;
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
  CGFloat MaxX;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  objc_super v44;
  CGRect v45;
  CGRect v46;

  v44.receiver = self;
  v44.super_class = (Class)PKPaymentSetupMenuPickerFieldCell;
  -[PKPaymentSetupFieldCell layoutSubviews](&v44, sel_layoutSubviews);
  -[PKPaymentSetupMenuPickerFieldCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupMenuPickerFieldCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v43 = v7;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "frame");
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v9, v11);
  objc_msgSend(v4, "bounds");
  v12 = -[PKPaymentSetupMenuPickerFieldCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIListContentConfiguration directionalLayoutMargins](self->_referenceConfiguration, "directionalLayoutMargins");
  if (v12)
    v17 = v16;
  else
    v17 = v14;
  if (!v12)
    v14 = v16;
  v18 = v9 - (v17 + v14);
  objc_msgSend(v3, "sizeThatFits:", v18, v11 - (v13 + v15), *(_QWORD *)&v13);
  v20 = v19;
  -[PKPaymentSetupMenuPickerFieldCell traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredContentSizeCategory");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

  v24 = 0.0;
  if (!IsAccessibilityCategory)
    -[PKPaymentSetupFieldCell minimumTextLabelWidth](self, "minimumTextLabelWidth", 0.0);
  v25 = v6 + v17;
  v26 = fmin(fmax(v20, v24), v18 + -122.0);
  UIRectCenteredYInRect();
  v41 = v28;
  v42 = v27;
  v30 = v29;
  UIRectCenteredYInRect();
  v33 = v31;
  v34 = v32;
  if ((v12 & 1) != 0)
  {
    v45.size.height = v39;
    v45.origin.y = v43 + v40;
    v45.origin.x = v25;
    v45.size.width = v18;
    MaxX = CGRectGetMaxX(v45);
    v36 = MaxX - v26;
    objc_msgSend(v3, "setFrame:", MaxX - v26, v33, v26, v34);
    v37 = v36 - v30;
    v38 = -22.0;
  }
  else
  {
    objc_msgSend(v3, "setFrame:", v25, v31, v26, v32);
    v46.origin.x = v25;
    v46.origin.y = v33;
    v46.size.width = v26;
    v46.size.height = v34;
    v37 = CGRectGetMaxX(v46);
    v38 = 22.0;
  }
  -[UIButton setFrame:](self->_button, "setFrame:", v37 + v38, v42, v30, v41);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceConfiguration, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
