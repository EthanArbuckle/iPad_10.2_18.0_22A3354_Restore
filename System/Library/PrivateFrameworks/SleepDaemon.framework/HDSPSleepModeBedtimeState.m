@implementation HDSPSleepModeBedtimeState

- (id)stateName
{
  return CFSTR("Bedtime");
}

- (int64_t)sleepMode
{
  return 2;
}

@end
