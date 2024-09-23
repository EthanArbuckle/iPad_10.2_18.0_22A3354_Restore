@implementation PLAssetsdClientSandboxExtensions

void __61__PLAssetsdClientSandboxExtensions_consumeSandboxExtensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x19AEC2954](v8, v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (objc_msgSend(v8, "startAccessingSecurityScopedResource"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v8, v5);
    }
    else
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Unable to start accessing security scoped URL: %@", (uint8_t *)&v11, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

- (PLAssetsdClientSandboxExtensions)init
{
  PLAssetsdClientSandboxExtensions *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *securityScopedURLs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLAssetsdClientSandboxExtensions;
  v2 = -[PLAssetsdClientSandboxExtensions init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    securityScopedURLs = v2->_securityScopedURLs;
    v2->_securityScopedURLs = v3;

  }
  return v2;
}

- (BOOL)consumeSandboxExtensions:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = self->_securityScopedURLs;
  objc_sync_enter(v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PLAssetsdClientSandboxExtensions_consumeSandboxExtensions___block_invoke;
  v7[3] = &unk_1E3769F58;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_sync_exit(v5);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PLAssetsdClientSandboxExtensions _stopUsingSecurityScopedURLs](self, "_stopUsingSecurityScopedURLs");
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdClientSandboxExtensions;
  -[PLAssetsdClientSandboxExtensions dealloc](&v3, sel_dealloc);
}

- (void)_stopUsingSecurityScopedURLs
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_securityScopedURLs;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_securityScopedURLs;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_securityScopedURLs, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stopAccessingSecurityScopedResource");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_securityScopedURLs, "removeAllObjects");
  objc_sync_exit(v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
}

@end
