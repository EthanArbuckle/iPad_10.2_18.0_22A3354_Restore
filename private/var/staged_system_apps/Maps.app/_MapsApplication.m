@implementation _MapsApplication

- (id)_extendLaunchTest
{
  return +[_MapsApplicationTestSideEffectDelegate extendLaunchTest](_MapsApplicationTestSideEffectDelegate, "extendLaunchTest");
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  if (a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)_MapsApplication;
    v6 = a4;
    v7 = a3;
    -[_MapsApplication finishedTest:extraResults:](&v9, "finishedTest:extraResults:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsApplication delegate](self, "delegate", v9.receiver, v9.super_class));
    +[_MapsApplicationTestSideEffectDelegate finishedTest:extraResults:applicationTestingDelegate:](_MapsApplicationTestSideEffectDelegate, "finishedTest:extraResults:applicationTestingDelegate:", v7, v6, v8);

  }
}

- (void)failedTest:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MapsApplication;
  v4 = a3;
  -[_MapsApplication failedTest:](&v6, "failedTest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsApplication delegate](self, "delegate", v6.receiver, v6.super_class));
  +[_MapsApplicationTestSideEffectDelegate failedTest:applicationTestingDelegate:](_MapsApplicationTestSideEffectDelegate, "failedTest:applicationTestingDelegate:", v4, v5);

}

@end
