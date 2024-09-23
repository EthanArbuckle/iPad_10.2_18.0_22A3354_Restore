@implementation UIContentUnavailableConfiguration(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:](TTRIContentUnavailableConfiguration, "instanceWrappingImpl:", a1);
}

@end
