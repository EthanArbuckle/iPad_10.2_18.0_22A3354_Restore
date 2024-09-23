@implementation CompactDayViewController

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController navigationController](self, "navigationController"));
  if ((objc_opt_respondsToSelector(v4, "updateBackButtonToDate:") & 1) != 0)
    objc_msgSend(v4, "updateBackButtonToDate:", v5);

}

- (void)willMoveToParentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CompactDayViewController;
  -[CompactDayViewController willMoveToParentViewController:](&v8, "willMoveToParentViewController:");
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedOccurrence"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      objc_msgSend(v7, "setSelectedOccurrence:", 0);

    }
  }
}

- (void)_receivedSelectedDateChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CompactDayViewController;
  -[DayViewController _receivedSelectedDateChangeNotification:](&v6, "_receivedSelectedDateChangeNotification:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));
  -[CompactDayViewController _updateBackButtonOnBackViewControllerToDate:](self, "_updateBackButtonOnBackViewControllerToDate:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
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
  v11.super_class = (Class)CompactDayViewController;
  -[DayViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self, "day"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
}

- (void)_updateWeekDayHeaderDayFrames
{
  void *v2;
  id v3;

  v2 = *(void **)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CompactDayViewController dayHeaderFrames](self, "dayHeaderFrames"));
  objc_msgSend(v2, "setDayHeaderFrames:", v3);

}

- (void)updatePalette:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "setTodayButtonVisible:", 0);
  objc_msgSend(v4, "setDateStringVisible:", 0);
  objc_msgSend(v4, "setDividerLineVisible:", 1);
  objc_msgSend(v4, "setFocusBannerPlacement:", 1);
  -[CompactDayViewController _updateWeekDayHeaderDayFrames](self, "_updateWeekDayHeaderDayFrames");
  v7.receiver = self;
  v7.super_class = (Class)CompactDayViewController;
  -[DayViewController updatePalette:](&v7, "updatePalette:", v4);
  v5 = *(void **)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1);
  *(_QWORD *)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1) = v4;
  v6 = v4;

  objc_msgSend(v6, "setNeedsLayout");
}

- (int)supportedToggleMode
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)showWeekdayLabel
{
  return 1;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (id)cellFactory
{
  return objc_opt_new(CompactDayNavigationViewCellFactory);
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactDayViewController;
  -[CompactDayViewController viewIsAppearing:](&v4, "viewIsAppearing:", a3);
  -[CompactDayViewController ekui_adjustNavAndToolBarToTranslucentGrayStyles](self, "ekui_adjustNavAndToolBarToTranslucentGrayStyles");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CompactDayViewController;
  -[DayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4);
  if (height > width)
    v7 = 1;
  else
    v7 = 4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v8, "validateInterfaceOrientationWithFutureOrientation:", v7);

}

- (void)dayViewController:(id)a3 didStartDeceleratingTargettingDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CompactDayViewController;
  v6 = a4;
  -[DayViewController dayViewController:didStartDeceleratingTargettingDate:](&v11, "dayViewController:didStartDeceleratingTargettingDate:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", v11.receiver, v11.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v6, v9));

  -[CompactDayViewController _updateBackButtonOnBackViewControllerToDate:](self, "_updateBackButtonOnBackViewControllerToDate:", v10);
}

- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSBundle *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _BOOL4 v25;

  v25 = a5;
  v7 = a4;
  v24 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController parentViewController](self, "parentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dayComponents"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendar"));
  v15 = CUIKStringForDateComponents(v12, v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v9, "setBackButtonTitle:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", v7));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v24, self, v17));

  -[CompactDayViewController ekui_adjustToolBarToTransparentStyle](self, "ekui_adjustToolBarToTransparentStyle");
  objc_msgSend(v18, "ekui_adjustNavBarToTransparentStyle");
  v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Day"), &stru_1001B67C0, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v22, "setTitle:", v21);

  -[CompactDayViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v18, self, v25, 0);
  return v18;
}

- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v6, self);

  objc_msgSend(v7, "setTransitioningDelegate:", self);
  objc_msgSend(v7, "setPreferModalPresentation:", 1);
  -[CompactDayViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v7, self, v4, 0);
  return v7;
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
  v13 = objc_opt_class(EKExpandedReminderStackViewController);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
    objc_msgSend(v10, "setPreferModalPresentation:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController presentedViewController](self, "presentedViewController"));
  v15 = objc_opt_class(EKExpandedReminderStackViewController);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController presentedViewController](self, "presentedViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentationController"));
    objc_msgSend(v18, "setDelegate:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v19, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CompactDayViewController;
    -[MainViewController showViewController:sender:animated:completion:](&v20, "showViewController:sender:animated:completion:", v10, v11, v7, v12);
  }

}

- (void)showEditViewController:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = objc_msgSend(v4, "isNew");

  if (v5)
    objc_msgSend(v7, "setModalPresentationDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  return 0;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "occurrenceViewForEvent:", v4));

  return v6;
}

- (BOOL)shouldShowCompactLayout
{
  return 1;
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

- (id)dayHeaderFrames
{
  void *v3;
  double y;
  double x;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  int IsLeftToRight;
  void *v14;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  v6 = -[DayViewController cellSize](self, "cellSize");
  v9 = v8;
  v11 = v10;
  v12 = 7;
  do
  {
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, v9, v11));
    if (IsLeftToRight)
      objc_msgSend(v3, "addObject:", v14);
    else
      objc_msgSend(v3, "insertObject:atIndex:", v14, 0);

    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = v9;
    v16.size.height = v11;
    x = CGRectGetMaxX(v16);
    --v12;
  }
  while (v12);
  return v3;
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[CompactDayViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedOccurrence"));

  v13.receiver = self;
  v13.super_class = (Class)CompactDayViewController;
  -[DayViewController eventEditViewController:didCompleteWithAction:completionHandler:](&v13, "eventEditViewController:didCompleteWithAction:completionHandler:", v9, a4, v8);

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v12, "setSelectedOccurrence:", 0);

  }
}

- (id)calendarModel
{
  return self->super.super._model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1), 0);
}

@end
