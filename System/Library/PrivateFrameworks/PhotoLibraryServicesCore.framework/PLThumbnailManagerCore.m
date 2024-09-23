@implementation PLThumbnailManagerCore

+ (id)_configurationThumbnailFormatIDsWithPathManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int16 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "thumbnailConfigurationDictWithPathManager:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("PLThumbnailManagerThumbnailFormatsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("PLThumbnailManagerThumbnailFormatKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "intValue");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v11, "addObject:", v12);
      v27 = v12;
      if (!PLIsLimitedLibraryClient())
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(a1, "_formatIDsForIthmbFilesWithPathManager:", v4, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "integerValue"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v11, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v15);
        }

      }
      v29 = v5;
      objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_11, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "formatID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v22);
      }

      v5 = v29;
    }

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

+ (id)thumbnailConfigurationDictWithPathManager:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "thumbnailConfigurationPathWithPathManager:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v6, "initWithContentsOfFile:", v7);
  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v8;
}

+ (id)_formatIDsForIthmbFilesWithPathManager:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  id v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  objc_sync_enter(v4);
  obj = v4;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v4, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, 0);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v13 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v12, &v23);
        if (v23)
          v14 = 0;
        else
          v14 = v13;
        if (v14 == 1)
        {
          objc_msgSend(v11, "pathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("ithmb"));

          if (v16)
          {
            objc_msgSend(v11, "stringByDeletingPathExtension");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "integerValue");
            if (v18 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v19);

            }
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  objc_sync_exit(obj);
  return v22;
}

+ (id)thumbnailConfigurationPathWithPathManager:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("thumbnailConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_thumbnailFormatsFromIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "intValue", (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

id __92__PLThumbnailManagerCore_isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isSuppressingTargetConfigComparedToSavedConfigForPathManager:", *(_QWORD *)(a1 + 32)));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t __74__PLThumbnailManagerCore__configurationThumbnailFormatIDsWithPathManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)thumbManagerForFormatID:(unsigned __int16)a3 thumbFileManagerClass:(Class)a4 readOnly:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  PLThumbPersistenceManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  PLThumbPersistenceManager *v23;

  v5 = a5;
  v7 = a3;
  -[NSLock lock](self->_thumbManagersLock, "lock");
  if (self->_lastUsedThumbManagerFormatID != (_DWORD)v7 || (v9 = self->_lastUsedThumbManager) == 0)
  {
    -[PLThumbnailManagerCore thumbManagersByFormat](self, "thumbManagersByFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {
      +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isTable"))
      {
        -[PLThumbnailManagerCore pathManager](self, "pathManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%@"), v7, CFSTR("ithmb"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingPathComponent:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "createTableWithPath:readOnly:format:", v18, v5, v14);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = [a4 alloc];
        -[PLThumbnailManagerCore pathManager](self, "pathManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v20, "initWithImageFormat:pathManager:", v14, v18);
      }
      v9 = (PLThumbPersistenceManager *)v19;

      if (v9)
      {
        -[PLThumbnailManagerCore thumbManagersByFormat](self, "thumbManagersByFormat");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, v22);

        v23 = v9;
      }

    }
    else
    {
      v9 = (PLThumbPersistenceManager *)v12;
    }
    objc_storeStrong((id *)&self->_lastUsedThumbManager, v9);
    self->_lastUsedThumbManagerFormatID = v7;
  }
  -[NSLock unlock](self->_thumbManagersLock, "unlock");
  return v9;
}

- (NSMutableDictionary)thumbManagersByFormat
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 64, 1);
}

BOOL __74__PLThumbnailManagerCore__hasTableFormatsAndAllAreCompressedForFormatIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", objc_msgSend(a2, "unsignedShortValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thumbnailKind") == 3 || objc_msgSend(v2, "thumbnailKind") == 4;

  return v3;
}

uint64_t __74__PLThumbnailManagerCore__hasTableFormatsAndAllAreCompressedForFormatIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", objc_msgSend(a2, "unsignedShortValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTable");

  return v3;
}

void __75__PLThumbnailManagerCore_thumbnailFormatIDsForConfigPhase_withPathManager___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  +[PLDeviceConfiguration defaultDeviceConfiguration](PLDeviceConfiguration, "defaultDeviceConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "supportedThumbnailFormatIDsForDeviceConfiguration:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)thumbnailFormatIDsForConfigPhase_withPathManager__s_cachedTargetFormatIDs;
  thumbnailFormatIDsForConfigPhase_withPathManager__s_cachedTargetFormatIDs = v2;

}

+ (id)supportedThumbnailFormatIDsForDeviceConfiguration:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "shouldUseNanoThumbnailFormats"))
  {
    v4 = objc_msgSend(v3, "supportsASTC");
    v5 = &unk_1E378FDF8;
    v6 = &unk_1E378FDE0;
  }
  else
  {
    if ((objc_msgSend(v3, "isTV") & 1) != 0)
    {
      v7 = &unk_1E378FE10;
      goto LABEL_11;
    }
    if ((objc_msgSend(v3, "isPad") & 1) != 0)
    {
      v7 = &unk_1E378FE28;
      goto LABEL_11;
    }
    v4 = objc_msgSend(v3, "isMac");
    v5 = &unk_1E378FE58;
    v6 = &unk_1E378FE40;
  }
  if (v4)
    v7 = v6;
  else
    v7 = v5;
LABEL_11:

  return v7;
}

- (PLThumbnailManagerCore)initWithPhotoLibraryPathManager:(id)a3
{
  id v6;
  PLThumbnailManagerCore *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *thumbManagersByFormat;
  NSMutableDictionary *v20;
  NSLock *v21;
  NSLock *thumbManagersLock;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLThumbnailManagerCore.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v30.receiver = self;
  v30.super_class = (Class)PLThumbnailManagerCore;
  v7 = -[PLThumbnailManagerCore init](&v30, sel_init);
  if (v7)
  {
    obj = a3;
    v8 = (void *)MEMORY[0x1E0C99D80];
    +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManagerCore, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedKeySetForKeys:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v10);
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v18, v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v14);
    }

    thumbManagersByFormat = v7->_thumbManagersByFormat;
    v7->_thumbManagersByFormat = v11;
    v20 = v11;

    objc_storeStrong((id *)&v7->_pathManager, obj);
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    thumbManagersLock = v7->_thumbManagersLock;
    v7->_thumbManagersLock = v21;

    v7->_ivarLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (int64_t)requiredThumbnailResetTypeWithPathManager:(id)a3 comparedToConfigPhase:(int64_t)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v14;
  int64_t v15;
  NSObject *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a1, "hasThumbnailConfigMismatchWithPathManager:comparedToConfigPhase:", v6, a4))
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    if (PLIsReallyAssetsd_isAssetsd
      || (__PLIsAssetsdProxyService & 1) != 0
      || PFProcessIsLaunchedToExecuteTests())
    {
      v7 = objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", 0, v6);
      v8 = objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", a4, v6);
      objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 0, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", a4, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(a1, "_hasTableChangesOnlyFromFormatIDs:toFormatIDs:", v9, v10);
      v12 = v11;
      if (v11)
        v11 = objc_msgSend(a1, "_hasTableFormatsAndAllAreCompressedForFormatIDs:", v10);
      if (v7 != 30 || v8 <= 30)
        v14 = v11;
      else
        v14 = 1;
      if (v14)
        v15 = 1;
      else
        v15 = 2;
      PLThumbnailsGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138544386;
        v19 = v9;
        v20 = 2114;
        v21 = v10;
        v22 = 1024;
        v23 = v12;
        v24 = 1024;
        v25 = v14;
        v26 = 1024;
        v27 = v14 ^ 1;
        _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_DEFAULT, "Detected thumbnail configuration change: from formats: %{public}@ to formats: %{public}@, tableChangesOnly: %d, migrationToCompressedTablesOnly: %d, fullRebuild: %d", (uint8_t *)&v18, 0x28u);
      }

    }
    else
    {
      v15 = 3;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)_hasTableChangesOnlyFromFormatIDs:(id)a3 toFormatIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  if (v9)
    v10 = objc_msgSend(v5, "isEqualToArray:", v6) ^ 1;
  else
    LOBYTE(v10) = 0;

  return v10;
}

+ (BOOL)hasThumbnailConfigMismatchWithPathManager:(id)a3 comparedToConfigPhase:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "configurationThumbnailVersionWithPathManager:", v6);
  if (v9 <= 29)
  {
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = MEMORY[0x1E0C9AA60];
    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (v9 == objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", a4, v6)
      && (objc_msgSend(v14, "isEqualToArray:", v11) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      PLThumbnailsGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 67109890;
        v18 = v9;
        v19 = 1024;
        v20 = objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", a4, v6);
        v21 = 2114;
        v22 = v7;
        v23 = 2114;
        v24 = v8;
        _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_DEFAULT, "hasThumbnailConfigMismatch (legacy) thumbnailVersion %d vs current %d, formats: %{public}@ vs desired: %{public}@", (uint8_t *)&v17, 0x22u);
      }

      v12 = 1;
    }

LABEL_21:
    goto LABEL_22;
  }
  if (v9 != objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", a4, v6)
    || (objc_msgSend(v7, "isEqualToArray:", v8) & 1) == 0)
  {
    PLThumbnailsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109890;
      v18 = v9;
      v19 = 1024;
      v20 = objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", a4, v6);
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_DEFAULT, "hasThumbnailConfigMismatch (modern) thumbnailVersion %d vs current %d, formats: %{public}@ vs desired: %{public}@", (uint8_t *)&v17, 0x22u);
    }
    v12 = 1;
    goto LABEL_21;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

+ (id)thumbnailFormatsForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  if (a3 == 2
    || (v7 = objc_msgSend(a1, "isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v6), a3 == 1)
    && (v7 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__PLThumbnailManagerCore_thumbnailFormatsForConfigPhase_withPathManager___block_invoke;
    v13[3] = &unk_1E3768620;
    v15 = a1;
    v8 = v6;
    v14 = v8;
    if (thumbnailFormatsForConfigPhase_withPathManager__s_onceToken == -1)
    {
      v9 = v8;
    }
    else
    {
      dispatch_once(&thumbnailFormatsForConfigPhase_withPathManager__s_onceToken, v13);
      v9 = v14;
    }
    v10 = (id)thumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  }
  else
  {
    objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_thumbnailFormatsFromIDs:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (BOOL)_isSuppressingTargetConfigComparedToSavedConfigForPathManager:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  char v10;
  char v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", 0, v4);
  objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", 2, v4);
  objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 2, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "_hasTableChangesOnlyFromFormatIDs:toFormatIDs:", v6, v8);
  if (v9)
    LOBYTE(v9) = objc_msgSend(a1, "_hasTableFormatsAndAllAreCompressedForFormatIDs:", v8);
  v10 = (v5 == 30) & ~(_BYTE)v9;
  if (v7 <= 30)
    v10 = 0;
  v11 = v10 | v9;

  return v11;
}

+ (id)thumbnailFormatIDsForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD block[5];

  v6 = a4;
  switch(a3)
  {
    case 2:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PLThumbnailManagerCore_thumbnailFormatIDsForConfigPhase_withPathManager___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (thumbnailFormatIDsForConfigPhase_withPathManager__s_onceToken != -1)
        dispatch_once(&thumbnailFormatIDsForConfigPhase_withPathManager__s_onceToken, block);
      v7 = (id)thumbnailFormatIDsForConfigPhase_withPathManager__s_cachedTargetFormatIDs;
      goto LABEL_13;
    case 1:
      if (objc_msgSend(a1, "isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v6))
      {
        v8 = a1;
        v9 = 0;
      }
      else
      {
        v8 = a1;
        v9 = 2;
      }
      objc_msgSend(v8, "thumbnailFormatIDsForConfigPhase:withPathManager:", v9, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 0:
      objc_msgSend(a1, "_configurationThumbnailFormatIDsWithPathManager:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v10 = v7;
      goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

+ (BOOL)isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  PLLazyObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoDirectoryWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&s_isSupressingLock);
    objc_msgSend((id)s_isSuppressingTargetConfigByBundleDirectory, "objectForKeyedSubscript:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = objc_initWeak(location, a1);

      v8 = [PLLazyObject alloc];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __92__PLThumbnailManagerCore_isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager___block_invoke;
      v18 = &unk_1E3768E58;
      objc_copyWeak(&v20, location);
      v19 = v4;
      v6 = -[PLLazyObject initWithBlock:](v8, "initWithBlock:", &v15);

      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
      v9 = (void *)s_isSuppressingTargetConfigByBundleDirectory;
      if (!s_isSuppressingTargetConfigByBundleDirectory)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v15, v16, v17, v18);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)s_isSuppressingTargetConfigByBundleDirectory;
        s_isSuppressingTargetConfigByBundleDirectory = v10;

        v9 = (void *)s_isSuppressingTargetConfigByBundleDirectory;
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v5, v15, v16, v17, v18);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&s_isSupressingLock);
    -[NSObject objectValue](v6, "objectValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

  }
  else
  {
    PLThumbnailsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Unable to determine thumbnail manager target config suppression state, can't determine libraryKey from path manager: %@", (uint8_t *)location, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (int)thumbnailVersionForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;

  v6 = a4;
  switch(a3)
  {
    case 2:
      v8 = 31;
      break;
    case 1:
      if (objc_msgSend(a1, "isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v6))
      {
        v9 = a1;
        v10 = 0;
      }
      else
      {
        v9 = a1;
        v10 = 2;
      }
      v7 = objc_msgSend(v9, "thumbnailVersionForConfigPhase:withPathManager:", v10, v6);
      goto LABEL_11;
    case 0:
      v7 = objc_msgSend(a1, "configurationThumbnailVersionWithPathManager:", v6);
LABEL_11:
      v8 = v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

+ (int)configurationThumbnailVersionWithPathManager:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a1, "thumbnailConfigurationDictWithPathManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PLThumbnailManagerVersionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

+ (BOOL)_hasTableFormatsAndAllAreCompressedForFormatIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v9 = objc_msgSend(v8, "count");
    v10 = v9 == objc_msgSend(v6, "count");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_thumbManagerForFormatID:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;

  v3 = a3;
  v5 = objc_opt_class();
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  return -[PLThumbnailManagerCore thumbManagerForFormatID:thumbFileManagerClass:readOnly:](self, "thumbManagerForFormatID:thumbFileManagerClass:readOnly:", v3, v5, (PLIsReallyAssetsd_isAssetsd == 0) & (__PLIsAssetsdProxyService ^ 1u));
}

- (void)dealloc
{
  NSLock *thumbManagersLock;
  objc_super v4;

  thumbManagersLock = self->_thumbManagersLock;
  self->_thumbManagersLock = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLThumbnailManagerCore;
  -[PLThumbnailManagerCore dealloc](&v4, sel_dealloc);
}

- (id)fastThumbPersistenceManagers
{
  os_unfair_lock_s *p_ivarLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *fastImageTables;
  NSObject *v16;
  NSArray *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  NSArray *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (!self->_fastImageTables)
  {
    v4 = (void *)objc_opt_class();
    -[PLThumbnailManagerCore pathManager](self, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableThumbnailFormatsForConfigPhase:withPathManager:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          -[PLThumbnailManagerCore _thumbManagerForFormatID:](self, "_thumbManagerForFormatID:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "formatID", (_QWORD)v19));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v10);
    }

    v14 = (NSArray *)objc_msgSend(v7, "copy");
    fastImageTables = self->_fastImageTables;
    self->_fastImageTables = v14;

    PLThumbnailsGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_fastImageTables;
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_DEBUG, "#### fastThumbPersistenceManagers %@", buf, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_ivarLock);
  return self->_fastImageTables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_thumbManagersByFormat, 0);
  objc_storeStrong((id *)&self->_fastImageTables, 0);
  objc_storeStrong((id *)&self->_lastUsedThumbManager, 0);
  objc_storeStrong((id *)&self->_thumbManagersLock, 0);
  objc_storeStrong((id *)&self->_thumbnailConfigurationDict, 0);
}

+ (id)_generateTableFormatsFromFormatIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSObject *v17;
  void *v18;
  double v19;
  int v20;
  double v21;
  int v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "intValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isTable"))
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v7);
  }
  v29 = v5;

  v30 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_584);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        PLThumbnailsGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "shortDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "size");
          v20 = (int)v19;
          objc_msgSend(v16, "size");
          v22 = (int)v21;
          v23 = objc_msgSend(v16, "isCropped");
          *(_DWORD *)buf = 138413058;
          v40 = (uint64_t)v18;
          v41 = 1024;
          v42 = v20;
          v43 = 1024;
          v44 = v22;
          v45 = 1024;
          v46 = v23;
          _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEBUG, "#### Format %@ : %d x %d, crop %d", buf, 0x1Eu);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v13);
  }
  v24 = v11;
  PLThumbnailsGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = (uint64_t)v24;
    _os_log_impl(&dword_199DF7000, v25, OS_LOG_TYPE_DEBUG, "#### fastTableFormats %@", buf, 0xCu);
  }

  PLThumbnailsGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134217984;
    v40 = v27;
    _os_log_impl(&dword_199DF7000, v26, OS_LOG_TYPE_DEBUG, "#### fastFormatCount %lu", buf, 0xCu);
  }

  return v24;
}

+ (id)_generateUncompressedImageTableSpecificationsForRunningConfigWithPathManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "tableThumbnailFormatsForConfigPhase:withPathManager:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
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
        if (objc_msgSend(v11, "thumbnailKind") == 1)
        {
          objc_msgSend(v11, "thumbnailSpecification");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (void)invalidateCachedConfig
{
  os_unfair_lock_lock((os_unfair_lock_t)&s_isSupressingLock);
  objc_msgSend((id)s_isSuppressingTargetConfigByBundleDirectory, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&s_isSupressingLock);
}

+ (void)invalidateIsSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:(id)a3
{
  id v3;

  objc_msgSend(a3, "photoDirectoryWithType:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&s_isSupressingLock);
    objc_msgSend((id)s_isSuppressingTargetConfigByBundleDirectory, "setObject:forKeyedSubscript:", 0, v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&s_isSupressingLock);
  }

}

+ (id)tableThumbnailFormatsForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  if (a3 == 2
    || (v7 = objc_msgSend(a1, "isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v6), a3 == 1)
    && (v7 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__PLThumbnailManagerCore_tableThumbnailFormatsForConfigPhase_withPathManager___block_invoke;
    v13[3] = &unk_1E3768620;
    v15 = a1;
    v8 = v6;
    v14 = v8;
    if (tableThumbnailFormatsForConfigPhase_withPathManager__s_onceToken == -1)
    {
      v9 = v8;
    }
    else
    {
      dispatch_once(&tableThumbnailFormatsForConfigPhase_withPathManager__s_onceToken, v13);
      v9 = v14;
    }
    v10 = (id)tableThumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  }
  else
  {
    objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateTableFormatsFromFormatIDs:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (BOOL)isMissingThumbnailTablesWithPathManager:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *i;
  void *v9;
  void *v10;
  unsigned __int16 v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)objc_msgSend(v9, "intValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isTable"))
        {
          v11 = objc_msgSend(v9, "intValue");
          v12 = (void *)MEMORY[0x1E0CB3940];
          v13 = v11;
          v14 = v21;
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%d.%@"), v13, CFSTR("ithmb"));
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "stringByAppendingPathComponent:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v15) = objc_msgSend(v20, "fileExistsAtPath:", v17);
          if ((v15 & 1) == 0)
          {
            PLThumbnailsGetLog();
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              v18 = objc_msgSend(v9, "intValue");
              *(_DWORD *)buf = 67109120;
              v27 = v18;
              _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "Missing thumbnail table for format %d", buf, 8u);
            }

            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v6;
}

+ (void)removeThumbnailTablesUnsupportedOnly:(BOOL)a3 withPathManager:(id)a4
{
  objc_msgSend(a1, "removeThumbnailTablesUnsupportedOnly:withPathManager:fileManagerDelegate:", a3, a4, 0);
}

+ (void)removeThumbnailTablesUnsupportedOnly:(BOOL)a3 withPathManager:(id)a4 fileManagerDelegate:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v8 = (objc_class *)MEMORY[0x1E0CB3620];
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v11, "setDelegate:", v9);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__PLThumbnailManagerCore_removeThumbnailTablesUnsupportedOnly_withPathManager_fileManagerDelegate___block_invoke;
  v13[3] = &unk_1E3768668;
  v15 = a3;
  v14 = v11;
  v12 = v11;
  objc_msgSend(a1, "enumerateThumbnailTablesWithPathManager:fileManager:handler:", v10, v12, v13);

}

+ (int64_t)allocatedFileSizeOfThumbnailTablesWithPathManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v17[0] = *MEMORY[0x1E0C99AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PLThumbnailManagerCore_allocatedFileSizeOfThumbnailTablesWithPathManager___block_invoke;
  v10[3] = &unk_1E3768690;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(a1, "enumerateThumbnailTablesWithPathManager:fileManager:handler:", v4, v5, v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (void)enumerateThumbnailTablesWithPathManager:(id)a3 fileManager:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void (**v31)(id, void *, _QWORD);
  id obj;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = (void (**)(id, void *, _QWORD))a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLThumbnailManagerCore.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLThumbnailManagerCore.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileManager"));

LABEL_3:
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLThumbnailManagerCore.m"), 493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v10 = v8;
  objc_sync_enter(v10);
  v30 = v10;
  objc_msgSend(v10, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v11, 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "stringByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v17 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v16, &v33);
        if (v33)
          v18 = 0;
        else
          v18 = v17;
        if (v18 == 1)
        {
          objc_msgSend(v15, "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("ithmb"));

          if (v20)
          {
            objc_msgSend(v15, "stringByDeletingPathExtension");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");
            objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v30);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "containsObject:", v24);

            v31[2](v31, v16, v25 ^ 1u);
          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }

  objc_sync_exit(v30);
}

+ (void)markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:(id)a3
{
  objc_msgSend(a3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PLThumbnailManagerRebuildingTablesOnly"));
}

+ (void)markThumbnailConfigurationTableOnlyRebuildFinishedForThumbnailConfigDict:(id)a3
{
  objc_msgSend(a3, "removeObjectForKey:", CFSTR("PLThumbnailManagerRebuildingTablesOnly"));
}

+ (BOOL)wantsTableOnlyRebuildForThumbnailConfigDict:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLThumbnailManagerRebuildingTablesOnly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)stampThumbnailConfiguration:(id)a3 toFile:(BOOL)a4 withPathManager:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", 2, v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("PLThumbnailManagerVersionKey"));

  objc_msgSend(a1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 2, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("PLThumbnailManagerThumbnailFormatKey"));

  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("PLThumbnailManagerThumbnailFormatsKey"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 100, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "thumbnailConfigurationPathWithPathManager:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeToFile:options:error:", v13, 1073741825, 0);

  }
}

void __76__PLThumbnailManagerCore_allocatedFileSizeOfThumbnailTablesWithPathManager___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0C99E98];
  v4 = a2;
  v8 = (id)objc_msgSend([v3 alloc], "initFileURLWithPath:isDirectory:", v4, 0);

  objc_msgSend(v8, "resourceValuesForKeys:error:", *(_QWORD *)(a1 + 32), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C99AC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
}

uint64_t __99__PLThumbnailManagerCore_removeThumbnailTablesUnsupportedOnly_withPathManager_fileManagerDelegate___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  BOOL v3;

  if (*(_BYTE *)(result + 40))
    v3 = a3 == 0;
  else
    v3 = 0;
  if (!v3)
    return objc_msgSend(*(id *)(result + 32), "removeItemAtPath:error:", a2, 0);
  return result;
}

void __78__PLThumbnailManagerCore_tableThumbnailFormatsForConfigPhase_withPathManager___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 40);
  objc_msgSend(v1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 2, *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_generateTableFormatsFromFormatIDs:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tableThumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  tableThumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats = v2;

}

void __73__PLThumbnailManagerCore_thumbnailFormatsForConfigPhase_withPathManager___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 40);
  objc_msgSend(v1, "thumbnailFormatIDsForConfigPhase:withPathManager:", 2, *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_thumbnailFormatsFromIDs:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)thumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  thumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats = v2;

}

uint64_t __61__PLThumbnailManagerCore__generateTableFormatsFromFormatIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
