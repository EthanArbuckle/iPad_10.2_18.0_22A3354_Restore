@implementation SASportsTeamRank

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("TeamRank");
}

+ (id)teamRank
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)position
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
}

- (void)setPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), a3);
}

- (NSNumber)primary
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("primary"));
}

- (void)setPrimary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("primary"), a3);
}

- (NSString)source
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("source"));
}

- (void)setSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("source"), a3);
}

@end
