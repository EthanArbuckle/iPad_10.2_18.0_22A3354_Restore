@implementation RestaurantReservationSectionHeaderTableViewCell

- (RestaurantReservationSectionHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RestaurantReservationSectionHeaderTableViewCell *v4;
  id v5;
  id v6;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RestaurantReservationSectionHeaderTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v20, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)MKViewWithHairline);
    -[RestaurantReservationSectionHeaderTableViewCell setHairlineContainer:](v4, "setHairlineContainer:", v5);

    v6 = objc_alloc_init((Class)UILabel);
    -[RestaurantReservationSectionHeaderTableViewCell setHeaderLabel:](v4, "setHeaderLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](v4, "headerLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](v4, "headerLabel"));
    objc_msgSend(v9, "setTextAlignment:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](v4, "headerLabel"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](v4, "headerLabel"));
    objc_msgSend(v12, "setNumberOfLines:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](v4, "headerLabel"));
    objc_msgSend(v14, "setFont:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](v4, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](v4, "hairlineContainer"));
    objc_msgSend(v15, "addSubview:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](v4, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](v4, "headerLabel"));
    objc_msgSend(v17, "addSubview:", v18);

    -[RestaurantReservationSectionHeaderTableViewCell initConstraints](v4, "initConstraints");
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layoutMarginsGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v51[0] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v51[1] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v51[2] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v51[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layoutMarginsGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v51[4] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v51[5] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstBaselineAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  objc_msgSend(v7, "_mapkit_scaledValueForValue:", 26.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v5));
  v51[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v51[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RestaurantReservationSectionHeaderTableViewCell;
  -[MapsThemeTableViewCell updateTheme](&v6, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hairlineColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  objc_msgSend(v5, "setHairlineColor:", v4);

}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (void)setText:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedUppercaseString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  objc_msgSend(v4, "setText:", v5);

}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setHidesHairline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)hidesHairline
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell hairlineContainer](self, "hairlineContainer"));
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  objc_msgSend(v5, "setFont:", v4);

}

- (UIFont)font
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationSectionHeaderTableViewCell headerLabel](self, "headerLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));

  return (UIFont *)v3;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (MKViewWithHairline)hairlineContainer
{
  return self->_hairlineContainer;
}

- (void)setHairlineContainer:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineContainer, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
