@implementation RestaurantReservationsChooseOfferCell

- (RestaurantReservationsChooseOfferCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RestaurantReservationsChooseOfferCell *v4;
  UILabel *v5;
  UILabel *mainLabel;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *subLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RestaurantReservationsChooseOfferCell;
  v4 = -[RestaurantReservationsChooseOfferCell initWithStyle:reuseIdentifier:](&v16, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Bold](UIFont, "system15Bold"));
    -[UILabel setFont:](v4->_mainLabel, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_mainLabel, "setTextColor:", v8);

    v9 = objc_opt_new(UILabel);
    subLabel = v4->_subLabel;
    v4->_subLabel = v9;

    -[UILabel setNumberOfLines:](v4->_subLabel, "setNumberOfLines:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 13.0));
    -[UILabel setFont:](v4->_subLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_subLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell contentView](v4, "contentView"));
    objc_msgSend(v13, "addSubview:", v4->_mainLabel);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell contentView](v4, "contentView"));
    objc_msgSend(v14, "addSubview:", v4->_subLabel);

    -[RestaurantReservationsChooseOfferCell initConstraints](v4, "initConstraints");
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[7];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell mainLabel](self, "mainLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell mainLabel](self, "mainLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell mainLabel](self, "mainLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutMarginsGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell subLabel](self, "subLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell mainLabel](self, "mainLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell subLabel](self, "subLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell mainLabel](self, "mainLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell subLabel](self, "subLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstBaselineAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell mainLabel](self, "mainLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstBaselineAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell subLabel](self, "subLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "font"));
  objc_msgSend(v33, "_mapkit_scaledValueForValue:", 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell subLabel](self, "subLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastBaselineAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsChooseOfferCell subLabel](self, "subLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "font"));
  objc_msgSend(v40, "_mapkit_scaledValueForValue:", 10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38));

  v46[0] = v45;
  v46[1] = v44;
  v46[2] = v43;
  v46[3] = v22;
  v46[4] = v27;
  v46[5] = v34;
  v46[6] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
}

@end
