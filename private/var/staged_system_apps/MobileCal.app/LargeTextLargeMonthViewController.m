@implementation LargeTextLargeMonthViewController

+ (Class)monthWeekViewClass
{
  return (Class)objc_opt_class(LargeTextLargeMonthWeekView);
}

+ (BOOL)shouldAnimateTransitionToDay
{
  return 0;
}

- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeMonthViewController nextLevelWeekViewControllerWithDate:](self, "nextLevelWeekViewControllerWithDate:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

  return v6;
}

- (id)nextLevelWeekViewControllerWithDate:(id)a3
{
  WeekViewContainerViewController *v4;
  CUIKCalendarModel *model;
  void *v6;
  WeekViewContainerViewController *v7;

  -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super.super._model, "setSelectedDate:", a3);
  v4 = [WeekViewContainerViewController alloc];
  model = self->super.super.super.super.super._model;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v7 = -[MainViewControllerContainer initWithModel:window:](v4, "initWithModel:window:", model, v6);

  return v7;
}

- (void)updatePalette:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeTextLargeMonthViewController;
  v3 = a3;
  -[CompactWidthMonthViewController updatePalette:](&v4, "updatePalette:", v3);
  objc_msgSend(v3, "setTodayButtonVisible:", 1, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setDateStringVisible:", 1);

}

- (void)updateNavigationBarDisplayedDateString
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewOnScreen](self, "dateOfCenterViewOnScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNavBarStringFromDate:includeMonth:includeYear:", v4, 1, 1);

}

- (BOOL)dividedListMode
{
  return 0;
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  return -52534682;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (BOOL)pinchToZoomAllowed
{
  return 0;
}

- (void)didScroll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  LargeTextLargeMonthViewController *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LargeTextLargeMonthViewController;
  -[CompactWidthMonthViewController didScroll](&v8, "didScroll");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController targetCalendarDate](self, "targetCalendarDate"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeMonthViewController navigationController](self, "navigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topMainViewControllerContainer"));
    if ((objc_msgSend(v5, "currentChildViewControllerIsLoaded") & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topMainViewControllerContainer"));
      v7 = (LargeTextLargeMonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));

      if (v7 == self)
        objc_msgSend(v4, "setNavBarStringFromDate:includeMonth:includeYear:", v3, 1, 1);
    }
    else
    {

    }
  }

}

@end
