@implementation CHFriendInboxTableViewController

- (void)addFriendViewControllerDidDismiss:
{
  sub_1000A3454(1);
}

- (CHFriendInboxTableViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11 makeFriendDetailViewControllerBlock:(id)a12
{
  id v18;
  id v19;
  id v20;
  CHFriendInboxTableViewController *v21;
  CHFriendInboxTableViewController *v22;
  id v23;
  id makeFriendDetailViewControllerBlock;
  id obj;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  obj = a4;
  v34 = a4;
  v33 = a5;
  v32 = a6;
  v27 = a7;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v36.receiver = self;
  v36.super_class = (Class)CHFriendInboxTableViewController;
  v21 = -[CHFriendInboxTableViewController initWithStyle:](&v36, "initWithStyle:", 2);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_friendListManager, a3);
    objc_storeStrong((id *)&v22->_friendManager, obj);
    objc_storeStrong((id *)&v22->_achievementsDataProvider, a5);
    objc_storeStrong((id *)&v22->_workoutsDataProvider, a6);
    objc_storeStrong((id *)&v22->_workoutFormattingManager, v27);
    objc_storeStrong((id *)&v22->_formattingManager, a8);
    objc_storeStrong((id *)&v22->_imageFactory, a9);
    objc_storeStrong((id *)&v22->_healthStore, a10);
    objc_storeStrong((id *)&v22->_fitnessAppContext, a11);
    v23 = objc_retainBlock(v20);
    makeFriendDetailViewControllerBlock = v22->_makeFriendDetailViewControllerBlock;
    v22->_makeFriendDetailViewControllerBlock = v23;

  }
  return v22;
}

- (CHFriendInboxTableViewController)init
{

  return 0;
}

- (CHFriendInboxTableViewController)initWithStyle:(int64_t)a3
{

  return 0;
}

- (CHFriendInboxTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (CHFriendInboxTableViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CHFriendInboxTableViewController;
  -[CHFriendInboxTableViewController loadView](&v13, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHFriendInboxAddTableViewCell, v4), CFSTR("Add"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHFriendInboxTableViewCell, v6), CFSTR("Cell"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHFriendInboxIncomingTableViewCell, v8), CFSTR("IncomingCell"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHFriendInboxOutgoingTableViewCell, v10), CFSTR("OutgoingCell"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHShowLegacyDevicesTableViewCell, v12), CFSTR("LegacyDevicesCell"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  OBPrivacyLinkController *v9;
  OBPrivacyLinkController *privacyLink;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
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
  CHCloudDeviceProvider *v31;
  CHCloudDeviceProvider *cloudDeviceProvider;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CHFriendInboxTableViewController;
  -[CHFriendInboxTableViewController viewDidLoad](&v33, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setTableFooterView:", v5);

  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonTapped");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  v9 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.activity")));
  privacyLink = self->_privacyLink;
  self->_privacyLink = v9;

  -[OBPrivacyLinkController setPresentedViewControllerShouldUseDarkMode:](self->_privacyLink, "setPresentedViewControllerShouldUseDarkMode:", 1);
  -[OBPrivacyLinkController setDisplayIcon:](self->_privacyLink, "setDisplayIcon:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController view](self, "view"));
  objc_msgSend(v12, "bounds");
  v14 = v13;
  LODWORD(v13) = 1148846080;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v14, 0.0, v13, v15);
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v20, v17 + 25.0);

  -[CHFriendInboxTableViewController addChildViewController:](self, "addChildViewController:", self->_privacyLink);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v22, "_setDrawsSeparatorAtTopOfSections:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v23, "setIndicatorStyle:", 2);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v25, "setTableFooterView:", v24);

  -[OBPrivacyLinkController didMoveToParentViewController:](self->_privacyLink, "didMoveToParentViewController:", self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SHARING"), &stru_1007AE1D0, CFSTR("Localizable")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v28, "setTitle:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v29, "setBackButtonDisplayMode:", 2);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "addObserver:selector:name:object:", self, "_friendDataWasUpdated:", kASFriendListChangedNotificationKey, 0);
  v31 = (CHCloudDeviceProvider *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext cloudDeviceProvider](self->_fitnessAppContext, "cloudDeviceProvider"));
  cloudDeviceProvider = self->_cloudDeviceProvider;
  self->_cloudDeviceProvider = v31;

  -[CHFriendInboxTableViewController _updateSections](self, "_updateSections");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxTableViewController;
  -[CHFriendInboxTableViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  void *v39;
  CGFloat MidY;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  CGFloat v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49.receiver = self;
  v49.super_class = (Class)CHFriendInboxTableViewController;
  -[CHFriendInboxTableViewController viewDidLayoutSubviews](&v49, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tabBarController](self, "tabBarController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tabBar"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
    objc_msgSend(v14, "bounds");
    v16 = v15;

    objc_msgSend(v13, "frame");
    v9 = v16 - v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setContentInset:", v5, v7, v9, v11);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController view](self, "view"));
  objc_msgSend(v20, "bounds");
  v22 = v21;
  LODWORD(v21) = 1148846080;
  LODWORD(v23) = 1112014848;
  objc_msgSend(v19, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v22, 0.0, v21, v23);
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  objc_msgSend(v26, "bounds");
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
  objc_msgSend(v29, "setBounds:", 0.0, 0.0, v28, v25 + 25.0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  v31 = (uint64_t)objc_msgSend(v30, "numberOfSections");

  v32 = v31 - 1;
  if (v31 < 1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v35, "center");
    v47 = v46;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v37, "bounds");
    v48 = CGRectGetMidY(v52) + 25.0;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v42, "setCenter:", v47, v48);
    goto LABEL_8;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  v34 = (uint64_t)objc_msgSend(v33, "numberOfRowsInSection:", v32);

  if (v34 >= 1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v34 - 1, v32));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "cellForRowAtIndexPath:", v35));

    if (!v37)
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v37, "frame");
    v38 = CGRectGetMaxY(v50) + 5.0;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v39, "bounds");
    MidY = CGRectGetMidY(v51);
    v41 = sub_10008443C(v38 + MidY, v25);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v42, "center");
    v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v45, "setCenter:", v44, v41);

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CHFriendInboxTableViewController;
  -[CHFriendInboxTableViewController dealloc](&v4, "dealloc");
}

- (void)_inviteFriends
{
  id v3;
  id v4;
  CHAddFriendViewController *v5;

  if (-[ASFriendListSectionManager hasReachedMaxNumberOfFriends](self->_friendListManager, "hasReachedMaxNumberOfFriends"))
  {
    v3 = sub_1000A8A50();
    v5 = (CHAddFriendViewController *)objc_claimAutoreleasedReturnValue(v3);
    -[CHFriendInboxTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");
  }
  else
  {
    sub_1000A34A0();
    v5 = -[CHAddFriendViewController initWithFriendListManager:friendManager:]([CHAddFriendViewController alloc], "initWithFriendListManager:friendManager:", self->_friendListManager, self->_friendManager);
    -[CHAddFriendViewController setDelegate:](v5, "setDelegate:", self);
    v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
    -[CHFriendInboxTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)_doneButtonTapped
{
  -[CHFriendInboxTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)incomingTableViewCellDidTapAccept:(id)a3
{
  id v4;
  id v5;
  void *v6;
  CHFriendManager *friendManager;
  uint64_t v8;
  id v9;
  void *v10;
  CHFriendManager *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "type");
  if (v5)
  {
    if (v5 == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friend"));
      friendManager = self->_friendManager;
      v8 = FIExperienceTypeWithHealthStore(self->_healthStore);
      sub_1000A8C78(self, v6, friendManager, v8);

    }
  }
  else if (-[ASFriendListSectionManager hasReachedMaxNumberOfFriends](self->_friendListManager, "hasReachedMaxNumberOfFriends"))
  {
    v9 = sub_1000A8A50();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    sub_1000A8BB8(v10);

  }
  else
  {
    v11 = self->_friendManager;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friend"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B1414;
    v13[3] = &unk_100778518;
    objc_copyWeak(&v14, &location);
    -[CHFriendManager acceptInvitationFromFriend:completion:](v11, "acceptInvitationFromFriend:completion:", v12, v13);

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);

}

- (void)incomingTableViewCellDidTapIgnore:(id)a3
{
  id v4;
  id v5;
  CHFriendManager *v6;
  void *v7;
  id *v8;
  CHFriendManager *friendManager;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "type");
  if (!v5)
  {
    friendManager = self->_friendManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friend"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000B160C;
    v12[3] = &unk_100778518;
    v8 = &v13;
    objc_copyWeak(&v13, &location);
    -[CHFriendManager ignoreInvitationFromFriend:completion:](friendManager, "ignoreInvitationFromFriend:completion:", v7, v12);
    goto LABEL_5;
  }
  if (v5 == (id)1)
  {
    v6 = self->_friendManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friend"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B1694;
    v10[3] = &unk_100778518;
    v8 = &v11;
    objc_copyWeak(&v11, &location);
    -[CHFriendManager ignoreCompetitionRequestFromFriend:completion:](v6, "ignoreCompetitionRequestFromFriend:completion:", v7, v10);
LABEL_5:

    objc_destroyWeak(v8);
  }
  objc_destroyWeak(&location);

}

- (void)_presentErrorAlertWithMessage:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B1794;
  block[3] = &unk_100777E20;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_presentedViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windows"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSMutableDictionary count](self->_friendListSectionsByType, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  NSMutableDictionary *friendListSectionsByType;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int64_t v11;

  v5 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a4);
  friendListSectionsByType = self->_friendListSectionsByType;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rows"));
  v10 = objc_msgSend(v9, "count");
  if (v5 == 7)
    v11 = (int64_t)v10 + 1;
  else
    v11 = (int64_t)v10;

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  NSMutableDictionary *friendListSectionsByType;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  v8 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v7, "section"));
  friendListSectionsByType = self->_friendListSectionsByType;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v10));

  v12 = objc_msgSend(v7, "row");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rows"));
  if (v12 >= objc_msgSend(v13, "count"))
  {
    v15 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rows"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  }
  switch(v8)
  {
    case 0:
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("IncomingCell"), v7));
      objc_msgSend(v28, "setSelectionStyle:", 0);
      v17 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
      objc_msgSend(v17, "setFriend:", v29);

      objc_msgSend(v17, "setDelegate:", self);
      objc_msgSend(v17, "setType:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor as_lightCompetitionGold](UIColor, "as_lightCompetitionGold"));
      objc_msgSend(v17, "setAcceptTintColor:", v30);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor as_darkCompetitionGold](UIColor, "as_darkCompetitionGold"));
      objc_msgSend(v17, "setIgnoreTintColor:", v18);

      goto LABEL_19;
    case 1:
    case 5:
    case 6:
      goto LABEL_5;
    case 2:
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("OutgoingCell"), v7));
      objc_msgSend(v31, "setSelectionStyle:", 0);
      v17 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
      objc_msgSend(v17, "setFriend:", v32);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "as_competitionRequestDurationRemainingString"));
      goto LABEL_16;
    case 3:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("IncomingCell"), v7));
      objc_msgSend(v20, "setSelectionStyle:", 0);
      v17 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
      objc_msgSend(v17, "setFriend:", v21);

      objc_msgSend(v17, "setDelegate:", self);
      objc_msgSend(v17, "setType:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nonGradientTextColor"));
      objc_msgSend(v17, "setAcceptTintColor:", v23);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nonGradientTextColor"));
      objc_msgSend(v17, "setIgnoreTintColor:", v19);
      goto LABEL_17;
    case 4:
      v34 = objc_opt_class(CHAddFriendFriendListRow, v16);
      if ((objc_opt_isKindOfClass(v15, v34) & 1) == 0)
        goto LABEL_5;
      v27 = CFSTR("Add");
      goto LABEL_14;
    case 7:
      v24 = objc_msgSend(v7, "row");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rows"));
      v26 = objc_msgSend(v25, "count");

      if (v24 == v26)
      {
        v27 = CFSTR("LegacyDevicesCell");
LABEL_14:
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v27, v7));
        objc_msgSend(v17, "setSelectionStyle:", 3);
      }
      else
      {
LABEL_5:
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v7));
        objc_msgSend(v17, "setSelectionStyle:", 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "snapshot"));
        objc_msgSend(v17, "setFriend:snapshot:animated:", v18, v19, 0);
LABEL_18:

LABEL_19:
      }
LABEL_20:

      return v17;
    case 8:
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("OutgoingCell"), v7));
      objc_msgSend(v35, "setSelectionStyle:", 0);
      v17 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
      objc_msgSend(v17, "setFriend:", v36);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "as_invitedDurationString"));
LABEL_16:
      v19 = (void *)v33;
      objc_msgSend(v17, "setDetailText:", v33);
LABEL_17:

      goto LABEL_18;
    default:
      v17 = 0;
      goto LABEL_20;
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[CHFriendInboxTableViewController _isIndexPathEditable:](self, "_isIndexPathEditable:", a4);
}

- (BOOL)_isIndexPathEditable:(id)a3
{
  id v4;
  int64_t v5;
  NSMutableDictionary *friendListSectionsByType;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v4 = a3;
  v5 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v4, "section"));
  if (v5 == 8)
  {
    LOBYTE(v12) = 1;
  }
  else if (v5 == 3)
  {
    friendListSectionsByType = self->_friendListSectionsByType;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rows"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friend"));
    v12 = objc_msgSend(v11, "isAwaitingInviteResponseFromMe") ^ 1;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return -[CHFriendInboxTableViewController _isIndexPathEditable:](self, "_isIndexPathEditable:", a4);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  NSMutableDictionary *friendListSectionsByType;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void ***v17;
  CHFriendManager *v18;
  void *v19;
  CHFriendManager *friendManager;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, char);
  void *v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v9, "section"));
  if (a4 == 1)
  {
    v11 = v10;
    if (-[CHFriendInboxTableViewController _isIndexPathEditable:](self, "_isIndexPathEditable:", v9))
    {
      friendListSectionsByType = self->_friendListSectionsByType;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rows"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v9, "row")));

      objc_initWeak(&location, self);
      objc_msgSend(v8, "setEditing:animated:", 0, 1);
      v21 = _NSConcreteStackBlock;
      v22 = 3221225472;
      v23 = sub_1000B211C;
      v24 = &unk_100778518;
      objc_copyWeak(&v25, &location);
      v17 = objc_retainBlock(&v21);
      if (v11 == 3)
      {
        friendManager = self->_friendManager;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "friend", v21, v22, v23, v24));
        -[CHFriendManager removeFriend:completion:](friendManager, "removeFriend:completion:", v19, v17);
      }
      else
      {
        if (v11 != 8)
        {
LABEL_8:

          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);

          goto LABEL_9;
        }
        v18 = self->_friendManager;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "friend", v21, v22, v23, v24));
        -[CHFriendManager withdrawInvitationToFriend:completion:](v18, "withdrawInvitationToFriend:completion:", v19, v17);
      }

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  NSMutableDictionary *friendListSectionsByType;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  CHLegacyDevicesViewController *v14;
  id v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (**makeFriendDetailViewControllerBlock)(id, void *);
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  v7 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v6, "section"));
  friendListSectionsByType = self->_friendListSectionsByType;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v9));

  if (v7 != 3 && v7 != 8)
  {
    if (v7 == 7
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rows")),
          v12 = objc_msgSend(v11, "count"),
          v13 = objc_msgSend(v6, "row"),
          v11,
          v12 == v13))
    {
      v14 = -[CHLegacyDevicesViewController initWithFitnessAppContext:]([CHLegacyDevicesViewController alloc], "initWithFitnessAppContext:", self->_fitnessAppContext);
      v15 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController navigationController](self, "navigationController"));
      objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

    }
    else
    {
      v17 = self->_friendListSectionsByType;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
      v14 = (CHLegacyDevicesViewController *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHLegacyDevicesViewController rows](v14, "rows"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

      v21 = objc_opt_class(CHAddFriendFriendListRow, v20);
      if ((objc_opt_isKindOfClass(v15, v21) & 1) != 0)
      {
        -[CHFriendInboxTableViewController _inviteFriends](self, "_inviteFriends");
      }
      else
      {
        makeFriendDetailViewControllerBlock = (uint64_t (**)(id, void *))self->_makeFriendDetailViewControllerBlock;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friend"));
        v24 = makeFriendDetailViewControllerBlock[2](makeFriendDetailViewControllerBlock, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController navigationController](self, "navigationController"));
        objc_msgSend(v26, "pushViewController:animated:", v25, 1);

      }
    }
    objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  +[CHFriendInboxTableViewCell preferredHeight](CHFriendInboxTableViewCell, "preferredHeight", a3, a4);
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[CHFriendInboxTableViewCell preferredHeight](CHFriendInboxTableViewCell, "preferredHeight", a3, a4);
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  NSBundle *v10;
  const __CFString *v11;

  switch(-[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a4))
  {
    case 0:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("COMPETITION_INBOX_INCOMING_HEADER");
      goto LABEL_12;
    case 1:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("COMPETITION_INBOX_CURRENTLY_COMPETING_HEADER");
      goto LABEL_12;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("COMPETITION_INBOX_OUTGOING_HEADER");
      goto LABEL_12;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("SHARING_INBOX_PENDING");
      goto LABEL_12;
    case 4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("SHARING_INBOX_ACTIVE");
      goto LABEL_12;
    case 5:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("SHARING_INBOX_HIDING");
      goto LABEL_12;
    case 6:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("SHARING_INBOX_HIDDEN");
      goto LABEL_12;
    case 7:
      v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = v6;
      v8 = CFSTR("SHARING_INBOX_AWAITING_DOWNGRADE");
      v11 = CFSTR("Localizable-tetra");
      goto LABEL_13;
    case 8:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("SHARING_INBOX_WAITING");
LABEL_12:
      v11 = CFSTR("Localizable");
LABEL_13:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1007AE1D0, v11));

      break;
    default:
      v9 = 0;
      break;
  }
  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((unint64_t)-[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a5) <= 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor as_lightCompetitionGold](UIColor, "as_lightCompetitionGold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

  }
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = sub_1000B2868(self->_friendListSectionsByType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ((unint64_t)objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
    v7 = (unint64_t)objc_msgSend(v6, "integerValue");

    if (v7 > 8)
      v7 = 3;
  }

  return v7;
}

- (void)_updateSections
{
  NSMutableDictionary *v3;
  NSMutableDictionary *friendListSectionsByType;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  unsigned int v35;
  CHAddFriendFriendListRow *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CHAddFriendFriendListRow *v41;

  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  friendListSectionsByType = self->_friendListSectionsByType;
  self->_friendListSectionsByType = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsRequestingMeToCompete](self->_friendListManager, "sectionForFriendsRequestingMeToCompete"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rows"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v5, &off_1007B3CC8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsCompetingWithMe](self->_friendListManager, "sectionForFriendsCompetingWithMe"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rows"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v8, &off_1007B3CE0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsRequestedToCompeteByMe](self->_friendListManager, "sectionForFriendsRequestedToCompeteByMe"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rows"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v11, &off_1007B3CF8);
  v38 = v11;
  v39 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsInvitingMe](self->_friendListManager, "sectionForFriendsInvitingMe"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rows"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v14, &off_1007B3D10);
  v37 = v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsWithNoHiding](self->_friendListManager, "sectionForFriendsWithNoHiding"));
  v36 = objc_alloc_init(CHAddFriendFriendListRow);
  v41 = v36;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rows"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19));

  v21 = objc_alloc((Class)ASFriendListSection);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
  v23 = objc_msgSend(v21, "initWithDate:andRows:", v22, v20);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v23, &off_1007B3D28);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsMyDataIsHiddenFrom](self->_friendListManager, "sectionForFriendsMyDataIsHiddenFrom"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rows"));
  v26 = objc_msgSend(v25, "count");

  if (v26)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v24, &off_1007B3D40);
  v40 = v5;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsHidingDataFromMe](self->_friendListManager, "sectionForFriendsHidingDataFromMe"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rows"));
  v29 = objc_msgSend(v28, "count");

  if (v29)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v27, &off_1007B3D58);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsInvitedByMe](self->_friendListManager, "sectionForFriendsInvitedByMe"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rows"));
  v32 = objc_msgSend(v31, "count");

  if (v32)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v30, &off_1007B3D70);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsRequestedToDowngradeByMe](self->_friendListManager, "sectionForFriendsRequestedToDowngradeByMe"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "rows"));
  if (objc_msgSend(v34, "count"))
  {
    v35 = -[CHCloudDeviceProvider oldDevicesExist](self->_cloudDeviceProvider, "oldDevicesExist");

    if (v35)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendListSectionsByType, "setObject:forKeyedSubscript:", v33, &off_1007B3D88);
  }
  else
  {

  }
}

- (void)_friendDataWasUpdated:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B2CC0;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeCellFromTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSMutableDictionary *friendListSectionsByType;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v6, "section"));
  friendListSectionsByType = self->_friendListSectionsByType;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rows"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));

  objc_msgSend(v12, "removeObjectAtIndex:", objc_msgSend(v6, "row"));
  v13 = objc_alloc((Class)ASFriendListSection);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
  v15 = objc_msgSend(v13, "initWithDate:andRows:", v14, v12);
  v16 = self->_friendListSectionsByType;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  v20 = v6;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v18, "deleteRowsAtIndexPaths:withRowAnimation:", v19, 0);

}

- (void)removeCellAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  NSMutableDictionary *friendListSectionsByType;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v4, "section"));
  friendListSectionsByType = self->_friendListSectionsByType;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rows"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v9));

  objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(v4, "row"));
  v11 = objc_alloc((Class)ASFriendListSection);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v13 = objc_msgSend(v11, "initWithDate:andRows:", v12, v10);
  v14 = self->_friendListSectionsByType;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](self, "tableView"));
  v18 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));

  objc_msgSend(v16, "deleteRowsAtIndexPaths:withRowAnimation:", v17, 100);
}

- (void)reloadDataAnimated:(BOOL)a3
{
  CHFriendInboxTableViewController *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *j;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSNumber *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSNumber *v40;
  void *v41;
  char *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned __int8 v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  void *k;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  void *m;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *n;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  NSMutableDictionary *friendListSectionsByType;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id obj;
  uint64_t v118;
  void *v119;
  void *v120;
  char *v121;
  char *v122;
  id v123;
  CHFriendInboxTableViewController *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];

  v3 = self;
  if (a3)
  {
    v4 = -[NSMutableDictionary copy](self->_friendListSectionsByType, "copy");
    -[CHFriendInboxTableViewController _updateSections](v3, "_updateSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3->_friendListSectionsByType, "allKeys"));
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v157, v168, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v158;
      v11 = &__NSArray0__struct;
      v12 = &__NSArray0__struct;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v158 != v10)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) != 0)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrayByAddingObject:", v14));
            v16 = v11;
            v11 = (void *)v15;
          }
          else
          {
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObject:", v14));
            v16 = v12;
            v12 = (void *)v17;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v157, v168, 16);
      }
      while (v9);
    }
    else
    {
      v11 = &__NSArray0__struct;
      v12 = &__NSArray0__struct;
    }

    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    obj = v6;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v154;
      v21 = &__NSArray0__struct;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v154 != v20)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v7, "containsObject:", v23) & 1) == 0)
          {
            v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrayByAddingObject:", v23));

            v21 = (void *)v24;
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
      }
      while (v19);
    }
    else
    {
      v21 = &__NSArray0__struct;
    }
    v127 = v11;

    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v116 = v12;
    v25 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v150;
      v28 = &__NSArray0__struct;
      do
      {
        v29 = 0;
        v30 = v28;
        do
        {
          if (*(_QWORD *)v150 != v27)
            objc_enumerationMutation(v116);
          v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000B3C64((uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)v29), "integerValue"), v4));
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "arrayByAddingObject:", v32));

          v29 = (char *)v29 + 1;
          v30 = v28;
        }
        while (v26 != v29);
        v26 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
      }
      while (v26);
    }
    else
    {
      v28 = &__NSArray0__struct;
    }
    v110 = v28;

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v33 = v21;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v145, v165, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v146;
      v37 = &__NSArray0__struct;
      do
      {
        v38 = 0;
        v39 = v37;
        do
        {
          if (*(_QWORD *)v146 != v36)
            objc_enumerationMutation(v33);
          v40 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000B3C64((uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)v38), "integerValue"), v3->_friendListSectionsByType));
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "arrayByAddingObject:", v41));

          v38 = (char *)v38 + 1;
          v39 = v37;
        }
        while (v35 != v38);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v145, v165, 16);
      }
      while (v35);
    }
    else
    {
      v37 = &__NSArray0__struct;
    }
    v111 = v37;
    v113 = v33;
    v114 = v7;

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v115 = v127;
    v120 = v4;
    v121 = (char *)objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v141, v164, 16);
    v124 = v3;
    if (v121)
    {
      v118 = *(_QWORD *)v142;
      v125 = &__NSArray0__struct;
      v128 = &__NSArray0__struct;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v142 != v118)
            objc_enumerationMutation(v115);
          v122 = v42;
          v43 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v43));
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3->_friendListSectionsByType, "objectForKeyedSubscript:", v43));
          v46 = sub_1000B3C64((uint64_t)objc_msgSend(v43, "integerValue"), v4);
          v47 = sub_1000B3C64((uint64_t)objc_msgSend(v43, "integerValue"), v3->_friendListSectionsByType);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "rows"));
          v49 = objc_msgSend(v48, "count");

          if (v49)
          {
            v50 = 0;
            do
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "rows"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectAtIndexedSubscript:", v50));

              v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v50, v46));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "rows"));
              v55 = objc_msgSend(v54, "containsObject:", v52);

              if ((v55 & 1) == 0)
              {
                v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "arrayByAddingObject:", v53));

                v125 = (void *)v56;
              }

              ++v50;
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "rows"));
              v58 = objc_msgSend(v57, "count");

            }
            while (v50 < (unint64_t)v58);
          }
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "rows"));
          v60 = objc_msgSend(v59, "count");

          if (v60)
          {
            v61 = 0;
            v4 = v120;
            do
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "rows"));
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectAtIndexedSubscript:", v61));

              v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v61, v47));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "rows"));
              v66 = objc_msgSend(v65, "containsObject:", v63);

              if ((v66 & 1) == 0)
              {
                v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "arrayByAddingObject:", v64));

                v128 = (id)v67;
              }

              ++v61;
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "rows"));
              v69 = objc_msgSend(v68, "count");

            }
            while (v61 < (unint64_t)v69);
          }
          else
          {
            v4 = v120;
          }

          v42 = v122 + 1;
          v3 = v124;
        }
        while (v122 + 1 != v121);
        v121 = (char *)objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v141, v164, 16);
      }
      while (v121);
    }
    else
    {
      v125 = &__NSArray0__struct;
      v128 = &__NSArray0__struct;
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
    objc_msgSend(v70, "beginUpdates");

    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v71 = v110;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v138;
      do
      {
        for (k = 0; k != v73; k = (char *)k + 1)
        {
          if (*(_QWORD *)v138 != v74)
            objc_enumerationMutation(v71);
          v76 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)k);
          v77 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v76, "integerValue")));
          objc_msgSend(v77, "deleteSections:withRowAnimation:", v78, 100);

        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
      }
      while (v73);
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
    objc_msgSend(v79, "deleteRowsAtIndexPaths:withRowAnimation:", v125, 100);

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v80 = v111;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v133, v162, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v134;
      do
      {
        for (m = 0; m != v82; m = (char *)m + 1)
        {
          if (*(_QWORD *)v134 != v83)
            objc_enumerationMutation(v80);
          v85 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)m);
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v85, "integerValue")));
          objc_msgSend(v86, "insertSections:withRowAnimation:", v87, 100);

        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v133, v162, 16);
      }
      while (v82);
    }
    v119 = v71;
    v112 = v80;

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
    objc_msgSend(v88, "insertRowsAtIndexPaths:withRowAnimation:", v128, 100);

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
    objc_msgSend(v89, "endUpdates");

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "indexPathsForVisibleRows"));

    v123 = v91;
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v129, v161, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v130;
      do
      {
        for (n = 0; n != v93; n = (char *)n + 1)
        {
          if (*(_QWORD *)v130 != v94)
            objc_enumerationMutation(v123);
          v96 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)n);
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "cellForRowAtIndexPath:", v96));

          v99 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](v3, "_sectionTypeForSectionIndex:", objc_msgSend(v96, "section"));
          friendListSectionsByType = v3->_friendListSectionsByType;
          v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v99));
          v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](friendListSectionsByType, "objectForKeyedSubscript:", v101));

          v103 = objc_msgSend(v96, "row");
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "rows"));
          v105 = objc_msgSend(v104, "count");

          if (v103 < v105)
          {
            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "rows"));
            v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectAtIndexedSubscript:", objc_msgSend(v96, "row")));

            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "friend"));
            if ((objc_opt_respondsToSelector(v98, "setFriend:snapshot:animated:") & 1) != 0)
            {
              v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "snapshot"));
              objc_msgSend(v98, "setFriend:snapshot:animated:", v108, v109, 1);

            }
            else if ((objc_opt_respondsToSelector(v98, "setFriend:") & 1) != 0)
            {
              objc_msgSend(v98, "setFriend:", v108);
            }

          }
          v3 = v124;
        }
        v93 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v129, v161, 16);
      }
      while (v93);
    }

  }
  else
  {
    -[CHFriendInboxTableViewController _updateSections](self, "_updateSections");
    v126 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewController tableView](v3, "tableView"));
    objc_msgSend(v126, "reloadData");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudDeviceProvider, 0);
  objc_storeStrong(&self->_makeFriendDetailViewControllerBlock, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_friendListSectionsByType, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
}

@end
