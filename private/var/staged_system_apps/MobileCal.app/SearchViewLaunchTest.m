@implementation SearchViewLaunchTest

- (SearchViewLaunchTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8;
  SearchViewLaunchTest *v9;
  void *v10;
  void *v11;
  void *v12;
  RootNavigationController *v13;
  id v14;
  RootNavigationController *rootNavController;
  objc_super v17;

  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SearchViewLaunchTest;
  v9 = -[ApplicationTest initWithApplication:model:options:](&v17, "initWithApplication:model:options:", a3, a4, v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("iterations")));
    v11 = v10;
    if (v10)
      v9->_iterations = (unint64_t)objc_msgSend(v10, "integerValue");
    else
      v9->_inputInvalid = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](v9, "application"));
    v13 = (RootNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootNavigationController"));

    v14 = -[RootNavigationController resetToDayView](v13, "resetToDayView");
    rootNavController = v9->_rootNavController;
    v9->_rootNavController = v13;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchViewLaunchTest;
  -[SearchViewLaunchTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  RootNavigationController *rootNavController;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  dispatch_time_t v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  if (self->_inputInvalid)
  {
    objc_msgSend(v3, "startedTest:", v6);
    objc_msgSend(v3, "failedTest:withFailure:", v6, CFSTR("input invalid was marked as true when trying to run test"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));

    v9 = objc_msgSend(v8, "resetToYearView");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    objc_msgSend(v10, "setShowDayAsList:", 0);

    rootNavController = self->_rootNavController;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedDate"));
    v14 = -[RootNavigationController pushCalendarViewControllerWithViewType:andDate:](rootNavController, "pushCalendarViewControllerWithViewType:andDate:", 3, v13);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10010535C;
    v20[3] = &unk_1001B26A0;
    v20[4] = self;
    v21 = v6;
    v15 = objc_retainBlock(v20);
    v16 = dispatch_time(0, 3000000000);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001053F0;
    v18[3] = &unk_1001B2D80;
    v18[4] = self;
    v19 = v15;
    v17 = v15;
    dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, v18);

  }
}

- (void)_searchViewDidAppear
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001054F8;
  v7[3] = &unk_1001B2538;
  v7[4] = self;
  objc_msgSend(v3, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v6, 1, 0, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_rootNavController, 0);
}

@end
