@implementation WFTimePickerTableViewCell

- (WFTimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTimePickerTableViewCell *v4;
  uint64_t v5;
  UIDatePicker *datePicker;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFTimePickerTableViewCell *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)WFTimePickerTableViewCell;
  v4 = -[WFTimePickerTableViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    datePicker = v4->_datePicker;
    v4->_datePicker = (UIDatePicker *)v5;

    -[UIDatePicker setDatePickerMode:](v4->_datePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setPreferredDatePickerStyle:](v4->_datePicker, "setPreferredDatePickerStyle:", 1);
    -[WFTimePickerTableViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_datePicker);

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v4->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)MEMORY[0x24BDD1628];
    -[UIDatePicker trailingAnchor](v4->_datePicker, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimePickerTableViewCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    -[UIDatePicker topAnchor](v4->_datePicker, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimePickerTableViewCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v19;
    -[UIDatePicker bottomAnchor](v4->_datePicker, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimePickerTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v11;
    -[UIDatePicker leadingAnchor](v4->_datePicker, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimePickerTableViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

    v17 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTimePickerTableViewCell;
  -[WFTimePickerTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WFTimePickerTableViewCell datePicker](self, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
