@implementation RidesharingEnableAllAppsTableViewCell

- (RidesharingEnableAllAppsTableViewCell)initWithFrame:(CGRect)a3
{
  RidesharingEnableAllAppsTableViewCell *v3;
  RidesharingEnableAllAppsTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RidesharingEnableAllAppsTableViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RidesharingEnableAllAppsTableViewCell _setupViews](v3, "_setupViews");
    -[RidesharingEnableAllAppsTableViewCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupViews
{
  BackgroundColorButton *v3;
  BackgroundColorButton *enableButton;
  void *v5;
  BackgroundColorButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MapsThemeMultiPartLabel *v11;
  MapsThemeMultiPartLabel *secondaryLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (BackgroundColorButton *)objc_claimAutoreleasedReturnValue(+[BackgroundColorButton buttonWithType:](BackgroundColorButton, "buttonWithType:", 0));
  enableButton = self->_enableButton;
  self->_enableButton = v3;

  -[BackgroundColorButton setClipsToBounds:](self->_enableButton, "setClipsToBounds:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton layer](self->_enableButton, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 8.0);

  -[BackgroundColorButton setTranslatesAutoresizingMaskIntoConstraints:](self->_enableButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_type = 0;
  v6 = self->_enableButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Show Rides [Ride Booking]"), CFSTR("localized string not found"), 0));
  -[BackgroundColorButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton titleLabel](self->_enableButton, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v9, &stru_1011E7BB8);

  -[BackgroundColorButton addTarget:action:forControlEvents:](self->_enableButton, "addTarget:action:forControlEvents:", self, "_enableButtonPressed:", 0x2000);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_enableButton);

  v11 = objc_alloc_init(MapsThemeMultiPartLabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v11;

  -[MapsThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeMultiPartLabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeMultiPartLabel setTextColor:](self->_secondaryLabel, "setTextColor:", v13);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_secondaryLabel, &stru_1011E7A78);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Share your location with ride booking apps to estimate fares and wait times. You can manage this at any time in Maps Settings. [Ridesharing]"), CFSTR("localized string not found"), 0));
  -[MapsThemeMultiPartLabel setText:](self->_secondaryLabel, "setText:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  objc_msgSend(v16, "addSubview:", self->_secondaryLabel);

  -[RidesharingEnableAllAppsTableViewCell updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  void *v3;
  BackgroundColorButton *enableButton;
  void *v5;
  BackgroundColorButton *v6;
  void *v7;
  BackgroundColorButton *v8;
  void *v9;
  BackgroundColorButton *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RidesharingEnableAllAppsTableViewCell;
  -[MapsThemeCollectionViewCell updateTheme](&v12, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell theme](self, "theme"));
  enableButton = self->_enableButton;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonBackgroundColor:", 0));
  -[BackgroundColorButton setBackgroundColor:forState:](enableButton, "setBackgroundColor:forState:", v5, 0);

  v6 = self->_enableButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonBackgroundColor:", 1));
  -[BackgroundColorButton setBackgroundColor:forState:](v6, "setBackgroundColor:forState:", v7, 1);

  v8 = self->_enableButton;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonTitleColor:", 0));
  -[BackgroundColorButton setTitleColor:forState:](v8, "setTitleColor:forState:", v9, 0);

  v10 = self->_enableButton;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonTitleColor:", 1));
  -[BackgroundColorButton setTitleColor:forState:](v10, "setTitleColor:forState:", v11, 1);

}

- (void)_setupConstraints
{
  double v2;
  double v4;
  double v5;
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
  _QWORD v39[9];

  LODWORD(v2) = 1148846080;
  -[BackgroundColorButton setContentCompressionResistancePriority:forAxis:](self->_enableButton, "setContentCompressionResistancePriority:forAxis:", 1, v2);
  LODWORD(v4) = 1148846080;
  -[MapsThemeMultiPartLabel setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  LODWORD(v5) = 1148846080;
  -[MapsThemeMultiPartLabel setContentHuggingPriority:forAxis:](self->_secondaryLabel, "setContentHuggingPriority:forAxis:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  +[RouteOverviewCell minimumRidesharingHeight](RouteOverviewCell, "minimumRidesharingHeight");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintGreaterThanOrEqualToConstant:"));

  v39[0] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 22.0));
  v39[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton topAnchor](self->_enableButton, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -16.0));
  v39[2] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel leadingAnchor](self->_secondaryLabel, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 16.0));
  v39[3] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel trailingAnchor](self->_secondaryLabel, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -16.0));
  v39[4] = v23;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton leadingAnchor](self->_enableButton, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 16.0));
  v39[5] = v18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton trailingAnchor](self->_enableButton, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -16.0));
  v39[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton heightAnchor](self->_enableButton, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", 50.0));
  v39[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton bottomAnchor](self->_enableButton, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -17.0));
  v39[8] = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 9));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
}

- (void)configureForType:(unint64_t)a3
{
  BackgroundColorButton *enableButton;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  self->_type = a3;
  if (a3)
  {
    if (a3 != 1)
      return;
    enableButton = self->_enableButton;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = CFSTR("Show Apps [Ride Booking]");
  }
  else
  {
    enableButton = self->_enableButton;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = CFSTR("Show Rides [Ride Booking]");
  }
  v7 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));
  -[BackgroundColorButton setTitle:forState:](enableButton, "setTitle:forState:", v6, 0);

}

- (void)_enableButtonPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingEnableAllAppsTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:", self);

}

- (RidesharingEnableAllAppsTableViewCellDelegate)delegate
{
  return (RidesharingEnableAllAppsTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BackgroundColorButton)enableButton
{
  return self->_enableButton;
}

- (MapsThemeMultiPartLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
