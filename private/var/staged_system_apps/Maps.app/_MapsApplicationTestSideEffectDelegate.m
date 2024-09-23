@implementation _MapsApplicationTestSideEffectDelegate

+ (void)finishedTest:(id)a3 extraResults:(id)a4 applicationTestingDelegate:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTest"));

  if (v7)
    NSLog(CFSTR("!!! PPT Test Finished: %@"), v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "testName"));
  v10 = objc_msgSend(v12, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTest"));
    objc_msgSend(v11, "cleanup:", 1);

  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("launch")) & 1) == 0)
    objc_msgSend(v6, "setCurrentTest:", 0);

}

+ (void)failedTest:(id)a3 applicationTestingDelegate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = a3;
  NSLog(CFSTR("PPT Test Failed: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testName"));
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTest"));
    objc_msgSend(v9, "cleanup:", 0);

  }
  objc_msgSend(v10, "setCurrentTest:", 0);

}

+ (id)extendLaunchTest
{
  return CFSTR("mapLoad");
}

@end
