@implementation SASportsMatchupPlaySummary

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("MatchupPlaySummary");
}

+ (id)matchupPlaySummary
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)appliesToAwayTeam
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("appliesToAwayTeam"));
}

- (void)setAppliesToAwayTeam:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("appliesToAwayTeam"), a3);
}

- (BOOL)appliesToHomeTeam
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("appliesToHomeTeam"));
}

- (void)setAppliesToHomeTeam:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("appliesToHomeTeam"), a3);
}

- (NSString)nonFormattedTime
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nonFormattedTime"));
}

- (void)setNonFormattedTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nonFormattedTime"), a3);
}

- (SASportsAthlete)offensivePlayer
{
  return (SASportsAthlete *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("offensivePlayer"));
}

- (void)setOffensivePlayer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("offensivePlayer"), a3);
}

- (NSString)summaryDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("summaryDescription"));
}

- (void)setSummaryDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("summaryDescription"), a3);
}

- (NSString)time
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("time"));
}

- (void)setTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("time"), a3);
}

@end
