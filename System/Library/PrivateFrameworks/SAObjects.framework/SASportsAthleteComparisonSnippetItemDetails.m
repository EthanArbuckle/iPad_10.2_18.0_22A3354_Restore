@implementation SASportsAthleteComparisonSnippetItemDetails

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("AthleteComparisonSnippetItemDetails");
}

+ (id)athleteComparisonSnippetItemDetails
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)leagueAppPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("leagueAppPunchOut"));
}

- (void)setLeagueAppPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("leagueAppPunchOut"), a3);
}

- (SASportsMetadata)metadata
{
  return (SASportsMetadata *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("metadata"), a3);
}

- (SAUIAppPunchOut)providerPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("providerPunchOut"));
}

- (void)setProviderPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("providerPunchOut"), a3);
}

@end
