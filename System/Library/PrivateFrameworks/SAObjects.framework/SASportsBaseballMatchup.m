@implementation SASportsBaseballMatchup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("BaseballMatchup");
}

+ (id)baseballMatchup
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)awayErrors
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayErrors"));
}

- (void)setAwayErrors:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayErrors"), a3);
}

- (NSNumber)awayHits
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("awayHits"));
}

- (void)setAwayHits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("awayHits"), a3);
}

- (NSNumber)balls
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("balls"));
}

- (void)setBalls:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("balls"), a3);
}

- (NSNumber)homeErrors
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeErrors"));
}

- (void)setHomeErrors:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeErrors"), a3);
}

- (NSNumber)homeHits
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeHits"));
}

- (void)setHomeHits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeHits"), a3);
}

- (NSString)inningStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("inningStatus"));
}

- (void)setInningStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("inningStatus"), a3);
}

- (NSNumber)onFirst
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("onFirst"));
}

- (void)setOnFirst:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("onFirst"), a3);
}

- (NSNumber)onSecond
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("onSecond"));
}

- (void)setOnSecond:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("onSecond"), a3);
}

- (NSNumber)onThird
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("onThird"));
}

- (void)setOnThird:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("onThird"), a3);
}

- (NSNumber)outs
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outs"));
}

- (void)setOuts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outs"), a3);
}

- (NSNumber)strikes
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("strikes"));
}

- (void)setStrikes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("strikes"), a3);
}

@end
