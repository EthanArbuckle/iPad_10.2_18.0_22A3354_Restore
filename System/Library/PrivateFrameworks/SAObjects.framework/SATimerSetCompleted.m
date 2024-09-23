@implementation SATimerSetCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("SetCompleted");
}

+ (id)setCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
