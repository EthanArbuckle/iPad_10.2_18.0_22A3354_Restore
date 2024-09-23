@implementation PUIPosterSnapshotFilesystemCache

- (PUIPosterSnapshotFilesystemCache)initWithURL:(id)a3
{
  id v5;
  PUIPosterSnapshotFilesystemCache *v6;
  uint64_t v7;
  BSAtomicFlag *invalidationFlag;
  NSCache *v9;
  NSCache *cacheLock_URLToSnapshotBundleCache;
  uint64_t v11;
  NSURL *cacheURL;
  void *v13;
  uint64_t v14;
  NSURL *cacheURLInternalDirectory;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  OS_dispatch_queue *completionQueue;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  OS_dispatch_queue *fileSystemQueue;
  PUIPosterSnapshotFilesystemCache *result;
  void *v29;
  objc_super v30;

  v5 = a3;
  if ((objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v30.receiver = self;
    v30.super_class = (Class)PUIPosterSnapshotFilesystemCache;
    v6 = -[PUIPosterSnapshotFilesystemCache init](&v30, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
      invalidationFlag = v6->_invalidationFlag;
      v6->_invalidationFlag = (BSAtomicFlag *)v7;

      v6->_cacheLock._os_unfair_lock_opaque = 0;
      v9 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
      cacheLock_URLToSnapshotBundleCache = v6->_cacheLock_URLToSnapshotBundleCache;
      v6->_cacheLock_URLToSnapshotBundleCache = v9;

      v11 = objc_msgSend(v5, "copy");
      cacheURL = v6->_cacheURL;
      v6->_cacheURL = (NSURL *)v11;

      -[NSURL URLByAppendingPathComponent:isDirectory:](v6->_cacheURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("PosterSnapshots"), 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByStandardizingPath");
      v14 = objc_claimAutoreleasedReturnValue();
      cacheURLInternalDirectory = v6->_cacheURLInternalDirectory;
      v6->_cacheURLInternalDirectory = (NSURL *)v14;

      objc_msgSend(v5, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("PostersFileSystemCacheCompletionQueue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE0BE18], "serial");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "serviceClass:", 25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = BSDispatchQueueCreate();
      completionQueue = v6->_completionQueue;
      v6->_completionQueue = (OS_dispatch_queue *)v20;

      v22 = (void *)MEMORY[0x24BE74D38];
      v23 = (void *)MEMORY[0x24BDD17C8];
      -[NSURL path](v6->_cacheURL, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("PostersFileSystemCache-Workloop-%@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serialQueueTargetingSharedWorkloop:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      fileSystemQueue = v6->_fileSystemQueue;
      v6->_fileSystemQueue = (OS_dispatch_queue *)v26;

      -[PUIPosterSnapshotFilesystemCache _prepareSnapshotCache](v6, "_prepareSnapshotCache");
    }

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[cacheURL checkResourceIsReachableAndReturnError:((void *)0)]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotFilesystemCache initWithURL:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    result = (PUIPosterSnapshotFilesystemCache *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PUIPosterSnapshotFilesystemCache invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotFilesystemCache;
  -[PUIPosterSnapshotFilesystemCache dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSCache *cacheLock_URLToSnapshotBundleCache;

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    os_unfair_lock_lock(&self->_cacheLock);
    -[NSCache removeAllObjects](self->_cacheLock_URLToSnapshotBundleCache, "removeAllObjects");
    cacheLock_URLToSnapshotBundleCache = self->_cacheLock_URLToSnapshotBundleCache;
    self->_cacheLock_URLToSnapshotBundleCache = 0;

    os_unfair_lock_unlock(&self->_cacheLock);
  }
}

+ (id)_snapshotURLForPosterPath:(id)a3 relativeTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "serverIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "serverIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v13, "version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "serverIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v16, "supplement"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  v19 = (void *)objc_msgSend(v6, "copy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34[0] = v18;
  v34[1] = v8;
  v27 = (void *)v11;
  v28 = (void *)v8;
  v34[2] = v11;
  v34[3] = v14;
  v34[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      v25 = v19;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v25, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v24), 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        ++v24;
        v25 = v19;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v22);
  }

  return v19;
}

+ (id)_snapshotURLForPosterPath:(id)a3 snapshotCacheIdentifier:(id)a4 interfaceOrientation:(int64_t)a5 hardwareIdentifier:(id)a6 userInterfaceStyle:(int64_t)a7 relativeTo:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[9];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v45 = a4;
  v13 = a6;
  v14 = a8;
  objc_msgSend(v12, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "provider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "serverIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "posterUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "serverIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v20, "version"));
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "serverIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v23, "supplement"));
  v24 = objc_claimAutoreleasedReturnValue();

  PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
  v25 = objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = CFSTR("Unknown");
  if (a7 == 1)
    v27 = CFSTR("LightMode");
  if (a7 == 2)
    v27 = CFSTR("DarkMode");
  v28 = v27;
  v29 = (void *)objc_msgSend(v14, "copy");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v41 = (void *)v25;
  v42 = (void *)v24;
  v50[0] = v25;
  v50[1] = v39;
  v43 = (void *)v18;
  v50[2] = v18;
  v50[3] = v21;
  v30 = (void *)v21;
  v50[4] = v24;
  v50[5] = v26;
  v40 = (void *)v26;
  v50[6] = v45;
  v50[7] = v28;
  v44 = v13;
  v50[8] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v47;
    do
    {
      v35 = 0;
      v36 = v29;
      do
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(v36, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v35), 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        ++v35;
        v36 = v29;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v33);
  }

  objc_msgSend(v29, "URLByAppendingPathComponent:isDirectory:", CFSTR("Snapshot.pks"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (id)_determineProviderFromSnapshotURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *i;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "isEqualToString:", v5, (_QWORD)v14);
        if ((v12 & 1) == 0 && ((v8 ^ 1) & 1) == 0)
        {
          v7 = v11;
          goto LABEL_12;
        }
        v8 |= v12;
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)latestSnapshotBundleForPoster:(id)a3 snapshotCacheIdentifier:(id)a4 interfaceOrientation:(int64_t)a5 userInterfaceStyle:(int64_t)a6 hardwareIdentifier:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  NSCache *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  NSObject *v35;
  os_unfair_lock_s *p_cacheLock;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  os_signpost_id_t spid;
  id v55;
  uint8_t buf[4];
  _DWORD v57[7];

  *(_QWORD *)&v57[5] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PUILogSnapshotCache();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    PUILogSnapshotCache();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    spid = v20;
    v23 = v20 - 1;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval", ", buf, 2u);
    }

    if ((objc_msgSend(v15, "isServerPosterPath") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:].cold.3(a2);
      objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x24467B33CLL);
    }
    if (!objc_msgSend(v16, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[snapshotCacheIdentifier length] > 0"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x24467B3A0);
    }
    v24 = self->_cacheLock_URLToSnapshotBundleCache;
    objc_msgSend((id)objc_opt_class(), "_snapshotURLForPosterPath:snapshotCacheIdentifier:interfaceOrientation:hardwareIdentifier:userInterfaceStyle:relativeTo:", v15, v16, a5, v17, a6, self->_cacheURLInternalDirectory);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PUILogSnapshotCache();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v27, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval-unlocked", ", buf, 2u);
    }

    -[NSCache objectForKey:](v24, "objectForKey:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PUILogSnapshotCache();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v57 = v25;
        _os_log_impl(&dword_24464E000, v30, OS_LOG_TYPE_DEFAULT, "pre _cacheLock; snapshotBundle found @ %@", buf, 0xCu);
      }

      PUILogSnapshotCache();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v23 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v31))
        goto LABEL_32;
      *(_DWORD *)buf = 67109378;
      v57[0] = 1;
      LOWORD(v57[1]) = 2114;
      *(_QWORD *)((char *)&v57[1] + 2) = v25;
      v33 = "SnapshotCacheRetrieval-unlocked";
    }
    else
    {
      if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v57 = v25;
        _os_signpost_emit_with_name_impl(&dword_24464E000, v30, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheRetrieval-unlocked", "Failed / %{public}@", buf, 0xCu);
      }

      PUILogSnapshotCache();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_24464E000, v35, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval-locked", ", buf, 2u);
      }

      p_cacheLock = &self->_cacheLock;
      os_unfair_lock_lock(p_cacheLock);
      -[NSCache objectForKey:](v24, "objectForKey:", v25);
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        PUILogSnapshotCache();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_24464E000, v42, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval-loadFromDisk-locked", ", buf, 2u);
        }

        v55 = 0;
        +[PUIPosterSnapshotBundle snapshotBundleAtURL:error:](PUIPosterSnapshotBundle, "snapshotBundleAtURL:error:", v25, &v55);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v55;
        PUILogSnapshotCache();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v43)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v57 = v25;
            _os_log_impl(&dword_24464E000, v45, OS_LOG_TYPE_DEFAULT, "loaded snapshotBundle %@", buf, 0xCu);
          }

          -[NSCache setObject:forKey:](v24, "setObject:forKey:", v43, v25);
          v46 = v53;
        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:].cold.2((uint64_t)v25, (uint64_t)v53, v45);

          v46 = v53;
          if (a8)
            *a8 = objc_retainAutorelease(v53);
        }
        PUILogSnapshotCache();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_DWORD *)buf = 67109378;
          v57[0] = v43 != 0;
          LOWORD(v57[1]) = 2114;
          *(_QWORD *)((char *)&v57[1] + 2) = v25;
          _os_signpost_emit_with_name_impl(&dword_24464E000, v48, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheRetrieval-loadFromDisk-locked", "Success? %{BOOL}u  %{public}@", buf, 0x12u);
        }

        os_unfair_lock_unlock(p_cacheLock);
        PUILogSnapshotCache();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_DWORD *)buf = 67109378;
          v57[0] = v43 != 0;
          LOWORD(v57[1]) = 2114;
          *(_QWORD *)((char *)&v57[1] + 2) = v25;
          _os_signpost_emit_with_name_impl(&dword_24464E000, v50, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheRetrieval-locked", "Success? %{BOOL}u  %{public}@", buf, 0x12u);
        }

        v18 = v43;
        goto LABEL_33;
      }
      v28 = (void *)v37;
      os_unfair_lock_unlock(p_cacheLock);
      PUILogSnapshotCache();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v57 = v25;
        _os_log_impl(&dword_24464E000, v38, OS_LOG_TYPE_DEFAULT, "post _cacheLock; snapshotBundle found @ %@",
          buf,
          0xCu);
      }

      PUILogSnapshotCache();
      v39 = objc_claimAutoreleasedReturnValue();
      v32 = v39;
      if (v23 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v39))
      {
LABEL_32:

        v18 = v28;
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 67109378;
      v57[0] = 1;
      LOWORD(v57[1]) = 2114;
      *(_QWORD *)((char *)&v57[1] + 2) = v25;
      v33 = "SnapshotCacheRetrieval-locked";
    }
    _os_signpost_emit_with_name_impl(&dword_24464E000, v32, OS_SIGNPOST_INTERVAL_END, spid, v33, "Success? %{BOOL}u  %{public}@", buf, 0x12u);
    goto LABEL_32;
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
    v18 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_34:

  return v18;
}

- (void)discardSnapshotsForPosters:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "_snapshotURLForPosterPath:relativeTo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), self->_cacheURLInternalDirectory, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeItemAtURL:error:", v10, 0);

        -[NSCache removeObjectForKey:](self->_cacheLock_URLToSnapshotBundleCache, "removeObjectForKey:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_cacheLock);
}

- (BOOL)checkCacheIsReachable:(id *)a3
{
  char v5;
  NSURL *cacheURLInternalDirectory;
  BOOL v7;
  id v8;
  void *v9;
  NSURL *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    cacheURLInternalDirectory = self->_cacheURLInternalDirectory;
    v19 = 0;
    v7 = -[NSURL checkResourceIsReachableAndReturnError:](cacheURLInternalDirectory, "checkResourceIsReachableAndReturnError:", &v19);
    v8 = v19;
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_cacheURLInternalDirectory;
      PFPosterPathFileAttributes();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v5 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, v11, &v18);
      v12 = v18;

      if ((v5 & 1) == 0)
      {
        if (v12)
        {
          v13 = (void *)MEMORY[0x24BDD1540];
          v14 = *MEMORY[0x24BDD10D8];
          v20[1] = v12;
          v21 = v14;
          v20[0] = v8;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pui_errorWithCode:userInfo:", 3, v16);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          *a3 = objc_retainAutorelease(v8);
        }
      }

    }
  }
  return v5;
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;

  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotCacheIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "pui_deviceOrientation");
    objc_msgSend(v6, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pui_userInterfaceStyle");
    objc_msgSend(v6, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pui_displayConfigurationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:](self, "latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:", v8, v9, v16, v11, v14, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)discardSnapshotsForPostersMatchingPredicate:(id)a3
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t spid;
  unint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    PUILogSnapshotCache();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    PUILogSnapshotCache();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v27 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v29;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SnapshotCacheCleanupMatchingPredicate", "Predicate %{public}@", buf, 0xCu);
    }
    spid = v4;

    v7 = (void *)objc_opt_new();
    os_unfair_lock_lock(&self->_cacheLock);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", self->_cacheURLInternalDirectory, 0, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v14, "pathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "localizedCompare:", CFSTR("pks"));

          if (!v16 && objc_msgSend(v29, "evaluateWithObject:", v14))
          {
            objc_msgSend(v7, "addObject:", v14);
            -[NSCache removeObjectForKey:](self->_cacheLock_URLToSnapshotBundleCache, "removeObjectForKey:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v11);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeItemAtURL:error:", v22, 0);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v19);
    }

    os_unfair_lock_unlock(&self->_cacheLock);
    PUILogSnapshotCache();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 138543618;
      v39 = v29;
      v40 = 2114;
      v41 = v17;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v25, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheCleanupMatchingPredicate", "Predicate %{public}@; cleanedup urls: %{public}@",
        buf,
        0x16u);
    }

  }
}

- (void)cleanup
{
  os_unfair_lock_s *p_cacheLock;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(p_cacheLock);
    os_unfair_lock_unlock(p_cacheLock);
  }
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4
{
  return -[PUIPosterSnapshotFilesystemCache cacheSnapshotBundle:forRequest:completion:](self, "cacheSnapshotBundle:forRequest:completion:", a3, a4, 0);
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *fileSystemQueue;
  id v22;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  os_signpost_id_t v28;
  OS_dispatch_queue *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  OS_dispatch_queue *v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  _QWORD block[4];
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_completionQueue;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (!v10)
    {
      v12 = 0;
      goto LABEL_9;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke;
    block[3] = &unk_25154C148;
    v40 = v10;
    dispatch_async((dispatch_queue_t)v11, block);
    v12 = 0;
    v13 = v40;
  }
  else
  {
    objc_msgSend(v9, "path");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "isServerPosterPath");

    if ((v12 & 1) != 0)
    {
      PUILogSnapshotCache();
      v15 = objc_claimAutoreleasedReturnValue();
      v28 = os_signpost_id_generate(v15);

      v25 = (void *)objc_opt_class();
      objc_msgSend(v9, "snapshotCacheIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "settings");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v27, "pui_deviceOrientation");
      objc_msgSend(v9, "settings");
      v30 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayConfiguration");
      v29 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pui_displayConfigurationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "settings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_snapshotURLForPosterPath:snapshotCacheIdentifier:interfaceOrientation:hardwareIdentifier:userInterfaceStyle:relativeTo:", v13, v16, v24, v19, objc_msgSend(v20, "pui_userInterfaceStyle"), self->_cacheURLInternalDirectory);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v29;
      v8 = v30;

      fileSystemQueue = self->_fileSystemQueue;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2;
      v31[3] = &unk_25154C540;
      v31[4] = self;
      v37 = v10;
      v38 = v28;
      v32 = v30;
      v33 = v26;
      v34 = v9;
      v35 = v29;
      v13 = v13;
      v36 = v13;
      v22 = v26;
      dispatch_async(fileSystemQueue, v31);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

LABEL_9:
  return v12;
}

void __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  PUIPosterSnapshotBundle *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  PUIPosterSnapshotBundle *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PUIPosterSnapshotBundle *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  id v61;
  _QWORD block[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  _QWORD v85[4];

  v85[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_3;
  v71[3] = &unk_25154C518;
  v61 = v2;
  v72 = v61;
  v73 = *(id *)(a1 + 80);
  v3 = (void *)MEMORY[0x2495151FC](v71);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  PUILogSnapshotCache();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 88);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v75 = v7;
    v76 = 2114;
    v77 = v8;
    _os_signpost_emit_with_name_impl(&dword_24464E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "cacheSnapshotBundle", "snapshotBundle URL %{public}@ -> %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

    v60 = 1;
  }
  else
  {
    v60 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PFPosterPathFileAttributes();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v13 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, v12, &v70);
  v14 = v70;

  if (v13)
  {
    v59 = v14;
    v15 = (void *)MEMORY[0x249515064]();
    objc_msgSend(*(id *)(a1 + 40), "bundleURL");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16
      && (v17 = (void *)v16,
          objc_msgSend(*(id *)(a1 + 40), "bundleURL"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0),
          v18,
          v17,
          v19))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "bundleURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 48);
      v69 = 0;
      v23 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v21, v22, &v69);
      v24 = v69;

      if (!v23)
      {
        LODWORD(v26) = 0;
        goto LABEL_24;
      }
      v25 = -[PUIPosterSnapshotBundle initWithURL:]([PUIPosterSnapshotBundle alloc], "initWithURL:", *(_QWORD *)(a1 + 48));
      if (-[PUIPosterSnapshotBundle isValidBundle](v25, "isValidBundle"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v25, *(_QWORD *)(a1 + 48));
        LODWORD(v26) = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

        v52 = (void *)MEMORY[0x24BDD1540];
        v84 = *MEMORY[0x24BDD0FD8];
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 56), "description");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Bundle failed to be cached for request %@"), v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = v54;
        LODWORD(v26) = 1;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "pui_errorWithCode:userInfo:", 7, v55);
        v56 = objc_claimAutoreleasedReturnValue();

        v24 = (id)v56;
      }
    }
    else
    {
      v25 = -[PUIPosterSnapshotBundleBuilder initWithSnapshotBundle:]([PUIPosterSnapshotBundleBuilder alloc], "initWithSnapshotBundle:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "ondiskFormat");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = v30;
      }
      else
      {
        +[PUIImageOnDiskFormat defaultFormat](PUIImageOnDiskFormat, "defaultFormat");
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v32;

      v34 = *(_QWORD *)(a1 + 48);
      v68 = 0;
      -[PUIPosterSnapshotBundle buildWithOutputURL:diskFormat:error:](v25, "buildWithOutputURL:diskFormat:error:", v34, v33, &v68);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v68;

      if (v26)
      {
        v35 = -[PUIPosterSnapshotBundle initWithURL:]([PUIPosterSnapshotBundle alloc], "initWithURL:", *(_QWORD *)(a1 + 48));
        LODWORD(v26) = -[PUIPosterSnapshotBundle isValidBundle](v35, "isValidBundle");
        if ((_DWORD)v26)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v35, *(_QWORD *)(a1 + 48));
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v58 = v15;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

          v37 = (void *)MEMORY[0x24BDD1540];
          v82 = *MEMORY[0x24BDD0FD8];
          v38 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(a1 + 56), "description");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("Bundle failed to be cached for request %@"), v57);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v39;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v40 = v25;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pui_errorWithCode:userInfo:", 7, v41);
          v42 = v3;
          v43 = objc_claimAutoreleasedReturnValue();

          v25 = v40;
          v15 = v58;

          v24 = (id)v43;
          v3 = v42;
        }

      }
    }

LABEL_24:
    v44 = *(NSObject **)(a1 + 64);
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_49;
    v65[3] = &unk_25154C4F0;
    v28 = v3;
    v66 = v24;
    v67 = v3;
    v45 = v24;
    dispatch_async(v44, v65);

    objc_autoreleasePoolPop(v15);
    if ((_DWORD)v26)
    {
      objc_msgSend(*(id *)(a1 + 32), "_cacheLock_cleanupPostersBefore:", *(_QWORD *)(a1 + 72));
      v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    v14 = v59;
    goto LABEL_28;
  }
  v27 = *(NSObject **)(a1 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2_50;
  block[3] = &unk_25154C4F0;
  v28 = v3;
  v64 = v3;
  v63 = v14;
  dispatch_async(v27, block);

  v29 = 0;
LABEL_28:
  PUILogSnapshotCache();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v46;
  v48 = *(_QWORD *)(a1 + 88);
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v75 = v49;
    v76 = 2114;
    v77 = v50;
    v78 = 1024;
    v79 = v29;
    v80 = 1024;
    v81 = v60;
    _os_signpost_emit_with_name_impl(&dword_24464E000, v47, OS_SIGNPOST_INTERVAL_END, v48, "cacheSnapshotBundle", "snapshotBundle URL %{public}@ -> %{public}@; did succeed? %{BOOL}u; did cleanup existing entry? %{BOOL}u",
      buf,
      0x22u);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));

}

void __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setFlag:", 1))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }

}

uint64_t __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2_50(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_prepareSnapshotCache
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE74D38], "sharedWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__PUIPosterSnapshotFilesystemCache__prepareSnapshotCache__block_invoke;
  v3[3] = &unk_25154C170;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__PUIPosterSnapshotFilesystemCache__prepareSnapshotCache__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  unint64_t v49;
  os_signpost_id_t v50;
  void *v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PUILogSnapshotCache();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_generate(v2);

    PUILogSnapshotCache();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v3 - 1;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SnapshotCachePrepare", ", buf, 2u);
    }

    PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    v7 = objc_msgSend(*((id *)WeakRetained + 3), "checkResourceIsReachableAndReturnError:", 0);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *((_QWORD *)WeakRetained + 3);
    if (v7)
    {
      v49 = v3 - 1;
      v50 = v3;
      objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, 0, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      obj = v11;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v63 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(v16, "lastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "containsString:", v53);

            if ((v18 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "removeItemAtURL:error:", v16, 0);

              if (v20)
              {
                PUILogSnapshotCache();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v67 = (uint64_t)v16;
                  _os_log_impl(&dword_24464E000, v21, OS_LOG_TYPE_DEFAULT, "Pruning old epoch: %{public}@", buf, 0xCu);
                }

                objc_msgSend(*((id *)WeakRetained + 2), "removeObjectForKey:", v16);
              }
            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        }
        while (v13);
      }

      PUILogSnapshotCache();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24464E000, v22, OS_LOG_TYPE_INFO, "Scanning for pre-cachable snapshot bundles", buf, 2u);
      }

      v51 = (void *)objc_opt_new();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *((_QWORD *)WeakRetained + 3), 0, 2, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v59 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
            objc_msgSend(v29, "pathExtension");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "localizedCompare:", CFSTR("pks"));

            if (!v31)
            {
              objc_msgSend(v51, "addObject:", v29);
              PUILogSnapshotCache();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v67 = (uint64_t)v29;
                _os_log_impl(&dword_24464E000, v32, OS_LOG_TYPE_DEFAULT, "Found precachable url %{public}@", buf, 0xCu);
              }

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        }
        while (v26);
      }

      PUILogSnapshotCache();
      v33 = objc_claimAutoreleasedReturnValue();
      v3 = v50;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = objc_msgSend(v51, "count");
        *(_DWORD *)buf = 134217984;
        v67 = v34;
        _os_log_impl(&dword_24464E000, v33, OS_LOG_TYPE_INFO, "Found %lu pre-cachable snapshot bundles", buf, 0xCu);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v35 = v51;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v55;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v55 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
            os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
            objc_msgSend(*((id *)WeakRetained + 2), "objectForKey:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              PUILogSnapshotCache();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v67 = (uint64_t)v40;
                _os_log_error_impl(&dword_24464E000, v42, OS_LOG_TYPE_ERROR, "Already cached %{public}@; moving on...",
                  buf,
                  0xCu);
              }
            }
            else
            {
              +[PUIPosterSnapshotBundle snapshotBundleAtURL:error:](PUIPosterSnapshotBundle, "snapshotBundleAtURL:error:", v40, 0);
              v42 = objc_claimAutoreleasedReturnValue();
              PUILogSnapshotCache();
              v43 = objc_claimAutoreleasedReturnValue();
              v44 = v43;
              if (v42)
              {
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v67 = (uint64_t)v42;
                  v68 = 2114;
                  v69 = v40;
                  _os_log_impl(&dword_24464E000, v44, OS_LOG_TYPE_DEFAULT, "PRECACHING %{public}@ @ %{public}@", buf, 0x16u);
                }

                objc_msgSend(*((id *)WeakRetained + 2), "setObject:forKey:", v42, v40);
                PUILogSnapshotCache();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v67 = (uint64_t)v42;
                  v68 = 2114;
                  v69 = v40;
                  _os_log_impl(&dword_24464E000, v45, OS_LOG_TYPE_DEFAULT, "PRECACHED %{public}@ @ %{public}@", buf, 0x16u);
                }
              }
              else
              {
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v67 = (uint64_t)v40;
                  _os_log_error_impl(&dword_24464E000, v44, OS_LOG_TYPE_ERROR, "Failed to precache %{public}@; removing",
                    buf,
                    0xCu);
                }

                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v45 = objc_claimAutoreleasedReturnValue();
                -[NSObject removeItemAtURL:error:](v45, "removeItemAtURL:error:", v40, 0);
              }

            }
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        }
        while (v37);
      }

      v6 = v49;
    }
    else
    {
      PFPosterPathFileAttributes();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, v46, 0);

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }
    PUILogSnapshotCache();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v48, OS_SIGNPOST_INTERVAL_END, v3, "SnapshotCachePrepare", ", buf, 2u);
    }

  }
}

- (void)_cacheLock_cleanupPostersBefore:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t spid;
  unint64_t v47;
  PUIPosterSnapshotFilesystemCache *v48;
  void *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  id obj;
  void *v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
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
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_cacheLock);
  PUILogSnapshotCache();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  PUILogSnapshotCache();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v76 = v4;
    _os_signpost_emit_with_name_impl(&dword_24464E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SnapshotCache-cleanupPostersBefore", "latest path %{public}@", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_snapshotURLForPosterPath:relativeTo:", v4, self->_cacheURLInternalDirectory);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "version");

  if (v13)
  {
    v47 = v6 - 1;
    v48 = self;
    v49 = v9;
    v50 = v4;
    spid = v6;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_opt_new();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[NSObject contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, 0, 17, 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v69;
      v53 = v14;
      v54 = v11;
      v51 = *(_QWORD *)v69;
      v52 = v13;
      do
      {
        v18 = 0;
        v55 = v16;
        do
        {
          if (*(_QWORD *)v69 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v18);
          objc_msgSend(v19, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v20, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "integerValue") < v13)
          {
            v57 = v22;
            v58 = v18;
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            -[NSObject enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v21, MEMORY[0x24BDBD1A8], 16, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            v25 = v21;
            if (v24)
            {
              v26 = v24;
              v27 = *(_QWORD *)v65;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v65 != v27)
                    objc_enumerationMutation(v23);
                  v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                  objc_msgSend(v29, "pathExtension");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "localizedCompare:", CFSTR("pks"));

                  if (!v31)
                  {
                    objc_msgSend(v29, "URLByStandardizingPath");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "URLByDeletingLastPathComponent");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "lastPathComponent");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "URLByAppendingPathComponent:isDirectory:", v34, 0);
                    v35 = v25;
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v59, "addObject:", v36);
                    v25 = v35;
                  }
                }
                v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
              }
              while (v26);
            }

            v14 = v53;
            v11 = v54;
            v17 = v51;
            v13 = v52;
            v21 = v25;
            v16 = v55;
            v22 = v57;
            v18 = v58;
          }

          ++v18;
        }
        while (v18 != v16);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v16);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v37 = v59;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v61 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
          if (-[NSObject removeItemAtURL:error:](v14, "removeItemAtURL:error:", v42, 0))
            -[NSCache removeObjectForKey:](v48->_cacheLock_URLToSnapshotBundleCache, "removeObjectForKey:", v42);
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v39);
    }

    PUILogSnapshotCache();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v4 = v50;
    if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_DWORD *)buf = 138543362;
      v76 = v37;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v44, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCache-cleanupPostersBefore", "cleanedupPathURLs %{public}@", buf, 0xCu);
    }

    v9 = v49;
  }
  else
  {
    PUILogSnapshotCache();
    v45 = objc_claimAutoreleasedReturnValue();
    v14 = v45;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v14, OS_SIGNPOST_INTERVAL_END, v6, "SnapshotCache-cleanupPostersBefore", "version 0; no cleanup needed",
        buf,
        2u);
    }
  }

}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_fileSystemQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_cacheURLInternalDirectory, 0);
  objc_storeStrong((id *)&self->_cacheLock_URLToSnapshotBundleCache, 0);
}

- (void)initWithURL:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)latestSnapshotBundleForPoster:(const char *)a1 snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)latestSnapshotBundleForPoster:(os_log_t)log snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_24464E000, log, OS_LOG_TYPE_ERROR, "failed to load snapshotBundle %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)latestSnapshotBundleForPoster:(const char *)a1 snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
