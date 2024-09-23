@implementation CarplayDetailViewController

- (CarplayDetailViewController)initWithEvent:(id)a3 showDayName:(BOOL)a4
{
  id v7;
  CarplayDetailViewController *v8;
  CarplayDetailViewController *v9;
  NSMutableArray *v10;
  NSMutableArray *actionIdentifiers;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CarplayDetailViewController;
  v8 = -[CarplayDetailViewController init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    v8->_showDayName = a4;
    objc_storeStrong((id *)&v8->_event, a3);
    v10 = objc_opt_new(NSMutableArray);
    actionIdentifiers = v9->_actionIdentifiers;
    v9->_actionIdentifiers = v10;

    *(_QWORD *)&v12 = objc_opt_class(v9).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v13, v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Event Details"), &stru_1001B67C0, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController navigationItem](v9, "navigationItem"));
    objc_msgSend(v16, "setTitle:", v15);

    -[CarplayDetailViewController _initActionIdentifiers](v9, "_initActionIdentifiers");
    -[CarplayDetailViewController _donateUserActivity:](v9, "_donateUserActivity:", v9->_event);
    +[EKMapsUtilities geocodeEventIfNeeded:](EKMapsUtilities, "geocodeEventIfNeeded:", v7);
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNavigationBarHidden:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "eventStoreChanged:", EKEventStoreChangedNotification, 0);
  v7.receiver = self;
  v7.super_class = (Class)CarplayDetailViewController;
  -[CarplayDetailViewController viewWillAppear:](&v7, "viewWillAppear:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, EKEventStoreChangedNotification, 0);
  v6.receiver = self;
  v6.super_class = (Class)CarplayDetailViewController;
  -[CarplayDetailViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);

}

- (id)_createTableView
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setDataSource:", self);
  *(_QWORD *)&v4 = objc_opt_class(CarplayStaticEventDetailsTableViewCell).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayStaticEventDetailsTableViewCell, "reuseIdentifier", v4));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v7);

  *(_QWORD *)&v8 = objc_opt_class(CarplayLocationTableViewCell).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayLocationTableViewCell, "reuseIdentifier", v8));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v10, v11);

  *(_QWORD *)&v12 = objc_opt_class(CarplayConferenceTableViewCell).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayConferenceTableViewCell, "reuseIdentifier", v12));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v14, v15);

  *(_QWORD *)&v16 = objc_opt_class(CarplayAttendeeTableViewCell).n128_u64[0];
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayAttendeeTableViewCell, "reuseIdentifier", v16));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v18, v19);

  return v3;
}

- (void)_initActionIdentifiers
{
  NSMutableArray *actionIdentifiers;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  UITableView *v11;
  UITableView *tableView;
  void *v13;

  -[NSMutableArray removeAllObjects](self->_actionIdentifiers, "removeAllObjects");
  actionIdentifiers = self->_actionIdentifiers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayStaticEventDetailsTableViewCell, "reuseIdentifier"));
  -[NSMutableArray addObject:](actionIdentifiers, "addObject:", v4);

  if (+[CarplayUtilities eventCanNavigate:](CarplayUtilities, "eventCanNavigate:", self->_event))
  {
    v5 = self->_actionIdentifiers;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayLocationTableViewCell, "reuseIdentifier"));
    -[NSMutableArray addObject:](v5, "addObject:", v6);

  }
  if (+[CarplayUtilities eventCanDialIn:](CarplayUtilities, "eventCanDialIn:", self->_event))
  {
    v7 = self->_actionIdentifiers;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayConferenceTableViewCell, "reuseIdentifier"));
    -[NSMutableArray addObject:](v7, "addObject:", v8);

  }
  if (-[CarplayDetailViewController organizerCanBeMessaged](self, "organizerCanBeMessaged"))
  {
    v9 = self->_actionIdentifiers;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayDetailTableViewCell reuseIdentifier](CarplayAttendeeTableViewCell, "reuseIdentifier"));
    -[NSMutableArray addObject:](v9, "addObject:", v10);

  }
  v11 = (UITableView *)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController _createTableView](self, "_createTableView"));
  tableView = self->_tableView;
  self->_tableView = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_tableView);

  -[CarplayDetailViewController createAndActivateLayoutConstraints](self, "createAndActivateLayoutConstraints");
}

- (void)createAndActivateLayoutConstraints
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
  _QWORD v21[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v21[0] = v17;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v21[1] = v13;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v21[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v21[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (BOOL)organizerCanBeMessaged
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent organizer](self->_event, "organizer"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent organizer](self->_event, "organizer"));
    v5 = objc_msgSend(v4, "isCurrentUser") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)eventStoreChanged:(id)a3
{
  id v4;
  id v5;

  if ((-[EKEvent refreshIfRefreshableAndNotify:](self->_event, "refreshIfRefreshableAndNotify:", 1) & 1) != 0)
  {
    -[CarplayDetailViewController updateViewWithEvent](self, "updateViewWithEvent");
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController navigationController](self, "navigationController"));
    v4 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

- (void)updateViewWithEvent
{
  -[CarplayDetailViewController _initActionIdentifiers](self, "_initActionIdentifiers");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_donateUserActivity:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.mobilecal"));
  v6 = objc_msgSend(objc_alloc((Class)CSSearchableItemAttributeSet), "initWithItemContentType:", CFSTR("com.apple.mobilecal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  objc_msgSend(v6, "setContentDescription:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "structuredLocation"));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    objc_msgSend(v6, "setNamedLocation:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoLocation"));
    objc_msgSend(v11, "coordinate");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v6, "setLatitude:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoLocation"));
    objc_msgSend(v13, "coordinate");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
    objc_msgSend(v6, "setLongitude:", v15);

    objc_msgSend(v6, "setSupportsNavigation:", &__kCFBooleanTrue);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualConference"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstPhoneNumber"));
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conferenceURLForDisplay"));
  v20 = v19;

  if (objc_msgSend(v20, "cal_hasSchemeTel"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
    v23 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v6, "setPhoneNumbers:", v22);

    objc_msgSend(v6, "setSupportsPhoneCall:", &__kCFBooleanTrue);
  }
  objc_msgSend(v5, "setContentAttributeSet:", v6);
  objc_msgSend(v5, "setEligibleForSearch:", 1);
  objc_msgSend(v5, "setNeedsSave:", 1);
  objc_msgSend(v5, "becomeCurrent");
  -[CarplayDetailViewController setUserActivity:](self, "setUserActivity:", v5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_actionIdentifiers, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *actionIdentifiers;
  id v7;
  id v8;
  void *v9;
  void *v10;

  actionIdentifiers = self->_actionIdentifiers;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](actionIdentifiers, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7));

  if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___DayNameToggleable))
    objc_msgSend(v10, "setShowDayName:", self->_showDayName);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "updateWithEvent:", self->_event);

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v5));
  if (objc_msgSend(v6, "isSelectable"))
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v5));
  objc_msgSend(v7, "cellWasTapped");
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)pushViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifiers, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
