@implementation PUClampValueFilter

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  double v6;
  double result;

  -[PUClampValueFilter minimumValue](self, "minimumValue", a3);
  if (v6 > a4)
    a4 = v6;
  -[PUClampValueFilter maximumValue](self, "maximumValue");
  if (a4 < result)
    return a4;
  return result;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(double)a3
{
  self->_minimumValue = a3;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(double)a3
{
  self->_maximumValue = a3;
}

@end
