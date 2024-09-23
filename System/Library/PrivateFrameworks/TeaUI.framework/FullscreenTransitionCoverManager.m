@implementation FullscreenTransitionCoverManager

- (void)didEndDimming
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B1457C70);
}

- (void)willStartTransition
{
  sub_1B168E4B0();
}

- (void)didStartTransition
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B168E4DC);
}

- (void)didStartDimming
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B168EA78);
}

- (void)didEndTransition
{
  sub_1B1457C78((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1B168EC6C);
}

@end
