@implementation MapsAppTestViewingPlacecard

- (BOOL)runTest
{
  objc_super v4;

  -[MapsAppTestPlacecardChrome setPlacecardChromeDelegate:](self, "setPlacecardChromeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestViewingPlacecard;
  return -[MapsAppTestPlacecardChrome runTest](&v4, "runTest");
}

- (void)placecardDidPresent
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestMaximizePlaceCardAnimated:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100678F1C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
