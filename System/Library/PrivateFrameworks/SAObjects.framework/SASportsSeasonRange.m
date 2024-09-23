@implementation SASportsSeasonRange

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("SeasonRange");
}

+ (id)seasonRange
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)end
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("end"));
}

- (void)setEnd:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("end"), a3);
}

- (NSString)seasonType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seasonType"));
}

- (void)setSeasonType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seasonType"), a3);
}

- (NSDate)start
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("start"));
}

- (void)setStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("start"), a3);
}

@end
