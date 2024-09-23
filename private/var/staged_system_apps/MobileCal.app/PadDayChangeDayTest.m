@implementation PadDayChangeDayTest

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PadDayChangeDayTest;
  -[PadDayChangeDayTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  void *v3;
  void *v4;
  void *v5;
  DayViewController *v6;
  DayViewController *dayViewController;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));

  self->_daysToScroll = 10;
  v6 = (DayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToDayView"));
  dayViewController = self->_dayViewController;
  self->_dayViewController = v6;

  -[PadDayChangeDayTest _realTest](self, "_realTest");
}

- (void)_realTest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self->_dayViewController, "day"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingDays:", 1));
  -[DayViewController selectDate:animated:](self->_dayViewController, "selectDate:animated:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_mainLoop", CFSTR("NSString *const DayViewController_DayScrollDidEndAnimationNotification"), 0);

  v6 = objc_msgSend((id)objc_opt_class(self), "testName");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = dispatch_time(0, 200000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100068974;
  v10[3] = &unk_1001B26A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);

}

- (void)_mainLoop
{
  int64_t daysToScroll;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  daysToScroll = self->_daysToScroll;
  if (daysToScroll)
  {
    self->_daysToScroll = daysToScroll - 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self->_dayViewController, "day"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068AD0;
    block[3] = &unk_1001B26A0;
    block[4] = self;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingDays:", 1));
    v5 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "testName");
    v8 = (id)objc_claimAutoreleasedReturnValue(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v7, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v8, 1, 0, &stru_1001B3470);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayViewController, 0);
}

@end
