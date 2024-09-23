@implementation VSAppInstallMetadata

- (VSAppInstallMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSAppInstallMetadata;
  return -[VSAppInstallMetadata init](&v3, sel_init);
}

- (VSAppInstallMetadata)initWithApplicationRecord:(id)a3
{
  id v4;
  VSAppInstallMetadata *v5;
  void *v6;
  uint64_t v7;
  NSString *sourceApp;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSAppInstallMetadata;
  v5 = -[VSAppInstallMetadata init](&v12, sel_init);
  if (v5)
  {
    v5->_beta = objc_msgSend(v4, "isBeta");
    objc_msgSend(v4, "iTunesMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceApp");
    v7 = objc_claimAutoreleasedReturnValue();
    sourceApp = v5->_sourceApp;
    v5->_sourceApp = (NSString *)v7;

    v5->_profileValidated = objc_msgSend(v4, "isProfileValidated");
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_managed = objc_msgSend(v9, "isAppManaged:", v10);

  }
  return v5;
}

- (int64_t)installSource
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[VSAppInstallMetadata sourceApp](self, "sourceApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AppStore"));

  if ((v4 & 1) != 0)
    return 0;
  -[VSAppInstallMetadata sourceApp](self, "sourceApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Magellan"));

  if ((v7 & 1) != 0)
    return 1;
  if (-[VSAppInstallMetadata isBeta](self, "isBeta"))
    return 3;
  if (-[VSAppInstallMetadata isManaged](self, "isManaged"))
    return 2;
  if (-[VSAppInstallMetadata isProfileValidated](self, "isProfileValidated"))
    return 4;
  return 5;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (NSString)sourceApp
{
  return self->_sourceApp;
}

- (void)setSourceApp:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApp, a3);
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApp, 0);
}

@end
