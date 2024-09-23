@implementation TVPProgressiveJumpingScrubber

- (void)startScrubWithRate:(double)a3
{
  id WeakRetained;
  double v6;
  double v7;
  NSTimer *v8;
  NSTimer *skipTimer;

  WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  if (WeakRetained)
  {
    self->_skipCount = 0;
    self->_skipAdjustPeriod = 0.5;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v7 = -5.0;
    if (a3 > 0.0)
      v7 = 5.0;
    self->_skipAdjustTime = v7;
    self->_nextSkipAdjustTime = v6;
    self->_rate = a3;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__skipTimerFired_, 0, 1, 0.5);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    skipTimer = self->_skipTimer;
    self->_skipTimer = v8;

  }
}

- (void)cancelScrub
{
  NSTimer *skipTimer;

  -[NSTimer invalidate](self->_skipTimer, "invalidate");
  skipTimer = self->_skipTimer;
  self->_skipTimer = 0;

}

- (double)_nextTimeToAdvanceFromTime:(double)a3
{
  double nextSkipAdjustTime;
  double v6;
  double skipAdjustPeriod;
  double v8;
  unint64_t v9;
  double v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  nextSkipAdjustTime = self->_nextSkipAdjustTime;
  if (v6 >= nextSkipAdjustTime)
  {
    skipAdjustPeriod = self->_skipAdjustPeriod;
    v8 = nextSkipAdjustTime + skipAdjustPeriod;
    v9 = self->_skipCount + 1;
    self->_skipCount = v9;
    v10 = skipAdjustPeriod + -0.0333333333;
    if (v10 < 0.25)
      v10 = 0.25;
    self->_nextSkipAdjustTime = v8;
    self->_skipAdjustPeriod = v10;
    if (v9 >= 0xB)
    {
      v9 = 10;
      self->_skipCount = 10;
    }
    if (self->_skipAdjustTime + self->_skipAdjustTime * (double)(v9 * v9) * 3.0 / 100.0 + a3 >= 0.0)
      return self->_skipAdjustTime + self->_skipAdjustTime * (double)(v9 * v9) * 3.0 / 100.0 + a3;
    else
      return -1.0;
  }
  return a3;
}

- (void)_skipTimerFired:(id)a3
{
  TVPPlayer **p_player;
  id WeakRetained;
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v13;
  id v14;

  p_player = &self->_player;
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_player);
    objc_msgSend(v6, "elapsedTime");
    -[TVPProgressiveJumpingScrubber _nextTimeToAdvanceFromTime:](self, "_nextTimeToAdvanceFromTime:");
    v8 = v7;

    v9 = objc_loadWeakRetained((id *)p_player);
    objc_msgSend(v9, "duration");
    v11 = v10;

    if (v8 != -1.0 && (v11 == 3.40282347e38 || v8 < v11))
    {
      v14 = objc_loadWeakRetained((id *)p_player);
      objc_msgSend(v14, "setElapsedTime:", v8);

      return;
    }
    v13 = objc_loadWeakRetained((id *)p_player);
    objc_msgSend(v13, "playerDidHitBeginningOrEnd");

  }
  -[TVPProgressiveJumpingScrubber cancelScrub](self, "cancelScrub");
}

- (TVPPlayer)player
{
  return (TVPPlayer *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (double)rate
{
  return self->_rate;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
}

- (unint64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(unint64_t)a3
{
  self->_skipCount = a3;
}

- (double)skipAdjustTime
{
  return self->_skipAdjustTime;
}

- (void)setSkipAdjustTime:(double)a3
{
  self->_skipAdjustTime = a3;
}

- (double)nextSkipAdjustTime
{
  return self->_nextSkipAdjustTime;
}

- (void)setNextSkipAdjustTime:(double)a3
{
  self->_nextSkipAdjustTime = a3;
}

- (double)skipAdjustPeriod
{
  return self->_skipAdjustPeriod;
}

- (void)setSkipAdjustPeriod:(double)a3
{
  self->_skipAdjustPeriod = a3;
}

- (NSTimer)skipTimer
{
  return self->_skipTimer;
}

- (void)setSkipTimer:(id)a3
{
  objc_storeStrong((id *)&self->_skipTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipTimer, 0);
  objc_destroyWeak((id *)&self->_player);
}

@end
