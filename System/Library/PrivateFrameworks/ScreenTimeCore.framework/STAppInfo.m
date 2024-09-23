@implementation STAppInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[STAppInfo bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAppInfo displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAppInfo developerName](self, "developerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p ID: %@ Name: %@ Developer: %@, AdamID: %llu>"), self, v4, v5, v6, -[STAppInfo adamID](self, "adamID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (signed)platform
{
  return self->_platform;
}

- (void)setPlatform:(signed __int16)a3
{
  self->_platform = a3;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(unint64_t)a3
{
  self->_adamID = a3;
}

- (NSString)distributorID
{
  return self->_distributorID;
}

- (void)setDistributorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)distributorIsThirdParty
{
  return self->_distributorIsThirdParty;
}

- (void)setDistributorIsThirdParty:(BOOL)a3
{
  self->_distributorIsThirdParty = a3;
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(unint64_t)a3
{
  self->_versionIdentifier = a3;
}

- (unint64_t)betaVersionIdentifier
{
  return self->_betaVersionIdentifier;
}

- (void)setBetaVersionIdentifier:(unint64_t)a3
{
  self->_betaVersionIdentifier = a3;
}

- (NSString)developerName
{
  return self->_developerName;
}

- (void)setDeveloperName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void)setLocalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)artworkData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setArtworkData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
