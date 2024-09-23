@implementation PadWeekViewScrollTest

- (void)navigateToScrollView
{
  void *v3;
  void *v4;
  void *v5;
  WeekViewController *v6;
  WeekViewController *controller;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
  v6 = (WeekViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToWeekView"));
  controller = self->_controller;
  self->_controller = v6;

  -[WeekViewController setDisplayedDate:animated:](self->_controller, "setDisplayedDate:animated:", v8, 0);
}

- (id)scrollView
{
  return -[WeekViewController weekScroller](self->_controller, "weekScroller");
}

- (WeekViewController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
