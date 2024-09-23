@implementation PhonePlusWeekViewHorizontalScrollTest

- (id)checkTestPreconditions
{
  if (EKUIUseLargeFormatPhoneUI(self, a2))
    return 0;
  else
    return CFSTR("Test cannot be run on non plus-format phones");
}

- (void)navigateToScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = (char *)objc_msgSend(v7, "interfaceOrientation");

  if ((unint64_t)(v8 - 3) > 1)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100045FC8;
    v9[3] = &unk_1001B25D0;
    v9[4] = self;
    objc_msgSend(UIApp, "rotateIfNeeded:completion:", 4, v9);
  }
  else
  {
    -[PhonePlusWeekViewHorizontalScrollTest _setupWeekView](self, "_setupWeekView");
  }
}

- (void)_setupWeekView
{
  void *v3;
  void *v4;
  void *v5;
  WeekViewController *v6;
  WeekViewController *controller;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
  v6 = (WeekViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToWeekView"));
  controller = self->_controller;
  self->_controller = v6;

  -[WeekViewController setDisplayedDate:animated:](self->_controller, "setDisplayedDate:animated:", v8, 0);
}

- (id)scrollView
{
  return -[WeekViewController weekScroller](self->_controller, "weekScroller");
}

- (WeekViewController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
