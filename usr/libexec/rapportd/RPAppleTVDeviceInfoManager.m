@implementation RPAppleTVDeviceInfoManager

- (RPAppleTVDeviceInfoManager)init
{
  return -[RPAppleTVDeviceInfoManager initWithQueue:](self, "initWithQueue:", &_dispatch_main_q);
}

- (RPAppleTVDeviceInfoManager)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RPAppleTVDeviceInfoManager;
  return -[RPAppleTVDeviceInfoManager init](&v4, "init", a3);
}

- (id)deviceInfoChangedHandler
{
  return self->_deviceInfoChangedHandler;
}

- (void)setDeviceInfoChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)activeUserAltDSID
{
  return self->_activeUserAltDSID;
}

- (BOOL)supportsFindMyRemote
{
  return self->_supportsFindMyRemote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserAltDSID, 0);
  objc_storeStrong(&self->_deviceInfoChangedHandler, 0);
}

@end
