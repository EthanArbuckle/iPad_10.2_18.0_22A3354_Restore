@implementation PUMaximumChangeRateValueFilter

- (double)updatedValue:(double)a3 withTargetValue:(double)a4 timeInterval:(double)a5
{
  double v8;
  double v9;
  double result;

  -[PUMaximumChangeRateValueFilter maximumChangeRate](self, "maximumChangeRate");
  v9 = a3 - v8 * a5;
  if (v9 < a4)
    v9 = a4;
  result = a3 + v8 * a5;
  if (result >= a4)
    result = a4;
  if (a3 >= a4)
    return v9;
  return result;
}

- (double)maximumChangeRate
{
  return self->_maximumChangeRate;
}

- (void)setMaximumChangeRate:(double)a3
{
  self->_maximumChangeRate = a3;
}

@end
