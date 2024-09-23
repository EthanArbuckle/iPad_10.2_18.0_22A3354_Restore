@implementation CarplayNoEventsTableViewCell

- (CarplayNoEventsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayNoEventsTableViewCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *label;
  double v8;
  uint64_t v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)CarplayNoEventsTableViewCell;
  v4 = -[CarplayNoEventsTableViewCell initWithStyle:reuseIdentifier:](&v29, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarplayNoEventsTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[CarplayNoEventsTableViewCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v6 = objc_opt_new(UILabel);
    label = v4->_label;
    v4->_label = v6;

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    *(_QWORD *)&v8 = objc_opt_class(v4).n128_u64[0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v9, v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("No More Events Today"), &stru_1001B67C0, 0));
    -[UILabel setText:](v4->_label, "setText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsTableViewCell traitCollection](v4, "traitCollection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v13));
    -[UILabel setFont:](v4->_label, "setFont:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarplayNoEventsTableViewCell addSubview:](v4, "addSubview:", v4->_label);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsTableViewCell leadingAnchor](v4, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v30[0] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsTableViewCell trailingAnchor](v4, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v15));
    v30[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_label, "firstBaselineAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsTableViewCell topAnchor](v4, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 38.0));
    v30[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsTableViewCell bottomAnchor](v4, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v4->_label, "lastBaselineAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 12.0));
    v30[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
