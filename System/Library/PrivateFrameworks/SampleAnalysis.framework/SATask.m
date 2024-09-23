@implementation SATask

- (SABinary)mainBinary
{
  SABinary *mainBinary;
  SABinary *v3;
  void *v4;

  mainBinary = self->_mainBinary;
  if (mainBinary)
  {
    v3 = mainBinary;
  }
  else
  {
    -[SATask mainBinaryLoadInfo](self, "mainBinaryLoadInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "binary");
    v3 = (SABinary *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)mainBinaryPath
{
  NSString *mainBinaryPath;
  NSString *v3;
  void *v4;

  mainBinaryPath = self->_mainBinaryPath;
  if (mainBinaryPath)
  {
    v3 = mainBinaryPath;
  }
  else
  {
    -[SATask mainBinary](self, "mainBinary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (SABinaryLoadInfo)mainBinaryLoadInfo
{
  NSArray *binaryLoadInfos;
  void *v4;
  void *v5;
  SABinary *v6;
  SABinary *mainBinary;

  binaryLoadInfos = self->_binaryLoadInfos;
  if (!binaryLoadInfos || !-[NSArray count](binaryLoadInfos, "count"))
    goto LABEL_10;
  if ((CSArchitectureIs32Bit() & 1) != 0 || self->_pid)
  {
    -[NSArray firstObject](self->_binaryLoadInfos, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray lastObject](self->_binaryLoadInfos, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (self->_mainBinary)
  {
    objc_msgSend(v4, "binary");
    v6 = (SABinary *)objc_claimAutoreleasedReturnValue();
    mainBinary = self->_mainBinary;

    if (v6 != mainBinary)
    {

LABEL_10:
      v5 = 0;
    }
  }
  return (SABinaryLoadInfo *)v5;
}

- (SATask)initWithPid:(int)pid andUniquePid:(unint64_t)a4 andName:(id)a5 sharedCache:(id)a6
{
  id v10;
  id v11;
  char *v12;
  SATask *v13;
  double v14;
  int v15;
  uint64_t v16;
  NSString *name;
  NSMutableDictionary *v18;
  NSMutableDictionary *dispatchQueues;
  NSMutableDictionary *v20;
  NSMutableDictionary *swiftTasks;
  NSMutableDictionary *v22;
  NSMutableDictionary *threads;
  NSMutableArray *v24;
  NSMutableArray *taskStates;
  int v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  int v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SATask;
  v12 = -[SATask init](&v32, sel_init);
  v13 = (SATask *)v12;
  if (v12)
  {
    v14 = NAN;
    if (pid <= 1)
      v15 = 0;
    else
      v15 = -1;
    *(_QWORD *)(v12 + 84) = 0xFFFFFEC6FFFFFFFFLL;
    *((_DWORD *)v12 + 19) = pid;
    *((_DWORD *)v12 + 20) = v15;
    *((_QWORD *)v12 + 12) = a4;
    if (v10)
    {
      if (!objc_msgSend(v10, "length", NAN))
      {
        v27 = *__error();
        _sa_logt();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          -[SATask debugDescription](v13, "debugDescription");
          v31 = v27;
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = objc_msgSend(v29, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v34 = v30;
          _os_log_fault_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_FAULT, "%s: applying empty string for task name", buf, 0xCu);

          v27 = v31;
        }

        *__error() = v27;
        v10 = 0;
      }
      pid = v13->_pid;
    }
    if (!pid || (objc_msgSend(v10, "isEqualToString:", CFSTR("kernel_task"), v14) & 1) == 0)
    {
      v16 = objc_msgSend(v10, "copy", v14);
      name = v13->_name;
      v13->_name = (NSString *)v16;

    }
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dispatchQueues = v13->_dispatchQueues;
    v13->_dispatchQueues = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    swiftTasks = v13->_swiftTasks;
    v13->_swiftTasks = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    threads = v13->_threads;
    v13->_threads = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    taskStates = v13->_taskStates;
    v13->_taskStates = v24;

    objc_storeStrong((id *)&v13->_sharedCache, a6);
  }

  return v13;
}

- (NSString)name
{
  NSString *name;
  NSString *Path;
  void *v4;

  name = self->_name;
  if (name)
  {
    Path = name;
  }
  else
  {
    -[SATask mainBinaryPath](self, "mainBinaryPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    Path = (NSString *)-[NSString copyLastPathComponent](v4);

  }
  return Path;
}

- (void)addDispatchQueue:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
}

- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a4;
  v6 = a3;
  -[NSMutableArray lastObject](self->_taskStates, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4 || (v10 = 0x7FFFFFFFFFFFFFFFLL, v9 = objc_msgSend(v7, "endSampleIndex"), v9 != 0x7FFFFFFFFFFFFFFFLL))
      v10 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:", v6, v9);
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (uint64_t)correspondsToName:(_QWORD *)a3 loadInfos:(int)a4 numLoadInfos:(uint64_t)a5 architecture:(void *)a6 sharedCache:
{
  NSObject *v11;
  SABinaryLoadInfo *v12;
  SABinaryLoadInfo *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  v11 = a6;
  if (!a1)
  {
LABEL_13:
    v16 = 0;
    goto LABEL_9;
  }
  if (!*(_DWORD *)(a1 + 76))
  {
    v18 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "correspondsToName called for kernel", v25, 2u);
    }

    *__error() = v18;
    _SASetCrashLogMessage(1321, "correspondsToName called for kernel", v19, v20, v21, v22, v23, v24, v25[0]);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (a2)
  {
    SANSStringForCString(a2);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
  if (a3 && a4)
  {
    v13 = [SABinaryLoadInfo alloc];
    uuidForBytes((uint64_t)(a3 + 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SABinaryLoadInfo initWithBinary:segment:loadAddress:](v13, "initWithBinary:segment:loadAddress:", v15, 0, *a3);

  }
  v16 = -[SATask correspondsToName:mainBinaryLoadInfo:architecture:sharedCache:](a1, a2, v12, a5, v11);

LABEL_9:
  return v16;
}

- (int)pid
{
  return self->_pid;
}

- (NSArray)taskStates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)uniquePid
{
  return self->_uniquePid;
}

- (NSString)bundleProjectName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)codesigningID
{
  void *v2;
  void *v3;

  -[SATask mainBinary](self, "mainBinary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "codesigningID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  return -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:", a3, v4);
}

- (id)architectureString
{
  void *architecture;

  architecture = (void *)self->_architecture;
  if (architecture)
  {
    architecture = (void *)CSArchitectureGetFamilyName();
    if (architecture)
    {
      SANSStringForCString(architecture);
      architecture = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return architecture;
}

- (id)startTimestamp
{
  SATimestamp *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *threads;
  SATimestamp *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  SATimestamp *v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v3 = self->_execTimestamp;
  v16 = v3;
  if (!v3)
  {
    -[NSMutableArray firstObject](self->_taskStates, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTimestamp");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v12[5];
    v12[5] = v5;

    v3 = (SATimestamp *)v12[5];
    if (!v3)
    {
      threads = self->_threads;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __24__SATask_startTimestamp__block_invoke;
      v10[3] = &unk_1E7147860;
      v10[4] = &v11;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v10);
      v3 = (SATimestamp *)v12[5];
    }
  }
  v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableDictionary *threads;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE *v33;
  _BYTE buf[24];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7 && (objc_msgSend(v6, "le:", v7) & 1) == 0)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = objc_msgSend(v18, "UTF8String");
      objc_msgSend(v8, "debugDescription");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = objc_msgSend(v20, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "startTime %s > endTime %s", buf, 0x16u);

    }
    *__error() = v16;
    objc_msgSend(v6, "debugDescription");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "UTF8String");
    objc_msgSend(v8, "debugDescription");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "UTF8String");
    _SASetCrashLogMessage(1940, "startTime %s > endTime %s", v24, v25, v26, v27, v28, v29, v22);

    _os_crash();
    __break(1u);
  }
  if (-[NSMutableArray count](self->_taskStates, "count"))
  {
    v9 = -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:", v6, 0x7FFFFFFFFFFFFFFFLL);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v12 = v9;
      v13 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:", v8, 0x7FFFFFFFFFFFFFFFLL);
      if (v13 >= v12)
        v14 = v13 - v12 + 1;
      else
        v14 = 0;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        v10 = 0;
      else
        v10 = v14;
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v35 = 0;
    threads = self->_threads;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __47__SATask_sampleCountInTimestampRangeStart_end___block_invoke;
    v30[3] = &unk_1E7149E60;
    v33 = buf;
    v31 = v6;
    v32 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v30);
    v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

- (NSDictionary)threads
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)enumerateFrames:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 280);
    if (v4)
    {
      v5 = v3;
      +[SAFrame enumerateFrameTree:block:]((uint64_t)SAFrame, v4, v3);
      v3 = v5;
    }
  }

}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_rootFrames;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        +[SAFrame releaseFrameTree:]((uint64_t)SAFrame, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SATask;
  -[SATask dealloc](&v8, sel_dealloc);
}

- (int)rpid
{
  return self->_rpid;
}

- (NSString)bundleVersion
{
  void *v2;
  void *v3;

  -[SATask mainBinary](self, "mainBinary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleShortVersion
{
  void *v2;
  void *v3;

  -[SATask mainBinary](self, "mainBinary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleShortVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[SATask mainBinary](self, "mainBinary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)teamID
{
  void *v2;
  void *v3;

  -[SATask mainBinary](self, "mainBinary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "teamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)addThread:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadId"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
}

- (void)addSwiftTask:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
}

- (void)guessArchitectureGivenMachineArchitecture:(uint64_t)a3 dataSource:
{
  char *v3;
  unint64_t Family;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  unint64_t v34;
  unsigned int v35;
  unint64_t v36;
  unsigned int v37;
  int v38;
  NSObject *v39;
  id v40;
  id v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  NSObject *v50;
  const char *ClassName;
  const char *v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  uint64_t FamilyName;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (*(_QWORD *)(a1 + 288))
  {
    v38 = *__error();
    _sa_logt();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)a1, "debugDescription");
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v3 = (char *)objc_msgSend(v40, "UTF8String");
      *(_DWORD *)buf = 136315906;
      v77 = v3;
      v78 = 2080;
      FamilyName = CSArchitectureGetFamilyName();
      v80 = 2080;
      v81 = CSArchitectureGetFamilyName();
      v82 = 2048;
      v83 = a3;
      _os_log_error_impl(&dword_1B9BE0000, v39, OS_LOG_TYPE_ERROR, "%s: already know architecture %s, but guessing from machine architecture %s (data source 0x%llx)", buf, 0x2Au);

    }
    *__error() = v38;
    objc_msgSend((id)a1, "debugDescription");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "UTF8String");
    CSArchitectureGetFamilyName();
    CSArchitectureGetFamilyName();
    _SASetCrashLogMessage(92, "%s: already know architecture %s, but guessing from machine architecture %s (data source 0x%llx)", v43, v44, v45, v46, v47, v48, v42);

    _os_crash();
    __break(1u);
    goto LABEL_68;
  }
  Family = CSArchitectureGetFamily();
  v8 = Family;
  v9 = HIDWORD(Family);
  if (CSArchitectureIs32Bit())
    goto LABEL_4;
  if ((a3 & 5) != 0)
  {
    objc_msgSend(*(id *)(a1 + 8), "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v60 = v10;
      if ((a3 & 1) == 0 && !*(_DWORD *)(a1 + 76) || (v12 = objc_msgSend(v10, "ssFlags"), v11 = v60, (v12 & 1) == 0))
      {
        if ((a3 & 4) == 0 || *(_DWORD *)(a1 + 76) || (v13 = objc_msgSend(v11, "ssFlags"), v11 = v60, (v13 & 2) == 0))
          v8 &= ~0x1000000u;
      }
      *(_DWORD *)(a1 + 288) = v8;
      *(_DWORD *)(a1 + 292) = v9;

      return;
    }
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v14 = *(id *)(a1 + 248);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v70 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v19, "loadAddress") >> 32)
          goto LABEL_31;
        if (objc_msgSend(v19, "loadAddress"))
        {
          v8 &= ~0x1000000u;
LABEL_31:
          *(_DWORD *)(a1 + 288) = v8;
LABEL_32:
          *(_DWORD *)(a1 + 292) = v9;
LABEL_33:

          return;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v16);
  }

  v20 = *(void **)(a1 + 256);
  if (v20 && objc_msgSend(v20, "startAddress") != -1)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 256), "startAddress") >> 32)
      goto LABEL_4;
    if (objc_msgSend(*(id *)(a1 + 256), "startAddress"))
    {
      *(_DWORD *)(a1 + 288) = v8 & 0xFEFFFFFF;
      goto LABEL_5;
    }
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v14 = *(id *)(a1 + 280);
  v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (!v21)
    goto LABEL_48;
  v23 = v21;
  v24 = *(_QWORD *)v66;
  do
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v66 != v24)
        objc_enumerationMutation(v14);
      v26 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v25);
      if (v26)
      {
        a2 = objc_getProperty(v26, v22, 40, 1);
        if (!a2)
          goto LABEL_44;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = (char *)a2;
LABEL_58:
          v3 = v27;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = objc_msgSend(v3, "address");
            v35 = v8 & 0xFEFFFFFF;
            if (HIDWORD(v34))
              v35 = v8;
            *(_DWORD *)(a1 + 288) = v35;
            *(_DWORD *)(a1 + 292) = v9;

            goto LABEL_33;
          }
LABEL_68:
          v49 = *__error();
          _sa_logt();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            ClassName = object_getClassName(a2);
            v52 = object_getClassName(v3);
            *(_DWORD *)buf = 136315394;
            v77 = ClassName;
            v78 = 2080;
            FamilyName = (uint64_t)v52;
            _os_log_error_impl(&dword_1B9BE0000, v50, OS_LOG_TYPE_ERROR, "children is %s, child is %s", buf, 0x16u);
          }

          *__error() = v49;
          v53 = object_getClassName(a2);
          object_getClassName(v3);
          _SASetCrashLogMessage(146, "children is %s, child is %s", v54, v55, v56, v57, v58, v59, v53);
          _os_crash();
          __break(1u);
        }
        objc_msgSend(a2, "anyObject");
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        if (v27)
          goto LABEL_58;
      }
      else
      {
        a2 = 0;
      }
LABEL_44:

      ++v25;
    }
    while (v23 != v25);
    v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    v23 = v28;
  }
  while (v28);
LABEL_48:

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v14 = *(id *)(a1 + 280);
  v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v62;
    while (2)
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(v14);
        v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        if (!objc_msgSend(v33, "isFakeFrame"))
        {
          v36 = objc_msgSend(v33, "address");
          v37 = v8 & 0xFEFFFFFF;
          if (HIDWORD(v36))
            v37 = v8;
          *(_DWORD *)(a1 + 288) = v37;
          goto LABEL_32;
        }
      }
      v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v30)
        continue;
      break;
    }
  }

LABEL_4:
  *(_DWORD *)(a1 + 288) = v8;
LABEL_5:
  *(_DWORD *)(a1 + 292) = v9;
}

- (void)setMainBinaryPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  NSString *v10;
  NSString *mainBinaryPath;
  int v12;
  NSObject *v13;
  NSString *v14;
  void *Path;
  NSString *name;
  void *v17;
  void *v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    mainBinaryPath = self->_mainBinaryPath;
    self->_mainBinaryPath = 0;

    goto LABEL_17;
  }
  -[SATask mainBinary](self, "mainBinary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v19 = 0;
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SAFilepathMatches(v7, v4, &v19);

    if (v8)
    {
      if (v19)
        objc_setProperty_atomic_copy(v6, v9, v4, 80);
      v10 = self->_mainBinaryPath;
      self->_mainBinaryPath = 0;
      goto LABEL_12;
    }
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[SATask debugDescription](self, "debugDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v17;
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v18;
      _os_log_debug_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_DEBUG, "%@: Setting mainBinaryPath to %@ when its already %@", buf, 0x20u);

    }
    *__error() = v12;
  }
  SACachedNSString(v4);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_mainBinaryPath;
  self->_mainBinaryPath = v14;
LABEL_12:

  if (self->_name)
  {
    Path = -[NSString copyLastPathComponent](v4);
    if (objc_msgSend(Path, "hasPrefix:", self->_name))
    {
      name = self->_name;
      self->_name = 0;

    }
  }

LABEL_17:
}

- (void)setName:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  int v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3 && !objc_msgSend(v3, "length"))
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend((id)a1, "debugDescription");
        v10 = v7;
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v12 = objc_msgSend(v9, "UTF8String");
        _os_log_fault_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_FAULT, "%s: applying emptry string for task name", buf, 0xCu);

        v7 = v10;
      }

      *__error() = v7;
      v4 = 0;
    }
    if (!*(_DWORD *)(a1 + 76) || (objc_msgSend(v4, "isEqualToString:", CFSTR("kernel_task")) & 1) == 0)
    {
      v5 = objc_msgSend(v4, "copy");
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

    }
  }

}

+ (id)taskWithPid:(uint64_t)a3 uniquePid:(void *)a4 name:(void *)a5 sharedCache:
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithPid:andUniquePid:andName:sharedCache:", a2, a3, v9, v8);

  return v10;
}

- (SATask)initWithPid:(int)a3 uniquePid:(unint64_t)a4 name:(const char *)a5 mainBinaryPath:(id)a6 pidStartTime:(unint64_t)a7 loadInfos:(const dyld_uuid_info_64 *)a8 numLoadInfos:(unsigned int)a9 textExecLoadInfos:(const dyld_uuid_info_64 *)a10 numTextExecLoadInfos:(unsigned int)a11 architecture:(_CSArchitecture)a12 sharedCache:(id)a13
{
  uint64_t v17;
  id v19;
  id v20;
  SATask *v21;
  uint64_t v22;
  SATimestamp *pidStartTimestamp;
  uint64_t v24;
  NSArray *binaryLoadInfos;
  int v27;
  NSObject *v28;
  char *v29;
  unsigned int v30;
  unsigned int v31;
  BOOL v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t imageLoadAddress;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  char *v46;
  uint64_t v47;

  v17 = *(_QWORD *)&a3;
  v47 = *MEMORY[0x1E0C80C00];
  v19 = a6;
  v20 = a13;
  if (a5)
  {
    if (*a5)
    {
      SANSStringForCString((void *)a5);
      a5 = (const char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a5 = 0;
    }
  }
  v21 = -[SATask initWithPid:andUniquePid:andName:sharedCache:](self, "initWithPid:andUniquePid:andName:sharedCache:", v17, a4, a5, v20);
  if (v21)
  {
    if (a7)
    {
      +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", 0, 0, 0.0, 0.0, (double)a7 - *MEMORY[0x1E0C9ADF8]);
      v22 = objc_claimAutoreleasedReturnValue();
      pidStartTimestamp = v21->_pidStartTimestamp;
      v21->_pidStartTimestamp = (SATimestamp *)v22;

    }
    v21->_architecture = a12;
    if (!(_DWORD)v17)
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:]((uint64_t)v21, a8, a9, a10, a11);
      goto LABEL_14;
    }
    if (a10 || a11)
    {
      v27 = *__error();
      _sa_logt();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        -[SATask debugDescription](v21, "debugDescription");
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v36 = objc_msgSend(v38, "UTF8String");
        if (a10)
        {
          imageLoadAddress = a10->imageLoadAddress;
          do
          {
            v30 = __ldxr(&uuid_string_index);
            v31 = v30 + 1;
          }
          while (__stxr(v31, &uuid_string_index));
          v32 = (-v31 & 0x80000000) != 0;
          v33 = -v31 & 3;
          v34 = v31 & 3;
          if (v32)
            v35 = v34;
          else
            v35 = -v33;
          v29 = &uuid_string_string[37 * v35];
          uuid_unparse(a10->imageUUID, v29);
        }
        else
        {
          imageLoadAddress = 0;
          v29 = "null";
        }
        *(_DWORD *)buf = 136315906;
        v40 = v36;
        v41 = 1024;
        v42 = a11;
        v43 = 2048;
        v44 = imageLoadAddress;
        v45 = 2080;
        v46 = v29;
        _os_log_fault_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_FAULT, "%s has text-exec %u load infos (first is 0x%llx %s)", buf, 0x26u);

      }
      *__error() = v27;
      if (a9)
        goto LABEL_12;
    }
    else if (a9)
    {
LABEL_12:
      _SABinaryCreateLoadInfoArrayFromDyldImageInfos((uint64_t)a8, a9, v19, 0, 0, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      binaryLoadInfos = v21->_binaryLoadInfos;
      v21->_binaryLoadInfos = (NSArray *)v24;

      v21->_assumeBinaryLoadInfosContainsMainBinary = 1;
    }
  }
LABEL_14:

  return v21;
}

- (void)_incorporateNewKernelLoadInfos:(unsigned int)a3 numLoadInfos:(NSObject *)a4 textExecLoadInfos:(unsigned int)a5 numTextExecLoadInfos:
{
  NSObject *v8;
  void *v10;
  void *v11;
  Class isa;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  unsigned int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v8 = a2;
  if (!a2 && a3)
  {
    v21 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v43 = a3;
      _os_log_error_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_ERROR, "%u load infos, but null", buf, 8u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(1332, "%u load infos, but null", v23, v24, v25, v26, v27, v28, a3);
    _os_crash();
    __break(1u);
LABEL_28:
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v43 = a5;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "%u text exec load infos, but null", buf, 8u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(1333, "%u text exec load infos, but null", v31, v32, v33, v34, v35, v36, a5);
    _os_crash();
    __break(1u);
  }
  if (!a4 && a5)
    goto LABEL_28;
  if (objc_msgSend(*(id *)(a1 + 248), "count") < (unint64_t)(a5 + a3))
  {
    _SABinaryCreateLoadInfoArrayFromDyldImageInfos((uint64_t)v8, a3, 0, a4, a5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!*(_QWORD *)(a1 + 48))
    {
      if (a3 || (v8 = a4, a5))
        isa = v8->isa;
      else
        isa = 0;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v38 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if ((Class)objc_msgSend(v18, "loadAddress") == isa)
            {
              objc_msgSend(v18, "binary");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = *(void **)(a1 + 48);
              *(_QWORD *)(a1 + 48) = v19;

              goto LABEL_21;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_21:

    }
    -[SATask addImageInfos:](a1, v11);
    *(_BYTE *)(a1 + 73) = 1;

  }
}

+ (id)taskWithPid:(uint64_t)a3 uniquePid:(uint64_t)a4 name:(void *)a5 mainBinaryPath:(uint64_t)a6 pidStartTime:(uint64_t)a7 loadInfos:(int)a8 numLoadInfos:(uint64_t)a9 textExecLoadInfos:(int)a10 numTextExecLoadInfos:(uint64_t)a11 architecture:(void *)a12 sharedCache:
{
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

  v17 = a12;
  v18 = a5;
  LODWORD(v22) = a10;
  LODWORD(v21) = a8;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithPid:uniquePid:name:mainBinaryPath:pidStartTime:loadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:architecture:sharedCache:", a2, a3, a4, v18, a6, a7, v21, a9, v22, a11, v17);

  return v19;
}

- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6;
  NSMutableArray *taskStates;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  if (-[NSMutableArray count](self->_taskStates, "count"))
  {
    if (v6)
    {
      taskStates = self->_taskStates;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__SATask_indexOfFirstTaskStateOnOrAfterTime_sampleIndex___block_invoke;
      v14[3] = &unk_1E7149D60;
      v15 = v6;
      v8 = SABinarySearchArray(taskStates, 1280, (uint64_t)v14);

    }
    else
    {
      v8 = 0;
    }
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 < -[NSMutableArray count](self->_taskStates, "count"))
    {
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {

        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "endSampleIndex");

          if (v12 >= a4)
            break;
        }
        ++v8;
      }
      while (v8 < -[NSMutableArray count](self->_taskStates, "count"));
    }
    if (v8 >= -[NSMutableArray count](self->_taskStates, "count"))
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __57__SATask_indexOfFirstTaskStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "lt:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "endTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "gt:", v8);

    v6 = v6;
  }

  return v6;
}

- (id)firstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6;
  NSMutableArray *taskStates;
  uint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  if (!-[NSMutableArray count](self->_taskStates, "count"))
    goto LABEL_4;
  taskStates = self->_taskStates;
  if (v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__SATask_indexOfLastTaskStateOnOrBeforeTime_sampleIndex___block_invoke;
    v14[3] = &unk_1E7149D60;
    v15 = v6;
    v8 = SABinarySearchArray(taskStates, 1536, (uint64_t)v14);

    if (!v8)
      goto LABEL_4;
  }
  else
  {
    v8 = -[NSMutableArray count](self->_taskStates, "count");
  }
  v9 = v8 - 1;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_7;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "startSampleIndex");

      if (v13 <= a4)
        goto LABEL_7;
    }
    if (!v9)
      break;
    --v9;
  }
LABEL_4:
  v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:

  return v9;
}

uint64_t __57__SATask_indexOfLastTaskStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "lt:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "endTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "gt:", v8);

    v6 = v6;
  }

  return v6;
}

- (id)lastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)firstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  return -[SATask firstTaskStateOnOrAfterTime:sampleIndex:](self, "firstTaskStateOnOrAfterTime:sampleIndex:", a3, v4);
}

- (id)lastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[SATask indexOfLastTaskStateOnOrBeforeTime:withSampleIndex:](self, "indexOfLastTaskStateOnOrBeforeTime:withSampleIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)enumerateTaskStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8
{
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  char v21;
  _QWORD v22[5];
  id v23;

  v14 = a5;
  v15 = a8;
  v16 = -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:", a3, a4);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v16;
    v18 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:", v14, a6);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v18;
      if (v17 <= v18)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __105__SATask_enumerateTaskStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
        v22[3] = &unk_1E7148A90;
        v22[4] = self;
        v23 = v15;
        v20 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1BCCCC450](v22);
        if (a7)
        {
          do
          {
            if (v19 + 1 <= v17)
              break;
            v21 = v20[2](v20, v19--);
          }
          while ((v21 & 1) == 0);
        }
        else
        {
          do
          {
            if ((v20[2](v20, v17) & 1) != 0)
              break;
            ++v17;
          }
          while (v17 <= v19);
        }

      }
    }
  }

}

uint64_t __105__SATask_enumerateTaskStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v6;

  v6 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, unsigned __int8 *))(v3 + 16))(v3, v4, a2, &v6);

  return v6;
}

- (void)enumerateTaskStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v8 = a5;
  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__SATask_enumerateTaskStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke;
  v14[3] = &unk_1E7149D88;
  v16 = a6;
  v15 = v12;
  v13 = v12;
  -[SATask enumerateTaskStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:](self, "enumerateTaskStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:", a3, 0x7FFFFFFFFFFFFFFFLL, a4, 0x7FFFFFFFFFFFFFFFLL, v8, v14);

}

void __89__SATask_enumerateTaskStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!*(_BYTE *)(a1 + 40) || (v4 = objc_msgSend(v3, "startSampleIndex"), v5 = v6, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v6;
  }

}

- (void)enumerateThreadStatesForThread:(void *)a3 dispatchQueue:(void *)a4 betweenStartTime:(unint64_t)a5 startSampleIndex:(void *)a6 endTime:(unint64_t)a7 endSampleIndex:(uint64_t)a8 reverseOrder:(void *)a9 block:
{
  unint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[16];

  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a9;
  v21 = v20;
  if (!a1)
  {
LABEL_7:

    return;
  }
  if (v16 | v17)
  {
    if (v16)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
      v33[3] = &unk_1E7149DB0;
      v22 = &v34;
      v34 = (id)v17;
      v36 = v21;
      v35 = (id)v16;
      objc_msgSend(v35, "enumerateThreadStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:", v18, a5, v19, a7, a8, v33);

    }
    else
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke_2;
      v31[3] = &unk_1E7149B80;
      v22 = &v32;
      v32 = v20;
      -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:](v17, v18, a5, v19, a7, a8, v31);
    }

    goto LABEL_7;
  }
  v23 = *__error();
  _sa_logt();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "No thread nor dispatch queue", buf, 2u);
  }

  *__error() = v23;
  _SASetCrashLogMessage(518, "No thread nor dispatch queue", v25, v26, v27, v28, v29, v30, v31[0]);
  _os_crash();
  __break(1u);
}

void __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (!*(_QWORD *)(a1 + 32)
    || (objc_msgSend(v3, "dispatchQueue"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = *(void **)(a1 + 32),
        v4,
        v6 = v7,
        v4 == v5))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = v7;
  }

}

void __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "thread");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "threadStateIndex");

  (*(void (**)(uint64_t, id, void *, uint64_t, uint64_t))(v4 + 16))(v4, v8, v6, v7, a3);
}

- (uint64_t)gatherLoadInfoFromLiveProcessWithDataGatheringOptions:(int)a3 additionalCSSymbolicatorFlags:
{
  uint64_t v4;
  id *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  id *v28;
  uint64_t v29;
  id v30;
  int v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = 0;
  if ((a2 & 2) != 0 && !*(_BYTE *)(a1 + 64))
  {
    if ((a2 & 0x400) == 0 && *(_DWORD *)(a1 + 76))
      return 0;
    v7 = (id *)(id)a1;
    objc_sync_enter(v7);
    if (*(_BYTE *)(a1 + 64))
    {
      v4 = 0;
LABEL_39:
      objc_sync_exit(v7);

      return v4;
    }
    *(_BYTE *)(a1 + 64) = 1;
    v54 = 0;
    v55 = 0;
    v8 = *((unsigned int *)v7 + 19);
    v52 = 0;
    v53 = 0;
    v51 = 0;
    CopyLoadInfosForLiveProcess(v8, a2, &v54, &v53, &v52, &v51, (uint64_t *)&v55, a3);
    v9 = v54;
    v10 = v54;
    v50 = v53;
    v11 = v52;
    v12 = v52;
    v13 = v51;
    v14 = v51;
    v15 = v14;
    if (!v10)
    {
      v20 = *__error();
      _sa_logt();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "debugDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v57 = v36;
        _os_log_debug_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_DEBUG, "%@: Unable to inspect live processes for images infos", buf, 0xCu);

      }
      v4 = 0;
      *__error() = v20;
      goto LABEL_38;
    }
    if (*((_DWORD *)v7 + 19))
    {
      objc_msgSend(v10, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "binary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SATask correspondsToName:mainBinaryLoadInfo:architecture:sharedCache:]((uint64_t)v7, v18, v16, (uint64_t)v55, v12);

      if ((v19 & 1) == 0)
      {
        v22 = *__error();
        _sa_logt();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "debugDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mainBinaryLoadInfo");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "debugDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v57 = v39;
          v58 = 2112;
          v59 = (uint64_t)v41;
          v60 = 2112;
          v61 = (uint64_t)v16;
          _os_log_debug_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_DEBUG, "%@: live process has changed %@ -> %@", buf, 0x20u);

        }
        *__error() = v22;

        v4 = 0;
        goto LABEL_38;
      }

    }
    else if (v14)
    {
      objc_storeStrong(v7 + 6, v13);
    }
    else
    {
      v24 = *__error();
      _sa_logt();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v43 = *((_DWORD *)v7 + 19);
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v43;
        _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "[%d] Unable to determine main binary", buf, 8u);
      }

      *__error() = v24;
    }
    if (v55)
    {
      v7[36] = v55;
    }
    else
    {
      v26 = *__error();
      _sa_logt();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v42 = *((_DWORD *)v7 + 19);
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v42;
        _os_log_error_impl(&dword_1B9BE0000, v27, OS_LOG_TYPE_ERROR, "[%d] Unable to determine architecture", buf, 8u);
      }

      *__error() = v26;
    }
    v28 = v7 + 31;
    v29 = objc_msgSend(v7[31], "count");
    objc_storeStrong(v7 + 31, v9);
    v30 = v7[32];
    if (v30 && v12 != v30)
    {
      v44 = *__error();
      _sa_logt();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v7, "debugDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "debugDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7[32], "debugDescription");
        v46 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v57 = v49;
        v58 = 2112;
        v59 = (uint64_t)v48;
        v60 = 2112;
        v47 = (void *)v46;
        v61 = v46;
        _os_log_fault_impl(&dword_1B9BE0000, v45, OS_LOG_TYPE_FAULT, "%@: Got dyld shared cache %@ though have existing %@", buf, 0x20u);

      }
      *__error() = v44;
    }
    objc_storeStrong(v7 + 32, v11);
    if (v29 == objc_msgSend(v10, "count"))
    {
      v31 = *__error();
      _sa_logt();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "debugDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(*v28, "count");
        *(_DWORD *)buf = 138412546;
        v57 = v33;
        v58 = 2048;
        v59 = v34;
        _os_log_impl(&dword_1B9BE0000, v32, OS_LOG_TYPE_INFO, "%@: Inspected live processes for %lu images infos, nothing new", buf, 0x16u);

      }
    }
    else
    {
      v31 = *__error();
      _sa_logt();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "debugDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(*v28, "count");
        *(_DWORD *)buf = 138412802;
        v57 = v37;
        v58 = 2048;
        v59 = v38;
        v60 = 2048;
        v61 = v29;
        _os_log_debug_impl(&dword_1B9BE0000, v32, OS_LOG_TYPE_DEBUG, "%@: Inspected live processes for %lu images infos (%lu previously)", buf, 0x20u);

      }
    }

    *__error() = v31;
    v4 = 1;
    *((_BYTE *)v7 + 73) = 1;
LABEL_38:

    goto LABEL_39;
  }
  return v4;
}

- (uint64_t)correspondsToName:(void *)a3 mainBinaryLoadInfo:(uint64_t)a4 architecture:(void *)a5 sharedCache:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v9 && !objc_msgSend(v9, "length"))
  {

    v9 = 0;
    if (!v11)
      goto LABEL_8;
  }
  else if (!v11)
  {
    goto LABEL_8;
  }
  v12 = *(id *)(a1 + 256);
  if (v12 && v12 != v11)
    goto LABEL_25;
LABEL_8:
  if (*(_QWORD *)(a1 + 288) && a4 && !CSArchitectureMatchesArchitecture())
    goto LABEL_25;
  if (v10)
  {
    if (objc_msgSend(v10, "loadAddress"))
    {
      if (*(_BYTE *)(a1 + 73))
      {
        objc_msgSend((id)a1, "mainBinaryLoadInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          v15 = objc_msgSend(v13, "loadAddress");
          objc_msgSend(v14, "segment");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            if (objc_msgSend(v16, "hasOffsetIntoBinary"))
            {
              objc_msgSend(v14, "segment");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v15 -= objc_msgSend(v18, "offsetIntoBinary");

            }
            else
            {
              v15 = objc_msgSend(v10, "loadAddress");
            }
          }
          if (v15 == objc_msgSend(v10, "loadAddress"))
          {
            objc_msgSend(v14, "binary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "binary");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "isEqual:", v23);

            if (v24)
            {

              goto LABEL_19;
            }
          }

LABEL_25:
          v19 = 0;
          goto LABEL_26;
        }
      }
    }
  }
  if ((-[SATask _matchesNameStr:](a1, v9) & 1) == 0)
    goto LABEL_25;
LABEL_19:
  v19 = 1;
LABEL_26:

  return v19;
}

- (void)postprocessWithDataGatheringOptions:(int)a3 mightBeAlive:(void *)a4 machineArchitecture:(uint64_t)a5 dataSource:(uint64_t)a6 spindumpArchitecture:(void *)a7 spindumpSharedCache:(int)a8 additionalCSSymbolicatorFlags:
{
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _BYTE *v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE *v22;
  void *Path;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __CFBundle *v34;
  __CFBundle *v35;
  CFURLRef v36;
  void *v37;
  BOOL v38;
  const __CFURL *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFURL *v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  NSObject *v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unsigned int v110;
  int v111;
  unsigned int v112;
  int v113;
  unsigned int v114;
  int v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  int v120;
  uint64_t v121;
  void *v122;
  void *v123;
  _BYTE *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t j;
  void *v129;
  BOOL v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t k;
  id *v135;
  _BYTE *v136;
  _BYTE *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _BOOL4 v142;
  unint64_t v143;
  unint64_t v144;
  id v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t i;
  void *v150;
  unint64_t v151;
  void *v153;
  uint64_t v154;
  void *v155;
  int v156;
  NSObject *v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  id v165;
  _QWORD *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  int v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  int v188;
  id v189;
  id obj;
  id obja;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  id v196;
  id v197;
  _QWORD v198[5];
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  char v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[128];
  _BYTE dest[12];
  __int16 v213;
  id v214;
  __int16 v215;
  uint64_t v216;
  __int16 v217;
  void *v218;
  __int16 v219;
  void *v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  uint64_t v224;
  __int16 v225;
  uint64_t v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  uint64_t v230;
  __int16 v231;
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  __int16 v237;
  uint64_t v238;
  __int16 v239;
  uint64_t v240;
  __int16 v241;
  int v242;
  __int16 v243;
  int v244;
  __int16 v245;
  int v246;
  __int16 v247;
  int v248;
  __int16 v249;
  int v250;
  __int16 v251;
  int v252;
  _BYTE v253[128];
  uint64_t v254;

  v254 = *MEMORY[0x1E0C80C00];
  v160 = a7;
  v165 = a7;
  if (a1)
  {
    v199 = 0;
    v200 = &v199;
    v201 = 0x2020000000;
    v202 = 0;
    v198[0] = MEMORY[0x1E0C809B0];
    v198[1] = 3221225472;
    v198[2] = __161__SATask_postprocessWithDataGatheringOptions_mightBeAlive_machineArchitecture_dataSource_spindumpArchitecture_spindumpSharedCache_additionalCSSymbolicatorFlags___block_invoke;
    v198[3] = &unk_1E7147838;
    v198[4] = &v199;
    v184 = a1;
    -[SATask enumerateFrames:](a1, v198);
    if ((a2 & 2) != 0)
    {
      if (a3)
      {
        -[SATask _gatherDataFromLiveProcessIsLate:mainBinaryPath:](a1, 0, 0);
        if (*((_BYTE *)v200 + 24) || !objc_msgSend(*(id *)(a1 + 248), "count", v160) || !*(_DWORD *)(a1 + 76))
          -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:](a1, a2, a8);
      }
    }
    objc_msgSend((id)a1, "mainBinary", v160);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) != 0 && !v12)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isAbsolutePath")
        && (v13 = *(void **)(a1 + 40),
            objc_copyStruct(dest, (const void *)(v184 + 288), 8, 1, 0),
            +[SABinary binaryWithPath:architecture:additionalCSSymbolicatorFlags:]((uint64_t)SABinary, v13, *(uint64_t *)dest), v14 = (void *)objc_claimAutoreleasedReturnValue(), (v15 = v14) != 0))
      {
        objc_storeStrong((id *)(v184 + 48), v14);
        v12 = v15;
      }
      else
      {
        v12 = 0;
      }
    }
    v166 = v12;
    objc_msgSend(v12, "uuid");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v184, "mainBinaryPath");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (v167)
    {
      if ((objc_msgSend(v168, "isAbsolutePath") & 1) == 0)
      {
        objc_msgSend(v166, "gatherInfoWithDataGatheringOptions:pid:", a2, *(unsigned int *)(v184 + 76));
        objc_msgSend(v166, "path");
        v22 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        v17 = v22;
        if (v22)
        {
          if (objc_msgSend(v22, "isAbsolutePath"))
          {
            v17 = v17;

            objc_msgSend((id)v184, "setMainBinaryPath:", v17);
            v168 = v17;
          }
          else if (!v168)
          {
            v17 = v17;
            Path = -[NSString copyLastPathComponent](v17);
            v19 = Path;
            if (*(_QWORD *)(v184 + 56) && objc_msgSend(Path, "hasPrefix:"))
            {
              v24 = *(void **)(v184 + 56);
              *(_QWORD *)(v184 + 56) = 0;

            }
            v168 = v17;
            goto LABEL_37;
          }
        }
        goto LABEL_38;
      }
      if ((~(_DWORD)a2 & 5) == 0)
      {
        v16 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
        v17 = v16;
        if (v16)
        {
          -[SABinaryLocator urlForUUID:](v16, v167);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(v19, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "isEqualToString:", v168))
              {

LABEL_36:
                objc_msgSend(v17, "done");
LABEL_37:

                goto LABEL_38;
              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "path");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

              if ((v27 & 1) != 0)
                goto LABEL_36;
            }
            v28 = *__error();
            _sa_logt();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v19, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)dest = 138543874;
              *(_QWORD *)&dest[4] = v167;
              v213 = 2112;
              v214 = v30;
              v215 = 2112;
              v216 = (uint64_t)v168;
              _os_log_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", dest, 0x20u);

            }
            *__error() = v28;
            -[SABinaryLocator removeURLForUUID:](v17, v167);
          }
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v168, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          -[SABinaryLocator addURL:ForUUID:](v17, v31, v167);
          v19 = v31;
          goto LABEL_36;
        }
LABEL_38:

      }
    }
    v32 = objc_msgSend(v168, "isAbsolutePath");
    if ((a2 & 1) != 0
      && ((v32 ^ 1) & 1) == 0
      && !*(_QWORD *)(v184 + 104)
      && !*(_QWORD *)(v184 + 112)
      && !*(_QWORD *)(v184 + 120)
      && !*(_QWORD *)(v184 + 128)
      && !*(_QWORD *)(v184 + 136)
      && !*(_QWORD *)(v184 + 168)
      && !*(_BYTE *)(v184 + 65)
      && !*(_QWORD *)(v184 + 176)
      && !*(_QWORD *)(v184 + 184)
      && !*(_QWORD *)(v184 + 160)
      && !*(_QWORD *)(v184 + 200)
      && !*(_BYTE *)(v184 + 66)
      && !*(_QWORD *)(v184 + 192))
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v168, 0);
      if (v33)
      {
        v34 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
        v35 = v34;
        if (v34)
        {
          obj = (id)SACFBundleCopyStringForKey(v34, (const __CFString *)*MEMORY[0x1E0C9AE88]);
          v36 = CFBundleCopyBundleURL(v35);
          if (v166)
          {
            -[SABinary saveInfoFromBundle:](v166, v35);
            -[SABinary getCodeSignInfoWithBundleUrl:](v166, v36);
          }
          if (obj)
          {
            objc_msgSend((id)v184, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "compare:", obj) == 0;

            if (!v38)
              objc_storeStrong((id *)(v184 + 104), obj);
          }
          if (v36)
          {
            v39 = v36;
            -[__CFURL pathExtension](v39, "pathExtension");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("appex"));

            if (v41)
            {
              v197 = 0;
              v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5840]), "initWithURL:error:", v39, &v197);
              v43 = v197;
              if (v42)
              {
                objc_msgSend(v42, "containingBundleRecord");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (v44)
                {
                  objc_msgSend(v44, "URL");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v46;
                  if (v46)
                  {
                    v48 = v46;

                  }
                  else
                  {
                    v188 = *__error();
                    _sa_logt();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)dest = 138412290;
                      *(_QWORD *)&dest[4] = v39;
                      _os_log_error_impl(&dword_1B9BE0000, v53, OS_LOG_TYPE_ERROR, "No parent url for %@", dest, 0xCu);
                    }

                    *__error() = v188;
                    v48 = v39;
                  }

                }
                else
                {
                  v51 = *__error();
                  _sa_logt();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)dest = 138412290;
                    *(_QWORD *)&dest[4] = v39;
                    _os_log_debug_impl(&dword_1B9BE0000, v52, OS_LOG_TYPE_DEBUG, "No parent record for %@", dest, 0xCu);
                  }

                  *__error() = v51;
                  v48 = v39;
                }

              }
              else
              {
                v49 = *__error();
                _sa_logt();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)dest = 138412546;
                  *(_QWORD *)&dest[4] = v39;
                  v213 = 2112;
                  v214 = v43;
                  _os_log_error_impl(&dword_1B9BE0000, v50, OS_LOG_TYPE_ERROR, "No extension record for %@: %@", dest, 0x16u);
                }

                *__error() = v49;
                v48 = v39;
              }

            }
            else
            {
              v43 = 0;
              v48 = v39;
            }
            v196 = v43;
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5868]), "initWithURL:allowPlaceholder:error:", v48, 1, &v196);
            v55 = v196;

            if (v54)
            {
              objc_msgSend(v54, "deviceIdentifierForVendor");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "UUIDString");
              v57 = objc_claimAutoreleasedReturnValue();
              v58 = *(void **)(v184 + 176);
              *(_QWORD *)(v184 + 176) = v57;

              objc_msgSend(v54, "iTunesMetadata");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)(v184 + 160) = objc_msgSend(v59, "storeItemIdentifier");

              objc_msgSend(v54, "iTunesMetadata");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "distributorInfo");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "distributorID");
              v62 = objc_claimAutoreleasedReturnValue();
              v63 = *(void **)(v184 + 184);
              *(_QWORD *)(v184 + 184) = v62;

              objc_msgSend(v54, "iTunesMetadata");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "storeCohortWithError:", 0);
              v65 = objc_claimAutoreleasedReturnValue();
              v66 = *(void **)(v184 + 192);
              *(_QWORD *)(v184 + 192) = v65;

              *(_BYTE *)(v184 + 65) = objc_msgSend(v54, "developerType");
              objc_msgSend(v54, "entitlements");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "objectForKey:ofClass:", CFSTR("beta-reports-active"), objc_opt_class());
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              if (v68)
                *(_BYTE *)(v184 + 66) = 1;
            }

            -[__CFURL URLByAppendingPathComponent:isDirectory:](v39, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/version.plist"), 0);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
            {
              v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v69);
              v71 = v70;
              if (v70)
              {
                v72 = SANSDictionaryCopyStringForKey(v70, (uint64_t)CFSTR("BuildVersion"));
                v73 = *(void **)(v184 + 112);
                *(_QWORD *)(v184 + 112) = v72;

                v74 = SANSDictionaryCopyStringForKey(v71, (uint64_t)CFSTR("ProjectName"));
                v75 = *(void **)(v184 + 120);
                *(_QWORD *)(v184 + 120) = v74;

                v76 = SANSDictionaryCopyStringForKey(v71, (uint64_t)CFSTR("SourceVersion"));
                v77 = *(void **)(v184 + 128);
                *(_QWORD *)(v184 + 128) = v76;

                v78 = SANSDictionaryCopyStringForKey(v71, (uint64_t)CFSTR("ProductBuildVersion"));
                v79 = *(void **)(v184 + 136);
                *(_QWORD *)(v184 + 136) = v78;

              }
            }

          }
          CFRelease(v35);

        }
      }

    }
    v80 = v184;
    if (*(_QWORD *)(v184 + 40))
    {
      objc_msgSend((id)v184, "mainBinary");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "path");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82 && objc_msgSend(v82, "isEqualToString:", *(_QWORD *)(v184 + 40)))
      {
        v83 = *(void **)(v184 + 40);
        *(_QWORD *)(v184 + 40) = 0;

      }
      v80 = v184;
    }
    if (*(_QWORD *)(v80 + 56))
    {
      objc_msgSend((id)v80, "mainBinaryPath");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = -[NSString copyLastPathComponent](v84);

      if (v85 && objc_msgSend(v85, "hasPrefix:", *(_QWORD *)(v184 + 56)))
      {
        v86 = *(void **)(v184 + 56);
        *(_QWORD *)(v184 + 56) = 0;

      }
      v80 = v184;
    }
    objc_msgSend(*(id *)(v80 + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_82);
    v209 = 0u;
    v210 = 0u;
    v207 = 0u;
    v208 = 0u;
    objc_msgSend((id)v184, "taskStates");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v207, v253, 16);
    if (v88)
    {
      v189 = v87;
      v185 = 0;
      v89 = 0;
      obja = *(id *)v208;
      do
      {
        v90 = 0;
        v91 = v89;
        v169 = v88;
        do
        {
          if (*(id *)v208 != obja)
            objc_enumerationMutation(v189);
          v92 = *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * v90);
          if (v91)
          {
            if (objc_msgSend(*(id *)(*((_QWORD *)&v207 + 1) + 8 * v90), "terminatedThreadsUserTimeInNs")
              && (v93 = objc_msgSend((id)v92, "terminatedThreadsUserTimeInNs"),
                  v93 < objc_msgSend(v91, "terminatedThreadsUserTimeInNs"))
              || objc_msgSend((id)v92, "terminatedThreadsSystemTimeInNs")
              && (v94 = objc_msgSend((id)v92, "terminatedThreadsSystemTimeInNs"),
                  v94 < objc_msgSend(v91, "terminatedThreadsSystemTimeInNs"))
              || objc_msgSend((id)v92, "terminatedThreadsInstructions")
              && (v95 = objc_msgSend((id)v92, "terminatedThreadsInstructions"),
                  v95 < objc_msgSend(v91, "terminatedThreadsInstructions"))
              || objc_msgSend((id)v92, "terminatedThreadsCycles")
              && (v96 = objc_msgSend((id)v92, "terminatedThreadsCycles"),
                  v96 < objc_msgSend(v91, "terminatedThreadsCycles"))
              || objc_msgSend((id)v92, "faults")
              && (v97 = objc_msgSend((id)v92, "faults"), v97 < objc_msgSend(v91, "faults"))
              || objc_msgSend((id)v92, "pageins")
              && (v98 = objc_msgSend((id)v92, "pageins"), v98 < objc_msgSend(v91, "pageins"))
              || objc_msgSend((id)v92, "cowFaults")
              && (v99 = objc_msgSend((id)v92, "cowFaults"), v99 < objc_msgSend(v91, "cowFaults")))
            {
              v100 = *__error();
              _sa_logt();
              v101 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)v184, "debugDescription");
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v184, "taskStates");
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = objc_msgSend(v187, "count");
                objc_msgSend(v91, "debugDescription");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v92, "debugDescription");
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                v181 = objc_msgSend(v91, "terminatedThreadsCpuTimeNs");
                v180 = objc_msgSend(v91, "terminatedThreadsUserTimeInNs");
                v179 = objc_msgSend(v91, "terminatedThreadsSystemTimeInNs");
                v178 = objc_msgSend((id)v92, "terminatedThreadsCpuTimeNs");
                v177 = objc_msgSend((id)v92, "terminatedThreadsUserTimeInNs");
                v176 = objc_msgSend((id)v92, "terminatedThreadsSystemTimeInNs");
                v175 = objc_msgSend(v91, "terminatedThreadsInstructions");
                v174 = objc_msgSend((id)v92, "terminatedThreadsInstructions");
                v173 = objc_msgSend(v91, "terminatedThreadsCycles");
                v172 = objc_msgSend((id)v92, "terminatedThreadsCycles");
                v171 = objc_msgSend(v91, "faults");
                v170 = objc_msgSend((id)v92, "faults");
                v117 = objc_msgSend(v91, "pageins");
                v118 = objc_msgSend((id)v92, "pageins");
                v119 = objc_msgSend(v91, "cowFaults");
                v120 = objc_msgSend((id)v92, "cowFaults");
                *(_DWORD *)dest = 138417410;
                *(_QWORD *)&dest[4] = v186;
                v213 = 2048;
                v214 = (id)(v185 + v90);
                v215 = 2048;
                v216 = v116;
                v217 = 2112;
                v218 = v183;
                v219 = 2112;
                v220 = v182;
                v221 = 2048;
                v222 = v181;
                v223 = 2048;
                v224 = v180;
                v225 = 2048;
                v226 = v179;
                v227 = 2048;
                v228 = v178;
                v229 = 2048;
                v230 = v177;
                v231 = 2048;
                v232 = v176;
                v233 = 2048;
                v234 = v175;
                v235 = 2048;
                v236 = v174;
                v237 = 2048;
                v238 = v173;
                v239 = 2048;
                v240 = v172;
                v241 = 1024;
                v242 = v171;
                v243 = 1024;
                v244 = v170;
                v245 = 1024;
                v246 = v117;
                v247 = 1024;
                v248 = v118;
                v249 = 1024;
                v250 = v119;
                v251 = 1024;
                v252 = v120;
                _os_log_debug_impl(&dword_1B9BE0000, v101, OS_LOG_TYPE_DEBUG, "Task %@ monotonically increasing data decreased at index %lu of %lu between %@ and %@:\nterminated threads cpu time %llu (%llu + %llu) -> %llu (%llu + %llu)\nterminated threads instructions %llu -> %llu\nterminated threads cycles %llu -> %llufaults %u -> %upageins %u -> %ucow faults %u -> %u", dest, 0xBCu);

                v88 = v169;
              }

              *__error() = v100;
            }
            v102 = objc_msgSend((id)v92, "terminatedThreadsUserTimeInNs");
            if (v102 < objc_msgSend(v91, "terminatedThreadsUserTimeInNs"))
            {
              v103 = objc_msgSend(v91, "terminatedThreadsUserTimeInNs");
              if (v92)
                *(_QWORD *)(v92 + 72) = v103;
            }
            v104 = objc_msgSend((id)v92, "terminatedThreadsSystemTimeInNs");
            if (v104 < objc_msgSend(v91, "terminatedThreadsSystemTimeInNs"))
            {
              v105 = objc_msgSend(v91, "terminatedThreadsSystemTimeInNs");
              if (v92)
                *(_QWORD *)(v92 + 80) = v105;
            }
            v106 = objc_msgSend((id)v92, "terminatedThreadsInstructions");
            if (v106 < objc_msgSend(v91, "terminatedThreadsInstructions"))
            {
              v107 = objc_msgSend(v91, "terminatedThreadsInstructions");
              if (v92)
                *(_QWORD *)(v92 + 88) = v107;
            }
            v108 = objc_msgSend((id)v92, "terminatedThreadsCycles");
            if (v108 < objc_msgSend(v91, "terminatedThreadsCycles"))
            {
              v109 = objc_msgSend(v91, "terminatedThreadsCycles");
              if (v92)
                *(_QWORD *)(v92 + 96) = v109;
            }
            v110 = objc_msgSend((id)v92, "faults");
            if (v110 < objc_msgSend(v91, "faults"))
            {
              v111 = objc_msgSend(v91, "faults");
              if (v92)
                *(_DWORD *)(v92 + 12) = v111;
            }
            v112 = objc_msgSend((id)v92, "pageins");
            if (v112 < objc_msgSend(v91, "pageins"))
            {
              v113 = objc_msgSend(v91, "pageins");
              if (v92)
                *(_DWORD *)(v92 + 16) = v113;
            }
            v114 = objc_msgSend((id)v92, "cowFaults");
            if (v114 < objc_msgSend(v91, "cowFaults"))
            {
              v115 = objc_msgSend(v91, "cowFaults");
              if (v92)
                *(_DWORD *)(v92 + 20) = v115;
            }
          }
          v89 = (id)v92;

          ++v90;
          v91 = v89;
        }
        while (v88 != v90);
        v88 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v207, v253, 16);
        v185 += v90;
      }
      while (v88);

      v87 = v189;
    }

    if (!*(_QWORD *)(v184 + 288))
      -[SATask guessArchitectureGivenMachineArchitecture:dataSource:](v184, a4, a5);
    v121 = v184;
    if (*(_QWORD *)(v184 + 264))
    {
LABEL_174:
      v135 = (id *)(v121 + 256);
      v136 = *(_BYTE **)(v121 + 256);
      if (!v136)
      {
LABEL_181:
        if (v165 && !v136)
        {
          if (!*(_BYTE *)(v184 + 72)
            && *(_QWORD *)(v184 + 288)
            && a6
            && CSArchitectureMatchesArchitecture()
            && *(_DWORD *)(v184 + 76)
            && *(_QWORD *)(v184 + 96))
          {
            v156 = *__error();
            _sa_logt();
            v157 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)v184, "debugDescription");
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)dest = 138412290;
              *(_QWORD *)&dest[4] = v159;
              _os_log_debug_impl(&dword_1B9BE0000, v157, OS_LOG_TYPE_DEBUG, "No info about the shared cache for (native architecture) process %@, assuming native shared cache", dest, 0xCu);

            }
            *__error() = v156;
            objc_storeStrong(v135, v161);
          }
          v136 = *v135;
        }
        if (!v136)
          goto LABEL_204;
        goto LABEL_186;
      }
      if ((v136[24] & 1) == 0)
      {
LABEL_186:
        v143 = objc_msgSend(v136, "startAddress");
        if (objc_msgSend(*v135, "startAddress") != -1)
        {
          v144 = objc_msgSend(*v135, "endAddress");
          v194 = 0u;
          v195 = 0u;
          v192 = 0u;
          v193 = 0u;
          v145 = *(id *)(v184 + 248);
          v146 = 0;
          v147 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v192, v211, 16);
          if (v147)
          {
            v148 = *(_QWORD *)v193;
            do
            {
              for (i = 0; i != v147; ++i)
              {
                if (*(_QWORD *)v193 != v148)
                  objc_enumerationMutation(v145);
                v150 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
                v151 = objc_msgSend(v150, "loadAddress");
                if (v151 >= v143 && v151 < v144)
                {
                  if (!v146)
                    v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
                  objc_msgSend(v146, "addObject:", v150);
                }
              }
              v147 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v192, v211, 16);
            }
            while (v147);
          }

          if (objc_msgSend(v146, "count"))
          {
            v153 = (void *)objc_msgSend(*(id *)(v184 + 248), "mutableCopy");
            objc_msgSend(v153, "removeObjectsInArray:", v146);
            v154 = objc_msgSend(v153, "copy");
            v155 = *(void **)(v184 + 248);
            *(_QWORD *)(v184 + 248) = v154;

          }
        }
LABEL_204:

        _Block_object_dispose(&v199, 8);
        goto LABEL_205;
      }
      v137 = v136;
      objc_msgSend(*v135, "uuid");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:](SASharedCache, "sharedCacheWithUUID:slide:slidBaseAddress:", v138, objc_msgSend(*v135, "slide"), objc_msgSend(*v135, "slidBaseAddress"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v139, "binaryLoadInfos");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v140, "count"))
      {

      }
      else
      {
        objc_msgSend(v137, "binaryLoadInfos");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = objc_msgSend(v141, "count") == 0;

        if (!v142)
          goto LABEL_180;
      }
      objc_storeStrong(v135, v139);
LABEL_180:

      v136 = *v135;
      goto LABEL_181;
    }
    objc_msgSend(*(id *)(v184 + 24), "objectForKeyedSubscript:", &unk_1E7167900);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v122;
    if (v122)
    {
      v209 = 0u;
      v210 = 0u;
      v207 = 0u;
      v208 = 0u;
      objc_msgSend(v122, "states");
      v124 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v207, dest, 16);
      if (v125)
      {
        v126 = 0;
        v127 = *(_QWORD *)v208;
        do
        {
          for (j = 0; j != v125; ++j)
          {
            if (*(_QWORD *)v208 != v127)
              objc_enumerationMutation(v124);
            objc_msgSend(*(id *)(*((_QWORD *)&v207 + 1) + 8 * j), "thread");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            if (v126)
            {
              v130 = v126 == v129;

              if (!v130)
              {

                goto LABEL_172;
              }
            }
            else
            {
              v126 = v129;
            }
          }
          v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v207, dest, 16);
        }
        while (v125);

        if (!v126)
          goto LABEL_173;
        v205 = 0u;
        v206 = 0u;
        v203 = 0u;
        v204 = 0u;
        objc_msgSend(v126, "threadStates");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v203, v253, 16);
        if (v132)
        {
          v133 = *(_QWORD *)v204;
          while (2)
          {
            for (k = 0; k != v132; ++k)
            {
              if (*(_QWORD *)v204 != v133)
                objc_enumerationMutation(v131);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v203 + 1) + 8 * k), "isIdleWorkQueue"))
              {

                v126 = 0;
                goto LABEL_215;
              }
            }
            v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v203, v253, 16);
            if (v132)
              continue;
            break;
          }
        }
LABEL_215:

        v158 = *(void **)(v184 + 264);
        *(_QWORD *)(v184 + 264) = v126;
        v124 = v126;

        if (v124)
          v124[17] = 1;
      }
LABEL_172:

    }
LABEL_173:

    v121 = v184;
    goto LABEL_174;
  }
LABEL_205:

}

void __161__SATask_postprocessWithDataGatheringOptions_mightBeAlive_machineArchitecture_dataSource_spindumpArchitecture_spindumpSharedCache_additionalCSSymbolicatorFlags___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v6;
  id *v7;
  id WeakRetained;
  id *v9;
  char v10;
  id *v11;

  v6 = a2;
  v7 = v6;
  v11 = v6;
  if (v6 && (WeakRetained = objc_loadWeakRetained(v6 + 3), v7 = v11, WeakRetained))
  {

    v9 = v11;
  }
  else
  {
    v10 = objc_msgSend(v7, "isFakeFrame");
    v9 = v11;
    if ((v10 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (void)_gatherDataFromLiveProcessIsLate:(void *)a3 mainBinaryPath:
{
  id v4;
  pid_t v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  char *v11;
  int v12;
  NSObject *v13;
  int v14;
  int dirty;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  char v20;
  char *v21;
  char *v22;
  size_t v23;
  size_t v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  int v29;
  int v30;
  int *v31;
  char *v32;
  char *v33;
  int64_t v34;
  const char *v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  int v40;
  int v41;
  size_t v42;
  uint8_t buf[8];
  __int16 v44;
  _BYTE v45[14];
  uint32_t flags[2];
  int v47;
  _OWORD buffer[2];
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1 && !*(_BYTE *)(a1 + 71))
  {
    v5 = *(_DWORD *)(a1 + 76);
    if (v5)
    {
      if ((v5 & 0x80000000) == 0)
      {
        *(_BYTE *)(a1 + 71) = 1;
        if (!kill(v5, 0))
        {
          v49 = 0u;
          v50 = 0u;
          memset(buffer, 0, sizeof(buffer));
          v6 = proc_pidinfo(*(_DWORD *)(a1 + 76), 13, 1uLL, buffer, 64);
          v7 = DWORD1(v49);
          if (v6)
            v8 = DWORD1(buffer[0]);
          else
            v8 = -1;
          if (!v6)
            v7 = -314;
          *(_DWORD *)(a1 + 80) = v8;
          *(_DWORD *)(a1 + 88) = v7;
          if (!v4)
          {
            SAExecutablePath(*(_DWORD *)(a1 + 76), (const char *)objc_msgSend(*(id *)(a1 + 56), "UTF8String"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v19;
            if (!v19)
              goto LABEL_3;
            if (objc_msgSend(v19, "isAbsolutePath"))
              objc_msgSend((id)a1, "setMainBinaryPath:", v4);
          }
          objc_msgSend((id)a1, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("java"));

          if (v10)
          {
            if (_gatherDataFromLiveProcessIsLate_mainBinaryPath__onceToken != -1)
              dispatch_once(&_gatherDataFromLiveProcessIsLate_mainBinaryPath__onceToken, &__block_literal_global_13);
            v11 = (char *)malloc_type_calloc(1uLL, _gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size, 0x39EB6D0EuLL);
            v42 = _gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size;
            *(_QWORD *)flags = 0x3100000001;
            v47 = *(_DWORD *)(a1 + 76);
            if (sysctl((int *)flags, 3u, v11, &v42, 0, 0))
            {
              v12 = *__error();
              _sa_logt();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                v29 = *(_DWORD *)(a1 + 76);
                v30 = *__error();
                v31 = __error();
                v32 = strerror(*v31);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&buf[4] = v29;
                v44 = 1024;
                *(_DWORD *)v45 = v30;
                *(_WORD *)&v45[4] = 2080;
                *(_QWORD *)&v45[6] = v32;
                _os_log_debug_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_DEBUG, "unable to get arguments for %d: %d %s", buf, 0x18u);
              }
            }
            else
            {
              if ((uint64_t)v42 >= 5)
              {
                v21 = &v11[v42];
                v22 = v11 + 4;
                do
                {
                  v23 = strlen(v22);
                  if (&v22[v23] >= v21)
                    break;
                  v24 = v23;
                  if (!strncmp("-jar", v22, 5uLL))
                  {
                    v22 += v24 + 1;
                    v33 = rindex(v22, 47);
                    if (v33)
                      v22 = v33 + 1;
                    v34 = strlen(v22);
                    if (v34 >= 5 && (v35 = &v22[v34 - 4], !strncmp(".jar", v35, 4uLL)))
                    {
                      *v35 = 0;
                    }
                    else
                    {
LABEL_55:
                      if (!v22)
                        break;
                    }
LABEL_56:
                    v36 = *__error();
                    _sa_logt();
                    v37 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                    {
                      v41 = *(_DWORD *)(a1 + 76);
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)&buf[4] = v41;
                      v44 = 2080;
                      *(_QWORD *)v45 = v22;
                      _os_log_debug_impl(&dword_1B9BE0000, v37, OS_LOG_TYPE_DEBUG, "Renaming java process [%d] to %s", buf, 0x12u);
                    }

                    *__error() = v36;
                    if (!*(_DWORD *)(a1 + 76) || strcmp(v22, "kernel_task"))
                    {
                      SANSStringForCString(v22);
                      v38 = objc_claimAutoreleasedReturnValue();
                      v39 = *(void **)(a1 + 56);
                      *(_QWORD *)(a1 + 56) = v38;

                    }
                    goto LABEL_20;
                  }
                  if (v24)
                  {
                    v25 = *v22;
                    if (!*v22)
                      goto LABEL_56;
                    v26 = 1;
                    while ((v25 & 0xDFu) - 65 < 0x1A || v25 == 46 || (v25 - 48) <= 9)
                    {
                      v25 = v22[v26++];
                      if (!v25)
                        goto LABEL_55;
                    }
                  }
                  v22 += v24 + 1;
                }
                while (v22 < v21);
              }
              v12 = *__error();
              _sa_logt();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v40 = *(_DWORD *)(a1 + 76);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v40;
                _os_log_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to find name for java processes [%d]", buf, 8u);
              }
            }

            *__error() = v12;
LABEL_20:
            free(v11);
          }
          if (!*(_QWORD *)(a1 + 288))
          {
            v14 = *(_DWORD *)(a1 + 76);
            *(_QWORD *)buf = 0;
            if (proc_pidinfo(v14, 19, 1uLL, buf, 8))
              *(_QWORD *)(a1 + 288) = *(unsigned int *)buf | ((unint64_t)(*(_DWORD *)&buf[4] & 0xFFFFFF) << 32);
          }
          flags[0] = 0;
          dirty = proc_get_dirty(*(_DWORD *)(a1 + 76), flags);
          if (dirty)
          {
            v16 = dirty;
            v17 = *__error();
            _sa_logt();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v27 = *(_DWORD *)(a1 + 76);
              v28 = strerror(v16);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v27;
              v44 = 2080;
              *(_QWORD *)v45 = v28;
              *(_WORD *)&v45[8] = 1024;
              *(_DWORD *)&v45[10] = v16;
              _os_log_debug_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_DEBUG, "Unable to check dirty state for %d: %s %d", buf, 0x18u);
            }

            *__error() = v17;
          }
          else
          {
            v20 = flags[0];
            if ((flags[0] & 1) != 0)
            {
              *(_BYTE *)(a1 + 68) = 1;
              *(_BYTE *)(a1 + 69) = (v20 & 2) != 0;
            }
          }
          *(_QWORD *)(a1 + 240) = 0;
        }
      }
    }
    else
    {
      *(_BYTE *)(a1 + 71) = 1;
      *(_DWORD *)(a1 + 88) = 0;
      *(_QWORD *)(a1 + 80) = 0;
    }
  }
LABEL_3:

}

uint64_t __58__SATask__gatherDataFromLiveProcessIsLate_mainBinaryPath___block_invoke()
{
  size_t v1;
  int v2[2];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  *(_QWORD *)v2 = 0x800000001;
  v1 = 4;
  return sysctl(v2, 2u, &_gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size, &v1, 0, 0);
}

- (id)leafFrameAfterAddingStack:(_QWORD *)a3 leafOfCRootFramesReplacedBySwiftAsync:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 280))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      v7 = *(void **)(a1 + 280);
      *(_QWORD *)(a1 + 280) = v6;

    }
    if (a3)
      *a3 = 0;
    v8 = *(void **)(a1 + 280);
    if (*(_DWORD *)(a1 + 76))
    {
      +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)SAFrame, v5, 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 && objc_msgSend(v5, "hasSwiftAsyncStack"))
      {
        +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)SAFrame, v5, 16, *(void **)(a1 + 280));
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)SAFrame, v5, 2, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SAFrame)truncatedUserStackFrameSwiftAsync:(SAFrame *)a1
{
  SAFrame *v2;
  id v4;
  id childFrameOrFrames;
  SAFrame *v6;
  SAFrame *v7;
  char v8;
  unsigned __int8 v9;
  SAFrame *v10;
  SAFrame *v11;

  v2 = a1;
  if (a1)
  {
    if (!a1[5]._childFrameOrFrames)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      childFrameOrFrames = v2[5]._childFrameOrFrames;
      v2[5]._childFrameOrFrames = v4;

    }
    v6 = objc_alloc_init(SAFrame);
    v7 = v6;
    if (v6)
    {
      if (a2)
        v8 = 10;
      else
        v8 = 8;
      v9 = v8 | v6->_BOOLs.bits & 0xF5;
      v6->_BOOLs.bits = v9;
      v6->_BOOLs.bits = v9 & 0xFB | (4 * (HIDWORD(v2[1]._binaryLoadInfo) == 0));
    }
    objc_msgSend(v2[5]._childFrameOrFrames, "member:", v6);
    v10 = (SAFrame *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(v2[5]._childFrameOrFrames, "addObject:", v7);
      v11 = v7;
    }
    v2 = v11;

  }
  return v2;
}

- (uint64_t)_matchesNameStr:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *Path;
  void *v16;
  void *v17;

  v3 = a2;
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend((id)a1, "name");
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    goto LABEL_6;
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v4 = v5;
    goto LABEL_5;
  }
  Path = -[NSString copyLastPathComponent](*(void **)(a1 + 40));
  v16 = Path;
  if (Path)
  {
    v6 = Path;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSString copyLastPathComponent](v17);

  }
LABEL_6:
  v7 = 0;
  if (v3 && v6)
  {
    if (objc_msgSend(v3, "length"))
    {
      if (objc_msgSend(v6, "hasPrefix:", v3))
      {
        objc_msgSend(v3, "length");
        v7 = 0;
        goto LABEL_16;
      }
      v7 = objc_msgSend(v3, "hasPrefix:", v6);
    }
    else
    {
      v7 = 0;
    }
    v8 = objc_msgSend(v3, "length");
    if ((v7 & 1) == 0 && v8)
    {
      v9 = 0;
      goto LABEL_24;
    }
  }
LABEL_16:
  v10 = objc_msgSend(v3, "length");
  if (v6)
    v11 = v7;
  else
    v11 = 1;
  v9 = 1;
  if (v10 && v11 && (!*(_DWORD *)(a1 + 76) || (objc_msgSend(v3, "isEqualToString:", CFSTR("kernel_task")) & 1) == 0))
  {
    v12 = objc_msgSend(v3, "copy");
    v13 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v12;

  }
LABEL_24:

  return v9;
}

- (BOOL)addImageInfos:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  void *v29;
  id *v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  int v59;
  NSObject *v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  NSObject *v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  char v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id obj;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  _QWORD *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_91;
  if (!v3)
  {
    v52 = 0;
    v5 = 0;
    goto LABEL_98;
  }
  if (!objc_msgSend(v3, "count"))
  {
LABEL_91:
    v52 = 0;
    v5 = v4;
    goto LABEL_98;
  }
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 248);
  v7 = (id *)(a1 + 248);
  v6 = v8;
  if (!v8 || !objc_msgSend(v6, "count"))
  {
    objc_storeStrong(v7, v5);
    v52 = 1;
    goto LABEL_98;
  }
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v5;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
  if (!v92)
  {
    v10 = 0;
    goto LABEL_93;
  }
  v9 = 0;
  v10 = 0;
  v91 = *(_QWORD *)v108;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v108 != v91)
        objc_enumerationMutation(obj);
      v93 = v11;
      v12 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v11);
      objc_msgSend(v12, "binary");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segment");
      v13 = objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v12, "length");
      v97 = (_QWORD *)v13;
      if (v96)
        v14 = 0;
      else
        v14 = v13 == 0;
      v95 = v12;
      if (v14)
      {
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        objc_msgSend(v98, "segments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reverseObjectEnumerator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v104;
          while (1)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v104 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
              if (objc_msgSend(v21, "hasOffsetIntoBinary"))
              {
                if (!objc_msgSend(v21, "length"))
                  goto LABEL_28;
                v22 = objc_msgSend(v21, "offsetIntoBinary");
                v96 = objc_msgSend(v21, "length") + v22;
LABEL_29:
                v12 = v95;
LABEL_30:

                goto LABEL_31;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
            if (!v18)
            {
LABEL_28:
              v96 = 0;
              goto LABEL_29;
            }
          }
        }
        v96 = 0;
        goto LABEL_30;
      }
      while (1)
      {
LABEL_31:
        if (v9 >= objc_msgSend(*v7, "count"))
          goto LABEL_74;
        objc_msgSend(*v7, "objectAtIndexedSubscript:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "binary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "segment");
        v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "length");
        if (v26)
          v27 = 0;
        else
          v27 = v25 == 0;
        if (v27)
        {
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          objc_msgSend(v24, "segments");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "reverseObjectEnumerator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
          if (v26)
          {
            v94 = v10;
            v30 = v7;
            v31 = *(_QWORD *)v100;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v100 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
                if (objc_msgSend(v33, "hasOffsetIntoBinary"))
                {
                  if (objc_msgSend(v33, "length"))
                  {
                    v34 = objc_msgSend(v33, "offsetIntoBinary");
                    v26 = objc_msgSend(v33, "length") + v34;
                  }
                  else
                  {
                    v26 = 0;
                  }
                  goto LABEL_49;
                }
              }
              v26 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
              if (v26)
                continue;
              break;
            }
LABEL_49:
            v7 = v30;
            v10 = v94;
            v12 = v95;
          }

        }
        v35 = objc_msgSend(v23, "loadAddress");
        if (!v26)
          break;
        if (v35 + v26 > objc_msgSend(v12, "loadAddress"))
          goto LABEL_55;
LABEL_70:

        ++v9;
      }
      if (v35 < objc_msgSend(v12, "loadAddress"))
        goto LABEL_70;
LABEL_55:
      v36 = objc_msgSend(v23, "loadAddress");
      v37 = objc_msgSend(v12, "loadAddress");
      if (v96)
      {
        if (v36 >= v37 + v96)
          goto LABEL_73;
LABEL_59:
        if (v24 != v98)
          goto LABEL_82;
        if (v25 == v97)
        {
          v25 = v97;
          objc_msgSend(v23, "loadAddress");
          objc_msgSend(v12, "loadAddress");
LABEL_81:
          v24 = v98;
LABEL_82:

          goto LABEL_83;
        }
        if (v25 && v97)
          goto LABEL_81;
        if (!v25)
        {
          v44 = objc_msgSend(v23, "loadAddress");
          if (v44 > objc_msgSend(v12, "loadAddress"))
            goto LABEL_80;
          v45 = objc_msgSend(v23, "loadAddress");
          v46 = v12;
          v47 = objc_msgSend(v23, "length") + v45;
          v48 = objc_msgSend(v46, "loadAddress");
          if (v47 < objc_msgSend(v46, "length") + v48)
            goto LABEL_80;
          v49 = objc_msgSend(v46, "loadAddress");
          v50 = v49 - objc_msgSend(v23, "loadAddress");
          if ((objc_msgSend(v97, "hasOffsetIntoBinary") & 1) != 0)
          {
            if (objc_msgSend(v97, "offsetIntoBinary") == v50)
              goto LABEL_80;
LABEL_102:
            v73 = *__error();
            _sa_logt();
            v74 = objc_claimAutoreleasedReturnValue();
            v75 = v46;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v23, "debugDescription");
              v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v77 = objc_msgSend(v76, "UTF8String");
              objc_msgSend(v75, "debugDescription");
              v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v79 = objc_msgSend(v78, "UTF8String");
              *(_DWORD *)buf = 136315394;
              v112 = v77;
              v113 = 2080;
              v114 = v79;
              _os_log_error_impl(&dword_1B9BE0000, v74, OS_LOG_TYPE_ERROR, "load info for entire binary %s doesn't match segment load info %s", buf, 0x16u);

            }
            *__error() = v73;
            objc_msgSend(v23, "debugDescription");
            v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v81 = objc_msgSend(v80, "UTF8String");
            objc_msgSend(v75, "debugDescription");
            v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v82, "UTF8String");
            _SASetCrashLogMessage(1544, "load info for entire binary %s doesn't match segment load info %s", v83, v84, v85, v86, v87, v88, v81);

            _os_crash();
            __break(1u);
          }
          if (v97)
          {
            v25 = 0;
            v97[5] = v50;
          }
          else
          {
LABEL_80:
            v25 = 0;
          }
          goto LABEL_81;
        }
        v38 = objc_msgSend(v12, "loadAddress");
        if (v38 > objc_msgSend(v23, "loadAddress"))
          goto LABEL_81;
        v39 = objc_msgSend(v12, "loadAddress");
        v40 = objc_msgSend(v12, "length") + v39;
        v41 = objc_msgSend(v23, "loadAddress");
        if (v40 < objc_msgSend(v23, "length") + v41)
          goto LABEL_81;
        v42 = objc_msgSend(v23, "loadAddress");
        v43 = v42 - objc_msgSend(v12, "loadAddress");
        if ((objc_msgSend(v25, "hasOffsetIntoBinary") & 1) != 0)
        {
          if (objc_msgSend(v25, "offsetIntoBinary") != v43)
          {
            v59 = *__error();
            _sa_logt();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v12, "debugDescription");
              v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v62 = objc_msgSend(v61, "UTF8String");
              objc_msgSend(v23, "debugDescription");
              v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v64 = objc_msgSend(v63, "UTF8String");
              *(_DWORD *)buf = 136315394;
              v112 = v62;
              v113 = 2080;
              v114 = v64;
              _os_log_error_impl(&dword_1B9BE0000, v60, OS_LOG_TYPE_ERROR, "load info for entire binary %s doesn't match segment load info %s", buf, 0x16u);

              v12 = v95;
            }

            *__error() = v59;
            objc_msgSend(v12, "debugDescription");
            v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v66 = objc_msgSend(v65, "UTF8String");
            objc_msgSend(v23, "debugDescription");
            v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v46, "UTF8String");
            _SASetCrashLogMessage(1520, "load info for entire binary %s doesn't match segment load info %s", v67, v68, v69, v70, v71, v72, v66);

            _os_crash();
            __break(1u);
            goto LABEL_102;
          }
          if (v10)
            goto LABEL_69;
LABEL_72:
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        }
        else
        {
          v25[5] = v43;
          if (!v10)
            goto LABEL_72;
        }
LABEL_69:
        objc_msgSend(v10, "addObject:", v23);
        goto LABEL_70;
      }
      if (v36 <= v37)
        goto LABEL_59;
LABEL_73:

LABEL_74:
      objc_msgSend(v90, "addObject:", v12);
LABEL_83:

      v11 = v93 + 1;
    }
    while (v93 + 1 != v92);
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
    v92 = v51;
  }
  while (v51);
LABEL_93:
  v5 = obj;

  v53 = objc_msgSend(v90, "count");
  v52 = v53 != 0;
  if (v53)
  {
    v54 = (void *)objc_msgSend(*v7, "mutableCopy");
    v55 = v54;
    if (v10)
      objc_msgSend(v54, "removeObjectsInArray:", v10);
    objc_msgSend(v55, "addObjectsFromArray:", v90);
    objc_msgSend(v55, "sortUsingComparator:", &__block_literal_global_60);
    v56 = objc_msgSend(v55, "copy");
    v57 = *v7;
    *v7 = (id)v56;

  }
LABEL_98:

  return v52;
}

- (uint64_t)correspondsToUniquePid:(void *)a3 name:(NSObject *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(NSObject *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:
{
  id v17;
  uint64_t v18;

  v17 = a9;
  if (a1 && *(_QWORD *)(a1 + 96) == a2)
  {
    if (a2)
    {
      v18 = -[SATask correspondsToName:loadInfos:numLoadInfos:architecture:sharedCache:](a1, a3, a4, a5, a8, v17);
    }
    else
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:](a1, a4, a5, a6, a7);
      if (!*(_QWORD *)(a1 + 288))
        *(_QWORD *)(a1 + 288) = a8;
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (uint64_t)correspondsToPid:(void *)a3 name:(NSObject *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(NSObject *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:
{
  id v17;
  uint64_t v18;

  v17 = a9;
  if (a1 && *(_DWORD *)(a1 + 76) == a2)
  {
    if (a2)
    {
      v18 = -[SATask correspondsToName:loadInfos:numLoadInfos:architecture:sharedCache:](a1, a3, a4, a5, a8, v17);
    }
    else
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:](a1, a4, a5, a6, a7);
      if (!*(_QWORD *)(a1 + 288))
        *(_QWORD *)(a1 + 288) = a8;
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __24__SATask_addImageInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "loadAddress");
  if (v6 >= objc_msgSend(v5, "loadAddress"))
  {
    v8 = objc_msgSend(v4, "loadAddress");
    v7 = v8 > objc_msgSend(v5, "loadAddress");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SATask name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ [%d]"), v4, self->_pid);

  return (NSString *)v5;
}

- (void)fixupThreadSuspension
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = malloc_type_calloc(objc_msgSend(v2, "count"), 8uLL, 0x100004000313F17uLL);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = *(id *)(a1 + 8);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v9, "isSuspended"))
          {
            objc_msgSend(v9, "startTimestamp");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "endTimestamp");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v9, "startSampleIndex");
            v13 = objc_msgSend(v9, "endSampleIndex");
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __31__SATask_fixupThreadSuspension__block_invoke;
            v16[3] = &unk_1E7149DF8;
            v17 = v10;
            v18 = v11;
            v19 = v3;
            v20 = v12;
            v21 = v13;
            v14 = v11;
            v15 = v10;
            objc_msgSend(v2, "enumerateObjectsUsingBlock:", v16);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    free(v3);
  }
}

void __31__SATask_fixupThreadSuspension__block_invoke(NSObject *a1, void *a2, uint64_t a3)
{
  _BYTE *v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  Class v15;
  uint64_t v16;
  const char *v17;
  Class isa;
  id *v19;
  unint64_t v20;
  Class v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  _BYTE *v30;
  const char *v31;
  unint64_t v32;
  Class v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  Class v39;
  void *v40;
  Class v41;
  void *v42;
  unint64_t v43;
  NSObject *v44;
  id v45;
  void *v46;
  char v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  Class v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  Class v72;
  Class v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  NSObject *v85;
  Class v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  Class v101;
  Class v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  Class v114;
  Class v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  Class v127;
  Class v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  Class v140;
  Class v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  Class v153;
  Class v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSObject *v165;
  Class v166;
  Class v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  NSObject *v178;
  Class v179;
  Class v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  NSObject *v192;
  Class v193;
  id v194;
  uint64_t v195;
  void *v196;
  id v197;
  uint64_t v198;
  Class v199;
  id v200;
  void *v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  id v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  uint8_t buf[4];
  unint64_t v222;
  __int16 v223;
  uint64_t v224;
  __int16 v225;
  uint64_t v226;
  __int16 v227;
  Class v228;
  __int16 v229;
  uint64_t v230;
  __int16 v231;
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v212 = a2;
  v5 = *((_QWORD *)a1[6].isa + a3);
  objc_msgSend(v212, "threadStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
    goto LABEL_74;
  v8 = v212;
  while (1)
  {
    objc_msgSend(v8, "threadStates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "le:", a1[4].isa) & 1) != 0)
      goto LABEL_71;
    if ((-[objc_class le:](a1[5].isa, "le:", v11) & 1) != 0)
      break;
    if ((objc_msgSend(v10, "isSuspended") & 1) != 0)
      goto LABEL_71;
    v13 = -[objc_class gt:](a1[4].isa, "gt:", v11);
    v14 = -[objc_class lt:](a1[5].isa, "lt:", v12);
    if (v13 && (a1[7].isa || a1[8].isa == (Class)0x7FFFFFFFFFFFFFFFLL))
    {
      v210 = objc_msgSend(v10, "startSampleIndex");
      v15 = (Class)objc_msgSend(v10, "endSampleIndex");
      v16 = objc_msgSend(v10, "copy");
      v3 = v10;
      if (v16)
        objc_setProperty_atomic((id)v16, v17, a1[4].isa, 56);
      if (v3)
        objc_setProperty_atomic(v3, v17, a1[4].isa, 48);
      isa = a1[8].isa;
      v19 = (id *)v212;
      if (v15 == (Class)0x7FFFFFFFFFFFFFFFLL)
      {
        if (isa != (Class)0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_88;
LABEL_38:
        -[SAThread insertState:atIndex:](v19, (void *)v16, v5++);

        goto LABEL_39;
      }
      if (isa == (Class)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_91;
      v209 = (unint64_t)v15;
      v20 = v210;
      if (v210 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = a1[7].isa;
        if (v21 == (Class)0x7FFFFFFFFFFFFFFFLL)
          v22 = (unint64_t)a1[8].isa;
        else
          v22 = (unint64_t)v21 - 1;
        -[SAThreadState setEndSampleIndex:](v16, v22);
        if (v22 < v210)
        {
          v23 = v16;
          goto LABEL_26;
        }
        if (v209 <= v22)
        {
          v23 = (uint64_t)v3;
LABEL_26:
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v24 = v22 + 1;
          v23 = (uint64_t)v3;
        }
        -[SAThreadState setStartSampleIndex:](v23, v24);
        v20 = v210;
      }
      if ((objc_msgSend((id)v16, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend(v3, "startSampleIndex") != v20)
        && (objc_msgSend((id)v16, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend((id)v16, "startSampleIndex") != v20))
      {
        goto LABEL_100;
      }
      if (objc_msgSend((id)v16, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = objc_msgSend((id)v16, "endSampleIndex");
        if (v25 < objc_msgSend((id)v16, "startSampleIndex"))
          goto LABEL_109;
      }
      if (objc_msgSend(v3, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = objc_msgSend(v3, "endSampleIndex");
        if (v26 < objc_msgSend(v3, "startSampleIndex"))
          goto LABEL_112;
      }
      v27 = objc_msgSend(v3, "endSampleIndex");
      v28 = v27 >= objc_msgSend((id)v16, "endSampleIndex");
      v19 = (id *)v212;
      if (!v28)
        goto LABEL_94;
      goto LABEL_38;
    }
LABEL_39:
    if (!v14)
      goto LABEL_66;
    v15 = (Class)objc_msgSend(v10, "startSampleIndex");
    v29 = objc_msgSend(v10, "endSampleIndex");
    v3 = (_BYTE *)objc_msgSend(v10, "copy");
    v30 = v10;
    v16 = (uint64_t)v30;
    if (v30)
      objc_setProperty_atomic(v30, v31, a1[5].isa, 56);
    if (v3)
      objc_setProperty_atomic(v3, v31, a1[5].isa, 48);
    v32 = (unint64_t)a1[8].isa;
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_82;
      if (v15 != (Class)0x7FFFFFFFFFFFFFFFLL)
      {
        -[SAThreadState setEndSampleIndex:](v16, v32);
        v33 = a1[8].isa;
        if (v33 < v15)
        {
          v34 = v16;
          goto LABEL_54;
        }
        if (v29 <= (unint64_t)v33)
        {
          v34 = (uint64_t)v3;
LABEL_54:
          v35 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v35 = (unint64_t)v33 + 1;
          v34 = (uint64_t)v3;
        }
        -[SAThreadState setStartSampleIndex:](v34, v35);
      }
      v210 = v29;
      if ((objc_msgSend((id)v16, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL
         || (Class)objc_msgSend(v3, "startSampleIndex") != v15)
        && (objc_msgSend((id)v16, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL
         || (Class)objc_msgSend((id)v16, "startSampleIndex") != v15))
      {
        goto LABEL_97;
      }
      if (objc_msgSend((id)v16, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v36 = objc_msgSend((id)v16, "endSampleIndex");
        if (v36 < objc_msgSend((id)v16, "startSampleIndex"))
          goto LABEL_103;
      }
      if (objc_msgSend(v3, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v37 = objc_msgSend(v3, "endSampleIndex");
        if (v37 < objc_msgSend(v3, "startSampleIndex"))
          goto LABEL_106;
      }
      v38 = objc_msgSend(v3, "endSampleIndex");
      if (v38 < objc_msgSend((id)v16, "endSampleIndex"))
        goto LABEL_85;
      goto LABEL_65;
    }
    if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_79;
LABEL_65:
    -[SAThread insertState:atIndex:]((id *)v212, v3, v5 + 1);

LABEL_66:
    if (a1[7].isa)
    {
      v39 = a1[4].isa;
      objc_msgSend(v10, "startTimestamp");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = -[objc_class le:](v39, "le:", v40);

      if ((v39 & 1) == 0)
        goto LABEL_115;
    }
    v41 = a1[5].isa;
    objc_msgSend(v10, "endTimestamp");
    v15 = (Class)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = -[objc_class ge:](v41, "ge:", v15);

    if ((v41 & 1) == 0)
    {
      v16 = *__error();
      _sa_logt();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        -[objc_class debugDescription](a1[5].isa, "debugDescription");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = (Class)objc_msgSend(v45, "UTF8String");
        objc_msgSend(v10, "endTimestamp");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "debugDescription");
        v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315394;
        v222 = (unint64_t)v15;
        v223 = 2080;
        v224 = objc_msgSend(v3, "UTF8String");
        _os_log_error_impl(&dword_1B9BE0000, v44, OS_LOG_TYPE_ERROR, "taskSuspendEndTime %s < threadState.endTimestamp %s", buf, 0x16u);

      }
      *__error() = v16;
      -[objc_class debugDescription](a1[5].isa, "debugDescription");
      a1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v47 = -[NSObject UTF8String](a1, "UTF8String");
      objc_msgSend(v10, "endTimestamp");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "debugDescription");
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v49, "UTF8String");
      _SASetCrashLogMessage(1794, "taskSuspendEndTime %s < threadState.endTimestamp %s", v50, v51, v52, v53, v54, v55, v47);

      _os_crash();
      __break(1u);
LABEL_79:
      v29 = *__error();
      _sa_logt();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = a1[8].isa;
        *(_DWORD *)buf = 134217984;
        v222 = (unint64_t)v57;
        _os_log_error_impl(&dword_1B9BE0000, v56, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", buf, 0xCu);
      }

      *__error() = v29;
      _SASetCrashLogMessage(1749, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", v58, v59, v60, v61, v62, v63, (char)a1[8].isa);
      _os_crash();
      __break(1u);
LABEL_82:
      v64 = *__error();
      _sa_logt();
      a1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v222 = v29;
        _os_log_error_impl(&dword_1B9BE0000, a1, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", buf, 0xCu);
      }

      *__error() = v64;
      _SASetCrashLogMessage(1752, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", v65, v66, v67, v68, v69, v70, v29);
      _os_crash();
      __break(1u);
LABEL_85:
      v213 = *__error();
      _sa_logt();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v73 = a1[7].isa;
        v72 = a1[8].isa;
        v74 = objc_msgSend((id)v16, "startSampleIndex");
        v75 = objc_msgSend((id)v16, "endSampleIndex");
        v76 = objc_msgSend(v3, "startSampleIndex");
        v77 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = (unint64_t)v15;
        v223 = 2048;
        v224 = v210;
        v225 = 2048;
        v226 = (uint64_t)v73;
        v227 = 2048;
        v228 = v72;
        v229 = 2048;
        v230 = v74;
        v231 = 2048;
        v232 = v75;
        v233 = 2048;
        v234 = v76;
        v235 = 2048;
        v236 = v77;
        _os_log_error_impl(&dword_1B9BE0000, v71, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v213;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1781, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v78, v79, v80, v81, v82, v83, (char)v15);
      _os_crash();
      __break(1u);
LABEL_88:
      v84 = *__error();
      _sa_logt();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v86 = a1[8].isa;
        *(_DWORD *)buf = 134217984;
        v222 = (unint64_t)v86;
        _os_log_error_impl(&dword_1B9BE0000, v85, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", buf, 0xCu);
      }

      *__error() = v84;
      _SASetCrashLogMessage(1676, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", v87, v88, v89, v90, v91, v92, (char)a1[8].isa);
      _os_crash();
      __break(1u);
LABEL_91:
      v93 = *__error();
      _sa_logt();
      a1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v222 = (unint64_t)v15;
        _os_log_error_impl(&dword_1B9BE0000, a1, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", buf, 0xCu);
      }

      *__error() = v93;
      _SASetCrashLogMessage(1679, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", v94, v95, v96, v97, v98, v99, (char)v15);
      _os_crash();
      __break(1u);
LABEL_94:
      v214 = *__error();
      _sa_logt();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        v101 = a1[7].isa;
        v102 = a1[8].isa;
        v103 = objc_msgSend((id)v16, "startSampleIndex");
        v104 = objc_msgSend((id)v16, "endSampleIndex");
        v105 = objc_msgSend(v3, "startSampleIndex");
        v106 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = v210;
        v223 = 2048;
        v224 = v209;
        v225 = 2048;
        v226 = (uint64_t)v101;
        v227 = 2048;
        v228 = v102;
        v229 = 2048;
        v230 = v103;
        v231 = 2048;
        v232 = v104;
        v233 = 2048;
        v234 = v105;
        v235 = 2048;
        v236 = v106;
        _os_log_error_impl(&dword_1B9BE0000, v100, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v214;
      v15 = a1[8].isa;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1722, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v107, v108, v109, v110, v111, v112, v210);
      _os_crash();
      __break(1u);
LABEL_97:
      v215 = *__error();
      _sa_logt();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v115 = a1[7].isa;
        v114 = a1[8].isa;
        v116 = objc_msgSend((id)v16, "startSampleIndex");
        v117 = objc_msgSend((id)v16, "endSampleIndex");
        v118 = objc_msgSend(v3, "startSampleIndex");
        v119 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = (unint64_t)v15;
        v223 = 2048;
        v224 = v210;
        v225 = 2048;
        v226 = (uint64_t)v115;
        v227 = 2048;
        v228 = v114;
        v229 = 2048;
        v230 = v116;
        v231 = 2048;
        v232 = v117;
        v233 = 2048;
        v234 = v118;
        v235 = 2048;
        v236 = v119;
        _os_log_error_impl(&dword_1B9BE0000, v113, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v215;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1778, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v120, v121, v122, v123, v124, v125, (char)v15);
      _os_crash();
      __break(1u);
LABEL_100:
      v216 = *__error();
      _sa_logt();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        v127 = a1[7].isa;
        v128 = a1[8].isa;
        v129 = objc_msgSend((id)v16, "startSampleIndex");
        v130 = objc_msgSend((id)v16, "endSampleIndex");
        v131 = objc_msgSend(v3, "startSampleIndex");
        v132 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = v210;
        v223 = 2048;
        v224 = v209;
        v225 = 2048;
        v226 = (uint64_t)v127;
        v227 = 2048;
        v228 = v128;
        v229 = 2048;
        v230 = v129;
        v231 = 2048;
        v232 = v130;
        v233 = 2048;
        v234 = v131;
        v235 = 2048;
        v236 = v132;
        _os_log_error_impl(&dword_1B9BE0000, v126, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v216;
      v15 = a1[8].isa;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1719, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v133, v134, v135, v136, v137, v138, v210);
      _os_crash();
      __break(1u);
LABEL_103:
      v217 = *__error();
      _sa_logt();
      v139 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      {
        v141 = a1[7].isa;
        v140 = a1[8].isa;
        v142 = objc_msgSend((id)v16, "startSampleIndex");
        v143 = objc_msgSend((id)v16, "endSampleIndex");
        v144 = objc_msgSend(v3, "startSampleIndex");
        v145 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = (unint64_t)v15;
        v223 = 2048;
        v224 = v210;
        v225 = 2048;
        v226 = (uint64_t)v141;
        v227 = 2048;
        v228 = v140;
        v229 = 2048;
        v230 = v142;
        v231 = 2048;
        v232 = v143;
        v233 = 2048;
        v234 = v144;
        v235 = 2048;
        v236 = v145;
        _os_log_error_impl(&dword_1B9BE0000, v139, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v217;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1779, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v146, v147, v148, v149, v150, v151, (char)v15);
      _os_crash();
      __break(1u);
LABEL_106:
      v218 = *__error();
      _sa_logt();
      v152 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        v154 = a1[7].isa;
        v153 = a1[8].isa;
        v155 = objc_msgSend((id)v16, "startSampleIndex");
        v156 = objc_msgSend((id)v16, "endSampleIndex");
        v157 = objc_msgSend(v3, "startSampleIndex");
        v158 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = (unint64_t)v15;
        v223 = 2048;
        v224 = v210;
        v225 = 2048;
        v226 = (uint64_t)v154;
        v227 = 2048;
        v228 = v153;
        v229 = 2048;
        v230 = v155;
        v231 = 2048;
        v232 = v156;
        v233 = 2048;
        v234 = v157;
        v235 = 2048;
        v236 = v158;
        _os_log_error_impl(&dword_1B9BE0000, v152, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v218;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1780, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v159, v160, v161, v162, v163, v164, (char)v15);
      _os_crash();
      __break(1u);
LABEL_109:
      v219 = *__error();
      _sa_logt();
      v165 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
      {
        v166 = a1[7].isa;
        v167 = a1[8].isa;
        v168 = objc_msgSend((id)v16, "startSampleIndex");
        v169 = objc_msgSend((id)v16, "endSampleIndex");
        v170 = objc_msgSend(v3, "startSampleIndex");
        v171 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = v210;
        v223 = 2048;
        v224 = v209;
        v225 = 2048;
        v226 = (uint64_t)v166;
        v227 = 2048;
        v228 = v167;
        v229 = 2048;
        v230 = v168;
        v231 = 2048;
        v232 = v169;
        v233 = 2048;
        v234 = v170;
        v235 = 2048;
        v236 = v171;
        _os_log_error_impl(&dword_1B9BE0000, v165, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v219;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1720, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v172, v173, v174, v175, v176, v177, v210);
      _os_crash();
      __break(1u);
LABEL_112:
      v220 = *__error();
      _sa_logt();
      v178 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
      {
        v179 = a1[7].isa;
        v180 = a1[8].isa;
        v181 = objc_msgSend((id)v16, "startSampleIndex");
        v182 = objc_msgSend((id)v16, "endSampleIndex");
        v183 = objc_msgSend(v3, "startSampleIndex");
        v184 = objc_msgSend(v3, "endSampleIndex");
        *(_DWORD *)buf = 134219776;
        v222 = v210;
        v223 = 2048;
        v224 = v209;
        v225 = 2048;
        v226 = (uint64_t)v179;
        v227 = 2048;
        v228 = v180;
        v229 = 2048;
        v230 = v181;
        v231 = 2048;
        v232 = v182;
        v233 = 2048;
        v234 = v183;
        v235 = 2048;
        v236 = v184;
        _os_log_error_impl(&dword_1B9BE0000, v178, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v220;
      a1 = objc_msgSend((id)v16, "startSampleIndex");
      v10 = (_BYTE *)objc_msgSend((id)v16, "endSampleIndex");
      objc_msgSend(v3, "startSampleIndex");
      objc_msgSend(v3, "endSampleIndex");
      _SASetCrashLogMessage(1721, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v185, v186, v187, v188, v189, v190, v210);
      _os_crash();
      __break(1u);
LABEL_115:
      v191 = *__error();
      _sa_logt();
      v192 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
      {
        v193 = a1[7].isa;
        -[objc_class debugDescription](a1[4].isa, "debugDescription");
        v194 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v195 = objc_msgSend(v194, "UTF8String");
        objc_msgSend(v10, "startTimestamp");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "debugDescription");
        v197 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v198 = objc_msgSend(v197, "UTF8String");
        *(_DWORD *)buf = 134218498;
        v222 = (unint64_t)v193;
        v223 = 2080;
        v224 = v195;
        v225 = 2080;
        v226 = v198;
        _os_log_error_impl(&dword_1B9BE0000, v192, OS_LOG_TYPE_ERROR, "taskSuspendStartSampleIndex %lu and taskSuspendStartTime %s >= threadState.startTimestamp %s", buf, 0x20u);

      }
      *__error() = v191;
      v199 = a1[7].isa;
      -[objc_class debugDescription](a1[4].isa, "debugDescription");
      v200 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v200, "UTF8String");
      objc_msgSend(v10, "startTimestamp");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "debugDescription");
      v202 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v202, "UTF8String");
      _SASetCrashLogMessage(1793, "taskSuspendStartSampleIndex %lu and taskSuspendStartTime %s >= threadState.startTimestamp %s", v203, v204, v205, v206, v207, v208, (char)v199);

      _os_crash();
      __break(1u);
    }
    if (v10)
      v10[11] |= 0x40u;
LABEL_71:

    ++v5;
    objc_msgSend(v212, "threadStates");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    v8 = v212;
    if (v5 >= v43)
      goto LABEL_75;
  }

LABEL_74:
  v8 = v212;
LABEL_75:
  *((_QWORD *)a1[6].isa + a3) = v5;

}

void __48__SATask_forwardFillMonotonicallyIncreasingData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  -[SAThread forwardFillMonotonicallyIncreasingData](a3);
}

- (void)isAliveAtTimestamp:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "startTimestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "gt:", v3) & 1) == 0)
    {
      objc_msgSend(a1, "endTimestamp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "lt:", v3);

      a1 = (void *)(v7 ^ 1u);
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

void __24__SATask_startTimestamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "creationTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_3;
  objc_msgSend(v9, "threadStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_3:
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    if (!v8)
    {
LABEL_6:
      objc_storeStrong((id *)(v7 + 40), v4);
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "gt:", v4))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (id)endTimestamp
{
  SATimestamp *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *threads;
  SATimestamp *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  SATimestamp *v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v3 = self->_exitTimestamp;
  v16 = v3;
  if (!v3)
  {
    -[NSMutableArray lastObject](self->_taskStates, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTimestamp");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v12[5];
    v12[5] = v5;

    v3 = (SATimestamp *)v12[5];
    if (!v3)
    {
      threads = self->_threads;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __22__SATask_endTimestamp__block_invoke;
      v10[3] = &unk_1E7147860;
      v10[4] = &v11;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v10);
      v3 = (SATimestamp *)v12[5];
    }
  }
  v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __22__SATask_endTimestamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "exitTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_3;
  objc_msgSend(v9, "threadStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_3:
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    if (!v8)
    {
LABEL_6:
      objc_storeStrong((id *)(v7 + 40), v4);
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "lt:", v4))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_6;
    }
  }
LABEL_7:

}

uint64_t __47__SATask_sampleCountInTimestampRangeStart_end___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "sampleCountInTimestampRangeStart:end:", a1[4], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += result;
  return result;
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  NSObject *p_super;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    v21 = *__error();
    _sa_logt();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v41 = a3;
      v42 = 2048;
      v43 = a4;
      _os_log_error_impl(&dword_1B9BE0000, p_super, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu > endSampleIndexCap %lu", buf, 0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(1976, "startSampleIndexCap %lu > endSampleIndexCap %lu", v22, v23, v24, v25, v26, v27, a3);
    _os_crash();
    __break(1u);
    goto LABEL_33;
  }
  p_super = &self->super;
  -[NSMutableArray firstObject](self->_taskStates, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v16 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v9, "endSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    v28 = *__error();
    _sa_logt();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[NSObject debugDescription](p_super, "debugDescription");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = objc_msgSend(v30, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v41 = v31;
      _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "Asking for sample count based on sample indexes when there are no sample indexes: %s", buf, 0xCu);

    }
    *__error() = v28;
    -[NSObject debugDescription](p_super, "debugDescription");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "UTF8String");
    _SASetCrashLogMessage(1983, "Asking for sample count based on sample indexes when there are no sample indexes: %s", v34, v35, v36, v37, v38, v39, v33);

    _os_crash();
    __break(1u);
  }
  -[objc_class lastObject](p_super[1].isa, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "endSampleIndex");
  if (v12 >= a4)
    v13 = a4;
  else
    v13 = v12;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    v14 = v12;
  else
    v14 = v13;
  if (objc_msgSend(v10, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v15 = objc_msgSend(v10, "endSampleIndex");
  else
    v15 = objc_msgSend(v10, "startSampleIndex");
  if (v15 <= a3)
    v17 = a3;
  else
    v17 = v15;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = v15;
  v18 = v14 >= v17;
  v19 = v14 - v17;
  if (v18)
    v16 = v19 + 1;
  else
    v16 = 0;

LABEL_29:
  return v16;
}

- (void)cpuTimeNs:(_QWORD *)a3 cpuInstructions:(_QWORD *)a4 cpuCycles:(_QWORD *)a5 nonThreadCpuTimeNs:(_QWORD *)a6 nonThreadCpuInstructions:(_QWORD *)a7 nonThreadCpuCycles:(void *)a8 betweenStartTime:(void *)a9 endTime:
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  int v47;
  NSObject *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  char v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  void *v70;
  _QWORD *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD *v77;
  id v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  _BYTE *v82;
  uint64_t *v83;
  uint64_t *v84;
  BOOL v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  _BYTE buf[24];
  uint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v16 = a8;
  v17 = a9;
  if (!a1)
    goto LABEL_47;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  v102 = 0;
  v103 = &v102;
  v104 = 0x2020000000;
  v105 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v71 = a1;
  objc_msgSend(a1, "lastTaskStateOnOrBeforeTime:sampleIndex:", v17, 0x7FFFFFFFFFFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v18, "terminatedThreadsCpuTimeNs");
  v66 = a4;
  v67 = a5;
  v64 = a2;
  v65 = a3;
  if (!v18
    || v16
    && (objc_msgSend(v18, "endTimestamp"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "gt:", v16),
        v19,
        !v20))
  {
    v24 = 0;
LABEL_25:
    v70 = 0;
    goto LABEL_26;
  }
  v21 = objc_msgSend(v18, "terminatedThreadsCpuTimeNs");
  v103[3] += v21;
  v22 = objc_msgSend(v18, "terminatedThreadsInstructions");
  v99[3] += v22;
  v23 = objc_msgSend(v18, "terminatedThreadsCycles");
  v95[3] += v23;
  objc_msgSend(v18, "endTimestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v25 = (void *)v71[28];
    if (v25)
    {
      if (!objc_msgSend(v25, "lt:", v16))
        goto LABEL_25;
    }
  }
  objc_msgSend(v71, "firstTaskStateOnOrAfterTime:sampleIndex:", v16, 0x7FFFFFFFFFFFFFFFLL);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v70 = v26;
  if (!v26
    || v17
    && (objc_msgSend(v26, "startTimestamp"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "le:", v17),
        v28,
        v27 = v70,
        (v29 & 1) == 0))
  {
    v47 = *__error();
    _sa_logt();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v27, "startTimestamp");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "debugDescription");
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v51 = objc_msgSend(v50, "UTF8String");
      objc_msgSend(v17, "debugDescription");
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v53 = objc_msgSend(v52, "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v53;
      _os_log_error_impl(&dword_1B9BE0000, v48, OS_LOG_TYPE_ERROR, "firstTaskState.startTimestamp %s > endTimestamp %s", buf, 0x16u);

    }
    *__error() = v47;
    objc_msgSend(v70, "startTimestamp");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "debugDescription");
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v56 = objc_msgSend(v55, "UTF8String");
    objc_msgSend(v17, "debugDescription");
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v57, "UTF8String");
    _SASetCrashLogMessage(2060, "firstTaskState.startTimestamp %s > endTimestamp %s", v58, v59, v60, v61, v62, v63, v56);

    _os_crash();
    __break(1u);
  }
  v30 = objc_msgSend(v27, "terminatedThreadsCpuTimeNs");
  v103[3] -= v30;
  v31 = objc_msgSend(v27, "terminatedThreadsInstructions");
  v99[3] -= v31;
  v32 = objc_msgSend(v27, "terminatedThreadsCycles");
  v95[3] -= v32;
LABEL_26:
  v33 = v68 != 0;
  if (v17)
    v34 = v17;
  else
    v34 = v24;
  v35 = v34;

  v69 = a7;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v107 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  v36 = (void *)v71[2];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __134__SATask_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_betweenStartTime_endTime___block_invoke;
  v72[3] = &unk_1E7149E88;
  v17 = v35;
  v73 = v17;
  v85 = v33;
  v37 = v24;
  v74 = v37;
  v38 = v18;
  v75 = v38;
  v79 = &v102;
  v80 = &v98;
  v81 = &v94;
  v82 = buf;
  v83 = &v90;
  v84 = &v86;
  v76 = v16;
  v77 = v71;
  v39 = v70;
  v78 = v39;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v72);
  v40 = *(_QWORD *)&buf[8];
  v41 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  v42 = v103;
  v43 = v91;
  v44 = v99;
  if (v41 <= v103[3])
  {
    v45 = v87;
    v46 = v95;
    if (v91[3] <= (unint64_t)v99[3] && v87[3] <= (unint64_t)v95[3])
      goto LABEL_34;
  }
  else
  {
    v45 = v87;
    v46 = v95;
  }
  v103[3] = v41;
  v44[3] = v43[3];
  v46[3] = v45[3];
LABEL_34:
  if (v64)
    *v64 = v42[3];
  if (v65)
    *v65 = v44[3];
  if (v66)
    *v66 = v46[3];
  if (v67)
    *v67 = v42[3] - *(_QWORD *)(v40 + 24);
  if (a6)
    *a6 = v44[3] - v43[3];
  if (v69)
    *v69 = v46[3] - v45[3];

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);
LABEL_47:

}

void __134__SATask_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_betweenStartTime_endTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  unint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isGlobalForcedIdle") & 1) == 0 && (objc_msgSend(v5, "isProcessorIdleThread") & 1) == 0)
  {
    objc_msgSend(v5, "lastThreadStateOnOrBeforeTime:sampleIndex:", *(_QWORD *)(a1 + 32), 0x7FFFFFFFFFFFFFFFLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v12 = 1;
      goto LABEL_29;
    }
    if (!*(_BYTE *)(a1 + 128))
      goto LABEL_20;
    objc_msgSend(v6, "endTimestamp");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_20;
    v9 = (void *)v8;
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v7, "endTimestamp");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "lt:", *(_QWORD *)(a1 + 32)) & 1) == 0
        || (v11 = (_QWORD *)(a1 + 40), !*(_QWORD *)(a1 + 40)))
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v11 = (_QWORD *)(a1 + 40);
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_19;
    }
    objc_msgSend(v7, "endTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "lt:", *v11))
    {
      objc_msgSend(v5, "exitTimestamp");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v5, "exitTimestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "le:", *v11);

        if (v10)
        {

          if ((v17 & 1) == 0)
          {
LABEL_20:
            v17 = 0;
LABEL_21:
            v18 = 1;
            goto LABEL_22;
          }
        }
        else
        {

          if (!v17)
            goto LABEL_21;
        }
        v18 = objc_msgSend(*(id *)(a1 + 48), "terminatedThreadsCycles") == 0;
        v17 = 1;
LABEL_22:
        if (*(_QWORD *)(a1 + 56))
        {
          objc_msgSend(v7, "endTimestamp");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "ge:", *(_QWORD *)(a1 + 56));

          if (!v20)
            goto LABEL_44;
        }
        v12 = v17 ^ 1;
        if ((v17 & 1) == 0)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += objc_msgSend(v7, "cpuTimeNs");
        if (v18)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += objc_msgSend(v7, "instructions");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) += objc_msgSend(v7, "cycles");
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) += objc_msgSend(v7, "cpuTimeNs");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) += objc_msgSend(v7, "instructions");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) += objc_msgSend(v7, "cycles");
LABEL_29:
        objc_msgSend(v5, "creationTimestamp");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21 && *(_QWORD *)(a1 + 56))
        {
          objc_msgSend(v5, "creationTimestamp");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "lt:", *(_QWORD *)(a1 + 56));

          if (!v24)
          {
LABEL_44:

            goto LABEL_45;
          }
        }
        else
        {

        }
        objc_msgSend(v5, "firstThreadStateOnOrAfterTime:sampleIndex:", *(_QWORD *)(a1 + 56), 0x7FFFFFFFFFFFFFFFLL);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          if (!*(_QWORD *)(a1 + 32)
            || (objc_msgSend(v25, "startTimestamp"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v28 = objc_msgSend(v27, "le:", *(_QWORD *)(a1 + 32)),
                v27,
                v28))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            if (v29 >= objc_msgSend(v26, "cpuTimeNs"))
            {
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) -= objc_msgSend(v26, "cpuTimeNs");
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) -= objc_msgSend(v26, "instructions");
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) -= objc_msgSend(v26, "cycles");
            }
            else
            {
              v30 = *__error();
              _sa_logt();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(a1 + 64), "debugDescription");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v5, "threadId");
                v32 = objc_msgSend(v26, "cpuTimeNs");
                v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
                v43 = v32;
                v41 = objc_msgSend(v7, "cpuTimeNs");
                v40 = objc_msgSend(*(id *)(a1 + 72), "terminatedThreadsCpuTimeNs");
                v39 = objc_msgSend(*(id *)(a1 + 48), "terminatedThreadsCpuTimeNs");
                objc_msgSend(v26, "debugDescription");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "debugDescription");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "exitTimestamp");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "debugDescription");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 48), "debugDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = *(unsigned __int8 *)(a1 + 128);
                objc_msgSend(*(id *)(a1 + 56), "debugDescription");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "debugDescription");
                *(_DWORD *)buf = 138415874;
                v49 = v47;
                v50 = 2048;
                v51 = v44;
                v52 = 2048;
                v53 = v43;
                v54 = 2048;
                v55 = v42;
                v56 = 2048;
                v57 = v41;
                v58 = 2048;
                v59 = v40;
                v60 = 2048;
                v61 = v39;
                v62 = 2112;
                v63 = v46;
                v64 = 2112;
                v65 = v38;
                v66 = 2112;
                v67 = v33;
                v68 = 2112;
                v69 = v34;
                v70 = 1024;
                v71 = v37;
                v72 = 1024;
                v73 = v12;
                v74 = 2112;
                v75 = v36;
                v76 = 2112;
                v77 = objc_claimAutoreleasedReturnValue();
                v35 = (void *)v77;
                _os_log_error_impl(&dword_1B9BE0000, v31, OS_LOG_TYPE_ERROR, "%@ thread 0x%llx starting cpu time %llu < taskCpuTimeNs %llu\nlastThreadState.cpuTimeNs: %llu\nfirstTaskState.terminatedThreadsCpuTimeNs: %llu\nlastTaskState.terminatedThreadsCpuTimeNs: %llu\nfirstThreadState: %@\nlastThreadState: %@\nthread.exitTimestamp: %@\nlastTaskState: %@\ntaskHasTimeInTerminatedThreads: %d\naddEndCPU: %d\nstartTimestamp: %@\nendTimestamp: %@", buf, 0x90u);

              }
              *__error() = v30;
            }
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) -= objc_msgSend(v26, "cpuTimeNs");
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) -= objc_msgSend(v26, "instructions");
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) -= objc_msgSend(v26, "cycles");
          }
        }

        goto LABEL_44;
      }
    }

    if (v10)
      goto LABEL_18;
LABEL_19:

    goto LABEL_20;
  }
LABEL_45:

}

- (void)cpuTimeNs:(unint64_t *)a3 cpuInstructions:(unint64_t *)a4 cpuCycles:(unint64_t *)a5 betweenStartTime:(id)a6 endTime:(id)a7
{
  -[SATask cpuTimeNs:cpuInstructions:cpuCycles:nonThreadCpuTimeNs:nonThreadCpuInstructions:nonThreadCpuCycles:betweenStartTime:endTime:](self, a3, a4, a5, 0, 0, 0, a6, a7);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)fixupFrameInstructionsWithDataGatheringOptions:(int)a3 mightBeAlive:(_BYTE *)a4 foundNewBinaryInfo:(void *)a5 uuidsWithNewInstructions:(int)a6 additionalCSSymbolicatorFlags:
{
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  void *v42;
  int v43;
  uint64_t v44;
  int v45;
  _BYTE *v46;
  id v47;
  id *v48;
  uint64_t v49;
  id obj;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (!a1)
    goto LABEL_52;
  if (a4)
    *a4 = 0;
  if (!a1[35])
    goto LABEL_52;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = a1[31];
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (!v12)
  {
    v13 = 0;
    v37 = obj;
LABEL_40:

    goto LABEL_42;
  }
  v43 = a3;
  v44 = a2;
  v45 = a6;
  v46 = a4;
  v47 = v11;
  v48 = a1;
  v13 = 0;
  v14 = *(_QWORD *)v58;
  v15 = obj;
  v49 = *(_QWORD *)v58;
  v16 = v12;
  do
  {
    v17 = 0;
    v52 = v16;
    do
    {
      if (*(_QWORD *)v58 != v14)
        objc_enumerationMutation(v15);
      v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v17);
      objc_msgSend(v18, "segment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(v18, "binary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "segments");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "count"))
          goto LABEL_34;
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "hasOffsetIntoBinary") && objc_msgSend(v22, "offsetIntoBinary") < 0)
        {
LABEL_27:
          if (!v13)
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v48[31]);
          objc_msgSend(v13, "removeObject:", v18);
          v33 = objc_msgSend(v18, "loadAddress");
          v34 = objc_msgSend(v18, "isInKernelAddressSpace");
          objc_msgSend(v18, "exclave");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[SABinaryLoadInfo loadInfosForSegmentsInBinary:binaryBaseAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v20, v33, v34, v23);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v35);

LABEL_31:
          v14 = v49;
          v15 = obj;
        }
        else
        {
          if (!objc_msgSend(v20, "length"))
            goto LABEL_33;
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(v21, "reverseObjectEnumerator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
          if (v24)
          {
            v25 = v24;
            v51 = v13;
            v26 = *(_QWORD *)v54;
LABEL_17:
            v27 = 0;
            while (1)
            {
              if (*(_QWORD *)v54 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v27);
              if (objc_msgSend(v28, "hasOffsetIntoBinary"))
                break;
              if (v25 == ++v27)
              {
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
                if (v25)
                  goto LABEL_17;
                goto LABEL_30;
              }
            }
            if (objc_msgSend(v28, "offsetIntoBinary") <= 0)
            {
LABEL_30:
              v13 = v51;
              goto LABEL_31;
            }
            v29 = objc_msgSend(v28, "offsetIntoBinary");
            v30 = objc_msgSend(v28, "length") + v29;
            v31 = objc_msgSend(v20, "length");

            v32 = v30 > v31;
            v15 = obj;
            v13 = v51;
            v14 = v49;
            v16 = v52;
            if (v32)
              goto LABEL_27;
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
        }

        v16 = v52;
        goto LABEL_33;
      }
LABEL_35:
      ++v17;
    }
    while (v17 != v16);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  }
  while (v16);

  if (v13)
  {
    +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v13);
    v36 = objc_msgSend(v13, "copy");
    v11 = v47;
    a1 = v48;
    v37 = v48[31];
    v48[31] = (id)v36;
    a4 = v46;
    a6 = v45;
    a2 = v44;
    a3 = v43;
    goto LABEL_40;
  }
  v11 = v47;
  a1 = v48;
  a4 = v46;
  a6 = v45;
  a2 = v44;
  a3 = v43;
LABEL_42:
  if (+[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]((uint64_t)SAFrame, a1[35], a1[31], a1[32], v11)&& a3&& -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:]((uint64_t)a1, a2, a6))
  {
    if (a4)
      *a4 = 1;
    v38 = +[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]((uint64_t)SAFrame, a1[35], a1[31], a1[32], v11);
    if (v38)
    {
      v39 = v38;
      v40 = *__error();
      _sa_logt();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1, "debugDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v42;
        v63 = 2048;
        v64 = v39;
        _os_log_debug_impl(&dword_1B9BE0000, v41, OS_LOG_TYPE_DEBUG, "%@: still have %lu frames with missing load info after getting load info from the live process", buf, 0x16u);

      }
      *__error() = v40;
    }
  }

LABEL_52:
}

- (uint64_t)isFromCurrentBootCycle
{
  unint64_t v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (unint64_t)self;
  if (self)
  {
    v3 = objc_getProperty(self, a2, 272, 1);
    v4 = v3;
    if (!v3 || (objc_msgSend(v3, "wallTime"), v5 == 0.0))
    {
      objc_msgSend((id)v2, "startTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v7 = 0.0;
      if (v8)
      {
        objc_msgSend(v8, "wallTime");
        if (v10 != 0.0)
        {
          objc_msgSend(v9, "wallTime");
          v7 = v11;
        }
      }

    }
    else
    {
      objc_msgSend(v4, "wallTime");
      v7 = v6;
    }

    if (v7 == 0.0)
    {
      objc_msgSend((id)v2, "sharedCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend((id)v2, "sharedCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SASharedCache currentSharedCache](SASharedCache, "currentSharedCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v13 == v14;

        return v2;
      }
    }
    else if (v7 > SATimeOfBootForLiveMachine())
    {
      return 1;
    }
    return 0;
  }
  return v2;
}

- (NSDictionary)dispatchQueues
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)swiftTasks
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (int)ppid
{
  return self->_ppid;
}

- (NSString)bundleName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)bundleBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)bundleSourceVersion
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)bundleProductBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (unint64_t)resourceCoalitionID
{
  return self->_resourceCoalitionID;
}

- (NSString)resourceCoalitionName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (NSString)installerVersionID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)vendorID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)distributorID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (char)developerType
{
  return self->_developerType;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (NSString)cohortID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)appType
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)commerceAppID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)commerceExternalID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (SATimestamp)execTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 224, 1);
}

- (SATimestamp)exitTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)isUnresponsive
{
  return self->_isUnresponsive;
}

- (double)timeOfLastResponse
{
  return self->_timeOfLastResponse;
}

- (BOOL)usesSuddenTermination
{
  return self->_usesSuddenTermination;
}

- (BOOL)allowsIdleExit
{
  return self->_allowsIdleExit;
}

- (BOOL)isTranslocated
{
  return self->_isTranslocated;
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (SASharedCache)sharedCache
{
  return (SASharedCache *)objc_getProperty(self, a2, 256, 1);
}

- (SAThread)mainThread
{
  return (SAThread *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFrames, 0);
  objc_storeStrong((id *)&self->_pidStartTimestamp, 0);
  objc_storeStrong((id *)&self->_mainThread, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_binaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_exitTimestamp, 0);
  objc_storeStrong((id *)&self->_execTimestamp, 0);
  objc_storeStrong((id *)&self->_commerceExternalID, 0);
  objc_storeStrong((id *)&self->_commerceAppID, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_cohortID, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_installerVersionID, 0);
  objc_storeStrong((id *)&self->_resourceCoalitionName, 0);
  objc_storeStrong((id *)&self->_bundleProductBuildVersion, 0);
  objc_storeStrong((id *)&self->_bundleSourceVersion, 0);
  objc_storeStrong((id *)&self->_bundleProjectName, 0);
  objc_storeStrong((id *)&self->_bundleBuildVersion, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mainBinary, 0);
  objc_storeStrong((id *)&self->_mainBinaryPath, 0);
  objc_storeStrong((id *)&self->_swiftTasks, 0);
  objc_storeStrong((id *)&self->_dispatchQueues, 0);
  objc_storeStrong((id *)&self->_threads, 0);
  objc_storeStrong((id *)&self->_taskStates, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SATask");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSMutableSet count](self->_rootFrames, "count");
  v4 = -[NSArray count](self->_binaryLoadInfos, "count") + v3;
  v5 = -[NSMutableArray count](self->_taskStates, "count");
  v6 = v4 + v5 + -[NSMutableDictionary count](self->_threads, "count");
  v7 = -[NSMutableDictionary count](self->_dispatchQueues, "count");
  return 8 * (v6 + v7 + -[NSMutableDictionary count](self->_swiftTasks, "count")) + 245;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v5;
  id v9;
  char v10;
  char v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  _CSArchitecture *v15;
  unsigned int v16;
  _CSArchitecture *v17;
  unsigned int v18;
  _CSArchitecture *v19;
  unint64_t v20;
  void *v21;
  unsigned int v22;
  char *v23;
  unint64_t v24;
  void *v25;
  char *v26;
  unsigned int v27;
  unint64_t v28;
  void *v29;
  uint64_t *v30;
  int v32;
  NSObject *v33;
  id v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  NSUInteger v60;
  id v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  NSObject *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  unint64_t v114;
  id v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  NSObject *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  int v137;
  uint8_t buf[4];
  uint64_t v139;
  __int16 v140;
  _BYTE v141[10];
  unint64_t v142;
  int v143;
  __int16 v144;
  int v145;
  __int16 v146;
  uint64_t v147;
  __int16 v148;
  unint64_t v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v32 = *__error();
    _sa_logt();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v139 = objc_msgSend(v34, "UTF8String");
      v140 = 2048;
      *(_QWORD *)v141 = -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v141[8] = 2048;
      v142 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v33, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v32;
    -[SATask debugDescription](self, "debugDescription");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = objc_msgSend(v35, "UTF8String");
    -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(2864, "%s: size %lu != buffer length %lu", v37, v38, v39, v40, v41, v42, v36);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  *(_WORD *)&a3->var0 = 2305;
  *(_DWORD *)(&a3->var1 + 1) = self->_pid;
  *(int *)((char *)&a3->var2 + 2) = self->_ppid;
  *(int *)((char *)&a3->var3 + 2) = self->_rpid;
  *(int *)((char *)&a3->var4 + 2) = self->_uid;
  *(_QWORD *)((char *)&a3->var5 + 2) = self->_uniquePid;
  *(unint64_t *)((char *)&a3->var10 + 2) = *(_QWORD *)&self->_timeOfLastResponse;
  *(unint64_t *)((char *)&a3->var18 + 6) = (unint64_t)self->_architecture;
  v10 = BYTE6(a3->var19) & 0xFE | self->_isUnresponsive;
  BYTE6(a3->var19) = v10;
  v11 = v10 & 0xFD | (2 * self->_usesSuddenTermination);
  BYTE6(a3->var19) = v11;
  v12 = v11 & 0xF3 | (4 * self->_allowsIdleExit);
  BYTE6(a3->var19) = v12;
  BYTE6(a3->var19) = v12 & 0xE7 | (16 * self->_isTranslocated);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v9);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleName, v9);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_execTimestamp, v9);
  *(unint64_t *)((char *)&a3->var9 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_exitTimestamp, v9);
  *(_QWORD *)((char *)&a3->var15 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainThread, v9);
  *(_QWORD *)((char *)&a3->var16 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainBinaryPath, v9);
  *(unint64_t *)((char *)&a3->var17 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_sharedCache, v9);
  if ((unint64_t)-[NSMutableSet count](self->_rootFrames, "count") >= 0xFFFFFFFF)
  {
LABEL_13:
    v43 = *__error();
    _sa_logt();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = objc_msgSend(v45, "UTF8String");
      v47 = -[NSMutableSet count](self->_rootFrames, "count");
      *(_DWORD *)buf = 136315394;
      v139 = v46;
      v140 = 2048;
      *(_QWORD *)v141 = v47;
      _os_log_error_impl(&dword_1B9BE0000, v44, OS_LOG_TYPE_ERROR, "%s: %lu rootFrames", buf, 0x16u);

    }
    *__error() = v43;
    -[SATask debugDescription](self, "debugDescription");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49 = objc_msgSend(v48, "UTF8String");
    -[NSMutableSet count](self->_rootFrames, "count");
    _SASetCrashLogMessage(2891, "%s: %lu rootFrames", v50, v51, v52, v53, v54, v55, v49);

    _os_crash();
    __break(1u);
    goto LABEL_16;
  }
  v13 = -[NSMutableSet count](self->_rootFrames, "count");
  *(_DWORD *)((char *)&a3->var11 + 2) = v13;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var20, v13, self->_rootFrames, v9);
  if (-[NSArray count](self->_binaryLoadInfos, "count") >= 0xFFFFFFFF)
  {
LABEL_16:
    v56 = *__error();
    _sa_logt();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v59 = objc_msgSend(v58, "UTF8String");
      v60 = -[NSArray count](self->_binaryLoadInfos, "count");
      *(_DWORD *)buf = 136315394;
      v139 = v59;
      v140 = 2048;
      *(_QWORD *)v141 = v60;
      _os_log_error_impl(&dword_1B9BE0000, v57, OS_LOG_TYPE_ERROR, "%s: %lu binaryLoadInfos", buf, 0x16u);

    }
    *__error() = v56;
    -[SATask debugDescription](self, "debugDescription");
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v62 = objc_msgSend(v61, "UTF8String");
    -[NSArray count](self->_binaryLoadInfos, "count");
    _SASetCrashLogMessage(2896, "%s: %lu binaryLoadInfos", v63, v64, v65, v66, v67, v68, v62);

    _os_crash();
    __break(1u);
    goto LABEL_19;
  }
  v14 = -[NSArray count](self->_binaryLoadInfos, "count");
  *(_DWORD *)((char *)&a3->var11 + 6) = v14;
  v15 = &a3->var20 + *(unsigned int *)((char *)&a3->var11 + 2);
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v15, v14, self->_binaryLoadInfos, v9);
  if ((unint64_t)-[NSMutableArray count](self->_taskStates, "count") >= 0xFFFFFFFF)
  {
LABEL_19:
    v69 = *__error();
    _sa_logt();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v72 = objc_msgSend(v71, "UTF8String");
      v73 = -[NSMutableArray count](self->_taskStates, "count");
      *(_DWORD *)buf = 136315394;
      v139 = v72;
      v140 = 2048;
      *(_QWORD *)v141 = v73;
      _os_log_error_impl(&dword_1B9BE0000, v70, OS_LOG_TYPE_ERROR, "%s: %lu taskStates", buf, 0x16u);

    }
    *__error() = v69;
    -[SATask debugDescription](self, "debugDescription");
    v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v75 = objc_msgSend(v74, "UTF8String");
    -[NSMutableArray count](self->_taskStates, "count");
    _SASetCrashLogMessage(2901, "%s: %lu taskStates", v76, v77, v78, v79, v80, v81, v75);

    _os_crash();
    __break(1u);
    goto LABEL_22;
  }
  v16 = -[NSMutableArray count](self->_taskStates, "count");
  *(unsigned int *)((char *)&a3->var12 + 2) = v16;
  v17 = &v15[*(unsigned int *)((char *)&a3->var11 + 6)];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v17, v16, self->_taskStates, v9);
  if ((unint64_t)-[NSMutableDictionary count](self->_threads, "count") >= 0xFFFFFFFF)
  {
LABEL_22:
    v82 = *__error();
    _sa_logt();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v85 = objc_msgSend(v84, "UTF8String");
      v86 = -[NSMutableDictionary count](self->_threads, "count");
      *(_DWORD *)buf = 136315394;
      v139 = v85;
      v140 = 2048;
      *(_QWORD *)v141 = v86;
      _os_log_error_impl(&dword_1B9BE0000, v83, OS_LOG_TYPE_ERROR, "%s: %lu threads", buf, 0x16u);

    }
    *__error() = v82;
    -[SATask debugDescription](self, "debugDescription");
    v87 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v88 = objc_msgSend(v87, "UTF8String");
    -[NSMutableDictionary count](self->_threads, "count");
    _SASetCrashLogMessage(2906, "%s: %lu threads", v89, v90, v91, v92, v93, v94, v88);

    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  v18 = -[NSMutableDictionary count](self->_threads, "count");
  *(unsigned int *)((char *)&a3->var13 + 2) = v18;
  v19 = &v17[*(unsigned int *)((char *)&a3->var12 + 2)];
  v20 = v18;
  -[NSMutableDictionary allValues](self->_threads, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v19, v20, v21, v9);

  if ((unint64_t)-[NSMutableDictionary count](self->_dispatchQueues, "count") >= 0xFFFFFFFF)
  {
LABEL_25:
    v95 = *__error();
    _sa_logt();
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v98 = objc_msgSend(v97, "UTF8String");
      v99 = -[NSMutableDictionary count](self->_dispatchQueues, "count");
      *(_DWORD *)buf = 136315394;
      v139 = v98;
      v140 = 2048;
      *(_QWORD *)v141 = v99;
      _os_log_error_impl(&dword_1B9BE0000, v96, OS_LOG_TYPE_ERROR, "%s: %lu dispatchQueues", buf, 0x16u);

    }
    *__error() = v95;
    -[SATask debugDescription](self, "debugDescription");
    a3 = ($9C2647CC3345766B7A73D9718A82D31E *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v100 = -[$9C2647CC3345766B7A73D9718A82D31E UTF8String](a3, "UTF8String");
    -[NSMutableDictionary count](self->_dispatchQueues, "count");
    _SASetCrashLogMessage(2911, "%s: %lu dispatchQueues", v101, v102, v103, v104, v105, v106, v100);

    _os_crash();
    __break(1u);
    goto LABEL_28;
  }
  v22 = -[NSMutableDictionary count](self->_dispatchQueues, "count");
  *(unsigned int *)((char *)&a3->var14 + 2) = v22;
  v23 = (char *)&v19[*(unsigned int *)((char *)&a3->var13 + 2)];
  v24 = v22;
  -[NSMutableDictionary allValues](self->_dispatchQueues, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v23, v24, v25, v9);

  v26 = &v23[8 * *(unsigned int *)((char *)&a3->var14 + 2)];
  v5 = v26 + 109 - (char *)a3;
  if (v5 > (int64_t)-[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
  {
LABEL_28:
    v137 = *__error();
    _sa_logt();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v136 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v108 = objc_msgSend(v136, "UTF8String");
      v109 = *(_DWORD *)((char *)&a3->var11 + 2);
      v110 = *(_DWORD *)((char *)&a3->var11 + 6);
      v111 = *(unsigned int *)((char *)&a3->var12 + 2);
      v112 = *(unsigned int *)((char *)&a3->var13 + 2);
      v113 = *(unsigned int *)((char *)&a3->var14 + 2);
      v114 = -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136316930;
      v139 = v108;
      v140 = 1024;
      *(_DWORD *)v141 = v109;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v110;
      LOWORD(v142) = 1024;
      *(_DWORD *)((char *)&v142 + 2) = v111;
      HIWORD(v142) = 1024;
      v143 = v112;
      v144 = 1024;
      v145 = v113;
      v146 = 2048;
      v147 = v5;
      v148 = 2048;
      v149 = v114;
      _os_log_error_impl(&dword_1B9BE0000, v107, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u rootFrames, %u loadInfos, %u task states, %u threads, %u dispatch queues), ended with length %ld, should be %lu", buf, 0x3Eu);

    }
    *__error() = v137;
    -[SATask debugDescription](self, "debugDescription");
    v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v116 = objc_msgSend(v115, "UTF8String");
    -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(2918, "%s: after serializing (with %u rootFrames, %u loadInfos, %u task states, %u threads, %u dispatch queues), ended with length %ld, should be %lu", v117, v118, v119, v120, v121, v122, v116);

    _os_crash();
    __break(1u);
LABEL_31:
    v123 = *__error();
    _sa_logt();
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      -[SATask debugDescription](self, "debugDescription");
      v125 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v126 = objc_msgSend(v125, "UTF8String");
      v127 = -[NSMutableDictionary count](self->_swiftTasks, "count");
      *(_DWORD *)buf = 136315394;
      v139 = v126;
      v140 = 2048;
      *(_QWORD *)v141 = v127;
      _os_log_error_impl(&dword_1B9BE0000, v124, OS_LOG_TYPE_ERROR, "%s: %lu swiftTasks", buf, 0x16u);

    }
    *__error() = v123;
    -[SATask debugDescription](self, "debugDescription");
    v128 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v129 = objc_msgSend(v128, "UTF8String");
    -[NSMutableDictionary count](self->_swiftTasks, "count");
    _SASetCrashLogMessage(2941, "%s: %lu swiftTasks", v130, v131, v132, v133, v134, v135, v129);

    _os_crash();
    __break(1u);
  }
  *(_QWORD *)v26 = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleBuildVersion, v9);
  *((_QWORD *)v26 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleProjectName, v9);
  *((_QWORD *)v26 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleSourceVersion, v9);
  *((_QWORD *)v26 + 3) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleProductBuildVersion, v9);
  *((_QWORD *)v26 + 7) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainBinary, v9);
  *((_QWORD *)v26 + 4) = -1;
  *((_QWORD *)v26 + 5) = SASerializableIndexForPointerFromSerializationDictionary(self->_installerVersionID, v9);
  *((_QWORD *)v26 + 8) = self->_adamID;
  *((_QWORD *)v26 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_vendorID, v9);
  *((_QWORD *)v26 + 9) = SASerializableIndexForPointerFromSerializationDictionary(self->_appType, v9);
  *((_QWORD *)v26 + 10) = SASerializableIndexForPointerFromSerializationDictionary(self->_cohortID, v9);
  BYTE6(a3->var19) = BYTE6(a3->var19) & 0xDF | (32 * self->_isBeta);
  *((_QWORD *)v26 + 11) = SASerializableIndexForPointerFromSerializationDictionary(self->_pidStartTimestamp, v9);
  v26[96] = self->_developerType;
  *(_QWORD *)(v26 + 97) = self->_resourceCoalitionID;
  if ((unint64_t)-[NSMutableDictionary count](self->_swiftTasks, "count") >= 0xFFFFFFFF)
    goto LABEL_31;
  v27 = -[NSMutableDictionary count](self->_swiftTasks, "count");
  *(_DWORD *)(v26 + 105) = v27;
  v28 = v27;
  -[NSMutableDictionary allValues](self->_swiftTasks, "allValues");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v26 + 109, v28, v29, v9);

  v30 = (uint64_t *)&v26[8 * *(unsigned int *)(v26 + 105) + 109];
  *v30 = SASerializableIndexForPointerFromSerializationDictionary(self->_distributorID, v9);
  v30[1] = SASerializableIndexForPointerFromSerializationDictionary(self->_resourceCoalitionName, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *threads;
  uint64_t v23;
  id v24;
  NSMutableDictionary *dispatchQueues;
  id v26;
  NSMutableDictionary *swiftTasks;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleName, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleBuildVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleProjectName, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleSourceVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleProductBuildVersion, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_execTimestamp, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_exitTimestamp, "addSelfToSerializationDictionary:", v4);
    -[SAThread addSelfToSerializationDictionary:](self->_mainThread, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_mainBinaryPath, "addSelfToSerializationDictionary:", v4);
    -[SABinary addSelfToSerializationDictionary:](self->_mainBinary, "addSelfToSerializationDictionary:", v4);
    -[SASharedCache addSelfToSerializationDictionary:](self->_sharedCache, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_installerVersionID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_vendorID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_distributorID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_appType, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_cohortID, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_pidStartTimestamp, "addSelfToSerializationDictionary:", v4);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = self->_rootFrames;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v44;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4);
        }
        while (v9 != v11);
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v9);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = self->_binaryLoadInfos;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v16++), "addSelfToSerializationDictionary:", v4);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v14);
    }

    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v35 = 0u;
    v17 = self->_taskStates;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v21++), "addSelfToSerializationDictionary:", v4);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v19);
    }

    threads = self->_threads;
    v23 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke;
    v33[3] = &unk_1E7147888;
    v24 = v4;
    v34 = v24;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v33);
    dispatchQueues = self->_dispatchQueues;
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_2;
    v31[3] = &unk_1E7149EB0;
    v26 = v24;
    v32 = v26;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dispatchQueues, "enumerateKeysAndObjectsUsingBlock:", v31);
    swiftTasks = self->_swiftTasks;
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_3;
    v29[3] = &unk_1E7149ED8;
    v28 = v26;
    v30 = v28;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](swiftTasks, "enumerateKeysAndObjectsUsingBlock:", v29);
    -[NSString addSelfToSerializationDictionary:](self->_resourceCoalitionName, "addSelfToSerializationDictionary:", v28);

  }
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addSelfToSerializationDictionary:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addSelfToSerializationDictionary:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addSelfToSerializationDictionary:", *(_QWORD *)(a1 + 32));
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  id result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  _BYTE v31[10];
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 0xAu)
    goto LABEL_11;
  if (a4 <= 0x77)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v29 = a4;
      v30 = 2048;
      *(_QWORD *)v31 = 120;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(3013, "bufferLength %lu < serialized SATask struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)(vaddvq_s32(*(int32x4_t *)((char *)a3 + 66)) + *(_DWORD *)((char *)a3 + 82))
     + 120 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(v5 + 66);
      v17 = *(_DWORD *)(v5 + 70);
      v18 = *(_DWORD *)(v5 + 74);
      v19 = *(_DWORD *)(v5 + 78);
      v20 = *(_DWORD *)(v5 + 82);
      *(_DWORD *)buf = 134219264;
      v29 = a4;
      v30 = 1024;
      *(_DWORD *)v31 = v16;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v17;
      v32 = 1024;
      v33 = v18;
      v34 = 1024;
      v35 = v19;
      v36 = 1024;
      v37 = v20;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v14;
    _SASetCrashLogMessage(3014, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v21, v22, v23, v24, v25, v26, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATask version"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)SATask, *(unsigned int *)((char *)a3 + 2), *(_QWORD *)((char *)a3 + 18), 0, 0);
  result = (id)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)result + 19) = *(_DWORD *)(v5 + 2);
  *((_DWORD *)result + 20) = *(_DWORD *)(v5 + 6);
  *((_DWORD *)result + 21) = *(_DWORD *)(v5 + 10);
  *((_DWORD *)result + 22) = *(_DWORD *)(v5 + 14);
  *((_QWORD *)result + 12) = *(_QWORD *)(v5 + 18);
  *((_QWORD *)result + 30) = *(_QWORD *)(v5 + 58);
  *((_QWORD *)result + 36) = *(_QWORD *)(v5 + 110);
  *((_BYTE *)result + 67) = *(_BYTE *)(v5 + 118) & 1;
  *((_BYTE *)result + 68) = (*(_BYTE *)(v5 + 118) & 2) != 0;
  *((_BYTE *)result + 69) = (*(_BYTE *)(v5 + 118) & 4) != 0;
  *((_BYTE *)result + 70) = (*(_BYTE *)(v5 + 118) & 0x10) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  char *v6;
  unint64_t *v7;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSString *v17;
  NSString *name;
  unint64_t v19;
  void *v20;
  NSString *v21;
  NSString *bundleName;
  unint64_t v23;
  void *v24;
  SATimestamp *v25;
  SATimestamp *execTimestamp;
  unint64_t v27;
  void *v28;
  SATimestamp *v29;
  SATimestamp *exitTimestamp;
  unint64_t v31;
  void *v32;
  SAThread *v33;
  SAThread *mainThread;
  unint64_t v35;
  void *v36;
  NSString *v37;
  NSString *mainBinaryPath;
  unint64_t v39;
  void *v40;
  SASharedCache *v41;
  SASharedCache *sharedCache;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSArray *v48;
  NSArray *binaryLoadInfos;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSMutableSet *v53;
  NSMutableSet *rootFrames;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSMutableArray *v58;
  NSMutableArray *taskStates;
  uint64_t v60;
  NSMutableDictionary *v61;
  NSMutableDictionary *threads;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  NSMutableDictionary *v69;
  NSMutableDictionary *v70;
  unint64_t v71;
  NSMutableDictionary *v72;
  NSMutableDictionary *dispatchQueues;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  void *v78;
  NSMutableDictionary *v79;
  NSMutableDictionary *v80;
  unint64_t v81;
  unint64_t v82;
  void *v83;
  NSString *v84;
  NSString *bundleBuildVersion;
  unint64_t v86;
  void *v87;
  NSString *v88;
  NSString *bundleProjectName;
  unint64_t v90;
  void *v91;
  NSString *v92;
  NSString *bundleSourceVersion;
  unint64_t v94;
  void *v95;
  NSString *v96;
  NSString *bundleProductBuildVersion;
  unint64_t v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  NSObject *v104;
  unint64_t v105;
  void *v106;
  NSString *v107;
  NSString *installerVersionID;
  unint64_t v109;
  void *v110;
  NSString *v111;
  NSString *vendorID;
  unint64_t v113;
  void *v114;
  SABinary *v115;
  SABinary *mainBinary;
  unint64_t v117;
  void *v118;
  NSString *v119;
  NSString *appType;
  unint64_t v121;
  void *v122;
  NSString *v123;
  NSString *cohortID;
  unint64_t v125;
  void *v126;
  SATimestamp *v127;
  SATimestamp *pidStartTimestamp;
  unsigned int v129;
  NSMutableDictionary *v130;
  NSMutableDictionary *swiftTasks;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  void *v135;
  void *v136;
  NSMutableDictionary *v137;
  void *v138;
  unint64_t v139;
  unint64_t *v140;
  unint64_t v141;
  void *v142;
  NSString *v143;
  NSString *distributorID;
  unint64_t v145;
  void *v146;
  NSString *v147;
  NSString *resourceCoalitionName;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  NSObject *v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  NSObject *v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  int v182;
  NSObject *v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  NSObject *v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  int v208;
  NSObject *v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  NSObject *v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  int v234;
  NSObject *v235;
  int v236;
  int v237;
  int v238;
  int v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  int v247;
  NSObject *v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  int v261;
  NSObject *v262;
  int v263;
  int v264;
  int v265;
  int v266;
  int v267;
  int v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  int v275;
  NSObject *v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  int v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  id v289;
  int v290;
  uint64_t v291;
  uint64_t v292;
  id v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  unint64_t v297;
  const void *v298;
  uint64_t v299;
  char *v300;
  uint8_t buf[4];
  unint64_t v302;
  __int16 v303;
  _BYTE v304[10];
  __int16 v305;
  int v306;
  __int16 v307;
  int v308;
  __int16 v309;
  int v310;
  __int16 v311;
  int v312;
  uint64_t v313;

  v313 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (*(unsigned __int8 *)a3 >= 0xAu)
    goto LABEL_82;
  if (a4 <= 0x77)
  {
    v149 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v302 = a4;
      v303 = 2048;
      *(_QWORD *)v304 = 120;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct %lu", buf, 0x16u);
    }

    *__error() = v149;
    _SASetCrashLogMessage(3037, "bufferLength %lu < serialized SATask struct %lu", v150, v151, v152, v153, v154, v155, a4);
    _os_crash();
    __break(1u);
    goto LABEL_52;
  }
  v296 = 8 * (vaddvq_s32(*(int32x4_t *)((char *)a3 + 66)) + *(_DWORD *)((char *)a3 + 82));
  if (v296 + 120 > a4)
  {
LABEL_52:
    v156 = *__error();
    _sa_logt();
    v157 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
    {
      v158 = *(_DWORD *)((char *)a3 + 66);
      v159 = *(_DWORD *)((char *)a3 + 70);
      v160 = *(_DWORD *)((char *)a3 + 74);
      v161 = *(_DWORD *)((char *)a3 + 78);
      v162 = *(_DWORD *)((char *)a3 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = a4;
      v303 = 1024;
      *(_DWORD *)v304 = v158;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v159;
      v305 = 1024;
      v306 = v160;
      v307 = 1024;
      v308 = v161;
      v309 = 1024;
      v310 = v162;
      _os_log_error_impl(&dword_1B9BE0000, v157, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v156;
    _SASetCrashLogMessage(3039, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v163, v164, v165, v166, v167, v168, a4);
    _os_crash();
    __break(1u);
LABEL_55:
    v169 = *__error();
    _sa_logt();
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
    {
      v171 = *(_DWORD *)(v6 + 66);
      v172 = *(_DWORD *)(v6 + 70);
      v173 = *(_DWORD *)(v6 + 74);
      v174 = *(_DWORD *)(v6 + 78);
      v175 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = (unint64_t)a3;
      v303 = 1024;
      *(_DWORD *)v304 = v171;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v172;
      v305 = 1024;
      v306 = v173;
      v307 = 1024;
      v308 = v174;
      v309 = 1024;
      v310 = v175;
      _os_log_error_impl(&dword_1B9BE0000, v170, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v2 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v169;
    _SASetCrashLogMessage(3086, "bufferLength %lu < serialized SATask struct v2 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v176, v177, v178, v179, v180, v181, (char)a3);
    _os_crash();
    __break(1u);
LABEL_58:
    v182 = *__error();
    _sa_logt();
    v183 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      v184 = *(_DWORD *)(v6 + 66);
      v185 = *(_DWORD *)(v6 + 70);
      v186 = *(_DWORD *)(v6 + 74);
      v187 = *(_DWORD *)(v6 + 78);
      v188 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = (unint64_t)a3;
      v303 = 1024;
      *(_DWORD *)v304 = v184;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v185;
      v305 = 1024;
      v306 = v186;
      v307 = 1024;
      v308 = v187;
      v309 = 1024;
      v310 = v188;
      _os_log_error_impl(&dword_1B9BE0000, v183, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v3 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v182;
    _SASetCrashLogMessage(3113, "bufferLength %lu < serialized SATask struct v3 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v189, v190, v191, v192, v193, v194, (char)a3);
    _os_crash();
    __break(1u);
LABEL_61:
    v195 = *__error();
    _sa_logt();
    v196 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      v197 = *(_DWORD *)(v6 + 66);
      v198 = *(_DWORD *)(v6 + 70);
      v199 = *(_DWORD *)(v6 + 74);
      v200 = *(_DWORD *)(v6 + 78);
      v201 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = (unint64_t)a3;
      v303 = 1024;
      *(_DWORD *)v304 = v197;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v198;
      v305 = 1024;
      v306 = v199;
      v307 = 1024;
      v308 = v200;
      v309 = 1024;
      v310 = v201;
      _os_log_error_impl(&dword_1B9BE0000, v196, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v4 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v195;
    _SASetCrashLogMessage(3125, "bufferLength %lu < serialized SATask struct v4 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v202, v203, v204, v205, v206, v207, (char)a3);
    _os_crash();
    __break(1u);
LABEL_64:
    v208 = *__error();
    _sa_logt();
    v209 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
    {
      v210 = *(_DWORD *)(v6 + 66);
      v211 = *(_DWORD *)(v6 + 70);
      v212 = *(_DWORD *)(v6 + 74);
      v213 = *(_DWORD *)(v6 + 78);
      v214 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = (unint64_t)a3;
      v303 = 1024;
      *(_DWORD *)v304 = v210;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v211;
      v305 = 1024;
      v306 = v212;
      v307 = 1024;
      v308 = v213;
      v309 = 1024;
      v310 = v214;
      _os_log_error_impl(&dword_1B9BE0000, v209, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v5 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v208;
    _SASetCrashLogMessage(3141, "bufferLength %lu < serialized SATask struct v5 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v215, v216, v217, v218, v219, v220, (char)a3);
    _os_crash();
    __break(1u);
LABEL_67:
    v221 = *__error();
    _sa_logt();
    v222 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      v223 = *(_DWORD *)(v300 + 66);
      v224 = *(_DWORD *)(v300 + 70);
      v225 = *(_DWORD *)(v300 + 74);
      v226 = *(_DWORD *)(v300 + 78);
      v227 = *(_DWORD *)(v300 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = (unint64_t)v298;
      v303 = 1024;
      *(_DWORD *)v304 = v223;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v224;
      v305 = 1024;
      v306 = v225;
      v307 = 1024;
      v308 = v226;
      v309 = 1024;
      v310 = v227;
      _os_log_error_impl(&dword_1B9BE0000, v222, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v6 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v221;
    _SASetCrashLogMessage(3153, "bufferLength %lu < serialized SATask struct v6 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v228, v229, v230, v231, v232, v233, (char)v298);
    _os_crash();
    __break(1u);
LABEL_70:
    v234 = *__error();
    _sa_logt();
    v235 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
    {
      v236 = *(_DWORD *)(v300 + 66);
      v237 = *(_DWORD *)(v300 + 70);
      v238 = *(_DWORD *)(v300 + 74);
      v239 = *(_DWORD *)(v300 + 78);
      v240 = *(_DWORD *)(v300 + 82);
      *(_DWORD *)buf = 134219264;
      v302 = (unint64_t)v298;
      v303 = 1024;
      *(_DWORD *)v304 = v236;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v237;
      v305 = 1024;
      v306 = v238;
      v307 = 1024;
      v308 = v239;
      v309 = 1024;
      v310 = v240;
      _os_log_error_impl(&dword_1B9BE0000, v235, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v234;
    _SASetCrashLogMessage(3164, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v241, v242, v243, v244, v245, v246, (char)v298);
    _os_crash();
    __break(1u);
    goto LABEL_73;
  }
  v14 = v13;
  v298 = (const void *)a4;
  v15 = *(_QWORD *)((char *)a3 + 26);
  v16 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v12, v14, v16, 0);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v17;

  v19 = *(_QWORD *)((char *)a3 + 34);
  v20 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v12, v14, v20, 0);
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleName = self->_bundleName;
  self->_bundleName = v21;

  v23 = *(_QWORD *)((char *)a3 + 42);
  v24 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v23, v12, v14, v24, 0);
  v25 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  execTimestamp = self->_execTimestamp;
  self->_execTimestamp = v25;

  v27 = *(_QWORD *)((char *)a3 + 50);
  v28 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v12, v14, v28, 0);
  v29 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  exitTimestamp = self->_exitTimestamp;
  self->_exitTimestamp = v29;

  v31 = *(_QWORD *)((char *)a3 + 86);
  v32 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v12, v14, v32, 0);
  v33 = (SAThread *)objc_claimAutoreleasedReturnValue();
  mainThread = self->_mainThread;
  self->_mainThread = v33;

  v35 = *(_QWORD *)((char *)a3 + 94);
  v36 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v35, v12, v14, v36, 0);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  mainBinaryPath = self->_mainBinaryPath;
  self->_mainBinaryPath = v37;

  v39 = *(_QWORD *)((char *)a3 + 102);
  v40 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v39, v12, v14, v40, 0);
  v41 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
  sharedCache = self->_sharedCache;
  self->_sharedCache = v41;

  if (!self->_sharedCache)
    self->_hasNoSharedCache = 1;
  v43 = *(unsigned int *)((char *)a3 + 66);
  v44 = (char *)a3 + 8 * v43 + 120;
  v300 = (char *)a3;
  v45 = *(unsigned int *)((char *)a3 + 70);
  v46 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v44, v45, v12, v14, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (NSArray *)objc_msgSend(v47, "copy");
  binaryLoadInfos = self->_binaryLoadInfos;
  self->_binaryLoadInfos = v48;

  v50 = *(unsigned int *)((char *)a3 + 66);
  v51 = (void *)objc_opt_class();
  v52 = v50;
  v6 = (char *)a3;
  SASerializableNewMutableSetFromIndexList((uint64_t)a3 + 120, v52, v12, v14, v51);
  v53 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  rootFrames = self->_rootFrames;
  self->_rootFrames = v53;

  v55 = *(unsigned int *)((char *)a3 + 70);
  v56 = *(unsigned int *)(v6 + 74);
  v57 = (void *)objc_opt_class();
  v292 = (uint64_t)&v44[8 * v55];
  SASerializableNewMutableArrayFromIndexList(v292, v56, v12, v14, v57);
  v58 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  taskStates = self->_taskStates;
  self->_taskStates = v58;

  v60 = *(unsigned int *)(v6 + 74);
  v61 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *(unsigned int *)(v6 + 78));
  threads = self->_threads;
  self->_threads = v61;

  v63 = 8 * v43;
  v294 = 8 * v43;
  v295 = v55;
  v299 = v60;
  if (*(_DWORD *)(v6 + 78))
  {
    v64 = 0;
    v65 = (uint64_t)&v6[8 * v60 + 120 + 8 * v55 + v63];
    do
    {
      v66 = *(_QWORD *)(v65 + 8 * v64);
      v67 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v66, v12, v14, v67, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = self->_threads;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v68, "threadId"));
      v7 = (unint64_t *)objc_claimAutoreleasedReturnValue();
      v70 = v69;
      v6 = v300;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", v68, v7);

      ++v64;
      v71 = *(unsigned int *)(v300 + 78);
    }
    while (v64 < v71);
    v55 = v295;
    v60 = v299;
  }
  else
  {
    LODWORD(v71) = 0;
  }
  v72 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *(unsigned int *)(v6 + 82));
  dispatchQueues = self->_dispatchQueues;
  self->_dispatchQueues = v72;

  v291 = v71;
  if (*(_DWORD *)(v6 + 82))
  {
    v74 = 0;
    v75 = (uint64_t)&v6[8 * v71 + 120 + 8 * v60 + 8 * v55 + v294];
    do
    {
      v76 = *(_QWORD *)(v75 + 8 * v74);
      v77 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v76, v12, v14, v77, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = self->_dispatchQueues;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v78, "identifier"));
      v7 = (unint64_t *)objc_claimAutoreleasedReturnValue();
      v80 = v79;
      v6 = v300;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v80, "setObject:forKeyedSubscript:", v78, v7);

      ++v74;
      v81 = *(unsigned int *)(v300 + 82);
    }
    while (v74 < v81);
  }
  else
  {
    LODWORD(v81) = 0;
  }
  a3 = v298;
  if (v6[1] < 2u)
    goto LABEL_48;
  if (v296 + 176 > (unint64_t)v298)
    goto LABEL_55;
  v7 = (unint64_t *)(v292 + 8 * v299 + 8 * v71 + 8 * v81);
  v82 = *v7;
  v83 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v82, v12, v14, v83, 0);
  v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleBuildVersion = self->_bundleBuildVersion;
  self->_bundleBuildVersion = v84;

  v86 = v7[1];
  v87 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v86, v12, v14, v87, 0);
  v88 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleProjectName = self->_bundleProjectName;
  self->_bundleProjectName = v88;

  v90 = v7[2];
  v91 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v90, v12, v14, v91, 0);
  v92 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleSourceVersion = self->_bundleSourceVersion;
  self->_bundleSourceVersion = v92;

  v94 = v7[3];
  v95 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v94, v12, v14, v95, 0);
  v96 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleProductBuildVersion = self->_bundleProductBuildVersion;
  self->_bundleProductBuildVersion = v96;

  if (!self->_adamID)
  {
    v98 = v7[4];
    v99 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v98, v12, v14, v99, 0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      v101 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v101, "numberFromString:", v100);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v102;
      if (v102)
      {
        self->_adamID = objc_msgSend(v102, "unsignedLongLongValue");
      }
      else
      {
        v293 = v101;
        v290 = *__error();
        _sa_logt();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v302 = (unint64_t)v100;
          _os_log_fault_impl(&dword_1B9BE0000, v104, OS_LOG_TYPE_FAULT, "Unable to parse commerceAppID %@", buf, 0xCu);
        }

        *__error() = v290;
        v101 = v293;
      }

      v6 = v300;
    }

  }
  v105 = v7[5];
  v106 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v105, v12, v14, v106, 0);
  v107 = (NSString *)objc_claimAutoreleasedReturnValue();
  installerVersionID = self->_installerVersionID;
  self->_installerVersionID = v107;

  v109 = v7[6];
  v110 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v109, v12, v14, v110, 0);
  v111 = (NSString *)objc_claimAutoreleasedReturnValue();
  vendorID = self->_vendorID;
  self->_vendorID = v111;

  if (v6[1] < 3u)
    goto LABEL_48;
  if (v296 + 184 > (unint64_t)v298)
    goto LABEL_58;
  v113 = v7[7];
  v114 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v113, v12, v14, v114, 0);
  v115 = (SABinary *)objc_claimAutoreleasedReturnValue();
  mainBinary = self->_mainBinary;
  self->_mainBinary = v115;

  if (v6[1] < 4u)
    goto LABEL_48;
  if (v296 + 216 > (unint64_t)v298)
    goto LABEL_61;
  self->_adamID = v7[8];
  v117 = v7[9];
  v118 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v117, v12, v14, v118, 0);
  v119 = (NSString *)objc_claimAutoreleasedReturnValue();
  appType = self->_appType;
  self->_appType = v119;

  v121 = v7[10];
  v122 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v121, v12, v14, v122, 0);
  v123 = (NSString *)objc_claimAutoreleasedReturnValue();
  cohortID = self->_cohortID;
  self->_cohortID = v123;

  self->_isBeta = (v6[118] & 0x20) != 0;
  v125 = v7[11];
  v126 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v125, v12, v14, v126, 0);
  v127 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  pidStartTimestamp = self->_pidStartTimestamp;
  self->_pidStartTimestamp = v127;

  if (v6[1] < 5u)
    goto LABEL_48;
  if (v296 + 217 > (unint64_t)v298)
    goto LABEL_64;
  self->_developerType = *((_BYTE *)v7 + 96);
  v129 = v6[1];
  if (v129 < 6)
    goto LABEL_48;
  if (v296 + 225 > (unint64_t)v298)
    goto LABEL_67;
  self->_resourceCoalitionID = *(unint64_t *)((char *)v7 + 97);
  if (v129 < 7)
    goto LABEL_48;
  if (v296 + 229 > (unint64_t)v298)
    goto LABEL_70;
  v297 = v296 + 229 + 8 * *(unsigned int *)((char *)v7 + 105);
  if (v297 > (unint64_t)v298)
  {
LABEL_73:
    v247 = *__error();
    _sa_logt();
    v248 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
    {
      v249 = *(_DWORD *)(v300 + 66);
      v250 = *(_DWORD *)(v300 + 70);
      v251 = *(_DWORD *)(v300 + 74);
      v252 = *(_DWORD *)(v300 + 78);
      v253 = *(_DWORD *)(v300 + 82);
      v254 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      v302 = (unint64_t)v298;
      v303 = 1024;
      *(_DWORD *)v304 = v249;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v250;
      v305 = 1024;
      v306 = v251;
      v307 = 1024;
      v308 = v252;
      v309 = 1024;
      v310 = v253;
      v311 = 1024;
      v312 = v254;
      _os_log_error_impl(&dword_1B9BE0000, v248, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", buf, 0x30u);
    }

    *__error() = v247;
    _SASetCrashLogMessage(3167, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", v255, v256, v257, v258, v259, v260, (char)v298);
    _os_crash();
    __break(1u);
    goto LABEL_76;
  }
  v130 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *(unsigned int *)((char *)v7 + 105));
  swiftTasks = self->_swiftTasks;
  self->_swiftTasks = v130;

  if (*(_DWORD *)((char *)v7 + 105))
  {
    v132 = 0;
    v133 = (uint64_t)&v6[8 * v81 + 229 + 8 * v291 + 8 * v299 + 8 * v295 + v294];
    do
    {
      v134 = *(_QWORD *)(v133 + 8 * v132);
      v135 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v134, v12, v14, v135, 0);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = self->_swiftTasks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v136, "identifier"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v137, "setObject:forKeyedSubscript:", v136, v138);

      ++v132;
      v139 = *(unsigned int *)((char *)v7 + 105);
    }
    while (v132 < v139);
  }
  else
  {
    v139 = 0;
  }
  if (v300[1] < 8u)
    goto LABEL_48;
  if (v297 + 8 > (unint64_t)v298)
  {
LABEL_76:
    v261 = *__error();
    _sa_logt();
    v262 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
    {
      v263 = *(_DWORD *)(v300 + 66);
      v264 = *(_DWORD *)(v300 + 70);
      v265 = *(_DWORD *)(v300 + 74);
      v266 = *(_DWORD *)(v300 + 78);
      v267 = *(_DWORD *)(v300 + 82);
      v268 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      v302 = (unint64_t)v298;
      v303 = 1024;
      *(_DWORD *)v304 = v263;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v264;
      v305 = 1024;
      v306 = v265;
      v307 = 1024;
      v308 = v266;
      v309 = 1024;
      v310 = v267;
      v311 = 1024;
      v312 = v268;
      _os_log_error_impl(&dword_1B9BE0000, v262, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v8 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", buf, 0x30u);
    }

    *__error() = v261;
    _SASetCrashLogMessage(3182, "bufferLength %lu < serialized SATask struct v8 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", v269, v270, v271, v272, v273, v274, (char)v298);
    _os_crash();
    __break(1u);
LABEL_79:
    v275 = *__error();
    _sa_logt();
    v276 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
    {
      v277 = *(_DWORD *)(v300 + 66);
      v278 = *(_DWORD *)(v300 + 70);
      v279 = *(_DWORD *)(v300 + 74);
      v280 = *(_DWORD *)(v300 + 78);
      v281 = *(_DWORD *)(v300 + 82);
      v282 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      v302 = (unint64_t)v298;
      v303 = 1024;
      *(_DWORD *)v304 = v277;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v278;
      v305 = 1024;
      v306 = v279;
      v307 = 1024;
      v308 = v280;
      v309 = 1024;
      v310 = v281;
      v311 = 1024;
      v312 = v282;
      _os_log_error_impl(&dword_1B9BE0000, v276, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v9 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", buf, 0x30u);
    }

    *__error() = v275;
    _SASetCrashLogMessage(3193, "bufferLength %lu < serialized SATask struct v9 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", v283, v284, v285, v286, v287, v288, (char)v298);
    _os_crash();
    __break(1u);
LABEL_82:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATask version"), 0);
    v289 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v289);
  }
  v140 = (unint64_t *)((char *)&v7[v139 + 13] + 5);
  v141 = *v140;
  v142 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v141, v12, v14, v142, 0);
  v143 = (NSString *)objc_claimAutoreleasedReturnValue();
  distributorID = self->_distributorID;
  self->_distributorID = v143;

  if (v300[1] >= 9u)
  {
    if (v297 + 16 <= (unint64_t)v298)
    {
      v145 = v140[1];
      v146 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v145, v12, v14, v146, 0);
      v147 = (NSString *)objc_claimAutoreleasedReturnValue();
      resourceCoalitionName = self->_resourceCoalitionName;
      self->_resourceCoalitionName = v147;

      goto LABEL_48;
    }
    goto LABEL_79;
  }
LABEL_48:

}

+ (double)taskWithoutReferencesFromPAStyleSerializedTask:(uint64_t)a1
{
  int *v3;
  double result;

  objc_opt_self();
  v3 = (int *)+[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)SATask, *(unsigned int *)(a2 + 8), *(_QWORD *)(a2 + 40), 0, 0);
  if (*((_QWORD *)v3 + 12) == -1)
    *((_QWORD *)v3 + 12) = v3[19];
  v3[20] = *(_DWORD *)(a2 + 12);
  v3[21] = *(_DWORD *)(a2 + 16);
  v3[22] = *(_DWORD *)(a2 + 20);
  if (*(_QWORD *)a2 <= 0xF33DFAC5uLL)
  {
    *((_BYTE *)v3 + 67) = *(_BYTE *)(a2 + 56);
    *((_BYTE *)v3 + 68) = *(_BYTE *)(a2 + 57);
    *((_BYTE *)v3 + 69) = *(_BYTE *)(a2 + 58);
    result = *(double *)(a2 + 62);
    *((double *)v3 + 30) = result;
    *((_QWORD *)v3 + 36) = *(_QWORD *)(a2 + 87);
  }
  else
  {
    *((_BYTE *)v3 + 67) = *(_BYTE *)(a2 + 56);
    *((_BYTE *)v3 + 68) = *(_BYTE *)(a2 + 57);
    *((_BYTE *)v3 + 69) = *(_BYTE *)(a2 + 58);
    result = *(double *)(a2 + 60);
    *((double *)v3 + 30) = result;
    *((_QWORD *)v3 + 36) = *(_QWORD *)(a2 + 84);
    if (*(_QWORD *)a2 > 0xF33DFAC6uLL)
      *((_BYTE *)v3 + 70) = *(_BYTE *)(a2 + 100);
  }
  return result;
}

- (void)populateReferencesUsingPAStyleSerializedTask:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  void *v23;
  unint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  unint64_t *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  id v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  id v49;
  unint64_t *v50;
  _QWORD *v51;
  id v52;

  v52 = a3;
  v7 = a4;
  if (a1)
  {
    v8 = a2[3];
    v9 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v8, v52, v7, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)a1[7];
    a1[7] = v10;

    v12 = a2[4];
    v13 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v52, v7, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)a1[13];
    a1[13] = v14;

    v16 = *a2;
    if (*a2 == 4080925383)
    {
      v17 = (_QWORD *)((char *)a2 + 68);
      v18 = (_QWORD *)((char *)a2 + 76);
      v19 = 101;
    }
    else if (v16 == 4080925382)
    {
      v17 = (_QWORD *)((char *)a2 + 68);
      v18 = (_QWORD *)((char *)a2 + 76);
      v19 = 100;
    }
    else
    {
      if (v16 != 4080925381)
      {
        v48 = CFSTR("Bad SAPAStyleTimeInsensitiveTaskData magic");
        goto LABEL_21;
      }
      v17 = (_QWORD *)((char *)a2 + 70);
      v18 = (_QWORD *)((char *)a2 + 78);
      v19 = 103;
    }
    v20 = *v17;
    v21 = *v18;
    v22 = (_QWORD *)((char *)a2 + v19);
    if (!*v17)
      goto LABEL_13;
    v51 = a2;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v20);
    v50 = v22;
    v24 = v22;
    v25 = v20;
    do
    {
      v26 = *v24++;
      v27 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v52, v7, v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        v48 = CFSTR("Failed to deserialize paImageInfo");
        goto LABEL_21;
      }
      v30 = v28;
      v31 = objc_getProperty(v28, v29, 8, 1);
      objc_msgSend(v23, "addObject:", v31);

      --v25;
    }
    while (v25);
    v32 = objc_msgSend(v23, "copy");
    v33 = (void *)a1[31];
    a1[31] = v32;

    v22 = v50;
    a2 = v51;
LABEL_13:
    if (v21)
    {
      v34 = &v22[v20];
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v21);
      v36 = (void *)a1[35];
      a1[35] = v35;

      while (1)
      {
        v37 = *v34++;
        v38 = (void *)objc_opt_class();
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v37, v52, v7, v38, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
          break;
        v41 = v39;
        v42 = (void *)a1[35];
        v43 = objc_getProperty(v39, v40, 8, 1);
        objc_msgSend(v42, "addObject:", v43);

        if (!--v21)
          goto LABEL_17;
      }
      v48 = CFSTR("Failed to deserialize root frame");
LABEL_21:
      +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v48, 0);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v49);
    }
LABEL_17:
    v44 = a2[6];
    v45 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v44, v52, v7, v45, 0);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)a1[5];
    a1[5] = v46;

  }
}

- (id)removeStacksOutsideThisProcess
{
  void *v2;
  void *v3;
  SAStackIterator *v4;
  SAFrame *v5;
  SAFrame *v6;
  void *v7;
  id v8;
  SAStackIterator *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SAStackIterator *v14;
  uint64_t v15;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 280), "objectsPassingTest:", &__block_literal_global_495);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(SAStackIterator);
    objc_msgSend(*(id *)(a1 + 280), "removeObject:", v3);
    v5 = objc_alloc_init(SAFrame);
    v6 = v5;
    if (v5)
      v5->_BOOLs.bits |= 8u;
    objc_msgSend(*(id *)(a1 + 280), "addObject:", v5);
    v7 = *(void **)(a1 + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_2;
    v12[3] = &unk_1E7149BD0;
    v8 = v3;
    v13 = v8;
    v14 = v4;
    v15 = a1;
    v9 = v4;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = v8;

  }
  return v3;
}

uint64_t __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isTruncatedBacktraceFrame");
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

void __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_3;
  v7[3] = &unk_1E7149BA8;
  v8 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  objc_msgSend(a3, "enumerateThreadStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v7);

}

void __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  id self;

  self = a2;
  objc_msgSend(self, "stack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[4];

  if (v4 == v5)
  {
    v7 = (void *)a1[5];
    if (v7)
    {
      objc_setProperty_atomic(v7, v6, v3, 8);
      v8 = (void *)a1[5];
    }
    else
    {
      v8 = 0;
    }
    -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:](a1[6], v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_setProperty_atomic(self, v9, v10, 64);

  }
}

@end
