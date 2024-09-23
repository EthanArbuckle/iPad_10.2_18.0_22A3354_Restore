@implementation PhoneDayViewHorizontalScrollTest_Glitches

- (void)navigateToScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DayViewController *v10;
  DayViewController *controller;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v12);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToMonthView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushedDayViewControllerWithDate:animated:", v8, 0));
  v10 = (DayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentChildViewController"));
  controller = self->_controller;
  self->_controller = v10;

}

- (id)scrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self->_controller, "dayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "horizontalScrollView"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
