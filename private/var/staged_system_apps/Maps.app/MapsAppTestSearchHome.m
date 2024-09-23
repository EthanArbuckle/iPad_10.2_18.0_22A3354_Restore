@implementation MapsAppTestSearchHome

- (MapsAppTestSearchHome)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  MapsAppTestSearchHome *v5;
  NSMutableSet *v6;
  NSMutableSet *updatedDataFetchers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsAppTestSearchHome;
  v5 = -[MapsAppTest initWithApplication:testName:options:](&v9, "initWithApplication:testName:options:", a3, a4, a5);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    updatedDataFetchers = v5->_updatedDataFetchers;
    v5->_updatedDataFetchers = v6;

  }
  return v5;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
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
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A90014;
  v10[3] = &unk_1011AD260;
  objc_copyWeak(&v11, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return 1;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestSearchHome updatedDataFetchers](self, "updatedDataFetchers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  objc_msgSend(v5, "addObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestSearchHome updatedDataFetchers](self, "updatedDataFetchers"));
  v8 = objc_msgSend(v7, "count");
  v9 = -[MapsAppTestSearchHome numberOfDataFetchers](self, "numberOfDataFetchers");

  if (v8 == (id)v9)
  {
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("collectData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("PPTTest_SearchHome_DidUpdateDataFetcher"), 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A902B8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)continueAfterCollectingDataFromDataFetchers
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  v5 = objc_msgSend(v4, "containsString:", CFSTR("Scroll"));

  if (v5)
    -[MapsAppTestSearchHome runScrollTest](self, "runScrollTest");
  else
    -[MapsAppTest finishedTest](self, "finishedTest");
}

- (void)runScrollTest
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  MapsAppTestSearchHome *v17;
  __CFString *v18;
  id v19;
  id location;
  id v21;

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("content scroll"));
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollView"));

  v5 = RPTContentSizeInDirection(v4, 1);
  v6 = RPTGetBoundsForView(v4);
  v10 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", CFSTR("content scroll"), 1, &stru_1011E13F0, v6, v7, v8, v9, v5);
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100A90560;
  v16 = &unk_1011AFF10;
  objc_copyWeak(&v19, &location);
  v17 = self;
  v18 = CFSTR("content scroll");
  v12 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", CFSTR("content scroll"), v11, &v13);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v12, v13, v14, v15, v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
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
