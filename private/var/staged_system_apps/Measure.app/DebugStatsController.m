@implementation DebugStatsController

- (void)tick
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *(_QWORD *)self->tickCount;
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
    __break(1u);
  else
    *(_QWORD *)self->tickCount = v4;
}

@end
