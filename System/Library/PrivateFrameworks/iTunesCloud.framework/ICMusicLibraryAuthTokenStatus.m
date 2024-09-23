@implementation ICMusicLibraryAuthTokenStatus

- (ICMusicLibraryAuthTokenStatus)initWithBlock:(id)a3
{
  void (**v4)(id, ICMusicLibraryAuthTokenStatus *);
  ICMusicLibraryAuthTokenStatus *v5;
  objc_super v7;

  v4 = (void (**)(id, ICMusicLibraryAuthTokenStatus *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicLibraryAuthTokenStatus;
  v5 = -[ICMusicLibraryAuthTokenStatus init](&v7, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ICMusicLibraryAuthToken *token;
  void *v5;
  id v6;

  token = self->_token;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", token, CFSTR("token"));
  -[NSError msv_errorByRemovingUnsafeUserInfo](self->_lastError, "msv_errorByRemovingUnsafeUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("lastError"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldExcludeFromBackgroundRefresh, CFSTR("shouldExcludeFromBackgroundRefresh"));

}

- (ICMusicLibraryAuthTokenStatus)initWithCoder:(id)a3
{
  id v4;
  ICMusicLibraryAuthTokenStatus *v5;
  uint64_t v6;
  ICMusicLibraryAuthToken *token;
  uint64_t v8;
  NSError *lastError;
  uint64_t v10;
  NSDate *lastUpdatedDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicLibraryAuthTokenStatus;
  v5 = -[ICMusicLibraryAuthTokenStatus init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (ICMusicLibraryAuthToken *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastError"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v10;

    v5->_shouldExcludeFromBackgroundRefresh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldExcludeFromBackgroundRefresh"));
  }

  return v5;
}

- (void)setToken:(id)a3
{
  id v5;
  ICMusicLibraryAuthToken *v6;
  ICMusicLibraryAuthToken *token;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicLibraryAuthTokenStatus.m"), 72, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (ICMusicLibraryAuthToken *)objc_msgSend(v5, "copy");
  token = self->_token;
  self->_token = v6;

}

- (void)setLastError:(id)a3
{
  id v5;
  NSError *v6;
  NSError *lastError;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicLibraryAuthTokenStatus.m"), 77, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSError *)objc_msgSend(v5, "copy");
  lastError = self->_lastError;
  self->_lastError = v6;

}

- (void)setLastUpdatedDate:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate *lastUpdatedDate;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicLibraryAuthTokenStatus.m"), 82, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSDate *)objc_msgSend(v5, "copy");
  lastUpdatedDate = self->_lastUpdatedDate;
  self->_lastUpdatedDate = v6;

}

- (ICMusicLibraryAuthToken)token
{
  return self->_token;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (BOOL)shouldExcludeFromBackgroundRefresh
{
  return self->_shouldExcludeFromBackgroundRefresh;
}

- (void)setShouldExcludeFromBackgroundRefresh:(BOOL)a3
{
  self->_shouldExcludeFromBackgroundRefresh = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
