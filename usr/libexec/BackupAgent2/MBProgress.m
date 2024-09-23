@implementation MBProgress

- (MBProgress)init
{
  MBProgress *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBProgress;
  result = -[MBProgress init](&v3, "init");
  if (result)
    result->_scale = 1.0;
  return result;
}

- (double)percentage
{
  return self->_offset + self->_scale * (100.0 - self->_offset) * (self->_current / self->_total);
}

- (BOOL)isFinished
{
  double total;
  double current;

  current = self->_current;
  total = self->_total;
  return current <= total + 0.001 && total + -0.001 <= current;
}

- (void)addDuration:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBProgress.m"), 31, CFSTR("Negative duration"));

  }
  self->_total = self->_total + a3;
}

- (void)updateWithDuration:(double)a3 size:(unint64_t)a4
{
  double total;
  double v7;
  MBProgressDelegate *delegate;
  void *v10;

  total = self->_total;
  v7 = self->_current + a3;
  self->_current = v7;
  if (v7 > total + 0.001)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBProgress.m"), 37, CFSTR("Progress overflow (%0.4f > %0.4f)"), *(_QWORD *)&self->_current, *(_QWORD *)&self->_total);

  }
  delegate = self->_delegate;
  -[MBProgress percentage](self, "percentage");
  -[MBProgressDelegate progressUpdatedWithPercentage:size:](delegate, "progressUpdatedWithPercentage:size:", a4);
}

- (MBProgressDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)current
{
  return self->_current;
}

- (void)setCurrent:(double)a3
{
  self->_current = a3;
}

- (double)total
{
  return self->_total;
}

- (void)setTotal:(double)a3
{
  self->_total = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
