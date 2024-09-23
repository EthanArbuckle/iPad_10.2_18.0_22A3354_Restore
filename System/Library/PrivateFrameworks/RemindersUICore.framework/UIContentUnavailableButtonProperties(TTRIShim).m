@implementation UIContentUnavailableButtonProperties(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:](TTRIContentUnavailableButtonProperties, "instanceWrappingImpl:", a1);
}

@end
