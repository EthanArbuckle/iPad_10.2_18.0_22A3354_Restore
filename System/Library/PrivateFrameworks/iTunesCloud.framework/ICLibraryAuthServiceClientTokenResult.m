@implementation ICLibraryAuthServiceClientTokenResult

- (ICLibraryAuthServiceClientTokenResult)initWithResponseDictionary:(id)a3
{
  id v4;
  ICLibraryAuthServiceClientTokenResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  ICLibraryAuthServiceClientTokenIdentifier *v16;
  ICLibraryAuthServiceClientTokenIdentifier *tokenIdentitifer;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICLibraryAuthServiceClientTokenResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      objc_storeStrong((id *)&v5->_token, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("generatedAtMillis"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSNumber())
      v5->_generatedAtMillis = objc_msgSend(v7, "longLongValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("timeToLiveMillis"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isNSNumber"))
      v5->_timeToLiveMillis = objc_msgSend(v8, "longLongValue");
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authServiceClientTokenTimeToLive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "longLongValue") >= 1)
    {
      v11 = objc_msgSend(v10, "longLongValue");
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11 > 119999)
      {
        if (v13)
        {
          v19 = 134217984;
          v20 = objc_msgSend(v10, "longLongValue");
          _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "Overridden to %lld milis.", (uint8_t *)&v19, 0xCu);
        }

        v5->_timeToLiveMillis = objc_msgSend(v10, "longLongValue");
      }
      else
      {
        if (v13)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "Override may not be less than 120000", (uint8_t *)&v19, 2u);
        }

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("lifespanMillis"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSNumber())
      v5->_lifespanMillis = objc_msgSend(v14, "longLongValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("tokenID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      v16 = -[ICLibraryAuthServiceClientTokenIdentifier initWithResponseDictionary:]([ICLibraryAuthServiceClientTokenIdentifier alloc], "initWithResponseDictionary:", v15);
      tokenIdentitifer = v5->_tokenIdentitifer;
      v5->_tokenIdentitifer = v16;

    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *token;
  __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)((self->_timeToLiveMillis + self->_generatedAtMillis) / 1000));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInternalBuild"))
    token = (__CFString *)self->_token;
  else
    token = CFSTR("<private>");
  v6 = token;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p token='%@' expires='%@'>"), objc_opt_class(), self, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)((self->_timeToLiveMillis + self->_generatedAtMillis) / 1000));
}

- (BOOL)isExpired
{
  double v2;
  void *v3;
  double v4;
  BOOL v5;

  v2 = (double)((self->_timeToLiveMillis + self->_generatedAtMillis) / 1000);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4 > v2;

  return v5;
}

- (ICLibraryAuthServiceClientTokenResult)initWithCoder:(id)a3
{
  id v4;
  ICLibraryAuthServiceClientTokenResult *v5;
  uint64_t v6;
  NSString *token;
  uint64_t v8;
  ICLibraryAuthServiceClientTokenIdentifier *tokenIdentitifer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICLibraryAuthServiceClientTokenResult;
  v5 = -[ICLibraryAuthServiceClientTokenResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenString"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_generatedAtMillis = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("generatedAtMillis"));
    v5->_timeToLiveMillis = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ttlMillis"));
    v5->_lifespanMillis = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lifespanMillis"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenID"));
    v8 = objc_claimAutoreleasedReturnValue();
    tokenIdentitifer = v5->_tokenIdentitifer;
    v5->_tokenIdentitifer = (ICLibraryAuthServiceClientTokenIdentifier *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *token;
  id v5;

  token = self->_token;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", token, CFSTR("tokenString"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_generatedAtMillis, CFSTR("generatedAtMillis"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timeToLiveMillis, CFSTR("ttlMillis"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lifespanMillis, CFSTR("lifespanMillis"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenIdentitifer, CFSTR("tokenID"));

}

- (NSString)token
{
  return self->_token;
}

- (int64_t)generatedAtMillis
{
  return self->_generatedAtMillis;
}

- (int64_t)timeToLiveMillis
{
  return self->_timeToLiveMillis;
}

- (int64_t)lifespanMillis
{
  return self->_lifespanMillis;
}

- (ICLibraryAuthServiceClientTokenIdentifier)tokenIdentitifer
{
  return self->_tokenIdentitifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIdentitifer, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
