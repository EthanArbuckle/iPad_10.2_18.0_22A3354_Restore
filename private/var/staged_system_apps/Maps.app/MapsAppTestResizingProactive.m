@implementation MapsAppTestResizingProactive

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
  block[2] = sub_10060E300;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
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
    v5[2] = sub_10060E3A8;
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
