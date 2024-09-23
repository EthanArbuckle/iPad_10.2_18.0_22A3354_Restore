@implementation PKApplyListPickerRow

- (PKApplyListPickerRow)initWithPickerItem:(id)a3
{
  id v5;
  PKApplyListPickerRow *v6;
  PKApplyListPickerRow *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *submissionValue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyListPickerRow;
  v6 = -[PKApplyListPickerRow init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pickerItem, a3);
    objc_msgSend(v5, "localizedDisplayName");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v8;

    objc_msgSend(v5, "submissionValue");
    v10 = objc_claimAutoreleasedReturnValue();
    submissionValue = v7->_submissionValue;
    v7->_submissionValue = (NSString *)v10;

  }
  return v7;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_submissionValue;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKApplyListPickerRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_selected)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC3548]);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTintColor:", v7);

      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessories:", v8);

    }
    else
    {
      objc_msgSend(v4, "setAccessories:", MEMORY[0x1E0C9AA60]);
    }
    objc_msgSend(v5, "textProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(v5, "setText:", self->_title);
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKProvisioningSecondaryBackgroundColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

    objc_msgSend(v4, "setBackgroundConfiguration:", v11);
    objc_msgSend(v4, "setContentConfiguration:", v5);
    objc_msgSend(v4, "setAccessibilityIdentifier:", self->_submissionValue);

  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)submissionValue
{
  return self->_submissionValue;
}

- (PKPaymentSetupFieldPickerItem)pickerItem
{
  return self->_pickerItem;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerItem, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
