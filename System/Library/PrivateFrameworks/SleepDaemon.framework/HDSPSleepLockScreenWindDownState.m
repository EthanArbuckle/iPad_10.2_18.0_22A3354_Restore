@implementation HDSPSleepLockScreenWindDownState

- (id)stateName
{
  return CFSTR("WindDown");
}

- (int64_t)sleepLockScreenState
{
  return 1;
}

@end
