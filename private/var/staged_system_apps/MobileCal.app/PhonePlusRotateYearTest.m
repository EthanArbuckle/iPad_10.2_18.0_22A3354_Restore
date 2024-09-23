@implementation PhonePlusRotateYearTest

- (id)rotationAnimationStartedNotificationName
{
  return CFSTR("YearViewController_RotationAnimationStartedNotification");
}

- (id)rotationAnimationCompleteNotificationName
{
  return CFSTR("YearViewController_RotationAnimationCompletedNotification");
}

- (void)_setupViewToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootNavigationController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToYearView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  objc_msgSend(v8, "showDate:animated:", v7, 0);

}

@end
