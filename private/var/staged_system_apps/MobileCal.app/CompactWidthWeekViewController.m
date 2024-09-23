@implementation CompactWidthWeekViewController

- (CompactWidthWeekViewController)initWithModel:(id)a3 window:(id)a4
{
  CompactWidthWeekViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CompactWidthWeekViewController;
  v4 = -[WeekViewController initWithModel:window:](&v7, "initWithModel:window:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_focusConfigurationChanged", CUIKCalendarModelFocusModeConfigurationChangedNotification, 0);

  }
  return v4;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v6;
  id v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v14 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v8, self);
  objc_msgSend(v14, "setPreferModalPresentation:", 1);
  objc_msgSend(v14, "setTransitioningDelegate:", self);
  *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v10, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Week"), &stru_1001B67C0, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setTitle:", v12);

  -[CUIKCalendarModel setSelectedOccurrences:](self->super.super._model, "setSelectedOccurrences:", v8);
  -[CompactWidthWeekViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v14, self, v6, 0);

}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_opt_class(EKExpandedReminderStackViewController);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
    objc_msgSend(v10, "setPreferModalPresentation:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController presentedViewController](self, "presentedViewController"));
  objc_opt_class(EKExpandedReminderStackViewController);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController presentedViewController](self, "presentedViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentationController"));
    objc_msgSend(v18, "setDelegate:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v19, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CompactWidthWeekViewController;
    -[MainViewController showViewController:sender:animated:completion:](&v20, "showViewController:sender:animated:completion:", v10, v11, v7, v12);
  }

}

- (void)loadView
{
  objc_super v3;

  self->_currentlyDisplayedMonth = -1;
  self->_currentlyDisplayedMonthInOverlayCalendar = -1;
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController loadView](&v3, "loadView");
  -[CompactWidthWeekViewController _focusConfigurationChanged](self, "_focusConfigurationChanged");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController viewWillAppear:](&v7, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "setToolbarHidden:", 1);

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
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v11.receiver = self;
  v11.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
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
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController viewWillDisappear:](&v6, "viewWillDisappear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  if (-[CompactWidthWeekViewController _focusBannerVisible](self, "_focusBannerVisible"))
  {
    -[EKUIFocusBannerView sizeToFit](self->_focusBanner, "sizeToFit");
    -[EKUIFocusBannerView frame](self->_focusBanner, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController view](self, "view"));
    objc_msgSend(v9, "bounds");
    v11 = v10;

    -[EKUIFocusBannerView setFrame:](self->_focusBanner, "setFrame:", v4, v6, v11, v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController viewWillLayoutSubviews](&v12, "viewWillLayoutSubviews");
}

- (void)updateTimeViewBaseline
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allDayView"));
  objc_msgSend(v5, "baselineForWeekdayNumbers");
  v7 = v6;

  if (v7 > 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allDayView"));
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allDayView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
    objc_msgSend(v8, "convertPoint:fromView:", v15, v11, v13);
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    objc_msgSend(v18, "setMonthTextBaselineOffset:", v7 + v17);

  }
}

- (void)layoutCellsAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController layoutCellsAnimated:](&v4, "layoutCellsAnimated:", a3);
  -[CompactWidthWeekViewController updateTimeViewBaseline](self, "updateTimeViewBaseline");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactWidthWeekViewController;
  -[CompactWidthWeekViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CompactWidthWeekViewController updateTimeViewBaseline](self, "updateTimeViewBaseline");
}

- (double)headerVerticalOffset
{
  unsigned int v3;
  double result;
  double v5;

  v3 = -[CompactWidthWeekViewController _focusBannerVisible](self, "_focusBannerVisible");
  result = 0.0;
  if (v3)
  {
    -[EKUIFocusBannerView frame](self->_focusBanner, "frame", 0.0);
    return v5;
  }
  return result;
}

- (void)updateBannerDateStrings
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController centerDateComponents](self, "centerDateComponents"));
  v3 = CUIKTodayComponents(v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v23, "month");
  if (v5 == objc_msgSend(v4, "month") && (v6 = objc_msgSend(v23, "year"), v6 == objc_msgSend(v4, "year")))
  {
    v7 = objc_msgSend(v23, "era");
    v8 = v7 == objc_msgSend(v4, "era");
  }
  else
  {
    v8 = 0;
  }
  if (v23 && objc_msgSend(v23, "month") != (id)self->_currentlyDisplayedMonth)
  {
    self->_currentlyDisplayedMonth = (int64_t)objc_msgSend(v23, "month");
    v9 = CUIKStringAbbreviationForMonth(objc_msgSend(v23, "month"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    objc_msgSend(v11, "setMonthText:isCurrentMonth:", v10, v8);

  }
  v12 = -[WeekViewController showOverlayCalendar](self, "showOverlayCalendar");
  if (v12)
  {
    v14 = CUIKGetOverlayCalendar(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = CUIKCalendar(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController centerDateComponents](self, "centerDateComponents"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateFromComponents:", v18));

    v20 = objc_msgSend(v15, "component:fromDate:", 8, v19);
    if (v20 != (id)self->_currentlyDisplayedMonthInOverlayCalendar)
    {
      self->_currentlyDisplayedMonthInOverlayCalendar = (int64_t)v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayYearStringForDate:inCalendar:](CUIKDateStrings, "overlayYearStringForDate:inCalendar:", v19, v15));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
      objc_msgSend(v22, "setOverlayMonthText:", v21);

    }
  }

}

- (void)overlayCalendarDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController overlayCalendarDidChange](&v4, "overlayCalendarDidChange");
  if (-[WeekViewController showOverlayCalendar](self, "showOverlayCalendar"))
  {
    -[CompactWidthWeekViewController updateBannerDateStrings](self, "updateBannerDateStrings");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    objc_msgSend(v3, "setOverlayMonthText:", 0);

    self->_currentlyDisplayedMonthInOverlayCalendar = -1;
  }
}

- (BOOL)_focusBannerVisible
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v3 = objc_msgSend(v2, "focusFilterMode") != 0;

  return v3;
}

- (void)_focusConfigurationChanged
{
  unsigned int v3;
  void *v4;
  _BOOL4 v5;
  EKUIFocusBannerView *focusBanner;
  EKUIFocusBannerView *v7;
  EKUIFocusBannerView *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[CompactWidthWeekViewController _focusBannerVisible](self, "_focusBannerVisible");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIFocusBannerView superview](self->_focusBanner, "superview"));
  v5 = v4 == 0;

  if (((v3 ^ v5) & 1) == 0)
  {
    focusBanner = self->_focusBanner;
    if (v3)
    {
      if (!focusBanner)
      {
        v7 = objc_opt_new(EKUIFocusBannerView);
        v8 = self->_focusBanner;
        self->_focusBanner = v7;

        -[EKUIFocusBannerView setDelegate:](self->_focusBanner, "setDelegate:", self);
        -[EKUIFocusBannerView setLayout:](self->_focusBanner, "setLayout:", 1);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController view](self, "view"));
      objc_msgSend(v9, "addSubview:", self->_focusBanner);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      -[EKUIFocusBannerView setOn:](self->_focusBanner, "setOn:", objc_msgSend(v10, "focusFilterMode") == (id)1);

    }
    else
    {
      -[EKUIFocusBannerView removeFromSuperview](focusBanner, "removeFromSuperview");
    }
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CompactWidthWeekViewController view](self, "view"));
  objc_msgSend(v11, "setNeedsLayout");

}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (void)editorDidSaveEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v5, "addOccurrenceAwaitingRefresh:", v4);

  -[WeekViewController reloadData](self, "reloadData");
}

- (void)focusBannerViewToggled:(id)a3
{
  uint64_t v4;
  id v5;

  if (-[EKUIFocusBannerView on](self->_focusBanner, "on", a3))
    v4 = 1;
  else
    v4 = 2;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v5, "setFocusFilterMode:", v4);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5;
  id v6;

  v5 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___UIViewControllerAnimatedTransitioning))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___UIViewControllerAnimatedTransitioning))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___UIViewControllerInteractiveTransitioning))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldShowCompactLayout
{
  return 1;
}

- (void)showReminderDetail:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", 0));
  v5 = objc_alloc_init((Class)UINavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v4, self, v7));

  objc_msgSend(v5, "pushViewController:animated:", v6, 0);
  -[CompactWidthWeekViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v5, self, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusBanner, 0);
}

@end
