@implementation AEAsset

- (AEAsset)initWithAssetType:(id)a3 assetID:(id)a4 url:(id)a5
{
  return -[AEAsset initWithAssetType:assetID:url:displayTitle:](self, "initWithAssetType:assetID:url:displayTitle:", a3, a4, a5, 0);
}

- (AEAsset)initWithAssetType:(id)a3 assetID:(id)a4 url:(id)a5 displayTitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AEAsset *v15;
  AEAsset *v16;
  NSString *v17;
  NSString *displayTitle;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AEAsset;
  v15 = -[AEAsset init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetType, a3);
    objc_storeStrong((id *)&v16->_assetID, a4);
    objc_storeStrong((id *)&v16->_url, a5);
    v17 = (NSString *)objc_msgSend(v14, "copy");
    displayTitle = v16->_displayTitle;
    v16->_displayTitle = v17;

  }
  return v16;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AEAsset;
  v3 = -[AEAsset description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAsset assetType](self, "assetType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAsset assetID](self, "assetID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAsset url](self, "url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAsset displayTitle](self, "displayTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, assetType=%@, assetID=%@, url=%@ displayTitle=%@"), v4, v5, v6, v7, v8));

  return (NSString *)v9;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
