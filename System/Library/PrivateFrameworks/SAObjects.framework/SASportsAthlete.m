@implementation SASportsAthlete

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Athlete");
}

+ (id)athlete
{
  return objc_alloc_init((Class)a1);
}

- (SASportsTeam)activeTeam
{
  return (SASportsTeam *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("activeTeam"));
}

- (void)setActiveTeam:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("activeTeam"), a3);
}

- (NSArray)athleteMetadata
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("athleteMetadata"), v3);
}

- (void)setAthleteMetadata:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("athleteMetadata"), (uint64_t)a3);
}

- (NSArray)careerStatistics
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("careerStatistics"), v3);
}

- (void)setCareerStatistics:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("careerStatistics"), (uint64_t)a3);
}

- (NSString)firstName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firstName"));
}

- (void)setFirstName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firstName"), a3);
}

- (NSArray)formattedMetadata
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("formattedMetadata"));
}

- (void)setFormattedMetadata:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("formattedMetadata"), a3);
}

- (NSArray)formattedMetadataTypes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("formattedMetadataTypes"));
}

- (void)setFormattedMetadataTypes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("formattedMetadataTypes"), a3);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)height
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("height"));
}

- (void)setHeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("height"), a3);
}

- (NSNumber)injured
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("injured"));
}

- (void)setInjured:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("injured"), a3);
}

- (NSString)jerseyNumber
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jerseyNumber"));
}

- (void)setJerseyNumber:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jerseyNumber"), a3);
}

- (NSArray)lastGameStatistics
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("lastGameStatistics"), v3);
}

- (void)setLastGameStatistics:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("lastGameStatistics"), (uint64_t)a3);
}

- (NSString)lastName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastName"));
}

- (void)setLastName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastName"), a3);
}

- (NSString)nickname
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nickname"));
}

- (void)setNickname:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nickname"), a3);
}

- (NSString)position
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
}

- (void)setPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), a3);
}

- (NSArray)previousTeams
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("previousTeams"), v3);
}

- (void)setPreviousTeams:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("previousTeams"), (uint64_t)a3);
}

- (NSArray)statistics
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("statistics"), v3);
}

- (void)setStatistics:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("statistics"), (uint64_t)a3);
}

- (NSString)weight
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weight"));
}

- (void)setWeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weight"), a3);
}

@end
