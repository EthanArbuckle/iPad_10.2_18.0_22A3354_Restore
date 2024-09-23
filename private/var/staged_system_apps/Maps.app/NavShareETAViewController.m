@implementation NavShareETAViewController

- (NavShareETAViewController)init
{
  NavShareETAViewController *v2;
  NavShareETAViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *cellsByContactStringValue;
  SharedTripSuggestionsDataSource *v9;
  SharedTripSuggestionsDataSource *v10;
  SharedTripSuggestionsDataSource *dataSource;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NavShareETAViewController;
  v2 = -[NavShareETAViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v4, "setBlurInCardView:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v6, "setCardColor:", v5);

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellsByContactStringValue = v3->_cellsByContactStringValue;
    v3->_cellsByContactStringValue = v7;

    v9 = [SharedTripSuggestionsDataSource alloc];
    v10 = -[SharedTripSuggestionsDataSource initWithSoftCellCap:includeActiveContacts:](v9, "initWithSoftCellCap:includeActiveContacts:", GEOConfigGetUInteger(MapsConfig_SharedTripMaximumNumberOfSuggestionsInTray, off_1014B5608), 1);
    dataSource = v3->_dataSource;
    v3->_dataSource = v10;

    -[SharedTripSuggestionsDataSource setShowContactSearchItem:](v3->_dataSource, "setShowContactSearchItem:", 1);
    -[SharedTripSuggestionsDataSource setContactSearchItemPosition:](v3->_dataSource, "setContactSearchItemPosition:", 1);
    -[SharedTripSuggestionsDataSource setDelegate:](v3->_dataSource, "setDelegate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v12, "addSendingObserver:", v3);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!self->_userInteracted)
    -[SharedTripSuggestionsDataSource abandon](self->_dataSource, "abandon");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v3, "removeSendingObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NavShareETAViewController;
  -[NavShareETAViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  ContainerHeaderView *v5;
  ContainerHeaderView *trayHeader;
  void *v7;
  NavShareETAHeaderView *v8;
  NavShareETAHeaderView *headerView;
  UIView *v10;
  UIView *contentView;
  void *v12;
  UITableView *v13;
  UITableView *tableView;
  void *v15;
  void *v16;
  NavShareETAFooterView *v17;
  NavShareETAFooterView *footerView;
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
  objc_super v59;
  _QWORD v60[11];

  v59.receiver = self;
  v59.super_class = (Class)NavShareETAViewController;
  -[ContaineeViewController viewDidLoad](&v59, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("NavShareETAView"));

  v5 = objc_opt_new(ContainerHeaderView);
  trayHeader = self->_trayHeader;
  self->_trayHeader = v5;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_trayHeader, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_trayHeader, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](self->_trayHeader, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setHeaderSize:](self->_trayHeader, "setHeaderSize:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_trayHeader);

  v8 = objc_opt_new(NavShareETAHeaderView);
  headerView = self->_headerView;
  self->_headerView = v8;

  -[NavShareETAHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setTitleView:](self->_trayHeader, "setTitleView:", self->_headerView);
  v10 = objc_opt_new(UIView);
  contentView = self->_contentView;
  self->_contentView = v10;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("NavShareETAContent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_contentView);

  v13 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v13;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 16.0);
  -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 0.0);
  -[UITableView _setBottomPadding:](self->_tableView, "_setBottomPadding:", 0.0);
  -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 0.0);
  -[UITableView setSectionFooterHeight:](self->_tableView, "setSectionFooterHeight:", 16.0);
  -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v15);

  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavTraySeparatorColor")));
  -[UITableView setSeparatorColor:](self->_tableView, "setSeparatorColor:", v16);

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("NavShareETATableView"));
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_tableView);
  v17 = objc_opt_new(NavShareETAFooterView);
  footerView = self->_footerView;
  self->_footerView = v17;

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_trayHeader, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v60[0] = v55;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_trayHeader, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v60[1] = v51;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_trayHeader, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v60[2] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_trayHeader, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v60[3] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v60[4] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v60[5] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v60[6] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v60[7] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v60[8] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v60[9] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v60[10] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  -[SharedTripSuggestionsDataSource addTableView:cellProvider:](self->_dataSource, "addTableView:cellProvider:", self->_tableView, self);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavShareETAViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setHideGrabber:", 1);

  -[SharedTripSuggestionsDataSource addTableView:cellProvider:](self->_dataSource, "addTableView:cellProvider:", self->_tableView, self);
  -[NavShareETAViewController _reloadContactForFirstDisplay](self, "_reloadContactForFirstDisplay");
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004FBC78;
  v6[3] = &unk_1011B3220;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "refreshSharingIdentityWithCompletion:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavShareETAViewController;
  -[NavShareETAViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_visible = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  SharedTripSuggestionsDataSource *dataSource;
  void *v11;
  GCDTimer *dismissTimer;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)NavShareETAViewController;
  -[NavShareETAViewController viewDidDisappear:](&v17, "viewDidDisappear:", a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cellsByContactStringValue, "objectEnumerator", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "sharingState") == (id)1)
        {
          dataSource = self->_dataSource;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contact"));
          -[SharedTripSuggestionsDataSource toggleContact:](dataSource, "toggleContact:", v11);

          objc_msgSend(v9, "setSharingState:animated:", 3, 0);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

  -[SharedTripSuggestionsDataSource clearTableView](self->_dataSource, "clearTableView");
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = 0;

  self->_visible = 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavShareETAViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
  {
    -[UITableView reloadData](self->_tableView, "reloadData");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "updateHeightForCurrentLayout");

  }
}

- (NavShareETACell)openContactsCell
{
  NavShareETACell *openContactsCell;
  NavShareETACell *v4;
  NavShareETACell *v5;

  openContactsCell = self->_openContactsCell;
  if (!openContactsCell)
  {
    v4 = -[NavShareETACell initWithStyle:reuseIdentifier:]([NavShareETACell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_openContactsCell;
    self->_openContactsCell = v4;

    openContactsCell = self->_openContactsCell;
  }
  return openContactsCell;
}

- (void)_reloadContactForFirstDisplay
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receivers"));
  -[NavShareETAHeaderView setActiveContacts:](self->_headerView, "setActiveContacts:", v4);

  -[SharedTripSuggestionsDataSource resetContactsForDisplayOrdering](self->_dataSource, "resetContactsForDisplayOrdering");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_updateSharingFooterWithIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[SharedETA] sender info label"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v7));
  -[NavShareETAFooterView setFooterText:](self->_footerView, "setFooterText:", v8);

  -[UITableView reloadData](self->_tableView, "reloadData");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v9, "updateHeightForCurrentLayout");

}

- (void)dismissAfterDelay
{
  double Double;
  id v4;
  GCDTimer *v5;
  GCDTimer *dismissTimer;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  Double = GEOConfigGetDouble(MapsConfig_ShareETASuggestionSelectionDismissDelay, off_1014B3498);
  v4 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004FC25C;
  v7[3] = &unk_1011AE190;
  objc_copyWeak(&v8, &location);
  v5 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v7, Double));
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)cellDidFinishRingAnimation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  SharedTripSuggestionsDataSource *dataSource;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
    v11 = 138477827;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Now starting share to %{private}@", (uint8_t *)&v11, 0xCu);

  }
  dataSource = self->_dataSource;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
  -[SharedTripSuggestionsDataSource toggleContact:](dataSource, "toggleContact:", v9);

  -[NavShareETAViewController dismissAfterDelay](self, "dismissAfterDelay");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v10, "updateHeightForCurrentLayout");

}

- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3
{
  id v4;
  id v5;
  void *i;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  unsigned int v14;
  _QWORD *v15;
  id obj;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource changedContacts](self->_dataSource, "changedContacts", a3));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cellsByContactStringValue, "objectEnumerator"));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1)
                                                                                 + 8 * (_QWORD)j), "contact"));
              v14 = objc_msgSend(v13, "isEqual:", v7);

              if (v14)
              {
                -[NavShareETAViewController dismissAfterDelay](self, "dismissAfterDelay");
                goto LABEL_16;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v10)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004FC5E0;
  v18[3] = &unk_1011AC860;
  v18[4] = self;
  v15 = objc_retainBlock(v18);
  if (self->_visible)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v15, 0.25);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sharingIdentity"));
  -[NavShareETAViewController _updateWithSharingIdentity:](self, "_updateWithSharingIdentity:", v4);

}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
  -[NavShareETAViewController _updateWithSharingIdentity:](self, "_updateWithSharingIdentity:", a4);
}

- (void)_updateWithSharingIdentity:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  -[NavShareETAViewController _updateSharingFooterWithIdentity:](self, "_updateSharingFooterWithIdentity:", v4);
  v5 = objc_msgSend(v4, "hasValidAccount");

  if ((v5 & 1) == 0)
    -[NavShareETAViewController _dismiss](self, "_dismiss");
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  NavShareETAHeaderView *headerView;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  headerView = self->_headerView;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAHeaderView activeContacts](headerView, "activeContacts"));
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "count");

  -[NavShareETAHeaderView setActiveContacts:](self->_headerView, "setActiveContacts:", v6);
  if (v8 != v9)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "updateHeightForCurrentLayout");

  }
}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = objc_msgSend(v4, "containeeLayout");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v7 = v6;
  if (v5 == (id)1)
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v6, "wantsLayout:", v8);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3, 649, 0);
}

- (void)_dismiss
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Automatically dismissing ShareETA", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)NavShareETAViewController;
  -[ContaineeViewController handleDismissAction:](&v5, "handleDismissAction:", 0);
}

- (id)headerView
{
  return self->_trayHeader;
}

- (id)contentView
{
  return self->_contentView;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NavShareETAViewController;
  -[ContaineeViewController handleDismissAction:](&v7, "handleDismissAction:", v4);
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dismissed ShareETA from %@", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, 649, 0);
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  UITableView *tableView;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;

  if (a3 == 1)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v12 = v11;
LABEL_13:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v18, "bottomSafeOffset");
    v4 = v12 + v19;

    return v4;
  }
  v4 = -1.0;
  if (a3 == 2)
  {
    if (-[UITableView numberOfSections](self->_tableView, "numberOfSections") < 1)
    {
      v6 = 0.0;
    }
    else
    {
      v5 = 0;
      v6 = 0.0;
      do
      {
        if (-[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", v5) >= 1)
        {
          v7 = 0;
          do
          {
            tableView = self->_tableView;
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, v5));
            -[NavShareETAViewController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", tableView, v9);
            v6 = v6 + v10;

            ++v7;
          }
          while (v7 < -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", v5));
        }
        ++v5;
      }
      while (v5 < -[UITableView numberOfSections](self->_tableView, "numberOfSections"));
    }
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v14 = v6 + v13;
    -[NavShareETAViewController _footerHeight](self, "_footerHeight");
    v16 = v14 + v15;
    -[NavShareETAViewController _extraHeight](self, "_extraHeight");
    v12 = v16 + v17;
    goto LABEL_13;
  }
  return v4;
}

- (double)_extraHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v2, "bottomSafeOffset");
  if (v3 <= 0.0)
    v4 = 16.0;
  else
    v4 = 0.0;

  return v4;
}

- (double)_footerHeight
{
  NavShareETAFooterView *footerView;
  double result;

  footerView = self->_footerView;
  -[NavShareETAViewController _tableContentWidth](self, "_tableContentWidth");
  -[NavShareETAFooterView heightForWidth:](footerView, "heightForWidth:");
  return result;
}

- (double)_tableContentWidth
{
  double Width;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[UITableView frame](self->_tableView, "frame");
  Width = CGRectGetWidth(v8);
  -[UITableView layoutMargins](self->_tableView, "layoutMargins");
  v5 = Width - v4;
  -[UITableView layoutMargins](self->_tableView, "layoutMargins");
  return v5 - v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  NavShareETACell *v9;
  void *v10;
  NSMutableDictionary *cellsByContactStringValue;
  void *v12;
  unint64_t v13;
  NavShareETACell *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactSearchItemIdentifier](self->_dataSource, "contactSearchItemIdentifier"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIdentifier:](self->_dataSource, "contactForItemIdentifier:", v6));
    cellsByContactStringValue = self->_cellsByContactStringValue;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    v9 = (NavShareETACell *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v12));

    if (v9)
    {
      v13 = -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v10);
      v14 = v9;
      v15 = 1;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      v17 = objc_msgSend(v16, "length");

      if (!v17)
      {
        v9 = 0;
        goto LABEL_8;
      }
      v9 = -[NavShareETACell initWithStyle:reuseIdentifier:]([NavShareETACell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      v18 = self->_cellsByContactStringValue;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v9, v19);

      -[NavShareETACell setDelegate:](v9, "setDelegate:", self);
      -[NavShareETACell setContact:](v9, "setContact:", v10);
      v13 = -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v10);
      v14 = v9;
      v15 = 0;
    }
    -[NavShareETACell setSharingState:animated:](v14, "setSharingState:animated:", v13, v15);
LABEL_8:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    -[NavShareETACell setCapabilityType:](v9, "setCapabilityType:", objc_msgSend(v20, "capabilityLevelForContact:", v10));

    goto LABEL_9;
  }
  v9 = (NavShareETACell *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController openContactsCell](self, "openContactsCell"));
LABEL_9:

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NavShareETACell *v8;
  NavShareETACell *v9;
  NavShareETAViewController *v10;
  NavShareETACell *sizingCell;
  NavShareETACell *v12;
  NavShareETACell *v13;
  double v14;
  double v15;

  v6 = a3;
  v7 = a4;
  if (-[SharedTripSuggestionsDataSource isContactSearchItemAtIndexPath:](self->_dataSource, "isContactSearchItemAtIndexPath:", v7))
  {
    v8 = (NavShareETACell *)objc_claimAutoreleasedReturnValue(-[NavShareETAViewController openContactsCell](self, "openContactsCell"));
    v9 = v8;
  }
  else
  {
    v10 = (NavShareETAViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSource"));
    if (v10 == self)
      v9 = 0;
    else
      v9 = (NavShareETACell *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:", v7));

    sizingCell = self->_sizingCell;
    if (!sizingCell)
    {
      v12 = -[NavShareETACell initWithStyle:reuseIdentifier:]([NavShareETACell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      v13 = self->_sizingCell;
      self->_sizingCell = v12;

      sizingCell = self->_sizingCell;
    }
    -[NavShareETACell setContact:](sizingCell, "setContact:", v9);
    -[NavShareETACell setSharingState:animated:](self->_sizingCell, "setSharingState:animated:", 3, 0);
    v8 = self->_sizingCell;
  }
  -[NavShareETAViewController _tableContentWidth](self, "_tableContentWidth");
  -[NavShareETACell heightForWidth:](v8, "heightForWidth:");
  v15 = v14;

  return v15;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  if ((uint64_t)objc_msgSend(a3, "numberOfSections") - 1 > a4)
    return 0.0;
  -[NavShareETAViewController _footerHeight](self, "_footerHeight");
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NavShareETAFooterView *v5;

  if ((uint64_t)objc_msgSend(a3, "numberOfSections") - 1 <= a4)
    v5 = self->_footerView;
  else
    v5 = 0;
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  GCDTimer *dismissTimer;
  id WeakRetained;
  void *v11;
  void *v12;
  NSMutableDictionary *cellsByContactStringValue;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  GCDTimer *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;

  v6 = a4;
  self->_userInteracted = 1;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  if (-[SharedTripSuggestionsDataSource isContactSearchItemAtIndexPath:](self->_dataSource, "isContactSearchItemAtIndexPath:", v6))
  {
    v7 = sub_100431C0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Tapped ShareETA Open contacts", (uint8_t *)&v25, 2u);
    }

    -[GCDTimer invalidate](self->_dismissTimer, "invalidate");
    dismissTimer = self->_dismissTimer;
    self->_dismissTimer = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_navActionCoordinator);
    objc_msgSend(WeakRetained, "viewControllerOpenContactsSearch:", self);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9027, 649, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:", v6));
    v12 = v11;
    if (v11)
    {
      cellsByContactStringValue = self->_cellsByContactStringValue;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v14));

      if (objc_msgSend(v15, "sharingState"))
      {
        v16 = objc_msgSend(v15, "sharingState");
        v17 = sub_100431C0C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v16 == (id)1)
        {
          if (v19)
          {
            v25 = 138477827;
            v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Tapped to cancel share to %{private}@", (uint8_t *)&v25, 0xCu);
          }

          -[NavShareETAViewController dismissAfterDelay](self, "dismissAfterDelay");
          objc_msgSend(v15, "setSharingState:animated:", -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v12), 0);
        }
        else
        {
          if (v19)
          {
            v25 = 138477827;
            v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Tapped to stop sharing to %{private}@", (uint8_t *)&v25, 0xCu);
          }

          -[NavShareETAViewController dismissAfterDelay](self, "dismissAfterDelay");
          -[SharedTripSuggestionsDataSource toggleContact:](self->_dataSource, "toggleContact:", v12);
        }
        v23 = 9026;
      }
      else
      {
        v20 = sub_100431C0C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v25 = 138477827;
          v26 = v12;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Tapped to start sharing to %{private}@", (uint8_t *)&v25, 0xCu);
        }

        -[GCDTimer invalidate](self->_dismissTimer, "invalidate");
        v22 = self->_dismissTimer;
        self->_dismissTimer = 0;

        objc_msgSend(v15, "setSharingState:animated:", 1, 1);
        v23 = 9025;
      }
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v23, 649, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v24, "updateHeightForCurrentLayout");

    }
  }

}

- (NavActionCoordination)navActionCoordinator
{
  return (NavActionCoordination *)objc_loadWeakRetained((id *)&self->_navActionCoordinator);
}

- (void)setNavActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_navActionCoordinator, a3);
}

- (void)setOpenContactsCell:(id)a3
{
  objc_storeStrong((id *)&self->_openContactsCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openContactsCell, 0);
  objc_destroyWeak((id *)&self->_navActionCoordinator);
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_cellsByContactStringValue, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_trayHeader, 0);
}

@end
