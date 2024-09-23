@implementation CBStackPerformDeviceRequest

- (unsigned)completedFlags
{
  return self->_completedFlags;
}

- (void)setCompletedFlags:(unsigned int)a3
{
  self->_completedFlags = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_OI_HCI_CONNECTION)connectionHandle
{
  return self->_connectionHandle;
}

- (void)setConnectionHandle:(_OI_HCI_CONNECTION *)a3
{
  self->_connectionHandle = a3;
}

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (CBDeviceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (CBDeviceResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
