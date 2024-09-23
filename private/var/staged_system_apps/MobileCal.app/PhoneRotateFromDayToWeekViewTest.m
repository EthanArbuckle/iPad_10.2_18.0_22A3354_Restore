@implementation PhoneRotateFromDayToWeekViewTest

- (void)_setupViewToDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToMonthView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
  objc_msgSend(v6, "showDate:animated:", v7, 0);

  v8 = objc_msgSend(v6, "pushedDayViewControllerWithDate:animated:", v9, 0);
}

- (id)rotationAnimationStartedNotificationName
{
  return CFSTR("RootNavigationController_TransitionStartedNotification");
}

- (id)rotationAnimationCompleteNotificationName
{
  return CFSTR("RootNavigationController_TransitionCompletedNotification");
}

- (id)checkTestPreconditions
{
  if (EKUIUseLargeFormatPhoneUI(self, a2))
    return CFSTR("Test cannot be run on plus sized phones");
  else
    return 0;
}

@end
