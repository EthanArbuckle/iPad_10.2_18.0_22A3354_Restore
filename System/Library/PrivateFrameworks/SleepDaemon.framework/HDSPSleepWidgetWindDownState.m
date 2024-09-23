@implementation HDSPSleepWidgetWindDownState

- (id)stateName
{
  return CFSTR("WindDown");
}

- (int64_t)widgetState
{
  return 3;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 0;
}

@end
