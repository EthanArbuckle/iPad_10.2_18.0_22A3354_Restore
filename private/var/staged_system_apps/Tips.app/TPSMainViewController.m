@implementation TPSMainViewController

- (void)applicationDidBecomeActive
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fullTipContentManager"));
  objc_msgSend(v2, "tipsAppActive");

}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  int64_t v4;
  id v7;
  unint64_t v8;
  unint64_t v9;

  v7 = a3;
  -[TPSMainViewController updateViewCollapsed:](self, "updateViewCollapsed:", 1);
  -[TPSMainViewController updateCollectionListModelDynamicSections](self, "updateCollectionListModelDynamicSections");
  if ((+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI") & 1) != 0)
  {
    a4 = 0;
LABEL_3:
    -[TPSMainViewController setCurrentCollapsedDisplayColumn:](self, "setCurrentCollapsedDisplayColumn:", a4);
    v4 = a4;
    goto LABEL_9;
  }
  v8 = (unint64_t)objc_msgSend(v7, "displayMode");
  v9 = v8;
  if (v8 <= 6 && ((1 << v8) & 0x68) != 0)
    v4 = -[TPSMainViewController isCollectionsViewVisible](self, "isCollectionsViewVisible") ^ 1;
  if (v9 > 6 || ((1 << v9) & 0x68) == 0)
    goto LABEL_3;
LABEL_9:

  return v4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v5;

  -[TPSMainViewController setCurrentDisplayMode:](self, "setCurrentDisplayMode:", a4);
  -[TPSMainViewController updateShouldHoldOffVideo](self, "updateShouldHoldOffVideo");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController view](self, "view"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)showCollectionsView
{
  id v3;

  if (-[TPSMainViewController canDisplayColumn:](self, "canDisplayColumn:", 0))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v3, "showColumn:", 0);

  }
}

- (void)appViewControllerViewWillAppear:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v5 = objc_msgSend(v4, "viewNavigationCollapsed");

  if (v5)
  {
    v7 = objc_opt_class(CollectionListViewController, v6);
    if ((objc_opt_isKindOfClass(v15, v7) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v10 = objc_opt_class(TipListViewController, v8);
      if ((objc_opt_isKindOfClass(v15, v10) & 1) != 0
        || (v12 = objc_opt_class(TPSChecklistViewController, v11),
            (objc_opt_isKindOfClass(v15, v12) & 1) != 0))
      {
        v9 = 1;
      }
      else
      {
        v14 = objc_opt_class(TPSTipsByCollectionViewController, v13);
        if ((objc_opt_isKindOfClass(v15, v14) & 1) == 0)
          goto LABEL_8;
        v9 = 2;
      }
    }
    -[TPSMainViewController setCurrentCollapsedDisplayColumn:](self, "setCurrentCollapsedDisplayColumn:", v9);
  }
LABEL_8:

}

- (TPSLastDisplayedContent)lastDisplayedContent
{
  TPSLastDisplayedContent *lastDisplayedContent;
  id v4;
  TPSLastDisplayedContent *v5;
  TPSLastDisplayedContent *v6;
  TPSLastDisplayedContent *v7;
  TPSLastDisplayedContent *v8;

  lastDisplayedContent = self->_lastDisplayedContent;
  if (!lastDisplayedContent)
  {
    v4 = +[TPSSecureArchivingUtilities unarchivedObjectOfClass:forKey:](TPSSecureArchivingUtilities, "unarchivedObjectOfClass:forKey:", objc_opt_class(TPSLastDisplayedContent, a2), CFSTR("TPSAppLastDisplayedContent"));
    v5 = (TPSLastDisplayedContent *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_lastDisplayedContent;
    self->_lastDisplayedContent = v5;

    lastDisplayedContent = self->_lastDisplayedContent;
    if (!lastDisplayedContent)
    {
      v7 = objc_alloc_init(TPSLastDisplayedContent);
      v8 = self->_lastDisplayedContent;
      self->_lastDisplayedContent = v7;

      lastDisplayedContent = self->_lastDisplayedContent;
    }
  }
  return lastDisplayedContent;
}

- (void)setupSearchResultSelectedHandler
{
  TPSMainViewController *v2;
  uint64_t v3;
  void (**v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  CollectionListViewController *v7;

  v2 = self;
  v7 = -[TPSMainViewController collectionListViewController](v2, "collectionListViewController");
  v3 = swift_allocObject(&unk_1000A36A0, 24, 7);
  swift_unknownObjectWeakInit(v3 + 16, v2);
  v4 = (void (**)(uint64_t))((char *)v7 + OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler);
  v5 = *(uint64_t *)((char *)&v7->super.super.super.super.super.isa
                  + OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler);
  v6 = *(uint64_t *)((char *)&v7->super.super._messageLabelTitle
                  + OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler);
  *v4 = sub_100039908;
  v4[1] = (void (*)(uint64_t))v3;
  sub_100005500(v5, v6);

}

- (void)updateAppShortcutSuggestions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  TPSMainViewController *v7;
  uint64_t v8;

  v3 = type metadata accessor for TipsLog(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  static TipsLog.default.getter();
  log(_:_:)(v6, 0xD00000000000001FLL, 0x800000010008C530);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_10001A250();
  static AppShortcutsProvider.updateAppShortcutParameters()();

}

- (void)viewDidLoad
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSMainViewController;
  -[TPSViewController viewDidLoad](&v6, "viewDidLoad");
  -[TPSMainViewController setupCollectionListView](self, "setupCollectionListView");
  -[TPSMainViewController setupTipListView](self, "setupTipListView");
  -[TPSMainViewController setupTipsByCollectionView](self, "setupTipsByCollectionView");
  -[TPSMainViewController setupSplitView](self, "setupSplitView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController lastDisplayedContent](self, "lastDisplayedContent"));
  v4 = objc_msgSend(v3, "hasContent");

  if ((v4 & 1) == 0)
    -[TPSMainViewController showCollectionsView](self, "showCollectionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  objc_msgSend(v5, "updateContent");

}

- (void)setupTipListView
{
  id v3;
  TipListViewController *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)objc_loadClassref(&off_1000B3E28));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002AC60;
  v5[3] = &unk_1000A2C10;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "setActionHandler:", v5);
  v4 = -[TipListViewController initWithViewModel:]([TipListViewController alloc], "initWithViewModel:", v3);
  -[TPSAppViewController setViewCycleDelegate:](v4, "setViewCycleDelegate:", self);
  -[TPSMainViewController setTipListViewController:](self, "setTipListViewController:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)appControllerUserUpdatedSavedTips:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "savedTipsCollection"));
  objc_msgSend(v5, "setSavedTipsCollection:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCollectionID"));
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("SavedTips"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "savedTipsCollection"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
      objc_msgSend(v10, "updateTipsForCurrentCollection");
LABEL_10:

      goto LABEL_11;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    v12 = objc_msgSend(v11, "viewNavigationCollapsed");

    if (v12)
      -[TPSMainViewController showCollectionsView](self, "showCollectionsView");
    if (+[TPSCommonDefines isPadUI](TPSCommonDefines, "isPadUI"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featuredCollection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

      if (!v10)
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines softwareWelcomeCollectionIdentifier](TPSCommonDefines, "softwareWelcomeCollectionIdentifier"));
      -[TPSMainViewController displayCollectionID:tipID:](self, "displayCollectionID:tipID:", v10, 0);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)updateShortcutItems
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100013100;
  v22[3] = &unk_1000A2CD8;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = v3;
  v4 = objc_retainBlock(v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tips"));

  v7 = objc_msgSend(v6, "mutableCopy");
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100013038;
  v18 = &unk_1000A2D00;
  v8 = v4;
  v21 = v8;
  v9 = v7;
  v19 = v9;
  v10 = v3;
  v20 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v15);
  if ((unint64_t)objc_msgSend(v10, "count", v15, v16, v17, v18) <= 2)
  {
    do
    {
      if (!objc_msgSend(v9, "count"))
        break;
      v11 = (int)arc4random_uniform((uint32_t)objc_msgSend(v9, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v11));
      objc_msgSend(v9, "removeObjectAtIndex:", v11);
      ((void (*)(_QWORD *, void *))v8[2])(v8, v12);

    }
    while ((unint64_t)objc_msgSend(v10, "count") < 3);
  }
  if (objc_msgSend(v10, "count"))
    v13 = v10;
  else
    v13 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v14, "setShortcutItems:", v13);

}

- (void)setupCollectionListView
{
  CollectionListViewModel *v3;
  CollectionListViewController *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(CollectionListViewModel);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AA7C;
  v10[3] = &unk_1000A2B98;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  -[CollectionListViewModel setActionHandler:](v3, "setActionHandler:", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002AB20;
  v8[3] = &unk_1000A2BC0;
  objc_copyWeak(&v9, &location);
  -[CollectionListViewModel setChecklistHandler:](v3, "setChecklistHandler:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002ABC4;
  v6[3] = &unk_1000A2BE8;
  objc_copyWeak(&v7, &location);
  -[CollectionListViewModel setUserGuideHandler:](v3, "setUserGuideHandler:", v6);
  v4 = -[CollectionListViewController initWithViewModel:]([CollectionListViewController alloc], "initWithViewModel:", v3);
  -[TPSAppViewController setViewCycleDelegate:](v4, "setViewCycleDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionListViewController defaultNavigationTitle](CollectionListViewController, "defaultNavigationTitle"));
  -[CollectionListViewController setTitle:](v4, "setTitle:", v5);

  -[TPSMainViewController setCollectionListViewController:](self, "setCollectionListViewController:", v4);
  -[TPSMainViewController setupSearchResultSelectedHandler](self, "setupSearchResultSelectedHandler");

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)appControllerContentUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TPSAnalyticsEventAppLaunched *pendingAppLaunchEvent;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  id v52;

  v52 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  v7 = objc_msgSend(v6, "isCollapsed");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collections"));
  if (objc_msgSend(v8, "count"))
    v9 = 0;
  else
    v9 = v7 ^ 1;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "collections"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collections"));

  if (v10 != v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
    objc_msgSend(v12, "analyticsIncreaseCountViewForCollectionsViewDelay:", TPSAnalyticsViewMethodSpringboardLaunch);

  }
  if (objc_msgSend(v10, "count"))
    v13 = v10;
  else
    v13 = &__NSArray0__struct;
  objc_msgSend(v5, "setCollections:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "checklistCollection"));
  objc_msgSend(v5, "setChecklistCollection:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "savedTipsCollection"));
  objc_msgSend(v5, "setSavedTipsCollection:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userGuides"));
  objc_msgSend(v5, "setUserGuides:", v16);

  -[TPSMainViewController updateCollectionListModelDynamicSections](self, "updateCollectionListModelDynamicSections");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  if ((objc_msgSend(v17, "updatingContent") & 1) != 0)
  {
LABEL_10:

    goto LABEL_19;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v19 = objc_msgSend(v18, "contentHasLoaded");

  if (v19)
  {
    if (self->_pendingAppLaunchEvent)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAnalyticsEventAppLaunched contentID](self->_pendingAppLaunchEvent, "contentID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tipForIdentifier:", v21));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "correlationID"));
      -[TPSAnalyticsEventAppLaunched setCorrelationID:](self->_pendingAppLaunchEvent, "setCorrelationID:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAnalyticsEventAppLaunched collectionID](self->_pendingAppLaunchEvent, "collectionID"));
      LODWORD(v21) = objc_msgSend(v24, "isEqual:", kTipsUnspecifiedValue);

      if ((_DWORD)v21)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "collectionIdentifierForTipIdentifier:", v26));
        -[TPSAnalyticsEventAppLaunched setCollectionID:](self->_pendingAppLaunchEvent, "setCollectionID:", v27);

      }
      -[TPSAnalyticsEventAppLaunched log](self->_pendingAppLaunchEvent, "log");
      pendingAppLaunchEvent = self->_pendingAppLaunchEvent;
      self->_pendingAppLaunchEvent = 0;

    }
    if (!self->_pendingShowTipIdentifier
      && !self->_pendingOpenUniversalURL
      && !-[TPSMainViewController hasLoaded](self, "hasLoaded"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
      if ((objc_msgSend(v17, "pendingContentUpdate") & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "currentTip"));
        if (v30)
        {

        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "tips"));
          v33 = objc_msgSend(v32, "count");

          if (!v33)
            goto LABEL_19;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController lastDisplayedContent](self, "lastDisplayedContent"));
          v17 = v34;
          if ((v7 & 1) != 0)
          {
            -[TPSMainViewController showCollectionsView](self, "showCollectionsView");
          }
          else
          {
            if (objc_msgSend(v34, "hasContent"))
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "featuredCollection"));
              v36 = v35;
              if (v35)
                v37 = v9;
              else
                v37 = 0;
              if (v37 == 1)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tipsForCollectionIdentifier:", v38));
                if (v39)
                {
                  objc_msgSend(v17, "setCollectionId:", v38);
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
                  objc_msgSend(v17, "setTipId:", v41);

                }
              }
              v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionId"));
              v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tipId"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "collectionForIdentifier:", v42));

              if (!v44)
              {

                v43 = 0;
                v42 = 0;
              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tipForIdentifier:", v43));

              if (!v45)
              {

                v43 = 0;
              }

            }
            else
            {
              v43 = 0;
              v42 = 0;
            }
            if (!(v43 | v42))
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
              v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "collectionIdentifierForCurrentUserType"));

            }
            if (v43 | v42)
            {
              if (objc_msgSend((id)v43, "length"))
                v47 = 2;
              else
                v47 = 1;
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "viewModel"));
              v50 = objc_msgSend(v49, "viewCollapsed");

              if (v50)
                v51 = 0;
              else
                v51 = v47;
              -[TPSMainViewController displayCollectionID:tipID:preferredColumn:](self, "displayCollectionID:tipID:preferredColumn:", v42, v43, v51);

            }
          }
          -[TPSMainViewController setHasLoaded:](self, "setHasLoaded:", 1);
        }
      }
      goto LABEL_10;
    }
  }
LABEL_19:
  -[TPSMainViewController updateShortcutItems](self, "updateShortcutItems");
  -[TPSMainViewController updateAppShortcutSuggestions](self, "updateAppShortcutSuggestions");

}

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *pendingShowTipIdentifier;
  void *v14;
  void *v15;
  void *v16;
  NSURL *pendingOpenUniversalURL;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  NSURL *v38;
  TPSAppSearchQuery *pendingAppSearchQuery;
  NSString *pendingSharedTipVariantID;
  void *v41;
  void *v42;
  void *v43;
  NSURL *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collections"));
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "featuredCollection"));
    v8 = v9 == 0;

  }
  if (v4)
  {
    -[TPSViewController removeInlineMessageLabel](self, "removeInlineMessageLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    objc_msgSend(v10, "removeInlineMessageLabel");

    if (v8)
    {
      -[TPSViewController setLoading:](self, "setLoading:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
      objc_msgSend(v11, "setLoading:", 1);

    }
    goto LABEL_32;
  }
  -[TPSViewController setLoading:](self, "setLoading:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
  objc_msgSend(v12, "setLoading:", 0);

  pendingShowTipIdentifier = self->_pendingShowTipIdentifier;
  if (pendingShowTipIdentifier)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](pendingShowTipIdentifier, "componentsSeparatedByString:", CFSTR("#")));
    if (objc_msgSend(v14, "count") == (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
      v16 = 0;
    }
    else if (objc_msgSend(v14, "count") == (id)2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    v18 = 1;
    if (objc_msgSend(v15, "length"))
      v19 = 2;
    else
      v19 = 1;
    -[TPSMainViewController displayCollectionID:tipID:preferredColumn:](self, "displayCollectionID:tipID:preferredColumn:", v16, v15, v19);

  }
  else
  {
    pendingOpenUniversalURL = self->_pendingOpenUniversalURL;
    if (self->_pendingAppSearchQuery)
    {
      v18 = pendingOpenUniversalURL != 0;
      -[TPSMainViewController handleSearchWithSearchQuery:](self, "handleSearchWithSearchQuery:");
    }
    else if (pendingOpenUniversalURL)
    {
      objc_initWeak(&location, self);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v44 = self->_pendingOpenUniversalURL;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10002B3D4;
      v48[3] = &unk_1000A29D8;
      objc_copyWeak(&v49, &location);
      objc_msgSend(v43, "openURL:options:completionHandler:", v44, &__NSDictionary0__struct, v48);

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      v18 = 1;
    }
    else
    {
      if (self->_pendingSharedTipVariantID)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "tipForVariantIdentifier:", self->_pendingSharedTipVariantID));

        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
          -[TPSMainViewController showCollectionWithIdentifier:launchType:](self, "showCollectionWithIdentifier:launchType:", v47, TPSAnalyticsLaunchTypeSharedTipLocal);

        }
        else
        {
          -[TPSMainViewController showModalTipWithVariantID:](self, "showModalTipWithVariantID:", self->_pendingSharedTipVariantID);
        }

      }
      v18 = 0;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewModel"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentCollectionID"));
  v23 = v22;
  if (!v22 && !v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    v25 = objc_msgSend(v24, "viewNavigationCollapsed");

    if ((v25 & 1) != 0)
      goto LABEL_28;
LABEL_24:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "viewModel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "collection"));
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "collections"));
      v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
    objc_msgSend(v21, "setCurrentCollectionID:", v33);

    goto LABEL_28;
  }

  if (!v23)
    goto LABEL_24;
LABEL_28:
  if (v8)
  {
    v34 = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastFetchError](v34, "lastFetchError"));
    -[TPSViewController showInlineMessageForError:](self, "showInlineMessageForError:", v35);

  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "view"));
    objc_msgSend(v37, "setHidden:", 0);

    v34 = self->_pendingShowTipIdentifier;
    self->_pendingShowTipIdentifier = 0;
  }

  v38 = self->_pendingOpenUniversalURL;
  self->_pendingOpenUniversalURL = 0;

  pendingAppSearchQuery = self->_pendingAppSearchQuery;
  self->_pendingAppSearchQuery = 0;

  pendingSharedTipVariantID = self->_pendingSharedTipVariantID;
  self->_pendingSharedTipVariantID = 0;

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "_launchTestName"));
  objc_msgSend(v41, "finishedTest:", v42);

LABEL_32:
}

- (void)updateCollectionListModelDynamicSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewModel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "featuredCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionSections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  if (objc_msgSend(v4, "viewCollapsed"))
  {
    v22 = v7;
    v23 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v10)
      goto LABEL_15;
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collections"));
        v16 = objc_msgSend(v15, "containsObject:", v6);

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collections"));
          v18 = objc_msgSend(v17, "count");

          if ((unint64_t)v18 < 2)
            goto LABEL_12;
          v19 = objc_msgSend(v14, "copy");

          objc_msgSend(v19, "removeCollection:", v6);
          v14 = v19;
        }
        if (!v14)
          goto LABEL_13;
        objc_msgSend(v8, "addObject:", v14);
LABEL_12:

LABEL_13:
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v11)
      {
LABEL_15:

        v20 = v6;
        v7 = v22;
        v5 = v23;
        goto LABEL_17;
      }
    }
  }
  objc_msgSend(v8, "addObjectsFromArray:", v7);
  v20 = 0;
LABEL_17:
  objc_msgSend(v4, "setFeaturedCollection:", v20, v22, v23, (_QWORD)v24);
  if (objc_msgSend(v8, "count"))
  {
    v21 = objc_msgSend(v8, "copy");
    objc_msgSend(v4, "setCollectionSections:", v21);

  }
  else
  {
    objc_msgSend(v4, "setCollectionSections:", &__NSArray0__struct);
  }

}

- (CollectionListViewController)collectionListViewController
{
  return self->_collectionListViewController;
}

- (void)updateViewCollapsed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  objc_msgSend(v5, "setViewNavigationCollapsed:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModel"));
  objc_msgSend(v7, "setViewCollapsed:", v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewModel"));
  objc_msgSend(v9, "setViewCollapsed:", v3);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewModel"));
  objc_msgSend(v11, "setDisplayChevron:", v3);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v12, "setShouldDisplayNavigationTitle:", v3);

}

- (TipListViewController)tipListViewController
{
  return self->_tipListViewController;
}

- (void)setupTipsByCollectionView
{
  TPSTipsByCollectionViewController *v3;
  void *v4;
  TPSTipsByCollectionViewController *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [TPSTipsByCollectionViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v5 = -[TPSAppViewController initWithAppController:](v3, "initWithAppController:", v4);
  -[TPSMainViewController setTipsByCollectionViewController:](self, "setTipsByCollectionViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v7, "setContentDelegate:", self);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v8, "setViewCycleDelegate:", self);

}

- (void)viewDidLayoutSubviews
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TPSMainViewController;
  -[TPSMainViewController viewDidLayoutSubviews](&v17, "viewDidLayoutSubviews");
  v3 = -[TPSMainViewController currentDisplayMode](self, "currentDisplayMode");
  if ((+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    v4 = (uint64_t)objc_msgSend(v5, "isCollapsed");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v7 = objc_msgSend(v6, "viewNavigationCollapsed");

  if ((_DWORD)v4 != v7)
  {
    -[TPSMainViewController updateViewCollapsed:](self, "updateViewCollapsed:", v4);
    -[TPSMainViewController updateCollectionListModelDynamicSections](self, "updateCollectionListModelDynamicSections");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  v9 = objc_msgSend(v8, "allowPaging");

  if (v3 > 6)
    v10 = 1;
  else
    v10 = v4;
  if ((v10 & 1) != 0)
    v11 = 1;
  else
    v11 = (0x2Bu >> v3) & 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v12, "setAllowPaging:", v11);

  if (v9 != (_DWORD)v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewModel"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "checklistViewModel"));
    objc_msgSend(v15, "setCurrentDisplayTips:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
    objc_msgSend(v16, "setPendingReload:", 1);

  }
}

- (TPSTipsByCollectionViewController)tipsByCollectionViewController
{
  return self->_tipsByCollectionViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;

  if (+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  else
    v3 = 0;
  return v3;
}

- (_TtC4Tips22TPSSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (int64_t)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (BOOL)canDisplayColumn:(int64_t)a3
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v6 = objc_msgSend(v5, "viewNavigationCollapsed");

  return !v6 || -[TPSMainViewController currentCollapsedDisplayColumn](self, "currentCollapsedDisplayColumn") != a3;
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (int64_t)currentCollapsedDisplayColumn
{
  return self->_currentCollapsedDisplayColumn;
}

- (void)setupSplitView
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
  _TtC4Tips22TPSSplitViewController *v24;

  -[TPSMainViewController updateViewCollapsed:](self, "updateViewCollapsed:", +[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI"));
  v24 = -[TPSSplitViewController initWithStyle:]([_TtC4Tips22TPSSplitViewController alloc], "initWithStyle:", 2);
  -[TPSSplitViewController setDelegate:](v24, "setDelegate:", self);
  -[TPSSplitViewController setPreferredSplitBehavior:](v24, "setPreferredSplitBehavior:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  -[TPSSplitViewController setViewController:forColumn:](v24, "setViewController:forColumn:", v3, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  -[TPSSplitViewController setViewController:forColumn:](v24, "setViewController:forColumn:", v4, 2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
  -[TPSSplitViewController setViewController:forColumn:](v24, "setViewController:forColumn:", v5, 1);

  -[TPSMainViewController setSplitViewController:](self, "setSplitViewController:", v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSplitViewController view](v24, "view"));
  -[TPSMainViewController addChildViewController:](self, "addChildViewController:", v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", v6);

  objc_msgSend(v6, "setHidden:", 1);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  -[TPSSplitViewController didMoveToParentViewController:](v24, "didMoveToParentViewController:", self);
}

- (TPSMainViewController)init
{
  TPSMainViewController *v2;
  TPSMainViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  TPSUIAppController *appController;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TPSMainViewController;
  v2 = -[TPSViewController init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_currentCollapsedDisplayColumn = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionHandler sharedInstance](TPSURLSessionHandler, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
    objc_msgSend(v5, "setDelegate:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
    objc_msgSend(v6, "setDefaultSessionDelegate:", v4);

    if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionACAuthContext defaultContext](TPSURLSessionACAuthContext, "defaultContext"));
      v8 = objc_msgSend(objc_alloc((Class)TPSURLSessionACAuthHandler), "initWithAuthenticationContext:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
      objc_msgSend(v9, "setAuthenticationHandler:", v8);

    }
    v10 = objc_claimAutoreleasedReturnValue(+[TPSUIAppController sharedInstance](TPSUIAppController, "sharedInstance"));
    appController = v3->_appController;
    v3->_appController = (TPSUIAppController *)v10;

    -[TPSUIAppController addDelegate:](v3->_appController, "addDelegate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = objc_msgSend(v12, "applicationState");

    if (v13 != (id)2)
    {
      +[TPSAnalyticsSessionController trackSession](TPSAnalyticsSessionController, "trackSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", 0, 0, 0, TPSAnalyticsLaunchTypeSpringboard));
      objc_msgSend(v14, "log");

    }
  }
  return v3;
}

- (void)updateShouldHoldOffVideo
{
  _BOOL8 v3;
  id v4;

  v3 = (+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI") & 1) == 0
    && self->_currentDisplayMode == 3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v4, "setShouldHoldOffVideo:", v3);

}

- (void)setTipsByCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tipsByCollectionViewController, a3);
}

- (void)setTipListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tipListViewController, a3);
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (void)setCurrentDisplayMode:(int64_t)a3
{
  self->_currentDisplayMode = a3;
}

- (void)setCurrentCollapsedDisplayColumn:(int64_t)a3
{
  self->_currentCollapsedDisplayColumn = a3;
}

- (void)setCollectionListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionListViewController, a3);
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)showCollectionWithIdentifier:(id)a3 launchType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  NSString *pendingShowTipIdentifier;
  void *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[4];
  id v38;
  TPSMainViewController *v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v6;
    v43 = 2112;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateLaunchInfoWithIdentifier %@, launch type %@", buf, 0x16u);
  }

  -[TPSMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByRemovingPercentEncoding"));
  v36 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("#")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v14 = 0;
  if (objc_msgSend(v12, "count") == (id)2)
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  if (objc_msgSend(v13, "length"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    objc_msgSend(v15, "removeNotificationForIdentifier:", v13);

  }
  if (objc_msgSend(v14, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    objc_msgSend(v16, "removeNotificationForIdentifier:", v14);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tipForIdentifier:includingCorrelation:", v13, 1));

  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));

    v13 = (void *)v19;
  }
  v20 = TPSAnalyticsLaunchTypeNotification;
  v21 = objc_msgSend(v7, "isEqualToString:", TPSAnalyticsLaunchTypeNotification);
  if ((objc_msgSend(v7, "isEqualToString:", TPSAnalyticsLaunchTypeWidget) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", v20))
  {
    v21 = v18 == 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "correlationID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", v13, v14, v22, v7));

  if (v18)
  {
    objc_msgSend(v23, "log");
    if (!v21)
      goto LABEL_17;
    goto LABEL_16;
  }
  -[TPSMainViewController setPendingAppLaunchEvent:](self, "setPendingAppLaunchEvent:", v23);
  if (v21)
  {
LABEL_16:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    objc_msgSend(v24, "updateContent");

  }
LABEL_17:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v26 = objc_msgSend(v25, "contentHasLoaded");

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v28 = objc_msgSend(v27, "updatingContent");

  if (v28)
  {
    if (!v26)
      goto LABEL_25;
    if (objc_msgSend(v14, "length"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "collectionForIdentifier:", v14));

      if (!v30)
        goto LABEL_25;
    }
    if (objc_msgSend(v13, "length"))
    {
      pendingShowTipIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSString tipForIdentifier:](pendingShowTipIdentifier, "tipForIdentifier:", v13));
      if (v32)
      {

LABEL_26:
        goto LABEL_27;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tipForCorrelationIdentifier:", v13));

      if (v35)
        goto LABEL_27;
LABEL_25:
      v33 = v36;
      pendingShowTipIdentifier = self->_pendingShowTipIdentifier;
      self->_pendingShowTipIdentifier = v33;
      goto LABEL_26;
    }
  }
  else if ((v26 & 1) == 0)
  {
    goto LABEL_25;
  }
LABEL_27:
  if (objc_msgSend(v13, "length") || objc_msgSend(v14, "length"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002B1B8;
    block[3] = &unk_1000A2C38;
    v38 = v13;
    v39 = self;
    v40 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned __int8 v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  v9 = objc_msgSend(v8, "isCollapsed");

  if ((v9 & 1) != 0)
    goto LABEL_2;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  v13 = objc_msgSend(v12, "displayMode");

  if (-[TPSMainViewController isCollectionsViewVisible](self, "isCollectionsViewVisible"))
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  if (v13 != (id)3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewModel"));
    if ((objc_msgSend(v15, "viewCollapsed") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));

      if (v18)
        goto LABEL_8;
    }
    else
    {

    }
LABEL_2:
    v10 = 1;
    v11 = 2;
    goto LABEL_9;
  }
LABEL_8:
  v10 = 0;
  v11 = 1;
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)TPSMainViewController;
  -[TPSMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ((v10 & 1) == 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002B394;
    v19[3] = &unk_1000A2C60;
    v19[4] = self;
    v19[5] = v11;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v19, 0);
  }

}

- (void)appControllerTipViewed:(id)a3 tipIdentifier:(id)a4 collectionIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[TPSMainViewController updateShortcutItems](self, "updateShortcutItems");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController lastDisplayedContent](self, "lastDisplayedContent"));
  objc_msgSend(v9, "setTipId:", v8);

  objc_msgSend(v9, "setCollectionId:", v7);
  +[TPSSecureArchivingUtilities archivedDataWithRootObject:forKey:](TPSSecureArchivingUtilities, "archivedDataWithRootObject:forKey:", v9, CFSTR("TPSAppLastDisplayedContent"));

}

- (void)updateSupplementaryColumnForCollectionID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  TPSChecklistViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForColumn:", 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModel"));

  if (+[TPSCommonDefines isChecklistCollectionWithIdentifier:](TPSCommonDefines, "isChecklistCollectionWithIdentifier:", v16))
  {
    v9 = objc_opt_class(TPSChecklistViewController, v8);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
      goto LABEL_7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "checklistViewModel"));
    objc_msgSend(v10, "reset");
    v11 = -[TPSChecklistViewController initWithViewModel:]([TPSChecklistViewController alloc], "initWithViewModel:", v10);
    -[TPSAppViewController setViewCycleDelegate:](v11, "setViewCycleDelegate:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v12, "setViewController:forColumn:", v11, 1);

  }
  else
  {
    v13 = objc_opt_class(TipListViewController, v8);
    if ((objc_opt_isKindOfClass(v5, v13) & 1) != 0)
      goto LABEL_7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    v11 = (TPSChecklistViewController *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    objc_msgSend(v10, "setViewController:forColumn:", v11, 1);
  }

LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentCollectionID"));
  v15 = objc_msgSend(v14, "isEqualToString:", v16);

  if ((v15 & 1) == 0)
    objc_msgSend(v7, "setCurrentCollectionID:", v16);

}

- (void)displayCollectionID:(id)a3 tipID:(id)a4
{
  -[TPSMainViewController displayCollectionID:tipID:preferredColumn:](self, "displayCollectionID:tipID:preferredColumn:", a3, a4, 2);
}

- (void)displayCollectionID:(id)a3 tipID:(id)a4 preferredColumn:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  -[TPSMainViewController setPendingColumnSwitching:](self, "setPendingColumnSwitching:", 1);
  v9 = objc_msgSend(v26, "length");
  v10 = v9;
  if (a5 == 1 && v9)
  {
    a5 = 1;
  }
  else if (a5 == 2)
  {
    v11 = objc_msgSend(v8, "length");
    v12 = 1;
    if (!v10)
      v12 = 2;
    if (v11)
      a5 = 2;
    else
      a5 = v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tipForIdentifier:includingCorrelation:", v8, 1));

  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

    v8 = (id)v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewModel"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tipsForCollectionIdentifier:", v26));

  if (v19)
    objc_msgSend(v17, "setTips:", v19);
  if (!v26)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionIdentifierForTipIdentifier:", v8));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collectionForIdentifier:", v26));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collection"));
  v24 = objc_msgSend(v23, "isEqual:", v22);

  if (v22)
    objc_msgSend(v17, "setCollection:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v25, "updateWithCollectionID:tipID:", v26, v8);

  -[TPSMainViewController updateSupplementaryColumnForCollectionID:](self, "updateSupplementaryColumnForCollectionID:", v26);
  if (a5 == 2 && v22)
  {
    -[TPSMainViewController showTipsView](self, "showTipsView");
  }
  else if (a5 == 1)
  {
    -[TPSMainViewController showTOCView](self, "showTOCView");
  }
  -[TPSMainViewController setPendingColumnSwitching:](self, "setPendingColumnSwitching:", 0);
  if (v10)
  {
    objc_msgSend(v17, "setUseStandardNavBarBehavior:", objc_msgSend(v22, "isChecklist"));
    if ((v24 & 1) == 0)
      objc_msgSend(v17, "setShouldUseDefaultNavBar:", 0);
  }

}

- (void)displayUserGuideWithIdentifier:(id)a3 topicId:(id)a4 version:(id)a5 platformIndependent:(BOOL)a6 prefersLandingPage:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD *, id);
  id v40;
  void *v41;
  TPSMainViewController *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  TPSMainViewController *v47;
  _QWORD *v48;
  BOOL v49;
  _QWORD v50[4];
  id v51;
  BOOL v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  objc_msgSend(v15, "dismissSearch");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v16, "dismissSearch");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  v18 = v17;
  if (v12)
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userGuideWithIdentifier:", v12));
  else
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainUserGuide"));
  v20 = (void *)v19;

  if (v20)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "version"));
    a6 = objc_msgSend(v20, "platformIndependent");
    v14 = (id)v22;
    v12 = (id)v21;
  }
  if (!v14)
    v14 = HLPHelpViewControllerVersionLatest;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10002BBA8;
  v50[3] = &unk_1000A2C88;
  v23 = v13;
  v51 = v23;
  v52 = a7;
  v24 = objc_retainBlock(v50);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController presentedViewController](self, "presentedViewController"));
  v27 = objc_opt_class(UINavigationController, v26);
  v42 = self;
  if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController presentedViewController](self, "presentedViewController"));
    v29 = v20;
    v30 = v24;
    v31 = v14;
    v32 = v12;
    v33 = v23;
    v34 = a6;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "viewControllers"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));

    a6 = v34;
    v23 = v33;
    v12 = v32;
    v14 = v31;
    v24 = v30;
    v20 = v29;

  }
  else
  {
    v36 = 0;
  }

  v38 = objc_opt_class(HLPHelpViewController, v37);
  if ((objc_opt_isKindOfClass(v36, v38) & 1) != 0)
  {
    v39 = (void (*)(_QWORD *, id))v24[2];
    v40 = v36;
    v39(v24, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "text"));
    objc_msgSend(v40, "loadBookWithTitle:identifier:topicID:version:", v41, v12, v23, v14);

  }
  else
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10002BC08;
    v43[3] = &unk_1000A2CB0;
    v44 = v20;
    v45 = v12;
    v46 = v14;
    v47 = v42;
    v48 = v24;
    v49 = a6;
    -[TPSMainViewController dismissViewControllerAnimated:completion:](v42, "dismissViewControllerAnimated:completion:", 1, v43);

    v41 = v44;
  }

}

- (void)handleTipsURL:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "scheme"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("tips"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("open")))
    {
LABEL_12:

      goto LABEL_13;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "queryItems"));
    v8 = objc_msgSend(v7, "count");

    if ((unint64_t)v8 >= 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "queryItems"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "queryItems"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("type"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("shortcut"))
          && objc_msgSend(v12, "isEqualToString:", CFSTR("id")))
        {
          v17 = v13;
          if ((objc_msgSend(v17, "containsString:", CFSTR("#")) & 1) == 0)
          {
            v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v17, CFSTR("#")));

            v17 = (id)v18;
          }
          -[TPSMainViewController showCollectionWithIdentifier:launchType:](self, "showCollectionWithIdentifier:launchType:", v17, TPSAnalyticsLaunchTypeQuickAction);

        }
      }

      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)applicationWillTerminate
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v2, "applicationWillTerminate");

  +[TPSAnalyticsEventAppLaunched appSessionEndedWithType:](TPSAnalyticsEventAppLaunched, "appSessionEndedWithType:", TPSAnalyticsLaunchTypeTerminated);
  +[TPSAnalyticsSessionController endSession](TPSAnalyticsSessionController, "endSession");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsChecklistSessionController sharedInstance](TPSAnalyticsChecklistSessionController, "sharedInstance"));
  objc_msgSend(v3, "stopSession");

}

- (void)applicationWillEnterForeground
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSJSONCacheController sharedInstance](TPSJSONCacheController, "sharedInstance"));
  objc_msgSend(v3, "reloadDataCache");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance"));
  objc_msgSend(v4, "reloadDataCache");

  -[TPSMainViewController updateAppInBackground:](self, "updateAppInBackground:", 0);
  -[TPSUIAppController reloadAppGroupDefaults](self->_appController, "reloadAppGroupDefaults");
  -[TPSMainViewController logAnalyticsEventForAppForeground](self, "logAnalyticsEventForAppForeground");
  +[TPSAnalyticsSessionController trackSession](TPSAnalyticsSessionController, "trackSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsChecklistSessionController sharedInstance](TPSAnalyticsChecklistSessionController, "sharedInstance"));
  objc_msgSend(v5, "continueSession");

  -[TPSMainViewController resyncTipList](self, "resyncTipList");
}

- (void)applicationDidEnterBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSJSONCacheController sharedInstance](TPSJSONCacheController, "sharedInstance"));
  objc_msgSend(v3, "syncCacheImmediately");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance"));
  objc_msgSend(v4, "syncCacheImmediately");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleIDMap"));
  objc_msgSend(v6, "removeAllObjects");

  +[TPSAnalyticsEventAppLaunched appSessionEndedWithType:](TPSAnalyticsEventAppLaunched, "appSessionEndedWithType:", TPSAnalyticsLaunchTypeBackground);
  -[TPSMainViewController updateAppInBackground:](self, "updateAppInBackground:", 1);
  -[TPSMainViewController setPendingShowTipIdentifier:](self, "setPendingShowTipIdentifier:", 0);
  -[TPSMainViewController setPendingOpenUniversalURL:](self, "setPendingOpenUniversalURL:", 0);
}

- (void)resyncTipList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  if (!objc_msgSend(v3, "viewNavigationCollapsed"))
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
    objc_msgSend(v3, "continueVideoForCurrentTip");
LABEL_4:

  }
  -[TPSUIAppController updateContent](self->_appController, "updateContent");
}

- (BOOL)isCollectionsViewVisible
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  if (objc_msgSend(v3, "displayMode") == (id)4)
  {
    v4 = 1;
LABEL_11:

    return v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  if (objc_msgSend(v5, "displayMode") == (id)5)
  {
    v4 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
  v7 = objc_msgSend(v6, "displayMode");

  if (v7 != (id)6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewModel"));
    if (objc_msgSend(v5, "viewCollapsed"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
      v4 = v10 != 0;

    }
    else
    {
      v4 = 0;
    }
    goto LABEL_10;
  }
  return 1;
}

- (void)showTOCView
{
  void *v3;
  id v4;

  if (-[TPSMainViewController canDisplayColumn:](self, "canDisplayColumn:", 1))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v3, "hideColumn:", 0);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v4, "showColumn:", 1);

  }
}

- (void)showTipsView
{
  id v3;

  if (-[TPSMainViewController canDisplayColumn:](self, "canDisplayColumn:", 2))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v3, "showColumn:", 2);

  }
}

- (void)showTipWithID:(id)a3 launchType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "length"))
  {
    -[TPSMainViewController showCollectionWithIdentifier:launchType:](self, "showCollectionWithIdentifier:launchType:", v9, v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", 0, 0, 0, v6));
    objc_msgSend(v7, "log");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
    objc_msgSend(v8, "analyticsIncreaseCountViewForNilTipIDWithLaunchType:", v6);

  }
}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  unsigned int v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  void *v13;
  __CFString *v14;
  id v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "open URL: %@", buf, 0xCu);
  }

  v7 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
  v9 = objc_msgSend(v8, "isEqualToString:", TPSCommonDefinesURLSchemeKey);

  v10 = 0;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
    v12 = objc_msgSend(v11, "isEqualToString:", TPSCommonDefinesURLSchemeParameterPathTypeOpen);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryItems"));
      v34 = 0;
      v35 = 0;
      v33 = 0;
      +[TPSDocument getValuesFromOpenURLSchemeQueryItems:tipIdentifier:collectionIdentifier:referrer:](TPSDocument, "getValuesFromOpenURLSchemeQueryItems:tipIdentifier:collectionIdentifier:referrer:", v13, &v35, &v34, &v33);
      v14 = (__CFString *)v35;
      v15 = v34;
      v16 = v33;

      if (v14 && objc_msgSend(v15, "isEqualToString:", v14))
      {

        v14 = &stru_1000A5680;
      }
      if (v14)
        v17 = v14;
      else
        v17 = &stru_1000A5680;
      v18 = v17;
      v19 = v18;
      if (v15)
      {
        v20 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v18, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("#"), v15));

        v19 = (void *)v20;
      }
      -[TPSMainViewController showTipWithID:launchType:](self, "showTipWithID:launchType:", v19, v16);
      if (objc_msgSend(v16, "isEqualToString:", TPSAnalyticsLaunchTypeNotification))
        -[TipListViewController setPreferredViewMethod:](self->_tipListViewController, "setPreferredViewMethod:", v16);

      v10 = 1;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
      v22 = objc_msgSend(v21, "isEqualToString:", TPSTipURLSchemeParameterPathTypeSearch);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryItems"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "na_firstObjectPassingTest:", &stru_1000A2D40));

        v15 = (id)objc_claimAutoreleasedReturnValue(-[__CFString value](v14, "value"));
        v16 = (id)objc_claimAutoreleasedReturnValue(+[TPSAppSearchQuery queryWithSearchTerm:origin:](TPSAppSearchQuery, "queryWithSearchTerm:origin:", v15, 2));
        v10 = -[TPSMainViewController handleSearchWithSearchQuery:](self, "handleSearchWithSearchQuery:", v16);
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
        v25 = objc_msgSend(v24, "isEqualToString:", TPSCommonDefinesURLSchemeTypeUserGuide);

        if (!v25)
        {
          v10 = 0;
          goto LABEL_23;
        }
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[TPSUserGuide getUserGuideFromURL:](TPSUserGuide, "getUserGuideFromURL:", v5));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString referrer](v14, "referrer"));
        v27 = objc_msgSend(v26, "length");

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString topicIdentifier](v14, "topicIdentifier"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString referrer](v14, "referrer"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", v28, 0, 0, v29));
          objc_msgSend(v30, "log");

        }
        v15 = (id)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v14, "identifier"));
        v16 = (id)objc_claimAutoreleasedReturnValue(-[__CFString topicIdentifier](v14, "topicIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString version](v14, "version"));
        -[TPSMainViewController displayUserGuideWithIdentifier:topicId:version:platformIndependent:prefersLandingPage:](self, "displayUserGuideWithIdentifier:topicId:version:platformIndependent:prefersLandingPage:", v15, v16, v31, 1, 1);

        v10 = 0;
      }
    }

  }
LABEL_23:

  return v10;
}

- (BOOL)handleUserActivity:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  BOOL v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
  v6 = objc_msgSend(v5, "isEqualToString:", CSSearchableItemActionType);

  if (v6)
  {
    v7 = -[TPSMainViewController handleCoreSpotlightItemActivity:](self, "handleCoreSpotlightItemActivity:", v4);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
    v9 = objc_msgSend(v8, "isEqualToString:", CSQueryContinuationActionType);

    if (v9)
    {
      v7 = -[TPSMainViewController handleContinueCoreSpotlightSearchActivity:](self, "handleContinueCoreSpotlightSearchActivity:", v4);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
      v11 = objc_msgSend(v10, "isEqualToString:", NSUserActivityTypeBrowsingWeb);

      if (!v11)
      {
        v12 = 0;
        goto LABEL_8;
      }
      v7 = -[TPSMainViewController handleUniversalLinkWithUserActivity:](self, "handleUniversalLinkWithUserActivity:", v4);
    }
  }
  v12 = v7;
LABEL_8:

  return v12;
}

- (BOOL)handleContinueCoreSpotlightSearchActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  -[TPSMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CSSearchQueryString));
  v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger search](TPSLogger, "search"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10006CB44((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppSearchQuery queryWithSearchTerm:origin:](TPSAppSearchQuery, "queryWithSearchTerm:origin:", v6, 1));
  v15 = -[TPSMainViewController handleSearchWithSearchQuery:](self, "handleSearchWithSearchQuery:", v14);

  return v15;
}

- (BOOL)handleCoreSpotlightItemActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));

  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger search](TPSLogger, "search"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10006CBA8((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    v14 = TPSAnalyticsLaunchTypeSearchResult;
    v15 = objc_msgSend(objc_alloc((Class)TPSUserGuideTopic), "initWithSearchableItemUniqueIdentifier:", v5);
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topicId"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "version"));
      v20 = objc_claimAutoreleasedReturnValue(+[TPSLogger search](TPSLogger, "search"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412802;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        v28 = 2112;
        v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Opening user guide with productId: %@, topicId: %@, version: %@", (uint8_t *)&v24, 0x20u);
      }

      if (v17 && v18)
        -[TPSMainViewController displayUserGuideWithIdentifier:topicId:version:platformIndependent:prefersLandingPage:](self, "displayUserGuideWithIdentifier:topicId:version:platformIndependent:prefersLandingPage:", v17, v18, v19, 1, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", 0, 0, 0, v14));
      objc_msgSend(v21, "log");

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
      objc_msgSend(v22, "analyticsIncreaseCountViewForNilTipIDWithLaunchType:", v14);

    }
    else
    {
      -[TPSMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      -[TPSMainViewController showTipWithID:launchType:](self, "showTipWithID:launchType:", v5, v14);
    }

  }
  return v6 != 0;
}

- (BOOL)handleSearchWithSearchQuery:(id)a3
{
  id v5;
  void *v6;
  id v7;
  TPSAppSearchQuery **p_pendingAppSearchQuery;
  TPSAppSearchQuery *pendingAppSearchQuery;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchTerm"));
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    p_pendingAppSearchQuery = &self->_pendingAppSearchQuery;
    pendingAppSearchQuery = self->_pendingAppSearchQuery;
    self->_pendingAppSearchQuery = 0;

    v10 = objc_claimAutoreleasedReturnValue(+[TPSLogger search](TPSLogger, "search"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10006CC0C((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    if (-[TPSMainViewController _isAppContentLoaded](self, "_isAppContentLoaded"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
      v18 = objc_msgSend(v17, "canSearch");

      if (v18)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10002CE64;
        v26[3] = &unk_1000A2A50;
        v26[4] = self;
        v27 = v5;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v26);
        v19 = v27;
LABEL_12:

        goto LABEL_13;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
      v22 = objc_msgSend(v21, "canSearch");

      if (v22)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10002CEE8;
        v24[3] = &unk_1000A2A50;
        v24[4] = self;
        v25 = v5;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
        v19 = v25;
        goto LABEL_12;
      }
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[TPSLogger search](TPSLogger, "search"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Content not yet fetched, save it for later", buf, 2u);
      }

      objc_storeStrong((id *)p_pendingAppSearchQuery, a3);
    }
  }
LABEL_13:

  return v7 != 0;
}

- (BOOL)_isAppContentLoaded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  if ((objc_msgSend(v3, "updatingContent") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    v4 = objc_msgSend(v5, "contentHasLoaded");

  }
  return v4;
}

- (BOOL)handleUniversalLinkWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  char v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  TPSMainViewController *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;

  v4 = a3;
  -[TPSMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webpageURL"));
  if (!v5)
  {
    LOBYTE(v9) = 0;
    goto LABEL_43;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "open URL: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v5, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("tips.apple.com"));

  if (!v9)
    goto LABEL_42;
  v10 = TPSAnalyticsLaunchTypeUniversalLink;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryItems"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v12)
  {

    goto LABEL_35;
  }
  v41 = v9;
  v47 = self;
  v48 = 0;
  v42 = v7;
  v43 = v5;
  v44 = v4;
  v13 = 0;
  v14 = *(_QWORD *)v50;
  v15 = TPSDocumentURLSchemeParameterReferrerKey;
  v45 = (void *)TPSAnalyticsLaunchTypeSharedTipLocal;
  v46 = v11;
  while (2)
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v50 != v14)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v19 = objc_msgSend(v18, "isEqualToString:", v15);

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
        if (objc_msgSend(v20, "length"))
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));

          +[TPSAnalyticsEventContentViewed setAppReferrer:](TPSAnalyticsEventContentViewed, "setAppReferrer:", v20);
          v10 = (id)v21;
        }
        goto LABEL_16;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("category"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));

        if (objc_msgSend(v24, "length"))
        {
          v20 = v48;
          v13 = v24;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("#"), v24));
LABEL_16:

          goto LABEL_17;
        }
        v13 = v24;
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("share"));

        if (v26
          && +[TPSFeatureFlags allowsTipsSharing](TPSFeatureFlags, "allowsTipsSharing"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
          if (objc_msgSend(v20, "length"))
          {
            v27 = v13;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](v47, "appController"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "tipForVariantIdentifier:", v20));

            if (!v29)
            {
              if (-[TPSMainViewController _isAppContentLoaded](v47, "_isAppContentLoaded"))
                -[TPSMainViewController showModalTipWithVariantID:](v47, "showModalTipWithVariantID:", v20);
              else
                -[TPSMainViewController setPendingSharedTipVariantID:](v47, "setPendingSharedTipVariantID:", v20);
              v5 = v43;
              v4 = v44;
              v7 = v42;

              LOBYTE(v9) = 1;
              v34 = v46;
              v35 = v48;
              goto LABEL_41;
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](v47, "appController"));
            objc_msgSend(v30, "logSharedTipDisplayed:isEligible:", v29, 1);

            v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
            v32 = v45;

            v10 = v32;
            v48 = (void *)v31;
            v13 = v27;
            v11 = v46;
          }
          goto LABEL_16;
        }
      }
LABEL_17:
      v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    v12 = v33;
    if (v33)
      continue;
    break;
  }
  v12 = v13;

  if (v48)
  {
    v34 = v48;
    v5 = v43;
    v4 = v44;
    v7 = v42;
    self = v47;
    LOBYTE(v9) = v41;
    goto LABEL_38;
  }
  v5 = v43;
  v4 = v44;
  v7 = v42;
  self = v47;
  LOBYTE(v9) = v41;
LABEL_35:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsSeparatedByString:", CFSTR("/")));

  if (objc_msgSend(v37, "count") != (id)6)
  {

    goto LABEL_40;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastObject"));

  v39 = v38;
  if (!v39)
  {
LABEL_40:
    v27 = v12;
    v34 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", 0, v12, 0, v10));
    objc_msgSend(v34, "log");
    v35 = 0;
    goto LABEL_41;
  }
  v34 = v39;
LABEL_38:
  -[TPSMainViewController setPendingOpenUniversalURL:](self, "setPendingOpenUniversalURL:", v5);
  -[TPSMainViewController setPendingShowTipIdentifier:](self, "setPendingShowTipIdentifier:", v34);
  -[TPSMainViewController showCollectionWithIdentifier:launchType:](self, "showCollectionWithIdentifier:launchType:", v34, v10);
  v35 = v34;
  v27 = v12;
LABEL_41:

LABEL_42:
LABEL_43:

  return v9;
}

- (void)updateAppInBackground:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
  objc_msgSend(v5, "setAppInBackground:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModel"));
  objc_msgSend(v7, "setAppInBackground:", v3);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  objc_msgSend(v8, "setAppInBackground:", v3);

}

- (void)logAnalyticsEventForAppForeground
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v3 = TPSAnalyticsContentStyleLandingPage;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTip"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTip"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "correlationID"));
    v3 = (id)v9;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));

    if (!v15)
    {
      v12 = 0;
      v20 = v3;
      v18 = +[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", v3, v3, 0, TPSAnalyticsLaunchTypeForeground);
      goto LABEL_6;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collection"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));

    v12 = 0;
  }
  v20 = v3;

  v3 = (id)v10;
  v18 = +[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", v20, v10, v12, TPSAnalyticsLaunchTypeForeground);
LABEL_6:
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v19, "log");

}

- (void)logAnalyticsEventForChecklistSession
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsChecklistSessionController sharedInstance](TPSAnalyticsChecklistSessionController, "sharedInstance"));
  if (objc_msgSend(v2, "hasActiveSession"))
    objc_msgSend(v2, "stopSession");

}

- (BOOL)_splitViewController:(id)a3 allowInteractivePresentationGesture:(id)a4 inContentsOfColumn:(int64_t)a5
{
  return 1;
}

- (id)tipsByCollectionViewController:(id)a3 tipsForCollectionID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (+[TPSCommonDefines isChecklistCollectionWithIdentifier:](TPSCommonDefines, "isChecklistCollectionWithIdentifier:", a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewModel"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "checklistViewModel"));
    objc_msgSend(v7, "updateTips");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDisplayTips"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)tipsViewController:(id)a3 loadMainUserGuideWithIdentifier:(id)a4 topicId:(id)a5
{
  -[TPSMainViewController displayUserGuideWithIdentifier:topicId:version:platformIndependent:prefersLandingPage:](self, "displayUserGuideWithIdentifier:topicId:version:platformIndependent:prefersLandingPage:", a4, a5, 0, 1, 1);
}

- (void)tipsViewController:(id)a3 showSharedTipWithTipIdentifier:(id)a4
{
  -[TPSMainViewController showCollectionWithIdentifier:launchType:](self, "showCollectionWithIdentifier:launchType:", a4, TPSAnalyticsLaunchTypeSharedTipSecondLaunch);
}

- (void)tipsViewControllerCurrentTipUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));

  v5 = v16;
  if (v4 == v16)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentTip"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collectionID"));
    v8 = +[TPSCommonDefines isChecklistCollectionWithIdentifier:](TPSCommonDefines, "isChecklistCollectionWithIdentifier:", v7);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController collectionListViewController](self, "collectionListViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "checklistViewModel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      if (v12)
      {
        objc_msgSend(v11, "setSelectedTipIdentifier:", v12);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstTip"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        objc_msgSend(v11, "setSelectedTipIdentifier:", v15);

      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewModel"));

      objc_msgSend(v10, "setCurrentTip:", v6);
    }

    v5 = v16;
  }

}

- (void)tipsViewControllerContentUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;

  v21 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));

  v5 = v21;
  if (v4 == v21)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collectionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipListViewController](self, "tipListViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModel"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionForIdentifier:", v6));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collection"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
      objc_msgSend(v8, "setCollection:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tips"));
    if (objc_msgSend(v13, "count"))
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tips"));
    else
      v14 = &__NSArray0__struct;

    objc_msgSend(v8, "setTips:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTip"));
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
      v19 = objc_msgSend(v18, "viewNavigationCollapsed");

      if ((v19 & 1) == 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        objc_msgSend(v8, "setSelectedTipIdentifier:", v20);

      }
      objc_msgSend(v8, "setCurrentTip:", v17);

    }
    v5 = v21;
  }

}

- (BOOL)tipsViewControllerShouldShowSearch:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;

  v4 = a3;
  if ((+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSMainViewController appController](self, "appController"));
    if ((objc_msgSend(v6, "viewNavigationCollapsed") & 1) != 0)
      LOBYTE(v5) = 0;
    else
      v5 = objc_msgSend(v4, "isSharedVariant") ^ 1;

  }
  return v5;
}

- (BOOL)tipsViewControllerShouldStartVideo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));

  if (v5 == v4)
    return !-[TPSMainViewController userGuideDisplayed](self, "userGuideDisplayed");
  else
    return 1;
}

- (void)helpViewControllerDoneButtonTapped:(id)a3
{
  id v4;

  -[TPSMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[TPSMainViewController setUserGuideDisplayed:](self, "setUserGuideDisplayed:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSMainViewController tipsByCollectionViewController](self, "tipsByCollectionViewController"));
  objc_msgSend(v4, "continueVideoForCurrentTip");

}

- (void)helpViewControllerSearchUsed:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventHLPSearchUsed event](TPSAnalyticsEventHLPSearchUsed, "event", a3));
  objc_msgSend(v3, "log");

}

- (void)helpViewControllerTOCUsed:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventHLPTocUsed event](TPSAnalyticsEventHLPTocUsed, "event", a3));
  objc_msgSend(v3, "log");

}

- (void)helpViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  _QWORD *v9;
  id v10;

  v9 = &TPSConstellationContentUtilitiesAttributeLight;
  if (a7 != 1)
    v9 = &TPSConstellationContentUtilitiesAttributeDark;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventHLPContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:](TPSAnalyticsEventHLPContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", a4, a5, a6, *v9, a8, a9));
  objc_msgSend(v10, "log");

}

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (BOOL)pendingColumnSwitching
{
  return self->_pendingColumnSwitching;
}

- (void)setPendingColumnSwitching:(BOOL)a3
{
  self->_pendingColumnSwitching = a3;
}

- (BOOL)userGuideDisplayed
{
  return self->_userGuideDisplayed;
}

- (void)setUserGuideDisplayed:(BOOL)a3
{
  self->_userGuideDisplayed = a3;
}

- (NSURL)pendingOpenUniversalURL
{
  return self->_pendingOpenUniversalURL;
}

- (void)setPendingOpenUniversalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)pendingShowTipIdentifier
{
  return self->_pendingShowTipIdentifier;
}

- (void)setPendingShowTipIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (TPSAppSearchQuery)pendingAppSearchQuery
{
  return self->_pendingAppSearchQuery;
}

- (void)setPendingAppSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAppSearchQuery, a3);
}

- (TPSAnalyticsEventAppLaunched)pendingAppLaunchEvent
{
  return self->_pendingAppLaunchEvent;
}

- (void)setPendingAppLaunchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAppLaunchEvent, a3);
}

- (NSString)pendingSharedTipVariantID
{
  return self->_pendingSharedTipVariantID;
}

- (void)setPendingSharedTipVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setLastDisplayedContent:(id)a3
{
  objc_storeStrong((id *)&self->_lastDisplayedContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayedContent, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_pendingSharedTipVariantID, 0);
  objc_storeStrong((id *)&self->_pendingAppLaunchEvent, 0);
  objc_storeStrong((id *)&self->_pendingAppSearchQuery, 0);
  objc_storeStrong((id *)&self->_pendingShowTipIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingOpenUniversalURL, 0);
  objc_storeStrong((id *)&self->_tipsByCollectionViewController, 0);
  objc_storeStrong((id *)&self->_collectionListViewController, 0);
  objc_storeStrong((id *)&self->_tipListViewController, 0);
  objc_storeStrong((id *)&self->_appController, 0);
}

- (void)tipsViewController:(id)a3 didSelectSearchResult:(id)a4
{
  id v7;
  TPSMainViewController *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  TPSMainViewController *v12;
  _OWORD v13[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v10 = swift_unknownObjectRetain(a4, v9);
    _bridgeAnyObjectToAny(_:)(v13, v10);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v11 = a3;
    v12 = self;
  }
  sub_1000395B8((uint64_t)v13);

  sub_100011DE0((uint64_t)v13, &qword_1000B49D0);
}

- (void)showModalTipWithVariantID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPSMainViewController *v7;
  TPSUIAppController *v8;
  NSString v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  TPSMainViewController *v13;
  _QWORD v14[5];
  _QWORD *v15;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = -[TPSMainViewController appController](v7, "appController");
  v9 = String._bridgeToObjectiveC()();
  v10 = (_QWORD *)swift_allocObject(&unk_1000A4078, 40, 7);
  v10[2] = v4;
  v10[3] = v6;
  v10[4] = v7;
  v14[4] = sub_10004B004;
  v15 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10004AE40;
  v14[3] = &unk_1000A4090;
  v11 = _Block_copy(v14);
  v12 = v15;
  v13 = v7;
  swift_bridgeObjectRetain(v6);
  swift_release(v12);
  -[TPSUIAppController contentForVariant:completionHandler:](v8, "contentForVariant:completionHandler:", v9, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease(v6);
}

@end
