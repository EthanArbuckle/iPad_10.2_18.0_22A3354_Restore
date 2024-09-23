@implementation SubscriptionDaemon

- (void)onExitTimerRun
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(**(_QWORD **)self->mainLoop + 128);
  v3 = swift_retain();
  v2(v3);
  swift_release();
}

@end
