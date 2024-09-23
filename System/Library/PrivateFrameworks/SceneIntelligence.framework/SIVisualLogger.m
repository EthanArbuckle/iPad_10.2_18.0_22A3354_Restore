@implementation SIVisualLogger

+ (id)frameworkPrefix
{
  return CFSTR("si");
}

+ (id)sharedLogger
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SIVisualLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SIVisualLogger sharedLogger]::onceToken != -1)
    dispatch_once(&+[SIVisualLogger sharedLogger]::onceToken, block);
  return (id)+[SIVisualLogger sharedLogger]::sharedLogger;
}

void __30__SIVisualLogger_sharedLogger__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[SIVisualLogger sharedLogger]::sharedLogger;
  +[SIVisualLogger sharedLogger]::sharedLogger = (uint64_t)v1;

}

- (SIVisualLogger)init
{
  SIVisualLogger *v2;
  uint64_t v3;
  NSSet *v4;
  NSSet *registeredSubloggers;
  SIVisualLogger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SIVisualLogger;
  v2 = -[SIVisualLogger init](&v8, sel_init);
  if (v2)
  {
    v3 = MEMORY[0x212BCA240]();
    v2->_visualLogger = (VZLogger *)v3;
    if (!v3)
    {
      v6 = 0;
      goto LABEL_6;
    }
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    registeredSubloggers = v2->_registeredSubloggers;
    v2->_registeredSubloggers = v4;

    v2->_register_lock._os_unfair_lock_opaque = 0;
  }
  v6 = v2;
LABEL_6:

  return v6;
}

- (void)registerSubloggers:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t SubLoggerMutable;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  objc_storeStrong((id *)&self->_registeredSubloggers, a3);
  os_unfair_lock_lock(&self->_register_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_registeredSubloggers;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i));
        objc_msgSend(v9, "UTF8String");
        SubLoggerMutable = VZLoggerGetSubLoggerMutable();
        v12 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        v17 = &v12;
        std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, &v12, (uint64_t)&std::piecewise_construct, &v17)[3] = SubLoggerMutable;
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_register_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[SIVisualLogger _stopLoggingToFile](self, "_stopLoggingToFile");
  -[SIVisualLogger _stopLoggingToHost](self, "_stopLoggingToHost");
  VZRelease();
  VZRelease();
  VZRelease();
  v3.receiver = self;
  v3.super_class = (Class)SIVisualLogger;
  -[SIVisualLogger dealloc](&v3, sel_dealloc);
}

+ (id)_discoverSubloggers
{
  void *v2;
  unsigned int ClassList;
  unsigned int v4;
  Class *v5;
  unint64_t v6;
  uint64_t v7;
  Class v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ClassList = objc_getClassList(0, 0);
  v4 = ClassList;
  if (ClassList)
  {
    v5 = (Class *)malloc_type_malloc(8 * ClassList, 0x80040B8603338uLL);
    objc_getClassList(v5, v4);
    v6 = 0;
    v7 = 8 * v4;
    do
    {
      v8 = v5[v6 / 8];
      if (class_conformsToProtocol(v8, (Protocol *)&unk_254A71A80))
      {
        -[objc_class subLoggers](v8, "subLoggers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "unionSet:", v9);

      }
      v6 += 8;
    }
    while (v7 != v6);
    free(v5);
  }
  return v2;
}

+ (id)defaultLogPath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VisualLogger_SceneIntelligence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)logAndReleaseError:(__CFError *)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = -[__CFError code](a3, "code");
      -[__CFError description](a3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136381443;
      v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      v9 = 1025;
      v10 = 180;
      v11 = 2048;
      v12 = v5;
      v13 = 2113;
      v14 = v6;
      _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Error.\nCode: %zu\nDescription: %{private}@ ***", (uint8_t *)&v7, 0x26u);

    }
  }
}

- (void)enableLogger:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "UTF8String");
  v6 = &v5;
  if (std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, &v5, (uint64_t)&std::piecewise_construct, &v6)[3])
  {
    VZSubLoggerEnable();
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    VZLoggerEnable();
  }

}

- (void)_disableAllLogs
{
  VZLoggerResetEnableStates();
}

- (BOOL)isLoggerEnabled:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  BOOL v8;
  uint64_t v10;
  uint64_t *v11;

  v4 = a3;
  v5 = v4;
  if (self->_visualLogger)
  {
    v6 = objc_retainAutorelease(v4);
    v10 = objc_msgSend(v6, "UTF8String");
    v11 = &v10;
    if (std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, &v10, (uint64_t)&std::piecewise_construct, &v11)[3])
    {
      v7 = VZSubLoggerEnabled();
    }
    else
    {
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      v7 = VZLoggerEnabled();
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)startLoggingToFile:(id)a3
{
  return -[SIVisualLogger startLoggingToFile:synchronously:](self, "startLoggingToFile:synchronously:", a3, 0);
}

- (BOOL)startLoggingToFile:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  BOOL v9;
  char v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  id v36;
  id v37;
  _BYTE buf[18];
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    if (self->_fileDestination)
    {
      __SceneIntelligenceLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        *(_WORD *)&buf[12] = 1025;
        *(_DWORD *)&buf[14] = 220;
        v8 = " %{private}s:%{private}d *** Request to start file logging, but we already have a file destination. ***";
LABEL_7:
        _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject fileExistsAtPath:](v7, "fileExistsAtPath:", v6))
    {
      v37 = 0;
      v10 = -[NSObject removeItemAtPath:error:](v7, "removeItemAtPath:error:", v6, &v37);
      v11 = v37;
      v12 = v11;
      if ((v10 & 1) == 0)
      {
        __SceneIntelligenceLogSharedInstance();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136381187;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
          *(_WORD *)&buf[12] = 1025;
          *(_DWORD *)&buf[14] = 231;
          v39 = 2113;
          v40 = v12;
          _os_log_impl(&dword_21071A000, v29, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to remove item: %{private}@ ***", buf, 0x1Cu);
        }

        goto LABEL_40;
      }

    }
    v36 = 0;
    v13 = -[NSObject createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v36);
    v12 = v36;
    if ((v13 & 1) != 0)
    {
      v14 = VZFileExportOptionsCreate();
      *(_QWORD *)buf = v14;
      v15 = (_QWORD *)operator new();
      *v15 = &off_24CA5CF28;
      v15[1] = 0;
      v15[2] = 0;
      v15[3] = v14;
      *(_QWORD *)&buf[8] = v15;
      if (v4)
        VZFileExportOptionsSetAsyncQueueMaxElementCount();
      v34 = VZLogMessageFilterCreate();
      v16 = (std::__shared_weak_count *)operator new();
      v16->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CEF0;
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)v34;
      v35 = v16;
      VZDataGetDictionaryDataTypeID();
      VZLogMessageFilterRequireDataTypeIDExact();
      VZFileExportOptionsAddFilteredStoragePreference();
      v32 = VZLogMessageFilterCreate();
      v17 = (std::__shared_weak_count *)operator new();
      v17->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CEF0;
      v17->__shared_owners_ = 0;
      v17->__shared_weak_owners_ = 0;
      v17[1].__vftable = (std::__shared_weak_count_vtbl *)v32;
      v33 = v17;
      VZDataGetMeshDataTypeID();
      VZLogMessageFilterRequireDataTypeIDExact();
      VZFileExportOptionsAddFilteredStoragePreference();
      v31 = VZLogMessageFilterCreate();
      v18 = (std::__shared_weak_count *)operator new();
      v18->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      v18->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CEF0;
      v18->__shared_weak_owners_ = 0;
      v18[1].__vftable = (std::__shared_weak_count_vtbl *)v31;
      VZFileExportOptionsAddFilteredStoragePreference();
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      self->_fileDestination = (VZDestination *)VZDestinationCreateWithFileExporter();
      VZLoggerAddDestination();
      v9 = 1;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
      if (v33)
      {
        v21 = (unint64_t *)&v33->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      if (v35)
      {
        v23 = (unint64_t *)&v35->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      v25 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v26 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      goto LABEL_41;
    }
    __SceneIntelligenceLogSharedInstance();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 240;
      v39 = 2113;
      v40 = v6;
      v41 = 2113;
      v42 = v12;
      _os_log_impl(&dword_21071A000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create visual logger directory \"%{private}@\". Error: %{private}@ ***", buf, 0x26u);
    }

LABEL_40:
    v9 = 0;
LABEL_41:

    goto LABEL_42;
  }
  __SceneIntelligenceLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
    *(_WORD *)&buf[12] = 1025;
    *(_DWORD *)&buf[14] = 215;
    v8 = " %{private}s:%{private}d *** Must have a non-nil logPath ***";
    goto LABEL_7;
  }
LABEL_8:
  v9 = 0;
LABEL_42:

  return v9;
}

- (BOOL)_stopLoggingToFile
{
  BOOL v3;

  if (!self->_visualLogger || !self->_fileDestination)
    return 0;
  VZLoggerRemoveDestination();
  v3 = 1;
  VZRelease();
  self->_fileDestination = 0;
  return v3;
}

- (BOOL)startLoggingToHost:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _BYTE buf[18];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 305;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Invalid host address ***", buf, 0x12u);
    }
    goto LABEL_8;
  }
  if (self->_networkDestination)
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 310;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Request to start network logging, but we already have a network destination. ***", buf, 0x12u);
    }
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v8 = VZClientOptionsCreate();
  *(_QWORD *)buf = v8;
  v9 = (std::__shared_weak_count *)operator new();
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CEB8;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  *(_QWORD *)&buf[8] = v9;
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  VZClientOptionsSetTcpIpAddress();
  self->_networkDestination = (VZDestination *)VZDestinationCreateWithClient();
  VZLoggerAddDestination();
  v6 = 1;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_9:

  return v6;
}

- (BOOL)_stopLoggingToHost
{
  BOOL v3;

  if (!self->_visualLogger || !self->_networkDestination)
    return 0;
  VZLoggerRemoveDestination();
  v3 = 1;
  VZRelease();
  self->_networkDestination = 0;
  return v3;
}

- (BOOL)stopAndDisableLogging
{
  BOOL v3;
  BOOL v4;

  v3 = -[SIVisualLogger _stopLoggingToHost](self, "_stopLoggingToHost");
  v4 = -[SIVisualLogger _stopLoggingToFile](self, "_stopLoggingToFile");
  -[SIVisualLogger _disableAllLogs](self, "_disableAllLogs");
  return v4 || v3;
}

- (Ref<const)createDataInfoAt:(double)a3 name:(id)a4
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  _QWORD *v9;
  unint64_t v10;
  void *v11;
  __shared_weak_count *v12;
  id v13;
  Ref<const VZDataInfo *> result;

  v5 = v4;
  v13 = a4;
  v6 = VZDataInfoCreate();
  v7 = (std::__shared_weak_count *)operator new();
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CE80;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  VZDataInfoSetTimestampMachContinuousNanoseconds();
  if (v13)
  {
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    VZDataInfoSetName();
  }
  v9 = (_QWORD *)operator new();
  v9[1] = 0;
  *v9 = &off_24CA5CF60;
  v9[2] = 0;
  v9[3] = v6;
  VZRetain();
  *v5 = v6;
  v5[1] = (uint64_t)v9;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }

  result.var0.var1 = v12;
  result.var0.var0 = v11;
  return result;
}

- (BOOL)logPixelBuffer:(__CVBuffer *)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  uint64_t ImageWithCVPixelBuffer;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  BOOL v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v19;
  std::__shared_weak_count *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v9))
  {
    -[SIVisualLogger createDataInfoAt:name:](self, "createDataInfoAt:name:", v10, a4);
    ImageWithCVPixelBuffer = VZDataCreateImageWithCVPixelBuffer();
    v12 = (std::__shared_weak_count *)operator new();
    v12->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CF98;
    v12->__shared_weak_owners_ = 0;
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)ImageWithCVPixelBuffer;
    if (ImageWithCVPixelBuffer)
    {
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      VZLoggerLogData();
      v14 = 1;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v22 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        v23 = 1025;
        v24 = 393;
        _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** VZ data from pixel buffer is nil ***", buf, 0x12u);
      }

      v14 = 0;
    }
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    if (v20)
    {
      v16 = (unint64_t *)&v20->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)())v20->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)logIOSurface:(__IOSurface *)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  uint64_t ImageWithIOSurface;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  BOOL v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v19;
  std::__shared_weak_count *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v9))
  {
    -[SIVisualLogger createDataInfoAt:name:](self, "createDataInfoAt:name:", v10, a4);
    ImageWithIOSurface = VZDataCreateImageWithIOSurface();
    v12 = (std::__shared_weak_count *)operator new();
    v12->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CF98;
    v12->__shared_weak_owners_ = 0;
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)ImageWithIOSurface;
    if (ImageWithIOSurface)
    {
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      VZLoggerLogData();
      v14 = 1;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v22 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        v23 = 1025;
        v24 = 419;
        _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** VZ data from pixel buffer is nil ***", buf, 0x12u);
      }

      v14 = 0;
    }
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    if (v20)
    {
      v16 = (unint64_t *)&v20->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)())v20->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)logDictionary:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t DictionaryWithCFDictionary;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  BOOL v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v21;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v11))
  {
    -[SIVisualLogger createDataInfoAt:name:](self, "createDataInfoAt:name:", v12, a4);
    DictionaryWithCFDictionary = VZDataCreateDictionaryWithCFDictionary();
    v14 = (std::__shared_weak_count *)operator new();
    v14->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    v14->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CF98;
    v14->__shared_weak_owners_ = 0;
    v14[1].__vftable = (std::__shared_weak_count_vtbl *)DictionaryWithCFDictionary;
    if (DictionaryWithCFDictionary)
    {
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      VZLoggerLogData();
      v16 = 1;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v24 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        v25 = 1025;
        v26 = 444;
        _os_log_impl(&dword_21071A000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** VZ data from dictionary is nil ***", buf, 0x12u);
      }

      v16 = 0;
    }
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    if (v22)
    {
      v18 = (unint64_t *)&v22->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)())v22->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)logBinaryData:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t BlobWithCFData;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  BOOL v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD v24[3];
  uint64_t v25;
  std::__shared_weak_count *v26;
  _BYTE buf[12];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v11))
  {
    v16 = 0;
    goto LABEL_22;
  }
  -[SIVisualLogger createDataInfoAt:name:](self, "createDataInfoAt:name:", v12, a4);
  v25 = 0;
  BlobWithCFData = VZDataCreateBlobWithCFData();
  v24[1] = BlobWithCFData;
  v14 = (std::__shared_weak_count *)operator new();
  v14->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CF98;
  v14->__shared_weak_owners_ = 0;
  v14[1].__vftable = (std::__shared_weak_count_vtbl *)BlobWithCFData;
  v24[2] = v14;
  if (v25)
  {
    -[SIVisualLogger logAndReleaseError:](self, "logAndReleaseError:");
  }
  else
  {
    if (BlobWithCFData)
    {
      v17 = objc_retainAutorelease(v11);
      v24[0] = objc_msgSend(v17, "UTF8String");
      *(_QWORD *)buf = v24;
      if (std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, v24, (uint64_t)&std::piecewise_construct, (_QWORD **)buf)[3])
      {
        VZSubLoggerLogData();
      }
      else
      {
        objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        VZLoggerLogData();
      }
      v16 = 1;
      goto LABEL_14;
    }
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      v28 = 1025;
      v29 = 470;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** VZData from blob is nil ***", buf, 0x12u);
    }

  }
  v16 = 0;
  do
LABEL_14:
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  v20 = v26;
  if (v26)
  {
    v21 = (unint64_t *)&v26->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_22:

  return v16;
}

- (id)_arrayOfNumbersToData:(id)a3 valueType:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 8 * objc_msgSend(v6, "count"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v15 = 0;
          objc_msgSend(v12, "doubleValue");
          v15 = v13;
          objc_msgSend(v7, "appendBytes:length:", &v15, 8);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    *a4 = *MEMORY[0x24BEC0AA0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)logNumbers:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  BOOL v16;
  NSObject *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t NumbersWithCFData;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v11) && objc_msgSend(v10, "count"))
  {
    -[SIVisualLogger createDataInfoAt:name:](self, "createDataInfoAt:name:", v12, a4);
    v24 = *MEMORY[0x24BEC0AA8];
    -[SIVisualLogger _arrayOfNumbersToData:valueType:](self, "_arrayOfNumbersToData:valueType:", v10, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NumbersWithCFData = VZDataCreateNumbersWithCFData();
    v14 = (std::__shared_weak_count *)operator new();
    v14->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    v14->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CF98;
    v14->__shared_weak_owners_ = 0;
    v14[1].__vftable = (std::__shared_weak_count_vtbl *)NumbersWithCFData;
    v16 = NumbersWithCFData != 0;
    if (NumbersWithCFData)
    {
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      VZLoggerLogData();
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        v28 = 1025;
        v29 = 517;
        _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** numbers_data content is nil ***", buf, 0x12u);
      }

    }
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }

    v20 = v25;
    if (v25)
    {
      v21 = (unint64_t *)&v25->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)logNumber:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  BOOL v15;
  NSObject *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t NumberWithCFNumber;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v11))
  {
    -[SIVisualLogger createDataInfoAt:name:](self, "createDataInfoAt:name:", v12, a4);
    NumberWithCFNumber = VZDataCreateNumberWithCFNumber();
    v13 = (std::__shared_weak_count *)operator new();
    v13->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&off_24CA5CF98;
    v13->__shared_weak_owners_ = 0;
    v13[1].__vftable = (std::__shared_weak_count_vtbl *)NumberWithCFNumber;
    v15 = NumberWithCFNumber != 0;
    if (NumberWithCFNumber)
    {
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String", NumberWithCFNumber, v13);
      VZLoggerLogData();
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v24 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        v25 = 1025;
        v26 = 537;
        _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** numbers_data content is nil ***", buf, 0x12u);
      }

    }
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    if (v22)
    {
      v18 = (unint64_t *)&v22->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)())v22->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VZLogger)internalVisualLoggerRef
{
  return self->_visualLogger;
}

- (NSSet)registeredSubloggers
{
  return self->_registeredSubloggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredSubloggers, 0);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&self->_vlSubloggerMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  return self;
}

- (void)createDataInfoAt:(std::__shared_weak_count *)a1 name:.cold.1(std::__shared_weak_count *a1)
{
  ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
  std::__shared_weak_count::__release_weak(a1);
}

@end
