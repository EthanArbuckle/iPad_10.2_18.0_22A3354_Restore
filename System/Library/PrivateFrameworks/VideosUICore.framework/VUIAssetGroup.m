@implementation VUIAssetGroup

void __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[7], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

void __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[7], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v8;
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v8[7], "objectForKey:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryWithDictionary:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("VUIAssetLastAccessedDate"));

      objc_msgSend(v8[7], "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
      WeakRetained = v8;
    }
  }

}

- (int64_t)groupType
{
  return self->_groupType;
}

- (id)assetInfoForKey:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint64_t *v25;
  id v26;
  id location;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke;
  block[3] = &unk_1E9F2C550;
  objc_copyWeak(&v26, &location);
  v25 = &v28;
  v9 = v6;
  v24 = v9;
  dispatch_sync(v7, block);
  objc_msgSend((id)v29[5], "objectForKey:", CFSTR("VUIVAssetExpiryDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 == -1)
    {
      v13 = (void *)v29[5];
      v29[5] = 0;

      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_2;
      v20[3] = &unk_1E9F2C578;
      objc_copyWeak(&v22, &location);
      v21 = v9;
      dispatch_barrier_async(v7, v20);

      objc_destroyWeak(&v22);
    }
  }
  v14 = (void *)v29[5];
  if (v14)
  {
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_3;
    v17[3] = &unk_1E9F2C578;
    objc_copyWeak(&v19, &location);
    v18 = v9;
    dispatch_barrier_async(v7, v17);

    objc_destroyWeak(&v19);
    v14 = (void *)v29[5];
  }
  v15 = v14;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v28, 8);

  return v15;
}

- (void)updateAssetsFromFiles
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D951F000, v0, v1, "Couldn't remove bad manifest: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

id __38__VUIAssetGroup_updateAssetsFromFiles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("VUIAssetSize"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("VUIAssetLastAccessedDate"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VUIAssetTags"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VUIAssetTags"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("VUIAssetTags"));

    }
    v15 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v18[0] = CFSTR("VUIAssetSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = v5;
    v18[1] = CFSTR("VUIAssetPath");
    v18[2] = CFSTR("VUIAssetLastAccessedDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)_manifestFilePath
{
  void *v2;
  void *v3;

  -[VUIAssetGroup cachePath](self, "cachePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("manifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)cachePath
{
  return self->_cachePath;
}

+ (id)_humanReadableStringForGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E9F2C610[a3];
}

- (VUIAssetGroup)initWithGroupType:(int64_t)a3 baseCachePath:(id)a4 folderName:(id)a5 maxCacheSize:(unint64_t)a6 purgeOnLoad:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  VUIAssetGroup *v14;
  VUIAssetGroup *v15;
  uint64_t v16;
  NSString *cachePath;
  unint64_t v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *cacheRecords;
  NSMutableDictionary *v21;
  NSMutableDictionary *assetKeysByTag;
  void *v23;
  int v24;
  NSString *v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSString *v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  id v35;
  id v36;
  char v37;
  objc_super v38;
  uint8_t buf[4];
  VUIAssetGroup *v40;
  uint64_t v41;

  v7 = a7;
  v41 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v38.receiver = self;
  v38.super_class = (Class)VUIAssetGroup;
  v14 = -[VUIAssetGroup init](&v38, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_groupType = a3;
    objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    cachePath = v15->_cachePath;
    v15->_cachePath = (NSString *)v16;

    v18 = a6 << 20;
    if (!a6)
      v18 = 10485760;
    v15->_maxCacheSize = v18;
    v15->_pruneCount = 10;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cacheRecords = v15->_cacheRecords;
    v15->_cacheRecords = v19;

    v15->_currentCacheSize = 0;
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetKeysByTag = v15->_assetKeysByTag;
    v15->_assetKeysByTag = v21;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v23, "fileExistsAtPath:isDirectory:", v15->_cachePath, &v37);
    if (v37)
      v24 = v7;
    else
      v24 = 1;
    if (v24 == 1)
    {
      v25 = v15->_cachePath;
      v36 = 0;
      objc_msgSend(v23, "removeItemAtPath:error:", v25, &v36);
      v26 = v36;
      if (v26)
      {
        objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[VUIAssetGroup groupType](v15, "groupType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        VUICImageLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:].cold.2();

      }
    }
    v29 = v15->_cachePath;
    v35 = 0;
    objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v35);
    v30 = v35;
    if (v30)
    {
      objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[VUIAssetGroup groupType](v15, "groupType"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      VUICImageLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:].cold.1();

    }
    if ((v24 & 1) == 0)
      -[VUIAssetGroup updateAssetsFromFiles](v15, "updateAssetsFromFiles");
    VUICImageLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_impl(&dword_1D951F000, v33, OS_LOG_TYPE_DEFAULT, "Created a VUIAssetGroup : %@", buf, 0xCu);
    }

  }
  return v15;
}

void __51__VUIAssetGroup__removeAssetInfoForKey_removeFile___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manifest");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("VUIAsset"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("VUIAssetLastAccessedDate"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VUIAssetTags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VUIAssetTags"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("VUIAssetTags"));

  }
  v5 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 40), "manifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));

}

void __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  int8x16_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  int8x16_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(*(id *)(a1 + 40), "_removeAssetInfoForKey:removeFile:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("VUIAssetSize"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("VUIAssetSize"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3[6] = (char *)v3[6] + objc_msgSend(v5, "unsignedLongLongValue");

    }
    objc_msgSend(v3[7], "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VUIAssetTags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v3[8], "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3[8], "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 32));

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v8);
    }

    v13 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_2;
    v35[3] = &unk_1E9F2C2B0;
    v36 = *(id *)(a1 + 48);
    v27 = *(int8x16_t *)(a1 + 32);
    v14 = (id)v27.i64[0];
    v37 = vextq_s8(v27, v27, 8uLL);
    objc_msgSend(v3, "_updateManifestWithChange:", v35);
    if (v3[6] > v3[4])
    {
      VUICImageLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D951F000, v15, OS_LOG_TYPE_DEFAULT, "Current cache size exceeds maximum cache size.  Starting to prune.", buf, 2u);
      }

      objc_msgSend(v3[7], "allKeys");
      v34[0] = v13;
      v34[1] = 3221225472;
      v34[2] = __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_14;
      v34[3] = &unk_1E9F2BCC0;
      v34[4] = v3;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortedArrayUsingComparator:", v34);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        while (2)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_msgSend(v3[7], "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if ((double)(unint64_t)v3[4] * 0.95 > (double)(unint64_t)v3[6])
            {

              goto LABEL_30;
            }
            objc_msgSend(v22, "objectForKey:", CFSTR("VUIAssetPath"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "length"))
              objc_msgSend(*(id *)(a1 + 40), "_removeAssetInfoForKey:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_30:

      VUICImageLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v43 = v26;
        _os_log_impl(&dword_1D951F000, v25, OS_LOG_TYPE_DEFAULT, "Done freeing up cache space. %@", buf, 0xCu);
      }

    }
  }

}

- (void)setManifestDirty:(BOOL)a3
{
  self->_manifestDirty = a3;
}

- (void)setAssetInfo:(id)a3 forKey:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  VUIAssetGroup *v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke;
  block[3] = &unk_1E9F2C528;
  objc_copyWeak(&v17, &location);
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_barrier_sync(v10, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (BOOL)isManifestDirty
{
  return self->_manifestDirty;
}

- (void)_updateManifestWithChange:(id)a3
{
  void (**v4)(_QWORD);
  VUIAssetGroup *v5;
  void *v6;
  void *v7;
  BOOL v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[VUIAssetGroup manifest](v5, "manifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAssetGroup setManifest:](v5, "setManifest:", v7);

  }
  v4[2](v4);
  v8 = -[VUIAssetGroup isManifestDirty](v5, "isManifestDirty");
  -[VUIAssetGroup setManifestDirty:](v5, "setManifestDirty:", 1);
  objc_sync_exit(v5);

  if (!v8)
  {
    objc_initWeak(&location, v5);
    v9 = dispatch_time(0, 60000000000);
    dispatch_get_global_queue(-32768, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__VUIAssetGroup__updateManifestWithChange___block_invoke;
    v11[3] = &unk_1E9F2C070;
    objc_copyWeak(&v12, &location);
    dispatch_after(v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_removeAssetInfoForKey:(id)a3 removeFile:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_cacheRecords, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("VUIAssetPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("VUIAssetSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("VUIAssetSize"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedLongLongValue");

      self->_currentCacheSize -= v12;
    }
    if (objc_msgSend(v9, "length"))
      v13 = !v4;
    else
      v13 = 1;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v15 = objc_msgSend(v14, "removeItemAtPath:error:", v9, &v31);
      v16 = v31;

      if ((v15 & 1) == 0)
      {
        VUICImageLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[VUIAssetGroup _removeAssetInfoForKey:removeFile:].cold.1();

      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_cacheRecords, "removeObjectForKey:", v6);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VUIAssetTags"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_assetKeysByTag, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", v6);
          if (!objc_msgSend(v24, "count"))
            -[NSMutableDictionary removeObjectForKey:](self->_assetKeysByTag, "removeObjectForKey:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v20);
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __51__VUIAssetGroup__removeAssetInfoForKey_removeFile___block_invoke;
    v25[3] = &unk_1E9F2C198;
    v25[4] = self;
    v26 = v6;
    -[VUIAssetGroup _updateManifestWithChange:](self, "_updateManifestWithChange:", v25);

  }
}

uint64_t __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("VUIAssetLastAccessedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKeyPath:", CFSTR("VUIAssetLastAccessedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "compare:", v10);
  return v11;
}

void __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAssetInfoForKey:", *(_QWORD *)(a1 + 32));

}

- (void)removeAssetInfoForKey:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VUIAssetGroup_removeAssetInfoForKey_queue___block_invoke;
  block[3] = &unk_1E9F2C578;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __45__VUIAssetGroup_removeAssetInfoForKey_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAssetInfoForKey:", *(_QWORD *)(a1 + 32));

}

- (void)removeAllAssetsWithQueue:(id)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__VUIAssetGroup_removeAllAssetsWithQueue___block_invoke;
  v5[3] = &unk_1E9F2C070;
  objc_copyWeak(&v6, &location);
  dispatch_barrier_sync(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__VUIAssetGroup_removeAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "_removeAssetInfoForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)infoForAllAssetsWithQueue:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v8;
  id location;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VUIAssetGroup_infoForAllAssetsWithQueue___block_invoke;
  block[3] = &unk_1E9F2C5A0;
  objc_copyWeak(&v8, &location);
  block[4] = &v10;
  dispatch_sync(v4, block);

  v5 = (id)v11[5];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUIAssetGroup_infoForAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[7], "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

- (id)infoForAllAssetsWithTags:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__VUIAssetGroup_infoForAllAssetsWithTags_queue___block_invoke;
  v11[3] = &unk_1E9F2C5C8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = &v16;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v17[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __48__VUIAssetGroup_infoForAllAssetsWithTags_queue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(WeakRetained[8], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v9)
          {

            v6 = 0;
LABEL_16:

            goto LABEL_18;
          }
          if (v6)
          {
            objc_msgSend(v6, "intersectSet:", v9);
            if (!objc_msgSend(v6, "count"))
              goto LABEL_16;
          }
          else
          {
            v6 = (void *)objc_msgSend(v9, "mutableCopy");
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_18:

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
            objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", v17, (_QWORD)v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v14);
      }

      v19 = objc_msgSend(v11, "copy");
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
  }

}

- (void)_removeAssetInfoForKey:(id)a3
{
  -[VUIAssetGroup _removeAssetInfoForKey:removeFile:](self, "_removeAssetInfoForKey:removeFile:", a3, 1);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VUIAssetGroup;
  -[VUIAssetGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", self->_groupType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [Type: %@ MaxCacheSize: %lu Current Cache Size: %lu Current Free Space: %lu CachePath: %@]"), v4, v5, self->_maxCacheSize, self->_currentCacheSize, self->_maxCacheSize - self->_currentCacheSize, self->_cachePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __43__VUIAssetGroup__updateManifestWithChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveManifest");
    WeakRetained = v2;
  }

}

- (void)_saveManifest
{
  OUTLINED_FUNCTION_3(&dword_1D951F000, a2, a3, "Couldn't save manifest: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (void)setCachePath:(id)a3
{
  objc_storeStrong((id *)&self->_cachePath, a3);
}

- (unint64_t)maxCacheSize
{
  return self->_maxCacheSize;
}

- (void)setMaxCacheSize:(unint64_t)a3
{
  self->_maxCacheSize = a3;
}

- (unint64_t)pruneCount
{
  return self->_pruneCount;
}

- (void)setPruneCount:(unint64_t)a3
{
  self->_pruneCount = a3;
}

- (unint64_t)currentCacheSize
{
  return self->_currentCacheSize;
}

- (void)setCurrentCacheSize:(unint64_t)a3
{
  self->_currentCacheSize = a3;
}

- (NSMutableDictionary)cacheRecords
{
  return self->_cacheRecords;
}

- (void)setCacheRecords:(id)a3
{
  objc_storeStrong((id *)&self->_cacheRecords, a3);
}

- (NSMutableDictionary)assetKeysByTag
{
  return self->_assetKeysByTag;
}

- (void)setAssetKeysByTag:(id)a3
{
  objc_storeStrong((id *)&self->_assetKeysByTag, a3);
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_assetKeysByTag, 0);
  objc_storeStrong((id *)&self->_cacheRecords, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
}

- (void)initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D951F000, v0, v1, "VUIAssetGroup failed to create cache path: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D951F000, v0, v1, "VUIAssetGroup failed to purge cache path: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_removeAssetInfoForKey:removeFile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D951F000, v0, v1, "Error removing asset info: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
