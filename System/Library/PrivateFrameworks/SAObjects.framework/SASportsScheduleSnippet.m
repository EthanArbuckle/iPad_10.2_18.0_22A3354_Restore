@implementation SASportsScheduleSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("ScheduleSnippet");
}

+ (id)scheduleSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)matchups
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("matchups"), v3);
}

- (void)setMatchups:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("matchups"), (uint64_t)a3);
}

@end
