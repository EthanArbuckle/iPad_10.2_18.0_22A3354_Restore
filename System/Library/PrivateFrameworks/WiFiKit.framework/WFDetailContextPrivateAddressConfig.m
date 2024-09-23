@implementation WFDetailContextPrivateAddressConfig

- (WFDetailContextPrivateAddressConfig)initWithRandomMACAddress:(id)a3 hardwareMACAddress:(id)a4 privateAddressMode:(unint64_t)a5 connectedWithHardwareAddress:(BOOL)a6 privateAddressSupported:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  WFDetailContextPrivateAddressConfig *v14;
  WFDetailContextPrivateAddressConfig *v15;
  NSObject *v16;
  os_log_type_t v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v7 = a7;
  v8 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFDetailContextPrivateAddressConfig;
  v14 = -[WFDetailContextPrivateAddressConfig init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    -[WFDetailContextPrivateAddressConfig setRandomMACAddress:](v14, "setRandomMACAddress:", v12);
    -[WFDetailContextPrivateAddressConfig setHardwareMACAddress:](v15, "setHardwareMACAddress:", v13);
    -[WFDetailContextPrivateAddressConfig setPrivateAddressMode:](v15, "setPrivateAddressMode:", a5);
    -[WFDetailContextPrivateAddressConfig setConnectedWithHardwareAddress:](v15, "setConnectedWithHardwareAddress:", v8);
    -[WFDetailContextPrivateAddressConfig setPrivateAddressSupported:](v15, "setPrivateAddressSupported:", v7);
  }
  WFLogForCategory(8uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 138413314;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2048;
    v25 = a5;
    v26 = 1024;
    v27 = v8;
    v28 = 1024;
    v29 = v7;
    _os_log_impl(&dword_219FC8000, v16, v17, "WFDetailContextPrivateAddressConfig: randomMACAddress='%@', hardwareMACAddress='%@', privateAddressMode=%ld, connectedWithHardwareAddress=%d, privateAddressSupported=%d", buf, 0x2Cu);
  }

  return v15;
}

- (BOOL)isConnectedWithHardwareAddress
{
  return self->_connectedWithHardwareAddress;
}

- (void)setConnectedWithHardwareAddress:(BOOL)a3
{
  self->_connectedWithHardwareAddress = a3;
}

- (BOOL)isAlwaysDisplayRandomAddress
{
  return self->_alwaysDisplayRandomAddress;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isPrivateAddressSupported
{
  return self->_privateAddressSupported;
}

- (void)setPrivateAddressSupported:(BOOL)a3
{
  self->_privateAddressSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
}

@end
