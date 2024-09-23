@implementation PadRotateWeekViewFromPortraitTest

- (id)rotationAnimationStartedNotificationName
{
  return CFSTR("LargeWeekViewController_RotationAnimationStartedNotification");
}

- (id)rotationAnimationCompleteNotificationName
{
  return CFSTR("LargeWeekViewController_RotationAnimationCompletedNotification");
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
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToWeekView"));

  objc_msgSend(v7, "setDisplayedDate:animated:", v4, 0);
}

@end
