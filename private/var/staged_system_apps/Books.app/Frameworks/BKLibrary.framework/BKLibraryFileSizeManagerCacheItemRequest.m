@implementation BKLibraryFileSizeManagerCacheItemRequest

- (BKLibraryFileSizeManagerCacheItemRequest)initWithCacheItemRequestWithAssetID:(id)a3 assetURL:(id)a4
{
  id v6;
  id v7;
  BKLibraryFileSizeManagerCacheItemRequest *v8;
  NSString *v9;
  NSString *assetID;
  NSURL *v11;
  NSURL *assetURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryFileSizeManagerCacheItemRequest;
  v8 = -[BKLibraryFileSizeManagerCacheItemRequest init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    assetID = v8->_assetID;
    v8->_assetID = v9;

    v11 = (NSURL *)objc_msgSend(v7, "copy");
    assetURL = v8->_assetURL;
    v8->_assetURL = v11;

  }
  return v8;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
