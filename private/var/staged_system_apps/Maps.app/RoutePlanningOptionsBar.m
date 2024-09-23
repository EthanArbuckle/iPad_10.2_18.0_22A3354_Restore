@implementation RoutePlanningOptionsBar

- (RoutePlanningOptionsBar)initWithFrame:(CGRect)a3
{
  RoutePlanningOptionsBar *v3;
  RoutePlanningOptionsBar *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  UIButton *button;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  UILabel *v15;
  UILabel *summaryLabel;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  BatteryIconView *v22;
  BatteryIconView *batteryView;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *summaryToTrailingConstraint;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *summaryToBatteryConstraint;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *batteryToTrailingConstraint;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v59;
  objc_super v60;
  _QWORD v61[8];

  v60.receiver = self;
  v60.super_class = (Class)RoutePlanningOptionsBar;
  v3 = -[RoutePlanningOptionsBar initWithFrame:](&v60, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[RoutePlanningOptionsBar setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    button = v4->_button;
    v4->_button = (UIButton *)v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_button, "titleLabel"));
    objc_msgSend(v11, "setFont:", v10);

    -[UIButton setContentHorizontalAlignment:](v4->_button, "setContentHorizontalAlignment:", 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setTitleColor:forState:](v4->_button, "setTitleColor:forState:", v59, 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, "_buttonTapped", 64);
    LODWORD(v12) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_button, "setContentHuggingPriority:forAxis:", 0, v12);
    LODWORD(v13) = 1144766464;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_button, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    LODWORD(v14) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_button, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    -[UIButton setAccessibilityIdentifier:](v4->_button, "setAccessibilityIdentifier:", CFSTR("RoutePlanningOptionsBarButton"));
    -[RoutePlanningOptionsBar addSubview:](v4, "addSubview:", v4->_button);
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    summaryLabel = v4->_summaryLabel;
    v4->_summaryLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_summaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_summaryLabel, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_summaryLabel, "setFont:", v18);

    LODWORD(v19) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_summaryLabel, "setContentHuggingPriority:forAxis:", 0, v19);
    LODWORD(v20) = 1144733696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_summaryLabel, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    LODWORD(v21) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_summaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[UILabel setAccessibilityIdentifier:](v4->_summaryLabel, "setAccessibilityIdentifier:", CFSTR("RoutePlanningOptionsBarSummaryLabel"));
    -[RoutePlanningOptionsBar addSubview:](v4, "addSubview:", v4->_summaryLabel);
    v22 = objc_opt_new(BatteryIconView);
    batteryView = v4->_batteryView;
    v4->_batteryView = v22;

    -[BatteryIconView setTranslatesAutoresizingMaskIntoConstraints:](v4->_batteryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BatteryIconView setAccessibilityIdentifier:](v4->_batteryView, "setAccessibilityIdentifier:", CFSTR("RoutePlanningOptionsBarBatteryView"));
    -[RoutePlanningOptionsBar addSubview:](v4, "addSubview:", v4->_batteryView);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar trailingAnchor](v4, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_summaryLabel, "trailingAnchor"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    summaryToTrailingConstraint = v4->_summaryToTrailingConstraint;
    v4->_summaryToTrailingConstraint = (NSLayoutConstraint *)v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_summaryLabel, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView leadingAnchor](v4->_batteryView, "leadingAnchor"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -4.0));
    summaryToBatteryConstraint = v4->_summaryToBatteryConstraint;
    v4->_summaryToBatteryConstraint = (NSLayoutConstraint *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView trailingAnchor](v4->_batteryView, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar trailingAnchor](v4, "trailingAnchor"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    batteryToTrailingConstraint = v4->_batteryToTrailingConstraint;
    v4->_batteryToTrailingConstraint = (NSLayoutConstraint *)v34;

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_button, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar leadingAnchor](v4, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
    v61[0] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_summaryLabel, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_button, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintGreaterThanOrEqualToAnchor:constant:", v54, 8.0));
    v61[1] = v53;
    v61[2] = v4->_summaryToTrailingConstraint;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v4->_button, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar topAnchor](v4, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v61[3] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_summaryLabel, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar topAnchor](v4, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v61[4] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar bottomAnchor](v4, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v4->_button, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v61[5] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar bottomAnchor](v4, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_summaryLabel, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    v61[6] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView centerYAnchor](v4->_batteryView, "centerYAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_summaryLabel, "centerYAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
    v61[7] = v42;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 8));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
    -[UIButton setHidden:](v4->_button, "setHidden:", 1);
    -[UILabel setHidden:](v4->_summaryLabel, "setHidden:", 1);

  }
  return v4;
}

- (void)setButtonTitle:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  id actionHandler;

  v6 = a3;
  v7 = objc_msgSend(a4, "copy");
  actionHandler = self->_actionHandler;
  self->_actionHandler = v7;

  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v6, 0);
  -[UIButton setHidden:](self->_button, "setHidden:", v6 == 0);
}

- (void)setSummaryText:(id)a3
{
  NSString *v4;
  NSString *summaryText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  summaryText = self->_summaryText;
  self->_summaryText = v4;

  -[RoutePlanningOptionsBar _updateContent](self, "_updateContent");
}

- (void)setVehicle:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_vehicle, a3);
  v5 = objc_msgSend(v6, "isPureElectricVehicle");
  -[NSLayoutConstraint setActive:](self->_summaryToTrailingConstraint, "setActive:", v5 ^ 1);
  -[NSLayoutConstraint setActive:](self->_summaryToBatteryConstraint, "setActive:", v5);
  -[NSLayoutConstraint setActive:](self->_batteryToTrailingConstraint, "setActive:", v5);
  -[RoutePlanningOptionsBar _updateContent](self, "_updateContent");

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BatteryIconView **p_batteryView;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar vehicle](self, "vehicle"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar vehicle](self, "vehicle"));
    v5 = objc_msgSend(v4, "isPureElectricVehicle");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar vehicle](self, "vehicle"));
    v7 = v6;
    if (v5)
    {
      v17 = objc_msgSend(v6, "displayedBatteryPercentage");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsBar vehicle](self, "vehicle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "combinedDisplayName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%lu%%"), CFSTR("localized string not found"), 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v17));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v9, v12));
      v14 = 16;
      -[UILabel setText:](self->_summaryLabel, "setText:", v13);

      p_batteryView = &self->_batteryView;
      -[BatteryIconView setLevel:](self->_batteryView, "setLevel:", v17);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedDisplayName"));
      v14 = 16;
      -[UILabel setText:](self->_summaryLabel, "setText:", v16);

      p_batteryView = &self->_batteryView;
    }
    -[BatteryIconView setHidden:](*p_batteryView, "setHidden:", v5 ^ 1);
  }
  else
  {
    -[UILabel setText:](self->_summaryLabel, "setText:", self->_summaryText);
    -[UILabel setHidden:](self->_summaryLabel, "setHidden:", self->_summaryText == 0);
    v14 = 24;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v14), "setHidden:", v3 == 0);
}

- (void)_buttonTapped
{
  void (**actionHandler)(void);

  actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler)
    actionHandler[2]();
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_batteryToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_summaryToBatteryConstraint, 0);
  objc_storeStrong((id *)&self->_summaryToTrailingConstraint, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
