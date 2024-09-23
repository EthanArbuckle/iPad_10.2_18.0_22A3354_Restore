@implementation SAFmfGeoFence

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("GeoFence");
}

+ (id)geoFence
{
  return objc_alloc_init((Class)a1);
}

- (SAPersonAttribute)friend
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("friend"));
}

- (void)setFriend:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("friend"), a3);
}

- (NSString)geoFenceTrigger
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("geoFenceTrigger"));
}

- (void)setGeoFenceTrigger:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("geoFenceTrigger"), a3);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

@end
