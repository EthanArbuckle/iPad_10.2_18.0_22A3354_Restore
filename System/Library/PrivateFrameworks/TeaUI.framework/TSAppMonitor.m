@implementation TSAppMonitor

- (TSAppMonitor)init
{
  return (TSAppMonitor *)AppMonitor.init()();
}

- (void)setIsActive:(BOOL)a3
{
  AppMonitor.isActive.setter(a3);
}

- (id)onWindowWillBecomeForegroundWithBlock:(id)a3
{
  return sub_1B13EBDD4(self, (int)a2, a3, (uint64_t)&unk_1E6322480, (uint64_t)sub_1B1456244, (void (*)(uint64_t, uint64_t))AppMonitor.onWindowWillBecomeForeground(block:));
}

- (id)onWindowDidBecomeBackgroundWithBlock:(id)a3
{
  return sub_1B13EBDD4(self, (int)a2, a3, (uint64_t)&unk_1E63224A8, (uint64_t)sub_1B14CA87C, (void (*)(uint64_t, uint64_t))AppMonitor.onWindowDidBecomeBackground(block:));
}

- (BOOL)isTracking
{
  char v2;

  AppMonitor.isTracking.getter();
  return v2 & 1;
}

- (BOOL)isActive
{
  char v2;

  AppMonitor.isActive.getter();
  return v2 & 1;
}

- (void)setIsTracking:(BOOL)a3
{
  sub_1B15AB3D4(a3);
}

- (void)triggerWithEvent:(int64_t)a3
{
  TSAppMonitor *v4;

  v4 = self;
  AppMonitor.trigger(event:)(a3);

}

- (void).cxx_destruct
{
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TSAppMonitor_onWindowDidBecomeBackgroundBlock));
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TSAppMonitor_onWindowWillBecomeForegroundBlock));
}

@end
