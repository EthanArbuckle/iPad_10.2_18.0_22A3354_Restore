@implementation UIContentUnavailableTextProperties(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:](TTRIContentUnavailableTextProperties, "instanceWrappingImpl:", a1);
}

@end
