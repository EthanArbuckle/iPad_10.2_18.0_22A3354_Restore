@implementation _CHWorkoutDetailHeartRateTableItem

- (NSArray)heartRateReadings
{
  return self->_heartRateReadings;
}

- (void)setHeartRateReadings:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateReadings, a3);
}

- (NSNumber)averageHeartRate
{
  return self->_averageHeartRate;
}

- (void)setAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRate, a3);
}

- (NSArray)recoveryHeartRateReadings
{
  return self->_recoveryHeartRateReadings;
}

- (void)setRecoveryHeartRateReadings:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryHeartRateReadings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryHeartRateReadings, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  objc_storeStrong((id *)&self->_heartRateReadings, 0);
}

@end
