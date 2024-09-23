@implementation _PXStoryAnalyticsSessionInfo

- (_PXStoryAnalyticsSessionInfo)initWithEvent:(id)a3
{
  id v5;
  _PXStoryAnalyticsSessionInfo *v6;
  _PXStoryAnalyticsSessionInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryAnalyticsSessionInfo;
  v6 = -[_PXStoryAnalyticsSessionInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_startEvent, a3);

  return v7;
}

- (void)didPauseWithEvent:(id)a3
{
  ++self->_pauseCount;
}

- (void)didSuspendAppWithEvent:(id)a3
{
  ++self->_appSuspensionCount;
}

- (void)finalizeWithEvent:(id)a3
{
  objc_storeStrong((id *)&self->_endEvent, a3);
}

- (CPAnalyticsEventProtocol)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startEvent, a3);
}

- (int64_t)pauseCount
{
  return self->_pauseCount;
}

- (int64_t)appSuspensionCount
{
  return self->_appSuspensionCount;
}

- (CPAnalyticsEventProtocol)endEvent
{
  return self->_endEvent;
}

- (void)setEndEvent:(id)a3
{
  objc_storeStrong((id *)&self->_endEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

@end
