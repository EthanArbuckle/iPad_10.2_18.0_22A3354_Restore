@implementation MapsAppTestProactive

- (BOOL)runTest
{
  void *v3;
  unsigned int v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = objc_msgSend(v3, "_mapstest_isUsingSampleProactiveData");

  if (v4)
  {
    v5 = dispatch_time(0, 6000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10060DF34;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTestProactive _setupTrayLayoutAndPerformScrollTest](self, "_setupTrayLayoutAndPerformScrollTest");
  }
  return 1;
}

- (void)_setupTrayLayoutAndPerformScrollTest
{
  _QWORD v3[5];

  if (-[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10060DFC0;
    v3[3] = &unk_1011AC860;
    v3[4] = self;
    -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", 2, 1, v3);
  }
  else
  {
    -[MapsAppTestProactive _performScrollTest](self, "_performScrollTest");
  }
}

- (void)_performScrollTest
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id location;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollViewForProactive"));

  v5 = RPTContentSizeInDirection(v4, 1);
  v6 = RPTGetBoundsForView(v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc((Class)RPTScrollViewTestParameters);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v15 = objc_msgSend(v13, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v14, 1, &stru_1011BE100, v6, v8, v10, v12, v5);

  objc_initWeak(&location, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v22 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10060E1F4;
  v19[3] = &unk_1011AD1E8;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  v18 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v16, v17, v19);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

@end
