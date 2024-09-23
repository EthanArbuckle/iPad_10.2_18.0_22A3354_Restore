@implementation MapsAppTestBasic

- (BOOL)runTest
{
  _QWORD v4[4];
  id v5;
  id location;

  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100748A20;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return 1;
}

@end
