@implementation SADirectInvocationUpdateReadingState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DirectInvocationUpdateReadingState");
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
