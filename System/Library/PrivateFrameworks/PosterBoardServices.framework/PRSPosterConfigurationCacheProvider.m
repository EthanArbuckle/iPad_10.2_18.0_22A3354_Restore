@implementation PRSPosterConfigurationCacheProvider

- (PRSPosterConfigurationCacheProvider)initWithCachingReason:(id)a3
{
  id v4;
  PRSPosterConfigurationCacheProvider *v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  NSURL *baseURL;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSPosterConfigurationCacheProvider;
  v5 = -[PRSPosterConfigurationCacheProvider init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v6 = (void (*)(void))getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr;
    v16 = getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr;
    if (!getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke;
      v12[3] = &unk_1E4D42598;
      v12[4] = &v13;
      __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke((uint64_t)v12);
      v6 = (void (*)(void))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v6)
      -[PRSPosterConfigurationCacheProvider initWithCachingReason:].cold.1();
    v6();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSData)lastActiveLockPoster
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PRSPosterConfigurationCacheProvider _lockURL](self, "_lockURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfigurationCacheProvider _lock_readAtURL:](self, "_lock_readAtURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSData *)v5;
}

- (NSData)lastActiveHomePoster
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PRSPosterConfigurationCacheProvider _homeURL](self, "_homeURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfigurationCacheProvider _lock_readAtURL:](self, "_lock_readAtURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSData *)v5;
}

- (void)setLastActiveLockPoster:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PRSPosterConfigurationCacheProvider _lockURL](self, "_lockURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfigurationCacheProvider _lock_writeData:atURL:](self, "_lock_writeData:atURL:", v5, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)setLastActiveHomePoster:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PRSPosterConfigurationCacheProvider _homeURL](self, "_homeURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfigurationCacheProvider _lock_writeData:atURL:](self, "_lock_writeData:atURL:", v5, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeCaches
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PRSPosterConfigurationCacheProvider _lockURL](self, "_lockURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfigurationCacheProvider _lock_removeAtURL:](self, "_lock_removeAtURL:", v4);

  -[PRSPosterConfigurationCacheProvider _homeURL](self, "_homeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterConfigurationCacheProvider _lock_removeAtURL:](self, "_lock_removeAtURL:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_readAtURL:(id)a3
{
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  id v14;

  v3 = a3;
  v14 = 0;
  v4 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", &v14);
  v5 = v14;
  v6 = v5;
  if (!v4)
  {
    if (!v5)
    {
      v9 = 0;
      goto LABEL_14;
    }
    PRSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationCacheProvider _lock_readAtURL:].cold.2();
    v9 = 0;
LABEL_12:

LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (!v10)
  {
    PRSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationCacheProvider _lock_readAtURL:].cold.1();
    goto LABEL_12;
  }
LABEL_15:

  return v7;
}

- (void)_lock_writeData:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PRSPosterConfigurationCacheProvider _lock_setupSharedWorkspaceIfNeeded](self, "_lock_setupSharedWorkspaceIfNeeded");
  v10 = 0;
  LOBYTE(self) = objc_msgSend(v7, "writeToURL:options:error:", v6, 268435457, &v10);

  v8 = v10;
  if ((self & 1) == 0)
  {
    PRSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationCacheProvider _lock_writeData:atURL:].cold.1();

  }
}

- (void)_lock_removeAtURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
  v6 = v9;
  v7 = v6;
  if ((v5 & 1) == 0 && v6)
  {
    PRSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PRSPosterConfigurationCacheProvider _lock_removeAtURL:].cold.1();

  }
}

- (void)_lock_setupSharedWorkspaceIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A4996000, a2, OS_LOG_TYPE_ERROR, "Error setting up shared workspace: %@", (uint8_t *)&v4, 0xCu);

}

- (id)_lockURL
{
  return -[NSURL URLByAppendingPathComponent:isDirectory:](self->_baseURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("lock"), 0);
}

- (id)_homeURL
{
  return -[NSURL URLByAppendingPathComponent:isDirectory:](self->_baseURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("home"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)initWithCachingReason:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL *soft_PBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURL(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PRSPosterConfigurationCacheProvider.m"), 18, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_lock_readAtURL:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4996000, v2, v3, "Error reading data from URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_lock_readAtURL:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4996000, v2, v3, "Error reaching resource at URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_lock_writeData:atURL:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4996000, v2, v3, "Error writing data to URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_lock_removeAtURL:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4996000, v2, v3, "Error removing item at URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
