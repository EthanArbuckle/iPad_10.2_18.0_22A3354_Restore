@implementation OspreyRequest

- (OspreyRequest)initWithMethodName:(id)a3
{
  id v5;
  OspreyRequest *v6;
  OspreyRequest *v7;
  OspreyRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OspreyRequest;
  v6 = -[OspreyRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_forceHTTPv2 = 1;
    *(_WORD *)&v6->_enableDeviceAuthentication = 257;
    objc_storeStrong((id *)&v6->_methodName, a3);
    if (OspreyCreateGlobalUserAgentString_onceToken != -1)
      dispatch_once(&OspreyCreateGlobalUserAgentString_onceToken, &__block_literal_global_2);
    objc_storeStrong((id *)&v7->_userAgent, (id)OspreyCreateGlobalUserAgentString_globalUserAgent);
    v7->_allowsCellularAccess = 1;
    v8 = v7;
  }

  return v7;
}

+ (id)requestWithMethodName:(id)a3
{
  id v3;
  OspreyRequest *v4;

  v3 = a3;
  v4 = -[OspreyRequest initWithMethodName:]([OspreyRequest alloc], "initWithMethodName:", v3);

  return v4;
}

- (id)grpcRequestWithBaseURL:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSData *signedDeviceAuthenticationData;
  void *v9;
  NSNumber *deviceAuthenticationVersion;
  void *v11;
  NSObject *v12;
  NSString *clientTraceId;
  NSDictionary *headers;
  id v15;
  void *v16;
  NSData *data;
  NSString *methodName;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByAppendingPathComponent:", self->_methodName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsCellularAccess:", self->_allowsCellularAccess);
  objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/grpc"), CFSTR("content-type"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("60S"), CFSTR("grpc-timeout"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("trailers"), CFSTR("te"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("1"), CFSTR("siri-osprey"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", self->_userAgent, CFSTR("user-agent"));
  if (self->_useCompression)
    v6 = CFSTR("gzip,identity");
  else
    v6 = CFSTR("identity");
  if (self->_useCompression)
    v7 = CFSTR("gzip");
  else
    v7 = CFSTR("identity");
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("grpc-accept-encoding"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("accept-encoding"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v7, CFSTR("grpc-encoding"));
  if (self->_enableDeviceAuthentication)
  {
    signedDeviceAuthenticationData = self->_signedDeviceAuthenticationData;
    if (signedDeviceAuthenticationData)
    {
      -[NSData base64EncodedStringWithOptions:](signedDeviceAuthenticationData, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forHTTPHeaderField:", v9, CFSTR("siri-absinthe-token-bin"));

    }
  }
  else
  {
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("siri-absinthe-ignore"));
  }
  deviceAuthenticationVersion = self->_deviceAuthenticationVersion;
  if (deviceAuthenticationVersion)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[NSNumber integerValue](deviceAuthenticationVersion, "integerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v11, CFSTR("siri-device-auth-version"));

  }
  if (self->_forceHTTPv2)
  {
    OspreyLoggingInit();
    v12 = OspreyLogContextRequest;
    if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[OspreyRequest grpcRequestWithBaseURL:]";
      _os_log_impl(&dword_1B97C2000, v12, OS_LOG_TYPE_INFO, "%s Force usage of HTTP/2 for request", buf, 0xCu);
    }
    objc_msgSend(objc_retainAutorelease(v5), "_CFURLRequest");
    _CFURLRequestSetAllowedProtocolTypes();
  }
  clientTraceId = self->_clientTraceId;
  if (clientTraceId)
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", clientTraceId, CFSTR("siri-osprey-trace-id"));
  headers = self->_headers;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __40__OspreyRequest_grpcRequestWithBaseURL___block_invoke;
  v22[3] = &unk_1E70981D0;
  v15 = v5;
  v23 = v15;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](headers, "enumerateKeysAndObjectsUsingBlock:", v22);
  OspreyLoggingInit();
  v16 = (void *)OspreyLogContextRequest;
  if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_INFO))
  {
    methodName = self->_methodName;
    data = self->_data;
    v19 = v16;
    LODWORD(data) = -[NSData length](data, "length");
    objc_msgSend(v15, "allHTTPHeaderFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v25 = "-[OspreyRequest grpcRequestWithBaseURL:]";
    v26 = 2112;
    v27 = methodName;
    v28 = 1024;
    v29 = (int)data;
    v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_1B97C2000, v19, OS_LOG_TYPE_INFO, "%s Request method: %@ data_length: %d headers: %@", buf, 0x26u);

  }
  return v15;
}

void __40__OspreyRequest_grpcRequestWithBaseURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    OspreyLoggingInit();
    v9 = OspreyLogContextRequest;
    if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315906;
      v11 = "-[OspreyRequest grpcRequestWithBaseURL:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1B97C2000, v9, OS_LOG_TYPE_DEBUG, "%s Overriding HTTP header: '%@' previous value: '%@' with: '%@'", (uint8_t *)&v10, 0x2Au);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v6, v5);

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

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (BOOL)enableDeviceAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setEnableDeviceAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (NSData)signedDeviceAuthenticationData
{
  return self->_signedDeviceAuthenticationData;
}

- (void)setSignedDeviceAuthenticationData:(id)a3
{
  objc_storeStrong((id *)&self->_signedDeviceAuthenticationData, a3);
}

- (NSNumber)deviceAuthenticationVersion
{
  return self->_deviceAuthenticationVersion;
}

- (void)setDeviceAuthenticationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAuthenticationVersion, a3);
}

- (BOOL)useCompression
{
  return self->_useCompression;
}

- (void)setUseCompression:(BOOL)a3
{
  self->_useCompression = a3;
}

- (BOOL)forceHTTPv2
{
  return self->_forceHTTPv2;
}

- (void)setForceHTTPv2:(BOOL)a3
{
  self->_forceHTTPv2 = a3;
}

- (NSString)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong((id *)&self->_deviceAuthenticationVersion, 0);
  objc_storeStrong((id *)&self->_signedDeviceAuthenticationData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_methodName, 0);
}

@end
