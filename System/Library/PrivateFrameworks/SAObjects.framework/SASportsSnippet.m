@implementation SASportsSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (SASportsLeague)league
{
  return (SASportsLeague *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("league"));
}

- (void)setLeague:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("league"), a3);
}

- (SAUIAppPunchOut)leagueAppPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("leagueAppPunchOut"));
}

- (void)setLeagueAppPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("leagueAppPunchOut"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

@end
