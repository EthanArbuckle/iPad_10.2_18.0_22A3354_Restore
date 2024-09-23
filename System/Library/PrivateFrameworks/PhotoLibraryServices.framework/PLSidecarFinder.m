@implementation PLSidecarFinder

- (PLSidecarFinder)init
{
  PLSidecarFinder *v2;
  NSCache *v3;
  NSCache *cachedSidecarURLsByDirectory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLSidecarFinder;
  v2 = -[PLSidecarFinder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cachedSidecarURLsByDirectory = v2->_cachedSidecarURLsByDirectory;
    v2->_cachedSidecarURLsByDirectory = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)collectSidecarURLsForAssetFilename:(id)a3 inDirectory:(id)a4 context:(id)a5 removeWhenDone:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  os_unfair_lock_t lock;
  _BOOL4 v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v27 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSidecarFinder cachedSidecarURLsByDirectory](self, "cachedSidecarURLsByDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend((id)objc_opt_class(), "_findPotentialSidecarURLsInDirectory:context:", v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSidecarFinder cachedSidecarURLsByDirectory](self, "cachedSidecarURLsByDirectory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v10);

  }
  v28 = v11;
  v29 = v10;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByDeletingPathExtension");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v24))
        {
          if ((objc_msgSend(v23, "isEqualToString:", v9) & 1) == 0)
            objc_msgSend(v30, "addObject:", v22);
          objc_msgSend(v13, "addObject:", v22);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v19);
  }

  if (v27)
    objc_msgSend(v17, "removeObjectsInArray:", v13);
  os_unfair_lock_unlock(lock);

  return v30;
}

- (void)reset
{
  id v2;

  -[PLSidecarFinder cachedSidecarURLsByDirectory](self, "cachedSidecarURLsByDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSCache)cachedSidecarURLsByDirectory
{
  return self->_cachedSidecarURLsByDirectory;
}

- (void)setCachedSidecarURLsByDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSidecarURLsByDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSidecarURLsByDirectory, 0);
}

+ (BOOL)_isValidExtensionForSidecar:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && +[PLManagedAsset isValidFileExtensionForImport:](PLManagedAsset, "isValidFileExtensionForImport:", v4)&& (objc_msgSend(MEMORY[0x1E0D752F0], "resourceModelTypeForFilenameExtension:", v4), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "identifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToData")
      && (!objc_msgSend(v7, "conformsToImage") || objc_msgSend(v7, "conformsToRawImage"))
      && !objc_msgSend(v7, "conformsToMovie");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_findPotentialSidecarURLsInDirectory:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C999D0];
  v28 = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C999D0], 0);
  v24 = v6;
  v25 = v5;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19AEC1554]();
        v30 = 0;
        v16 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v30, v7, 0);
        v17 = v30;
        v18 = v17;
        if (v16 && (objc_msgSend(v17, "BOOLValue") & 1) == 0)
        {
          v29 = 0;
          v19 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v29, v28, 0);
          v20 = v29;
          if (v19)
          {
            objc_msgSend(v14, "pathExtension");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend((id)objc_opt_class(), "_isValidExtensionForSidecar:context:", v21, v27))
              objc_msgSend(v26, "addObject:", v14);

          }
        }

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  return v26;
}

uint64_t __64__PLSidecarFinder__findPotentialSidecarURLsInDirectory_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLImageManagerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Error enumerating directory: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

@end
