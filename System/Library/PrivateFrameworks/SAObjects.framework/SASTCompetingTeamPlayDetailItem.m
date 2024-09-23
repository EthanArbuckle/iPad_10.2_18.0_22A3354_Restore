@implementation SASTCompetingTeamPlayDetailItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("CompetingTeamPlayDetailItem");
}

+ (id)competingTeamPlayDetailItem
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)firstEntity
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("firstEntity"));
}

- (void)setFirstEntity:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("firstEntity"), a3);
}

- (SAUIDecoratedText)playDetail
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playDetail"));
}

- (void)setPlayDetail:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playDetail"), a3);
}

@end
