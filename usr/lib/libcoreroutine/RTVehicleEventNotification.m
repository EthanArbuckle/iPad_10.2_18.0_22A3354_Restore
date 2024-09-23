@implementation RTVehicleEventNotification

- (RTVehicleEventNotification)initWithVehicleEvents:(id)a3
{
  id v4;
  RTVehicleEventNotification *v5;
  uint64_t v6;
  NSArray *vehicleEvents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTVehicleEventNotification;
  v5 = -[RTNotification init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    vehicleEvents = v5->_vehicleEvents;
    v5->_vehicleEvents = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)vehicleEvents
{
  return self->_vehicleEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleEvents, 0);
}

@end
