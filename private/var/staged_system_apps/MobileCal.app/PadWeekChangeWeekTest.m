@implementation PadWeekChangeWeekTest

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PadWeekChangeWeekTest;
  -[PadWeekChangeWeekTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  void *v3;
  void *v4;
  void *v5;
  WeekViewController *v6;
  WeekViewController *weekViewController;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));

  self->_weeksToScroll = 10;
  v6 = (WeekViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToWeekView"));
  weekViewController = self->_weekViewController;
  self->_weekViewController = v6;

  -[PadWeekChangeWeekTest _realTest](self, "_realTest");
}

- (void)_realTest
{
  void *v3;
  id v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_mainLoop", CFSTR("WeekViewController_ScrollDidEndAnimationNotification"), 0);

  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_time(0, 200000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000682A8;
  v8[3] = &unk_1001B26A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)_mainLoop
{
  int64_t weeksToScroll;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  weeksToScroll = self->_weeksToScroll;
  if (weeksToScroll)
  {
    self->_weeksToScroll = weeksToScroll - 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self->_weekViewController, "displayedDate"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068404;
    block[3] = &unk_1001B26A0;
    block[4] = self;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingDays:", 7));
    v5 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "testName");
    v8 = (id)objc_claimAutoreleasedReturnValue(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v7, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v8, 0, 0, &stru_1001B3450);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViewController, 0);
}

@end
