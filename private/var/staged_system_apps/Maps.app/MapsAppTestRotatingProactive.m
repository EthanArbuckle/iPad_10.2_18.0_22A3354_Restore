@implementation MapsAppTestRotatingProactive

- (BOOL)runTest
{
  void *v3;
  unsigned int v4;
  int64_t v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = objc_msgSend(v3, "_mapstest_isUsingSampleProactiveData");

  if (v4)
    v5 = 6000000000;
  else
    v5 = 1000000000;
  v6 = dispatch_time(0, v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10060E45C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (void)_performRotationTest
{
  _QWORD v3[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10060E4C8;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[MapsAppTest rotateDeviceWithCompletion:](self, "rotateDeviceWithCompletion:", v3);
}

@end
