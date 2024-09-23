@implementation SACalendarShowNextEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("ShowNextEvent");
}

+ (id)showNextEvent
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
