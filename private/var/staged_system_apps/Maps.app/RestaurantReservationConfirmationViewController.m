@implementation RestaurantReservationConfirmationViewController

- (RestaurantReservationConfirmationViewController)initWithUserBooking:(id)a3 mapItem:(id)a4 appName:(id)a5 analyticsCaptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RestaurantReservationConfirmationViewController *v14;
  RestaurantReservationConfirmationViewController *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RestaurantReservationConfirmationViewController;
  v14 = -[RestaurantReservationConfirmationViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  v15 = v14;
  if (v14)
  {
    -[RestaurantReservationConfirmationViewController setUserBooking:](v14, "setUserBooking:", v10);
    -[RestaurantReservationConfirmationViewController setMapItem:](v15, "setMapItem:", v11);
    -[RestaurantReservationConfirmationViewController setAppName:](v15, "setAppName:", v12);
    -[RestaurantReservationConfirmationViewController setAnalyticsCaptor:](v15, "setAnalyticsCaptor:", v13);
  }

  return v15;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RestaurantReservationConfirmationViewController;
  -[RestaurantReservationConfirmationViewController viewDidLoad](&v3, "viewDidLoad");
  -[RestaurantReservationConfirmationViewController configureTableView](self, "configureTableView");
  -[RestaurantReservationConfirmationViewController registerCellClasses](self, "registerCellClasses");
  -[RestaurantReservationConfirmationViewController setupConstraints](self, "setupConstraints");
  -[RestaurantReservationConfirmationViewController buildSections](self, "buildSections");
}

- (void)configureTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RestaurantReservationConfirmationViewController setTableView:](self, "setTableView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setDataSource:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", UITableViewAutomaticDimension);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setEstimatedSectionHeaderHeight:", 0.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setSeparatorStyle:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setAllowsSelection:", 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v12, "addSubview:", v11);

}

- (void)registerCellClasses
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
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v4 = objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
  v5 = (objc_class *)objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v9 = objc_opt_class(BookingConfirmationCell);
  v10 = (objc_class *)objc_opt_class(BookingConfirmationCell);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v12);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v13 = objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
  v14 = (objc_class *)objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v13, v16);

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
  _QWORD v25[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v25[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v25[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)buildSections
{
  void *v3;
  void *v4;
  id v5;
  RestaurantReservationConfirmationViewControllerSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  RestaurantReservationConfirmationViewControllerSection *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  RestaurantReservationConfirmationViewControllerSection *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  RestaurantReservationConfirmationViewControllerSection *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advisementText"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_opt_new(RestaurantReservationConfirmationViewControllerSection);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("reservations_from_restaurant_key"), CFSTR("localized string not found"), 0));
    -[RestaurantReservationConfirmationViewControllerSection setSectionTitle:](v6, "setSectionTitle:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advisementText"));
    -[RestaurantReservationConfirmationViewControllerSection setSectionText:](v6, "setSectionText:", v10);

    objc_msgSend(v40, "addObject:", v6);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userInfoStringForGuest:](self, "userInfoStringForGuest:", v12));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = objc_opt_new(RestaurantReservationConfirmationViewControllerSection);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("reservations_your_info_key"), CFSTR("localized string not found"), 0));
    -[RestaurantReservationConfirmationViewControllerSection setSectionTitle:](v15, "setSectionTitle:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "guest"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userInfoStringForGuest:](self, "userInfoStringForGuest:", v19));
    -[RestaurantReservationConfirmationViewControllerSection setSectionText:](v15, "setSectionText:", v20);

    objc_msgSend(v40, "addObject:", v15);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedOffer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "offerDetailText"));
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    v25 = objc_opt_new(RestaurantReservationConfirmationViewControllerSection);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("reservations_selected_offer_key"), CFSTR("localized string not found"), 0));
    -[RestaurantReservationConfirmationViewControllerSection setSectionTitle:](v25, "setSectionTitle:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "selectedOffer"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "offerTitleText"));
    -[RestaurantReservationConfirmationViewControllerSection setSectionText:](v25, "setSectionText:", v30);

    objc_msgSend(v40, "addObject:", v25);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "guestProvidedSpecialRequestText"));
  v33 = objc_msgSend(v32, "length");

  if (v33)
  {
    v34 = objc_opt_new(RestaurantReservationConfirmationViewControllerSection);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("reservations_special_request_key"), CFSTR("localized string not found"), 0));
    -[RestaurantReservationConfirmationViewControllerSection setSectionTitle:](v34, "setSectionTitle:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "guestProvidedSpecialRequestText"));
    -[RestaurantReservationConfirmationViewControllerSection setSectionText:](v34, "setSectionText:", v38);

    objc_msgSend(v40, "addObject:", v34);
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v40));
  -[RestaurantReservationConfirmationViewController setSections:](self, "setSections:", v39);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  char *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController sections](self, "sections", a3));
  v4 = (char *)objc_msgSend(v3, "count") + 1;

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 2;
  else
    return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  UITableViewCell *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = (uint64_t)objc_msgSend(v7, "section");
    v9 = v8 - 1;
    if (v8 >= 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController sections](self, "sections"));
      v11 = objc_msgSend(v10, "count");

      if (v9 < (unint64_t)v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController sections](self, "sections"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v9));

        if (objc_msgSend(v7, "row"))
        {
          if (objc_msgSend(v7, "row") != (id)1)
          {
            v17 = objc_opt_new(UITableViewCell);
            goto LABEL_12;
          }
          v14 = (objc_class *)objc_opt_class(BookingConfirmationCell);
          v15 = NSStringFromClass(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v17 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v16));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sectionText"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell details](v17, "details"));
          objc_msgSend(v19, "setText:", v18);

        }
        else
        {
          v23 = (objc_class *)objc_opt_class(RestaurantReservationSectionHeaderTableViewCell);
          v24 = NSStringFromClass(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v17 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v25));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sectionTitle"));
          -[UITableViewCell setText:](v17, "setText:", v26);

          v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          -[UITableViewCell setTextColor:](v17, "setTextColor:", v18);
        }

LABEL_12:
        goto LABEL_13;
      }
    }
    v17 = objc_opt_new(UITableViewCell);
  }
  else
  {
    v20 = (objc_class *)objc_opt_class(RestaurantReservationsConfirmationHeaderCell);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v17 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v22));

    -[RestaurantReservationConfirmationViewController configureHeaderCell:](self, "configureHeaderCell:", v17);
  }
LABEL_13:

  return v17;
}

- (void)configureHeaderCell:(id)a3
{
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "setSubtitleType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController headerTextForUserBookingStatus:](self, "headerTextForUserBookingStatus:", objc_msgSend(v5, "status")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController userBooking](self, "userBooking"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController confirmationSubtitleTextForUserBooking:](self, "confirmationSubtitleTextForUserBooking:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subLabel"));
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v4, "setActionDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("reservation_change_reservation_key"), CFSTR("localized string not found"), 0));
  objc_msgSend(v4, "setAccessoryButtonTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v13, "layoutMargins");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v20, "setLayoutMargins:", v15, v17, 30.0, v19);

}

- (void)updateTheme
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController buttons](self, "buttons", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController theme](self, "theme"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "controlTintColor"));
        objc_msgSend(v8, "setTintColor:", v10);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)reservationConfirmationHeaderCellAccessoryButtonWasTapped:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController analyticsCaptor](self, "analyticsCaptor", a3));
  objc_msgSend(v4, "captureBookedChangeReservation");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController reservationDelegate](self, "reservationDelegate"));
  objc_msgSend(v5, "restaurantReservationConfirmationViewControllerDidSelectEditReservation:", self);

}

- (id)headerTextForUserBookingStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("reservation_request_sent_key");
      goto LABEL_7;
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("reservations_denied_text_key");
      goto LABEL_7;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("reservations_completion_text_key");
LABEL_7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
  }
  return v3;
}

- (id)userInfoStringForGuest:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nameComponents"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nameComponents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v6, 3, 0));

    if (objc_msgSend(v7, "length"))
      -[NSMutableArray addObject:](v4, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));
    -[NSMutableArray addObject:](v4, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddress"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddress"));
    -[NSMutableArray addObject:](v4, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR("\n")));

  return v14;
}

- (id)confirmationSubtitleTextForUserBooking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController dayAndRestaurantDescriptionForUserBooking:](self, "dayAndRestaurantDescriptionForUserBooking:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController timeAndTableDescriptionForUserBooking:](self, "timeAndTableDescriptionForUserBooking:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v5, v6));
  return v7;
}

- (id)timeAndTableDescriptionForUserBooking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController mapItem](self, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController dateFormatter](self, "dateFormatter"));
  objc_msgSend(v7, "setTimeZone:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("reservation_date_table_size_key"), CFSTR("localized string not found"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController dateFormatter](self, "dateFormatter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v11));

  v13 = objc_alloc((Class)NSString);
  v14 = objc_msgSend(v4, "partySize");

  v15 = objc_msgSend(v13, "initWithFormat:", v9, v12, v14);
  return v15;
}

- (id)dayAndRestaurantDescriptionForUserBooking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("reservation_day_restaurant_name_format_key"), CFSTR("localized string not found"), 0));

  v7 = objc_alloc((Class)NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController mapItem](self, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_dayDescriptionStringShortDescription:timeZone:bookingDate:](NSDate, "_maps_dayDescriptionStringShortDescription:timeZone:bookingDate:", 1, v9, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController mapItem](self, "mapItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
  v14 = objc_msgSend(v7, "initWithFormat:", v6, v11, v13);

  return v14;
}

- (id)tableDescriptionForUserBooking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("reservation_name_table_format"), CFSTR("localized string not found"), 0));

  v7 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
  objc_msgSend(v7, "setStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nameComponents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromPersonNameComponents:", v9));

  v11 = objc_alloc((Class)NSString);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController numberFormatter](self, "numberFormatter"));
  v13 = objc_msgSend(v4, "partySize");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromNumber:", v14));
  v16 = objc_msgSend(v11, "initWithFormat:", v6, v10, v15);

  return v16;
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    v5 = v6;
  }

}

- (void)setUserBooking:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[RestaurantReservationConfirmationViewController checkUserBookingForRefresh:](self, "checkUserBookingForRefresh:", v6);
  if ((objc_msgSend(v6, "isEqual:", self->_userBooking) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userBooking, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController tableView](self, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = objc_opt_new(NSDateFormatter);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 1);
    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 0);
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (NSNumberFormatter)numberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = objc_opt_new(NSNumberFormatter);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (void)checkUserBookingForRefresh:(id)a3
{
  if (!objc_msgSend(a3, "status"))
    -[RestaurantReservationConfirmationViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "requestRefresh", 0, 20.0);
}

- (void)requestRefresh
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationConfirmationViewController reservationDelegate](self, "reservationDelegate"));
  objc_msgSend(v3, "restaurantReservationConfirmationViewControllerRequestStatusUpdateForUserBooking:", self);

}

- (BOOL)useExtensionFlowHeader
{
  return 1;
}

- (BOOL)useAvailableHeight
{
  return 1;
}

- (INRestaurantReservationUserBooking)userBooking
{
  return self->_userBooking;
}

- (RestaurantReservationConfirmationViewControllerDelegate)reservationDelegate
{
  return (RestaurantReservationConfirmationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_reservationDelegate);
}

- (void)setReservationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reservationDelegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (ExtensionsPrimaryDetailsView)primaryDetailsView
{
  return self->_primaryDetailsView;
}

- (void)setPrimaryDetailsView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDetailsView, a3);
}

- (ExtensionsSecondaryDetailsView)secondaryDetailsView
{
  return self->_secondaryDetailsView;
}

- (void)setSecondaryDetailsView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryDetailsView, a3);
}

- (ExtensionsActionsFooterView)openAppView
{
  return self->_openAppView;
}

- (void)setOpenAppView:(id)a3
{
  objc_storeStrong((id *)&self->_openAppView, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCaptor, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailsView, 0);
  objc_storeStrong((id *)&self->_primaryDetailsView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_reservationDelegate);
  objc_storeStrong((id *)&self->_userBooking, 0);
}

@end
