@implementation PowerUIBluetoothHandlerFake

- (id)init:(id)a3
{
  NSString *v4;
  PowerUIBluetoothHandlerFake *v5;
  NSString *fakeDeviceAddress;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PowerUIBluetoothHandlerFake;
  v5 = -[PowerUIBluetoothHandler init](&v8, sel_init);
  v5->_fakeDevice = (BTDeviceImpl *)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  fakeDeviceAddress = v5->_fakeDeviceAddress;
  v5->_fakeDeviceAddress = v4;

  v5->_fakeDeviceConnected = 1;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_fakeDevice);
  v3.receiver = self;
  v3.super_class = (Class)PowerUIBluetoothHandlerFake;
  -[PowerUIBluetoothHandlerFake dealloc](&v3, sel_dealloc);
}

- (int)isAppleAudioDeviceWrapperWithDevice:(BTDeviceImpl *)a3 withBool:(unsigned int *)a4
{
  *a4 = -1;
  return 0;
}

- (int)getDeviceIDWrapperWithDevice:(BTDeviceImpl *)a3 withVendorIdSource:(unsigned int *)a4 withVendorId:(unsigned int *)a5 withProductId:(unsigned int *)a6 withVersionId:(unsigned int *)a7
{
  *a6 = 8212;
  return 0;
}

- (int)deviceConnectWrapper:(BTDeviceImpl *)a3
{
  return 0;
}

- (int)sendCustomMessageWrapperWithManager:(BTAccessoryManagerImpl *)a3 withMessageType:(int)a4 withDeviceHandle:(BTDeviceImpl *)a5 withData:(char *)a6 withDataSize:(unint64_t)a7
{
  return 0;
}

- (id)getAddressStringForDevice:(BTDeviceImpl *)a3
{
  return self->_fakeDeviceAddress;
}

- (BTDeviceImpl)getDeviceForAddressString:(id)a3 forSession:(BTSessionImpl *)a4
{
  return self->_fakeDevice;
}

- (BOOL)isDeviceConnected:(BTDeviceImpl *)a3 forSession:(BTSessionImpl *)a4
{
  return self->_fakeDeviceConnected;
}

- (unsigned)protocolForDevice:(BTDeviceImpl *)a3
{
  return 2;
}

- (unsigned)productIDForDevice:(BTDeviceImpl *)a3
{
  return 8212;
}

- (BTDeviceImpl)fakeDevice
{
  return self->_fakeDevice;
}

- (void)setFakeDevice:(BTDeviceImpl *)a3
{
  self->_fakeDevice = a3;
}

- (NSString)fakeDeviceAddress
{
  return self->_fakeDeviceAddress;
}

- (void)setFakeDeviceAddress:(id)a3
{
  objc_storeStrong((id *)&self->_fakeDeviceAddress, a3);
}

- (BOOL)fakeDeviceConnected
{
  return self->_fakeDeviceConnected;
}

- (void)setFakeDeviceConnected:(BOOL)a3
{
  self->_fakeDeviceConnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeDeviceAddress, 0);
}

@end
