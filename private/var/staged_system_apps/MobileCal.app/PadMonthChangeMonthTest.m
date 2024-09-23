@implementation PadMonthChangeMonthTest

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PadMonthChangeMonthTest;
  -[PadMonthChangeMonthTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  void *v3;
  void *v4;
  void *v5;
  MonthViewController *v6;
  MonthViewController *monthViewController;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v3, "setSelectedDate:", v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));

  self->_monthsToScroll = 10;
  v6 = (MonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetToMonthView"));
  monthViewController = self->_monthViewController;
  self->_monthViewController = v6;

  -[PadMonthChangeMonthTest _realTest](self, "_realTest");
}

- (void)_realTest
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_mainLoop", CFSTR("MonthViewController_ScrollDidEndAnimationNotification"), 0);

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v7 = dispatch_time(0, 200000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008D058;
  v9[3] = &unk_1001B26A0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)_mainLoop
{
  int64_t monthsToScroll;
  double v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];

  monthsToScroll = self->_monthsToScroll;
  if (monthsToScroll)
  {
    self->_monthsToScroll = monthsToScroll - 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008D178;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v6, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v7, 1, 0, &stru_1001B3AA0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
