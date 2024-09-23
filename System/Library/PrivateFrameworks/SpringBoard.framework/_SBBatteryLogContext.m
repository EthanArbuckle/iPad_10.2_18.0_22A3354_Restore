@implementation _SBBatteryLogContext

- (NSArray)foregroundApplications
{
  return self->_foregroundApplications;
}

- (void)setForegroundApplications:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundApplications, a3);
}

- (int)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int)a3
{
  self->_capacity = a3;
}

- (int)voltage
{
  return self->_voltage;
}

- (void)setVoltage:(int)a3
{
  self->_voltage = a3;
}

- (double)usageTimeInSeconds
{
  return self->_usageTimeInSeconds;
}

- (void)setUsageTimeInSeconds:(double)a3
{
  self->_usageTimeInSeconds = a3;
}

- (double)standbyTimeInSeconds
{
  return self->_standbyTimeInSeconds;
}

- (void)setStandbyTimeInSeconds:(double)a3
{
  self->_standbyTimeInSeconds = a3;
}

- (BOOL)hasChargedPartially
{
  return self->_hasChargedPartially;
}

- (void)setHasChargedPartially:(BOOL)a3
{
  self->_hasChargedPartially = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundApplications, 0);
}

@end
