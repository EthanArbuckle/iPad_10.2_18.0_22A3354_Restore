@implementation PUVelocityFilter

- (PUVelocityFilter)init
{
  PUVelocityFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVelocityFilter;
  result = -[PUDynamicValueFilter init](&v3, sel_init);
  if (result)
    result->__minimumSampleInterval = 0.00000011920929;
  return result;
}

- (void)setInputValue:(double)a3
{
  double v5;
  double lastTime;
  double velocity;
  double v8;
  double previousVelocityWeight;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  lastTime = self->_lastTime;
  if (v5 >= lastTime + self->__minimumSampleInterval)
  {
    velocity = self->_velocity;
    v8 = (a3 - self->_lastValue) / (v5 - lastTime);
    previousVelocityWeight = self->__previousVelocityWeight;
    self->_lastValue = a3;
    self->_lastTime = v5;
    self->_velocity = v8;
    self->_previousVelocity = velocity;
    self->_filteredVelocity = velocity * previousVelocityWeight + (1.0 - previousVelocityWeight) * v8;
  }
}

- (double)outputValue
{
  return self->_filteredVelocity;
}

- (double)_minimumSampleInterval
{
  return self->__minimumSampleInterval;
}

- (void)_setMinimumSampleInterval:(double)a3
{
  self->__minimumSampleInterval = a3;
}

- (double)_previousVelocityWeight
{
  return self->__previousVelocityWeight;
}

- (void)_setPreviousVelocityWeight:(double)a3
{
  self->__previousVelocityWeight = a3;
}

+ (id)gestureVelocityFilter
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "_setMinimumSampleInterval:", 0.008);
  objc_msgSend(v2, "_setPreviousVelocityWeight:", 0.75);
  return v2;
}

@end
