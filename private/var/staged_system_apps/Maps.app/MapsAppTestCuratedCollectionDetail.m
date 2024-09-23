@implementation MapsAppTestCuratedCollectionDetail

- (BOOL)runTest
{
  NSMutableSet *v3;
  NSMutableSet *updatedDataFetchers;
  void *v5;
  unsigned int v6;
  dispatch_time_t v7;
  _QWORD block[5];

  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  updatedDataFetchers = self->_updatedDataFetchers;
  self->_updatedDataFetchers = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v6 = objc_msgSend(v5, "_mapstest_isUsingSampleProactiveData");

  if (v6)
  {
    v7 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B6BBA4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTestCuratedCollectionDetail _startTestAndPerformScrollTest](self, "_startTestAndPerformScrollTest");
  }
  return 1;
}

- (void)_startTestAndPerformScrollTest
{
  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTestCuratedCollectionDetail _enterSearchModeAndPerformCuratedCollectionDetailsScrollTest](self, "_enterSearchModeAndPerformCuratedCollectionDetailsScrollTest");
}

- (void)_enterSearchModeAndPerformCuratedCollectionDetailsScrollTest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestResetForLaunchURL");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = objc_msgSend(v4, "_mapstest_mapType");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapstest_mapRegion"));

  -[MapsAppTest switchToMapType:](self, "switchToMapType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v8, "setMapRegion:pitch:yaw:", v7, 0.0, 0.0);

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B6BD04;
  v9[3] = &unk_1011AD260;
  objc_copyWeak(&v10, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)didUpdateDataFetcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestCuratedCollectionDetail updatedDataFetchers](self, "updatedDataFetchers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  objc_msgSend(v5, "addObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestCuratedCollectionDetail updatedDataFetchers](self, "updatedDataFetchers"));
  v8 = objc_msgSend(v7, "count");
  v9 = -[MapsAppTestCuratedCollectionDetail numberOfDataFetchers](self, "numberOfDataFetchers");

  if (v8 == (id)v9)
  {
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("collectData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("PPTTest_SearchHome_DidUpdateDataFetcher"), 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B6BFA0;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_selectAndScrollCuratedCollectionDetail
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100B6BFF8;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  -[MapsAppTestCuratedCollectionDetail _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v2);
}

- (void)_selectAndScrollCuratedCollection
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptSelectFirstCuratedGuide");

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B6C0D0;
  v4[3] = &unk_1011AD288;
  objc_copyWeak(&v5, &location);
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTest_CuratedCollectionView_DidDisplayCollection"), 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_scrollCuratedCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  MapsAppTestCuratedCollectionDetail *v20;
  id v21;
  id v22;
  id location;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(" - scroll")));

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", v6);
  objc_initWeak(&location, self);
  v7 = RPTContentSizeInDirection(v4, 1);
  v8 = RPTGetBoundsForView(v4);
  v12 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v6, 1, &stru_1011E6F38, v8, v9, v10, v11, v7);
  objc_msgSend(v12, "setPreventSheetDismissal:", 1);
  v24 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100B6C3C4;
  v19 = &unk_1011AFF10;
  objc_copyWeak(&v22, &location);
  v20 = self;
  v14 = v6;
  v21 = v14;
  v15 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v14, v13, &v16);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v15, v16, v17, v18, v19, v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
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
  block[2] = sub_100B6C4A0;
  block[3] = &unk_1011ADA00;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)UIScrollTestParameters);
  objc_msgSend(v7, "setIterations:", 1);
  objc_msgSend(v7, "setDelta:", 40.0);
  objc_msgSend(v7, "setLength:", UIScrollTestParametersLengthAutomatic);
  objc_msgSend(v7, "setAxis:", 2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B6C598;
  v9[3] = &unk_1011D9618;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "_performScrollTestWithParameters:completionBlock:", v7, v9);

}

- (NSMutableSet)updatedDataFetchers
{
  return self->_updatedDataFetchers;
}

- (void)setUpdatedDataFetchers:(id)a3
{
  objc_storeStrong((id *)&self->_updatedDataFetchers, a3);
}

- (unint64_t)numberOfDataFetchers
{
  return self->_numberOfDataFetchers;
}

- (void)setNumberOfDataFetchers:(unint64_t)a3
{
  self->_numberOfDataFetchers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDataFetchers, 0);
}

@end
