@implementation OspreyMutableRequest

- (OspreyMutableRequest)initWithMethodName:(id)a3
{
  id v4;
  OspreyMutableRequest *v5;
  uint64_t v6;
  NSString *methodName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyMutableRequest;
  v5 = -[OspreyMutableRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    methodName = v5->_methodName;
    v5->_methodName = (NSString *)v6;

    *(_DWORD *)&v5->_enableDeviceAuthentication = 16843009;
  }

  return v5;
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6;
  NSMutableDictionary *additionalHeaders;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  additionalHeaders = self->_additionalHeaders;
  if (!additionalHeaders)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_additionalHeaders;
    self->_additionalHeaders = v8;

    additionalHeaders = self->_additionalHeaders;
  }
  -[NSMutableDictionary setObject:forKey:](additionalHeaders, "setObject:forKey:", v10, v6);

}

- (id)buildInternalRequest
{
  OspreyRequest *v3;
  void *v4;
  OspreyRequest *v5;
  void *v6;
  void *v7;

  v3 = [OspreyRequest alloc];
  -[OspreyMutableRequest methodName](self, "methodName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[OspreyRequest initWithMethodName:](v3, "initWithMethodName:", v4);

  if (self->_clientTraceIdentifier)
  {
    -[OspreyRequest setClientTraceId:](v5, "setClientTraceId:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OspreyRequest setClientTraceId:](v5, "setClientTraceId:", v7);

  }
  -[OspreyRequest setEnableDeviceAuthentication:](v5, "setEnableDeviceAuthentication:", self->_enableDeviceAuthentication);
  -[OspreyRequest setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", self->_allowsCellularAccess);
  -[OspreyRequest setUseCompression:](v5, "setUseCompression:", -[OspreyMutableRequest isCompressionEnabled](self, "isCompressionEnabled"));
  -[OspreyRequest setForceHTTPv2:](v5, "setForceHTTPv2:", -[OspreyMutableRequest forceHTTPv2](self, "forceHTTPv2"));
  if (self->_additionalHeaders)
    -[OspreyRequest setHeaders:](v5, "setHeaders:");
  return v5;
}

- (BOOL)requireAbsintheAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setRequireAbsintheAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (NSString)methodName
{
  return self->_methodName;
}

- (NSString)clientTraceIdentifier
{
  return self->_clientTraceIdentifier;
}

- (void)setClientTraceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)enableDeviceAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setEnableDeviceAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)isCompressionEnabled
{
  return self->_compressionEnabled;
}

- (void)setCompressionEnabled:(BOOL)a3
{
  self->_compressionEnabled = a3;
}

- (BOOL)forceHTTPv2
{
  return self->_forceHTTPv2;
}

- (void)setForceHTTPv2:(BOOL)a3
{
  self->_forceHTTPv2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraceIdentifier, 0);
  objc_storeStrong((id *)&self->_methodName, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
}

@end
