@implementation SASTCompetingTeamPlayDetailHeaderItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("CompetingTeamPlayDetailHeaderItem");
}

+ (id)competingTeamPlayDetailHeaderItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)firstTeam
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("firstTeam"));
}

- (void)setFirstTeam:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("firstTeam"), a3);
}

- (SAUIDecoratedText)secondTeam
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("secondTeam"));
}

- (void)setSecondTeam:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("secondTeam"), a3);
}

@end
