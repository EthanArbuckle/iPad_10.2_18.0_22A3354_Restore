@implementation SBCPlaybackPositionDomain

- (SBCPlaybackPositionDomain)initWithDomainIdentifier:(id)a3 foreignDatabasePath:(id)a4
{
  id v7;
  id v8;
  SBCPlaybackPositionDomain *v9;
  SBCPlaybackPositionDomain *v10;
  uint64_t v11;
  NSString *foreignDatabasePath;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBCPlaybackPositionDomain;
  v9 = -[SBCPlaybackPositionDomain init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainIdentifier, a3);
    objc_msgSend(v8, "stringByStandardizingPath");
    v11 = objc_claimAutoreleasedReturnValue();
    foreignDatabasePath = v10->_foreignDatabasePath;
    v10->_foreignDatabasePath = (NSString *)v11;

  }
  return v10;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  if (-[NSString length](self->_foreignDatabasePath, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", foreignDB = %@"), self->_foreignDatabasePath);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24F0D7048;
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)SBCPlaybackPositionDomain;
  -[SBCPlaybackPositionDomain description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_supportsSyncProtocol)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ domain='%@'%@, supportsSync=%@"), v5, self->_domainIdentifier, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainIdentifier;
  id v5;

  domainIdentifier = self->_domainIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainIdentifier, CFSTR("SBCDomainIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_foreignDatabasePath, CFSTR("SBCForeignDatabasePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ubiquitousDatabasePath, CFSTR("SBCUbiquitousDatabasePath"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsSyncProtocol, CFSTR("SBCSupportsSyncProtocol"));

}

- (SBCPlaybackPositionDomain)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBCPlaybackPositionDomain *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SBCDomainIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SBCForeignDatabasePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBCPlaybackPositionDomain initWithDomainIdentifier:foreignDatabasePath:](self, "initWithDomainIdentifier:foreignDatabasePath:", v5, v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SBCUbiquitousDatabasePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCPlaybackPositionDomain setUbiquitousDatabasePath:](v7, "setUbiquitousDatabasePath:", v8);

    -[SBCPlaybackPositionDomain setSupportsSyncProtocol:](v7, "setSupportsSyncProtocol:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBCSupportsSyncProtocol")));
  }

  return v7;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)ubiquitousDatabasePath
{
  return self->_ubiquitousDatabasePath;
}

- (void)setUbiquitousDatabasePath:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquitousDatabasePath, a3);
}

- (NSString)foreignDatabasePath
{
  return self->_foreignDatabasePath;
}

- (BOOL)supportsSyncProtocol
{
  return self->_supportsSyncProtocol;
}

- (void)setSupportsSyncProtocol:(BOOL)a3
{
  self->_supportsSyncProtocol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignDatabasePath, 0);
  objc_storeStrong((id *)&self->_ubiquitousDatabasePath, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

+ (id)domainForSyncingMusicLibraryWithLibraryPath:(id)a3
{
  id v3;
  SBCMusicLibraryPlaybackPositionDomain *v4;
  SBCMusicLibraryPlaybackPositionDomain *v5;

  v3 = a3;
  v4 = [SBCMusicLibraryPlaybackPositionDomain alloc];
  v5 = -[SBCPlaybackPositionDomain initWithDomainIdentifier:foreignDatabasePath:](v4, "initWithDomainIdentifier:foreignDatabasePath:", *MEMORY[0x24BEC85F0], v3);

  -[SBCPlaybackPositionDomain setSupportsSyncProtocol:](v5, "setSupportsSyncProtocol:", 1);
  return v5;
}

+ (id)domainForExtrasValues
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithDomainIdentifier:foreignDatabasePath:", *MEMORY[0x24BEC85F8], 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
