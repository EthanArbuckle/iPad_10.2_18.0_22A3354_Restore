@implementation PhoneDayViewHorizontalScrollTest

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PhoneDayViewHorizontalScrollTest;
  -[PhoneDayViewHorizontalScrollTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DayViewController *v11;
  DayViewController *dayViewController;
  void *v13;
  id v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v4, "setSelectedDate:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootNavigationController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToMonthView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pushedDayViewControllerWithDate:animated:", v9, 0));
  v11 = (DayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentChildViewController"));
  dayViewController = self->_dayViewController;
  self->_dayViewController = v11;

  self->_daysToScroll = 20;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_mainLoop", EKDayViewController_ScrollDidEndAnimationNotification, 0);

  v14 = objc_msgSend((id)objc_opt_class(self), "testName");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = dispatch_time(0, 2000000000);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003C0D4;
  v18[3] = &unk_1001B26A0;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, v18);

}

- (void)_mainLoop
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  if (self->_daysToScroll)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController day](self->_dayViewController, "day"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingDays:", 1));
    -[DayViewController selectDate:animated:](self->_dayViewController, "selectDate:animated:", v4, 1);
    --self->_daysToScroll;

  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(self), "testName");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v6, "finishedTest:extraResults:", v3, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayViewController, 0);
}

@end
