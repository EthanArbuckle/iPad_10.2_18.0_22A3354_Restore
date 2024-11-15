@implementation _RMSBonjourService

- (TVRMSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSNetService)netService
{
  return self->_netService;
}

- (void)setNetService:(id)a3
{
  objc_storeStrong((id *)&self->_netService, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
