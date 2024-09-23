@implementation MapsAppTestPresentRouteDetails

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestRouteChrome setChromeDelegate:](self, "setChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestPresentRouteDetails;
  return -[MapsAppTestRouteChrome runTest](&v4, "runTest");
}

- (void)directionsPlanDidSetup
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10022FD7C;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022FDAC;
  v4[3] = &unk_1011AC860;
  -[MapsAppTest presentDismissTrayTestAndSubTestsWithPrefix:presenter:completion:](self, "presentDismissTrayTestAndSubTestsWithPrefix:presenter:completion:", v3, v5, v4);

}

@end
