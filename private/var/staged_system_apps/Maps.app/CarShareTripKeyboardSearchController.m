@implementation CarShareTripKeyboardSearchController

- (CarShareTripKeyboardSearchController)initWithContactSearchResults:(id)a3 dataSource:(id)a4
{
  return -[CarShareTripKeyboardSearchController initWithContactSearchResults:dataSource:searchHandler:](self, "initWithContactSearchResults:dataSource:searchHandler:", a3, a4, 0);
}

- (CarShareTripKeyboardSearchController)initWithContactSearchResults:(id)a3 dataSource:(id)a4 searchHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CarShareTripKeyboardSearchController *v11;
  CarShareTripKeyboardSearchController *v12;
  id v13;
  id searchHandler;
  uint64_t v15;
  NSOrderedSet *matches;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSSet *v22;
  NSSet *alreadySharingHandles;
  NSMutableDictionary *v24;
  NSMutableDictionary *cellsByContactStringValue;
  MapsThrottler *v26;
  id v27;
  MapsThrottler *v28;
  MapsThrottler *inputThrottler;
  void *v30;
  void *v31;
  void **v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, void *, void *);
  void *v36;
  id v37;
  id location;
  objc_super v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)CarShareTripKeyboardSearchController;
  v11 = -[CarShareTripKeyboardSearchController initWithNibName:bundle:](&v39, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a4);
    v13 = objc_msgSend(v10, "copy");
    searchHandler = v12->_searchHandler;
    v12->_searchHandler = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v8));
    matches = v12->_matches;
    v12->_matches = (NSOrderedSet *)v15;

    v17 = objc_alloc((Class)NSSet);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "receivers"));
    v20 = sub_10039DCD4(v19, &stru_1011DD8B8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (NSSet *)objc_msgSend(v17, "initWithArray:", v21);
    alreadySharingHandles = v12->_alreadySharingHandles;
    v12->_alreadySharingHandles = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellsByContactStringValue = v12->_cellsByContactStringValue;
    v12->_cellsByContactStringValue = v24;

    objc_initWeak(&location, v12);
    v26 = [MapsThrottler alloc];
    v27 = &_dispatch_main_q;
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_1009A29A0;
    v36 = &unk_1011DD8E0;
    objc_copyWeak(&v37, &location);
    v28 = -[MapsThrottler initWithInitialValue:throttlingInterval:queue:updateHandler:](v26, "initWithInitialValue:throttlingInterval:queue:updateHandler:", 0, &_dispatch_main_q, &v33, 1.0);
    inputThrottler = v12->_inputThrottler;
    v12->_inputThrottler = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance", v33, v34, v35, v36));
    objc_msgSend(v30, "addSendingObserver:", v12);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    objc_msgSend(v31, "registerObserver:", v12);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)viewDidLoad
{
  CarTableView *v3;
  void *v4;
  CarTableView *v5;
  CarTableView *tableView;
  void *v7;
  void *v8;
  CarTableView *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CarShareTripKeyboardSearchController;
  -[CarShareTripKeyboardSearchController viewDidLoad](&v15, "viewDidLoad");
  v3 = [CarTableView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = -[CarTableView initWithFrame:style:](v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  -[CarTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarTableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[CarTableView setDataSource:](self->_tableView, "setDataSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  -[CarTableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
  -[CarTableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(CarShareTripContactCell), CFSTR("ContactCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_tableView);

  v9 = self->_tableView;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "safeAreaLayoutGuide"));
  LODWORD(v12) = 1148846080;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v9, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v11, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarShareTripKeyboardSearchController;
  -[CarShareTripKeyboardSearchController viewWillAppear:](&v8, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009A2C88;
  v5[3] = &unk_1011B3220;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "refreshSharingIdentityWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarShareTripKeyboardSearchController;
  -[CarShareTripKeyboardSearchController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[CarShareTripKeyboardSearchController _commitPendingShares](self, "_commitPendingShares");
  -[CarShareTripKeyboardSearchController _cancelDismiss](self, "_cancelDismiss");
}

- (void)updateForInteractionModel:(unint64_t)a3
{
  -[CarTableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", a3 != 1);
}

- (void)handleSearchButtonPressedWithText:(id)a3
{
  void *v4;
  void *v5;
  id searchHandler;
  void (**v7)(id, id, void *);
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController keyboardMode](self, "keyboardMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  objc_msgSend(v5, "captureUserAction:", 2014);

  searchHandler = self->_searchHandler;
  if (searchHandler)
  {
    v7 = (void (**)(id, id, void *))objc_retainBlock(searchHandler);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet array](self->_matches, "array"));
    v7[2](v7, v9, v8);

  }
}

- (void)handleCancelButtonPressed
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController keyboardMode](self, "keyboardMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  objc_msgSend(v2, "captureUserAction:", 2003);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  MapsThrottler *inputThrottler;
  int v10;
  void *v11;
  __int16 v12;
  MapsThrottler *v13;

  v4 = a3;
  if (objc_msgSend(v4, "isActive"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

    -[MapsThrottler setValue:](self->_inputThrottler, "setValue:", v6);
    v7 = sub_10043237C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      inputThrottler = self->_inputThrottler;
      v10 = 138478083;
      v11 = v6;
      v12 = 2112;
      v13 = inputThrottler;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updating input to '%{private}@' (throttler: %@)", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_updateSearchResults:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSOrderedSet *v8;
  NSOrderedSet *matches;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_10043237C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138477827;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Searching for '%{private}@'", (uint8_t *)&v10, 0xCu);
  }

  -[CarTableView scrollRectToVisible:animated:](self->_tableView, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
  if (objc_msgSend(v4, "length"))
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact _maps_contactsMatchingQuery:](MSPSharedTripContact, "_maps_contactsMatchingQuery:", v4));
  else
    v7 = &__NSArray0__struct;
  v8 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v7));
  matches = self->_matches;
  self->_matches = v8;

  -[CarTableView reloadData](self->_tableView, "reloadData");
}

- (void)_cancelCapabilitiesForUpdatedMatches:(id)a3 previousMatches:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v5));
    if (objc_msgSend(v10, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
      objc_msgSend(v6, "minusSet:", v7);

    }
    if (objc_msgSend(v6, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
      objc_msgSend(v8, "cancelCapabilityLevelRequestForContacts:", v9);

    }
  }

}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  id v5;
  NSOrderedSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  NSMutableDictionary *cellsByContactStringValue;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_matches;
  v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue", (_QWORD)v17));
        if (objc_msgSend(v5, "containsObject:", v12))
        {
          cellsByContactStringValue = self->_cellsByContactStringValue;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v14));

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
          objc_msgSend(v15, "setCapabilityType:", objc_msgSend(v16, "capabilityLevelForContact:", v11));

        }
      }
      v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)_toggleSharingForContactAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", objc_msgSend(a3, "row")));
  if (v4)
  {
    v5 = v4;
    -[SharedTripSuggestionsDataSource toggleContact:](self->_dataSource, "toggleContact:", v4);
    -[CarShareTripKeyboardSearchController _dismissAfterDelay](self, "_dismissAfterDelay");
    v4 = v5;
  }

}

- (void)_dismissAfterDelay
{
  void *v3;
  NSTimer *v4;
  NSTimer *dismissTimer;
  _QWORD v6[4];
  id v7;
  id location;

  -[CarShareTripKeyboardSearchController _cancelDismiss](self, "_cancelDismiss");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController dismissHandler](self, "dismissHandler"));

  if (v3)
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009A3488;
    v6[3] = &unk_1011ADF20;
    objc_copyWeak(&v7, &location);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 7.0));
    dismissTimer = self->_dismissTimer;
    self->_dismissTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
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
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cellsByContactStringValue, "objectEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "sharingState") == (id)1)
        {
          objc_msgSend(v8, "setDelegate:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView indexPathForCell:](self->_tableView, "indexPathForCell:", v8));
          -[CarShareTripKeyboardSearchController _commitShareForCellAtIndexPath:](self, "_commitShareForCellAtIndexPath:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSOrderedSet count](self->_matches, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  NSMutableDictionary *cellsByContactStringValue;
  void *v7;
  CarShareTripContactSearchResultCell *v8;
  unint64_t v9;
  CarShareTripContactSearchResultCell *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3)));
  cellsByContactStringValue = self->_cellsByContactStringValue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  v8 = (CarShareTripContactSearchResultCell *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v7));

  if (v8)
  {
    v9 = -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v5);
    v10 = v8;
    v11 = 1;
LABEL_5:
    -[CarShareTripContactCell setSharingState:animated:](v10, "setSharingState:animated:", v9, v11);
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  v13 = objc_msgSend(v12, "length");

  v8 = -[CarShareTripContactCell initWithStyle:reuseIdentifier:]([CarShareTripContactSearchResultCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
  if (v13)
  {
    v14 = self->_cellsByContactStringValue;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v8, v15);

    -[CarShareTripContactCell setDelegate:](v8, "setDelegate:", self);
    -[CarShareTripContactSearchResultCell configureWithMSPSharedTripContact:](v8, "configureWithMSPSharedTripContact:", v5);
    v9 = -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v5);
    v10 = v8;
    v11 = 0;
    goto LABEL_5;
  }
LABEL_6:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
  -[CarShareTripContactCell setCapabilityType:](v8, "setCapabilityType:", objc_msgSend(v16, "capabilityLevelForContact:", v5));

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "contactValue", a3));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    v8 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    objc_msgSend(v6, "requestCapabilityLevelsForContacts:", v7);

  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "contactValue", a3));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    objc_msgSend(v5, "cancelCapabilityLevelRequestForContact:", v6);

  }
}

- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarTableView indexPathForCell:](self->_tableView, "indexPathForCell:", a3));
  -[CarShareTripKeyboardSearchController _commitShareForCellAtIndexPath:](self, "_commitShareForCellAtIndexPath:", v4);

}

- (void)_commitShareForCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
    if (!-[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v5))
      -[CarShareTripKeyboardSearchController _toggleSharingForContactAtIndexPath:](self, "_toggleSharingForContactAtIndexPath:", v6);

    v4 = v6;
  }

}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[CarShareTripKeyboardSearchController _cancelDismiss](self, "_cancelDismiss");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextFocusedIndexPath"));

  v12 = (char *)objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v11, "section"));
  if (objc_msgSend(v11, "row") == v12 - 1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1009A3AD0;
    v13[3] = &unk_1011AC860;
    v14 = v8;
    objc_msgSend(v9, "addCoordinatedAnimations:completion:", 0, v13);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *cellsByContactStringValue;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  self->_userInteracted = 1;
  v6 = a3;
  -[CarShareTripKeyboardSearchController _cancelDismiss](self, "_cancelDismiss");
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v15, 1);

  v7 = objc_msgSend(v15, "row");
  if (v7 < (id)-[NSOrderedSet count](self->_matches, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", v7));
    cellsByContactStringValue = self->_cellsByContactStringValue;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cellsByContactStringValue, "objectForKey:", v10));

    v12 = objc_msgSend(v11, "sharingState");
    if (v12 == (id)1)
    {
      objc_msgSend(v11, "setSharingState:animated:", -[SharedTripSuggestionsDataSource sharingStateForContact:](self->_dataSource, "sharingStateForContact:", v8), 0);
    }
    else
    {
      if (!v12)
      {
        -[CarShareTripKeyboardSearchController _attemptToStartShareWithContact:](self, "_attemptToStartShareWithContact:", v8);
LABEL_8:

        goto LABEL_9;
      }
      -[CarShareTripKeyboardSearchController _toggleSharingForContactAtIndexPath:](self, "_toggleSharingForContactAtIndexPath:", v15);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController keyboardMode](self, "keyboardMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
    objc_msgSend(v14, "captureUserAction:", 9026);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)_attemptToStartShareWithContact:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  MSPSharedTripSharingIdentity *v9;
  void *v10;
  MSPSharedTripSharingIdentity *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  MSPSharedTripSharingIdentity *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1009A3E5C;
  v19[3] = &unk_1011AD1E8;
  objc_copyWeak(&v21, &location);
  v5 = v4;
  v20 = v5;
  v6 = objc_retainBlock(v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController keyboardMode](self, "keyboardMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));

  v9 = self->_sharingIdentity;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009A3F18;
  v14[3] = &unk_1011DD930;
  objc_copyWeak(&v18, &location);
  v14[4] = self;
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  v13 = v6;
  v17 = v13;
  objc_msgSend(v10, "fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
  -[CarTableView reloadData](self->_tableView, "reloadData", a3, a4);
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_storeStrong((id *)&self->_sharingIdentity, a4);
  if ((objc_msgSend(v8, "hasValidAccount") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripKeyboardSearchController keyboardMode](self, "keyboardMode"));
    objc_msgSend(v6, "popFromContext:", v7);

  }
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  -[CarTableView reloadData](self->_tableView, "reloadData", a3, a4);
}

- (NSArray)focusOrderSubItems
{
  void *v3;

  if (-[CarShareTripKeyboardSearchController isViewLoaded](self, "isViewLoaded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self->_tableView, "_car_visibleCells"));
  else
    v3 = &__NSArray0__struct;
  return (NSArray *)v3;
}

- (CarKeyboardModeController)keyboardMode
{
  return (CarKeyboardModeController *)objc_loadWeakRetained((id *)&self->_keyboardMode);
}

- (void)setKeyboardMode:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardMode, a3);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_destroyWeak((id *)&self->_keyboardMode);
  objc_storeStrong((id *)&self->_inputThrottler, 0);
  objc_storeStrong(&self->_searchHandler, 0);
  objc_storeStrong((id *)&self->_cellsByContactStringValue, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alreadySharingHandles, 0);
  objc_storeStrong((id *)&self->_sharingIdentity, 0);
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
