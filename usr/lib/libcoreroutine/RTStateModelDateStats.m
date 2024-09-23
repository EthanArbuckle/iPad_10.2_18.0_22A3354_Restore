@implementation RTStateModelDateStats

- (NSDate)averageDate
{
  return self->_averageDate;
}

- (void)setAverageDate:(id)a3
{
  objc_storeStrong((id *)&self->_averageDate, a3);
}

- (double)stdDeviation
{
  return self->_stdDeviation;
}

- (void)setStdDeviation:(double)a3
{
  self->_stdDeviation = a3;
}

- (int)numOfDates
{
  return self->_numOfDates;
}

- (void)setNumOfDates:(int)a3
{
  self->_numOfDates = a3;
}

- (double)timeIntervalToLatestDateSum
{
  return self->_timeIntervalToLatestDateSum;
}

- (void)setTimeIntervalToLatestDateSum:(double)a3
{
  self->_timeIntervalToLatestDateSum = a3;
}

- (double)timeIntervalToLatestDateSum2
{
  return self->_timeIntervalToLatestDateSum2;
}

- (void)setTimeIntervalToLatestDateSum2:(double)a3
{
  self->_timeIntervalToLatestDateSum2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageDate, 0);
}

@end
