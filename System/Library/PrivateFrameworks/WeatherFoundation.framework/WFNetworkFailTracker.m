@implementation WFNetworkFailTracker

- (void)incrementFailCount
{
  ++self->_numConsecutiveFails;
  self->_lastFailTimeInSeconds = CFAbsoluteTimeGetCurrent();
}

- (BOOL)lastFailTimeExpiredForSettings:(id)a3
{
  id v4;
  double Current;
  double v6;
  double v7;
  unint64_t v8;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  -[WFNetworkFailTracker lastFailTimeInSeconds](self, "lastFailTimeInSeconds");
  v7 = Current - v6;
  v8 = objc_msgSend(v4, "networkSwitchExpirationTimeInSeconds");

  return v7 >= (double)v8;
}

- (int)numConsecutiveFails
{
  return self->_numConsecutiveFails;
}

- (double)lastFailTimeInSeconds
{
  return self->_lastFailTimeInSeconds;
}

@end
