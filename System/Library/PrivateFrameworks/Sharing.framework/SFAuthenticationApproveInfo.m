@implementation SFAuthenticationApproveInfo

- (SFAuthenticationApproveInfo)initWithType:(unint64_t)a3 idsDeviceID:(id)a4 appName:(id)a5 bundleID:(id)a6 biometricOnly:(BOOL)a7
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  SFAuthenticationApproveInfo *v15;
  NSString *idsDeviceID;
  NSString *v17;
  NSString *appName;
  NSString *v19;
  NSString *bundleID;
  objc_super v22;

  v12 = (NSString *)a4;
  v13 = (NSString *)a5;
  v14 = (NSString *)a6;
  v22.receiver = self;
  v22.super_class = (Class)SFAuthenticationApproveInfo;
  v15 = -[SFAuthenticationApproveInfo init](&v22, sel_init);
  idsDeviceID = v15->_idsDeviceID;
  v15->_type = a3;
  v15->_idsDeviceID = v12;
  v17 = v12;

  appName = v15->_appName;
  v15->_appName = v13;
  v19 = v13;

  bundleID = v15->_bundleID;
  v15->_bundleID = v14;

  v15->_biometricOnly = a7;
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t type;
  NSString *idsDeviceID;
  NSString *appName;
  NSString *bundleID;
  id v9;

  v4 = a3;
  type = self->_type;
  v9 = v4;
  if (type)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", type, CFSTR("AuthType"));
    v4 = v9;
  }
  idsDeviceID = self->_idsDeviceID;
  if (idsDeviceID)
  {
    objc_msgSend(v9, "encodeObject:forKey:", idsDeviceID, CFSTR("idsDeviceID"));
    v4 = v9;
  }
  appName = self->_appName;
  if (appName)
  {
    objc_msgSend(v9, "encodeObject:forKey:", appName, CFSTR("AppName"));
    v4 = v9;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    objc_msgSend(v9, "encodeObject:forKey:", bundleID, CFSTR("BundleID"));
    v4 = v9;
  }
  if (self->_biometricOnly)
  {
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("BiometricOnly"));
    v4 = v9;
  }

}

- (SFAuthenticationApproveInfo)initWithCoder:(id)a3
{
  id v4;
  SFAuthenticationApproveInfo *v5;
  uint64_t v6;
  NSString *idsDeviceID;
  uint64_t v8;
  NSString *appName;
  uint64_t v10;
  NSString *bundleID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFAuthenticationApproveInfo;
  v5 = -[SFAuthenticationApproveInfo init](&v13, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AuthType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsDeviceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    idsDeviceID = v5->_idsDeviceID;
    v5->_idsDeviceID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppName"));
    v8 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    v5->_biometricOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BiometricOnly"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t type;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  type = self->_type;
  if (type > 8)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E48307F0[type];
  if (self->_biometricOnly)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: type: %@, idsDeviceID: %@, appName: %@, bundleID: %@, biometricOnly: %@>"), v5, v8, *(_OWORD *)&self->_idsDeviceID, self->_bundleID, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
}

@end
