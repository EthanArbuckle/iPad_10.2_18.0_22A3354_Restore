@implementation NFVASResponse

+ (BOOL)validateDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Token")));
  if (v4)
  {
    v5 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
      goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PassData")));

  if (v6)
  {
    v7 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
      goto LABEL_14;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StatusCode")));

  if (v4)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
      goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileCapabilities")));

  if (v6)
  {
    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    {
LABEL_14:
      v11 = 0;
      v4 = v6;
      goto LABEL_15;
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Request")));

  if (v4)
  {
    v10 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) == 0
      || !+[NFVASRequest validateDictionary:](NFVASRequest, "validateDictionary:", v4))
    {
LABEL_13:
      v11 = 0;
      goto LABEL_15;
    }
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (NFVASResponse)initWithDictionary:(id)a3
{
  id v4;
  NFVASResponse *v5;
  uint64_t v6;
  NSData *token;
  uint64_t v8;
  NSData *vasData;
  uint64_t v10;
  NSNumber *statusCode;
  uint64_t v12;
  NSNumber *mobileCapabilities;
  void *v14;
  NFVASRequest *v15;
  NFVASRequest *request;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NFVASResponse;
  v5 = -[NFVASResponse init](&v18, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Token")));
    token = v5->_token;
    v5->_token = (NSData *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PassData")));
    vasData = v5->_vasData;
    v5->_vasData = (NSData *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StatusCode")));
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MobileCapabilities")));
    mobileCapabilities = v5->_mobileCapabilities;
    v5->_mobileCapabilities = (NSNumber *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Request")));
    if (v14)
    {
      v15 = -[NFVASRequest initWithDictionary:]([NFVASRequest alloc], "initWithDictionary:", v14);
      request = v5->_request;
      v5->_request = v15;

    }
  }

  return v5;
}

- (id)asDictionary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSData *token;
  NSData *vasData;
  NSNumber *statusCode;
  NSNumber *mobileCapabilities;
  NFVASRequest *request;
  void *v10;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = v3;
  token = self->_token;
  if (token)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", token, CFSTR("Token"));
  vasData = self->_vasData;
  if (vasData)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", vasData, CFSTR("PassData"));
  statusCode = self->_statusCode;
  if (statusCode)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", statusCode, CFSTR("StatusCode"));
  mobileCapabilities = self->_mobileCapabilities;
  if (mobileCapabilities)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", mobileCapabilities, CFSTR("MobileCapabilities"));
  request = self->_request;
  if (request)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFVASRequest asDictionary](request, "asDictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("Request"));

  }
  return v4;
}

- (BOOL)paymentSupported
{
  return (-[NSNumber unsignedCharValue](self->_mobileCapabilities, "unsignedCharValue") >> 4) & 1;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)NFVASResponse;
  v4 = -[NFVASResponse description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ status=0x%04x data=%@ token=%@ mobileCapabilities=%@ request=%@"), v5, -[NSNumber unsignedIntValue](self->_statusCode, "unsignedIntValue"), self->_vasData, self->_token, self->_mobileCapabilities, self->_request);

  return v6;
}

- (NFVASRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSData)vasData
{
  return self->_vasData;
}

- (void)setVasData:(id)a3
{
  objc_storeStrong((id *)&self->_vasData, a3);
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (NSNumber)mobileCapabilities
{
  return self->_mobileCapabilities;
}

- (void)setMobileCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_mobileCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileCapabilities, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_vasData, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
