@implementation BKLibraryAssetObject

- (BKLibraryAssetObject)initWithLibraryAsset:(id)a3
{
  id v4;
  BKLibraryAssetObject *v5;
  uint64_t v6;
  NSString *assetID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryAssetObject;
  v5 = -[BKLibraryAssetObject init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    v5->_contentType = (unsigned __int16)objc_msgSend(v4, "contentType");
    v5->_pageCount = (int64_t)objc_msgSend(v4, "pageCount");
  }

  return v5;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (signed)contentType
{
  return self->_contentType;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
