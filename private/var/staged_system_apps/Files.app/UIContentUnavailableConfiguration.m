@implementation UIContentUnavailableConfiguration

- (id)asDOC
{
  return +[DOCUIContentUnavailableShim instanceWrappingImpl:](DOCContentUnavailableConfiguration, "instanceWrappingImpl:", self);
}

@end
