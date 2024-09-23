@implementation ICQAppCloudStorage

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID: %@, storageUsed: %@, ruiURL: %@, liftUIURL: %@"), self->_bundleID, self->_storageUsed, self->_ruiURL, self->_liftUIURL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQAppCloudStorage *v4;

  v4 = objc_alloc_init(ICQAppCloudStorage);
  -[ICQAppCloudStorage setBundleID:](v4, "setBundleID:", self->_bundleID);
  -[ICQAppCloudStorage setStorageUsed:](v4, "setStorageUsed:", self->_storageUsed);
  -[ICQAppCloudStorage setRuiURL:](v4, "setRuiURL:", self->_ruiURL);
  -[ICQAppCloudStorage setLiftUIURL:](v4, "setLiftUIURL:", self->_liftUIURL);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageUsed, CFSTR("storageUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ruiURL, CFSTR("ruiURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_liftUIURL, CFSTR("liftUIURL"));

}

- (ICQAppCloudStorage)initWithCoder:(id)a3
{
  id v4;
  ICQAppCloudStorage *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *storageUsed;
  uint64_t v10;
  NSURL *ruiURL;
  uint64_t v12;
  NSURL *liftUIURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQAppCloudStorage;
  v5 = -[ICQAppCloudStorage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageUsed"));
    v8 = objc_claimAutoreleasedReturnValue();
    storageUsed = v5->_storageUsed;
    v5->_storageUsed = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ruiURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    ruiURL = v5->_ruiURL;
    v5->_ruiURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("liftUIURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    liftUIURL = v5->_liftUIURL;
    v5->_liftUIURL = (NSURL *)v12;

  }
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

- (NSNumber)storageUsed
{
  return self->_storageUsed;
}

- (void)setStorageUsed:(id)a3
{
  objc_storeStrong((id *)&self->_storageUsed, a3);
}

- (NSURL)ruiURL
{
  return self->_ruiURL;
}

- (void)setRuiURL:(id)a3
{
  objc_storeStrong((id *)&self->_ruiURL, a3);
}

- (NSURL)liftUIURL
{
  return self->_liftUIURL;
}

- (void)setLiftUIURL:(id)a3
{
  objc_storeStrong((id *)&self->_liftUIURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftUIURL, 0);
  objc_storeStrong((id *)&self->_ruiURL, 0);
  objc_storeStrong((id *)&self->_storageUsed, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
