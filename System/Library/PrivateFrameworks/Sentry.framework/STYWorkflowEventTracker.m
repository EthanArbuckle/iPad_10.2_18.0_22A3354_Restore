@implementation STYWorkflowEventTracker

- (WRWorkflowEventTracker)wrTracker
{
  return (WRWorkflowEventTracker *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWrTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)perDayEventCount
{
  return self->_perDayEventCount;
}

- (void)setPerDayEventCount:(int)a3
{
  self->_perDayEventCount = a3;
}

- (int)perPeriodEventCount
{
  return self->_perPeriodEventCount;
}

- (void)setPerPeriodEventCount:(int)a3
{
  self->_perPeriodEventCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrTracker, 0);
}

@end
