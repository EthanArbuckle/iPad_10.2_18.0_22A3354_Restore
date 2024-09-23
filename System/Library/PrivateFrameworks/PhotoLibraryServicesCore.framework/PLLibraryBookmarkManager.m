@implementation PLLibraryBookmarkManager

- (id)newSandboxExtensionDataForClient:(id *)a3 path:(id)a4 writable:(BOOL)a5
{
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  $115C4C562B26FF47E01F9F4EA65B5887 v11;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");
  v11 = *a3;
  v8 = (const char *)sandbox_extension_issue_file_to_process();
  v9 = (void *)v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1, *(_OWORD *)v11.var0, *(_OWORD *)&v11.var0[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)sharedBookmarkManager
{
  void *v5;
  _QWORD block[5];

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLLibraryBookmarkManager.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsReallyAssetsd()"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PLLibraryBookmarkManager_sharedBookmarkManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBookmarkManager_onceToken != -1)
    dispatch_once(&sharedBookmarkManager_onceToken, block);
  return (id)sLibraryBookmarkManager;
}

- (id)URLFromClientLibraryURL:(id)a3 sandboxExtension:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  SEL v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2791;
  v25 = __Block_byref_object_dispose__2792;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PLLibraryBookmarkManager_URLFromClientLibraryURL_sandboxExtension_error___block_invoke;
  v15[3] = &unk_1E37694B0;
  v18 = &v21;
  v15[4] = self;
  v11 = v9;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v19 = a2;
  v20 = a5;
  PLSafeRunWithUnfairLock((os_unfair_lock_s *)&sLock, v15);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __75__PLLibraryBookmarkManager_URLFromClientLibraryURL_sandboxExtension_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeURLForClientLibraryURL:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && !*(_QWORD *)(a1 + 48)
    && +[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:](PLPhotoLibraryPathManager, "isSystemPhotoLibraryURL:", *(_QWORD *)(a1 + 40)))
  {
    +[PLPhotoLibraryPathManager systemLibraryURL](PLPhotoLibraryPathManager, "systemLibraryURL");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "No SSB on file for %@", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "_securityScopedURLWithURL:sandboxExtension:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((objc_msgSend(v10, "startAccessingSecurityScopedResource") & 1) != 0)
      {
        objc_msgSend(v11, "stopAccessingSecurityScopedResource");
      }
      else
      {
        objc_msgSend(v11, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[PLSandboxHelper processCanWriteSandboxForPath:](PLSandboxHelper, "processCanWriteSandboxForPath:", v17);

        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(a1 + 64);
          v26 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v11, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("PLLibraryBookmarkManager.m"), 145, CFSTR("Failed to start accessing security scoped resource and no access to %@"), v27);

        }
      }
      v15 = 0;
      v16 = v11;
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB3308]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Client did not provide bookmarkData"), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Double-click the photo library in Finder or Option+Launch Photos and select the photo library"), *MEMORY[0x1E0CB2D80]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 41017, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && *(_QWORD *)(a1 + 72))
        **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v15);
      v16 = *(void **)(a1 + 40);
    }
    v19 = *(void **)(a1 + 32);
    v20 = v16;
    objc_msgSend(v19, "_activeURLForClientLibraryURL:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
}

- (id)_activeURLForClientLibraryURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  pathKeyForLibraryURL(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_activeURLsByPathKey, "objectForKeyedSubscript:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (+[PLSandboxHelper fileURLHasSecurityScope:](PLSandboxHelper, "fileURLHasSecurityScope:", v4))
      {
        v6 = v4;
        if (!v6)
          goto LABEL_12;
        goto LABEL_11;
      }
      objc_msgSend(v4, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLGetSandboxExtensionTokenWithFlags(v7, *MEMORY[0x1E0C80008], *MEMORY[0x1E0C806E0], 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PLSandboxExtensionTokenAsData(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend((id)objc_opt_class(), "_securityScopedURLWithURL:sandboxExtension:", v4, v9);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

      if (v6)
LABEL_11:
        -[PLLibraryBookmarkManager _storeSecurityScopedURL:pathKey:](self, "_storeSecurityScopedURL:pathKey:", v6, v5);
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_12:

  return v6;
}

- (PLLibraryBookmarkManager)init
{
  PLLibraryBookmarkManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *activeURLsByPathKey;
  void *v8;
  objc_super v9;

  if (sLibraryBookmarkManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sLibraryBookmarkManager == nil"));

  }
  v9.receiver = self;
  v9.super_class = (Class)PLLibraryBookmarkManager;
  v3 = -[PLLibraryBookmarkManager init](&v9, sel_init);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeURLsByPathKey = v3->_activeURLsByPathKey;
    v3->_activeURLsByPathKey = v4;

    -[PLLibraryBookmarkManager _loadFromDefaults](v3, "_loadFromDefaults");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_activeURLsByPathKey, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2809);
  v3.receiver = self;
  v3.super_class = (Class)PLLibraryBookmarkManager;
  -[PLLibraryBookmarkManager dealloc](&v3, sel_dealloc);
}

- (id)sandboxExtensionsByPathForClient:(id)a3 pathManager:(id)a4 libraryAccessRole:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  PLLibraryBookmarkManager *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2791;
  v25 = __Block_byref_object_dispose__2792;
  v26 = 0;
  if (a5 == 2)
  {
    objc_msgSend(v9, "clientOwnedDirectoryPathsForClientAccess:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5 == 1)
  {
    objc_msgSend(v9, "pathsForClientAccess:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke;
  v16[3] = &unk_1E3769500;
  v20 = &v21;
  v12 = v11;
  v17 = v12;
  v18 = self;
  v13 = v8;
  v19 = v13;
  PLSafeRunWithUnfairLock((os_unfair_lock_s *)&sLock, v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (void)removeSSBForLibraryURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLLibraryBookmarkManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PLLibraryBookmarkManager_removeSSBForLibraryURL___block_invoke;
  v6[3] = &unk_1E376C718;
  v7 = v4;
  v8 = self;
  v5 = v4;
  PLSafeRunWithUnfairLock((os_unfair_lock_s *)&sLock, v6);

}

- (id)allKnownLibraryURLs
{
  return objc_alloc_init(MEMORY[0x1E0C99E20]);
}

- (void)_importLithiumAccessRights
{
  id v4;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsReallyAssetsd()"));

  }
}

- (void)_loadFromDefaults
{
  id v4;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsReallyAssetsd()"));

  }
}

- (void)_saveToDefaults
{
  id v4;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 375, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsReallyAssetsd()"));

  }
}

- (void)_storeSecurityScopedURL:(id)a3 pathKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = v12;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    v8 = 0;
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathKey"));

  v8 = v12;
LABEL_3:
  if ((objc_msgSend(v8, "startAccessingSecurityScopedResource") & 1) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeURLsByPathKey, "setObject:forKeyedSubscript:", v12, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryBookmarkManager.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("started"));

  }
}

- (void)_removeActiveURLForPathKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_activeURLsByPathKey, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_activeURLsByPathKey, "removeObjectForKey:", v6);
      objc_msgSend(v5, "stopAccessingSecurityScopedResource");
    }

    v4 = v6;
  }

}

- (void)_removeSSBForPathKey:(id)a3
{
  if (a3)
  {
    -[PLLibraryBookmarkManager _removeActiveURLForPathKey:](self, "_removeActiveURLForPathKey:");
    -[PLLibraryBookmarkManager _saveToDefaults](self, "_saveToDefaults");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeURLsByPathKey, 0);
}

void __51__PLLibraryBookmarkManager_removeSSBForLibraryURL___block_invoke(uint64_t a1)
{
  id v2;

  pathKeyForLibraryURL(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_removeSSBForPathKey:", v2);

}

void __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke_2;
  v8[3] = &unk_1E37694D8;
  v5 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __91__PLLibraryBookmarkManager_sandboxExtensionsByPathForClient_pathManager_libraryAccessRole___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a3, "BOOLValue");
  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v7, "clientAuditToken");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  v9 = (void *)objc_msgSend(v8, "newSandboxExtensionDataForClient:path:writable:", &v14, v5, v6);
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v9, v5);
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if ((_DWORD)v6)
        v11 = CFSTR("writable");
      else
        v11 = CFSTR("readonly");
      v12 = (int)objc_msgSend(*(id *)(a1 + 40), "clientProcessIdentifier", v14, v15);
      objc_msgSend(*(id *)(a1 + 40), "trustedCallerBundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v20 = 2050;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "No %{public}@ sandbox extension for path %@ for client pid %{public}ld (%{public}@)", buf, 0x2Au);

    }
  }

}

uint64_t __35__PLLibraryBookmarkManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "stopAccessingSecurityScopedResource");
}

+ (id)resolveSecurityScopedBookmark:(id)a3 isStale:(BOOL *)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v11;
  BOOL v12;

  v12 = 0;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", a3, 256, 0, &v12, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (a5 && !v7)
    *a5 = objc_retainAutorelease(v8);
  if (a4)
    *a4 = v12;

  return v7;
}

+ (id)_securityScopedURLWithURL:(id)a3 sandboxExtension:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    v6 = a4;
    objc_msgSend(a3, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x19AEC2954](v8, v6);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __49__PLLibraryBookmarkManager_sharedBookmarkManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sLibraryBookmarkManager;
  sLibraryBookmarkManager = (uint64_t)v1;

}

@end
