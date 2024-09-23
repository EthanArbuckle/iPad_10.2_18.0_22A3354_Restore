@implementation FMDStandardAsset

- (FMDStandardAsset)initWithFileURL:(id)a3 lastModified:(id)a4 etag:(id)a5 type:(unint64_t)a6 url:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FMDStandardAsset *v16;
  FMDStandardAsset *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FMDStandardAsset;
  v16 = -[FMDStandardAsset init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    -[FMDStandardAsset setFileURL:](v16, "setFileURL:", v12);
    -[FMDStandardAsset setLastModified:](v17, "setLastModified:", v13);
    -[FMDStandardAsset setEtag:](v17, "setEtag:", v14);
    -[FMDStandardAsset setUrl:](v17, "setUrl:", v15);
    -[FMDStandardAsset setAssetType:](v17, "setAssetType:", a6);
  }

  return v17;
}

- (NSData)data
{
  NSData *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = self->_data;
  if (!v3)
  {
    v4 = objc_alloc((Class)NSData);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDStandardAsset fileURL](self, "fileURL"));
    v10 = 0;
    v3 = (NSData *)objc_msgSend(v4, "initWithContentsOfURL:options:error:", v5, 0, &v10);
    v6 = v10;

    if (v6 && (objc_msgSend(v6, "fm_isFileNotFoundError") & 1) == 0)
    {
      v7 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10022A1BC(self, v6, v8);

    }
  }
  return v3;
}

- (FMDStandardAsset)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDStandardAsset *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FMDStandardAsset;
  v6 = -[FMDStandardAsset init](&v27, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("lastModified");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDStandardAsset setLastModified:](v6, "setLastModified:", v10);

    v12 = objc_opt_class(NSString, v11);
    v13 = NSStringFromSelector("etag");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDStandardAsset setEtag:](v6, "setEtag:", v15);

    v17 = objc_opt_class(NSURL, v16);
    v18 = NSStringFromSelector("url");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDStandardAsset setUrl:](v6, "setUrl:", v20);

    v22 = objc_opt_class(NSURL, v21);
    v23 = NSStringFromSelector("fileURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDStandardAsset setFileURL:](v6, "setFileURL:", v25);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDStandardAsset lastModified](self, "lastModified"));
  v6 = NSStringFromSelector("lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDStandardAsset etag](self, "etag"));
  v9 = NSStringFromSelector("etag");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDStandardAsset url](self, "url"));
  v12 = NSStringFromSelector("url");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[FMDStandardAsset fileURL](self, "fileURL"));
  v14 = NSStringFromSelector("fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(unint64_t)a3
{
  self->_assetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
}

@end
