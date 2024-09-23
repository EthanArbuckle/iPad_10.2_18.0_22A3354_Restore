@implementation WiFiSoftErrorStatsRecord

- (int64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int64_t)a3
{
  self->_motionState = a3;
}

- (unsigned)inCarState
{
  return self->_inCarState;
}

- (void)setInCarState:(unsigned __int8)a3
{
  self->_inCarState = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)cca
{
  return self->_cca;
}

- (void)setCca:(int64_t)a3
{
  self->_cca = a3;
}

- (int64_t)snr
{
  return self->_snr;
}

- (void)setSnr:(int64_t)a3
{
  self->_snr = a3;
}

- (int64_t)batteryLevelPercent
{
  return self->_batteryLevelPercent;
}

- (void)setBatteryLevelPercent:(int64_t)a3
{
  self->_batteryLevelPercent = a3;
}

- (BOOL)externalPowerSupply
{
  return self->_externalPowerSupply;
}

- (void)setExternalPowerSupply:(BOOL)a3
{
  self->_externalPowerSupply = a3;
}

- (unsigned)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)setLowPowerMode:(unsigned __int8)a3
{
  self->_lowPowerMode = a3;
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (void)setApplicationBundleId:(id)a3
{
  self->_applicationBundleId = (NSString *)a3;
}

- (double)statsRecordTime
{
  return self->_statsRecordTime;
}

- (void)setStatsRecordTime:(double)a3
{
  self->_statsRecordTime = a3;
}

@end
