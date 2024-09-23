@implementation SAPostCalendarActivityNotification

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PostCalendarActivityNotification");
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
