@implementation SAUISnippetDisplayConfigurationRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SnippetDisplayConfigurationRequest");
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
