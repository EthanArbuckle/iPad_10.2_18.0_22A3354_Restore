@implementation SAClockDeleteCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("DeleteCompleted");
}

+ (id)deleteCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
