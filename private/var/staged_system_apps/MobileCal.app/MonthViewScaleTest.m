@implementation MonthViewScaleTest

- (id)notificationName
{
  return CFSTR("MonthViewScaleAnimationFinishedNotification");
}

- (void)setUp
{
  void *v3;
  void *v4;
  CompactWidthMonthViewController *v5;
  CompactWidthMonthViewController *monthViewController;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  objc_msgSend(v3, "setMonthViewScaleSize:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));

  v5 = (CompactWidthMonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resetToMonthView"));
  monthViewController = self->_monthViewController;
  self->_monthViewController = v5;

}

- (void)kickOffAnimation
{
  -[CompactWidthMonthViewController animateToMonthWeekSize:divided:](self->_monthViewController, "animateToMonthWeekSize:divided:", 3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
