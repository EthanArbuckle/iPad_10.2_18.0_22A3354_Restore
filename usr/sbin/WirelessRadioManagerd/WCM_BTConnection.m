@implementation WCM_BTConnection

- (WCM_BTConnection)init
{
  WCM_BTConnection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_BTConnection;
  result = -[WCM_BTConnection init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->mDeviceType = 0u;
    *(_OWORD *)&result->mAddress = 0u;
  }
  return result;
}

- (WCM_BTConnection)initWithAddress:(id)a3
{
  WCM_BTConnection *v3;
  NSString *v4;

  if (a3)
  {
    v3 = self;
    v4 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", a3);
    v3->mAddress = v4;
    return (WCM_BTConnection *)+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("New BT connection with address %@"), v4);
  }
  return self;
}

- (void)dealloc
{
  NSString *mAddress;
  objc_super v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Releasing BT Connection Addr: %@"), self->mAddress);
  mAddress = self->mAddress;
  if (mAddress)

  v4.receiver = self;
  v4.super_class = (Class)WCM_BTConnection;
  -[WCM_BTConnection dealloc](&v4, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BDA: %@ Services: %llu (%d), Device Type: %llu, Role: %d, Mode: %d, ConnTO: %d, Connection Intr: %d"), self->mAddress, self->mConnectedServices, self->mConnectedServicesCount, self->mDeviceType, self->mRole, self->mMode, self->mConnTO, self->mConnInterval);
}

- (void)updateConnectionInfo:(id)a3
{
  unint64_t mConnectedServices;

  mConnectedServices = self->mConnectedServices;
  self->mConnectedServices = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ServiceId") | mConnectedServices;
  self->mDeviceType = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_DeviceType");
  self->mRole = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_Role");
  self->mMode = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_Mode");
  self->mConnTO = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ConnTo");
  self->mConnInterval = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ConnIntrvl");
  self->mLatency = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_Latncy");
}

- (void)manageServiceConnection
{
  ++self->mConnectedServicesCount;
}

- (void)manageServiceDisconnection
{
  --self->mConnectedServicesCount;
}

- (id)getAddress
{
  return self->mAddress;
}

- (unint64_t)getDeviceType
{
  return self->mDeviceType;
}

- (unint64_t)getRole
{
  return self->mRole;
}

- (unint64_t)getMode
{
  return self->mMode;
}

- (unint64_t)getServices
{
  return self->mConnectedServices;
}

- (unint64_t)getServiceCount
{
  return self->mConnectedServicesCount;
}

@end
