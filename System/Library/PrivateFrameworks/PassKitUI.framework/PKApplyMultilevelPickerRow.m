@implementation PKApplyMultilevelPickerRow

- (PKApplyMultilevelPickerRow)initWithPicker:(id)a3
{
  id v5;
  PKApplyMultilevelPickerRow *v6;
  PKApplyMultilevelPickerRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyMultilevelPickerRow;
  v6 = -[PKApplyMultilevelPickerRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_picker, a3);

  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)-[PKPaymentSetupFieldPicker identifier](self->_picker, "identifier");
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKApplyMultilevelPickerRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[PKPaymentSetupFieldPicker localizedDisplayName](self->_picker, "localizedDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldPicker localizedPlaceholder](self->_picker, "localizedPlaceholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldPicker currentValue](self->_picker, "currentValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PKPaymentSetupFieldPicker currentValue](self->_picker, "currentValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDisplayName");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      v8 = (void *)v12;
    }
    objc_msgSend(v5, "setText:", v8);
    objc_msgSend(v5, "setSecondaryText:", v9);
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKProvisioningSecondaryBackgroundColor();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(v4, "setBackgroundConfiguration:", v13);
    objc_msgSend(v4, "setContentConfiguration:", v5);
    v15 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessories:", v16);

    -[PKApplyMultilevelPickerRow identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityIdentifier:", v17);

  }
}

- (PKPaymentSetupFieldPicker)picker
{
  return self->_picker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
