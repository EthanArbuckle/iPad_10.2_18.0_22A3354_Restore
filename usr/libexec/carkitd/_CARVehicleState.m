@implementation _CARVehicleState

- (NSString)vehicleStateDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_CARVehicleState vehicleState](self, "vehicleState")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CARVehicleState deviceID](self, "deviceID"));
  -[_CARVehicleState vehicularHints](self, "vehicularHints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_CARVehicleState vehicularHints](self, "vehicularHints") & 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_CARVehicleState vehicularHints](self, "vehicularHints") & 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_CARVehicleState vehicularHints](self, "vehicularHints") & 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_CARVehicleState vehicularHints](self, "vehicularHints") & 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_CARVehicleState vehicularHints](self, "vehicularHints") & 0x10));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Vehicle State %@, device ID %@, Vehicular Hints: None: %@ Motion: %@ GPS: %@ Baseband: %@ WiFi: %@ Bluetooth: %@"), v3, v4, v5, v6, v7, v8, v9, v10));

  return (NSString *)v11;
}

- (unint64_t)vehicleState
{
  return self->_vehicleState;
}

- (void)setVehicleState:(unint64_t)a3
{
  self->_vehicleState = a3;
}

- (unint64_t)vehicularHints
{
  return self->_vehicularHints;
}

- (void)setVehicularHints:(unint64_t)a3
{
  self->_vehicularHints = a3;
}

- (unint64_t)vehicleOperatorState
{
  return self->_vehicleOperatorState;
}

- (void)setVehicleOperatorState:(unint64_t)a3
{
  self->_vehicleOperatorState = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
