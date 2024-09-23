@implementation CDDConfig

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (int)batteryMonitorExchangeTimerDelta
{
  return self->_batteryMonitorExchangeTimerDelta;
}

- (void)setBatteryMonitorExchangeTimerDelta:(int)a3
{
  self->_batteryMonitorExchangeTimerDelta = a3;
}

- (int)batteryMonitorExchangeBattDelta
{
  return self->_batteryMonitorExchangeBattDelta;
}

- (void)setBatteryMonitorExchangeBattDelta:(int)a3
{
  self->_batteryMonitorExchangeBattDelta = a3;
}

- (BOOL)commEnabled
{
  return self->_commEnabled;
}

- (void)setCommEnabled:(BOOL)a3
{
  self->_commEnabled = a3;
}

- (int)commMinClientGranularity
{
  return self->_commMinClientGranularity;
}

- (void)setCommMinClientGranularity:(int)a3
{
  self->_commMinClientGranularity = a3;
}

- (int)commSyncBoundarySeconds
{
  return self->_commSyncBoundarySeconds;
}

- (void)setCommSyncBoundarySeconds:(int)a3
{
  self->_commSyncBoundarySeconds = a3;
}

- (NSDate)ageOfDatabase
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAgeOfDatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageOfDatabase, 0);
}

@end
