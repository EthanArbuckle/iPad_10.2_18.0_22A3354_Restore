@implementation InboxRepliedSectionViewController

- (InboxRepliedSectionViewController)initWithModel:(id)a3
{
  id v5;
  InboxRepliedSectionViewController *v6;
  InboxRepliedSectionViewController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *pendingComments;
  NSMutableDictionary *v10;
  NSMutableDictionary *organizerNames;
  double v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *notificationQ;
  dispatch_queue_t v15;
  OS_dispatch_queue *organizerNamesQ;
  dispatch_queue_t v17;
  OS_dispatch_queue *prefetchQ;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)InboxRepliedSectionViewController;
  v6 = -[InboxRepliedSectionViewController initWithNibName:bundle:](&v21, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v7->_needsRefresh = 1;
    v8 = objc_opt_new(NSMutableDictionary);
    pendingComments = v7->_pendingComments;
    v7->_pendingComments = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    organizerNames = v7->_organizerNames;
    v7->_organizerNames = v10;

    +[CalendarMessageCell defaultRowHeight](InboxRepliedEventInvitationCell, "defaultRowHeight");
    v7->_minimumContentHeight = v12 * 4.5;
    v13 = dispatch_queue_create("com.apple.mobilecal.inbox.replied.notificationsQ", 0);
    notificationQ = v7->_notificationQ;
    v7->_notificationQ = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.mobilecal.inbox.replied.namesQ", 0);
    organizerNamesQ = v7->_organizerNamesQ;
    v7->_organizerNamesQ = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.mobilecal.inbox.replied.prefetchQ", 0);
    prefetchQ = v7->_prefetchQ;
    v7->_prefetchQ = (OS_dispatch_queue *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, "_eventStoreChanged:", EKEventStoreChangedNotification, 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, "_localeChanged:", CUIKLocaleChangedNotification, 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, "_identityChanged:", CUIKCalendarModelIdentityChangedNotification, v5);
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, "_focusConfigurationChanged:", CUIKCalendarModelFocusModeConfigurationChangedNotification, v5);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  UIInteraction *contextMenuInteraction;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController view](self, "view"));
  objc_msgSend(v3, "removeInteraction:", self->_contextMenuInteraction);

  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = 0;

  v5.receiver = self;
  v5.super_class = (Class)InboxRepliedSectionViewController;
  -[InboxRepliedSectionViewController dealloc](&v5, "dealloc");
}

- (void)setDestination:(unint64_t)a3
{
  id v3;

  if (self->_destination != a3)
  {
    self->_destination = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)loadView
{
  objc_class *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  UIInteraction *v7;
  UIInteraction *contextMenuInteraction;
  void *v9;
  InboxTableView *v10;

  v10 = -[InboxTableView initWithFrame:style:]([InboxTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[InboxTableView setRowHeight:](v10, "setRowHeight:", UITableViewAutomaticDimension);
  -[InboxTableView setListViewDelegate:](v10, "setListViewDelegate:", self);
  -[InboxTableView setPrefetchDataSource:](v10, "setPrefetchDataSource:", self);
  objc_opt_class(InboxRepliedEventInvitationCell);
  v4 = v3;
  v5 = NSStringFromClass(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[InboxTableView registerClass:forCellReuseIdentifier:](v10, "registerClass:forCellReuseIdentifier:", v4, v6);
  -[InboxRepliedSectionViewController setTableView:](self, "setTableView:", v10);
  v7 = (UIInteraction *)objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController view](self, "view"));
  objc_msgSend(v9, "addInteraction:", self->_contextMenuInteraction);

}

- (id)title
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Replied"), &stru_1001B67C0, 0));

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  id lastDisplayedFocusMode;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InboxRepliedSectionViewController;
  -[InboxRepliedSectionViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  lastDisplayedFocusMode = (id)self->_lastDisplayedFocusMode;
  if (lastDisplayedFocusMode != -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode"))
    self->_needsRefresh = 1;
  -[InboxRepliedSectionViewController _refreshIfNeeded](self, "_refreshIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)InboxRepliedSectionViewController;
  -[InboxRepliedSectionViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  self->_viewIsVisible = 1;
  if (+[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("InboxRepliedSectionViewController_ViewDidAppearNotification"), self);

  }
  if (self->_destination == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, self->_model);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  NSTimer *selectionTimer;
  NSTimer *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InboxRepliedSectionViewController;
  -[InboxRepliedSectionViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  if (self->_destination == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CUIKCalendarModelSelectedOccurrencesChangedNotification, self->_model);

  }
  selectionTimer = self->_selectionTimer;
  if (selectionTimer)
  {
    -[NSTimer invalidate](selectionTimer, "invalidate");
    v6 = self->_selectionTimer;
    self->_selectionTimer = 0;

  }
  self->_viewIsVisible = 0;
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

  -[InboxRepliedSectionViewController _refreshIfNeeded](self, "_refreshIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
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
    v7[2] = sub_100111AE0;
    v7[3] = &unk_1001B58A0;
    v7[4] = self;
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 0.15));
    selectionTimer = self->_selectionTimer;
    self->_selectionTimer = v5;

  }
}

- (void)_focusConfigurationChanged:(id)a3
{
  self->_needsRefresh = 1;
  if (self->_viewIsVisible)
    -[InboxRepliedSectionViewController _refreshIfNeeded](self, "_refreshIfNeeded", a3);
}

- (BOOL)shouldShowFocusBanner
{
  return -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode") != 0;
}

- (BOOL)isFocusBannerSection:(int64_t)a3
{
  BOOL result;

  result = -[InboxRepliedSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner");
  if (a3)
    return 0;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[InboxRepliedSectionViewController shouldShowFocusBanner](self, "shouldShowFocusBanner", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", a4))
    return 1;
  else
    return -[NSArray count](self->_occurrenceInfos, "count");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  EKUIFocusBannerTableViewCell *v6;
  EKUIFocusBannerTableViewCell *focusBannerCell;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  EKUIFocusBannerTableViewCell *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  id v20;

  v5 = a4;
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v5, "section")))
  {
    if (!self->_focusBannerCell)
    {
      v6 = (EKUIFocusBannerTableViewCell *)objc_msgSend(objc_alloc((Class)EKUIFocusBannerTableViewCell), "initWithReuseIdentifier:", CFSTR("FocusBanner"));
      focusBannerCell = self->_focusBannerCell;
      self->_focusBannerCell = v6;

      -[EKUIFocusBannerTableViewCell setSelectionStyle:](self->_focusBannerCell, "setSelectionStyle:", 0);
      -[EKUIFocusBannerTableViewCell setDelegate:](self->_focusBannerCell, "setDelegate:", self);
    }
    -[EKUIFocusBannerTableViewCell setOn:](self->_focusBannerCell, "setOn:", -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode") == (id)1);
    if (self->_destination == 2)
      v8 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listSidebarCellConfiguration](UIBackgroundConfiguration, "listSidebarCellConfiguration"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
    v17 = (void *)v8;
    -[EKUIFocusBannerTableViewCell setBackgroundConfiguration:](self->_focusBannerCell, "setBackgroundConfiguration:", v8);

    v13 = self->_focusBannerCell;
  }
  else
  {
    objc_opt_class(InboxRepliedEventInvitationCell);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
    v13 = (EKUIFocusBannerTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v5));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));

    EKUIPushFallbackSizingContextWithViewHierarchy(v15);
    -[InboxRepliedSectionViewController _updateCell:atIndexPath:](self, "_updateCell:atIndexPath:", v13, v5);
    EKUIPopFallbackSizingContextWithViewHierarchy(v15);
    -[EKUIFocusBannerTableViewCell setDestination:](v13, "setDestination:", -[InboxRepliedSectionViewController destination](self, "destination"));
    v16 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Loading cell at index path: [%@]", (uint8_t *)&v19, 0xCu);
    }

  }
  return v13;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5;
  InboxRepliedSectionViewController *v6;
  NSMutableArray *v7;
  NSObject *prefetchQ;
  NSMutableArray *v9;
  id v10;
  _QWORD block[4];
  id v12;
  InboxRepliedSectionViewController *v13;
  NSMutableArray *v14;

  v5 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_itemCache;
  objc_sync_exit(v6);

  prefetchQ = v6->_prefetchQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100111FA4;
  block[3] = &unk_1001B2CD8;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v5;
  dispatch_async(prefetchQ, block);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(a4, "section", a3)))
  {
    return UITableViewAutomaticDimension;
  }
  +[CalendarMessageCell defaultRowHeight](InboxRepliedEventInvitationCell, "defaultRowHeight");
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Index path selected: [%@]", (uint8_t *)&v14, 0xCu);
  }
  if (!-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v7, "section")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inboxRepliedSectionDelegate);

    if (WeakRetained)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", v7, self->_itemCache));
      if (v10)
      {
        v11 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
        {
          v14 = 138412290;
          v15 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that the following event should be inspected: [%@]", (uint8_t *)&v14, 0xCu);
        }
        v12 = objc_loadWeakRetained((id *)&self->_inboxRepliedSectionDelegate);
        objc_msgSend(v12, "inboxRepliedSectionViewController:inspectEvent:", self, v10);

        if (self->_destination == 2)
          objc_storeStrong((id *)&self->_currentSelectedEvent, v10);
      }

    }
    else
    {
      v13 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No delegate found.  Will not request that event be inspected.", (uint8_t *)&v14, 2u);
      }
    }
  }

}

- (void)inboxWillDismiss
{
  -[InboxRepliedSectionViewController _savePendingComments](self, "_savePendingComments");
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InboxRepliedSectionViewController;
  -[InboxRepliedSectionViewController dismissViewControllerAnimated:completion:](&v4, "dismissViewControllerAnimated:completion:", a3, a4);
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
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController view](self, "view"));
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
  objc_msgSend(v11, "convertPoint:toView:", v12, v8, v10);
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathForRowAtPoint:", v14, v16));

  v19 = objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", v18, self->_itemCache));
  v20 = (void *)v19;
  v21 = 0;
  if (v18 && v19)
  {
    objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, v18);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001125F8;
    v26[3] = &unk_1001B2628;
    v27 = v20;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100112650;
    v23[3] = &unk_1001B58F0;
    v23[4] = self;
    v24 = v18;
    v25 = v27;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v26, v23));

  }
  return v21;
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

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForRowAtPoint:", v10, v12));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
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
    v12[2] = sub_100112A7C;
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

- (void)_saveStatus:(int64_t)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *pendingComments;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSArray *v29;
  void *v30;
  NSArray *occurrenceInfos;
  NSArray *v32;
  NSMutableArray *itemCache;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  id v44;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "notification"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventFromEventStore:"));
  objc_msgSend(v8, "setShowsCommentPrompt:animated:initialValue:", 0, 0, 0);
  if (a3)
  {
    objc_msgSend(v10, "setParticipationStatus:", a3);
    v11 = 2;
  }
  else
  {
    v11 = objc_msgSend(v10, "hasRecurrenceRules");
  }
  pendingComments = self->_pendingComments;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pendingComments, "objectForKeyedSubscript:", v13));

  if (v14)
  {
    v15 = self->_pendingComments;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseComment"));
    v18 = objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:](CUIKNotificationDescriptionGenerator, "stringWithAutoCommentRemoved:", v17));

    if (v18)
      v19 = (__CFString *)v18;
    else
      v19 = &stru_1001B67C0;
    if ((objc_msgSend(v14, "isEqualToString:", v19) & 1) == 0)
    {
      v39 = v9;
      if (!objc_msgSend(v14, "length"))
      {

        v14 = 0;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "proposedStartDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator comment:withInsertedAutoCommentForDate:timeZone:](CUIKNotificationDescriptionGenerator, "comment:withInsertedAutoCommentForDate:timeZone:", v14, v20, v21));
      objc_msgSend(v10, "setResponseComment:", v22);

      v9 = v39;
    }

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController EKUI_editor](self, "EKUI_editor"));
  v42 = 0;
  v24 = objc_msgSend(v23, "saveEvent:span:error:", v10, v11, &v42);
  v25 = v42;
  if ((v24 & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
    v40 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "indexPathForCell:", v8));
    v27 = objc_msgSend(v26, "row");
    v38 = v8;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v26, "section")));
    objc_msgSend(v36, "moveRowAtIndexPath:toIndexPath:", v26, v28);
    v37 = v25;
    v29 = (NSArray *)-[NSArray mutableCopy](self->_occurrenceInfos, "mutableCopy");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v29, "objectAtIndex:", v27));
    -[NSArray removeObjectAtIndex:](v29, "removeObjectAtIndex:", v27);
    -[NSArray insertObject:atIndex:](v29, "insertObject:atIndex:", v30, 0);
    occurrenceInfos = self->_occurrenceInfos;
    self->_occurrenceInfos = v29;
    v32 = v29;

    -[NSMutableArray removeObjectAtIndex:](self->_itemCache, "removeObjectAtIndex:", v27);
    itemCache = self->_itemCache;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableArray insertObject:atIndex:](itemCache, "insertObject:atIndex:", v34, 0);

    v25 = v37;
    -[InboxRepliedSectionViewController _updateCell:atIndexPath:](self, "_updateCell:atIndexPath:", v38, v28);

    v8 = v38;
    v9 = v40;

  }
  else
  {
    v35 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error saving new invitation status: %@", buf, 0xCu);
    }
  }

}

- (void)_savePendingComments
{
  InboxRepliedSectionViewController *v2;
  uint64_t v3;
  NSMutableArray *itemCache;
  _QWORD v5[6];

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[InboxRepliedSectionViewController shouldShowFocusBanner](v2, "shouldShowFocusBanner");
  itemCache = v2->_itemCache;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100113010;
  v5[3] = &unk_1001B5D90;
  v5[4] = v2;
  v5[5] = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](itemCache, "enumerateObjectsUsingBlock:", v5);
  objc_sync_exit(v2);

  -[NSMutableDictionary removeAllObjects](v2->_pendingComments, "removeAllObjects");
}

- (void)performAction:(int64_t)a3 forCell:(id)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  __CFString *v29;
  NSMutableDictionary *pendingComments;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;

  v7 = a5;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("InboxRepliedSectionViewController.m"), 549, CFSTR("Applies to all should not ever be enabled for the replied section"));

  }
  v13 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = v13;
    v15 = CalendarMessageCellStringForButtonAction(a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v35 = 138412546;
    v36 = v16;
    v37 = 2112;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Action [%@] performed for cell: [%@].", (uint8_t *)&v35, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notification"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventFromEventStore:", v18));
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setInvitationStatus:", 0);
    if (a3 == 1)
    {
      v21 = 2;
    }
    else
    {
      if (a3 != 4)
      {
        if (a3 == 2)
          v21 = 4;
        else
          v21 = 0;
        goto LABEL_22;
      }
      if (objc_msgSend(v20, "allowsResponseCommentModifications"))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
        v24 = objc_msgSend(v23, "promptForCommentWhenDeclining");

        if (v24 == (id)2
          || v24 == (id)1
          && (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "calendar")),
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "source")),
              v27 = objc_msgSend(v26, "wantsCommentPromptWhenDeclining"),
              v26,
              v25,
              v27))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "responseComment"));
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:](CUIKNotificationDescriptionGenerator, "stringWithAutoCommentRemoved:", v28));

          if (!v29)
            v29 = &stru_1001B67C0;
          pendingComments = self->_pendingComments;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](pendingComments, "setObject:forKeyedSubscript:", v29, v31);

          objc_msgSend(v11, "setShowsCommentPrompt:animated:initialValue:", 1, 1, v29);
          goto LABEL_23;
        }
      }
      v21 = 3;
    }
LABEL_22:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "indexPathForCell:", v11));
    -[InboxRepliedSectionViewController _saveStatus:forItemAtIndexPath:](self, "_saveStatus:forItemAtIndexPath:", v21, v33);

    goto LABEL_23;
  }
  v22 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
  {
    v35 = 138412546;
    v36 = v18;
    v37 = 2112;
    v38 = v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not find event in event store [%@] that corresponds with notification: [%@].", (uint8_t *)&v35, 0x16u);
  }
LABEL_23:

}

- (void)messageCell:(id)a3 committedComment:(id)a4
{
  NSMutableDictionary *pendingComments;
  id v6;
  void *v7;
  id v8;

  pendingComments = self->_pendingComments;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "notification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingComments, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)eventStoreForCell:(id)a3
{
  return -[CUIKCalendarModel eventStore](self->_model, "eventStore", a3);
}

- (id)noContentStringForInboxTableView:(id)a3
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("No Events You’ve Replied To"), &stru_1001B67C0, 0));

  return v6;
}

- (void)_localeChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  InboxRepliedSectionViewController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@].", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113644;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_eventStoreChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  InboxRepliedSectionViewController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@]", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113774;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_identityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  InboxRepliedSectionViewController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@]", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001138A4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_refreshIfNeeded
{
  NSObject *v3;
  InboxRepliedSectionViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *occurrenceInfos;
  InboxRepliedSectionViewController *v9;
  NSMutableArray *v10;
  NSMutableArray *itemCache;
  void *v12;
  InboxRepliedSectionViewController *v13;
  NSObject *v14;
  void *v15;
  id v16;
  unsigned int v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  char v26;
  void *v27;
  uint64_t v28;
  InboxRepliedSectionViewController *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  InboxRepliedSectionViewController *v33;

  if (self->_needsRefresh)
  {
    v3 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Kicking off a refresh for [%@]", buf, 0xCu);
    }
    v29 = self;
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](v4->_model, "eventStore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inboxRepliedSectionItems"));

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100113C94;
    v31[3] = &unk_1001B5DB8;
    v31[4] = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v31));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "filteredArrayUsingPredicate:", v6));
    occurrenceInfos = v4->_occurrenceInfos;
    v4->_occurrenceInfos = (NSArray *)v7;

    v9 = -[NSArray count](v4->_occurrenceInfos, "count");
    v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v9);
    itemCache = v4->_itemCache;
    v4->_itemCache = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v9)
    {
      v13 = v9;
      do
      {
        -[NSMutableArray addObject:](v4->_itemCache, "addObject:", v12);
        v13 = (InboxRepliedSectionViewController *)((char *)v13 - 1);
      }
      while (v13);
    }
    v14 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Number of replied events after refresh: [%lu]", buf, 0xCu);
    }
    if (-[NSMutableDictionary count](v4->_pendingComments, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4->_pendingComments, "allKeys"));
      v16 = objc_msgSend(v15, "mutableCopy");

      v17 = -[InboxRepliedSectionViewController shouldShowFocusBanner](v4, "shouldShowFocusBanner");
      if (v9)
      {
        v18 = 0;
        v19 = (char *)&v9[-1]._inboxRepliedSectionDelegate + 7;
        v20 = v17;
        do
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v18, v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _notificationForIndexPath:cache:](v4, "_notificationForIndexPath:cache:", v21, v4->_itemCache));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URL"));
          objc_msgSend(v16, "removeObject:", v23);

          v24 = objc_msgSend(v16, "count") == 0;
          v26 = v19 == v18++ || v24;
        }
        while ((v26 & 1) == 0);
      }
      -[NSMutableDictionary removeObjectsForKeys:](v4->_pendingComments, "removeObjectsForKeys:", v16);

    }
    objc_sync_exit(v4);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](v4, "tableView"));
    objc_msgSend(v27, "reloadData");
    if (-[NSArray count](v4->_occurrenceInfos, "count"))
      v28 = 0;
    else
      v28 = -[InboxRepliedSectionViewController shouldShowFocusBanner](v4, "shouldShowFocusBanner") ^ 1;
    objc_msgSend(v27, "setShowNoContentString:", v28);
    v4->_lastDisplayedFocusMode = (unint64_t)-[CUIKCalendarModel focusFilterMode](v4->_model, "focusFilterMode");
    v29->_needsRefresh = 0;

  }
}

- (void)_updateCell:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  void *v10;
  NSObject *organizerNamesQ;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  uint64_t v21;
  NSMutableDictionary *pendingComments;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  if (!-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v9, "section")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _notificationForIndexPath:cache:](self, "_notificationForIndexPath:cache:", v9, self->_itemCache));
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_1001140BC;
    v33 = sub_1001140CC;
    v34 = 0;
    organizerNamesQ = self->_organizerNamesQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001140D4;
    block[3] = &unk_1001B3838;
    v28 = &v29;
    block[4] = self;
    v12 = v10;
    v27 = v12;
    dispatch_sync(organizerNamesQ, block);
    objc_opt_class(CalendarMessageEventInvitationCell);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
      objc_msgSend(v8, "setOrganizerName:", v30[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authorView"));
    objc_opt_class(EKUILabeledAvatarView);
    isKindOfClass = objc_opt_isKindOfClass(v14, v15);

    if ((isKindOfClass & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authorView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
      v19 = objc_msgSend(v18, "isTracking");
      if ((v19 & 1) != 0)
      {
        v20 = 0;
        v21 = 1;
      }
      else
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
        if ((objc_msgSend(v4, "isScrollAnimating") & 1) != 0)
        {
          v20 = 0;
          v21 = 1;
        }
        else
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self, "tableView"));
          if ((objc_msgSend(v5, "isDecelerating") & 1) != 0)
          {
            v20 = 1;
            v21 = 1;
          }
          else
          {
            v21 = (uint64_t)objc_msgSend(UIApp, "isRunningTest");
            v20 = 1;
          }
        }
      }
      objc_msgSend(v17, "setLoadContactsAsynchronously:", v21);
      if (v20)

      if ((v19 & 1) == 0)
    }
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setNotification:", v12);
    pendingComments = self->_pendingComments;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "notification"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pendingComments, "objectForKeyedSubscript:", v24));

    objc_msgSend(v8, "setShowsCommentPrompt:animated:initialValue:", v25 != 0, 0, v25);
    _Block_object_dispose(&v29, 8);

  }
}

- (id)_itemForIndexPath:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  InboxRepliedSectionItem *v8;
  InboxRepliedSectionViewController *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v6, "section")))
  {
LABEL_2:
    v8 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    v15 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "nil 'indexPath' provided.  Will not fetch item.", v17, 2u);
    }
    goto LABEL_2;
  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = objc_msgSend(v6, "row");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = objc_msgSend(v12, "isEqual:", v11);

  if (v13)
  {
    if ((uint64_t)v10 >= (int64_t)-[NSArray count](v9->_occurrenceInfos, "count"))
    {
      v8 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v9->_occurrenceInfos, "objectAtIndex:", v10));
      v8 = -[InboxRepliedSectionItem initWithOccurrenceInfo:]([InboxRepliedSectionItem alloc], "initWithOccurrenceInfo:", v14);
      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v10, v8);

    }
  }
  else
  {
    v8 = v11;
  }

  objc_sync_exit(v9);
LABEL_12:

  return v8;
}

- (id)_eventForIndexPath:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (!-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v6, "section")))
  {
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _itemForIndexPath:cache:](self, "_itemForIndexPath:cache:", v6, v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForItem:](self, "_eventForItem:", v9));

      goto LABEL_5;
    }
    v11 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "nil 'indexPath' provided.  Will not fetch event.", v12, 2u);
    }
  }
  v8 = 0;
LABEL_5:

  return v8;
}

- (id)_notificationForIndexPath:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *notificationQ;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD block[4];
  id v22;
  uint64_t *v23;
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1001140BC;
  v29 = sub_1001140CC;
  v30 = 0;
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v6, "section")))
  {
    v8 = 0;
  }
  else
  {
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _itemForIndexPath:cache:](self, "_itemForIndexPath:cache:", v6, v7));
      notificationQ = self->_notificationQ;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100114620;
      block[3] = &unk_1001B2E60;
      v23 = &v25;
      v11 = v9;
      v22 = v11;
      dispatch_sync(notificationQ, block);
      if (!v26[5])
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", v6, v7));
        if (v12)
        {
          v13 = objc_msgSend(objc_alloc((Class)EKCalendarEventInvitationNotification), "initWithEvent:", v12);
          v14 = (void *)v26[5];
          v26[5] = (uint64_t)v13;

          v15 = self->_notificationQ;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100114658;
          v18[3] = &unk_1001B3030;
          v19 = v11;
          v20 = &v25;
          dispatch_sync(v15, v18);

        }
      }

    }
    else
    {
      v16 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "nil 'indexPath' provided.  Will not fetch notification.", buf, 2u);
      }
    }
    v8 = (id)v26[5];
  }
  _Block_object_dispose(&v25, 8);

  return v8;
}

- (id)_eventForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "occurrenceInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForOccurrenceInfo:](self, "_eventForOccurrenceInfo:", v7));
      if (v6)
        objc_msgSend(v5, "setEvent:", v6);

    }
  }
  else
  {
    v8 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "nil 'item' provided.  Will not fetch event.", v10, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_eventForOccurrenceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventForObjectID:occurrenceDate:checkValid:", v7, v5, 0));

  if (!v8)
  {
    v9 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not fetch event with rowID [%{public}@] and start date: [%{public}@].", (uint8_t *)&v13, 0x16u);

    }
  }

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  NSIndexPath *indexPathForRowWithContextMenu;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSIndexPath *v13;
  uint64_t v14;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v7 = 0;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:withSender:](CUIKPasteboardUtilities, "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0&& "paste:" != a3)
  {
    if ("copy:" == a3)
    {
      indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
      if (indexPathForRowWithContextMenu)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", indexPathForRowWithContextMenu, self->_itemCache));
        v10 = (void *)v9;
        if (v9)
        {
          v18 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
          v12 = 1;
LABEL_12:
          v7 = +[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", v12, v11);

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
        v16.receiver = self;
        v16.super_class = (Class)InboxRepliedSectionViewController;
        v7 = -[InboxRepliedSectionViewController canPerformAction:withSender:](&v16, "canPerformAction:withSender:", a3, v6);
        goto LABEL_16;
      }
      v13 = self->_indexPathForRowWithContextMenu;
      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", v13, self->_itemCache));
        v10 = (void *)v14;
        if (v14)
        {
          v17 = v14;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
          v12 = 0;
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
  NSIndexPath *indexPathForRowWithContextMenu;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
  if (indexPathForRowWithContextMenu)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", indexPathForRowWithContextMenu, self->_itemCache));
    if (v5)
    {
      v8 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
      objc_msgSend(v6, "cutEvents:delegate:", v7, self);

      v5 = v8;
    }

  }
}

- (void)copy:(id)a3
{
  NSIndexPath *indexPathForRowWithContextMenu;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
  if (indexPathForRowWithContextMenu)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController _eventForIndexPath:cache:](self, "_eventForIndexPath:cache:", indexPathForRowWithContextMenu, self->_itemCache));
    if (v5)
    {
      v8 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
      objc_msgSend(v6, "copyEvents:delegate:", v7, self);

      v5 = v8;
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

- (unint64_t)destination
{
  return self->_destination;
}

- (InboxRepliedSectionViewControllerDelegate)inboxRepliedSectionDelegate
{
  return (InboxRepliedSectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_inboxRepliedSectionDelegate);
}

- (void)setInboxRepliedSectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inboxRepliedSectionDelegate, a3);
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inboxRepliedSectionDelegate);
  objc_storeStrong((id *)&self->_focusBannerCell, 0);
  objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, 0);
  objc_storeStrong((id *)&self->_selectionTimer, 0);
  objc_storeStrong((id *)&self->_currentSelectedEvent, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_prefetchQ, 0);
  objc_storeStrong((id *)&self->_organizerNamesQ, 0);
  objc_storeStrong((id *)&self->_notificationQ, 0);
  objc_storeStrong((id *)&self->_organizerNames, 0);
  objc_storeStrong((id *)&self->_pendingComments, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_occurrenceInfos, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
