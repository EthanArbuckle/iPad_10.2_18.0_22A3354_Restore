@implementation MapsAppTestResizingRoute

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestRouteChrome setChromeDelegate:](self, "setChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestResizingRoute;
  return -[MapsAppTestRouteChrome runTest](&v4, "runTest");
}

- (void)directionsPlanDidSetup
{
  -[MapsAppTestResizingRoute _performResizingTest](self, "_performResizingTest");
}

- (void)_performResizingTest
{
  unsigned int v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout");
  -[MapsAppTest startedTest](self, "startedTest");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100230468;
    v5[3] = &unk_1011AC860;
    v5[4] = self;
    -[MapsAppTest resizingTestAndSubTestsWithPrefix:completion:](self, "resizingTestAndSubTestsWithPrefix:completion:", v4, v5);

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }
}

@end
