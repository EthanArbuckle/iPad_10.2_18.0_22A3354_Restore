@implementation SATimerSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)timers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("timers"), v3);
}

- (void)setTimers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("timers"), (uint64_t)a3);
}

@end
