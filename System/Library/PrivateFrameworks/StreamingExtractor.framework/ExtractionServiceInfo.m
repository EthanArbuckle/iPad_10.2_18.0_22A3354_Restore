@implementation ExtractionServiceInfo

+ (id)extractionServiceInfoForPluginBundlePath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ExtractionServiceInfo *v9;
  NSObject *v11;

  v4 = a3;
  if (v4)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = (void *)_sExtractionServiceDict;
    if (_sExtractionServiceDict
      || (objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1),
          v7 = objc_claimAutoreleasedReturnValue(),
          v8 = (void *)_sExtractionServiceDict,
          _sExtractionServiceDict = v7,
          v8,
          (v6 = (void *)_sExtractionServiceDict) != 0))
    {
      objc_msgSend(v6, "objectForKey:", v4);
      v9 = (ExtractionServiceInfo *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v9 = -[ExtractionServiceInfo initWithPluginBundlePath:]([ExtractionServiceInfo alloc], "initWithPluginBundlePath:", v4);
        if (v9)
          objc_msgSend((id)_sExtractionServiceDict, "setValue:forKey:", v9, v4);
      }
    }
    else
    {
      STGetLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:].cold.2();

      v9 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    STGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (ExtractionServiceInfo)initWithPluginBundlePath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ExtractionServiceInfo *v7;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ExtractionServiceInfo initWithUUID:pluginBundlePath:](self, "initWithUUID:pluginBundlePath:", v6, v5);

  return v7;
}

- (ExtractionServiceInfo)initWithUUID:(id)a3 pluginBundlePath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ExtractionServiceInfo *v10;
  ExtractionServiceInfo *v11;
  NSObject *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    STGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:].cold.1();
    goto LABEL_10;
  }
  if (!v8)
  {
    STGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:].cold.2();
LABEL_10:

LABEL_13:
    v11 = 0;
    goto LABEL_5;
  }
  v14.receiver = self;
  v14.super_class = (Class)ExtractionServiceInfo;
  v10 = -[ExtractionServiceInfo init](&v14, sel_init);
  if (!v10)
  {
    STGetLogHandle();
    self = (ExtractionServiceInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:].cold.3();
    goto LABEL_13;
  }
  v11 = v10;
  objc_storeStrong((id *)&v10->_uuid, a3);
  objc_storeStrong((id *)&v11->_pluginBundlePath, a4);
  v11->_availableExtractionServiceMemory = 52428800;
  pthread_mutex_init(&v11->_availableExtractionServiceMemoryMutex, 0);
  pthread_cond_init(&v11->_availableExtractionServiceMemoryCondition, 0);
LABEL_5:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_availableExtractionServiceMemoryMutex);
  pthread_cond_destroy(&self->_availableExtractionServiceMemoryCondition);
  v3.receiver = self;
  v3.super_class = (Class)ExtractionServiceInfo;
  -[ExtractionServiceInfo dealloc](&v3, sel_dealloc);
}

- (id)reserveExtractionMemory:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t availableExtractionServiceMemory;
  NSObject *v12;
  unint64_t v13;
  int v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "requiredExtractionMemory");
  if (v5)
  {
    v6 = v5;
    STGetLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 >= 0x3200001)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ExtractionServiceInfo reserveExtractionMemory:].cold.2();

      v23 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("num required bytes (%zu) > max allowed extraction memory (%d)"), v6, 52428800);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = STCreateError(v23, 11, v24, 0, (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1351);

      v17 = 0;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
        v28 = 2048;
        v29 = v6;
        _os_log_impl(&dword_2144F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %zu bytes", buf, 0x16u);
      }

      pthread_mutex_lock(&self->_availableExtractionServiceMemoryMutex);
      if (v6 <= objc_msgSend(v4, "reservedExtractionMemory"))
      {
        v17 = 0;
      }
      else
      {
        v9 = v6 - objc_msgSend(v4, "reservedExtractionMemory");
        while (self->_availableExtractionServiceMemory < v9)
        {
          if ((objc_msgSend(v4, "isInvalid") & 1) != 0)
            break;
          STGetLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            availableExtractionServiceMemory = self->_availableExtractionServiceMemory;
            *(_DWORD *)buf = 136446722;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            v28 = 2048;
            v29 = v9;
            v30 = 2048;
            v31 = availableExtractionServiceMemory;
            _os_log_impl(&dword_2144F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: waiting for available extraction memory (need [%zu] - avail [%zu])", buf, 0x20u);
          }

          pthread_cond_wait(&self->_availableExtractionServiceMemoryCondition, &self->_availableExtractionServiceMemoryMutex);
          STGetLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = self->_availableExtractionServiceMemory;
            v14 = objc_msgSend(v4, "isInvalid");
            *(_DWORD *)buf = 136446978;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            v28 = 2048;
            v29 = v9;
            v30 = 2048;
            v31 = v13;
            v32 = 1024;
            v33 = v14 ^ 1;
            _os_log_impl(&dword_2144F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: available memory notification (need [%zu] - avail [%zu] - isValid [%d]", buf, 0x26u);
          }

        }
        if ((objc_msgSend(v4, "isInvalid") & 1) != 0)
        {
          v15 = STExtractorErrorDomain;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("STRemoteExtractor became invalid while waiting for extraction memory reservation"));
          v16 = objc_claimAutoreleasedReturnValue();
          STCreateError(v15, 11, v16, 0, (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1374);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          self->_availableExtractionServiceMemory -= v9;
          objc_msgSend(v4, "setReservedExtractionMemory:", objc_msgSend(v4, "reservedExtractionMemory") + v9);
          STGetLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v18 = self->_availableExtractionServiceMemory;
            *(_DWORD *)buf = 136446722;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            v28 = 2048;
            v29 = v6;
            v30 = 2048;
            v31 = v18;
            _os_log_impl(&dword_2144F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: Got extraction memory reservation [%zu] - %zu bytes still available", buf, 0x20u);
          }
          v17 = 0;
        }

      }
      pthread_mutex_unlock(&self->_availableExtractionServiceMemoryMutex);
    }
  }
  else
  {
    STGetLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ExtractionServiceInfo reserveExtractionMemory:].cold.1();

    v21 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("required extraction memory == 0"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v21, 11, v22, 0, (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1350);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (void)releaseExtractionMemory:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t availableExtractionServiceMemory;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pthread_mutex_lock(&self->_availableExtractionServiceMemoryMutex);
  if (objc_msgSend(v4, "reservedExtractionMemory"))
  {
    v5 = objc_msgSend(v4, "reservedExtractionMemory");
    self->_availableExtractionServiceMemory += v5;
    objc_msgSend(v4, "setReservedExtractionMemory:", 0);
    STGetLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      availableExtractionServiceMemory = self->_availableExtractionServiceMemory;
      v8 = 136446722;
      v9 = "-[ExtractionServiceInfo releaseExtractionMemory:]";
      v10 = 2048;
      v11 = v5;
      v12 = 2048;
      v13 = availableExtractionServiceMemory;
      _os_log_impl(&dword_2144F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Releasing extraction memory reservation [%zu] - %zu bytes available", (uint8_t *)&v8, 0x20u);
    }

    pthread_cond_signal(&self->_availableExtractionServiceMemoryCondition);
  }
  pthread_mutex_unlock(&self->_availableExtractionServiceMemoryMutex);

}

- (void)extractionBecameInvalid
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  STGetLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[ExtractionServiceInfo extractionBecameInvalid]";
    _os_log_impl(&dword_2144F0000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Extraction invalid - signaling to allow possible thread waiting for extraction memory to return", (uint8_t *)&v4, 0xCu);
  }

  pthread_cond_broadcast(&self->_availableExtractionServiceMemoryCondition);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)pluginBundlePath
{
  return self->_pluginBundlePath;
}

- (unint64_t)availableExtractionServiceMemory
{
  return self->_availableExtractionServiceMemory;
}

- (void)setAvailableExtractionServiceMemory:(unint64_t)a3
{
  self->_availableExtractionServiceMemory = a3;
}

- (_opaque_pthread_mutex_t)availableExtractionServiceMemoryMutex
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[2].__sig;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (_opaque_pthread_cond_t)availableExtractionServiceMemoryCondition
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[8];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundlePath, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)extractionServiceInfoForPluginBundlePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)extractionServiceInfoForPluginBundlePath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithUUID:pluginBundlePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithUUID:pluginBundlePath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithUUID:pluginBundlePath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)reserveExtractionMemory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)reserveExtractionMemory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

@end
