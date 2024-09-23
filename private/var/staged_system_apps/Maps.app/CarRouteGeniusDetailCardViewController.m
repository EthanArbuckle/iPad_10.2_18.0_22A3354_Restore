@implementation CarRouteGeniusDetailCardViewController

- (CarRouteGeniusDetailCardViewController)initWithDelegate:(id)a3
{
  id v4;
  CarRouteGeniusDetailCardViewController *v5;
  CarRouteGeniusDetailCardViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusDetailCardViewController;
  v5 = -[CarRouteGeniusDetailCardViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v6->_navigationAidedDrivingEnabled = objc_msgSend(v7, "isNavigationAidedDrivingEnabled");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v6->_handoffEnabled = objc_msgSend(v8, "destinationHandoffEnabled");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "_externalDeviceUpdated:", CFSTR("MapsExternalDeviceUpdated"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarRouteGeniusDetailCardViewController;
  -[CarRouteGeniusDetailCardViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *etaLabel;
  void *v10;
  UILabel *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  UILabel *v16;
  UILabel *mainDescriptionLabel;
  void *v18;
  CarAdvisoriesView *v19;
  CarAdvisoriesView *routeAdvisoriesView;
  void *v21;
  CarMoreButton *v22;
  CarMoreButton *handoffButton;
  double v24;
  double v25;
  double v26;
  void *v27;
  CarCardRoundedButton *v28;
  CarCardRoundedButton *alertsOnlyButton;
  double v30;
  void *v31;
  CarCardRoundedButton *v32;
  CarCardRoundedButton *goButton;
  double v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CarRouteGeniusDetailCardViewController;
  -[CarRouteGeniusDetailCardViewController viewDidLoad](&v36, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarRouteGeniusDetailCard"));

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  etaLabel = self->_etaLabel;
  self->_etaLabel = v8;

  -[UILabel setAccessibilityIdentifier:](self->_etaLabel, "setAccessibilityIdentifier:", CFSTR("ETALabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_etaLabel, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_etaLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_etaLabel, "font"));
  objc_msgSend(v10, "pointSize");
  v11 = self->_etaLabel;
  if (v12 < 12.0)
  {
    -[UILabel setMinimumScaleFactor:](v11, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v11, "font"));
    objc_msgSend(v13, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_etaLabel, "setMinimumScaleFactor:", 12.0 / v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v15, "addSubview:", self->_etaLabel);

  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mainDescriptionLabel = self->_mainDescriptionLabel;
  self->_mainDescriptionLabel = v16;

  -[UILabel setAccessibilityIdentifier:](self->_mainDescriptionLabel, "setAccessibilityIdentifier:", CFSTR("MainDescriptionLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_mainDescriptionLabel, "setNumberOfLines:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_mainDescriptionLabel);

  v19 = -[CarAdvisoriesView initWithFrame:]([CarAdvisoriesView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  routeAdvisoriesView = self->_routeAdvisoriesView;
  self->_routeAdvisoriesView = v19;

  -[CarAdvisoriesView setTranslatesAutoresizingMaskIntoConstraints:](self->_routeAdvisoriesView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarAdvisoriesView setHidden:](self->_routeAdvisoriesView, "setHidden:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v21, "addSubview:", self->_routeAdvisoriesView);

  v22 = -[CarCardRoundedButton initWithFrame:]([CarMoreButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handoffButton = self->_handoffButton;
  self->_handoffButton = v22;

  -[CarMoreButton setAccessibilityIdentifier:](self->_handoffButton, "setAccessibilityIdentifier:", CFSTR("HandoffButton"));
  -[CarMoreButton setTranslatesAutoresizingMaskIntoConstraints:](self->_handoffButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v24) = 1132068864;
  -[CarMoreButton setContentHuggingPriority:forAxis:](self->_handoffButton, "setContentHuggingPriority:forAxis:", 1, v24);
  LODWORD(v25) = 1148846080;
  -[CarMoreButton setContentCompressionResistancePriority:forAxis:](self->_handoffButton, "setContentCompressionResistancePriority:forAxis:", 0, v25);
  LODWORD(v26) = 1148846080;
  -[CarMoreButton setContentCompressionResistancePriority:forAxis:](self->_handoffButton, "setContentCompressionResistancePriority:forAxis:", 1, v26);
  -[CarMoreButton addTarget:action:forControlEvents:](self->_handoffButton, "addTarget:action:forControlEvents:", self, "_handoffButtonPressed:", 64);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v27, "addSubview:", self->_handoffButton);

  v28 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  alertsOnlyButton = self->_alertsOnlyButton;
  self->_alertsOnlyButton = v28;

  -[CarCardRoundedButton setAccessibilityIdentifier:](self->_alertsOnlyButton, "setAccessibilityIdentifier:", CFSTR("AlertsOnlyButton"));
  -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](self->_alertsOnlyButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v30) = 1148846080;
  -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](self->_alertsOnlyButton, "setContentCompressionResistancePriority:forAxis:", 1, v30);
  -[CarCardRoundedButton addTarget:action:forControlEvents:](self->_alertsOnlyButton, "addTarget:action:forControlEvents:", self, "_alertsOnlyButtonPressed:", 64);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v31, "addSubview:", self->_alertsOnlyButton);

  v32 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  goButton = self->_goButton;
  self->_goButton = v32;

  -[CarCardRoundedButton setAccessibilityIdentifier:](self->_goButton, "setAccessibilityIdentifier:", CFSTR("GoButton"));
  -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](self->_goButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v34) = 1148846080;
  -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](self->_goButton, "setContentCompressionResistancePriority:forAxis:", 1, v34);
  -[CarCardRoundedButton addTarget:action:forControlEvents:](self->_goButton, "addTarget:action:forControlEvents:", self, "_goButtonPressed:", 64);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  objc_msgSend(v35, "addSubview:", self->_goButton);

  -[CarRouteGeniusDetailCardViewController _setupConstraints](self, "_setupConstraints");
  -[CarRouteGeniusDetailCardViewController _setupStyling](self, "_setupStyling");
  -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarRouteGeniusDetailCardViewController;
  -[CarRouteGeniusDetailCardViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_goButtonIsFocusable = 0;
  -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
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
  NSLayoutConstraint *v12;
  NSLayoutConstraint *etaLabelTrailingConstraint;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  _QWORD v85[23];

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_etaLabel, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
  v85[0] = v78;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_etaLabel, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 10.0));
  v85[1] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton trailingAnchor](self->_handoffButton, "trailingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:constant:", v72, 10.0));
  v85[2] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_mainDescriptionLabel, "firstBaselineAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_etaLabel, "firstBaselineAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 16.0));
  v85[3] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_mainDescriptionLabel, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 10.0));
  v85[4] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_mainDescriptionLabel, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
  v85[5] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView topAnchor](self->_routeAdvisoriesView, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_mainDescriptionLabel, "lastBaselineAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 10.0));
  v85[6] = v58;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView leadingAnchor](self->_routeAdvisoriesView, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 10.0));
  v85[7] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView trailingAnchor](self->_routeAdvisoriesView, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -10.0));
  v85[8] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView bottomAnchor](self->_routeAdvisoriesView, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton topAnchor](self->_alertsOnlyButton, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:constant:", v48, -4.0));
  v85[9] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton heightAnchor](self->_handoffButton, "heightAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", 30.0));
  v85[10] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton widthAnchor](self->_handoffButton, "widthAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 30.0));
  v85[11] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton topAnchor](self->_handoffButton, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_etaLabel, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v85[12] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton trailingAnchor](self->_handoffButton, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -10.0));
  v85[13] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton topAnchor](self->_alertsOnlyButton, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_mainDescriptionLabel, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 4.0));
  v85[14] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton leadingAnchor](self->_alertsOnlyButton, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 10.0));
  v85[15] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton trailingAnchor](self->_alertsOnlyButton, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -10.0));
  v85[16] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton heightAnchor](self->_alertsOnlyButton, "heightAnchor"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", v84));
  v85[17] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton topAnchor](self->_goButton, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton bottomAnchor](self->_alertsOnlyButton, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 2.0));
  v85[18] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton heightAnchor](self->_goButton, "heightAnchor"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", v83));
  v85[19] = v18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton leadingAnchor](self->_goButton, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, 10.0));
  v85[20] = v14;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton trailingAnchor](self->_goButton, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, -10.0));
  v85[21] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton bottomAnchor](self->_goButton, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, -10.0));
  v85[22] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 23));
  objc_msgSend(v82, "addObjectsFromArray:", v11);

  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController _createEtaLabelTrailingConstraint](self, "_createEtaLabelTrailingConstraint"));
  etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
  self->_etaLabelTrailingConstraint = v12;

  objc_msgSend(v82, "addObject:", self->_etaLabelTrailingConstraint);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v82);

}

- (void)_setupStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CarCardRoundedButton *alertsOnlyButton;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CarCardRoundedButton *goButton;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightMedium));
  -[UILabel setFont:](self->_etaLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_etaLabel, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  -[UILabel setFont:](self->_mainDescriptionLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  -[UILabel setTextColor:](self->_mainDescriptionLabel, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainDescriptionLabel, "font"));
  objc_msgSend(v7, "pointSize");
  -[UILabel setMinimumScaleFactor:](self->_mainDescriptionLabel, "setMinimumScaleFactor:", 10.0 / v8);

  -[CarMoreButton setOptions:](self->_handoffButton, "setOptions:", 4);
  alertsOnlyButton = self->_alertsOnlyButton;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Car_ALERTS_ONLY"), CFSTR("localized string not found"), 0));
  -[CarCardRoundedButton setTitle:forState:](alertsOnlyButton, "setTitle:forState:", v11, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_alertsOnlyButton, "titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightRegular));
  objc_msgSend(v12, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_alertsOnlyButton, "setNonFocusedBackgroundColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_alertsOnlyButton, "setNonFocusedTintColor:", v15);

  goButton = self->_goButton;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Car_START_BUTTON"), CFSTR("localized string not found"), 0));
  -[CarCardRoundedButton setTitle:forState:](goButton, "setTitle:forState:", v18, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_goButton, "titleLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightBold));
  objc_msgSend(v19, "setFont:", v20);

  v21 = sub_100C5548C((char)-[CarCardRoundedButton isEnabled](self->_goButton, "isEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_goButton, "setNonFocusedBackgroundColor:", v22);

  v23 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_goButton, "setNonFocusedTintColor:", v23);

}

- (void)_updateContents
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
  id v12;
  UILabel *mainDescriptionLabel;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CarCardRoundedButton *goButton;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  _BOOL4 goButtonIsFocusable;
  _BOOL8 v30;
  id v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  void *v35;
  void *v36;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController currentETA](self, "currentETA"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "etaDateStringWithAMPMSymbol:allowTimeZone:", 0, 0));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("00:00 ETA [CarPlay]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4));
    -[UILabel setText:](self->_etaLabel, "setText:", v7);

  }
  else
  {
    -[UILabel setText:](self->_etaLabel, "setText:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry route](self->_currentSuggestion, "route"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "planningDescriptionString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringWithDefaultOptions"));
  -[UILabel setText:](self->_mainDescriptionLabel, "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController _sharingETAString](self, "_sharingETAString"));
  v12 = objc_msgSend(v11, "length");
  mainDescriptionLabel = self->_mainDescriptionLabel;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](mainDescriptionLabel, "text"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("\n%@"), v11));
    -[UILabel setText:](self->_mainDescriptionLabel, "setText:", v15);

    mainDescriptionLabel = self->_mainDescriptionLabel;
    v16 = 2;
  }
  else
  {
    v16 = 1;
  }
  -[UILabel setNumberOfLines:](mainDescriptionLabel, "setNumberOfLines:", v16);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_mainDescriptionLabel, "setAdjustsFontSizeToFitWidth:", v12 != 0);
  -[CarRouteGeniusDetailCardViewController updateRouteAdvisories](self, "updateRouteAdvisories");
  if (-[CarRouteGeniusDetailCardViewController isHandoffEnabled](self, "isHandoffEnabled"))
    v17 = -[CarRouteGeniusDetailCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled");
  else
    v17 = 1;
  -[CarMoreButton setHidden:](self->_handoffButton, "setHidden:", v17);
  if (-[CarRouteGeniusDetailCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapsDisplayName"));
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      v25 = sub_10076027C();
      v21 = (id)objc_claimAutoreleasedReturnValue(v25);
    }
    v26 = v21;

    -[CarCardRoundedButton setTitle:forState:](self->_goButton, "setTitle:forState:", v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:](UIImage, "_mapsCar_systemImageNamed:", CFSTR("square.and.arrow.up")));
    -[CarCardRoundedButton setImage:forState:](self->_goButton, "setImage:forState:", v27, 0);

  }
  else
  {
    goButton = self->_goButton;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Car_START_BUTTON"), CFSTR("localized string not found"), 0));
    -[CarCardRoundedButton setTitle:forState:](goButton, "setTitle:forState:", v24, 0);

    -[CarCardRoundedButton setImage:forState:](self->_goButton, "setImage:forState:", 0, 0);
  }
  v28 = -[CarRouteGeniusDetailCardViewController routeIsNavigable](self, "routeIsNavigable")
     || -[CarRouteGeniusDetailCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled");
  -[CarFocusableButton setEnabled:](self->_alertsOnlyButton, "setEnabled:", v28);
  goButtonIsFocusable = self->_goButtonIsFocusable;
  v30 = -[CarRouteGeniusDetailCardViewController routeIsNavigable](self, "routeIsNavigable")
     || -[CarRouteGeniusDetailCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled");
  -[CarFocusableButton setEnabled:](self->_goButton, "setEnabled:", v30);
  v31 = sub_100C5548C((char)-[CarCardRoundedButton isEnabled](self->_goButton, "isEnabled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_goButton, "setNonFocusedBackgroundColor:", v32);

  if (-[CarCardRoundedButton isEnabled](self->_goButton, "isEnabled"))
  {
    v33 = -[CarRouteGeniusDetailCardViewController _canSafelyRequestFocusUpdate](self, "_canSafelyRequestFocusUpdate");
    if (!goButtonIsFocusable)
    {
      if (v33)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10038AD48;
        block[3] = &unk_1011AC860;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  v34 = -[CarCardRoundedButton isEnabled](self->_goButton, "isEnabled");
  if (v34)
    LOBYTE(v34) = -[CarRouteGeniusDetailCardViewController _canSafelyRequestFocusUpdate](self, "_canSafelyRequestFocusUpdate");
  self->_goButtonIsFocusable = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "chromeViewController"));
  objc_msgSend(v36, "setNeedsFocusUpdate");

}

- (id)_sharingETAString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController currentSuggestion](self, "currentSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharingContacts"));

  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "givenName"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CarPlay_PlaceCard_SharingAutomatically_OneContact"), CFSTR("localized string not found"), 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7));

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_PlaceCard_SharingAutomatically"), CFSTR("localized string not found"), 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, objc_msgSend(v4, "count")));
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *etaLabelTrailingConstraint;

  if (-[CarRouteGeniusDetailCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_etaLabelTrailingConstraint)
    {
      etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &etaLabelTrailingConstraint, 1));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    }
    v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController _createEtaLabelTrailingConstraint](self, "_createEtaLabelTrailingConstraint"));
    v5 = self->_etaLabelTrailingConstraint;
    self->_etaLabelTrailingConstraint = v4;

    v7 = self->_etaLabelTrailingConstraint;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

  }
}

- (NSArray)actionButtons
{
  CarCardRoundedButton *alertsOnlyButton;
  _QWORD v4[3];

  alertsOnlyButton = self->_alertsOnlyButton;
  v4[0] = self->_handoffButton;
  v4[1] = alertsOnlyButton;
  v4[2] = self->_goButton;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
}

- (void)setRouteIsNavigable:(BOOL)a3
{
  if (self->_routeIsNavigable != a3)
  {
    self->_routeIsNavigable = a3;
    -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setCurrentSuggestion:(id)a3
{
  MapsSuggestionsRouteGeniusEntry *v5;
  MapsSuggestionsRouteGeniusEntry *v6;

  v5 = (MapsSuggestionsRouteGeniusEntry *)a3;
  if (self->_currentSuggestion != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentSuggestion, a3);
    -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
    v5 = v6;
  }

}

- (void)setCurrentETA:(id)a3
{
  GuidanceETA *v5;
  GuidanceETA *v6;

  v5 = (GuidanceETA *)a3;
  if (self->_currentETA != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentETA, a3);
    -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
    v5 = v6;
  }

}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setHandoffEnabled:(BOOL)a3
{
  if (self->_handoffEnabled != a3)
  {
    self->_handoffEnabled = a3;
    -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
    -[CarRouteGeniusDetailCardViewController _updateConstraints](self, "_updateConstraints");
  }
}

- (void)setHasCardFinishedTransitioning:(BOOL)a3
{
  if (self->_hasCardFinishedTransitioning != a3)
  {
    self->_hasCardFinishedTransitioning = a3;
    if (a3)
      -[CarRouteGeniusDetailCardViewController _updateContents](self, "_updateContents");
  }
}

- (BOOL)_canSafelyRequestFocusUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;

  if (!-[CarRouteGeniusDetailCardViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  if (!-[CarRouteGeniusDetailCardViewController hasCardFinishedTransitioning](self, "hasCardFinishedTransitioning"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController traitCollection](self, "traitCollection"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));

  }
  v9 = ((unint64_t)objc_msgSend(v8, "interactionModel") & 0xA) != 0;

  return v9;
}

- (void)updateRouteAdvisories
{
  CarAdvisoriesView *routeAdvisoriesView;
  void *v4;

  routeAdvisoriesView = self->_routeAdvisoriesView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry route](self->_currentSuggestion, "route"));
  -[CarAdvisoriesView setRoute:](routeAdvisoriesView, "setRoute:", v4);

  -[CarAdvisoriesView setHidden:](self->_routeAdvisoriesView, "setHidden:", -[CarAdvisoriesView count](self->_routeAdvisoriesView, "count") == 0);
}

- (id)_createEtaLabelTrailingConstraint
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CarRouteGeniusDetailCardViewController isHandoffEnabled](self, "isHandoffEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton leadingAnchor](self->_handoffButton, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -10.0));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7, -10.0));

  }
  return v6;
}

- (void)_externalDeviceUpdated:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance", a3));
  -[CarRouteGeniusDetailCardViewController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", objc_msgSend(v4, "isNavigationAidedDrivingEnabled"));

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  -[CarRouteGeniusDetailCardViewController setHandoffEnabled:](self, "setHandoffEnabled:", objc_msgSend(v5, "destinationHandoffEnabled"));

}

- (void)_handoffButtonPressed:(id)a3
{
  id v4;

  -[CarRouteGeniusDetailCardViewController _disableInteraction](self, "_disableInteraction", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController delegate](self, "delegate"));
  objc_msgSend(v4, "detailCardDidHandOff:", self);

}

- (void)_alertsOnlyButtonPressed:(id)a3
{
  id v4;

  -[CarRouteGeniusDetailCardViewController _disableInteraction](self, "_disableInteraction", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController delegate](self, "delegate"));
  objc_msgSend(v4, "detailCardDidAccept:navigationType:", self, 2);

}

- (void)_goButtonPressed:(id)a3
{
  id v4;

  -[CarRouteGeniusDetailCardViewController _disableInteraction](self, "_disableInteraction", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController delegate](self, "delegate"));
  objc_msgSend(v4, "detailCardDidAccept:navigationType:", self, 0);

}

- (void)_disableInteraction
{
  id v3;
  NSObject *v4;
  CarRouteGeniusDetailCardViewController *v5;
  CarRouteGeniusDetailCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  __CFString *v24;

  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] RG detail: Disabling action buttons.", buf, 0xCu);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController actionButtons](self, "actionButtons"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "setEnabled:", 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)allowInteraction
{
  id v3;
  NSObject *v4;
  CarRouteGeniusDetailCardViewController *v5;
  CarRouteGeniusDetailCardViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  __CFString *v24;

  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] RG detail: Enabling action buttons.", buf, 0xCu);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusDetailCardViewController actionButtons](self, "actionButtons"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "setEnabled:", 1);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (NSArray)focusOrderSubItems
{
  CarCardRoundedButton *alertsOnlyButton;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  if (!-[CarRouteGeniusDetailCardViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  alertsOnlyButton = self->_alertsOnlyButton;
  v8[0] = self->_handoffButton;
  v8[1] = alertsOnlyButton;
  v8[2] = self->_goButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011B36F0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  CarCardRoundedButton *goButton;

  if (-[CarCardRoundedButton isEnabled](self->_goButton, "isEnabled"))
  {
    goButton = self->_goButton;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &goButton, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (GuidanceETA)currentETA
{
  return self->_currentETA;
}

- (BOOL)routeIsNavigable
{
  return self->_routeIsNavigable;
}

- (BOOL)hasCardFinishedTransitioning
{
  return self->_hasCardFinishedTransitioning;
}

- (CarRouteGeniusDetailCardViewControllerDelegate)delegate
{
  return (CarRouteGeniusDetailCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isNavigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (BOOL)isHandoffEnabled
{
  return self->_handoffEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentETA, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_etaLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_storeStrong((id *)&self->_alertsOnlyButton, 0);
  objc_storeStrong((id *)&self->_handoffButton, 0);
  objc_storeStrong((id *)&self->_routeAdvisoriesView, 0);
  objc_storeStrong((id *)&self->_mainDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end
