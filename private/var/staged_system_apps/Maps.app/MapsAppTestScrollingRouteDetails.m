@implementation MapsAppTestScrollingRouteDetails

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestRouteChrome setChromeDelegate:](self, "setChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestScrollingRouteDetails;
  return -[MapsAppTestRouteChrome runTest](&v4, "runTest");
}

- (void)directionsPlanDidSetup
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10022FE4C;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  -[MapsAppTest _presentDirectionDetailsWithCompletion:](self, "_presentDirectionDetailsWithCompletion:", v2);
}

- (void)_performScrollTest
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollViewForDirectionsDetails"));

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
    v6 = RPTGetBoundsForView(v4);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_alloc((Class)RPTScrollViewTestParameters);
    objc_msgSend(v4, "contentSize");
    v15 = objc_msgSend(v13, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v5, 1, &stru_1011AD2A8, v6, v8, v10, v12, v14);
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100230080;
    v19[3] = &unk_1011AD1E8;
    objc_copyWeak(&v21, &location);
    v17 = v5;
    v20 = v17;
    v18 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v17, v16, v19);

    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v18);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }

}

@end
