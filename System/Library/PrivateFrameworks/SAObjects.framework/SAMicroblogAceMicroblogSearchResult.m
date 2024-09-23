@implementation SAMicroblogAceMicroblogSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("AceMicroblogSearchResult");
}

+ (id)aceMicroblogSearchResult
{
  return objc_alloc_init((Class)a1);
}

- (SAMicroblogTwitterPostAuthor)globalAuthor
{
  return (SAMicroblogTwitterPostAuthor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("globalAuthor"));
}

- (void)setGlobalAuthor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("globalAuthor"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (NSArray)resultNews
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("resultNews"), v3);
}

- (void)setResultNews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("resultNews"), (uint64_t)a3);
}

- (NSArray)resultPosts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("resultPosts"), v3);
}

- (void)setResultPosts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("resultPosts"), (uint64_t)a3);
}

- (NSArray)resultUsers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("resultUsers"), v3);
}

- (void)setResultUsers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("resultUsers"), (uint64_t)a3);
}

- (SADecoratedString)summary
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("summary"));
}

- (void)setSummary:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("summary"), a3);
}

- (NSURL)webAddress
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("webAddress"));
}

- (void)setWebAddress:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("webAddress"), a3);
}

@end
