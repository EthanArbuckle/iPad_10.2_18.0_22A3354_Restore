@implementation IMBaseDiskCache

- (BOOL)hasItemForKey:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[IMBaseDiskCache pathForKey:](self, "pathForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (IMBaseDiskCache)initWithBasePath:(id)a3
{
  id v4;
  IMBaseDiskCache *v5;
  IMBaseDiskCache *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMBaseDiskCache;
  v5 = -[IMBaseDiskCache init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMBaseDiskCache setBasePath:](v5, "setBasePath:", v4);
    -[IMBaseDiskCache initialize](v6, "initialize");
  }

  return v6;
}

- (void)setBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_basePath, a3);
}

- (id)pathForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  CC_LONG v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "pf_stringWithPercentEscape");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x100)
    {
      objc_msgSend(v4, "pathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByDeletingPathExtension");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      v6 = v5;
      if (v9)
      {
        v10 = (const void *)v9;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
        v12 = objc_msgSend(v8, "length");
        v13 = objc_retainAutorelease(v11);
        CC_SHA256(v10, v12, (unsigned __int8 *)objc_msgSend(v13, "mutableBytes"));
        objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = CFSTR("shortened-");
        v24[1] = v14;
        v24[2] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", &stru_1EA0D7620);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      _MTLogCategoryDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412546;
        v21 = v5;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1DA478000, v16, OS_LOG_TYPE_DEFAULT, "Image name exceeds 255 characters. Shortening %@ to %@", (uint8_t *)&v20, 0x16u);
      }

    }
    -[IMBaseDiskCache basePath](self, "basePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)initialize
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMBaseDiskCache basePath](self, "basePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fileExistsAtPath:", v3) & 1) != 0)
    goto LABEL_4;
  v4 = objc_msgSend(MEMORY[0x1E0D7F278], "supportsImageStore");

  if (v4)
  {
    -[IMBaseDiskCache basePath](self, "basePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);
LABEL_4:

  }
}

- (NSString)basePath
{
  return self->_basePath;
}

- (IMBaseDiskCache)init
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  IMBaseDiskCache *v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "applicationCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IMBaseDiskCache initWithBasePath:](self, "initWithBasePath:", v6);
  return v7;
}

- (void)clearCache
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBaseDiskCache basePath](self, "basePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  -[IMBaseDiskCache initialize](self, "initialize");
}

- (void)removeItemsWithPrefx:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[IMBaseDiskCache _allFiles](self, "_allFiles", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasPrefix:", v4))
          {
            -[IMBaseDiskCache basePath](self, "basePath");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "removeItemAtPath:error:", v13, 0);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)removeItemForKey:(id)a3
{
  void *v3;
  id v4;

  -[IMBaseDiskCache pathForKey:](self, "pathForKey:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  }
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[IMBaseDiskCache _allFiles](self, "_allFiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)_allFiles
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBaseDiskCache basePath](self, "basePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
}

@end
