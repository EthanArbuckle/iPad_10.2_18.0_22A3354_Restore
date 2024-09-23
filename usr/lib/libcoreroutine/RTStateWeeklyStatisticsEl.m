@implementation RTStateWeeklyStatisticsEl

- (RTStateWeeklyStatisticsEl)init
{
  RTStateWeeklyStatisticsEl *v2;
  RTStateWeeklyStatisticsEl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStateWeeklyStatisticsEl;
  v2 = -[RTStateWeeklyStatisticsEl init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RTStateWeeklyStatisticsEl setAvgAggTime_s:](v2, "setAvgAggTime_s:", -1.0);
    -[RTStateWeeklyStatisticsEl setStdAggTime_s:](v3, "setStdAggTime_s:", -1.0);
    -[RTStateWeeklyStatisticsEl setDaysPerWeek:](v3, "setDaysPerWeek:", 0.0);
    -[RTStateWeeklyStatisticsEl setNumOfClustEntPerWeek:](v3, "setNumOfClustEntPerWeek:", 0.0);
    -[RTStateWeeklyStatisticsEl setTopMedian:](v3, "setTopMedian:", 0.0);
  }
  return v3;
}

- (double)numOfClustEntPerWeek
{
  return self->_numOfClustEntPerWeek;
}

- (void)setNumOfClustEntPerWeek:(double)a3
{
  self->_numOfClustEntPerWeek = a3;
}

- (double)avgAggTime_s
{
  return self->_avgAggTime_s;
}

- (void)setAvgAggTime_s:(double)a3
{
  self->_avgAggTime_s = a3;
}

- (double)stdAggTime_s
{
  return self->_stdAggTime_s;
}

- (void)setStdAggTime_s:(double)a3
{
  self->_stdAggTime_s = a3;
}

- (double)daysPerWeek
{
  return self->_daysPerWeek;
}

- (void)setDaysPerWeek:(double)a3
{
  self->_daysPerWeek = a3;
}

- (NSUUID)stateUUID
{
  return self->_stateUUID;
}

- (void)setStateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)topMedian
{
  return self->_topMedian;
}

- (void)setTopMedian:(double)a3
{
  self->_topMedian = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUUID, 0);
}

@end
