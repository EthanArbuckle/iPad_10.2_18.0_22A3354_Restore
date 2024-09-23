@implementation SALocalSearchVehicleEventSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("VehicleEventSearchCompleted");
}

+ (id)vehicleEventSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)events
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("events"), v3);
}

- (void)setEvents:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("events"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
