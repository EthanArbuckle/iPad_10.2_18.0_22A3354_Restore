@implementation CHWorkoutSwimmingSet

- (double)_activeDuration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet movementEndDate](self, "movementEndDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet startDate](self, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (double)_restingDuration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet endDate](self, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet movementEndDate](self, "movementEndDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)formattedActiveDurationWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CHWorkoutSwimmingSet _activeDuration](self, "_activeDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDuration:durationFormat:", 3));

  return v5;
}

- (id)formattedRestDurationWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CHWorkoutSwimmingSet _restingDuration](self, "_restingDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDuration:durationFormat:", 3));

  return v5;
}

+ (id)_decimalNumberFormatter
{
  if (qword_10083E0B8 != -1)
    dispatch_once(&qword_10083E0B8, &stru_10077A148);
  return (id)qword_10083E0B0;
}

- (id)formattedDistanceValueWithFormattingManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet distance](self, "distance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", 3, 1));

  return v7;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[CHWorkoutSwimmingSet _activeDuration](self, "_activeDuration");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet distance](self, "distance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedSwimmingPaceStringWithDistance:overDuration:paceFormat:", v9, a3, v8));

  return v10;
}

- (id)formattedStrokeCountUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = -[CHWorkoutSwimmingSet strokeCount](self, "strokeCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet distance](self, "distance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStrokeCountStringWithCount:overDistance:paceFormat:", v7, v8, a3));

  return v9;
}

- (id)formattedDominantStrokeStyle
{
  return (id)FILocalizedStrokeStyleName(-[CHWorkoutSwimmingSet dominantStrokeStyle](self, "dominantStrokeStyle"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHWorkoutSwimmingSet;
  v3 = -[CHWorkoutSwimmingSet description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet startDate](self, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet endDate](self, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSwimmingSet distance](self, "distance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CHWorkoutSwimmingSet strokeCount](self, "strokeCount")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CHWorkoutSwimmingSet dominantStrokeStyle](self, "dominantStrokeStyle")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Start: %@; End: %@; Distance: %@; Stroke Count: %@; Stroke Style: %@"),
                    v4,
                    v5,
                    v6,
                    v7,
                    v8,
                    v9));

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)movementEndDate
{
  return self->_movementEndDate;
}

- (void)setMovementEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_movementEndDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)dominantStrokeStyle
{
  return self->_dominantStrokeStyle;
}

- (void)setDominantStrokeStyle:(int64_t)a3
{
  self->_dominantStrokeStyle = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (int64_t)swolfScore
{
  return self->_swolfScore;
}

- (void)setSwolfScore:(int64_t)a3
{
  self->_swolfScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_movementEndDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
