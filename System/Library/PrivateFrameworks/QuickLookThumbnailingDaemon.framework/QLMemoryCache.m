@implementation QLMemoryCache

- (void)_releaseReadLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "stop reading", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getReadLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "start reading", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (unint64_t)thumbnailToSaveCount
{
  uint64_t v3;
  NSObject *v4;

  -[QLMemoryCache _getReadLock](self, "_getReadLock");
  v3 = -[NSMutableArray count](self->_thumbnailDataToSave, "count");
  _log_8();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[QLMemoryCache thumbnailToSaveCount].cold.1((uint64_t)self, v3, v4);

  -[QLMemoryCache _releaseReadLock](self, "_releaseReadLock");
  return v3;
}

- (BOOL)sendThumbnailDataForThumbnailRequest:(id)a3 withCacheThread:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v42;
  id v43;
  void *v44;
  QLMemoryCache *v45;
  void *v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_cacheEnabled)
  {
    v35 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _log_8();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[QLMemoryCache sendThumbnailDataForThumbnailRequest:withCacheThread:].cold.1();
    v35 = 0;
    goto LABEL_41;
  }
  objc_msgSend(v8, "maximumPixelSize");
  v12 = v11;
  v13 = objc_msgSend(v8, "iconMode");
  v14 = objc_msgSend(v6, "badgeType");
  v47 = objc_msgSend(v6, "needsLowQualityThumbnailGeneration");
  -[QLMemoryCache _getReadLock](self, "_getReadLock");
  v45 = self;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_thumbnailData, "objectForKeyedSubscript:", v10);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
LABEL_39:
    -[QLMemoryCache _releaseReadLock](v45, "_releaseReadLock");
    v35 = 0;
    v18 = 0;
    goto LABEL_40;
  }
  v44 = v10;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = v46;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (!v16)
  {

    v10 = v44;
    goto LABEL_39;
  }
  v17 = v16;
  v42 = v7;
  v43 = v6;
  v18 = 0;
  v19 = *(_QWORD *)v49;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v49 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      if (v13 == objc_msgSend(v21, "iconMode", v42, v43) && objc_msgSend(v21, "badgeType") == v14)
      {
        v22 = objc_msgSend(v21, "iconVariant");
        if (v22 == objc_msgSend(v8, "iconVariant"))
        {
          v23 = objc_msgSend(v21, "interpolationQuality");
          if (v23 == objc_msgSend(v8, "interpolationQuality"))
          {
            v24 = objc_msgSend(v21, "externalGeneratorDataHash");
            if (v24 == objc_msgSend(v8, "externalThumbnailGeneratorDataHash"))
            {
              objc_msgSend(v21, "size");
              if (v25 == v12)
              {
                v36 = v21;

                v18 = v36;
                goto LABEL_34;
              }
              if (v47)
              {
                objc_msgSend(v8, "minimumDimension");
                if (QLSThumbnailSizeIsSufficientForLowQuality())
                {
                  if (!v18)
                  {
                    v18 = v21;
                    continue;
                  }
                  objc_msgSend(v21, "size");
                  if (v26 <= v12)
                  {
                    objc_msgSend(v21, "size");
                    v32 = v31;
                    -[NSObject size](v18, "size");
                    if (v32 <= v33)
                      continue;
LABEL_24:
                    v34 = v21;

                    v18 = v34;
                    continue;
                  }
                  -[NSObject size](v18, "size");
                  if (v27 < v12)
                    goto LABEL_24;
                  objc_msgSend(v21, "size");
                  v29 = v28;
                  -[NSObject size](v18, "size");
                  if (v29 < v30)
                    goto LABEL_24;
                }
              }
            }
          }
        }
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v17)
      continue;
    break;
  }
LABEL_34:

  v7 = v42;
  v6 = v43;
  v10 = v44;
  if (!v18)
    goto LABEL_39;
  objc_msgSend(v8, "fileIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "version");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSObject version](v18, "version");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqual:", v38);

  if ((v40 & 1) == 0)
  {

    v18 = 0;
  }

  -[QLMemoryCache _releaseReadLock](v45, "_releaseReadLock");
  if (v18)
  {
    objc_msgSend(v42, "_sendThumbnailData:forThumbnailRequest:", v18, v43);
    v35 = 1;
  }
  else
  {
    v35 = 0;
  }
LABEL_40:

LABEL_41:
LABEL_42:

  return v35;
}

- (id)thumbnailDataToSaveWithBatch:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v8;
  NSMutableArray *thumbnailDataToSave;
  int v10;
  QLMemoryCache *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  NSMutableArray *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[QLMemoryCache _getWriteLock](self, "_getWriteLock");
  if (a3 && -[NSMutableArray count](self->_thumbnailDataToSave, "count") >= a3
    || (a3 = -[NSMutableArray count](self->_thumbnailDataToSave, "count")) != 0)
  {
    -[NSMutableArray subarrayWithRange:](self->_thumbnailDataToSave, "subarrayWithRange:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  _log_8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v5, "count");
    thumbnailDataToSave = self->_thumbnailDataToSave;
    v10 = 138413058;
    v11 = self;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = a3;
    v16 = 2112;
    v17 = thumbnailDataToSave;
    _os_log_debug_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_DEBUG, "%@: getting thumbnail data save batch: %lu thumbnails, asked for %lu - total: %@", (uint8_t *)&v10, 0x2Au);
  }

  -[QLMemoryCache _releaseWriteLock](self, "_releaseWriteLock");
  return v5;
}

- (void)_releaseWriteLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "stop Writing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getWriteLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "start Writing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (QLMemoryCache)initWithCacheThread:(id)a3
{
  id v4;
  QLMemoryCache *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *thumbnailData;
  NSMutableArray *v8;
  NSMutableArray *thumbnailDataToSave;
  NSLock *v10;
  NSLock *memoryLock;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLMemoryCache;
  v5 = -[QLMemoryCache init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    thumbnailData = v5->_thumbnailData;
    v5->_thumbnailData = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    thumbnailDataToSave = v5->_thumbnailDataToSave;
    v5->_thumbnailDataToSave = v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    memoryLock = v5->_memoryLock;
    v5->_memoryLock = v10;

    v5->_cacheEnabled = 1;
    objc_storeWeak((id *)&v5->_cacheThread, v4);
  }

  return v5;
}

- (void)reset
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _log_8();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D54AE000, v3, OS_LOG_TYPE_INFO, "Resetting memory cache", buf, 2u);
  }

  -[QLMemoryCache _getWriteLock](self, "_getWriteLock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_thumbnailDataToSave;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setState:", 2, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_thumbnailDataToSave, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_thumbnailData, "removeAllObjects");
  -[QLMemoryCache _releaseWriteLock](self, "_releaseWriteLock");
}

- (void)_invalidateThumbnailData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v13 = 0;
  if (objc_msgSend(v4, "setState:changedState:", 2, &v13) && v13)
  {
    self->_memoryUsed -= objc_msgSend(v4, "totalBufferSize");
    objc_msgSend(v4, "bitmapDataToValidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[QLMemoryCache cacheThread](self, "cacheThread");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "diskCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bitmapDataToValidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "discardReservedBuffer:", v8);

    }
    objc_msgSend(v4, "metadataToValidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[QLMemoryCache cacheThread](self, "cacheThread");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "diskCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadataToValidate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "discardReservedBuffer:", v12);

    }
  }

}

- (BOOL)addThumbnailData:(id)a3
{
  id v4;
  _BOOL4 cacheEnabled;
  NSObject *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  uint64_t i;
  void *v32;
  OS_os_transaction *v33;
  OS_os_transaction *pendingSavesTransaction;
  NSObject *v36;
  int v37;
  void *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  cacheEnabled = self->_cacheEnabled;
  if (!self->_cacheEnabled)
    goto LABEL_25;
  _log_8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "fileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v9 = v8;
    objc_msgSend(v4, "bitmapFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "width");
    objc_msgSend(v4, "bitmapFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138413058;
    v38 = v7;
    v39 = 2048;
    v40 = v9;
    v41 = 2048;
    v42 = v11;
    v43 = 2048;
    v44 = objc_msgSend(v12, "height");
    _os_log_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_INFO, "Adding thumbnail %@ %f (%zd, %zd) to pending saves", (uint8_t *)&v37, 0x2Au);

  }
  objc_msgSend(v4, "fileIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLMemoryCache _getWriteLock](self, "_getWriteLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_thumbnailData, "objectForKeyedSubscript:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thumbnailData, "setObject:forKeyedSubscript:", v14, v13);
  }
  v15 = objc_msgSend(v14, "count");
  if (v15 >= 1)
  {
    v16 = v15;
    objc_msgSend(v4, "version");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if ((v20 & 1) != 0)
    {
      if (v16 >= 2)
      {
        v21 = 0;
        while (1)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "iconMode");
          if (v23 == objc_msgSend(v4, "iconMode"))
          {
            v24 = objc_msgSend(v22, "badgeType");
            if (v24 == objc_msgSend(v4, "badgeType"))
            {
              v25 = objc_msgSend(v22, "iconVariant");
              if (v25 == objc_msgSend(v4, "iconVariant"))
              {
                v26 = objc_msgSend(v22, "interpolationQuality");
                if (v26 == objc_msgSend(v4, "interpolationQuality"))
                {
                  v27 = objc_msgSend(v22, "externalGeneratorDataHash");
                  if (v27 == objc_msgSend(v4, "externalGeneratorDataHash"))
                  {
                    objc_msgSend(v22, "size");
                    v29 = v28;
                    objc_msgSend(v4, "size");
                    if (v29 == v30)
                      break;
                  }
                }
              }
            }
          }

          if (v16 == ++v21)
            goto LABEL_21;
        }
        _log_8();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          -[QLMemoryCache addThumbnailData:].cold.1(v22, v36);

        -[QLMemoryCache _invalidateThumbnailData:](self, "_invalidateThumbnailData:", v22);
        -[NSMutableArray removeObject:](self->_thumbnailDataToSave, "removeObject:", v22);
        objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v21, v4);

        goto LABEL_22;
      }
    }
    else
    {
      for (i = 0; i != v16; ++i)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLMemoryCache _invalidateThumbnailData:](self, "_invalidateThumbnailData:", v32);

      }
      -[NSMutableArray removeObjectsInArray:](self->_thumbnailDataToSave, "removeObjectsInArray:", v14);
      objc_msgSend(v14, "removeAllObjects");
    }
  }
LABEL_21:
  objc_msgSend(v14, "addObject:", v4);
LABEL_22:
  self->_memoryUsed += objc_msgSend(v4, "totalBufferSize");
  if (!self->_pendingSavesTransaction)
  {
    v33 = (OS_os_transaction *)os_transaction_create();
    pendingSavesTransaction = self->_pendingSavesTransaction;
    self->_pendingSavesTransaction = v33;

  }
  -[NSMutableArray addObject:](self->_thumbnailDataToSave, "addObject:", v4);
  -[QLMemoryCache _releaseWriteLock](self, "_releaseWriteLock");

LABEL_25:
  return cacheEnabled;
}

- (void)thumbnailDataBatchSaved:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *thumbnailData;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  float v22;
  OS_os_transaction *pendingSavesTransaction;
  __int128 v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  double v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[QLMemoryCache _getWriteLock](self, "_getWriteLock");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v27;
    *(_QWORD *)&v7 = 138412546;
    v24 = v7;
    obj = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        _log_8();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "fileIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "size");
          *(_DWORD *)buf = v24;
          v31 = v21;
          v32 = 2048;
          v33 = v22;
          _os_log_debug_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_DEBUG, "thumbnail saved %@ %f", buf, 0x16u);

        }
        -[NSMutableArray removeObject:](self->_thumbnailDataToSave, "removeObject:", v11);
        thumbnailData = self->_thumbnailData;
        objc_msgSend(v11, "fileIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](thumbnailData, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v15, "count");
          if (v16 >= 1)
          {
            v17 = 0;
            while (1)
            {
              objc_msgSend(v15, "objectAtIndexedSubscript:", v17, v24);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11 == v18)
                break;
              if (v16 == ++v17)
                goto LABEL_17;
            }
            objc_msgSend(v15, "removeObjectAtIndex:", v17);
            self->_memoryUsed -= objc_msgSend(v11, "totalBufferSize");
            --v16;
          }
          if (!v16)
          {
            v19 = self->_thumbnailData;
            objc_msgSend(v11, "fileIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", 0, v20);

          }
        }
LABEL_17:

        ++v10;
      }
      while (v10 != v8);
      v5 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v8);
  }

  if (!-[NSMutableArray count](self->_thumbnailDataToSave, "count"))
  {
    pendingSavesTransaction = self->_pendingSavesTransaction;
    self->_pendingSavesTransaction = 0;

  }
  -[QLMemoryCache _releaseWriteLock](self, "_releaseWriteLock", v24);

}

- (BOOL)hasThumbnailDataToSave
{
  return -[QLMemoryCache thumbnailToSaveCount](self, "thumbnailToSaveCount") != 0;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *thumbnailData;
  uint64_t v7;
  id v8;
  id v9;
  NSMutableArray *thumbnailDataToSave;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  QLMemoryCache *v20;

  v4 = a3;
  -[QLMemoryCache _getWriteLock](self, "_getWriteLock");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  thumbnailData = self->_thumbnailData;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke;
  v17[3] = &unk_1E99D3AD0;
  v8 = v4;
  v18 = v8;
  v19 = v5;
  v20 = self;
  v13 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](thumbnailData, "enumerateKeysAndObjectsUsingBlock:", v17);
  -[NSMutableDictionary removeObjectsForKeys:](self->_thumbnailData, "removeObjectsForKeys:", v13);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  thumbnailDataToSave = self->_thumbnailDataToSave;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke_2;
  v14[3] = &unk_1E99D3AF8;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](thumbnailDataToSave, "enumerateObjectsUsingBlock:", v14);
  -[NSMutableArray removeObjectsAtIndexes:](self->_thumbnailDataToSave, "removeObjectsAtIndexes:", v11);
  -[QLMemoryCache _releaseWriteLock](self, "_releaseWriteLock");

}

void __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerDomainID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v10);

    if ((v8 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "setState:", 2, (_QWORD)v17);
          objc_msgSend(*(id *)(a1 + 48), "setMemoryUsed:", objc_msgSend(*(id *)(a1 + 48), "memoryUsed") - objc_msgSend(v16, "totalBufferSize"));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

void __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "fileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "fileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v8, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v11);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
      objc_msgSend(v12, "setState:", 2);
    }

    v7 = v12;
  }

}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *thumbnailData;
  uint64_t v7;
  id v8;
  id v9;
  NSMutableArray *thumbnailDataToSave;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  QLMemoryCache *v20;

  v4 = a3;
  -[QLMemoryCache _getWriteLock](self, "_getWriteLock");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  thumbnailData = self->_thumbnailData;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke;
  v17[3] = &unk_1E99D3AD0;
  v8 = v4;
  v18 = v8;
  v19 = v5;
  v20 = self;
  v13 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](thumbnailData, "enumerateKeysAndObjectsUsingBlock:", v17);
  -[NSMutableDictionary removeObjectsForKeys:](self->_thumbnailData, "removeObjectsForKeys:", v13);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  thumbnailDataToSave = self->_thumbnailDataToSave;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke_2;
  v14[3] = &unk_1E99D3AF8;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](thumbnailDataToSave, "enumerateObjectsUsingBlock:", v14);
  -[NSMutableArray removeObjectsAtIndexes:](self->_thumbnailDataToSave, "removeObjectsAtIndexes:", v11);
  -[QLMemoryCache _releaseWriteLock](self, "_releaseWriteLock");

}

void __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerDomainID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "containsObject:", v10);

    if ((_DWORD)v8)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "setState:", 2, (_QWORD)v17);
          objc_msgSend(*(id *)(a1 + 48), "setMemoryUsed:", objc_msgSend(*(id *)(a1 + 48), "memoryUsed") - objc_msgSend(v16, "totalBufferSize"));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

void __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "fileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "fileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v8, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v11);

    if ((_DWORD)v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
      objc_msgSend(v12, "setState:", 2);
    }

    v7 = v12;
  }

}

- (unint64_t)memoryUsed
{
  return self->_memoryUsed;
}

- (void)setMemoryUsed:(unint64_t)a3
{
  self->_memoryUsed = a3;
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_loadWeakRetained((id *)&self->_cacheThread);
}

- (void)setCacheThread:(id)a3
{
  objc_storeWeak((id *)&self->_cacheThread, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheThread);
  objc_storeStrong((id *)&self->_pendingSavesTransaction, 0);
  objc_storeStrong((id *)&self->_memoryLock, 0);
  objc_storeStrong((id *)&self->_thumbnailDataToSave, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
}

- (void)addThumbnailData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  float v5;
  int v6;
  void *v7;
  __int16 v8;
  double v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "size");
  v6 = 138412802;
  v7 = v4;
  v8 = 2048;
  v9 = v5;
  v10 = 2080;
  v11 = " (replacing same)";
  _os_log_debug_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_DEBUG, "Removing thumbnail %@ %f from pending saves to limit number of saves%s", (uint8_t *)&v6, 0x20u);

}

- (void)sendThumbnailDataForThumbnailRequest:withCacheThread:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_ERROR, "Thumbnail request with no real path was sent to cache", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)thumbnailToSaveCount
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_1D54AE000, log, OS_LOG_TYPE_DEBUG, "%@: thumbnail left to be saved %ld", (uint8_t *)&v3, 0x16u);
}

@end
