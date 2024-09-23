@implementation SAAXSkipAhead

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.accessibility");
}

- (id)encodedClassName
{
  return CFSTR("SkipAhead");
}

+ (id)skipAhead
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
