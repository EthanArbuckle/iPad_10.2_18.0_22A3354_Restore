@implementation HDSPSleepWidgetUpcomingState

- (id)stateName
{
  return CFSTR("Upcoming");
}

- (int64_t)widgetState
{
  return 2;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

@end
