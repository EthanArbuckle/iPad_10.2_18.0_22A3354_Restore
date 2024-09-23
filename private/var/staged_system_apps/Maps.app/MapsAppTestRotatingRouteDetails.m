@implementation MapsAppTestRotatingRouteDetails

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestRouteChrome setChromeDelegate:](self, "setChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestRotatingRouteDetails;
  return -[MapsAppTestRouteChrome runTest](&v4, "runTest");
}

- (void)directionsPlanDidSetup
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100230290;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  -[MapsAppTest _presentDirectionDetailsWithCompletion:](self, "_presentDirectionDetailsWithCompletion:", v2);
}

- (void)_performRotationTest
{
  _QWORD v3[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100230374;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[MapsAppTest rotateDeviceWithCompletion:](self, "rotateDeviceWithCompletion:", v3);
}

@end
