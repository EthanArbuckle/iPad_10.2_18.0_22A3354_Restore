@implementation MapsAppTestResizingPlacecard

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestPlacecardChrome setPlacecardChromeDelegate:](self, "setPlacecardChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestResizingPlacecard;
  return -[MapsAppTestPlacecardChrome runTest](&v4, "runTest");
}

- (void)placecardDidPresent
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100678D4C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
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
    v5[2] = sub_100678DF4;
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
