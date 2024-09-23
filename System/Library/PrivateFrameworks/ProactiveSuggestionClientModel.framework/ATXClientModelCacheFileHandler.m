@implementation ATXClientModelCacheFileHandler

- (id)readSuggestionsFromCache
{
  NSObject *v3;
  NSString *clientModelId;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clientModelId = self->_clientModelId;
    v9 = 138412290;
    v10 = clientModelId;
    _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "Blending: Retrieving suggestions for client model: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_opt_class();
  -[ATXClientModelCacheFileHandler readOnlyFileHandleForSuggestionsCache](self, "readOnlyFileHandleForSuggestionsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readSuggestionsFromCacheFromReadOnlyFileHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)readOnlyFileHandleForSuggestionsCache
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3608];
  -[ATXClientModelCacheFileHandler cacheFilePath](self, "cacheFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileHandleForReadingAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)deleteCachedSuggestionsFile
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelCacheFileHandler cacheFilePath](self, "cacheFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v16);
  v6 = v16;
  v7 = v6;
  if (!v6)
    v5 = 1;
  if ((v5 & 1) != 0)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      v9 = "Blending: Deleted file at path: %@";
      v10 = v8;
      v11 = 12;
LABEL_9:
      _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "code");

  if (v14 != 2)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v7;
      v9 = "Blending: Failed to delete file at path: %@ with error: %@";
      v10 = v8;
      v11 = 22;
      goto LABEL_9;
    }
LABEL_10:

  }
  return v5;
}

- (id)cacheFilePath
{
  return -[NSString stringByAppendingPathComponent:](self->_cacheFileBasePath, "stringByAppendingPathComponent:", self->_clientModelId);
}

+ (id)readSuggestionsFromCacheFromReadOnlyFileHandle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  ATXClientModelCacheUpdate *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  ATXClientModelCacheUpdate *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "unarchiveCacheFileFromReadOnlyFileHandle:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x1AF421DC4]();
      v6 = -[ATXClientModelCacheUpdate initWithProtoData:]([ATXClientModelCacheUpdate alloc], "initWithProtoData:", v4);
      objc_autoreleasePoolPop(v5);
      __atxlog_handle_blending();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          -[ATXClientModelCacheUpdate suggestions](v6, "suggestions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 134217984;
          v13 = objc_msgSend(v9, "count");
          _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Deserialized to get %lu suggestions.", (uint8_t *)&v12, 0xCu);

        }
        v6 = v6;
        v10 = v6;
      }
      else
      {
        if (v8)
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Unable to deserialize data retrieved from the cache file.", (uint8_t *)&v12, 2u);
        }

        v10 = 0;
      }
    }
    else
    {
      __atxlog_handle_blending();
      v6 = (ATXClientModelCacheUpdate *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1AA841000, &v6->super, OS_LOG_TYPE_DEFAULT, "Blending: Unable to unarchive cache file.", (uint8_t *)&v12, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    __atxlog_handle_blending();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1AA841000, v4, OS_LOG_TYPE_DEFAULT, "Blending: Unable to acquire readonly handle to cache file. Not reading suggestions from cache.", (uint8_t *)&v12, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (ATXClientModelCacheFileHandler)initWithCacheFileBasePath:(id)a3 clientModelId:(id)a4
{
  id v7;
  id v8;
  ATXClientModelCacheFileHandler *v9;
  ATXClientModelCacheFileHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXClientModelCacheFileHandler;
  v9 = -[ATXClientModelCacheFileHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheFileBasePath, a3);
    objc_storeStrong((id *)&v10->_clientModelId, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_cacheFileBasePath, 0);
}

+ (id)clientModelIdFromFileName:(id)a3
{
  return a3;
}

- (BOOL)createCacheFileForClientModelCacheUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF421DC4]();
  -[ATXClientModelCacheFileHandler serializeSuggestionsData:](self, "serializeSuggestionsData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[ATXClientModelCacheFileHandler writeSerializedDataToCacheFile:](self, "writeSerializedDataToCacheFile:", v6);
  else
    v7 = 0;

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)serializeSuggestionsData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "setFeedbackMetadata:", 0);
  objc_msgSend(v4, "encodeAsProto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXClientModelCacheFileHandler serializeSuggestionsData:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);

  }
  return v5;
}

- (BOOL)writeSerializedDataToCacheFile:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;

  v4 = a3;
  -[ATXClientModelCacheFileHandler cacheFilePath](self, "cacheFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v4, "writeToFile:options:error:", v5, 1073741825, &v10);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXClientModelCacheFileHandler writeSerializedDataToCacheFile:].cold.1((uint64_t)self, (uint64_t)v7, v8);

  }
  return v6;
}

+ (id)unarchiveCacheFileFromReadOnlyFileHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v15 = 0;
  objc_msgSend(a3, "readDataToEndOfFileAndReturnError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (v3)
  {
    v6 = v3;
  }
  else if (objc_msgSend(v4, "code") != 260)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXClientModelCacheFileHandler unarchiveCacheFileFromReadOnlyFileHandle:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
  return v3;
}

- (void)serializeSuggestionsData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "Blending: <<%@>> Unable to serialize proactive suggestion data.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)writeSerializedDataToCacheFile:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "Blending: <<%@>> Could not write client model cache update data for client model. Error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)unarchiveCacheFileFromReadOnlyFileHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "Blending: Error reading the read only handle: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
