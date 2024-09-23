@implementation CarSharedTripDetailCardViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "stopListeningForLocationUpdates:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarSharedTripDetailCardViewController;
  -[CarSharedTripDetailCardViewController dealloc](&v4, "dealloc");
}

- (CarSharedTripDetailCardViewController)initWithSharedTrip:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CarSharedTripDetailCardViewController *v9;
  CarSharedTripDetailCardViewController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CarSharedTripDetailCardViewController;
  v9 = -[CarSharedTripDetailCardViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedTrip, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v11, "listenForLocationUpdates:", v10);

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *handleLabel;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  UILabel *v15;
  UILabel *etaLabel;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  UILabel *v22;
  UILabel *destinationLabel;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  CarCardRoundedButton *v29;
  CarFocusableButton *directionsButton;
  CarFocusableButton *v31;
  void *v32;
  void *v33;
  CarCardRoundedButton *v34;
  CarFocusableButton *stopUpdatesButton;
  void *v36;
  void *v37;
  CarFocusableButton *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  CarFocusableButton *v44;
  void *v45;
  UIStackView *v46;
  UIStackView *stackView;
  double v48;
  void *v49;
  double v50;
  objc_super v51;
  _QWORD v52[2];

  v51.receiver = self;
  v51.super_class = (Class)CarSharedTripDetailCardViewController;
  -[CarSharedTripDetailCardViewController viewDidLoad](&v51, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarSharedTripDetailCard"));

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handleLabel = self->_handleLabel;
  self->_handleLabel = v8;

  -[UILabel setAccessibilityIdentifier:](self->_handleLabel, "setAccessibilityIdentifier:", CFSTR("HandleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_handleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  -[UILabel setFont:](self->_handleLabel, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_handleLabel, "setTextColor:", v11);

  -[UILabel setNumberOfLines:](self->_handleLabel, "setNumberOfLines:", 1);
  -[UILabel setLineBreakMode:](self->_handleLabel, "setLineBreakMode:", 5);
  LODWORD(v12) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_handleLabel, "setContentHuggingPriority:forAxis:", 1, v12);
  LODWORD(v13) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_handleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_handleLabel);

  v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  etaLabel = self->_etaLabel;
  self->_etaLabel = v15;

  -[UILabel setAccessibilityIdentifier:](self->_etaLabel, "setAccessibilityIdentifier:", CFSTR("ETALabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  -[UILabel setFont:](self->_etaLabel, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_etaLabel, "setTextColor:", v18);

  -[UILabel setNumberOfLines:](self->_etaLabel, "setNumberOfLines:", 0);
  LODWORD(v19) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_etaLabel, "setContentHuggingPriority:forAxis:", 1, v19);
  LODWORD(v20) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_etaLabel, "setContentCompressionResistancePriority:forAxis:", 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  objc_msgSend(v21, "addSubview:", self->_etaLabel);

  v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  destinationLabel = self->_destinationLabel;
  self->_destinationLabel = v22;

  -[UILabel setAccessibilityIdentifier:](self->_destinationLabel, "setAccessibilityIdentifier:", CFSTR("DestinationLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_destinationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  -[UILabel setFont:](self->_destinationLabel, "setFont:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_destinationLabel, "setTextColor:", v25);

  -[UILabel setNumberOfLines:](self->_destinationLabel, "setNumberOfLines:", 5);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_destinationLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_destinationLabel, "setMinimumScaleFactor:", 0.833333333);
  LODWORD(v26) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_destinationLabel, "setContentHuggingPriority:forAxis:", 1, v26);
  LODWORD(v27) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_destinationLabel, "setContentCompressionResistancePriority:forAxis:", 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", self->_destinationLabel);

  v29 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  directionsButton = self->_directionsButton;
  self->_directionsButton = &v29->super;

  -[CarFocusableButton setAccessibilityIdentifier:](self->_directionsButton, "setAccessibilityIdentifier:", CFSTR("DirectionsButton"));
  -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](self->_directionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = self->_directionsButton;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CarPlay_SharedTrip_Detail_Directions"), CFSTR("localized string not found"), 0));
  -[CarFocusableButton setTitle:forState:](v31, "setTitle:forState:", v33, 0);

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_directionsButton, "addTarget:action:forControlEvents:", self, "_directionsButtonPressed:", 64);
  v34 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  stopUpdatesButton = self->_stopUpdatesButton;
  self->_stopUpdatesButton = &v34->super;

  -[CarFocusableButton setAccessibilityIdentifier:](self->_stopUpdatesButton, "setAccessibilityIdentifier:", CFSTR("StopUpdatesButton"));
  -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](self->_stopUpdatesButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_stopUpdatesButton, "setNonFocusedTintColor:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_stopUpdatesButton, "setNonFocusedBackgroundColor:", v37);

  v38 = self->_stopUpdatesButton;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CarPlay_SharedTrip_Detail_Stop_Update"), CFSTR("localized string not found"), 0));
  -[CarFocusableButton setTitle:forState:](v38, "setTitle:forState:", v40, 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton titleLabel](self->_stopUpdatesButton, "titleLabel"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v50, UIFontWeightSemibold));
  objc_msgSend(v41, "setFont:", v42);

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_stopUpdatesButton, "addTarget:action:forControlEvents:", self, "_blockUpdatesButtonPressed:", 64);
  v43 = objc_alloc((Class)UIStackView);
  v44 = self->_stopUpdatesButton;
  v52[0] = self->_directionsButton;
  v52[1] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 2));
  v46 = (UIStackView *)objc_msgSend(v43, "initWithArrangedSubviews:", v45);
  stackView = self->_stackView;
  self->_stackView = v46;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 1);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 2.0);
  LODWORD(v48) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_stackView, "setContentHuggingPriority:forAxis:", 1, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  objc_msgSend(v49, "addSubview:", self->_stackView);

  -[CarSharedTripDetailCardViewController _setupConstraints](self, "_setupConstraints");
  -[CarSharedTripDetailCardViewController _updateDirectionsButtonVisibility](self, "_updateDirectionsButtonVisibility");
  -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarSharedTripDetailCardViewController;
  -[CarSharedTripDetailCardViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_isVisible = 1;
  -[CarSharedTripDetailCardViewController _refreshSubscriptionToken](self, "_refreshSubscriptionToken");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id subscriptionToken;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarSharedTripDetailCardViewController;
  -[CarSharedTripDetailCardViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  self->_isVisible = 0;
  subscriptionToken = self->_subscriptionToken;
  self->_subscriptionToken = 0;

}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarSharedTripDetailCardViewController;
  -[CarSharedTripDetailCardViewController didMoveToParentViewController:](&v4, "didMoveToParentViewController:", a3);
  -[CarSharedTripDetailCardViewController _refreshSubscriptionToken](self, "_refreshSubscriptionToken");
}

- (void)_setupConstraints
{
  void *v3;
  id v4;
  UILayoutGuide *v5;
  UILayoutGuide *textLayoutGuide;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  textLayoutGuide = self->_textLayoutGuide;
  self->_textLayoutGuide = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController view](self, "view"));
  objc_msgSend(v7, "addLayoutGuide:", self->_textLayoutGuide);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_handleLabel, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v4, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_handleLabel, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 10.0));
  objc_msgSend(v4, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_handleLabel, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 10.0));
  objc_msgSend(v4, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_etaLabel, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_handleLabel, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v4, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_etaLabel, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 10.0));
  objc_msgSend(v4, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 10.0));
  objc_msgSend(v4, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_textLayoutGuide, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_etaLabel, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 10.0));
  objc_msgSend(v4, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textLayoutGuide, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 10.0));
  objc_msgSend(v4, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textLayoutGuide, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 10.0));
  objc_msgSend(v4, "addObject:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_destinationLabel, "centerYAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_textLayoutGuide, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  objc_msgSend(v4, "addObject:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_destinationLabel, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textLayoutGuide, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  objc_msgSend(v4, "addObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textLayoutGuide, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_destinationLabel, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  objc_msgSend(v4, "addObject:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_textLayoutGuide, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 4.0));
  objc_msgSend(v4, "addObject:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textLayoutGuide, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
  objc_msgSend(v4, "addObject:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textLayoutGuide, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
  objc_msgSend(v4, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 10.0));
  objc_msgSend(v4, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton heightAnchor](self->_stopUpdatesButton, "heightAnchor"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v61));
  objc_msgSend(v4, "addObject:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_destinationLabel, "heightAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_textLayoutGuide, "heightAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:", v59));
  objc_msgSend(v4, "addObject:", v60);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
}

- (void)_updateDirectionsButtonVisibility
{
  void *v3;
  id v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController sharedTrip](self, "sharedTrip"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationWaypointMapItem"));

  v4 = objc_alloc((Class)CLLocation);
  objc_msgSend(v12, "coordinate");
  v6 = v5;
  objc_msgSend(v12, "coordinate");
  v7 = objc_msgSend(v4, "initWithLatitude:longitude:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));
  objc_msgSend(v9, "distanceFromLocation:", v7);
  v11 = v10;

  if (v11 <= 500.0 != -[CarFocusableButton isHidden](self->_directionsButton, "isHidden"))
  {
    -[CarFocusableButton setHidden:](self->_directionsButton, "setHidden:", v11 <= 500.0);
    -[CarSharedTripDetailCardViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState etaInfo](self->_sharedTrip, "etaInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v18, v4, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState routeInfo](self->_sharedTrip, "routeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chargingStations"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CarPlay_SharedTrip_Detail_ETA"), CFSTR("localized string not found"), 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, v5));
  -[UILabel setText:](self->_etaLabel, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderInfo](self->_sharedTrip, "senderInfo"));
  if (objc_msgSend(v12, "hasLocalContactIdentifier"))
  {
    -[UILabel setText:](self->_handleLabel, "setText:", &stru_1011EB268);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderInfo](self->_sharedTrip, "senderInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fromIdentifier"));
    -[UILabel setText:](self->_handleLabel, "setText:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationWaypointMapItem](self->_sharedTrip, "destinationWaypointMapItem"));
  v16 = navDisplayAddressForMapItem(v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[UILabel setText:](self->_destinationLabel, "setText:", v17);

}

- (NSArray)preferredFocusEnvironments
{
  CarFocusableButton **p_stopUpdatesButton;
  uint64_t v4;
  CarFocusableButton *v6;
  CarFocusableButton *directionsButton;
  CarFocusableButton *v8;
  CarFocusableButton *stopUpdatesButton;

  if (!-[CarSharedTripDetailCardViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  if (-[CarFocusableButton isHidden](self->_directionsButton, "isHidden"))
  {
    stopUpdatesButton = self->_stopUpdatesButton;
    p_stopUpdatesButton = &stopUpdatesButton;
    v4 = 1;
  }
  else
  {
    v6 = self->_stopUpdatesButton;
    directionsButton = self->_directionsButton;
    v8 = v6;
    p_stopUpdatesButton = &directionsButton;
    v4 = 2;
  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_stopUpdatesButton, v4, directionsButton, v8, stopUpdatesButton));
}

- (NSArray)focusOrderSubItems
{
  CarFocusableButton **p_stopUpdatesButton;
  uint64_t v4;
  CarFocusableButton *v6;
  CarFocusableButton *directionsButton;
  CarFocusableButton *v8;
  CarFocusableButton *stopUpdatesButton;

  if (!-[CarSharedTripDetailCardViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  if (-[CarFocusableButton isHidden](self->_directionsButton, "isHidden"))
  {
    stopUpdatesButton = self->_stopUpdatesButton;
    p_stopUpdatesButton = &stopUpdatesButton;
    v4 = 1;
  }
  else
  {
    v6 = self->_stopUpdatesButton;
    directionsButton = self->_directionsButton;
    v8 = v6;
    p_stopUpdatesButton = &directionsButton;
    v4 = 2;
  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_stopUpdatesButton, v4, directionsButton, v8, stopUpdatesButton));
}

- (void)_refreshSubscriptionToken
{
  void *v3;
  SharedTripSceneAwareSubscription *v4;
  id subscriptionToken;
  void *v6;
  SharedTripSceneAwareSubscription *v7;
  id v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController _maps_uiScene](self, "_maps_uiScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController sharedTrip](self, "sharedTrip"));
  if (!v3 || !self->_isVisible)
  {

    goto LABEL_6;
  }

  if (!v9)
  {
LABEL_6:
    subscriptionToken = self->_subscriptionToken;
    self->_subscriptionToken = 0;
    goto LABEL_7;
  }
  v4 = [SharedTripSceneAwareSubscription alloc];
  subscriptionToken = (id)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(subscriptionToken, "groupIdentifier"));
  v7 = -[SharedTripSceneAwareSubscription initWithTripIdentifier:scene:](v4, "initWithTripIdentifier:scene:", v6, v9);
  v8 = self->_subscriptionToken;
  self->_subscriptionToken = v7;

LABEL_7:
}

- (void)_blockUpdatesButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sharedTripDetailCard:didSelectAction:", self, 1);

}

- (void)_directionsButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sharedTripDetailCard:didSelectAction:", self, 0);

}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "receivedTrips"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupIdentifier", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController sharedTrip](self, "sharedTrip"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (v13)
        {
          if (-[CarSharedTripDetailCardViewController _updateWithTrip:](self, "_updateWithTrip:", v9))
            -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  if (-[CarSharedTripDetailCardViewController _updateWithTrip:](self, "_updateWithTrip:", a4))
    -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  if (-[CarSharedTripDetailCardViewController _updateWithTrip:](self, "_updateWithTrip:", a4))
    -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  if (-[CarSharedTripDetailCardViewController _updateWithTrip:](self, "_updateWithTrip:", a4))
    -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  if (-[CarSharedTripDetailCardViewController _updateWithTrip:](self, "_updateWithTrip:", a4))
    -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  if (-[CarSharedTripDetailCardViewController _updateWithTrip:](self, "_updateWithTrip:", a4))
    -[CarSharedTripDetailCardViewController _updateContent](self, "_updateContent");
}

- (BOOL)_updateWithTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState groupIdentifier](self->_sharedTrip, "groupIdentifier"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[GEOSharedNavState mergeFrom:](self->_sharedTrip, "mergeFrom:", v4);

  return v7;
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_stopUpdatesButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
}

@end
