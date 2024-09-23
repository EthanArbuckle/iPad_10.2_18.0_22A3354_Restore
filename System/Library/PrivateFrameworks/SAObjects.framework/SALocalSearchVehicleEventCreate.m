@implementation SALocalSearchVehicleEventCreate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("VehicleEventCreate");
}

+ (id)vehicleEventCreate
{
  return objc_alloc_init((Class)a1);
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

- (BOOL)requiresResponse
{
  return 1;
}

@end
