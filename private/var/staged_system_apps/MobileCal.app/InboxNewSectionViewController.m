@implementation InboxNewSectionViewController

- (InboxNewSectionViewController)initWithModel:(id)a3
{
  id v5;
  InboxNewSectionViewController *v6;
  InboxNewSectionViewController *v7;
  CUIKCalendarModel **p_model;
  double v9;
  InboxInvitationsGroupController *v10;
  InboxInviteeResponsesGroupController *v11;
  InboxSharedCalendarGroupController *v12;
  InboxSuggestionsGroupController *v13;
  uint64_t v14;
  NSArray *allGroups;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)InboxNewSectionViewController;
  v6 = -[InboxNewSectionViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    p_model = &v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    +[CalendarMessageCell defaultRowHeight](CalendarMessageCell, "defaultRowHeight");
    v7->_minimumContentHeight = v9 * 4.5;
    v10 = -[InboxNotificationsGroupController initWithModel:delegate:]([InboxInvitationsGroupController alloc], "initWithModel:delegate:", *p_model, v7);
    v27[0] = v10;
    v11 = -[InboxNotificationsGroupController initWithModel:delegate:]([InboxInviteeResponsesGroupController alloc], "initWithModel:delegate:", *p_model, v7);
    v27[1] = v11;
    v12 = -[InboxNotificationsGroupController initWithModel:delegate:]([InboxSharedCalendarGroupController alloc], "initWithModel:delegate:", *p_model, v7);
    v27[2] = v12;
    v13 = -[InboxNotificationsGroupController initWithModel:delegate:]([InboxSuggestionsGroupController alloc], "initWithModel:delegate:", *p_model, v7);
    v27[3] = v13;
    v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    allGroups = v7->_allGroups;
    v7->_allGroups = (NSArray *)v14;

    objc_opt_class(UITraitUserInterfaceStyle);
    v26[0] = v16;
    *(_QWORD *)&v17 = objc_opt_class(UITraitPreferredContentSizeCategory).n128_u64[0];
    v26[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2, v17));
    objc_initWeak(&location, v7);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000FE350;
    v22[3] = &unk_1001B2418;
    objc_copyWeak(&v23, &location);
    v20 = -[InboxNewSectionViewController registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v19, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (void)_refreshIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int IsRegularInViewHierarchy;
  uint64_t v10;
  id v11;

  self->_isRefreshing = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
  v4 = objc_msgSend(v3, "count");

  -[InboxNewSectionViewController _updateGroupVisibility](self, "_updateGroupVisibility");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
  v6 = objc_msgSend(v5, "count");

  v11 = (id)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
  objc_msgSend(v11, "reloadData");
  if (v6)
  {
    objc_msgSend(v11, "setShowNoContentString:", 0);
  }
  else
  {
    if (-[InboxNewSectionViewController shouldShowIdentityChooser](self, "shouldShowIdentityChooser"))
      v10 = 0;
    else
      v10 = -[InboxNewSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner") ^ 1;
    objc_msgSend(v11, "setShowNoContentString:", v10);
    if (v4)
    {
      -[InboxNewSectionViewController _delegateShouldClose](self, "_delegateShouldClose");
      goto LABEL_10;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController view](self, "view"));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v7, v8);

  if (IsRegularInViewHierarchy)
  {
    -[InboxNewSectionViewController preferredContentSize](self, "preferredContentSize");
    -[InboxNewSectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
LABEL_10:
  self->_isRefreshing = 0;

}

- (void)_updateGroupVisibility
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  _QWORD v7[4];
  NSMutableArray *v8;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController allGroups](self, "allGroups"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE580;
  v7[3] = &unk_1001B57D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  -[InboxNewSectionViewController setVisibleGroups:](self, "setVisibleGroups:", v5);

}

- (void)setViewIsVisible:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  self->_viewIsVisible = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController allGroups](self, "allGroups"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FE644;
  v5[3] = &unk_1001B57F8;
  v6 = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (void)inboxWillDismiss
{
  +[CalendarMessageCell emptyAuthorCache](CalendarMessageCell, "emptyAuthorCache");
  -[NSArray enumerateObjectsUsingBlock:](self->_allGroups, "enumerateObjectsUsingBlock:", &stru_1001B5838);
}

- (void)dealloc
{
  void *v3;
  UIInteraction *contextMenuInteraction;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController view](self, "view"));
  objc_msgSend(v3, "removeInteraction:", self->_contextMenuInteraction);

  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = 0;

  v5.receiver = self;
  v5.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  InboxTableView *v3;

  v3 = -[InboxTableView initWithFrame:style:]([InboxTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[InboxTableView setListViewDelegate:](v3, "setListViewDelegate:", self);
  -[InboxTableView setPrefetchDataSource:](v3, "setPrefetchDataSource:", self);
  -[InboxNewSectionViewController setTableView:](self, "setTableView:", v3);

}

- (void)viewDidLoad
{
  UIInteraction *v3;
  UIInteraction *contextMenuInteraction;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (UIInteraction *)objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController view](self, "view"));
  objc_msgSend(v5, "addInteraction:", self->_contextMenuInteraction);

}

- (BOOL)_canEnableRefresh
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sources"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "sourceType") && objc_msgSend(v8, "sourceType") != (id)5)
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarsForEntityType:", 0, 0));
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v17;
            while (2)
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(_QWORD *)v17 != v12)
                  objc_enumerationMutation(v9);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), "allowEvents") & 1) != 0)
                {

                  v14 = 1;
                  goto LABEL_22;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v11)
                continue;
              break;
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v5);
  }
  else
  {
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *allGroups;
  _QWORD v11[4];
  BOOL v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController viewWillAppear:](&v13, "viewWillAppear:");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController refreshControl](self, "refreshControl"));
  if (!v5)
  {
    if (!-[InboxNewSectionViewController _canEnableRefresh](self, "_canEnableRefresh"))
      goto LABEL_5;
    v5 = objc_alloc_init((Class)UIRefreshControl);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_pulledToRefresh:", 4096);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
    objc_msgSend(v6, "_setRefreshControl:", v5);

    -[InboxNewSectionViewController setRefreshControl:](self, "setRefreshControl:", v5);
  }

LABEL_5:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

  if (v9)
  {
    EKUIPushFallbackSizingContextWithViewHierarchy(v9);
    -[InboxNewSectionViewController _refreshIfNeeded](self, "_refreshIfNeeded");
    EKUIPopFallbackSizingContextWithViewHierarchy(v9);
  }
  else
  {
    -[InboxNewSectionViewController _refreshIfNeeded](self, "_refreshIfNeeded");
  }
  allGroups = self->_allGroups;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FEB4C;
  v11[3] = &unk_1001B5858;
  v12 = a3;
  -[NSArray enumerateObjectsUsingBlock:](allGroups, "enumerateObjectsUsingBlock:", v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  -[InboxNewSectionViewController setViewIsVisible:](self, "setViewIsVisible:", 1);
  if (self->_destination == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, self->_model);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_focusConfigurationChanged:", CUIKCalendarModelFocusModeConfigurationChangedNotification, self->_model);

  if (+[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("InboxNewSectionViewController_ViewDidAppearNotification"), self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  NSTimer *selectionTimer;
  NSTimer *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  selectionTimer = self->_selectionTimer;
  if (selectionTimer)
  {
    -[NSTimer invalidate](selectionTimer, "invalidate");
    v6 = self->_selectionTimer;
    self->_selectionTimer = 0;

  }
  -[InboxNewSectionViewController setViewIsVisible:](self, "setViewIsVisible:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[NSArray enumerateObjectsUsingBlock:](self->_allGroups, "enumerateObjectsUsingBlock:", &stru_1001B5878);
}

- (CGSize)preferredContentSize
{
  void *v3;
  __n128 v4;
  double v5;
  double minimumContentHeight;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __n128 v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (!self->_isRefreshing)
    -[InboxNewSectionViewController _refreshIfNeeded](self, "_refreshIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
  objc_msgSend(v3, "sizeThatFits:", EKUIContainedControllerIdealWidth(v3, v4), 1.79769313e308);
  minimumContentHeight = v5;

  if (self->_minimumContentHeight >= minimumContentHeight)
    minimumContentHeight = self->_minimumContentHeight;
  self->_minimumContentHeight = minimumContentHeight;
  v8 = EKUIWidthForWindowSizeParadigm(4, v7);
  v9 = EKUIGoldenRatioPhi();
  v11 = minimumContentHeight / v10.n128_f64[0];
  v12 = EKUIContainedControllerIdealWidth(v9, v10);
  if (v11 < v12)
    v12 = v11;
  if (v8 >= v12)
    v12 = v8;
  v13 = minimumContentHeight;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  id v4;
  NSTimer *v5;
  NSTimer *selectionTimer;
  _QWORD v7[5];

  v4 = a3;
  if (self->_currentSelectedEvent && !self->_selectionTimer)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000FEEC0;
    v7[3] = &unk_1001B58A0;
    v7[4] = self;
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 0.15));
    selectionTimer = self->_selectionTimer;
    self->_selectionTimer = v5;

  }
}

- (void)_focusConfigurationChanged:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (int64_t)focusBannerSection
{
  return 0;
}

- (BOOL)isFocusBannerSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[InboxNewSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner");
  if (v5)
    LOBYTE(v5) = -[InboxNewSectionViewController focusBannerSection](self, "focusBannerSection") == a3;
  return v5;
}

- (int64_t)identityChooserSection
{
  return -[InboxNewSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner");
}

- (BOOL)isIdentityChooserSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[InboxNewSectionViewController shouldShowIdentityChooser](self, "shouldShowIdentityChooser");
  if (v5)
    LOBYTE(v5) = -[InboxNewSectionViewController identityChooserSection](self, "identityChooserSection") == a3;
  return v5;
}

- (int64_t)firstGroupSection
{
  unsigned int v3;
  unsigned int v4;
  int64_t v5;

  v3 = -[InboxNewSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner");
  v4 = -[InboxNewSectionViewController shouldShowIdentityChooser](self, "shouldShowIdentityChooser");
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3;
}

- (BOOL)shouldShowIdentityChooser
{
  unsigned int v3;

  v3 = -[CUIKCalendarModel containsDelegateSources](self->_model, "containsDelegateSources");
  if (v3)
    LOBYTE(v3) = self->_destination != 2;
  return v3;
}

- (BOOL)shouldShowFocusBanner
{
  return -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode") != 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  char *v5;
  char *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups", a3));
  v5 = (char *)objc_msgSend(v4, "count");

  v6 = &v5[-[InboxNewSectionViewController shouldShowIdentityChooser](self, "shouldShowIdentityChooser")];
  return (int64_t)&v6[-[InboxNewSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner")];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  char *v7;

  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
    v7 = (char *)objc_msgSend(v6, "count") + 1;
LABEL_6:

    return (int64_t)v7;
  }
  if (!-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForSection:](self, "_groupForSection:", a4));
    v7 = (char *)objc_msgSend(v6, "numberOfRows");
    goto LABEL_6;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  EKUIDetailWithCheckAccessoryTableCell *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  EKUIFocusBannerTableViewCell *v15;
  EKUIFocusBannerTableViewCell *focusBannerCell;
  uint64_t v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", objc_msgSend(v7, "section")))
  {
    v8 = objc_opt_new(EKUIDetailWithCheckAccessoryTableCell);
    if (objc_msgSend(v7, "row"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", (char *)objc_msgSend(v7, "row") - 1));

      v11 = CUIKDisplayedTitleForSource(v10, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
      v14 = objc_msgSend(v10, "isEqual:", v13);
    }
    else
    {
      *(_QWORD *)&v20 = objc_opt_class(self).n128_u64[0];
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v21, v20));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("My Calendar"), &stru_1001B67C0, 0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
      v10 = 0;
      v14 = v13 == 0;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventNotificationReferencesForIdentity:](self->_model, "eventNotificationReferencesForIdentity:", v10));
    v24 = objc_msgSend(v23, "count");

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell titleLabel](v8, "titleLabel"));
    objc_msgSend(v25, "setText:", v12);

    if (v14)
      v26 = 3;
    else
      v26 = 0;
    -[EKUIDetailWithCheckAccessoryTableCell setAccessoryType:](v8, "setAccessoryType:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell titleLabel](v8, "titleLabel"));
    objc_msgSend(v27, "setEnabled:", 1);

    if (v24)
    {
      v28 = CUIKLocalizedStringForInteger(v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell detailLabel](v8, "detailLabel"));
      objc_msgSend(v30, "setText:", v29);

    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell detailLabel](v8, "detailLabel"));
      objc_msgSend(v29, "setText:", 0);
    }

LABEL_22:
    goto LABEL_25;
  }
  if (!-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v7, "section")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForIndexPath:](self, "_groupForIndexPath:", v7));
    v18 = objc_msgSend(v7, "row");
    if ((objc_msgSend(v6, "isTracking") & 1) != 0
      || (objc_msgSend(v6, "isScrollAnimating") & 1) != 0
      || (objc_msgSend(v6, "isDecelerating") & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      v19 = (uint64_t)objc_msgSend(UIApp, "isRunningTest");
    }
    v8 = (EKUIDetailWithCheckAccessoryTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForRow:allowAsyncLoading:", v18, v19));
    goto LABEL_22;
  }
  if (!self->_focusBannerCell)
  {
    v15 = (EKUIFocusBannerTableViewCell *)objc_msgSend(objc_alloc((Class)EKUIFocusBannerTableViewCell), "initWithReuseIdentifier:", CFSTR("FocusBanner"));
    focusBannerCell = self->_focusBannerCell;
    self->_focusBannerCell = v15;

    -[EKUIFocusBannerTableViewCell setSelectionStyle:](self->_focusBannerCell, "setSelectionStyle:", 0);
    -[EKUIFocusBannerTableViewCell setDelegate:](self->_focusBannerCell, "setDelegate:", self);
  }
  -[EKUIFocusBannerTableViewCell setOn:](self->_focusBannerCell, "setOn:", -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode") == (id)1);
  if (self->_destination == 2)
    v17 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listSidebarCellConfiguration](UIBackgroundConfiguration, "listSidebarCellConfiguration"));
  else
    v17 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
  v31 = (void *)v17;
  -[EKUIFocusBannerTableViewCell setBackgroundConfiguration:](self->_focusBannerCell, "setBackgroundConfiguration:", v17);

  v8 = self->_focusBannerCell;
LABEL_25:
  objc_opt_class(CalendarMessageCell);
  if ((objc_opt_isKindOfClass(v8, v32) & 1) != 0)
    -[EKUIDetailWithCheckAccessoryTableCell setDestination:](v8, "setDestination:", -[InboxNewSectionViewController destination](self, "destination"));

  return v8;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", objc_msgSend(v10, "section"))&& !-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v10, "section")))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForIndexPath:](self, "_groupForIndexPath:", v10));
          objc_msgSend(v11, "prefetchRow:", objc_msgSend(v10, "row"));

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  void *v7;
  double v8;

  v5 = a4;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", objc_msgSend(v5, "section"))|| -[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v5, "section")))
  {
    v6 = UITableViewAutomaticDimension;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForIndexPath:](self, "_groupForIndexPath:", v5));
    objc_msgSend(v7, "estimatedHeightForRow:", objc_msgSend(v5, "row"));
    v6 = v8;

  }
  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", objc_msgSend(v5, "section")))
  {
    v6 = v5;
  }
  else if (-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v5, "section")))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForIndexPath:](self, "_groupForIndexPath:", v5));
    if (objc_msgSend(v7, "canSelectRow:", objc_msgSend(v5, "row")))
      v8 = v5;
    else
      v8 = 0;
    v6 = v8;

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Index path selected: [%@]", (uint8_t *)&v11, 0xCu);
  }
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", objc_msgSend(v7, "section")))
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    if (objc_msgSend(v7, "row"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "row") - 1));

    }
    else
    {
      v10 = 0;
    }
    -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](self->_model, "updateSourceForSelectedIdentity:selectedCalendars:", v10, 0);
    goto LABEL_10;
  }
  if (!-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v7, "section")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForIndexPath:](self, "_groupForIndexPath:", v7));
    objc_msgSend(v10, "rowSelected:", objc_msgSend(v7, "row"));
LABEL_10:

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", a4))
  {
    *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("View Notifications:"), &stru_1001B67C0, 0));
  }
  else
  {
    if (-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", a4))
    {
LABEL_7:
      v12 = 0;
      return v12;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForSection:](self, "_groupForSection:", a4));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleForHeader"));
  }
  v10 = (void *)v9;

  if (!v10)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "prominentInsetGroupedHeaderConfiguration"));
  objc_msgSend(v11, "setText:", v10);
  v12 = objc_msgSend(objc_alloc((Class)UIListContentView), "initWithConfiguration:", v11);

  return v12;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController view](self, "view"));
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
  objc_msgSend(v11, "convertPoint:toView:", v12, v8, v10);
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathForRowAtPoint:", v14, v16));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:", v18));
    if (v19)
    {
      objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, v18);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000FFCA4;
      v25[3] = &unk_1001B2628;
      v26 = v19;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000FFCFC;
      v22[3] = &unk_1001B58F0;
      v22[4] = self;
      v23 = v18;
      v24 = v26;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v25, v22));

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  UITargetedPreview *targetedPreview;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UITargetedPreview *v17;
  UITargetedPreview *v18;
  UITargetedPreview *v19;

  targetedPreview = self->_targetedPreview;
  self->_targetedPreview = 0;
  v7 = a3;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForRowAtPoint:", v10, v12));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v14));

    v17 = (UITargetedPreview *)objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v16);
    v18 = self->_targetedPreview;
    self->_targetedPreview = v17;

  }
  v19 = self->_targetedPreview;

  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  UITargetedPreview *v6;
  UITargetedPreview *targetedPreview;

  v6 = self->_targetedPreview;
  targetedPreview = self->_targetedPreview;
  self->_targetedPreview = 0;

  return v6;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  objc_opt_class(EKUIReadonlyEventViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  else
    v9 = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
  objc_msgSend(v9, "willCommitPreview");
  if (v10)
  {
    v11 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that the following event should be inspected: [%@]", buf, 0xCu);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010015C;
    v12[3] = &unk_1001B26A0;
    v12[4] = self;
    v13 = v10;
    objc_msgSend(v6, "addAnimations:", v12);

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  NSIndexPath *indexPathForRowWithContextMenu;

  indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
  self->_indexPathForRowWithContextMenu = 0;

}

- (id)noContentStringForInboxTableView:(id)a3
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("No Invitations"), &stru_1001B67C0, 0));

  return v6;
}

- (void)inboxTableViewGroupController:(id)a3 addedRows:(id)a4 removedRows:(id)a5 updatedRows:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  InboxNewSectionViewControllerDelegate **p_inboxNewSectionDelegate;
  id WeakRetained;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  int64_t v52;
  _QWORD v53[4];
  id v54;
  int64_t v55;
  _QWORD v56[4];
  id v57;
  int64_t v58;

  v49 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_viewIsVisible)
  {
    if (self->_reloadsSuspendedUntilRefreshCompletes)
    {
      self->_needReloadWhenRefreshCompletes = 1;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
      -[InboxNewSectionViewController _updateGroupVisibility](self, "_updateGroupVisibility");
      v48 = v13;
      if (v49)
        v14 = (uint64_t)objc_msgSend(v13, "indexOfObject:");
      else
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = objc_msgSend(v10, "count");
      v16 = objc_msgSend(v11, "count");
      v17 = objc_msgSend(v12, "count");
      v18 = -[InboxNewSectionViewController firstGroupSection](self, "firstGroupSection");
      if (!v16)
        goto LABEL_9;
      v47 = v16;
      v19 = v14;
      v20 = v12;
      v21 = v11;
      v22 = v10;
      v23 = v15;
      v24 = v17;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
      v26 = objc_msgSend(v25, "count");

      v17 = v24;
      v15 = v23;
      v10 = v22;
      v11 = v21;
      v12 = v20;
      v14 = v19;
      v16 = v47;
      if (!v26)
      {
        -[InboxNewSectionViewController _delegateShouldClose](self, "_delegateShouldClose");
      }
      else
      {
LABEL_9:
        v27 = v18 + v14;
        if ((objc_msgSend(v49, "hasRows") & 1) != 0 || v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
          v31 = v30;
          if (v15 || v16 || v17)
          {
            objc_msgSend(v30, "beginUpdates");

            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_10010073C;
            v56[3] = &unk_1001B5918;
            v57 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
            v58 = v27;
            v31 = v57;
            objc_msgSend(v10, "enumerateIndexesUsingBlock:", v56);
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
            objc_msgSend(v32, "insertRowsAtIndexPaths:withRowAnimation:", v31, 6);

            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_10010078C;
            v53[3] = &unk_1001B5918;
            v54 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
            v55 = v27;
            v33 = v54;
            objc_msgSend(v11, "enumerateIndexesUsingBlock:", v53);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
            objc_msgSend(v34, "deleteRowsAtIndexPaths:withRowAnimation:", v33, 6);

            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_1001007DC;
            v50[3] = &unk_1001B5918;
            v51 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
            v52 = v27;
            v35 = v51;
            objc_msgSend(v12, "enumerateIndexesUsingBlock:", v50);
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
            objc_msgSend(v36, "reloadRowsAtIndexPaths:withRowAnimation:", v35, 6);

            v37 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
            objc_msgSend(v37, "endUpdates");

          }
          else
          {
            objc_msgSend(v30, "reloadData");
          }

        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v27));
          objc_msgSend(v28, "deleteSections:withRowAnimation:", v29, 6);

        }
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
      if (objc_msgSend(v38, "count")
        || -[InboxNewSectionViewController shouldShowIdentityChooser](self, "shouldShowIdentityChooser"))
      {
        v39 = 0;
      }
      else
      {
        v39 = -[InboxNewSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner") ^ 1;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
      objc_msgSend(v40, "setShowNoContentString:", v39);

      if (self->_wantsDisplayReviewPrompt)
      {
        if (objc_msgSend(v48, "count"))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
          v42 = objc_msgSend(v41, "count");

          if (!v42)
          {
            self->_wantsDisplayReviewPrompt = 0;
            p_inboxNewSectionDelegate = &self->_inboxNewSectionDelegate;
            WeakRetained = objc_loadWeakRetained((id *)p_inboxNewSectionDelegate);
            v45 = objc_opt_respondsToSelector(WeakRetained, "attemptDisplayReviewPrompt");

            if ((v45 & 1) != 0)
            {
              v46 = objc_loadWeakRetained((id *)p_inboxNewSectionDelegate);
              objc_msgSend(v46, "attemptDisplayReviewPrompt");

            }
          }
        }
      }

    }
  }

}

- (void)inboxTableViewGroupController:(id)a3 inspectEvent:(id)a4
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  if (WeakRetained)
  {
    if (v6)
    {
      v8 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that an event should be inspected.", buf, 2u);
      }
      v9 = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
      objc_msgSend(v9, "inboxNewSectionViewController:inspectEvent:", self, v6);

      if (self->_destination == 2)
        objc_storeStrong((id *)&self->_currentSelectedEvent, a4);
    }
  }
  else
  {
    v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "No delegate found.  Will not request that event be inspected.", v11, 2u);
    }
  }

}

- (void)inboxTableViewGroupController:(id)a3 viewCommentsForEvent:(id)a4
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  if (v7 && WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
    objc_msgSend(v6, "inboxNewSectionViewController:viewCommentsForEvent:", self, v7);

  }
}

- (void)inboxTableViewGroupController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  if (v7 && WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
    objc_msgSend(v9, "inboxNewSectionViewController:viewProposedTimeForAttendee:onEvent:", self, v10, v7);

  }
}

- (void)inboxTableViewGroupController:(id)a3 requestsReloadOfRow:(int64_t)a4
{
  id v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  if (self->_viewIsVisible)
  {
    if (self->_reloadsSuspendedUntilRefreshCompletes)
    {
      self->_needReloadWhenRefreshCompletes = 1;
    }
    else
    {
      v15 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
      v8 = (char *)objc_msgSend(v7, "indexOfObject:", v15);
      v9 = &v8[-[InboxNewSectionViewController firstGroupSection](self, "firstGroupSection")];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
      objc_msgSend(v11, "beginUpdates");

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, 0));
      objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 100);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController tableView](self, "tableView"));
      objc_msgSend(v14, "endUpdates");

      v6 = v15;
    }
  }

}

- (void)attemptDisplayReviewPrompt
{
  self->_wantsDisplayReviewPrompt = 1;
}

- (void)refresh:(id)a3
{
  id v4;
  void *v5;
  EKAccountRefresher *v6;
  EKAccountRefresher *currentAccountRefresher;

  CalAnalyticsSendEvent(CFSTR("userPerformedManualRefresh"), &off_1001BC9D8);
  v4 = objc_alloc((Class)EKAccountRefresher);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v6 = (EKAccountRefresher *)objc_msgSend(v4, "initWithEventStore:", v5);
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = v6;

  -[EKAccountRefresher setDelegate:](self->_currentAccountRefresher, "setDelegate:", self);
  -[EKAccountRefresher refresh](self->_currentAccountRefresher, "refresh");
}

- (void)_pulledToRefresh:(id)a3
{
  self->_reloadsSuspendedUntilRefreshCompletes = 1;
  -[InboxNewSectionViewController refresh:](self, "refresh:", a3);
}

- (void)accountRefreshFinished:(id)a3
{
  EKAccountRefresher *currentAccountRefresher;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_reloadsSuspendedUntilRefreshCompletes = 0;
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController refreshControl](self, "refreshControl"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController refreshControl](self, "refreshControl"));
    objc_msgSend(v6, "endRefreshing");

  }
  if (objc_msgSend(v7, "allAccountsOffline"))
    +[EKUIAccountErrorDisplayer presentAlertForOfflineErrorUsingViewController:](EKUIAccountErrorDisplayer, "presentAlertForOfflineErrorUsingViewController:", self);
  if (self->_needReloadWhenRefreshCompletes)
  {
    self->_needReloadWhenRefreshCompletes = 0;
    -[InboxNewSectionViewController inboxTableViewGroupController:addedRows:removedRows:updatedRows:](self, "inboxTableViewGroupController:addedRows:removedRows:updatedRows:", 0, 0, 0, 0);
  }

}

- (id)_eventForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", objc_msgSend(v4, "section"))|| -[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v4, "section")))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _groupForIndexPath:](self, "_groupForIndexPath:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventForRow:", objc_msgSend(v4, "row")));

  }
  return v5;
}

- (id)_groupForIndexPath:(id)a3
{
  return -[InboxNewSectionViewController _groupForSection:](self, "_groupForSection:", objc_msgSend(a3, "section"));
}

- (id)_groupForSection:(int64_t)a3
{
  int64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3 - -[InboxNewSectionViewController firstGroupSection](self, "firstGroupSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
  v6 = objc_msgSend(v5, "count");

  if (v4 >= (uint64_t)v6)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController visibleGroups](self, "visibleGroups"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v4));

  }
  return v8;
}

- (void)_delegateShouldClose
{
  InboxNewSectionViewControllerDelegate **p_inboxNewSectionDelegate;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint8_t v8[16];
  uint8_t buf[16];

  p_inboxNewSectionDelegate = &self->_inboxNewSectionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  v5 = kCalUILogInboxHandle;
  v6 = os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG);
  if (WeakRetained)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that this view controller be closed.", buf, 2u);
    }
    v7 = objc_loadWeakRetained((id *)p_inboxNewSectionDelegate);
    objc_msgSend(v7, "inboxNewSectionViewController:shouldCloseAnimated:", self, 1);

  }
  else if (v6)
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No delegate found.  Will not request closing.", v8, 2u);
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v7 = 0;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:withSender:](CUIKPasteboardUtilities, "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0&& "paste:" != a3)
  {
    if ("copy:" == a3)
    {
      if (self->_indexPathForRowWithContextMenu)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:"));
        v9 = (void *)v8;
        if (v8)
        {
          v16 = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
          v11 = 1;
LABEL_12:
          v7 = +[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", v11, v10);

LABEL_15:
          goto LABEL_16;
        }
LABEL_14:
        v7 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      if ("cut:" != a3)
      {
        v14.receiver = self;
        v14.super_class = (Class)InboxNewSectionViewController;
        v7 = -[InboxNewSectionViewController canPerformAction:withSender:](&v14, "canPerformAction:withSender:", a3, v6);
        goto LABEL_16;
      }
      if (self->_indexPathForRowWithContextMenu)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:"));
        v9 = (void *)v12;
        if (v12)
        {
          v15 = v12;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
          v11 = 0;
          goto LABEL_12;
        }
        goto LABEL_14;
      }
    }
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_indexPathForRowWithContextMenu)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:"));
    if (v4)
    {
      v7 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      objc_msgSend(v5, "cutEvents:delegate:", v6, self);

      v4 = v7;
    }

  }
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_indexPathForRowWithContextMenu)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:"));
    if (v4)
    {
      v7 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      objc_msgSend(v5, "copyEvents:delegate:", v6, self);

      v4 = v7;
    }

  }
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  objc_msgSend(a4, "presentFromSource:", self);
}

- (void)focusBannerTableViewCellToggled:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "on"))
    v4 = 1;
  else
    v4 = 2;
  -[CUIKCalendarModel setFocusFilterMode:](self->_model, "setFocusFilterMode:", v4);
}

- (InboxNewSectionViewControllerDelegate)inboxNewSectionDelegate
{
  return (InboxNewSectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
}

- (void)setInboxNewSectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inboxNewSectionDelegate, a3);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (NSArray)allGroups
{
  return self->_allGroups;
}

- (void)setAllGroups:(id)a3
{
  objc_storeStrong((id *)&self->_allGroups, a3);
}

- (NSArray)visibleGroups
{
  return self->_visibleGroups;
}

- (void)setVisibleGroups:(id)a3
{
  objc_storeStrong((id *)&self->_visibleGroups, a3);
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleGroups, 0);
  objc_storeStrong((id *)&self->_allGroups, 0);
  objc_destroyWeak((id *)&self->_inboxNewSectionDelegate);
  objc_storeStrong((id *)&self->_focusBannerCell, 0);
  objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, 0);
  objc_storeStrong((id *)&self->_selectionTimer, 0);
  objc_storeStrong((id *)&self->_currentSelectedEvent, 0);
  objc_storeStrong((id *)&self->_currentAccountRefresher, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
