@implementation UIContentUnavailableConfigurationState(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:](TTRIContentUnavailableConfigurationState, "instanceWrappingImpl:", a1);
}

@end
