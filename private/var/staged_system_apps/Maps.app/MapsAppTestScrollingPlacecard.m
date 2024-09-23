@implementation MapsAppTestScrollingPlacecard

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestPlacecardChrome setPlacecardChromeDelegate:](self, "setPlacecardChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestScrollingPlacecard;
  return -[MapsAppTestPlacecardChrome runTest](&v4, "runTest");
}

- (void)placecardDidPresent
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100678910;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_scrollingTest
{
  void *v3;
  int BOOL;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  BOOL = GEOConfigGetBOOL(MapsConfig_UseRPTTestForPlaceCardScrollPPT, off_1014B4DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPlacecardChrome placeViewController](self, "placeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = objc_opt_class(UIScrollView);
  v8 = sub_10067639C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (BOOL)
  {
    v10 = RPTContentSizeInDirection(v9, 1);
    v11 = RPTGetBoundsForView(v9);
    v15 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v3, 1, &stru_1011BF6F8, v11, v12, v13, v14, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v16));
    objc_msgSend(v15, "setConversion:", v17);

    objc_initWeak(&location, self);
    v24 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100678C48;
    v20[3] = &unk_1011AD1E8;
    objc_copyWeak(&v22, &location);
    v21 = v3;
    v19 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v21, v18, v20);

    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v9, "_performScrollTest:iterations:delta:", v3, 10, 20);

  }
}

@end
