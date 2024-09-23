@implementation TRSetupProxyDeviceResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AKDevice *proxyDevice;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupProxyDeviceResponse;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  proxyDevice = self->_proxyDevice;
  if (proxyDevice)
    objc_msgSend(v4, "encodeObject:forKey:", proxyDevice, CFSTR("TRSetupAuthenticationMessages_pD"));

}

- (TRSetupProxyDeviceResponse)initWithCoder:(id)a3
{
  id v4;
  TRSetupProxyDeviceResponse *v5;
  uint64_t v6;
  AKDevice *proxyDevice;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupProxyDeviceResponse;
  v5 = -[TRMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupAuthenticationMessages_pD"));
    v6 = objc_claimAutoreleasedReturnValue();
    proxyDevice = v5->_proxyDevice;
    v5->_proxyDevice = (AKDevice *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("proxyDevice:[-%@-]"), self->_proxyDevice);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TRSetupProxyDeviceResponse;
  -[TRMessage description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AKDevice)proxyDevice
{
  return self->_proxyDevice;
}

- (void)setProxyDevice:(id)a3
{
  objc_storeStrong((id *)&self->_proxyDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyDevice, 0);
}

@end
