@implementation ListViewScrollTest

- (ListViewScrollTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  ListViewScrollTest *v10;
  TestScroller *v11;
  double v12;
  id v13;
  void *v14;
  TestScroller *v15;
  TestScroller *scroller;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ListViewScrollTest;
  v10 = -[ApplicationTest initWithApplication:model:options:](&v18, "initWithApplication:model:options:", v8, a4, v9);
  if (v10)
  {
    v11 = [TestScroller alloc];
    *(_QWORD *)&v12 = objc_opt_class(v10).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "testName", v12));
    v15 = -[TestScroller initWithOptions:testName:application:](v11, "initWithOptions:testName:application:", v9, v14, v8);
    scroller = v10->_scroller;
    v10->_scroller = v15;

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
  v4.super_class = (Class)ListViewScrollTest;
  -[ListViewScrollTest dealloc](&v4, "dealloc");
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
  id v11;
  _QWORD *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  if (-[TestScroller inputInvalid](self->_scroller, "inputInvalid"))
  {
    objc_msgSend(v3, "startedTest:", v6);
    objc_msgSend(v3, "failedTest:withResults:", v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));

    v9 = objc_msgSend(v8, "resetToYearView");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    objc_msgSend(v10, "setShowDayAsList:", 1);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000BA170;
    v18[3] = &unk_1001B26A0;
    v18[4] = self;
    v11 = v8;
    v19 = v11;
    v12 = objc_retainBlock(v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));

    if (v13)
    {
      v14 = dispatch_time(0, 1000000000);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000BA208;
      v15[3] = &unk_1001B2D80;
      v16 = v11;
      v17 = v12;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);

    }
    else
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }

  }
}

- (void)_listViewDidAppear
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ListViewController_ViewDidAppearNotification"), 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA2AC;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scroller, 0);
}

@end
