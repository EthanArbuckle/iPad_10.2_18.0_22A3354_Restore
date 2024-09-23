@implementation NRIKEv2PendingSession

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), self->_session);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong(&self->_validateAuthBlock, 0);
  objc_storeStrong((id *)&self->_childConfig, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
