@implementation InboxRepliedSectionScrollTest

- (InboxRepliedSectionScrollTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  InboxRepliedSectionScrollTest *v10;
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
  v18.super_class = (Class)InboxRepliedSectionScrollTest;
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
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("InboxRepliedSectionViewController_ViewDidAppearNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)InboxRepliedSectionScrollTest;
  -[InboxRepliedSectionScrollTest dealloc](&v4, "dealloc");
}

- (void)runTest
{
  double v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  InboxViewController *v8;
  InboxViewController *inboxViewController;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  if (-[TestScroller inputInvalid](self->_scroller, "inputInvalid"))
  {
    *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testName", v3));
    objc_msgSend(v10, "startedTest:", v5);
    objc_msgSend(v10, "failedTest:withFailure:", v5, CFSTR("input invalid was marked as true when trying to run test"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootNavigationController"));
    v6 = objc_msgSend(v5, "resetToYearView");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_inboxDidAppear:", CFSTR("InboxViewController_ViewDidAppearNotification"), 0);

    v8 = (InboxViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "showInboxAnimated:completion:", 1, 0));
    inboxViewController = self->_inboxViewController;
    self->_inboxViewController = v8;

  }
}

- (void)_inboxDidAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("InboxViewController_ViewDidAppearNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController switcherViewController](self->_inboxViewController, "switcherViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "showRepliedSection"));
  *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "testName", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));
  if (v10)
  {
    v11 = dispatch_time(0, 5000000000);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B9D78;
    v13[3] = &unk_1001B26A0;
    v13[4] = self;
    v14 = v10;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v12, "startedTest:", v9);
    objc_msgSend(v12, "failedTest:withFailure:", v9, CFSTR("Table view doesn't exist"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxViewController, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
}

@end
