@implementation MacRAPTableViewFooterView

- (MacRAPTableViewFooterView)initWithReuseIdentifier:(id)a3
{
  MacRAPTableViewFooterView *v3;
  UILabel *v4;
  UILabel *footerLabel;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)MacRAPTableViewFooterView;
  v3 = -[MacRAPTableViewFooterView initWithReuseIdentifier:](&v29, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    footerLabel = v3->_footerLabel;
    v3->_footerLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_footerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system16](UIFont, "system16"));
    -[UILabel setFont:](v3->_footerLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](v3->_footerLabel, "setNumberOfLines:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UILabel setTextColor:](v3->_footerLabel, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPTableViewFooterView contentView](v3, "contentView"));
    objc_msgSend(v8, "addSubview:", v3->_footerLabel);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_footerLabel, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPTableViewFooterView contentView](v3, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 30.0));
    v30[0] = v25;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_footerLabel, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPTableViewFooterView contentView](v3, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -30.0));
    v30[1] = v21;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_footerLabel, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPTableViewFooterView contentView](v3, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 18.0));
    v30[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_footerLabel, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPTableViewFooterView contentView](v3, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -18.0));
    v30[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPTableViewFooterView contentView](v3, "contentView"));
    objc_msgSend(v19, "setBackgroundColor:", v18);

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MacRAPTableViewFooterView;
  -[MacRAPTableViewFooterView prepareForReuse](&v3, "prepareForReuse");
  -[UILabel setText:](self->_footerLabel, "setText:", 0);
}

- (NSString)footerString
{
  return -[UILabel text](self->_footerLabel, "text");
}

- (void)setFooterString:(id)a3
{
  -[UILabel setText:](self->_footerLabel, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end
