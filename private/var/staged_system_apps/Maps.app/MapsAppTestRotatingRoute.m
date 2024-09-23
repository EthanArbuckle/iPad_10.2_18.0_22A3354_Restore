@implementation MapsAppTestRotatingRoute

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestRouteChrome setChromeDelegate:](self, "setChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestRotatingRoute;
  return -[MapsAppTestRouteChrome runTest](&v4, "runTest");
}

- (void)directionsPlanDidSetup
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230184;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performRotationTest
{
  _QWORD v3[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002301F0;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[MapsAppTest rotateDeviceWithCompletion:](self, "rotateDeviceWithCompletion:", v3);
}

@end
