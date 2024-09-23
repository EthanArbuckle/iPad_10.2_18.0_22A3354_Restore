@implementation AnimationTest

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AnimationTest;
  -[AnimationTest dealloc](&v4, "dealloc");
}

+ (id)_delaySubTestName
{
  return CFSTR("Delay");
}

+ (id)_animationSubTestName
{
  return CFSTR("Animation");
}

- (void)runTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[AnimationTest setUp](self, "setUp");
  v3 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044430;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_animationCompleted
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004464C;
  v4[3] = &unk_1001B2538;
  v4[4] = self;
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

- (id)notificationName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10002E49C((uint64_t)self);
  v2 = sub_1000438B8();
  NSRequestConcreteImplementation(v2, v3, v4);
  return 0;
}

- (void)setUp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10002E49C((uint64_t)self);
  v2 = sub_1000438B8();
  sub_1000438B0(v2, v3, v4);
}

- (void)kickOffAnimation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10002E49C((uint64_t)self);
  v2 = sub_1000438B8();
  sub_1000438B0(v2, v3, v4);
}

@end
