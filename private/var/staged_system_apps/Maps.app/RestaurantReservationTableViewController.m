@implementation RestaurantReservationTableViewController

- (RestaurantReservationTableViewController)initWithAnalyticsCaptor:(id)a3 analyticsBookingSession:(id)a4
{
  id v7;
  id v8;
  RestaurantReservationTableViewController *v9;
  RestaurantReservationTableViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RestaurantReservationTableViewController;
  v9 = -[RestaurantReservationTableViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_analyticsCaptor, a3);
    objc_storeStrong((id *)&v10->_analyticsBookingSession, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RestaurantReservationTableViewController;
  -[RestaurantReservationTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[RestaurantReservationTableViewController setupTableView](self, "setupTableView");
  -[RestaurantReservationTableViewController setupFooterButtonView](self, "setupFooterButtonView");
  -[RestaurantReservationTableViewController setupConstraints](self, "setupConstraints");
  -[RestaurantReservationTableViewController registerCells](self, "registerCells");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RestaurantReservationTableViewController;
  -[RestaurantReservationTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v4, "beginSessionIfNeeded");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RestaurantReservationTableViewController;
  -[RestaurantReservationTableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[RestaurantReservationTableViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
}

- (void)registerCells
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v4 = objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
  v5 = (objc_class *)objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v9 = objc_opt_class(RestaurantReservationTableViewCell);
  v10 = (objc_class *)objc_opt_class(RestaurantReservationTableViewCell);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v14 = objc_opt_class(RestaurantReservationsChooseOfferCell);
  v15 = (objc_class *)objc_opt_class(RestaurantReservationsChooseOfferCell);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", v14, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v19 = objc_opt_class(RidesharingAppActionTableViewCell);
  v20 = (objc_class *)objc_opt_class(RidesharingAppActionTableViewCell);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", v19, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v24 = objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
  v25 = (objc_class *)objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
  v26 = NSStringFromClass(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", v24, v27);

  v32 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v28 = objc_opt_class(ReservationTextTableViewCell);
  v29 = (objc_class *)objc_opt_class(ReservationTextTableViewCell);
  v30 = NSStringFromClass(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v32, "registerClass:forCellReuseIdentifier:", v28, v31);

}

- (void)setupTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RestaurantReservationTableViewController setTableView:](self, "setTableView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setDataSource:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", UITableViewAutomaticDimension);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setAllowsMultipleSelectionDuringEditing:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setContentInset:", -40.0, 0.0, -40.0, 0.0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "addSubview:", v9);

}

- (void)setupFooterButtonView
{
  ReservationButtonView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(ReservationButtonView);
  -[RestaurantReservationTableViewController setFooterButtonView:](self, "setFooterButtonView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  objc_msgSend(v4, "setTopHairlineHidden:", 0);

  -[RestaurantReservationTableViewController configureButton](self, "configureButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  objc_msgSend(v5, "addSubview:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "button"));
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "footerButtonTapped:", 64);

}

- (void)setupConstraints
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
  _QWORD v41[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v41[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v41[1] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v41[2] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v41[3] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v41[4] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v41[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v41[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RestaurantReservationTableViewController;
  -[RestaurantReservationTableViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)configureButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;

  v36 = 0;
  v3 = -[RestaurantReservationTableViewController contactDisplayStringSatisfied:](self, "contactDisplayStringSatisfied:", &v36);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController inferredContactRequirements](self, "inferredContactRequirements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest"));
  v7 = -[RestaurantReservationTableViewController requirements:satisfiableWithDisplayPreferences:guest:](self, "requirements:satisfiableWithDisplayPreferences:guest:", v4, v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));
  if (v8 && !-[RestaurantReservationTableViewController bookingPending](self, "bookingPending"))
  {
    if (v36)
      v10 = v7;
    else
      v10 = 0;
    v9 = v10 | v7 ^ 1;
  }
  else
  {
    v9 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "button"));
  objc_msgSend(v12, "setEnabled:", v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "button"));
  if (objc_msgSend(v14, "isEnabled"))
    v15 = 1.0;
  else
    v15 = 0.200000003;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "button"));
  objc_msgSend(v17, "setAlpha:", v15);

  v18 = -[RestaurantReservationTableViewController bookingPending](self, "bookingPending");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));
  v20 = v19;
  if (v18)
  {
    v21 = objc_msgSend(v19, "requiresManualRequest");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v21)
      v23 = CFSTR("reservation_booking_request_pending_title");
    else
      v23 = CFSTR("reservation_booking_pending_title");
    goto LABEL_22;
  }

  if (v20)
  {
    if ((v7 & 1) == 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = v28;
      v23 = CFSTR("reservation_continue_in_app_title_key");
LABEL_23:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v23, CFSTR("localized string not found"), 0));

      v29 = objc_alloc((Class)NSString);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController appName](self, "appName"));
      v27 = objc_msgSend(v29, "initWithFormat:", v26, v30);

      goto LABEL_24;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));
    v25 = objc_msgSend(v24, "requiresManualRequest");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v25)
      v23 = CFSTR("reservation_request_with_app_title");
    else
      v23 = CFSTR("reservation_book_with_app_title");
LABEL_22:
    v28 = v22;
    goto LABEL_23;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("reservation_choose_time_button_title"), CFSTR("localized string not found"), 0));
LABEL_24:

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "button"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "configuration"));

  objc_msgSend(v33, "setTitle:", v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController footerButtonView](self, "footerButtonView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "button"));
  objc_msgSend(v35, "setConfiguration:", v33);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  unsigned int v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailsIndexPath](self, "reservationDetailsIndexPath"));
    v11 = objc_msgSend(v5, "isEqual:", v10);

    if (v11)
      v9 = 149.0;
    else
      v9 = 40.0;
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4;

  v4 = -[RestaurantReservationTableViewController numberOfNonOptionalSections](self, "numberOfNonOptionalSections", a3);
  return -[RestaurantReservationTableViewController numberOfOptionalSections](self, "numberOfOptionalSections") + v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[RestaurantReservationTableViewController headerSection](self, "headerSection", a3) == a4
    || -[RestaurantReservationTableViewController advisementSection](self, "advisementSection") == a4
    && -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection"))
  {
    return 2;
  }
  if (-[RestaurantReservationTableViewController offersSection](self, "offersSection") == a4
    && -[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection"))
  {
    return -[RestaurantReservationTableViewController numberOfRowsInOffersSection](self, "numberOfRowsInOffersSection");
  }
  if (-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection") == a4)
    return -[RestaurantReservationTableViewController numberOfRowsInDetailsSection](self, "numberOfRowsInDetailsSection");
  if (-[RestaurantReservationTableViewController termsAndConditionsSection](self, "termsAndConditionsSection") == a4
    && -[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions"))
  {
    return 2;
  }
  else
  {
    return -[RestaurantReservationTableViewController openAppSection](self, "openAppSection") == a4;
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;
  double v13;
  NSNumber *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  id v18;
  _BOOL4 v19;
  double v20;
  NSNumber *v21;
  void *v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v24 = a4;
  v7 = a5;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)-[RestaurantReservationTableViewController headerSection](self, "headerSection")
    && objc_msgSend(v7, "row") == (id)1)
  {
    objc_msgSend(v24, "bounds");
    objc_msgSend(v24, "setSeparatorInset:", 0.0, v9, 0.0, 0.0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));

  if (!v10)
  {
    v11 = objc_opt_new(NSMutableDictionary);
    -[RestaurantReservationTableViewController setHeightCache:](self, "setHeightCache:", v11);

  }
  v12 = objc_msgSend(v7, "section");
  if (v12 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection")
    && -[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection"))
  {
    if (!objc_msgSend(v7, "row"))
    {
      objc_msgSend(v24, "bounds");
      objc_msgSend(v24, "setSeparatorInset:", 0.0, v13, 0.0, 0.0);
    }
    objc_msgSend(v24, "bounds");
    v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetHeight(v25));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[RestaurantReservationTableViewController setOffersRowHeight:](self, "setOffersRowHeight:", v15);

  }
  v16 = objc_msgSend(v7, "section");
  v17 = v16 == (id)-[RestaurantReservationTableViewController termsAndConditionsSection](self, "termsAndConditionsSection")&& -[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions")&& objc_msgSend(v7, "row") == 0;
  v18 = objc_msgSend(v7, "section");
  v19 = v18 == (id)-[RestaurantReservationTableViewController advisementSection](self, "advisementSection")
     && -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection")&& objc_msgSend(v7, "row") == 0;
  if (v17 || v19)
  {
    objc_msgSend(v24, "bounds");
    objc_msgSend(v24, "setSeparatorInset:", 0.0, v20, 0.0, 0.0);
  }
  objc_msgSend(v24, "bounds");
  v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetHeight(v26));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v7);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  UITableViewCell *v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  UITableViewCell *v19;
  void *v20;
  id v21;
  char *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  id v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  objc_class *v54;
  NSString *v55;
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
  objc_class *v70;
  NSString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  objc_class *v91;
  NSString *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  objc_class *v101;
  NSString *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  UIView *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  objc_class *v113;
  NSString *v114;
  void *v115;
  void *v116;
  objc_class *v118;
  NSString *v119;
  void *v120;
  void *v121;
  unsigned __int8 v122;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)-[RestaurantReservationTableViewController headerSection](self, "headerSection"))
  {
    if (!objc_msgSend(v7, "row"))
    {
      v70 = (objc_class *)objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
      v71 = NSStringFromClass(v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v72));

      -[UITableViewCell setAutomaticallyHidesChevron:](v19, "setAutomaticallyHidesChevron:", 1);
      -[UITableViewCell setSubtitleType:](v19, "setSubtitleType:", 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantName](self, "restaurantName"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell mainLabel](v19, "mainLabel"));
      objc_msgSend(v74, "setText:", v73);

      v75 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantDescriptionText](self, "restaurantDescriptionText"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subLabel](v19, "subLabel"));
      objc_msgSend(v76, "setText:", v75);

      v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subLabel](v19, "subLabel"));
      objc_msgSend(v78, "setFont:", v77);

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subLabel](v19, "subLabel"));
      objc_msgSend(v80, "setTextColor:", v79);

      if (-[RestaurantReservationTableViewController useTruncatedAdvisement](self, "useTruncatedAdvisement"))
        v81 = 2;
      else
        v81 = 0;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subLabel](v19, "subLabel"));
      objc_msgSend(v82, "setNumberOfLines:", v81);

      v83 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](v19, "contentView"));
      objc_msgSend(v83, "layoutMargins");
      v85 = v84;
      v87 = v86;
      v89 = v88;

      v90 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](v19, "contentView"));
      objc_msgSend(v90, "setLayoutMargins:", v85, v87, 20.0, v89);

LABEL_40:
      -[UITableViewCell setAccessoryType:](v19, "setAccessoryType:", 1);
      goto LABEL_51;
    }
    if (objc_msgSend(v7, "row") == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));

      if (!v9)
      {
        v10 = (objc_class *)objc_opt_class(RestaurantReservationTableViewCell);
        v11 = NSStringFromClass(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v12));

        -[RestaurantReservationTableViewController setReservationDetailCell:](self, "setReservationDetailCell:", v13);
        -[RestaurantReservationTableViewController _configureReservationDetails](self, "_configureReservationDetails");

      }
      v14 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
      goto LABEL_42;
    }
  }
  v15 = objc_msgSend(v7, "section");
  if (v15 == (id)-[RestaurantReservationTableViewController advisementSection](self, "advisementSection")
    && -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection"))
  {
    if (!objc_msgSend(v7, "row"))
    {
      v91 = (objc_class *)objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
      v92 = NSStringFromClass(v91);
      v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v93));

      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("reservation_from_restaurant_format_key"), CFSTR("localized string not found"), 0));

      v95 = objc_alloc((Class)NSString);
      v96 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantName](self, "restaurantName"));
      goto LABEL_44;
    }
    if (objc_msgSend(v7, "row") == (id)1)
    {
      v16 = (objc_class *)objc_opt_class(ReservationTextTableViewCell);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantAdvisementText](self, "restaurantAdvisementText"));
      -[UITableViewCell setText:](v19, "setText:", v20);

      -[UITableViewCell setPrimaryButtonText:](v19, "setPrimaryButtonText:", 0);
      -[UITableViewCell setSecondaryButtonText:](v19, "setSecondaryButtonText:", 0);
      goto LABEL_51;
    }
  }
  v21 = objc_msgSend(v7, "section");
  if (v21 != (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection")
    || !-[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection"))
  {
    v35 = objc_msgSend(v7, "section");
    if (v35 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection"))
    {
      v36 = (objc_class *)objc_opt_class(UITableViewCell);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v38));

      if (!v19)
      {
        v39 = objc_alloc((Class)UITableViewCell);
        v40 = (objc_class *)objc_opt_class(UITableViewCell);
        v41 = NSStringFromClass(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v19 = (UITableViewCell *)objc_msgSend(v39, "initWithStyle:reuseIdentifier:", 1, v42);

      }
      v43 = objc_msgSend(v7, "row");
      if (v43 == (id)-[RestaurantReservationTableViewController reservationContactInfoRow](self, "reservationContactInfoRow")&& -[RestaurantReservationTableViewController shouldDisplayContactCell](self, "shouldDisplayContactCell"))
      {
        v122 = 0;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("reservation_your_details_key"), CFSTR("localized string not found"), 0));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v19, "textLabel"));
        objc_msgSend(v46, "setText:", v45);

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController contactDisplayStringSatisfied:](self, "contactDisplayStringSatisfied:", &v122));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v19, "detailTextLabel"));
        objc_msgSend(v48, "setText:", v47);

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController contactDisplayColorSatisfied:](self, "contactDisplayColorSatisfied:", v122));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v19, "detailTextLabel"));
        objc_msgSend(v50, "setTextColor:", v49);

      }
      v51 = objc_msgSend(v7, "row");
      if (v51 == (id)-[RestaurantReservationTableViewController reservationSpecialRequestRow](self, "reservationSpecialRequestRow"))-[RestaurantReservationTableViewController configureSpecialRequestTextCell:](self, "configureSpecialRequestTextCell:", v19);
      goto LABEL_40;
    }
    v52 = objc_msgSend(v7, "section");
    if (v52 == (id)-[RestaurantReservationTableViewController openAppSection](self, "openAppSection")
      && !objc_msgSend(v7, "row"))
    {
      v113 = (objc_class *)objc_opt_class(RidesharingAppActionTableViewCell);
      v114 = NSStringFromClass(v113);
      v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v115));

      v116 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController appName](self, "appName"));
      -[UITableViewCell setApplicationName:titleType:](v19, "setApplicationName:titleType:", v116, 1);

      -[UITableViewCell setDelegate:](v19, "setDelegate:", self);
      goto LABEL_51;
    }
    v53 = objc_msgSend(v7, "section");
    if (v53 != (id)-[RestaurantReservationTableViewController termsAndConditionsSection](self, "termsAndConditionsSection")|| !-[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions"))
    {
      goto LABEL_41;
    }
    if (objc_msgSend(v7, "row"))
    {
      if (objc_msgSend(v7, "row") == (id)1)
      {
        v54 = (objc_class *)objc_opt_class(ReservationTextTableViewCell);
        v55 = NSStringFromClass(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v56));

        v57 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedTermsAndConditionsText"));
        -[UITableViewCell setText:](v19, "setText:", v58);

        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "privacyPolicyURL"));

        if (v61)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("reservations_privacy_policy_title"), CFSTR("localized string not found"), 0));
          objc_msgSend(v59, "addObject:", v63);

        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "termsAndConditionsURL"));

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("reservations_terms_of_use_title"), CFSTR("localized string not found"), 0));
          objc_msgSend(v59, "addObject:", v67);

        }
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));
        -[UITableViewCell setPrimaryButtonText:](v19, "setPrimaryButtonText:", v68);

        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "lastObject"));
        -[UITableViewCell setSecondaryButtonText:](v19, "setSecondaryButtonText:", v69);

        -[UITableViewCell setDelegate:](v19, "setDelegate:", self);
        goto LABEL_45;
      }
LABEL_41:
      v14 = objc_opt_new(UITableViewCell);
LABEL_42:
      v19 = v14;
      goto LABEL_51;
    }
    v118 = (objc_class *)objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
    v119 = NSStringFromClass(v118);
    v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
    v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v120));

    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "localizedStringForKey:value:table:", CFSTR("reservation_from_provider_format_key"), CFSTR("localized string not found"), 0));

    v95 = objc_alloc((Class)NSString);
    v96 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController appName](self, "appName"));
LABEL_44:
    v97 = (void *)v96;
    v98 = objc_msgSend(v95, "initWithFormat:", v59, v96);
    -[UITableViewCell setText:](v19, "setText:", v98);

    v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UITableViewCell setTextColor:](v19, "setTextColor:", v99);

    -[UITableViewCell setHidesHairline:](v19, "setHidesHairline:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[UITableViewCell setFont:](v19, "setFont:", v100);

LABEL_45:
    goto LABEL_51;
  }
  if (objc_msgSend(v7, "row"))
  {
    v22 = (char *)objc_msgSend(v7, "row") - 1;
    v23 = (objc_class *)objc_opt_class(RestaurantReservationsChooseOfferCell);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v25));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
    v27 = (char *)objc_msgSend(v26, "count");

    if (v22 >= v27)
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "localizedStringForKey:value:table:", CFSTR("reservation_no_offer_key"), CFSTR("localized string not found"), 0));
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell mainLabel](v19, "mainLabel"));
      objc_msgSend(v110, "setText:", v109);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("reservation_no_offer_detail_key"), CFSTR("localized string not found"), 0));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subLabel](v19, "subLabel"));
      objc_msgSend(v33, "setText:", v32);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v22));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "offerTitleText"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell mainLabel](v19, "mainLabel"));
      objc_msgSend(v31, "setText:", v30);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "offerDetailText"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subLabel](v19, "subLabel"));
      objc_msgSend(v34, "setText:", v33);

    }
    v107 = objc_opt_new(UIView);
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v107, "setBackgroundColor:", v111);

    v112 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationsChooseOfferCell appearance](RestaurantReservationsChooseOfferCell, "appearance"));
    objc_msgSend(v112, "setSelectedBackgroundView:", v107);

  }
  else
  {
    v101 = (objc_class *)objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
    v102 = NSStringFromClass(v101);
    v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
    v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v103));

    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("reservation_offers_key"), CFSTR("localized string not found"), 0));
    -[UITableViewCell setText:](v19, "setText:", v105);

    v106 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UITableViewCell setTextColor:](v19, "setTextColor:", v106);

    -[UITableViewCell setHidesHairline:](v19, "setHidesHairline:", 1);
    v107 = (UIView *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[UITableViewCell setFont:](v19, "setFont:", v107);
  }

LABEL_51:
  return v19;
}

- (void)configureSpecialRequestTextCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  RestaurantReservationTableViewController *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "detailTextLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("reservation_special_request_key"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController specialRequestText](self, "specialRequestText"));
  v10 = objc_msgSend(v9, "length");
  if (v10)
  {
    v11 = (RestaurantReservationTableViewController *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController specialRequestText](self, "specialRequestText"));
  }
  else
  {
    self = (RestaurantReservationTableViewController *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (RestaurantReservationTableViewController *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController localizedStringForKey:value:table:](self, "localizedStringForKey:value:table:", CFSTR("reservation_special_request_none_key"), CFSTR("localized string not found"), 0));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "detailTextLabel"));
  objc_msgSend(v12, "setText:", v11);

  if (!v10)
  {

    v11 = self;
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v10 = objc_msgSend(v9, "isEditing");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForRowAtIndexPath:", v7));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
      -[RestaurantReservationTableViewController setFormerSelection:](self, "setFormerSelection:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedRows"));
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v42 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
            v21 = objc_msgSend(v20, "section");
            if (v21 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection"))
            {
              v22 = objc_msgSend(v20, "row");
              if (v22 != objc_msgSend(v7, "row"))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
                objc_msgSend(v23, "deselectRowAtIndexPath:animated:", v20, 1);

              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v17);
      }

    }
    v24 = (uint64_t)objc_msgSend(v7, "row");
    if (v24 < 2
      || (v25 = v24 - 1,
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers")),
          v27 = objc_msgSend(v26, "count"),
          v26,
          v25 >= (unint64_t)v27))
    {
      -[RestaurantReservationTableViewController setSelectedOffer:](self, "setSelectedOffer:", 0);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v25));
      -[RestaurantReservationTableViewController setSelectedOffer:](self, "setSelectedOffer:", v29);

    }
  }
  v30 = objc_msgSend(v7, "section");
  if (v30 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection"))objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  v31 = objc_msgSend(v7, "section");
  if (v31 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection"))
  {
    v32 = objc_msgSend(v7, "row");
    if (v32 == (id)-[RestaurantReservationTableViewController reservationContactInfoRow](self, "reservationContactInfoRow")&& -[RestaurantReservationTableViewController shouldDisplayContactCell](self, "shouldDisplayContactCell"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor"));
      objc_msgSend(v33, "captureSelectTimeEditUserInfo");

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController delegate](self, "delegate"));
      objc_msgSend(v34, "userInfoCellSelected");

    }
    v35 = objc_msgSend(v7, "row");
    if (v35 == (id)-[RestaurantReservationTableViewController reservationSpecialRequestRow](self, "reservationSpecialRequestRow"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor"));
      objc_msgSend(v36, "captureSelectTimeAddSpecialRequest");

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController delegate](self, "delegate"));
      objc_msgSend(v37, "specialRequestCellSelected");

    }
  }
  v38 = objc_msgSend(v7, "section");
  if (v38 == (id)-[RestaurantReservationTableViewController headerSection](self, "headerSection")
    && !objc_msgSend(v7, "row"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v39, "deselectRowAtIndexPath:animated:", v7, 1);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController delegate](self, "delegate"));
    objc_msgSend(v40, "headerCellSelected");

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView", a3, a4));
  v6 = objc_msgSend(v5, "isEditing");

  if (v6)
    -[RestaurantReservationTableViewController setFormerSelection:](self, "setFormerSelection:", &stru_1011EB268);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
  v8 = objc_msgSend(v7, "count");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, -[RestaurantReservationTableViewController offersSection](self, "offersSection")));
  objc_msgSend(v10, "selectRowAtIndexPath:animated:scrollPosition:", v9, 1, 0);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection")
    && objc_msgSend(v5, "row"))
  {
    v7 = -[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  int64_t v5;
  double result;

  v5 = -[RestaurantReservationTableViewController headerSection](self, "headerSection", a3);
  result = 35.0;
  if (v5 != a4)
    return 6.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  int64_t v5;
  double result;

  v5 = -[RestaurantReservationTableViewController openAppSection](self, "openAppSection", a3);
  result = 37.0;
  if (v5 != a4)
    return 6.0;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  int64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = -[RestaurantReservationTableViewController transformedIndexForIndexPath:collectionView:](self, "transformedIndexForIndexPath:collectionView:", a4, a3);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = (id)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
    v8 = objc_msgSend(v7, "count");

    if (v6 < v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));
      v11 = objc_msgSend(v9, "indexOfObject:", v10);

      if (v6 == v11)
      {
        -[RestaurantReservationTableViewController deselectBooking](self, "deselectBooking");
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v6));

        if (objc_msgSend(v17, "isBookingAvailable"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor"));
          objc_msgSend(v13, "captureSelectTimeSelected");

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsBookingSession](self, "analyticsBookingSession"));
          objc_msgSend(v14, "setCurrentView:", 4);

          -[RestaurantReservationTableViewController setSelectedBooking:](self, "setSelectedBooking:", v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeSelectionCollectionViewLayout"));
          objc_msgSend(v16, "setDimUnselected:", 1);

          -[RestaurantReservationTableViewController resetForChangedTimeSelection](self, "resetForChangedTimeSelection");
        }

      }
    }
  }
}

- (void)deselectBooking
{
  void *v3;
  void *v4;

  -[RestaurantReservationTableViewController setSelectedBooking:](self, "setSelectedBooking:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeSelectionCollectionViewLayout"));
  objc_msgSend(v4, "setDimUnselected:", 0);

  -[RestaurantReservationTableViewController resetForChangedTimeSelection](self, "resetForChangedTimeSelection");
}

- (void)resetForChangedTimeSelection
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B40A84;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v6, 0);
  -[RestaurantReservationTableViewController configureButton](self, "configureButton");
  -[RestaurantReservationTableViewController rebuildOffers](self, "rebuildOffers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));
  if (v4)
    v5 = -[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection");
  else
    v5 = 0;
  objc_msgSend(v3, "setEditing:animated:", v5, 1);

  -[RestaurantReservationTableViewController updateSelectedOffer](self, "updateSelectedOffer");
}

- (void)updateSelectedOffer
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForVisibleRows"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v7)
      goto LABEL_18;
    v8 = v7;
    v9 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "section");
        if (v12 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection")
          && objc_msgSend(v11, "row"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v11));

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
          v16 = objc_msgSend(v15, "isEditing");

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController formerSelection](self, "formerSelection"));
            v18 = objc_msgSend(v17, "length");

            if ((unint64_t)v18 < 2)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
              -[RestaurantReservationTableViewController setSelectedOffer:](self, "setSelectedOffer:", v26);

              v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 1, -[RestaurantReservationTableViewController offersSection](self, "offersSection")));
              objc_msgSend(v24, "selectRowAtIndexPath:animated:scrollPosition:", v27, 1, 0);

LABEL_14:
            }
            else
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mainLabel"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));
              v21 = v9;
              v22 = v6;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController formerSelection](self, "formerSelection"));
              v28 = objc_msgSend(v20, "isEqualToString:", v23);

              v6 = v22;
              v9 = v21;

              if (v28)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
                objc_msgSend(v24, "selectRowAtIndexPath:animated:scrollPosition:", v11, 1, 0);
                goto LABEL_14;
              }
            }
          }

          continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v8)
      {
LABEL_18:

        return;
      }
    }
  }
}

- (int64_t)transformedIndexForIndexPath:(id)a3 collectionView:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  v5 = a3;
  v6 = a4;
  if ((uint64_t)objc_msgSend(v5, "section") < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    do
      v8 += (uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", v7++);
    while (v7 < (uint64_t)objc_msgSend(v5, "section"));
  }
  v9 = (char *)objc_msgSend(v5, "item") + v8;

  return (int64_t)v9;
}

- (void)reservationTableViewCellDidSelectPrimaryButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privacyPolicyURL"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
  v7 = v6;
  if (v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privacyPolicyURL"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "termsAndConditionsURL"));

    if (!v9)
      return;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "termsAndConditionsURL"));
  }
  v12 = (id)v8;

  if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor"));
    objc_msgSend(v10, "captureSelectTimeLearnMore");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v11, "openURL:options:completionHandler:", v12, &__NSDictionary0__struct, 0);

  }
}

- (void)reservationTableViewCellDidSelectSecondaryButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "termsAndConditionsURL"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor"));
    objc_msgSend(v6, "captureSelectTimeLearnMore");

    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "termsAndConditionsURL"));
    objc_msgSend(v9, "openURL:options:completionHandler:", v8, &__NSDictionary0__struct, 0);

  }
}

- (void)ridesharingAppActionTableViewCellDidPerformAction:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor", a3));
  objc_msgSend(v4, "captureSelectTimePunchOut");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController delegate](self, "delegate"));
  objc_msgSend(v5, "bookingSelectionViewControllerDidSelectOpenInApp:", self);

}

- (void)footerButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor", a3));
  objc_msgSend(v4, "captureSelectTimeReserveTable");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedOffer](self, "selectedOffer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController noOfferOffer](self, "noOfferOffer"));
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v9, "bookingSelectionViewController:didSelectBooking:offer:", self, v5, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedOffer](self, "selectedOffer"));
    objc_msgSend(v9, "bookingSelectionViewController:didSelectBooking:offer:", self, v5, v8);

  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6;
  CGFloat bottom;
  double left;
  CGFloat right;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v6 = a4;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  objc_msgSend(v6, "headerReferenceSize");
  v11 = left - v10;
  if (a5 >= 1)
  {
    objc_msgSend(v6, "minimumInteritemSpacing");
    v11 = v11 + v12;
  }

  v13 = 20.0;
  v14 = v11;
  v15 = bottom;
  v16 = right;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a4 < 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles", a3));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 <= a4)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookingsBySection](self, "availableBookingsBySection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
  v12 = objc_msgSend(v11, "count");

  return (int64_t)v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  UICollectionReusableView *v12;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  v11 = v10;
  if (UICollectionElementKindSectionHeader != v9
    || ((unint64_t)objc_msgSend(v10, "section") & 0x8000000000000000) != 0
    || (v14 = objc_msgSend(v11, "section"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles")),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v14 >= v16))
  {
    v12 = objc_opt_new(UICollectionReusableView);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v11, "section")));

    v19 = +[RestaurantReservationTableViewCell reuseIdentifierForClass:](RestaurantReservationTableViewCell, "reuseIdentifierForClass:", objc_opt_class(ReservationLabelReusableView));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v12 = (UICollectionReusableView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v20, v11));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionReusableView label](v12, "label"));
    objc_msgSend(v21, "setText:", v18);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionReusableView label](v12, "label"));
    objc_msgSend(v23, "setTextColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v24, "layoutMargins");
    -[UICollectionReusableView setLayoutMargins:](v12, "setLayoutMargins:");

    -[UICollectionReusableView setMarginsRequired:](v12, "setMarginsRequired:", (uint64_t)objc_msgSend(v11, "section") > 0);
  }

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  UICollectionViewCell *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (((unint64_t)objc_msgSend(v7, "section") & 0x8000000000000000) != 0
    || (v8 = objc_msgSend(v7, "section"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles")),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8 >= v10))
  {
    v18 = objc_opt_new(UICollectionViewCell);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookingsBySection](self, "availableBookingsBySection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

    if (((unint64_t)objc_msgSend(v7, "row") & 0x8000000000000000) != 0
      || (v15 = objc_msgSend(v7, "row"), v15 >= objc_msgSend(v14, "count")))
    {
      v18 = objc_opt_new(UICollectionViewCell);
    }
    else
    {
      v16 = +[RestaurantReservationTableViewCell reuseIdentifierForClass:](RestaurantReservationTableViewCell, "reuseIdentifierForClass:", objc_opt_class(ReservationAvailabilityCollectionViewCell));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v17, v7));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      -[RestaurantReservationTableViewController configureCell:withBooking:row:](self, "configureCell:withBooking:row:", v18, v19, objc_msgSend(v7, "row"));

    }
  }

  return v18;
}

- (void)configureCell:(id)a3 withBooking:(id)a4 row:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController timeSelectionDateFormatter](self, "timeSelectionDateFormatter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookingDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v9));
  objc_msgSend(v20, "setTitleText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "offers"));
  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_msgSend(v7, "isBookingAvailable");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("reservations_number_of_offers_key"), CFSTR("localized string not found"), 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "offers"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, objc_msgSend(v15, "count")));
      objc_msgSend(v20, "setSubText:", v16);

      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(v20, "setSubText:", 0);
LABEL_6:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController theme](self, "theme"));
  if ((objc_msgSend(v7, "isBookingAvailable") & 1) != 0)
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keyColor"));
  else
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reservationsGrayColor"));
  v19 = (void *)v18;
  objc_msgSend(v20, "setColor:", v18);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)-[RestaurantReservationTableViewController headerSection](self, "headerSection")
    && !objc_msgSend(v7, "row"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    v14 = objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      LOBYTE(self) = objc_msgSend(v13, "shouldBeSelectable");
    else
      LOBYTE(self) = 1;

  }
  else
  {
    v9 = objc_msgSend(v7, "section");
    if (v9 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection")&& !objc_msgSend(v7, "row"))
    {
      LODWORD(self) = !-[RestaurantReservationTableViewController guestLoading](self, "guestLoading");
    }
    else
    {
      v10 = objc_msgSend(v7, "section");
      if (v10 == (id)-[RestaurantReservationTableViewController headerSection](self, "headerSection")
        && !objc_msgSend(v7, "row")
        || (v11 = objc_msgSend(v7, "section"),
            v11 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection"))
        && -[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection")
        && objc_msgSend(v7, "row"))
      {
        LOBYTE(self) = 1;
      }
      else
      {
        v12 = objc_msgSend(v7, "section");
        LOBYTE(self) = v12 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection");
      }
    }
  }

  return (char)self;
}

- (void)_configureReservationDetails
{
  -[RestaurantReservationTableViewController _configureReservationDetailsDateAndPartySize](self, "_configureReservationDetailsDateAndPartySize");
  -[RestaurantReservationTableViewController _configureReservationDetailsLoadingIndicator](self, "_configureReservationDetailsLoadingIndicator");
  -[RestaurantReservationTableViewController _configureReservationDetailsError](self, "_configureReservationDetailsError");
  -[RestaurantReservationTableViewController _configureReservationDetailsTimeSelction](self, "_configureReservationDetailsTimeSelction");
}

- (void)_configureReservationDetailsDateAndPartySize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController date](self, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController descriptionTextForDate:partySize:](self, "descriptionTextForDate:partySize:", v3, -[RestaurantReservationTableViewController partySize](self, "partySize")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v5, "setDateAndPartySizeText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("reservations_change_key"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v8, "setDateAndPartySizeButtonText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v9, "addDateAndPartySizeButtonTouchUpInsideTarget:action:", self, "changeDateButtonTapped:");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
  if (objc_msgSend(v10, "count"))
    v11 = 0;
  else
    v11 = -[RestaurantReservationTableViewController bookingsLoading](self, "bookingsLoading") ^ 1;
  objc_msgSend(v12, "setHideDateAndPartySize:animated:", v11, 1);

}

- (void)_configureReservationDetailsLoadingIndicator
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v3, "setLoading:animated:", -[RestaurantReservationTableViewController bookingsLoading](self, "bookingsLoading"), 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("reservations_loading_format_key"), CFSTR("localized string not found"), 0));

  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantName](self, "restaurantName"));
  v7 = objc_msgSend(v5, "initWithFormat:", v9, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v8, "setLoadingText:", v7);

}

- (void)_configureReservationDetailsError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController date](self, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController noTablesAvailableTextForDate:](self, "noTablesAvailableTextForDate:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v5, "setErrorText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("reservations_no_tables_action_key"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v8, "setErrorButtonText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
  if (objc_msgSend(v10, "count"))
    v11 = 0;
  else
    v11 = -[RestaurantReservationTableViewController bookingsLoading](self, "bookingsLoading") ^ 1;
  objc_msgSend(v9, "setDisplayError:animated:", v11, 1);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  objc_msgSend(v12, "addErrorButtonTouchUpInsideTarget:action:", self, "changeDateButtonTapped:");

}

- (void)_configureReservationDetailsTimeSelction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeSelectionCollectionView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeSelectionCollectionViewLayout"));

  objc_msgSend(v9, "setDataSource:", self);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v9, "setAllowsSelection:", 1);
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v9, "setLayoutMargins:", 20.0, 0.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
  v7 = objc_msgSend(v6, "count") != 0;

  -[RestaurantReservationTableViewController adjustCollectionViewHeightForOffers:animated:](self, "adjustCollectionViewHeightForOffers:animated:", v7, -[RestaurantReservationTableViewController viewHasAppeared](self, "viewHasAppeared"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController dimmableIndexPaths](self, "dimmableIndexPaths"));
  objc_msgSend(v5, "setDimmableIndexPaths:", v8);

  if (-[RestaurantReservationTableViewController bookingsLoading](self, "bookingsLoading"))
  {
    objc_msgSend(v5, "setDimUnselected:", 0);
    objc_msgSend(v5, "invalidateLayout");
  }

}

- (id)dimmableIndexPaths
{
  NSMutableSet *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  RestaurantReservationTableViewController *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = objc_opt_new(NSMutableSet);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles"));
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v4 = 0;
    v18 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v5);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookingsBySection](v19, "availableBookingsBySection"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v22;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v8);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13), "isBookingAvailable"))
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)v13 + v11, v4));
                -[NSMutableSet addObject:](v3, "addObject:", v14);

              }
              v13 = (char *)v13 + 1;
            }
            while (v10 != v13);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            v11 += (uint64_t)v13;
          }
          while (v10);
        }

        ++v4;
        v5 = (char *)v5 + 1;
      }
      while (v5 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v3));
  return v15;
}

- (void)adjustCollectionViewHeightForOffers:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v6, "beginUpdates");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
    objc_msgSend(v7, "setDisplayOffers:", v4);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v8, "endUpdates");
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
    objc_msgSend(v8, "setDisplayOffers:", v4);
  }

}

- (id)descriptionTextForDate:(id)a3 partySize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("reservation_party_size_date_format_key"), CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantTimeZone](self, "restaurantTimeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_dayDescriptionStringShortDescription:timeZone:bookingDate:](NSDate, "_maps_dayDescriptionStringShortDescription:timeZone:bookingDate:", 1, v9, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, a4));
  return v11;
}

- (id)noTablesAvailableTextForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("reservations_no_tables_key"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantTimeZone](self, "restaurantTimeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_dayDescriptionStringShortDescription:timeZone:bookingDate:](NSDate, "_maps_dayDescriptionStringShortDescription:timeZone:bookingDate:", 1, v7, v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8));
  return v9;
}

- (BOOL)useAvailableHeight
{
  return 1;
}

- (BOOL)showRemoteView
{
  return 0;
}

- (ContactRequirements)inferredContactRequirements
{
  RestaurantReservationTableViewController *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](self, "selectedBooking"));

  if (v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](v2, "selectedBooking"));
    LOBYTE(v4) = objc_msgSend((id)v6, "requiresPhoneNumber");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](v2, "selectedBooking"));
    LOBYTE(v6) = objc_msgSend(v5, "requiresName");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](v2, "selectedBooking"));
    LOBYTE(v2) = objc_msgSend(v7, "requiresEmailAddress");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](v2, "availableBookings", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      LODWORD(v6) = 0;
      LODWORD(v2) = 0;
      v4 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v4 |= objc_msgSend(v12, "requiresPhoneNumber");
          LODWORD(v6) = v6 | objc_msgSend(v12, "requiresName");
          LODWORD(v2) = v2 | objc_msgSend(v12, "requiresEmailAddress");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    else
    {
      LOBYTE(v6) = 0;
      LOBYTE(v2) = 0;
      LOBYTE(v4) = 0;
    }
  }

  return -[ContactRequirements initWithNameRequired:phoneNumberRequired:emailAddressRequired:]([ContactRequirements alloc], "initWithNameRequired:phoneNumberRequired:emailAddressRequired:", v6 & 1, v4 & 1, v2 & 1);
}

- (id)timeSuffixForDate:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  if (-[RestaurantReservationTableViewController shouldDisplaySuffix](self, "shouldDisplaySuffix"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController timeSuffixDateFormatter](self, "timeSuffixDateFormatter"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));

  }
  else
  {
    v6 = &stru_1011EB268;
  }

  return v6;
}

- (BOOL)shouldDisplaySuffix
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v2));

  LOBYTE(v2) = objc_msgSend(v3, "rangeOfString:", CFSTR("a")) != (id)0x7FFFFFFFFFFFFFFFLL;
  return (char)v2;
}

- (NSDateFormatter)timeSelectionDateFormatter
{
  NSDateFormatter *timeSelectionDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;

  timeSelectionDateFormatter = self->_timeSelectionDateFormatter;
  if (!timeSelectionDateFormatter)
  {
    v4 = objc_opt_new(NSDateFormatter);
    v5 = self->_timeSelectionDateFormatter;
    self->_timeSelectionDateFormatter = v4;

    -[NSDateFormatter setDateFormat:](self->_timeSelectionDateFormatter, "setDateFormat:", 0);
    -[NSDateFormatter setDateStyle:](self->_timeSelectionDateFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](self->_timeSelectionDateFormatter, "setTimeStyle:", 1);
    -[NSDateFormatter setAMSymbol:](self->_timeSelectionDateFormatter, "setAMSymbol:", &stru_1011EB268);
    -[NSDateFormatter setPMSymbol:](self->_timeSelectionDateFormatter, "setPMSymbol:", &stru_1011EB268);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantTimeZone](self, "restaurantTimeZone"));
    -[NSDateFormatter setTimeZone:](self->_timeSelectionDateFormatter, "setTimeZone:", v6);

    timeSelectionDateFormatter = self->_timeSelectionDateFormatter;
  }
  return timeSelectionDateFormatter;
}

- (NSDateFormatter)timeSuffixDateFormatter
{
  NSDateFormatter *timeSuffixDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;

  timeSuffixDateFormatter = self->_timeSuffixDateFormatter;
  if (!timeSuffixDateFormatter)
  {
    v4 = objc_opt_new(NSDateFormatter);
    v5 = self->_timeSuffixDateFormatter;
    self->_timeSuffixDateFormatter = v4;

    -[NSDateFormatter setDateFormat:](self->_timeSuffixDateFormatter, "setDateFormat:", CFSTR("a"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantTimeZone](self, "restaurantTimeZone"));
    -[NSDateFormatter setTimeZone:](self->_timeSuffixDateFormatter, "setTimeZone:", v6);

    timeSuffixDateFormatter = self->_timeSuffixDateFormatter;
  }
  return timeSuffixDateFormatter;
}

- (void)setAvailableBookings:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((-[NSArray isEqual:](self->_availableBookings, "isEqual:") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController sectionTitles](self, "sectionTitles"));
    v6 = objc_msgSend(v5, "count");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v6));
    objc_storeStrong((id *)&self->_availableBookings, a3);
    -[RestaurantReservationTableViewController rebuildCollectionViewSections](self, "rebuildCollectionViewSections");
    -[RestaurantReservationTableViewController rebuildOffers](self, "rebuildOffers");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeSelectionCollectionView"));
      objc_msgSend(v11, "deleteSections:", v7);

    }
  }

}

- (void)setBookingsLoading:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (((!self->_bookingsLoading ^ a3) & 1) == 0)
  {
    v3 = a3;
    v5 = !a3;
    if (a3)
    {
      -[RestaurantReservationTableViewController setSelectedOffer:](self, "setSelectedOffer:", 0);
      -[RestaurantReservationTableViewController setSelectedBooking:](self, "setSelectedBooking:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      objc_msgSend(v6, "setEditing:animated:", 0, 1);

      -[RestaurantReservationTableViewController rebuildOffers](self, "rebuildOffers");
    }
    self->_bookingsLoading = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
    -[RestaurantReservationTableViewController shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:](self, "shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:", v7, v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
    -[RestaurantReservationTableViewController shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:](self, "shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:", v8, v3);

    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[RestaurantReservationTableViewController reservationContactInfoRow](self, "reservationContactInfoRow"), -[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection")));
    -[RestaurantReservationTableViewController handleCellAppearanceForIndexPath:willDisplay:didDisplay:](self, "handleCellAppearanceForIndexPath:willDisplay:didDisplay:");
    -[RestaurantReservationTableViewController _configureReservationDetails](self, "_configureReservationDetails");
    if (!v3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
      objc_msgSend(v9, "layoutIfNeeded");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeSelectionCollectionView"));

      objc_msgSend(v11, "reloadData");
    }

  }
}

- (void)setBookingPending:(BOOL)a3
{
  if (((!self->_bookingPending ^ a3) & 1) == 0)
  {
    self->_bookingPending = a3;
    -[RestaurantReservationTableViewController configureButton](self, "configureButton");
  }
}

- (void)setGuest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_guest) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_guest, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[RestaurantReservationTableViewController reservationContactInfoRow](self, "reservationContactInfoRow"), -[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v9 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 5);

    -[RestaurantReservationTableViewController configureButton](self, "configureButton");
  }

}

- (void)setGuestDisplayPreferences:(id)a3
{
  void *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  INRestaurantGuestDisplayPreferences *v7;
  INRestaurantGuestDisplayPreferences *guestDisplayPreferences;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqual:", self->_guestDisplayPreferences) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
    v5 = -[RestaurantReservationTableViewController shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:](self, "shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:", v4, -[RestaurantReservationTableViewController bookingsLoading](self, "bookingsLoading"));

    v6 = -[RestaurantReservationTableViewController shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:](self, "shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:", v10, -[RestaurantReservationTableViewController bookingsLoading](self, "bookingsLoading"));
    v7 = (INRestaurantGuestDisplayPreferences *)objc_msgSend(v10, "copy");
    guestDisplayPreferences = self->_guestDisplayPreferences;
    self->_guestDisplayPreferences = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[RestaurantReservationTableViewController reservationContactInfoRow](self, "reservationContactInfoRow"), -[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection")));
    -[RestaurantReservationTableViewController handleCellAppearanceForIndexPath:willDisplay:didDisplay:](self, "handleCellAppearanceForIndexPath:willDisplay:didDisplay:", v9, v6, v5);
    -[RestaurantReservationTableViewController configureButton](self, "configureButton");

  }
}

- (void)setSpecialRequestText:(id)a3
{
  NSString *v4;
  NSString *specialRequestText;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToString:", self->_specialRequestText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    specialRequestText = self->_specialRequestText;
    self->_specialRequestText = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[RestaurantReservationTableViewController reservationSpecialRequestRow](self, "reservationSpecialRequestRow"), -[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

    -[RestaurantReservationTableViewController configureSpecialRequestTextCell:](self, "configureSpecialRequestTextCell:", v8);
  }

}

- (void)setRestaurantDescriptionText:(id)a3 keepExisting:(BOOL)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *restaurantDescriptionText;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if ((!a4 || objc_msgSend(v6, "length") || !-[NSString length](self->_restaurantDescriptionText, "length"))
    && (objc_msgSend(v7, "isEqual:", self->_restaurantDescriptionText) & 1) == 0)
  {
    v8 = (NSString *)objc_msgSend(v7, "copy");
    restaurantDescriptionText = self->_restaurantDescriptionText;
    self->_restaurantDescriptionText = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, -[RestaurantReservationTableViewController headerSection](self, "headerSection")));
    v13 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v10, "reloadRowsAtIndexPaths:withRowAnimation:", v12, 0);

  }
}

- (void)setRestaurantDescriptionText:(id)a3
{
  -[RestaurantReservationTableViewController setRestaurantDescriptionText:keepExisting:](self, "setRestaurantDescriptionText:keepExisting:", a3, 0);
}

- (void)setDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToDate:", self->_date) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailsIndexPath](self, "reservationDetailsIndexPath"));
    v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 0);

  }
}

- (void)setPartySize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_partySize != a3)
  {
    self->_partySize = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailsIndexPath](self, "reservationDetailsIndexPath"));
    v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 0);

  }
}

- (id)reservationDetailsIndexPath
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 1, -[RestaurantReservationTableViewController headerSection](self, "headerSection"));
}

- (void)setTermsAndConditions:(id)a3
{
  _BOOL8 v4;
  INTermsAndConditions *v5;
  INTermsAndConditions *termsAndConditions;
  id v7;

  v7 = a3;
  if ((-[INTermsAndConditions isEqual:](self->_termsAndConditions, "isEqual:") & 1) == 0)
  {
    v4 = -[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions");
    v5 = (INTermsAndConditions *)objc_msgSend(v7, "copy");
    termsAndConditions = self->_termsAndConditions;
    self->_termsAndConditions = v5;

    -[RestaurantReservationTableViewController handleSectionAppearanceForSection:willDisplay:didDisplay:](self, "handleSectionAppearanceForSection:willDisplay:didDisplay:", -[RestaurantReservationTableViewController termsAndConditionsSection](self, "termsAndConditionsSection"), -[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions"), v4);
  }

}

- (void)setRestaurantAdvisementText:(id)a3
{
  _BOOL8 v4;
  NSString *v5;
  NSString *restaurantAdvisementText;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_restaurantAdvisementText) & 1) == 0)
  {
    v4 = -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection");
    v5 = (NSString *)objc_msgSend(v7, "copy");
    restaurantAdvisementText = self->_restaurantAdvisementText;
    self->_restaurantAdvisementText = v5;

    -[RestaurantReservationTableViewController handleSectionAppearanceForSection:willDisplay:didDisplay:](self, "handleSectionAppearanceForSection:willDisplay:didDisplay:", -[RestaurantReservationTableViewController advisementSection](self, "advisementSection"), -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection"), v4);
  }

}

- (void)handleCellAppearanceForIndexPath:(id)a3 willDisplay:(BOOL)a4 didDisplay:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v6 || v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v9, "beginUpdates");

    v10 = !v6;
    v11 = !v5;
    if (v6 && (v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      v21 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 5);

    }
    if (((v11 | v6) & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      v20 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      objc_msgSend(v14, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 0);

    }
    if (((v10 | v5) & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      v19 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      objc_msgSend(v16, "insertRowsAtIndexPaths:withRowAnimation:", v17, 3);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v18, "endUpdates");

  }
}

- (void)handleSectionAppearanceForSection:(int64_t)a3 willDisplay:(BOOL)a4 didDisplay:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v6 = a4;
  if (a4 || a5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v9, "beginUpdates");

    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a3));
    v10 = !v6;
    v11 = !v5;
    if (v6 && (v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      objc_msgSend(v12, "reloadSections:withRowAnimation:", v16, 5);

    }
    if (((v11 | v6) & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      objc_msgSend(v13, "deleteSections:withRowAnimation:", v16, 0);

    }
    if (((v10 | v5) & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
      objc_msgSend(v14, "insertSections:withRowAnimation:", v16, 3);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](self, "tableView"));
    objc_msgSend(v15, "endUpdates");

  }
}

- (void)rebuildOffers
{
  RestaurantReservationTableViewController *v2;
  void *v3;
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  RestaurantReservationTableViewController *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v2 = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_opt_new(NSMutableSet);
  -[RestaurantReservationTableViewController setSelectedOffer:](v2, "setSelectedOffer:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](v2, "selectedBooking"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](v2, "selectedBooking"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offers"));
    objc_msgSend(v3, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController selectedBooking](v2, "selectedBooking"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "offers"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController noOfferOffer](v2, "noOfferOffer"));
      objc_msgSend(v3, "addObject:", v11);

    }
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = v2;
    obj = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](v2, "availableBookings"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      v28 = *(_QWORD *)v36;
      do
      {
        v15 = 0;
        v29 = v13;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v15);
          if (objc_msgSend(v16, "isBookingAvailable"))
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "offers"));
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v32 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "offerTitleText"));
                  v24 = -[NSMutableSet containsObject:](v4, "containsObject:", v23);

                  if ((v24 & 1) == 0)
                  {
                    objc_msgSend(v3, "addObject:", v22);
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "offerTitleText"));
                    -[NSMutableSet addObject:](v4, "addObject:", v25);

                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v19);
            }

            v14 = v28;
            v13 = v29;
          }
          v15 = (char *)v15 + 1;
        }
        while (v15 != v13);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }

    v2 = v26;
  }
  -[RestaurantReservationTableViewController rebuildOffersNewOffers:oldOffers:](v2, "rebuildOffersNewOffers:oldOffers:", v3, v27);

}

- (void)rebuildOffersNewOffers:(id)a3 oldOffers:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  RestaurantReservationTableViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  void *v39;
  NSMutableArray *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  id v49;
  id v50;
  NSMutableArray *v51;
  RestaurantReservationTableViewController *v52;
  _QWORD v53[5];
  NSMutableArray *v54;
  _QWORD v55[4];
  NSMutableArray *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "mutableCopy");
  v52 = self;
  -[RestaurantReservationTableViewController setOffers:](self, "setOffers:", v8);

  if (objc_msgSend(v6, "count"))
    v9 = 0;
  else
    v9 = objc_msgSend(v7, "count") != 0;
  if (objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
  {
    v10 = v52;
    -[RestaurantReservationTableViewController updateHeightCacheForOffersSectionInsertion](v52, "updateHeightCacheForOffersSectionInsertion");
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
    objc_msgSend(v45, "beginUpdates");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", -[RestaurantReservationTableViewController offersSection](v52, "offersSection")));
    objc_msgSend(v12, "insertSections:withRowAnimation:", v13, 3);
    goto LABEL_33;
  }
  if (v9)
  {
    v10 = v52;
    -[RestaurantReservationTableViewController updateHeightCacheForOffersSectionDeletion](v52, "updateHeightCacheForOffersSectionDeletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
    objc_msgSend(v11, "beginUpdates");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", -[RestaurantReservationTableViewController offersSection](v52, "offersSection")));
    objc_msgSend(v12, "deleteSections:withRowAnimation:", v13, 0);
LABEL_33:

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v10, "tableView"));
    objc_msgSend(v46, "endUpdates");

    goto LABEL_34;
  }
  v14 = objc_opt_new(NSMutableArray);
  v15 = objc_opt_new(NSMutableArray);
  v48 = objc_opt_new(NSMutableArray);
  v50 = v6;
  v51 = objc_opt_new(NSMutableArray);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v66;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v66 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v20), "offerTitleText"));
        -[NSMutableArray addObject:](v14, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v18);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v62;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v62 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v26), "offerTitleText"));
        -[NSMutableArray addObject:](v15, "addObject:", v27);

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v24);
  }
  v47 = v16;
  v49 = v7;

  v28 = (char *)objc_msgSend(v22, "count");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reverseObjectEnumerator"));
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v58;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v58 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v33), "offerTitleText"));
        v35 = -[NSMutableArray containsObject:](v14, "containsObject:", v34);

        if ((v35 & 1) == 0)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v28, -[RestaurantReservationTableViewController offersSection](v52, "offersSection")));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](v52, "heightCache"));
          objc_msgSend(v37, "removeObjectForKey:", v36);

          -[NSMutableArray addObject:](v51, "addObject:", v36);
        }
        v33 = (char *)v33 + 1;
        --v28;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v31);
  }

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100B43C30;
  v55[3] = &unk_1011E3D10;
  v56 = v15;
  v38 = v15;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "indexesOfObjectsPassingTest:", v55));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100B43C74;
  v53[3] = &unk_1011E3D38;
  v53[4] = v52;
  v54 = v48;
  v40 = v48;
  objc_msgSend(v39, "enumerateIndexesUsingBlock:", v53);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
  objc_msgSend(v41, "beginUpdates");

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
  objc_msgSend(v42, "insertRowsAtIndexPaths:withRowAnimation:", v40, 3);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
  objc_msgSend(v43, "deleteRowsAtIndexPaths:withRowAnimation:", v51, 0);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController tableView](v52, "tableView"));
  objc_msgSend(v44, "endUpdates");

  v7 = v49;
  v6 = v50;
LABEL_34:

}

- (void)updateHeightCacheForOffersSectionInsertion
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "section", (_QWORD)v25);
        if (v11 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v10, "row"), (char *)objc_msgSend(v10, "section") + 1));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offersRowHeight](self, "offersRowHeight"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = 0;
      do
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v19, -[RestaurantReservationTableViewController offersSection](self, "offersSection", (_QWORD)v25)));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offersRowHeight](self, "offersRowHeight"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v20);

        ++v19;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
        v24 = objc_msgSend(v23, "count");

      }
      while (v19 < (unint64_t)v24);
    }
  }

}

- (void)updateHeightCacheForOffersSectionDeletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v14 = objc_msgSend(v13, "section");
        if (v14 == (id)-[RestaurantReservationTableViewController offersSection](self, "offersSection"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
          objc_msgSend(v15, "removeObjectForKey:", v13);
        }
        else
        {
          v16 = (char *)objc_msgSend(v13, "section");
          if (v16 != (char *)-[RestaurantReservationTableViewController offersSection](self, "offersSection") + 1)
            continue;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v13, "row"), (char *)objc_msgSend(v13, "row") - 1));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v15);

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
          objc_msgSend(v19, "removeObjectForKey:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v26, (_QWORD)v29));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController heightCache](self, "heightCache"));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

}

- (id)noOfferOffer
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init((Class)INRestaurantOffer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("reservation_no_offer_key"), CFSTR("localized string not found"), 0));
  objc_msgSend(v2, "setOfferTitleText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("reservation_no_offer_detail_key"), CFSTR("localized string not found"), 0));
  objc_msgSend(v2, "setOfferDetailText:", v6);

  objc_msgSend(v2, "setOfferIdentifier:", &stru_1011EB268);
  return v2;
}

- (void)changeDateButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController analyticsCaptor](self, "analyticsCaptor", a3));
  objc_msgSend(v4, "captureSelectTimeEditBooking");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController delegate](self, "delegate"));
  objc_msgSend(v5, "bookingSelectionViewControllerDidSelectDateRefinement:", 0);

}

- (void)rebuildCollectionViewSections
{
  NSMutableDictionary *v3;
  NSMutableArray *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  id v26;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("bookingDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController availableBookings](self, "availableBookings"));
  v20 = v5;
  v26 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingDescriptors:", v7));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bookingDate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController timeSuffixForDate:](self, "timeSuffixForDate:", v15));

        v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v16));
        if (!v17)
        {
          v17 = objc_opt_new(NSMutableArray);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, v16);
          -[NSMutableArray addObject:](v4, "addObject:", v16);
        }
        -[NSMutableArray addObject:](v17, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v3));
  -[RestaurantReservationTableViewController setAvailableBookingsBySection:](self, "setAvailableBookingsBySection:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
  -[RestaurantReservationTableViewController setSectionTitles:](self, "setSectionTitles:", v19);

}

- (int64_t)headerSection
{
  return 0;
}

- (int64_t)advisementSection
{
  return -[RestaurantReservationTableViewController headerSection](self, "headerSection") + 1;
}

- (int64_t)offersSection
{
  if (-[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection"))
  {
    return -[RestaurantReservationTableViewController advisementSection](self, "advisementSection") + 1;
  }
  else
  {
    return 1;
  }
}

- (int64_t)reservationDetailsSection
{
  int64_t v3;

  if (-[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection"))
  {
    v3 = -[RestaurantReservationTableViewController offersSection](self, "offersSection");
  }
  else if (-[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection"))
  {
    v3 = -[RestaurantReservationTableViewController advisementSection](self, "advisementSection");
  }
  else
  {
    v3 = -[RestaurantReservationTableViewController headerSection](self, "headerSection");
  }
  return v3 + 1;
}

- (int64_t)termsAndConditionsSection
{
  return -[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection") + 1;
}

- (int64_t)openAppSection
{
  int64_t v3;

  if (-[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions"))
  {
    v3 = -[RestaurantReservationTableViewController termsAndConditionsSection](self, "termsAndConditionsSection");
  }
  else
  {
    v3 = -[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection");
  }
  return v3 + 1;
}

- (int64_t)numberOfRowsInOffersSection
{
  void *v3;
  char *v4;

  if (!-[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
  v4 = (char *)objc_msgSend(v3, "count") + 1;

  return (int64_t)v4;
}

- (int64_t)numberOfRowsInDetailsSection
{
  if (-[RestaurantReservationTableViewController shouldDisplayContactCell](self, "shouldDisplayContactCell"))
    return 2;
  else
    return 1;
}

- (int64_t)reservationContactInfoRow
{
  return 0;
}

- (int64_t)reservationSpecialRequestRow
{
  return -[RestaurantReservationTableViewController shouldDisplayContactCell](self, "shouldDisplayContactCell");
}

- (int64_t)openAppRow
{
  if (-[RestaurantReservationTableViewController shouldDisplayContactCell](self, "shouldDisplayContactCell"))
    return 2;
  else
    return 1;
}

- (int64_t)numberOfOptionalSections
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  LODWORD(v3) = -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection");
  v4 = -[RestaurantReservationTableViewController shouldDisplayOffersSection](self, "shouldDisplayOffersSection");
  v5 = 1;
  if ((_DWORD)v3)
    v5 = 2;
  if (v4)
    v3 = v5;
  else
    v3 = v3;
  return v3
       + -[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions");
}

- (int64_t)numberOfNonOptionalSections
{
  return 3;
}

- (BOOL)shouldDisplayAdvisementSection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController restaurantAdvisementText](self, "restaurantAdvisementText"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)shouldDisplayOffersSection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController offers](self, "offers"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)shouldDisplayTermsAndConditions
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController termsAndConditions](self, "termsAndConditions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedTermsAndConditionsText"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (BOOL)shouldDisplayContactCell
{
  RestaurantReservationTableViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  LOBYTE(v2) = -[RestaurantReservationTableViewController shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:](v2, "shouldDisplayContactCellForGuestDisplayPreferences:bookingsLoading:", v3, -[RestaurantReservationTableViewController bookingsLoading](v2, "bookingsLoading"));

  return (char)v2;
}

- (BOOL)shouldDisplayContactCellForGuestDisplayPreferences:(id)a3 bookingsLoading:(BOOL)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = 0;
  }
  else if (!v5
         || (objc_msgSend(v5, "nameFieldShouldBeDisplayed") & 1) != 0
         || (objc_msgSend(v6, "phoneNumberFieldShouldBeDisplayed") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v6, "emailAddressFieldShouldBeDisplayed");
  }

  return v7;
}

- (BOOL)requirements:(id)a3 satisfiableWithDisplayPreferences:(id)a4 guest:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "nameRequired") && !objc_msgSend(v8, "nameFieldShouldBeDisplayed"))
    goto LABEL_23;
  if (objc_msgSend(v7, "nameRequired"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nameComponents"));
    if (v10 || (objc_msgSend(v8, "nameFieldShouldBeDisplayed") & 1) == 0)
    {

    }
    else if (!objc_msgSend(v8, "nameEditable"))
    {
LABEL_23:
      v13 = 0;
      goto LABEL_26;
    }
  }
  if (objc_msgSend(v7, "phoneNumberRequired")
    && !objc_msgSend(v8, "phoneNumberFieldShouldBeDisplayed"))
  {
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "phoneNumberRequired"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumber"));
    if (v11 || (objc_msgSend(v8, "phoneNumberFieldShouldBeDisplayed") & 1) == 0)
    {

    }
    else if (!objc_msgSend(v8, "phoneNumberEditable"))
    {
      goto LABEL_23;
    }
  }
  if (objc_msgSend(v7, "emailAddressRequired")
    && !objc_msgSend(v8, "emailAddressFieldShouldBeDisplayed"))
  {
    goto LABEL_23;
  }
  if (!objc_msgSend(v7, "emailAddressRequired"))
  {
LABEL_25:
    v13 = 1;
    goto LABEL_26;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddress"));
  if (v12 || (objc_msgSend(v8, "emailAddressFieldShouldBeDisplayed") & 1) == 0)
  {

    goto LABEL_25;
  }
  v13 = objc_msgSend(v8, "emailAddressEditable");
LABEL_26:

  return v13;
}

- (BOOL)contactRequirementsSatisfiable
{
  RestaurantReservationTableViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController inferredContactRequirements](self, "inferredContactRequirements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](v2, "guestDisplayPreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](v2, "guest"));
  LOBYTE(v2) = -[RestaurantReservationTableViewController requirements:satisfiableWithDisplayPreferences:guest:](v2, "requirements:satisfiableWithDisplayPreferences:guest:", v3, v4, v5);

  return (char)v2;
}

- (id)contactDisplayStringSatisfied:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  int v18;
  char v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  __CFString *v36;
  void *v38;
  void *v39;
  unsigned int v40;
  __CFString *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  BOOL *v51;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController inferredContactRequirements](self, "inferredContactRequirements"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nameComponents"));
  v51 = a3;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nameComponents"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v9, 0, 0));

  }
  else
  {
    v10 = &stru_1011EB268;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "phoneNumber"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest"));
  v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "emailAddress"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  v15 = objc_msgSend(v14, "nameFieldFirstNameOptional");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  v17 = (uint64_t)objc_msgSend(v16, "nameFieldLastNameOptional");

  if (objc_msgSend(v5, "nameRequired"))
    v18 = v17 & ~v15;
  else
    v18 = v17;
  v19 = objc_msgSend(v5, "nameRequired") ^ 1 | v15;
  if ((v19 & 1) != 0)
  {
    if (((objc_msgSend(v5, "nameRequired") ^ 1 | v18) & 1) != 0)
    {
      v20 = 0;
      v21 = (void *)v50;
      goto LABEL_18;
    }
LABEL_16:
    v24 = v5;
    v25 = v10;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest", v47, v49));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "nameComponents"));
    v28 = v12;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "familyName"));
    v20 = objc_msgSend(v29, "length") == 0;

    v12 = v28;
    v10 = v25;
    v5 = v24;
    v21 = (void *)v50;
    v22 = v48;
    if ((v19 & 1) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guest](self, "guest"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nameComponents"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "givenName"));
  v49 = v23;
  if (objc_msgSend((id)v17, "length"))
  {
    if (((objc_msgSend(v5, "nameRequired") ^ 1 | v18) & 1) == 0)
    {
      v47 = v22;
      goto LABEL_16;
    }
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  v21 = (void *)v50;
LABEL_17:

LABEL_18:
  if (objc_msgSend(v5, "phoneNumberRequired"))
    v30 = objc_msgSend(v12, "length") == 0;
  else
    v30 = 0;
  if (!objc_msgSend(v5, "emailAddressRequired"))
  {
    v31 = 0;
    if (!v20)
      goto LABEL_23;
LABEL_29:
    *v51 = 0;
    if (!v30 && !v31)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = v33;
      v35 = CFSTR("reservation_name_required_key");
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  v31 = objc_msgSend(v21, "length") == 0;
  if (v20)
    goto LABEL_29;
LABEL_23:
  *v51 = !v30 && !v31;
  if (v30 && !v31)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = v33;
    v35 = CFSTR("reservation_phone_required_key");
    goto LABEL_34;
  }
  if (!v30 && v31)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = v33;
    v35 = CFSTR("reservation_email_required_key");
    goto LABEL_34;
  }
  if (!v30 && !v31)
  {
    if (objc_msgSend(v5, "nameRequired"))
    {
      v32 = v10;
LABEL_40:
      v36 = v32;
      goto LABEL_35;
    }
    if (objc_msgSend(v5, "emailAddressRequired"))
    {
      v32 = v21;
      goto LABEL_40;
    }
    if (objc_msgSend(v5, "phoneNumberRequired"))
    {
LABEL_39:
      v32 = v12;
      goto LABEL_40;
    }
    v38 = v12;
    if (-[__CFString length](v10, "length")
      && (v39 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences")), v40 = objc_msgSend(v39, "nameFieldShouldBeDisplayed"), v39, v40))
    {
      v41 = v10;
    }
    else
    {
      if (objc_msgSend(v38, "length"))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
        v43 = objc_msgSend(v42, "phoneNumberFieldShouldBeDisplayed");

        if (v43)
        {
          v12 = v38;
          goto LABEL_39;
        }
      }
      if (!objc_msgSend(v21, "length")
        || (v44 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController guestDisplayPreferences](self, "guestDisplayPreferences")), v45 = objc_msgSend(v44, "emailAddressFieldShouldBeDisplayed"), v44, !v45))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("reservation_none_key"), CFSTR("localized string not found"), 0));

        goto LABEL_52;
      }
      v41 = v21;
    }
    v36 = v41;
LABEL_52:
    v12 = v38;
    goto LABEL_35;
  }
LABEL_30:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = v33;
  v35 = CFSTR("reservation_multiple_required_key");
LABEL_34:
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v35, CFSTR("localized string not found"), 0));

LABEL_35:
  return v36;
}

- (id)contactDisplayColorSatisfied:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  return v3;
}

- (BOOL)useExtensionFlowHeader
{
  return 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewController reservationDetailCell](self, "reservationDetailCell"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeSelectionCollectionView"));

  if (v9 == v7)
  {
    -[RestaurantReservationAnalyticsBookingSession setSwipedAvailableTimes:](self->_analyticsBookingSession, "setSwipedAvailableTimes:", 1);
    if (x <= 0.0)
      v10 = 12;
    else
      v10 = 13;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", v10, 633, 0);

  }
}

- (INRestaurantReservationBooking)selectedBooking
{
  return self->_selectedBooking;
}

- (void)setSelectedBooking:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBooking, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)partySize
{
  return self->_partySize;
}

- (RestaurantReservationTableViewControllerDelegate)delegate
{
  return (RestaurantReservationTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)availableBookings
{
  return self->_availableBookings;
}

- (NSString)restaurantName
{
  return self->_restaurantName;
}

- (void)setRestaurantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSTimeZone)restaurantTimeZone
{
  return self->_restaurantTimeZone;
}

- (void)setRestaurantTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_restaurantTimeZone, a3);
}

- (NSString)restaurantDescriptionText
{
  return self->_restaurantDescriptionText;
}

- (NSString)restaurantAdvisementText
{
  return self->_restaurantAdvisementText;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences
{
  return self->_guestDisplayPreferences;
}

- (INTermsAndConditions)termsAndConditions
{
  return self->_termsAndConditions;
}

- (NSString)specialRequestText
{
  return self->_specialRequestText;
}

- (BOOL)useTruncatedAdvisement
{
  return self->_useTruncatedAdvisement;
}

- (void)setUseTruncatedAdvisement:(BOOL)a3
{
  self->_useTruncatedAdvisement = a3;
}

- (BOOL)guestLoading
{
  return self->_guestLoading;
}

- (void)setGuestLoading:(BOOL)a3
{
  self->_guestLoading = a3;
}

- (BOOL)bookingsLoading
{
  return self->_bookingsLoading;
}

- (BOOL)bookingPending
{
  return self->_bookingPending;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (RestaurantReservationTableViewCell)reservationDetailCell
{
  return self->_reservationDetailCell;
}

- (void)setReservationDetailCell:(id)a3
{
  objc_storeStrong((id *)&self->_reservationDetailCell, a3);
}

- (NSDictionary)availableBookingsBySection
{
  return self->_availableBookingsBySection;
}

- (void)setAvailableBookingsBySection:(id)a3
{
  objc_storeStrong((id *)&self->_availableBookingsBySection, a3);
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitles, a3);
}

- (void)setTimeSuffixDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeSuffixDateFormatter, a3);
}

- (void)setTimeSelectionDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeSelectionDateFormatter, a3);
}

- (RestaurantReservationRequestController)restaurantReservationRequestController
{
  return self->_restaurantReservationRequestController;
}

- (void)setRestaurantReservationRequestController:(id)a3
{
  objc_storeStrong((id *)&self->_restaurantReservationRequestController, a3);
}

- (NSMutableArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_storeStrong((id *)&self->_offers, a3);
}

- (NSMutableSet)offersSet
{
  return self->_offersSet;
}

- (void)setOffersSet:(id)a3
{
  objc_storeStrong((id *)&self->_offersSet, a3);
}

- (INRestaurantOffer)selectedOffer
{
  return self->_selectedOffer;
}

- (void)setSelectedOffer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOffer, a3);
}

- (NSString)formerSelection
{
  return self->_formerSelection;
}

- (void)setFormerSelection:(id)a3
{
  objc_storeStrong((id *)&self->_formerSelection, a3);
}

- (BOOL)emailPreferenceAllowEmails
{
  return self->_emailPreferenceAllowEmails;
}

- (void)setEmailPreferenceAllowEmails:(BOOL)a3
{
  self->_emailPreferenceAllowEmails = a3;
}

- (ReservationButtonView)footerButtonView
{
  return self->_footerButtonView;
}

- (void)setFooterButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_footerButtonView, a3);
}

- (NSMutableDictionary)heightCache
{
  return self->_heightCache;
}

- (void)setHeightCache:(id)a3
{
  objc_storeStrong((id *)&self->_heightCache, a3);
}

- (NSNumber)offersRowHeight
{
  return self->_offersRowHeight;
}

- (void)setOffersRowHeight:(id)a3
{
  objc_storeStrong((id *)&self->_offersRowHeight, a3);
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCaptor, a3);
}

- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, a3);
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_offersRowHeight, 0);
  objc_storeStrong((id *)&self->_heightCache, 0);
  objc_storeStrong((id *)&self->_footerButtonView, 0);
  objc_storeStrong((id *)&self->_formerSelection, 0);
  objc_storeStrong((id *)&self->_selectedOffer, 0);
  objc_storeStrong((id *)&self->_offersSet, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_restaurantReservationRequestController, 0);
  objc_storeStrong((id *)&self->_timeSelectionDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeSuffixDateFormatter, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_availableBookingsBySection, 0);
  objc_storeStrong((id *)&self->_reservationDetailCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_specialRequestText, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_guestDisplayPreferences, 0);
  objc_storeStrong((id *)&self->_guest, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_restaurantAdvisementText, 0);
  objc_storeStrong((id *)&self->_restaurantDescriptionText, 0);
  objc_storeStrong((id *)&self->_restaurantTimeZone, 0);
  objc_storeStrong((id *)&self->_restaurantName, 0);
  objc_storeStrong((id *)&self->_availableBookings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_selectedBooking, 0);
}

@end
