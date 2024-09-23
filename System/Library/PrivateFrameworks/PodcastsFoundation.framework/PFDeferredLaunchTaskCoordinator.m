@implementation PFDeferredLaunchTaskCoordinator

- (void)deferWork:(id)a3
{
  void *v4;
  uint64_t v5;
  PFDeferredLaunchTaskCoordinator *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A90AB6B4(0, (uint64_t)sub_1A908C20C, v5);

  swift_release();
}

+ (PFDeferredLaunchTaskCoordinator)sharedInstance
{
  if (qword_1ED2A7EA0 != -1)
    swift_once();
  return (PFDeferredLaunchTaskCoordinator *)(id)qword_1ED2A7E98;
}

- (PFDeferredLaunchTaskCoordinator)init
{
  return (PFDeferredLaunchTaskCoordinator *)DeferredLaunchTaskCoordinator.init()();
}

- (void)scheduleDefaultDeferralDeadline
{
  double v3;
  PFDeferredLaunchTaskCoordinator *v4;

  swift_beginAccess();
  v3 = *(double *)&qword_1EEABD958;
  v4 = self;
  sub_1A90C6014(v3);

}

- (void)scheduleDeferralDeadlineAfter:(double)a3
{
  PFDeferredLaunchTaskCoordinator *v4;

  v4 = self;
  sub_1A90C6014(a3);

}

- (void)deferWorkOnQueue:(id)a3 withBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PFDeferredLaunchTaskCoordinator *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1A90AB6B4(a3, (uint64_t)sub_1A92D58CC, v7);

  swift_release();
}

- (void)stopDeferring
{
  PFDeferredLaunchTaskCoordinator *v2;

  v2 = self;
  sub_1A90C69E0();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
