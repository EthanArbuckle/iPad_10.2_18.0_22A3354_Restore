@implementation SASportsSeason

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Season");
}

+ (id)season
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)currentSeasonYear
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentSeasonYear"));
}

- (void)setCurrentSeasonYear:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentSeasonYear"), a3);
}

- (NSString)relativeSeasonYear
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("relativeSeasonYear"));
}

- (void)setRelativeSeasonYear:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("relativeSeasonYear"), a3);
}

- (NSNumber)seasonYear
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seasonYear"));
}

- (void)setSeasonYear:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seasonYear"), a3);
}

@end
