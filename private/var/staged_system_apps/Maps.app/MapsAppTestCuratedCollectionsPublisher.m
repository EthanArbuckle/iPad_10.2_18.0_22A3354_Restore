@implementation MapsAppTestCuratedCollectionsPublisher

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
    v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005D7CFC;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTestCuratedCollectionsPublisher _startTestAndPerformScrollTest](self, "_startTestAndPerformScrollTest");
  }
  return 1;
}

- (void)_startTestAndPerformScrollTest
{
  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTestCuratedCollectionsPublisher _enterSearchModeAndPerformPublisherScrollTest](self, "_enterSearchModeAndPerformPublisherScrollTest");
}

- (void)_enterSearchModeAndPerformPublisherScrollTest
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestEnterSearchMode");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005D7D9C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTestCuratedCollectionsPublisher _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v4);
}

- (void)_selectAndScrollPublisherCollections
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptSelectFirstGuidePublisher");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005D7E18;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTestCuratedCollectionsPublisher _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v4);
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005D7F44;
  block[3] = &unk_1011ADA00;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id location;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR(" - scroll")));

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", v9);
  objc_initWeak(&location, self);
  v10 = RPTContentSizeInDirection(v6, 1);
  v11 = RPTGetBoundsForView(v6);
  v15 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v9, 1, &stru_1011BD2C8, v11, v12, v13, v14, v10);
  objc_msgSend(v15, "setPreventSheetDismissal:", 1);
  v25 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005D81C4;
  v20[3] = &unk_1011B3550;
  objc_copyWeak(&v23, &location);
  v20[4] = self;
  v17 = v9;
  v21 = v17;
  v18 = v7;
  v22 = v18;
  v19 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v17, v16, v20);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v19);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

@end
