@implementation SAFmfGeoFenceSet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("GeoFenceSet");
}

+ (id)geoFenceSet
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)enable
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enable"));
}

- (void)setEnable:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enable"), a3);
}

- (NSString)fenceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fenceType"));
}

- (void)setFenceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fenceType"), a3);
}

- (SAPerson)friend
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("friend"));
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

- (NSNumber)oneTimeOnly
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("oneTimeOnly"));
}

- (void)setOneTimeOnly:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("oneTimeOnly"), a3);
}

- (SALocation)requestedLocation
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("requestedLocation"));
}

- (void)setRequestedLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("requestedLocation"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
