@implementation SFAuthenticationOptions

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *authorizationToken;
  NSData *acmContext;
  NSString *appName;
  NSString *bundleID;
  NSString *idsDeviceID;
  id v10;

  v4 = a3;
  authorizationToken = self->_authorizationToken;
  v10 = v4;
  if (authorizationToken)
  {
    objc_msgSend(v4, "encodeObject:forKey:", authorizationToken, CFSTR("AuthToken"));
    v4 = v10;
  }
  acmContext = self->_acmContext;
  if (acmContext)
  {
    objc_msgSend(v10, "encodeObject:forKey:", acmContext, CFSTR("ACMContext"));
    v4 = v10;
  }
  appName = self->_appName;
  if (appName)
  {
    objc_msgSend(v10, "encodeObject:forKey:", appName, CFSTR("AppName"));
    v4 = v10;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    objc_msgSend(v10, "encodeObject:forKey:", bundleID, CFSTR("BundleID"));
    v4 = v10;
  }
  if (self->_biometricOnly)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("BiometricOnly"));
    v4 = v10;
  }
  idsDeviceID = self->_idsDeviceID;
  if (idsDeviceID)
  {
    objc_msgSend(v10, "encodeObject:forKey:", idsDeviceID, CFSTR("idsDeviceID"));
    v4 = v10;
  }

}

- (SFAuthenticationOptions)initWithCoder:(id)a3
{
  id v4;
  SFAuthenticationOptions *v5;
  void *v6;
  uint64_t v7;
  NSData *authorizationToken;
  void *v9;
  uint64_t v10;
  NSData *acmContext;
  uint64_t v12;
  NSString *appName;
  uint64_t v14;
  NSString *bundleID;
  uint64_t v16;
  NSString *idsDeviceID;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFAuthenticationOptions;
  v5 = -[SFAuthenticationOptions init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AuthToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    authorizationToken = v5->_authorizationToken;
    v5->_authorizationToken = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ACMContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    acmContext = v5->_acmContext;
    v5->_acmContext = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppName"));
    v12 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    v5->_biometricOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BiometricOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsDeviceID"));
    v16 = objc_claimAutoreleasedReturnValue();
    idsDeviceID = v5->_idsDeviceID;
    v5->_idsDeviceID = (NSString *)v16;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticationOptions authorizationToken](self, "authorizationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticationOptions acmContext](self, "acmContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticationOptions idsDeviceID](self, "idsDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: authToken: %@, acmContext: %@, IDSDeviceID: %@>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)acmContext
{
  return self->_acmContext;
}

- (void)setAcmContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void)setBiometricOnly:(BOOL)a3
{
  self->_biometricOnly = a3;
}

- (NSData)authorizationToken
{
  return self->_authorizationToken;
}

- (void)setAuthorizationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_authorizationToken, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_acmContext, 0);
}

@end
