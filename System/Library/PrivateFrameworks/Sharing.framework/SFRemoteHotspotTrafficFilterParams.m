@implementation SFRemoteHotspotTrafficFilterParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteHotspotTrafficFilterParams)initWithCoder:(id)a3
{
  id v4;
  SFRemoteHotspotTrafficFilterParams *v5;
  id v6;
  id v7;
  id v8;
  SFRemoteHotspotTrafficFilterParams *v9;
  objc_super v11;
  uint64_t v12;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFRemoteHotspotTrafficFilterParams;
  v5 = -[SFRemoteHotspotTrafficFilterParams init](&v11, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_srcPort = v12;
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_destPort = v12;
    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_ipProtocol = v12;
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_ipVersion = v12;
    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_idleTimeout = v12;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *srcIPAddress;
  NSString *destIPAddress;
  NSString *trafficClass;
  uint64_t ipVersion;
  uint64_t idleTimeout;
  id v10;

  v4 = a3;
  srcIPAddress = self->_srcIPAddress;
  v10 = v4;
  if (srcIPAddress)
  {
    objc_msgSend(v4, "encodeObject:forKey:", srcIPAddress, CFSTR("srcIP"));
    v4 = v10;
  }
  if (self->_srcPort)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  destIPAddress = self->_destIPAddress;
  if (destIPAddress)
  {
    objc_msgSend(v10, "encodeObject:forKey:", destIPAddress, CFSTR("destIP"));
    v4 = v10;
  }
  if (self->_destPort)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_ipProtocol)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  trafficClass = self->_trafficClass;
  if (trafficClass)
  {
    objc_msgSend(v10, "encodeObject:forKey:", trafficClass, CFSTR("traCla"));
    v4 = v10;
  }
  ipVersion = self->_ipVersion;
  if ((_DWORD)ipVersion)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", ipVersion, CFSTR("ipVer"));
    v4 = v10;
  }
  idleTimeout = self->_idleTimeout;
  if ((_DWORD)idleTimeout)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", idleTimeout, CFSTR("timeout"));
    v4 = v10;
  }

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_srcIPAddress)
  {
    v15 = v3;
    NSAppendPrintF();
    v5 = v15;

    v4 = v5;
  }
  if (self->_srcPort)
  {
    NSAppendPrintF();
    v6 = v4;

    v4 = v6;
  }
  if (self->_destIPAddress)
  {
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  if (self->_destPort)
  {
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
  }
  if (self->_ipProtocol)
  {
    NSAppendPrintF();
    v9 = v4;

    v4 = v9;
  }
  if (self->_trafficClass)
  {
    NSAppendPrintF();
    v10 = v4;

    v4 = v10;
  }
  if (self->_ipVersion)
  {
    NSAppendPrintF();
    v11 = v4;

    v4 = v11;
  }
  if (self->_idleTimeout)
  {
    NSAppendPrintF();
    v12 = v4;

    v4 = v12;
  }
  NSAppendPrintF();
  v13 = v4;

  return v13;
}

- (NSString)srcIPAddress
{
  return self->_srcIPAddress;
}

- (void)setSrcIPAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)srcPort
{
  return self->_srcPort;
}

- (void)setSrcPort:(unsigned __int16)a3
{
  self->_srcPort = a3;
}

- (NSString)destIPAddress
{
  return self->_destIPAddress;
}

- (void)setDestIPAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)destPort
{
  return self->_destPort;
}

- (void)setDestPort:(unsigned __int16)a3
{
  self->_destPort = a3;
}

- (unsigned)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(unsigned __int16)a3
{
  self->_ipProtocol = a3;
}

- (NSString)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)ipVersion
{
  return self->_ipVersion;
}

- (void)setIpVersion:(unsigned int)a3
{
  self->_ipVersion = a3;
}

- (unsigned)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(unsigned int)a3
{
  self->_idleTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficClass, 0);
  objc_storeStrong((id *)&self->_destIPAddress, 0);
  objc_storeStrong((id *)&self->_srcIPAddress, 0);
}

@end
