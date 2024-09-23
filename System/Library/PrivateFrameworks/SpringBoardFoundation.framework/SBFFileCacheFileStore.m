@implementation SBFFileCacheFileStore

- (SBFFileCacheFileStore)initWithDirectoryURL:(id)a3
{
  id v4;
  SBFFileCacheFileStore *v5;
  uint64_t v6;
  NSURL *directoryURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFFileCacheFileStore;
  v5 = -[SBFFileCacheFileStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    directoryURL = v5->_directoryURL;
    v5->_directoryURL = (NSURL *)v6;

  }
  return v5;
}

- (SBFFileCacheFileStore)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't directly init this class"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFFileCacheFileStore directoryURL](self, "directoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("directoryURL"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)fileURLForFileNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFFileCacheFileStore directoryURL](self, "directoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fileCache:(id)a3 storeFileWrapper:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v7, "preferredFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBFFileCacheFileStore fileURLForFileNamed:](self, "fileURLForFileNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeToURL:options:originalContentsURL:error:", v6, 1, 0, 0);

}

- (id)fileCache:(id)a3 loadFileWrapperNamed:(id)a4
{
  void *v4;
  void *v5;

  -[SBFFileCacheFileStore fileURLForFileNamed:](self, "fileURLForFileNamed:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v4, 0, 0);

  return v5;
}

- (void)fileCache:(id)a3 removeFileWrapperNamed:(id)a4
{
  id v4;
  id v5;

  -[SBFFileCacheFileStore fileURLForFileNamed:](self, "fileURLForFileNamed:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v4, "removeItemAtURL:error:", v5, 0);

}

- (void)removeAllFileWrappersForFileCache:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBFFileCacheFileStore directoryURL](self, "directoryURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
