@implementation PUChangeDirectionValueFilter

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  double v7;
  double v8;
  double threshold;
  double v11;
  BOOL v12;
  double v13;
  double v14;

  -[PUChangeDirectionValueFilter minimumChangeValue](self, "minimumChangeValue");
  v8 = fabs(a4);
  if (a3 != 0.0 || v8 <= v7)
  {
    if (a3 >= 0.0)
    {
      if (a3 <= 0.0)
        return a3;
      threshold = self->_threshold;
    }
    else
    {
      threshold = self->_threshold;
      if (threshold < a4)
      {
        a3 = 1.0;
        goto LABEL_16;
      }
      if (a3 <= 0.0)
      {
        v11 = a3;
        goto LABEL_20;
      }
    }
    v11 = -1.0;
    if (threshold > a4)
      goto LABEL_20;
LABEL_16:
    v13 = a4 - v7;
    if (threshold >= v13)
      v13 = threshold;
    self->_threshold = v13;
    return a3;
  }
  threshold = self->_threshold;
  v11 = -1.0;
  v12 = a4 < a3;
  a3 = 1.0;
  if (!v12)
    goto LABEL_16;
LABEL_20:
  v14 = v7 + a4;
  if (threshold < v14)
    v14 = threshold;
  self->_threshold = v14;
  return v11;
}

- (double)minimumChangeValue
{
  return self->_minimumChangeValue;
}

- (void)setMinimumChangeValue:(double)a3
{
  self->_minimumChangeValue = a3;
}

@end
