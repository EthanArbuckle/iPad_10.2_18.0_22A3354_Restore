@implementation SASportsTeamSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("TeamSnippet");
}

+ (id)teamSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)teams
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("teams"), v3);
}

- (void)setTeams:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("teams"), (uint64_t)a3);
}

@end
