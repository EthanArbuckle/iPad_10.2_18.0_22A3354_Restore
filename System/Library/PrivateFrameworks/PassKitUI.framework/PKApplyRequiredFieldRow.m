@implementation PKApplyRequiredFieldRow

- (PKApplyRequiredFieldRow)initWithField:(id)a3 cellDelegate:(id)a4
{
  id v7;
  id v8;
  PKApplyRequiredFieldRow *v9;
  PKApplyRequiredFieldRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplyRequiredFieldRow;
  v9 = -[PKApplyRequiredFieldRow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_field, a3);
    objc_storeWeak((id *)&v10->_cellDelegate, v8);
  }

  return v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)-[PKPaymentSetupField identifier](self->_field, "identifier");
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PKApplyRequiredFieldRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v13;
    +[PKListTextFieldContentConfiguration valueCellConfiguration](PKListTextFieldContentConfiguration, "valueCellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField currentValue](self->_field, "currentValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

    -[PKPaymentSetupField localizedPlaceholder](self->_field, "localizedPlaceholder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholderText:", v7);

    objc_msgSend(v5, "setClearsOnBeginEditing:", 0);
    objc_msgSend(v5, "directionalLayoutMargins");
    objc_msgSend(v5, "setDirectionalLayoutMargins:", 10.0);
    objc_msgSend(v5, "setKeyboardType:", 1);
    objc_msgSend(v5, "setReturnKeyType:", 9);
    objc_msgSend(v5, "secondaryTextProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4918]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v4, "setContentConfiguration:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_cellDelegate);
    objc_msgSend(v4, "setDelegate:", WeakRetained);

    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

    objc_msgSend(v4, "setBackgroundConfiguration:", v11);
    objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F78]);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cellDelegate);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
