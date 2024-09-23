@implementation SACalendarDefaultSourceGet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("DefaultSourceGet");
}

+ (id)defaultSourceGet
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
