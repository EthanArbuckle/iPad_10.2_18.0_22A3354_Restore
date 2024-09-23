@implementation ICQQuotaApp

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ICQQuotaApp bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p for bundle ID: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
