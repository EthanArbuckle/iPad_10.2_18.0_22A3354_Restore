@implementation _PXAnalyticsSlideshowInfo

- (void)pauseWithEvent:(id)a3
{
  CPAnalyticsEventProtocol *v5;
  CPAnalyticsEventProtocol *v6;

  v5 = (CPAnalyticsEventProtocol *)a3;
  if (self->_lastPauseEvent != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lastPauseEvent, a3);
    v5 = v6;
    ++self->_pauseCount;
  }

}

- (void)unpauseWithEvent:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CPAnalyticsEventProtocol *lastPauseEvent;

  if (self->_lastPauseEvent)
  {
    objc_msgSend(a3, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsEventProtocol timestamp](self->_lastPauseEvent, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    self->_timePaused = v6 + self->_timePaused;

    lastPauseEvent = self->_lastPauseEvent;
    self->_lastPauseEvent = 0;

  }
}

- (CPAnalyticsEventProtocol)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startEvent, a3);
}

- (CPAnalyticsEventProtocol)endEvent
{
  return self->_endEvent;
}

- (void)setEndEvent:(id)a3
{
  objc_storeStrong((id *)&self->_endEvent, a3);
}

- (CPAnalyticsEventProtocol)lastPauseEvent
{
  return self->_lastPauseEvent;
}

- (double)timePaused
{
  return self->_timePaused;
}

- (int64_t)pauseCount
{
  return self->_pauseCount;
}

- (int64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(int64_t)a3
{
  self->_signpostID = a3;
}

- (int64_t)appSuspensionCount
{
  return self->_appSuspensionCount;
}

- (void)setAppSuspensionCount:(int64_t)a3
{
  self->_appSuspensionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPauseEvent, 0);
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

@end
