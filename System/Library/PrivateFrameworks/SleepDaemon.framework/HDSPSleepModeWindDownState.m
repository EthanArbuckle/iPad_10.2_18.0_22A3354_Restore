@implementation HDSPSleepModeWindDownState

- (id)stateName
{
  return CFSTR("Wind Down");
}

- (int64_t)sleepMode
{
  return 1;
}

@end
