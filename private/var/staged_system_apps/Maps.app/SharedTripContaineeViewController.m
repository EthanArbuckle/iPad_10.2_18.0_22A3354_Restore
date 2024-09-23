@implementation SharedTripContaineeViewController

- (SharedTripContaineeViewController)initWithSharedTrip:(id)a3
{
  id v5;
  SharedTripContaineeViewController *v6;
  SharedTripContaineeViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SharedTripContaineeViewController;
  v6 = -[SharedTripContaineeViewController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharedTrip, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v8, "addReceivingObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController dealloc](&v4, "dealloc");
}

- (void)registerActionsTableViewCellClasses
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController registerActionsTableViewCellClasses](&v4, "registerActionsTableViewCellClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("StopCell"));

}

- (void)setupSubviews
{
  MapsThemeLabel *v3;
  UILabel *headerTitleLabel;
  double v5;
  double v6;
  void *v7;
  void *v8;
  MapsThemeLabel *v9;
  UILabel *headerSubtitleLabel;
  double v11;
  double v12;
  void *v13;
  void *v14;
  MapsThemeLabel *v15;
  UILabel *handleLabel;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  UILabel *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  UIButton *v29;
  UIButton *directionsButton;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UIButton *v37;
  UIButton *contactButton;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MapsThemeLabel *v43;
  MapsThemeLabel *destinationHeaderLabel;
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
  MapsThrottler *v56;
  id v57;
  MapsThrottler *v58;
  MapsThrottler *buttonUpdateThrottler;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id location;
  objc_super v74;
  _QWORD v75[4];
  _QWORD v76[2];

  v74.receiver = self;
  v74.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController setupSubviews](&v74, "setupSubviews");
  v68 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_alloc_init(MapsThemeLabel);
  headerTitleLabel = self->_headerTitleLabel;
  self->_headerTitleLabel = &v3->super;

  -[UILabel setAccessibilityIdentifier:](self->_headerTitleLabel, "setAccessibilityIdentifier:", CFSTR("HeaderTitleLabel"));
  LODWORD(v5) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_headerTitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_headerTitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_headerTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_headerTitleLabel, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_headerTitleLabel, "setTextColor:", v8);

  -[UILabel setNumberOfLines:](self->_headerTitleLabel, "setNumberOfLines:", 0);
  v9 = objc_alloc_init(MapsThemeLabel);
  headerSubtitleLabel = self->_headerSubtitleLabel;
  self->_headerSubtitleLabel = &v9->super;

  -[UILabel setAccessibilityIdentifier:](self->_headerSubtitleLabel, "setAccessibilityIdentifier:", CFSTR("HeaderSubtitleLabel"));
  LODWORD(v11) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_headerSubtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  LODWORD(v12) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_headerSubtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_headerSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_headerSubtitleLabel, "setBackgroundColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_headerSubtitleLabel, "setTextColor:", v14);

  -[UILabel setNumberOfLines:](self->_headerSubtitleLabel, "setNumberOfLines:", 0);
  v15 = objc_alloc_init(MapsThemeLabel);
  handleLabel = self->_handleLabel;
  self->_handleLabel = &v15->super;

  -[UILabel setAccessibilityIdentifier:](self->_handleLabel, "setAccessibilityIdentifier:", CFSTR("HandleLabel"));
  LODWORD(v17) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_handleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
  LODWORD(v18) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_handleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_handleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_handleLabel, "setBackgroundColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_handleLabel, "setTextColor:", v20);

  -[UILabel setNumberOfLines:](self->_handleLabel, "setNumberOfLines:", 0);
  v21 = objc_alloc((Class)UIStackView);
  v22 = self->_handleLabel;
  v76[0] = self->_headerSubtitleLabel;
  v76[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 2));
  v70 = objc_msgSend(v21, "initWithArrangedSubviews:", v23);

  objc_msgSend(v70, "setAccessibilityIdentifier:", CFSTR("TitleStackView"));
  objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v70, "setAlignment:", 0);
  objc_msgSend(v70, "setDistribution:", 0);
  objc_msgSend(v70, "setAxis:", 1);
  objc_msgSend(v70, "setSpacing:", 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v24, "setTitleView:subtitleView:verticalSpaceBetweenViews:padding:", self->_headerTitleLabel, v70, 0.0, 16.0, 16.0, 6.0, 16.0);

  v25 = sub_1002A8AA0(self) == 5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v26, "setButtonHidden:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v27, "_setTopPadding:", 12.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v28, "_setBottomPadding:", 10.0);

  v29 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  directionsButton = self->_directionsButton;
  self->_directionsButton = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _mapsui_primaryHeaderActionConfiguration](UIButtonConfiguration, "_mapsui_primaryHeaderActionConfiguration"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.triangle.turn.up.right.diamond.fill")));
  objc_msgSend(v31, "setImage:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Directions [SharedETA]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v31, "setTitle:", v34);

  objc_msgSend(v31, "setContentInsets:", 15.0, 10.0, 15.0, 10.0);
  objc_msgSend(v31, "setTitleAlignment:", 2);
  -[UIButton setConfiguration:](self->_directionsButton, "setConfiguration:", v31);
  -[UIButton setAccessibilityIdentifier:](self->_directionsButton, "setAccessibilityIdentifier:", CFSTR("DirectionsButton"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_directionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton subtitleLabel](self->_directionsButton, "subtitleLabel"));
  objc_msgSend(v35, "setNumberOfLines:", 1);

  -[UIButton addTarget:action:forControlEvents:](self->_directionsButton, "addTarget:action:forControlEvents:", self, "directionsButtonTapped", 0x2000);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController topActionsContainerView](self, "topActionsContainerView"));
  objc_msgSend(v36, "addArrangedSubview:", self->_directionsButton);

  v37 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  contactButton = self->_contactButton;
  self->_contactButton = v37;

  -[UIButton setAccessibilityIdentifier:](self->_contactButton, "setAccessibilityIdentifier:", CFSTR("ContactButton"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_contactButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _mapsui_secondaryHeaderActionConfiguration](UIButtonConfiguration, "_mapsui_secondaryHeaderActionConfiguration"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("phone.fill")));
  objc_msgSend(v69, "setImage:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Contact [SharedETA]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v69, "setTitle:", v41);

  objc_msgSend(v69, "setContentInsets:", 15.0, 10.0, 15.0, 10.0);
  objc_msgSend(v69, "setTitleAlignment:", 2);
  -[UIButton setConfiguration:](self->_contactButton, "setConfiguration:", v69);
  -[UIButton addTarget:action:forControlEvents:](self->_contactButton, "addTarget:action:forControlEvents:", self, "contactButtonTapped", 0x2000);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController topActionsContainerView](self, "topActionsContainerView"));
  objc_msgSend(v42, "addArrangedSubview:", self->_contactButton);

  v43 = objc_alloc_init(MapsThemeLabel);
  destinationHeaderLabel = self->_destinationHeaderLabel;
  self->_destinationHeaderLabel = v43;

  -[MapsThemeLabel setAccessibilityIdentifier:](self->_destinationHeaderLabel, "setAccessibilityIdentifier:", CFSTR("DestinationHeaderLabel"));
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_destinationHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController metadataContainerView](self, "metadataContainerView"));
  objc_msgSend(v45, "addSubview:", self->_destinationHeaderLabel);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](self->_destinationHeaderLabel, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController metadataContainerView](self, "metadataContainerView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 20.0));
  v75[0] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](self->_destinationHeaderLabel, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController metadataContainerView](self, "metadataContainerView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 16.0));
  v75[1] = v60;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController metadataContainerView](self, "metadataContainerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](self->_destinationHeaderLabel, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 16.0));
  v75[2] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController metadataContainerView](self, "metadataContainerView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](self->_destinationHeaderLabel, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 0.0));
  v75[3] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 4));
  objc_msgSend(v68, "addObjectsFromArray:", v54);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v68);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v55, "addObserver:selector:name:object:", self, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  -[SharedTripContaineeViewController updateContent](self, "updateContent");
  -[SharedTripContaineeViewController _updateFonts](self, "_updateFonts");
  -[SharedTripContaineeViewController _loadActions](self, "_loadActions");
  objc_initWeak(&location, self);
  v56 = [MapsThrottler alloc];
  v57 = &_dispatch_main_q;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100571480;
  v71[3] = &unk_1011B3F50;
  objc_copyWeak(&v72, &location);
  v58 = -[MapsThrottler initWithInitialValue:throttlingInterval:queue:updateHandler:](v56, "initWithInitialValue:throttlingInterval:queue:updateHandler:", 0, &_dispatch_main_q, v71, 30.0);
  buttonUpdateThrottler = self->_buttonUpdateThrottler;
  self->_buttonUpdateThrottler = v58;

  objc_destroyWeak(&v72);
  objc_destroyWeak(&location);

}

- (BOOL)forceCurrentWidthForHeaderHeightCalculations
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("SharedTripView"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  self->_isVisible = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v4, "listenForLocationUpdates:", self);

  -[SharedTripContaineeViewController _refreshSubscriptionToken](self, "_refreshSubscriptionToken");
}

- (void)viewDidAppear:(BOOL)a3
{
  NSTimer *refreshTimestampTimer;
  NSTimer *v5;
  NSTimer *v6;
  NSTimer *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SharedTripContaineeViewController;
  -[SharedTripContaineeViewController viewDidAppear:](&v10, "viewDidAppear:", a3);
  refreshTimestampTimer = self->_refreshTimestampTimer;
  if (refreshTimestampTimer)
  {
    -[NSTimer invalidate](refreshTimestampTimer, "invalidate");
    v5 = self->_refreshTimestampTimer;
    self->_refreshTimestampTimer = 0;

  }
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "updateContent", 0, 1, 60.0));
  v7 = self->_refreshTimestampTimer;
  self->_refreshTimestampTimer = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_transportTypeStringForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, 650, v9);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v4, "stopListeningForLocationUpdates:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id subscriptionToken;
  NSTimer *refreshTimestampTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SharedTripContaineeViewController;
  -[SharedTripContaineeViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  self->_isVisible = 0;
  subscriptionToken = self->_subscriptionToken;
  self->_subscriptionToken = 0;

  -[NSTimer invalidate](self->_refreshTimestampTimer, "invalidate");
  refreshTimestampTimer = self->_refreshTimestampTimer;
  self->_refreshTimestampTimer = 0;

}

- (void)_loadActions
{
  SimpleContaineeAction *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SimpleContaineeAction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SimpleContaineeAction *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned int v21;
  SimpleContaineeAction *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  SimpleContaineeAction *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[2];

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(SimpleContaineeAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stop Receiving Updates [Shared ETA]"), CFSTR("localized string not found"), 0));
  -[SimpleContaineeAction setTitle:](v3, "setTitle:", v5);

  -[SimpleContaineeAction setGlyph:](v3, "setGlyph:", CFSTR("trash.circle.fill"));
  -[SimpleContaineeAction setGlyphStyle:](v3, "setGlyphStyle:", 3);
  -[SimpleContaineeAction setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("StopReceivingUpdatesAction"));
  -[SimpleContaineeAction setStyle:](v3, "setStyle:", 1);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100571E50;
  v35[3] = &unk_1011AD260;
  objc_copyWeak(&v36, &location);
  -[SimpleContaineeAction setAction:](v3, "setAction:", v35);
  if (-[SharedTripContaineeViewController _senderIsContact](self, "_senderIsContact"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Block this Contact [Shared ETA]"), CFSTR("localized string not found"), 0));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Block this Sender [Shared ETA]"), CFSTR("localized string not found"), 0));
  }
  v8 = (void *)v7;

  v9 = objc_alloc_init(SimpleContaineeAction);
  -[SimpleContaineeAction setTitle:](v9, "setTitle:", v8);
  if (sub_1002A8AA0(self) == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Share ETA Blocked Contacts explanation"), CFSTR("localized string not found"), 0));

    -[SimpleContaineeAction setFooter:](v9, "setFooter:", v11);
  }
  -[SimpleContaineeAction setGlyph:](v9, "setGlyph:", CFSTR("hand.raised.circle.fill"));
  -[SimpleContaineeAction setGlyphStyle:](v9, "setGlyphStyle:", 2);
  -[SimpleContaineeAction setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("BlockContactAction"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100571E80;
  v33[3] = &unk_1011AD260;
  objc_copyWeak(&v34, &location);
  -[SimpleContaineeAction setAction:](v9, "setAction:", v33);
  v38[0] = v3;
  v38[1] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  if (sub_1002A8AA0(self) != 5
    && !-[SharedTripContaineeViewController _senderIsContact](self, "_senderIsContact")
    && +[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
  {
    v26 = objc_alloc_init(SimpleContaineeAction);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Create New Contact [Shared ETA]"), CFSTR("localized string not found"), 0));
    -[SimpleContaineeAction setTitle:](v26, "setTitle:", v14);

    -[SimpleContaineeAction setGlyph:](v26, "setGlyph:", CFSTR("person.crop.circle"));
    -[SimpleContaineeAction setAccessibilityIdentifier:](v26, "setAccessibilityIdentifier:", CFSTR("CreateNewContactAction"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100571EB0;
    v31[3] = &unk_1011AD260;
    objc_copyWeak(&v32, &location);
    -[SimpleContaineeAction setAction:](v26, "setAction:", v31);
    v15 = objc_alloc_init(SimpleContaineeAction);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Add to Existing Contact [Shared ETA]"), CFSTR("localized string not found"), 0));
    -[SimpleContaineeAction setTitle:](v15, "setTitle:", v17);

    -[SimpleContaineeAction setGlyph:](v15, "setGlyph:", CFSTR("person.crop.circle.badge.plus"));
    -[SimpleContaineeAction setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("AddToExistingContactAction"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100571EE0;
    v29[3] = &unk_1011AD260;
    objc_copyWeak(&v30, &location);
    -[SimpleContaineeAction setAction:](v15, "setAction:", v29);
    v18 = objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v18, "insertObject:atIndex:", v26, 0);
    objc_msgSend(v18, "insertObject:atIndex:", v15, 1);
    v19 = objc_msgSend(v18, "copy");

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    v12 = v19;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v21 = objc_msgSend(v20, "isInternalInstall");

  if (v21)
  {
    v22 = objc_alloc_init(SimpleContaineeAction);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("File a Radar [Shared ETA]"), CFSTR("localized string not found"), 0));
    -[SimpleContaineeAction setTitle:](v22, "setTitle:", v24);

    -[SimpleContaineeAction setGlyph:](v22, "setGlyph:", CFSTR("ant.circle.fill"));
    -[SimpleContaineeAction setGlyphStyle:](v22, "setGlyphStyle:", 2);
    -[SimpleContaineeAction setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("TapToRadarAction"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100571F10;
    v27[3] = &unk_1011AD260;
    objc_copyWeak(&v28, &location);
    -[SimpleContaineeAction setAction:](v22, "setAction:", v27);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObject:", v22));

    objc_destroyWeak(&v28);
    v12 = (void *)v25;
  }
  -[SimpleContaineeViewController setActions:](self, "setActions:", v12);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&location);
}

- (void)updateContent
{
  void *v3;
  id v4;
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
  id v17;
  UILabel **p_handleLabel;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *remainingWaypoints;
  void *v25;
  NSArray *v26;
  NSArray *remainingETAs;
  void *v28;
  void *v29;
  unint64_t v30;
  NSArray *v31;
  NSUInteger v32;
  NSArray *v33;
  NSArray *v34;
  NSArray *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  id v43;

  if (!-[SharedTripContaineeViewController isViewLoaded](self, "isViewLoaded"))
    return;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationName"));

  v4 = objc_msgSend(v43, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("(person)'s route to (location) [shared eta]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "senderName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9, v11));
    -[UILabel setText:](self->_headerTitleLabel, "setText:", v12);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("(person)'s route [shared eta]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "senderName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9));
    -[UILabel setText:](self->_headerTitleLabel, "setText:", v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeCellSubtitle"));
  -[UILabel setText:](self->_headerSubtitleLabel, "setText:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "senderInfo"));
  v17 = objc_msgSend(v16, "hasLocalContactIdentifier");

  if ((_DWORD)v17)
  {
    p_handleLabel = &self->_handleLabel;
    -[UILabel setText:](self->_handleLabel, "setText:", &stru_1011EB268);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "senderInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fromIdentifier"));
    p_handleLabel = &self->_handleLabel;
    -[UILabel setText:](self->_handleLabel, "setText:", v21);

  }
  -[UILabel setHidden:](*p_handleLabel, "setHidden:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "waypointInfos"));
  remainingWaypoints = self->_remainingWaypoints;
  self->_remainingWaypoints = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "etaInfos"));
  remainingETAs = self->_remainingETAs;
  self->_remainingETAs = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  if (objc_msgSend(v28, "hasCurrentWaypointIndex"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v30 = objc_msgSend(v29, "currentWaypointIndex");

  }
  else
  {
    v30 = 0;
  }

  v31 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  if (!-[NSArray hasCurrentWaypointIndex](v31, "hasCurrentWaypointIndex")
    || -[NSArray count](self->_remainingWaypoints, "count") <= v30)
  {
    goto LABEL_16;
  }
  v32 = -[NSArray count](self->_remainingETAs, "count");

  if (v32 > v30)
  {
    v33 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_remainingWaypoints, "subarrayWithRange:", v30, (char *)-[NSArray count](self->_remainingWaypoints, "count") - v30));
    v34 = self->_remainingWaypoints;
    self->_remainingWaypoints = v33;

    v35 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_remainingETAs, "subarrayWithRange:", v30, (char *)-[NSArray count](self->_remainingETAs, "count") - v30));
    v31 = self->_remainingETAs;
    self->_remainingETAs = v35;
LABEL_16:

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v37 = objc_msgSend(v36, "waypointInfosCount");

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v39 = v38;
  if ((unint64_t)v37 >= 2)
    v40 = CFSTR("Stops [Shared ETA]");
  else
    v40 = CFSTR("Destination [Shared ETA]");
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", v40, CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](self->_destinationHeaderLabel, "setText:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v42, "reloadData");

  -[SharedTripContaineeViewController _updateButtons](self, "_updateButtons");
  -[SharedTripContaineeViewController updateTheme](self, "updateTheme");

}

- (BOOL)_shouldShowDirectionsButton
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destinationWaypointMapItem"));

  v4 = objc_alloc((Class)CLLocation);
  objc_msgSend(v3, "coordinate");
  v6 = v5;
  objc_msgSend(v3, "coordinate");
  v7 = objc_msgSend(v4, "initWithLatitude:longitude:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));

  objc_msgSend(v9, "distanceFromLocation:", v7);
  v12 = v10 >= 500.0 || v9 == 0;

  return v12;
}

- (void)_updateButtonsForLocationUpdate
{
  unsigned int v3;
  void *v4;
  void *v5;

  v3 = -[SharedTripContaineeViewController _shouldShowDirectionsButton](self, "_shouldShowDirectionsButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton superview](self->_directionsButton, "superview"));
  if (v3)
  {
    if (v4)
    {

      return;
    }
  }
  else
  {
    v5 = v4;

    if (!v5)
      return;
  }
  -[SharedTripContaineeViewController _updateButtons](self, "_updateButtons");
}

- (void)_updateButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  __CFString *v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("To (destination)[SharedETA]"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationName"));

  v7 = 0;
  if (-[NSArray count](self->_remainingWaypoints, "count") >= 2)
  {
    if (objc_msgSend(v6, "length"))
      v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));
    else
      v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_directionsButton, "configuration"));
  v39 = (void *)v7;
  objc_msgSend(v8, "setSubtitle:", v7);
  -[UIButton setConfiguration:](self->_directionsButton, "setConfiguration:", v8);
  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationWaypointMapItem"));

  v12 = objc_alloc((Class)CLLocation);
  objc_msgSend(v11, "coordinate");
  v14 = v13;
  objc_msgSend(v11, "coordinate");
  v15 = objc_msgSend(v12, "initWithLatitude:longitude:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastLocation"));
  v38 = v15;
  objc_msgSend(v17, "distanceFromLocation:", v15);
  v19 = v18;

  LODWORD(v16) = -[SharedTripContaineeViewController _shouldShowDirectionsButton](self, "_shouldShowDirectionsButton");
  v20 = sub_10043237C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if ((_DWORD)v16)
  {
    if (v22)
    {
      *(_DWORD *)buf = 134283521;
      v41 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Will display Directions for button distance: %{private}lfm", buf, 0xCu);
    }

    objc_msgSend(v9, "addObject:", self->_directionsButton);
  }
  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 134283521;
      v41 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Will NOT display Directions button for distance: %{private}lfm", buf, 0xCu);
    }

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "senderInfo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localContactIdentifier"));

  v26 = objc_msgSend(v25, "length");
  v27 = +[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed");
  v28 = sub_10043237C();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v26 && v27)
  {
    if (v30)
    {
      *(_DWORD *)buf = 138477827;
      v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Will display Contact button for sender:%{private}@", buf, 0xCu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_contactButton, "configuration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "senderInfo"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localName"));
    objc_msgSend(v31, "setSubtitle:", v34);

    -[UIButton setConfiguration:](self->_contactButton, "setConfiguration:", v31);
    objc_msgSend(v9, "addObject:", self->_contactButton);
    v8 = v31;
  }
  else
  {
    if (v30)
    {
      v35 = CFSTR("NO");
      if (v27)
        v35 = CFSTR("YES");
      v36 = v35;
      *(_DWORD *)buf = 138478083;
      v41 = v25;
      v42 = 2112;
      v43 = v36;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Will NOT display Contact button for sender: %{private}@ (Contacts access authorized: %@)", buf, 0x16u);

    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController topActionsContainerView](self, "topActionsContainerView"));
  objc_msgSend(v37, "_maps_setArrangedSubviews:", v9);

}

- (void)updateTheme
{
  UIButton *directionsButton;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SharedTripContaineeViewController;
  -[SimpleContaineeViewController updateTheme](&v6, "updateTheme");
  if (sub_1002A8AA0(self) == 5)
  {
    directionsButton = self->_directionsButton;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
    -[UIButton setTitleColor:forState:](directionsButton, "setTitleColor:forState:", v5, 0);

  }
}

- (void)_updateFonts
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
  -[UILabel setFont:](self->_headerTitleLabel, "setFont:", v6);

  v18 = (id)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fontDescriptorWithSymbolicTraits:", 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  -[MapsThemeLabel setFont:](self->_destinationHeaderLabel, "setFont:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubhead, 2, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9, 0.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_directionsButton, "titleLabel"));
  objc_msgSend(v11, "setFont:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_directionsButton, "titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "font"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_contactButton, "titleLabel"));
  objc_msgSend(v14, "setFont:", v13);

  if (sub_1002A8AA0(self) == 5)
    v15 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v16 = (void *)v15;
  -[UILabel setFont:](self->_headerSubtitleLabel, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_headerSubtitleLabel, "font"));
  -[UILabel setFont:](self->_handleLabel, "setFont:", v17);

}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  -[SharedTripContaineeViewController didMoveToParentViewController:](&v4, "didMoveToParentViewController:", a3);
  -[SharedTripContaineeViewController _refreshSubscriptionToken](self, "_refreshSubscriptionToken");
}

- (void)setSharedTrip:(id)a3
{
  GEOSharedNavState *v5;
  GEOSharedNavState *v6;

  v5 = (GEOSharedNavState *)a3;
  if (self->_sharedTrip != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sharedTrip, a3);
    -[SharedTripContaineeViewController updateContent](self, "updateContent");
    v5 = v6;
  }

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

  v9 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController _maps_uiScene](self, "_maps_uiScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
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
  subscriptionToken = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(subscriptionToken, "groupIdentifier"));
  v7 = -[SharedTripSceneAwareSubscription initWithTripIdentifier:scene:](v4, "initWithTripIdentifier:scene:", v6, v9);
  v8 = self->_subscriptionToken;
  self->_subscriptionToken = v7;

LABEL_7:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  return -[SimpleContaineeViewController numberOfSectionsInTableView:](&v4, "numberOfSectionsInTableView:", a3) + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5;

  if (!a4)
    return -[NSArray count](self->_remainingWaypoints, "count", a3);
  v5.receiver = self;
  v5.super_class = (Class)SharedTripContaineeViewController;
  return -[SimpleContaineeViewController tableView:numberOfRowsInSection:](&v5, "tableView:numberOfRowsInSection:", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  MapsUIImageGEOFeatureSpec *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  objc_super v50;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    v50.receiver = self;
    v50.super_class = (Class)SharedTripContaineeViewController;
    v8 = -[SimpleContaineeViewController tableView:cellForRowAtIndexPath:](&v50, "tableView:cellForRowAtIndexPath:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    goto LABEL_25;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("StopCell"), v6));

  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("SharedTripStopCell"));
  v10 = objc_msgSend(v6, "row");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_remainingWaypoints, "objectAtIndexedSubscript:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
  v12 = 16.0;
  if (sub_1002A8AA0(self) == 5)
  {
    objc_msgSend(v11, "directionalLayoutMargins");
    v12 = v13;
  }
  v14 = sub_1002A8AA0(self);
  v15 = 4.0;
  if (v14 != 5)
    v15 = 16.0;
  objc_msgSend(v11, "setDirectionalLayoutMargins:", v15, v12, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  objc_msgSend(v11, "setText:", v16);

  if (v10 >= (id)-[NSArray count](self->_remainingETAs, "count"))
    v17 = 0;
  else
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_remainingETAs, "objectAtIndexedSubscript:", v10));
  v46 = v17;
  if (objc_msgSend(v17, "hasEtaTimestamp"))
  {
    objc_msgSend(v17, "etaTimestamp");
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v18, v19, 0));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[Shared Trip, Details] Waypoint ETA"), CFSTR("localized string not found"), 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20, v46));

    objc_msgSend(v11, "setSecondaryText:", v23);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v7, "hasMapItemStorage"))
  {
    v24 = objc_alloc((Class)MKMapItem);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItemStorage"));
    v18 = objc_msgSend(v24, "initWithGeoMapItem:isPlaceHolderPlace:", v25, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_addressFormattedAsMultilineAddress"));
    objc_msgSend(v11, "setSecondaryText:", v26);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "secondaryTextProperties"));
    objc_msgSend(v20, "setNumberOfLines:", 0);
    goto LABEL_14;
  }
LABEL_15:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleHeadline));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fontDescriptorWithSymbolicTraits:", 2));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v28, 0.0));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textProperties"));
  objc_msgSend(v30, "setFont:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textProperties"));
  objc_msgSend(v31, "setNumberOfLines:", 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "secondaryTextProperties"));
  objc_msgSend(v33, "setFont:", v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "secondaryTextProperties"));
  objc_msgSend(v35, "setColor:", v34);

  objc_msgSend(v9, "setContentConfiguration:", v11);
  if (objc_msgSend(v7, "hasMapItemStorage"))
  {
    v36 = objc_alloc_init(MapsUIImageGEOFeatureSpec);
    -[MapsUIImageGEOFeatureSpec setTransparent:](v36, "setTransparent:", 0);
    -[MapsUIImageGEOFeatureSpec setInverted:](v36, "setInverted:", 0);
    if (sub_1002A8AA0(self) == 5)
      v37 = 1;
    else
      v37 = 2;
    -[MapsUIImageGEOFeatureSpec setSize:](v36, "setSize:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItemStorage"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "_styleAttributes"));
    -[MapsUIImageGEOFeatureSpec setStyle:](v36, "setStyle:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10057342C;
    v47[3] = &unk_1011BB6C8;
    v48 = v11;
    v49 = v9;
    objc_msgSend(v40, "getImageForSpec:loadImageOnBackgroundQueue:completion:", v36, 0, v47);

  }
  else
  {
    if (objc_msgSend(v7, "hasChargingStationInfo"))
      v41 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
    else
      v41 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes addressMarkerStyleAttributes](GEOFeatureStyleAttributes, "addressMarkerStyleAttributes"));
    v42 = (void *)v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController traitCollection](self, "traitCollection"));
    objc_msgSend(v43, "displayScale");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v42, 2, 0));
    objc_msgSend(v11, "setImage:", v44);

    objc_msgSend(v9, "setContentConfiguration:", v11);
  }

LABEL_25:
  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SharedTripContaineeViewController;
    v8 = -[SimpleContaineeViewController tableView:shouldHighlightRowAtIndexPath:](&v13, "tableView:shouldHighlightRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = objc_msgSend(v7, "row");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waypointInfoAtIndex:", v9));

    v8 = objc_msgSend(v11, "hasMapItemStorage");
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v12.receiver = self;
    v12.super_class = (Class)SharedTripContaineeViewController;
    -[SimpleContaineeViewController tableView:didSelectRowAtIndexPath:](&v12, "tableView:didSelectRowAtIndexPath:", v6, v7);
  }
  else
  {
    v8 = objc_msgSend(v7, "row");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypointInfoAtIndex:", v8));

    if (objc_msgSend(v10, "hasMapItemStorage"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItemStorage"));
      -[SharedTripContaineeViewController _presentPlaceCardForMapItem:](self, "_presentPlaceCardForMapItem:", v11);

      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }

  }
}

- (void)_presentPlaceCardForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v7, 0);
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController actionDelegate](self, "actionDelegate"));
      objc_msgSend(v6, "didSelectStopWithMapItem:", v5);

    }
  }

}

- (BOOL)_senderIsContact
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "senderInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localContactIdentifier"));
  v5 = v4 != 0;

  return v5;
}

- (void)_addContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "senderInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fromIdentifier"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:emailOrPhoneNumber:](CNContact, "contactWithDisplayName:emailOrPhoneNumber:", v4, v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", v10));
  objc_msgSend(v8, "setDisplayMode:", 1);
  objc_msgSend(v8, "setDelegate:", self);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", -2);
  -[SharedTripContaineeViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v9, 1, 0);

}

- (void)_addToContact
{
  id v3;

  v3 = objc_alloc_init((Class)CNContactPickerViewController);
  objc_msgSend(v3, "setDelegate:", self);
  -[SharedTripContaineeViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v3, 1, 0);

}

- (id)_refetchedContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "properties"));

  if ((objc_msgSend(v3, "areKeysAvailable:", v5) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactStore"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v5, 0));

    v3 = (id)v9;
  }

  return v3;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = v7;
  if (v7)
  {
    -[SharedTripContaineeViewController _reloadWithContact:](self, "_reloadWithContact:", v7);
    v6 = v7;
  }

}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderInfo"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fromIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController _refetchedContact:](self, "_refetchedContact:", v5));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:emailOrPhoneNumber:](CNContact, "contactWithDisplayName:emailOrPhoneNumber:", 0, v26));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddresses"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddresses"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddresses"));
      v15 = objc_msgSend(v14, "mutableCopy");

    }
    else
    {
      v15 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddresses"));
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    objc_msgSend(v9, "setEmailAddresses:", v15);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "phoneNumbers"));
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
      v21 = objc_msgSend(v20, "mutableCopy");

    }
    else
    {
      v21 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "phoneNumbers"));
    objc_msgSend(v21, "addObjectsFromArray:", v22);

    objc_msgSend(v9, "setPhoneNumbers:", v21);
  }
  v23 = objc_alloc_init((Class)CNSaveRequest);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contactStore"));

  objc_msgSend(v23, "updateContact:", v9);
  objc_msgSend(v25, "executeSaveRequest:error:", v23, 0);
  -[SharedTripContaineeViewController _reloadWithContact:](self, "_reloadWithContact:", v9);

}

- (void)_reloadWithContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderInfo"));
  objc_msgSend(v6, "setLocalContactIdentifier:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v4, 1000));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderInfo"));
  objc_msgSend(v8, "setLocalName:", v7);

  -[SharedTripContaineeViewController updateContent](self, "updateContent");
  -[SharedTripContaineeViewController _loadActions](self, "_loadActions");

}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastLocation"));
  -[MapsThrottler setValue:](self->_buttonUpdateThrottler, "setValue:", v4);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)blockSender
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;

  objc_initWeak(&location, self);
  if (-[SharedTripContaineeViewController _senderIsContact](self, "_senderIsContact"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Block this Contact [Shared ETA]"), CFSTR("localized string not found"), 0));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Block this Sender [Shared ETA]"), CFSTR("localized string not found"), 0));
  }
  v5 = (void *)v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Alert's text confirmation"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 0));

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("BlockContactAlert"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
  objc_msgSend(v10, "setSourceView:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
  objc_msgSend(v20, "setSourceRect:", v13, v15, v17, v19);

  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100573FE8;
  v28 = &unk_1011AFA88;
  objc_copyWeak(&v29, &location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 2, &v25));
  objc_msgSend(v8, "addAction:", v21, v25, v26, v27, v28);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Alert's cancel button title"), CFSTR("localized string not found"), 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 1, &stru_1011BB6E8));
  objc_msgSend(v8, "addAction:", v24);

  -[SharedTripContaineeViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

- (void)blockSenderAction
{
  void *v3;
  void *v4;
  void *v5;
  const void *CMFItemFromString;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fromIdentifier"));

  if (v5)
  {
    CMFItemFromString = (const void *)CreateCMFItemFromString(v5);
    v7 = sub_10043237C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (CMFItemFromString)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138477827;
        v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Blocking sender handle %{private}@", (uint8_t *)&v13, 0xCu);
      }

      CMFBlockListAddItemForAllServices(CMFItemFromString);
      CFRelease(CMFItemFromString);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to create filter item to block sender", (uint8_t *)&v13, 2u);
      }

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
  objc_msgSend(v10, "blockSharedTripWithIdentifier:", v12);

}

- (void)blockTrip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
  objc_msgSend(v3, "blockSharedTripWithIdentifier:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_transportTypeStringForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9028, 650, v6);

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController actionDelegate](self, "actionDelegate", a3, a4));
  objc_msgSend(v5, "closeSharedTripDetail");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_transportTypeStringForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, 650, v6);

}

- (void)contactButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController actionDelegate](self, "actionDelegate"));
  objc_msgSend(v3, "didRequestContactsCard");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_transportTypeStringForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6044, 650, v4);

}

- (void)directionsButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController actionDelegate](self, "actionDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  objc_msgSend(v3, "didRequestDirectionsForSharedTrip:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_transportTypeStringForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6003, 650, v5);

}

- (void)tapToRadarButtonTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v2, "launchTTR");

}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SharedTripContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v8, "applyAlphaToContent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController topActionsContainerView](self, "topActionsContainerView"));
  objc_msgSend(v5, "setAlpha:", a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController metadataContainerView](self, "metadataContainerView"));
  objc_msgSend(v6, "setAlpha:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v7, "setAlpha:", a3);

}

- (void)_updateWithTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));

  if (v4 == v9)
  {
    -[SharedTripContaineeViewController updateContent](self, "updateContent");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupIdentifier"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
      -[SharedTripContaineeViewController setSharedTrip:](self, "setSharedTrip:", v9);
  }

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
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "receivedTrips"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupIdentifier", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (v13)
        {
          -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", v9);
          v14 = v4;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController actionDelegate](self, "actionDelegate"));
  objc_msgSend(v14, "closeSharedTripDetail");
LABEL_11:

}

- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4
{
  -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifier"));

  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((_DWORD)v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController actionDelegate](self, "actionDelegate"));
    objc_msgSend(v9, "closeSharedTripDetail");

  }
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  -[SharedTripContaineeViewController _updateWithTrip:](self, "_updateWithTrip:", a4);
}

- (SharedTripsActionCoordination)actionDelegate
{
  return (SharedTripsActionCoordination *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_storeStrong((id *)&self->_refreshTimestampTimer, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_remainingETAs, 0);
  objc_storeStrong((id *)&self->_remainingWaypoints, 0);
  objc_storeStrong((id *)&self->_contactButton, 0);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_buttonUpdateThrottler, 0);
  objc_storeStrong((id *)&self->_destinationHeaderLabel, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
  objc_storeStrong((id *)&self->_headerSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
}

@end
