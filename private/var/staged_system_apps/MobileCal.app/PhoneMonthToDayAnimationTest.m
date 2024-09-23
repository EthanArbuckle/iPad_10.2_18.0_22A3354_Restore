@implementation PhoneMonthToDayAnimationTest

- (id)notificationName
{
  return CFSTR("PhoneMonthDayAnimator_MonthToDayAnimationCompleteNotification");
}

- (void)setUp
{
  EKCalendarDate *v3;
  EKCalendarDate *initialDate;
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  MonthViewController *v8;
  MonthViewController *monthViewController;
  id v10;

  v3 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  initialDate = self->_initialDate;
  self->_initialDate = v3;

  v5 = self->_initialDate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v6, "setSelectedDate:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));

  v8 = (MonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resetToMonthView"));
  monthViewController = self->_monthViewController;
  self->_monthViewController = v8;

}

- (void)kickOffAnimation
{
  MonthViewController *monthViewController;
  void *v3;
  id v4;
  id v5;

  monthViewController = self->_monthViewController;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedDate"));
  v4 = -[MonthViewController pushedDayViewControllerWithDate:animated:](monthViewController, "pushedDayViewControllerWithDate:animated:", v3, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
