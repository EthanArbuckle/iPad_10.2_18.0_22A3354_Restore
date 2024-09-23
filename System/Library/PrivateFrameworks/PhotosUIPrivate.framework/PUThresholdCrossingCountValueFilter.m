@implementation PUThresholdCrossingCountValueFilter

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  double v7;
  double v8;
  int64_t crossingCount;

  -[PUThresholdCrossingCountValueFilter thresholdValue](self, "thresholdValue");
  v8 = v7;
  crossingCount = self->_crossingCount;
  if (v7 <= a3 != v7 <= a4)
    self->_crossingCount = ++crossingCount;
  if (crossingCount >= -[PUThresholdCrossingCountValueFilter maximumCrossingCount](self, "maximumCrossingCount"))
    return v8;
  else
    return a4;
}

- (double)thresholdValue
{
  return self->_thresholdValue;
}

- (void)setThresholdValue:(double)a3
{
  self->_thresholdValue = a3;
}

- (int64_t)maximumCrossingCount
{
  return self->_maximumCrossingCount;
}

- (void)setMaximumCrossingCount:(int64_t)a3
{
  self->_maximumCrossingCount = a3;
}

@end
