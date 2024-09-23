@implementation PowerUIBluetoothHandler

- (PowerUIBluetoothHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PowerUIBluetoothHandler;
  return -[PowerUIBluetoothHandler init](&v3, sel_init);
}

- (int)isAppleAudioDeviceWrapperWithDevice:(BTDeviceImpl *)a3 withBool:(unsigned int *)a4
{
  return BTDeviceIsAppleAudioDevice();
}

- (int)getDeviceIDWrapperWithDevice:(BTDeviceImpl *)a3 withVendorIdSource:(unsigned int *)a4 withVendorId:(unsigned int *)a5 withProductId:(unsigned int *)a6 withVersionId:(unsigned int *)a7
{
  return BTDeviceGetDeviceId();
}

- (int)deviceConnectWrapper:(BTDeviceImpl *)a3
{
  return BTDeviceConnect();
}

- (int)sendCustomMessageWrapperWithManager:(BTAccessoryManagerImpl *)a3 withMessageType:(int)a4 withDeviceHandle:(BTDeviceImpl *)a5 withData:(char *)a6 withDataSize:(unint64_t)a7
{
  return BTAccessoryManagerSendCustomMessage();
}

- (id)getAddressStringForDevice:(BTDeviceImpl *)a3
{
  _BYTE v4[25];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  BTDeviceGetAddressString();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BTDeviceImpl)getDeviceForAddressString:(id)a3 forSession:(BTSessionImpl *)a4
{
  if (!a3)
    return 0;
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (BTDeviceAddressFromString() || BTDeviceFromAddress())
    return 0;
  else
    return 0;
}

- (BOOL)isDeviceConnected:(BTDeviceImpl *)a3 forSession:(BTSessionImpl *)a4
{
  BTAccessoryManagerGetDefault();
  BTDeviceGetConnectedServices();
  return 0;
}

- (BOOL)isAccessorySupported:(unsigned int)a3
{
  return a3 == 8212 || a3 == 8228 || (a3 & 0xFFFFFFFD) == 8217 || a3 == 8222 || a3 == 8224;
}

- (unsigned)protocolForDevice:(BTDeviceImpl *)a3
{
  int v5;
  unsigned __int8 v6;
  int v7;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v13 = 0;
  v5 = -[PowerUIBluetoothHandler isAppleAudioDeviceWrapperWithDevice:withBool:](self, "isAppleAudioDeviceWrapperWithDevice:withBool:", a3, &v13);
  v6 = 0;
  if (!v5)
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v7 = -[PowerUIBluetoothHandler getDeviceIDWrapperWithDevice:withVendorIdSource:withVendorId:withProductId:withVersionId:](self, "getDeviceIDWrapperWithDevice:withVendorIdSource:withVendorId:withProductId:withVersionId:", a3, &v12, (char *)&v11 + 4, &v11, &v10);
    v6 = 0;
    if (!v7)
    {
      if (!v13)
        return -1;
      if (-[PowerUIBluetoothHandler isAccessorySupported:](self, "isAccessorySupported:", v11))
      {
        if (_os_feature_enabled_impl())
          return 3;
        else
          return 2;
      }
      if (!v13)
        return -1;
      if ((_DWORD)v11 == 8206 || (_DWORD)v11 == 8211)
        return 1;
      else
        return -1;
    }
  }
  return v6;
}

- (unsigned)productIDForDevice:(BTDeviceImpl *)a3
{
  uint64_t v4;
  int v5;
  int v6;

  v6 = 0;
  v5 = 0;
  v4 = 0;
  if (-[PowerUIBluetoothHandler getDeviceIDWrapperWithDevice:withVendorIdSource:withVendorId:withProductId:withVersionId:](self, "getDeviceIDWrapperWithDevice:withVendorIdSource:withVendorId:withProductId:withVersionId:", a3, &v6, &v5, (char *)&v4 + 4, &v4))
  {
    return 0;
  }
  else
  {
    return HIDWORD(v4);
  }
}

@end
