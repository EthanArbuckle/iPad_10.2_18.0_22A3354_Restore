@implementation RTLocationStoreMetrics

- (RTLocationStoreMetrics)init
{
  return -[RTLocationStoreMetrics initWithCount:maxIntervalBetweenLocations:spread:distanceTraveled:](self, "initWithCount:maxIntervalBetweenLocations:spread:distanceTraveled:", 0, -1.79769313e308, -1.79769313e308, 0.0);
}

- (RTLocationStoreMetrics)initWithCount:(unint64_t)a3 maxIntervalBetweenLocations:(double)a4 spread:(double)a5 distanceTraveled:(double)a6
{
  RTLocationStoreMetrics *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RTLocationStoreMetrics;
  result = -[RTLocationStoreMetrics init](&v11, sel_init);
  if (result)
  {
    result->_count = a3;
    result->_maxIntervalBetweenLocations = a4;
    result->_spread = a5;
    result->_distanceTraveled = a6;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count, %lu, maxIntervalBetweenLocations, %.2f, spread, %.2f"), self->_count, *(_QWORD *)&self->_maxIntervalBetweenLocations, *(_QWORD *)&self->_spread);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (double)distanceTraveled
{
  return self->_distanceTraveled;
}

- (void)setDistanceTraveled:(double)a3
{
  self->_distanceTraveled = a3;
}

- (double)maxIntervalBetweenLocations
{
  return self->_maxIntervalBetweenLocations;
}

- (void)setMaxIntervalBetweenLocations:(double)a3
{
  self->_maxIntervalBetweenLocations = a3;
}

- (double)spread
{
  return self->_spread;
}

- (void)setSpread:(double)a3
{
  self->_spread = a3;
}

- (unint64_t)firstFixType
{
  return self->_firstFixType;
}

- (void)setFirstFixType:(unint64_t)a3
{
  self->_firstFixType = a3;
}

- (double)firstFixHorizontalUncertainty
{
  return self->_firstFixHorizontalUncertainty;
}

- (void)setFirstFixHorizontalUncertainty:(double)a3
{
  self->_firstFixHorizontalUncertainty = a3;
}

- (unint64_t)signalEnvironment
{
  return self->_signalEnvironment;
}

- (void)setSignalEnvironment:(unint64_t)a3
{
  self->_signalEnvironment = a3;
}

@end
