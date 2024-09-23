@implementation PXChangeDirectionNumberFilter

- (void)setMinimumChange:(double)a3
{
  self->_minimumChange = a3;
}

- (PXChangeDirectionNumberFilter)initWithInput:(double)a3
{
  PXChangeDirectionNumberFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXChangeDirectionNumberFilter;
  result = -[PXNumberFilter initWithInput:](&v5, sel_initWithInput_);
  if (result)
    result->_threshold = a3;
  return result;
}

- (double)initialOutputForInput:(double)a3
{
  return 0.0;
}

- (double)updatedOutput
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double threshold;
  double v9;
  double v10;
  double v11;

  -[PXNumberFilter input](self, "input");
  v4 = v3;
  -[PXNumberFilter output](self, "output");
  v6 = v5;
  -[PXChangeDirectionNumberFilter minimumChange](self, "minimumChange");
  if (v6 == 0.0 && (threshold = self->_threshold, vabdd_f64(v4, threshold) > v7))
  {
    v6 = 1.0;
  }
  else if (v6 >= 0.0)
  {
    if (v6 <= 0.0)
      return v6;
    threshold = self->_threshold;
  }
  else
  {
    threshold = self->_threshold;
    if (v4 > threshold)
    {
      v6 = 1.0;
LABEL_11:
      v10 = v4 - v7;
      if (threshold >= v10)
        v10 = threshold;
      self->_threshold = v10;
      return v6;
    }
    if (v6 <= 0.0)
    {
      v9 = v6;
      goto LABEL_15;
    }
  }
  v9 = -1.0;
  if (v4 >= threshold)
    goto LABEL_11;
LABEL_15:
  v11 = v4 + v7;
  if (threshold < v11)
    v11 = threshold;
  self->_threshold = v11;
  return v9;
}

- (double)minimumChange
{
  return self->_minimumChange;
}

@end
