@implementation SALocalSearchVehicleEventDelete

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("VehicleEventDelete");
}

+ (id)vehicleEventDelete
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)eventIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventIds"));
}

- (void)setEventIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventIds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
