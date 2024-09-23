@implementation MonthToYearAnimationTest

- (id)notificationName
{
  return CFSTR("YearMonthAnimator_MonthToYearAnimationCompleteNotification");
}

- (void)setUp
{
  void *v3;
  MonthViewController *v4;
  MonthViewController *monthViewController;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));

  v4 = (MonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToMonthView"));
  monthViewController = self->_monthViewController;
  self->_monthViewController = v4;

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
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
