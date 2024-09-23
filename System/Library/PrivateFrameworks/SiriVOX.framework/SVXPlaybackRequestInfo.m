@implementation SVXPlaybackRequestInfo

- (double)duration
{
  double finish;
  void *v5;
  double v6;

  if (!self->_didStart)
    return 0.0;
  if (self->_didFinish)
  {
    finish = self->_finish;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    finish = v6;

  }
  return vabdd_f64(finish, self->_start);
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)finish
{
  return self->_finish;
}

- (void)setFinish:(double)a3
{
  self->_finish = a3;
}

@end
