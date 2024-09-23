@implementation PLSearchMetadataStore

- (PLSearchMetadataStore)initWithPath:(id)a3
{
  id v5;
  PLSearchMetadataStore *v6;
  PLSearchMetadataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchMetadataStore;
  v6 = -[PLSearchMetadataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storePath, a3);

  return v7;
}

- (id)currentSearchMetadata
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", self->_storePath);
}

- (void)deleteStore
{
  void *v3;
  void *v4;
  NSString *storePath;
  char v6;
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", self->_storePath))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    storePath = self->_storePath;
    v8 = 0;
    v6 = objc_msgSend(v4, "removeItemAtPath:error:", storePath, &v8);
    v7 = v8;

    if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error deleting search metadata store: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = 0;
  }

}

- (void)updateSearchMetadataTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[PLSearchMetadataStore currentSearchMetadata](self, "currentSearchMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__PLSearchMetadataStore_updateSearchMetadataTo___block_invoke;
  v13[3] = &unk_1E3675958;
  v12 = v5;
  v14 = v12;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(v12, "mutableCopy");
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    objc_msgSend(v11, "addEntriesFromDictionary:", v7);
    objc_msgSend(v11, "writeToFile:atomically:", self->_storePath, 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePath, 0);
}

void __48__PLSearchMetadataStore_updateSearchMetadataTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);

}

@end
