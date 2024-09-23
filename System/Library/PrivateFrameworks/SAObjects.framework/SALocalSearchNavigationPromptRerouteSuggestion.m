@implementation SALocalSearchNavigationPromptRerouteSuggestion

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("NavigationPromptRerouteSuggestion");
}

+ (id)navigationPromptRerouteSuggestion
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
