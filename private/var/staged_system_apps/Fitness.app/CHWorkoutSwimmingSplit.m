@implementation CHWorkoutSwimmingSplit

- (CHWorkoutSwimmingSplit)initWithSplitDelimiterDistance:(int64_t)a3 distanceInUserUnit:(double)a4 strokeCount:(int64_t)a5 duration:(double)a6
{
  CHWorkoutSwimmingSplit *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CHWorkoutSwimmingSplit;
  result = -[CHWorkoutSwimmingSplit init](&v11, "init");
  if (result)
  {
    result->_splitDelimiterDistance = a3;
    result->_distanceInUserUnit = a4;
    result->_strokeCount = a5;
    result->_duration = a6;
  }
  return result;
}

- (double)_fractionToFillTotalSplitDelimiterDistance
{
  double v3;
  double v4;

  v3 = (double)-[CHWorkoutSwimmingSplit splitDelimiterDistance](self, "splitDelimiterDistance");
  -[CHWorkoutSwimmingSplit distanceInUserUnit](self, "distanceInUserUnit");
  return v3 / v4;
}

- (int64_t)strokeCountScaledToFillSplit
{
  double v3;

  -[CHWorkoutSwimmingSplit _fractionToFillTotalSplitDelimiterDistance](self, "_fractionToFillTotalSplitDelimiterDistance");
  return llround(v3 * (double)-[CHWorkoutSwimmingSplit strokeCount](self, "strokeCount"));
}

- (double)durationScaledToFillSplit
{
  double v3;
  double v4;
  double v5;

  -[CHWorkoutSwimmingSplit duration](self, "duration");
  v4 = v3;
  -[CHWorkoutSwimmingSplit _fractionToFillTotalSplitDelimiterDistance](self, "_fractionToFillTotalSplitDelimiterDistance");
  return v4 * v5;
}

- (id)formattedStrokeCount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CHWorkoutSwimmingSplit strokeCountScaledToFillSplit](self, "strokeCountScaledToFillSplit")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v2, 1));

  return v3;
}

- (id)formattedPaceWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CHWorkoutSwimmingSplit durationScaledToFillSplit](self, "durationScaledToFillSplit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDuration:durationFormat:", 1));

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHWorkoutSwimmingSplit;
  v3 = -[CHWorkoutSwimmingSplit description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CHWorkoutSwimmingSplit duration](self, "duration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CHWorkoutSwimmingSplit splitDelimiterDistance](self, "splitDelimiterDistance")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CHWorkoutSwimmingSplit strokeCount](self, "strokeCount")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ seconds, %@ m/yd, %@ strokes"), v4, v5, v6, v7));

  return v8;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)splitDelimiterDistance
{
  return self->_splitDelimiterDistance;
}

- (void)setSplitDelimiterDistance:(int64_t)a3
{
  self->_splitDelimiterDistance = a3;
}

- (double)distanceInUserUnit
{
  return self->_distanceInUserUnit;
}

- (void)setDistanceInUserUnit:(double)a3
{
  self->_distanceInUserUnit = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (void)setStrokeCountScaledToFillSplit:(int64_t)a3
{
  self->_strokeCountScaledToFillSplit = a3;
}

- (void)setDurationScaledToFillSplit:(double)a3
{
  self->_durationScaledToFillSplit = a3;
}

@end
