@implementation PhoneDayToMonthAnimationTest

- (id)notificationName
{
  return CFSTR("PhoneMonthDayAnimator_DayToMonthAnimationCompleteNotification");
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
  MonthViewController *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  initialDate = self->_initialDate;
  self->_initialDate = v3;

  v5 = self->_initialDate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v6, "setSelectedDate:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));

  v8 = (MonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resetToMonthView"));
  monthViewController = self->_monthViewController;
  self->_monthViewController = v8;

  v10 = self->_monthViewController;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedDate"));
  v13 = -[MonthViewController pushedDayViewControllerWithDate:animated:](v10, "pushedDayViewControllerWithDate:animated:", v12, 0);

}

- (void)kickOffAnimation
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationController](self->_monthViewController, "navigationController"));
  v2 = objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
