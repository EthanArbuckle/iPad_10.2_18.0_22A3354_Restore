@implementation CLVisitTimePeriod

- (CLVisitTimePeriod)init
{
  CLVisitTimePeriod *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVisitTimePeriod;
  result = -[CLVisitTimePeriod init](&v3, "init");
  if (result)
    *(int64x2_t *)&result->_startTime = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  return result;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

@end
