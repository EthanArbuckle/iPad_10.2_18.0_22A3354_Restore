@implementation SiriCoreNetEventMessage

- (NSUUID)netId
{
  return self->_netId;
}

- (void)setNetId:(id)a3
{
  objc_storeStrong((id *)&self->_netId, a3);
}

- (NETSchemaNETClientEvent)clientEvent
{
  return self->_clientEvent;
}

- (void)setClientEvent:(id)a3
{
  objc_storeStrong((id *)&self->_clientEvent, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientEvent, 0);
  objc_storeStrong((id *)&self->_netId, 0);
}

@end
