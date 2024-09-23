@implementation TPSInstalledAppInfo

- (TPSInstalledAppInfo)initWithDictionary:(id)a3
{
  id v4;
  TPSInstalledAppInfo *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSString *minVersion;
  uint64_t v11;
  NSString *maxVersion;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSInstalledAppInfo;
  v5 = -[TPSInstalledAppInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1EA1E3770;
    objc_storeStrong((id *)&v5->_bundleID, v8);

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("minVersion"));
    v9 = objc_claimAutoreleasedReturnValue();
    minVersion = v5->_minVersion;
    v5->_minVersion = (NSString *)v9;

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("maxVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    maxVersion = v5->_maxVersion;
    v5->_maxVersion = (NSString *)v11;

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)TPSInstalledAppInfo;
  -[TPSSerializableObject debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSInstalledAppInfo bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@"), CFSTR("bundleID"), v6);

  -[TPSInstalledAppInfo minVersion](self, "minVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %@"), CFSTR("minVersion"), v7);

  -[TPSInstalledAppInfo maxVersion](self, "maxVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %@"), CFSTR("maxVersion"), v8);

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)maxVersion
{
  return self->_maxVersion;
}

- (void)setMaxVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxVersion, 0);
  objc_storeStrong((id *)&self->_minVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
