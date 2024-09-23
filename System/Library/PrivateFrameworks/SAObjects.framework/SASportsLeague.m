@implementation SASportsLeague

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("League");
}

+ (id)league
{
  return objc_alloc_init((Class)a1);
}

- (NSString)diplayedText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("diplayedText"));
}

- (void)setDiplayedText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("diplayedText"), a3);
}

- (BOOL)displayTeamLocationOverName
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("displayTeamLocationOverName"));
}

- (void)setDisplayTeamLocationOverName:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("displayTeamLocationOverName"), a3);
}

- (NSString)displayedText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayedText"));
}

- (void)setDisplayedText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayedText"), a3);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (SASportsSeason)season
{
  return (SASportsSeason *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("season"));
}

- (void)setSeason:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("season"), a3);
}

- (NSString)sport
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sport"));
}

- (void)setSport:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sport"), a3);
}

@end
