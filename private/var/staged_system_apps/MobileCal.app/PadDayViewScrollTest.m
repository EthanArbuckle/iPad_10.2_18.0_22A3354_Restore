@implementation PadDayViewScrollTest

- (void)navigateToScrollView
{
  void *v3;
  void *v4;
  void *v5;
  DayViewController *v6;
  DayViewController *controller;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
  v6 = (DayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToDayView"));
  controller = self->_controller;
  self->_controller = v6;

  -[DayViewController selectDate:animated:](self->_controller, "selectDate:animated:", v8, 0);
}

- (id)scrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self->_controller, "dayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "horizontalScrollView"));

  return v3;
}

- (DayViewController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
