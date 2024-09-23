@implementation CBMetricsDiscoveryEvent

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setScanRate:(int)a3
{
  self->_scanRate = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)scanRate
{
  return self->_scanRate;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)action
{
  return self->_action;
}

- (int)pid
{
  return self->_pid;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
