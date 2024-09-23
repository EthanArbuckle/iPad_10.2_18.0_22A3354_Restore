@implementation PKApplyRadioPickerTitleRow

- (PKApplyRadioPickerTitleRow)initWithTitle:(id)a3
{
  id v5;
  PKApplyRadioPickerTitleRow *v6;
  PKApplyRadioPickerTitleRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyRadioPickerTitleRow;
  v6 = -[PKApplyRadioPickerTitleRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_title, a3);

  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_title;
}

- (void)configureCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0DC39A8];
  v5 = a3;
  objc_msgSend(v4, "cellConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  v8 = PKTableViewCellTextInset();
  objc_msgSend(v11, "setDirectionalLayoutMargins:", v8, v8, 0.0, v8);
  objc_msgSend(v11, "setText:", self->_title);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningSecondaryBackgroundColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v5, "setBackgroundConfiguration:", v9);
  objc_msgSend(v5, "setContentConfiguration:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
