@implementation WFDrawerVelocityFilter

- (void)addSample:(double)a3
{
  CFTimeInterval v5;
  double v6;

  v5 = CACurrentMediaTime();
  v6 = v5 - self->_previousTime;
  if (v6 > 0.008)
  {
    *(_OWORD *)&self->_previousSample.start = *(_OWORD *)&self->_currentSample.start;
    self->_previousSample.dt = self->_currentSample.dt;
    self->_currentSample.start = self->_previousValue;
    self->_currentSample.end = a3;
    self->_currentSample.dt = v6;
  }
  self->_previousTime = v5;
  self->_previousValue = a3;
}

- (double)calculatedVelocity
{
  double dt;
  double result;
  double v4;
  double v5;

  dt = self->_currentSample.dt;
  result = 0.0;
  if (dt >= 0.001)
    result = (self->_currentSample.end - self->_currentSample.start) / dt;
  v4 = self->_previousSample.dt;
  if (v4 > 0.00000011920929)
  {
    v5 = 0.0;
    if (v4 >= 0.001)
      v5 = (self->_previousSample.end - self->_previousSample.start) / v4 * 0.75;
    return v5 + result * 0.25;
  }
  return result;
}

- (void)resetWithValue:(double)a3
{
  self->_previousTime = 0.0;
  *(_OWORD *)&self->_currentSample.start = 0u;
  *(_OWORD *)&self->_currentSample.dt = 0u;
  *(_OWORD *)&self->_previousSample.end = 0u;
  self->_previousValue = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)currentSample
{
  double start;
  double end;
  double dt;
  $1AB5FA073B851C12C2339EC22442E995 result;

  start = self->_currentSample.start;
  end = self->_currentSample.end;
  dt = self->_currentSample.dt;
  result.var2 = dt;
  result.var1 = end;
  result.var0 = start;
  return result;
}

- (void)setCurrentSample:(id)a3
{
  self->_currentSample = ($B8C72A218C8D2418C21BB9A6F04824A2)a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)previousSample
{
  double start;
  double end;
  double dt;
  $1AB5FA073B851C12C2339EC22442E995 result;

  start = self->_previousSample.start;
  end = self->_previousSample.end;
  dt = self->_previousSample.dt;
  result.var2 = dt;
  result.var1 = end;
  result.var0 = start;
  return result;
}

- (void)setPreviousSample:(id)a3
{
  self->_previousSample = ($B8C72A218C8D2418C21BB9A6F04824A2)a3;
}

- (double)previousTime
{
  return self->_previousTime;
}

- (void)setPreviousTime:(double)a3
{
  self->_previousTime = a3;
}

- (double)previousValue
{
  return self->_previousValue;
}

- (void)setPreviousValue:(double)a3
{
  self->_previousValue = a3;
}

@end
