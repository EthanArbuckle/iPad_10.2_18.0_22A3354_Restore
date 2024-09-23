@implementation RestaurantReservationsConfirmationHeaderCell

- (RestaurantReservationsConfirmationHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RestaurantReservationsConfirmationHeaderCell *v4;
  UILabel *v5;
  UILabel *mainLabel;
  void *v7;
  void *v8;
  ReservationLabel *v9;
  ReservationLabel *subLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  UIButton *accessoryButton;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)RestaurantReservationsConfirmationHeaderCell;
  v4 = -[RestaurantReservationsConfirmationHeaderCell initWithStyle:reuseIdentifier:](&v21, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
    -[UILabel setFont:](v4->_mainLabel, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_mainLabel, "setTextColor:", v8);

    v9 = objc_opt_new(ReservationLabel);
    subLabel = v4->_subLabel;
    v4->_subLabel = v9;

    -[ReservationLabel setDelegate:](v4->_subLabel, "setDelegate:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[ReservationLabel setFont:](v4->_subLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[ReservationLabel setTextColor:](v4->_subLabel, "setTextColor:", v12);

    v4->_subtitleType = 0;
    -[ReservationLabel setNumberOfLines:](v4->_subLabel, "setNumberOfLines:", 3);
    v13 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    accessoryButton = v4->_accessoryButton;
    v4->_accessoryButton = (UIButton *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabel font](v4->_subLabel, "font"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_accessoryButton, "titleLabel"));
    objc_msgSend(v16, "setFont:", v15);

    -[UIButton addTarget:action:forControlEvents:](v4->_accessoryButton, "addTarget:action:forControlEvents:", v4, "accessoryButtonTapped:", 64);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](v4, "contentView"));
    objc_msgSend(v17, "addSubview:", v4->_mainLabel);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](v4, "contentView"));
    objc_msgSend(v18, "addSubview:", v4->_subLabel);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](v4, "contentView"));
    objc_msgSend(v19, "addSubview:", v4->_accessoryButton);

    -[RestaurantReservationsConfirmationHeaderCell initConstraints](v4, "initConstraints");
    -[RestaurantReservationsConfirmationHeaderCell updateSubtitleLabel](v4, "updateSubtitleLabel");
  }
  return v4;
}

- (void)reservationLabelDidLayout:(id)a3
{
  RestaurantReservationsConfirmationHeaderCell *v4;
  uint64_t v5;

  if (-[RestaurantReservationsConfirmationHeaderCell automaticallyHidesChevron](self, "automaticallyHidesChevron", a3)
    && -[ReservationLabel textFits](self->_subLabel, "textFits"))
  {
    v4 = self;
    v5 = 0;
  }
  else
  {
    if (!-[RestaurantReservationsConfirmationHeaderCell automaticallyHidesChevron](self, "automaticallyHidesChevron"))
      return;
    v4 = self;
    v5 = 1;
  }
  -[RestaurantReservationsConfirmationHeaderCell setAccessoryType:](v4, "setAccessoryType:", v5);
}

- (BOOL)shouldBeSelectable
{
  return !-[ReservationLabel textFits](self->_subLabel, "textFits");
}

- (void)updateSubtitleLabel
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v3 = -[RestaurantReservationsConfirmationHeaderCell subtitleType](self, "subtitleType");
  if (v3 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
    objc_msgSend(v11, "setFont:", v10);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
    v8 = v7;
    v9 = 22.0;
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
    objc_msgSend(v5, "setFont:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
    v8 = v7;
    v9 = 20.0;
LABEL_5:
    objc_msgSend(v7, "_mapkit_scaledValueForValue:", v9);
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainToSublabelConstraint](self, "mainToSublabelConstraint"));
    objc_msgSend(v14, "setConstant:", v13);

  }
  -[RestaurantReservationsConfirmationHeaderCell setNeedsLayout](self, "setNeedsLayout");
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
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[9];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ReservationLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainLabel](self, "mainLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainLabel](self, "mainLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainLabel](self, "mainLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutMarginsGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v17, 10.0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainLabel](self, "mainLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainLabel](self, "mainLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstBaselineAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainLabel](self, "mainLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstBaselineAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 20.0));
  -[RestaurantReservationsConfirmationHeaderCell setMainToSublabelConstraint:](self, "setMainToSublabelConstraint:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell accessoryButton](self, "accessoryButton"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layoutMarginsGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v35));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell accessoryButton](self, "accessoryButton"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstBaselineAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "lastBaselineAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "font"));
  objc_msgSend(v41, "lineHeight");
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, ceil(v42)));
  -[RestaurantReservationsConfirmationHeaderCell setButtonBottomConstraint:](self, "setButtonBottomConstraint:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layoutMarginsGuide"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell accessoryButton](self, "accessoryButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lastBaselineAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v48));

  v59[0] = v58;
  v59[1] = v57;
  v59[2] = v56;
  v59[3] = v55;
  v59[4] = v54;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell mainToSublabelConstraint](self, "mainToSublabelConstraint"));
  v59[5] = v50;
  v59[6] = v53;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell buttonBottomConstraint](self, "buttonBottomConstraint"));
  v59[7] = v51;
  v59[8] = v49;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v52);

}

- (void)setSubtitleType:(unint64_t)a3
{
  if (self->_subtitleType != a3)
  {
    self->_subtitleType = a3;
    -[RestaurantReservationsConfirmationHeaderCell updateSubtitleLabel](self, "updateSubtitleLabel");
  }
}

- (void)accessoryButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell actionDelegate](self, "actionDelegate", a3));
  objc_msgSend(v4, "reservationConfirmationHeaderCellAccessoryButtonWasTapped:", self);

}

- (void)updateConstraints
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell accessoryButton](self, "accessoryButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell subLabel](self, "subLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
    objc_msgSend(v3, "lineHeight");
    v10 = ceil(v9);
  }
  else
  {
    v10 = 0.0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell buttonBottomConstraint](self, "buttonBottomConstraint"));
  objc_msgSend(v11, "setConstant:", v10);

  if (v8)
  {

  }
  v12.receiver = self;
  v12.super_class = (Class)RestaurantReservationsConfirmationHeaderCell;
  -[RestaurantReservationsConfirmationHeaderCell updateConstraints](&v12, "updateConstraints");
}

- (NSString)accessoryButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell accessoryButton](self, "accessoryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForState:", 0));

  return (NSString *)v3;
}

- (void)setAccessoryButtonTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationsConfirmationHeaderCell accessoryButton](self, "accessoryButton"));
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  -[RestaurantReservationsConfirmationHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setAutomaticallyHidesChevron:(BOOL)a3
{
  if (((!self->_automaticallyHidesChevron ^ a3) & 1) == 0)
  {
    self->_automaticallyHidesChevron = a3;
    -[RestaurantReservationsConfirmationHeaderCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)subtitleType
{
  return self->_subtitleType;
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (ReservationLabel)subLabel
{
  return self->_subLabel;
}

- (void)setSubLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subLabel, a3);
}

- (RestaurantReservationsConfirmationHeaderCellDelegate)actionDelegate
{
  return (RestaurantReservationsConfirmationHeaderCellDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (BOOL)automaticallyHidesChevron
{
  return self->_automaticallyHidesChevron;
}

- (NSLayoutConstraint)buttonBottomConstraint
{
  return self->_buttonBottomConstraint;
}

- (void)setButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBottomConstraint, a3);
}

- (NSLayoutConstraint)mainToSublabelConstraint
{
  return self->_mainToSublabelConstraint;
}

- (void)setMainToSublabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_mainToSublabelConstraint, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_mainToSublabelConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBottomConstraint, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
}

@end
