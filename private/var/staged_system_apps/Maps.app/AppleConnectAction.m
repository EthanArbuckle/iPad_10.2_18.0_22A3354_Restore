@implementation AppleConnectAction

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (BOOL)forceEndNavigation
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return 0;
}

@end
