@implementation PLZeroKeywordStore

- (PLZeroKeywordStore)initWithPath:(id)a3
{
  id v5;
  PLZeroKeywordStore *v6;
  PLZeroKeywordStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLZeroKeywordStore;
  v6 = -[PLZeroKeywordStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storePath, a3);

  return v7;
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
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error deleting zero keyword store: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = 0;
  }

}

- (id)currentZeroKeywords
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", self->_storePath);
  objc_msgSend((id)objc_opt_class(), "expectedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v3, v2, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error reading zero keywords from store: %@", buf, 0xCu);
  }

  return v4;
}

- (id)currentZeroKeywordsForLibraryScope:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PLZeroKeywordStore currentZeroKeywords](self, "currentZeroKeywords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)a3 > 2)
      v6 = 0;
    else
      v6 = off_1E3673828[a3];
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = (id)v8;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Using ZeroKeywords with library scope: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v6;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No ZeroKeywords for library scope: %@", (uint8_t *)&v10, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Falling back to non-library scoped Zero Keywords.", (uint8_t *)&v10, 2u);
      }
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateZeroKeywordsTo:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v4, "writeToFile:atomically:", self->_storePath, 1);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error archiving zero keywords: %@", buf, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePath, 0);
}

+ (id)expectedClasses
{
  if (expectedClasses_onceToken != -1)
    dispatch_once(&expectedClasses_onceToken, &__block_literal_global_84062);
  return (id)expectedClasses_expectedClasses;
}

void __37__PLZeroKeywordStore_expectedClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)expectedClasses_expectedClasses;
  expectedClasses_expectedClasses = v2;

}

@end
