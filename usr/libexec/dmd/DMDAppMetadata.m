@implementation DMDAppMetadata

- (DMDAppLifeCycle)lifeCycle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppMetadata bundleIdentifier](self, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppLifeCycle lifeCycleForBundleIdentifier:](DMDAppLifeCycle, "lifeCycleForBundleIdentifier:", v2));

  return (DMDAppLifeCycle *)v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
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

- (BOOL)isStoreApp
{
  return self->_isStoreApp;
}

- (void)setIsStoreApp:(BOOL)a3
{
  self->_isStoreApp = a3;
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (BOOL)isUserLicensed
{
  return self->_isUserLicensed;
}

- (void)setIsUserLicensed:(BOOL)a3
{
  self->_isUserLicensed = a3;
}

- (BOOL)needsRedownload
{
  return self->_needsRedownload;
}

- (void)setNeedsRedownload:(BOOL)a3
{
  self->_needsRedownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
