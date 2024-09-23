@implementation PRUISDefaultSessionReconnectPolicy

- (PRUISDefaultSessionReconnectPolicy)init
{
  PRUISDefaultSessionReconnectPolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRUISDefaultSessionReconnectPolicy;
  result = -[PRUISDefaultSessionReconnectPolicy init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_intervalMovingAverage = xmmword_244614100;
  return result;
}

- (void)sessionDidDisconnect
{
  NSDate *v3;
  NSDate *v4;
  double v5;
  double intervalMovingAverage;
  NSDate *lastDisconnect;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_lastDisconnect)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    intervalMovingAverage = self->_intervalMovingAverage;
    if (intervalMovingAverage != 0.0)
      v5 = intervalMovingAverage * (1.0 - self->_alpha) + self->_alpha * v5;
    self->_intervalMovingAverage = v5;
  }
  lastDisconnect = self->_lastDisconnect;
  self->_lastDisconnect = v4;

}

- (double)sessionReconnectDelay
{
  return fmin(fmax(log(10.0 / self->_intervalMovingAverage) * 0.05, 0.0), 0.1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisconnect, 0);
}

@end
