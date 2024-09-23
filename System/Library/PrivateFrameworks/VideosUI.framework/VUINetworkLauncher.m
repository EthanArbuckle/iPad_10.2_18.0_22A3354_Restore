@implementation VUINetworkLauncher

+ (VUINetworkLauncher)shared
{
  return (VUINetworkLauncher *)static NetworkLauncher.shared.getter();
}

- (void)preWarmImageConnection
{
  VUINetworkLauncher *v2;

  v2 = self;
  NetworkLauncher.preWarmImageConnection()();

}

- (VUINetworkLauncher)init
{
  VUINetworkLauncher *result;

  sub_1D9F22D34();
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
