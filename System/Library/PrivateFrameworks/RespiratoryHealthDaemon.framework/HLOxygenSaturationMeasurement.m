@implementation HLOxygenSaturationMeasurement

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (NSNumber)oxygenSaturationPercentage
{
  return self->_oxygenSaturationPercentage;
}

- (void)setOxygenSaturationPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_oxygenSaturationPercentage, a3);
}

- (HLHeartRateData)averageHeartRateData
{
  return self->_averageHeartRateData;
}

- (void)setAverageHeartRateData:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRateData, a3);
}

- (NSNumber)pressureInKilopascals
{
  return self->_pressureInKilopascals;
}

- (void)setPressureInKilopascals:(id)a3
{
  objc_storeStrong((id *)&self->_pressureInKilopascals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressureInKilopascals, 0);
  objc_storeStrong((id *)&self->_averageHeartRateData, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationPercentage, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
