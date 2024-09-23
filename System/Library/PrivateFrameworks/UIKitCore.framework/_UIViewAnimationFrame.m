@implementation _UIViewAnimationFrame

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (int64_t)compareStartTimes:(id)a3
{
  double startTime;
  double v4;

  startTime = self->_startTime;
  v4 = *((double *)a3 + 2);
  if (startTime < v4)
    return -1;
  else
    return startTime > v4;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)value
{
  return self->_value;
}

- (double)duration
{
  return self->_duration;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_UIViewAnimationFrame;
  -[_UIViewAnimationFrame description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ value=%@ startTime=%f duration=%f"), v4, self->_value, *(_QWORD *)&self->_startTime, *(_QWORD *)&self->_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
