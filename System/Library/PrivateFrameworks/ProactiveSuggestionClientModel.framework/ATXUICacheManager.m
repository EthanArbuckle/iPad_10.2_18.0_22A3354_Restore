@implementation ATXUICacheManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
}

- (id)cachedLayoutForConsumerSubType:(unsigned __int8)a3 expectedClass:(Class)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXUICacheManager cacheFilePathForConsumerSubType:](self, "cacheFilePathForConsumerSubType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUICacheManager dataFromFileHandle:](self, "dataFromFileHandle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend([a4 alloc], "initWithProtoData:", v8);
    v10 = v9;
    if (v9
      && objc_msgSend(v9, "conformsToProtocol:", &unk_1EEB89580)
      && objc_msgSend(v10, "conformsToProtocol:", &unk_1EEB89A08)
      && (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEB8A630) & 1) != 0)
    {
      v11 = v10;
    }
    else
    {
      __atxlog_handle_blending();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "Blending: Unable to deserialize data retrieved from cache file with path %@", (uint8_t *)&v14, 0xCu);
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dataFromFileHandle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA841000, v4, OS_LOG_TYPE_DEFAULT, "Blending: Reading cache file to retrieve UI layout", buf, 2u);
  }

  if (v3)
  {
    v11 = 0;
    objc_msgSend(v3, "readDataToEndOfFileAndReturnError:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v7 = v6;
    if (!v5 || v6)
    {
      __atxlog_handle_blending();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXUICacheManager dataFromFileHandle:].cold.1();

      v8 = 0;
    }
    else
    {
      v8 = v5;
    }

  }
  else
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Not reading UI layout from cache because fileHandle is nil. The file could have been deleted if there are no valid layouts for the consumer.", v12, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)cacheFilePathForConsumerSubType:(unsigned __int8)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUICacheManager cacheFilePathForConsumerSubTypeString:](self, "cacheFilePathForConsumerSubTypeString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cacheFilePathForConsumerSubTypeString:(id)a3
{
  return -[NSString stringByAppendingPathComponent:](self->_cacheBasePath, "stringByAppendingPathComponent:", a3);
}

- (ATXUICacheManager)init
{
  void *v3;
  ATXUICacheManager *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "uiCachesRootDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXUICacheManager initWithCacheBasePath:](self, "initWithCacheBasePath:", v3);

  return v4;
}

- (ATXUICacheManager)initWithCacheBasePath:(id)a3
{
  id v4;
  ATXUICacheManager *v5;
  uint64_t v6;
  NSString *cacheBasePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUICacheManager;
  v5 = -[ATXUICacheManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cacheBasePath = v5->_cacheBasePath;
    v5->_cacheBasePath = (NSString *)v6;

  }
  return v5;
}

- (id)consumerSubTypeStringsWithNonEmptyCachedLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", self->_cacheBasePath, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1AF421DC4]();
          v15 = 0;
          objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v11, &v15);
          if (v15)
            objc_msgSend(v3, "addObject:", v11);
          objc_autoreleasePoolPop(v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v13 = v3;
  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (double)cacheAgeForConsumerSubTypeString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[ATXUICacheManager cacheFilePathForConsumerSubTypeString:](self, "cacheFilePathForConsumerSubTypeString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = -v7;

  return v8;
}

- (BOOL)updateCachedLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Trying to update cached layout for consumer %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    -[ATXUICacheManager serializeLayout:](self, "serializeLayout:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[ATXUICacheManager cacheFilePathForConsumerSubType:](self, "cacheFilePathForConsumerSubType:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ATXUICacheManager writeSerializedDataToCacheFile:path:](self, "writeSerializedDataToCacheFile:path:", v9, v10);

      if (v11)
      {
        v12 = 1;
LABEL_13:

        goto LABEL_14;
      }
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXUICacheManager updateCachedLayout:consumerSubType:].cold.2();
    }
    else
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXUICacheManager updateCachedLayout:consumerSubType:].cold.1();
    }

    v12 = 0;
    goto LABEL_13;
  }
  v12 = -[ATXUICacheManager deleteCacheFileForConsumerSubType:](self, "deleteCacheFileForConsumerSubType:", v4);
LABEL_14:

  return v12;
}

- (BOOL)deleteCacheFileForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  -[ATXUICacheManager cacheFilePathForConsumerSubType:](self, "cacheFilePathForConsumerSubType:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v7 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v17);
  v8 = v17;
  v9 = v8;
  if (!v8)
    v7 = 1;
  if ((v7 & 1) != 0)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "Blending: Deleted file at path: %@ for UI consumer: %@", buf, 0x16u);

    }
    notify_post((const char *)objc_msgSend(CFSTR("kATXUICacheManagerDidUpdateDarwinNotification"), "UTF8String"));
  }
  else
  {
    objc_msgSend(v8, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "code");

    if (v14 != 2)
    {
      __atxlog_handle_blending();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v6;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_1AA841000, v15, OS_LOG_TYPE_DEFAULT, "Blending: Failed to delete file at path: %@ with error: %@", buf, 0x16u);
      }

    }
  }

  return v7;
}

- (BOOL)writeSerializedDataToCacheFile:(id)a3 path:(id)a4
{
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[8];
  id v10;

  v10 = 0;
  v4 = objc_msgSend(a3, "writeToFile:options:error:", a4, 1073741825, &v10);
  v5 = v10;
  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Finished writing layout data.", v9, 2u);
    }

    notify_post((const char *)objc_msgSend(CFSTR("kATXUICacheManagerDidUpdateDarwinNotification"), "UTF8String"));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXUICacheManager writeSerializedDataToCacheFile:path:].cold.1();

  }
  return v4;
}

- (id)serializeLayout:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;

  objc_msgSend(a3, "encodeAsProto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    __atxlog_handle_blending();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXUICacheManager serializeLayout:].cold.1(v6);

  }
  return v4;
}

- (void)updateCachedLayout:consumerSubType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Blending: Failed to serialize suggestion for consumer %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)updateCachedLayout:consumerSubType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Blending: Failed to write suggestion to cache file for consumer %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)writeSerializedDataToCacheFile:path:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1AA841000, v0, OS_LOG_TYPE_FAULT, "Blending: Could not write layout data. Error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)dataFromFileHandle:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1AA841000, v1, OS_LOG_TYPE_ERROR, "Blending: Unable to read data from file handle %@ - %@", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)serializeLayout:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "Blending: Unable to serialize layout.", v1, 2u);
}

@end
