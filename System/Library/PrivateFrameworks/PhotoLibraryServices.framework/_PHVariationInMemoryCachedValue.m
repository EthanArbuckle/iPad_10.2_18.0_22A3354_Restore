@implementation _PHVariationInMemoryCachedValue

- (_PHVariationInMemoryCachedValue)initWithInfo:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  _PHVariationInMemoryCachedValue *v8;
  _PHVariationInMemoryCachedValue *v9;
  uint64_t v10;
  NSDictionary *info;
  uint64_t v12;
  NSDate *expectedDate;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_PHVariationInMemoryCachedValue;
  v8 = -[_PHVariationInMemoryCachedValue init](&v15, sel_init);
  if (!v8)
  {
LABEL_5:
    v9 = v8;
    goto LABEL_6;
  }
  v9 = 0;
  if (v6 && v7)
  {
    v10 = objc_msgSend(v6, "copy");
    info = v8->_info;
    v8->_info = (NSDictionary *)v10;

    objc_storeStrong((id *)&v8->_fileURL, a4);
    -[_PHVariationInMemoryCachedValue _currentFileModificationDate](v8, "_currentFileModificationDate");
    v12 = objc_claimAutoreleasedReturnValue();
    expectedDate = v8->_expectedDate;
    v8->_expectedDate = (NSDate *)v12;

    if (!v8->_expectedDate)
    {
      v9 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (id)_currentFileModificationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  _PHVariationInMemoryCachedValue *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PHVariationInMemoryCachedValue fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[_PHVariationInMemoryCachedValue fileURL](self, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%@: error reading file attributes of file at %@ (%@)", buf, 0x20u);

    }
  }
  objc_msgSend(v6, "fileModificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  char v5;

  -[_PHVariationInMemoryCachedValue _currentFileModificationDate](self, "_currentFileModificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PHVariationInMemoryCachedValue expectedDate](self, "expectedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToDate:", v3);

  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
