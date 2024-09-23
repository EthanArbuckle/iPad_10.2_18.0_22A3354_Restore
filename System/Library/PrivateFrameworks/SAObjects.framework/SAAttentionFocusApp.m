@implementation SAAttentionFocusApp

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.attention");
}

- (id)encodedClassName
{
  return CFSTR("FocusApp");
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
