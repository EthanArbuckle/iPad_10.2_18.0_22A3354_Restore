@implementation SAAlarmSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)alarms
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("alarms"), v3);
}

- (void)setAlarms:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("alarms"), (uint64_t)a3);
}

@end
