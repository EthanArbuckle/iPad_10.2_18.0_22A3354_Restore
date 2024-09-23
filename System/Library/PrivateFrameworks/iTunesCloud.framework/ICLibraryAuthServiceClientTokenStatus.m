@implementation ICLibraryAuthServiceClientTokenStatus

- (ICLibraryAuthServiceClientTokenStatus)initWithCoder:(id)a3
{
  id v4;
  ICLibraryAuthServiceClientTokenStatus *v5;
  uint64_t v6;
  ICLibraryAuthServiceClientTokenResult *tokenResult;
  uint64_t v8;
  NSError *lastError;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLibraryAuthServiceClientTokenStatus;
  v5 = -[ICLibraryAuthServiceClientTokenStatus init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenResult"));
    v6 = objc_claimAutoreleasedReturnValue();
    tokenResult = v5->_tokenResult;
    v5->_tokenResult = (ICLibraryAuthServiceClientTokenResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastError"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastUpdateTime"));
    v5->_lastUpdateAttemptTime = v10;
    v5->_shouldExcludeFromBackgroundRefresh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeFromBackgroundRefresh"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  ICLibraryAuthServiceClientTokenResult *tokenResult;
  NSError *lastError;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  tokenResult = self->_tokenResult;
  lastError = self->_lastError;
  -[ICLibraryAuthServiceClientTokenStatus lastUpdatedDate](self, "lastUpdatedDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_shouldExcludeFromBackgroundRefresh)
    v9 = CFSTR("NO");
  else
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p result=%@ lastError=%@ lastUpdate='%@' autoRefreshEnabled=%@>"), v4, self, tokenResult, lastError, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  ICLibraryAuthServiceClientTokenResult *tokenResult;
  void *v5;
  id v6;

  tokenResult = self->_tokenResult;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", tokenResult, CFSTR("tokenResult"));
  -[NSError msv_errorByRemovingUnsafeUserInfo](self->_lastError, "msv_errorByRemovingUnsafeUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("lastError"));

  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("lastUpdateTime"), self->_lastUpdateAttemptTime);
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldExcludeFromBackgroundRefresh, CFSTR("excludeFromBackgroundRefresh"));

}

- (NSDate)lastUpdatedDate
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_lastUpdateAttemptTime);
}

- (ICLibraryAuthServiceClientTokenResult)tokenResult
{
  return self->_tokenResult;
}

- (void)setTokenResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)lastUpdateAttemptTime
{
  return self->_lastUpdateAttemptTime;
}

- (void)setLastUpdateAttemptTime:(double)a3
{
  self->_lastUpdateAttemptTime = a3;
}

- (BOOL)shouldExcludeFromBackgroundRefresh
{
  return self->_shouldExcludeFromBackgroundRefresh;
}

- (void)setShouldExcludeFromBackgroundRefresh:(BOOL)a3
{
  self->_shouldExcludeFromBackgroundRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_tokenResult, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
