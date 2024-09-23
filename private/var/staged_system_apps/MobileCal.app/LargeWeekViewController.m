@implementation LargeWeekViewController

- (LargeWeekViewController)initWithModel:(id)a3 window:(id)a4
{
  LargeWeekViewController *v4;
  LargeWeekViewController *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LargeWeekViewController;
  v4 = -[WeekViewController initWithModel:window:](&v9, "initWithModel:window:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WeekViewController setDisplaysDatesSnappedToWeekBoundaries:](v4, "setDisplaysDatesSnappedToWeekBoundaries:", 1);
    v6 = objc_alloc_init((Class)NSOperationQueue);
    -[LargeWeekViewController setShowEventDetailsOperationQueue:](v5, "setShowEventDetailsOperationQueue:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController showEventDetailsOperationQueue](v5, "showEventDetailsOperationQueue"));
    objc_msgSend(v7, "setMaxConcurrentOperationCount:", 1);

  }
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

    return (unint64_t)v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeWeekViewController;
    return -[LargeWeekViewController supportedInterfaceOrientations](&v7, "supportedInterfaceOrientations");
  }
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LargeWeekViewController;
  -[WeekViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));

  if (!v3)
  {
    v6 = CUIKTodayDate(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v7, v10));
    -[WeekViewController setDisplayedDate:](self, "setDisplayedDate:", v11);

  }
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
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];
  _QWORD v28[7];
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGAffineTransform v34;
  _BYTE v35[128];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[LargeWeekViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
    {
      -[WeekViewController setRotating:](self, "setRotating:", 1);
      self->_hasAlreadyAdjustedVisibleRects = 0;
      if (v7)
        objc_msgSend(v7, "targetTransform");
      else
        memset(&v34, 0, sizeof(v34));
      if (CGAffineTransformIsIdentity(&v34))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController weekScroller](self, "weekScroller"));
        objc_msgSend(v10, "bounds");
        v12 = v11;

        if (width >= v12)
          v12 = width;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController weekScroller](self, "weekScroller"));
              objc_msgSend(v19, "bounds");
              v21 = v20;
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController weekScroller](self, "weekScroller"));
              objc_msgSend(v22, "bounds");
              v24 = v23;

              objc_msgSend(v18, "adjustForVisibleRect:", 0.0, v21, v12, v24);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          }
          while (v15);
        }

        self->_hasAlreadyAdjustedVisibleRects = 1;
      }
      if (v7)
      {
        if (+[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted"))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000C4C28;
          v29[3] = &unk_1001B2538;
          v29[4] = self;
          objc_msgSend(v25, "installCACommitCompletionBlock:", v29);

        }
        v27[4] = self;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000C4C74;
        v28[3] = &unk_1001B4BC0;
        v28[4] = self;
        *(double *)&v28[5] = width;
        *(double *)&v28[6] = height;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000C4CD4;
        v27[3] = &unk_1001B2C38;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", v28, v27);
      }
      else
      {
        -[LargeWeekViewController _resizeInterfaceForWindowSize:](self, "_resizeInterfaceForWindowSize:", width, height);
        self->_hasAlreadyAdjustedVisibleRects = 0;
        -[LargeWeekViewController updateVisibleRects](self, "updateVisibleRects");
      }
      v26.receiver = self;
      v26.super_class = (Class)LargeWeekViewController;
      -[WeekViewController viewWillTransitionToSize:withTransitionCoordinator:](&v26, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    }
  }

}

- (void)_resizeInterfaceForWindowSize:(CGSize)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  if (!self->_isTransformingInterfaceSize)
  {
    if (-[WeekViewController usePortraitLayoutForSize:](self, "usePortraitLayoutForSize:", a3.width, a3.height))
      v4 = 1;
    else
      v4 = 4;
    self->_isTransformingInterfaceSize = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeView"));
    objc_msgSend(v6, "setOrientation:", v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    objc_msgSend(v7, "sizeToFit");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "weekView"));
          objc_msgSend(v14, "setOrientation:", v4);

          objc_msgSend(v13, "setNeedsLayout");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v10);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController reusableViews](self, "reusableViews"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "weekView"));
          objc_msgSend(v21, "setOrientation:", v4);

          objc_msgSend(v20, "setNeedsLayout");
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v17);
    }

    -[WeekViewController resizeWeekGroupsIfNeededForOrientation:](self, "resizeWeekGroupsIfNeededForOrientation:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
    objc_msgSend(v22, "setNeedsLayout");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "superview"));

    if (v24)
      -[WeekViewController adjustVisibleAllDayOccurrenceLabelsAnimated:](self, "adjustVisibleAllDayOccurrenceLabelsAnimated:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v26 = objc_msgSend(v25, "isSuspended");

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
    if (objc_msgSend(v27, "count"))
    {
      v28 = 0;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "draggingView"));
      v28 = v30 == 0;

    }
    if (((v26 | v28) & 1) != 0)
    {
      self->_isTransformingInterfaceSize = 0;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C50B8;
      block[3] = &unk_1001B2538;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)updateVisibleRects
{
  objc_super v2;

  if (!self->_hasAlreadyAdjustedVisibleRects)
  {
    v2.receiver = self;
    v2.super_class = (Class)LargeWeekViewController;
    -[WeekViewController updateVisibleRects](&v2, "updateVisibleRects");
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
  EKEvent *eventToPresentOnAppear;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;

  v12.receiver = self;
  v12.super_class = (Class)LargeWeekViewController;
  -[WeekViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  self->_viewDidAppear = 1;
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
  -[WeekViewController currentScrollViewXOffset](self, "currentScrollViewXOffset");
  -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", 0);
  -[LargeWeekViewController updateNavigationBarDisplayedDateString](self, "updateNavigationBarDisplayedDateString");
  if (self->_eventToPresentOnAppear)
  {
    -[LargeWeekViewController _scrollEventIntoViewAndRequestPresentPopoverForEvent:](self, "_scrollEventIntoViewAndRequestPresentPopoverForEvent:");
    eventToPresentOnAppear = self->_eventToPresentOnAppear;
    self->_eventToPresentOnAppear = 0;

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeWeekViewController;
  -[LargeWeekViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->_viewDidAppear = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LargeWeekViewController;
  -[WeekViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_weekViewDidEndScrolling:", CFSTR("WeekViewController_ScrollDidEndAnimationNotification"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[LargeWeekViewController _resizeInterfaceForWindowSize:](self, "_resizeInterfaceForWindowSize:", v6, v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("WeekViewController_ScrollDidEndAnimationNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, EKDayOccurrenceViewDidEndSelectionNotification, 0);
  -[LargeWeekViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
  objc_msgSend(v7, "_setHidesShadow:", 0);

  v8.receiver = self;
  v8.super_class = (Class)LargeWeekViewController;
  -[WeekViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);

}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  self->_suppressInitialScrollToCurrentTime = 1;
  objc_opt_class(EKExpandedReminderStackViewController);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
  {
    objc_msgSend(v10, "setPreferModalPresentation:", 0);
    goto LABEL_9;
  }
  objc_opt_class(EKEventViewController);
  if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
  {
    v15 = v10;
    objc_msgSend(v15, "setMinimalMode:", -[LargeWeekViewController eventViewControllerUseMinimalMode:](self, "eventViewControllerUseMinimalMode:", v15));
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class(EKEventEditViewController);
  if ((objc_opt_isKindOfClass(v10, v16) & 1) != 0
    || (objc_opt_class(AddEventViewController), (objc_opt_isKindOfClass(v10, v17) & 1) != 0))
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
    self->_isPresentingPageSheet = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing((uint64_t)v15, v18) ^ 1;
    goto LABEL_8;
  }
LABEL_9:
  v19.receiver = self;
  v19.super_class = (Class)LargeWeekViewController;
  -[MainViewController showViewController:sender:animated:completion:](&v19, "showViewController:sender:animated:completion:", v10, v11, v7, v12);

}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)suppressInitialScrollToCurrentTime
{
  return self->_suppressInitialScrollToCurrentTime;
}

- (Class)managedNavigationControllerType
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v4)
  {
    objc_opt_class(DeniesInternalPresentationEnqueueableManagedNavigationController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LargeWeekViewController;
    v7 = -[MainViewController managedNavigationControllerType](&v9, "managedNavigationControllerType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return (Class)v6;
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  void *v3;
  _BOOL4 isPresentingPageSheet;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  if ((EKUICurrentHeightSizeClassIsRegular() & 1) != 0)
  {

    return 7;
  }
  else
  {
    isPresentingPageSheet = self->_isPresentingPageSheet;

    if (isPresentingPageSheet)
      return 1;
    else
      return 7;
  }
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  CGRect v43;
  CGRect v44;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
    v18 = CUIKStringForDate(v17, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138412546;
    v40 = v16;
    v41 = 2112;
    v42 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "LargeWeekViewController showEvent:animated:showMode:context:completion asked to show event named '%@' starting on '%@'.", buf, 0x16u);

  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000C5D0C;
  v36[3] = &unk_1001B2E30;
  v20 = v13;
  v37 = v20;
  v21 = objc_retainBlock(v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController presentedViewController](self, "presentedViewController"));
  v23 = objc_msgSend(v22, "isBeingDismissed");

  if (v23)
  {
    v24 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "LargeWeekViewController showEvent:animated:showMode:context:completion unable to show event due to dismissing presentation.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (a5 == 3)
  {
    -[LargeWeekViewController _showEditorForEvent:](self, "_showEditorForEvent:", v11);
LABEL_8:
    ((void (*)(_QWORD *))v21[2])(v21);
    goto LABEL_19;
  }
  v38 = v11;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  -[LargeWeekViewController _setSelectedEvents:](self, "_setSelectedEvents:", v25);

  v26 = a5 == 2;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v11));
  v28 = v27;
  if (!v27
    || (objc_msgSend(v27, "frame"), CGRectIsEmpty(v43))
    || (objc_msgSend(v28, "frame"), CGRectIsNull(v44))
    || (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate")),
        v31 = -[WeekViewController dateIsVisible:](self, "dateIsVisible:", v32),
        v32,
        (v31 & 1) == 0))
  {
    v29 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "LargeWeekViewController showEvent:animated:showMode:context:completion got an invalid occurrenceView. Setting up for deferred popover presentation.", buf, 2u);
    }
    self->_shouldPresentEventCommentsForSelectedOccurrence = v26;
    -[LargeWeekViewController setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:](self, "setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startCalendarDate"));
    -[LargeWeekViewController selectDate:animated:](self, "selectDate:animated:", v30, 0);

    ((void (*)(_QWORD *))v21[2])(v21);
  }
  else if (a5)
  {
    -[LargeWeekViewController _displayEventDetailsViewControllerForEvent:showComment:context:completion:](self, "_displayEventDetailsViewControllerForEvent:showComment:context:completion:", v11, a5 == 2, v12, v20);
  }
  else
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000C5D20;
    v33[3] = &unk_1001B3158;
    v33[4] = self;
    v34 = v11;
    v35 = v21;
    -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 0, 0, v33);

  }
LABEL_19:

}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  _BOOL8 v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint8_t v24[16];
  void *v25;
  CGRect v26;
  CGRect v27;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController presentedViewController](self, "presentedViewController"));
  v10 = objc_msgSend(v9, "isBeingDismissed");

  if (v10)
  {
    v11 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LargeWeekViewController showEvent:animated:showMode:context:completion unable to show event due to dismissing presentation.", v24, 2u);
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v25 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    -[LargeWeekViewController _setSelectedEvents:](self, "_setSelectedEvents:", v13);

    v14 = a5 == 2;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v15));

    if (!v16
      || (objc_msgSend(v16, "frame"), CGRectIsEmpty(v26))
      || (objc_msgSend(v16, "frame"), CGRectIsNull(v27))
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate")),
          v19 = -[WeekViewController dateIsVisible:](self, "dateIsVisible:", v18),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      v22 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "LargeWeekViewController showEvent:animated:showMode:context:completion got an invalid occurrenceView. Setting up for deferred popover presentation.", v24, 2u);
      }
      self->_shouldPresentEventCommentsForSelectedOccurrence = v14;
      -[LargeWeekViewController setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:](self, "setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:", 1);
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startCalendarDate"));
      -[LargeWeekViewController selectDate:animated:](self, "selectDate:animated:", v23, 0);

    }
    else
    {
      v20 = a5 == 2;
      v21 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v8, self);
      -[LargeWeekViewController _presentEventViewController:forOccurrenceView:animated:showComments:completion:](self, "_presentEventViewController:forOccurrenceView:animated:showComments:completion:", v21, v16, 1, v20, 0);
    }

  }
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  -[LargeWeekViewController showEvent:animated:showMode:context:completion:](self, "showEvent:animated:showMode:context:completion:", a3, a4, a5, a6, 0);
}

- (void)showReminderDetail:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSNumber *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;

  v4 = a3;
  v14 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, EKUIEventDetailsContext_AllowsCalendarPreview);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, EKUIEventDetailsContext_CalendarPreviewIsInlineDayView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", EKUICurrentWindowInterfaceParadigm(v5, v6) == 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, EKUIEventDetailsContext_MinimalMode);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  v11 = +[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:allowInlinePreview:previewInline:minimalMode:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:allowInlinePreview:previewInline:minimalMode:", v4, self, v14, 0, 0, EKUICurrentWindowInterfaceParadigm(v9, v10) == 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v4));
  -[LargeWeekViewController _presentEventViewController:forOccurrenceView:animated:showComments:completion:](self, "_presentEventViewController:forOccurrenceView:animated:showComments:completion:", v12, v13, 1, 0, 0);

}

- (BOOL)_tooFarToAnimate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  BOOL v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));

    if (!v8)
    {
      v20 = 1;
      goto LABEL_10;
    }
    v10 = CUIKCalendar(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 512, 4096, v11);
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v15, v16, 0));
    v18 = (unint64_t)objc_msgSend(v17, "day") / v13;

    if (v18 >= 0)
      v19 = v18;
    else
      v19 = -v18;
    v20 = v19 > 3;
  }
  else
  {
    v20 = 1;
  }

LABEL_10:
  return v20;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v7, "setSelectedDate:", v6);

  if (v6)
  {
    -[WeekViewController setDisplayedDate:animated:](self, "setDisplayedDate:animated:", v6, v4 & ~-[LargeWeekViewController _tooFarToAnimate:](self, "_tooFarToAnimate:", v6));
  }
  else
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "LargeWeekViewController selectDate:animated: was called with a nil date.", v9, 2u);
    }
  }

}

- (void)updateNavigationBarDisplayedDateString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  LargeWeekViewController *v7;
  void *v8;
  id v9;

  v3 = objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topMainViewControllerContainer"));
    v7 = (LargeWeekViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));

    if (v7 == self)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationController](self, "navigationController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
      objc_msgSend(v9, "setNavBarStringFromDate:includeMonth:includeYear:", v8, 1, 1);

    }
  }
}

- (BOOL)eventViewControllerShowsInlinePreview
{
  return 0;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    v4 = v5 == 0;

  }
  return v4;
}

- (void)navigateToNextSelectableItem
{
  -[LargeWeekViewController _selectNextEventInForwardDirection:](self, "_selectNextEventInForwardDirection:", 1);
}

- (void)navigateToPreviousSelectableItem
{
  -[LargeWeekViewController _selectNextEventInForwardDirection:](self, "_selectNextEventInForwardDirection:", 0);
}

- (void)_selectNextEventInForwardDirection:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  LargeWeekViewController *v29;
  _QWORD v30[4];
  id v31;
  id location[3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationThrottleOperation](self, "navigationThrottleOperation"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TimerOperation operationWithTimeInterval:](TimerOperation, "operationWithTimeInterval:", 0.1));
    -[LargeWeekViewController setNavigationThrottleOperation:](self, "setNavigationThrottleOperation:", v6);

    objc_initWeak(location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000C68B8;
    v30[3] = &unk_1001B3F90;
    objc_copyWeak(&v31, location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationThrottleOperation](self, "navigationThrottleOperation"));
    objc_msgSend(v7, "setCompletionBlock:", v30);

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationThrottleOperation](self, "navigationThrottleOperation"));
  if ((objc_msgSend(v8, "isExecuting") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationThrottleOperation](self, "navigationThrottleOperation"));
    v10 = objc_msgSend(v9, "isFinished");

    if ((v10 & 1) != 0)
      return;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationThrottleOperation](self, "navigationThrottleOperation"));
    objc_msgSend(v11, "addOperation:", v12);

    v13 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationThrottleOperation](self, "navigationThrottleOperation"));
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#NavigationThrottle Added navigation throttle operation: %@", (uint8_t *)location, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController showEventDetailsOperationQueue](self, "showEventDetailsOperationQueue"));
    objc_msgSend(v16, "cancelAllOperations");

    v17 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController showEventDetailsOperationQueue](self, "showEventDetailsOperationQueue"));
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#ShowDetails Canceled all show event details timer operations in queue: %@", (uint8_t *)location, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _visibleOccurrenceViewsWithOptions:](self, "_visibleOccurrenceViewsWithOptions:", 0));
    v20 = objc_alloc((Class)EKDayOccurrenceViewIterator);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedOccurrence"));
    v23 = objc_msgSend(v20, "initWithOccurrenceViews:selectedEvent:", v8, v22);

    if (a3)
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "next"));
    else
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "previous"));
    v25 = v24;
    if (v24)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "occurrence"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000C6A20;
      v27[3] = &unk_1001B26A0;
      v28 = v25;
      v29 = self;
      -[LargeWeekViewController showEvent:animated:showMode:context:completion:](self, "showEvent:animated:showMode:context:completion:", v26, 1, 0, 0, v27);

    }
  }

}

- (void)showNextOccurrenceOfSelectableItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

    if (v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
      -[LargeWeekViewController eventViewControllerNextButtonWasTapped:](self, "eventViewControllerNextButtonWasTapped:", v8);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedOccurrence"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextOccurrence"));

      v7 = v8;
      if (!v8)
      {
LABEL_7:

        return;
      }
      -[LargeWeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v8, 1, 1, 0);
    }
    v7 = v8;
    goto LABEL_7;
  }
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

    if (v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
      -[LargeWeekViewController eventViewControllerPreviousButtonWasTapped:](self, "eventViewControllerPreviousButtonWasTapped:", v8);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedOccurrence"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousOccurrence"));

      v7 = v8;
      if (!v8)
      {
LABEL_7:

        return;
      }
      -[LargeWeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v8, 1, 1, 0);
    }
    v7 = v8;
    goto LABEL_7;
  }
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeWeekViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 1, a3);
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeWeekViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 0, a3);
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
  -[LargeWeekViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedDate"));

  if (v5)
    v8 = 1;
  else
    v8 = -1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateByAddingWeeks:", v8));
  -[LargeWeekViewController selectDate:animated:](self, "selectDate:animated:", v9, v4);

}

- (void)_weekViewDidEndScrolling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  dispatch_time_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  BOOL v46;
  void *v47;
  void *v48;
  _QWORD block[5];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("WeekViewController_ScrollDidEndAnimationRangeStartKey")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("WeekViewController_ScrollDidEndAnimationRangeEndKey")));

  v9 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    v11 = CUIKStringForDate(v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = CUIKStringForDate(v8, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138412546;
    v51 = v12;
    v52 = 2112;
    v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _weekViewDidEndScrolling: %@ to %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedOccurrence"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v18 = v17;
  if (v17
    && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentingViewController")),
        v19,
        !v19))
  {
    if (v6 && v8)
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v37 = v36;
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startCalendarDate"));
      objc_msgSend(v40, "absoluteTime");
      v42 = v41;

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endCalendarDate"));
      objc_msgSend(v43, "absoluteTime");
      v45 = v44;

      if (v42 >= v37 && v45 <= v39)
        goto LABEL_36;
      if (v42 <= v39 && v45 >= v39 || (v45 < v39 ? (v46 = v45 < v37) : (v46 = 0), v42 <= v37 && !v46))
      {
LABEL_36:
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "event"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v47));

        if (v48)
          -[LargeWeekViewController _presentEventViewController:forOccurrenceView:animated:showComments:](self, "_presentEventViewController:forOccurrenceView:animated:showComments:", v18, v48, 0, 0);

      }
    }
  }
  else if (-[LargeWeekViewController isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView](self, "isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView")&& v16&& v6&& v8)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v21 = v20;
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startCalendarDate"));
    objc_msgSend(v24, "absoluteTime");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endCalendarDate"));
    objc_msgSend(v27, "absoluteTime");
    v29 = v28;

    if (v26 >= v21 && v29 <= v23)
      goto LABEL_18;
    if (v26 <= v23 && v29 >= v23 || (v29 < v23 ? (v30 = v29 < v21) : (v30 = 0), v26 <= v21 && !v30))
    {
LABEL_18:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v16));

      if (!v31)
      {
        v32 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _weekViewDidEndScrolling: scrolling ended, and selected occurrence should be within displayed time span, but occurrence view still not present. Reloading data and laying out.", buf, 2u);
        }
        -[WeekViewController reloadData](self, "reloadData");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
        objc_msgSend(v33, "layoutIfNeeded");

      }
      v34 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _weekViewDidEndScrolling: scrolled to a week that includes the selected event. Calling showEvent.", buf, 2u);
      }
      v35 = dispatch_time(0, 150000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C7618;
      block[3] = &unk_1001B2538;
      block[4] = self;
      dispatch_after(v35, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

}

- (void)setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:(BOOL)a3
{
  self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView = a3;
}

- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView
{
  return self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
}

- (void)updatePalette:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setDayScrubberController:", 0);
  objc_msgSend(v3, "setWeekdayHeaderFillsHalfWidth:", 0);
  objc_msgSend(v3, "setWeekdayHeaderVisible:", 0);
  objc_msgSend(v3, "setTodayButtonVisible:", 1);
  objc_msgSend(v3, "setDateStringVisible:", 1);
  objc_msgSend(v3, "setDividerLineVisible:", 0);
  objc_msgSend(v3, "setFocusBannerPlacement:", 2);
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(v3, "layoutIfNeeded");

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController", a3));
  v4 = v3 == 0;

  return v4;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[LargeWeekViewController _presentationControllerDidDismissPopover:cleanSelectionState:](self, "_presentationControllerDidDismissPopover:cleanSelectionState:", a3, 1);
}

- (void)_presentationControllerDidDismissPopover:(id)a3 cleanSelectionState:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:](UIPopoverPresentationController, "_setAlwaysAllowPopoverPresentations:", 0);
  -[MainViewController invalidateManagedNavigationController](self, "invalidateManagedNavigationController");
  if (v4)
    -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
  self->_shouldRePresentPopoverAfterDrag = 0;
}

- (void)eventViewControllerWillBeginEditingEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v6 = objc_msgSend(v5, "verticalSizeClass");

  if (v6 == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
    objc_msgSend(v7, "liftUpOccurrenceForEditingEvent:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
    -[WeekViewController dimOccurrence:occurrenceDate:](self, "dimOccurrence:occurrenceDate:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverPresentationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "draggingView"));
    v14 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v10, "setPassthroughViews:", v13);

    self->_shouldRePresentPopoverAfterDrag = 1;
  }
  -[LargeWeekViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view", a3));
  v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  return v4;
}

- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3
{
  return -[LargeWeekViewController eventViewDelegateShouldHandlePresentationOfEditViewController:](self, "eventViewDelegateShouldHandlePresentationOfEditViewController:", a3);
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  v12 = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing((uint64_t)v10, v11);

  if (v12)
  {
    objc_msgSend(v9, "setInternalEditViewDelegate:", self);
    objc_msgSend(v9, "setModalPresentationStyle:", 3);
    objc_msgSend(v9, "setModalTransitionStyle:", 2);
    objc_msgSend(v9, "preferredContentSize");
    objc_msgSend(v8, "setPreferredContentSize:");
    objc_msgSend(v8, "presentViewController:animated:completion:", v9, v5, 0);
  }
  else
  {
    if (!v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
      v9 = (id)objc_claimAutoreleasedReturnValue(+[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:](EKEventEditViewController, "eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:", v13, 0, self));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000C7C04;
    v15[3] = &unk_1001B26A0;
    v15[4] = self;
    v9 = v9;
    v16 = v9;
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, v15);

  }
}

- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4
{
  -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState", a3, a4);
  -[LargeWeekViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 1);
  self->_shouldRePresentPopoverAfterDrag = 0;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  objc_msgSend(a3, "setDelegate:", 0, a4);
  -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
  -[LargeWeekViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 1);
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  objc_msgSend(v8, "sourceRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v17, "setSourceRect:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sourceView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v20, "setSourceView:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  v22 = objc_msgSend(v21, "permittedArrowDirections");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v23, "setPermittedArrowDirections:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v24, "setDelegate:", self);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C7E68;
  v26[3] = &unk_1001B26A0;
  v26[4] = self;
  v27 = v6;
  v25 = v6;
  -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 1, 0, v26);

}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super.super._model, "selectedOccurrences"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
    v5 = v4 != 0;

  }
  return v5;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextOccurrence"));

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C7FA8;
    v7[3] = &unk_1001B2CD8;
    v7[4] = self;
    v8 = v6;
    v9 = v4;
    -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 1, 0, v7);

  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previousOccurrence"));

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C80B8;
    v7[3] = &unk_1001B2CD8;
    v7[4] = self;
    v8 = v6;
    v9 = v4;
    -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 1, 0, v7);

  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C81B8;
  v9[3] = &unk_1001B2CD8;
  v9[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 1, 0, v9);

}

- (BOOL)eventViewControllerShouldShowInlineEditButtonForInvitations:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
  v6 = objc_msgSend(v5, "allowsParticipationStatusModifications");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  if (EKUICurrentHeightSizeClassIsCompact(v7))
    v8 = objc_msgSend(v4, "minimalMode") & v6;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (void)eventViewControllerInlineEditButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (-[LargeWeekViewController eventViewControllerShouldShowInlineEditButtonForInvitations:](self, "eventViewControllerShouldShowInlineEditButtonForInvitations:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000C8388;
    v8[3] = &unk_1001B26A0;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:](EKEventEditViewController, "eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:", v6, 0, 0));

    -[LargeWeekViewController eventViewController:requestsDisplayOfEditViewController:animated:](self, "eventViewController:requestsDisplayOfEditViewController:animated:", v4, v7, 1);
  }

}

- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController
{
  return !self->_isPresentingPageSheet;
}

- (void)_presentDetailViewControllerAsPageSheet:(id)a3
{
  self->_isPresentingPageSheet = 1;
  self->_isPresentingNonMinimalMode = 1;
  -[LargeWeekViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", a3, self, 1, 0);
}

- (void)_closeEventPresentationAnimated:(BOOL)a3
{
  -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", a3, 1, 0);
}

- (void)_closeEventPresentationAnimated:(BOOL)a3 cleanSelectionState:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v5 = a4;
  v6 = a3;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C8788;
  v32[3] = &unk_1001B2600;
  v8 = a5;
  v32[4] = self;
  v33 = v8;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C87B8;
  v30[3] = &unk_1001B2D80;
  v30[4] = self;
  v9 = objc_retainBlock(v32);
  v31 = v9;
  v10 = objc_retainBlock(v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  if (v11)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

    if (!v12)
    {
      ((void (*)(_QWORD *))v10[2])(v10);
      goto LABEL_18;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController presentedViewController](self, "presentedViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popoverPresentationController"));

  if (v14)
  {
    if (v6)
      v15 = 0.3;
    else
      v15 = 0.0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000C885C;
    v28[3] = &unk_1001B2538;
    v29 = v14;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000C8890;
    v24[3] = &unk_1001B4C38;
    v24[4] = self;
    v25 = v29;
    v27 = v5;
    v26 = v9;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v24, v15);

  }
  else
  {
    if (v5)
      -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController presentedViewController](self, "presentedViewController"));

    if (v16)
    {
      -[LargeWeekViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v6, v10);
    }
    else
    {
      v17 = (void *)kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        objc_opt_class(self);
        v20 = v19;
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
        *(_DWORD *)buf = 138412802;
        v35 = v20;
        v36 = 2112;
        v37 = v22;
        v38 = 2112;
        v39 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@ trying to show a new event thinks it is already showing one (shownEventViewController = %@, shownEventEditViewController = %@), and yet we are not presenting anything", buf, 0x20u);

      }
      ((void (*)(_QWORD *))v10[2])(v10);
    }
  }

LABEL_18:
}

- (void)_presentEventViewController:(id)a3 forOccurrenceView:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;

  v12 = a3;
  v13 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000C8AF8;
  v29[3] = &unk_1001B2600;
  v29[4] = self;
  v30 = a7;
  v14 = v30;
  v15 = objc_retainBlock(v29);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000C8B54;
  v23[3] = &unk_1001B43D8;
  v23[4] = self;
  v24 = v12;
  v16 = v13;
  v27 = a5;
  v28 = a6;
  v25 = v16;
  v26 = v15;
  v17 = v15;
  v18 = v12;
  v19 = objc_retainBlock(v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "occurrence"));
  if ((objc_msgSend(v20, "isNew") & 1) != 0)
  {

  }
  else
  {
    v21 = objc_msgSend(v16, "isReminderStack");

    if ((v21 & 1) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "occurrence"));
      -[WeekViewController scrollEventIntoView:animated:completion:](self, "scrollEventIntoView:animated:completion:", v22, 1, v19);

      goto LABEL_6;
    }
  }
  ((void (*)(_QWORD *, _QWORD))v19[2])(v19, 0);
LABEL_6:

}

- (void)_presentEventViewController:(id)a3 forOccurrenceView:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6
{
  -[LargeWeekViewController _presentEventViewController:forOccurrenceView:animated:showComments:completion:](self, "_presentEventViewController:forOccurrenceView:animated:showComments:completion:", a3, a4, a5, a6, 0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  int64_t v11;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "horizontalSizeClass") != (id)2)
    goto LABEL_4;
  if (objc_msgSend(v6, "verticalSizeClass") != (id)1)
    goto LABEL_4;
  objc_opt_class(v5);
  v8 = v7;
  *(_QWORD *)&v9 = objc_opt_class(UIPopoverPresentationController).n128_u64[0];
  if (v8 != v10)
    goto LABEL_4;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController", v9));
  objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
    goto LABEL_11;
  v13 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllers"));
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {

LABEL_11:
LABEL_12:
    v11 = -1;
    goto LABEL_5;
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "objectAtIndexedSubscript:", 0));

  objc_opt_class(CNContactViewController);
  LOBYTE(v17) = objc_opt_isKindOfClass(v18, v19);

  if ((v17 & 1) == 0)
    goto LABEL_12;
LABEL_4:
  v11 = (int64_t)objc_msgSend(v5, "presentationStyle");
LABEL_5:

  return v11;
}

- (void)_setSelectedEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v5, "setSelectedOccurrences:", v4);

  -[WeekViewController _clearSelectedOccurrenceViews](self, "_clearSelectedOccurrenceViews");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), (_QWORD)v12));
        -[WeekViewController _selectOccurrenceView:](self, "_selectOccurrenceView:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_displayEventDetailsViewControllerForEvent:(id)a3 showComment:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _displayEventDetailsPopoverForEvent: called", buf, 2u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C9398;
  v19[3] = &unk_1001B2E30;
  v14 = v12;
  v20 = v14;
  v15 = objc_retainBlock(v19);
  if (v10)
  {
    v22 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[LargeWeekViewController _setSelectedEvents:](self, "_setSelectedEvents:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v10));
    -[LargeWeekViewController _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:context:forceShowEditor:creationMethod:completion:](self, "_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:context:forceShowEditor:creationMethod:completion:", v17, v8, v11, 0, 0, v14);

  }
  else
  {
    v18 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _displayEventDetailsPopoverForEvent: called with nil event.", buf, 2u);
    }
    ((void (*)(_QWORD *))v15[2])(v15);
  }

}

- (void)_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:(id)a3 showComments:(BOOL)a4 context:(id)a5 forceShowEditor:(BOOL)a6 creationMethod:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  unsigned int v29;
  void *v30;
  unint64_t v31;
  _QWORD v33[4];
  id v34;
  LargeWeekViewController *v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  BOOL v40;
  BOOL v41;
  uint8_t buf[16];
  _QWORD v43[4];
  id v44;
  CGRect v45;

  v13 = a3;
  v14 = a5;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000C9708;
  v43[3] = &unk_1001B2E30;
  v15 = a8;
  v44 = v15;
  v16 = objc_retainBlock(v43);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedOccurrence"));

  if (!v18)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "occurrence"));
    v22 = objc_msgSend(v21, "isBirthday");

    if (!v22 || (v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "occurrence"))) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectedOccurrences"));

      if (v18 && (unint64_t)objc_msgSend(v18, "count") >= 2)
        -[LargeWeekViewController showEvents:animated:showMode:context:](self, "showEvents:animated:showMode:context:", v18, 1, 1, v14);
      v19 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v20 = "LargeWeekViewController _displayEventDetailsPopoverForSelectedEventWithOccurrenceView: called with nil event.";
      goto LABEL_15;
    }
  }
  if (v13)
  {
    objc_msgSend(v13, "frame");
    if (CGRectIsEmpty(v45))
    {
      v19 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = "LargeWeekViewController _displayEventDetailsPopoverForSelectedEventWithOccurrenceView: occurrence view frame is null.";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
      }
    }
    else
    {
      v31 = a7;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "event"));
      if (objc_msgSend(v25, "isEqual:", v18))
      {

      }
      else
      {
        v28 = a4;
        v30 = v14;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "event"));
        v29 = objc_msgSend(v27, "isEqual:", v18);

        v14 = v30;
        if (!v29)
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1000C971C;
          v33[3] = &unk_1001B4C88;
          v40 = a6;
          v34 = v18;
          v35 = self;
          v39 = v31;
          v36 = v30;
          v37 = v13;
          v41 = v28;
          v38 = v15;
          v18 = v18;
          -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 0, 0, v33);

          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    v19 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "LargeWeekViewController _displayEventDetailsPopoverForSelectedEventWithOccurrenceView: got nil occurrence view.";
      goto LABEL_15;
    }
  }
LABEL_19:
  ((void (*)(_QWORD *))v16[2])(v16);
LABEL_20:

}

- (void)_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:(id)a3 showComments:(BOOL)a4 creationMethod:(unint64_t)a5
{
  -[LargeWeekViewController _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:context:forceShowEditor:creationMethod:completion:](self, "_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:context:forceShowEditor:creationMethod:completion:", a3, a4, 0, 0, a5, 0);
}

- (void)_rePresentEditPopoverFromTargetView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setInternalEditViewDelegate:", self);
    objc_msgSend(v6, "refreshStartAndEndDates");
    -[LargeWeekViewController _presentEventViewController:forOccurrenceView:animated:showComments:](self, "_presentEventViewController:forOccurrenceView:animated:showComments:", v6, v4, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "draggingView"));
    v11 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v7, "setPassthroughViews:", v10);

  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
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
  uint64_t v21;
  CGSize size;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  CGSize v27;
  void *v28;
  CGFloat MidX;
  void *v30;
  CGFloat MidY;
  uint8_t v37[16];
  uint8_t buf[16];
  CGRect v39;
  CGRect v40;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController", a3));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
LABEL_5:
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));

  if (!v12)
    goto LABEL_10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownExpandedReminderStackViewController](self, "shownExpandedReminderStackViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "events"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

LABEL_6:
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v12));
    goto LABEL_11;
  }
LABEL_10:
  v13 = 0;
LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  v16 = v15;
  if (!v15)
    goto LABEL_16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "draggingView"));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "event"));

    if (!v18)
      goto LABEL_16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "event"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "occurrenceDate"));
    objc_msgSend(v16, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v19, v20, 0, 1, 0);

  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "draggingView"));

  v13 = (void *)v21;
LABEL_16:
  if (v13)
  {
    *a5 = objc_retainAutorelease(v13);
    size = CGRectNull.size;
    a4->origin = CGRectNull.origin;
    a4->size = size;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
    v24 = objc_msgSend(v23, "count");

    v25 = kCalUILogHandle;
    if (v24 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Couldn't find event for popover re-presentation, but found a selected occurrence view to use.", buf, 2u);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
      *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));

      v27 = CGRectNull.size;
      a4->origin = CGRectNull.origin;
      a4->size = v27;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Couldn't find event for popover re-presentation", v37, 2u);
      }
      *a5 = (id)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      objc_msgSend(v28, "bounds");
      MidX = CGRectGetMidX(v39);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      objc_msgSend(v30, "bounds");
      MidY = CGRectGetMidY(v40);
      a4->origin.x = MidX;
      a4->origin.y = MidY;
      __asm { FMOV            V0.2D, #20.0 }
      a4->size = _Q0;

    }
  }

}

- (BOOL)isEventAbleToShowPopover:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isNew") & 1) != 0 || (objc_msgSend(v4, "isAllDay") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForEvent:occurrenceDate:](self, "_weekGroupForEvent:occurrenceDate:", v4, 0));
    if (v7)
      goto LABEL_8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v8, v11));

    -[WeekViewController setDisplayedDate:animated:](self, "setDisplayedDate:animated:", v12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForEvent:occurrenceDate:](self, "_weekGroupForEvent:occurrenceDate:", v4, 0));

    if (v7)
    {
LABEL_8:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weekView"));
      v5 = objc_msgSend(v13, "isEventFullyVisible:", v4);

    }
    else
    {
LABEL_9:
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  void *v27;
  int v29;
  const char *v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedOccurrences"));

  if (v5 && objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController _occurrenceViewForPopoverSource](self, "_occurrenceViewForPopoverSource"));
    if (!v7)
    {
      if (objc_msgSend(v5, "count") == (id)1
        && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject")),
            v9 = objc_msgSend(v8, "isNew"),
            v8,
            v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "occurrenceDate"));
        objc_msgSend(v10, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v11, v12, 0, 0, 1);

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController _occurrenceViewForPopoverSource](self, "_occurrenceViewForPopoverSource"));
      }
      else
      {
        v7 = 0;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
    objc_msgSend(v7, "bounds");
    objc_msgSend(v15, "convertRect:fromView:", v7);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = -[LargeWeekViewController isEventAbleToShowPopover:](self, "isEventAbleToShowPopover:", v6);
    if (v7)
      v25 = v24;
    else
      v25 = 0;
    v31.origin.x = v17;
    v31.origin.y = v19;
    v31.size.width = v21;
    v31.size.height = v23;
    v26 = v25 & ~CGRectIsEmpty(v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
    objc_msgSend(v27, "bounds");
    v33.origin.x = v17;
    v33.origin.y = v19;
    v33.size.width = v21;
    v33.size.height = v23;
    v14 = v26 & CGRectIntersectsRect(v32, v33);

  }
  else
  {
    v13 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315138;
      v30 = "-[LargeWeekViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", (uint8_t *)&v29, 0xCu);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)enqueuableNavigationController:(id)a3 requestsDeferShowViewControllerUntilReady:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _BYTE v32[24];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
    objc_opt_class(v10);
    v12 = v11;
    v13 = v11;
    objc_opt_class(self);
    *(_DWORD *)v32 = 138412546;
    *(_QWORD *)&v32[4] = v12;
    *(_WORD *)&v32[12] = 2112;
    *(_QWORD *)&v32[14] = v14;
    v15 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ requested that %@ prepare itself to show the source view for the popover.", v32, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", *(_OWORD *)v32, *(_QWORD *)&v32[16]));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectedOccurrences"));

  if (v17 && objc_msgSend(v17, "count"))
  {
    if (-[LargeWeekViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:](self, "isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:", v6))
    {
      if (v7)
      {
        v18 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          v19 = v18;
          objc_opt_class(self);
          *(_DWORD *)v32 = 138412290;
          *(_QWORD *)&v32[4] = v20;
          v21 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@ found the source occurence view for the selected event, calling show block.", v32, 0xCu);

        }
        v7[2](v7, 1);
      }
    }
    else
    {
      v23 = (void *)kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = v23;
        objc_opt_class(self);
        v26 = v25;
        v27 = v25;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
        objc_opt_class(v28);
        *(_DWORD *)v32 = 138412546;
        *(_QWORD *)&v32[4] = v26;
        *(_WORD *)&v32[12] = 2112;
        *(_QWORD *)&v32[14] = v29;
        v30 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@ didn't find the source occurence view for the selected event yet. It is either loading or offscreen. %@ will be notified once it is present.", v32, 0x16u);

      }
      -[LargeWeekViewController setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:](self, "setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:", 1);
      self->_needToNotifyEnqueuedManagedNavigationController = 1;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
      if (self->_viewDidAppear)
        -[LargeWeekViewController _scrollEventIntoViewAndRequestPresentPopoverForEvent:](self, "_scrollEventIntoViewAndRequestPresentPopoverForEvent:", v31);
      else
        objc_storeStrong((id *)&self->_eventToPresentOnAppear, v31);

    }
  }
  else
  {
    v22 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v32 = 136315138;
      *(_QWORD *)&v32[4] = "-[LargeWeekViewController enqueuableNavigationController:requestsDeferShowViewControllerUntilReady:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", v32, 0xCu);
    }
    objc_msgSend(v6, "enqueueStackResetOperation");
  }

}

- (void)_scrollEventIntoViewAndRequestPresentPopoverForEvent:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CA484;
  v3[3] = &unk_1001B25D0;
  v3[4] = self;
  -[WeekViewController scrollEventIntoView:animated:completion:](self, "scrollEventIntoView:animated:completion:", a3, 1, v3);
}

- (void)enqueueableManagedNavigationController:(id)a3 requestsConfigurationOfPropertiesForPopoverPresentationController:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  void *v49;
  double x;
  double y;
  double width;
  double height;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  v12 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
    objc_opt_class(v14);
    v16 = v15;
    v17 = v15;
    objc_opt_class(self);
    *(_DWORD *)buf = 138412546;
    v66 = v16;
    v67 = 2112;
    v68 = v18;
    v19 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ requested that %@ configure the popover.", buf, 0x16u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectedOccurrences"));

  if (v21 && objc_msgSend(v21, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController _occurrenceViewForPopoverSource](self, "_occurrenceViewForPopoverSource"));
    if (!v22)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LargeWeekViewController.m"), 1338, CFSTR("No source view for popover"));

    }
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mask"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "mask"));
      objc_msgSend(v34, "frame");
      v24 = v35;
      v26 = v36;
      v28 = v37;
      v30 = v38;

    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      objc_msgSend(v40, "convertRect:fromView:", v22, v24, v26, v28, v30);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      objc_msgSend(v49, "bounds");
      v72.origin.x = v42;
      v72.origin.y = v44;
      v72.size.width = v46;
      v72.size.height = v48;
      v70 = CGRectIntersection(v69, v72);
      x = v70.origin.x;
      y = v70.origin.y;
      width = v70.size.width;
      height = v70.size.height;

      v71.origin.x = x;
      v71.origin.y = y;
      v71.size.width = width;
      v71.size.height = height;
      if (CGRectIsEmpty(v71))
      {
LABEL_14:
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "view"));
        objc_msgSend(v60, "setBackgroundColor:", v58);

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
        objc_msgSend(v61, "setModalPresentationStyle:", 7);

        objc_msgSend(v10, "setDelegate:", self);
        objc_msgSend(v10, "setSourceRect:", v24, v26, v28, v30);
        objc_msgSend(v10, "setSourceView:", v22);
        objc_msgSend(v10, "setPermittedArrowDirections:", 12);
        v64 = v22;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
        objc_msgSend(v10, "setPassthroughViews:", v62);

        if (v11)
          v11[2](v11);

        goto LABEL_17;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      objc_msgSend(v22, "convertRect:fromView:", v33, x, y, width, height);
      v24 = v54;
      v26 = v55;
      v28 = v56;
      v30 = v57;
    }

    goto LABEL_14;
  }
  v39 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Can't present popover from a nil event.", buf, 2u);
  }
LABEL_17:

}

- (id)_occurrenceViewForPopoverSource
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "draggingView"));

  if (v4)
  {
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    v6 = objc_claimAutoreleasedReturnValue(-[NSMutableSet draggingView](v5, "draggingView"));
  }
  else
  {
    v5 = objc_opt_new(NSMutableSet);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedOccurrences"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12)));
          if (v13)
            -[NSMutableSet addObject:](v5, "addObject:", v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v10);
    }

    if ((unint64_t)-[NSMutableSet count](v5, "count") >= 2)
    {
      v14 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[LargeWeekViewController _occurrenceViewForPopoverSource]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: found multiple occurrence views for selected occurrences.", buf, 0xCu);
      }
    }
    v6 = objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](v5, "anyObject"));
  }
  v15 = (void *)v6;

  return v15;
}

- (int)editorShowTransition
{
  return 6;
}

- (int)editorHideTransition
{
  return 6;
}

- (BOOL)eventViewControllerUseMinimalMode:(id)a3
{
  BOOL v3;
  void *v4;
  uint64_t v5;

  if (self->_isPresentingNonMinimalMode)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view", a3));
  v3 = EKUICurrentWindowInterfaceParadigm(v4, v5) == 8;

  return v3;
}

- (BOOL)eventGestureController:(id)a3 shouldAllowShortLiftDelay:(id)a4
{
  return objc_msgSend(a4, "isNew", a3) ^ 1;
}

- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (self->_shouldRePresentPopoverAfterDrag)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "draggingView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewSuperviewForEventGestureController:](self, "occurrenceViewSuperviewForEventGestureController:", v9));
    CalSwitchViewToSuperview(v10, v11);

  }
  -[LargeWeekViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 0);
  v12.receiver = self;
  v12.super_class = (Class)LargeWeekViewController;
  -[WeekViewController eventGestureController:didSetUpAtDate:isAllDay:](&v12, "eventGestureController:didSetUpAtDate:isAllDay:", v9, v5, a4);

}

- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  NSObject *v37;
  id v39;
  uint8_t buf[4];
  id v41;
  void *v42;
  id v43;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  -[WeekViewController updatePreferredReloadRange](self, "updatePreferredReloadRange");
  -[WeekViewController highlightDayViewCalendarDate:isAllDay:](self, "highlightDayViewCalendarDate:isAllDay:", 0, v8);
  if ((objc_msgSend(v12, "isNew") & 1) == 0)
    CalAnalyticsSendEvent(CFSTR("userDraggedEvent"), &off_1001BC988);
  if (self->_shouldRePresentPopoverAfterDrag && (objc_msgSend(v12, "isNew") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "draggingView"));
    -[LargeWeekViewController _rePresentEditPopoverFromTargetView:](self, "_rePresentEditPopoverFromTargetView:", v13);
  }
  else
  {
    if (objc_msgSend(v12, "isNew"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v15)
        objc_msgSend(v12, "setTitle:", &stru_1001B67C0);
      v43 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
      -[LargeWeekViewController _setSelectedEvents:](self, "_setSelectedEvents:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrenceDate"));
      objc_msgSend(v11, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v12, v17, 0, 0, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "draggingView"));
      objc_msgSend(v18, "setSelected:", 1);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "draggingView"));
      -[LargeWeekViewController _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:creationMethod:](self, "_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:creationMethod:", v19, 0, 1);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "popoverPresentationController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "draggingView"));
      v42 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
      objc_msgSend(v21, "setPassthroughViews:", v23);

      v24 = (id)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
      self->_shouldRePresentPopoverAfterDrag = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing((uint64_t)v24, v25);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      if (objc_msgSend(v13, "optionKeyIsDown"))
      {
        v26 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "duplicating event(s) in large week view because option key is down", buf, 2u);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pasteboardManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
        objc_msgSend(v28, "setDateForPaste:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pasteboardManager"));
        objc_msgSend(v31, "setCalendarForPaste:", 0);

        v24 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pasteboardManager"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
        objc_msgSend(v32, "duplicateEvents:withDateMode:delegate:", v33, 1, self);

      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController EKUI_editor](self, "EKUI_editor"));
        v39 = 0;
        v35 = objc_msgSend(v34, "saveEvent:span:error:", v12, a7, &v39);
        v24 = v39;

        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
          objc_msgSend(v36, "addOccurrenceAwaitingRefresh:", v12);

          -[WeekViewController editorDidSaveEvent:](self, "editorDidSaveEvent:", v12);
        }
        else
        {
          v37 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v24;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Error moving event: %@", buf, 0xCu);
          }
          objc_msgSend(v12, "revert");
          -[WeekViewController editorDidCancelEditingEvent:](self, "editorDidCancelEditingEvent:", v12);
        }
      }
    }

  }
  return 1;
}

- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (self->_shouldRePresentPopoverAfterDrag && !v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "draggingView"));
    -[LargeWeekViewController _rePresentEditPopoverFromTargetView:](self, "_rePresentEditPopoverFromTargetView:", v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)LargeWeekViewController;
  -[WeekViewController eventGestureController:didCancelEditingOccurrence:fadedOut:](&v11, "eventGestureController:didCancelEditingOccurrence:fadedOut:", v8, v9, v5);

}

- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (self->_shouldRePresentPopoverAfterDrag)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "draggingView"));
    -[LargeWeekViewController _rePresentEditPopoverFromTargetView:](self, "_rePresentEditPopoverFromTargetView:", v9);

  }
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
    v12 = objc_msgSend(v11, "containsObject:", v10);

    if (v12)
      -[WeekViewController _deselectOccurrenceView:](self, "_deselectOccurrenceView:", v10);
    else
      -[WeekViewController _selectOccurrenceView:](self, "_selectOccurrenceView:", v10);

  }
}

- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v5 = a4;
  v6 = -[LargeWeekViewController interfaceOrientation](self, "interfaceOrientation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:", EKUIWidthSizeClassForViewHierarchy(v7), v6, 1);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentImageState"));
  LODWORD(v6) = objc_msgSend(v10, "requiresLanguageAwarePadding");

  if ((_DWORD)v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentImageState"));
    objc_msgSend(v11, "totalLanguageAwareHeightPadding");
    v9 = v9 + v12;

  }
  return v9;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[LargeWeekViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id *v5;
  id v9;
  void *v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  unsigned __int8 v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;

  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "event"));
  if (v9)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000CB630;
    v29[3] = &unk_1001B2600;
    v11 = v29;
    v5 = &v30;
    v12 = v9;
    v29[4] = self;
    v30 = v12;
  }
  else
  {
    v11 = 0;
  }
  v13 = objc_retainBlock(v11);
  if (a4 == 2)
  {
    -[WeekViewController editorDidDeleteEvent:](self, "editorDidDeleteEvent:", v10);
    goto LABEL_20;
  }
  if (a4 == 1)
  {
    -[WeekViewController editorDidSaveEvent:](self, "editorDidSaveEvent:", v10);
    self->_shouldRePresentPopoverAfterDrag = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar"));
    v19 = objc_msgSend(v18, "sharingStatus");

    if (!v19)
      goto LABEL_20;
    if (v13)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000CB70C;
      v20[3] = &unk_1001B2600;
      v20[4] = self;
      v21 = v9;
      v16 = objc_retainBlock(v20);

      v17 = v21;
      goto LABEL_16;
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000CB704;
    v22[3] = &unk_1001B2538;
    v22[4] = self;
    v13 = objc_retainBlock(v22);
  }
  else
  {
    if (a4)
      goto LABEL_20;
    if ((objc_msgSend(v10, "isNew") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
      v15 = objc_msgSend(v14, "dragGestureInProgress");

      if ((v15 & 1) == 0)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000CB640;
        v28[3] = &unk_1001B2538;
        v28[4] = self;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v28, 0.2);
      }
      if (v13)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000CB6D0;
        v23[3] = &unk_1001B3158;
        v23[4] = self;
        v24 = v10;
        v25 = v9;
        v16 = objc_retainBlock(v23);

        v17 = v24;
LABEL_16:

        v13 = v16;
        goto LABEL_20;
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000CB6C4;
      v26[3] = &unk_1001B26A0;
      v26[4] = self;
      v27 = v10;
      v13 = objc_retainBlock(v26);

    }
    else
    {
      -[WeekViewController editorDidCancelEditingEvent:](self, "editorDidCancelEditingEvent:", v10);
    }
  }
LABEL_20:
  -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 1, 1, v13);

  if (v9)
}

- (id)calendarModel
{
  return self->super.super._model;
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pasteboardManager"));

  return v4;
}

- (BOOL)eventEditorPopoverActiveWhileDraggingForEventGestureController:(id)a3
{
  return self->_shouldRePresentPopoverAfterDrag;
}

- (BOOL)enableEventCreationGesture
{
  return 1;
}

- (void)createdNewEventUsingCreationGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
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
  uint64_t v20;
  void *v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    objc_msgSend(v4, "setTitle:", &stru_1001B67C0);
  v22 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  -[LargeWeekViewController _setSelectedEvents:](self, "_setSelectedEvents:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  objc_msgSend(v9, "liftUpOccurrenceForEditingEvent:", v4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "draggingView"));
  objc_msgSend(v11, "setSelected:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "draggingView"));
  -[LargeWeekViewController _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:creationMethod:](self, "_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:creationMethod:", v13, 0, 4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "popoverPresentationController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "draggingView"));
  v21 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v15, "setPassthroughViews:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  self->_shouldRePresentPopoverAfterDrag = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing((uint64_t)v19, v20);

}

- (double)headerVerticalOffset
{
  return 0.0;
}

- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  DayViewContainerViewController *v10;
  void *v11;
  DayViewContainerViewController *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v7, "setSelectedDate:", v6);

  objc_msgSend(v7, "setSelectedOccurrence:", 0);
  v8 = -[WeekViewController firstVisibleSecond](self, "firstVisibleSecond");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v9, "setFirstVisibleSecond:", v8);

  v10 = [DayViewContainerViewController alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v12 = -[MainViewControllerContainer initWithModel:window:](v10, "initWithModel:window:", v7, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v13, "pushViewController:animated:", v12, v4);

  return v12;
}

- (id)pushedListViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  ListViewContainerViewController *v8;
  void *v9;
  void *v10;
  ListViewContainerViewController *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v7, "setSelectedDate:", v6);

  v8 = [ListViewContainerViewController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v11 = -[MainViewControllerContainer initWithModel:window:](v8, "initWithModel:window:", v9, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v12, "pushViewController:animated:", v11, v4);

  return v11;
}

- (double)scrollToDisplayedDateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LargeWeekViewController;
  -[WeekViewController scrollToDisplayedDateAnimated:](&v8, "scrollToDisplayedDateAnimated:");
  v6 = v5;
  -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", v3);
  -[LargeWeekViewController _closeEventPresentationAnimated:cleanSelectionState:completion:](self, "_closeEventPresentationAnimated:cleanSelectionState:completion:", 0, 1, 0);
  return v6;
}

- (void)snapTargetScrollOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LargeWeekViewController;
  -[WeekViewController snapTargetScrollOffset:withVelocity:](&v6, "snapTargetScrollOffset:withVelocity:", a4.x, a4.y);
  if (-[WeekViewController showOverlayCalendar](self, "showOverlayCalendar"))
    -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", 1, a3->x);
}

- (void)_showMonthOverlayInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  void *v7;
  id v8;
  _QWORD v9[5];
  BOOL v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  objc_msgSend(v7, "layoutIfNeeded");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CBCD8;
  v9[3] = &unk_1001B4CA8;
  *(double *)&v9[4] = a3;
  v10 = a4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (void)overlayCalendarDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeWeekViewController;
  -[WeekViewController overlayCalendarDidChange](&v3, "overlayCalendarDidChange");
  -[WeekViewController currentScrollViewXOffset](self, "currentScrollViewXOffset");
  -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", 0);
}

- (double)minimumHourScale
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LargeWeekViewController;
  -[WeekViewController minimumHourScale](&v12, "minimumHourScale");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
  objc_msgSend(v5, "frame");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekViewController view](self, "view"));
  +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v8), 1);
  v10 = v9;

  result = v7 / v10;
  if (v4 >= v7 / v10)
    return v4;
  return result;
}

- (void)handleCloseKeyCommand
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000CBEC8;
      v5[3] = &unk_1001B2538;
      v5[4] = self;
      -[LargeWeekViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
    }
  }
}

- (void)emptySpaceClickedOnDate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeWeekViewController;
  -[WeekViewController emptySpaceClickedOnDate:](&v4, "emptySpaceClickedOnDate:", a3);
  -[WeekViewController _clearSelectedOccurrenceViews](self, "_clearSelectedOccurrenceViews");
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[LargeWeekViewController _showEditorForEvent:](self, "_showEditorForEvent:", a4);
}

- (void)_showEditorForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[LargeWeekViewController _setSelectedEvents:](self, "_setSelectedEvents:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v4));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    objc_msgSend(v7, "endForcedStart");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "occurrenceDate"));
    objc_msgSend(v8, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v4, v9, 1, 1, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "draggingView"));

  }
  -[LargeWeekViewController _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:context:forceShowEditor:creationMethod:completion:](self, "_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:showComments:context:forceShowEditor:creationMethod:completion:", v6, 0, 0, 1, 3, 0);

}

- (TimerOperation)navigationThrottleOperation
{
  return self->_navigationThrottleOperation;
}

- (void)setNavigationThrottleOperation:(id)a3
{
  objc_storeStrong((id *)&self->_navigationThrottleOperation, a3);
}

- (NSOperationQueue)showEventDetailsOperationQueue
{
  return self->_showEventDetailsOperationQueue;
}

- (void)setShowEventDetailsOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_showEventDetailsOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showEventDetailsOperationQueue, 0);
  objc_storeStrong((id *)&self->_navigationThrottleOperation, 0);
  objc_storeStrong((id *)&self->_eventToPresentOnAppear, 0);
}

@end
