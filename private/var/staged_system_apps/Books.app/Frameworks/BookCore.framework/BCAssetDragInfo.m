@implementation BCAssetDragInfo

- (BCAssetDragInfo)initWithDragInfo:(id)a3
{
  id v4;
  BCAssetDragInfo *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *assetID;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *author;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *title;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSURL *storeURL;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSURL *localFileURL;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;

  v4 = a3;
  v5 = -[BCAssetDragInfo init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSNumber);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind")));
    v8 = BUDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_contentType = (int64_t)objc_msgSend(v9, "integerValue");

    v10 = objc_opt_class(NSString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetID")));
    v12 = BUDynamicCast(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v13;

    v15 = objc_opt_class(NSString);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("author")));
    v17 = BUDynamicCast(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    author = v5->_author;
    v5->_author = (NSString *)v18;

    v20 = objc_opt_class(NSString);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
    v22 = BUDynamicCast(v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    title = v5->_title;
    v5->_title = (NSString *)v23;

    v25 = objc_opt_class(NSString);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeURL")));
    v27 = BUDynamicCast(v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (objc_msgSend(v28, "length"))
    {
      v29 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v28));
      storeURL = v5->_storeURL;
      v5->_storeURL = (NSURL *)v29;

    }
    v31 = objc_opt_class(NSString);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileURL")));
    v33 = BUDynamicCast(v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    if (objc_msgSend(v34, "length"))
    {
      v35 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v34));
      localFileURL = v5->_localFileURL;
      v5->_localFileURL = (NSURL *)v35;

    }
    v37 = objc_opt_class(NSNumber);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileSize")));
    v39 = BUDynamicCast(v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v5->_fileSize = (int64_t)objc_msgSend(v40, "longLongValue");

    v41 = objc_opt_class(NSNumber);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSample")));
    v43 = BUDynamicCast(v41, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v5->_isSample = objc_msgSend(v44, "BOOLValue");

  }
  return v5;
}

- (double)fileSizeInMegaBytes
{
  return (double)-[BCAssetDragInfo fileSize](self, "fileSize") / 1000000.0;
}

- (void)setFileSizeInMegaBytes:(double)a3
{
  -[BCAssetDragInfo setFileSize:](self, "setFileSize:", (uint64_t)(a3 * 1000000.0));
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)localFileURL
{
  return self->_localFileURL;
}

- (void)setLocalFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (BOOL)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(BOOL)a3
{
  self->_isSample = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localFileURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
