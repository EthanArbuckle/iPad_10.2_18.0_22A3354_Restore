@implementation PUInitialHysteresisValueFilter

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  double v6;

  if (!self->_didReachThreshold)
  {
    -[PUInitialHysteresisValueFilter thresholdValue](self, "thresholdValue", a3);
    if (v6 <= a4 || (v6 = -v6, v6 >= a4))
    {
      self->_initialHysteresis = v6;
      self->_didReachThreshold = 1;
    }
    else if (!self->_didReachThreshold)
    {
      return 0.0;
    }
  }
  return a4 - self->_initialHysteresis;
}

- (double)outputValueDerivative
{
  double result;

  result = 1.0;
  if (!self->_didReachThreshold)
    return 0.0;
  return result;
}

- (double)thresholdValue
{
  return self->_thresholdValue;
}

- (void)setThresholdValue:(double)a3
{
  self->_thresholdValue = a3;
}

@end
