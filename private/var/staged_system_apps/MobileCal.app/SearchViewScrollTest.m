@implementation SearchViewScrollTest

- (SearchViewScrollTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  SearchViewScrollTest *v10;
  TestScroller *v11;
  id v12;
  void *v13;
  TestScroller *v14;
  TestScroller *scroller;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SearchViewScrollTest;
  v10 = -[ApplicationTest initWithApplication:model:options:](&v17, "initWithApplication:model:options:", v8, a4, v9);
  if (v10)
  {
    v11 = [TestScroller alloc];
    v12 = objc_msgSend((id)objc_opt_class(v10), "testName");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = -[TestScroller initWithOptions:testName:application:](v11, "initWithOptions:testName:application:", v9, v13, v8);
    scroller = v10->_scroller;
    v10->_scroller = v14;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchViewScrollTest;
  -[SearchViewScrollTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[TestScroller inputInvalid](self->_scroller, "inputInvalid"))
  {
    objc_msgSend(v3, "startedTest:", v5);
    objc_msgSend(v3, "failedTest:withFailure:", v5, CFSTR("input invalid was marked as true when trying to run test"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootNavigationController"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    objc_msgSend(v9, "setSelectedDate:", v8);

    v10 = objc_msgSend(v7, "resetToYearView");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    objc_msgSend(v11, "setShowDayAsList:", 1);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100063978;
    v19[3] = &unk_1001B26A0;
    v19[4] = self;
    v12 = v7;
    v20 = v12;
    v13 = objc_retainBlock(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

    if (v14)
    {
      v15 = dispatch_time(0, 1000000000);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100063A10;
      v16[3] = &unk_1001B2D80;
      v17 = v12;
      v18 = v13;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v16);

    }
    else
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }

  }
}

- (void)_searchViewDidAppear
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ListViewController_ViewDidAppearNotification"), 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063AB4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scroller, 0);
}

@end
