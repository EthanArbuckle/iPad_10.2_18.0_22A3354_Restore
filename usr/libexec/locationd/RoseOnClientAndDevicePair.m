@implementation RoseOnClientAndDevicePair

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RoseOnClientAndDevicePair;
  -[RoseOnClientAndDevicePair dealloc](&v3, "dealloc");
}

- (CLDurianClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
