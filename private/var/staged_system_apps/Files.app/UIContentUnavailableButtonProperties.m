@implementation UIContentUnavailableButtonProperties

- (id)asDOC
{
  return +[DOCUIContentUnavailableShim instanceWrappingImpl:](DOCContentUnavailableButtonProperties, "instanceWrappingImpl:", self);
}

@end
