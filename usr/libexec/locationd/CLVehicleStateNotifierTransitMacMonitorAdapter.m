@implementation CLVehicleStateNotifierTransitMacMonitorAdapter

- (CLVehicleStateNotifierTransitMacMonitorAdapter)initWithVehicleStateNotifier:(void *)a3
{
  CLVehicleStateNotifierTransitMacMonitorAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLVehicleStateNotifierTransitMacMonitorAdapter;
  result = -[CLVehicleStateNotifierTransitMacMonitorAdapter init](&v5, "init");
  if (result)
  {
    result->_vehicleStateNotifier = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)onTransitStateUpdate:(unint64_t)a3
{
  id *vehicleStateNotifier;

  vehicleStateNotifier = (id *)self->_vehicleStateNotifier;
  sub_10144D398(vehicleStateNotifier, 2 * (a3 != 0));
  vehicleStateNotifier[160] = (id)a3;
  sub_100123B54((uint64_t)vehicleStateNotifier);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
