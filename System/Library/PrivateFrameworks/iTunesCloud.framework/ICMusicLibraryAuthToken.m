@implementation ICMusicLibraryAuthToken

- (ICMusicLibraryAuthToken)initWithBlock:(id)a3
{
  void (**v4)(id, ICMusicLibraryAuthToken *);
  ICMusicLibraryAuthToken *v5;
  objc_super v7;

  v4 = (void (**)(id, ICMusicLibraryAuthToken *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicLibraryAuthToken;
  v5 = -[ICMusicLibraryAuthToken init](&v7, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicLibraryAuthToken expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4) == 1;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *token;
  id v5;

  token = self->_token;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", token, CFSTR("token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceGUID, CFSTR("deviceGUID"));

}

- (ICMusicLibraryAuthToken)initWithCoder:(id)a3
{
  id v4;
  ICMusicLibraryAuthToken *v5;
  uint64_t v6;
  NSString *token;
  uint64_t v8;
  NSDate *expirationDate;
  uint64_t v10;
  NSString *deviceGUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicLibraryAuthToken;
  v5 = -[ICMusicLibraryAuthToken init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceGUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v10;

  }
  return v5;
}

- (void)setToken:(id)a3
{
  id v5;
  NSString *v6;
  NSString *token;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicLibraryAuthToken.m"), 71, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  token = self->_token;
  self->_token = v6;

}

- (void)setExpirationDate:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate *expirationDate;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicLibraryAuthToken.m"), 76, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSDate *)objc_msgSend(v5, "copy");
  expirationDate = self->_expirationDate;
  self->_expirationDate = v6;

}

- (void)setDeviceGUID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *deviceGUID;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicLibraryAuthToken.m"), 81, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  deviceGUID = self->_deviceGUID;
  self->_deviceGUID = v6;

}

- (NSString)token
{
  return self->_token;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
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
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
