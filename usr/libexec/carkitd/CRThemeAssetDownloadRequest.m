@implementation CRThemeAssetDownloadRequest

- (CRThemeAssetDownloadRequest)initWithAssetIdentifier:(id)a3 maximumSDKVersion:(id)a4 maximumCompatibilityVersion:(unint64_t)a5
{
  id v9;
  id v10;
  CRThemeAssetDownloadRequest *v11;
  CRThemeAssetDownloadRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRThemeAssetDownloadRequest;
  v11 = -[CRThemeAssetDownloadRequest init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetIdentifier, a3);
    objc_storeStrong((id *)&v12->_maximumSDKVersion, a4);
    v12->_maximumCompatibilityVersion = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CRThemeAssetDownloadRequest *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  v4 = (CRThemeAssetDownloadRequest *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class(CRThemeAssetDownloadRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest assetIdentifier](self, "assetIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest assetIdentifier](v4, "assetIdentifier"));
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest maximumSDKVersion](self, "maximumSDKVersion"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest maximumSDKVersion](v4, "maximumSDKVersion"));
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = -[CRThemeAssetDownloadRequest maximumCompatibilityVersion](self, "maximumCompatibilityVersion");
          v11 = v10 == (id)-[CRThemeAssetDownloadRequest maximumCompatibilityVersion](v4, "maximumCompatibilityVersion");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest assetIdentifier](self, "assetIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest maximumSDKVersion](self, "maximumSDKVersion"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[CRThemeAssetDownloadRequest maximumCompatibilityVersion](self, "maximumCompatibilityVersion");

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRThemeAssetDownloadRequest;
  v3 = -[CRThemeAssetDownloadRequest description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest assetIdentifier](self, "assetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRThemeAssetDownloadRequest maximumSDKVersion](self, "maximumSDKVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ { assetID: %@, sdkVersion: %@, compatibilityVersion: %lu }"), v4, v5, v6, -[CRThemeAssetDownloadRequest maximumCompatibilityVersion](self, "maximumCompatibilityVersion")));

  return v7;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)maximumSDKVersion
{
  return self->_maximumSDKVersion;
}

- (unint64_t)maximumCompatibilityVersion
{
  return self->_maximumCompatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumSDKVersion, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
