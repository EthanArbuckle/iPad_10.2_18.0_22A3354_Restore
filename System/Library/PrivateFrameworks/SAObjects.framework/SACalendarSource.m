@implementation SACalendarSource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("Source");
}

+ (id)source
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)strict
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("strict"));
}

- (void)setStrict:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("strict"), a3);
}

@end
