@implementation BeaconNearOwnerService

- (void)scanTimerFired
{
  swift_retain();
  sub_100264784();
  swift_release();
}

- (void)nearOwnerMonitoringTimerFired
{
  swift_retain_n(self, 2);
  sub_100263344((uint64_t)sub_100264F38, (uint64_t)self);
  swift_release_n(self, 2);
}

@end
