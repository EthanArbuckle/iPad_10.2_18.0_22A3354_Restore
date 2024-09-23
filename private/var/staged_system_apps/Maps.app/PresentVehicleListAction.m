@implementation PresentVehicleListAction

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return 1;
}

- (BOOL)forceEndNavigation
{
  return 1;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

@end
