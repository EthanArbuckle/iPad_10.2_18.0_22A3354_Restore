@implementation CHAddFriendViewController

- (CHAddFriendViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4
{
  id v7;
  id v8;
  CHAddFriendViewController *v9;
  CHAddFriendViewController *v10;
  void *v11;
  uint64_t v12;
  NSArray *currentFriendDestinations;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *reachabilityManagers;
  CHInvitationDestinationCoordinator *v18;
  CHInvitationDestinationCoordinator *invitationDestinationCoordinator;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CHAddFriendViewController;
  v9 = -[CHAddFriendViewController init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_friendListManager, a3);
    objc_storeStrong((id *)&v10->_friendManager, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager allDestinationsForActiveOrPendingFriends](v10->_friendListManager, "allDestinationsForActiveOrPendingFriends"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    currentFriendDestinations = v10->_currentFriendDestinations;
    v10->_currentFriendDestinations = (NSArray *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ASReachabilityManager sharedInstanceForServiceIdentifier:](ASReachabilityManager, "sharedInstanceForServiceIdentifier:", kASiCloudServiceIdentifier));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ASReachabilityManager sharedInstanceForServiceIdentifier:](ASReachabilityManager, "sharedInstanceForServiceIdentifier:", kASiMessageServiceIdentifier));
    v23[0] = v14;
    v23[1] = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
    reachabilityManagers = v10->_reachabilityManagers;
    v10->_reachabilityManagers = (NSArray *)v16;

    v18 = objc_alloc_init(CHInvitationDestinationCoordinator);
    invitationDestinationCoordinator = v10->_invitationDestinationCoordinator;
    v10->_invitationDestinationCoordinator = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
    objc_msgSend(v20, "addListenerID:capabilities:", CFSTR("com.apple.Fitness.listener"), kFZListenerCapAccounts);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v3, "removeListenerID:", CFSTR("com.apple.Fitness.listener"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CHAddFriendViewController;
  -[CHAddFriendViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNComposeRecipientTextView *recipientView;
  void *v10;
  void *v11;
  CNAutocompleteSearchManager *v12;
  CNAutocompleteSearchManager *searchManager;
  NSArray *v14;
  NSArray *currentAccountAddresses;
  CNContactPickerViewController *v16;
  CNContactPickerViewController *peoplePicker;
  id v18;
  double y;
  double width;
  double height;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  UIColor *v32;
  UIColor *separatorColor;
  void *v34;
  void *v35;
  CNMonogrammer *v36;
  CNMonogrammer *monogrammer;
  NSPredicate *v38;
  NSPredicate *recipientArrayFilterPredicate;
  NSMutableArray *v40;
  NSMutableArray *pendingSearchResults;
  CNAutocompleteFetchContext *v42;
  CNAutocompleteFetchContext *context;
  CNAutocompleteFetchContext *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  NSDictionary *v51;
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
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  _QWORD v72[5];
  objc_super v73;
  _QWORD v74[2];

  v73.receiver = self;
  v73.super_class = (Class)CHAddFriendViewController;
  -[CHAddFriendViewController viewDidLoad](&v73, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARE_ACTIVITY"), &stru_1007AE1D0, CFSTR("Localizable")));
  objc_msgSend(v5, "setTitle:", v7);

  v71 = objc_alloc_init((Class)CNComposeRecipientTextView);
  -[CHAddFriendViewController setRecipientView:](self, "setRecipientView:", v71);
  -[CNComposeRecipientTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_recipientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNComposeRecipientTextView setEditable:](self->_recipientView, "setEditable:", 1);
  -[CNComposeRecipientTextView setAddresses:](self->_recipientView, "setAddresses:", &__NSArray0__struct);
  -[CNComposeRecipientTextView setDelegate:](self->_recipientView, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView addButton](self->_recipientView, "addButton"));
  objc_msgSend(v8, "setHidden:", 0);

  -[CNComposeRecipientTextView setSeparatorHidden:](self->_recipientView, "setSeparatorHidden:", 0);
  recipientView = self->_recipientView;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARE_INVITE_TO"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CNComposeRecipientTextView setLabel:](recipientView, "setLabel:", v11);

  v12 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc((Class)CNAutocompleteSearchManager), "initWithAutocompleteSearchType:", 1);
  searchManager = self->_searchManager;
  self->_searchManager = v12;

  -[CNAutocompleteSearchManager setSearchTypes:](self->_searchManager, "setSearchTypes:", 17);
  -[CNAutocompleteSearchManager setImplicitGroupCreationThreshold:](self->_searchManager, "setImplicitGroupCreationThreshold:", 2);
  -[CNAutocompleteSearchManager setIncludeUpcomingEventMembers:](self->_searchManager, "setIncludeUpcomingEventMembers:", 1);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController _destinationAddressesForCurrentAccount](self, "_destinationAddressesForCurrentAccount"));
  currentAccountAddresses = self->_currentAccountAddresses;
  self->_currentAccountAddresses = v14;

  v16 = (CNContactPickerViewController *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController _createPeoplePicker](self, "_createPeoplePicker"));
  peoplePicker = self->_peoplePicker;
  self->_peoplePicker = v16;

  v18 = objc_alloc((Class)UITableView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v22 = objc_msgSend(v18, "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  -[CHAddFriendViewController setTableView:](self, "setTableView:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v24, "setDelegate:", self);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v25, "setDataSource:", self);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v26, "setKeyboardDismissMode:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v27, "setSectionHeaderTopPadding:", 0.0);

  v28 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setTableFooterView:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v30, "setSeparatorStyle:", 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  v32 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "separatorColor"));
  separatorColor = self->_separatorColor;
  self->_separatorColor = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v34, "setSeparatorColor:", v35);

  v36 = (CNMonogrammer *)objc_msgSend(objc_alloc((Class)CNMonogrammer), "initWithStyle:diameter:", 0, 32.0);
  monogrammer = self->_monogrammer;
  self->_monogrammer = v36;

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000687A8;
  v72[3] = &unk_100778400;
  v72[4] = self;
  v38 = (NSPredicate *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v72));
  recipientArrayFilterPredicate = self->_recipientArrayFilterPredicate;
  self->_recipientArrayFilterPredicate = v38;

  v40 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingSearchResults = self->_pendingSearchResults;
  self->_pendingSearchResults = v40;

  v42 = (CNAutocompleteFetchContext *)objc_alloc_init((Class)CNAutocompleteFetchContext);
  context = self->_context;
  self->_context = v42;

  v44 = self->_context;
  v74[0] = CRRecentsDomainMail;
  v74[1] = CRRecentsDomainMessages;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 2));
  -[CNAutocompleteFetchContext setBundleIdentifiers:](v44, "setBundleIdentifiers:", v45);

  -[CNAutocompleteFetchContext setPredictsBasedOnOutgoingInteraction:](self->_context, "setPredictsBasedOnOutgoingInteraction:", 1);
  self->_finishedPopulatingSuggestions = 0;
  -[CHAddFriendViewController _searchForRecipientWithText:](self, "_searchForRecipientWithText:", CFSTR("*"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  objc_msgSend(v46, "addSubview:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v48, "addSubview:", v49);

  v50 = objc_opt_new(NSMutableArray);
  v51 = _NSDictionaryOfVariableBindings(CFSTR("_recipientView, _tableView"), self->_recipientView, self->_tableView, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_recipientView]|"), 0, 0, v52));
  -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_tableView]|"), 0, 0, v52));
  -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_recipientView][_tableView]|"), 0, 0, v52));
  -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView topAnchor](self->_recipientView, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "safeAreaLayoutGuide"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v59));
  -[NSMutableArray addObject:](v50, "addObject:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView heightAnchor](self->_recipientView, "heightAnchor"));
  +[CNComposeRecipientTextView preferredHeight](CNComposeRecipientTextView, "preferredHeight");
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToConstant:"));
  -[CHAddFriendViewController setComposeInputLineHeight:](self, "setComposeInputLineHeight:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController composeInputLineHeight](self, "composeInputLineHeight"));
  LODWORD(v64) = 1148829696;
  objc_msgSend(v63, "setPriority:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController composeInputLineHeight](self, "composeInputLineHeight"));
  -[NSMutableArray addObject:](v50, "addObject:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView heightAnchor](self->_recipientView, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "heightAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintLessThanOrEqualToAnchor:multiplier:", v68, 0.3));
  -[NSMutableArray addObject:](v50, "addObject:", v69);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v70, "addObserver:selector:name:object:", self, "_fontSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_fontSizeDidChange
{
  double v3;
  double v4;
  id v5;

  +[CNComposeRecipientTextView preferredHeight](CNComposeRecipientTextView, "preferredHeight");
  v4 = v3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController composeInputLineHeight](self, "composeInputLineHeight"));
  objc_msgSend(v5, "setConstant:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CHAddFriendViewController;
  -[CHAddFriendViewController viewWillAppear:](&v19, "viewWillAppear:", a3);
  v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARING_INVITE_SEND"), &stru_1007AE1D0, CFSTR("Localizable")));
  v7 = objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, self, "_doneButtonTapped:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recipients"));
  v11 = objc_msgSend(v10, "count") != 0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));
  objc_msgSend(v13, "setEnabled:", v11);

  v14 = objc_alloc((Class)UIBarButtonItem);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHARING_CANCEL"), &stru_1007AE1D0, CFSTR("Localizable")));
  v17 = objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 0, self, "_cancelButtonTapped:");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHAddFriendViewController;
  -[CHAddFriendViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[CNComposeRecipientTextView reflow](self->_recipientView, "reflow");
  -[CHAddFriendViewController _textFieldShouldBecomeFirstResponder](self, "_textFieldShouldBecomeFirstResponder");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  double Width;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxY;
  void *v29;
  double v30;
  void *v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController parentViewController](self, "parentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windows"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "windowScene"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "statusBarManager"));
  objc_msgSend(v16, "statusBarFrame");
  v18 = v17;

  v19 = v11 + v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  objc_msgSend(v20, "bounds");
  Width = CGRectGetWidth(v33);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  objc_msgSend(v22, "setFrame:", v5, v19, Width, v7);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;

  v34.origin.x = v5;
  v34.origin.y = v19;
  v34.size.width = Width;
  v34.size.height = v7;
  MaxY = CGRectGetMaxY(v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController view](self, "view"));
  objc_msgSend(v29, "bounds");
  v30 = CGRectGetWidth(v35);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v31, "setFrame:", v25, MaxY, v30, v27);

  v32.receiver = self;
  v32.super_class = (Class)CHAddFriendViewController;
  -[CHAddFriendViewController viewWillLayoutSubviews](&v32, "viewWillLayoutSubviews");
}

- (void)_sendInviteToRecipientsByService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  CHAddFriendViewController *v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[3];
  char v30;

  v6 = a3;
  v7 = a4;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_1000690AC;
  v27[4] = sub_1000690BC;
  v28 = 0;
  v8 = dispatch_group_create();
  v9 = HKCreateSerialDispatchQueue(self, CFSTR("SendInviteResponseQueue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_1000690C4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006911C;
  v20[3] = &unk_100778478;
  v13 = v8;
  v21 = v13;
  v22 = self;
  v14 = v12;
  v23 = v14;
  v15 = v10;
  v24 = v15;
  v25 = v29;
  v26 = v27;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069390;
    block[3] = &unk_1007784A0;
    v17 = v7;
    v18 = v29;
    v19 = v27;
    dispatch_group_notify(v13, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v29, 8);
}

- (void)_doneButtonTapped:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id inited;
  void *v23;
  CHInvitationDestinationCoordinator *invitationDestinationCoordinator;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v6 = objc_msgSend(v5, "finishEnteringRecipient");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recipients"));
  v9 = (char *)objc_msgSend(v8, "count");

  -[CHAddFriendViewController _dismissKeyboard:](self, "_dismissKeyboard:", self);
  if ((uint64_t)&v9[v6] <= (uint64_t)-[ASFriendListSectionManager numberOfNewFriendsAllowed](self->_friendListManager, "numberOfNewFriendsAllowed"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recipients"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = objc_alloc_init((Class)NSMutableSet);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recipients"));

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v39;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1)
                                                                               + 8 * (_QWORD)v18), "address"));
            objc_msgSend(v13, "addObject:", v19);

            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v16);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rightBarButtonItem"));
      objc_msgSend(v21, "setEnabled:", 0);

      inited = objc_initWeak(&location, self);
      if (ASManateeContainerEnabled(inited))
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100069784;
        v36[3] = &unk_1007784C8;
        v36[4] = self;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hk_filter:", v36));
        invitationDestinationCoordinator = self->_invitationDestinationCoordinator;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
        v26 = sub_1000690C4();
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000697A4;
        v34[3] = &unk_100777EB8;
        v34[4] = self;
        v35 = v13;
        -[CHInvitationDestinationCoordinator sendInvitationToDestinations:callerID:completion:](invitationDestinationCoordinator, "sendInvitationToDestinations:callerID:completion:", v25, v27, v34);

      }
      else
      {
        v28 = objc_alloc_init((Class)NSMutableDictionary);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100069C3C;
        v30[3] = &unk_100778540;
        objc_copyWeak(&v33, &location);
        v29 = v28;
        v31 = v29;
        v32 = v13;
        -[CHAddFriendViewController _queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:](self, "_queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:", v32, 0, v30);

        objc_destroyWeak(&v33);
      }
      objc_destroyWeak(&location);

    }
    else
    {
      -[CHAddFriendViewController _dismissAndNotifyDelegate](self, "_dismissAndNotifyDelegate");
    }
  }

}

- (void)_populateSuggestedContactsWithReachability
{
  void *v2;
  void *v3;
  CHAddFriendViewController *v4;
  void *v5;
  NSArray *v6;
  NSArray *searchResults;
  void *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *k;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *reachableSuggestedContacts;
  id v27;
  CHInvitationDestinationCoordinator *invitationDestinationCoordinator;
  void *v29;
  NSArray *obj;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id location;
  _QWORD v39[4];
  id v40;
  id v41;
  CHAddFriendViewController *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = self;
  if (-[NSArray count](self->_searchResults, "count") >= 0x1A)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_searchResults, "subarrayWithRange:", 0, 25));
    v6 = (NSArray *)objc_msgSend(v5, "mutableCopy");
    searchResults = self->_searchResults;
    self->_searchResults = v6;

    v4 = self;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4->_searchResults;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "contact"));
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddresses"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v48 != v12)
                objc_enumerationMutation(v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1)
                                                                                 + 8 * (_QWORD)j), "value"));
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v14);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v11);
        }

        v45 = 0u;
        v46 = 0u;
        v44 = 0u;
        v43 = 0u;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(_QWORD *)v44 != v17)
                objc_enumerationMutation(v15);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1)
                                                                                 + 8 * (_QWORD)k), "value"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v20);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v16);
        }

      }
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v33);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));

  v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  reachableSuggestedContacts = self->_reachableSuggestedContacts;
  self->_reachableSuggestedContacts = v25;

  -[CHAddFriendViewController _setShowSuggestions:](self, "_setShowSuggestions:", 1);
  self->_finishedPopulatingSuggestions = 1;
  -[CNAutocompleteSearchManager setSearchTypes:](self->_searchManager, "setSearchTypes:", 19);
  v27 = objc_msgSend(v24, "count");
  if (v27)
  {
    if (ASManateeContainerEnabled(v27))
    {
      invitationDestinationCoordinator = self->_invitationDestinationCoordinator;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allObjects"));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10006A94C;
      v39[3] = &unk_100778568;
      v40 = v2;
      v41 = v3;
      v42 = self;
      -[CHInvitationDestinationCoordinator fetchReachableDestinationsFor:completion:](invitationDestinationCoordinator, "fetchReachableDestinationsFor:completion:", v29, v39);

    }
    else
    {
      objc_initWeak(&location, self);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10006ABFC;
      v34[3] = &unk_100778590;
      objc_copyWeak(&v37, &location);
      v35 = v2;
      v36 = v3;
      -[CHAddFriendViewController _queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:](self, "_queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:", v24, v34, 0);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_dismissKeyboard:(id)a3
{
  -[CHAddFriendViewController _textFieldShouldResignFirstResponder](self, "_textFieldShouldResignFirstResponder", a3);
}

- (void)_cancelButtonTapped:(id)a3
{
  -[CHAddFriendViewController _dismissKeyboard:](self, "_dismissKeyboard:", self);
  -[CHAddFriendViewController _dismissAndNotifyDelegate](self, "_dismissAndNotifyDelegate");
}

- (void)_addContact:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView", a3));
  -[CHAddFriendViewController composeRecipientViewRequestAddRecipient:](self, "composeRecipientViewRequestAddRecipient:", v4);

}

- (void)_textFieldShouldBecomeFirstResponder
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textView"));
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_textFieldShouldResignFirstResponder
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textView"));
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)_resetSearchResults
{
  -[NSMutableArray removeAllObjects](self->_pendingSearchResults, "removeAllObjects");
}

- (id)_recipientFromDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "address"));
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (unint64_t)_guessedKindForString:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("@")) & 1) != 0
    || (objc_msgSend(v3, "containsString:", CFSTR("mailto:")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("tel:")) & 1) != 0
         || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet")), v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5), v5, v6 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = 1;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (id)_createPeoplePicker
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v3 = objc_alloc_init((Class)CNContactPickerViewController);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setHidesPromptInLandscape:", 1);
  objc_msgSend(v3, "setAllowsEditing:", 1);
  objc_msgSend(v3, "setAllowsCancel:", 1);
  v20[0] = CNContactEmailAddressesKey;
  v20[1] = CNContactPhoneNumbersKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v3, "setDisplayedPropertyKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.@count > 0"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10)));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
  objc_msgSend(v3, "setPredicateForSelectionOfContact:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));
  objc_msgSend(v3, "setPredicateForEnablingContact:", v13);

  objc_msgSend(v3, "setModalPresentationStyle:", 3);
  objc_msgSend(v3, "_setAllowsAutorotation:", 0);

  return v3;
}

- (void)_dismissAndNotifyDelegate
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController parentViewController](self, "parentViewController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "addFriendViewControllerDidDismiss:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController delegate](self, "delegate"));
    objc_msgSend(v6, "addFriendViewControllerDidDismiss:", self);

  }
}

- (void)_searchForRecipientWithText:(id)a3
{
  NSNumber *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *currentSearchTaskID;
  id v10;

  v10 = a3;
  -[CHAddFriendViewController _resetSearchResults](self, "_resetSearchResults");
  if (!self->_currentSearchTaskID
    || self->_finishedPopulatingSuggestions
    && (-[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:"),
        v4 = self->_currentSearchTaskID,
        self->_currentSearchTaskID = 0,
        v4,
        !self->_currentSearchTaskID))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView uncommentedAddresses](self->_recipientView, "uncommentedAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", self->_currentAccountAddresses));

    if (self->_currentFriendDestinations && !self->_finishedPopulatingSuggestions)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:"));

      v6 = (void *)v7;
    }
    -[CNAutocompleteFetchContext setOtherAddressesAlreadyChosen:](self->_context, "setOtherAddressesAlreadyChosen:", v6);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:](self->_searchManager, "searchForText:withAutocompleteFetchContext:consumer:", v10, self->_context, self));
    currentSearchTaskID = self->_currentSearchTaskID;
    self->_currentSearchTaskID = v8;

  }
}

- (id)_destinationAddressesForCurrentAccount
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];
  _BYTE v35[128];

  v2 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
  v3 = objc_alloc_init((Class)ACAccountStore);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierCloudKit));
  v24 = v3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierIdentityServices));
  v22 = (void *)v4;
  v34[0] = v4;
  v34[1] = v21;
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accountsWithAccountType:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i)));
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));

              if (v15)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));
                objc_msgSend(v2, "addObject:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  v17 = sub_1000690C4();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (v18)
    objc_msgSend(v2, "addObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return v19;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  -[NSMutableArray addObjectsFromArray:](self->_pendingSearchResults, "addObjectsFromArray:", a3, a4);
}

- (void)finishedSearchingForAutocompleteResults
{
  NSArray *v3;
  NSArray *searchResults;

  v3 = (NSArray *)-[NSMutableArray copy](self->_pendingSearchResults, "copy");
  searchResults = self->_searchResults;
  self->_searchResults = v3;

  if (!self->_finishedPopulatingSuggestions)
    -[CHAddFriendViewController _populateSuggestedContactsWithReachability](self, "_populateSuggestedContactsWithReachability");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  -[CNAutocompleteSearchManager didSelectRecipient:atIndex:](self->_searchManager, "didSelectRecipient:atIndex:", a3, a4);
}

- (void)removeRecipient:(id)a3
{
  -[CNAutocompleteSearchManager removeRecipientResult:](self->_searchManager, "removeRecipientResult:", a3);
}

- (id)_preferredServiceIdentifierForDestination:(id)a3 inReachableDestinationsByService:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)kASiCloudServiceIdentifier;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kASiCloudServiceIdentifier));
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if ((v9 & 1) != 0
    || (v7 = (void *)kASiMessageServiceIdentifier,
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kASiMessageServiceIdentifier)),
        v11 = objc_msgSend(v10, "containsObject:", v5),
        v10,
        v11))
  {
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_queryAllServicesForDestinations:(id)a3 reachableUpdateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  CHAddFriendViewController *v16;
  id v17;
  NSArray *obj;
  id v19;
  _QWORD block[4];
  id v21;
  CHAddFriendViewController *v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v19 = a3;
  v8 = a4;
  v17 = a5;
  v9 = dispatch_group_create();
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = self;
  obj = self->_reachabilityManagers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v9);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10006BA64;
        v26[3] = &unk_100778608;
        v26[4] = v15;
        v27 = v10;
        v28 = v8;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10006BDC4;
        v24[3] = &unk_100778630;
        v25 = v9;
        objc_msgSend(v15, "queryDestinations:updateHandler:completionHandler:", v19, v26, v24);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  if (v17)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006BDCC;
    block[3] = &unk_100778680;
    v21 = v10;
    v22 = v16;
    v23 = v17;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_checkReachableForContact:(id)a3 withDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CHInvitationDestinationCoordinator *invitationDestinationCoordinator;
  void *v18;
  id *v19;
  id *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  id v31;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "atomViewForRecipient:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  objc_msgSend(v9, "setTintColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windows"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tintColor"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
  if (ASManateeContainerEnabled(v16))
  {
    invitationDestinationCoordinator = self->_invitationDestinationCoordinator;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10006C220;
    v28[3] = &unk_100778568;
    v19 = &v29;
    v20 = &v30;
    v29 = v6;
    v30 = v9;
    v31 = v15;
    v21 = v15;
    v22 = v9;
    -[CHInvitationDestinationCoordinator fetchReachableDestinationsFor:completion:](invitationDestinationCoordinator, "fetchReachableDestinationsFor:completion:", v18, v28);

  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10006C348;
    v25[3] = &unk_1007786A8;
    v19 = &v26;
    v20 = &v27;
    v26 = v9;
    v27 = v15;
    v23 = v15;
    v24 = v9;
    -[CHAddFriendViewController _queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:](self, "_queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:", v16, v25, 0);
  }

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  id v5;

  height = a4.height;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController composeInputLineHeight](self, "composeInputLineHeight", a3, a4.width));
  objc_msgSend(v5, "setConstant:", height);

}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;

  -[CNComposeRecipientTextView clearText](self->_recipientView, "clearText", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController parentViewController](self, "parentViewController"));
  objc_msgSend(v4, "presentViewController:animated:completion:", self->_peoplePicker, 1, 0);

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  NSArray *v5;
  NSArray *searchResults;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    if (self->_showSuggestions)
      -[CHAddFriendViewController _setShowSuggestions:](self, "_setShowSuggestions:", 0);
    -[CHAddFriendViewController _searchForRecipientWithText:](self, "_searchForRecipientWithText:", v7);
  }
  else
  {
    -[CHAddFriendViewController _setShowSuggestions:](self, "_setShowSuggestions:", 1);
    -[CHAddFriendViewController _resetSearchResults](self, "_resetSearchResults");
    v5 = (NSArray *)-[NSMutableArray copy](self->_pendingSearchResults, "copy");
    searchResults = self->_searchResults;
    self->_searchResults = v5;

    -[UITableView reloadData](self->_tableView, "reloadData");
  }

}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recipients"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightBarButtonItem"));
    objc_msgSend(v10, "setEnabled:", 1);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recipients"));
  v12 = objc_msgSend(v11, "count");
  v13 = -[ASFriendListSectionManager numberOfNewFriendsAllowed](self->_friendListManager, "numberOfNewFriendsAllowed");

  if (v12 <= v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "address"));
    -[CHAddFriendViewController _checkReachableForContact:withDestination:](self, "_checkReachableForContact:withDestination:", v6, v18);

    -[CHAddFriendViewController _refilterShownContacts](self, "_refilterShownContacts");
  }
  else
  {
    v14 = sub_1000A8A50();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
    objc_msgSend(v16, "removeRecipient:", v6);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController parentViewController](self, "parentViewController"));
    objc_msgSend(v17, "presentViewController:animated:completion:", v15, 1, 0);

  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recipients"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController navigationItem](self, "navigationItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItem"));
    objc_msgSend(v8, "setEnabled:", 0);

  }
  -[CHAddFriendViewController _refilterShownContacts](self, "_refilterShownContacts");
}

- (void)_mergeRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  CHAddFriendViewController *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_24;
  }
  v8 = v7;
  v9 = 0;
  obj = v6;
  v23 = *(_QWORD *)v25;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v23)
      objc_enumerationMutation(obj);
    if ((v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contact")),
          (objc_msgSend(v11, "isEqual:", v4) & 1) != 0)
      || (objc_msgSend(v13, "isEqualToString:", v12) & 1) != 0
      || v15
      && (-[CHAddFriendViewController _contact:hasEmailDestination:](v21, "_contact:hasEmailDestination:", v15, v12)
       || -[CHAddFriendViewController _contact:hasPhoneNumberDestination:](v21, "_contact:hasPhoneNumberDestination:", v15, v12))|| v14&& (-[CHAddFriendViewController _contact:hasEmailDestination:](v21, "_contact:hasEmailDestination:", v14, v13)|| -[CHAddFriendViewController _contact:hasPhoneNumberDestination:](v21, "_contact:hasPhoneNumberDestination:", v14, v13)))
    {
      v16 = v11;

      v17 = 0;
      v9 = v16;
    }
    else
    {
      v17 = 1;
    }

    if (!v17)
      break;
    if (v8 == (id)++v10)
    {
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v8 = v18;
      if (v18)
        goto LABEL_3;
      break;
    }
  }

  if (!v9)
    goto LABEL_25;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));

  if (v19)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](v21, "recipientView"));
    objc_msgSend(v6, "removeRecipient:", v9);
LABEL_24:

LABEL_25:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](v21, "recipientView"));
    objc_msgSend(v20, "addRecipient:", v4);

  }
}

- (BOOL)_contact:(id)a3 hasEmailDestination:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "emailAddresses", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "value"));
        v11 = objc_msgSend(v10, "isEqualToString:", v5);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (BOOL)_contact:(id)a3 hasPhoneNumberDestination:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)CNPhoneNumber), "initWithStringValue:", v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "phoneNumbers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "value"));
        v13 = objc_msgSend(v7, "isLikePhoneNumber:", v12);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationStripped"));
  if (objc_msgSend(v5, "length")
    && ((objc_msgSend(v11, "isPhoneNumber") & 1) != 0 || objc_msgSend(v11, "isEmail")))
  {
    v6 = objc_msgSend(objc_alloc((Class)CNComposeRecipient), "initWithContact:address:kind:", 0, v5, -[CHAddFriendViewController _guessedKindForString:](self, "_guessedKindForString:", v5));
    -[CHAddFriendViewController _mergeRecipient:](self, "_mergeRecipient:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
    objc_msgSend(v7, "clearText");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
    objc_msgSend(v9, "composeRecipientView:textDidChange:", v10, &stru_1007AE1D0);

  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "key"));
  v8 = objc_msgSend(v7, "isEqualToString:", CNContactEmailAddressesKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

    v11 = 1;
    v10 = (void *)v12;
  }
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  v13 = objc_alloc((Class)CNComposeRecipient);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contact"));
  v15 = objc_msgSend(v13, "initWithContact:address:kind:", v14, v10, v11);

  -[CHAddFriendViewController _mergeRecipient:](self, "_mergeRecipient:", v15);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "emailAddresses"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "emailAddresses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
    v12 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "phoneNumbers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));

    v12 = 1;
  }

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  v14 = objc_msgSend(objc_alloc((Class)CNComposeRecipient), "initWithContact:address:kind:", v15, v11, v12);
  -[CHAddFriendViewController _mergeRecipient:](self, "_mergeRecipient:", v14);

}

- (void)_addSuggestedContact:(id)a3
{
  id v4;
  NSMutableArray *reachableSuggestedContacts;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, unsigned __int8 *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  reachableSuggestedContacts = self->_reachableSuggestedContacts;
  v16 = 0;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10006CFA4;
  v10 = &unk_1007786D0;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](reachableSuggestedContacts, "enumerateObjectsUsingBlock:", &v7);
  if (!*((_BYTE *)v14 + 24))
    -[NSMutableArray addObject:](self->_reachableSuggestedContacts, "addObject:", v6, v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

- (void)_setShowSuggestions:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *reachableSuggestedContacts;
  void *v10;
  void *v11;
  void *v12;

  self->_showSuggestions = a3;
  if (a3)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
    objc_msgSend(v5, "setTableFooterView:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
    objc_msgSend(v6, "setSeparatorStyle:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v7, "setSeparatorColor:", v8);

    reachableSuggestedContacts = self->_reachableSuggestedContacts;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
    objc_msgSend(v10, "setTableFooterView:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
    objc_msgSend(v11, "setSeparatorStyle:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
    objc_msgSend(v12, "setSeparatorColor:", self->_separatorColor);

    reachableSuggestedContacts = (NSMutableArray *)&__NSArray0__struct;
  }
  -[CHAddFriendViewController setShownContacts:](self, "setShownContacts:", reachableSuggestedContacts);
}

- (void)setShownContacts:(id)a3
{
  NSArray *v4;
  NSArray *shownContacts;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shownContacts, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    shownContacts = self->_shownContacts;
    self->_shownContacts = v4;

    -[CHAddFriendViewController _refilterShownContacts](self, "_refilterShownContacts");
  }

}

- (void)_refilterShownContacts
{
  NSArray *v3;
  NSArray *unselectedShownContacts;
  NSArray *v5;
  NSArray *v6;
  id v7;

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](self->_shownContacts, "filteredArrayUsingPredicate:", self->_recipientArrayFilterPredicate));
  unselectedShownContacts = self->_unselectedShownContacts;
  self->_unselectedShownContacts = v3;

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingComparator:](self->_unselectedShownContacts, "sortedArrayUsingComparator:", &stru_100778710));
  v6 = self->_unselectedShownContacts;
  self->_unselectedShownContacts = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController tableView](self, "tableView"));
  objc_msgSend(v7, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  if (!self->_showSuggestions)
    return -[NSArray count](self->_searchResults, "count", a3, a4);
  result = -[NSArray count](self->_unselectedShownContacts, "count", a3, a4);
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  CHRecipientTableViewCell *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  id v15;
  void *v16;
  NSDictionary *v17;
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
  id v34;
  void *v35;
  CNMonogrammer *monogrammer;
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
  CHRecipientTableViewCell *v47;
  void *v48;
  id v50;
  void *v51;
  const __CFString *v52;
  void *v53;

  v6 = a3;
  v7 = a4;
  if (self->_showSuggestions)
  {
    if (-[NSArray count](self->_unselectedShownContacts, "count"))
    {
      v8 = (CHRecipientTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SuggestedContactCellReuseIdentifier")));
      if (!v8)
      {
        v8 = (CHRecipientTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("SuggestedContactCellReuseIdentifier"));
        v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        objc_msgSend(v9, "setBackgroundColor:", self->_separatorColor);
        objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell contentView](v8, "contentView"));
        objc_msgSend(v10, "addSubview:", v9);

        v52 = CFSTR("inset");
        objc_msgSend(v6, "separatorInset");
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
        v53 = v51;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
        v13 = _NSDictionaryOfVariableBindings(CFSTR("separatorView"), v9, 0);
        v50 = v7;
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = v6;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(inset)-[separatorView]|"), 0, v12, v14));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

        v6 = v15;
        v7 = v50;

        v17 = _NSDictionaryOfVariableBindings(CFSTR("separatorView"), v9, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[separatorView]|"), 0, 0, v18));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 0.5));
        objc_msgSend(v21, "setActive:", 1);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_unselectedShownContacts, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contact"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v23, 0));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](v8, "textLabel"));
      objc_msgSend(v25, "setText:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reachableEmailAddress"));
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reachableEmailAddress"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](v8, "detailTextLabel"));
        objc_msgSend(v28, "setText:", v27);
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reachablePhoneNumber"));
        v34 = sub_100068950(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](v8, "detailTextLabel"));
        objc_msgSend(v35, "setText:", v28);

      }
      if (self->_showSuggestions)
      {
        monogrammer = self->_monogrammer;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contact"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[CNMonogrammer monogramForContact:](monogrammer, "monogramForContact:", v37));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell imageView](v8, "imageView"));
        objc_msgSend(v39, "setImage:", v38);

      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell imageView](v8, "imageView"));
        objc_msgSend(v37, "setImage:", 0);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "nonGradientTextColor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](v8, "textLabel"));
      objc_msgSend(v42, "setTextColor:", v41);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](v8, "textLabel"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "textColor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](v8, "detailTextLabel"));
      objc_msgSend(v45, "setTextColor:", v44);

      -[CHRecipientTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 3);
    }
    else if (self->_showSuggestions)
    {
      v8 = (CHRecipientTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("NoSuggestedContactsCellReuseIdentifier")));
      if (!v8)
        v8 = (CHRecipientTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("NoSuggestedContactsCellReuseIdentifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController _noSuggestionString](self, "_noSuggestionString"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](v8, "textLabel"));
      objc_msgSend(v31, "setAttributedText:", v30);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](v8, "textLabel"));
      objc_msgSend(v32, "setNumberOfLines:", 0);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](v8, "textLabel"));
      objc_msgSend(v33, "setTextAlignment:", 1);

      -[CHRecipientTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    if (-[NSArray count](self->_searchResults, "count"))
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_searchResults, "objectAtIndex:", objc_msgSend(v7, "row")));
    else
      v29 = 0;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecipientTableViewCell identifier](CHRecipientTableViewCell, "identifier"));
    v8 = (CHRecipientTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v46));

    if (!v8)
    {
      v47 = [CHRecipientTableViewCell alloc];
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecipientTableViewCell identifier](CHRecipientTableViewCell, "identifier"));
      v8 = -[CHRecipientTableViewCell initWithStyle:reuseIdentifier:](v47, "initWithStyle:reuseIdentifier:", 3, v48);

      -[CHRecipientTableViewCell setOpaque:](v8, "setOpaque:", 0);
    }
    -[CHRecipientTableViewCell setRecipient:](v8, "setRecipient:", v29);

  }
  return v8;
}

- (BOOL)_isContactsAccessAuthorized
{
  return (id)+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) == (id)3;
}

- (id)_noSuggestionString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSAttributedStringKey v20;
  void *v21;

  v20 = NSForegroundColorAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightTextColor](UIColor, "lightTextColor"));
  v21 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

  if (-[CHAddFriendViewController _isContactsAccessAuthorized](self, "_isContactsAccessAuthorized"))
  {
    v5 = objc_alloc((Class)NSAttributedString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARING_NO_SUGGESTED"), &stru_1007AE1D0, CFSTR("Localizable")));
    v8 = objc_msgSend(v5, "initWithString:attributes:", v7, v4);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_NO_CONTACTS_ACCESS"), &stru_1007AE1D0, CFSTR("Localizable")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARING_NO_CONTACTS_ACCESS_SETTINGS"), &stru_1007AE1D0, CFSTR("Localizable")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12));

    v8 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v6, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_NO_CONTACTS_ACCESS_SETTINGS"), &stru_1007AE1D0, CFSTR("Localizable")));
    v15 = objc_msgSend(v6, "rangeOfString:", v14);
    v17 = v16;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nonGradientTextColor"));
    objc_msgSend(v8, "addAttribute:value:range:", NSForegroundColorAttributeName, v18, v15, v17);

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!self->_showSuggestions)
  {
    v7 = -[NSArray count](self->_searchResults, "count");
    if (v7 > (unint64_t)objc_msgSend(v6, "row"))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
      objc_msgSend(v9, "clearText");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAddFriendViewController recipientView](self, "recipientView"));
      objc_msgSend(v10, "addRecipient:", v8);

      -[CHAddFriendViewController _setShowSuggestions:](self, "_setShowSuggestions:", 1);
      objc_msgSend(v19, "reloadData");
LABEL_12:

      goto LABEL_13;
    }
  }
  v11 = -[NSArray count](self->_unselectedShownContacts, "count");
  if (v11 > (unint64_t)objc_msgSend(v6, "row"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_unselectedShownContacts, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reachableEmailAddress"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reachableEmailAddress"));
      v14 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reachablePhoneNumber"));
      v14 = 1;
    }
    v16 = objc_alloc((Class)CNComposeRecipient);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contact"));
    v18 = objc_msgSend(v16, "initWithContact:address:kind:", v17, v13, v14);

    -[CHAddFriendViewController _mergeRecipient:](self, "_mergeRecipient:", v18);
    goto LABEL_12;
  }
  if (self->_showSuggestions
    && !-[CHAddFriendViewController _isContactsAccessAuthorized](self, "_isContactsAccessAuthorized"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("prefs:root=Privacy&path=CONTACTS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v15, "openSensitiveURL:withOptions:", v8, &__NSDictionary0__struct);

    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  id v6;
  double y;
  double width;
  double height;
  id v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v40;
  void *v41;

  if (self->_showSuggestions)
  {
    v5 = a3;
    v6 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
    objc_msgSend(v10, "setBackgroundColor:", v11);

    v12 = objc_opt_new(NSMutableArray);
    v13 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v13, "setBackgroundColor:", self->_separatorColor);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v13);
    v40 = CFSTR("inset");
    objc_msgSend(v5, "separatorInset");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    v41 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v18 = _NSDictionaryOfVariableBindings(CFSTR("separatorView"), v13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(inset)-[separatorView]|"), 0, v17, v19));
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 0.5));
    -[NSMutableArray addObject:](v12, "addObject:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    -[NSMutableArray addObject:](v12, "addObject:", v25);

    v26 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "setNumberOfLines:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SHARE_SUGGESTED"), &stru_1007AE1D0, CFSTR("Localizable")));
    objc_msgSend(v26, "setText:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    objc_msgSend(v26, "setFont:", v29);

    objc_msgSend(v10, "addSubview:", v26);
    v30 = _NSDictionaryOfVariableBindings(CFSTR("headerLabel"), v26, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[headerLabel]-|"), 0, 0, v31));
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    -[NSMutableArray addObject:](v12, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintLessThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v37, 1.0));
    -[NSMutableArray addObject:](v12, "addObject:", v38);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = UITableViewAutomaticDimension;
  if (!self->_showSuggestions)
    return 0.0;
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;

  v6 = a3;
  v7 = a4;
  if (self->_showSuggestions || !-[NSArray count](self->_searchResults, "count"))
  {
    if (-[NSArray count](self->_unselectedShownContacts, "count"))
      v8 = UITableViewAutomaticDimension;
    else
      v8 = 196.0;
  }
  else
  {
    v8 = 56.0;
  }

  return v8;
}

- (BOOL)_destinationMatchesCurrentAccountDestination:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = ASContactSanitizedDestination(a3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  LOBYTE(self) = -[NSArray containsObject:](self->_currentAccountAddresses, "containsObject:", v5);

  return (char)self;
}

- (CHAddFriendViewControllerDelegate)delegate
{
  return (CHAddFriendViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNComposeRecipientTextView)recipientView
{
  return self->_recipientView;
}

- (void)setRecipientView:(id)a3
{
  objc_storeStrong((id *)&self->_recipientView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)shownContacts
{
  return self->_shownContacts;
}

- (NSLayoutConstraint)composeInputLineHeight
{
  return self->_composeInputLineHeight;
}

- (void)setComposeInputLineHeight:(id)a3
{
  objc_storeStrong((id *)&self->_composeInputLineHeight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeInputLineHeight, 0);
  objc_storeStrong((id *)&self->_shownContacts, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_recipientView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitationDestinationCoordinator, 0);
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_currentAccountAddresses, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_pendingSearchResults, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_recipientArrayFilterPredicate, 0);
  objc_storeStrong((id *)&self->_currentFriendDestinations, 0);
  objc_storeStrong((id *)&self->_unselectedShownContacts, 0);
  objc_storeStrong((id *)&self->_reachableSuggestedContacts, 0);
  objc_storeStrong((id *)&self->_reachabilityManagers, 0);
}

@end
