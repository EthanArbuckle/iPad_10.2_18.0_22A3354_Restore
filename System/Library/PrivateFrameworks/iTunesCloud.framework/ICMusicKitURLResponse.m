@implementation ICMusicKitURLResponse

- (ICMusicKitURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyData:(id)a5 performanceMetrics:(id)a6
{
  ICMusicKitURLResponse *v6;
  ICMusicKitURLResponse *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICMusicKitURLResponse;
  v6 = -[ICURLResponse initWithURLResponse:urlRequest:bodyData:performanceMetrics:](&v9, sel_initWithURLResponse_urlRequest_bodyData_performanceMetrics_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[ICMusicKitURLResponse _initializeMusicKitURLResponse](v6, "_initializeMusicKitURLResponse");
  return v7;
}

- (void)_initializeMusicKitURLResponse
{
  NSString *v3;
  NSString *serverCorrelationKey;
  NSString *v5;
  NSString *serverEnvironment;
  NSError *v7;
  NSError *serverError;
  id v9;

  -[ICURLResponse urlResponse](self, "urlResponse");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_valueForHTTPHeaderField:", CFSTR("x-apple-jingle-correlation-key"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  serverCorrelationKey = self->_serverCorrelationKey;
  self->_serverCorrelationKey = v3;

  objc_msgSend(v9, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Application-Site"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serverEnvironment = self->_serverEnvironment;
  self->_serverEnvironment = v5;

  -[ICMusicKitURLResponse _parseServerError](self, "_parseServerError");
  v7 = (NSError *)objc_claimAutoreleasedReturnValue();
  serverError = self->_serverError;
  self->_serverError = v7;

}

- (id)_parseServerError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICURLResponse urlResponse](self, "urlResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "statusCode") < 400)
  {
    v7 = 0;
  }
  else
  {
    -[ICURLResponse parsedBodyDictionary](self, "parsedBodyDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_arrayValueForKey:", CFSTR("errors"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      -[ICMusicKitURLResponse _parseServerErrorDictionary:](self, "_parseServerErrorDictionary:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v7 = -[ICURLResponse statusCode](self, "statusCode");
  if (v7)
  {
    ICURLResponseStatusCodeGetDebuggingDescription(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; statusCode = %@"), v8);

  }
  if (self->_serverCorrelationKey)
    objc_msgSend(v6, "appendFormat:", CFSTR("; serverCorrelationKey = \"%@\"), self->_serverCorrelationKey);
  if (self->_serverEnvironment)
    objc_msgSend(v6, "appendFormat:", CFSTR("; serverEnvironment = \"%@\"), self->_serverEnvironment);
  if (self->_serverError)
    objc_msgSend(v6, "appendFormat:", CFSTR("; serverError = %@"), self->_serverError);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_serverEnvironment, 0);
  objc_storeStrong((id *)&self->_serverCorrelationKey, 0);
}

- (id)_parseServerErrorDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  ICMusicKitURLResponse *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ic_integerValueForKey:", CFSTR("status"));
  v7 = objc_msgSend(v4, "ic_integerValueForKey:", CFSTR("code"));
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("detail"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v6 && v7 && v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICMusicKitServerError"), v7, CFSTR("%@ (%ld). %@ (%ld). id=%@"), v8, v6, v9, v7, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "Failed to parse server error for %{public}@. Raw error dictionary: %{public}@.", buf, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (ICMusicKitURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyDataURL:(id)a5 performanceMetrics:(id)a6
{
  ICMusicKitURLResponse *v6;
  ICMusicKitURLResponse *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICMusicKitURLResponse;
  v6 = -[ICURLResponse initWithURLResponse:urlRequest:bodyDataURL:performanceMetrics:](&v9, sel_initWithURLResponse_urlRequest_bodyDataURL_performanceMetrics_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[ICMusicKitURLResponse _initializeMusicKitURLResponse](v6, "_initializeMusicKitURLResponse");
  return v7;
}

- (NSString)serverCorrelationKey
{
  return self->_serverCorrelationKey;
}

- (NSString)serverEnvironment
{
  return self->_serverEnvironment;
}

- (NSError)serverError
{
  return self->_serverError;
}

@end
