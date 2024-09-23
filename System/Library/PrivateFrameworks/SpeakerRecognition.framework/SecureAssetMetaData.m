@implementation SecureAssetMetaData

- (SecureAssetMetaData)initWithConfigVersion:(id)a3 resourcePath:(id)a4 assetPathURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  SecureAssetMetaData *v12;
  SecureAssetMetaData *v13;
  SecureAssetMetaData *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SecureAssetMetaData;
  v12 = -[SecureAssetMetaData init](&v16, sel_init);
  v13 = v12;
  if (!v12
    || (objc_storeStrong((id *)&v12->_configVersion, a3),
        objc_storeStrong((id *)&v13->_resourcePath, a4),
        objc_storeStrong((id *)&v13->_assetPathURL, a5),
        v13->_configVersion)
    && v13->_resourcePath
    && v13->_assetPathURL)
  {
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  void *v3;
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NSString UTF8String](self->_configVersion, "UTF8String");
  -[NSURL absoluteString](self->_resourcePath, "absoluteString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");
  -[NSURL absoluteString](self->_assetPathURL, "absoluteString");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("configVers=%s, resourcePathURL=%s, assetPathURL=%s0"), v4, v6, objc_msgSend(v7, "UTF8String"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSURL)resourcePath
{
  return self->_resourcePath;
}

- (NSURL)assetPathURL
{
  return self->_assetPathURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPathURL, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end
