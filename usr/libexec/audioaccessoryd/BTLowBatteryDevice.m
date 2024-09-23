@implementation BTLowBatteryDevice

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)lastBatteryLevel
{
  return self->_lastBatteryLevel;
}

- (void)setLastBatteryLevel:(double)a3
{
  self->_lastBatteryLevel = a3;
}

- (int64_t)lastBatteryType
{
  return self->_lastBatteryType;
}

- (void)setLastBatteryType:(int64_t)a3
{
  self->_lastBatteryType = a3;
}

- (double)lastSeenTime
{
  return self->_lastSeenTime;
}

- (void)setLastSeenTime:(double)a3
{
  self->_lastSeenTime = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (double)reportTime
{
  return self->_reportTime;
}

- (void)setReportTime:(double)a3
{
  self->_reportTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end
