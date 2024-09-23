@implementation CarETAArrivedSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAArrivedSign)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  CarETAArrivedSign *v11;
  CarETAArrivedSign *v12;
  MapsFadingLabel *v13;
  MapsFadingLabel *titleLabel;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  MapsFadingLabel *v19;
  MapsFadingLabel *subtitleLabel;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  CarCardRoundedButton *v26;
  CarCardRoundedButton *endNavigationButton;
  CarCardRoundedButton *v28;
  CarCardRoundedButton *alternativeActionButton;
  id v30;
  void *v31;
  UIStackView *v32;
  UIStackView *buttonsStackView;
  objc_super v35;
  CarCardRoundedButton *v36;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CarETAArrivedSign;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[CarETAArrivedSign initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[CarETAArrivedSign setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("CarETAArrivedSign"));
    objc_storeWeak((id *)&v12->_delegate, v6);
    objc_storeWeak((id *)&v12->_dataSource, v7);
    v12->_state = 0;
    v13 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v13;

    -[MapsFadingLabel setAccessibilityIdentifier:](v12->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[MapsFadingLabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsFadingLabel setNumberOfLines:](v12->_titleLabel, "setNumberOfLines:", 1);
    -[MapsFadingLabel setTextAlignment:](v12->_titleLabel, "setTextAlignment:", 1);
    v15 = objc_msgSend((id)objc_opt_class(v12), "_buttonFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[MapsFadingLabel setFont:](v12->_titleLabel, "setFont:", v16);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_dataSource);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "arrivalTitle"));
    -[MapsFadingLabel setText:](v12->_titleLabel, "setText:", v18);

    -[CarETAArrivedSign addSubview:](v12, "addSubview:", v12->_titleLabel);
    v19 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v12->_subtitleLabel;
    v12->_subtitleLabel = v19;

    -[MapsFadingLabel setAccessibilityIdentifier:](v12->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    -[MapsFadingLabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsFadingLabel setNumberOfLines:](v12->_subtitleLabel, "setNumberOfLines:", 2);
    -[MapsFadingLabel setTextAlignment:](v12->_subtitleLabel, "setTextAlignment:", 1);
    v21 = objc_msgSend((id)objc_opt_class(v12), "_subtitleFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[MapsFadingLabel setFont:](v12->_subtitleLabel, "setFont:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsFadingLabel setTextColor:](v12->_subtitleLabel, "setTextColor:", v23);

    v24 = objc_loadWeakRetained((id *)&v12->_dataSource);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrivalSubtitle"));
    -[MapsFadingLabel setText:](v12->_subtitleLabel, "setText:", v25);

    -[CarETAArrivedSign addSubview:](v12, "addSubview:", v12->_subtitleLabel);
    v26 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    endNavigationButton = v12->_endNavigationButton;
    v12->_endNavigationButton = v26;

    -[CarCardRoundedButton setAccessibilityIdentifier:](v12->_endNavigationButton, "setAccessibilityIdentifier:", CFSTR("EndNavigationButton"));
    -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](v12->_endNavigationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarCardRoundedButton addTarget:action:forControlEvents:](v12->_endNavigationButton, "addTarget:action:forControlEvents:", v12, "_onEndPressed:", 64);
    v28 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    alternativeActionButton = v12->_alternativeActionButton;
    v12->_alternativeActionButton = v28;

    -[CarCardRoundedButton setAccessibilityIdentifier:](v12->_alternativeActionButton, "setAccessibilityIdentifier:", CFSTR("AlternativeActionButton"));
    -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](v12->_alternativeActionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarCardRoundedButton addTarget:action:forControlEvents:](v12->_alternativeActionButton, "addTarget:action:forControlEvents:", v12, "_onNextStopPressed:", 64);
    v30 = objc_alloc((Class)UIStackView);
    v36 = v12->_endNavigationButton;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    v32 = (UIStackView *)objc_msgSend(v30, "initWithArrangedSubviews:", v31);
    buttonsStackView = v12->_buttonsStackView;
    v12->_buttonsStackView = v32;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v12->_buttonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v12->_buttonsStackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v12->_buttonsStackView, "setSpacing:", 2.0);
    -[CarETAArrivedSign addSubview:](v12, "addSubview:", v12->_buttonsStackView);
    -[CarETAArrivedSign _setupConstraints](v12, "_setupConstraints");
    -[CarETAArrivedSign _setupStyling](v12, "_setupStyling");
    -[CarETAArrivedSign _updateContents](v12, "_updateContents");
  }

  return v12;
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
  _QWORD v42[4];
  _QWORD v43[3];
  _QWORD v44[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton heightAnchor](self->_endNavigationButton, "heightAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 44.0));
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton heightAnchor](self->_alternativeActionButton, "heightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 44.0));
  v41 = v3;
  objc_msgSend(v3, "addObject:", v7);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v34, 10.0));
  v44[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -10.0));
  v44[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel topAnchor](self->_titleLabel, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign topAnchor](self, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 10.0));
  v44[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 3));
  objc_msgSend(v3, "addObjectsFromArray:", v15);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v35, 10.0));
  v43[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign trailingAnchor](self, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -10.0));
  v43[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel topAnchor](self->_subtitleLabel, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v43[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 3));
  objc_msgSend(v3, "addObjectsFromArray:", v23);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_buttonsStackView, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign leadingAnchor](self, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 10.0));
  v42[0] = v36;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_buttonsStackView, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign trailingAnchor](self, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v24, -10.0));
  v42[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_buttonsStackView, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel bottomAnchor](self->_subtitleLabel, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 10.0));
  v42[2] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_buttonsStackView, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign bottomAnchor](self, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -10.0));
  v42[3] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
  objc_msgSend(v41, "addObjectsFromArray:", v32);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);
}

- (void)_setupStyling
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
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_endNavigationButton, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarETAArrivedSign _buttonFont](CarETAArrivedSign, "_buttonFont"));
  objc_msgSend(v3, "setFont:", v4);

  -[CarCardRoundedButton setContentHorizontalAlignment:](self->_endNavigationButton, "setContentHorizontalAlignment:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_endNavigationButton, "titleLabel"));
  objc_msgSend(v5, "setMinimumScaleFactor:", 0.699999988);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_endNavigationButton, "titleLabel"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_endNavigationButton, "titleLabel"));
  objc_msgSend(v7, "setNumberOfLines:", 2);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_endNavigationButton, "setNonFocusedTintColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  -[CarFocusableButton setFocusedTintColor:](self->_endNavigationButton, "setFocusedTintColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_endNavigationButton, "setNonFocusedBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedBackgroundColor:](self->_endNavigationButton, "setFocusedBackgroundColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_alternativeActionButton, "titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarETAArrivedSign _buttonFont](CarETAArrivedSign, "_buttonFont"));
  objc_msgSend(v12, "setFont:", v13);

  -[CarCardRoundedButton setContentHorizontalAlignment:](self->_alternativeActionButton, "setContentHorizontalAlignment:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_alternativeActionButton, "titleLabel"));
  objc_msgSend(v14, "setMinimumScaleFactor:", 0.699999988);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_alternativeActionButton, "titleLabel"));
  objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_alternativeActionButton, "titleLabel"));
  objc_msgSend(v16, "setNumberOfLines:", 2);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_alternativeActionButton, "setNonFocusedTintColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  -[CarFocusableButton setFocusedTintColor:](self->_alternativeActionButton, "setFocusedTintColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_alternativeActionButton, "setNonFocusedBackgroundColor:", v19);

  v20 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedBackgroundColor:](self->_alternativeActionButton, "setFocusedBackgroundColor:", v20);

}

+ (id)_buttonFont
{
  return +[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightBold);
}

+ (id)_subtitleFont
{
  return +[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular);
}

- (void)_updateContents
{
  CarETAArrivedSignDataSource **p_dataSource;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  int64_t state;
  CarCardRoundedButton *v9;
  void *v10;
  void *v11;
  CarCardRoundedButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CarCardRoundedButton *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIStackView *buttonsStackView;
  CarCardRoundedButton *v24;
  CarCardRoundedButton **v25;
  CarCardRoundedButton *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CarCardRoundedButton *endNavigationButton;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CarCardRoundedButton *alternativeActionButton;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CarCardRoundedButton *v42;
  void *v43;
  CarCardRoundedButton *v44;
  CarCardRoundedButton *v45;
  CarCardRoundedButton *v46;
  CarCardRoundedButton *v47;
  CarCardRoundedButton *v48;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "arrivalTitle"));
  -[MapsFadingLabel setText:](self->_titleLabel, "setText:", v5);

  v6 = objc_loadWeakRetained((id *)p_dataSource);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalSubtitle"));
  -[MapsFadingLabel setText:](self->_subtitleLabel, "setText:", v7);

  state = self->_state;
  if (state)
  {
    if (state == 1)
    {
      endNavigationButton = self->_endNavigationButton;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CarPlay_PauseRoute"), CFSTR("localized string not found"), 0));
      -[CarCardRoundedButton setTitle:forState:](endNavigationButton, "setTitle:forState:", v34, 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[CarFocusableButton setNonFocusedTintColor:](self->_endNavigationButton, "setNonFocusedTintColor:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      -[CarFocusableButton setNonFocusedBackgroundColor:](self->_endNavigationButton, "setNonFocusedBackgroundColor:", v36);

      alternativeActionButton = self->_alternativeActionButton;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("CarPlay_NextStop"), CFSTR("localized string not found"), 0));
      -[CarCardRoundedButton setTitle:forState:](alternativeActionButton, "setTitle:forState:", v39, 0);

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
      -[CarFocusableButton setNonFocusedTintColor:](self->_alternativeActionButton, "setNonFocusedTintColor:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      -[CarFocusableButton setNonFocusedBackgroundColor:](self->_alternativeActionButton, "setNonFocusedBackgroundColor:", v41);

      -[CarCardRoundedButton setImage:forState:](self->_alternativeActionButton, "setImage:forState:", 0, 0);
      buttonsStackView = self->_buttonsStackView;
      v42 = self->_endNavigationButton;
      v44 = self->_alternativeActionButton;
      v45 = v42;
      v25 = &v44;
    }
    else
    {
      if (state != 2)
        return;
      v9 = self->_alternativeActionButton;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CarPlay_OtherStations"), CFSTR("localized string not found"), 0));
      -[CarCardRoundedButton setTitle:forState:](v9, "setTitle:forState:", v11, 0);

      v12 = self->_alternativeActionButton;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarETAArrivedSign _buttonFont](CarETAArrivedSign, "_buttonFont"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v14));
      -[CarCardRoundedButton setImage:forState:](v12, "setImage:forState:", v15, 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
      -[CarFocusableButton setNonFocusedTintColor:](self->_alternativeActionButton, "setNonFocusedTintColor:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      -[CarFocusableButton setNonFocusedBackgroundColor:](self->_alternativeActionButton, "setNonFocusedBackgroundColor:", v17);

      v18 = self->_endNavigationButton;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CarPlay_PauseRoute"), CFSTR("localized string not found"), 0));
      -[CarCardRoundedButton setTitle:forState:](v18, "setTitle:forState:", v20, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[CarFocusableButton setNonFocusedTintColor:](self->_endNavigationButton, "setNonFocusedTintColor:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      -[CarFocusableButton setNonFocusedBackgroundColor:](self->_endNavigationButton, "setNonFocusedBackgroundColor:", v22);

      buttonsStackView = self->_buttonsStackView;
      v24 = self->_endNavigationButton;
      v47 = self->_alternativeActionButton;
      v48 = v24;
      v25 = &v47;
    }
    v31 = 2;
  }
  else
  {
    -[CarCardRoundedButton setImage:forState:](self->_alternativeActionButton, "setImage:forState:", 0, 0);
    v26 = self->_endNavigationButton;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CarPlay_EndRoute"), CFSTR("localized string not found"), 0));
    -[CarCardRoundedButton setTitle:forState:](v26, "setTitle:forState:", v28, 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[CarFocusableButton setNonFocusedTintColor:](self->_endNavigationButton, "setNonFocusedTintColor:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[CarFocusableButton setNonFocusedBackgroundColor:](self->_endNavigationButton, "setNonFocusedBackgroundColor:", v30);

    buttonsStackView = self->_buttonsStackView;
    v46 = self->_endNavigationButton;
    v25 = &v46;
    v31 = 1;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, v31, v44, v45, v46, v47, v48));
  -[UIStackView _maps_setArrangedSubviews:](buttonsStackView, "_maps_setArrangedSubviews:", v43);

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[CarETAArrivedSign _updateContents](self, "_updateContents");
  }
}

- (void)_onEndPressed:(id)a3
{
  unint64_t state;
  uint64_t v5;
  id v6;

  state = self->_state;
  if (state > 2)
    v5 = 0;
  else
    v5 = qword_100E376D8[state];
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign delegate](self, "delegate", a3));
  objc_msgSend(v6, "etaCardSign:didSelectAction:", self, v5);

}

- (void)_onNextStopPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarETAArrivedSign delegate](self, "delegate", a3));
  objc_msgSend(v4, "etaCardSign:didSelectAction:", self, 3);

}

- (NSArray)focusOrderSubItems
{
  int64_t state;
  CarCardRoundedButton *endNavigationButton;
  CarCardRoundedButton **p_alternativeActionButton;
  uint64_t v5;
  CarCardRoundedButton *v7;
  CarCardRoundedButton *alternativeActionButton;
  CarCardRoundedButton *v9;

  state = self->_state;
  if ((unint64_t)(state - 1) < 2)
  {
    endNavigationButton = self->_endNavigationButton;
    alternativeActionButton = self->_alternativeActionButton;
    v9 = endNavigationButton;
    p_alternativeActionButton = &alternativeActionButton;
    v5 = 2;
LABEL_5:
    a2 = (SEL)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_alternativeActionButton, v5, v7, alternativeActionButton, v9));
    return (NSArray *)(id)a2;
  }
  if (!state)
  {
    v7 = self->_endNavigationButton;
    p_alternativeActionButton = &v7;
    v5 = 1;
    goto LABEL_5;
  }
  return (NSArray *)(id)a2;
}

- (NSArray)preferredFocusEnvironments
{
  CarCardRoundedButton *endNavigationButton;

  endNavigationButton = self->_endNavigationButton;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &endNavigationButton, 1));
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (void)setLatestETA:(id)a3
{
  objc_storeStrong((id *)&self->_latestETA, a3);
}

- (CarETACardSignDelegate)delegate
{
  return (CarETACardSignDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_endNavigationButton, 0);
  objc_storeStrong((id *)&self->_alternativeActionButton, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
