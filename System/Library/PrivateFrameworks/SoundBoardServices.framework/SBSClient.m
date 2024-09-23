@implementation SBSClient

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
