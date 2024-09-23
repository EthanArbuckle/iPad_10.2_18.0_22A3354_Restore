@implementation MultiDayWeekViewController

- (MultiDayWeekViewController)initWithModel:(id)a3 window:(id)a4
{
  MultiDayWeekViewController *v4;
  DayNavigationViewController *v5;
  DayNavigationViewController *scrubberControllerNeue;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MultiDayWeekViewController;
  v4 = -[WeekViewController initWithModel:window:](&v9, "initWithModel:window:", a3, a4);
  if (v4)
  {
    v4->_numMultiDays = +[MultiDayWeekView numMultiDays](MultiDayWeekView, "numMultiDays");
    v5 = -[DayNavigationViewController initWithModel:]([DayNavigationViewController alloc], "initWithModel:", v4->super.super._model);
    scrubberControllerNeue = v4->_scrubberControllerNeue;
    v4->_scrubberControllerNeue = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController cellFactory](v4, "cellFactory"));
    -[DayNavigationViewController setCellFactory:](v4->_scrubberControllerNeue, "setCellFactory:", v7);

    -[DayNavigationViewController setDelegate:](v4->_scrubberControllerNeue, "setDelegate:", v4);
    -[MultiDayWeekViewController addChildViewController:](v4, "addChildViewController:", v4->_scrubberControllerNeue);
    -[DayNavigationViewController didMoveToParentViewController:](v4->_scrubberControllerNeue, "didMoveToParentViewController:", v4);
  }
  return v4;
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewController;
  -[MultiDayWeekViewController viewIsAppearing:](&v4, "viewIsAppearing:", a3);
  -[MultiDayWeekViewController ekui_adjustNavAndToolBarToTranslucentGrayStyles](self, "ekui_adjustNavAndToolBarToTranslucentGrayStyles");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MultiDayWeekViewController;
  v7 = a4;
  -[WeekViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100068CD8;
  v8[3] = &unk_1001B2C38;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)_significantTimeChanged:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewController;
  -[WeekViewController _significantTimeChanged:](&v4, "_significantTimeChanged:", a3);
  -[DayNavigationViewController significantTimeChangeOccurred](self->_scrubberControllerNeue, "significantTimeChangeOccurred");
}

- (BOOL)usesMultiDayWeekView
{
  return 1;
}

- (Class)weekViewClass
{
  return (Class)objc_opt_class(MultiDayWeekView);
}

- (unint64_t)daysInWeek
{
  return self->_numMultiDays;
}

- (id)dateForWeek:(int64_t)a3
{
  int IsLeftToRight;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;

  IsLeftToRight = CalTimeDirectionIsLeftToRight(self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController referenceWeekStart](self, "referenceWeekStart"));
  v7 = v6;
  if (IsLeftToRight)
    v8 = self->_numMultiDays * (a3 - 27040);
  else
    v8 = -(self->_numMultiDays * (a3 - 27040));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateByAddingDays:", v8));

  return v9;
}

- (int)supportedToggleMode
{
  return 1;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (double)headerVerticalOffset
{
  return 0.0;
}

- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  DayViewContainerViewController *v6;
  void *v7;
  void *v8;
  DayViewContainerViewController *v9;
  void *v10;

  v4 = a4;
  v6 = [DayViewContainerViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v9 = -[MainViewControllerContainer initWithModel:window:](v6, "initWithModel:window:", v7, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v9, v4);

  return v9;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MultiDayWeekViewController;
  -[WeekViewController showEvent:animated:showMode:context:](&v14, "showEvent:animated:showMode:context:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setTitle:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));

  v10 = CUIKStringForDate(v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController parentViewController](self, "parentViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
  objc_msgSend(v13, "setTitle:", v11);

}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v6;
  id v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v8 = a3;
  v13 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v8, self);
  objc_msgSend(v13, "setPreferModalPresentation:", 1);
  objc_msgSend(v13, "setTransitioningDelegate:", self);
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Week"), &stru_1001B67C0, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setTitle:", v11);

  -[CUIKCalendarModel setSelectedOccurrences:](self->super.super._model, "setSelectedOccurrences:", v8);
  -[MultiDayWeekViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v13, self, v6, 0);

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
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController presentedViewController](self, "presentedViewController"));
  v15 = objc_opt_class(EKExpandedReminderStackViewController);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController presentedViewController](self, "presentedViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentationController"));
    objc_msgSend(v18, "setDelegate:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v19, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)MultiDayWeekViewController;
    -[MainViewController showViewController:sender:animated:completion:](&v20, "showViewController:sender:animated:completion:", v10, v11, v7, v12);
  }

}

- (void)displayedDateChanged:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MultiDayWeekViewController;
  -[WeekViewController displayedDateChanged:userInitiated:](&v9, "displayedDateChanged:userInitiated:", v6, v4);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController dayScrubberController](self, "dayScrubberController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    objc_msgSend(v7, "setSelectedDate:animated:", v8, 1);

  }
}

- (void)setDisplayedDate:(id)a3 forceScroll:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MultiDayWeekViewController;
  v7 = a3;
  -[WeekViewController setDisplayedDate:forceScroll:animated:](&v10, "setDisplayedDate:forceScroll:animated:", v7, 1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController dayScrubberController](self, "dayScrubberController", v10.receiver, v10.super_class));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));

  objc_msgSend(v8, "setSelectedDate:animated:", v9, v5);
}

- (id)cellFactory
{
  return objc_opt_new(CompactDayNavigationViewCellFactory);
}

- (CGSize)cellSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController weekScrollView](self->_scrubberControllerNeue, "weekScrollView"));
  objc_msgSend(v2, "cellSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)dayScrubberController
{
  return self->_scrubberControllerNeue;
}

- (void)updatePalette:(id)a3
{
  PaletteView *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  PaletteView *palette;
  PaletteView *v10;
  id v11;

  v4 = (PaletteView *)a3;
  -[PaletteView setWeekdayHeaderVisible:](v4, "setWeekdayHeaderVisible:", 1);
  -[PaletteView setWeekdayHeaderFillsHalfWidth:](v4, "setWeekdayHeaderFillsHalfWidth:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController dayScrubberController](self, "dayScrubberController"));
  -[PaletteView setDayScrubberController:](v4, "setDayScrubberController:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v5, "setNeedsLayout");

  -[PaletteView setTodayButtonVisible:](v4, "setTodayButtonVisible:", 0);
  -[PaletteView setDateStringVisible:](v4, "setDateStringVisible:", 0);
  -[PaletteView setDividerLineVisible:](v4, "setDividerLineVisible:", 1);
  -[PaletteView setFocusBannerPlacement:](v4, "setFocusBannerPlacement:", 1);
  -[MultiDayWeekViewController _updateWeekDayHeaderDayFrames](self, "_updateWeekDayHeaderDayFrames");
  -[PaletteView sizeToFit](v4, "sizeToFit");
  -[PaletteView frame](v4, "frame");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView containingPalette](v4, "containingPalette"));
  objc_msgSend(v8, "setPreferredHeight:", v7);

  palette = self->_palette;
  self->_palette = v4;
  v10 = v4;

  -[PaletteView setNeedsLayout](v10, "setNeedsLayout");
}

- (void)_updateWeekDayHeaderDayFrames
{
  PaletteView *palette;
  id v3;

  palette = self->_palette;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewController dayHeaderFrames](self, "dayHeaderFrames"));
  -[PaletteView setDayHeaderFrames:](palette, "setDayHeaderFrames:", v3);

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
  v6 = -[MultiDayWeekViewController cellSize](self, "cellSize");
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

- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4
{
  CUIKCalendarModel *model;
  id v6;
  void *v7;
  void *v8;
  id v9;

  model = self->super.super._model;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v6, v8));

  -[MultiDayWeekViewController setDisplayedDate:forceScroll:animated:](self, "setDisplayedDate:forceScroll:animated:", v9, 1, 1);
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
  -[MultiDayWeekViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v5, self, 1, 0);

}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (int64_t)numMultiDays
{
  return self->_numMultiDays;
}

- (void)setNumMultiDays:(int64_t)a3
{
  self->_numMultiDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubberControllerNeue, 0);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
