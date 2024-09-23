@implementation HDSPSleepLockScreenBedtimeState

- (id)stateName
{
  return CFSTR("Bedtime");
}

- (int64_t)sleepLockScreenState
{
  return 2;
}

@end
