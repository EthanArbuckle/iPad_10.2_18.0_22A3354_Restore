@implementation PFSlowMotionTimeRangeMapperScaledRegion

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rampInStartTime
{
  return self->_rampInStartTime;
}

- (void)setRampInStartTime:(float)a3
{
  self->_rampInStartTime = a3;
}

- (float)rampInEndTime
{
  return self->_rampInEndTime;
}

- (void)setRampInEndTime:(float)a3
{
  self->_rampInEndTime = a3;
}

- (float)rampOutStartTime
{
  return self->_rampOutStartTime;
}

- (void)setRampOutStartTime:(float)a3
{
  self->_rampOutStartTime = a3;
}

- (float)rampOutEndTime
{
  return self->_rampOutEndTime;
}

- (void)setRampOutEndTime:(float)a3
{
  self->_rampOutEndTime = a3;
}

@end
