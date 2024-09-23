@implementation PPTStoreDependentTest

- (PPTStoreDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPTStoreDependentTest;
  return -[PPTBasicTest initWithName:options:testDefinition:isMainTest:](&v7, "initWithName:options:testDefinition:isMainTest:", a3, a4, a5, a6);
}

- (BOOL)waitForCACommitBeforeTrackingMetric
{
  return 0;
}

- (int)handlerTimeout
{
  return 3;
}

- (BOOL)hasHandler
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177320;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  return 0;
}

@end
