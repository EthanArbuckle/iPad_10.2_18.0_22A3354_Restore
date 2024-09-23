@implementation SAFmfLocation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("Location");
}

+ (id)location
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)distance
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("distance"));
}

- (void)setDistance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("distance"), a3);
}

- (SAPersonAttribute)friend
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("friend"));
}

- (void)setFriend:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("friend"), a3);
}

- (NSNumber)locationDate
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locationDate"));
}

- (void)setLocationDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locationDate"), a3);
}

@end
