@implementation LargeDayViewController

- (LargeDayViewController)initWithDay:(id)a3 model:(id)a4 window:(id)a5
{
  id v8;
  id v9;
  id v10;
  LargeDayViewController *v11;
  LargeDayViewController *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)LargeDayViewController;
  v11 = -[DayViewController initWithDay:model:window:](&v23, "initWithDay:model:window:", v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](v11, "dayView"));
    objc_msgSend(v13, "setGutterWidth:", 0.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v12, "_occurrenceViewDidEndSelection:", EKDayOccurrenceViewDidEndSelectionNotification, 0);

    objc_initWeak(&location, v12);
    *(_QWORD *)&v15 = objc_opt_class(UITraitUserInterfaceStyle).n128_u64[0];
    v24 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1, v15));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000CD8CC;
    v20[3] = &unk_1001B2418;
    objc_copyWeak(&v21, &location);
    v18 = -[LargeDayViewController registerForTraitChanges:withHandler:](v12, "registerForTraitChanges:withHandler:", v17, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[LargeDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
    {
      if (EKUIIsSizeExtended(width, height))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
        v12 = objc_msgSend(v11, "preservesSuperviewLayoutMargins");

        if ((v12 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
          objc_msgSend(v14, "setPreservesSuperviewLayoutMargins:", 1);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
          objc_msgSend(v16, "setNeedsLayout");

        }
      }
      v17.receiver = self;
      v17.super_class = (Class)LargeDayViewController;
      -[DayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, EKDayOccurrenceViewDidEndSelectionNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)LargeDayViewController;
  -[DayViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeDayViewController;
  -[DayViewController loadView](&v4, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v3, "setShouldAutoscrollAfterAppearance:", 0);

}

- (BOOL)_isTransitioningTraitCollection
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
  if ((objc_opt_respondsToSelector(v3, "isTransitioningTraitCollection") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
    v5 = objc_msgSend(v4, "performSelector:", "isTransitioningTraitCollection") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)modelSelectedEvents
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedOccurrences"));

  return (NSArray *)v3;
}

- (EKEvent)modelSelectedEvent
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedOccurrences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return (EKEvent *)v4;
}

- (void)setModelSelectedEvent:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedOccurrence"));

  if (v5 == v8)
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "isEqual:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v7, "setSelectedOccurrence:forceChange:", v8, v6);

  if (!v8)
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 0;

}

- (BOOL)_allEventsHaveSameAddressWithFirstArray:(id)a3 secondArray:(id)a4
{
  id v5;
  id v6;
  __CFSet *Mutable;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __CFSet *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  CFIndex Count;
  unsigned __int8 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v5 = a3;
  v6 = a4;
  Mutable = CFSetCreateMutable(0, 0, 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        CFSetAddValue(Mutable, *(const void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v13 = CFSetCreateMutable(0, 0, 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        CFSetAddValue(v13, *(const void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  Count = CFSetGetCount(Mutable);
  if (Count == CFSetGetCount(v13))
    v20 = -[__CFSet isEqual:](Mutable, "isEqual:", v13, (_QWORD)v22);
  else
    v20 = 0;
  CFRelease(Mutable);
  CFRelease(v13);

  return v20;
}

- (void)setModelSelectedEvents:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedOccurrences"));
  v6 = -[LargeDayViewController _allEventsHaveSameAddressWithFirstArray:secondArray:](self, "_allEventsHaveSameAddressWithFirstArray:secondArray:", v5, v13);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedOccurrences"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
    v7 = objc_msgSend(v10, "isEqualToSet:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v12, "setSelectedOccurrences:forceChange:", v13, v7);

  if (!v13)
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 0;

}

- (BOOL)selectedEventWasAutoSelected
{
  return *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3);
}

- (int)editorShowTransition
{
  return 6;
}

- (int)editorHideTransition
{
  return 6;
}

- (id)cellFactory
{
  return objc_opt_new(LargeDayNavigationViewCellFactory);
}

- (BOOL)showWeekdayLabel
{
  return 0;
}

- (BOOL)allowChangingDate
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v4 = objc_msgSend(v3, "willPresentDialogOnSave");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)LargeDayViewController;
  return -[DayViewController allowChangingDate](&v6, "allowChangingDate");
}

- (void)wasAllowedToChangeDate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  objc_msgSend(v2, "completeAndSaveWithContinueBlock:", 0);

}

- (void)wasBlockedFromChangingDate:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v5 = objc_msgSend(v4, "willPresentDialogOnSave");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
    objc_msgSend(v6, "completeAndSaveWithContinueBlock:", v7);

  }
}

- (void)isPinchingDayView
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "setReduceLayoutProcessingForAnimation:", 1);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDayView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dayContent"));
  objc_msgSend(v10, "layoutIfNeeded");

  -[LargeDayViewController _adjustSelectedOccurrences](self, "_adjustSelectedOccurrences");
}

- (void)finishedPinchingDayView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedOccurrences"));
  -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v4, 0, 1, 1);

  -[LargeDayViewController _adjustSelectedOccurrences](self, "_adjustSelectedOccurrences");
}

- (void)_adjustSelectedOccurrences
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedCopy"));
        objc_msgSend(v7, "frame");
        objc_msgSend(v8, "setFrame:");
        objc_msgSend(v7, "travelTimeSubviewHeightInPoints");
        objc_msgSend(v8, "setTravelTimeSubviewHeightInPoints:");
        objc_msgSend(v7, "bottomPinningProximity");
        objc_msgSend(v8, "setBottomPinningProximity:");
        objc_msgSend(v7, "topPinningProximity");
        objc_msgSend(v8, "setTopPinningProximity:");
        objc_msgSend(v8, "requestContentIfNeeded:completion:", 16, 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (BOOL)shouldModallyPresentFirstShownViewController
{
  return 0;
}

- (BOOL)_eventViewControllerForModelSelectedEventIsAlreadyShown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));

  if (objc_msgSend(v3, "count") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    if (v8 == v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      v9 = objc_msgSend(v5, "isEqual:", v10);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v13 = objc_msgSend(v11, "isEqualToSet:", v12);

  v14 = v3 && v9 | v13 && !self->_changingDate;
  return v14;
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  objc_super v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id location;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  void *v66;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));

  objc_opt_class(EKEventViewController);
  if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0 && v15 != v16)
  {
    v18 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "event"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
      *(_DWORD *)buf = 136315394;
      v64 = "-[LargeDayViewController showViewController:sender:animated:completion:]";
      v65 = 2112;
      v66 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: Asked to show a view controller for event %@. Clearing sidebar nav stack first.", buf, 0x16u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
      objc_opt_class(EKEventEditViewController);
      isKindOfClass = objc_opt_isKindOfClass(v23, v24);

    }
    else
    {
      isKindOfClass = 0;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    objc_msgSend(v26, "enqueueStackResetOperationDismissingPresentations:cancelOperations:completionBlock:", isKindOfClass & 1, 0, 0);

  }
  objc_opt_class(CNContactViewController);
  if ((objc_opt_isKindOfClass(v10, v27) & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    if (EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors())
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v30 = objc_msgSend(v29, "userInterfaceIdiom") == (id)1;

      if (!v30)
      {
        v31 = objc_msgSend(objc_alloc((Class)EKUIManagedNavigationController), "initWithRootViewController:", v10);
        objc_msgSend(v31, "setModalPresentationDelegate:", self);
        objc_msgSend(v31, "setForceCanBeDirectlyManagedToNo:", 1);
        objc_initWeak((id *)buf, v31);
        objc_initWeak(&location, self);
        v32 = objc_alloc((Class)UIBarButtonItem);
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_1000CEBE0;
        v59[3] = &unk_1001B4ED0;
        objc_copyWeak(&v60, &location);
        objc_copyWeak(&v61, (id *)buf);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1001B67C0, 0, 0, v59));
        v34 = objc_msgSend(v32, "initWithBarButtonSystemItem:primaryAction:", 0, v33);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
        objc_msgSend(v35, "setLeftBarButtonItem:", v34);

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
        objc_msgSend(v36, "presentAdaptiveModalViewController:animated:completion:", v31, 1, 0);

        objc_destroyWeak(&v61);
        objc_destroyWeak(&v60);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
    }
    else
    {

    }
  }
  objc_opt_class(EKExpandedReminderStackViewController);
  if ((objc_opt_isKindOfClass(v10, v37) & 1) != 0)
    objc_msgSend(v10, "setPreferModalPresentation:", 0);
  v38 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController _fallbackSizingContextWindow](self, "_fallbackSizingContextWindow"));
  v39 = v13 == 0;
  v31 = (id)v38;
  if (v38)
  {
    EKUIPushFallbackSizingContextWithViewHierarchy(v38);
    v58.receiver = self;
    v58.super_class = (Class)LargeDayViewController;
    -[MainViewController showViewController:sender:animated:completion:](&v58, "showViewController:sender:animated:completion:", v10, v11, v7, v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
    -[LargeDayViewController _splitViewNavigationController:willShowViewController:animated:completion:](self, "_splitViewNavigationController:willShowViewController:animated:completion:", v40, v10, v39, 0);

    EKUIPopFallbackSizingContextWithViewHierarchy(v31);
  }
  else
  {
    v58.receiver = self;
    v58.super_class = (Class)LargeDayViewController;
    -[MainViewController showViewController:sender:animated:completion:](&v58, "showViewController:sender:animated:completion:", v10, v11, v7, v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
    -[LargeDayViewController _splitViewNavigationController:willShowViewController:animated:completion:](self, "_splitViewNavigationController:willShowViewController:animated:completion:", v41, v10, v39, 0);

  }
  if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventOrIntegrationEditView))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    v43 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    if (!v43)
    {
      v44 = v10;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "event"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "selectedOccurrence"));
      v48 = v47 == v45;

      if (v48)
        goto LABEL_23;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      objc_msgSend(v49, "setSelectedOccurrence:", v45);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "selectedOccurrence"));
      v52 = v51 == v45;

      if (v52)
      {
LABEL_23:
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "draggingView"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "occurrence"));
        v56 = v55 == v45;

        if (!v56)
          -[LargeDayViewController _setUpGesturesAndModalMode](self, "_setUpGesturesAndModalMode");
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
      objc_msgSend(v57, "setCurrentEditor:", v44);

    }
  }
LABEL_26:

}

- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  int v36;
  const char *v37;
  __int16 v38;
  void *v39;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[LargeDayViewController _eventViewControllerForModelSelectedEventIsAlreadyShown](self, "_eventViewControllerForModelSelectedEventIsAlreadyShown")&& (objc_msgSend(v8, "isReminderIntegrationEvent") & 1) == 0)
  {
    v20 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
      v36 = 136315394;
      v37 = "-[LargeDayViewController showDetailViewControllerForEvent:context:animated:]";
      v38 = 2112;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Asked to show a view controller for event %@, but it is already on the managed navigation controller.", (uint8_t *)&v36, 0x16u);

    }
    v11 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:allowInlinePreview:previewInline:minimalMode:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:allowInlinePreview:previewInline:minimalMode:", v8, self, v10, 0, 0, 0));
    objc_opt_class(EKEventViewController);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      objc_msgSend(v11, "setIsLargeDayView:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));

    if (v14 != v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
        objc_opt_class(EKEventEditViewController);
        isKindOfClass = objc_opt_isKindOfClass(v17, v18);

      }
      else
      {
        isKindOfClass = 0;
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
      objc_msgSend(v24, "enqueueStackResetOperationDismissingPresentations:cancelOperations:completionBlock:", isKindOfClass & 1, 0, 0);

    }
    -[LargeDayViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v11, self, v5, 0);
    objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v34, "setAutoresizingMask:", 18);

  }
  return v11;
}

- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;

  v5 = a3;
  if (-[LargeDayViewController _eventViewControllerForModelSelectedEventIsAlreadyShown](self, "_eventViewControllerForModelSelectedEventIsAlreadyShown"))
  {
    v6 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      v27 = 136315394;
      v28 = "-[LargeDayViewController showDetailViewControllerForEvents:animated:]";
      v29 = 2112;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Asked to show a view controller for event %@, but it is already on the managed navigation controller.", (uint8_t *)&v27, 0x16u);

    }
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v5, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
      objc_opt_class(EKEventEditViewController);
      isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    }
    else
    {
      isKindOfClass = 0;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    objc_msgSend(v15, "enqueueStackResetOperationDismissingPresentations:cancelOperations:completionBlock:", isKindOfClass & 1, 0, 0);

    -[LargeDayViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v10, self, 0, 0);
    objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v25, "setAutoresizingMask:", 18);

  }
  return v10;
}

- (BOOL)dayViewControllerShouldEndGestureEditingOnTap:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  char v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
    v6 = objc_msgSend(v5, "willPresentDialogOnSave");

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)beganHorizontalDeceleration
{
  self->_userSelectedEmptySpace = 1;
}

- (void)endedHorizontalDeceleration
{
  self->_userSelectedEmptySpace = 0;
  if (self->_selectedEventWasAutoSelected)
  {
    self->_selectedEventWasAutoSelected = 0;
    -[LargeDayViewController _autoSelectEventWithAnimatedScroll:](self, "_autoSelectEventWithAnimatedScroll:", 1);
  }
}

- (void)asyncLoadAndLayoutCompleted
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

  -[LargeDayViewController _adjustSelectedOccurrences](self, "_adjustSelectedOccurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
        objc_msgSend(v9, "bringSubviewToFront:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)selectedCopyViewForOccurrenceView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _BYTE v27[128];

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000CF568;
  v20[3] = &unk_1001B4EF8;
  v22 = &v23;
  v6 = v4;
  v21 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);

  if (*((_BYTE *)v24 + 24))
  {
    v7 = 0;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "occurrence", (_QWORD)v16));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
          {
            v7 = v11;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  _Block_object_dispose(&v23, 8);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LargeDayViewController;
  -[DayViewController viewDidLoad](&v6, "viewDidLoad");
  -[LargeDayViewController _createSplitView](self, "_createSplitView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v3, "setAnimateAllDayAreaHeight:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v4, "setNotifyWhenTapOtherEventDuringDragging:", 1);

  -[LargeDayViewController _setUpCustomAppearances](self, "_setUpCustomAppearances");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
  objc_msgSend(v5, "setEventSpringLoadingEnabled:", 1);

}

- (void)_setUpCustomAppearances
{
  if (qword_1001F64A8 != -1)
    dispatch_once(&qword_1001F64A8, &stru_1001B4F18);
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  void *v2;
  _BOOL4 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v3 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v3)
    return 1;
  else
    return 6;
}

- (void)setupUIForTraitCollection:(id)a3
{
  uint64_t v4;
  id v5;

  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController _fallbackSizingContextWindow](self, "_fallbackSizingContextWindow", a3));
    v5 = (id)v4;
    if (v4)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy(v4);
      -[LargeDayViewController viewWillAppear:](self, "viewWillAppear:", 0);
      EKUIPopFallbackSizingContextWithViewHierarchy(v5);
    }
    else
    {
      -[LargeDayViewController viewWillAppear:](self, "viewWillAppear:", 0);
    }

  }
}

- (id)_fallbackSizingContextWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window")),
        v6,
        v5,
        v4))
  {
    v7 = 1;
  }
  else
  {
    v7 = EKUIHasFallbackSizingContext();
  }
  EKUIMultiwindowAssert(v7, CFSTR("Not part of view hierarchy"));
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6))
  {
    v20.receiver = self;
    v20.super_class = (Class)LargeDayViewController;
    -[DayViewController viewWillAppear:](&v20, "viewWillAppear:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
    if (!v4 || (v5 = *(uint64_t *)((char *)&self->_lastEventShowed + 2), v4, !v5))
      -[LargeDayViewController _configureSidebarConfigurationOfManagedNavigationController](self, "_configureSidebarConfigurationOfManagedNavigationController");
    -[LargeDayViewController _layoutDayArea](self, "_layoutDayArea");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setClipsToBounds:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStore"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "_eventStoreChanged:", EKEventStoreChangedNotification, v10);

    *(_DWORD *)((char *)&self->_dividerView + 2) = 2;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    v12 = EKUIIsExtended(v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
      v15 = objc_msgSend(v14, "preservesSuperviewLayoutMargins");

      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
        objc_msgSend(v17, "setPreservesSuperviewLayoutMargins:", 1);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
        objc_msgSend(v19, "setNeedsLayout");

      }
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v14.receiver = self;
  v14.super_class = (Class)LargeDayViewController;
  -[DayViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self, "day"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
  if (!-[LargeDayViewController _eventViewControllerForModelSelectedEventIsAlreadyShown](self, "_eventViewControllerForModelSelectedEventIsAlreadyShown")&& self->_userInteractedWithSplitviewPane)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
    v12 = v11;
    if (v11 && objc_msgSend(v11, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
      -[LargeDayViewController showEvents:animated:showMode:context:](self, "showEvents:animated:showMode:context:", v13, 0, 1, 0);

    }
    else
    {
      -[LargeDayViewController _autoSelectEventWithAnimatedScroll:](self, "_autoSelectEventWithAnimatedScroll:", 0);
    }

  }
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4) = 0;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6) = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));

  if (!v5)
    -[LargeDayViewController _teardownSidebarConfigurationOfManagedNavigationController](self, "_teardownSidebarConfigurationOfManagedNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
  objc_msgSend(v6, "removeObserver:name:object:", self, EKEventStoreChangedNotification, v8);

  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);
  v9.receiver = self;
  v9.super_class = (Class)LargeDayViewController;
  -[LargeDayViewController viewWillDisappear:](&v9, "viewWillDisappear:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeDayViewController;
  -[DayViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[LargeDayViewController _setModal:](self, "_setModal:", 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  -[DayViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController parentViewController](self, "parentViewController"));

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)LargeDayViewController;
    -[LargeDayViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v4, "sendSubviewToBack:", v6);

    v7 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController _fallbackSizingContextWindow](self, "_fallbackSizingContextWindow"));
    v8 = (void *)v7;
    if (v7)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy(v7);
      -[LargeDayViewController _layoutDayArea](self, "_layoutDayArea");
      EKUIPopFallbackSizingContextWithViewHierarchy(v8);
    }
    else
    {
      -[LargeDayViewController _layoutDayArea](self, "_layoutDayArea");
    }

  }
}

- (void)updateNavigationBarDisplayedDateString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayDate"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
      v12 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v8, v11));

      -[LargeDayViewController updateNavigationBarDisplayedDateStringWithDate:](self, "updateNavigationBarDisplayedDateStringWithDate:", v12);
    }
  }
}

- (void)updateNavigationBarDisplayedDateStringWithDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNavBarStringFromDate:includeMonth:includeYear:", v4, 1, 1);

}

- (Class)managedNavigationControllerType
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v4)
  {
    objc_opt_class(DeniesInternalPresentationEnqueueableManagedNavigationController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LargeDayViewController;
    v7 = -[MainViewController managedNavigationControllerType](&v9, "managedNavigationControllerType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return (Class)v6;
}

- (id)managedNavigationController
{
  UINavigationController *v3;
  objc_super v5;

  if ((-[LargeDayViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)

  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  v3 = -[MainViewController managedNavigationController](&v5, "managedNavigationController");
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)updatePalette:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "setWeekdayHeaderFillsHalfWidth:", 0);
  objc_msgSend(v4, "setWeekdayHeaderVisible:", 0);
  objc_msgSend(v4, "setTodayButtonVisible:", 1);
  objc_msgSend(v4, "setDateStringVisible:", 1);
  objc_msgSend(v4, "setDividerLineVisible:", 1);
  objc_msgSend(v4, "setFocusBannerPlacement:", 2);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
  objc_msgSend(v4, "setDayScrubberController:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v5, "setNeedsLayout");

  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));
  objc_msgSend(v8, "setPreferredHeight:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "_setBottomPalette:", v9);

}

- (BOOL)shouldAdaptEventViewControllers
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3)
    || *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4))
  {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
    v3 = v6 != 0;

  }
  return v3;
}

- (BOOL)shouldJournalMainViewControllerParent
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
  objc_opt_class(UINavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  objc_opt_class(CNContactViewController);
  v10 = objc_opt_isKindOfClass(v8, v9);

  return (v10 & 1) == 0;
}

- (BOOL)showEventDetailsWhenNewEventAdded
{
  return 1;
}

- (BOOL)eventViewControllerShowsInlinePreview
{
  return 0;
}

- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal
{
  LargeDayViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](v2, "managedNavigationController"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)requiresSelfAsEventEditorDelegate
{
  return 1;
}

- (void)navigateToNextSelectableItem
{
  -[LargeDayViewController _selectNextEventInForwardDirection:](self, "_selectNextEventInForwardDirection:", 1);
}

- (void)navigateToPreviousSelectableItem
{
  -[LargeDayViewController _selectNextEventInForwardDirection:](self, "_selectNextEventInForwardDirection:", 0);
}

- (void)_selectNextEventInForwardDirection:(BOOL)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDayView"));

  if (v13)
  {
    v6 = objc_alloc((Class)EKDayOccurrenceViewIterator);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allOccurrenceViews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
    v9 = objc_msgSend(v6, "initWithOccurrenceViews:selectedEvent:", v7, v8);

    if (a3)
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "next"));
    else
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previous"));
    v11 = (void *)v10;

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
      -[LargeDayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v12, 1, 1, 0);

    }
  }

}

- (void)showNextOccurrenceOfSelectableItem
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextOccurrence"));

  v4 = v5;
  if (v5)
  {
    -[LargeDayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, 0);
    v4 = v5;
  }

}

- (void)showPreviousOccurrenceOfSelectableItem
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousOccurrence"));

  v4 = v5;
  if (v5)
  {
    -[LargeDayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, 0);
    v4 = v5;
  }

}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeDayViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 1, a3);
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeDayViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 0, a3);
}

- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedDate"));

  if (v5)
    v8 = 1;
  else
    v8 = -1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateByAddingDays:", v8));
  -[DayViewController selectDate:animated:](self, "selectDate:animated:", v9, v4);

}

- (void)_configureSidebarConfigurationOfManagedNavigationController
{
  void *v3;
  LargeDayViewController *v4;
  void *v5;
  void *v6;
  LargeDayNavigationWrapperView *v7;
  void *v8;
  void *v9;
  EKEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (!*(EKEvent **)((char *)&self->_lastEventShowed + 2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    v4 = (LargeDayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));

    if (v4 != self)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
      -[LargeDayViewController addChildViewController:](self, "addChildViewController:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
      objc_msgSend(v6, "didMoveToParentViewController:", self);

    }
    v7 = [LargeDayNavigationWrapperView alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v10 = -[LargeDayNavigationWrapperView initWithNavigationView:](v7, "initWithNavigationView:", v9);
    v11 = *(EKEvent **)((char *)&self->_lastEventShowed + 2);
    *(EKEvent **)((char *)&self->_lastEventShowed + 2) = v10;

    objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "setClipsToBounds:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    objc_msgSend(v12, "addSubview:", *(EKEvent **)((char *)&self->_lastEventShowed + 2));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v13, "setDelegate:", self);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "traitOverrides"));
  objc_msgSend(v14, "setHorizontalSizeClass:", 1);

}

- (void)_teardownSidebarConfigurationOfManagedNavigationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[LargeDayViewController _dismissEditorAndSaveIfPossibleWhileChangingDate:animated:](self, "_dismissEditorAndSaveIfPossibleWhileChangingDate:animated:", 1, 0);
  -[LargeDayViewController _clearSplitViewNavigationController](self, "_clearSplitViewNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v3, "removeFromParentViewController");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v6, "setDelegate:", 0);

  objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "removeFromSuperview");
  v7 = *(EKEvent **)((char *)&self->_lastEventShowed + 2);
  *(EKEvent **)((char *)&self->_lastEventShowed + 2) = 0;

}

- (void)_createSplitView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  LargeDayNavigationWrapperView *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "setClipsToBounds:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  -[LargeDayViewController addChildViewController:](self, "addChildViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v6, "didMoveToParentViewController:", self);

  v7 = objc_opt_new(UIView);
  v8 = *(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2);
  *(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2) = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(*(id *)((char *)&self->_navigationWrapperView + 2), "setBackgroundColor:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", *(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2));

}

- (void)_resetSplitView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    objc_msgSend(v4, "setCurrentEditor:", 0);

  }
  -[LargeDayViewController _clearSplitViewNavigationController](self, "_clearSplitViewNavigationController");
}

- (void)_layoutDayArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[LargeDayViewController _setDayViewToSplitViewVisibleState](self, "_setDayViewToSplitViewVisibleState");
  -[LargeDayViewController _setSplitViewPosition](self, "_setSplitViewPosition");
  -[LargeDayViewController _layoutForSplitViews](self, "_layoutForSplitViews");
  -[LargeDayViewController _layOutSplitDividerFrame](self, "_layOutSplitDividerFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gestureController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "draggingView"));

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "gestureController"));
    objc_msgSend(v6, "updateDraggingOccurrenceForced:animated:", 0, 0);

  }
}

- (void)_setDayViewToSplitViewVisibleState
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[LargeDayViewController splitterSpace](self, "splitterSpace");
  v7 = v5 - v6;

  v10 = CalRoundToScreenScale(v8, v9, v7 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  objc_msgSend(v17, "setFrame:", 0.0, v14, v10, v16);

}

- (void)_layOutSplitDividerFrame
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  v3 = EKUIScaleFactor(self);
  v6 = CalRoundToScreenScale(v4, v5, 1.0 / v3);
  v7 = -[LargeDayViewController _dayViewWidthWhenSplit](self, "_dayViewWidthWhenSplit");
  v9 = v8;
  if ((CalInterfaceIsLeftToRight(v7) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    objc_msgSend(v10, "bounds");
    v9 = v11 - v9;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  objc_msgSend(v12, "bounds");
  v14 = v13;

  objc_msgSend(*(id *)((char *)&self->_navigationWrapperView + 2), "setFrame:", v9, 0.0, v6, v14);
}

- (void)_layoutForSplitViews
{
  -[LargeDayViewController _layoutDayViewPane](self, "_layoutDayViewPane");
  -[LargeDayViewController _layoutEventDetailsPane](self, "_layoutEventDetailsPane");
}

- (void)_layoutDayViewPane
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "frame");

  -[LargeDayViewController _dayViewWidthWhenSplit](self, "_dayViewWidthWhenSplit");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;

  v10 = 0.0;
  if ((CalInterfaceIsLeftToRight(v11) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    objc_msgSend(v12, "bounds");
    v10 = v13 - v6;

  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v14, "setFrame:gutterWidth:", v10, 0.0, v6, v9, 0.0);

}

- (void)_layoutEventDetailsPane
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  uint64_t v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  uint64_t IsLeftToRight;
  double v39;
  void *v40;
  id v41;
  CGRect v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = 0.0;
  if (CalInterfaceIsLeftToRight(v14))
  {
    v42.origin.x = v6;
    v42.origin.y = v8;
    v42.size.width = v10;
    v42.size.height = v12;
    MaxX = CGRectGetMaxX(v42);
    -[LargeDayViewController splitterSpace](self, "splitterSpace");
    v13 = MaxX + v16;
  }
  -[LargeDayViewController _splitViewWidth](self, "_splitViewWidth");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  objc_msgSend(v19, "bounds");
  v21 = v20;

  objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "setFrame:", v13, 0.0, v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    objc_msgSend(v24, "layoutMargins");
    v26 = v25;
    v28 = v27;

    -[LargeDayViewController detailsLeftInsetAdjustment](self, "detailsLeftInsetAdjustment");
    v30 = v29;
    -[LargeDayViewController rightSplitViewSideInset](self, "rightSplitViewSideInset");
    v32 = v30 + v31;
    -[LargeDayViewController detailsRightInsetAdjustment](self, "detailsRightInsetAdjustment");
    v34 = v33;
    v35 = -[LargeDayViewController rightSplitViewSideInset](self, "rightSplitViewSideInset");
    v37 = v34 + v36;
    IsLeftToRight = CalInterfaceIsLeftToRight(v35);
    if ((_DWORD)IsLeftToRight)
      v39 = v32;
    else
      v39 = v37;
    if (CalInterfaceIsLeftToRight(IsLeftToRight))
      v32 = v37;
    v41 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "view"));
    objc_msgSend(v40, "setLayoutMargins:", v26, v39, v28, v32);

  }
}

- (void)_setSplitViewPosition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[LargeDayViewController _dayViewWidthWhenSplit](self, "_dayViewWidthWhenSplit");
  v10 = v9;
  -[LargeDayViewController splitterSpace](self, "splitterSpace");
  objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "setFrame:", v10 + v11, v4, v6, v8);
}

- (double)_totalWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[LargeDayViewController splitterSpace](self, "splitterSpace");
  v7 = v5 - v6;

  return v7;
}

- (double)_dayViewWidthWhenSplit
{
  double v2;

  -[LargeDayViewController _totalWidth](self, "_totalWidth");
  return v2 + -375.0;
}

- (double)_splitViewWidth
{
  double v3;
  double v4;
  double v5;

  -[LargeDayViewController _totalWidth](self, "_totalWidth");
  v4 = v3;
  -[LargeDayViewController _dayViewWidthWhenSplit](self, "_dayViewWidthWhenSplit");
  return v4 - v5;
}

- (void)_clearSplitViewNavigationController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  self->_changingDate = 1;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D134C;
  v4[3] = &unk_1001B3F90;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "enqueueStackResetOperationDismissingPresentations:cancelOperations:completionBlock:", 1, 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController")),
        v12 = objc_msgSend(v11, "isBeingDismissed"),
        v11,
        v10,
        v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    EKUIPushFallbackSizingContextWithViewHierarchy(v13);

    -[LargeDayViewController _splitViewNavigationController:willShowViewController:animated:completion:](self, "_splitViewNavigationController:willShowViewController:animated:completion:", v15, v8, v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    EKUIPopFallbackSizingContextWithViewHierarchy(v14);

  }
}

- (void)_splitViewNavigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  double v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v14 = objc_msgSend(v10, "isEqual:", v13);

  if (v14)
  {
    if (v7)
      v15 = 0.15;
    else
      v15 = 0.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
    v17 = (unint64_t)objc_msgSend(v16, "count") < 2;

    objc_msgSend(v10, "setNavigationBarHidden:animated:", v17, 0);
    if (v11
      || (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers")),
          v36 = objc_msgSend(v35, "count"),
          v35,
          v36)
      && (v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"))) != 0)
    {
      objc_opt_class(CNContactViewController);
      if ((objc_opt_isKindOfClass(v11, v18) & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
        objc_msgSend(v19, "layoutMargins");
        v21 = v20;
        v23 = v22;

        -[LargeDayViewController detailsRightInsetAdjustment](self, "detailsRightInsetAdjustment");
        v25 = v24;
        -[LargeDayViewController rightSplitViewSideInset](self, "rightSplitViewSideInset");
        v27 = v25 + v26;
        -[LargeDayViewController detailsLeftInsetAdjustment](self, "detailsLeftInsetAdjustment");
        v29 = v28;
        -[LargeDayViewController rightSplitViewSideInset](self, "rightSplitViewSideInset");
        v31 = v29 + v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
        objc_msgSend(v32, "setLayoutMargins:", v21, v31, v23, v27);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toolbarItems"));
      objc_msgSend(v10, "setToolbarHidden:", objc_msgSend(v33, "count") == 0);

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000D174C;
      v42[3] = &unk_1001B2538;
      v42[4] = self;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000D1754;
      v40[3] = &unk_1001B27E8;
      v34 = &v41;
      v41 = v12;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v42, v40, v15);
    }
    else
    {
      objc_msgSend(v10, "setToolbarHidden:", 1);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000D1768;
      v39[3] = &unk_1001B2538;
      v39[4] = self;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000D1770;
      v37[3] = &unk_1001B27E8;
      v34 = &v38;
      v38 = v12;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v39, v37, v15);
      v11 = 0;
    }

  }
}

- (BOOL)usePortraitLayoutForSize:(CGSize)a3
{
  return a3.width <= a3.height;
}

- (int64_t)orientationForSize:(CGSize)a3
{
  if (-[LargeDayViewController usePortraitLayoutForSize:](self, "usePortraitLayoutForSize:", a3.width, a3.height))
    return 1;
  else
    return 4;
}

- (int64_t)viewInterfaceOrientation
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  char IsCompact;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  if ((EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v3, v4) & 1) != 0)
  {
    v5 = 4;
LABEL_6:

    return v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  IsCompact = EKUICurrentHeightSizeClassIsCompact(v6);

  if ((IsCompact & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    objc_msgSend(v3, "frame");
    v5 = -[LargeDayViewController orientationForSize:](self, "orientationForSize:", v8, v9);
    goto LABEL_6;
  }
  return 4;
}

- (double)splitterSpace
{
  -[LargeDayViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  return 1.0;
}

- (double)rightSplitViewSideInset
{
  -[LargeDayViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  return 23.0;
}

- (double)detailsLeftInsetAdjustment
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v4 = EKUICurrentWindowInterfaceParadigm(v2, v3);

  result = 1.0;
  if (v4 == 8)
    return -19.0;
  return result;
}

- (double)detailsRightInsetAdjustment
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v5 = EKUICurrentWindowInterfaceParadigm(v3, v4);

  result = -1.0;
  if (v5 == 8)
  {
    -[LargeDayViewController rightSplitViewSideInset](self, "rightSplitViewSideInset", -1.0);
    return -v7;
  }
  return result;
}

- (BOOL)containsDisplayedOccurrences
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v3 = objc_msgSend(v2, "currentDayContainsOccurrences");

  return v3;
}

- (BOOL)_selectEvent:(id)a3 animated:(BOOL)a4 context:(int)a5
{
  void *v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  BOOL v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  _BOOL8 v37;
  void *v38;
  void *v39;
  double v41;
  _QWORD v42[5];
  _QWORD block[5];
  _QWORD v44[5];
  id v45;
  int v46;
  BOOL v47;
  id v48;

  LODWORD(v5) = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v10 = objc_msgSend(v9, "dragGestureInProgress");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
    v12 = v11;
    if ((_DWORD)v5 == 1 && v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "event"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueId"));
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {

        v8 = 0;
        v18 = 1;
        goto LABEL_11;
      }
    }
    else
    {

    }
    if (!v8 || (_DWORD)v5 != 1)
    {
LABEL_12:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "event"));

      if (v8 || !v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
        if (v22 == v23)
        {
          v21 = 1;
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
          v21 = objc_msgSend(v24, "isEqualToString:", v25);

        }
      }
      else
      {
        v21 = 0;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
      v27 = v26;
      if (!v26 || v21)
      {

      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
        v29 = objc_msgSend(v28, "isBeingDismissed");

        if ((v29 & 1) == 0)
        {
          if ((_DWORD)v5 == 1)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
            v31 = objc_msgSend(v30, "willPresentDialogOnSave");

            if (v31)
            {
              v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
              v44[0] = _NSConcreteStackBlock;
              v44[1] = 3221225472;
              v44[2] = sub_1000D1E48;
              v44[3] = &unk_1001B4F40;
              v44[4] = self;
              v45 = v8;
              v47 = v6;
              v46 = 1;
              objc_msgSend(v5, "completeAndSaveWithContinueBlock:", v44);

              LOBYTE(v5) = 0;
LABEL_47:

              goto LABEL_48;
            }
            if (!v8)
              *(_DWORD *)((char *)&self->_dividerView + 2) = 1;
          }
          -[LargeDayViewController _dismissEditorAndSaveIfPossibleWhileChangingDate:animated:](self, "_dismissEditorAndSaveIfPossibleWhileChangingDate:animated:", 0, 0);
        }
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
      if (objc_msgSend(v32, "count") == (id)1)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));

      }
      else
      {
        v34 = 0;
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "occurrence"));
      v36 = objc_msgSend(v35, "isEqual:", v8);

      if (v36)
      {
        if ((objc_msgSend(v8, "hasChanges") & 1) == 0)
          -[LargeDayViewController _adjustSelectedOccurrences](self, "_adjustSelectedOccurrences");
        LOBYTE(v5) = 1;
      }
      else
      {
        -[DayViewController _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected](self, "_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected");
        if (v8)
        {
          *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = (_DWORD)v5 != 1;
          -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", v8);
          v37 = (_DWORD)v5 != 2;
          v48 = v8;
          LOBYTE(v5) = 1;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
          -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v38, v6, v37, 1);

        }
        else
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
          if (v39
            || (v39 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"))) != 0|| (v39 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownContactViewController](self, "shownContactViewController"))) != 0)
          {

          }
          else
          {
            v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));

            if (!v5)
            {
              v41 = 0.15;
              if (!v6)
                v41 = 0.0;
              v42[0] = _NSConcreteStackBlock;
              v42[1] = 3221225472;
              v42[2] = sub_1000D1E64;
              v42[3] = &unk_1001B2538;
              v42[4] = self;
              +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v42, 0, v41);
              goto LABEL_46;
            }
          }
          if (v6)
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000D1E5C;
            block[3] = &unk_1001B2538;
            block[4] = self;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
          else
          {
            -[LargeDayViewController _resetSplitView](self, "_resetSplitView");
          }
          LOBYTE(v5) = 0;
        }
      }
LABEL_46:

      goto LABEL_47;
    }
    v18 = 0;
LABEL_11:
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = v18;
    goto LABEL_12;
  }
  LOBYTE(v5) = 0;
LABEL_48:

  return (char)v5;
}

- (BOOL)_selectEvents:(id)a3 animated:(BOOL)a4 context:(int)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  unsigned __int8 v51;
  id v52;
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
  unsigned __int8 v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  void *v68;
  double v69;
  void *v70;
  unsigned int v71;
  int v72;
  void *v73;
  _QWORD v74[5];
  _QWORD block[5];
  _QWORD v76[5];
  id v77;
  int v78;
  char v79;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v10 = objc_msgSend(v9, "dragGestureInProgress");

  if ((v10 & 1) == 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
    v13 = (void *)v12;
    v72 = a5;
    if (a5 == 1 && v12 && objc_msgSend(v8, "count") == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "event"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueId"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v18 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueId"));
      v20 = objc_msgSend(v16, "isEqualToString:", v19);

      v6 = v18;
      a5 = 1;

      if (v20)
      {

        v8 = 0;
        v21 = 1;
        goto LABEL_13;
      }
    }
    else
    {

    }
    if (!v8 || a5 != 1 || !objc_msgSend(v8, "count"))
    {
LABEL_14:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "event"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "events"));

      if (v23)
      {
        if (v8)
        {
          v26 = objc_msgSend(v8, "count") == 0;
          if (!v25)
            goto LABEL_24;
        }
        else
        {
          v26 = 1;
          if (!v25)
            goto LABEL_24;
        }
      }
      else
      {
        v26 = 0;
        if (!v25)
          goto LABEL_24;
      }
      if (objc_msgSend(v25, "count"))
      {
        if (v8)
          v27 = objc_msgSend(v8, "count") == 0;
        else
          v27 = 1;
LABEL_25:
        v73 = v25;
        if (v26 || objc_msgSend(v8, "count") != (id)1)
        {
          v35 = 0;
          if (!v27)
          {
LABEL_34:
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v25));
            if (v8)
              v38 = v8;
            else
              v38 = &__NSArray0__struct;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v38));
            v36 = objc_msgSend(v37, "isEqualToSet:", v39);

LABEL_38:
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
            v41 = v40;
            if (v40)
              v42 = v35;
            else
              v42 = 1;
            if (v42 == 1)
            {

            }
            else
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
              v44 = objc_msgSend(v43, "isBeingDismissed");

              if ((v44 & 1) == 0)
              {
                if (v72 == 1)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
                  v46 = objc_msgSend(v45, "willPresentDialogOnSave");

                  if (v46)
                  {
                    v47 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
                    v76[0] = _NSConcreteStackBlock;
                    v76[1] = 3221225472;
                    v76[2] = sub_1000D2600;
                    v76[3] = &unk_1001B4F40;
                    v76[4] = self;
                    v77 = v8;
                    v79 = v6;
                    v78 = 1;
                    objc_msgSend(v47, "completeAndSaveWithContinueBlock:", v76);

                    v11 = 0;
LABEL_86:

                    goto LABEL_87;
                  }
                  if (!v8 || !objc_msgSend(v8, "count"))
                    *(_DWORD *)((char *)&self->_dividerView + 2) = 1;
                }
                else if (v8)
                {
                  objc_msgSend(v8, "count");
                }
                -[LargeDayViewController _dismissEditorAndSaveIfPossibleWhileChangingDate:animated:](self, "_dismissEditorAndSaveIfPossibleWhileChangingDate:animated:", 0, 0);
              }
            }
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
            if (v48)
              v49 = v36;
            else
              v49 = 1;
            if ((v49 & 1) != 0)
              goto LABEL_63;
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
            v51 = objc_msgSend(v50, "isBeingDismissed");

            if ((v51 & 1) != 0)
              goto LABEL_64;
            if (v8)
            {
              v52 = objc_msgSend(v8, "count");
              if (v72 != 1 || v52)
                goto LABEL_62;
            }
            else if (v72 != 1)
            {
              goto LABEL_62;
            }
            *(_DWORD *)((char *)&self->_dividerView + 2) = 1;
LABEL_62:
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "presentingViewController"));
            objc_msgSend(v53, "dismissViewControllerAnimated:completion:", 1, 0);

LABEL_63:
LABEL_64:
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
            if (objc_msgSend(v54, "count") == (id)1)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstObject"));

            }
            else
            {
              v56 = 0;
            }

            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "occurrences"));
            v58 = v57;
            if (v8 && v57)
            {
              v59 = v23;
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "occurrences"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v60));
              v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
              v63 = objc_msgSend(v61, "isEqualToSet:", v62);

              if ((v63 & 1) != 0)
              {
                v23 = v59;
                if (objc_msgSend(v8, "count") == (id)1)
                {
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
                  v65 = objc_msgSend(v64, "hasChanges");

                  if ((v65 & 1) == 0)
                    -[LargeDayViewController _adjustSelectedOccurrences](self, "_adjustSelectedOccurrences");
                }
                goto LABEL_85;
              }
              -[DayViewController _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected](self, "_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected");
              v23 = v59;
            }
            else
            {

              -[DayViewController _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected](self, "_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected");
              if (!v8)
                goto LABEL_78;
            }
            if (objc_msgSend(v8, "count"))
            {
              *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = v72 != 1;
              -[LargeDayViewController setModelSelectedEvents:](self, "setModelSelectedEvents:", v8);
              -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v8, v6, v72 != 2, 1);
              goto LABEL_85;
            }
LABEL_78:
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
            if (v66
              || (v66 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"))) != 0|| (v66 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownContactViewController](self, "shownContactViewController"))) != 0)
            {

            }
            else
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));

              if (!v68)
              {
                v69 = 0.15;
                if (!(_DWORD)v6)
                  v69 = 0.0;
                v74[0] = _NSConcreteStackBlock;
                v74[1] = 3221225472;
                v74[2] = sub_1000D261C;
                v74[3] = &unk_1001B2538;
                v74[4] = self;
                +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v74, 0, v69);
                goto LABEL_85;
              }
            }
            if ((_DWORD)v6)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000D2614;
              block[3] = &unk_1001B2538;
              block[4] = self;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
            else
            {
              -[LargeDayViewController _resetSplitView](self, "_resetSplitView");
            }
LABEL_85:

            v11 = 1;
            goto LABEL_86;
          }
        }
        else
        {
          v71 = v6;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uniqueID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueID"));
          if (v28 == v30)
          {
            v35 = 1;
          }
          else
          {
            v70 = v28;
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uniqueID"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
            v33 = v23;
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uniqueID"));
            v35 = objc_msgSend(v31, "isEqualToString:", v34);

            v23 = v33;
            v25 = v73;

            v28 = v70;
          }

          v6 = v71;
          if (!v27)
            goto LABEL_34;
        }
        v36 = 0;
        goto LABEL_38;
      }
LABEL_24:
      v27 = 0;
      goto LABEL_25;
    }
    v21 = 0;
LABEL_13:
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = v21;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_87:

  return v11;
}

- (id)_selectedOccurrenceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "occurrenceViewForEvent:includeNextAndPreviousDays:", v6, 0));

  }
  return v5;
}

- (id)_clonedViewForSelectedOccurrence:(id)a3
{
  id v5;
  NSMutableSet *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = objc_opt_new(NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController timedDayViewContentGridSubviews](self, "timedDayViewContentGridSubviews"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController allDayView](self, "allDayView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v9);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000D281C;
  v17 = sub_1000D282C;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D2834;
  v12[3] = &unk_1001B4F68;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)_occurrenceViewDidEndSelection:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "occurrence"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController _clonedViewForSelectedOccurrence:](self, "_clonedViewForSelectedOccurrence:", v4));

  if (v5 && v6 == v5)
    -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");

}

- (void)_reselectedEventIfNeeded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
    -[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", v4, 0, 0);

  }
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a4;
  v13 = a3;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  -[LargeDayViewController showEvents:animated:showMode:context:](self, "showEvents:animated:showMode:context:", v12, v7, a5, v10, v13);
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a4;
  v21 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v12 = objc_msgSend(v11, "dragGestureInProgress");

  if ((v12 & 1) == 0)
  {
    -[LargeDayViewController setModelSelectedEvents:](self, "setModelSelectedEvents:", v21);
    if (objc_msgSend(v21, "count") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      v14 = v13;
      if (a5 == 3)
      {
        -[DayViewController beginEditingOccurrence:creationMethod:](self, "beginEditingOccurrence:creationMethod:", v13, 3);
LABEL_5:

        goto LABEL_10;
      }
      if ((objc_msgSend(v13, "isNew") & 1) == 0
        && !-[LargeDayViewController _eventIntersectsDayViewControllerActiveDate:](self, "_eventIntersectsDayViewControllerActiveDate:", v14))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));

        if (v15)
          -[LargeDayViewController _dismissEditorAndSaveIfPossibleWhileChangingDate:animated:](self, "_dismissEditorAndSaveIfPossibleWhileChangingDate:animated:", 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "calendar"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "timeZone"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v16, v19));
        -[DayViewController selectDate:animated:](self, "selectDate:animated:", v20, v8);

        goto LABEL_5;
      }

    }
    -[LargeDayViewController _showEventsWithoutChangingDate:animated:showComments:context:](self, "_showEventsWithoutChangingDate:animated:showComments:context:", v21, v8, a5 == 2, v10);
  }
LABEL_10:

}

- (void)_showEventsWithoutChangingDate:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v15 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v12 = objc_msgSend(v11, "dragGestureInProgress");

  if ((v12 & 1) == 0)
  {
    -[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", v15, v8, 0);
    if (v15)
    {
      if (objc_msgSend(v15, "count") != (id)1
        || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject")),
            v14 = objc_msgSend(v13, "isNew"),
            v13,
            (v14 & 1) == 0))
      {
        -[DayViewController presentDetailsForEvents:animated:showComments:context:](self, "presentDetailsForEvents:animated:showComments:context:", v15, v8, v7, v10);
      }
    }
  }

}

- (BOOL)didSelectEvents:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  unsigned int v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
      v11 = objc_msgSend(v9, "isEqualToSet:", v10);

      v12 = v7;
      v13 = v12;
      if (v11)
      {

        v14 = 1;
        v13 = 0;
        if (!-[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", 0, 1, 1))
        {
          v15 = 0;
LABEL_29:
          LOBYTE(v21) = v15 & (v14 ^ 1);
          goto LABEL_30;
        }
LABEL_27:
        *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 0;
        v15 = 1;
        *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 1;
        -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", 0);
        -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");
        goto LABEL_29;
      }
      if (-[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", v12, 1, 1))
      {
        if (objc_msgSend(v13, "count"))
        {
          v14 = 0;
          goto LABEL_28;
        }
LABEL_26:
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectedOccurrences"));
        v28 = objc_msgSend(v27, "count");

        v14 = 0;
        if (v28)
          goto LABEL_27;
LABEL_28:
        v15 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      v13 = 0;
      if (-[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", 0, 1, 1))
      {
        goto LABEL_26;
      }
    }
    v15 = 0;
    v14 = 0;
    goto LABEL_29;
  }
  if (!v6)
    goto LABEL_8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectedOccurrences"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v20 = objc_msgSend(v18, "isEqualToSet:", v19);

  if ((v20 & 1) == 0)
  {
LABEL_8:
    v21 = -[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", v7, 1, 0);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v7;
    v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (!v22)
    {
LABEL_30:

      goto LABEL_31;
    }
    v23 = v22;
    v24 = *(_QWORD *)v31;
LABEL_10:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v24)
        objc_enumerationMutation(v13);
      if (-[LargeDayViewController _showsEventViewControllerAsFullScreen:](self, "_showsEventViewControllerAsFullScreen:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25), (_QWORD)v30))
      {
        break;
      }
      if (v23 == (id)++v25)
      {
        v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v23)
          goto LABEL_10;
        goto LABEL_30;
      }
    }

    if (!v21)
      goto LABEL_31;
    -[LargeDayViewController _resetSplitView](self, "_resetSplitView");
  }
  LOBYTE(v21) = 0;
LABEL_31:

  return v21;
}

- (BOOL)didSelectEvent:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v10;

  v4 = a4;
  if (a3)
  {
    v10 = a3;
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  else
  {
    v7 = 0;
  }
  v8 = -[LargeDayViewController didSelectEvents:userInitiated:](self, "didSelectEvents:userInitiated:", v7, v4, v10);

  return v8;
}

- (BOOL)_showsEventViewControllerAsFullScreen:(id)a3
{
  unsigned int v4;
  void *v5;
  BOOL v6;

  v4 = objc_msgSend(a3, "isBirthday");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    v6 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (void)didShowEventWithoutShowingDetails:(id)a3
{
  objc_storeStrong((id *)&self->_clearingSplitViewNavigationController, a3);
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  unsigned int v14;
  char v15;
  void *v16;
  char v17;
  id v18;

  v18 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (v6)
    -[LargeDayViewController _editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:](self, "_editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:", 2 * (a4 == 2), 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "event"));
  v8 = objc_msgSend(v7, "refreshIfRefreshableAndNotify:", 1);
  v9 = objc_msgSend(v7, "participationStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
  if (objc_msgSend(v10, "showDeclinedEvents"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
    v13 = objc_msgSend(v12, "sourceType") != (id)1;

  }
  else
  {
    v13 = 0;
  }

  if (a4 == 1)
    v14 = v8;
  else
    v14 = 0;
  v15 = v9 != (id)3 || v13;
  if (v14 != 1 || (v15 & 1) == 0)
  {
    objc_msgSend(v18, "setDelegate:", 0);
    -[LargeDayViewController _clearSplitViewNavigationController](self, "_clearSplitViewNavigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    objc_msgSend(v16, "setCurrentEditor:", 0);

    -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");
    -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", 0);
    -[LargeDayViewController _selectEvent:animated:context:](self, "_selectEvent:animated:context:", 0, 0, 0);
    if (a4 == 2)
      v17 = v8;
    else
      v17 = 1;
    if ((v17 & 1) == 0)
      *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 1;
  }

}

- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toolbar"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "popoverPresentationController"));
  objc_msgSend(v17, "setSourceRect:", v10, v12, v14, v16);

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v18, "toolbar"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "popoverPresentationController"));
  objc_msgSend(v20, "setSourceView:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "popoverPresentationController"));
  objc_msgSend(v21, "setPermittedArrowDirections:", 2);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](self, "presentedViewController"));
  objc_opt_class(UIAlertController);
  LOBYTE(v18) = objc_opt_isKindOfClass(v22, v23);

  if ((v18 & 1) == 0)
    -[LargeDayViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 0, 0);

}

- (void)scrubberDidChangeSelectedDate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  v4 = a3;
  -[DayViewController scrubberDidChangeSelectedDate:](&v5, "scrubberDidChangeSelectedDate:", v4);
  -[LargeDayViewController _selectedDateChangedToDate:](self, "_selectedDateChangedToDate:", v4, v5.receiver, v5.super_class);

}

- (void)dayViewDidChangeSelectedDate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  v4 = a3;
  -[DayViewController dayViewDidChangeSelectedDate:](&v5, "dayViewDidChangeSelectedDate:", v4);
  -[LargeDayViewController _selectedDateChangedToDate:](self, "_selectedDateChangedToDate:", v4, v5.receiver, v5.super_class);

}

- (void)_selectedDateChangedToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v7));

  -[LargeDayViewController updateNavigationBarDisplayedDateStringWithDate:](self, "updateNavigationBarDisplayedDateStringWithDate:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (v8)
  {
    *(_DWORD *)((char *)&self->_dividerView + 2) = 0;
    -[LargeDayViewController _dismissEditorAndSaveIfPossibleWhileChangingDate:animated:](self, "_dismissEditorAndSaveIfPossibleWhileChangingDate:animated:", 1, 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
  v10 = objc_msgSend(v9, "extendedLaunchFinished");

  if (v10)
  {
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 0;
    -[LargeDayViewController _beginAutoScrollingAutoSelectingWithContext:](self, "_beginAutoScrollingAutoSelectingWithContext:", 0);
  }

}

- (BOOL)_eventIntersectsDayViewControllerActiveDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendar"));
    if ((objc_msgSend(v6, "isHidden") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startCalendarDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self, "day"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForEndOfDay"));
      if (objc_msgSend(v8, "compare:", v10) == (id)-1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endCalendarDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self, "day"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateForDay"));
        v7 = objc_msgSend(v11, "compare:", v13) == (id)1;

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_eventEndDateIsPassed:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "endDate"));
  v6 = CUIKNowDate(v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "compare:", v7) == (id)-1;

  return v8;
}

- (void)_autoSelectEventWithAnimatedScroll:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  if (self->_userSelectedEmptySpace)
  {
    self->_selectedEventWasAutoSelected = 1;
    return;
  }
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v6 = objc_msgSend(v5, "dragGestureInProgress");

  if ((v6 & 1) == 0)
  {
    v28 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController day](self, "day"));
    if (*(_QWORD *)&self->_clearingSplitViewNavigationController
      && !-[LargeDayViewController _isTransitioningTraitCollection](self, "_isTransitioningTraitCollection"))
    {
      *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 1;
      -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", *(_QWORD *)&self->_clearingSplitViewNavigationController);
      v17 = *(void **)&self->_clearingSplitViewNavigationController;
      *(_QWORD *)&self->_clearingSplitViewNavigationController = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
      v9 = objc_msgSend(v8, "isNew");

      if ((v9 & 1) != 0)
      {
LABEL_18:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "event"));
        v23 = objc_msgSend(v22, "isNew");

        if ((v23 & 1) == 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectedOccurrences"));
          -[LargeDayViewController _showEventsWithoutChangingDate:animated:showComments:context:](self, "_showEventsWithoutChangingDate:animated:showComments:context:", v25, v4, 0, 0);

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));

        if (!v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
          objc_msgSend(v27, "scrollToNow:", v4);

        }
        return;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
        v12 = -[LargeDayViewController _eventIntersectsDayViewControllerActiveDate:](self, "_eventIntersectsDayViewControllerActiveDate:", v11);

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
          v14 = -[LargeDayViewController _showsEventViewControllerAsFullScreen:](self, "_showsEventViewControllerAsFullScreen:", v13);

          if (!v14)
            goto LABEL_18;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));

        if (v15)
          -[LargeDayViewController _dismissEditorAndSaveIfPossibleWhileChangingDate:animated:](self, "_dismissEditorAndSaveIfPossibleWhileChangingDate:animated:", 1, 0);
      }
      *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 1;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "preferredEventsToSelectOnDate:", v28));

      if (objc_msgSend(v17, "count") == (id)1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
        v19 = -[LargeDayViewController _showsEventViewControllerAsFullScreen:](self, "_showsEventViewControllerAsFullScreen:", v18);

        if (v19)
        {

          v17 = 0;
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      objc_msgSend(v20, "setSelectedOccurrences:", v17);

    }
    goto LABEL_18;
  }
}

- (BOOL)shouldAlwaysPresentDeleteAlertsAsSheet
{
  return 1;
}

- (id)overrideCellColor
{
  return +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
}

- (void)showReminderDetail:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v4, "setSelectedOccurrence:", v6);

  v5 = -[LargeDayViewController showDetailViewControllerForEvent:context:animated:](self, "showDetailViewControllerForEvent:context:animated:", v6, 0, 1);
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view", a3));
  v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  return v4;
}

- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view", a3));
  v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  return v4;
}

- (void)_setModal:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1) != a3)
  {
    v3 = a3;
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1) = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    objc_msgSend(v4, "setDisableGestureDayChange:", v3);

  }
}

- (void)showEditViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  const char *v26;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));

  if (v8 != v9)
  {
LABEL_3:
    *(_DWORD *)((char *)&self->_dividerView + 2) = 2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
    v11 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    if (v11)
    {
      if (v4)
      {
        objc_msgSend(v4, "setInternalEditViewDelegate:", self);
LABEL_10:
        objc_msgSend(v4, "setModalPresentationDelegate:", self);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
        objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 0, 0);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentingViewController"));
        objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 0, 0);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
        objc_msgSend(v23, "presentAdaptiveModalViewController:animated:completion:", v4, 1, 0);

        goto LABEL_11;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "event"));

      if (v19
        || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"))) != 0)
      {
        v4 = (id)objc_claimAutoreleasedReturnValue(+[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:](EKEventEditViewController, "eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:", v19, 0, self));

        goto LABEL_10;
      }
      v24 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v25 = 136315138;
        v26 = "-[LargeDayViewController showEditViewController:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%s] couldn't get a valid event.", (uint8_t *)&v25, 0xCu);
      }
      v4 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
      -[LargeDayViewController _selectEvent:animated:context:](self, "_selectEvent:animated:context:", v12, 0, 0);

      -[LargeDayViewController _customizeEventEditorForSplitViewAppearance:](self, "_customizeEventEditorForSplitViewAppearance:", v4);
      -[LargeDayViewController _clearSplitViewNavigationController](self, "_clearSplitViewNavigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
      objc_msgSend(v13, "showViewController:sender:animated:completion:", v4, self, 1, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolbarItems"));
      v15 = objc_msgSend(v14, "count") == 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
      objc_msgSend(v16, "setToolbarHidden:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
      objc_msgSend(v17, "setCurrentEditor:", v4);

      -[LargeDayViewController _setUpGesturesAndModalMode](self, "_setUpGesturesAndModalMode");
    }
  }
LABEL_11:

}

- (void)_customizeEventEditorForSplitViewAppearance:(id)a3
{
  _objc_msgSend(a3, "configureAppearanceForSplitDayView");
}

- (BOOL)eventViewControllerShouldHideDeleteButton
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v4 = EKUICurrentWindowInterfaceParadigm(v2, v3) == 8;

  return v4;
}

- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a4;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4) = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v7 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v7)
    -[LargeDayViewController showEditViewController:](self, "showEditViewController:", v8);

}

- (void)eventViewControllerWillBeginEditingEvent:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;

  *(_DWORD *)((char *)&self->_dividerView + 2) = 2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view", a3));
  v5 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));

    if (v6)
      -[LargeDayViewController _setUpGesturesAndModalMode](self, "_setUpGesturesAndModalMode");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "todayBarButtonItem"));
  objc_msgSend(v7, "setEnabled:", 0);

}

- (BOOL)eventViewControllerEditButtonTemporarilyDisabled:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController", a3));
  v4 = objc_msgSend(v3, "dragGestureInProgress");

  return v4;
}

- (void)_setUpGesturesAndModalMode
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  objc_msgSend(v3, "liftUpOccurrenceForEditingEvent:", v4);

  -[LargeDayViewController _setModal:](self, "_setModal:", 1);
}

- (void)eventViewControllerDidBeginEditingEventWithEditViewController:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v5 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (!v5)
  {
    -[LargeDayViewController _customizeEventEditorForSplitViewAppearance:](self, "_customizeEventEditorForSplitViewAppearance:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    objc_msgSend(v6, "setCurrentEditor:", v9);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "todayBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", 0);

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[LargeDayViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void ***v11;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  LargeDayViewController *v17;
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v19.receiver = self;
  v19.super_class = (Class)LargeDayViewController;
  -[DayViewController eventEditViewController:didCompleteWithAction:dismissController:](&v19, "eventEditViewController:didCompleteWithAction:dismissController:", v8, a4, 0);
  if (!v10
    && *(_DWORD *)((char *)&self->_dividerView + 2) == 1
    && *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2))
  {
    -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", 0);
  }
  -[LargeDayViewController _editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:](self, "_editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:", a4, 0, 1, v8);
  if (v9)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000D432C;
    v16 = &unk_1001B2600;
    v17 = self;
    v18 = v9;
    v11 = objc_retainBlock(&v13);

  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController", v13, v14, v15, v16));
  -[LargeDayViewController _splitViewNavigationController:willShowViewController:animated:completion:](self, "_splitViewNavigationController:willShowViewController:animated:completion:", v12, 0, 1, v11);

}

- (id)calendarModel
{
  return self->super.super._model;
}

- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4
{
  void *v5;
  uint64_t v6;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController", a3));
    objc_msgSend(v5, "setEditorHideTransition:", 0);

    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  -[LargeDayViewController _editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:](self, "_editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:", v6, 0, 0, 0);
}

- (void)_editingDidCompleteWithAction:(int64_t)a3 changingDate:(BOOL)a4 dismissEditor:(BOOL)a5 editorToDismiss:(id)a6
{
  _BOOL4 v6;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LargeDayViewController *v18;
  LargeDayViewController *v19;
  LargeDayViewController *v20;
  LargeDayViewController *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];

  v6 = a5;
  v10 = a6;
  v11 = a4 || *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  objc_msgSend(v12, "endForcedStart");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v13, "externallyEndedGestureDragging");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v14, "setGestureOccurrenceSuperview:", 0);

  -[LargeDayViewController _setModal:](self, "_setModal:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
  if (objc_msgSend(v15, "count") == (id)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, "setAlpha:", 1.0);
      objc_msgSend(v17, "setDimmed:", 0);
      -[LargeDayViewController _adjustSelectedOccurrences](self, "_adjustSelectedOccurrences");

    }
  }
  if (v6)
  {
    v18 = (LargeDayViewController *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    v19 = v18;
    if (v10)
    {
      v20 = (LargeDayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentingViewController"));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](v18, "presentedViewController"));

      if (v22)
      {
LABEL_12:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController presentedViewController](v19, "presentedViewController"));
        objc_opt_class(v23);
        v25 = v24;

        if (v10
          || (v30 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"))) != 0
          && (v31 = (void *)v30,
              objc_opt_class(EKEventEditViewController),
              v33 = v32,
              v31,
              v25 == v33))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
          v27 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

          if (v27)
          {
            v28 = !v11;
            v29 = 9;
          }
          else
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
            if (v34)
              v28 = !v11;
            else
              v28 = 0;

            v29 = 6;
          }
          self->_modalEditing = 1;
          if (v28)
            v35 = v29;
          else
            v35 = 0;
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000D4844;
          v52[3] = &unk_1001B2538;
          v52[4] = self;
          -[LargeDayViewController dismissViewControllerWithTransition:completion:](v19, "dismissViewControllerWithTransition:completion:", v35, v52);
        }

        goto LABEL_27;
      }
      v20 = self;
    }
    v21 = v20;

    v19 = v21;
    goto LABEL_12;
  }
LABEL_27:
  if (*(_DWORD *)((char *)&self->_dividerView + 2) == 2 && (unint64_t)a3 <= 2)
    *(_DWORD *)((char *)&self->_dividerView + 2) = dword_1001A1878[a3];
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));

  if (!v36)
    goto LABEL_38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v38 = objc_msgSend(v37, "isNew");

  if (!a3 && (v38 & 1) != 0)
    goto LABEL_38;
  v39 = a3 == 2 || v11;
  if ((v39 & 1) != 0)
  {
    if (a3 == 2)
    {
LABEL_38:
      if (*(_DWORD *)((char *)&self->_dividerView + 2))
      {
        -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");
        -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", 0);
      }
    }
LABEL_40:
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 1;
    goto LABEL_41;
  }
  if (*(_DWORD *)((char *)&self->_dividerView + 2) != 2)
    goto LABEL_40;
  v43 = objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  if (!v43)
    goto LABEL_56;
  v44 = (void *)v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "event"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v48 = objc_msgSend(v46, "isEqual:", v47);

  if ((v48 & 1) != 0)
  {
    if (a3)
      goto LABEL_41;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    objc_msgSend(v49, "setNeedsReload");
  }
  else
  {
LABEL_56:
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
    -[LargeDayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v49, 1, 1, 0);
  }

LABEL_41:
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v40, "setCurrentEditor:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  if (!v11)
  {
    switch(a3)
    {
      case 0:
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
        objc_msgSend(v42, "editorDidCancelEditingEvent:", v41);
        goto LABEL_53;
      case 2:
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
        objc_msgSend(v42, "editorDidDeleteEvent:", v41);
        goto LABEL_53;
      case 1:
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
        objc_msgSend(v42, "editorDidSaveEvent:", v41);
LABEL_53:

        break;
    }
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController navigationController](self, "navigationController"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "todayBarButtonItem"));
  objc_msgSend(v51, "setEnabled:", 1);

}

- (void)eventViewControllerModifiedEventWithoutEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "event"));
  -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", v4);

}

- (BOOL)shouldHandleGestureCommits
{
  return 1;
}

- (void)handleGestureCommittingOccurrence:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  -[LargeDayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v4, 0, 1, 0);
  objc_initWeak(&location, self);
  objc_initWeak(&from, *(id *)((char *)&self->_lastEventShowed + 2));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000D4A20;
  v11 = &unk_1001B4F90;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  v5 = objc_retainBlock(&v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController", v8, v9, v10, v11));

  if (v6)
  {
    ((void (*)(void ***))v5[2])(v5);
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->_lastEventShowed + 2), "setHidden:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
    objc_msgSend(v7, "enqueueBlock:", v5);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (BOOL)comparePointersOfArray:(id)a3 withArray:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
    goto LABEL_2;
  if ((v5 == 0) != (v6 == 0) || (v9 = objc_msgSend((id)v5, "count"), v9 != objc_msgSend(v7, "count")))
  {
    v8 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend((id)v5, "count"))
  {
    v10 = 0;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "objectAtIndex:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v10));

      v8 = v11 == v12;
      if (!v8)
        break;
      ++v10;
    }
    while (v10 < (unint64_t)objc_msgSend((id)v5, "count"));
  }
  else
  {
LABEL_2:
    v8 = 1;
  }
LABEL_12:

  return v8;
}

- (void)dataReloadedWithTrigger:(int)a3
{
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
  unsigned int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v22;
  id v23;

  -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "occurrenceViewForEvent:", v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "occurrences"));
    if (v23)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
      v10 = -[LargeDayViewController comparePointersOfArray:withArray:](self, "comparePointersOfArray:withArray:", v8, v9);

      if (v10)
        -[LargeDayViewController setModelSelectedEvents:](self, "setModelSelectedEvents:", v8);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
    v12 = v11;
    v16 = !v11
       || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "event")),
           v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent")),
           v15 = objc_msgSend(v13, "isEqual:", v14),
           v14,
           v13,
           !v15)
       || *(_DWORD *)((char *)&self->_dividerView + 2) == 2;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
    v18 = v17;
    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "events"));
      v20 = -[LargeDayViewController comparePointersOfArray:withArray:](self, "comparePointersOfArray:withArray:", v8, v19);

      if (v20)
      {
        if (*(_DWORD *)((char *)&self->_dividerView + 2) != 2 || !v16)
          goto LABEL_21;
      }
      else if (!v16)
      {
LABEL_21:

        return;
      }
    }
    else if (!v16)
    {
      goto LABEL_21;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
    -[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", v22, 0, 2 * (a3 == 1));

    goto LABEL_21;
  }
}

- (void)_eventStoreChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EKEventStoreChangeTypeUserInfoKey));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 != (id)2)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
      v10 = objc_msgSend(v9, "refreshIfRefreshableAndNotify:", 1);

      if ((v10 & 1) == 0)
      {
        -[LargeDayViewController setModelSelectedEvent:](self, "setModelSelectedEvent:", 0);
        -[LargeDayViewController _autoSelectEventWithAnimatedScroll:](self, "_autoSelectEventWithAnimatedScroll:", 1);
      }
    }
  }
}

- (void)displayedOccurrencesChangedWithTrigger:(int)a3
{
  void *v5;
  int v6;
  id v7;

  self->_userInteractedWithSplitviewPane = 1;
  -[LargeDayViewController dataReloadedWithTrigger:](self, "dataReloadedWithTrigger:");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  if (v5)
  {
    v6 = *((unsigned __int8 *)&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6);

    if (v6)
      -[LargeDayViewController _beginAutoScrollingAutoSelectingWithContext:](self, "_beginAutoScrollingAutoSelectingWithContext:", 2 * (a3 == 1));
  }
  else
  {

  }
}

- (void)_beginAutoScrollingAutoSelectingWithContext:(int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v6 = -[LargeDayViewController _eventIntersectsDayViewControllerActiveDate:](self, "_eventIntersectsDayViewControllerActiveDate:", v5);

  if (*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2))
    goto LABEL_5;
  if (!v6 || *(_QWORD *)&self->_clearingSplitViewNavigationController)
    goto LABEL_4;
  v9 = objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  if (!v9)
    goto LABEL_11;
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "event"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
    -[LargeDayViewController _selectEvent:animated:context:](self, "_selectEvent:animated:context:", v15, 0, v3);
  }
  else
  {
LABEL_11:
    v16 = objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
    if (!v16)
      goto LABEL_4;
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "events"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));
    v23 = objc_msgSend(v20, "isEqualToSet:", v22);

    if (!v23)
    {
LABEL_4:
      -[LargeDayViewController _autoSelectEventWithAnimatedScroll:](self, "_autoSelectEventWithAnimatedScroll:", *((unsigned __int8 *)&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6));
      goto LABEL_5;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvents](self, "modelSelectedEvents"));
    -[LargeDayViewController _selectEvents:animated:context:](self, "_selectEvents:animated:context:", v15, 0, v3);
  }

LABEL_5:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_contentUnavailableConfiguration"));

  if (v8)
    -[LargeDayViewController updateNoContentConfiguration](self, "updateNoContentConfiguration");
}

- (void)updateNoContentConfiguration
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedOccurrences"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("num_selected_events_large_day_view"), &stru_1001B67C0, 0));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v5));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v11 = objc_msgSend(v10, "currentDayContainsOccurrences");

    *(_QWORD *)&v12 = objc_opt_class(self).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v13, v12));
    v8 = v14;
    if (v11)
      v15 = CFSTR("No Event Selected");
    else
      v15 = CFSTR("No Events");
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1001B67C0, 0));
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
  objc_msgSend(v16, "setText:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v17, "_setContentUnavailableConfiguration:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v18, "setNavigationBarHidden:animated:", 1, 0);

}

- (void)clearNoContentConfiguration
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LargeDayViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v2, "_setContentUnavailableConfiguration:", 0);

}

- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _BOOL4 modalEditing;
  void *v7;
  unsigned int v8;
  BOOL v9;
  void *v10;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v5
    && (modalEditing = self->_modalEditing, v5, !modalEditing)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController")),
        v8 = objc_msgSend(v7, "willPresentDialogOnSave"),
        v7,
        v8))
  {
    v9 = 1;
    self->_modalEditing = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
    objc_msgSend(v10, "completeAndSaveWithContinueBlock:", v4);

    self->_modalEditing = 0;
  }
  else
  {
    v4[2](v4);
    v9 = 0;
  }

  return v9;
}

- (id)shownEventEditViewController
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LargeDayViewController;
  v2 = -[MainViewController shownEventEditViewController](&v7, "shownEventEditViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_opt_class(AddEventViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && (objc_msgSend(v3, "presentedOverWholeApp") & 1) != 0)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (void)_dismissEditorAndSaveIfPossibleWhileChangingDate:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  BOOL v21;
  void *v22;
  unsigned __int8 v23;
  id v24;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (!v7 || self->_modalEditing)
    goto LABEL_23;
  v24 = v7;
  if ((objc_msgSend(v7, "hasUnsavedChanges") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "event"));
    v8 = objc_msgSend(v9, "existsInStore");

  }
  if ((objc_msgSend(v24, "willPresentDialogOnSave") & 1) != 0 || (v8 & 1) != 0)
  {
    self->_modalEditing = 1;
    objc_msgSend(v24, "setIgnoreUnsavedChanges:", 1);
    objc_msgSend(v24, "cancelEditing");
    -[LargeDayViewController _editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:](self, "_editingDidCompleteWithAction:changingDate:dismissEditor:editorToDismiss:", 0, v5, 1, 0);
    objc_msgSend(v24, "setIgnoreUnsavedChanges:", 0);
LABEL_22:
    v7 = v24;
    goto LABEL_23;
  }
  if (v4)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
      if (v12)
      {
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "event"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueId"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController modelSelectedEvent](self, "modelSelectedEvent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueId"));
        v23 = objc_msgSend(v16, "isEqualToString:", v18);

        if ((v23 & 1) != 0)
        {
          v19 = 1;
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  objc_msgSend(v20, "setEditorHideTransition:", 0);

  v19 = 0;
LABEL_16:
  v21 = 1;
  if (!v5)
    v21 = *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5);
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5) = v21;
  self->_modalEditing = 1;
  if (*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5))
    *(_DWORD *)((char *)&self->_dividerView + 2) = 0;
  objc_msgSend(v24, "completeAndSaveWithContinueBlock:", 0);
  v7 = v24;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5) = 0;
  self->_modalEditing = 0;
  if ((v19 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    objc_msgSend(v22, "setEditorHideTransition:", 6);

    goto LABEL_22;
  }
LABEL_23:

}

- (BOOL)showDetachAlertOnDraggingGestureEnd
{
  return 0;
}

- (void)didBeginMovingOccurrenceWithGesture
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
  if (objc_msgSend(v8, "count") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
    v4 = objc_msgSend(v3, "count");

    if (v4 == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      objc_msgSend(v5, "setAlpha:", 0.0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      objc_msgSend(v7, "setAlpha:", 1.0);

    }
  }

}

- (void)eventViewControllerDidReceiveEditUserInteraction:(id)a3
{
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4) = 1;
}

- (BOOL)enqueueableManagedNavigationControllerShouldEnqueuePresentationDismissals:(id)a3
{
  return 1;
}

- (void)handleCloseKeyCommand
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

    if (v4)
      -[LargeDayViewController _selectEvent:animated:context:](self, "_selectEvent:animated:context:", 0, 1, 0);
  }
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedOccurrences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  -[DayViewController _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected](self, "_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
    objc_msgSend(v10, "endForcedStart");

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "isReminderIntegrationEvent"))
        {
          v16 = 0;
          goto LABEL_13;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_13:

  v17 = objc_msgSend(v11, "count");
  if ((v16 & 1) == 0 && v17 != (id)1 && !self->_modalEditing)
  {
    -[LargeDayViewController _selectEvent:animated:context:](self, "_selectEvent:animated:context:", 0, 0, 0);
LABEL_20:
    -[LargeDayViewController updateNoContentConfiguration](self, "updateNoContentConfiguration");
    goto LABEL_22;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  if (v18
    || (v18 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayViewController shownEventEditViewController](self, "shownEventEditViewController"))) != 0)
  {

    goto LABEL_22;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));

  if (!v19)
    goto LABEL_20;
LABEL_22:
  v20 = objc_msgSend(v11, "mutableCopy");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews", 0));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "occurrence"));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "occurrence"));
          objc_msgSend(v20, "removeObject:", v28);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v23);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "event"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "event"));
    objc_msgSend(v20, "removeObject:", v32);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
  -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v33, 1, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_navigationWrapperView + 2), 0);
  objc_storeStrong((id *)((char *)&self->_lastEventShowed + 2), 0);
  objc_storeStrong((id *)&self->_clearingSplitViewNavigationController, 0);
}

@end
