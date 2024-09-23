@implementation _TVAssetGroup

- (_TVAssetGroup)initWithGroupType:(int64_t)a3 baseCachePath:(id)a4 folderName:(id)a5 maxCacheSize:(unint64_t)a6 purgeOnLoad:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  _TVAssetGroup *v14;
  _TVAssetGroup *v15;
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
  NSString *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v33;
  id v34;
  char v35;
  objc_super v36;
  uint8_t buf[4];
  _TVAssetGroup *v38;
  uint64_t v39;

  v7 = a7;
  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_TVAssetGroup;
  v14 = -[_TVAssetGroup init](&v36, sel_init);
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
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cacheRecords = v15->_cacheRecords;
    v15->_cacheRecords = v19;

    v15->_currentCacheSize = 0;
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetKeysByTag = v15->_assetKeysByTag;
    v15->_assetKeysByTag = v21;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v23, "fileExistsAtPath:isDirectory:", v15->_cachePath, &v35);
    if (v35)
      v24 = v7;
    else
      v24 = 1;
    if (v24 == 1)
    {
      v25 = v15->_cachePath;
      v34 = 0;
      objc_msgSend(v23, "removeItemAtPath:error:", v25, &v34);
      v26 = v34;
      if (v26)
      {
        objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[_TVAssetGroup groupType](v15, "groupType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
          -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:].cold.2();

      }
    }
    v28 = v15->_cachePath;
    v33 = 0;
    objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, 0, &v33);
    v29 = v33;
    if (v29)
    {
      objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[_TVAssetGroup groupType](v15, "groupType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
        -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:].cold.1();

    }
    if ((v24 & 1) == 0)
      -[_TVAssetGroup updateAssetsFromFiles](v15, "updateAssetsFromFiles");
    v31 = TVMLKitImageLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v15;
      _os_log_impl(&dword_222D98000, v31, OS_LOG_TYPE_DEFAULT, "Created a _TVAssetGroup : %@", buf, 0xCu);
    }

  }
  return v15;
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
  _TVAssetGroup *v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke;
  block[3] = &unk_24EB88058;
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
  v31 = __Block_byref_object_copy__7;
  v32 = __Block_byref_object_dispose__7;
  v33 = 0;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39___TVAssetGroup_assetInfoForKey_queue___block_invoke;
  block[3] = &unk_24EB88080;
  objc_copyWeak(&v26, &location);
  v25 = &v28;
  v9 = v6;
  v24 = v9;
  dispatch_sync(v7, block);
  objc_msgSend((id)v29[5], "objectForKey:", CFSTR("ATVAssetExpiryDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 == -1)
    {
      v13 = (void *)v29[5];
      v29[5] = 0;

      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_2;
      v20[3] = &unk_24EB85398;
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
    v17[2] = __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_3;
    v17[3] = &unk_24EB85398;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___TVAssetGroup_removeAssetInfoForKey_queue___block_invoke;
  block[3] = &unk_24EB85398;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)removeAllAssetsWithQueue:(id)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42___TVAssetGroup_removeAllAssetsWithQueue___block_invoke;
  v5[3] = &unk_24EB854F8;
  objc_copyWeak(&v6, &location);
  dispatch_barrier_sync(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
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
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43___TVAssetGroup_infoForAllAssetsWithQueue___block_invoke;
  block[3] = &unk_24EB880A8;
  objc_copyWeak(&v8, &location);
  block[4] = &v10;
  dispatch_sync(v4, block);

  v5 = (id)v11[5];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);

  return v5;
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
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48___TVAssetGroup_infoForAllAssetsWithTags_queue___block_invoke;
  v11[3] = &unk_24EB880D0;
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

- (void)_removeAssetInfoForKey:(id)a3
{
  -[_TVAssetGroup _removeAssetInfoForKey:removeFile:](self, "_removeAssetInfoForKey:removeFile:", a3, 1);
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
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_cacheRecords, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("ATVAssetPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ATVAssetSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ATVAssetSize"));
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
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v15 = objc_msgSend(v14, "removeItemAtPath:error:", v9, &v30);
      v16 = v30;

      if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
        -[_TVAssetGroup _removeAssetInfoForKey:removeFile:].cold.1();

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cacheRecords, "removeObjectForKey:", v6);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ATVAssetTags"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_assetKeysByTag, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObject:", v6);
          if (!objc_msgSend(v23, "count"))
            -[NSMutableDictionary removeObjectForKey:](self->_assetKeysByTag, "removeObjectForKey:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __51___TVAssetGroup__removeAssetInfoForKey_removeFile___block_invoke;
    v24[3] = &unk_24EB848C0;
    v24[4] = self;
    v25 = v6;
    -[_TVAssetGroup _updateManifestWithChange:](self, "_updateManifestWithChange:", v24);

  }
}

- (void)updateAssetsFromFiles
{
  OUTLINED_FUNCTION_3_1(&dword_222D98000, a2, a3, "Couldn't read manifest: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_TVAssetGroup;
  -[_TVAssetGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", self->_groupType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [Type: %@ MaxCacheSize: %lu Current Cache Size: %lu Current Free Space: %lu CachePath: %@]"), v4, v5, self->_maxCacheSize, self->_currentCacheSize, self->_maxCacheSize - self->_currentCacheSize, self->_cachePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateManifestWithChange:(id)a3
{
  void (**v4)(_QWORD);
  _TVAssetGroup *v5;
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
  -[_TVAssetGroup manifest](v5, "manifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAssetGroup setManifest:](v5, "setManifest:", v7);

  }
  v4[2](v4);
  v8 = -[_TVAssetGroup isManifestDirty](v5, "isManifestDirty");
  -[_TVAssetGroup setManifestDirty:](v5, "setManifestDirty:", 1);
  objc_sync_exit(v5);

  if (!v8)
  {
    objc_initWeak(&location, v5);
    v9 = dispatch_time(0, 60000000000);
    dispatch_get_global_queue(-32768, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43___TVAssetGroup__updateManifestWithChange___block_invoke;
    v11[3] = &unk_24EB854F8;
    objc_copyWeak(&v12, &location);
    dispatch_after(v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_saveManifest
{
  OUTLINED_FUNCTION_3_1(&dword_222D98000, a2, a3, "Couldn't save manifest: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (id)_humanReadableStringForGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return off_24EB88118[a3];
}

- (id)_manifestFilePath
{
  void *v2;
  void *v3;

  -[_TVAssetGroup cachePath](self, "cachePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("manifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (NSString)cachePath
{
  return self->_cachePath;
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

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (BOOL)isManifestDirty
{
  return self->_manifestDirty;
}

- (void)setManifestDirty:(BOOL)a3
{
  self->_manifestDirty = a3;
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

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_222D98000, v0, v1, "_TVAssetGroup failed to create cache path: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_222D98000, v0, v1, "_TVAssetGroup failed to purge cache path: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_removeAssetInfoForKey:removeFile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_222D98000, v0, v1, "Error removing asset info: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
