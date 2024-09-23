@implementation BTSmartRoutingRouteRequest

- (NSNumber)btXID
{
  return self->_btXID;
}

- (void)setBtXID:(id)a3
{
  objc_storeStrong((id *)&self->_btXID, a3);
}

- (BOOL)progressStarted
{
  return self->_progressStarted;
}

- (void)setProgressStarted:(BOOL)a3
{
  self->_progressStarted = a3;
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)senderIDS
{
  return self->_senderIDS;
}

- (void)setSenderIDS:(id)a3
{
  objc_storeStrong((id *)&self->_senderIDS, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)wxAddress
{
  return self->_wxAddress;
}

- (void)setWxAddress:(id)a3
{
  objc_storeStrong((id *)&self->_wxAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wxAddress, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_senderIDS, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_btXID, 0);
}

@end
