@implementation VSAssetBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_masteredVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setStorage:(int64_t)a3
{
  self->_storage = a3;
}

- (void)setMasteredVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDownloadSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setContentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)masteredVersion
{
  return self->_masteredVersion;
}

- (NSNumber)downloadSize
{
  return self->_downloadSize;
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setIsPurgeable:(BOOL)a3
{
  self->_isPurgeable = a3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compatibilityVersion, CFSTR("_compatibilityVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentVersion, CFSTR("_contentVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_masteredVersion, CFSTR("_masteredVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadSize, CFSTR("_downloadSize"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPurgeable, CFSTR("_isPurgeable"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_storage, CFSTR("_storage"));

}

- (VSAssetBase)initWithCoder:(id)a3
{
  id v4;
  VSAssetBase *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSNumber *compatibilityVersion;
  uint64_t v10;
  NSNumber *contentVersion;
  uint64_t v12;
  NSString *masteredVersion;
  uint64_t v14;
  NSNumber *downloadSize;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSAssetBase;
  v5 = -[VSAssetBase init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_compatibilityVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentVersion = v5->_contentVersion;
    v5->_contentVersion = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_masteredVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    masteredVersion = v5->_masteredVersion;
    v5->_masteredVersion = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_downloadSize"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadSize = v5->_downloadSize;
    v5->_downloadSize = (NSNumber *)v14;

    v5->_isPurgeable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isPurgeable"));
    v5->_storage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_storage"));
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isPurgeable
{
  return self->_isPurgeable;
}

- (int64_t)storage
{
  return self->_storage;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
