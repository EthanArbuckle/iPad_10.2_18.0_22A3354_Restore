@implementation PadRotateDayViewFromPortraitTest

- (id)rotationAnimationStartedNotificationName
{
  return CFSTR("DayViewController_RotationAnimationStartedNotification");
}

- (id)rotationAnimationCompleteNotificationName
{
  return CFSTR("DayViewController_RotationAnimationCompletedNotification");
}

- (void)_setupViewToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootNavigationController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToDayView"));

  objc_msgSend(v7, "selectDate:animated:", v4, 0);
}

@end
