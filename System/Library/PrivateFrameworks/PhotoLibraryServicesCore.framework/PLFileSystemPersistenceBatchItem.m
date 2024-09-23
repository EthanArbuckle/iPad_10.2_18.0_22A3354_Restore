@implementation PLFileSystemPersistenceBatchItem

- (PLFileSystemPersistenceBatchItem)initWithFileURL:(id)a3
{
  id v5;
  PLFileSystemPersistenceBatchItem *v6;
  PLFileSystemPersistenceBatchItem *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *attributes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLFileSystemPersistenceBatchItem;
  v6 = -[PLFileSystemPersistenceBatchItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributes = v7->_attributes;
    v7->_attributes = v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLFileSystemPersistenceBatchItem fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> '%@'"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PLFileSystemPersistenceBatchItem attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

- (void)setUUIDString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  PLUUIDDataFromString(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFileSystemPersistenceBatchItem setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (void)setUInt16:(unsigned __int16)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unsigned __int16 v8;

  v8 = a3;
  v5 = (void *)MEMORY[0x1E0C99D50];
  v6 = a4;
  objc_msgSend(v5, "dataWithBytes:length:", &v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFileSystemPersistenceBatchItem setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (void)setInt32:(int)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  int v8;

  v8 = a3;
  v5 = (void *)MEMORY[0x1E0C99D50];
  v6 = a4;
  objc_msgSend(v5, "dataWithBytes:length:", &v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFileSystemPersistenceBatchItem setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (void)setUInt64:(unint64_t)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;

  v8 = a3;
  v5 = (void *)MEMORY[0x1E0C99D50];
  v6 = a4;
  objc_msgSend(v5, "dataWithBytes:length:", &v8, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFileSystemPersistenceBatchItem setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFileSystemPersistenceBatchItem setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (void)persist
{
  void *v3;
  id v4;
  const char *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  char *v14;
  int *v15;
  char *v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[5];
  int v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PLFileSystemPersistenceBatchItem fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");

  v6 = open(v5, 2097153);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_2:
    -[PLFileSystemPersistenceBatchItem attributes](self, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__PLFileSystemPersistenceBatchItem_persist__block_invoke;
    v19[3] = &unk_1E376B960;
    v20 = v6;
    v19[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);

    close(v6);
    return;
  }
  v8 = *__error();
  -[PLFileSystemPersistenceBatchItem fileURL](self, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PLFileUtilities stripImmutableFlagIfNecessaryFromFileAtPath:](PLFileUtilities, "stripImmutableFlagIfNecessaryFromFileAtPath:", v10);

  if (v11)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[PLFileSystemPersistenceBatchItem fileURL](self, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2082;
      v24 = v16;
      _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_DEFAULT, "Retrying after clearing IMMUTABLE flag from %@ after failing to open file for writing (%{public}s).", buf, 0x16u);

    }
    v6 = open(v5, 2097153);
    if ((v6 & 0x80000000) == 0)
      goto LABEL_2;
    v8 = *__error();
  }
  PLBackendGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = strerror(v8);
    *(_DWORD *)buf = 136446210;
    v22 = v18;
    _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, "Unable to open file to save extended attributes (%{public}s).", buf, 0xCu);
  }

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

void __43__PLFileSystemPersistenceBatchItem_persist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  id v12;
  const char *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int *v18;
  char *v19;
  const char *v20;
  int *v21;
  char *v22;
  int v23;
  void *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
    v8 = 0;
  else
    v8 = v6;
  v9 = v8;

  v10 = v5;
  v11 = *(_DWORD *)(a1 + 40);
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (v9)
  {
    v14 = objc_retainAutorelease(v9);
    if (fsetxattr(v11, v13, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), 0, 0) < 0)
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "fileURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = __error();
        v19 = strerror(*v18);
        v23 = 138412546;
        v24 = v17;
        v25 = 2080;
        v26 = v19;
        v20 = "Unable to set extended attributes on '%@': (%s).";
LABEL_12:
        _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v23, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (fremovexattr(v11, v13, 0) < 0 && *__error() != 93)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = __error();
      v22 = strerror(*v21);
      v23 = 138412546;
      v24 = v17;
      v25 = 2080;
      v26 = v22;
      v20 = "Unable to remove extended attributes on '%@': (%s).";
      goto LABEL_12;
    }
LABEL_13:

  }
}

@end
