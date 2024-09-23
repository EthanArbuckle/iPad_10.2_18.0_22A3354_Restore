@implementation HOLocationListViewController

+ (id)viewControllerForPresentingLocationEditorForHome:(id)a3 delegate:(id)a4 customizationBlock:(id)a5
{
  id v7;
  void (**v8)(id, id);
  id v9;
  HOLocationListViewController *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  HOLocationListViewController *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v7 = a3;
  v8 = (void (**)(id, id))a5;
  v9 = a4;
  v10 = -[HOLocationListViewController initWithDelegate:]([HOLocationListViewController alloc], "initWithDelegate:", v9);

  -[HOLocationListViewController loadViewIfNeeded](v10, "loadViewIfNeeded");
  v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v10);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  if (!v7)
  {
    v20 = 0;
    if (!v8)
      goto LABEL_7;
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homes"));
  v15 = objc_msgSend(v14, "count");

  v16 = objc_msgSend(objc_alloc((Class)HFHomeBuilder), "initWithExistingObject:inHome:", v7, v7);
  v17 = objc_alloc((Class)HUEditLocationViewController);
  if ((unint64_t)v15 >= 2)
    v18 = 0;
  else
    v18 = v10;
  v19 = objc_msgSend(v17, "initWithHomeBuilder:presentationDelegate:addLocationDelegate:", v16, v10, v18);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003EC28;
  v22[3] = &unk_1000B6840;
  v23 = v11;
  v20 = v19;
  v24 = v20;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v22);

  if (v8)
LABEL_6:
    v8[2](v8, v20);
LABEL_7:

  return v11;
}

- (HOLocationListViewController)initWithDelegate:(id)a3
{
  id v4;
  HOLocationListViewController *v5;
  HOLocationListViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *homes;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *pendingInvitations;
  NSMutableDictionary *v21;
  NSMutableDictionary *invitationResponseControllersByHomeUUID;
  NSMutableDictionary *v23;
  NSMutableDictionary *homesAwaitingPendingInvitations;
  HUInvitationHelper *v25;
  HUInvitationHelper *invitationHelper;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HOLocationListViewController;
  v5 = -[HOLocationListViewController initWithStyle:](&v28, "initWithStyle:", 1);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v7, "addHomeManagerObserver:", v6);
    objc_msgSend(v7, "addHomeObserver:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homes"));

    if (!v9)
    {
      v10 = objc_opt_class(v6);
      NSLog(CFSTR("Creating %@ before the HMHomeManager has any homes!"), v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_orderedHomes"));
    v13 = (NSMutableArray *)objc_msgSend(v12, "mutableCopy");
    homes = v6->_homes;
    v6->_homes = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "homeManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incomingHomeInvitations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "na_filter:", &stru_1000B7D28));
    v19 = (NSMutableArray *)objc_msgSend(v18, "mutableCopy");
    pendingInvitations = v6->_pendingInvitations;
    v6->_pendingInvitations = v19;

    v21 = objc_opt_new(NSMutableDictionary);
    invitationResponseControllersByHomeUUID = v6->_invitationResponseControllersByHomeUUID;
    v6->_invitationResponseControllersByHomeUUID = v21;

    v23 = objc_opt_new(NSMutableDictionary);
    homesAwaitingPendingInvitations = v6->_homesAwaitingPendingInvitations;
    v6->_homesAwaitingPendingInvitations = v23;

    v25 = (HUInvitationHelper *)objc_msgSend(objc_alloc((Class)HUInvitationHelper), "initWithMode:", 0);
    invitationHelper = v6->_invitationHelper;
    v6->_invitationHelper = v25;

    -[HOLocationListViewController updateLocationSensingAvailability](v6, "updateLocationSensingAvailability");
  }

  return v6;
}

- (HOLocationListViewController)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOLocationListViewController.m"), 123, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOLocationListViewController init]",
    v6);

  return 0;
}

- (HOLocationListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("init");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOLocationListViewController.m"), 128, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOLocationListViewController initWithNibName:bundle:]",
    v8);

  return 0;
}

- (HOLocationListViewController)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("init");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOLocationListViewController.m"), 133, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOLocationListViewController initWithCoder:]",
    v7);

  return 0;
}

- (HOLocationListViewController)initWithStyle:(int64_t)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("init");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOLocationListViewController.m"), 138, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOLocationListViewController initWithStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
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
  objc_class *v12;
  NSString *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)HOLocationListViewController;
  -[HOLocationListViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setEstimatedRowHeight:", 44.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v5, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(HOLocationTableViewCell), CFSTR("HOLocationTableViewCellReuseIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(HUButtonCell), CFSTR("HUButtonCellReuseIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(HUSwitchCell), CFSTR("HUSwitchCellReuseIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(HUIncomingInvitationTableViewCell), CFSTR("HUIncomingInvitationTableViewCellReuseIdentifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  v11 = objc_opt_class(UITableViewHeaderFooterView);
  v12 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v10, "registerClass:forHeaderFooterViewReuseIdentifier:", v11, v14);

  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, self, "editButtonPressed:");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

  v19 = sub_10000D040(CFSTR("HOLocationListBackButtonTitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setBackButtonTitle:", v20);

  v22 = sub_10000D040(CFSTR("HOLocationListTitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[HOLocationListViewController setTitle:](self, "setTitle:", v23);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HOLocationListViewController;
  -[HOLocationListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[HOLocationListViewController setTableViewReady:](self, "setTableViewReady:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HOLocationListViewController;
  -[HOLocationListViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[HOLocationListViewController setTableViewReady:](self, "setTableViewReady:", 0);
}

- (void)doneButtonPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "locationListViewControllerDidFinish:", self);

}

- (void)editButtonPressed:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView", a3));
  v5 = objc_msgSend(v4, "isEditing");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setEditing:", 0);

    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, self, "editButtonPressed:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

    v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

  }
  else
  {
    objc_msgSend(v6, "setEditing:", 1);

    v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "editButtonPressed:");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v13, "setLeftBarButtonItem:", v12);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "setRightBarButtonItem:", 0);
  }

  if (-[HOLocationListViewController showAddLocationButton](self, "showAddLocationButton"))
  {
    v14 = -[HOLocationListViewController _indexOfSectionWithIdentifier:](self, "_indexOfSectionWithIdentifier:", CFSTR("HOLocationListLocationsSectionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
    v16 = (char *)objc_msgSend(v15, "numberOfRowsInSection:", v14) - 1;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v16, v14));
    v20 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    objc_msgSend(v17, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 5);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _currentSectionIdentifiers](self, "_currentSectionIdentifiers", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _pendingInvitationIdentifiers](self, "_pendingInvitationIdentifiers"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v8 = objc_msgSend(v7, "count");
    v9 = (int64_t)v8 + -[HOLocationListViewController showAddLocationButton](self, "showAddLocationButton");

  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HOLocationListHomeSensingSectionIdentifier")) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v6, "containsObject:", v5);
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  unint64_t v31;
  char *v32;
  void *v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  void *v42;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v7, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _pendingInvitationIdentifiers](self, "_pendingInvitationIdentifiers"));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
  {
    v10 = objc_msgSend(v7, "row");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v12 = objc_msgSend(v11, "count");

    if ((uint64_t)v10 < (uint64_t)v12)
    {
      v42 = v9;
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HOLocationTableViewCellReuseIdentifier"), v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

      objc_msgSend(v13, "setAccessoryType:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      objc_msgSend(v13, "setTitleText:", v16);

      if (objc_msgSend(v15, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade"))
      {
        objc_msgSend(v13, "setDisabled:", 1);
        objc_msgSend(v13, "setAccessoryType:", 0);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "homeManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentHome"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueIdentifier"));
      objc_msgSend(v13, "setShowLocationIcon:", objc_msgSend(v17, "isEqual:", v21));

      objc_msgSend(v13, "setShowsReorderControl:", 1);
      v22 = v13;
      v9 = v42;
      goto LABEL_11;
    }
    if (-[HOLocationListViewController showAddLocationButton](self, "showAddLocationButton"))
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUButtonCellReuseIdentifier"), v7));
      v27 = sub_10000D040(CFSTR("HOLocationListAddButtonTitle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "textLabel"));
      objc_msgSend(v29, "setText:", v28);

      v13 = (id)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
      objc_msgSend(v22, "setDisabled:", objc_msgSend(v13, "isEditing"));

      goto LABEL_11;
    }
LABEL_19:
    v22 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HOLocationListHomeSensingSectionIdentifier")))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUSwitchCellReuseIdentifier"), v7));
    v23 = sub_10000D040(CFSTR("HOLocationListHomeSensingTitle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textLabel"));
    objc_msgSend(v25, "setText:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v13, "setOn:", objc_msgSend(v26, "selectedHomeFollowsLocation"));

    objc_msgSend(v13, "setDelegate:", self);
  }
  else
  {
    if (!objc_msgSend(v9, "containsObject:", v8))
      goto LABEL_19;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUIncomingInvitationTableViewCellReuseIdentifier"), v7));
    if (-[HOLocationListViewController locationSensingAvailable](self, "locationSensingAvailable"))
      v30 = CFSTR("HOLocationListHomeSensingSectionIdentifier");
    else
      v30 = CFSTR("HOLocationListLocationsSectionIdentifier");
    v31 = ~-[HOLocationListViewController _indexOfSectionWithIdentifier:](self, "_indexOfSectionWithIdentifier:", v30);
    v32 = (char *)objc_msgSend(v7, "section") + v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
    v34 = (char *)objc_msgSend(v33, "count");

    if (v32 < v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", v32));

      objc_msgSend(v13, "setInvitation:", v36);
      objc_msgSend(v13, "setDelegate:", self);
      objc_msgSend(v13, "setSelectionStyle:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController invitationResponseControllersByHomeUUID](self, "invitationResponseControllersByHomeUUID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "homeUUID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v38));

      if (v39)
        v40 = -[HOLocationListViewController _showSpinnerForInvitationWithResponseControllerState:](self, "_showSpinnerForInvitationWithResponseControllerState:", objc_msgSend(v39, "state"));
      else
        v40 = objc_msgSend(v36, "invitationState") == (id)5;
      objc_msgSend(v13, "setShowSpinner:", v40);

    }
  }
  v22 = v13;
LABEL_11:

LABEL_20:
  return v22;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v5, "section")));
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
  {
    v7 = objc_msgSend(v5, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v9 = (uint64_t)v7 < (uint64_t)objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v18, "section")));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
  {
    v9 = objc_msgSend(v18, "row");
    if (v9 != objc_msgSend(v7, "row"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v18, "row")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      objc_msgSend(v12, "removeObjectAtIndex:", objc_msgSend(v18, "row"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      objc_msgSend(v13, "insertObject:atIndex:", v11, objc_msgSend(v7, "row"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      v17 = objc_msgSend(v15, "hf_setOrderedHomes:", v16);

    }
  }

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v5, "section")));
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
    goto LABEL_5;
  v7 = objc_msgSend(v5, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
  v9 = objc_msgSend(v8, "count");

  if ((uint64_t)v7 >= (uint64_t)v9)
    goto LABEL_5;
  v10 = objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  LOBYTE(v10) = objc_msgSend(v11, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");
  if ((v10 & 1) != 0)
    v12 = 0;
  else
LABEL_5:
    v12 = v5;

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  HOAddLocationViewController *v21;
  id v22;

  v22 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v22, "section")));
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
  {
    v7 = objc_msgSend(v22, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v9 = objc_msgSend(v8, "count");

    if ((uint64_t)v7 < (uint64_t)v9)
    {
      v10 = objc_alloc((Class)HFHomeBuilder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v22, "row")));
      v13 = objc_msgSend(v10, "initWithExistingObject:inHome:", 0, v12);

      v14 = objc_msgSend(objc_alloc((Class)HUEditLocationViewController), "initWithHomeBuilder:presentationDelegate:addLocationDelegate:", v13, self, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationController](self, "navigationController"));
      v16 = objc_msgSend(v15, "hu_pushPreloadableViewController:animated:", v14, 1);

LABEL_6:
      goto LABEL_7;
    }
    v17 = objc_msgSend(v22, "row");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v19 = objc_msgSend(v18, "count");

    if (v17 == v19)
    {
      v20 = objc_alloc((Class)UINavigationController);
      v21 = -[HOAddLocationViewController initWithName:delegate:]([HOAddLocationViewController alloc], "initWithName:delegate:", 0, self);
      v13 = objc_msgSend(v20, "initWithRootViewController:", v21);

      objc_msgSend(v13, "setModalPresentationStyle:", 2);
      -[HOLocationListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  void *v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  id v18;
  char *v19;
  void *v20;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v8, "section")));
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")))
  {
LABEL_4:
    v15 = v9;
    goto LABEL_5;
  }
  v11 = objc_msgSend(v8, "section");
  if (v11 == objc_msgSend(v9, "section"))
  {
    v12 = objc_msgSend(v9, "row");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v14 = objc_msgSend(v13, "count");

    if ((uint64_t)v12 >= (uint64_t)v14)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v20, "count") - 1, objc_msgSend(v8, "section")));

      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v17 = objc_msgSend(v9, "section");
  v18 = objc_msgSend(v8, "section");
  if ((uint64_t)v17 <= (uint64_t)v18)
  {
    v19 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v19 = (char *)objc_msgSend(v5, "count") - 1;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v19, objc_msgSend(v8, "section")));
  if ((uint64_t)v17 > (uint64_t)v18)

LABEL_5:
  return v15;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _pendingInvitationIdentifiers](self, "_pendingInvitationIdentifiers"));
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HOLocationListLocationsSectionIdentifier")) & 1) != 0)
  {
    v10 = CFSTR("HOLocationListLocationsSection");
LABEL_6:
    v12 = sub_10000D040(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v7, "setText:", v11);
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "indexOfObject:", v8))
  {
    v10 = CFSTR("HOLocationListInvitationsSection");
    goto LABEL_6;
  }
  v11 = v7;
  v7 = 0;
LABEL_7:

  v13 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v15));

  objc_msgSend(v16, "setContentConfiguration:", v7);
  return v16;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _pendingInvitationIdentifiers](self, "_pendingInvitationIdentifiers"));
  v10 = objc_msgSend(v9, "indexOfObject:", v8);
  if (v10 == (char *)objc_msgSend(v9, "count") - 1)
  {
    v11 = CFSTR("HOLocationListInvitationsSectionFooter");
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("HOLocationListHomeSensingSectionIdentifier")))
    {
      v13 = v7;
      v7 = 0;
      goto LABEL_7;
    }
    v11 = CFSTR("HOLocationListHomeSensingSectionFooter");
  }
  v12 = sub_10000D040(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v7, "setText:", v13);
LABEL_7:

  v14 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v16));

  objc_msgSend(v17, "setContentConfiguration:", v7);
  return v17;
}

- (void)homeManagerDidFinishUnknownChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_orderedHomes"));
  v5 = objc_msgSend(v4, "mutableCopy");
  -[HOLocationListViewController setHomes:](self, "setHomes:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v5 = a4;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[HOLocationListViewController homeManager:didAddHome:]";
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100040788;
  v17[3] = &unk_1000B7D50;
  v9 = v5;
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_firstObjectPassingTest:", v17));

  if (v10 && (objc_msgSend(v10, "invitationState") == (id)2 || objc_msgSend(v10, "invitationState") == (id)5))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homesAwaitingPendingInvitations](self, "homesAwaitingPendingInvitations"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
    objc_msgSend(v11, "setObject:forKey:", v9, v12);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    objc_msgSend(v13, "addObject:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    v15 = objc_msgSend(v12, "hf_setOrderedHomes:", v14);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v16, "reloadData");

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000408F8;
  v12[3] = &unk_1000B7D78;
  v13 = v5;
  v11 = v5;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v12);

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    NSLog(CFSTR("Received didRemoveHome: event for unknown home: %@"), v9);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
    objc_msgSend(v10, "removeObjectAtIndex:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
    objc_msgSend(v8, "reloadData");
  }

}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  void *v58;
  void *v59;
  _BYTE v60[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "beginUpdates");

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    do
    {
      v10 = 0;
      v51 = v8;
      do
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v10);
        if (objc_msgSend(v11, "invitationState", v51) == (id)3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homesAwaitingPendingInvitations](self, "homesAwaitingPendingInvitations"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUUID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v13));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homesAwaitingPendingInvitations](self, "homesAwaitingPendingInvitations"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v17));
            objc_msgSend(v15, "addObject:", v18);

            v19 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "homeManager"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
            v22 = objc_msgSend(v20, "hf_setOrderedHomes:", v21);

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homesAwaitingPendingInvitations](self, "homesAwaitingPendingInvitations"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUUID"));
            objc_msgSend(v23, "removeObjectForKey:", v24);

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v26, "count") - 1, -[HOLocationListViewController _indexOfSectionWithIdentifier:](self, "_indexOfSectionWithIdentifier:", CFSTR("HOLocationListLocationsSectionIdentifier"))));
            v59 = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
            objc_msgSend(v25, "insertRowsAtIndexPaths:withRowAnimation:", v28, 0);

          }
        }
        if (objc_msgSend(v11, "invitationState") != (id)2 && objc_msgSend(v11, "invitationState") != (id)5)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
          v45 = objc_msgSend(v44, "indexOfObject:", v11);

          if (v45 == (id)0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_19;
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _indexPathForPendingInvitation:](self, "_indexPathForPendingInvitation:", v11));
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
          objc_msgSend(v46, "removeObjectAtIndex:", v45);

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
          v58 = v42;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
          objc_msgSend(v47, "deleteRowsAtIndexPaths:withRowAnimation:", v48, 0);

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v42, "section")));
          objc_msgSend(v43, "deleteSections:withRowAnimation:", v49, 0);

          goto LABEL_18;
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
        v30 = objc_msgSend(v29, "indexOfObject:", v11);

        if (-[HOLocationListViewController locationSensingAvailable](self, "locationSensingAvailable"))
          v31 = CFSTR("HOLocationListHomeSensingSectionIdentifier");
        else
          v31 = CFSTR("HOLocationListLocationsSectionIdentifier");
        v32 = -[HOLocationListViewController _indexOfSectionWithIdentifier:](self, "_indexOfSectionWithIdentifier:", v31);
        if (v30 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v33 = v32 + 1;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
          v35 = (char *)objc_msgSend(v34, "count");

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
          objc_msgSend(v36, "addObject:", v11);

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", &v35[v33]));
          objc_msgSend(v37, "insertSections:withRowAnimation:", v38, 0);

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _indexPathForPendingInvitation:](self, "_indexPathForPendingInvitation:", v11));
          v57 = v40;
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
          objc_msgSend(v39, "insertRowsAtIndexPaths:withRowAnimation:", v41, 0);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
          v8 = v51;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v33, v35));
          objc_msgSend(v42, "_reloadSectionHeaderFooters:withRowAnimation:", v43, 0);
LABEL_18:

        }
LABEL_19:
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v8);
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
  objc_msgSend(v50, "endUpdates");

}

- (void)homeDidUpdateName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController homes](self, "homes"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041040;
  v11[3] = &unk_1000B7D78;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

  }
}

- (void)editLocationViewControllerWouldPresentAddController:(id)a3
{
  id v4;
  HOAddLocationViewController *v5;
  id v6;

  v4 = objc_alloc((Class)UINavigationController);
  v5 = -[HOAddLocationViewController initWithName:delegate:]([HOAddLocationViewController alloc], "initWithName:delegate:", 0, self);
  v6 = objc_msgSend(v4, "initWithRootViewController:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[HOLocationListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "locationListViewControllerDidFinish:", self);

  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (void)addLocationViewController:(id)a3 didFinishWithHome:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));
    v9 = objc_msgSend(v8, "isEqual:", self);

    if ((v9 & 1) == 0)
    {
      v10 = objc_msgSend(objc_alloc((Class)HFHomeBuilder), "initWithExistingObject:inHome:", 0, v6);
      v11 = objc_msgSend(objc_alloc((Class)HUEditLocationViewController), "initWithHomeBuilder:presentationDelegate:addLocationDelegate:", v10, self, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationController](self, "navigationController"));
      v13 = objc_msgSend(v12, "popToRootViewControllerAnimated:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController navigationController](self, "navigationController"));
      v15 = objc_msgSend(v14, "hu_pushPreloadableViewController:animated:", v11, 0);

    }
  }
  -[HOLocationListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher", a3));
  objc_msgSend(v6, "setSelectedHomeFollowsLocation:", v4);

  +[HFAnalytics sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:](HFAnalytics, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", 0, v4, CFSTR("HOLocationListHomeSensingTitle"), self);
}

- (void)invitationCell:(id)a3 didRespondToInvitationWithResponse:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  HOOnboardingIncomingInvitationViewController *v46;
  id v47;
  id v48;
  __CFString *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  unsigned int v53;
  __CFString *v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  id v77[2];
  _QWORD v78[4];
  id v79;
  id v80[2];
  _QWORD v81[4];
  id v82;
  id v83;
  id v84[3];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "invitation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController invitationResponseControllersByHomeUUID](self, "invitationResponseControllersByHomeUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeUUID"));
    NSLog(CFSTR("Already have a response controller for invitation %@!"), v12);

  }
  else if (a4 == 4)
  {
    v29 = HFLogForCategory(69);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_prettyDescription"));
      *(_DWORD *)buf = 138412290;
      v86 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Confirming report junk for invitation %@", buf, 0xCu);

    }
    v32 = HULocalizedString(CFSTR("HUUserManagementReportJunkAlertBody"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v33, 0, 0));

    objc_initWeak((id *)buf, self);
    v35 = HULocalizedString(CFSTR("HUUserManagementReportJunkAlertButton"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100042138;
    v75[3] = &unk_1000B7DC8;
    objc_copyWeak(v77, (id *)buf);
    v76 = v8;
    v77[1] = (id)4;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v36, 2, v75));

    v38 = HULocalizedString(CFSTR("HUUserManagementCancelButton"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100042294;
    v73[3] = &unk_1000B6140;
    v40 = v34;
    v74 = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v39, 1, v73));

    objc_msgSend(v40, "addAction:", v37);
    objc_msgSend(v40, "addAction:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "popoverPresentationController"));
    objc_msgSend(v42, "setSourceView:", v7);
    -[HOLocationListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v40, 1, 0);

    objc_destroyWeak(v77);
    objc_destroyWeak((id *)buf);

  }
  else if (a4 == 1)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "invitationHelper"));
    if (objc_msgSend(v72, "isUnknownContact"))
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[HUInvitationHelper dateFormatter](HUInvitationHelper, "dateFormatter"));
      v13 = objc_msgSend(v69, "copy");
      objc_msgSend(v13, "setDateStyle:", 1);
      objc_msgSend(v13, "setTimeStyle:", 0);
      objc_msgSend(v13, "setDoesRelativeDateFormatting:", 1);
      v61 = v13;
      v14 = objc_msgSend(v13, "copy");
      objc_msgSend(v14, "setDateStyle:", 0);
      v62 = v14;
      objc_msgSend(v14, "setTimeStyle:", 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "startOfDayForDate:", v70));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate hf_dateByAddingDays:toDate:](NSDate, "hf_dateByAddingDays:toDate:", -1, v15));

      v65 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v66, v70);
      v16 = HFLogForCategory(69);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_prettyDescription"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "inviterContact"));
        *(_DWORD *)buf = 138412546;
        v86 = v18;
        v87 = 2112;
        v88 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Confirming invitation %@ from unknown contact %@", buf, 0x16u);

      }
      v20 = sub_10000D040(CFSTR("HOLocationListInvitationAlertTitle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeName"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v22));

      if (objc_msgSend(v65, "containsDate:", v71))
      {
        v23 = sub_10000D040(CFSTR("HOLocationListInvitationAlertBody_RelativeDate"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stringFromDate:", v71));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "stringFromDate:", v71));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "inviterContact"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "givenName"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@ %@ %@"), 0, v25, v26, v28));

      }
      else
      {
        v49 = sub_10000D040(CFSTR("HOLocationListInvitationAlertBody_OtherDate"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "stringFromDate:", v71));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "inviterContact"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "givenName"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@ %@"), 0, v25, v27));
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v64, v63, 1));
      objc_initWeak((id *)buf, self);
      v51 = sub_10000D040(CFSTR("HOLocationListInvitationAlertAccept"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "invitation"));
        v53 = objc_msgSend(v52, "isInviteeRestrictedGuest");

        if (v53)
        {
          v54 = sub_10000D040(CFSTR("HOWelcomeView_Button_Continue"));
          v55 = objc_claimAutoreleasedReturnValue(v54);

          v68 = (void *)v55;
        }
      }
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_100041CEC;
      v81[3] = &unk_1000B7DA0;
      objc_copyWeak(v84, (id *)buf);
      v84[1] = (id)a2;
      v82 = v72;
      v83 = v8;
      v84[2] = (id)1;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v68, 0, v81));
      v57 = sub_10000D040(CFSTR("HOLocationListInvitationAlertCancel"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_10004204C;
      v78[3] = &unk_1000B7DC8;
      objc_copyWeak(v80, (id *)buf);
      v80[1] = (id)a2;
      v59 = v50;
      v79 = v59;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v58, 1, v78));

      objc_msgSend(v59, "addAction:", v60);
      objc_msgSend(v59, "addAction:", v56);
      -[HOLocationListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v59, 1, 0);

      objc_destroyWeak(v80);
      objc_destroyWeak(v84);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v46 = -[HOOnboardingIncomingInvitationViewController initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:]([HOOnboardingIncomingInvitationViewController alloc], "initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:", v8, v72, self);
      -[HOOnboardingIncomingInvitationViewController setDelegate:](v46, "setDelegate:", self);
      v47 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v46);
      v48 = -[HOLocationListViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v47, 1);

    }
  }
  else
  {
    v43 = objc_msgSend(objc_alloc((Class)HUIncomingInvitationResponseController), "initWithDelegate:invitation:", self, v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController invitationResponseControllersByHomeUUID](self, "invitationResponseControllersByHomeUUID"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeUUID"));
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v45);

    objc_msgSend(v43, "respondToInvitationWithResponse:", a4);
  }

}

- (void)invitationViewControllerDidAcceptInvitation:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)invitationViewControllerDidDeclineInvitation:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)invitationViewControllerDidIgnoreInvitation:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(69);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[HOLocationListViewController invitationViewControllerDidDecideLaterInvitation:error:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Deciding later for invitation | viewController %@ | error %@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 1));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042504;
  v13[3] = &unk_1000B7DF0;
  v14 = v7;
  v11 = v7;
  v12 = objc_msgSend(v10, "addCompletionBlock:", v13);

}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3
{
  -[HOLocationListViewController invitationViewControllerDidDecideLaterInvitation:error:](self, "invitationViewControllerDidDecideLaterInvitation:error:", a3, 0);
}

- (void)invitationViewControllerDidReportJunkInvitation:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = HFLogForCategory(69);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HUStringFromIncomingInvitationResponseControllerState(objc_msgSend(v6, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315650;
    v30 = "-[HOLocationListViewController invitationResponseController:stateDidChange:]";
    v31 = 2114;
    v32 = v10;
    v33 = 2112;
    v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", buf, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v15 = objc_msgSend(v13, "indexOfObject:", v14);

  if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _indexPathForPendingInvitation:](self, "_indexPathForPendingInvitation:", v16));

    v18 = objc_opt_class(HUIncomingInvitationTableViewCell);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController tableView](self, "tableView"));
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellForRowAtIndexPath:", v17));
    v21 = v20;
    if (v20)
    {
      if ((objc_opt_isKindOfClass(v20, v18) & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;
      if (!v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v18, objc_opt_class(v21));

      }
    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(v23, "setShowSpinner:", -[HOLocationListViewController _showSpinnerForInvitationWithResponseControllerState:](self, "_showSpinnerForInvitationWithResponseControllerState:", a4));
    if (a4 == 2)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController invitationResponseControllersByHomeUUID](self, "invitationResponseControllersByHomeUUID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "homeUUID"));
      objc_msgSend(v26, "removeObjectForKey:", v28);

    }
  }

}

- (BOOL)_showSpinnerForInvitationWithResponseControllerState:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (id)_currentSectionIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", CFSTR("HOLocationListLocationsSectionIdentifier")));
  if (-[HOLocationListViewController locationSensingAvailable](self, "locationSensingAvailable"))
    objc_msgSend(v3, "addObject:", CFSTR("HOLocationListHomeSensingSectionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_map:", &stru_1000B7E10));
    objc_msgSend(v3, "na_safeAddObjectsFromArray:", v7);

  }
  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _currentSectionIdentifiers](self, "_currentSectionIdentifiers"));
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%ld), but only have (%ld) sections"), a3, objc_msgSend(v4, "count"));
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (unint64_t)_indexOfSectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController _currentSectionIdentifiers](self, "_currentSectionIdentifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100042A9C;
  v9[3] = &unk_1000B7E38;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return (unint64_t)v7;
}

- (id)_pendingInvitationIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOLocationListViewController pendingInvitations](self, "pendingInvitations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "na_map:", &stru_1000B7E58));

  return v3;
}

- (id)_indexPathForPendingInvitation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, -[HOLocationListViewController _indexOfSectionWithIdentifier:](self, "_indexOfSectionWithIdentifier:", v5)));

  return v6;
}

- (BOOL)showAddLocationButton
{
  if ((+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode") & 1) != 0)
    return 0;
  else
    return +[HFUtilities isAMac](HFUtilities, "isAMac") ^ 1;
}

- (void)updateLocationSensingAvailability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationSensingAvailableFuture"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reschedule:", v4));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042CF4;
  v7[3] = &unk_1000B7E80;
  objc_copyWeak(&v8, &location);
  v6 = objc_msgSend(v5, "addCompletionBlock:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (HOLocationListViewControllerDelegate)delegate
{
  return (HOLocationListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_storeStrong((id *)&self->_homes, a3);
}

- (NSMutableArray)pendingInvitations
{
  return self->_pendingInvitations;
}

- (void)setPendingInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInvitations, a3);
}

- (NSMutableDictionary)homesAwaitingPendingInvitations
{
  return self->_homesAwaitingPendingInvitations;
}

- (void)setHomesAwaitingPendingInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_homesAwaitingPendingInvitations, a3);
}

- (NSMutableDictionary)invitationResponseControllersByHomeUUID
{
  return self->_invitationResponseControllersByHomeUUID;
}

- (void)setInvitationResponseControllersByHomeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_invitationResponseControllersByHomeUUID, a3);
}

- (BOOL)tableViewReady
{
  return self->_tableViewReady;
}

- (void)setTableViewReady:(BOOL)a3
{
  self->_tableViewReady = a3;
}

- (BOOL)locationSensingAvailable
{
  return self->_locationSensingAvailable;
}

- (void)setLocationSensingAvailable:(BOOL)a3
{
  self->_locationSensingAvailable = a3;
}

- (HUInvitationHelper)invitationHelper
{
  return self->_invitationHelper;
}

- (void)setInvitationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_invitationHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitationResponseControllersByHomeUUID, 0);
  objc_storeStrong((id *)&self->_homesAwaitingPendingInvitations, 0);
  objc_storeStrong((id *)&self->_pendingInvitations, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
