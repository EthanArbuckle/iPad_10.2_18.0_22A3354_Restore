@implementation RootNavigationController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RootNavigationController;
  -[RootNavigationController viewDidLoad](&v4, "viewDidLoad");
  v3 = objc_autoreleasePoolPush();
  -[RootNavigationController _restoreLastUsedCalendarViewType](self, "_restoreLastUsedCalendarViewType");
  objc_autoreleasePoolPop(v3);
}

- (unint64_t)numberOfNotifications
{
  void *v3;

  if (!self->_hasLoadedInitialNotificationCount)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    self->_numberOfNotifications = (unint64_t)objc_msgSend(v3, "eventNotificationsForCurrentIdentityCount");

    self->_hasLoadedInitialNotificationCount = 1;
  }
  return self->_numberOfNotifications;
}

- (void)_setUpInitialUserActivityUpdate
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (self->_userActivityNeedsUpdate)
  {
    v3 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009C0C4;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_selectTodayForMainViewControllerContainer:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "shouldPushNextLevelViewControllerWhenTodayIsVisible"))
    objc_msgSend(v6, "showTodayAnimated:", v4);
  else
    -[RootNavigationController _showNowForMainViewControllerContainer:animated:](self, "_showNowForMainViewControllerContainer:animated:", v6, v4);

}

- (void)updateNavigationBarButtonItemsWithViewController:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *currentDateLabel;
  UIBarButtonItem *labelBarItem;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  NSAttributedString *currentDateLabelString;
  NSAttributedString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v4 = a3;
  if ((objc_msgSend(v4, "allowsOverriddenRightNavigationBarItems") & 1) != 0)
  {
    -[RootNavigationController _addButtonsToNavigationBarForViewController:](self, "_addButtonsToNavigationBarForViewController:", v4);
    -[RootNavigationController _updateAddEventButtonEnabledness](self, "_updateAddEventButtonEnabledness");
    if ((id)-[RootNavigationController activeWidthSizeClass](self, "activeWidthSizeClass") == (id)2)
    {
      -[RootNavigationController _createLeftFixedSpaceBarItemIfNeeded](self, "_createLeftFixedSpaceBarItemIfNeeded");
      if (!self->_currentDateLabel)
      {
        v5 = (UILabel *)objc_alloc_init((Class)UILabel);
        currentDateLabel = self->_currentDateLabel;
        self->_currentDateLabel = v5;

      }
      labelBarItem = self->_labelBarItem;
      if (!labelBarItem)
      {
        v8 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_currentDateLabel);
        v9 = self->_labelBarItem;
        self->_labelBarItem = v8;

        labelBarItem = self->_labelBarItem;
      }
      v17[0] = self->_leftFixedSpaceBarItem;
      v17[1] = labelBarItem;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
      objc_msgSend(v11, "setLeftBarButtonItems:", v10);

    }
    currentDateLabelString = self->_currentDateLabelString;
    self->_currentDateLabelString = 0;
    v13 = currentDateLabelString;

    -[RootNavigationController _setCurrentDateLabelString:](self, "_setCurrentDateLabelString:", v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
    objc_msgSend(v14, "setHidesBackButton:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
    objc_msgSend(v15, "setLeftBarButtonItems:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
    objc_msgSend(v16, "setRightBarButtonItems:", 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RootNavigationController;
  v4 = -[RootNavigationController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (EKUIShouldSaveStateInPreferences(v4))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000081A4;
    block[3] = &unk_1001B2538;
    block[4] = self;
    if (qword_1001F6258 != -1)
      dispatch_once(&qword_1001F6258, block);
  }
  -[RootNavigationController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  -[RootNavigationController controllerAppearedTipsConfiguration](self, "controllerAppearedTipsConfiguration");
}

- (BOOL)_updateCalendarButtonSpinner
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v4 = (uint64_t)objc_msgSend(v3, "accountsInInitialSyncCount") < 1;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_calendarsButton, "configuration"));
  v6 = objc_msgSend(v5, "showsActivityIndicator");

  if (((v4 ^ v6) & 1) == 0)
    -[RootNavigationController _updateCalendarsButtonConfiguration](self, "_updateCalendarsButtonConfiguration");
  return v4 ^ v6 ^ 1;
}

- (void)_meContactChangedNoticationReceived:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003330;
  v3[3] = &unk_1001B3F90;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateAddEventButtonEnabledness
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004338;
  v5[3] = &unk_1001B2E60;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

- (void)_updateInboxBarButtonItem
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "_inboxTitleForNotificationCount:", -[RootNavigationController numberOfNotifications](self, "numberOfNotifications"));
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController inboxBarButtonItem](self, "inboxBarButtonItem"));
  objc_msgSend(v4, "setTitle:", v5);

}

- (void)updateToolbarItemsWithViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class(MainViewControllerContainer);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    if (objc_msgSend(v4, "allowsOverriddenToolbarItems"))
    {
      -[RootNavigationController addToolbarButtonItemsWithViewController:](self, "addToolbarButtonItemsWithViewController:", v4);
      goto LABEL_13;
    }
  }
  else
  {
    if ((-[RootNavigationController isToolbarHidden](self, "isToolbarHidden") & 1) != 0)
      goto LABEL_13;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolbarItems"));
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count"))
    {

      goto LABEL_13;
    }
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Hiding toolbar due to there being no toolbar items for view controller: [%@]", (uint8_t *)&v9, 0xCu);
    }

  }
  if ((-[RootNavigationController isToolbarHidden](self, "isToolbarHidden") & 1) == 0)
  {
    -[RootNavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", 1, 1);
    -[RootNavigationController setShowingOverriddenToolbarItems:](self, "setShowingOverriddenToolbarItems:", 0);
  }
LABEL_13:

}

- (void)_notificationCountChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RootNavigationController *v9;

  if (qword_1001F6278 != -1)
    dispatch_once(&qword_1001F6278, &stru_1001B45F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v5 = qword_1001F6270;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CB30;
  v7[3] = &unk_1001B26A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  v4 = objc_opt_class(UISearchController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v9 = objc_msgSend(v8, "interfaceOrientation");

    return 1 << v9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController visibleViewController](self, "visibleViewController"));
    v12 = v11;
    if (v11)
    {
      v10 = (unint64_t)objc_msgSend(v11, "supportedInterfaceOrientations");
    }
    else if ((id)-[RootNavigationController activeWidthSizeClass](self, "activeWidthSizeClass") == (id)1)
    {
      v10 = 26;
    }
    else
    {
      v10 = 30;
    }

  }
  return v10;
}

- (void)updateDeviceOrientationForJumpToTodayTip
{
  void *v2;
  _BOOL8 v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  v3 = (char *)objc_msgSend(v2, "interfaceOrientation") - 1 < (char *)2;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
  objc_msgSend(v4, "donateIsPortraitOrientation:", v3);

}

- (void)_showNowForMainViewControllerContainer:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController _now](self, "_now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  objc_msgSend(v7, "setSelectedDate:", v8);

  objc_msgSend(v6, "selectDate:animated:", v8, v4);
}

- (void)_forceInboxButtonCreationIfNeeded
{
  void *v3;
  id v4;
  ToolbarBarButtonItem *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController inboxBarButtonItem](self, "inboxBarButtonItem"));

  if (v3)
  {
    -[RootNavigationController _updateInboxBarButtonItem](self, "_updateInboxBarButtonItem");
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "_inboxTitleForNotificationCount:", -[RootNavigationController numberOfNotifications](self, "numberOfNotifications"));
    v7 = (id)objc_claimAutoreleasedReturnValue(v4);
    v5 = -[ToolbarBarButtonItem initWithTitle:target:action:]([ToolbarBarButtonItem alloc], "initWithTitle:target:action:", v7, self, "inboxPressed");
    -[RootNavigationController setInboxBarButtonItem:](self, "setInboxBarButtonItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController inboxBarButtonItem](self, "inboxBarButtonItem"));
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("inbox-button"));

  }
}

- (id)_compactMonthDividedListSwitchBarButtonItem
{
  UIBarButtonItem *v3;
  UIBarButtonItem **p_dividedMonthToggleBarButtonItem;
  UIBarButtonItem *dividedMonthToggleBarButtonItem;
  void *v6;
  UIBarButtonItem *v7;
  id v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  void *v14;

  if ((_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
    || _os_feature_enabled_impl("Calendar", "resizeable_month"))
  {
    v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:menu:", 0, 0);
    p_dividedMonthToggleBarButtonItem = &self->_dividedMonthToggleBarButtonItem;
    dividedMonthToggleBarButtonItem = self->_dividedMonthToggleBarButtonItem;
    self->_dividedMonthToggleBarButtonItem = v3;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](self->_dividedMonthToggleBarButtonItem, "_setAdditionalSelectionInsets:", 2.0, 0.0, 2.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController compactMonthMenu](self, "compactMonthMenu"));
    -[UIBarButtonItem setMenu:](*p_dividedMonthToggleBarButtonItem, "setMenu:", v6);

  }
  else
  {
    p_dividedMonthToggleBarButtonItem = &self->_dividedMonthToggleBarButtonItem;
    v7 = self->_dividedMonthToggleBarButtonItem;
    if (v7)
      goto LABEL_5;
    v9 = objc_alloc((Class)UIBarButtonItem);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("list.bullet.below.rectangle")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageFlippedForRightToLeftLayoutDirection"));
    v12 = (UIBarButtonItem *)objc_msgSend(v9, "initWithImage:style:target:action:", v11, 0, self, "_dividedListViewTogglePressed");
    v13 = *p_dividedMonthToggleBarButtonItem;
    *p_dividedMonthToggleBarButtonItem = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    -[UIBarButtonItem setSelected:](*p_dividedMonthToggleBarButtonItem, "setSelected:", objc_msgSend(v14, "showMonthAsDivided"));

    -[UIBarButtonItem _setAdditionalSelectionInsets:](*p_dividedMonthToggleBarButtonItem, "_setAdditionalSelectionInsets:", 2.0, 0.0, 2.0, 0.0);
  }
  v7 = *p_dividedMonthToggleBarButtonItem;
LABEL_5:
  -[UIBarButtonItem setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("toggle-month-view"));
  return *p_dividedMonthToggleBarButtonItem;
}

- (id)_listViewSwitchBarButtonItem
{
  int64_t v3;
  void *v4;
  id v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *listToggleBarButtonItem;
  id v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;

  v3 = -[RootNavigationController currentDayViewMode](self, "currentDayViewMode");
  if (!self->_listToggleBarButtonItem || self->_lastListToggleBarButtonDayViewMode != v3)
  {
    self->_lastListToggleBarButtonDayViewMode = v3;
    if ((_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
      || _os_feature_enabled_impl("MobileCal", "two_day_view"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController generateCurrentListToggleBarButtonItemMenu](self, "generateCurrentListToggleBarButtonItemMenu"));
      v5 = objc_alloc((Class)UIBarButtonItem);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController imageForCurrentDayViewMode](self, "imageForCurrentDayViewMode"));
      v7 = (UIBarButtonItem *)objc_msgSend(v5, "initWithImage:menu:", v6, v4);
      listToggleBarButtonItem = self->_listToggleBarButtonItem;
      self->_listToggleBarButtonItem = v7;

    }
    else
    {
      v9 = objc_alloc((Class)UIBarButtonItem);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("list.bullet")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageFlippedForRightToLeftLayoutDirection"));
      v12 = (UIBarButtonItem *)objc_msgSend(v9, "initWithImage:style:target:action:", v11, 0, self, "listTogglePressed");
      v13 = self->_listToggleBarButtonItem;
      self->_listToggleBarButtonItem = v12;

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      -[UIBarButtonItem setSelected:](self->_listToggleBarButtonItem, "setSelected:", objc_msgSend(v4, "showDayAsList"));
    }

  }
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_listToggleBarButtonItem, "setAccessibilityIdentifier:", CFSTR("toggle-day-list-view"));
  return self->_listToggleBarButtonItem;
}

- (void)_saveUserActivityInfo:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = -[RootNavigationController currentViewType](self, "currentViewType");
  if (v4 > 4)
    v5 = 0;
  else
    v5 = qword_1001A16D8[v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
  v7 = -[RootNavigationController shouldDonateTomorrowActivity](self, "shouldDonateTomorrowActivity");
  if (v6)
  {
    v8 = objc_msgSend(objc_alloc((Class)CUIKUserActivityCalendarEvent), "initWithEvent:view:", v6, v5);
    if (v8)
LABEL_6:
      objc_msgSend(v8, "updateActivity:", v14);
  }
  else
  {
    if (v7)
      v9 = (objc_class *)CUIKUserActivityTomorrow;
    else
      v9 = (objc_class *)CUIKUserActivityCalendarDate;
    v10 = [v9 alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
    v8 = objc_msgSend(v10, "initWithDate:view:calendar:", v12, v5, v13);

    if (v8)
      goto LABEL_6;
  }

}

- (void)_restoreLastUsedCalendarViewType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _DWORD v13[2];

  if ((EKUIShouldSaveStateInPreferences(self) & 1) != 0
    || -[RootNavigationController _isThisTheOnlyConnectedScene](self, "_isThisTheOnlyConnectedScene"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastViewMode"));
    v5 = (uint64_t)objc_msgSend(v4, "integerValue");

    switch(v5)
    {
      case -1:
      case 3:
        goto LABEL_4;
      case 2:
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        objc_msgSend(v8, "setShowDayAsList:", 0);

        v9 = +[MultiDayWeekView numMultiDays](MultiDayWeekView, "numMultiDays");
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        objc_msgSend(v7, "setNumDaysToShow:", v9);
        v5 = 2;
        goto LABEL_7;
      case 4:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        objc_msgSend(v7, "setShowDayAsList:", 1);
        v5 = 4;
        goto LABEL_7;
      default:
        break;
    }
  }
  else
  {
LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    objc_msgSend(v6, "setShowDayAsList:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    objc_msgSend(v7, "setNumDaysToShow:", 1);
    v5 = 3;
LABEL_7:

  }
  v10 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109120;
    v13[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Root Navigation Controller restoring last view type: %d", (uint8_t *)v13, 8u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
  v12 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", v5, v11);

}

- (void)_updateAfterExtendedLaunch:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  RootNavigationController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012DEC;
  v5[3] = &unk_1001B26A0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (id)_ensureStackBaseCalendarViewControllerContainerIsPresent
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v3 = -[RootNavigationController classForStackBaseContainerForCurrentTraits](self, "classForStackBaseContainerForCurrentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_7;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v10 = objc_msgSend((id)objc_opt_class(v9), "isEqual:", v3);

  if ((v10 & 1) == 0)
  {
LABEL_7:
    v12 = [v3 alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    v11 = objc_msgSend(v12, "initWithModel:window:", v13, v14);

    v17 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    -[RootNavigationController setViewControllers:](self, "setViewControllers:", v15);

    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (id)_now
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "calendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeZone"));

  v5 = objc_alloc((Class)EKCalendarDate);
  v6 = CUIKNowComponents();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "initWithDateComponents:timeZone:", v7, v4);

  return v8;
}

- (BOOL)_updateCalendarButtonError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int showingAccountErrors;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceForSelectedIdentity"));
  if ((uint64_t)objc_msgSend(v3, "displayableAccountErrorsForSource:", v5) < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v7 = objc_msgSend(v6, "accountsInInitialSyncCount") == 0;

  }
  showingAccountErrors = self->_showingAccountErrors;
  if (showingAccountErrors != v7)
  {
    -[RootNavigationController _updateCalendarsButtonConfiguration](self, "_updateCalendarsButtonConfiguration");
    self->_showingAccountErrors = v7;
  }
  return showingAccountErrors != v7;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RootNavigationController;
  -[RootNavigationController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v3);

}

- (void)controllerAppearedTipsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
  objc_msgSend(v3, "configureTipsCenter");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController todayBarButtonItem](self, "todayBarButtonItem"));
  objc_msgSend(v4, "addObserversForController:todayButton:", v5, v6);

  -[RootNavigationController updateDeviceOrientationForJumpToTodayTip](self, "updateDeviceOrientationForJumpToTodayTip");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[RootNavigationController _updateInteractivePopAllowed](self, "_updateInteractivePopAllowed");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  -[RootNavigationController _updatePaletteStateWithViewController:](self, "_updatePaletteStateWithViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy();

  -[RootNavigationController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  -[RootNavigationController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v7);

}

+ (id)_inboxTitleForNotificationCount:(unint64_t)a3
{
  id v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSBundle *v12;

  if (a3)
  {
    v5 = objc_alloc((Class)NSString);
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Inbox (%@)"), &stru_1001B67C0, 0));
    v9 = CUIKLocalizedStringForInteger(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v5, "initWithFormat:", v8, v10);

  }
  else
  {
    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Inbox"), &stru_1001B67C0, 0));
  }

  return v11;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _UINavigationBarPalette *v9;
  _UINavigationBarPalette *palette;
  PaletteView *v11;
  PaletteView *paletteView;
  objc_super v13;
  CGRect v14;

  v3 = objc_autoreleasePoolPush();
  v13.receiver = self;
  v13.super_class = (Class)RootNavigationController;
  -[RootNavigationController loadView](&v13, "loadView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = objc_alloc((Class)UIView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v8 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v14), 50.0);

  v9 = (_UINavigationBarPalette *)objc_msgSend(objc_alloc((Class)_UINavigationBarPalette), "initWithContentView:", v8);
  palette = self->_palette;
  self->_palette = v9;

  v11 = -[PaletteView initWithBarPalette:]([PaletteView alloc], "initWithBarPalette:", self->_palette);
  paletteView = self->_paletteView;
  self->_paletteView = v11;

  -[PaletteView setAutoresizingMask:](self->_paletteView, "setAutoresizingMask:", 2);
  -[_UINavigationBarPalette addSubview:](self->_palette, "addSubview:", self->_paletteView);

  objc_autoreleasePoolPop(v3);
}

- (void)_updateUserActivity
{
  NSUserActivity *v3;
  _BOOL4 userActivityNeedsUpdate;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  unsigned int v11;
  int *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CLLocationCoordinate2D v35;

  if ((+[EKFeatureSet isContinuitySupported](EKFeatureSet, "isContinuitySupported") & 1) != 0
    || +[EKFeatureSet areContextualRemindersSupported](EKFeatureSet, "areContextualRemindersSupported"))
  {
    v3 = (NSUserActivity *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    if (-[NSUserActivity applicationState](v3, "applicationState"))
    {
LABEL_4:

      goto LABEL_5;
    }
    userActivityNeedsUpdate = self->_userActivityNeedsUpdate;

    if (userActivityNeedsUpdate)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v6 = objc_msgSend(v5, "disableContinuity");

      if ((v6 & 1) == 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));

        v8 = -[RootNavigationController shouldDonateTomorrowActivity](self, "shouldDonateTomorrowActivity");
        if (v7)
        {
          v9 = 144;
          v3 = self->_userActivityForEvent;
          if (v3)
          {
LABEL_18:
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
              v16 = objc_alloc((Class)CSSearchableItemAttributeSet);
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity activityType](v3, "activityType"));
              v18 = objc_msgSend(v16, "initWithItemContentType:", v17);

              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
              objc_msgSend(v18, "setContentDescription:", v19);

              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "structuredLocation"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              objc_msgSend(v18, "setNamedLocation:", v21);

              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geoLocation"));
              v23 = v22;
              if (v22)
              {
                objc_msgSend(v22, "coordinate");
                if (CLLocationCoordinate2DIsValid(v35))
                {
                  objc_msgSend(v23, "coordinate");
                  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                  objc_msgSend(v18, "setLatitude:", v24);

                  objc_msgSend(v23, "coordinate");
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
                  objc_msgSend(v18, "setLongitude:", v26);

                  objc_msgSend(v18, "setSupportsNavigation:", &__kCFBooleanTrue);
                }
              }
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "virtualConference"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstPhoneNumber"));
              v29 = v28;
              if (v28)
                v30 = v28;
              else
                v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "conferenceURLForDisplay"));
              v31 = v30;

              if (objc_msgSend(v31, "cal_hasSchemeTel"))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));
                v34 = v32;
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
                objc_msgSend(v18, "setPhoneNumbers:", v33);

                objc_msgSend(v18, "setSupportsPhoneCall:", &__kCFBooleanTrue);
              }
              objc_msgSend(v18, "setSupportsNavigation:", &__kCFBooleanTrue);
              -[NSUserActivity setContentAttributeSet:](v3, "setContentAttributeSet:", v18);

            }
            -[NSUserActivity becomeCurrent](v3, "becomeCurrent");
            -[NSUserActivity setNeedsSave:](v3, "setNeedsSave:", 1);
            goto LABEL_4;
          }
          v10 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.calendar.continuity.event_selection"));
        }
        else
        {
          v11 = v8;
          v12 = &OBJC_IVAR___RootNavigationController__userActivityForDateInView;
          if (v8)
            v12 = &OBJC_IVAR___RootNavigationController__tomorrowUA;
          v3 = (NSUserActivity *)*(id *)((char *)&self->super.super.super.super.isa + *v12);
          if (v3)
            goto LABEL_18;
          v10 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.calendar.continuity.date_selection"));
          if (v11)
            v9 = 152;
          else
            v9 = 136;
        }
        v3 = (NSUserActivity *)v10;
        v13 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
        *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)v3;

        -[NSUserActivity setDelegate:](v3, "setDelegate:", self);
        goto LABEL_18;
      }
    }
  }
LABEL_5:
  self->_userActivityNeedsUpdate = 0;
}

- (BOOL)shouldDonateTomorrowActivity
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->_model, "selectedDay"));
  v3 = CUIKTodayComponents();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "timeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v4, v5));

  LOBYTE(v5) = objc_msgSend(v2, "differenceInDays:", v6) == (id)1;
  return (char)v5;
}

- (id)pushCalendarViewControllerWithViewType:(int64_t)a3 andDate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int IsCompactInViewHierarchy;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  if (objc_msgSend(v7, "horizontalSizeClass") == (id)1 && objc_msgSend(v7, "verticalSizeClass") == (id)1)
    a3 = 2;
  -[CUIKCalendarModel setSelectedDate:](self->_model, "setSelectedDate:", v6);
  v8 = -[RootNavigationController _ensureStackBaseCalendarViewControllerContainerIsPresent](self, "_ensureStackBaseCalendarViewControllerContainerIsPresent");
  if (a3 == -1)
  {
    v17 = 0;
  }
  else
  {
    v9 = -[RootNavigationController _classRepresentingViewType:isWidthCompact:](self, "_classRepresentingViewType:isWidthCompact:", a3, objc_msgSend(v7, "horizontalSizeClass") == (id)1);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
LABEL_7:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
        if ((objc_opt_isKindOfClass(v15, v9) & 1) != 0)
        {
          v16 = objc_opt_class(MainViewControllerContainer);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            break;
        }
        if (v12 == (id)++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v12)
            goto LABEL_7;
          goto LABEL_14;
        }
      }
      v17 = v15;
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

      if (!v17)
        goto LABEL_19;
      if (v18 == v17)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentChildViewController"));
        objc_msgSend(v35, "selectDate:animated:", v6, 0);

      }
      else
      {
        v19 = -[RootNavigationController popToViewController:animated:](self, "popToViewController:animated:", v17, 0);
      }
    }
    else
    {
LABEL_14:

LABEL_19:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

      v17 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
      objc_msgSend(v22, "beginAppearanceTransition:animated:", 0, 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
      objc_msgSend(v23, "endAppearanceTransition");

      v24 = -[RootNavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0);
      if (v17)
      {
        v25 = v17;
        while (1)
        {
          v26 = v25;
          v25 = v17;

          v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pushedNextLevelMainViewControllerContainerAnimated:", 0));
          if ((objc_opt_isKindOfClass(v17, v9) & 1) != 0)
            break;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
          IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v27, v28);

          if (IsCompactInViewHierarchy)
          {
            v30 = objc_opt_class(MainViewControllerContainer);
            if ((objc_opt_isKindOfClass(v17, v30) & 1) != 0)
            {
              v31 = v17;
              if (objc_msgSend(v31, "allowsOverriddenRightNavigationBarItems"))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "navigationItem"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "rightBarButtonItems"));

                if (!v33)
                  -[RootNavigationController _addButtonsToNavigationBarForViewController:](self, "_addButtonsToNavigationBarForViewController:", v31);
              }

            }
          }
          if (!v17)
            goto LABEL_31;
        }
      }
      else
      {
        v25 = 0;
LABEL_31:
        v25 = v25;
        v17 = v25;
      }

    }
  }

  return v17;
}

- (void)_initializeCalendarsButton
{
  UIButton *v3;
  UIButton *calendarsButton;
  double v5;
  UIView *v6;
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
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD block[5];

  if (qword_1001F6268 != -1)
    dispatch_once(&qword_1001F6268, &stru_1001B4000);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  calendarsButton = self->_calendarsButton;
  self->_calendarsButton = v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006FA4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_1001F6260, block);
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000A7D4;
  v22[3] = &unk_1001B4050;
  objc_copyWeak(&v23, &location);
  -[UIButton setConfigurationUpdateHandler:](self->_calendarsButton, "setConfigurationUpdateHandler:", v22);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_calendarsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1144733696;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_calendarsButton, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  -[UIButton addTarget:action:forControlEvents:](self->_calendarsButton, "addTarget:action:forControlEvents:", self, "calendarsPressed", 64);
  -[RootNavigationController _updateCalendarsButtonMenuProvider](self, "_updateCalendarsButtonMenuProvider");
  v6 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setIsAccessibilityElement:](v6, "setIsAccessibilityElement:", 1);
  -[UIView setAccessibilityTraits:](v6, "setAccessibilityTraits:", UIAccessibilityTraitButton);
  -[UIButton setIsAccessibilityElement:](self->_calendarsButton, "setIsAccessibilityElement:", 0);
  -[UIButton setAccessibilityElementsHidden:](self->_calendarsButton, "setAccessibilityElementsHidden:", 1);
  -[UIView addSubview:](v6, "addSubview:", self->_calendarsButton);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_calendarsButton, "widthAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v6, "widthAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_calendarsButton, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v6, "heightAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->_calendarsButton, "centerXAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v6, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_calendarsButton, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v6, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

  -[RootNavigationController _updateFilterLabel](self, "_updateFilterLabel");
  v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsButtonTitle](self, "calendarsButtonTitle"));
  objc_msgSend(v19, "setTitle:", v20);

  -[RootNavigationController setCalendarsBarButtonItem:](self, "setCalendarsBarButtonItem:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsBarButtonItem](self, "calendarsBarButtonItem"));
  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("calendars-button"));

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (RootNavigationController)initWithModel:(id)a3 targetWindow:(id)a4
{
  id v7;
  id v8;
  RootNavigationController *v9;
  RootNavigationController *v10;
  id *p_model;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  objc_super v28;
  _QWORD v29[2];

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)RootNavigationController;
  v9 = -[RootNavigationController init](&v28, "init");
  v10 = v9;
  if (v9)
  {
    p_model = (id *)&v9->_model;
    objc_storeStrong((id *)&v9->_model, a3);
    -[RootNavigationController setDelegate:](v10, "setDelegate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_notificationCountChanged:", CUIKCalendarModelNotificationCountsChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_calendarErrorCountChanged:", CUIKCalendarModelAccountErrorCountChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_accountsInInitialSyncCountChanged", CUIKCalendarModelAccountsInInitialSyncCountChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_calendarsChanged:", CUIKCalendarModelCalendarsChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_focusModeConfigurationChanged:", CUIKCalendarModelFocusModeConfigurationChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_localeChanged:", CUIKLocaleChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_timeZoneChanged:", CUIKCalendarModelTimeZoneChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_selectedDateChanged:", CUIKCalendarModelSelectedDateChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_filterChanged:", CUIKCalendarModelFilterChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_identityChanged:", CUIKCalendarModelIdentityChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_delegatesChanged:", CUIKCalendarModelDelegatesChangedNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_updateAfterExtendedLaunch:", CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification, *p_model);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_updateAfterExtendedLaunch:", CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_meContactChangedNoticationReceived:", CalMeCardChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, "_monthWeekScaleChanged:", CUIKPreferencesNotification_MonthWeekScale, 0);
    v10->_userActivityNeedsUpdate = 1;
    v13 = +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
    v10->_regularBackgroundedViewType = -1;
    v10->_compactBackgroundedViewType = -1;
    objc_storeWeak((id *)&v10->_window, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "undoManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "undoableEditor"));

    v16 = objc_alloc((Class)CUIKIPendingReminderTracker);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "eventStore"));
    v18 = objc_msgSend(v16, "initWithEventStore:", v17);

    objc_msgSend(v7, "setPendingReminderTracker:", v18);
    v19 = objc_alloc((Class)CUIKIReminderEditor);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "eventStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "undoManager"));
    v22 = objc_msgSend(v19, "initWithEventStore:undoManager:alertDisplayer:pendingReminderTracker:", v20, v21, v10, v18);

    v23 = objc_alloc((Class)CUIKCompositeEditor);
    v29[0] = v15;
    v29[1] = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    v25 = objc_msgSend(v23, "initWithEditors:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "undoManager"));
    objc_msgSend(v26, "setUndoableEditor:", v25);

  }
  return v10;
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)addToolbarButtonItemsWithViewController:(id)a3
{
  id v4;
  void *v5;
  ToolbarBarButtonItem *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  ToolbarBarButtonItem *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v4 = a3;
  -[RootNavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController todayBarButtonItem](self, "todayBarButtonItem"));

  if (!v5)
  {
    v6 = [ToolbarBarButtonItem alloc];
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Today"), &stru_1001B67C0, 0));
    v10 = -[ToolbarBarButtonItem initWithTitle:target:action:](v6, "initWithTitle:target:action:", v9, self, "todayPressed");

    -[RootNavigationController setTodayBarButtonItem:](self, "setTodayBarButtonItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController todayBarButtonItem](self, "todayBarButtonItem"));
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("today-button"));

  }
  -[RootNavigationController _updateFilterLabel](self, "_updateFilterLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsBarButtonItem](self, "calendarsBarButtonItem"));

  if (v12)
    -[RootNavigationController _updateCalendarButtonAccessory](self, "_updateCalendarButtonAccessory");
  else
    -[RootNavigationController _initializeCalendarsButton](self, "_initializeCalendarsButton");
  -[RootNavigationController _forceInboxButtonCreationIfNeeded](self, "_forceInboxButtonCreationIfNeeded");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolbarItems"));

  if (!v13)
  {
    v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController todayBarButtonItem](self, "todayBarButtonItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsBarButtonItem](self, "calendarsBarButtonItem", v16, v14));
    v20[2] = v17;
    v20[3] = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController inboxBarButtonItem](self, "inboxBarButtonItem"));
    v20[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 5));

    objc_msgSend(v4, "setToolbarItems:animated:", v19, 0);
    -[RootNavigationController _updateCalendarsButtonConfiguration](self, "_updateCalendarsButtonConfiguration");

  }
  -[RootNavigationController setShowingOverriddenToolbarItems:](self, "setShowingOverriddenToolbarItems:", 1);

}

- (UIBarButtonItem)todayBarButtonItem
{
  return self->_todayBarButtonItem;
}

- (UIBarButtonItem)calendarsBarButtonItem
{
  return self->_calendarsBarButtonItem;
}

- (void)_updateCalendarsButtonConfiguration
{
  void *v3;
  void *v4;
  id v5;

  -[UIButton setNeedsUpdateConfiguration](self->_calendarsButton, "setNeedsUpdateConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIButton superview](self->_calendarsButton, "superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_calendarsButton, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
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
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[5];
  id v64;
  _BYTE v65[128];

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(MainViewControllerContainer);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);
  if ((isKindOfClass & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v56 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController transitionCoordinator](self, "transitionCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy();

  -[RootNavigationController _updatePaletteStateWithViewController:](self, "_updatePaletteStateWithViewController:", v8);
  if (v12)
  {
    if (objc_msgSend(v12, "initiallyInteractive"))
    {
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_1000A1118;
      v63[3] = &unk_1001B2BE8;
      v63[4] = self;
      v14 = &v64;
      v64 = v8;
      objc_msgSend(v12, "notifyWhenInteractionChangesUsingBlock:", v63);
    }
    else
    {
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1000A1184;
      v61[3] = &unk_1001B2BE8;
      v61[4] = self;
      v14 = &v62;
      v62 = v8;
      objc_msgSend(v12, "animateAlongsideTransition:completion:", 0, v61);
    }

  }
  v55 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v15);

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "disappearingViewController"));
  v17 = objc_opt_class(CNContactViewController);
  v18 = objc_opt_isKindOfClass(v16, v17);
  if ((v18 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
    v20 = objc_msgSend(v19, "containsObject:", v16);

    if ((v20 & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      objc_msgSend(v21, "setSelectedOccurrence:", 0);

    }
  }
  v54 = (void *)v16;
  v22 = v56;
  if ((isKindOfClass & 1) != 0)
  {
    if (EKUIShouldSaveStateInPreferences(v18))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RootNavigationController currentViewType](self, "currentViewType")));
      objc_msgSend(v23, "setLastViewMode:", v24);

    }
    if (-[RootNavigationController currentViewType](self, "currentViewType"))
    {
      v25 = -[RootNavigationController currentViewType](self, "currentViewType");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "persistedSceneState"));
      objc_msgSend(v27, "setLastUsedNonYearView:", v25);

    }
    -[RootNavigationController updateNavigationBarButtonItemsWithViewController:](self, "updateNavigationBarButtonItemsWithViewController:", v8);
    if ((objc_opt_respondsToSelector(v8, "navigationBarTintColor") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBarTintColor"));
      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController navigationBar](self, "navigationBar"));
        objc_msgSend(v29, "setBarTintColor:", v28);

      }
    }
    if ((objc_opt_respondsToSelector(v8, "toolBarTintColor") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toolBarTintColor"));
      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController toolbar](self, "toolbar"));
        objc_msgSend(v31, "setBarTintColor:", v30);

      }
    }
    if ((objc_opt_respondsToSelector(v8, "navigationBarTintColor") & 1) == 0
      || (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBarTintColor"))) == 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController navigationBar](self, "navigationBar"));
      objc_msgSend(v33, "setBarTintColor:", 0);

      v32 = 0;
    }

  }
  -[RootNavigationController updateToolbarItemsWithViewController:](self, "updateToolbarItemsWithViewController:", v8);
  v34 = v55;
  if ((id)-[RootNavigationController activeWidthSizeClass](self, "activeWidthSizeClass") == (id)2)
  {
    if ((isKindOfClass & 1) != 0)
      -[RootNavigationController _configureViewSwitcherShowingViewController:](self, "_configureViewSwitcherShowingViewController:", v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
    objc_msgSend(v35, "bounds");
    -[RootNavigationController _updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:](self, "_updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:", v56, v36, v37);

    if ((objc_opt_respondsToSelector(v8, "updateNavigationBarDisplayedDateString") & 1) != 0)
    {
      objc_msgSend(v56, "updateNavigationBarDisplayedDateString");
    }
    else
    {
      v52 = objc_alloc_init((Class)NSAttributedString);
      -[RootNavigationController _setCurrentDateLabelString:](self, "_setCurrentDateLabelString:", v52);

    }
  }
  else if ((objc_opt_respondsToSelector(v8, "useCustomBackButton") & 1) == 0
         || (objc_msgSend(v8, "useCustomBackButton") & 1) == 0)
  {
    v38 = objc_opt_class(CNContactViewController);
    if ((objc_opt_isKindOfClass(v8, v38) & 1) == 0)
    {
      v53 = v7;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
            v45 = objc_opt_class(MainViewControllerContainer);
            if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "navigationItem"));
              objc_msgSend(v46, "setTitleView:", 0);

              v47 = objc_msgSend(v44, "hidesBackButton");
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "navigationItem"));
              objc_msgSend(v48, "setHidesBackButton:", v47);

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "navigationItem"));
              objc_msgSend(v49, "setLeftBarButtonItems:", 0);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        }
        while (v41);
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "selectedDate"));
      -[RootNavigationController updateBackButtonToDate:](self, "updateBackButtonToDate:", v51);

      v7 = v53;
      v34 = v55;
      v22 = v56;
    }
  }
  -[RootNavigationController _setNeedsUserActivityUpdate](self, "_setNeedsUserActivityUpdate");
  -[RootNavigationController updateShouldDisplayJumpToTodayTip](self, "updateShouldDisplayJumpToTodayTip");

}

- (int64_t)currentViewType
{
  void *v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  if (!v2)
    goto LABEL_14;
  v3 = objc_opt_class(YearViewContainerViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    v5 = objc_opt_class(MonthViewContainerViewController);
    if ((objc_opt_isKindOfClass(v2, v5) & 1) != 0)
    {
      v4 = 1;
      goto LABEL_15;
    }
    v6 = objc_opt_class(WeekViewContainerViewController);
    if ((objc_opt_isKindOfClass(v2, v6) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_15;
    }
    v7 = objc_opt_class(DayViewContainerViewController);
    if ((objc_opt_isKindOfClass(v2, v7) & 1) != 0)
    {
      v4 = 3;
      goto LABEL_15;
    }
    v8 = objc_opt_class(ListViewContainerViewController);
    if ((objc_opt_isKindOfClass(v2, v8) & 1) != 0)
    {
      v4 = 4;
      goto LABEL_15;
    }
    v9 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "While trying to save last used view mode, the top view controller was not a recognized mode in set {Year, Month, Week, Day}.", v11, 2u);
    }
LABEL_14:
    v4 = -1;
    goto LABEL_15;
  }
  v4 = 0;
LABEL_15:

  return v4;
}

- (void)_updatePaletteStateWithViewController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UINavigationBarPalette *palette;
  void *v14;
  void *v15;
  _UINavigationBarPalette *v16;
  id v17;

  v17 = a3;
  -[RootNavigationController updateCurrentIdentity](self, "updateCurrentIdentity");
  if ((objc_opt_respondsToSelector(v17, "updatePalette:") & 1) != 0)
  {
    v4 = v17;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PaletteView setBackgroundColor:](self->_paletteView, "setBackgroundColor:", v5);

    -[PaletteView setOpaqueBackground:](self->_paletteView, "setOpaqueBackground:", 0);
    objc_msgSend(v4, "updatePalette:", self->_paletteView);
    if (-[PaletteView hasContent](self->_paletteView, "hasContent"))
    {
      -[PaletteView sizeToFit](self->_paletteView, "sizeToFit");
      -[_UINavigationBarPalette frame](self->_palette, "frame");
      v7 = v6;
      -[_UINavigationBarPalette frame](self->_palette, "frame");
      v9 = v8;
      -[PaletteView frame](self->_paletteView, "frame");
      v11 = v10;
      -[PaletteView frame](self->_paletteView, "frame");
      -[_UINavigationBarPalette setFrame:](self->_palette, "setFrame:", v7, v9, v11);
      -[PaletteView frame](self->_paletteView, "frame");
      -[_UINavigationBarPalette setPreferredHeight:](self->_palette, "setPreferredHeight:", v12);
      -[_UINavigationBarPalette setNeedsLayout](self->_palette, "setNeedsLayout");
      palette = self->_palette;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
      v15 = v14;
      v16 = palette;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
      v15 = v14;
      v16 = 0;
    }
    objc_msgSend(v14, "_setBottomPalette:", v16);

  }
  else
  {
    -[PaletteView removeAllContent](self->_paletteView, "removeAllContent");
    -[PaletteView layoutIfNeeded](self->_paletteView, "layoutIfNeeded");
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navigationItem"));
    objc_msgSend(v4, "_setBottomPalette:", 0);
  }

}

- (void)updateCurrentIdentity
{
  void *v3;
  void *v4;

  -[RootNavigationController _updateCalendarsButtonTitle](self, "_updateCalendarsButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _contactForCurrentIdentity](self, "_contactForCurrentIdentity"));
  if (v3)
  {
    v4 = v3;
    -[PaletteView setAvatarContact:](self->_paletteView, "setAvatarContact:", v3);
    v3 = v4;
  }

}

- (void)_updateCalendarsButtonTitle
{
  void *v3;
  UIButton *calendarsButton;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsButtonTitle](self, "calendarsButtonTitle"));
  calendarsButton = self->_calendarsButton;
  if (calendarsButton)
  {
    v7 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleForState:](calendarsButton, "titleForState:", 0));
    v6 = objc_msgSend(v5, "isEqualToString:", v7);

    v3 = v7;
    if ((v6 & 1) == 0)
    {
      -[RootNavigationController _updateCalendarsButtonConfiguration](self, "_updateCalendarsButtonConfiguration");
      v3 = v7;
    }
  }

}

- (id)_contactForCurrentIdentity
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  if (-[CUIKCalendarModel containsDelegateSources](self->_model, "containsDelegateSources"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
    v4 = v3;
    if (v3)
    {
      v5 = contactForSource(v3);
      v6 = objc_claimAutoreleasedReturnValue(v5);
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(-[RootNavigationController _meContact](self, "_meContact"));
    }
    v7 = (void *)v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_calendarsButtonConfiguration
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;

  v3 = -[RootNavigationController _calendarsButtonHasBackground](self, "_calendarsButtonHasBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v5 = (uint64_t)objc_msgSend(v4, "accountsInInitialSyncCount");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceForSelectedIdentity"));
  v10 = (uint64_t)objc_msgSend(v6, "displayableAccountErrorsForSource:", v8) > 0 && v5 < 1;

  if ((v3 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
    v12 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v14 = CalendarAppTintColor(v11, v13);
    v12 = objc_claimAutoreleasedReturnValue(v14);
  }
  v15 = (void *)v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  objc_msgSend(v11, "setTitleLineBreakMode:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v16, NSFontAttributeName, v15, NSForegroundColorAttributeName, 0));
  if (UIAccessibilityButtonShapesEnabled())
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
    objc_msgSend(v17, "setObject:forKey:", v18, NSUnderlineStyleAttributeName);

  }
  v19 = objc_alloc((Class)NSAttributedString);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsButtonTitle](self, "calendarsButtonTitle"));
  v21 = objc_msgSend(v19, "initWithString:attributes:", v20, v17);
  objc_msgSend(v11, "setAttributedTitle:", v21);

  objc_msgSend(v11, "setTitleAlignment:", 2);
  if (v5 >= 1)
  {
    objc_msgSend(v11, "setShowsActivityIndicator:", 1);
    objc_msgSend(v11, "setImagePadding:", 8.0);
  }
  if (v10)
  {
    objc_msgSend(v16, "pointSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 0, 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v22));
    objc_msgSend(v11, "setImage:", v23);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10009C250;
    v28[3] = &unk_1001B3FE0;
    v29 = v15;
    objc_msgSend(v11, "setImageColorTransformer:", v28);

  }
  if ((v3 & 1) != 0)
    v24 = 0;
  else
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "background"));
  objc_msgSend(v25, "setBackgroundColor:", v24);

  if ((v3 & 1) == 0)
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "background"));
  objc_msgSend(v26, "setCornerRadius:", 5.0);

  objc_msgSend(v11, "contentInsets");
  objc_msgSend(v11, "setContentInsets:");

  return v11;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (id)calendarsButtonTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  }
  else
  {
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Calendars"), &stru_1001B67C0, 0));
  }
  v7 = (void *)v5;

  if (self->_showingAccountErrors)
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" "), "stringByAppendingString:", v7));
  else
    v8 = v7;
  v9 = v8;

  return v9;
}

- (BOOL)_calendarsButtonHasBackground
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
  v3 = v2 != 0;

  return v3;
}

- (void)selectTodayWithTrigger:(int64_t)a3 animated:(BOOL)a4
{
  void *v5;
  CUIKCalendarModel *model;
  NSObject *v7;
  void *v8;
  _BOOL8 v9;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;

  if (a3 == 2)
  {
    v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      model = self->_model;
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](model, "selectedDate"));
      *(_DWORD *)buf = 136315394;
      v15 = "-[RootNavigationController selectTodayWithTrigger:animated:]";
      v16 = 2112;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: WithinTimeout trigger specified with model date [%@]; will not select today",
        buf,
        0x16u);

    }
  }
  else
  {
    v9 = a4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      if (a3 == 1)
      {
        objc_msgSend(v11, "setShouldRespondToApplicationDidBecomeActiveStateChange:", 1);
        -[RootNavigationController _selectTodayForMainViewControllerContainer:animated:](self, "_selectTodayForMainViewControllerContainer:animated:", v13, v9);
        objc_msgSend(v13, "setShouldRespondToApplicationDidBecomeActiveStateChange:", 0);
      }
      else
      {
        -[RootNavigationController _selectTodayForMainViewControllerContainer:animated:](self, "_selectTodayForMainViewControllerContainer:animated:", v11, v9);
      }
      v12 = v13;
    }

  }
}

- (void)_addButtonsToNavigationBarForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController addEventBarButtonItem](self, "addEventBarButtonItem"));
  v18[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController searchBarButtonItem](self, "searchBarButtonItem"));
  v18[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

  if ((id)-[RootNavigationController activeWidthSizeClass](self, "activeWidthSizeClass") == (id)1)
  {
    v8 = objc_opt_class(MainViewControllerContainer);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    {
      v9 = objc_msgSend(v4, "supportedToggleMode");
      if (v9 == 2)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[RootNavigationController _compactMonthDividedListSwitchBarButtonItem](self, "_compactMonthDividedListSwitchBarButtonItem"));
      }
      else
      {
        if (v9 != 1)
          goto LABEL_9;
        v10 = objc_claimAutoreleasedReturnValue(-[RootNavigationController _listViewSwitchBarButtonItem](self, "_listViewSwitchBarButtonItem"));
      }
      v11 = (void *)v10;
      if (v10)
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v10));

        v7 = (void *)v12;
      }
    }
  }
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightBarButtonItems"));
  v15 = objc_msgSend(v14, "isEqual:", v7);

  if ((v15 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
    objc_msgSend(v16, "setRightBarButtonItems:animated:", &__NSArray0__struct, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
    objc_msgSend(v17, "setRightBarButtonItems:animated:", v7, 0);

  }
}

- (UIBarButtonItem)searchBarButtonItem
{
  UIBarButtonItem *searchBarButtonItem;
  UIBarButtonItem *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIBarButtonItem *v8;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_searchBarButtonItem, "setAccessibilityIdentifier:", CFSTR("searchbar-button"));
  searchBarButtonItem = self->_searchBarButtonItem;
  if (!searchBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 12, self, "_searchPressed");
    v6 = CalendarAppTintColor(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UIBarButtonItem setTintColor:](v4, "setTintColor:", v7);

    v8 = self->_searchBarButtonItem;
    self->_searchBarButtonItem = v4;

    searchBarButtonItem = self->_searchBarButtonItem;
  }
  return searchBarButtonItem;
}

- (UIBarButtonItem)addEventBarButtonItem
{
  UIBarButtonItem *addEventBarButtonItem;
  UIBarButtonItem *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIBarButtonItem *v8;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_addEventBarButtonItem, "setAccessibilityIdentifier:", CFSTR("addevent-button"));
  addEventBarButtonItem = self->_addEventBarButtonItem;
  if (!addEventBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "addEventPressed");
    v6 = CalendarAppTintColor(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UIBarButtonItem setTintColor:](v4, "setTintColor:", v7);

    v8 = self->_addEventBarButtonItem;
    self->_addEventBarButtonItem = v4;

    addEventBarButtonItem = self->_addEventBarButtonItem;
  }
  return addEventBarButtonItem;
}

- (void)_updateInteractivePopAllowed
{
  void *v3;
  uint64_t v4;
  int IsCompactInViewHierarchy;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v3, v4);

  if (IsCompactInViewHierarchy)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
    v6 = objc_opt_class(MainViewControllerContainer);
    isKindOfClass = objc_opt_isKindOfClass(v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer"));
    objc_msgSend(v8, "setEnabled:", (isKindOfClass & 1) == 0);

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer"));
    objc_msgSend(v9, "setEnabled:", 0);
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 extendedLaunchOver;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  if ((objc_msgSend(v4, "currentChildViewControllerIsLoaded") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));

    if (v4 == v5)
      objc_msgSend(v4, "setupForViewAppearance");
  }
  -[RootNavigationController _updateViewSwitcherSegmentWidthsAfterWindowSizeChange](self, "_updateViewSwitcherSegmentWidthsAfterWindowSizeChange");
  -[RootNavigationController _updateNavbarStringForNewStateAfterWindowSizeChange](self, "_updateNavbarStringForNewStateAfterWindowSizeChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  if (v4 == v6)
  {
    extendedLaunchOver = self->_extendedLaunchOver;

    if (extendedLaunchOver)
    {
      -[RootNavigationController updateNavigationBarButtonItemsWithViewController:](self, "updateNavigationBarButtonItemsWithViewController:", v4);
      -[RootNavigationController updateToolbarItemsWithViewController:](self, "updateToolbarItemsWithViewController:", v4);
    }
  }
  else
  {

  }
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  -[RootNavigationController viewWillLayoutSubviews](&v8, "viewWillLayoutSubviews");

}

- (void)_updateViewSwitcherSegmentWidthsAfterWindowSizeChange
{
  uint64_t v3;
  id v4;

  if ((id)-[RootNavigationController activeWidthSizeClass](self, "activeWidthSizeClass") == (id)2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self, "viewSwitcher"));
    v3 = objc_opt_class(UISegmentedControl);
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    {
      -[RootNavigationController _setSegmentWidthsForViewSwitcher:](self, "_setSegmentWidthsForViewSwitcher:", v4);
      -[RootNavigationController _updateDateLabelFrame](self, "_updateDateLabelFrame");
    }

  }
}

- (void)_updateNavbarStringForNewStateAfterWindowSizeChange
{
  id v3;

  if ((id)-[RootNavigationController activeWidthSizeClass](self, "activeWidthSizeClass") == (id)2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    if ((objc_opt_respondsToSelector(v3, "updateNavigationBarDisplayedDateString") & 1) != 0)
      objc_msgSend(v3, "updateNavigationBarDisplayedDateString");

  }
}

- (int64_t)activeWidthSizeClass
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return (int64_t)v3;
}

- (void)updateBackButtonToDate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v4, "horizontalSizeClass") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
    v6 = objc_opt_class(UISearchController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController childViewControllers](self, "childViewControllers"));
  v9 = objc_msgSend(v8, "count");

  if ((unint64_t)v9 >= 2)
  {
    v10 = 1;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController childViewControllers](self, "childViewControllers"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v10));
      -[RootNavigationController _updateBackButtonToDate:container:](self, "_updateBackButtonToDate:container:", v15, v12);

      ++v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController childViewControllers](self, "childViewControllers"));
      v14 = objc_msgSend(v13, "count");

    }
    while (v10 < (unint64_t)v14);
  }
LABEL_8:

}

- (void)_updateBackButtonToDate:(id)a3 container:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v7);

  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _higherScopeCompactCalendarViewControllerRelativeTo:](self, "_higherScopeCompactCalendarViewControllerRelativeTo:", v8));
  if ((objc_opt_respondsToSelector(v8, "shouldUpdateOwnBackButtonWhenTopViewController") & 1) != 0
    && (objc_opt_respondsToSelector(v8, "updateBackButtonWhileTopViewControllerToDate:") & 1) != 0
    && objc_msgSend(v8, "shouldUpdateOwnBackButtonWhenTopViewController"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updateBackButtonWhileTopViewControllerToDate:", v14));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navigationItem"));
      objc_msgSend(v12, "setBackButtonTitle:", v10);

    }
    if ((objc_opt_respondsToSelector(v9, "invalidateBackButtonDate") & 1) != 0)
      objc_msgSend(v9, "invalidateBackButtonDate");
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector(v9, "updateBackButtonToDate:") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentViewController"));
    objc_msgSend(v10, "updateBackButtonToDate:", v14);
LABEL_10:

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v13);

}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (id)_higherScopeCompactCalendarViewControllerRelativeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
  v6 = (uint64_t)objc_msgSend(v5, "indexOfObject:", v4);

  v7 = 0;
  if (!v4 || v6 == 0x7FFFFFFFFFFFFFFFLL || v6 < 1)
    goto LABEL_12;
  v8 = 0;
  v9 = v6 + 1;
  while (1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v9 - 2));

    v12 = objc_opt_class(MainViewControllerContainer);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      break;
LABEL_8:

    if ((unint64_t)--v9 < 2)
    {
      v7 = 0;
      goto LABEL_11;
    }
  }
  v13 = v11;

  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "childViewControllerForCompactWidthRegularHeight"));
  if (!v14)
  {
    v8 = v13;
    goto LABEL_8;
  }
  v7 = (void *)v14;

  v8 = v13;
LABEL_11:

LABEL_12:
  return v7;
}

- (id)topMainViewControllerContainer
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reverseObjectEnumerator"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
      v9 = objc_opt_class(MainViewControllerContainer);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v8;

    if (v10)
      return v10;
  }
  else
  {
LABEL_9:

  }
  v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (void *)objc_opt_class(MainViewControllerContainer);
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    v14 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "The top view controller does not conform to the [%@] class", buf, 0xCu);

  }
  v10 = 0;
  return v10;
}

- (id)ekui_futureTraitCollection
{
  id AssociatedObject;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, -[RootNavigationController ekui_futureTraitCollectionCategoryPropertyKey](self, "ekui_futureTraitCollectionCategoryPropertyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  return v4;
}

- (id)traitCollection
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RootNavigationController;
  v3 = -[RootNavigationController traitCollection](&v9, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (EKUIOverriddenTraitsBasedOnWindowGeometryIsEnforced())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009BDE8;
    v8[3] = &unk_1001B3F68;
    v8[4] = self;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollectionByModifyingTraits:", v8));
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)updateSelectedDateForJumpToTodayTip
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_extendedLaunchOver)
  {
    v3 = CUIKTodayDate(self, a2);
    v15 = (id)objc_claimAutoreleasedReturnValue(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -5, v15, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
    v10 = objc_msgSend(v6, "isBeforeDayForDate:inCalendar:", v8, v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 5, v15, 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
    LODWORD(v11) = objc_msgSend(v6, "isAfterDayForDate:inCalendar:", v12, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
    objc_msgSend(v14, "donateIsSelectedDateFiveDaysAwayFromToday:", v10 | v11);

  }
}

- (void)_selectedDateChanged:(id)a3
{
  -[RootNavigationController _setNeedsUserActivityUpdate](self, "_setNeedsUserActivityUpdate", a3);
  -[RootNavigationController updateSelectedDateForJumpToTodayTip](self, "updateSelectedDateForJumpToTodayTip");
}

- (void)_setNeedsUserActivityUpdate
{
  _QWORD block[5];

  if (!self->_userActivityNeedsUpdate)
  {
    self->_userActivityNeedsUpdate = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CB28;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)willEnterForeground
{
  self->_compactBackgroundedViewType = -1;
  self->_regularBackgroundedViewType = -1;
}

- (void)userActivityWillSave:(id)a3
{
  -[RootNavigationController _saveUserActivityInfo:](self, "_saveUserActivityInfo:", a3);
}

- (void)updateShouldDisplayJumpToTodayTip
{
  int64_t v3;
  int64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (self->_extendedLaunchOver)
  {
    v3 = -[RootNavigationController currentViewType](self, "currentViewType");
    v4 = -[RootNavigationController currentViewType](self, "currentViewType");
    if (v3 == 3
      || v4 == 4
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection")),
          v6 = objc_msgSend(v5, "horizontalSizeClass"),
          v5,
          v6 == (id)1))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
      objc_msgSend(v7, "updatePresentedControllerTo:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
      v11 = v9;
      v10 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
      v11 = v9;
      v10 = 0;
    }
    objc_msgSend(v9, "donateShouldDisplayTip:", v10);

  }
}

- (BOOL)showingOverriddenToolbarItems
{
  return self->_showingOverriddenToolbarItems;
}

- (void)setViewSwitcherLayoutHandler:(id)a3
{
  objc_storeWeak((id *)&self->_viewSwitcherLayoutHandler, a3);
}

- (void)setTodayBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_todayBarButtonItem, a3);
}

- (void)setShowingOverriddenToolbarItems:(BOOL)a3
{
  self->_showingOverriddenToolbarItems = a3;
}

- (void)setNumberOfNotifications:(unint64_t)a3
{
  self->_numberOfNotifications = a3;
}

- (void)setInboxBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_inboxBarButtonItem, a3);
}

- (void)setCalendarsBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_calendarsBarButtonItem, a3);
}

- (void)setAvatarViewVisible:(BOOL)a3
{
  -[PaletteView setAvatarViewVisible:](self->_paletteView, "setAvatarViewVisible:", a3);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  -[RootNavigationController _updateInteractivePopAllowed](self, "_updateInteractivePopAllowed", a3, a4, a5);
  -[RootNavigationController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (UIBarButtonItem)inboxBarButtonItem
{
  return self->_inboxBarButtonItem;
}

- (BOOL)extendedLaunchFinished
{
  return self->_extendedLaunchOver;
}

- (void)didBecomeActive
{
  -[RootNavigationController _setUpInitialUserActivityUpdate](self, "_setUpInitialUserActivityUpdate");
}

- (Class)classForStackBaseContainerForCurrentTraits
{
  return (Class)objc_opt_class(YearViewContainerViewController);
}

- (void)_updateCalendarsButtonMenuProvider
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[CUIKCalendarModel containsDelegateSources](self->_model, "containsDelegateSources"))
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10009C218;
    v3[3] = &unk_1001B3FB8;
    objc_copyWeak(&v4, &location);
    -[UIButton _setMenuProvider:](self->_calendarsButton, "_setMenuProvider:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    -[UIButton _setMenuProvider:](self->_calendarsButton, "_setMenuProvider:", 0);
  }
}

- (void)_updateCalendarButtonAccessory
{
  if (self->_extendedLaunchOver)
  {
    if (self->_calendarsButton)
    {
      -[RootNavigationController _updateCalendarButtonSpinner](self, "_updateCalendarButtonSpinner");
      -[RootNavigationController _updateCalendarButtonError](self, "_updateCalendarButtonError");
    }
  }
}

- (void)dealloc
{
  void *v3;
  NSUserActivity *userActivityForDateInView;
  NSUserActivity *v5;
  NSUserActivity *userActivityForEvent;
  NSUserActivity *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelNotificationCountsChangedNotification, self->_model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelCalendarsChangedNotification, self->_model);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKLocaleChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelTimeZoneChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelSelectedDateChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelSelectedOccurrencesChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CalMeCardChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKPreferencesNotification_MonthWeekScale, 0);
  userActivityForDateInView = self->_userActivityForDateInView;
  if (userActivityForDateInView)
  {
    -[NSUserActivity setDelegate:](userActivityForDateInView, "setDelegate:", 0);
    -[NSUserActivity invalidate](self->_userActivityForDateInView, "invalidate");
    v5 = self->_userActivityForDateInView;
    self->_userActivityForDateInView = 0;

  }
  userActivityForEvent = self->_userActivityForEvent;
  if (userActivityForEvent)
  {
    -[NSUserActivity setDelegate:](userActivityForEvent, "setDelegate:", 0);
    -[NSUserActivity invalidate](self->_userActivityForEvent, "invalidate");
    v7 = self->_userActivityForEvent;
    self->_userActivityForEvent = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  -[RootNavigationController dealloc](&v8, "dealloc");
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  *(float *)&v5 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  objc_msgSend(v4, "setDayViewHourScale:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  *(float *)&v8 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
  objc_msgSend(v7, "setWeekViewHourScale:", v9);

  -[RootNavigationController _updateViewSwitcherFont](self, "_updateViewSwitcherFont");
}

- (void)_focusModeConfigurationChanged:(id)a3
{
  -[RootNavigationController _updateFilterLabelAnimate:](self, "_updateFilterLabelAnimate:", 1);
}

- (void)_identityChanged:(id)a3
{
  -[RootNavigationController updateCurrentIdentity](self, "updateCurrentIdentity", a3);
  -[RootNavigationController _updateCalendarButtonAccessory](self, "_updateCalendarButtonAccessory");
  -[RootNavigationController _updateAddEventButtonEnabledness](self, "_updateAddEventButtonEnabledness");
  -[RootNavigationController _notificationCountChanged:](self, "_notificationCountChanged:", 0);
}

- (void)_delegatesChanged:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates", a3, 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), "sourceIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceIdentifier"));
        v12 = objc_msgSend(v9, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {

          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](self->_model, "updateSourceForSelectedIdentity:selectedCalendars:", 0, 0);
LABEL_11:
  -[RootNavigationController updateCurrentIdentity](self, "updateCurrentIdentity");
  -[RootNavigationController _updateAddEventButtonEnabledness](self, "_updateAddEventButtonEnabledness");
  -[RootNavigationController _updateCalendarsButtonMenuProvider](self, "_updateCalendarsButtonMenuProvider");
}

- (void)_createLeftFixedSpaceBarItemIfNeeded
{
  UIBarButtonItem *v3;
  UIBarButtonItem *leftFixedSpaceBarItem;

  if (!self->_leftFixedSpaceBarItem)
  {
    v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    leftFixedSpaceBarItem = self->_leftFixedSpaceBarItem;
    self->_leftFixedSpaceBarItem = v3;

  }
}

- (id)_meContact
{
  CNContact *cachedMeContact;
  void *v4;
  void *v5;
  void *v6;
  CNContact *v7;
  CNContact *v8;

  cachedMeContact = self->_cachedMeContact;
  if (!cachedMeContact)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unifiedMeContact"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[ContactsUtils defaultContactKeysToFetch](ContactsUtils, "defaultContactKeysToFetch"));
      v7 = (CNContact *)objc_claimAutoreleasedReturnValue(+[ContactsUtils contactForContact:keysToFetch:](ContactsUtils, "contactForContact:keysToFetch:", v5, v6));

    }
    else
    {
      v7 = (CNContact *)objc_alloc_init((Class)CNContact);
    }
    v8 = self->_cachedMeContact;
    self->_cachedMeContact = v7;

    cachedMeContact = self->_cachedMeContact;
  }
  return cachedMeContact;
}

- (void)_updateFilterLabelAnimate:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController calendarsBarButtonItem](self, "calendarsBarButtonItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customView"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009C320;
    v6[3] = &unk_1001B2538;
    v6[4] = self;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v5, 5242884, v6, 0, 0.2);

  }
  else
  {
    -[RootNavigationController _updateFilterLabel](self, "_updateFilterLabel");
  }
}

- (void)updateListToggleBarButtonItem
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController generateCurrentListToggleBarButtonItemMenu](self, "generateCurrentListToggleBarButtonItemMenu"));
  -[UIBarButtonItem setMenu:](self->_listToggleBarButtonItem, "setMenu:", v3);

}

- (id)generateCurrentListToggleBarButtonItemMenu
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[3];

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Single Day"), &stru_1001B67C0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController imageForDayViewMode:](self, "imageForDayViewMode:", 0));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10009C75C;
  v35[3] = &unk_1001B4078;
  v35[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v7, CFSTR("singleDayAction"), v35));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  if (objc_msgSend(v9, "showDayAsList"))
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v11 = (uint64_t)objc_msgSend(v10, "numDaysToShow");

    if (v11 < 2)
    {
      v12 = 1;
      goto LABEL_6;
    }
  }
  v12 = 0;
LABEL_6:
  objc_msgSend(v8, "setState:", v12);
  *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v14, v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Multi Day"), &stru_1001B67C0, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController imageForDayViewMode:](self, "imageForDayViewMode:", 1));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10009C768;
  v34[3] = &unk_1001B4078;
  v34[4] = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v16, v17, CFSTR("multiDayAction"), v34));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  if (objc_msgSend(v19, "showDayAsList"))
  {

LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v21 = objc_msgSend(v20, "numDaysToShow");

  if (v21 != (id)2)
    goto LABEL_10;
  v22 = 1;
LABEL_11:
  objc_msgSend(v18, "setState:", v22);
  *(_QWORD *)&v23 = objc_opt_class(self).n128_u64[0];
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v24, v23));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("List"), &stru_1001B67C0, 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController imageForDayViewMode:](self, "imageForDayViewMode:", 2));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10009C774;
  v33[3] = &unk_1001B4078;
  v33[4] = self;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v26, v27, CFSTR("listAction"), v33));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  LODWORD(v25) = objc_msgSend(v29, "showDayAsList");

  objc_msgSend(v28, "setState:", v25);
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("single-day"));
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("multi-day"));
  objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("list-view"));
  v36[0] = v8;
  v36[1] = v18;
  v36[2] = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 3));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1001B67C0, 0, 0, 1, v30));

  return v31;
}

- (void)updateCompactMonthMenu
{
  void *v3;
  unsigned int v4;
  void *v5;
  int *v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v4 = objc_msgSend(v3, "showMonthAsDivided");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("list.bullet.below.rectangle")));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageFlippedForRightToLeftLayoutDirection"));

    v6 = &OBJC_IVAR___RootNavigationController__listAction;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v8 = objc_msgSend(v7, "monthViewScaleSize");

    if (v8 == (id)2)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthViewStacked")));
      v6 = &OBJC_IVAR___RootNavigationController__compactScaleAction;
    }
    else if (v8 == (id)1)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthViewCompact")));
      v6 = &OBJC_IVAR___RootNavigationController__minimalScaleAction;
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthViewDetails")));
      v6 = &OBJC_IVAR___RootNavigationController__largeScaleAction;
    }
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v6), "setState:", 1);
  -[UIBarButtonItem setImage:](self->_dividedMonthToggleBarButtonItem, "setImage:", v9);

}

- (id)compactMonthMenu
{
  _QWORD *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  UIAction *v12;
  UIAction *minimalScaleAction;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  UIAction *v22;
  UIAction *compactScaleAction;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  UIAction *v32;
  UIAction *largeScaleAction;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  UIAction *v41;
  UIAction *listAction;
  UIAction *v43;
  void *v44;
  void *v45;
  UIAction *v46;
  void *v47;
  UIMenu *v48;
  UIMenu *compactMonthMenu;
  UIMenu *v50;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[5];
  id v61;
  id location;
  _QWORD v63[2];
  _QWORD v64[3];

  objc_initWeak(&location, self);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10009CF08;
  v60[3] = &unk_1001B40A0;
  objc_copyWeak(&v61, &location);
  v60[4] = self;
  v3 = objc_retainBlock(v60);
  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v5, v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Compact"), &stru_1001B67C0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthViewCompact")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_flatImageWithColor:", v9));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10009D09C;
  v58[3] = &unk_1001B40C8;
  v11 = v3;
  v59 = v11;
  v12 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v10, 0, v58));
  minimalScaleAction = self->_minimalScaleAction;
  self->_minimalScaleAction = v12;

  *(_QWORD *)&v14 = objc_opt_class(self).n128_u64[0];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v15, v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Stacked"), &stru_1001B67C0, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthViewStacked")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_flatImageWithColor:", v19));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10009D0B0;
  v56[3] = &unk_1001B40C8;
  v21 = v11;
  v57 = v21;
  v22 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v17, v20, 0, v56));
  compactScaleAction = self->_compactScaleAction;
  self->_compactScaleAction = v22;

  *(_QWORD *)&v24 = objc_opt_class(self).n128_u64[0];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v25, v24));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Details"), &stru_1001B67C0, 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthViewDetails")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_flatImageWithColor:", v29));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10009D0C4;
  v54[3] = &unk_1001B40C8;
  v31 = v21;
  v55 = v31;
  v32 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v27, v30, 0, v54));
  largeScaleAction = self->_largeScaleAction;
  self->_largeScaleAction = v32;

  *(_QWORD *)&v34 = objc_opt_class(self).n128_u64[0];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v35, v34));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("List"), &stru_1001B67C0, 0));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("list.bullet.below.rectangle")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageFlippedForRightToLeftLayoutDirection"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10009D118;
  v52[3] = &unk_1001B40C8;
  v40 = v31;
  v53 = v40;
  v41 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v37, v39, 0, v52));
  listAction = self->_listAction;
  self->_listAction = v41;

  -[UIAction setAccessibilityIdentifier:](self->_minimalScaleAction, "setAccessibilityIdentifier:", CFSTR("minimal-button"));
  -[UIAction setAccessibilityIdentifier:](self->_compactScaleAction, "setAccessibilityIdentifier:", CFSTR("summary-button"));
  -[UIAction setAccessibilityIdentifier:](self->_largeScaleAction, "setAccessibilityIdentifier:", CFSTR("large-button"));
  -[UIAction setAccessibilityIdentifier:](self->_listAction, "setAccessibilityIdentifier:", CFSTR("list-button"));
  v43 = self->_compactScaleAction;
  v64[0] = self->_minimalScaleAction;
  v64[1] = v43;
  v64[2] = self->_largeScaleAction;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 3));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1001B67C0, 0, 0, 1, v44));

  v46 = self->_listAction;
  v63[0] = v45;
  v63[1] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 2));
  v48 = (UIMenu *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1001B67C0, 0, 0, 33, v47));
  compactMonthMenu = self->_compactMonthMenu;
  self->_compactMonthMenu = v48;

  -[RootNavigationController updateCompactMonthMenu](self, "updateCompactMonthMenu");
  v50 = self->_compactMonthMenu;

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
  return v50;
}

- (void)_monthWeekScaleChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController compactMonthMenu](self, "compactMonthMenu", a3));
  -[UIBarButtonItem setMenu:](self->_dividedMonthToggleBarButtonItem, "setMenu:", v4);

}

- (BOOL)_isCurrentlyDraggingEvent
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  objc_opt_class(MainViewControllerContainer);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = v2;
    if (objc_msgSend(v4, "currentChildViewControllerIsLoaded"))
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentChildViewController"));
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector(v5, "currentlyEditingEventsWithGestures") & 1) != 0
    && objc_msgSend(v5, "currentlyEditingEventsWithGestures"))
  {
    v6 = kCalUILogHandle;
    v7 = 1;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Main view controller is currently editing events with gestures: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_searchPressed
{
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Search Button press"), &stru_1001B4108, 0);
}

- (void)openSearchLinkActionWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D3BC;
  v7[3] = &unk_1001B4130;
  v8 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009D3E8;
  v5[3] = &unk_1001B2E30;
  v6 = v8;
  v4 = v8;
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Search Button link action"), v7, v5);

}

- (void)addEventPressed
{
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Add Event Button press"), &stru_1001B4150, 0);
}

- (void)listTogglePressed
{
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("List Toggle Button press"), &stru_1001B4190, 0);
}

- (void)performUIAction:(id)a3 block:(id)a4 cancelBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  Class v13;
  NSString *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void ***v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    v31 = 2114;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[UserStateLog] Action -> %{public}@ %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10009D718;
  v24 = &unk_1001B41B8;
  objc_copyWeak(&v28, (id *)buf);
  v16 = v8;
  v25 = v16;
  v17 = v10;
  v26 = v17;
  v18 = v9;
  v27 = v18;
  v19 = objc_retainBlock(&v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager", v21, v22, v23, v24));
  objc_msgSend(v20, "dismissTipDueToUserNavigationWithCompletionBlock:", v19);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

- (void)toggleDayViewMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;

  switch(a3)
  {
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      objc_msgSend(v7, "setShowDayAsList:", 1);
LABEL_8:

      break;
    case 1:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      objc_msgSend(v9, "setShowDayAsList:", 0);

      v10 = +[MultiDayWeekView numMultiDays](MultiDayWeekView, "numMultiDays");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v7 = v6;
      v8 = v10;
      goto LABEL_7;
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      objc_msgSend(v5, "setShowDayAsList:", 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v7 = v6;
      v8 = 1;
LABEL_7:
      objc_msgSend(v6, "setNumDaysToShow:", v8);
      goto LABEL_8;
  }
  if ((_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
    || _os_feature_enabled_impl("MobileCal", "two_day_view"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController imageForCurrentDayViewMode](self, "imageForCurrentDayViewMode"));
    -[UIBarButtonItem setImage:](self->_listToggleBarButtonItem, "setImage:", v11);

  }
  else
  {
    -[UIBarButtonItem setSelected:](self->_listToggleBarButtonItem, "setSelected:", a3 == 2);
  }
  -[RootNavigationController updateDayViewModeContainer](self, "updateDayViewModeContainer");
  -[RootNavigationController updateListToggleBarButtonItem](self, "updateListToggleBarButtonItem");
}

- (id)imageForDayViewMode:(int64_t)a3
{
  const __CFString *v3;

  switch(a3)
  {
    case 2:
      v3 = CFSTR("list.dash");
      goto LABEL_6;
    case 1:
      self = (RootNavigationController *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("calendar.multiday.timeline.leading")));
      return self;
    case 0:
      v3 = CFSTR("calendar.day.timeline.leading");
LABEL_6:
      self = (RootNavigationController *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
      break;
  }
  return self;
}

- (id)imageForCurrentDayViewMode
{
  return -[RootNavigationController imageForDayViewMode:](self, "imageForDayViewMode:", -[RootNavigationController currentDayViewMode](self, "currentDayViewMode"));
}

- (int64_t)currentDayViewMode
{
  void *v3;
  unsigned __int8 v4;
  int64_t v5;
  _BOOL4 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v4 = objc_msgSend(v3, "showDayAsList");

  if ((v4 & 1) != 0)
    return 2;
  v6 = (_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
    || _os_feature_enabled_impl("MobileCal", "two_day_view");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v5 = (uint64_t)objc_msgSend(v7, "numDaysToShow") > 1 && v6;

  return v5;
}

- (void)updateDayViewModeContainer
{
  void *v3;
  uint64_t v4;
  char IsRegularInViewHierarchy;
  int64_t v6;
  __objc2_class *v7;
  ListViewContainerViewController *v8;
  void *v9;
  void *v10;
  ListViewContainerViewController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v3, v4);

  if ((IsRegularInViewHierarchy & 1) == 0)
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    if (!objc_msgSend(v20, "representsDayInViewHierarchy"))
    {
LABEL_13:

      return;
    }
    v6 = -[RootNavigationController currentDayViewMode](self, "currentDayViewMode");
    if (v6 == 2)
    {
      v8 = [ListViewContainerViewController alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      v11 = -[MainViewControllerContainer initWithModel:window:](v8, "initWithModel:window:", v9, v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewContainerViewController currentChildViewController](v11, "currentChildViewController"));
      objc_msgSend(v12, "setAllowExtendedHeightCells:", 1);
    }
    else
    {
      if (v6 == 1)
      {
        v7 = MultiDayWeekViewContainerViewController;
      }
      else
      {
        if (v6)
        {
          v11 = 0;
          goto LABEL_12;
        }
        v7 = DayViewContainerViewController;
      }
      v13 = [v7 alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      v11 = (ListViewContainerViewController *)objc_msgSend(v13, "initWithModel:window:", v12, v14);

    }
LABEL_12:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v16 = (char *)objc_msgSend(v15, "count");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 0, v16 - 1));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObject:", v11));
    -[RootNavigationController doCrossfadeAnimationWithNavigationViewContents](self, "doCrossfadeAnimationWithNavigationViewContents");
    -[RootNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v19, 0);

    goto LABEL_13;
  }
}

- (void)_dividedListViewTogglePressed
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentChildViewController"));
  objc_opt_class(CompactWidthMonthViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentChildViewController"));

    objc_msgSend(v8, "toggleDividedListView");
    -[RootNavigationController updateDividedMonthBarButtonItem](self, "updateDividedMonthBarButtonItem");

  }
}

- (void)updateDividedMonthBarButtonItem
{
  id v3;

  if ((_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
    || _os_feature_enabled_impl("Calendar", "resizeable_month"))
  {
    -[RootNavigationController updateCompactMonthMenu](self, "updateCompactMonthMenu");
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    -[UIBarButtonItem setSelected:](self->_dividedMonthToggleBarButtonItem, "setSelected:", objc_msgSend(v3, "showMonthAsDivided"));

  }
}

- (void)todayPressed
{
  void *v3;
  NSObject *v4;
  Class v5;
  NSString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[UserStateLog] Action -> %{public}@ today button tapped", (uint8_t *)&v9, 0xCu);

  }
  CalAnalyticsSendEvent(CFSTR("userTappedTodayButton"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager"));
  objc_msgSend(v8, "donateTodayButtonPressed");

  -[RootNavigationController selectTodayWithTrigger:animated:](self, "selectTodayWithTrigger:animated:", 0, 1);
}

- (void)calendarsPressed
{
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Calendars Button press"), &stru_1001B41D8, 0);
}

- (void)openCalendarsLinkActionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  if (objc_msgSend(v5, "horizontalSizeClass") == (id)1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009E084;
    v8[3] = &unk_1001B4130;
    v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009E094;
    v6[3] = &unk_1001B2E30;
    v7 = v9;
    -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Calendars Button Link Action"), v8, v6);

  }
}

- (void)inboxPressed
{
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Inbox Button press"), &stru_1001B41F8, 0);
}

- (void)openInboxLinkActionWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009E168;
  v5[3] = &unk_1001B4130;
  v6 = a3;
  v4 = v6;
  -[RootNavigationController performUIAction:block:cancelBlock:](self, "performUIAction:block:cancelBlock:", CFSTR("Calendars Button Link Action"), v5, v4);

}

- (BOOL)dismissPresentedViewController
{
  return -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 1, 0);
}

- (id)_presentedEditor
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  if (v2)
  {
    do
    {
      objc_opt_class(EKEventEditViewController);
      if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
        break;
      objc_opt_class(AddEventViewController);
      if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
        break;
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

      v2 = (void *)v5;
    }
    while (v5);
  }
  return v2;
}

- (BOOL)_dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  Class v13;
  NSString *v14;
  void *v15;
  _BOOL8 v16;
  _QWORD v18[5];
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  if (!v7)
  {
    v9 = 1;
    v16 = 1;
    if (!v6)
      goto LABEL_13;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _presentedEditor](self, "_presentedEditor"));
  v9 = v8 != 0;
  v10 = kCalUILogHandle;
  v11 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      v12 = v10;
      objc_opt_class(v8);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will not show calendar view because an editor [%@] is being presented.", buf, 0xCu);

    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Dismissing view controller: [%@]", buf, 0xCu);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10009E414;
    v18[3] = &unk_1001B32C0;
    v18[4] = self;
    v19 = v6;
    v20 = 1;
    -[RootNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v18);

  }
  v16 = v8 == 0;

  if (v6)
  {
LABEL_11:
    if (v9)
      (*((void (**)(id, _BOOL8))v6 + 2))(v6, v16);
  }
LABEL_13:

  return v16;
}

- (id)showInboxAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a3;
  if (-[RootNavigationController dismissPresentedViewController](self, "dismissPresentedViewController"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[RootNavigationController _popToViewControllerSatisfying:](self, "_popToViewControllerSatisfying:", &stru_1001B4238));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController showInboxAnimated:completion:](self, "showInboxAnimated:completion:", v3, 0));

      return v7;
    }
    v9 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "The current top view controller does not allow the invitations view to be displayed above it.", v10, 2u);
    }
  }
  return 0;
}

- (id)showInboxAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  InboxViewController *v8;
  void *v9;
  InboxViewController *v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  objc_msgSend(v7, "startNotificationMonitor");

  v8 = [InboxViewController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v10 = -[InboxViewController initWithModel:destination:](v8, "initWithModel:destination:", v9, 0);

  -[InboxViewController setDelegate:](v10, "setDelegate:", self);
  -[RootNavigationController _forceInboxButtonCreationIfNeeded](self, "_forceInboxButtonCreationIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController inboxBarButtonItem](self, "inboxBarButtonItem"));
  v12 = EKUIContainedControllerIdealWidth();
  v13 = EKUIContainedControllerIdealWidth();
  -[RootNavigationController _presentAdaptiveModalPopoverViewController:relativeToBarButtonItem:permittedArrowDirections:contentSize:animated:completion:](self, "_presentAdaptiveModalPopoverViewController:relativeToBarButtonItem:permittedArrowDirections:contentSize:animated:completion:", v10, v11, 2, v4, v6, v12, v13 * EKUIGoldenRatioPhi());

  return v10;
}

- (void)inboxViewControllerWantsShowEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v9, "showEvent:animated:showMode:context:", v8, v6, a5, 0);

}

- (void)showCalendarsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  _QWORD v6[4];
  RootNavigationController *v7;
  id v8;
  BOOL v9;

  v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009E794;
  v6[3] = &unk_1001B3430;
  v9 = a3;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](v7, "_dismissPresentedViewControllerAnimated:completion:", v4, v6);

}

- (void)_showCalendarsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  CalendarsViewController *v7;
  void *v8;
  CalendarsViewController *v9;
  CalendarsViewController *calendarsViewController;
  void *v11;
  CalendarsViewController *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = [CalendarsViewController alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v9 = -[CalendarsViewController initWithModel:destination:](v7, "initWithModel:destination:", v8, 0);
  calendarsViewController = self->_calendarsViewController;
  self->_calendarsViewController = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _doneBlock](self, "_doneBlock"));
  -[CalendarsViewController setDoneBlock:](self->_calendarsViewController, "setDoneBlock:", v11);

  v12 = self->_calendarsViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009E8A8;
  v14[3] = &unk_1001B2600;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  -[RootNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, v4, v14);

}

- (void)showCalendar:(id)a3
{
  -[CalendarsViewController showCalendar:enableDoneInitially:](self->_calendarsViewController, "showCalendar:enableDoneInitially:", a3, 0);
}

- (id)delegatesMenu
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  id *v31;
  id *v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  RootNavigationController *val;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id location[2];
  _BYTE v47[128];

  if ((-[CUIKCalendarModel containsDelegateSources](self->_model, "containsDelegateSources") & 1) != 0)
  {
    val = self;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedEnabledDelegates"));

    v36 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v34, "count") + 1);
    *(_QWORD *)&v4 = objc_opt_class(val).n128_u64[0];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v5, v4));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Switch delegate account…"), &stru_1001B67C0, 0));

    objc_initWeak(location, val);
    *(_QWORD *)&v7 = objc_opt_class(val).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v8, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("My Calendar"), &stru_1001B67C0, 0));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10009EDB0;
    v44[3] = &unk_1001B4260;
    v31 = &v45;
    objc_copyWeak(&v45, location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v44));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](val, "model"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceForSelectedIdentity"));
    v14 = v13 == 0;

    if (v14)
      objc_msgSend(v11, "setState:", 1, &v45);
    objc_msgSend(v36, "addObject:", v11, v31);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](val, "model"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedEnabledDelegates"));

    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v41;
      do
      {
        v18 = 0;
        v19 = v11;
        do
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v18);
          v21 = CUIKDisplayedTitleForSource(v20, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10009EE00;
          v38[3] = &unk_1001B4288;
          objc_copyWeak(&v39, location);
          v38[4] = v20;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v22, 0, 0, v38));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sourceIdentifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](val, "model"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sourceForSelectedIdentity"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sourceIdentifier"));
          v27 = objc_msgSend(v23, "isEqualToString:", v26);

          if (v27)
            objc_msgSend(v11, "setState:", 1);
          objc_msgSend(v36, "addObject:", v11);
          objc_destroyWeak(&v39);
          v18 = (char *)v18 + 1;
          v19 = v11;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v16);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v33, v36));
    objc_destroyWeak(v32);
    objc_destroyWeak(location);

  }
  else
  {
    v29 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "No delegates menu because there are no other identites available", (uint8_t *)location, 2u);
    }
    v28 = 0;
  }
  return v28;
}

- (void)showAddEventAnimated:(BOOL)a3
{
  -[RootNavigationController showAddEventAnimated:completion:](self, "showAddEventAnimated:completion:", a3, 0);
}

- (void)showAddEventAnimated:(BOOL)a3 fromBarButtonItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController bestDateForNewEvent](self, "bestDateForNewEvent"));
  LOBYTE(v7) = 0;
  -[RootNavigationController showAddEventAnimated:fromBarButtonItem:withTitle:startDate:exactStartDate:endDate:location:suggestionKey:allDay:completion:](self, "showAddEventAnimated:fromBarButtonItem:withTitle:startDate:exactStartDate:endDate:location:suggestionKey:allDay:completion:", v4, v6, 0, v8, 0, 0, 0, 0, v7, 0);

}

- (void)showAddEventAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController bestDateForNewEvent](self, "bestDateForNewEvent"));
  LOBYTE(v7) = 0;
  -[RootNavigationController showAddEventAnimated:fromBarButtonItem:withTitle:startDate:exactStartDate:endDate:location:suggestionKey:allDay:completion:](self, "showAddEventAnimated:fromBarButtonItem:withTitle:startDate:exactStartDate:endDate:location:suggestionKey:allDay:completion:", v4, 0, 0, v8, 0, 0, 0, 0, v7, v6);

}

- (void)showAddEventAnimated:(BOOL)a3 fromBarButtonItem:(id)a4 withTitle:(id)a5 startDate:(id)a6 exactStartDate:(id)a7 endDate:(id)a8 location:(id)a9 suggestionKey:(id)a10 allDay:(BOOL)a11 completion:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10009F0FC;
  v30[3] = &unk_1001B42D0;
  v30[4] = self;
  v31 = v17;
  v32 = v18;
  v33 = a8;
  v39 = a11;
  v34 = a9;
  v35 = v19;
  v36 = a10;
  v37 = v16;
  v40 = a3;
  v38 = a12;
  v20 = v38;
  v21 = v16;
  v22 = v36;
  v23 = v19;
  v24 = v34;
  v25 = v33;
  v26 = v18;
  v27 = v17;
  -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, v30);

}

- (void)showNewEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v5, "showEvent:animated:showMode:context:", v4, 1, 0, 0);

}

- (id)_doneBlock
{
  return -[RootNavigationController _doneBlockWithCompletion:](self, "_doneBlockWithCompletion:", 0);
}

- (id)_doneBlockWithCompletion:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009F410;
  v7[3] = &unk_1001B4320;
  v7[4] = self;
  v8 = a3;
  v3 = v8;
  v4 = objc_retainBlock(v7);
  v5 = objc_retainBlock(v4);

  return v5;
}

- (void)presentModalViewController:(id)a3 withTransition:(int)a4
{
  -[RootNavigationController presentAdaptiveModalViewController:animated:completion:](self, "presentAdaptiveModalViewController:animated:completion:", a3, a4 != 0, 0);
}

- (void)presentAdaptiveModalViewController:(id)a3
{
  -[RootNavigationController presentAdaptiveModalViewController:animated:completion:](self, "presentAdaptiveModalViewController:animated:completion:", a3, 1, 0);
}

- (void)presentAdaptiveModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = a4;
  -[RootNavigationController _presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:](self, "_presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:", a3, -1, 0, 0, -1, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, CGSizeZero.width, CGSizeZero.height, v5, a5);
}

- (void)_presentAdaptiveModalPopoverViewController:(id)a3 relativeToBarButtonItem:(id)a4 permittedArrowDirections:(unint64_t)a5 contentSize:(CGSize)a6 animated:(BOOL)a7 completion:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  height = a6.height;
  width = a6.width;
  v15 = a8;
  v16 = a4;
  v17 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  LOBYTE(v18) = a7;
  -[RootNavigationController _presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:](self, "_presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:", v17, 7, v16, v19, a5, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, width, height, v18, v15);

}

- (void)presentAdaptiveModalPopoverViewController:(id)a3 relativeToSourceRect:(CGRect)a4 withSourceView:(id)a5 passThroughViews:(id)a6 permittedArrowDirections:(unint64_t)a7 contentSize:(CGSize)a8 animated:(BOOL)a9 completion:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  -[RootNavigationController _presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:](self, "_presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:", a3, 7, 0, a5, a7, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a8.width, a8.height, v10, a10);
}

- (void)setupPresentationControllerIfStyleIsPopover:(int64_t)a3 barButtonItem:(id)a4 passThroughViews:(id)a5 permittedArrowDirections:(unint64_t)a6 sourceRect:(CGRect)a7 sourceView:(id)a8 viewController:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v23 = a4;
  v19 = a5;
  v20 = a8;
  if (a3 != 7)
    goto LABEL_10;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a9, "popoverPresentationController"));
  objc_msgSend(v21, "_setIgnoreBarButtonItemSiblings:", 1);
  objc_msgSend(v21, "setDelegate:", self);
  objc_msgSend(v21, "setPermittedArrowDirections:", a6);
  if (v23)
    objc_msgSend(v21, "setBarButtonItem:", v23);
  if (!v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
    objc_msgSend(v21, "setSourceView:", v22);

    if (!v19)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v21, "setSourceView:", v20);
  if (v19)
LABEL_6:
    objc_msgSend(v21, "setPassthroughViews:", v19);
LABEL_7:
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (!CGRectIsNull(v24))
    objc_msgSend(v21, "setSourceRect:", x, y, width, height);

LABEL_10:
}

- (void)_presentAdaptiveModalViewController:(id)a3 withPresentationStyleOverride:(int64_t)a4 relativeToBarButtonItem:(id)a5 withSourceView:(id)a6 sourceRect:(CGRect)a7 permittedArrowDirections:(unint64_t)a8 contentSize:(CGSize)a9 passThroughViews:(id)a10 animated:(BOOL)a11 completion:(id)a12
{
  double height;
  double width;
  double v18;
  double v19;
  double y;
  double x;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  __n128 v34;
  _BOOL4 v35;
  __n128 v36;
  uint64_t v37;
  double v38;
  void *v39;
  int64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  char isKindOfClass;
  void *v45;
  RootNavigationController *v46;
  uint64_t v47;
  char v48;
  RootNavigationController *v49;
  int64_t v50;
  uint64_t v52;
  id v53;
  _QWORD v54[5];
  id v55;
  uint8_t buf[4];
  void *v57;

  height = a9.height;
  width = a9.width;
  v18 = a7.size.height;
  v19 = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v53 = a10;
  v26 = a12;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v27);

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10009FC10;
  v54[3] = &unk_1001B2600;
  v28 = v26;
  v54[4] = self;
  v55 = v28;
  v29 = objc_retainBlock(v54);
  if ((objc_opt_respondsToSelector(v23, "setDoneBlock:") & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _doneBlock](self, "_doneBlock"));
    objc_msgSend(v23, "performSelector:withObject:", "setDoneBlock:", v30);

  }
  if (a4 == -1)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
    v32 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    if (v32)
      a4 = 1;
    else
      a4 = 7;
  }
  v33 = objc_msgSend(v23, "setModalPresentationStyle:", a4, a8);
  v34.n128_u64[0] = *(_QWORD *)&CGSizeZero.width;
  v35 = CGSizeZero.width == width;
  if (CGSizeZero.height != height)
    v35 = 0;
  if (a4 == 1 || v35)
  {
    v36.n128_f64[0] = EKUIContainedControllerIdealWidth(v33, v34);
    width = v36.n128_f64[0];
    v38 = EKUIContainedControllerIdealWidth(v37, v36);
    height = v38 * EKUIGoldenRatioPhi();
  }
  v39 = v25;
  objc_msgSend(v23, "setPreferredContentSize:", width, height);
  if (v24)
  {
    v40 = a4;
    v41 = v53;
    -[RootNavigationController setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:](self, "setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:", v40, v24, v53, v52, v25, v23, x, y, v19, v18);
    v42 = (id)kCalUILogHandle;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class(UINavigationController);
      isKindOfClass = objc_opt_isKindOfClass(v23, v43);
      v45 = v23;
      if ((isKindOfClass & 1) != 0)
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topViewController"));
      *(_DWORD *)buf = 138412290;
      v57 = v45;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[83058884] presenting adaptive vc %@", buf, 0xCu);
      if ((isKindOfClass & 1) != 0)

      v39 = v25;
      v41 = v53;
    }

    -[RootNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, a11, v29);
  }
  else
  {
    v46 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    objc_opt_class(UINavigationController);
    v48 = objc_opt_isKindOfClass(v23, v47);
    v49 = v46;
    if ((v48 & 1) != 0)
    {
      objc_msgSend(v23, "setModalPresentationStyle:", -[RootNavigationController presentationStyleOverrideForChildViewControllers](v46, "presentationStyleOverrideForChildViewControllers"));
      v49 = self;
    }
    -[RootNavigationController showViewController:sender:animated:completion:](v49, "showViewController:sender:animated:completion:", v23, self, a11, v29);
    v50 = a4;
    v41 = v53;
    -[RootNavigationController setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:](self, "setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:", v50, 0, v53, v52, v25, v23, x, y, v19, v18);

  }
}

- (void)continueSearchWithTerm:(id)a3 animated:(BOOL)a4 removeViewControllersIncapableOfSearchIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unsigned __int8 v21;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rightBarButtonItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController searchBarButtonItem](self, "searchBarButtonItem"));
  v13 = objc_msgSend(v11, "containsObject:", v12);

  v21 = v13;
  if (v5 && !*((_BYTE *)v19 + 24))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10009FE14;
    v17[3] = &unk_1001B4370;
    v17[4] = self;
    v17[5] = &v18;
    -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, v17);
  }
  if (v8 && *((_BYTE *)v19 + 24))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));

    if (v14)
      -[RootNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController showSearchAnimated:becomeFirstResponder:completion:](self, "showSearchAnimated:becomeFirstResponder:completion:", v6, 0, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchBar"));
    objc_msgSend(v16, "setText:", v8);

  }
  _Block_object_dispose(&v18, 8);

}

- (id)showSearchAnimated:(BOOL)a3 becomeFirstResponder:(BOOL)a4 completion:(id)a5
{
  id v6;
  SearchResultsNavigationController *v7;
  void *v8;
  void *v9;
  SearchResultsNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AdaptiveSearchController *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  AdaptiveSearchController *v54;
  _BOOL4 v56;
  _QWORD v58[5];
  AdaptiveSearchController *v59;
  id v60;
  id v61;
  BOOL v62;
  BOOL v63;
  objc_super v64;

  v56 = a3;
  v6 = a5;
  v7 = [SearchResultsNavigationController alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  v10 = -[SearchResultsNavigationController initWithModel:window:](v7, "initWithModel:window:", v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](v10, "searchResultsViewController"));
  objc_msgSend(v11, "setSearchResultsDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController toolbar](v10, "toolbar"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "standardAppearance"));
  v14 = objc_msgSend(v13, "copy");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController toolbar](v10, "toolbar"));
  objc_msgSend(v15, "setScrollEdgeAppearance:", v14);

  v16 = -[AdaptiveSearchController initWithSearchResultsController:]([AdaptiveSearchController alloc], "initWithSearchResultsController:", v10);
  -[AdaptiveSearchController setObscuresBackgroundDuringPresentation:](v16, "setObscuresBackgroundDuringPresentation:", 1);
  -[AdaptiveSearchController setHidesNavigationBarDuringPresentation:](v16, "setHidesNavigationBarDuringPresentation:", 0);
  -[AdaptiveSearchController setSearchResultsUpdater:](v16, "setSearchResultsUpdater:", v11);
  -[AdaptiveSearchController setDelegate:](v16, "setDelegate:", v10);
  -[AdaptiveSearchController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController view](v10, "view"));
  objc_msgSend(v17, "bounds");
  -[AdaptiveSearchController setPreferredContentSize:](v16, "setPreferredContentSize:", v18, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  -[AdaptiveSearchController _setShouldRespectPreferredContentSize:](v16, "_setShouldRespectPreferredContentSize:", EKUICurrentWindowInterfaceParadigm_ShouldUseLargeFormatInterface((uint64_t)v20, v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AdaptiveSearchController presentationController](v16, "presentationController"));
  objc_msgSend(v22, "setDelegate:", self);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AdaptiveSearchController searchBar](v16, "searchBar"));
  -[SearchResultsNavigationController setSearchBar:](v10, "setSearchBar:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](v10, "searchResultsViewController"));
  objc_msgSend(v23, "setDelegate:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v25);

  objc_msgSend(v23, "layoutSubviews");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  objc_msgSend(v27, "layoutMargins");
  v29 = v28;
  v31 = v30;

  objc_msgSend(v23, "setContentInset:", 0.0, v29, 0.0, v31);
  objc_msgSend(v23, "setShowsCancelButton:animated:", 1, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cancelButton"));
  *(_QWORD *)&v33 = objc_opt_class(self).n128_u64[0];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v34, v33));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Cancel - show search animated"), CFSTR("Cancel"), 0));
  objc_msgSend(v32, "setTitle:forState:", v36, 0);

  v39 = CalendarAppTintColor(v37, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v32, "setTitleColor:forState:", v40, 0);

  v43 = CalendarAppTintColor(v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  objc_msgSend(v32, "setTintColor:", v44);

  *(_QWORD *)&v45 = objc_opt_class(self).n128_u64[0];
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v46, v45));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Placeholder used in the search bar in the calendar occurrences list"), CFSTR("Search"), 0));
  objc_msgSend(v23, "setPlaceholder:", v48);

  objc_msgSend(v23, "_setBackdropStyle:", 2005);
  v64.receiver = self;
  v64.super_class = (Class)RootNavigationController;
  v49 = -[RootNavigationController traitCollection](&v64, "traitCollection");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "traitCollectionByModifyingTraits:", &stru_1001B43B0));

  -[SearchResultsNavigationController setEkui_futureTraitCollection:](v10, "setEkui_futureTraitCollection:", v51);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000A036C;
  v58[3] = &unk_1001B43D8;
  v58[4] = self;
  v59 = v16;
  v62 = v56;
  v63 = a4;
  v60 = v23;
  v61 = v6;
  v52 = v6;
  v53 = v23;
  v54 = v16;
  -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", v56, v58);

  return v11;
}

- (void)_showSearchController:(id)a3 withSearchBar:(id)a4 animated:(BOOL)a5 becomeFirstResponder:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  RootNavigationController *v19;
  id v20;
  BOOL v21;

  v9 = a5;
  v12 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A0468;
  v16[3] = &unk_1001B4400;
  v21 = a6;
  v17 = a4;
  v18 = v12;
  v19 = self;
  v20 = a7;
  v13 = v12;
  v14 = v20;
  v15 = v17;
  -[RootNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, v9, v16);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 5;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  int64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  objc_opt_class(UISearchController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
    v8 = 2;
  else
    v8 = (int64_t)objc_msgSend(v4, "presentationStyle");

  return v8;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5;
  void *v6;
  void (**v7)(id, id, _QWORD);

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", 0);
  v7 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue(-[RootNavigationController _doneBlock](self, "_doneBlock"));
  v7[2](v7, v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v6, "invalidateManagedNavigationController");

}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentChildViewController"));

  if ((objc_opt_respondsToSelector(v3, "eventViewControllerShouldHideInlineEditButton") & 1) != 0)
    v4 = objc_msgSend(v3, "eventViewControllerShouldHideInlineEditButton");
  else
    v4 = 0;

  return v4;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentChildViewController"));

  if ((objc_opt_respondsToSelector(v8, "eventViewControllerShouldHideInlineEditButton") & 1) != 0)
    v9 = objc_msgSend(v8, "eventViewDelegateShouldShowNextOccurrenceOfEvent:forward:", v6, v4);
  else
    v9 = 0;

  return v9;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));

  if (v7)
  {
    if (v4)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextOccurrence"));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "previousOccurrence"));
    v9 = (void *)v8;
    if (v8)
      objc_msgSend(v7, "showEvent:animated:showMode:context:", v8, 1, objc_msgSend(v10, "isBirthday") ^ 1, 0);

  }
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[RootNavigationController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id *v5;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  void ***v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  id v25;
  _QWORD *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  char isKindOfClass;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  RootNavigationController *v38;
  RootNavigationController *v39;
  RootNavigationController *v40;
  void **v41;
  uint64_t v42;
  id (*v43)(uint64_t);
  void *v44;
  RootNavigationController *v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[5];
  id v49;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000A0B94;
    v48[3] = &unk_1001B2600;
    v12 = v48;
    v5 = &v49;
    v13 = v10;
    v48[4] = self;
    v49 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = objc_retainBlock(v12);
  if (a4 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendar"));
    v17 = objc_msgSend(v16, "sharingStatus");

    if (v17)
    {
      if (v14)
      {
        v41 = _NSConcreteStackBlock;
        v42 = 3221225472;
        v43 = sub_1000A0BE0;
        v44 = &unk_1001B2600;
        v45 = self;
        v46 = v11;
        v18 = objc_retainBlock(&v41);

        v14 = v18;
      }
      else
      {
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000A0BD8;
        v47[3] = &unk_1001B2538;
        v47[4] = self;
        v14 = objc_retainBlock(v47);
      }
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentChildViewController"));
  objc_opt_class(CompactWidthWeekViewController);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    v40 = self;
    v23 = a4;
    v24 = v11;
    v25 = v9;
    v26 = v14;
    v27 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentChildViewController"));
    objc_opt_class(MultiDayWeekViewController);
    isKindOfClass = objc_opt_isKindOfClass(v28, v29);

    v5 = v27;
    v14 = v26;
    v9 = v25;
    v11 = v24;
    a4 = v23;
    self = v40;

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v9, "setInternalEditViewDelegate:", 0);
      v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RootNavigationController _doneBlockWithCompletion:](v40, "_doneBlockWithCompletion:", v14));
      ((void (**)(_QWORD, id, _QWORD))v32)[2](v32, v9, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](v40, "topMainViewControllerContainer"));
      objc_msgSend(v34, "invalidateManagedNavigationController");
      goto LABEL_24;
    }
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer", v40, v41, v42, v43, v44));
  v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentChildViewController"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
  v34 = v33;
  if (a4 == 1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendar"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectID"));

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      objc_msgSend(v37, "ensureCalendarVisibleWithId:", v36);

    }
    objc_msgSend(v32, "editorDidSaveEvent:", v34);
    v38 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internalEditViewDelegate"));

    if (v38 == self)
      -[RootNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

  }
  else if (a4)
  {
    if (a4 == 2)
      objc_msgSend(v32, "editorDidDeleteEvent:", v33);
  }
  else
  {
    objc_msgSend(v32, "editorDidCancelEditingEvent:", v33);
    v39 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internalEditViewDelegate"));

    if (v39 == self)
      -[RootNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
LABEL_24:

  if (v11)
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pasteboardManager"));

  return v4;
}

- (id)calendarModel
{
  return self->_model;
}

- (void)attemptDisplayReviewPrompt
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:calendarModel:](EKUIAppReviewUtils, "displayReviewPromptIfNeededInScene:calendarModel:", v3, v4);

}

- (void)searchResultsViewController:(id)a3 didSelectEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v6, "showEvent:animated:showMode:context:", v5, 1, 1, 0);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PopoverContentView);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
    v7 = objc_msgSend(v6, "canDismiss");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PresentationDismissal);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    objc_msgSend(v5, "didAttemptToDismiss");

  }
}

- (BOOL)_isThisTheOnlyConnectedScene
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (+[CalendarSceneManager isSceneCalendarAppScene:](CalendarSceneManager, "isSceneCalendarAppScene:", v8))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_sceneIdentifier"));
          WeakRetained = objc_loadWeakRetained((id *)&self->_window);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "windowScene"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_sceneIdentifier"));
          v13 = objc_msgSend(v9, "isEqualToString:", v12);

          if (!v13)
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (Class)_classRepresentingViewType:(int64_t)a3 isWidthCompact:(BOOL)a4
{
  __objc2_class **v4;
  void *v5;
  uint64_t v6;

  v4 = &off_1001B1B08;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = off_1001B1688;
      goto LABEL_10;
    case 2:
      v4 = off_1001B1B00;
      if (a4)
        v4 = &off_1001B16A8;
      goto LABEL_10;
    case 3:
      v4 = &off_1001B1400;
      goto LABEL_10;
    case 4:
      v4 = off_1001B1680;
LABEL_10:
      v6 = objc_opt_class(*v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    default:
      v5 = 0;
      break;
  }
  return (Class)v5;
}

- (void)_showNextDateComponentUnitAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v4, "navigateToNextDateComponentUnitAnimated:", v3);

}

- (void)_showPreviousDateComponentUnitAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v4, "navigateToPreviousDateComponentUnitAnimated:", v3);

}

- (void)_selectNextEvent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v2, "navigateToNextSelectableItem");

}

- (void)_selectPreviousEvent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v2, "navigateToPreviousSelectableItem");

}

- (id)_popToViewControllerSatisfying:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];

  v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((v4[2](v4, v11) & 1) != 0)
          {
            v12 = v11;

            if (v12)
            {
              v13 = kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v21 = v12;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Popping to view controller: [%@]", buf, 0xCu);
              }
              v14 = -[RootNavigationController popToViewController:animated:](self, "popToViewController:animated:", v12, 0);
            }
            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = 0;
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  }
LABEL_16:

  return v12;
}

- (void)doCrossfadeAnimationWithNavigationViewContents
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));

  if (!v3)
    -[RootNavigationController doCrossfadeAnimationWithCurrentScreenContents](self, "doCrossfadeAnimationWithCurrentScreenContents");
}

- (void)doCrossfadeAnimationWithCurrentScreenContents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000A14F4;
  v13 = sub_1000A1504;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  objc_msgSend(v6, "addSubview:", v10[5]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A150C;
  v8[3] = &unk_1001B4428;
  v8[4] = &v9;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A1520;
  v7[3] = &unk_1001B4450;
  v7[4] = &v9;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196610, v8, v7, 0.2, 0.0);

  _Block_object_dispose(&v9, 8);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  __objc2_class *v22;
  void *v23;
  unsigned int v24;
  __objc2_class *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  YearMonthAnimator *v30;
  void *v31;
  YearMonthAnimator *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int v37;
  _BOOL4 v38;
  id v39;
  PaletteView *paletteView;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  void *v46;
  uint64_t v47;
  id v48;

  v8 = a5;
  v9 = a6;
  objc_opt_class(MonthViewContainerViewController);
  v11 = v10;
  objc_opt_class(DayViewContainerViewController);
  v13 = v12;
  objc_opt_class(MultiDayWeekViewContainerViewController);
  v15 = v14;
  objc_opt_class(YearViewContainerViewController);
  v17 = v16;
  objc_opt_class(ListViewContainerViewController);
  v19 = v18;
  if ((objc_opt_isKindOfClass(v8, v11) & 1) == 0)
  {
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        v24 = objc_msgSend(v23, "showMonthAsDivided");

        if (v24)
        {
          v25 = CompactDividedMonthDayAnimator;
LABEL_44:
          v48 = [v25 alloc];
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
          paletteView = self->_paletteView;
          v41 = v48;
          v42 = v33;
          v43 = 1;
          goto LABEL_45;
        }
        v38 = (_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
           || _os_feature_enabled_impl("MobileCal", "two_day_view");
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        v47 = (uint64_t)objc_msgSend(v46, "numDaysToShow");

        if (!v38 || v47 < 2)
        {
          v25 = CompactMonthDayAnimator;
          goto LABEL_44;
        }
        goto LABEL_42;
      }
    }
    else if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
    {
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        v29 = objc_msgSend(v28, "showMonthAsDivided");

        if (v29)
        {
          v25 = CompactDividedMonthMultiDayAnimator;
          goto LABEL_44;
        }
LABEL_42:
        v25 = CompactMonthMultiDayAnimator;
        goto LABEL_44;
      }
    }
    else
    {
      if ((objc_opt_isKindOfClass(v8, v19) & 1) == 0)
      {
        if ((objc_opt_isKindOfClass(v8, v17) & 1) != 0 && (objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        {
          v22 = YearMonthAnimator;
LABEL_30:
          v39 = [v22 alloc];
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
          paletteView = self->_paletteView;
          v41 = v39;
          v42 = v33;
          v43 = 0;
LABEL_45:
          v32 = (YearMonthAnimator *)objc_msgSend(v41, "initWithModel:paletteView:reverse:", v42, paletteView, v43);
LABEL_46:

          goto LABEL_47;
        }
        goto LABEL_37;
      }
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        v37 = objc_msgSend(v36, "showMonthAsDivided");

        if (v37)
          v25 = DividedMonthListAnimator;
        else
          v25 = CompactMonthListAnimator;
        goto LABEL_44;
      }
    }
LABEL_37:
    v32 = 0;
    goto LABEL_47;
  }
  if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v21 = objc_msgSend(v20, "showMonthAsDivided");

    if (v21)
      v22 = CompactDividedMonthDayAnimator;
    else
      v22 = CompactMonthDayAnimator;
    goto LABEL_30;
  }
  if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v27 = objc_msgSend(v26, "showMonthAsDivided");

    if (v27)
      v22 = CompactDividedMonthMultiDayAnimator;
    else
      v22 = CompactMonthMultiDayAnimator;
    goto LABEL_30;
  }
  if ((objc_opt_isKindOfClass(v9, v17) & 1) == 0)
  {
    if ((objc_opt_isKindOfClass(v9, v19) & 1) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v45 = objc_msgSend(v44, "showMonthAsDivided");

      if (v45)
        v22 = DividedMonthListAnimator;
      else
        v22 = CompactMonthListAnimator;
      goto LABEL_30;
    }
    goto LABEL_37;
  }
  v30 = [YearMonthAnimator alloc];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v32 = -[YearMonthAnimator initWithModel:paletteView:reverse:](v30, "initWithModel:paletteView:reverse:", v31, self->_paletteView, 1);

  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentChildViewController"));
    objc_opt_class(CompactWidthMonthViewController);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0 && objc_msgSend(v33, "dividedListMode"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dateForCurrentMonthOnScreen"));
      -[YearMonthAnimator setSelectedDate:](v32, "setSelectedDate:", v35);

    }
    goto LABEL_46;
  }
LABEL_47:

  return v32;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "topViewController"));
  objc_opt_class(MainViewControllerContainer);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return (isKindOfClass & 1) == 0;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 0;
}

- (BOOL)_viewControllerTreeIsEligibleForJournalingConsideration:(id)a3
{
  id v3;
  unsigned __int8 v4;
  Class v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___EKUIManagedViewController))
  {
    v4 = objc_msgSend(v3, "wantsManagement");
  }
  else
  {
    v5 = NSClassFromString(CFSTR("MFMailComposeViewController"));
    v4 = 1;
    if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
    {
      objc_opt_class(UIDocumentPickerViewController);
      if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
        v4 = 0;
    }
  }

  return v4;
}

- (void)recursiveBuildJournal:(id)a3 ofViewControllerSubtree:(id)a4 stopCondition:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(id, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Class v27;
  Class v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(id, void *))a5;
  if (!v9)
    goto LABEL_36;
  if (-[RootNavigationController _viewControllerTreeIsEligibleForJournalingConsideration:](self, "_viewControllerTreeIsEligibleForJournalingConsideration:", v9))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
    -[RootNavigationController recursiveBuildJournal:ofViewControllerSubtree:stopCondition:](self, "recursiveBuildJournal:ofViewControllerSubtree:stopCondition:", v8, v11, v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
    objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0 && !v12
      || -[RootNavigationController _nodeContainsViewControllersRequiringTeardown:](self, "_nodeContainsViewControllersRequiringTeardown:", v9))
    {
      v14 = v9;
      for (i = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));
            (v10[2](v10, i) & 1) == 0;
            i = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController")))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewControllers"));
        v17 = objc_msgSend(v16, "count");

        if (!v17)
          goto LABEL_26;
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));
        if (!v18)
        {
          v35 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unexpected nil topViewController", buf, 2u);
          }
          goto LABEL_26;
        }
        v19 = (void *)v18;
        objc_opt_class(UIViewController);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
          objc_msgSend(v8, "addPushedViewController:withPresenter:", v19, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewControllers"));
        v37 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrayByExcludingObjectsInArray:", v22));

        objc_msgSend(v14, "setViewControllers:animated:", v23, 0);
      }
    }
    else
    {
      objc_opt_class(UINavigationController);
      if ((objc_opt_isKindOfClass(v9, v31) & 1) == 0)
      {
LABEL_27:
        if (v12)
        {
          if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___EnqueueableDismissOperationProtocol))objc_msgSend(v12, "setAllowsEnqueuedDismissal:", 0);
          if ((objc_opt_respondsToSelector(v9, "canBeDirectlyManaged") & 1) == 0
            || objc_msgSend(v9, "canBeDirectlyManaged"))
          {
            objc_msgSend(v8, "addPresentedViewController:withPresenter:", v9, v12);
          }
          objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 0, 0);
          if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___EnqueueableDismissOperationProtocol))objc_msgSend(v12, "setAllowsEnqueuedDismissal:", 1);
        }

        goto LABEL_36;
      }
      v14 = v9;
      i = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));
      if ((objc_opt_respondsToSelector(i, "canRequirePushOrPresentation") & 1) != 0
        && objc_msgSend(i, "canRequirePushOrPresentation"))
      {
        objc_msgSend(v8, "addPresentedViewController:withPresenter:", i, v12);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewControllers"));
        v36 = i;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "arrayByExcludingObjectsInArray:", v33));

        objc_msgSend(v14, "setViewControllers:animated:", v34, 0);
      }
    }

LABEL_26:
    goto LABEL_27;
  }
  objc_opt_class(UIAlertController);
  if ((objc_opt_isKindOfClass(v9, v24) & 1) != 0
    || (objc_opt_class(IdentitySwitcherViewController), (objc_opt_isKindOfClass(v9, v25) & 1) != 0)
    || (objc_opt_class(UIActivityViewController), (objc_opt_isKindOfClass(v9, v26) & 1) != 0)
    || (v27 = NSClassFromString(CFSTR("_UIDatePickerNumericKeyboardViewController")),
        (objc_opt_isKindOfClass(v9, v27) & 1) != 0)
    || (v28 = NSClassFromString(CFSTR("DDParsecCollectionViewController")),
        (objc_opt_isKindOfClass(v9, v28) & 1) != 0))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
    objc_msgSend(v29, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  v30 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RootNavigationController recursiveBuildJournal:ofViewControllerSubtree:stopCondition:]";
    v40 = 2112;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s: Dropping UIViewController subtree descended from node: %@", buf, 0x16u);
  }
LABEL_36:

}

- (BOOL)_nodeContainsViewControllersRequiringTeardown:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_opt_class(EKEventEditViewController);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
          {
            objc_opt_class(EKEventViewController);
            if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
            {
              objc_opt_class(CNContactViewController);
              if ((objc_opt_isKindOfClass(v10, v13) & 1) == 0)
                continue;
            }
          }
          v14 = 1;
          goto LABEL_16;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v14 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v14 = 0;
    }
LABEL_16:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_containsViewControllerRequiringNavBarVisibilityRestoration
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CNContactViewController);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  -[RootNavigationController navigationController:willShowViewController:animated:](self, "navigationController:willShowViewController:animated:", self, v9, 0);

  v19.receiver = self;
  v19.super_class = (Class)RootNavigationController;
  -[RootNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v19, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v18, 0, sizeof(v18));
  if (!CGAffineTransformIsIdentity(&v18))
    -[RootNavigationController _performCustomRotationAnimationForMainWindowWithTransitionCoordinator:](self, "_performCustomRotationAnimationForMainWindowWithTransitionCoordinator:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v10);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A2390;
  v14[3] = &unk_1001B3DF0;
  v14[4] = self;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v16 = width;
  v17 = height;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A244C;
  v12[3] = &unk_1001B2BE8;
  v12[4] = self;
  v13 = v15;
  v11 = v15;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v14, v12);

}

- (void)_performCustomRotationAnimationForMainWindowWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  if (v5)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
    if (objc_msgSend(v6, "horizontalSizeClass") == (id)2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
      v8 = objc_msgSend(v7, "verticalSizeClass");

      if (v8 == (id)2)
        goto LABEL_8;
    }
    else
    {

    }
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_1000A14F4;
    v21 = sub_1000A1504;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superview"));

    objc_msgSend(v13, "addSubview:", v18[5]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A26A4;
    v16[3] = &unk_1001B4428;
    v16[4] = &v17;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, 0, 0.15);
    v14[4] = &v17;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A26B8;
    v15[3] = &unk_1001B4478;
    v15[4] = self;
    v15[5] = &v17;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A2910;
    v14[3] = &unk_1001B44A0;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v15, v14);

    _Block_object_dispose(&v17, 8);
  }
LABEL_8:

}

+ (void)recursiveAnimationRemove:(id)a3
{
  recursiveAnimationRemove(a3, a2);
}

- (void)recursiveAnimationRemoveForSmallLayers:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (a3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sublayers", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          -[RootNavigationController recursiveAnimationRemoveForSmallLayers:](self, "recursiveAnimationRemoveForSmallLayers:", v9);
          objc_msgSend(v9, "bounds");
          v11 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
          objc_msgSend(v13, "bounds");
          v15 = v14;

          if (v11 < v15)
            objc_msgSend(v9, "removeAllAnimations");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  if (self->_isTransitioningTraitCollection)
  {
    self->_hideNavBarAfterTraitCollectionTransition = a3;
    self->_shouldSetNavBarVisibilityAfterTraitCollectionTransition = 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)RootNavigationController;
    -[RootNavigationController setNavigationBarHidden:animated:](&v4, "setNavigationBarHidden:animated:", a3, a4);
  }
}

- (id)_tornDownJournalOfShownViewControllers
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  ViewControllerJournal *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentChildViewController"));

  if ((objc_opt_respondsToSelector(v4, "shouldJournalMainViewControllerParent") & 1) != 0)
    v5 = objc_msgSend(v4, "shouldJournalMainViewControllerParent") ^ 1;
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerToShowFrom"));
  v7 = objc_alloc_init(ViewControllerJournal);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  -[RootNavigationController recursiveBuildJournal:ofViewControllerSubtree:stopCondition:](self, "recursiveBuildJournal:ofViewControllerSubtree:stopCondition:", v7, v9, &stru_1001B44C0);

  -[RootNavigationController recursiveBuildJournal:ofViewControllerSubtree:stopCondition:](self, "recursiveBuildJournal:ofViewControllerSubtree:stopCondition:", v7, v4, &stru_1001B44C0);
  if ((v5 & 1) == 0)
    -[RootNavigationController recursiveBuildJournal:ofViewControllerSubtree:stopCondition:](self, "recursiveBuildJournal:ofViewControllerSubtree:stopCondition:", v7, v6, &stru_1001B44C0);
  v10 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ekui_futureTraitCollection"));
    v14 = 136315650;
    v15 = "-[RootNavigationController _tornDownJournalOfShownViewControllers]";
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s: Oldtopmain: %@, futureTraits: %@", (uint8_t *)&v14, 0x20u);

  }
  return v7;
}

- (BOOL)_viewControllerRequiresSystemPresentation:(id)a3
{
  id v3;
  Class v4;
  char isKindOfClass;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("DDParsecCollectionViewController"));
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (void)_replayJournal:(id)a3 withRootVC:(id)a4 topMainVC:(id)a5
{
  id v8;
  id v9;
  RootNavigationController *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unsigned __int8 v30;
  RootNavigationController *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  RootNavigationController *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int isKindOfClass;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  Class v53;
  char v54;
  void *v55;
  RootNavigationController *v56;
  id v57;
  id v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  BOOL v64;
  unsigned __int8 v65;
  unsigned __int8 v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  BOOL v71;
  int v72;
  void *v73;
  NSObject *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  _QWORD *v85;
  uint64_t v86;
  RootNavigationController *v87;
  void *v88;
  id v89;
  int v90;
  int v91;
  id v92;
  RootNavigationController *v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  RootNavigationController *v98;
  id v99;
  _QWORD *v100;
  BOOL v101;
  unsigned __int8 v102;
  unsigned __int8 v103;
  _QWORD v104[4];
  id v105;
  id v106;
  RootNavigationController *v107;
  id v108;
  id v109;
  RootNavigationController *v110;
  uint64_t v111;
  uint64_t v112;
  uint8_t buf[4];
  id v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;

  v8 = a3;
  v9 = a4;
  v10 = (RootNavigationController *)a5;
  v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_opt_class(v9);
    v14 = v13;
    v15 = v13;
    objc_opt_class(v10);
    *(_DWORD *)buf = 138412802;
    v114 = v8;
    v115 = 2112;
    v116 = v14;
    v117 = 2112;
    v118 = v16;
    v17 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[_replayJournal:%@ withRootVC:%@ topMainVC:%@]", buf, 0x20u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextJournaledViewController"));
  v19 = v18;
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewController"));
    v87 = self;
    v93 = v10;
    if (!objc_msgSend(v20, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventOrIntegrationEditView))
    {
      objc_opt_class(EKEventViewController);
      if ((objc_opt_isKindOfClass(v20, v29) & 1) == 0)
      {
        objc_opt_class(CNContactViewController);
        if ((objc_opt_isKindOfClass(v20, v34) & 1) != 0)
        {
          if (-[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___CNContactViewControllerDelegate))objc_msgSend(v20, "setDelegate:", v10);
        }
        else
        {
          objc_opt_class(EKExpandedReminderStackViewController);
          if ((objc_opt_isKindOfClass(v20, v40) & 1) != 0)
          {
            v21 = v20;
            v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "events"));
            objc_msgSend(v21, "setTransitioningDelegate:", 0);
            if (-[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___EKExpandedReminderStackViewControllerDelegate))objc_msgSend(v21, "setEKExpandedReminderStackViewControllerDelegate:", v10);
            objc_opt_class(CompactListViewController);
            isKindOfClass = objc_opt_isKindOfClass(v10, v41);
            v38 = isKindOfClass;
            if ((isKindOfClass & 1) != 0)
            {
              v90 = isKindOfClass;
              v43 = (void *)kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v44 = v43;
                objc_opt_class(v21);
                *(_DWORD *)buf = 138412290;
                v114 = v45;
                v46 = v45;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Skipping presentation of %@ because we don't need expanded reminders view on list view", buf, 0xCu);

              }
              v38 = v90;
            }
            goto LABEL_30;
          }
        }
        -[RootNavigationController reconfigureViewController:](v10, "reconfigureViewController:", v20);
        v33 = 0;
        goto LABEL_41;
      }
      v30 = -[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventViewDelegatePrivateAllInProcess);
      v31 = v10;
      if ((v30 & 1) == 0)
      {
        if (-[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventViewDelegate))v31 = v10;
        else
          v31 = self;
      }
      objc_msgSend(v20, "setDelegate:", v31);
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "event"));
      v21 = (id)v32;
      if (!v32)
      {
        v38 = 0;
        v33 = 0;
LABEL_30:

        -[RootNavigationController reconfigureViewController:](v10, "reconfigureViewController:", v20);
        if ((v38 & 1) != 0 || !v33)
        {
LABEL_42:
          v94 = v19;
          v88 = (void *)v33;
          v91 = v38;
          if (objc_msgSend(v19, "displayType") == (id)1)
          {
            v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "presentingViewController"));
            if (v47)
            {
              v48 = (void *)v47;
              objc_opt_class(EnqueueableManagedNavigationController);
              if ((objc_opt_isKindOfClass(v48, v49) & 1) == 0)
              {
                objc_opt_class(RootNavigationController);
                if ((objc_opt_isKindOfClass(v48, v50) & 1) == 0)
                {
                  objc_opt_class(MainWindowRootViewController);
                  if ((objc_opt_isKindOfClass(v48, v51) & 1) == 0)
                  {
                    objc_opt_class(MainWindowWrapperNavigationController);
                    if ((objc_opt_isKindOfClass(v48, v52) & 1) == 0)
                    {
LABEL_56:
                      v104[0] = _NSConcreteStackBlock;
                      v104[1] = 3221225472;
                      v104[2] = sub_1000A36B8;
                      v104[3] = &unk_1001B3948;
                      v57 = v48;
                      v105 = v57;
                      v58 = v20;
                      v106 = v58;
                      v107 = self;
                      v89 = v9;
                      v108 = v9;
                      v109 = v8;
                      v110 = v10;
                      v59 = objc_retainBlock(v104);
                      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "presentedViewController"));
                      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "viewControllerToShowFrom"));
                      v62 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
                      v63 = objc_msgSend(v62, "horizontalSizeClass");
                      v64 = v63 == (id)1;

                      if (objc_msgSend(v58, "conformsToProtocol:", &OBJC_PROTOCOL___EKUIManagedViewController))
                      {
                        if ((objc_opt_respondsToSelector(v58, "canRequirePushOrPresentation") & 1) != 0)
                          v65 = objc_msgSend(v58, "canRequirePushOrPresentation");
                        else
                          v65 = 0;
                        if ((objc_opt_respondsToSelector(v58, "prefersPushForSizeClass:") & 1) != 0)
                        {
                          v67 = v61;
                          v68 = v8;
                          v69 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](v87, "ekui_futureTraitCollection"));
                          v66 = objc_msgSend(v58, "prefersPushForSizeClass:", objc_msgSend(v69, "horizontalSizeClass"));

                          v8 = v68;
                          v61 = v67;
                          v64 = v63 == (id)1;
                        }
                        else
                        {
                          v66 = 0;
                        }
                        if (objc_msgSend(v58, "canManagePresentationStyle"))
                        {
                          if (v63 == (id)1)
                            v70 = -2;
                          else
                            v70 = 3;
                          objc_msgSend(v58, "setModalPresentationStyle:", v70);
                        }
                      }
                      else
                      {
                        v66 = 0;
                        v65 = 0;
                      }
                      if (v60)
                        v71 = v60 == v61;
                      else
                        v71 = 1;
                      v72 = !v71;
                      if (((v91 | v72) & 1) != 0)
                      {
                        if ((v91 & 1) == 0)
                        {
                          v73 = (void *)kCalUILogHandle;
                          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
                          {
                            v74 = v73;
                            objc_opt_class(v58);
                            v75 = v8;
                            v77 = v76;
                            v92 = v76;
                            objc_opt_class(v57);
                            v79 = v78;
                            v80 = v78;
                            objc_opt_class(v60);
                            *(_DWORD *)buf = 138412802;
                            v114 = v77;
                            v115 = 2112;
                            v116 = v79;
                            v117 = 2112;
                            v118 = v81;
                            v82 = v81;
                            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Skipping presentation of %@ because %@ already has a presentation up (%@)", buf, 0x20u);

                            v8 = v75;
                          }
                        }
                        ((void (*)(_QWORD *))v59[2])(v59);
                      }
                      else
                      {
                        v83 = v8;
                        v95[0] = _NSConcreteStackBlock;
                        v95[1] = 3221225472;
                        v95[2] = sub_1000A3918;
                        v95[3] = &unk_1001B44E8;
                        v96 = v94;
                        v101 = v64;
                        v97 = v57;
                        v98 = v87;
                        v84 = v58;
                        v99 = v84;
                        v102 = v65;
                        v103 = v66;
                        v100 = v59;
                        v85 = objc_retainBlock(v95);
                        objc_opt_class(UIDocumentPickerViewController);
                        if ((objc_opt_isKindOfClass(v84, v86) & 1) != 0)
                          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v85);
                        else
                          ((void (*)(_QWORD *))v85[2])(v85);
                        v8 = v83;

                      }
                      v19 = v94;

                      v9 = v89;
                      v10 = v93;
                      goto LABEL_85;
                    }
                  }
                }
              }

            }
          }
          v53 = NSClassFromString(CFSTR("MFMailComposeViewController"));
          v54 = objc_opt_isKindOfClass(v20, v53);
          if (objc_msgSend(v20, "prefersToBePresentedFromApplicationRootViewController")
            && (v55 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController")),
                v55,
                !v55))
          {
            v56 = self;
          }
          else if (v54 & 1 | ((objc_opt_respondsToSelector(v9, "showViewController:sender:animated:completion:") & 1) == 0))
          {
            v56 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllerToShowFrom"));
          }
          else
          {
            v56 = (RootNavigationController *)v9;
          }
          v48 = v56;
          goto LABEL_56;
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        objc_msgSend(v39, "setSelectedOccurrences:", v33);

LABEL_41:
        v38 = 0;
        goto LABEL_42;
      }
      v111 = v32;
      v33 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v111, 1));
LABEL_29:
      v38 = 0;
      goto LABEL_30;
    }
    v21 = v20;
    if ((-[RootNavigationController requiresSelfAsEventEditorDelegate](v10, "requiresSelfAsEventEditorDelegate") & 1) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "internalEditViewDelegate"));
      objc_opt_class(UIViewController);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "internalEditViewDelegate"));
        v25 = v19;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "window"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));

        v19 = v25;
        v71 = v27 == v28;
        self = v87;
        v10 = v93;
        if (v71)
        {
LABEL_25:
          v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "event"));
          v37 = (void *)v36;
          if (v36)
          {
            v112 = v36;
            v33 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v112, 1));
          }
          else
          {
            v33 = 0;
          }

          goto LABEL_29;
        }
      }
      else
      {

      }
    }
    if (-[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventOrIntegrationEditViewDelegate))v35 = v10;
    else
      v35 = self;
    objc_msgSend(v21, "setInternalEditViewDelegate:", v35);
    goto LABEL_25;
  }
LABEL_85:

}

- (int64_t)_preferredCompactSingleDayView
{
  if (-[CUIKCalendarModel showDayAsList](self->_model, "showDayAsList"))
    return 4;
  else
    return 3;
}

- (int64_t)_preferredPostTransitionViewFromTraitCollection:(id)a3 toTraitCollection:(id)a4 currentViewType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "horizontalSizeClass");
  if (v10 != objc_msgSend(v9, "horizontalSizeClass")
    || (v11 = objc_msgSend(v8, "verticalSizeClass"), v11 != objc_msgSend(v9, "verticalSizeClass")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windowScene"));
    if (objc_msgSend(v13, "activationState") == (id)2)
    {
      v14 = objc_msgSend(v8, "horizontalSizeClass");
      v15 = objc_msgSend(v9, "horizontalSizeClass");

      if (v14 != v15)
      {
        if (objc_msgSend(v9, "horizontalSizeClass") == (id)1)
        {
          v16 = 200;
LABEL_16:
          a5 = *(int64_t *)((char *)&self->super.super.super.super.isa + v16);
          goto LABEL_13;
        }
        if (objc_msgSend(v9, "horizontalSizeClass") == (id)2)
        {
          v16 = 192;
          goto LABEL_16;
        }
      }
    }
    else
    {

    }
    if (a5 == 4 && objc_msgSend(v8, "horizontalSizeClass") == (id)1 && objc_msgSend(v9, "horizontalSizeClass") == (id)2)
      a5 = 3;
    else
      a5 = -1;
  }
LABEL_13:

  return a5;
}

- (BOOL)_canSkipViewHierarchyRebuildingWhenTransitioningFromOldCollection:(id)a3 toNewCollection:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "verticalSizeClass");
  if (v7 == objc_msgSend(v6, "verticalSizeClass"))
  {
    v8 = objc_msgSend(v5, "horizontalSizeClass");
    v9 = v8 == objc_msgSend(v6, "horizontalSizeClass");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  id v28;
  id v29;
  _QWORD *v30;
  id v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[4];
  id v42;
  RootNavigationController *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  int64_t v48;
  int64_t v49;
  objc_super v50;
  objc_super v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  v9 = -[RootNavigationController _canSkipViewHierarchyRebuildingWhenTransitioningFromOldCollection:toNewCollection:](self, "_canSkipViewHierarchyRebuildingWhenTransitioningFromOldCollection:toNewCollection:", v8, v6);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    EKUIPushFallbackSizingContextWithViewHierarchy(v10);

    v51.receiver = self;
    v51.super_class = (Class)RootNavigationController;
    -[RootNavigationController willTransitionToTraitCollection:withTransitionCoordinator:](&v51, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    EKUIPopFallbackSizingContextWithViewHierarchy(v11);
  }
  else
  {
    self->_isTransitioningTraitCollection = 1;
    v12 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
      *(_DWORD *)buf = 138412546;
      v53 = v6;
      v54 = 2112;
      v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[51150180] willTransitionToTraitCollection: %@ from %@", buf, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredPreSizeClassTransitionSelectedDate"));
    if (v16)
      -[CUIKCalendarModel setSelectedDate:](self->_model, "setSelectedDate:", v16);
    v39 = (void *)v16;
    -[CUIKCalendarModel setSelectedDateChangesDelayedUntilAfterTransition:](self->_model, "setSelectedDateChangesDelayedUntilAfterTransition:", 1, 224);
    -[RootNavigationController _updateInteractivePopAllowed](self, "_updateInteractivePopAllowed");
    if (-[RootNavigationController isNavigationBarHidden](self, "isNavigationBarHidden")
      && objc_msgSend(v6, "horizontalSizeClass") == (id)2
      && -[RootNavigationController _containsViewControllerRequiringNavBarVisibilityRestoration](self, "_containsViewControllerRequiringNavBarVisibilityRestoration"))
    {
      -[RootNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 0);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
    v18 = -[RootNavigationController currentViewType](self, "currentViewType");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController firstResponder](self, "firstResponder"));
    v20 = -[RootNavigationController currentViewType](self, "currentViewType");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    v22 = objc_msgSend(v21, "shouldAdaptEventViewControllers");

    if (v22)
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _tornDownJournalOfShownViewControllers](self, "_tornDownJournalOfShownViewControllers"));
    else
      v23 = 0;
    -[RootNavigationController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    EKUIPushFallbackSizingContextWithViewHierarchy(v24);

    v50.receiver = self;
    v50.super_class = (Class)RootNavigationController;
    -[RootNavigationController willTransitionToTraitCollection:withTransitionCoordinator:](&v50, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    EKUIPopFallbackSizingContextWithViewHierarchy(v25);

    if (objc_msgSend(v17, "horizontalSizeClass") == (id)2
      && objc_msgSend(v6, "horizontalSizeClass") == (id)1
      && v20 == 2)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      self->_traitCollectionChangeShouldResultInCompactDayView = objc_msgSend(v26, "showDayAsList") ^ 1;

    }
    else
    {
      self->_traitCollectionChangeShouldResultInCompactDayView = 0;
    }
    -[PaletteView updateForChangeToTraitCollection:](self->_paletteView, "updateForChangeToTraitCollection:", v6);
    v27 = -[RootNavigationController _preferredPostTransitionViewFromTraitCollection:toTraitCollection:currentViewType:](self, "_preferredPostTransitionViewFromTraitCollection:toTraitCollection:currentViewType:", v17, v6, v20);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000A439C;
    v44[3] = &unk_1001B4510;
    v44[4] = self;
    v28 = v17;
    v45 = v28;
    v46 = v6;
    v48 = v18;
    v49 = v27;
    v29 = v23;
    v47 = v29;
    v30 = objc_retainBlock(v44);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000A4490;
    v41[3] = &unk_1001B2BE8;
    v31 = v19;
    v42 = v31;
    v43 = self;
    v32 = objc_retainBlock(v41);
    if (v7 && objc_msgSend(v7, "isAnimated"))
    {
      if (+[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted"))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000A452C;
        v40[3] = &unk_1001B2538;
        v40[4] = self;
        objc_msgSend(v33, "installCACommitCompletionBlock:", v40);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      EKUIPushFallbackSizingContextWithViewHierarchy(v34);

      ((void (*)(_QWORD *, _QWORD))v30[2])(v30, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      EKUIPopFallbackSizingContextWithViewHierarchy(v35);

      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v32);
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      EKUIPushFallbackSizingContextWithViewHierarchy(v36);

      ((void (*)(_QWORD *, _QWORD))v30[2])(v30, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      EKUIPopFallbackSizingContextWithViewHierarchy(v37);

      ((void (*)(_QWORD *, _QWORD))v32[2])(v32, 0);
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v38), "setSelectedDateChangesDelayedUntilAfterTransition:", 0);

    v11 = v15;
  }

}

- (void)_adjustNavBarVisibilityAfterTraitCollectionChange
{
  self->_isTransitioningTraitCollection = 0;
  if (self->_shouldSetNavBarVisibilityAfterTraitCollectionTransition)
  {
    self->_shouldSetNavBarVisibilityAfterTraitCollectionTransition = 0;
    -[RootNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", self->_hideNavBarAfterTraitCollectionTransition, 0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[RootNavigationController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", 0);
  self->_traitCollectionChangeShouldResultInCompactDayView = 0;
  -[RootNavigationController _adjustNavBarVisibilityAfterTraitCollectionChange](self, "_adjustNavBarVisibilityAfterTraitCollectionChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  -[RootNavigationController _updatePaletteStateWithViewController:](self, "_updatePaletteStateWithViewController:", v5);

  v6.receiver = self;
  v6.super_class = (Class)RootNavigationController;
  -[RootNavigationController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);

}

- (void)_setNavigationStackOfMainViewControllersForTraitsTransitionFromTraitCollection:(id)a3 toNewTraitCollection:(id)a4 withPreTransitionViewType:(int64_t)a5 withPreferredPostTransitionViewType:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  WeekViewContainerViewController *v16;
  CUIKCalendarModel *model;
  void *v18;
  WeekViewContainerViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  uint64_t v38;
  id v39;
  int v40;
  id v41;
  _BOOL4 v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  v10 = a4;
  v11 = -[RootNavigationController _ensureStackBaseCalendarViewControllerContainerIsPresent](self, "_ensureStackBaseCalendarViewControllerContainerIsPresent");
  if (objc_msgSend(v48, "horizontalSizeClass") != (id)1 || objc_msgSend(v48, "verticalSizeClass") != (id)1)
  {
    if (objc_msgSend(v10, "horizontalSizeClass") == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1)
    {
      if (!self->_traitCollectionChangeShouldResultInCompactDayView)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
        v15 = (char *)objc_msgSend(v12, "indexOfObject:", v14);
        v16 = [WeekViewContainerViewController alloc];
        model = self->_model;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
        v19 = -[MainViewControllerContainer initWithModel:window:](v16, "initWithModel:window:", model, v18);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
        -[WeekViewContainerViewController setEkui_futureTraitCollection:](v19, "setEkui_futureTraitCollection:", v20);

        objc_msgSend(v13, "insertObject:atIndex:", v19, v15 + 1);
        -[RootNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v13, 0);

LABEL_30:
        v40 = 0;
        goto LABEL_37;
      }
    }
    else if (objc_msgSend(v48, "horizontalSizeClass") == (id)1 && objc_msgSend(v10, "horizontalSizeClass") == (id)2)
    {
      if (!self->_traitCollectionChangeShouldResultInCompactDayView && (unint64_t)(a5 - 2) <= 2)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
        if ((unint64_t)objc_msgSend(v21, "count") >= 2)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 1));

          objc_opt_class(MonthViewContainerViewController);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nextLevelWeekViewController"));
            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v21));
              v27 = v26;
              if (a5 == 2)
                objc_msgSend(v26, "removeLastObject");
              objc_msgSend(v27, "insertObject:atIndex:", v25, 2);
              if (objc_msgSend(v27, "count") == (id)3)
                objc_msgSend(v25, "setupForViewAppearance");
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));
              objc_opt_class(MainViewControllerContainer);
              isKindOfClass = objc_opt_isKindOfClass(v28, v29);

              if ((isKindOfClass & 1) != 0
                && (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"))) != 0)
              {
                v32 = v31;
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentChildViewController"));
                objc_msgSend(v33, "viewWillAppear:", 0);

                -[RootNavigationController setViewControllers:](self, "setViewControllers:", v27);
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentChildViewController"));
                objc_msgSend(v34, "viewDidAppear:", 0);

              }
              else
              {
                -[RootNavigationController setViewControllers:](self, "setViewControllers:", v27);
              }

            }
          }

        }
      }
    }
    else if (objc_msgSend(v48, "horizontalSizeClass") == (id)2 && objc_msgSend(v10, "horizontalSizeClass") == (id)1)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
      v36 = objc_msgSend(v35, "showDayAsList");

      if (v36)
      {
        -[RootNavigationController updateDayViewModeContainer](self, "updateDayViewModeContainer");
      }
      else if (self->_traitCollectionChangeShouldResultInCompactDayView)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
        if ((uint64_t)objc_msgSend(v37, "numDaysToShow") >= 2)
          v38 = 2;
        else
          v38 = 3;

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
        v39 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", v38, v12);
        goto LABEL_30;
      }
    }
  }
  v40 = 1;
LABEL_37:
  v41 = objc_msgSend(v10, "horizontalSizeClass");
  v43 = a6 != 4 || v41 != (id)2;
  if (a6 != -1 && v40 && v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v45 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", a6, v44);

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  -[RootNavigationController navigationController:willShowViewController:animated:](self, "navigationController:willShowViewController:animated:", self, v46, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  objc_msgSend(v47, "setNeedsLayout");

}

- (void)restoreEventDetailViewControllers:(id)a3
{
  id v4;
  RootNavigationController *v5;
  id v6;
  id v7;
  NSString *const **v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  RootNavigationController *v13;
  uint64_t v14;
  unsigned __int8 v15;
  RootNavigationController *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSString *const **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  RootNavigationController *v25;
  RootNavigationController *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v4 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v5 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentChildViewController"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = &EKEventStoreChangedNotification_ptr;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        objc_opt_class(v8[148]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          if (-[RootNavigationController conformsToProtocol:](v5, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventEditViewDelegate))v13 = v5;
          else
            v13 = self;
          objc_msgSend(v11, "setEditViewDelegate:", v13);
        }
        else
        {
          objc_opt_class(EKEventViewController);
          if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0)
          {
            -[RootNavigationController reconfigureViewController:](v5, "reconfigureViewController:", v11);
            goto LABEL_20;
          }
          v15 = -[RootNavigationController conformsToProtocol:](v5, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventViewDelegatePrivateAllInProcess);
          v16 = v5;
          if ((v15 & 1) == 0)
          {
            if (-[RootNavigationController conformsToProtocol:](v5, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventViewDelegate))v16 = v5;
            else
              v16 = self;
          }
          objc_msgSend(v11, "setDelegate:", v16);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "event"));
        -[RootNavigationController reconfigureViewController:](v5, "reconfigureViewController:", v11);
        if (v17)
        {
          v18 = v7;
          v19 = v9;
          v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startCalendarDate"));
          objc_msgSend(v21, "setSelectedDate:", v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
          objc_msgSend(v23, "setSelectedOccurrence:", v17);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startCalendarDate"));
          -[RootNavigationController selectDate:animated:](v5, "selectDate:animated:", v24, 0);

          v8 = v20;
          v9 = v19;
          v7 = v18;

        }
LABEL_20:
        if ((objc_opt_respondsToSelector(v5, "showViewController:sender:animated:completion:") & 1) != 0)
          v25 = v5;
        else
          v25 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllerToShowFrom](v5, "viewControllerToShowFrom"));
        v26 = v25;
        -[RootNavigationController showViewController:sender:animated:completion:](v25, "showViewController:sender:animated:completion:", v11, self, 0, 0);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

}

- (BOOL)shouldSaveSelectedEvent
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentChildViewController"));

  objc_opt_class(LargeDayViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "selectedEventWasAutoSelected") ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (void)didEnterBackground
{
  int64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = -[RootNavigationController currentViewType](self, "currentViewType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)2)
  {
    self->_compactBackgroundedViewType = -1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
    v7 = objc_msgSend(v6, "horizontalSizeClass");

    if (v7 == (id)1)
    {
      self->_compactBackgroundedViewType = v3;
      v3 = -1;
    }
    else
    {
      v3 = -1;
      self->_compactBackgroundedViewType = -1;
    }
  }
  self->_regularBackgroundedViewType = v3;
}

- (id)bestDateForNewEvent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
  v4 = objc_opt_respondsToSelector(v3, "bestDateForNewEvent");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bestDateForNewEvent"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  -[RootNavigationController showDate:andTime:animated:](self, "showDate:andTime:animated:", a3, 0, a4);
}

- (void)showDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  _QWORD v8[4];
  RootNavigationController *v9;
  id v10;
  BOOL v11;
  BOOL v12;

  v5 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A4FEC;
  v8[3] = &unk_1001B4538;
  v9 = self;
  v10 = a3;
  v11 = a4;
  v12 = v5;
  v7 = v10;
  -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](v9, "_dismissPresentedViewControllerAnimated:completion:", v5, v8);

}

- (BOOL)isDateVisible:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unsigned __int8 v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  if (!v5)
  {
    v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "No top main view controller to query if a date is visible.", v9, 2u);
    }
  }
  v7 = objc_msgSend(v5, "isDateVisible:", v4);

  return v7;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  if (!v6)
  {
    v7 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No top main view controller to query if a date is visible.", v8, 2u);
    }
  }
  objc_msgSend(v6, "currentlyVisibleDateRangeFromStartDate:toEndDate:", a3, a4);

}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  RootNavigationController *v12;
  id v13;
  id v14;
  unint64_t v15;
  BOOL v16;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A5230;
  v11[3] = &unk_1001B4580;
  v12 = self;
  v13 = a3;
  v16 = a4;
  v14 = a6;
  v15 = a5;
  v9 = v14;
  v10 = v13;
  -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](v12, "_dismissPresentedViewControllerAnimated:completion:", 0, v11);

}

- (void)showContactWithIdentifier:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  RootNavigationController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A53C8;
  v5[3] = &unk_1001B26A0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)weekViewController:(id)a3 didEditEvent:(id)a4 creationMethod:(unint64_t)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:](AddEventViewController, "editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:", v15, self->_model, a5, self));
  -[RootNavigationController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v7, 8);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
    if (!objc_msgSend(v10, "length"))
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_opt_class(EKEventEditViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v11);

    if ((isKindOfClass & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightBarButtonItem"));
      objc_msgSend(v14, "setEnabled:", 1);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)weekViewController:(id)a3 didSelectEvent:(id)a4
{
  -[RootNavigationController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", a4, 1, 1, 0);
}

- (void)_invalidateNavBarDateStringCache
{
  NSMutableDictionary *navBarDateStringCache;

  navBarDateStringCache = self->_navBarDateStringCache;
  self->_navBarDateStringCache = 0;

}

- (void)setNavBarStringFromDate:(id)a3 includeMonth:(BOOL)a4 includeYear:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *navBarDateStringCache;
  NavBarDateCacheKey *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (!self->_navBarDateStringCache)
  {
    v9 = objc_opt_new(NSMutableDictionary);
    navBarDateStringCache = self->_navBarDateStringCache;
    self->_navBarDateStringCache = v9;

  }
  v11 = objc_opt_new(NavBarDateCacheKey);
  if (v6)
    v12 = (uint64_t)objc_msgSend(v8, "month");
  else
    v12 = -1;
  -[NavBarDateCacheKey setMonth:](v11, "setMonth:", v12);
  if (v5)
    v13 = (uint64_t)objc_msgSend(v8, "year");
  else
    v13 = -1;
  -[NavBarDateCacheKey setYear:](v11, "setYear:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  v16 = paletteTitleFont(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NavBarDateCacheKey setFont:](v11, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_navBarDateStringCache, "objectForKeyedSubscript:", v11));
  if (!v18)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _navBarDateStringFromDate:includingMonth:includingYear:format:](self, "_navBarDateStringFromDate:includingMonth:includingYear:format:", v8, v6, v5, 0));
    if (!v18)
    {
      -[RootNavigationController _dateLabelMaxWidth](self, "_dateLabelMaxWidth");
      v20 = v19;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = objc_msgSend(&off_1001BC868, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v21)
      {
        v22 = v21;
        v18 = 0;
        v23 = *(_QWORD *)v28;
        while (2)
        {
          v24 = 0;
          v25 = v18;
          do
          {
            if (*(_QWORD *)v28 != v23)
              objc_enumerationMutation(&off_1001BC868);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _navBarDateStringFromDate:includingMonth:includingYear:format:](self, "_navBarDateStringFromDate:includingMonth:includingYear:format:", v8, v6, v5, objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v24), "integerValue")));

            objc_msgSend(v18, "size");
            if (v26 < v20)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_navBarDateStringCache, "setObject:forKeyedSubscript:", v18, v11);
              goto LABEL_22;
            }
            v24 = (char *)v24 + 1;
            v25 = v18;
          }
          while (v22 != v24);
          v22 = objc_msgSend(&off_1001BC868, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v22)
            continue;
          break;
        }
      }
      else
      {
        v18 = 0;
      }
    }
  }
LABEL_22:
  -[RootNavigationController _setCurrentDateLabelString:](self, "_setCurrentDateLabelString:", v18);

}

- (id)_navBarDateStringFromDate:(id)a3 includingMonth:(BOOL)a4 includingYear:(BOOL)a5 format:(int64_t)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int IsThisYear;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v54;
  uint8_t buf[4];
  const char *v56;

  v8 = a4;
  v10 = a3;
  if (v10)
  {
    if (v8 && !a5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
      v13 = paletteTitleFont(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (a6 == 2)
      {
        v40 = CUIKStringVeryShortAbbreviationForMonth(objc_msgSend(v10, "month"));
        v16 = objc_claimAutoreleasedReturnValue(v40);
      }
      else if (a6 == 1)
      {
        v39 = CUIKStringAbbreviationForMonth(objc_msgSend(v10, "month"));
        v16 = objc_claimAutoreleasedReturnValue(v39);
      }
      else
      {
        if (a6)
        {
          v20 = 0;
          goto LABEL_22;
        }
        v15 = CUIKStringForMonthNumber(objc_msgSend(v10, "month"));
        v16 = objc_claimAutoreleasedReturnValue(v15);
      }
      v20 = (void *)v16;
LABEL_22:
      v18 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v20);
      objc_msgSend(v18, "addAttribute:value:range:", NSFontAttributeName, v14, 0, objc_msgSend(v18, "length"));
LABEL_33:

      v52 = objc_alloc_init((Class)NSMutableParagraphStyle);
      objc_msgSend(v52, "setLineBreakMode:", 2);
      objc_msgSend(v18, "addAttribute:value:range:", NSParagraphStyleAttributeName, v52, 0, objc_msgSend(v18, "length"));

      goto LABEL_34;
    }
    if (!v8)
    {
      v29 = (unint64_t)(a6 - 1) < 2;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _navBarStringYearFontForTraitCollection:useSmallerSize:bold:](self, "_navBarStringYearFontForTraitCollection:useSmallerSize:bold:", v30, v29, 1));

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      v32 = CUIKStringForYear();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v32);

      v18 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v14);
      objc_msgSend(v18, "addAttribute:value:range:", NSFontAttributeName, v20, 0, objc_msgSend(v18, "length"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      IsThisYear = CUIKNSDateIsThisYear();

      if (IsThisYear)
      {
        v37 = CalendarAppTintColor(v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        objc_msgSend(v18, "addAttribute:value:range:", NSForegroundColorAttributeName, v38, 0, objc_msgSend(v18, "length"));

      }
      goto LABEL_33;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _navBarStringYearFontForTraitCollection:useSmallerSize:bold:](self, "_navBarStringYearFontForTraitCollection:useSmallerSize:bold:", v19, 1, 0));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
    v23 = paletteTitleFont(v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (a6 == 2)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      v42 = CUIKVeryShortStringForMonthYear();
      v26 = (void *)objc_claimAutoreleasedReturnValue(v42);

      v43 = CUIKStringVeryShortAbbreviationForMonth(objc_msgSend(v10, "month"));
      v28 = objc_claimAutoreleasedReturnValue(v43);
    }
    else if (a6 == 1)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      v45 = CUIKShortStringForMonthYear();
      v26 = (void *)objc_claimAutoreleasedReturnValue(v45);

      v46 = CUIKStringAbbreviationForMonth(objc_msgSend(v10, "month"));
      v28 = objc_claimAutoreleasedReturnValue(v46);
    }
    else
    {
      if (a6)
      {
        v47 = 0;
        v26 = 0;
        goto LABEL_27;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      v25 = CUIKStringForMonthYear(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

      v27 = CUIKStringForMonthNumber(objc_msgSend(v10, "month"));
      v28 = objc_claimAutoreleasedReturnValue(v27);
    }
    v47 = (void *)v28;
LABEL_27:
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lowercaseString"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));
    v50 = objc_msgSend(v49, "rangeOfString:", v48);
    v54 = v51;
    if (v26)
      v18 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v26);
    else
      v18 = 0;
    objc_msgSend(v18, "addAttribute:value:range:", NSFontAttributeName, v20, 0, objc_msgSend(v18, "length"));
    if (v50 != (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v18, "addAttribute:value:range:", NSFontAttributeName, v14, v50, v54);

    goto LABEL_33;
  }
  v17 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[RootNavigationController _navBarDateStringFromDate:includingMonth:includingYear:format:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s called with nil date", buf, 0xCu);
  }
  v18 = 0;
LABEL_34:

  return v18;
}

- (void)_updateDateLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UILabel frame](self->_currentDateLabel, "frame");
  v4 = v3;
  v6 = v5;
  -[RootNavigationController _dateLabelMaxWidth](self, "_dateLabelMaxWidth");
  -[UILabel setFrame:](self->_currentDateLabel, "setFrame:", v4, v6, v7, 38.0);
}

- (void)_updateLeftFixedSpaceBarButtonItemWidthWithViewController:(id)a3 targetWindowSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  if ((objc_opt_respondsToSelector(v13, "leftBarButtonBlankFixedSpaceWidth") & 1) != 0)
  {
    -[RootNavigationController _createLeftFixedSpaceBarItemIfNeeded](self, "_createLeftFixedSpaceBarItemIfNeeded");
    objc_msgSend(v13, "leftBarButtonBlankFixedSpaceWidth");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
    EKUILayoutMarginsForFullscreenLayoutRectWithSize(v9, width, height);
    -[UIBarButtonItem setWidth:](self->_leftFixedSpaceBarItem, "setWidth:", v12 + CalRoundToScreenScale(v10, v11, v8));

  }
  else
  {
    -[UIBarButtonItem setWidth:](self->_leftFixedSpaceBarItem, "setWidth:", 0.0);
  }

}

- (void)_setCurrentDateLabelString:(id)a3
{
  id *p_currentDateLabelString;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  p_currentDateLabelString = (id *)&self->_currentDateLabelString;
  v8 = a3;
  if ((objc_msgSend(*p_currentDateLabelString, "isEqualToAttributedString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentDateLabelString, a3);
    v6 = *p_currentDateLabelString;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dateString](self->_paletteView, "dateString"));
    LOBYTE(v6) = objc_msgSend(v6, "isEqualToAttributedString:", v7);

    if ((v6 & 1) == 0)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000A60D8;
      v9[3] = &unk_1001B2538;
      v9[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
    }
  }

}

- (double)_dateLabelMaxWidth
{
  void *v3;
  double MidX;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v17);
  -[RootNavigationController _viewSwitcherSegmentWidth](self, "_viewSwitcherSegmentWidth");
  v6 = MidX + v5 * -0.5 * (double)-[RootNavigationController _viewSwitcherNumSegments](self, "_viewSwitcherNumSegments");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  objc_msgSend(v8, "bounds");
  -[RootNavigationController _updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:](self, "_updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:", v7, v9, v10);

  -[UIBarButtonItem width](self->_leftFixedSpaceBarItem, "width");
  v12 = v6 + v11 * -1.5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self, "view"));
  objc_msgSend(v13, "layoutMargins");
  v15 = v12 + v14 * -2.0;

  return v15;
}

- (id)_navBarStringYearFontForTraitCollection:(id)a3 useSmallerSize:(BOOL)a4 bold:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  const UIFontTextStyle *v13;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    v10 = paletteTitleFont(v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  else
  {
    v12 = objc_msgSend(v7, "userInterfaceIdiom");

    v13 = &UIFontTextStyleTitle2;
    if (v12)
      v13 = &UIFontTextStyleLargeTitle;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", *v13, UIContentSizeCategoryMedium));
  }
  return v11;
}

- (unint64_t)_viewSwitcherIndexRepresentingViewType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 5)
    return 0;
  else
    return qword_1001A1700[a3 + 1];
}

- (int64_t)_viewTypeRepresentedByViewSwitcherIndex:(unint64_t)a3
{
  if (a3 > 4)
    return -1;
  else
    return qword_1001A1730[a3];
}

- (void)_viewSwitcherSelectedValueChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _QWORD v8[6];

  v4 = a3;
  v5 = -[RootNavigationController _viewTypeRepresentedByViewSwitcherIndex:](self, "_viewTypeRepresentedByViewSwitcherIndex:", objc_msgSend(v4, "selectedSegmentIndex"));
  if (v5 != (void *)-[RootNavigationController currentViewType](self, "currentViewType"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A63A4;
    v8[3] = &unk_1001B2838;
    v8[4] = self;
    v8[5] = v5;
    v7 = objc_msgSend(v6, "performModalDialogsIfNeededWithContinue:", v8);

    if (v7)
      objc_msgSend(v4, "setSelectedSegmentIndex:", -[RootNavigationController _viewSwitcherIndexRepresentingViewType:](self, "_viewSwitcherIndexRepresentingViewType:", -[RootNavigationController currentViewType](self, "currentViewType")));
  }

}

- (void)_configureViewSwitcherShowingViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self, "viewSwitcher", a3));
  objc_msgSend(v4, "setSelectedSegmentIndex:", -[RootNavigationController _viewSwitcherIndexRepresentingViewType:](self, "_viewSwitcherIndexRepresentingViewType:", -[RootNavigationController currentViewType](self, "currentViewType")));

}

- (BOOL)_shouldShowListViewInModeSwitcher
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char IsRegularInViewHierarchy;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  if (objc_msgSend(v3, "showExperimentalUI"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
    if (EKUICurrentHeightSizeClassIsRegular())
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self, "window"));
      IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5, v6);

    }
    else
    {
      IsRegularInViewHierarchy = 0;
    }

  }
  else
  {
    IsRegularInViewHierarchy = 0;
  }

  return IsRegularInViewHierarchy;
}

- (id)_viewSwitcherLabelStrings
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Day"), &stru_1001B67C0, 0));
  v14[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Week"), &stru_1001B67C0, 0));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Month"), &stru_1001B67C0, 0));
  v14[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Year"), &stru_1001B67C0, 0));
  v14[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));

  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v10);
  if (-[RootNavigationController _shouldShowListViewInModeSwitcher](self, "_shouldShowListViewInModeSwitcher"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("List"), &stru_1001B67C0, 0));
    objc_msgSend(v11, "addObject:", v12);

  }
  return v11;
}

- (UISegmentedControl)viewSwitcher
{
  UISegmentedControl *viewSwitcherSegmentedControl;

  viewSwitcherSegmentedControl = self->_viewSwitcherSegmentedControl;
  if (viewSwitcherSegmentedControl)
    return viewSwitcherSegmentedControl;
  else
    return (UISegmentedControl *)(id)objc_claimAutoreleasedReturnValue(-[RootNavigationController _viewSwitcherSegmentedControl](self, "_viewSwitcherSegmentedControl"));
}

- (id)_viewSwitcherSegmentedControl
{
  UISegmentedControl *viewSwitcherSegmentedControl;
  void *v4;
  UISegmentedControl *v5;
  UISegmentedControl *v6;
  UISegmentedControl *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  viewSwitcherSegmentedControl = self->_viewSwitcherSegmentedControl;
  if (!viewSwitcherSegmentedControl)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _viewSwitcherLabelStrings](self, "_viewSwitcherLabelStrings"));
    v5 = (UISegmentedControl *)objc_msgSend(objc_alloc((Class)UISegmentedControl), "initWithItems:", v4);
    v6 = self->_viewSwitcherSegmentedControl;
    self->_viewSwitcherSegmentedControl = v5;

    v7 = self->_viewSwitcherSegmentedControl;
    v10 = CalendarAppTintColor(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[UISegmentedControl setTintColor:](v7, "setTintColor:", v11);

    -[UISegmentedControl setApportionsSegmentWidthsByContent:](self->_viewSwitcherSegmentedControl, "setApportionsSegmentWidthsByContent:", 1);
    -[UISegmentedControl setSpringLoaded:](self->_viewSwitcherSegmentedControl, "setSpringLoaded:", 1);
    -[UISegmentedControl setAccessibilityIdentifier:](self->_viewSwitcherSegmentedControl, "setAccessibilityIdentifier:", CFSTR("views-switcher"));
    -[UISegmentedControl addTarget:action:forControlEvents:](self->_viewSwitcherSegmentedControl, "addTarget:action:forControlEvents:", self, "_viewSwitcherSelectedValueChanged:", 4096);

    viewSwitcherSegmentedControl = self->_viewSwitcherSegmentedControl;
  }
  -[RootNavigationController _setSegmentWidthsForViewSwitcher:](self, "_setSegmentWidthsForViewSwitcher:", viewSwitcherSegmentedControl);
  -[RootNavigationController _updateViewSwitcherFont](self, "_updateViewSwitcherFont");
  -[UISegmentedControl setSelectedSegmentIndex:](self->_viewSwitcherSegmentedControl, "setSelectedSegmentIndex:", -[RootNavigationController _viewSwitcherIndexRepresentingViewType:](self, "_viewSwitcherIndexRepresentingViewType:", -[RootNavigationController currentViewType](self, "currentViewType")));
  return self->_viewSwitcherSegmentedControl;
}

- (id)_switcherFontOfSize:(double)a3 isSemibold:(BOOL)a4
{
  void *v4;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, UIFontWeightSemibold));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3));
  return v4;
}

- (double)_viewSwitcherSegmentWidth
{
  void *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0x4052C00000000000;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _viewSwitcherLabelStrings](self, "_viewSwitcherLabelStrings"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A690C;
  v6[3] = &unk_1001B45A8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)_viewSwitcherNumSegments
{
  if (-[RootNavigationController _shouldShowListViewInModeSwitcher](self, "_shouldShowListViewInModeSwitcher"))
    return 5;
  else
    return 4;
}

- (void)_setSegmentWidthsForViewSwitcher:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  uint64_t i;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[RootNavigationController _viewSwitcherNumSegments](self, "_viewSwitcherNumSegments");
    -[RootNavigationController _viewSwitcherSegmentWidth](self, "_viewSwitcherSegmentWidth");
    v4 = v9;
    if (v5)
    {
      v7 = v6;
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v9, "setWidth:forSegmentAtIndex:", i, v7);
        v4 = v9;
      }
    }
  }

}

- (void)_updateViewSwitcherFont
{
  void *v3;
  NSString *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[7];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  NSAttributedStringKey v22;
  void *v23;
  NSAttributedStringKey v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  v5 = 17.0;
  if (UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraLarge) != NSOrderedDescending)
  {
    v5 = 15.0;
    if (UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraLarge) != NSOrderedDescending)
    {
      if (UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryLarge) == NSOrderedDescending)
        v5 = 14.0;
      else
        v5 = 13.0;
    }
  }
  -[RootNavigationController _viewSwitcherSegmentWidth](self, "_viewSwitcherSegmentWidth");
  v7 = v6;
  do
  {
    v8 = v5;
    if (v5 <= 13.0)
      break;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _viewSwitcherLabelStrings](self, "_viewSwitcherLabelStrings"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A6D70;
    v17[3] = &unk_1001B45D0;
    *(double *)&v17[6] = v5;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);

    v10 = v19[3];
    v5 = v5 + -1.0;
    _Block_object_dispose(&v18, 8);
  }
  while (v10 > v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self, "viewSwitcher"));
  v24 = NSFontAttributeName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _switcherFontOfSize:isSemibold:](self, "_switcherFontOfSize:isSemibold:", 0, v8));
  v25 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v11, "setTitleTextAttributes:forState:", v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self, "viewSwitcher"));
  v22 = NSFontAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _switcherFontOfSize:isSemibold:](self, "_switcherFontOfSize:isSemibold:", 1, v8));
  v23 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v14, "setTitleTextAttributes:forState:", v16, 4);

}

- (void)handleURL:(id)a3 context:(id)a4
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
  void *v19;
  void *v20;
  CUIKCalendarModel *model;
  void *v22;
  id v23;
  RootNavigationController *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  char *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  int64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  RootNavigationController *v67;
  _QWORD v68[5];
  id v69;
  uint8_t buf[4];
  id v71;

  v6 = a3;
  v7 = a4;
  v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Preparing to handle URL: [%@]", buf, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResultIdentifier"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResultIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));

  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v9, "isEqualToString:", _EKEventURLScheme))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventStore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_eventWithURI:checkValid:", v6, 1));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendar"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "source"));
      objc_msgSend(v10, "updateSourceForSelectedIdentity:selectedCalendars:", v17, 0);

      -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0);
      if (objc_msgSend(v15, "allowsParticipationStatusModifications")
        && (objc_msgSend(v15, "participationStatus") == (id)1 || !objc_msgSend(v15, "participationStatus")))
      {
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_1000A764C;
        v68[3] = &unk_1001B26A0;
        v68[4] = self;
        v69 = v15;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v68);

      }
      else
      {
        -[RootNavigationController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v15, 0, 1, v7);
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("calinvite")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceSpecifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventStore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_eventWithURI:checkValid:", v15, 1));

    if (v20)
    {
      model = self->_model;
      v63 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "calendar"));
      v60 = v15;
      v23 = v6;
      v24 = self;
      v25 = v9;
      v26 = v13;
      v27 = v10;
      v28 = v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "source"));
      -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](model, "updateSourceForSelectedIdentity:selectedCalendars:", v29, 0);

      v7 = v28;
      v10 = v27;
      v13 = v26;
      v9 = v25;
      self = v24;
      v6 = v23;
      v15 = v60;

      v11 = v63;
      -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0);
      -[RootNavigationController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v20, 0, 1, v7);
    }

    goto LABEL_24;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("calinvitelist"))
    && objc_msgSend(v10, "allEventNotificationsCount"))
  {
    objc_msgSend(v10, "setSelectedOccurrence:", 0);
    v30 = -[RootNavigationController showInboxAnimated:](self, "showInboxAnimated:", 0);
LABEL_25:
    v31 = 0;
    v32 = 0;
    goto LABEL_26;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("calsubcal")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("webcal")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowRootViewController sanitizeCalSubCal:](MainWindowRootViewController, "sanitizeCalSubCal:", v6));
    if (v15)
      -[RootNavigationController _showAddSubscribedCalendarWithURL:](self, "_showAddSubscribedCalendarWithURL:", v15);
    goto LABEL_24;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("calshow")))
    goto LABEL_25;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  if (!objc_msgSend(v33, "isEqual:", CFSTR("familyCalendar")))
  {
    v64 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceSpecifier"));
    *(_QWORD *)&v36 = objc_opt_class(self).n128_u64[0];
    if (objc_msgSend(v37, "_diagnosticsAvailable", v36)
      && objc_msgSend(v35, "rangeOfString:", CFSTR("?calendardiagnostics=reporttraveladvisoryproblem")) == (id)0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v35, "rangeOfString:", CFSTR("?calendardiagnostics=reportproblem")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[RootNavigationController _showDebugReportProblemViewController](self, "_showDebugReportProblemViewController");
      v31 = 0;
      v34 = v35;
      v32 = 0;
      goto LABEL_58;
    }
    v58 = v33;
    v38 = (char *)objc_msgSend(v35, "rangeOfString:", CFSTR("?eventid="));
    v59 = v35;
    if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v40 = objc_msgSend(v35, "rangeOfString:", CFSTR("?contactid="));
      if (v40 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v32 = 0;
        goto LABEL_49;
      }
      v45 = v40;
      v46 = v41;
      v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringToIndex:", v40));
      v47 = (unint64_t)v45 + v46;
      if ((unint64_t)objc_msgSend(v35, "length") <= v47)
        v32 = 0;
      else
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringFromIndex:", v47));
    }
    else
    {
      v42 = v38;
      v43 = v39;
      v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringToIndex:", v38));
      if (&v42[v43] >= objc_msgSend(v35, "length"))
      {
        v32 = 0;
      }
      else
      {
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringFromIndex:"));

        v32 = 0;
        v13 = (void *)v44;
      }
      v11 = v64;
    }
    v48 = (id)v61;
    if (v61)
    {
LABEL_50:
      v62 = v48;
      if (objc_msgSend(v48, "length"))
      {
        v57 = v7;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(int)objc_msgSend(v48, "intValue")));
        v49 = -[RootNavigationController currentViewType](self, "currentViewType");
        if (v49 == -1)
        {
          if (EKUIShouldSaveStateInPreferences(-1))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "lastViewMode"));
            v49 = (int64_t)objc_msgSend(v51, "integerValue");

          }
          else
          {
            v49 = -1;
          }
        }
        -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0, v49);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "timeZone"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v31, v54));

        v55 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", v56, v52);
        -[RootNavigationController showDate:andTime:animated:](self, "showDate:andTime:animated:", v52, 1, 0);
        v7 = v57;
        v11 = v64;
      }
      else
      {
        v31 = 0;
        v52 = v13;
        v13 = 0;
      }

      v33 = v58;
      v34 = v59;
      goto LABEL_58;
    }
LABEL_49:
    v48 = v59;
    goto LABEL_50;
  }
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1000A7694;
  v65[3] = &unk_1001B4640;
  v66 = v10;
  v67 = self;
  -[RootNavigationController showCalendarsAnimated:completion:](self, "showCalendarsAnimated:completion:", 1, v65);
  v31 = 0;
  v32 = 0;
  v34 = v66;
LABEL_58:

LABEL_26:
  if (objc_msgSend(v13, "length"))
  {
    -[RootNavigationController showEventWithIdentifier:isSearchResult:date:context:](self, "showEventWithIdentifier:isSearchResult:date:context:", v13, v11 != 0, v31, v7);
  }
  else if (objc_msgSend(v32, "length"))
  {
    -[RootNavigationController showContactWithIdentifier:](self, "showContactWithIdentifier:", v32);
  }

}

- (void)showEventWithIdentifier:(id)a3 isSearchResult:(BOOL)a4 date:(id)a5 context:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  CUIKCalendarModel *model;
  void *v19;
  void *v20;
  CUIKCalendarModel *v21;
  void *v22;
  void *v23;
  CUIKCalendarModel *v24;
  void *v25;
  void *v26;
  id v27;

  v8 = a4;
  v27 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v27, "length"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsSeparatedByString:", CFSTR("_")));
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      v14 = (id)kCADMainDatabaseID;
      v16 = objc_msgSend(v27, "intValue");
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
      v14 = objc_msgSend(v13, "intValue");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
      v16 = objc_msgSend(v15, "intValue");

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 2, v16, v14));
    if ((int)v16 < 1 || (v14 & 0x80000000) != 0)
      goto LABEL_13;
    model = self->_model;
    if (!v10 || v8)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel closestOccurrenceToTomorrowForEventObjectID:](model, "closestOccurrenceToTomorrowForEventObjectID:", v17));
      if (!v20)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventForObjectID:occurrenceDate:", v17, v10));

      if (!v20)
        goto LABEL_13;
    }
    v21 = self->_model;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "calendar"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "source"));
    -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](v21, "updateSourceForSelectedIdentity:selectedCalendars:", v23, 0);

    v24 = self->_model;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "calendar"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectID"));
    -[CUIKCalendarModel ensureCalendarVisibleWithId:](v24, "ensureCalendarVisibleWithId:", v26);

    -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0);
    -[RootNavigationController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v20, 0, 1, v11);

    goto LABEL_13;
  }
LABEL_14:

}

+ (BOOL)_diagnosticsAvailable
{
  if (qword_1001F6288 != -1)
    dispatch_once(&qword_1001F6288, &stru_1001B4660);
  return byte_1001F6280;
}

- (void)_showDebugReportProblemViewController
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController reportProblemNavigationController](self, "reportProblemNavigationController"));

  if (!v3)
  {
    objc_opt_class(CalendarDebugReportProblemViewController);
    if (v4)
    {
      v8 = objc_msgSend(objc_alloc((Class)CalendarDebugReportProblemViewController), "initWithStyle:", 2);
      objc_msgSend(v8, "setReportProblemDelegate:", self);
      v5 = objc_alloc_init((Class)UINavigationController);
      -[RootNavigationController setReportProblemNavigationController:](self, "setReportProblemNavigationController:", v5);
      objc_msgSend(v5, "pushViewController:animated:", v8, 0);
      v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelPressedWhileInReportProblemView");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
      objc_msgSend(v7, "setRightBarButtonItem:", v6);

      -[RootNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    }
  }
}

- (void)_showAddSubscribedCalendarWithURL:(id)a3
{
  id v3;
  _QWORD v4[4];
  RootNavigationController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A7B78;
  v4[3] = &unk_1001B2F58;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](v5, "_dismissPresentedViewControllerAnimated:completion:", 0, v4);

}

- (void)_dismissReportProblemController
{
  -[RootNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[RootNavigationController setReportProblemNavigationController:](self, "setReportProblemNavigationController:", 0);
}

- (void)_cancelPressedWhileInReportProblemView
{
  -[RootNavigationController _dismissReportProblemController](self, "_dismissReportProblemController");
}

- (void)reportProblemViewControllerDidFinish:(id)a3
{
  -[RootNavigationController _dismissReportProblemController](self, "_dismissReportProblemController", a3);
}

- (id)resetToYearView
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  __int128 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  uint8_t buf[4];
  void *v23;

  v3 = 0;
  if (-[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
    objc_opt_class(YearViewContainerViewController);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);

    if ((isKindOfClass & 1) == 0)
    {
      *(_QWORD *)&v7 = 138412290;
      v21 = v7;
      do
      {
        v8 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          v9 = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
          *(_DWORD *)buf = v21;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Popping top view controller: [%@].", buf, 0xCu);

        }
        v11 = -[RootNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topViewController](self, "topViewController"));
        objc_opt_class(YearViewContainerViewController);
        v14 = objc_opt_isKindOfClass(v12, v13);

      }
      while ((v14 & 1) == 0);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentChildViewController"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedDate"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "date"));
    objc_msgSend(v3, "showDate:animated:", v19, 0);

  }
  return v3;
}

- (id)resetToMonthView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToYearView](self, "resetToYearView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", 1, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)resetToMonthViewSplit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToMonthView](self, "resetToMonthView"));
  if (v5)
  {
    objc_opt_class(CompactWidthMonthViewController);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v9 = (uint64_t)objc_msgSend(v8, "monthViewScaleSize");

      if (v3)
      {
        v9 = 1;
      }
      else if (v9 == 3)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
        v9 = (uint64_t)objc_msgSend(v10, "monthViewEventScaleSize");

      }
      objc_msgSend(v7, "animateToMonthWeekSize:divided:", v9, v3);
      -[RootNavigationController updateDividedMonthBarButtonItem](self, "updateDividedMonthBarButtonItem");

    }
    v11 = v5;
  }

  return v5;
}

- (id)resetToDayView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToMonthView](self, "resetToMonthView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v5 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", 3, v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentChildViewController"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)resetToWeekView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToYearView](self, "resetToYearView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v5 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", 2, v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewControllers](self, "viewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentChildViewController"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_topPresentedController
{
  RootNavigationController *v2;
  void *v3;
  RootNavigationController *v4;
  void *v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](v2, "presentedViewController"));

  if (v3)
  {
    do
    {
      v4 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](v2, "presentedViewController"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](v4, "presentedViewController"));
      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (BOOL)shouldHandleCanPerformActionForSelector:(SEL)a3
{
  BOOL v5;

  v5 = -[RootNavigationController _willKeyCommandChangeSelectedDate:](self, "_willKeyCommandChangeSelectedDate:")
    || -[RootNavigationController _willKeyCommandChangeSelectedEvent:](self, "_willKeyCommandChangeSelectedEvent:", a3);
  if ("handleDayKeyCommand" == a3
    || "handleWeekKeyCommand" == a3
    || "handleMonthKeyCommand" == a3
    || "handleYearKeyCommand" == a3
    || "paste:" == a3
    || "copy:" == a3
    || "cut:" == a3
    || "handleDeleteKeyCommand" == a3
    || "handleDuplicateKeyCommand" == a3
    || "handleViewAvailabilityCommand" == a3)
  {
    return 1;
  }
  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RootNavigationController;
  v7 = -[RootNavigationController canPerformAction:withSender:](&v21, "canPerformAction:withSender:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v8, "horizontalSizeClass") != (id)1)
  {

    goto LABEL_14;
  }
  if ("handleDayKeyCommand" == a3 || "handleWeekKeyCommand" == a3 || "handleMonthKeyCommand" == a3)
  {

LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }

  if ("handleYearKeyCommand" == a3)
    goto LABEL_13;
LABEL_14:
  if (-[RootNavigationController _willKeyCommandChangeSelectedEvent:](self, "_willKeyCommandChangeSelectedEvent:", a3))
  {
    v11 = -[RootNavigationController _canChangeSelectedEvent](self, "_canChangeSelectedEvent");
  }
  else
  {
    if (!-[RootNavigationController _willKeyCommandChangeSelectedDate:](self, "_willKeyCommandChangeSelectedDate:", a3))
      goto LABEL_19;
    v11 = -[RootNavigationController _canChangeSelectedDate](self, "_canChangeSelectedDate");
  }
  v7 = v11;
LABEL_19:
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:withSender:](CUIKPasteboardUtilities, "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0)
  {
    if ("paste:" == a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
      v7 = objc_msgSend(v12, "canPerformPaste");

    }
    if ("copy:" == a3)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
      v18 = 1;
    }
    else
    {
      if ("cut:" != a3)
      {
        if ("handleViewAvailabilityCommand" != a3)
          goto LABEL_37;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
        if (objc_msgSend(v13, "count") == (id)1)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

          if (!v15 || !objc_msgSend(v15, "hasAttendees"))
          {
            v7 = 0;
            goto LABEL_36;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendar"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "source"));
          v7 = objc_msgSend(v16, "supportsAvailabilityRequests");

        }
        else
        {
          v15 = 0;
          v7 = 0;
        }

LABEL_36:
LABEL_37:
        if ("handleDeleteKeyCommand" == a3)
        {
          v19 = -[RootNavigationController _canPerformDeleteKeyCommand](self, "_canPerformDeleteKeyCommand");
        }
        else
        {
          if ("handleDuplicateKeyCommand" != a3)
            goto LABEL_42;
          v19 = -[RootNavigationController _canPerformDuplicateKeyCommand](self, "_canPerformDuplicateKeyCommand");
        }
        v7 = v19;
        goto LABEL_42;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
      v18 = 0;
    }
    v7 = +[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", v18, v17);

    goto LABEL_42;
  }
  v7 = 0;
LABEL_42:

  return v7;
}

- (BOOL)_willKeyCommandChangeSelectedEvent:(SEL)a3
{
  return "handleSelectNextEventCommand" == a3
      || "handleSelectPreviousEventCommand" == a3
      || "handleSelectNextOccurrenceCommand" == a3
      || "handleSelectPreviousOccurrenceCommand" == a3;
}

- (BOOL)_willKeyCommandChangeSelectedDate:(SEL)a3
{
  return "handleGoToNextDateComponentUnitCommand" == a3 || "handleGoToPreviousDateComponentUnitCommand" == a3;
}

- (BOOL)_canChangeSelectedEvent
{
  unsigned __int8 v3;
  void *v4;

  if (-[RootNavigationController _isTextEditingInProgress](self, "_isTextEditingInProgress")
    || -[RootNavigationController _isAddEventPopoverDisplayed](self, "_isAddEventPopoverDisplayed"))
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  if ((objc_opt_respondsToSelector(v4, "mainViewControllerCanChangeSelectedEvent") & 1) != 0)
    v3 = objc_msgSend(v4, "mainViewControllerCanChangeSelectedEvent");
  else
    v3 = 1;

  return v3;
}

- (BOOL)_canChangeSelectedDate
{
  unsigned __int8 v3;
  void *v4;

  if (-[RootNavigationController _isTextEditingInProgress](self, "_isTextEditingInProgress")
    || -[RootNavigationController _isAddEventPopoverDisplayed](self, "_isAddEventPopoverDisplayed"))
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  if ((objc_opt_respondsToSelector(v4, "mainViewControllerCanChangeSelectedDate") & 1) != 0)
    v3 = objc_msgSend(v4, "mainViewControllerCanChangeSelectedDate");
  else
    v3 = 1;

  return v3;
}

- (BOOL)_isTextEditingInProgress
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController firstResponder](self, "firstResponder"));
  v3 = objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___UIKeyInput);

  return v3;
}

- (BOOL)_isAddEventPopoverDisplayed
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  objc_opt_class(AddEventViewController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (void)handleTodayKeyCommand
{
  -[RootNavigationController selectTodayWithTrigger:animated:](self, "selectTodayWithTrigger:animated:", 0, 1);
}

- (void)_switchToView:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_time_t v11;
  _QWORD block[5];

  if (!self->_viewSwitchKeyCommandsTemporarilyLockedOut)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController traitCollection](self, "traitCollection"));
      v7 = objc_msgSend(v6, "horizontalSizeClass");

      if (v7 == (id)2 && -[RootNavigationController currentViewType](self, "currentViewType") != a3)
      {
        self->_viewSwitchKeyCommandsTemporarilyLockedOut = 1;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestDateForNewEvent"));

        v10 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](self, "pushCalendarViewControllerWithViewType:andDate:", a3, v9);
        v11 = dispatch_time(0, 250000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000A87F8;
        block[3] = &unk_1001B2538;
        block[4] = self;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
  }
}

- (void)handleDayKeyCommand
{
  -[RootNavigationController _switchToView:](self, "_switchToView:", 3);
}

- (void)handleWeekKeyCommand
{
  -[RootNavigationController _switchToView:](self, "_switchToView:", 2);
}

- (void)handleMonthKeyCommand
{
  -[RootNavigationController _switchToView:](self, "_switchToView:", 1);
}

- (void)handleYearKeyCommand
{
  -[RootNavigationController _switchToView:](self, "_switchToView:", 0);
}

- (void)handleRefreshKeyCommand
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DADConnection sharedConnection](DADConnection, "sharedConnection"));
  objc_msgSend(v3, "resetTimersAndWarnings");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventStore"));
  v5 = objc_msgSend(v4, "refreshEverythingIfNecessary:", 1);

}

- (void)handleGoToNextDateComponentUnitCommand
{
  -[RootNavigationController _showNextDateComponentUnitAnimated:](self, "_showNextDateComponentUnitAnimated:", 1);
}

- (void)handleGoToPreviousDateComponentUnitCommand
{
  -[RootNavigationController _showPreviousDateComponentUnitAnimated:](self, "_showPreviousDateComponentUnitAnimated:", 1);
}

- (void)handleSelectNextEventCommand
{
  -[RootNavigationController _selectNextEvent](self, "_selectNextEvent");
}

- (void)handleSelectPreviousEventCommand
{
  -[RootNavigationController _selectPreviousEvent](self, "_selectPreviousEvent");
}

- (void)handleSelectNextOccurrenceCommand
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v2, "showNextOccurrenceOfSelectableItem");

}

- (void)handleSelectPreviousOccurrenceCommand
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  objc_msgSend(v2, "showPreviousOccurrenceOfSelectableItem");

}

- (void)handleNewEventKeyCommand
{
  void ***v2;
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1000A89E0;
  v7 = &unk_1001B3F90;
  objc_copyWeak(&v8, &location);
  v2 = objc_retainBlock(&v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager", v4, v5, v6, v7));
  objc_msgSend(v3, "dismissTipDueToUserNavigationWithCompletionBlock:", v2);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleSearchKeyCommand
{
  void ***v2;
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1000A8B88;
  v7 = &unk_1001B3F90;
  objc_copyWeak(&v8, &location);
  v2 = objc_retainBlock(&v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager", v4, v5, v6, v7));
  objc_msgSend(v3, "dismissTipDueToUserNavigationWithCompletionBlock:", v2);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleCloseKeyCommand
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  objc_opt_class(UISearchController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentChildViewController"));
      v10 = objc_opt_respondsToSelector(v9, "handleCloseKeyCommand");

      if ((v10 & 1) != 0)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentChildViewController"));
        objc_msgSend(v11, "performSelector:", "handleCloseKeyCommand");

      }
    }
  }
}

- (void)handleDismissSplashScreenKeyCommand
{
  uint64_t v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self, "presentedViewController"));
  objc_opt_class(SplashScreenViewController);
  if ((objc_opt_isKindOfClass(v3, v2) & 1) != 0)
    objc_msgSend(v3, "dismissSplashScreen");

}

- (void)handleViewAvailabilityCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController _topPresentedController](self, "_topPresentedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKUIAvailabilityViewController presentAvailabilityViewControllerForEvent:fromViewController:](EKUIAvailabilityViewController, "presentAvailabilityViewControllerForEvent:fromViewController:", v5, v3));

  objc_initWeak(&location, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A8EDC;
  v7[3] = &unk_1001B4688;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v6, "setSaveBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (BOOL)_canPerformDeleteKeyCommand
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
    if (+[EKUIContextMenuActions eventsAllDeletable:](EKUIContextMenuActions, "eventsAllDeletable:", v4))v5 = -[RootNavigationController allSelectedEventsIndividuallyRepresented](self, "allSelectedEventsIndividuallyRepresented");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)handleDeleteKeyCommand
{
  void *v3;
  id v4;

  if (-[RootNavigationController _canPerformDeleteKeyCommand](self, "_canPerformDeleteKeyCommand"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController _topPresentedController](self, "_topPresentedController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
    +[EKUIContextMenuActions deleteEvents:presentationController:](EKUIContextMenuActions, "deleteEvents:presentationController:", v3, v4);

  }
}

- (BOOL)allSelectedEventsIndividuallyRepresented
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController topMainViewControllerContainer](self, "topMainViewControllerContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
  v5 = objc_msgSend(v3, "allEventsIndividuallyRepresented:", v4);

  return v5;
}

- (BOOL)_canPerformDuplicateKeyCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarToPasteTo"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
      if (+[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", 2, v6))v7 = -[RootNavigationController allSelectedEventsIndividuallyRepresented](self, "allSelectedEventsIndividuallyRepresented");
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleDuplicateKeyCommand
{
  void *v3;
  void *v4;
  id v5;

  if (-[RootNavigationController _canPerformDuplicateKeyCommand](self, "_canPerformDuplicateKeyCommand"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
    objc_msgSend(v5, "duplicateEvents:withDateMode:delegate:", v4, 3, self);

  }
}

- (void)paste:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager", a3));
  objc_msgSend(v4, "pasteEventsWithDateMode:delegate:", 0, self);

}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences", a3));
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    objc_msgSend(v4, "cutEvents:delegate:", v5, self);

  }
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences", a3));
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    objc_msgSend(v4, "copyEvents:delegate:", v5, self);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)pasteboardManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pasteboardManager"));

  return v3;
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController _topPresentedController](self, "_topPresentedController"));
  objc_msgSend(v5, "presentFromSource:", v6);

}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[RootNavigationController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", a4, 1, 3, 0);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[RootNavigationController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (void)displayIntegrationAlert:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  RootNavigationController *v7;
  RootNavigationController *v8;
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RootNavigationController parentViewController](self, "parentViewController"));
  v6 = (void *)v5;
  if (v5)
    v7 = (RootNavigationController *)v5;
  else
    v7 = self;
  v8 = v7;

  v9 = objc_msgSend(objc_alloc((Class)EKUIIntegrationAlertDisplayer), "initWithViewController:options:", v8, 0);
  objc_msgSend(v9, "displayIntegrationAlert:", v4);

}

- (id)undoManager
{
  return -[CUIKCalendarModel undoManager](self->_model, "undoManager");
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSDate)lastActiveTime
{
  return self->_lastActiveTime;
}

- (void)setLastActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastActiveTime, a3);
}

- (void)setViewSwitcher:(id)a3
{
  objc_storeStrong((id *)&self->_viewSwitcher, a3);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (ViewSwitcherLayoutHandler)viewSwitcherLayoutHandler
{
  return (ViewSwitcherLayoutHandler *)objc_loadWeakRetained((id *)&self->_viewSwitcherLayoutHandler);
}

- (void)setPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteView, a3);
}

- (BOOL)isTransitioningTraitCollection
{
  return self->_isTransitioningTraitCollection;
}

- (UINavigationController)reportProblemNavigationController
{
  return self->_reportProblemNavigationController;
}

- (void)setReportProblemNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_reportProblemNavigationController, a3);
}

- (UIBarButtonItem)dividedMonthToggleBarButtonItem
{
  return self->_dividedMonthToggleBarButtonItem;
}

- (void)setDividedMonthToggleBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_dividedMonthToggleBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividedMonthToggleBarButtonItem, 0);
  objc_storeStrong((id *)&self->_calendarsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_inboxBarButtonItem, 0);
  objc_storeStrong((id *)&self->_reportProblemNavigationController, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_todayBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_viewSwitcherLayoutHandler);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_viewSwitcher, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_cachedMeContact, 0);
  objc_storeStrong((id *)&self->_calendarsViewController, 0);
  objc_storeStrong((id *)&self->_calendarsButton, 0);
  objc_storeStrong((id *)&self->_tomorrowUA, 0);
  objc_storeStrong((id *)&self->_userActivityForEvent, 0);
  objc_storeStrong((id *)&self->_userActivityForDateInView, 0);
  objc_storeStrong((id *)&self->_navBarDateStringCache, 0);
  objc_storeStrong((id *)&self->_labelBarItem, 0);
  objc_storeStrong((id *)&self->_leftFixedSpaceBarItem, 0);
  objc_storeStrong((id *)&self->_currentDateLabel, 0);
  objc_storeStrong((id *)&self->_currentDateLabelString, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_viewSwitcherSegmentedControl, 0);
  objc_storeStrong((id *)&self->_listAction, 0);
  objc_storeStrong((id *)&self->_largeScaleAction, 0);
  objc_storeStrong((id *)&self->_minimalScaleAction, 0);
  objc_storeStrong((id *)&self->_compactScaleAction, 0);
  objc_storeStrong((id *)&self->_compactMonthMenu, 0);
  objc_storeStrong((id *)&self->_searchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addEventBarButtonItem, 0);
  objc_storeStrong((id *)&self->_listToggleBarButtonItem, 0);
}

@end
