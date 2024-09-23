@implementation DatePickerTableViewCell

- (DatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DatePickerTableViewCell *v4;
  UIDatePicker *v5;
  UIDatePicker *datePicker;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DatePickerTableViewCell;
  v4 = -[DatePickerTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UIDatePicker);
    datePicker = v4->_datePicker;
    v4->_datePicker = v5;

    -[UIDatePicker setPreferredDatePickerStyle:](v4->_datePicker, "setPreferredDatePickerStyle:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell contentView](v4, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](v4, "datePicker"));
    objc_msgSend(v7, "addSubview:", v8);

    -[DatePickerTableViewCell setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](self, "datePicker"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](self, "datePicker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](self, "datePicker"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](self, "datePicker"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](self, "datePicker"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));

  v25[0] = v8;
  v25[1] = v18;
  v25[2] = v13;
  v25[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DatePickerTableViewCell datePicker](self, "datePicker"));
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;

  v5 = UIViewNoIntrinsicMetric;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
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
