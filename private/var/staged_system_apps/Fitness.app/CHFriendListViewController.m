@implementation CHFriendListViewController

- (CHFriendListViewController)init
{

  return 0;
}

- (CHFriendListViewController)initWithStyle:(int64_t)a3
{

  return 0;
}

- (CHFriendListViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (CHFriendListViewController)initWithCoder:(id)a3
{

  return 0;
}

- (CHFriendListViewController)initWithFriendListManager:(id)a3 andWithFriendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  CHFriendListViewController *v20;
  CHFriendListViewController *v21;
  ASFriendListDisplayContext *v22;
  ASFriendListDisplayContext *friendListDisplayContext;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSMutableDictionary *cellHeightCache;
  uint64_t v31;
  ASCompetitionScoreViewConfiguration *competitionScoreConfiguration;
  void *v33;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v17 = a3;
  v42 = a4;
  v41 = a5;
  v40 = a6;
  v39 = a7;
  v38 = a8;
  v37 = a9;
  v18 = a10;
  v19 = a11;
  v43.receiver = self;
  v43.super_class = (Class)CHFriendListViewController;
  v20 = -[CHFriendListViewController initWithStyle:](&v43, "initWithStyle:", 0);
  v21 = v20;
  if (v20)
  {
    v35 = v17;
    objc_storeStrong((id *)&v20->_friendListManager, a3);
    objc_storeStrong((id *)&v21->_friendManager, a4);
    objc_storeStrong((id *)&v21->_achievementsDataProvider, a5);
    objc_storeStrong((id *)&v21->_workoutsDataProvider, a6);
    objc_storeStrong((id *)&v21->_workoutFormattingManager, a7);
    objc_storeStrong((id *)&v21->_formattingManager, a8);
    objc_storeStrong((id *)&v21->_imageFactory, a9);
    v21->_hasAnyFriends = -[ASFriendListSectionManager hasAnyFriendsSetup](v21->_friendListManager, "hasAnyFriendsSetup");
    v22 = objc_opt_new(ASFriendListDisplayContext);
    friendListDisplayContext = v21->_friendListDisplayContext;
    v21->_friendListDisplayContext = v22;

    -[ASFriendListDisplayContext setDisplayFilter:](v21->_friendListDisplayContext, "setDisplayFilter:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("CHFriendListDisplayMode")));

    if (v25 && (objc_opt_class(NSNumber, v26), (objc_opt_isKindOfClass(v25, v27) & 1) != 0))
      v28 = objc_msgSend(v25, "integerValue");
    else
      v28 = 0;
    -[ASFriendListDisplayContext setDisplayMode:](v21->_friendListDisplayContext, "setDisplayMode:", v28);
    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cellHeightCache = v21->_cellHeightCache;
    v21->_cellHeightCache = (NSMutableDictionary *)v29;

    v31 = objc_claimAutoreleasedReturnValue(+[ASCompetitionScoreViewConfiguration companionFriendListConfiguration](ASCompetitionScoreViewConfiguration, "companionFriendListConfiguration"));
    competitionScoreConfiguration = v21->_competitionScoreConfiguration;
    v21->_competitionScoreConfiguration = (ASCompetitionScoreViewConfiguration *)v31;

    objc_storeStrong((id *)&v21->_healthStore, a10);
    objc_storeStrong((id *)&v21->_fitnessAppContext, a11);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "addObserver:selector:name:object:", v21, "_contentSizeCategoryDidChangeNotification:", UIContentSizeCategoryDidChangeNotification, 0);

    v17 = v35;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CHFriendListViewController;
  -[CHFriendListViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CHFriendListViewController;
  -[CHFriendListViewController loadView](&v19, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_opt_class(CHFriendListCompetitionTableViewCell, v4);
  v6 = v5;
  objc_opt_class(CHFriendListCompetitionTableViewCell, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_opt_class(CHFriendListTableViewCell, v12);
  v14 = v13;
  objc_opt_class(CHFriendListTableViewCell, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", v14, v18);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *sortBarButtonItem;
  CHFriendInboxBarButtonView *v18;
  CHFriendInboxBarButtonView *inboxButtonView;
  UIBarButtonItem *v20;
  UIBarButtonItem *inboxBarButtonItem;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CHFriendListViewController;
  -[CHFriendListViewController viewDidLoad](&v30, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SHARING"), &stru_1007AE1D0, CFSTR("Localizable")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setSectionHeaderTopPadding:", 0.0);

  v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setTableFooterView:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setLargeTitleDisplayMode:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController _sortMenu](self, "_sortMenu"));
  v13 = objc_alloc((Class)UIBarButtonItem);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SORT"), &stru_1007AE1D0, CFSTR("Localizable")));
  v16 = (UIBarButtonItem *)objc_msgSend(v13, "initWithTitle:menu:", v15, v12);
  sortBarButtonItem = self->_sortBarButtonItem;
  self->_sortBarButtonItem = v16;

  v18 = objc_opt_new(CHFriendInboxBarButtonView);
  inboxButtonView = self->_inboxButtonView;
  self->_inboxButtonView = v18;

  -[CHFriendInboxBarButtonView setDelegate:](self->_inboxButtonView, "setDelegate:", self);
  v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_inboxButtonView);
  inboxBarButtonItem = self->_inboxBarButtonItem;
  self->_inboxBarButtonItem = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v22, "setSeparatorStyle:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v23, "setIndicatorStyle:", 2);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v24, "setBackButtonDisplayMode:", 2);

  v25 = objc_alloc_init((Class)UIRefreshControl);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v26, "setRefreshControl:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "refreshControl"));
  objc_msgSend(v28, "addTarget:action:forEvents:", self, "_refreshControlValueChanged", 4096);

  self->_cellsNeedUpdate = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v29, "addObserver:selector:name:object:", self, "_friendDataWasUpdated:", kASFriendListChangedNotificationKey, 0);
  -[CHFriendListViewController _updateSectionsForCurrentDisplayContext](self, "_updateSectionsForCurrentDisplayContext");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendListViewController;
  -[CHFriendListViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (!self->_haveLoggedInitialDisplayContext)
  {
    -[CHFriendListViewController _logFriendListDisplayMode:](self, "_logFriendListDisplayMode:", -[ASFriendListDisplayContext displayMode](self->_friendListDisplayContext, "displayMode"));
    self->_haveLoggedInitialDisplayContext = 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHFriendListViewController;
  -[CHFriendListViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CHFriendListViewController _layoutPrivacyLinkIfNecessary](self, "_layoutPrivacyLinkIfNecessary");
}

- (void)_layoutPrivacyLinkIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double Height;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  if (self->_privacyLink)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController view](self, "view"));
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    LODWORD(v9) = 1148846080;
    LODWORD(v10) = 1112014848;
    objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 0.0, v9, v10);
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tabBarController](self, "tabBarController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tabBar"));
    objc_msgSend(v14, "frame");
    Height = CGRectGetHeight(v26);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationController](self, "navigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationBar"));
    objc_msgSend(v17, "frame");
    v18 = CGRectGetHeight(v27);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windows"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "windowScene"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "statusBarManager"));
    objc_msgSend(v23, "statusBarFrame");
    v24 = CGRectGetHeight(v28);

    v25 = (id)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
    objc_msgSend(v25, "setFrame:", 0.0, v7 - v12 + -10.0 - Height - v18 - v24, v5, v12);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)showDetailForMeOnDate:(id)a3
{
  id v3;
  _QWORD v4[4];
  CHFriendListViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D12FC;
  v4[3] = &unk_100777EE0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[CHFriendListViewController _performAfterFriendDataIsAvailable:](v5, "_performAfterFriendDataIsAvailable:", v4);

}

- (void)showDetailForFriendWithUUID:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  CHFriendListViewController *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D13F0;
  v7[3] = &unk_1007790B8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[CHFriendListViewController _performAfterFriendDataIsAvailable:](v8, "_performAfterFriendDataIsAvailable:", v7);

}

- (void)showInbox
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000D1494;
  v2[3] = &unk_100777E20;
  v2[4] = self;
  -[CHFriendListViewController _performAfterFriendDataIsAvailable:](self, "_performAfterFriendDataIsAvailable:", v2);
}

- (void)scrollToTop
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  if ((uint64_t)objc_msgSend(v6, "numberOfSections") >= 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
    v4 = (uint64_t)objc_msgSend(v3, "numberOfRowsInSection:", 0);

    if (v4 < 1)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
    objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 1, 1);

  }
}

- (id)_makeFriendDetailViewControllerForSection:(id)a3 row:(id)a4
{
  id v6;
  id v7;
  CHFriendDetailCollectionViewController *v8;
  ASFriendListSectionManager *friendListManager;
  CHFriendManager *friendManager;
  void *v11;
  void *v12;
  void *v13;
  CHFriendDetailCollectionViewController *v14;

  v6 = a4;
  v7 = a3;
  v8 = [CHFriendDetailCollectionViewController alloc];
  friendListManager = self->_friendListManager;
  friendManager = self->_friendManager;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "friend"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  v14 = -[CHFriendDetailCollectionViewController initWithFriendListManager:friendManager:friend:snapshot:snapshotDate:achievementsDataProvider:workoutDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:](v8, "initWithFriendListManager:friendManager:friend:snapshot:snapshotDate:achievementsDataProvider:workoutDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:", friendListManager, friendManager, v11, v12, v13, self->_achievementsDataProvider, self->_workoutsDataProvider, self->_workoutFormattingManager, self->_formattingManager, self->_imageFactory, self->_healthStore, self->_fitnessAppContext);

  return v14;
}

- (void)_pushDetailViewControllerForSection:(id)a3 row:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController _makeFriendDetailViewControllerForSection:row:](self, "_makeFriendDetailViewControllerForSection:row:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_showDetailForFriend:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  id v41;
  CHFriendListViewController *v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v8 = self->_friendListSections;
  v9 = v7;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        v19 = v18;

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        v22 = v21;

        if (v16 >= v19 && v16 < v22)
        {
          v24 = v14;
          goto LABEL_14;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v11)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_14:

  if (v24)
  {
    v26 = v6;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rows"));
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v27)
    {
      v41 = v24;
      v42 = self;
      v43 = v6;
      v28 = *(_QWORD *)v46;
      while (2)
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v26, "isMe", v41, v42, v43))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "friend"));
            v32 = objc_msgSend(v31, "isMe");

            if ((v32 & 1) != 0)
              goto LABEL_26;
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "friend"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUID"));
          v36 = objc_msgSend(v33, "isEqual:", v35);

          if ((v36 & 1) != 0)
          {
LABEL_26:
            v27 = v30;
            goto LABEL_27;
          }
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v27)
          continue;
        break;
      }
LABEL_27:
      self = v42;
      v6 = v43;
      v24 = v41;
    }

    if (v27)
    {
      -[CHFriendListViewController _pushDetailViewControllerForSection:row:](self, "_pushDetailViewControllerForSection:row:", v24, v27);
    }
    else
    {
      ASLoggingInitialize(v37);
      v40 = (void *)ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_ERROR))
        sub_1005F310C(v40, v26);
    }

  }
  else
  {
    ASLoggingInitialize(v25);
    v38 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_ERROR))
      sub_1005F30A0((uint64_t)v9, v38, v39);
  }

}

- (void)_performAfterFriendDataIsAvailable:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  id v7;
  id blockWaitingOnFriendData;
  uint8_t v9[16];

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_friendListSections)
  {
    v4[2](v4);
  }
  else
  {
    ASLoggingInitialize(v5);
    v6 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for friend data", v9, 2u);
    }
    v7 = objc_msgSend(v4, "copy");
    blockWaitingOnFriendData = self->_blockWaitingOnFriendData;
    self->_blockWaitingOnFriendData = v7;

  }
}

- (id)_sortMenu
{
  id v3;
  id v4;
  ASFriendListSectionManager *friendListManager;
  id v6;
  id v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(id *, id);
  void *v13;
  id v14;
  id v15[2];
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[ASFriendListDisplayContext displayMode](self->_friendListDisplayContext, "displayMode");
  friendListManager = self->_friendListManager;
  v6 = -[ASFriendListDisplayContext displayFilter](self->_friendListDisplayContext, "displayFilter");
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000D1C70;
  v13 = &unk_10077A748;
  v15[1] = v4;
  objc_copyWeak(v15, &location);
  v7 = v3;
  v14 = v7;
  -[ASFriendListSectionManager enumerateValidDisplayModesForFilter:usingBlock:](friendListManager, "enumerateValidDisplayModesForFilter:usingBlock:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7, v10, v11, v12, v13));

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_hasAnyFriends)
    return -[NSArray count](self->_friendListSections, "count", a3);
  else
    return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rows"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *friendListSections;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  Class v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  Class v18;
  NSString *v19;
  void *v20;
  void *v21;

  v6 = a4;
  friendListSections = self->_friendListSections;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](friendListSections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rows"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  if (-[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", objc_msgSend(v6, "section")))
  {
    objc_opt_class(CHFriendListCompetitionTableViewCell, v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v15, v6));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "friend"));
    objc_msgSend(v16, "setFriend:", v17);
  }
  else
  {
    objc_opt_class(CHFriendListTableViewCell, v12);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v20, v6));

    objc_msgSend(v16, "setDisplayMode:", -[ASFriendListDisplayContext displayMode](self->_friendListDisplayContext, "displayMode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "friend"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));
    objc_msgSend(v16, "setFriend:snapshot:formattingManager:animated:", v17, v21, self->_formattingManager, 0);

  }
  objc_msgSend(v16, "setSelectionStyle:", 0);

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *friendListSections;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  friendListSections = self->_friendListSections;
  v7 = a4;
  v8 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](friendListSections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rows"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  -[CHFriendListViewController _pushDetailViewControllerForSection:row:](self, "_pushDetailViewControllerForSection:row:", v11, v10);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ASCompetitionScoreViewConfiguration *competitionScoreConfiguration;
  void *v10;
  double v11;
  double v12;
  double v13;

  v5 = a4;
  if (-[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", objc_msgSend(v5, "section")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rows"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    competitionScoreConfiguration = self->_competitionScoreConfiguration;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "friend"));
    +[CHFriendListCompetitionTableViewCell preferredHeightForConfiguration:friend:](CHFriendListCompetitionTableViewCell, "preferredHeightForConfiguration:friend:", competitionScoreConfiguration, v10);
    v12 = v11;

  }
  else
  {
    +[CHFriendListTableViewCell preferredHeight](CHFriendListTableViewCell, "preferredHeight");
    v12 = v13;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ASCompetitionScoreViewConfiguration *competitionScoreConfiguration;
  void *v11;
  double v12;
  double v13;
  NSMutableDictionary *cellHeightCache;
  void *v15;
  float v16;
  double v17;
  NSMutableDictionary *v18;
  void *v19;

  v5 = a4;
  v6 = -[ASFriendListDisplayContext displayMode](self->_friendListDisplayContext, "displayMode");
  if (-[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", objc_msgSend(v5, "section")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rows"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    competitionScoreConfiguration = self->_competitionScoreConfiguration;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "friend"));
    +[CHFriendListCompetitionTableViewCell preferredHeightForConfiguration:friend:](CHFriendListCompetitionTableViewCell, "preferredHeightForConfiguration:friend:", competitionScoreConfiguration, v11);
    v13 = v12;

LABEL_6:
    goto LABEL_7;
  }
  cellHeightCache = self->_cellHeightCache;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cellHeightCache, "objectForKeyedSubscript:", v15));

  if (!v7)
  {
    +[CHFriendListTableViewCell measuredHeightWithDisplayMode:formattingManager:](CHFriendListTableViewCell, "measuredHeightWithDisplayMode:formattingManager:", v6, self->_formattingManager);
    v13 = v17;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18 = self->_cellHeightCache;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v9, v19);

    goto LABEL_6;
  }
  objc_msgSend(v7, "floatValue");
  v13 = v16;
LABEL_7:

  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 46.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  double Height;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double Width;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  CGRect v27;
  CGRect v28;

  v6 = a3;
  objc_msgSend(v6, "rectForHeaderInSection:", a4);
  Height = CGRectGetHeight(v27);
  v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration extraProminentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "extraProminentInsetGroupedHeaderConfiguration"));
  v11 = objc_alloc((Class)UILabel);
  objc_msgSend(v6, "separatorInset");
  v13 = v12;
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v28);
  objc_msgSend(v6, "separatorInset");
  v16 = v15;

  v17 = objc_msgSend(v11, "initWithFrame:", v13, 1.0, Width + v16 * -2.0, Height);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v17, "setTextColor:", v18);

  objc_msgSend(v10, "directionalLayoutMargins");
  objc_msgSend(v17, "setDirectionalLayoutMargins:");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textProperties"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "font"));
  objc_msgSend(v17, "setFont:", v20);

  v21 = -[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", a4);
  if (v21)
  {
    v22 = ActivitySharingBundle(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FRIEND_LIST_COMPETITION_SECTION_HEADER"), &stru_1007AE1D0, CFSTR("Localizable")));
    objc_msgSend(v17, "setText:", v24);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", a4));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIDateFormattingUtilities stringWithEitherTodayOrLongStyleDateFromDate:](FIUIDateFormattingUtilities, "stringWithEitherTodayOrLongStyleDateFromDate:", v24));
    objc_msgSend(v17, "setText:", v25);

  }
  objc_msgSend(v8, "addSubview:", v17);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  char *v5;
  double result;

  v5 = (char *)objc_msgSend(a3, "numberOfSections");
  result = 14.0;
  if (v5 - 1 == (char *)a4)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  NSArray *friendListSections;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  friendListSections = self->_friendListSections;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](friendListSections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rows"));
  v10 = objc_msgSend(v7, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D2800;
  v15[3] = &unk_100779040;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController _makeFriendDetailViewControllerForSection:row:](self, "_makeFriendDetailViewControllerForSection:row:", v8, v11));
  v12 = v16;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v15, 0));

  return v13;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D2890;
  v8[3] = &unk_100777EE0;
  v8[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  v7 = v9;
  objc_msgSend(v6, "addCompletion:", v8);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _QWORD block[5];

  if (!a4 && self->_cellsNeedUpdate)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D2948;
    block[3] = &unk_100777E20;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  _QWORD block[5];

  if (self->_cellsNeedUpdate)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D29B8;
    block[3] = &unk_100777E20;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_animateOnscreenCellsToNewValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleRows"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForRowAtIndexPath:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rows"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v9, "row")));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "friend"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "snapshot"));
        objc_msgSend(v11, "setFriend:snapshot:formattingManager:animated:", v15, v16, self->_formattingManager, 1);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  self->_cellsNeedUpdate = 0;
}

- (void)_updateSectionsForCurrentDisplayContext
{
  NSArray *friendListSections;
  ASFriendListSection *v4;
  ASFriendListSection *competitionSection;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIBarButtonItem *sortBarButtonItem;
  void *v22;
  CHFriendEmptyListView *v23;
  OBPrivacyLinkController *v24;
  void *v25;
  OBPrivacyLinkController *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  CHFriendEmptyListView *emptyListView;
  CHFriendEmptyListView *v32;
  CHFriendEmptyListView *v33;
  CHFriendEmptyListView *v34;
  void *v35;
  void *v36;
  OBPrivacyLinkController *v37;
  OBPrivacyLinkController *privacyLink;
  void *v39;
  void *v40;
  UIBarButtonItem *inboxBarButtonItem;

  friendListSections = self->_friendListSections;
  self->_friendListSections = (NSArray *)&__NSArray0__struct;

  v4 = (ASFriendListSection *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsCompetingWithMe](self->_friendListManager, "sectionForFriendsCompetingWithMe"));
  competitionSection = self->_competitionSection;
  self->_competitionSection = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSection rows](self->_competitionSection, "rows"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_friendListSections, "arrayByAddingObject:", self->_competitionSection));
    v9 = self->_friendListSections;
    self->_friendListSections = v8;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionsForDisplayContext:](self->_friendListManager, "sectionsForDisplayContext:", self->_friendListDisplayContext));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_friendListSections, "arrayByAddingObjectsFromArray:", v10));
  v12 = self->_friendListSections;
  self->_friendListSections = v11;

  self->_pendingRequestCount = (unint64_t)-[ASFriendListSectionManager totalNumberOfPendingRequests](self->_friendListManager, "totalNumberOfPendingRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsHidingDataFromMe](self->_friendListManager, "sectionForFriendsHidingDataFromMe"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rows"));
  self->_hiddenFriends = (unint64_t)objc_msgSend(v14, "count");

  self->_hasAnyFriends = -[ASFriendListSectionManager hasAnyFriendsSetup](self->_friendListManager, "hasAnyFriendsSetup");
  inboxBarButtonItem = self->_inboxBarButtonItem;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &inboxBarButtonItem, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v16, "setRightBarButtonItems:", v15);

  if (self->_pendingRequestCount)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v17, 1));
    -[CHFriendInboxBarButtonView setBadgeText:](self->_inboxButtonView, "setBadgeText:", v18);

  }
  else
  {
    -[CHFriendInboxBarButtonView setBadgeText:](self->_inboxButtonView, "setBadgeText:");
  }
  if (!-[NSArray count](self->_friendListSections, "count"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v27, "setLeftBarButtonItem:", 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSectionManager sectionForFriendsInvitedByMe](self->_friendListManager, "sectionForFriendsInvitedByMe"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rows"));
    v30 = objc_msgSend(v29, "count");

    emptyListView = self->_emptyListView;
    if (emptyListView)
    {
      -[CHFriendEmptyListView updateOutgoingInvites:](emptyListView, "updateOutgoingInvites:", v30);
    }
    else
    {
      v32 = -[CHFriendEmptyListView initWithOutgoingInvites:]([CHFriendEmptyListView alloc], "initWithOutgoingInvites:", v30);
      v33 = self->_emptyListView;
      self->_emptyListView = v32;

      v34 = self->_emptyListView;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
      objc_msgSend(v35, "setBackgroundView:", v34);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
    objc_msgSend(v36, "setScrollEnabled:", 0);

    if (!self->_privacyLink)
    {
      v37 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.activity")));
      privacyLink = self->_privacyLink;
      self->_privacyLink = v37;

      -[OBPrivacyLinkController setPresentedViewControllerShouldUseDarkMode:](self->_privacyLink, "setPresentedViewControllerShouldUseDarkMode:", 1);
      -[OBPrivacyLinkController setDisplayIcon:](self->_privacyLink, "setDisplayIcon:", 0);
      -[CHFriendListViewController addChildViewController:](self, "addChildViewController:", self->_privacyLink);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController view](self, "view"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](self->_privacyLink, "view"));
      objc_msgSend(v39, "addSubview:", v40);

      -[OBPrivacyLinkController didMoveToParentViewController:](self->_privacyLink, "didMoveToParentViewController:", self);
    }
    v26 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController view](self, "view"));
    -[OBPrivacyLinkController setNeedsLayout](v26, "setNeedsLayout");
    goto LABEL_17;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v19, "setBackgroundView:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController tableView](self, "tableView"));
  objc_msgSend(v20, "setScrollEnabled:", 1);

  sortBarButtonItem = self->_sortBarButtonItem;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v22, "setLeftBarButtonItem:", sortBarButtonItem);

  v23 = self->_emptyListView;
  if (v23)
  {
    self->_emptyListView = 0;

  }
  v24 = self->_privacyLink;
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](v24, "view"));
    objc_msgSend(v25, "removeFromSuperview");

    -[OBPrivacyLinkController willMoveToParentViewController:](self->_privacyLink, "willMoveToParentViewController:", 0);
    -[OBPrivacyLinkController removeFromParentViewController](self->_privacyLink, "removeFromParentViewController");
    v26 = self->_privacyLink;
    self->_privacyLink = 0;
LABEL_17:

  }
  -[CHFriendListViewController _executeBlockWaitingOnFriendsDataIfNeeded](self, "_executeBlockWaitingOnFriendsDataIfNeeded");

}

- (void)_friendDataWasUpdated:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3084;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_executeBlockWaitingOnFriendsDataIfNeeded
{
  NSObject *v3;
  id blockWaitingOnFriendData;
  uint8_t v5[16];

  if (self->_blockWaitingOnFriendData && self->_friendListSections)
  {
    ASLoggingInitialize();
    v3 = ASLogFriendList;
    if (os_log_type_enabled(ASLogFriendList, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Block waiting on friend data, invoking now", v5, 2u);
    }
    (*((void (**)(void))self->_blockWaitingOnFriendData + 2))();
    blockWaitingOnFriendData = self->_blockWaitingOnFriendData;
    self->_blockWaitingOnFriendData = 0;

  }
}

- (BOOL)_isCompetitionSection:(unint64_t)a3
{
  BOOL v3;
  void *v4;

  if (a3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriendListSection rows](self->_competitionSection, "rows"));
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (void)_refreshControlValueChanged
{
  ASFriendListSectionManager *friendListManager;
  _QWORD v3[5];

  friendListManager = self->_friendListManager;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D3228;
  v3[3] = &unk_100778138;
  v3[4] = self;
  -[ASFriendListSectionManager fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:completion:](friendListManager, "fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:completion:", 180, v3);
}

- (void)didTapInboxBarButtonView:(id)a3
{
  id v4;
  CHFriendInboxTableViewController *v5;

  v5 = -[CHFriendInboxTableViewController initWithFriendListManager:friendManager:achievementsDataProvider:workoutsDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:makeFriendDetailViewControllerBlock:]([CHFriendInboxTableViewController alloc], "initWithFriendListManager:friendManager:achievementsDataProvider:workoutsDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:makeFriendDetailViewControllerBlock:", self->_friendListManager, self->_friendManager, self->_achievementsDataProvider, self->_workoutsDataProvider, self->_workoutFormattingManager, self->_formattingManager, self->_imageFactory, self->_healthStore, self->_fitnessAppContext, 0);
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
  -[CHFriendListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3404;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_logFriendListDisplayMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
    FIActivityAnalyticsSubmission(CFSTR("com.apple.Fitness.sharing"), CFSTR("sort"), *(&off_10077A768 + a3));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_competitionScoreConfiguration, 0);
  objc_storeStrong(&self->_blockWaitingOnFriendData, 0);
  objc_storeStrong((id *)&self->_emptyListView, 0);
  objc_storeStrong((id *)&self->_inboxButtonView, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_inboxBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sortBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);
  objc_storeStrong((id *)&self->_competitionSection, 0);
  objc_storeStrong((id *)&self->_friendListDisplayContext, 0);
  objc_storeStrong((id *)&self->_friendListSections, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
}

@end
