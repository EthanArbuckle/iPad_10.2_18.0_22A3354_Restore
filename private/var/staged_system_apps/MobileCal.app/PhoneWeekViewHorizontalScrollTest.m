@implementation PhoneWeekViewHorizontalScrollTest

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PhoneWeekViewHorizontalScrollTest;
  -[PhoneWeekViewHorizontalScrollTest dealloc](&v4, "dealloc");
}

- (id)checkTestPreconditions
{
  if (EKUIUseLargeFormatPhoneUI(self, a2))
    return CFSTR("Test cannot be run on plus-format phones");
  else
    return 0;
}

- (void)runTest
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneWeekViewHorizontalScrollTest checkTestPreconditions](self, "checkTestPreconditions"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Test precondition not met: %@"), v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "testName", v6));
    objc_msgSend(v5, "startedTest:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "testName", v10));
    objc_msgSend(v9, "failedTest:withFailure:", v12, v4);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v14, "setSelectedDate:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootNavigationController"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "EKUI_viewHierarchy"));
  if ((char *)objc_msgSend(v17, "ekui_interfaceOrientation") - 1 <= (char *)1)
    v18 = objc_msgSend(v16, "resetToYearView");
  self->_weeksToScroll = 10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000BFAC8;
  v19[3] = &unk_1001B25D0;
  v19[4] = self;
  objc_msgSend(UIApp, "rotateIfNeeded:completion:", 3, v19);

}

- (void)_realTest
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_mainLoop", CFSTR("WeekViewController_ScrollDidEndAnimationNotification"), 0);

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v6, "startedTest:", v7);

  -[PhoneWeekViewHorizontalScrollTest _mainLoop](self, "_mainLoop");
}

- (void)_mainLoop
{
  void *v3;
  unint64_t weeksToScroll;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  weeksToScroll = self->_weeksToScroll;
  v12 = v3;
  if (weeksToScroll)
  {
    self->_weeksToScroll = weeksToScroll - 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topMainViewControllerContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateByAddingWeeks:", 1));
    objc_msgSend(v7, "setDisplayedDate:animated:", v9, 1);

  }
  else
  {
    *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "testName", v10));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v7, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v5, 1, 0, &stru_1001B4B60);
  }

}

@end
