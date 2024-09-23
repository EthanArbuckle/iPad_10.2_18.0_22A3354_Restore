@implementation PRBluetoothDevice

- (PRBluetoothDevice)initWithCBDevice:(id)a3
{
  id v6;
  void *v7;
  PRBluetoothDevice *v8;
  id *p_isa;
  void *v10;
  PRBluetoothDevice *v11;
  NSObject *v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddressData"));

  if (!v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBluetoothDevice.mm"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cbDevice.btAddressData"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PRBluetoothDevice;
  v8 = -[PRBluetoothDevice init](&v15, "init");
  p_isa = (id *)&v8->super.isa;
  if (!v8
    || (objc_storeStrong((id *)&v8->_cbDevice, a3), (objc_msgSend(p_isa, "systemKeyRelationship") & 1) != 0)
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[1], "spatialInteractionTokenData")),
        v10,
        v10))
  {
    v11 = p_isa;
  }
  else
  {
    v13 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D8C40((uint64_t)v6, v13);
    v11 = 0;
  }

  return v11;
}

- (NSData)discoveryTokenData
{
  void *v3;
  NSData *v4;
  void *v5;
  void *v6;
  NSData *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice spatialInteractionTokenData](self->_cbDevice, "spatialInteractionTokenData"));

  if (v3)
  {
    v4 = (NSData *)objc_claimAutoreleasedReturnValue(-[CBDevice spatialInteractionTokenData](self->_cbDevice, "spatialInteractionTokenData"));
LABEL_7:
    v7 = v4;
    return v7;
  }
  if (!-[PRBluetoothDevice systemKeyRelationship](self, "systemKeyRelationship")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice idsDeviceID](self, "idsDeviceID")),
        v5,
        !v5))
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Device does not have a discovery token nor is it a known device. %@"), self->_cbDevice);
    v4 = objc_opt_new(NSData);
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice idsDeviceID](self, "idsDeviceID"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));

  return v7;
}

- (NSString)idsDeviceID
{
  return (NSString *)-[CBDevice idsDeviceID](self->_cbDevice, "idsDeviceID");
}

- (NIDiscoveryToken)discoveryToken
{
  NIDiscoveryToken *v3;
  void *v4;
  NIDiscoveryToken *v5;

  v3 = [NIDiscoveryToken alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice discoveryTokenData](self, "discoveryTokenData"));
  v5 = -[NIDiscoveryToken initWithBytes:](v3, "initWithBytes:", v4);

  return v5;
}

- (array<unsigned)btAdvertisingAddress
{
  void *v3;
  void *v4;
  char *v5;
  char *v6;
  char v7;
  unsigned int v10;
  unsigned __int16 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  if (!v3)
    sub_1003D8CB4();

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  objc_msgSend(v4, "getBytes:length:", &v10, 6);

  v5 = (char *)&v11 + 1;
  v6 = (char *)&v10 + 1;
  do
  {
    v7 = *(v6 - 1);
    *(v6 - 1) = *v5;
    *v5-- = v7;
  }
  while (v6++ < v5);
  return (array<unsigned char, 6UL>)(v10 | ((unint64_t)v11 << 32));
}

- (unint64_t)u64Identifier
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  if (!v3)
    sub_1003D8CDC();

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  v5 = sub_10001014C(v4);

  return v5;
}

- (BOOL)systemKeyRelationship
{
  _BOOL8 v3;

  if ((-[CBDevice deviceFlags](self->_cbDevice, "deviceFlags") & 0x80) != 0
    || (-[CBDevice deviceFlags](self->_cbDevice, "deviceFlags") & 0x100) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return ((unint64_t)-[CBDevice deviceFlags](self->_cbDevice, "deviceFlags") >> 9) & 1;
  }
  return v3;
}

- (NSString)name
{
  return (NSString *)-[CBDevice name](self->_cbDevice, "name");
}

- (BOOL)isUwbCapable
{
  return (-[CBDevice spatialInteractionFlags](self->_cbDevice, "spatialInteractionFlags") >> 3) & 1;
}

- (BOOL)isWifiRangingCapable
{
  return (-[CBDevice spatialInteractionFlags](self->_cbDevice, "spatialInteractionFlags") >> 4) & 1;
}

- (id)description
{
  return -[CBDevice description](self->_cbDevice, "description");
}

- (BOOL)supportsCapabilities:(unsigned int)a3
{
  return (-[CBDevice spatialInteractionUWBTokenFlags](self->_cbDevice, "spatialInteractionUWBTokenFlags") & a3) != 0;
}

- (CBDevice)cbDevice
{
  return (CBDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbDevice, 0);
}

@end
