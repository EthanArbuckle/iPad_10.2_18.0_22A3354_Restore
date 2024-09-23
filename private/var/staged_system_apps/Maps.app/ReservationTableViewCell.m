@implementation ReservationTableViewCell

- (ReservationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ReservationTableViewCell *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ReservationTableViewCell;
  v4 = -[ReservationTableViewCell initWithStyle:reuseIdentifier:](&v15, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    -[ReservationTableViewCell setTitleLabel:](v4, "setTitleLabel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleBody, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v9, "setTextColor:", v8);

    -[ReservationTableViewCell loadDetailView](v4, "loadDetailView");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell contentView](v4, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v10, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell contentView](v4, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailView](v4, "detailView"));
    objc_msgSend(v12, "addSubview:", v13);

    -[ReservationTableViewCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)loadDetailView
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(UILabel);
  -[ReservationTableViewCell setDetailLabel:](self, "setDetailLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleBody, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailLabel](self, "detailLabel"));
  -[ReservationTableViewCell setDetailView:](self, "setDetailView:", v8);

}

- (void)_setupConstraints
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
  _QWORD v23[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailView](self, "detailView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutMarginsGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailView](self, "detailView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutMarginsGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailView](self, "detailView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", v20, 20.0));

  v23[0] = v10;
  v23[1] = v16;
  v23[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  -[ReservationTableViewCell setupTextVerticalConstraints](self, "setupTextVerticalConstraints");
}

- (void)setupTextVerticalConstraints
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
  _QWORD v21[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutMarginsGuide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutMarginsGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailView](self, "detailView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstBaselineAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));

  v21[0] = v8;
  v21[1] = v14;
  v21[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_titleText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

    -[ReservationTableViewCell updateLabels](self, "updateLabels");
  }

}

- (void)setDetailText:(id)a3
{
  NSString *v4;
  NSString *detailText;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_detailText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    detailText = self->_detailText;
    self->_detailText = v4;

    -[ReservationTableViewCell updateLabels](self, "updateLabels");
  }

}

- (void)updateLabels
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleText](self, "titleText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setText:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailText](self, "detailText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v5, "setText:", v6);

}

- (void)setDetailTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (UIColor)detailTextColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell detailLabel](self, "detailLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (void)setTitleTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (UIColor)titleTextColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)detailView
{
  return self->_detailView;
}

- (void)setDetailView:(id)a3
{
  objc_storeStrong((id *)&self->_detailView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
