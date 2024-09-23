@implementation THPerformanceRegressionLogger

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THPerformanceRegressionLogger;
  return objc_msgSendSuper2(&v3, "allocWithZone:", 0);
}

+ (id)sharedLogger
{
  id result;
  id v4;

  result = (id)qword_543290;
  if (!qword_543290)
  {
    objc_sync_enter(a1);
    if (!qword_543290)
    {
      v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_543290 = (uint64_t)v4;
      if (!v4)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THPerformanceRegressionLogger sharedLogger]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THPerformanceRegressionLogger.m"), 27, CFSTR("Couldn't create singleton instance of %@"), a1);
    }
    objc_sync_exit(a1);
    return (id)qword_543290;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THPerformanceRegressionLogger allocWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THPerformanceRegressionLogger.m"), 27, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (THPerformanceRegressionLogger)init
{
  THPerformanceRegressionLogger *v2;
  unint64_t v3;
  unint64_t v4;
  mach_timebase_info info;
  objc_super v7;
  utsname v8;

  v7.receiver = self;
  v7.super_class = (Class)THPerformanceRegressionLogger;
  v2 = -[THPerformanceRegressionLogger init](&v7, "init");
  if (v2)
  {
    v2->mShouldLog = -[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("THPerformanceRegressionLogging"));
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v4) = info.numer;
    v2->mDivisor = (double)v3 / (double)v4 * 1000.0;
    if (v2->mShouldLog)
    {
      memset(&v8, 0, 512);
      uname(&v8);
      v2->mMachine = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v8.machine, 1);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPerformanceRegressionLogger;
  -[THPerformanceRegressionLogger dealloc](&v3, "dealloc");
}

- (unint64_t)microseconds
{
  return vcvtmd_u64_f64((double)mach_absolute_time() / self->mDivisor + 0.5);
}

- (void)log:(id)a3
{
  if (self->mShouldLog)
    NSLog(CFSTR("%@"), a2, a3);
}

- (id)orientation
{
  if ((char *)-[UIWindowScene interfaceOrientation](-[UIWindow windowScene](-[UIApplication keyWindow](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation")- 1 >= (_BYTE *)&dword_0 + 2)return CFSTR("landscape");
  else
    return CFSTR("portrait");
}

- (id)bookDescriptionForContext:(id)a3
{
  uint64_t v4;
  id result;
  double v6;

  v4 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(a3, "documentObject")).n128_u64[0];
  if (result)
    return objc_msgSend(result, "bookDescription", v6);
  return result;
}

- (id)testName
{
  id result;

  result = -[NSUserDefaults stringForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "stringForKey:", CFSTR("THPerformanceRegressionTestName"));
  if (!result)
    return CFSTR("setup");
  return result;
}

- (void)logEvent:(id)a3 forAssetName:(id)a4
{
  if (self->mShouldLog)
    -[THPerformanceRegressionLogger log:](self, "log:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("perfEvent={\"test\":\"%@\",\"event\":\"%@\",\"time\":%qu,\"asset\":\"%@\",\"orientation\":\"%@\",\"machine\":\"%@\"}"), -[THPerformanceRegressionLogger testName](self, "testName"), a3, -[THPerformanceRegressionLogger microseconds](self, "microseconds"), a4, -[THPerformanceRegressionLogger orientation](self, "orientation"), self->mMachine));
}

- (void)logEvent:(id)a3 forBookDescription:(id)a4
{
  if (self->mShouldLog)
    -[THPerformanceRegressionLogger log:](self, "log:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("perfEvent={\"test\":\"%@\",\"event\":\"%@\",\"time\":%qu,\"asset\":\"%@\",\"orientation\":\"%@\",\"machine\":\"%@\",\"title\":\"%@\"}"), -[THPerformanceRegressionLogger testName](self, "testName"), a3, -[THPerformanceRegressionLogger microseconds](self, "microseconds"), objc_msgSend(objc_msgSend(objc_msgSend(a4, "asset"), "url"), "lastPathComponent"), -[THPerformanceRegressionLogger orientation](self, "orientation"), self->mMachine, objc_msgSend(a4, "bookTitle")));
}

- (void)logEvent:(id)a3 forAsset:(id)a4
{
  if (self->mShouldLog)
    -[THPerformanceRegressionLogger logEvent:forAssetName:](self, "logEvent:forAssetName:", a3, objc_msgSend(a4, "lastPathComponent"));
}

- (void)logEvent:(id)a3 forObjectContext:(id)a4
{
  if (self->mShouldLog)
    -[THPerformanceRegressionLogger logEvent:forBookDescription:](self, "logEvent:forBookDescription:", a3, -[THPerformanceRegressionLogger bookDescriptionForContext:](self, "bookDescriptionForContext:", a4));
}

- (void)logEvent:(id)a3 forContentNode:(id)a4
{
  id v7;

  if (self->mShouldLog)
  {
    v7 = -[THPerformanceRegressionLogger bookDescriptionForContext:](self, "bookDescriptionForContext:", objc_msgSend(a4, "context"));
    -[THPerformanceRegressionLogger log:](self, "log:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("perfEvent={\"test\":\"%@\",\"event\":\"%@\",\"time\":%qu,\"node\":\"%@\",\"asset\":\"%@\",\"orientation\":\"%@\",\"machine\":\"%@\",\"title\":\"%@\"}"), -[THPerformanceRegressionLogger testName](self, "testName"), a3, -[THPerformanceRegressionLogger microseconds](self, "microseconds"), objc_msgSend(a4, "applePubRelativePath"), objc_msgSend(objc_msgSend(objc_msgSend(v7, "asset"), "url"), "lastPathComponent"), -[THPerformanceRegressionLogger orientation](self, "orientation"), self->mMachine, objc_msgSend(v7, "bookTitle")));
  }
}

+ (void)logEventWithBlock:(id)a3
{
  _BYTE *v4;

  v4 = objc_msgSend(a1, "sharedLogger");
  if (v4)
  {
    if (v4[8])
      (*((void (**)(id, _BYTE *))a3 + 2))(a3, v4);
  }
}

@end
