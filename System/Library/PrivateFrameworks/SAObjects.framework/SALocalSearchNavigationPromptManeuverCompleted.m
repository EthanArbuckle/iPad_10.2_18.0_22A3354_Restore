@implementation SALocalSearchNavigationPromptManeuverCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("NavigationPromptManeuverCompleted");
}

+ (id)navigationPromptManeuverCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
