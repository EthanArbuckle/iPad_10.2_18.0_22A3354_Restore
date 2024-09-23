@implementation SFBubbleEstimator

+ (id)estimatorWithEnter:(int64_t)a3 exit:(int64_t)a4
{
  SFBubbleEstimator *v4;

  v4 = 0;
  if (a4 <= a3 && (a4 & a3) < 0)
  {
    v4 = objc_alloc_init(SFBubbleEstimator);
    -[SFBubbleEstimator setRssiEnter:](v4, "setRssiEnter:", a3);
    -[SFBubbleEstimator setRssiExit:](v4, "setRssiExit:", a4);
  }
  return v4;
}

+ (id)estimatorWithEnter:(int64_t)a3 exit:(int64_t)a4 threshold:(double)a5
{
  char v5;
  SFBubbleEstimator *v6;

  if ((a4 & a3) < 0 != v5)
  {
    v6 = 0;
    if (a4 <= a3 && a5 > 0.0)
    {
      v6 = objc_alloc_init(SFBubbleEstimator);
      -[SFBubbleEstimator setRssiEnter:](v6, "setRssiEnter:", a3);
      -[SFBubbleEstimator setRssiExit:](v6, "setRssiExit:", a4);
      -[SFBubbleEstimator setThresholdSeconds:](v6, "setThresholdSeconds:", a5);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)reset
{
  self->_thresholdStartTicks = -1;
  *(_WORD *)&self->_insideBubble = 0;
}

- (int64_t)updateWithRSSI:(int64_t)a3
{
  int64_t v3;
  SFRSSIQueue *rssiQueue;
  SFRSSIQueue *v7;
  SFRSSIQueue *v8;
  _BOOL4 v9;
  int64_t rssiEnter;
  double v11;

  if (a3 < 0)
  {
    rssiQueue = self->_rssiQueue;
    if (!rssiQueue)
    {
      v7 = objc_alloc_init(SFRSSIQueue);
      v8 = self->_rssiQueue;
      self->_rssiQueue = v7;

      rssiQueue = self->_rssiQueue;
    }
    -[SFRSSIQueue addSample:atTicks:](rssiQueue, "addSample:atTicks:", mach_absolute_time(), (double)a3);
    v9 = -[SFBubbleEstimator shouldExpandBubble](self, "shouldExpandBubble");
    if (self->_insideBubble)
    {
      if (self->_rssiExit > a3)
      {
        *(_WORD *)&self->_insideBubble = 0;
        self->_thresholdStartTicks = -1;
        return 2;
      }
      if (!self->_insideBubbleWithThreshold && self->_thresholdSeconds > 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        if (v11 > self->_thresholdSeconds)
          self->_insideBubbleWithThreshold = 1;
      }
    }
    else
    {
      rssiEnter = self->_rssiEnter;
      if (v9)
        rssiEnter -= 2;
      if (rssiEnter <= a3)
      {
        v3 = 1;
        self->_insideBubble = 1;
        self->_thresholdStartTicks = mach_absolute_time();
        return v3;
      }
    }
    return 3;
  }
  return 0;
}

- (BOOL)shouldExpandBubble
{
  double v4;
  double v5;
  double v6;
  BOOL v7;

  if (self->_preventBoost)
    return 0;
  -[SFBubbleEstimator velocity](self, "velocity");
  v5 = v4;
  -[SFBubbleEstimator velocitySmoothed](self, "velocitySmoothed");
  if (v5 > 5.0)
    return 1;
  v7 = v6 > 1.0;
  if (v5 <= 1.0)
    v7 = 0;
  return v5 < 70.0 && v7;
}

- (double)velocity
{
  SFRSSIQueue *rssiQueue;
  double result;

  rssiQueue = self->_rssiQueue;
  if (!rssiQueue)
    return 0.0;
  -[SFRSSIQueue velocity](rssiQueue, "velocity");
  return result;
}

- (double)velocitySmoothed
{
  SFRSSIQueue *rssiQueue;
  double result;

  rssiQueue = self->_rssiQueue;
  if (!rssiQueue)
    return 0.0;
  -[SFRSSIQueue velocitySmoothed](rssiQueue, "velocitySmoothed");
  return result;
}

- (void)setThresholdSeconds:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->_thresholdSeconds = a3;
}

- (BOOL)insideBubble
{
  return self->_insideBubble;
}

- (BOOL)insideBubbleWithThreshold
{
  return self->_insideBubbleWithThreshold;
}

- (BOOL)preventBoost
{
  return self->_preventBoost;
}

- (void)setPreventBoost:(BOOL)a3
{
  self->_preventBoost = a3;
}

- (int64_t)rssiEnter
{
  return self->_rssiEnter;
}

- (void)setRssiEnter:(int64_t)a3
{
  self->_rssiEnter = a3;
}

- (int64_t)rssiExit
{
  return self->_rssiExit;
}

- (void)setRssiExit:(int64_t)a3
{
  self->_rssiExit = a3;
}

- (double)thresholdSeconds
{
  return self->_thresholdSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssiQueue, 0);
}

@end
