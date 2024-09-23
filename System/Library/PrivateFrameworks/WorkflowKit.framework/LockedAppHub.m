@implementation LockedAppHub

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  id v4;

  v4 = a3;
  swift_retain();
  LockedAppHub.applicationContext(_:applicationStateDidChange:)();

  swift_release();
}

@end
