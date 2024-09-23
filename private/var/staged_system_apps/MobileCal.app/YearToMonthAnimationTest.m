@implementation YearToMonthAnimationTest

- (id)notificationName
{
  return CFSTR("YearMonthAnimator_YearToMonthAnimationCompleteNotification");
}

- (void)setUp
{
  void *v3;
  YearViewController *v4;
  YearViewController *yearViewController;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));

  v4 = (YearViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToYearView"));
  yearViewController = self->_yearViewController;
  self->_yearViewController = v4;

}

- (void)kickOffAnimation
{
  YearViewController *yearViewController;
  void *v3;
  id v4;
  id v5;

  yearViewController = self->_yearViewController;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedDate"));
  v4 = -[YearViewController pushedMonthViewControllerWithDate:animated:](yearViewController, "pushedMonthViewControllerWithDate:animated:", v3, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_yearViewController, 0);
}

@end
