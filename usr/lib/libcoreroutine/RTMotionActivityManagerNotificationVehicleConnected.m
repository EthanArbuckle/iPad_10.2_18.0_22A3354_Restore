@implementation RTMotionActivityManagerNotificationVehicleConnected

- (RTMotionActivityManagerNotificationVehicleConnected)initWithVehicleConnectedState:(unint64_t)a3 deviceId:(id)a4
{
  id v6;
  RTMotionActivityManagerNotificationVehicleConnected *v7;
  RTMotionActivityManagerNotificationVehicleConnected *v8;
  uint64_t v9;
  NSString *deviceId;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTMotionActivityManagerNotificationVehicleConnected;
  v7 = -[RTNotification init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_vehicleConnectedState = a3;
    v9 = objc_msgSend(v6, "copy");
    deviceId = v8->_deviceId;
    v8->_deviceId = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)vehicleConnectedState
{
  return self->_vehicleConnectedState;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
