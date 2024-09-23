@implementation BookingConfirmationCell

- (BookingConfirmationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BookingConfirmationCell *v4;
  UILabel *v5;
  UILabel *details;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BookingConfirmationCell;
  v4 = -[BookingConfirmationCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    details = v4->_details;
    v4->_details = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_details, "setTextColor:", v7);

    -[UILabel setTextAlignment:](v4->_details, "setTextAlignment:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_details, "setBackgroundColor:", v8);

    -[UILabel setNumberOfLines:](v4->_details, "setNumberOfLines:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 18.0));
    -[UILabel setFont:](v4->_details, "setFont:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell contentView](v4, "contentView"));
    objc_msgSend(v10, "addSubview:", v4->_details);

    -[BookingConfirmationCell initConstraints](v4, "initConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    -[BookingConfirmationCell setBackgroundColor:](v4, "setBackgroundColor:", v11);

  }
  return v4;
}

- (void)initConstraints
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell details](self, "details"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell details](self, "details"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell details](self, "details"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutMarginsGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell details](self, "details"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layoutMarginsGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BookingConfirmationCell details](self, "details"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 20.0));

  v29[0] = v9;
  v29[1] = v21;
  v29[2] = v15;
  v29[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (UILabel)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
}

@end
