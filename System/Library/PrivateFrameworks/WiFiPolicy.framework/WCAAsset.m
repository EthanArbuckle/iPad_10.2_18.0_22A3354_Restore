@implementation WCAAsset

+ (id)wifiBehaviorPlistAsset
{
  return +[WCAAsset assetWithName:andExtension:](WCAAsset, "assetWithName:andExtension:", CFSTR("com.apple.wifi.cloud-defaults"), CFSTR("plist"));
}

+ (WCAAsset)assetWithName:(id)a3 andExtension:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setName:", v7);

  objc_msgSend(v8, "setExtension:", v6);
  return (WCAAsset *)v8;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *extension;
  id v5;

  extension = self->_extension;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extension, CFSTR("_extension"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestNotInstalledAsset, 0);
  objc_storeStrong((id *)&self->_latestInstalledAsset, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)beaconsDataAsset
{
  return +[WCAAsset assetWithName:andExtension:](WCAAsset, "assetWithName:andExtension:", CFSTR("beaconData"), CFSTR("db"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("name: %@"), self->_name);
  objc_msgSend(v6, "appendFormat:", CFSTR(", extension: %@"), self->_extension);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WCAAsset name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[WCAAsset extension](self, "extension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WCAAsset)initWithCoder:(id)a3
{
  id v3;
  WCAAsset *v4;
  uint64_t v5;
  NSString *extension;
  uint64_t v7;
  NSString *name;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WCAAsset;
  v3 = a3;
  v4 = -[WCAAsset init](&v10, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extension"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  extension = v4->_extension;
  v4->_extension = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
  v7 = objc_claimAutoreleasedReturnValue();

  name = v4->_name;
  v4->_name = (NSString *)v7;

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)extension
{
  return self->_extension;
}

- (unint64_t)latestInstalledVersion
{
  return self->_latestInstalledVersion;
}

- (void)setLatestInstalledVersion:(unint64_t)a3
{
  self->_latestInstalledVersion = a3;
}

- (MAAsset)latestInstalledAsset
{
  return self->_latestInstalledAsset;
}

- (void)setLatestInstalledAsset:(id)a3
{
  objc_storeStrong((id *)&self->_latestInstalledAsset, a3);
}

- (unint64_t)installedAssetVersion
{
  return self->_installedAssetVersion;
}

- (void)setInstalledAssetVersion:(unint64_t)a3
{
  self->_installedAssetVersion = a3;
}

- (unint64_t)latestNotInstalledVersion
{
  return self->_latestNotInstalledVersion;
}

- (void)setLatestNotInstalledVersion:(unint64_t)a3
{
  self->_latestNotInstalledVersion = a3;
}

- (MAAsset)latestNotInstalledAsset
{
  return self->_latestNotInstalledAsset;
}

- (void)setLatestNotInstalledAsset:(id)a3
{
  objc_storeStrong((id *)&self->_latestNotInstalledAsset, a3);
}

@end
