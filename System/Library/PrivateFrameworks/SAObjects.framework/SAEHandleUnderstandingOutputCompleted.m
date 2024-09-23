@implementation SAEHandleUnderstandingOutputCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.execution");
}

- (id)encodedClassName
{
  return CFSTR("HandleUnderstandingOutputCompleted");
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
