@implementation SALocalSearchVehicleEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("VehicleEvent");
}

+ (id)vehicleEvent
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)date
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("date"));
}

- (void)setDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("date"), a3);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)notes
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notes"));
}

- (void)setNotes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notes"), a3);
}

- (NSNumber)userSetLocation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userSetLocation"));
}

- (void)setUserSetLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userSetLocation"), a3);
}

- (NSString)vehicleIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("vehicleIdentifier"));
}

- (void)setVehicleIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("vehicleIdentifier"), a3);
}

@end
