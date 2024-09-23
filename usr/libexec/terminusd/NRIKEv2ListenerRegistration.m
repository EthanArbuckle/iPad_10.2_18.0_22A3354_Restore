@implementation NRIKEv2ListenerRegistration

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%@/%@"), self->_localEndpoint, self->_interfaceName, self->_link);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingClient, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
