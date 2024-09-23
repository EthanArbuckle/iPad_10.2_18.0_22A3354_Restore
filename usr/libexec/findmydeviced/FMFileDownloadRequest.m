@implementation FMFileDownloadRequest

- (FMFileDownloadRequest)initWithAsset:(id)a3
{
  id v4;
  FMFileDownloadRequest *v5;
  FMFileDownloadRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFileDownloadRequest;
  v5 = -[FMDRequest initWithAccount:](&v8, "initWithAccount:", 0);
  v6 = v5;
  if (v5)
    -[FMFileDownloadRequest setAsset:](v5, "setAsset:", v4);

  return v6;
}

- (id)requestUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFileDownloadRequest asset](self, "asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));

  return v3;
}

- (id)requestHeaders
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMFileDownloadRequest;
  v3 = -[FMDRequest requestHeaders](&v10, "requestHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFileDownloadRequest asset](self, "asset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastModified"));
  objc_msgSend(v4, "fm_safeSetObject:forKey:", v6, CFSTR("If-Modified-Since"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFileDownloadRequest asset](self, "asset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "etag"));
  objc_msgSend(v4, "fm_safeSetObject:forKey:", v8, CFSTR("If-None-Match"));

  return v4;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (FMDAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
