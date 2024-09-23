@implementation SAUISuppressDelayFeedback

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SuppressDelayFeedback");
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
