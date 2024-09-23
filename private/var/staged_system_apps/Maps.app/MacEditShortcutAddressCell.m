@implementation MacEditShortcutAddressCell

- (MacEditShortcutAddressCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MacEditShortcutAddressCell *v4;
  MacEditShortcutAddressCell *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *label;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v26.receiver = self;
  v26.super_class = (Class)MacEditShortcutAddressCell;
  v4 = -[MacEditShortcutAddressCell initWithStyle:reuseIdentifier:](&v26, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MacEditShortcutAddressCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("MacEditShortcutAddressCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacEditShortcutAddressCell contentView](v5, "contentView"));
    v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("MacEditShortcutAddressLabel"));
    objc_msgSend(v6, "addSubview:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v7, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
    label = v5->_label;
    v5->_label = v7;
    v11 = v7;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v11, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 17.0));
    v27[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v11, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -17.0));
    v27[1] = v20;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v11, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v27[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v11, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v27[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  return v5;
}

- (void)setAddress:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)address
{
  return -[UILabel text](self->_label, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
