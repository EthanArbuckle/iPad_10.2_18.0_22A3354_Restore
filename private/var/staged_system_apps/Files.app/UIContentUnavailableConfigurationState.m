@implementation UIContentUnavailableConfigurationState

- (id)asDOC
{
  return +[DOCUIContentUnavailableShim instanceWrappingImpl:](DOCContentUnavailableConfigurationState, "instanceWrappingImpl:", self);
}

@end
