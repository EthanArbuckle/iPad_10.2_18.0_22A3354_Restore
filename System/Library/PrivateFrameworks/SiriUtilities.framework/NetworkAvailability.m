@implementation NetworkAvailability

- (SUNetworkReachability)networkReachability
{
  return (SUNetworkReachability *)NetworkAvailability.networkReachability.getter();
}

@end
