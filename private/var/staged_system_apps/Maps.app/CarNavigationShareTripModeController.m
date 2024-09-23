@implementation CarNavigationShareTripModeController

- (CarNavigationShareTripModeController)init
{
  CarNavigationShareTripModeController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cellsByContactStringValue;
  SharedTripSuggestionsDataSource *v5;
  SharedTripSuggestionsDataSource *dataSource;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarNavigationShareTripModeController;
  v2 = -[CarNavigationShareTripModeController init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellsByContactStringValue = v2->_cellsByContactStringValue;
    v2->_cellsByContactStringValue = v3;

    v5 = -[SharedTripSuggestionsDataSource initWithSoftCellCap:includeActiveContacts:]([SharedTripSuggestionsDataSource alloc], "initWithSoftCellCap:includeActiveContacts:", +[CarDisplayController maximumListLength](CarDisplayController, "maximumListLength"), 1);
    dataSource = v2->_dataSource;
    v2->_dataSource = v5;

    -[SharedTripSuggestionsDataSource setShowContactSearchItem:](v2->_dataSource, "setShowContactSearchItem:", GEOConfigGetBOOL(MapsConfig_ShareETAEnableCarPlayUserInput, off_1014B3E48));
    -[SharedTripSuggestionsDataSource setContactSearchItemPosition:](v2->_dataSource, "setContactSearchItemPosition:", 2);
    v2->_userInteracted = 0;
  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  void *v5;
  CarTableView *v6;
  CarTableView *tableView;
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
  CarUserInputCell *v18;
  CarUserInputCell *userInputCell;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)CarNavigationShareTripModeController;
  -[CarNavigationShareTripModeController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController view](self, "view"));
  v4 = [CarTableView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = -[CarTableView initWithFrame:style:](v4, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v6;

  -[CarTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarTableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[CarTableView setDataSource:](self->_tableView, "setDataSource:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v8);

  -[CarTableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "addSubview:", self->_tableView);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView topAnchor](self->_tableView, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v26[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v9));
  v26[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v26[2] = v13;
  v24 = v3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v26[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  -[CarNavigationShareTripModeController _setupTableHeaderView](self, "_setupTableHeaderView");
  -[CarNavigationShareTripModeController _setupTableFooterView](self, "_setupTableFooterView");
  if (-[SharedTripSuggestionsDataSource showsContactSearchItem](self->_dataSource, "showsContactSearchItem"))
  {
    v18 = -[CarUserInputCell initWithStyle:reuseIdentifier:]([CarUserInputCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    userInputCell = self->_userInputCell;
    self->_userInputCell = v18;

    -[CarUserInputCell setSelectionStyle:](self->_userInputCell, "setSelectionStyle:", 0);
    -[CarUserInputCell setDelegate:](self->_userInputCell, "setDelegate:", self);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarNavigationShareTripModeController;
  -[CarNavigationShareTripModeController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController"));
  v5 = objc_msgSend(v4, "isCurrentContext:", self);

  if (v5)
    -[SharedTripSuggestionsDataSource addTableView:cellProvider:](self->_dataSource, "addTableView:cellProvider:", self->_tableView, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController view](self, "view"));
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)_setupTableHeaderView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  CGRect v17;

  if (-[CarNavigationShareTripModeController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = objc_alloc((Class)UIView);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController view](self, "view"));
    objc_msgSend(v4, "bounds");
    v16 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v17), 1.79769313e308);

    objc_msgSend(v16, "setAutoresizingMask:", 34);
    LODWORD(v5) = 1148846080;
    objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v5);
    LODWORD(v6) = 1148846080;
    objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v6);
    v7 = objc_alloc((Class)UILabel);
    objc_msgSend(v16, "bounds");
    v8 = objc_msgSend(v7, "initWithFrame:");
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    objc_msgSend(v8, "setFont:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    objc_msgSend(v8, "setTextColor:", v10);

    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v8, "setLineBreakMode:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTrip_SharingDescription"), CFSTR("localized string not found"), 0));
    objc_msgSend(v8, "setText:", v12);

    LODWORD(v13) = 1148846080;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    objc_msgSend(v16, "addSubview:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintsForCenteringInView:edgeInsets:", v16, 0.0, 10.0, 10.0, 10.0));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    -[CarNavigationShareTripModeController _updateSizeOfView:](self, "_updateSizeOfView:", v16);
    -[CarTableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v16);

  }
}

- (void)_setupTableFooterView
{
  CarShareTripFooterView *v3;
  void *v4;
  CarShareTripFooterView *v5;
  CarShareTripFooterView *footerView;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  CGRect v15;

  if (-[CarNavigationShareTripModeController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = [CarShareTripFooterView alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController view](self, "view"));
    objc_msgSend(v4, "bounds");
    v5 = -[CarShareTripFooterView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v15), 1.79769313e308);
    footerView = self->_footerView;
    self->_footerView = v5;

    -[CarShareTripFooterView setAutoresizingMask:](self->_footerView, "setAutoresizingMask:", 10);
    LODWORD(v7) = 1148846080;
    -[CarShareTripFooterView setContentCompressionResistancePriority:forAxis:](self->_footerView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[CarShareTripFooterView setContentHuggingPriority:forAxis:](self->_footerView, "setContentHuggingPriority:forAxis:", 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharingIdentity"));

    if (v10)
    {
      -[CarNavigationShareTripModeController _updateSharingFooterWithIdentity:](self, "_updateSharingFooterWithIdentity:", v10);
    }
    else
    {
      objc_initWeak(&location, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10037A4D0;
      v12[3] = &unk_1011B3220;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v11, "refreshSharingIdentityWithCompletion:", v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarNavigationShareTripModeController;
  -[CarNavigationShareTripModeController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 != self->_lastViewSize.width || v7 != self->_lastViewSize.height)
  {
    self->_lastViewSize.width = v5;
    self->_lastViewSize.height = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView tableHeaderView](self->_tableView, "tableHeaderView"));
    -[CarNavigationShareTripModeController _updateSizeOfView:](self, "_updateSizeOfView:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView tableFooterView](self->_tableView, "tableFooterView"));
    -[CarNavigationShareTripModeController _updateSizeOfView:](self, "_updateSizeOfView:", v10);

  }
}

- (void)_updateSharingFooterWithIdentity:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  CarShareTripFooterView *v8;
  CarShareTripFooterView *footerView;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_sharingIdentity, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "handle"));
  -[CarShareTripFooterView setNameText:](self->_footerView, "setNameText:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("(%@)"), v6));
  -[CarShareTripFooterView setHandleText:](self->_footerView, "setHandleText:", v7);

  -[CarNavigationShareTripModeController _updateSizeOfView:](self, "_updateSizeOfView:", self->_footerView);
  v8 = (CarShareTripFooterView *)objc_claimAutoreleasedReturnValue(-[CarTableView tableFooterView](self->_tableView, "tableFooterView"));
  footerView = self->_footerView;

  if (v8 != footerView)
    -[CarTableView setTableFooterView:](self->_tableView, "setTableFooterView:", self->_footerView);

}

- (void)_updateSizeOfView:(id)a3
{
  CarTableView *tableView;
  CGFloat Width;
  double v5;
  double v6;
  id v7;
  CGRect v8;

  if (a3)
  {
    tableView = self->_tableView;
    v7 = a3;
    -[CarTableView bounds](tableView, "bounds");
    Width = CGRectGetWidth(v8);
    LODWORD(v5) = 1148846080;
    LODWORD(v6) = 1112014848;
    objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 1.79769313e308, v5, v6);
    objc_msgSend(v7, "frame");
    objc_msgSend(v7, "setFrame:", 0.0);

  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)invalidAfterDisconnect
{
  return 1;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10037A8A0;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10037AA10;
  v6[3] = &unk_1011ACCB8;
  v6[4] = self;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "addCompletion:", v6);

}

- (id)desiredCards
{
  const __CFString **v2;
  const __CFString *v4;
  const __CFString *v5;

  if (self->_contactSearchResultsController)
  {
    v5 = CFSTR("ShareTripContactResults");
    v2 = &v5;
  }
  else
  {
    v4 = CFSTR("ShareTrip");
    v2 = &v4;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v2, 1));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __int128 *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  char v40;
  _BYTE v41[7];
  uint64_t v42;
  char v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ShareTripContactResults")))
  {
    objc_msgSend(v6, "setContent:", self->_contactSearchResultsController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController title](self->_contactSearchResultsController, "title"));
    objc_msgSend(v6, "setTitle:", v8);

    objc_msgSend(v6, "setAccessory:", 1);
    memset(v41, 0, sizeof(v41));
    v31[0] = xmmword_100E34B90;
    v31[1] = xmmword_100E2D550;
    v32 = 3;
    v33 = 1148846080;
    v34 = 2;
    v35 = 1148846080;
    v36 = 0;
    v37 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v38 = _Q0;
    v39 = _Q0;
    v40 = 1;
    v42 = 8;
    v43 = 0;
    if (v6)
    {
      v14 = v31;
LABEL_7:
      objc_msgSend(v6, "setLayout:", v14, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ShareTrip")))
  {
    objc_msgSend(v6, "setContent:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTrip_CardTitle"), CFSTR("localized string not found"), 0));
    objc_msgSend(v6, "setTitle:", v16);

    objc_msgSend(v6, "setAccessory:", 1);
    HIDWORD(v28) = 0;
    *(_DWORD *)((char *)&v28 + 1) = 0;
    v18 = xmmword_100E34B90;
    v19 = xmmword_100E2D550;
    v20 = 3;
    v21 = 1148846080;
    v22 = 2;
    LODWORD(v23) = 1148846080;
    v24 = 0;
    v25 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v26 = _Q0;
    v27 = _Q0;
    LOBYTE(v28) = 1;
    v29 = 8;
    LOBYTE(v30) = 0;
    if (v6)
    {
      v14 = &v18;
      goto LABEL_7;
    }
  }

}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  void *v4;
  id v5;

  if (self->_contactSearchResultsController)
  {
    -[CarNavigationShareTripModeController _closeResultsController](self, "_closeResultsController", a3);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController", a3));
    objc_msgSend(v4, "captureUserAction:onTarget:", 4, 1019);

    v5 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v5, "popFromContext:", self);

  }
}

- (void)_closeResultsController
{
  CarShareTripKeyboardSearchController *contactSearchResultsController;
  id v4;

  contactSearchResultsController = self->_contactSearchResultsController;
  if (contactSearchResultsController)
  {
    self->_contactSearchResultsController = 0;

    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

  }
}

- (NSArray)carFocusOrderSequences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  void *v12;

  if (!-[CarNavigationShareTripModeController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v7, 5));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v9;
}

- (NSArray)preferredCarFocusEnvironments
{
  void *v3;
  void *v4;
  void *v6;

  if (!-[CarNavigationShareTripModeController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", self));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  CarTableView *tableView;

  if (-[CarNavigationShareTripModeController isViewLoaded](self, "isViewLoaded"))
  {
    tableView = self->_tableView;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &tableView, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[CarNavigationShareTripModeController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self->_tableView, "_car_visibleCells"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = objc_opt_class(CarUserInputCell);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);

    if ((isKindOfClass & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "focusOrderSubItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_subarrayFromIndex:", 1));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9));

    }
    else
    {
      v10 = objc_msgSend(v3, "copy");
    }

  }
  else
  {
    v10 = &__NSArray0__struct;
  }
  return (NSArray *)v10;
}

- (void)_externalDeviceUpdated:(id)a3
{
  void *v4;

  v4 = +[CarDisplayController maximumListLength](CarDisplayController, "maximumListLength", a3);
  if ((void *)-[SharedTripSuggestionsDataSource softCap](self->_dataSource, "softCap") != v4)
  {
    -[CarNavigationShareTripModeController _commitPendingShares](self, "_commitPendingShares");
    -[SharedTripSuggestionsDataSource setSoftCap:](self->_dataSource, "setSoftCap:", v4);
  }
}

- (void)_toggleSharingForContactAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:", a3));
  if (v4)
  {
    v5 = v4;
    -[SharedTripSuggestionsDataSource toggleContact:](self->_dataSource, "toggleContact:", v4);
    -[CarNavigationShareTripModeController _dismissAfterDelay](self, "_dismissAfterDelay");
    v4 = v5;
  }

}

- (void)_dismissAfterDelay
{
  NSTimer *v3;
  NSTimer *dismissTimer;
  _QWORD v5[4];
  id v6;
  id location;

  -[CarNavigationShareTripModeController _cancelDismiss](self, "_cancelDismiss");
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10037B35C;
  v5[3] = &unk_1011ADF20;
  objc_copyWeak(&v6, &location);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 7.0));
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_cancelDismiss
{
  NSTimer *dismissTimer;
  NSTimer *v4;

  dismissTimer = self->_dismissTimer;
  if (dismissTimer)
  {
    -[NSTimer invalidate](dismissTimer, "invalidate");
    v4 = self->_dismissTimer;
    self->_dismissTimer = 0;

  }
}

- (void)_commitPendingShares
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cellsByContactStringValue, "objectEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "sharingState") == (id)1)
        {
          objc_msgSend(v8, "setDelegate:", 0);
          -[CarNavigationShareTripModeController carShareTripContactCellDidFinishRingAnimation:](self, "carShareTripContactCellDidFinishRingAnimation:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)userInputCell:(id)a3 didSelectAction:(unint64_t)a4 usingInteractionModel:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  if (a4 == 1)
  {
    v9 = v8;
    -[CarNavigationShareTripModeController _requestKeyboardInputUsingInteractionModel:](self, "_requestKeyboardInputUsingInteractionModel:", a5);
    goto LABEL_5;
  }
  if (!a4)
  {
    v9 = v8;
    -[CarNavigationShareTripModeController _requestDictation](self, "_requestDictation");
LABEL_5:
    v8 = v9;
  }

}

- (void)_requestDictation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v2, "displaySiriTripSharing");

}

- (void)_displayContactResults:(id)a3 withTitle:(id)a4
{
  id v6;
  id v7;
  CarShareTripKeyboardSearchController *v8;
  CarShareTripKeyboardSearchController *contactSearchResultsController;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CarShareTripKeyboardSearchController initWithContactSearchResults:dataSource:]([CarShareTripKeyboardSearchController alloc], "initWithContactSearchResults:dataSource:", v6, self->_dataSource);
  contactSearchResultsController = self->_contactSearchResultsController;
  self->_contactSearchResultsController = v8;

  -[CarShareTripKeyboardSearchController setTitle:](self->_contactSearchResultsController, "setTitle:", v7);
  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10037B6F0;
  v14 = &unk_1011AD260;
  objc_copyWeak(&v15, &location);
  -[CarShareTripKeyboardSearchController setDismissHandler:](self->_contactSearchResultsController, "setDismissHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController", v11, v12, v13, v14));
  objc_msgSend(v10, "updateCardsForContext:animated:", self, 1);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_requestKeyboardInputUsingInteractionModel:(unint64_t)a3
{
  void *v5;
  SharedTripSuggestionsDataSource *dataSource;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  dataSource = self->_dataSource;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10037B804;
  v7[3] = &unk_1011B3248;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "displayTripSharingContactKeyboardSearchWithInteractionModel:dataSource:searchHandler:", a3, dataSource, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleContactSearchResults:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  CarNavigationShareTripModeController *v12;
  CarNavigationShareTripModeController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  CarNavigationShareTripModeController *v20;
  CarNavigationShareTripModeController *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = sub_10043237C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (!v11)
    {
LABEL_20:

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTrip_ContactResultsTitle"), CFSTR("localized string not found"), 0));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v7));
      -[CarNavigationShareTripModeController _displayContactResults:withTitle:](self, "_displayContactResults:withTitle:", v6, v29);

      goto LABEL_23;
    }
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 138543618;
    v32 = v19;
    v33 = 2048;
    v34 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] [Keyboard] Displaying %lu contact results", buf, 0x16u);

    goto LABEL_20;
  }
  if (v11)
  {
    v20 = self;
    v21 = v20;
    if (!v20)
    {
      v27 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v22 = (objc_class *)objc_opt_class(v20);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_17;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v32 = v27;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] [Keyboard] No contact results", buf, 0xCu);

  }
LABEL_23:

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v30, "popToContext:animated:completion:", self, 1, 0);

}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sharingIdentity"));
  -[CarNavigationShareTripModeController _updateWithSharingIdentity:](self, "_updateWithSharingIdentity:", v4);

}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
  -[CarNavigationShareTripModeController _updateWithSharingIdentity:](self, "_updateWithSharingIdentity:", a4);
}

- (void)_updateWithSharingIdentity:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v4 = a3;
  -[CarNavigationShareTripModeController _updateSharingFooterWithIdentity:](self, "_updateSharingFooterWithIdentity:", v4);
  v5 = objc_msgSend(v4, "hasValidAccount");

  if ((v5 & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v6, "popFromContext:", self);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  CarShareTripContactCell *v9;
  void *v10;
  NSMutableDictionary *cellsByContactStringValue;
  void *v12;
  unint64_t v13;
  CarShareTripContactCell *v14;
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
    v9 = (CarShareTripContactCell *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v12));

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
      v9 = -[CarShareTripContactCell initWithStyle:reuseIdentifier:]([CarShareTripContactCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      v18 = self->_cellsByContactStringValue;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v9, v19);

      -[CarShareTripContactCell setDelegate:](v9, "setDelegate:", self);
      -[CarShareTripContactCell configureWithMSPSharedTripContact:](v9, "configureWithMSPSharedTripContact:", v10);
      v13 = -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v10);
      v14 = v9;
      v15 = 0;
    }
    -[CarShareTripContactCell setSharingState:animated:](v14, "setSharingState:animated:", v13, v15);
LABEL_8:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    -[CarShareTripContactCell setCapabilityType:](v9, "setCapabilityType:", objc_msgSend(v20, "capabilityLevelForContact:", v10));

    goto LABEL_9;
  }
  v9 = self->_userInputCell;
LABEL_9:

  return v9;
}

- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarTableView indexPathForCell:](self->_tableView, "indexPathForCell:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:"));
  if (!-[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v4))
    -[CarNavigationShareTripModeController _toggleSharingForContactAtIndexPath:](self, "_toggleSharingForContactAtIndexPath:", v5);

}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CarNavigationShareTripModeController _cancelDismiss](self, "_cancelDismiss");
  v11 = (char *)objc_msgSend(v8, "numberOfSections");
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextFocusedIndexPath"));
    v14 = v13;
    if (v13)
    {
      v15 = (char *)objc_msgSend(v13, "section");
      v16 = (char *)objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v14, "section"));
      if (v15 == v12 - 1 && objc_msgSend(v14, "row") == v16 - 1)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10037C004;
        v17[3] = &unk_1011AC860;
        v18 = v8;
        objc_msgSend(v10, "addCoordinatedAnimations:completion:", 0, v17);

      }
    }

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:", a4));
  v5 = v4 != 0;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *cellsByContactStringValue;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  self->_userInteracted = 1;
  v6 = a3;
  -[CarNavigationShareTripModeController _cancelDismiss](self, "_cancelDismiss");
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v13, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:", v13));
  cellsByContactStringValue = self->_cellsByContactStringValue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v9));

  v11 = objc_msgSend(v10, "sharingState");
  if (v11 == (id)1)
  {
    objc_msgSend(v10, "setSharingState:animated:", -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v7), 0);
LABEL_6:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v12, "captureUserAction:", 9026);

    goto LABEL_7;
  }
  if (v11)
  {
    -[CarNavigationShareTripModeController _toggleSharingForContactAtIndexPath:](self, "_toggleSharingForContactAtIndexPath:", v13);
    goto LABEL_6;
  }
  -[CarNavigationShareTripModeController _attemptToStartShareWithContact:](self, "_attemptToStartShareWithContact:", v7);
LABEL_7:

}

- (void)_attemptToStartShareWithContact:(id)a3
{
  id v4;
  void *v5;
  MSPSharedTripSharingIdentity *sharingIdentity;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_opt_class(self);
  sharingIdentity = self->_sharingIdentity;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationShareTripModeController chromeViewController](self, "chromeViewController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10037C2D8;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v5, "attemptToStartShareWithContact:sharingIdentity:interruptPresenter:completion:", v8, sharingIdentity, v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

+ (void)attemptToStartShareWithContact:(id)a3 sharingIdentity:(id)a4 interruptPresenter:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10037C464;
  v16[3] = &unk_1011B32C0;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = a1;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v12, "fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:", v16);

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

- (int)backButtonUsageActionToMode:(id)a3
{
  return 4;
}

- (int)currentUsageTarget
{
  return 1019;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_sharingIdentity, 0);
  objc_storeStrong((id *)&self->_contactSearchResultsController, 0);
  objc_storeStrong((id *)&self->_userInputCell, 0);
  objc_storeStrong((id *)&self->_cellsByContactStringValue, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
