@implementation PXStatsCalculator

- (PXStatsCalculator)init
{
  PXStatsCalculator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStatsCalculator;
  result = -[PXStatsCalculator init](&v3, sel_init);
  if (result)
  {
    result->_first = NAN;
    *(int64x2_t *)&result->_min = vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return result;
}

- (void)addValue:(double)max
{
  double v3;
  int64_t count;
  double min;

  v3 = self->_squareSum + max * max;
  self->_sum = self->_sum + max;
  self->_squareSum = v3;
  count = self->_count;
  self->_count = count + 1;
  if (count)
  {
    min = self->_min;
    if (min >= max)
      min = max;
    if (self->_max >= max)
      max = self->_max;
    self->_min = min;
    self->_max = max;
  }
  else
  {
    self->_max = max;
    self->_first = max;
    self->_min = max;
  }
}

- (double)mean
{
  return self->_sum / (double)self->_count;
}

- (double)standardDeviation
{
  double v3;

  -[PXStatsCalculator mean](self, "mean");
  return sqrt(self->_squareSum / (double)self->_count - v3 * v3);
}

- (int64_t)count
{
  return self->_count;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)first
{
  return self->_first;
}

@end
