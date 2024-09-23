@implementation MotionManager

- (void)sceneDidBecomeActive
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B145CA34);
}

- (void)handleReduceMotionChanged
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B16884F4);
}

- (void)scenDidEnterBackground
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B1688670);
}

@end
