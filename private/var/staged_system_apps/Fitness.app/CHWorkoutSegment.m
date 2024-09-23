@implementation CHWorkoutSegment

- (id)formattedDurationValueWithFormattingManager:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CHWorkoutSegment elapsedTime](self, "elapsedTime");
  if (round(v5) >= 3600.0)
    v6 = 2;
  else
    v6 = 3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDuration:durationFormat:", v6));

  return v7;
}

- (id)formattedActiveEnergyValueForUnit:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment activeEnergy](self, "activeEnergy"));
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v8, 1));

  return v9;
}

+ (id)_decimalNumberFormatter
{
  if (qword_10083E168[0] != -1)
    dispatch_once(qword_10083E168, &stru_10077A878);
  return (id)qword_10083E160;
}

- (id)formattedDistanceValueForUnit:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment distance](self, "distance"));
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  *(_QWORD *)&v9 = objc_opt_class(self, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_decimalNumberFormatter", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromNumber:", v12));

  return v13;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4 distanceType:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  v8 = a4;
  -[CHWorkoutSegment distanceGoalAchievedTime](self, "distanceGoalAchievedTime");
  if (v9 <= 0.0)
    -[CHWorkoutSegment elapsedTime](self, "elapsedTime");
  else
    -[CHWorkoutSegment distanceGoalAchievedTime](self, "distanceGoalAchievedTime");
  v11 = v10;
  if (fabs(v10) < 2.22044605e-16)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment endDate](self, "endDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment startDate](self, "startDate"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    v11 = v14;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment distance](self, "distance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:", v15, a3, a5, v11));

  return v16;
}

- (id)formattedDistanceAchievedDurationValueWithFormattingManager:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;

  v4 = a3;
  -[CHWorkoutSegment distanceGoalAchievedTime](self, "distanceGoalAchievedTime");
  if (v5 <= 0.0)
  {
    v7 = 0;
  }
  else
  {
    -[CHWorkoutSegment distanceGoalAchievedTime](self, "distanceGoalAchievedTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDuration:durationFormat:", 3, round(v6)));
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CHWorkoutSegment;
  v3 = -[CHWorkoutSegment description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CHWorkoutSegment elapsedTime](self, "elapsedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5 / 60.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment formattedActiveEnergyValueForUnit:](self, "formattedActiveEnergyValueForUnit:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit mileUnit](HKUnit, "mileUnit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment formattedDistanceValueForUnit:](self, "formattedDistanceValueForUnit:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Duration: %@ min; Energy: %@ Cal; Distance: %@ mi"),
                    v4,
                    v6,
                    v8,
                    v10));

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKQuantity)activeEnergy
{
  return self->_activeEnergy;
}

- (void)setActiveEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergy, a3);
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)distanceGoalAchievedTime
{
  return self->_distanceGoalAchievedTime;
}

- (void)setDistanceGoalAchievedTime:(double)a3
{
  self->_distanceGoalAchievedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_activeEnergy, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
