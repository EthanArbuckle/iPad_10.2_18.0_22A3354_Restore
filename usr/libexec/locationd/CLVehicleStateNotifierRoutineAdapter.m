@implementation CLVehicleStateNotifierRoutineAdapter

- (CLVehicleStateNotifierRoutineAdapter)initWithVehicleStateNotifier:(void *)a3
{
  CLVehicleStateNotifierRoutineAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLVehicleStateNotifierRoutineAdapter;
  result = -[CLVehicleStateNotifierRoutineAdapter init](&v5, "init");
  if (result)
  {
    result->_vehicleStateNotifier = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)onVisit:(id)a3
{
  sub_101449D44((uint64_t)self->_vehicleStateNotifier, a3, 1);
}

- (void)onLowConfidenceVisit:(id)a3
{
  sub_101449D44((uint64_t)self->_vehicleStateNotifier, a3, 0);
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
