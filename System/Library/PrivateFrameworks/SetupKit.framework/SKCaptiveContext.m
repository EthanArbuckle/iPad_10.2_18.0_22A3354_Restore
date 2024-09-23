@implementation SKCaptiveContext

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SKSetupCaptiveNetworkJoinServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

@end
