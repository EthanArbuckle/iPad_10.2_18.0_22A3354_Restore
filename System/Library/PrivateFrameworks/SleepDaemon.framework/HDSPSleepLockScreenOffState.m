@implementation HDSPSleepLockScreenOffState

- (id)stateName
{
  return CFSTR("Off");
}

- (int64_t)sleepLockScreenState
{
  return 0;
}

@end
