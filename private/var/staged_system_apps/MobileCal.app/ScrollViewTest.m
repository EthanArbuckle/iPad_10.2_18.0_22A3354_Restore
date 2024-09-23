@implementation ScrollViewTest

- (ScrollViewTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  ScrollViewTest *v10;
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
  v18.super_class = (Class)ScrollViewTest;
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

- (id)checkTestPreconditions
{
  return 0;
}

- (void)runTest
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ScrollViewTest checkTestPreconditions](self, "checkTestPreconditions"));
  if (-[TestScroller inputInvalid](self->_scroller, "inputInvalid"))
  {
    objc_msgSend(v3, "startedTest:", v6);
    v8 = CFSTR("input invalid was marked as true when trying to run test");
    v9 = v3;
    v10 = v6;
  }
  else
  {
    if (!v7)
    {
      -[ScrollViewTest navigateToScrollView](self, "navigateToScrollView");
      v11 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C46B4;
      block[3] = &unk_1001B2538;
      block[4] = self;
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
      goto LABEL_7;
    }
    objc_msgSend(v3, "startedTest:", v6);
    v9 = v3;
    v10 = v6;
    v8 = v7;
  }
  objc_msgSend(v9, "failedTest:withFailure:", v10, v8);
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scroller, 0);
}

- (void)navigateToScrollView
{
  uint64_t v2;

  sub_10002E49C((uint64_t)self);
  NSRequestConcreteImplementation(v2);
}

- (UIScrollView)scrollView
{
  uint64_t v2;

  sub_10002E49C((uint64_t)self);
  NSRequestConcreteImplementation(v2);
  return 0;
}

@end
