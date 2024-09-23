@implementation MBFileScanner

- (MBFileScanner)initWithDelegate:(id)a3 mode:(unint64_t)a4 enginePolicy:(unint64_t)a5 debugContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  MBFileScanner *v13;
  MBFileScanner *v14;
  NSMutableSet *v15;
  NSMutableSet *modifiedDomains;
  NSMutableDictionary *v17;
  NSMutableDictionary *lastModifiedDateBySQLiteFileID;
  objc_class *v19;
  objc_super v21;

  v10 = a3;
  v11 = a6;
  if (!a4)
    sub_100088C38();
  v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)MBFileScanner;
  v13 = -[MBFileScanner init](&v21, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_mode = a4;
    v14->_policy = a5;
    objc_storeStrong((id *)&v14->_debugContext, a6);
    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    modifiedDomains = v14->_modifiedDomains;
    v14->_modifiedDomains = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastModifiedDateBySQLiteFileID = v14->_lastModifiedDateBySQLiteFileID;
    v14->_lastModifiedDateBySQLiteFileID = v17;

    v19 = (objc_class *)objc_opt_class(v10);
    v14->_delegateImpOfFileScannerDidFindFile = class_getMethodImplementation(v19, "fileScanner:didFindFile:");
    v14->_delegateRespondsToFileScannerShouldExcludeFile = objc_opt_respondsToSelector(v10, "fileScanner:shouldExcludeFile:") & 1;
  }

  return v14;
}

- (NSSet)modifiedDomains
{
  return (NSSet *)self->_modifiedDomains;
}

- (id)scanDomain:(id)a3 snapshotMountPoint:(id)a4
{
  id v6;
  id v7;
  BOOL *p_started;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t mode;
  unint64_t policy;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t minFileSize;
  uint64_t maxFileSize;
  uint8_t v32[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  _BYTE buf[72];

  v6 = a3;
  v7 = a4;
  p_started = &self->_started;
  do
    v9 = __ldaxr((unsigned __int8 *)p_started);
  while (__stlxr(1u, (unsigned __int8 *)p_started));
  if ((v9 & 1) == 0)
  {
    *(_OWORD *)&self->_totalStats.totalFileSize = 0u;
    *(_OWORD *)&self->_totalStats.maxFileSize = 0u;
    self->_totalStats.symLinkCount = 0;
    *(_OWORD *)&self->_totalStats.dirCount = 0u;
    *(_OWORD *)&self->_totalStats.rootCloneCount = 0u;
    *(_OWORD *)&self->_totalStats.minFileSize = xmmword_10009D4C0;
    self->_startTime = (int64_t)-[MBDebugContext time](self->_debugContext, "time");
  }
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootPath"));
  v13 = objc_msgSend(v12, "length");
  if (!v13)
  {
    v15 = MBGetDefaultLog(0, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping domain \"%@\" with nil or empty root path", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "=scanning= Skipping domain \"%@\" with nil or empty root path", v12);
    }

  }
  *(_QWORD *)buf = 0;
  memset(&buf[16], 0, 56);
  *(_OWORD *)&buf[8] = xmmword_10009D4C0;
  v17 = MBGetDefaultLog(v13, v14);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    mode = self->_mode;
    policy = self->_policy;
    *(_DWORD *)v32 = 138544386;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v7;
    v38 = 2048;
    v39 = mode;
    v40 = 2048;
    v41 = policy;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "=scanning= Scanning domain %{public}@ at %@ from snapshot %@ mode:0x%lx policy:0x%lx", v32, 0x34u);
    _MBLog(CFSTR("INFO"), "=scanning= Scanning domain %{public}@ at %@ from snapshot %@ mode:0x%lx policy:0x%lx", v11, v12, v7, self->_mode, self->_policy);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanDomain:snapshotPath:stats:](self, "_scanDomain:snapshotPath:stats:", v6, v7, buf));
  v23 = MBGetDefaultLog(v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend((id)objc_opt_class(self), "_stringValueForStats:", buf);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)v32 = 138543874;
    v33 = v11;
    v34 = 2112;
    v35 = v26;
    v36 = 2112;
    v37 = v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=scanning= Finished scanning domain %{public}@ - %@: %@", v32, 0x20u);

    v27 = objc_msgSend((id)objc_opt_class(self), "_stringValueForStats:", buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    _MBLog(CFSTR("DEFAULT"), "=scanning= Finished scanning domain %{public}@ - %@: %@", v11, v28, v21);

  }
  minFileSize = self->_totalStats.minFileSize;
  if (minFileSize >= *(uint64_t *)&buf[8])
    minFileSize = *(_QWORD *)&buf[8];
  self->_totalStats.totalFileSize += *(_QWORD *)buf;
  self->_totalStats.minFileSize = minFileSize;
  maxFileSize = self->_totalStats.maxFileSize;
  if (maxFileSize <= *(uint64_t *)&buf[16])
    maxFileSize = *(_QWORD *)&buf[16];
  self->_totalStats.maxFileSize = maxFileSize;
  *(int64x2_t *)&self->_totalStats.fileCount = vaddq_s64(*(int64x2_t *)&self->_totalStats.fileCount, *(int64x2_t *)&buf[24]);
  *(int64x2_t *)&self->_totalStats.fullCloneCount = vaddq_s64(*(int64x2_t *)&self->_totalStats.fullCloneCount, *(int64x2_t *)&buf[40]);
  *(int64x2_t *)&self->_totalStats.hardLinkCount = vaddq_s64(*(int64x2_t *)&self->_totalStats.hardLinkCount, *(int64x2_t *)&buf[56]);

  objc_autoreleasePoolPop(v10);
  return v21;
}

+ (id)_stringValueForStats:(_MBFileScannerDomainStats *)a3
{
  void *v4;
  int64_t minFileSize;
  int64_t maxFileSize;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", a3->totalFileSize, 0));
  minFileSize = a3->minFileSize;
  if (minFileSize == 0x7FFFFFFFFFFFFFFFLL)
    minFileSize = -1;
  maxFileSize = a3->maxFileSize;
  if (maxFileSize == 0x8000000000000000)
    maxFileSize = -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("size:%lld (%@)/%lld/%lld, files:%llu, dirs:%llu, clones:%llu/%llu, hardLinks:%llu, symLinks:%llu"), a3->totalFileSize, v4, minFileSize, maxFileSize, a3->fileCount, a3->dirCount, a3->fullCloneCount, a3->rootCloneCount, a3->hardLinkCount, a3->symLinkCount));

  return v7;
}

- (id)loggableStats
{
  return objc_msgSend((id)objc_opt_class(self), "_stringValueForStats:", &self->_totalStats);
}

- (void)cancel
{
  BOOL *p_canceled;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  MBFileScanner *v8;

  p_canceled = &self->_canceled;
  do
    v4 = __ldaxr((unsigned __int8 *)p_canceled);
  while (__stlxr(1u, (unsigned __int8 *)p_canceled));
  if ((v4 & 1) == 0)
  {
    v5 = MBGetDefaultLog(self, a2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=scanning= Canceling %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "=scanning= Canceling %@", self);
    }

  }
}

- (void)reset
{
  NSMutableSet *modifiedDomains;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSMutableDictionary *lastModifiedDateBySQLiteFileID;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  modifiedDomains = self->_modifiedDomains;
  self->_modifiedDomains = 0;

  v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v5 = self->_modifiedDomains;
  self->_modifiedDomains = v4;

  lastModifiedDateBySQLiteFileID = self->_lastModifiedDateBySQLiteFileID;
  self->_lastModifiedDateBySQLiteFileID = 0;

  v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8 = self->_lastModifiedDateBySQLiteFileID;
  self->_lastModifiedDateBySQLiteFileID = v7;

  self->_startTime = 0;
  atomic_store(0, (unsigned __int8 *)&self->_started);
}

- (void)_updateStats:(_MBFileScannerDomainStats *)a3 file:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t minFileSize;
  int64_t maxFileSize;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  unint64_t *p_rootCloneCount;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t dirCount;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t fileCount;
  void *v36;
  void *v37;
  unint64_t v38;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;

  v5 = a4;
  v6 = objc_msgSend(v5, "type");
  switch((_DWORD)v6)
  {
    case 0x4000:
      v17 = a3->dirCount + 1;
      a3->dirCount = v17;
      if (__ROR8__(0xD288CE703AFB7E91 * v17, 4) <= 0x68DB8BAC710CBuLL)
      {
        v18 = MBGetDefaultLog(v6, v7);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          dirCount = a3->dirCount;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
          *(_DWORD *)buf = 134218242;
          v40 = dirCount;
          v41 = 2114;
          v42 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu dirs (%{public}@)", buf, 0x16u);

          v23 = a3->dirCount;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
          _MBLog(CFSTR("DEFAULT"), "=scanning= Found %llu dirs (%{public}@)", v23, v25);
LABEL_27:

        }
LABEL_28:

      }
      break;
    case 0xA000:
      ++a3->symLinkCount;
      break;
    case 0x8000:
      v8 = (uint64_t)objc_msgSend(v5, "size");
      v9 = v8;
      minFileSize = a3->minFileSize;
      if (minFileSize >= v8)
        minFileSize = v8;
      a3->totalFileSize += v8;
      a3->minFileSize = minFileSize;
      maxFileSize = a3->maxFileSize;
      v12 = a3->fileCount + 1;
      if (maxFileSize <= v8)
        maxFileSize = v8;
      a3->maxFileSize = maxFileSize;
      a3->fileCount = v12;
      if (objc_msgSend(v5, "isHardLink"))
        ++a3->hardLinkCount;
      v13 = objc_msgSend(v5, "isFullClone");
      if ((_DWORD)v13)
      {
        v15 = objc_msgSend(v5, "inodeNumber");
        v13 = objc_msgSend(v5, "cloneID");
        if (v15 == v13)
        {
          p_rootCloneCount = &a3->rootCloneCount;
        }
        else
        {
          v13 = objc_msgSend(v5, "isFullClone");
          if (!(_DWORD)v13)
            goto LABEL_20;
          p_rootCloneCount = &a3->fullCloneCount;
        }
        ++*p_rootCloneCount;
      }
LABEL_20:
      if (v9 >= 0x6FC23AC00)
      {
        v26 = MBGetDefaultLog(v13, v14);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
          *(_DWORD *)buf = 134218498;
          v40 = v9;
          v41 = 2114;
          v42 = v28;
          v43 = 2114;
          v44 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scanning= Found large file (%lld) at %{public}@ (%{public}@)", buf, 0x20u);

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
          _MBLog(CFSTR("DEFAULT"), "=scanning= Found large file (%lld) at %{public}@ (%{public}@)", v9, v31, v33);

        }
      }
      if (__ROR8__(0xD288CE703AFB7E91 * a3->fileCount, 4) <= 0x68DB8BAC710CBuLL)
      {
        v34 = MBGetDefaultLog(v13, v14);
        v19 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          fileCount = a3->fileCount;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
          *(_DWORD *)buf = 134218242;
          v40 = fileCount;
          v41 = 2114;
          v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu files (%{public}@)", buf, 0x16u);

          v38 = a3->fileCount;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
          _MBLog(CFSTR("DEFAULT"), "=scanning= Found %llu files (%{public}@)", v38, v25);
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      break;
  }

}

- (id)_scanDomain:(id)a3 snapshotPath:(id)a4 stats:(_MBFileScannerDomainStats *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v11 = objc_msgSend(v8, "isUninstalledAppDomain");
  if ((_DWORD)v11)
  {
    v13 = MBGetDefaultLog(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=scanning= Not scanning uninstalled app domain %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "=scanning= Not scanning uninstalled app domain %{public}@", v10);
    }

    v15 = 0;
  }
  else
  {
    -[MBDebugContext setValue:forName:](self->_debugContext, "setValue:forName:", v10, CFSTR("DomainName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePathsToBackup"));
    v17 = objc_msgSend(v16, "containsObject:", &stru_1000DBB88);

    if (v17)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesForDomain:snapshotPath:relativePath:stats:](self, "_scanFilesForDomain:snapshotPath:relativePath:stats:", v8, v9, &stru_1000DBB88, a5));
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePathsToBackup"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileScanner treeWithPaths:](MBFileScanner, "treeWithPaths:", v18));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanTree:forDomain:snapshotPath:relativePath:stats:](self, "_scanTree:forDomain:snapshotPath:relativePath:stats:", v19, v8, v9, &stru_1000DBB88, a5));
    }
    objc_msgSend(v8, "releaseCachedFileDescriptors");
  }

  return v15;
}

+ (id)treeWithPaths:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *i;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  NSMutableDictionary *v27;
  id v28;
  void *context;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  id v42;

  v3 = a3;
  v27 = objc_opt_new(NSMutableDictionary);
  v23 = objc_autoreleasePoolPush();
  v22 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", 0, 1);
  v42 = v22;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  v24 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        context = objc_autoreleasePoolPush();
        v8 = v27;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          while (2)
          {
            v13 = 0;
            v14 = v8;
            do
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
              v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
              if (v16)
              {
                v8 = v16;
                if (!-[NSMutableDictionary count](v16, "count"))
                {
                  v18 = MBGetDefaultLog(0, v17);
                  v19 = objc_claimAutoreleasedReturnValue(v18);
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v39 = v7;
                    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=scanning= Ignoring %{public}@ since one of its ancestors is already included", buf, 0xCu);
                    _MBLog(CFSTR("DEFAULT"), "=scanning= Ignoring %{public}@ since one of its ancestors is already included", v7);
                  }

                  v8 = v14;
                  goto LABEL_21;
                }
              }
              else
              {
                v8 = objc_opt_new(NSMutableDictionary);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, v15);
              }

              v13 = (char *)v13 + 1;
              v14 = v8;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_21:

        objc_autoreleasePoolPop(context);
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v28);
  }

  objc_autoreleasePoolPop(v23);
  return v27;
}

- (BOOL)_shouldNotBackupFile:(id)a3 domain:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  BOOL v9;
  unint64_t policy;
  _BOOL4 v11;
  unint64_t v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  char v19;
  int v20;
  ssize_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  id v52;
  size_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  unsigned int v57;
  void *v58;
  CFURLRef v59;
  id v60;
  id v61;
  uint64_t v62;
  void *i;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  BOOL v78;
  id v79;
  void *v80;
  unsigned int v81;
  NSObject *v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  const __CFURL *v89;
  unsigned __int8 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const __CFBoolean *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  NSObject *v112;
  NSObject *v113;
  id v114;
  id v115;
  NSObject *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  _BYTE *v121;
  void *v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const __CFBoolean *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  NSObject *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  NSObject *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  unsigned int v157;
  void *v158;
  id v159;
  char v160;
  void *context;
  void *contexta;
  void *v163;
  CFURLRef url;
  CFURLRef urla;
  void *v166;
  id v167;
  id v168;
  CFErrorRef error;
  const __CFBoolean *__buf;
  id v171;
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint8_t buf[4];
  _BYTE v179[18];
  __int16 v180;
  id v181;
  _BYTE v182[128];

  v6 = a3;
  v167 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (!self->_delegateRespondsToFileScannerShouldExcludeFile
    || (objc_msgSend(WeakRetained, "fileScanner:shouldExcludeFile:", self, v6) & 1) == 0)
  {
    policy = self->_policy;
    if ((policy & 0x21) == 0x20)
      sub_100088C60();
    url = (CFURLRef)(policy & 0x22);
    v11 = url != 0;
    v12 = policy & 0x2A;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v14 = _os_feature_enabled_impl("MobileBackup", "iCloudBackupDatalessFiles");
    if (v12 == 8 && (v14 & 1) == 0)
    {
      v15 = objc_msgSend(v6, "isDataless");
      if ((_DWORD)v15)
      {
        v17 = MBGetDefaultLog(v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v179 = v6;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (SF_DATALESS): %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up (SF_DATALESS): %@", v6);
        }
LABEL_41:

        v41 = 0;
        v9 = 1;
LABEL_42:

        goto LABEL_43;
      }
    }
    if (objc_msgSend(v6, "isCompressed"))
    {
      if (objc_msgSend(v6, "isRegularFile"))
      {
        v19 = policy;
        policy = (unint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absolutePath")));
        v20 = open((const char *)objc_msgSend((id)policy, "fileSystemRepresentation"), 256);

        LOBYTE(policy) = v19;
        if ((v20 & 0x80000000) == 0)
        {
          v21 = pread(v20, &__buf, 1uLL, 0);
          v22 = *__error();
          v23 = close(v20);
          if (v21 < 0)
          {
            v25 = MBGetDefaultLog(v23, v24);
            v26 = objc_claimAutoreleasedReturnValue(v25);
            v18 = v26;
            if ((v22 & 0xFFFFFFFD) == 9)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v179 = v6;
                *(_WORD *)&v179[8] = 1024;
                *(_DWORD *)&v179[10] = v22;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (UF_COMPRESSED): %@ (%{errno}d)", buf, 0x12u);
                _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up (UF_COMPRESSED): %@ (%{errno}d)", v6, v22);
              }
              goto LABEL_41;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v27 = v18;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v179 = v13;
                *(_WORD *)&v179[8] = 1024;
                *(_DWORD *)&v179[10] = v22;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "=scanning= pread failed for %@: %{errno}d", buf, 0x12u);
              }

              _MBLog(CFSTR("ERROR"), "=scanning= pread failed for %@: %{errno}d", v13, v22);
            }

          }
          LOBYTE(policy) = v19;
        }
      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "relativePathsNotToBackup"));
    v30 = v13;
    v31 = v29;
    v166 = v30;
    if ((objc_msgSend(v29, "containsObject:") & 1) != 0)
      goto LABEL_27;
    if (url)
    {
      context = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(context, "relativePathsNotToBackupToDrive"));
      if ((objc_msgSend(v32, "containsObject:", v166) & 1) != 0)
      {

LABEL_27:
        goto LABEL_39;
      }
      v158 = v32;
    }
    v163 = v8;
    v160 = policy;
    if (v12 == 8)
    {
      v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "relativePathsNotToBackupToService"));
      if ((objc_msgSend(v156, "containsObject:", v166) & 1) != 0)
      {
        v35 = 1;
        goto LABEL_36;
      }
    }
    v36 = policy & 6;
    if (v36 == 2)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "relativePathsNotToBackupToLocal"));
      if (objc_msgSend(v38, "containsObject:", v166))
      {

        v35 = 1;
        v8 = v163;
        if (v12 == 8)
          goto LABEL_36;
        goto LABEL_83;
      }
      v154 = v38;
      if ((policy & 0x20) == 0)
      {
        v35 = 0;
        v8 = v163;
        goto LABEL_81;
      }
      v153 = v37;
    }
    else if ((policy & 0x20) == 0)
    {
      v35 = 0;
      v8 = v163;
      goto LABEL_82;
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "relativePathsNotToBackupInMegaBackup"));
    v35 = objc_msgSend(v77, "containsObject:", v166);

    v11 = 1;
    v78 = v36 == 2;
    v8 = v163;
    v37 = v153;
    if (!v78)
    {
LABEL_82:
      if (v12 == 8)
      {
LABEL_36:

        v39 = v158;
        if (!v11)
          goto LABEL_38;
        goto LABEL_37;
      }
LABEL_83:
      v39 = v158;
      if (!v11)
      {
LABEL_38:

        if ((v35 & 1) != 0)
        {
LABEL_39:
          v40 = MBGetDefaultLog(v33, v34);
          v18 = objc_claimAutoreleasedReturnValue(v40);
          v13 = v166;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v179 = v6;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (explicit): %@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up (explicit): %@", v6, v152);
          }
          goto LABEL_41;
        }
        v43 = MBDeviceClass();
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v13 = v166;
        if ((objc_msgSend(v44, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "relativePathsNotToBackupAndRestoreToAppleTVs"));
          v47 = objc_msgSend(v46, "containsObject:", v166);

          v50 = v160;
          if (v47)
          {
            v51 = MBGetDefaultLog(v48, v49);
            v18 = objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v6;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (device explicit): %@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up (device explicit): %@", v6, v152);
            }
            goto LABEL_41;
          }
        }
        else
        {

          v50 = v160;
        }
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absolutePath")));
        v53 = strlen((const char *)objc_msgSend(v52, "fileSystemRepresentation"));
        if (v53 >= 0x3E6)
        {
          v55 = MBGetDefaultLog(v53, v54);
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v179 = v52;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "=scanning= WARNING: File name too long - excluding file and continuing with backup. Please contact the developer and include this log message. Path: %@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "=scanning= WARNING: File name too long - excluding file and continuing with backup. Please contact the developer and include this log message. Path: %@", v52);
          }
          v41 = 0;
          goto LABEL_55;
        }
        v57 = objc_msgSend(v6, "hasXattrs");
        if (url)
        {
          v157 = v57;
          v159 = v52;
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "relativePathsToIgnoreExclusionsForDrive"));
          v174 = 0u;
          v175 = 0u;
          v176 = 0u;
          v177 = 0u;
          v59 = v58;
          v60 = -[__CFURL countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v174, v182, 16);
          urla = v59;
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v175;
            while (2)
            {
              for (i = 0; i != v61; i = (char *)i + 1)
              {
                if (*(_QWORD *)v175 != v62)
                  objc_enumerationMutation(v59);
                v64 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)i);
                v65 = objc_msgSend(v64, "hasSuffix:", CFSTR("/"));
                if ((_DWORD)v65)
                {
                  v67 = MBGetDefaultLog(v65, v66);
                  v68 = objc_claimAutoreleasedReturnValue(v67);
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    v69 = v68;
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                    {
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "name"));
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v179 = v70;
                      *(_WORD *)&v179[8] = 2112;
                      *(_QWORD *)&v179[10] = v64;
                      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "=scanning= Found an invalid path in relativePathsToIgnoreExclusionsForDrive for %@: %@", buf, 0x16u);

                      v13 = v166;
                    }

                    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "name"));
                    _MBLog(CFSTR("ERROR"), "=scanning= Found an invalid path in relativePathsToIgnoreExclusionsForDrive for %@: %@", v71, v64);

                    v59 = urla;
                  }

                }
                else if (objc_msgSend(v13, "hasPrefix:", v64))
                {
                  v72 = objc_msgSend(v13, "length");
                  v73 = objc_msgSend(v64, "length");
                  if (v72 == v73 || v73 < v72 && objc_msgSend(v13, "characterAtIndex:", v73) == 47)
                  {

                    goto LABEL_97;
                  }
                }
              }
              v61 = -[__CFURL countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v174, v182, 16);
              if (v61)
                continue;
              break;
            }
          }

          if (!v157)
          {
LABEL_97:
            v97 = MBGetDefaultLog(v74, v75);
            v82 = objc_claimAutoreleasedReturnValue(v97);
            v52 = v159;
            v50 = v160;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v6;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "=scanning= Skipping exclusion check for %@", buf, 0xCu);
              _MBLog(CFSTR("DEBUG"), "=scanning= Skipping exclusion check for %@", v6);
            }
            v41 = 0;
            goto LABEL_124;
          }

          v52 = v159;
        }
        else if (!v57)
        {
          v41 = 0;
          goto LABEL_125;
        }
        v79 = objc_msgSend(v6, "isDirectory");
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v52, v79));
        v173 = 0;
        v172 = 0;
        v81 = objc_msgSend(v80, "getResourceValue:forKey:error:", &v173);
        v82 = v173;
        v83 = v172;
        urla = (CFURLRef)v80;
        if (v81)
        {
          v84 = -[NSObject BOOLValue](v82, "BOOLValue");
          if ((_DWORD)v84)
          {
            if ((_DWORD)v79)
            {
              v84 = objc_msgSend(v52, "hasSuffix:", CFSTR("/Preferences"));
              if ((_DWORD)v84)
              {
                v86 = objc_autoreleasePoolPush();
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "livePath"));
                if ((objc_msgSend(v87, "isEqualToString:", CFSTR("/var/mobile/Library/Preferences")) & 1) != 0)
                {
                  contexta = v86;
                  v88 = v87;
                  v89 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v87));

                  v171 = v83;
                  urla = v89;
                  v90 = -[__CFURL setResourceValue:forKey:error:](v89, "setResourceValue:forKey:error:", 0, NSURLIsExcludedFromBackupKey, &v171);
                  v41 = v171;

                  v93 = MBGetDefaultLog(v91, v92);
                  v94 = objc_claimAutoreleasedReturnValue(v93);
                  v95 = v94;
                  if ((v90 & 1) != 0)
                  {
                    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                    {
                      v96 = v95;
                      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)v179 = NSURLIsExcludedFromBackupKey;
                        *(_WORD *)&v179[8] = 2112;
                        *(_QWORD *)&v179[10] = v88;
                        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "=scanning= Removed %@ at %@", buf, 0x16u);
                      }

                      _MBLog(CFSTR("DEFAULT"), "=scanning= Removed %@ at %@", NSURLIsExcludedFromBackupKey, v88);
                    }
                  }
                  else if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                  {
                    v146 = v95;
                    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)v179 = NSURLIsExcludedFromBackupKey;
                      *(_WORD *)&v179[8] = 2112;
                      *(_QWORD *)&v179[10] = v88;
                      v180 = 2112;
                      v181 = v41;
                      _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "=scanning= Failed to remove %@ at %@: %@", buf, 0x20u);
                    }

                    _MBLog(CFSTR("ERROR"), "=scanning= Failed to remove %@ at %@: %@", NSURLIsExcludedFromBackupKey, v88, v41);
                  }

                  v149 = MBGetDefaultLog(v147, v148);
                  v150 = objc_claimAutoreleasedReturnValue(v149);
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
                  {
                    v151 = v150;
                    if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v179 = NSURLIsExcludedFromBackupKey;
                      *(_WORD *)&v179[8] = 2112;
                      *(_QWORD *)&v179[10] = v52;
                      _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "=scanning= Found %@ at %@ - ignoring", buf, 0x16u);
                    }

                    _MBLog(CFSTR("DEFAULT"), "=scanning= Found %@ at %@ - ignoring", NSURLIsExcludedFromBackupKey, v52);
                  }

                  objc_autoreleasePoolPop(contexta);
LABEL_103:
                  v50 = v160;
                  if ((v160 & 0x20) != 0)
                    goto LABEL_110;
LABEL_108:
                  v102 = self->_policy;
                  if ((v50 & 2) == 0 || (v102 & 0x14) != 0)
                  {
                    if ((v102 & 1) == 0)
                    {
LABEL_123:
                      v13 = v166;
LABEL_124:

                      v8 = v163;
LABEL_125:
                      if (objc_msgSend(v6, "isRegularFile"))
                      {
                        if ((v50 & 8) != 0)
                        {
                          v114 = objc_msgSend(v6, "protectionClass");
                          if ((_DWORD)v114)
                          {
                            v115 = v114;
                            v116 = 0;
                          }
                          else
                          {
                            v168 = 0;
                            v115 = (id)+[MBProtectionClassUtils getWithPath:error:](MBProtectionClassUtils, "getWithPath:error:", v52, &v168);
                            v116 = v168;
                          }
                          if (((_DWORD)v115 - 1) < 2
                            || (_DWORD)v115 == 255
                            && +[MBError isError:withCode:](MBError, "isError:withCode:", v116, 24))
                          {
                            v117 = objc_msgSend(v6, "isCompressed");
                            if ((_DWORD)v117)
                            {
                              v119 = MBGetDefaultLog(v117, v118);
                              v120 = objc_claimAutoreleasedReturnValue(v119);
                              if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 67109378;
                                *(_DWORD *)v179 = (_DWORD)v115;
                                *(_WORD *)&v179[4] = 2112;
                                *(_QWORD *)&v179[6] = v6;
                                _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (compressed, pc:%d): %@", buf, 0x12u);
                                _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up (compressed, pc:%d): %@", v115, v6);
                              }

                              v56 = v116;
                              goto LABEL_55;
                            }
                          }

                        }
                        v121 = objc_msgSend(v52, "length");
                        if (v121 - (_BYTE *)objc_msgSend(CFSTR(".plist.1234567"), "length") >= 1)
                        {
                          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "substringFromIndex:"));
                          v123 = objc_msgSend(v122, "hasPrefix:", CFSTR(".plist."));

                          if (v123)
                          {
                            v126 = MBGetDefaultLog(v124, v125);
                            v56 = objc_claimAutoreleasedReturnValue(v126);
                            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(_QWORD *)v179 = v52;
                              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "=scanning= Not backing up failed plist safe save: %@", buf, 0xCu);
                              _MBLog(CFSTR("INFO"), "=scanning= Not backing up failed plist safe save: %@", v52);
                            }
                            goto LABEL_55;
                          }
                        }
                        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "pathExtension"));
                        if (objc_msgSend(v127, "isEqualToString:", CFSTR("dat")))
                        {
                          v128 = objc_msgSend(v52, "containsString:", CFSTR("binarycookies_tmp"));

                          if (v128)
                          {
                            v131 = MBGetDefaultLog(v129, v130);
                            v56 = objc_claimAutoreleasedReturnValue(v131);
                            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(_QWORD *)v179 = v52;
                              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "=scanning= Not backing up temporary cookie: %@", buf, 0xCu);
                              _MBLog(CFSTR("INFO"), "=scanning= Not backing up temporary cookie: %@", v52);
                            }
                            goto LABEL_55;
                          }
                        }
                        else
                        {

                        }
                        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
                        v133 = objc_msgSend(v132, "hasPrefix:", CFSTR(".dat.nosync"));

                        if (v133)
                        {
                          v136 = MBGetDefaultLog(v134, v135);
                          v56 = objc_claimAutoreleasedReturnValue(v136);
                          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                          {
                            v56 = v56;
                            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(_QWORD *)v179 = v52;
                              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "=scanning= Not backing up .dat.nosync file: %@", buf, 0xCu);
                            }

                            _MBLog(CFSTR("DEBUG"), "=scanning= Not backing up .dat.nosync file: %@", v52);
                          }
                          goto LABEL_55;
                        }
                      }
                      v9 = 0;
                      goto LABEL_153;
                    }
                    error = 0;
                    __buf = 0;
                    v103 = _kCFURLIsExcludedFromCloudBackupKey;
                    v137 = CFURLCopyResourcePropertyForKey(urla, _kCFURLIsExcludedFromCloudBackupKey, &__buf, &error);
                    if ((_DWORD)v137)
                    {
                      v139 = __buf;
                      if (__buf)
                      {
                        CFRelease(__buf);
                        v50 = v160;
                        if (v139 == kCFBooleanTrue)
                        {
                          v142 = MBGetDefaultLog(v140, v141);
                          v110 = objc_claimAutoreleasedReturnValue(v142);
                          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(_QWORD *)v179 = v6;
                            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up to iCloud (attribute): %@", buf, 0xCu);
                            _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up to iCloud (attribute): %@", v6);
                          }
                          goto LABEL_115;
                        }
                      }
                      goto LABEL_123;
                    }
                    v143 = MBGetDefaultLog(v137, v138);
                    v112 = objc_claimAutoreleasedReturnValue(v143);
                    if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                    {
LABEL_120:

                      v50 = v160;
                      if (error)
                        CFRelease(error);
                      goto LABEL_123;
                    }
                    v113 = v112;
                    if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                    {
LABEL_119:

                      _MBLog(CFSTR("ERROR"), "=scanning= Error fetching value for property %{public}@: %@", v103, error);
                      goto LABEL_120;
                    }
LABEL_118:
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)v179 = v103;
                    *(_WORD *)&v179[8] = 2112;
                    *(_QWORD *)&v179[10] = error;
                    _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "=scanning= Error fetching value for property %{public}@: %@", buf, 0x16u);
                    goto LABEL_119;
                  }
LABEL_110:
                  error = 0;
                  __buf = 0;
                  v103 = _kCFURLIsExcludedFromUnencryptedBackupKey;
                  v104 = CFURLCopyResourcePropertyForKey(urla, _kCFURLIsExcludedFromUnencryptedBackupKey, &__buf, &error);
                  if ((_DWORD)v104)
                  {
                    v106 = __buf;
                    if (__buf)
                    {
                      CFRelease(__buf);
                      v50 = v160;
                      if (v106 == kCFBooleanTrue)
                      {
                        v109 = MBGetDefaultLog(v107, v108);
                        v110 = objc_claimAutoreleasedReturnValue(v109);
                        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)v179 = v6;
                          _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up to unencrypted iTunes (attribute): %@", buf, 0xCu);
                          _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up to unencrypted iTunes (attribute): %@", v6);
                        }
LABEL_115:

                        v83 = v41;
LABEL_166:

                        v41 = v83;
                        v8 = v163;
                        v56 = urla;
                        v13 = v166;
LABEL_55:

                        v9 = 1;
LABEL_153:

                        goto LABEL_42;
                      }
                    }
                    goto LABEL_123;
                  }
                  v111 = MBGetDefaultLog(v104, v105);
                  v112 = objc_claimAutoreleasedReturnValue(v111);
                  if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                    goto LABEL_120;
                  v113 = v112;
                  if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                    goto LABEL_119;
                  goto LABEL_118;
                }

                objc_autoreleasePoolPop(v86);
              }
            }
            v144 = MBGetDefaultLog(v84, v85);
            v145 = objc_claimAutoreleasedReturnValue(v144);
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v6;
              _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (attribute): %@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "=scanning= Not backed up (attribute): %@", v6);
            }

            goto LABEL_166;
          }
        }
        else
        {
          v98 = +[MBError codeForNSError:](MBError, "codeForNSError:", v83);
          if ((_DWORD)v98 != 4)
          {
            v100 = MBGetDefaultLog(v98, v99);
            v101 = objc_claimAutoreleasedReturnValue(v100);
            v50 = v160;
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v179 = v6;
              *(_WORD *)&v179[8] = 2112;
              *(_QWORD *)&v179[10] = v83;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "=scanning= Error getting NSURLIsExcludedFromBackupKey resource: %@: %@", buf, 0x16u);
              _MBLog(CFSTR("DEFAULT"), "=scanning= Error getting NSURLIsExcludedFromBackupKey resource: %@: %@", v6, v83);
            }

            v41 = v83;
            if ((v160 & 0x20) != 0)
              goto LABEL_110;
            goto LABEL_108;
          }
        }
        v41 = v83;
        goto LABEL_103;
      }
LABEL_37:

      goto LABEL_38;
    }
LABEL_81:

    goto LABEL_82;
  }
  v9 = 1;
LABEL_43:

  return v9;
}

- (id)_scanTree:(id)a3 forDomain:(id)a4 snapshotPath:(id)a5 relativePath:(id)a6 stats:(_MBFileScannerDomainStats *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  MBError *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  id v57;
  void *v58;
  SEL v59;
  void *context;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  MBError *v65;
  _OWORD v66[4];
  uint64_t v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  MBError *v72;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = objc_autoreleasePoolPush();
  v18 = v17;
  v19 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v19 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
    goto LABEL_6;
  }
  v59 = a2;
  context = v17;
  v20 = -[MBDebugContext performSelectorForName:withObject:](self->_debugContext, "performSelectorForName:withObject:", CFSTR("Scanning"), self->_debugContext);
  -[MBDebugContext setValue:forName:](self->_debugContext, "setValue:forName:", v16, CFSTR("RelativePath"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v14, v15, v16));
  v67 = 0;
  memset(v66, 0, sizeof(v66));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
  v65 = 0;
  v23 = sub_10007EC7C(v22, (uint64_t)v66, &v65);
  v24 = v65;

  if ((v23 & 1) == 0)
  {
    v26 = +[MBError isError:withCode:](MBError, "isError:withCode:", v24, 4);
    if ((_DWORD)v26)
    {
      v28 = MBGetDefaultLog(v26, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        v70 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "=scanning= Doesn't exist: %@", buf, 0xCu);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
        _MBLog(CFSTR("DEBUG"), "=scanning= Doesn't exist: %@", v31);
LABEL_18:

      }
    }
    else
    {
      v33 = +[MBError isError:withCode:](MBError, "isError:withCode:", v24, 241);
      if (!(_DWORD)v33)
      {
        v37 = +[MBError isError:withCode:](MBError, "isError:withCode:", v24, 242);
        if (!(_DWORD)v37)
        {
          v24 = v24;
          v25 = v24;
          goto LABEL_20;
        }
        v39 = MBGetDefaultLog(v37, v38);
        v29 = objc_claimAutoreleasedReturnValue(v39);
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
        *(_DWORD *)buf = 138412546;
        v70 = v40;
        v71 = 2112;
        v72 = v24;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping due to unsupported mbNode type: %@ %@", buf, 0x16u);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Skipping due to unsupported mbNode type: %@ %@", v31, v24);
        goto LABEL_18;
      }
      v35 = MBGetDefaultLog(v33, v34);
      v29 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
        *(_DWORD *)buf = 138412546;
        v70 = v36;
        v71 = 2112;
        v72 = v24;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping due to unsupported protection class: %@ %@", buf, 0x16u);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Skipping due to unsupported protection class: %@ %@", v31, v24);
        goto LABEL_18;
      }
    }
LABEL_19:

    v25 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v21, "setNode:", v66);
  if (-[MBFileScanner _shouldNotBackupFile:domain:](self, "_shouldNotBackupFile:domain:", v21, v14))
  {
    v25 = 0;
LABEL_20:

    objc_autoreleasePoolPop(context);
    goto LABEL_21;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _foundFile:snapshotPath:stats:](self, "_foundFile:snapshotPath:stats:", v21, v15, a7));

  if (v32)
  {
    v24 = v32;
    v25 = v24;
    goto LABEL_20;
  }
  v42 = objc_msgSend(v21, "isDirectory");
  v43 = v21;
  if (v42)
  {
    v54 = v21;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "sortedArrayUsingComparator:", &stru_1000DA100));

    obj = v45;
    v57 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v57)
    {
      v58 = v13;
      v56 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v56)
            objc_enumerationMutation(obj);
          v47 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v47));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v47));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relativePathsNotToBackup"));
          v51 = objc_msgSend(v50, "containsObject:", v49);

          if (v51)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v59, self, CFSTR("MBFileScanner.m"), 496, CFSTR("Relative path to backup in domain is in set not to backup also: %@-%@"), v14, v49);

          }
          if (objc_msgSend(v48, "count"))
          {
            v52 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanTree:forDomain:snapshotPath:relativePath:stats:](self, "_scanTree:forDomain:snapshotPath:relativePath:stats:", v48, v14, v15, v49, a7));
            if (v52)
              goto LABEL_39;
          }
          else
          {
            v52 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesForDomain:snapshotPath:relativePath:stats:](self, "_scanFilesForDomain:snapshotPath:relativePath:stats:", v14, v15, v49, a7));
            if (v52)
            {
LABEL_39:
              v25 = (void *)v52;

              goto LABEL_40;
            }
          }

        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
        if (v57)
          continue;
        break;
      }
      v25 = 0;
LABEL_40:
      v13 = v58;
    }
    else
    {
      v25 = 0;
    }

    v18 = context;
    v43 = v54;
  }
  else
  {
    v25 = 0;
    v18 = context;
  }

LABEL_6:
  objc_autoreleasePoolPop(v18);
LABEL_21:

  return v25;
}

- (id)_scanFilesForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 stats:(_MBFileScannerDomainStats *)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t mode;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  mode = self->_mode;
  if ((mode & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:](self, "_scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:", v10, v11, v12, 0, a6));
    if (v14)
      goto LABEL_7;
    mode = self->_mode;
  }
  if ((mode & 2) != 0)
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesUsingGetattrlistbulkForDomain:snapshotPath:relativePath:stats:](self, "_scanFilesUsingGetattrlistbulkForDomain:snapshotPath:relativePath:stats:", v10, v11, v12, a6));
  else
    v14 = 0;
LABEL_7:

  return v14;
}

- (id)_scanFilesUsingReaddirForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 depth:(int)a6 stats:(_MBFileScannerDomainStats *)a7
{
  uint64_t v8;
  id v12;
  id v13;
  __CFString *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t policy;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  char v47;
  MBError *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  int v85;
  void *v86;
  unsigned int v87;
  NSObject *v88;
  void *v89;
  unsigned int v90;
  MBError *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  id v95;
  uint8_t v96[4];
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  int v101;
  uint8_t buf[32];
  __int128 v103;
  __int128 v104;
  uint64_t v105;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v15 & 1) == 0)
  {
    v16 = objc_autoreleasePoolPush();
    v18 = v16;
    if ((int)v8 >= 239)
    {
      v19 = MBGetDefaultLog(v16, v17);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v8;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v14;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "=scanning= Reached max directory depth (%d) under %{public}@", buf, 0x12u);
        _MBLog(CFSTR("FAULT"), "=scanning= Reached max directory depth (%d) under %{public}@", v8, v14);
      }
      v21 = 0;
      goto LABEL_72;
    }
    v95 = 0;
    v22 = objc_msgSend(v12, "cachedFileDescriptorWithSnapshotPath:error:", v13, &v95);
    v23 = v95;
    v20 = v23;
    if (v22 == -1)
    {
      v29 = MBGetDefaultLog(v23, v24);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootPath"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v20;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=scanning= Unable to open domain directory at %@:%@: %@", buf, 0x20u);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootPath"));
        _MBLog(CFSTR("ERROR"), "=scanning= Unable to open domain directory at %@:%@: %@", v12, v32, v20);

      }
      v21 = 0;
      goto LABEL_71;
    }
    v92 = v18;
    v25 = -[MBDebugContext performSelectorForName:withObject:](self->_debugContext, "performSelectorForName:withObject:", CFSTR("Scanning"), self->_debugContext);
    -[MBDebugContext setValue:forName:](self->_debugContext, "setValue:forName:", v14, CFSTR("RelativePath"));
    v93 = objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v12, v13, v14));
    if (!v13)
      goto LABEL_39;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    if (!objc_msgSend(v26, "isEqualToString:", CFSTR("HomeDomain")))
    {
LABEL_38:

      goto LABEL_39;
    }
    v27 = v26;
    policy = self->_policy;
    if ((policy & 0x22) != 0)
    {

    }
    else
    {

      if ((policy & 4) == 0)
        goto LABEL_39;
    }
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("Library/Application Support/CloudDocs/backup")) & 1) != 0)
    {
      v21 = 0;
      v18 = v92;
      v30 = v93;
LABEL_71:

LABEL_72:
      objc_autoreleasePoolPop(v18);
      goto LABEL_73;
    }
    v18 = v92;
    if ((-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("Library/Application Support/CloudDocs/backup/")) & 1) != 0|| (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("Library/Application Support/FileProvider/backup")) & 1) != 0|| (-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("Library/Application Support/FileProvider/backup/")) & 1) != 0)
    {
      v21 = 0;
LABEL_22:
      v30 = v93;
      goto LABEL_71;
    }
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("Library/Application Support/CloudDocs")) & 1) == 0&& !-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("Library/Application Support/FileProvider")))
    {
LABEL_39:
      v105 = 0;
      v103 = 0u;
      v104 = 0u;
      memset(buf, 0, sizeof(buf));
      v94 = v20;
      v90 = v22;
      v47 = sub_10007ED7C(v22, v14, (uint64_t)buf, (MBError **)&v94);
      v48 = v94;

      if ((v47 & 1) != 0)
      {
        -[NSObject setNode:](v93, "setNode:", buf);
        if (-[MBFileScanner _shouldNotBackupFile:domain:](self, "_shouldNotBackupFile:domain:", v93, v12))
        {
          v21 = 0;
          v18 = v92;
        }
        else
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _foundFile:snapshotPath:stats:](self, "_foundFile:snapshotPath:stats:", v93, v13, a7));

          v18 = v92;
          if (!v58)
          {
            if (-[NSObject isDirectory](v93, "isDirectory"))
            {
              v74 = objc_autoreleasePoolPush();
              v75 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanDirectory:domain:domainDirFd:snapshotPath:relativePath:depth:stats:](self, "_scanDirectory:domain:domainDirFd:snapshotPath:relativePath:depth:stats:", v93, v12, v90, v13, v14, v8, a7));
              v76 = v74;
              v18 = v92;
              objc_autoreleasePoolPop(v76);
            }
            else
            {
              v75 = 0;
            }
            v48 = v75;
            v21 = v48;
            v30 = v93;
            goto LABEL_70;
          }
          v48 = v58;
          v21 = v48;
        }
        v30 = v93;
LABEL_70:
        v20 = v48;
        goto LABEL_71;
      }
      v49 = +[MBError errnoForError:](MBError, "errnoForError:", v48);
      v50 = objc_claimAutoreleasedReturnValue(-[MBFileScanner delegate](self, "delegate"));
      v52 = (void *)v50;
      if ((_DWORD)v49 == 2)
      {
        v53 = MBGetDefaultLog(v50, v51);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        v55 = v54;
        if ((_DWORD)v8)
        {
          v30 = v93;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
            *(_DWORD *)v96 = 138412290;
            v97 = v56;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "=scanning= Deleted while scanning: %@", v96, 0xCu);

            v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
            _MBLog(CFSTR("DEFAULT"), "=scanning= Deleted while scanning: %@", v57);

          }
          -[MBDebugContext setFlag:](self->_debugContext, "setFlag:", CFSTR("FileDeletedWhileScanning"));
          -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v12);
        }
        else
        {
          v30 = v93;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
            *(_DWORD *)v96 = 138412290;
            v97 = v72;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "=scanning= Doesn't exist: %@", v96, 0xCu);

            v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
            _MBLog(CFSTR("DEBUG"), "=scanning= Doesn't exist: %@", v73);

          }
        }
      }
      else
      {
        v59 = +[MBError isError:withCode:](MBError, "isError:withCode:", v48, 242);
        v30 = v93;
        if (!(_DWORD)v59)
        {
          v91 = v48;
          if ((objc_opt_respondsToSelector(v52, "fileScanner:failedToStatFile:withErrno:") & 1) != 0
            && objc_msgSend(v52, "fileScanner:failedToStatFile:withErrno:", self, v93, v49))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v93, "domain"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "volumeMountPoint"));

            v70 = MBGetDefaultLog(v68, v69);
            v71 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v96 = 138412802;
              v97 = v65;
              v98 = 2112;
              v99 = v14;
              v100 = 1024;
              v101 = (int)v49;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "=scanning= Skipping file with MBNodeForRelativePathAt() failure %@ (%@): %{errno}d", v96, 0x1Cu);
              _MBLog(CFSTR("INFO"), "=scanning= Skipping file with MBNodeForRelativePathAt() failure %@ (%@): %{errno}d", v65, v14, v49);
            }

            sub_10000F2C4(v65, v13, v67, (uint64_t)v49, (uint64_t)"MBNodeForRelativePathAt");
            sub_10000F480(v65, v13, v67, (uint64_t)v49, (uint64_t)"MBNodeForRelativePathAt");

            v21 = 0;
          }
          else
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
            v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v93, "domain"));
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "volumeMountPoint"));

            v82 = MBGetDefaultLog(v80, v81);
            v83 = objc_claimAutoreleasedReturnValue(v82);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 138412802;
              v97 = v77;
              v98 = 2112;
              v99 = v14;
              v100 = 1024;
              v101 = (int)v49;
              _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "=scanning= MBNodeForRelativePathAt() failed at %@ (%@): %{errno}d", v96, 0x1Cu);
              _MBLog(CFSTR("ERROR"), "=scanning= MBNodeForRelativePathAt() failed at %@ (%@): %{errno}d", v77, v14, v49);
            }

            sub_10000F2C4(v77, v13, v79, (uint64_t)v49, (uint64_t)"MBNodeForRelativePathAt");
            sub_10000F480(v77, v13, v79, (uint64_t)v49, (uint64_t)"MBNodeForRelativePathAt");
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v49, 101, v77, CFSTR("MBNodeForRelativePathAt() error")));

          }
          v48 = v91;
          goto LABEL_69;
        }
        v61 = MBGetDefaultLog(v59, v60);
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
          *(_DWORD *)v96 = 138412546;
          v97 = v63;
          v98 = 2112;
          v99 = v48;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "=scanning= Skipping unsupported mbNode type: %@ %@", v96, 0x16u);

          v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absolutePath](v93, "absolutePath"));
          _MBLog(CFSTR("DEBUG"), "=scanning= Skipping unsupported mbNode type: %@ %@", v64, v48);

        }
      }
      v21 = 0;
LABEL_69:

      v18 = v92;
      goto LABEL_70;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v14, "stringByAppendingPathComponent:", CFSTR("backup")));
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v12, 0, v26));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "absolutePath"));
    v96[0] = 0;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v87 = objc_msgSend(v33, "fileExistsAtPath:isDirectory:", v89, v96);
    v85 = v96[0];

    v36 = MBGetDefaultLog(v34, v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v87 && v85)
    {
      if (v38)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v89;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "=scanning= Scanning the live path at %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "=scanning= Scanning the live path at %@", v89);
      }

      v39 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:](self, "_scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:", v12, 0, v26, (v8 + 1), a7));
      v41 = v26;
      v18 = v92;
      if (v39)
      {
        v21 = (void *)v39;
        v42 = v41;

        goto LABEL_22;
      }
      v26 = v41;
      v44 = MBGetDefaultLog(0, v40);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      v88 = v45;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v89;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "=scanning= Finished scanning the live path at %@", buf, 0xCu);
        v43 = "=scanning= Finished scanning the live path at %@";
        goto LABEL_35;
      }
    }
    else
    {
      v88 = v37;
      if (v38)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v89;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "=scanning= No directory found at live path %@", buf, 0xCu);
        v43 = "=scanning= No directory found at live path %@";
LABEL_35:
        v46 = v86;
        _MBLog(CFSTR("DEFAULT"), v43, v89);
LABEL_37:

        goto LABEL_38;
      }
    }
    v46 = v86;
    goto LABEL_37;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
LABEL_73:

  return v21;
}

- (id)_scanDirectory:(id)a3 domain:(id)a4 domainDirFd:(int)a5 snapshotPath:(id)a6 relativePath:(id)a7 depth:(int)a8 stats:(_MBFileScannerDomainStats *)a9
{
  NSObject *v9;
  id v14;
  id v15;
  id v16;
  const char *v17;
  int v18;
  int v19;
  DIR *v20;
  DIR *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  int *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *i;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  __uint64_t d_seekoff;
  id v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v127;
  void *v128;
  id v129;
  uint64_t v130;
  __uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  NSObject *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  char *v146;
  int v147;
  void *v148;
  void *v149;
  id v150;
  unsigned int v151;
  void *v152;
  id v153;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  dirent *v159;
  _BYTE v160[128];
  dirent v161;
  uint8_t buf[4];
  _BYTE v163[24];

  v9 = *(NSObject **)&a8;
  v14 = a3;
  v150 = a4;
  v15 = a6;
  v16 = a7;
  v153 = v15;
  if (objc_msgSend(v16, "length"))
    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
  else
    v17 = ".";
  v147 = a5;
  v18 = openat(a5, v17, 256, 0);
  if (v18 < 0)
  {
    v46 = *__error();
    v47 = objc_claimAutoreleasedReturnValue(-[MBFileScanner delegate](self, "delegate"));
    v49 = (void *)v47;
    v50 = v150;
    if ((_DWORD)v46 == 2)
    {
      v51 = MBGetDefaultLog(v47, v48);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      v53 = v15;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        LODWORD(v161.d_ino) = 138412290;
        *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v54;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when opening directory \"%@\" while scanning", (uint8_t *)&v161, 0xCu);

        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Modification error when opening directory \"%@\" while scanning", v55);

      }
      -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v150);
    }
    else
    {
      v65 = objc_opt_respondsToSelector(v47, "fileScanner:failedToOpenFile:withErrno:");
      v53 = v15;
      if ((v65 & 1) == 0
        || (v65 = (uint64_t)objc_msgSend(v49, "fileScanner:failedToOpenFile:withErrno:", self, v14, v46), !(_DWORD)v65))
      {
        v80 = MBGetDefaultLog(v65, v66);
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          LODWORD(v161.d_ino) = 138412802;
          *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v82;
          WORD2(v161.d_seekoff) = 2080;
          *(__uint64_t *)((char *)&v161.d_seekoff + 6) = (__uint64_t)v17;
          *(_WORD *)&v161.d_name[1] = 1024;
          *(_DWORD *)&v161.d_name[3] = v46;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "=scanning= openat failed at %@ (%s): %{errno}d", (uint8_t *)&v161, 0x1Cu);

          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          _MBLog(CFSTR("ERROR"), "=scanning= openat failed at %@ (%s): %{errno}d", v83, v17, v46);

        }
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        v9 = objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v46, 101, v84, CFSTR("open error")));

        v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        sub_10000D140(v85);
        goto LABEL_65;
      }
      v67 = MBGetDefaultLog(v65, v66);
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        LODWORD(v161.d_ino) = 138412802;
        *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v69;
        WORD2(v161.d_seekoff) = 2080;
        *(__uint64_t *)((char *)&v161.d_seekoff + 6) = (__uint64_t)v17;
        *(_WORD *)&v161.d_name[1] = 1024;
        *(_DWORD *)&v161.d_name[3] = v46;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "=scanning= Skipping file with openat failure %@ (%s): %{errno}d", (uint8_t *)&v161, 0x1Cu);

        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("INFO"), "=scanning= Skipping file with openat failure %@ (%s): %{errno}d", v70, v17, v46);

      }
    }
    v9 = 0;
LABEL_66:

    goto LABEL_106;
  }
  v19 = v18;
  if (!v15)
  {
    memset(&v161, 0, 144);
    if (!fstat(v18, (stat *)&v161))
    {
      d_seekoff = v161.d_seekoff;
      v106 = objc_msgSend(v14, "inodeNumber");
      if ((id)d_seekoff == v106)
        goto LABEL_6;
      v108 = MBGetDefaultLog(v106, v107);
      v109 = objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v163 = v110;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when opening directory \"%@\" while scanning", buf, 0xCu);

        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Modification error when opening directory \"%@\" while scanning", v111);

      }
      v50 = v150;
      -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v150);
      close(v19);
      v9 = 0;
LABEL_105:
      v53 = 0;
      goto LABEL_106;
    }
    v56 = *__error();
    v57 = objc_claimAutoreleasedReturnValue(-[MBFileScanner delegate](self, "delegate"));
    v59 = (void *)v57;
    if ((_DWORD)v56 == 2)
    {
      v60 = MBGetDefaultLog(v57, v58);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v163 = v62;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when stating directory \"%@\" while scanning", buf, 0xCu);

        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Modification error when stating directory \"%@\" while scanning", v63);

      }
      -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v150);
    }
    else
    {
      v115 = objc_opt_respondsToSelector(v57, "fileScanner:failedToStatFile:withErrno:");
      if ((v115 & 1) == 0
        || (v115 = (uint64_t)objc_msgSend(v59, "fileScanner:failedToStatFile:withErrno:", self, v14, v56), !(_DWORD)v115))
      {
        v121 = MBGetDefaultLog(v115, v116);
        v122 = objc_claimAutoreleasedReturnValue(v121);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        {
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v163 = v123;
          *(_WORD *)&v163[8] = 2080;
          *(_QWORD *)&v163[10] = v17;
          *(_WORD *)&v163[18] = 1024;
          *(_DWORD *)&v163[20] = v56;
          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "=scanning= fstat failed at %@ (%s): %{errno}d", buf, 0x1Cu);

          v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          _MBLog(CFSTR("ERROR"), "=scanning= fstat failed at %@ (%s): %{errno}d", v124, v17, v56);

        }
        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v56, 101, v125, CFSTR("stat error")));

        goto LABEL_104;
      }
      v117 = MBGetDefaultLog(v115, v116);
      v118 = objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v163 = v119;
        *(_WORD *)&v163[8] = 2080;
        *(_QWORD *)&v163[10] = v17;
        *(_WORD *)&v163[18] = 1024;
        *(_DWORD *)&v163[20] = v56;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "=scanning= Skipping file with fstat failure %@ (%s): %{errno}d", buf, 0x1Cu);

        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("INFO"), "=scanning= Skipping file with fstat failure %@ (%s): %{errno}d", v120, v17, v56);

      }
    }
    v64 = 0;
LABEL_104:
    close(v19);
    v9 = v64;

    v50 = v150;
    goto LABEL_105;
  }
LABEL_6:
  v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = fdopendir(v19);
  if (!v20)
  {
    v71 = __error();
    v72 = *v71;
    v74 = MBGetDefaultLog(v71, v73);
    v75 = objc_claimAutoreleasedReturnValue(v74);
    v76 = v75;
    if ((_DWORD)v72 == 2)
    {
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        LODWORD(v161.d_ino) = 138412290;
        *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v77;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when opening directory \"%@\" while scanning", (uint8_t *)&v161, 0xCu);

        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Modification error when opening directory \"%@\" while scanning", v78);

      }
      -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v150);
      v79 = 0;
    }
    else
    {
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        LODWORD(v161.d_ino) = 138412802;
        *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v112;
        WORD2(v161.d_seekoff) = 2080;
        *(__uint64_t *)((char *)&v161.d_seekoff + 6) = (__uint64_t)v17;
        *(_WORD *)&v161.d_name[1] = 1024;
        *(_DWORD *)&v161.d_name[3] = v72;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "=scanning= fdopendir failed at %@ (%s): %{errno}d", (uint8_t *)&v161, 0x1Cu);

        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("ERROR"), "=scanning= fdopendir failed at %@ (%s): %{errno}d", v113, v17, v72);

      }
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v72, 101, v114, CFSTR("fdopendir error")));

    }
    close(v19);
    v50 = v150;
    v53 = v153;
    goto LABEL_93;
  }
  v21 = v20;
  v146 = (char *)v17;
  v152 = v16;
  v22 = 0;
  v149 = 0;
  v151 = (_DWORD)v9 + 1;
  while (1)
  {
    v23 = objc_autoreleasePoolPush();
    memset(&v161, 0, 512);
    v159 = 0;
    v24 = readdir_r(v21, &v161, &v159);
    if ((_DWORD)v24)
      break;
    if (!v159)
      goto LABEL_70;
    if (*(unsigned __int16 *)v161.d_name != 46
      && *(unsigned __int16 *)v161.d_name ^ 0x2E2E | v161.d_name[2])
    {
      v22 = (v22 + 1);
      v9 = objc_claimAutoreleasedReturnValue(+[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", v161.d_name));
      if (v9)
      {
        if (v161.d_type == 4)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "stringByAppendingPathComponent:", v9));
          v27 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:](self, "_scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:", v150, v153, v26, v151, a9));

          if (v27)
          {
            v30 = 39;
            v149 = (void *)v27;
LABEL_33:

            goto LABEL_34;
          }
          v149 = 0;
        }
        else
        {
          v28 = objc_msgSend(v148, "addObject:", v9);
        }
        HIDWORD(v39) = 989560465 * v22;
        LODWORD(v39) = 989560465 * v22;
        if ((v39 >> 4) > 0x68DB8)
        {
          v30 = 0;
          goto LABEL_33;
        }
        v40 = MBGetDefaultLog(v28, v29);
        v31 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "name"));
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v163 = v22;
          *(_WORD *)&v163[4] = 2082;
          *(_QWORD *)&v163[6] = v146;
          *(_WORD *)&v163[14] = 2114;
          *(_QWORD *)&v163[16] = v41;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=scanning= Found %u items under %{public}s (%{public}@)", buf, 0x1Cu);

          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "name"));
          _MBLog(CFSTR("DEFAULT"), "=scanning= Found %u items under %{public}s (%{public}@)", v22, v146, v38);
          v30 = 0;
LABEL_31:

        }
        else
        {
          v30 = 0;
        }
LABEL_32:

        goto LABEL_33;
      }
      v31 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v161.d_name, v161.d_namlen));
      v33 = MBGetDefaultLog(v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v163 = v31;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "=scanning= Unexpected file name: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "=scanning= Unexpected file name: %@", v31);
      }

      v35 = sub_100081D30();
      if ((_DWORD)v35)
      {
        v37 = MBGetDefaultLog(v35, v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v163 = v31;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "=scanning= Unexpected file name: %@", buf, 0xCu);
          _MBLog(CFSTR("FAULT"), "=scanning= Unexpected file name: %@", v31);
        }
      }
      else
      {
        if (dword_1000F9E60)
        {
          v30 = 38;
          goto LABEL_32;
        }
        do
          v44 = __ldxr((unsigned int *)&dword_1000F9E60);
        while (__stxr(v44 + 1, (unsigned int *)&dword_1000F9E60));
        if (v44)
        {
          v30 = 38;
          goto LABEL_32;
        }
        v45 = MBGetDefaultLog(v35, v36);
        v38 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "=scanning= =scanning= Unexpected file name", buf, 2u);
          _MBLog(CFSTR("FAULT"), "=scanning= =scanning= Unexpected file name", v145);
        }
      }
      v30 = 38;
      goto LABEL_31;
    }
    v30 = 38;
LABEL_34:
    objc_autoreleasePoolPop(v23);
    if (v30 == 39)
      goto LABEL_71;
  }
  v86 = v24;
  v87 = MBGetDefaultLog(v24, v25);
  v88 = objc_claimAutoreleasedReturnValue(v87);
  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v163 = v89;
    *(_WORD *)&v163[8] = 1024;
    *(_DWORD *)&v163[10] = v86;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "=scanning= readdir_r failed at %@: %d", buf, 0x12u);

    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
    _MBLog(CFSTR("ERROR"), "=scanning= readdir_r failed at %@: %d", v90, v86);

  }
  v91 = *__error();
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
  v9 = objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v91, 101, v92, CFSTR("readdir error")));

  v149 = v9;
LABEL_70:
  objc_autoreleasePoolPop(v23);
LABEL_71:
  v50 = v150;
  v16 = v152;
  v53 = v153;
  if (v22 >> 4 >= 0x271)
  {
    v93 = MBGetDefaultLog(v42, v43);
    v9 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "name"));
      LODWORD(v161.d_ino) = 67109634;
      HIDWORD(v161.d_ino) = v22;
      LOWORD(v161.d_seekoff) = 2082;
      *(__uint64_t *)((char *)&v161.d_seekoff + 2) = (__uint64_t)v146;
      v161.d_namlen = 2114;
      *(_QWORD *)&v161.d_type = v94;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %u items under %{public}s (%{public}@)", (uint8_t *)&v161, 0x1Cu);

      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found a total of %u items under %{public}s (%{public}@)", v22, v146, v95);

    }
  }
  closedir(v21);
  v79 = v149;
  if (v149)
  {
LABEL_93:
    v9 = v79;

    goto LABEL_106;
  }
  objc_msgSend(v148, "sortUsingComparator:", &stru_1000DA120);
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v96 = v148;
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v155, v160, 16);
  if (v97)
  {
    v9 = v97;
    v98 = *(_QWORD *)v156;
    while (2)
    {
      for (i = 0; i != v9; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v156 != v98)
          objc_enumerationMutation(v96);
        v100 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)i);
        v101 = objc_autoreleasePoolPush();
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "stringByAppendingPathComponent:", v100));
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:](self, "_scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:", v150, v153, v102, v151, a9));
        if (v103)
        {
          v9 = v103;

          objc_autoreleasePoolPop(v101);
          v104 = 1;
          goto LABEL_100;
        }

        objc_autoreleasePoolPop(v101);
      }
      v9 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v155, v160, 16);
      if (v9)
        continue;
      break;
    }
    v104 = 0;
LABEL_100:
    v16 = v152;
  }
  else
  {
    v104 = 0;
  }

  if (!v104)
    v9 = 0;
  if (!v153 && (v104 & 1) == 0)
  {
    memset(&v161, 0, 144);
    if (fstatat(v147, v146, (stat *)&v161, 32))
    {
      v127 = *__error();
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner delegate](self, "delegate"));
      v49 = v128;
      if ((_DWORD)v127 == 2)
      {

        goto LABEL_117;
      }
      v136 = objc_opt_respondsToSelector(v128, "fileScanner:failedToStatFile:withErrno:");
      if ((v136 & 1) != 0
        && (v136 = (uint64_t)objc_msgSend(v49, "fileScanner:failedToStatFile:withErrno:", self, v14, v127), (_DWORD)v136))
      {
        v138 = MBGetDefaultLog(v136, v137);
        v85 = objc_claimAutoreleasedReturnValue(v138);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v163 = v139;
          *(_WORD *)&v163[8] = 2080;
          *(_QWORD *)&v163[10] = v146;
          *(_WORD *)&v163[18] = 1024;
          *(_DWORD *)&v163[20] = v127;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "=scanning= Skipping file with fstat failure %@ (%s): %{errno}d", buf, 0x1Cu);

          v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          _MBLog(CFSTR("INFO"), "=scanning= Skipping file with fstat failure %@ (%s): %{errno}d", v140, v146, v127);

        }
        v9 = 0;
      }
      else
      {
        v141 = MBGetDefaultLog(v136, v137);
        v142 = objc_claimAutoreleasedReturnValue(v141);
        if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
        {
          v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v163 = v143;
          *(_WORD *)&v163[8] = 2080;
          *(_QWORD *)&v163[10] = v146;
          *(_WORD *)&v163[18] = 1024;
          *(_DWORD *)&v163[20] = v127;
          _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_ERROR, "=scanning= fstatat failed at %@ (%s): %{errno}d", buf, 0x1Cu);

          v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
          _MBLog(CFSTR("ERROR"), "=scanning= fstatat failed at %@ (%s): %{errno}d", v144, v146, v127);

        }
        v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        v9 = objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v127, 101, v85, CFSTR("stat error")));
      }
LABEL_65:

      goto LABEL_66;
    }
    v131 = v161.d_seekoff;
    v129 = objc_msgSend(v14, "inodeNumber");
    if ((id)v131 == v129)
    {
      -[MBFileScanner _detectModifiedDomain:relativePath:lastModified:](self, "_detectModifiedDomain:relativePath:lastModified:", v150, v16, *(_QWORD *)&v161.d_name[27]);
    }
    else
    {
LABEL_117:
      v132 = MBGetDefaultLog(v129, v130);
      v133 = objc_claimAutoreleasedReturnValue(v132);
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v163 = v134;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "=scanning= Deleted/modified while scanning: %@", buf, 0xCu);

        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Deleted/modified while scanning: %@", v135);

      }
      -[MBDebugContext setFlag:](self->_debugContext, "setFlag:", CFSTR("FileDeletedWhileScanning"));
      -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v150);
    }
    v9 = 0;
  }
LABEL_106:

  return v9;
}

- (id)_scanFilesUsingGetattrlistbulkForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 stats:(_MBFileScannerDomainStats *)a6
{
  id v10;
  id v11;
  __CFString *v12;
  unsigned __int8 v13;
  int v14;
  MBError *v15;
  MBError *v16;
  char v17;
  MBError *v18;
  void *v19;
  MBError *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  id v37;
  int v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSMutableArray *v78;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  NSMutableArray *v87;
  NSMutableArray *v88;
  void *v89;
  id v90;
  MBError *v91;
  id v92;
  uint8_t v93[4];
  id v94;
  __int16 v95;
  id v96;
  __int16 v97;
  void *v98;
  uint8_t buf[32];
  __int128 v100;
  __int128 v101;
  uint64_t v102;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v13 & 1) != 0)
  {
    v20 = (MBError *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
    goto LABEL_59;
  }
  v92 = 0;
  v14 = objc_msgSend(v10, "cachedFileDescriptorWithSnapshotPath:error:", v11, &v92);
  v15 = (MBError *)v92;
  v16 = v15;
  if (v14 < 0)
  {
    v21 = +[MBError isError:withCode:](MBError, "isError:withCode:", v15, 4);
    if ((v21 & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      v23 = MBGetDefaultLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=scanning= Failed to fetch cached file descriptor for domain %@: %@", buf, 0x16u);

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        _MBLog(CFSTR("ERROR"), "=scanning= Failed to fetch cached file descriptor for domain %@: %@", v26, v16);

      }
      v16 = v16;
      v20 = v16;
    }
    goto LABEL_58;
  }
  v102 = 0;
  v100 = 0u;
  v101 = 0u;
  memset(buf, 0, sizeof(buf));
  v91 = v15;
  v17 = sub_10007ED7C(v14, v12, (uint64_t)buf, &v91);
  v18 = v91;

  if ((v17 & 1) == 0)
  {
    if ((+[MBError isError:withCode:](MBError, "isError:withCode:", v18, 4) & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      v18 = v18;
      v20 = v18;
    }
    goto LABEL_57;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v10, v11, v12));
  objc_msgSend(v19, "setNode:", buf);
  if (-[MBFileScanner _shouldNotBackupFile:domain:](self, "_shouldNotBackupFile:domain:", v19, v10))
  {
LABEL_5:
    v20 = 0;
    goto LABEL_56;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner _foundFile:snapshotPath:stats:](self, "_foundFile:snapshotPath:stats:", v19, v11, a6));

  if (v27)
  {
    v18 = v27;
    v20 = v18;
    goto LABEL_56;
  }
  if (!objc_msgSend(v19, "isDirectory"))
  {
    v18 = 0;
    goto LABEL_5;
  }
  v80 = v19;
  v28 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v28, "addObject:", v12);
  v29 = objc_opt_new(NSMutableArray);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)&buf[2]));
  v88 = v29;
  -[NSMutableArray addObject:](v29, "addObject:", v30);

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0x4000));
  v31 = 0;
  v87 = v28;
  while (1)
  {
    if (!-[NSMutableArray count](v28, "count"))
    {
      v65 = v31;
      goto LABEL_55;
    }
    v32 = objc_autoreleasePoolPush();
    v33 = v32;
    v34 = atomic_load((unsigned __int8 *)&self->_canceled);
    if ((v34 & 1) != 0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
      goto LABEL_54;
    }
    v89 = v32;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v28, "lastObject"));
    -[NSMutableArray removeLastObject](v28, "removeLastObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v88, "lastObject"));
    v37 = objc_msgSend(v36, "unsignedLongLongValue");

    -[NSMutableArray removeLastObject](v88, "removeLastObject");
    v90 = v31;
    v38 = objc_msgSend(v10, "cachedFileDescriptorWithSnapshotPath:error:", v11, &v90);
    v39 = v90;

    if (v38 < 0)
    {
      v31 = v35;
      v73 = MBGetDefaultLog(v40, v41);
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        *(_DWORD *)v93 = 138412546;
        v94 = v75;
        v95 = 2112;
        v96 = v39;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "=scanning= Failed to fetch cached file descriptor for domain %@: %@", v93, 0x16u);

        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v65 = v39;
        _MBLog(CFSTR("ERROR"), "=scanning= Failed to fetch cached file descriptor for domain %@: %@", v76, v39);

      }
      else
      {
        v65 = v39;
      }
      goto LABEL_53;
    }
    v31 = v35;
    if (objc_msgSend(v35, "length"))
      v42 = (const char *)objc_msgSend(objc_retainAutorelease(v35), "fileSystemRepresentation");
    else
      v42 = ".";
    v43 = openat(v38, v42, 256, 0);
    if ((v43 & 0x80000000) != 0)
    {
      v48 = *__error();
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileScanner delegate](self, "delegate"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v10, v11, v31));
      v51 = objc_opt_respondsToSelector(v49, "fileScanner:failedToOpenFile:withErrno:");
      v82 = v48;
      v85 = v31;
      v81 = v49;
      if ((v51 & 1) != 0
        && (v51 = (uint64_t)objc_msgSend(v49, "fileScanner:failedToOpenFile:withErrno:", self, v50, v48), (_DWORD)v51))
      {
        v53 = v39;
        v54 = MBGetDefaultLog(v51, v52);
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "absolutePath"));
          *(_DWORD *)v93 = 138412802;
          v94 = v56;
          v95 = 2112;
          v96 = v85;
          v97 = 1024;
          LODWORD(v98) = v82;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "=scanning= Skipping file with openat failure %@ (%@): %{errno}d", v93, 0x1Cu);

          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "absolutePath"));
          _MBLog(CFSTR("INFO"), "=scanning= Skipping file with openat failure %@ (%@): %{errno}d", v57, v85, v82);

        }
        v58 = 6;
      }
      else
      {
        v67 = MBGetDefaultLog(v51, v52);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "absolutePath"));
          *(_DWORD *)v93 = 138412802;
          v94 = v69;
          v95 = 2112;
          v96 = v31;
          v97 = 1024;
          LODWORD(v98) = v82;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "=scanning= openat failed at %@ (%@): %{errno}d", v93, 0x1Cu);

          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "absolutePath"));
          _MBLog(CFSTR("ERROR"), "=scanning= openat failed at %@ (%@): %{errno}d", v70, v31, v82);

        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "absolutePath"));
        v72 = objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", v82, 101, v71, CFSTR("open error")));

        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "absolutePath"));
        sub_10000D140(v55);
        v58 = 7;
        v53 = (id)v72;
      }
      v66 = v89;

      v28 = v87;
      v65 = v53;
      v31 = v85;
      goto LABEL_42;
    }
    v45 = v43;
    if ((unint64_t)v37 > 0x61A8)
    {
      v59 = MBGetDefaultLog(v43, v44);
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        *(_DWORD *)v93 = 134218498;
        v94 = v37;
        v95 = 2114;
        v96 = v83;
        v97 = 2114;
        v98 = v31;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "=scanning= Found a direntcount of %llu under %{public}@ (%{public}@)", v93, 0x20u);

        v84 = v39;
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        _MBLog(CFSTR("INFO"), "=scanning= Found a direntcount of %llu under %{public}@ (%{public}@)", v37, v61, v31);

        v39 = v84;
      }

      v28 = v87;
      v47 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _performTwoPassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:directoryPathStack:directoryCountStack:stats:](self, "_performTwoPassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:directoryPathStack:directoryCountStack:stats:", v10, v11, v31, v86, v45, v87, v88, a6));
    }
    else
    {
      v46 = v37;
      v28 = v87;
      v47 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _performSinglePassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:direntCount:directoryPathStack:directoryCountStack:stats:](self, "_performSinglePassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:direntCount:directoryPathStack:directoryCountStack:stats:", v10, v11, v31, v86, v43, v46, v87, v88, a6));
    }
    v62 = (void *)v47;

    v63 = close(v45);
    if (v62)
      break;
    v65 = 0;
    v58 = 0;
    v66 = v89;
LABEL_42:

    objc_autoreleasePoolPop(v66);
    v31 = v65;
    if (v58 == 7)
      goto LABEL_55;
  }
  v77 = MBGetDefaultLog(v63, v64);
  v74 = objc_claimAutoreleasedReturnValue(v77);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v93 = 138412290;
    v94 = v62;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "=scanning= Error performing file enumeration: %@", v93, 0xCu);
    _MBLog(CFSTR("ERROR"), "=scanning= Error performing file enumeration: %@", v62);
  }
  v65 = v62;
LABEL_53:
  v33 = v89;

  v28 = v87;
LABEL_54:

  objc_autoreleasePoolPop(v33);
LABEL_55:
  v78 = v28;
  v18 = v65;

  v20 = v18;
  v19 = v80;
LABEL_56:

LABEL_57:
  v16 = v18;
LABEL_58:

LABEL_59:
  return v20;
}

- (id)_performSinglePassEnumerationForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 buffer:(id)a6 dirFd:(int)a7 direntCount:(unint64_t)a8 directoryPathStack:(id)a9 directoryCountStack:(id)a10 stats:(_MBFileScannerDomainStats *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  unint64_t v34;
  void *v35;
  id v36;
  unsigned __int16 *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v48;
  id v49;
  id v50;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  MBFileScanner *v58;
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  _MBFileScannerDomainStats *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v48 = a6;
  v50 = a9;
  v49 = a10;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_10007C374;
  v69 = sub_10007C384;
  v70 = 0;
  v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a8);
  v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a8);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10007C38C;
  v55[3] = &unk_1000DA148;
  v52 = v16;
  v56 = v52;
  v53 = v18;
  v57 = v53;
  v58 = self;
  v62 = &v65;
  v63 = &v71;
  v21 = v17;
  v59 = v21;
  v64 = a11;
  v54 = v20;
  v60 = v54;
  v22 = v19;
  v61 = v22;
  v23 = sub_10007E6BC(a7, v48, (uint64_t)v55);
  if ((unint64_t)v72[3] >> 4 >= 0x271)
  {
    v25 = MBGetDefaultLog(v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v72[3];
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "name"));
        *(_DWORD *)buf = 134218498;
        v76 = v28;
        v77 = 2114;
        v78 = v53;
        v79 = 2114;
        v80 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %llu items under %{public}@ (%{public}@), single pass", buf, 0x20u);

      }
      v30 = v72[3];
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found a total of %llu items under %{public}@ (%{public}@), single pass", v30, v53, v31);

    }
  }
  v32 = (void *)v66[5];
  if (!v32)
  {
    v33 = objc_msgSend(v22, "count");
    if (v33 != objc_msgSend(v54, "count"))
      __assert_rtn("-[MBFileScanner _performSinglePassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:direntCount:directoryPathStack:directoryCountStack:stats:]", "MBFileScanner.m", 947, "foundNodes.count == foundFileNames.count");
    v34 = 0;
    do
    {
      if (v34 >= (unint64_t)objc_msgSend(v22, "count"))
        break;
      v35 = objc_autoreleasePoolPush();
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v34)));
      v37 = (unsigned __int16 *)objc_msgSend(v36, "bytes");

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", v34));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByAppendingPathComponent:", v38));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v52, v21, v39));

      objc_msgSend(v40, "setNode:", v37);
      v41 = objc_claimAutoreleasedReturnValue(-[MBFileScanner _foundFile:snapshotPath:stats:](self, "_foundFile:snapshotPath:stats:", v40, v21, a11));
      v42 = (void *)v66[5];
      v66[5] = v41;

      v43 = v66[5];
      if (!v43 && objc_msgSend(v40, "isDirectory"))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "relativePath"));
        objc_msgSend(v50, "addObject:", v44);

        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v37[1]));
        objc_msgSend(v49, "addObject:", v45);

      }
      objc_autoreleasePoolPop(v35);
      ++v34;
    }
    while (!v43);
    v32 = (void *)v66[5];
  }
  v46 = v32;

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  return v46;
}

- (id)_performTwoPassEnumerationForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 buffer:(id)a6 dirFd:(int)a7 directoryPathStack:(id)a8 directoryCountStack:(id)a9 stats:(_MBFileScannerDomainStats *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  MBError *v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  MBFileScanner *v57;
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  _BYTE *v62;
  _MBFileScannerDomainStats *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  MBFileScanner *v67;
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  _MBFileScannerDomainStats *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t v82[4];
  uint64_t v83;
  __int16 v84;
  id v85;
  __int16 v86;
  void *v87;
  _BYTE buf[24];
  void *v89;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v52 = a8;
  v53 = a9;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = sub_10007C374;
  v76 = sub_10007C384;
  v77 = 0;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10007CC4C;
  v64[3] = &unk_1000DA170;
  v20 = v16;
  v65 = v20;
  v21 = v18;
  v66 = v21;
  v67 = self;
  v69 = &v72;
  v70 = &v78;
  v22 = v19;
  v23 = v17;
  v68 = v23;
  v71 = a10;
  v24 = sub_10007E6BC(a7, v19, (uint64_t)v64);
  if ((unint64_t)v79[3] >> 4 >= 0x271)
  {
    v26 = MBGetDefaultLog(v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v79[3];
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2114;
        v89 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %llu items under %{public}@ (%{public}@), first pass", buf, 0x20u);

        v22 = v19;
      }

      v31 = v22;
      v32 = v79[3];
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found a total of %llu items under %{public}@ (%{public}@), first pass", v32, v21, v33);

      v22 = v31;
    }

  }
  v34 = (void *)v73[5];
  if (v34)
  {
    v35 = v34;
LABEL_9:
    v36 = v35;
    goto LABEL_18;
  }
  if (lseek(a7, 0, 0) < 0)
  {
    v51 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v21, CFSTR("lseek error"));
    v35 = (id)objc_claimAutoreleasedReturnValue(v51);
    goto LABEL_9;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v89 = 0;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10007CF9C;
  v54[3] = &unk_1000DA148;
  v37 = v20;
  v55 = v37;
  v38 = v21;
  v56 = v38;
  v57 = self;
  v61 = &v72;
  v62 = buf;
  v58 = v23;
  v63 = a10;
  v59 = v52;
  v60 = v53;
  v39 = sub_10007E6BC(a7, v22, (uint64_t)v54);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) >> 4 >= 0x271uLL)
  {
    v41 = MBGetDefaultLog(v39, v40);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v22;
        v45 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
        *(_DWORD *)v82 = 134218498;
        v83 = v45;
        v84 = 2114;
        v85 = v38;
        v86 = 2114;
        v87 = v46;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %llu items under %{public}@ (%{public}@), second pass", v82, 0x20u);

        v22 = v44;
      }

      v47 = v22;
      v48 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found a total of %llu items under %{public}@ (%{public}@), second pass", v48, v38, v49);

      v22 = v47;
    }

  }
  v36 = (id)v73[5];

  _Block_object_dispose(buf, 8);
LABEL_18:

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

  return v36;
}

- (id)_foundFile:(id)a3 snapshotPath:(id)a4 stats:(_MBFileScannerDomainStats *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  unsigned int v22;
  MBError *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL8 v38;
  uint64_t v39;
  unsigned __int8 v40;
  MBError *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  MBError *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  char v74;
  id v75;
  uint64_t v76;
  unsigned __int8 v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  int v84;
  NSMutableDictionary *lastModifiedDateBySQLiteFileID;
  void *v86;
  void *v87;
  id v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  MBError *v105;
  void *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  NSMutableSet *modifiedDomains;
  void *v115;
  id v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  NSObject *v122;
  uint64_t v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSObject *v133;
  MBError *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  MBError *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  MBError *v148;
  uint64_t v149;
  MBError *v150;
  NSObject *v151;
  char v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  uint8_t v158[4];
  _BYTE v159[18];
  __int16 v160;
  int v161;
  uint8_t buf[32];
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  _BYTE v166[128];

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MBFileScanner _updateStats:file:](self, "_updateStats:file:", a5, v8);
  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
    -[MBFileScanner _detectModifiedDomain:relativePath:lastModified:](self, "_detectModifiedDomain:relativePath:lastModified:", v11, v12, objc_msgSend(v8, "lastModified"));

  }
  v13 = objc_msgSend(v8, "isRegularFile");
  if (!(_DWORD)v13)
  {
    v23 = 0;
    goto LABEL_70;
  }
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v14 = MBSQLiteJournalSuffixes(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
  if (!v16)
  {
    v23 = 0;
    goto LABEL_60;
  }
  v17 = v16;
  v146 = WeakRetained;
  v18 = *(_QWORD *)v155;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v155 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)i);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
      v22 = objc_msgSend(v21, "hasSuffix:", v20);

      if (v22)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringToIndex:", (_BYTE *)objc_msgSend(v25, "length") - (_BYTE *)objc_msgSend(v20, "length")));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rootPath"));
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingPathComponent:", v26));

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "volumeMountPoint"));
        v144 = (void *)v29;
        v32 = MBSnapshotPathFromLivePath(v29, v9, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithDomain:relativePath:](MBFileID, "fileIDWithDomain:relativePath:", v34, v26));

        if (objc_msgSend(v20, "hasSuffix:", CFSTR("-wal")))
          -[NSMutableDictionary removeObjectForKey:](self->_lastModifiedDateBySQLiteFileID, "removeObjectForKey:", v35);
        v145 = v35;
        v153 = 0;
        v36 = +[MBProtectionClassUtils getWithPath:error:](MBProtectionClassUtils, "getWithPath:error:", v33, &v153);
        v37 = v153;
        if ((_DWORD)v36 == 255)
        {
          v57 = +[MBError isError:withCode:](MBError, "isError:withCode:", v37, 4);
          if (!(_DWORD)v57)
          {
            v23 = v37;

            v56 = v23;
LABEL_43:
            WeakRetained = v146;
            goto LABEL_77;
          }
          v59 = MBGetDefaultLog(v57, v58);
          v60 = objc_claimAutoreleasedReturnValue(v59);
          v61 = v144;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", buf, 0xCu);
            _MBLog(CFSTR("INFO"), "=scanning= Potential SQLite database not found: %@", v33);
          }
          v62 = v37;
          v37 = 0;
        }
        else
        {
          if ((self->_policy & 8) == 0
            || (v38 = +[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", v36)))
          {
            v143 = v26;
            v152 = 0;
            v151 = v37;
            v40 = +[MBSQLiteFileHandle isSQLiteFileAtPath:result:error:](MBSQLiteFileHandle, "isSQLiteFileAtPath:result:error:", v33, &v152, &v151);
            v41 = v151;

            if ((v40 & 1) != 0)
            {
              if (v152)
              {
                if ((self->_policy & 0x40) == 0)
                {
LABEL_22:
                  v44 = MBGetDefaultLog(v42, v43);
                  v45 = objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v46;
                    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "=scanning= Not backing up SQLite file: %@", buf, 0xCu);

                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
                    _MBLog(CFSTR("INFO"), "=scanning= Not backing up SQLite file: %@", v47);

                  }
                  if (objc_msgSend(v20, "hasSuffix:", CFSTR("-wal")))
                  {
                    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastModifiedDate"));
                    objc_msgSend(v48, "timeIntervalSince1970");
                    v50 = v49;

                    v53 = MBGetDefaultLog(v51, v52);
                    v54 = objc_claimAutoreleasedReturnValue(v53);
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134218498;
                      *(_QWORD *)&buf[4] = (uint64_t)v50;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v33;
                      *(_WORD *)&buf[22] = 2112;
                      *(_QWORD *)&buf[24] = v145;
                      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "=scanning= Saving last modified date of SQLite file's WAL (%lu): %@ (%@)", buf, 0x20u);
                      _MBLog(CFSTR("INFO"), "=scanning= Saving last modified date of SQLite file's WAL (%lu): %@ (%@)", (uint64_t)v50, v33, v145);
                    }

                    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastModifiedDate"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastModifiedDateBySQLiteFileID, "setObject:forKeyedSubscript:", v55, v145);

                  }
                  v56 = 0;
                  goto LABEL_42;
                }
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
                v73 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v72, v9, v143));

                v165 = 0;
                v163 = 0u;
                v164 = 0u;
                memset(buf, 0, sizeof(buf));
                v150 = v41;
                v74 = sub_10007EC7C(v33, (uint64_t)buf, &v150);
                v23 = v150;

                v142 = v73;
                if ((v74 & 1) != 0)
                {
                  objc_msgSend(v73, "setNode:", buf);
                  v75 = objc_msgSend(v73, "isRegularFile");
                  if ((v75 & 1) != 0)
                  {
                    v148 = v23;
                    v149 = 0;
                    v77 = +[MBSQLiteFileHandle lastModifiedForSQLiteFileAtPath:time:error:](MBSQLiteFileHandle, "lastModifiedForSQLiteFileAtPath:time:error:", v33, &v149, &v148);
                    v41 = v148;

                    if ((v77 & 1) != 0)
                    {
                      objc_msgSend(v73, "setLastModified:", v149);
                      v78 = objc_msgSend(v146, "fileScanner:isFileAddedOrModified:", self, v73);
                      if (!(_DWORD)v78)
                      {

                        goto LABEL_22;
                      }
                      v80 = MBGetDefaultLog(v78, v79);
                      v81 = objc_claimAutoreleasedReturnValue(v80);
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                      {
                        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
                        *(_DWORD *)v158 = 138412290;
                        *(_QWORD *)v159 = v82;
                        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "=scanning= Backing up SQLite file: %@", v158, 0xCu);

                        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
                        _MBLog(CFSTR("INFO"), "=scanning= Backing up SQLite file: %@", v83);

                      }
                      v84 = 2;
                      v23 = v41;
                      WeakRetained = v146;
                    }
                    else
                    {
                      v135 = +[MBError isError:withCode:](MBError, "isError:withCode:", v41, 4);
                      if ((_DWORD)v135)
                      {
                        v137 = MBGetDefaultLog(v135, v136);
                        v138 = objc_claimAutoreleasedReturnValue(v137);
                        if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v158 = 138412290;
                          *(_QWORD *)v159 = v33;
                          _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", v158, 0xCu);
                          _MBLog(CFSTR("INFO"), "=scanning= Potential SQLite database not found: %@", v33);
                        }

                        v84 = 2;
                      }
                      else
                      {
                        v139 = v41;
                        v84 = 1;
                      }
                      v23 = v41;
                      WeakRetained = v146;
                    }
LABEL_96:

                    v56 = v23;
                    if (v84 == 2)
                      goto LABEL_61;
                    goto LABEL_77;
                  }
                  v123 = MBGetDefaultLog(v75, v76);
                  v120 = objc_claimAutoreleasedReturnValue(v123);
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                  {
                    v124 = objc_msgSend(v8, "mode");
                    *(_DWORD *)v158 = 67109378;
                    *(_DWORD *)v159 = v124;
                    *(_WORD *)&v159[4] = 2112;
                    *(_QWORD *)&v159[6] = v33;
                    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database is not a regular file (0%o): %@", v158, 0x12u);
                    _MBLog(CFSTR("INFO"), "=scanning= Potential SQLite database is not a regular file (0%o): %@", objc_msgSend(v8, "mode"), v33);
                  }
                  v84 = 2;
                  WeakRetained = v146;
LABEL_95:

                  goto LABEL_96;
                }
                v117 = +[MBError errnoForError:](MBError, "errnoForError:", v23);
                v118 = objc_claimAutoreleasedReturnValue(-[MBFileScanner delegate](self, "delegate"));
                v120 = v118;
                if ((_DWORD)v117 == 2)
                {
                  v121 = MBGetDefaultLog(v118, v119);
                  v122 = objc_claimAutoreleasedReturnValue(v121);
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v158 = 138412290;
                    *(_QWORD *)v159 = v33;
                    _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", v158, 0xCu);
                    _MBLog(CFSTR("INFO"), "=scanning= Potential SQLite database not found: %@", v33);
                  }

                }
                else
                {
                  v125 = objc_opt_respondsToSelector(v118, "fileScanner:failedToStatFile:withErrno:");
                  if ((v125 & 1) == 0
                    || (v125 = (uint64_t)-[NSObject fileScanner:failedToStatFile:withErrno:](v120, "fileScanner:failedToStatFile:withErrno:", self, v73, v117), !(_DWORD)v125))
                  {
                    v132 = MBGetDefaultLog(v125, v126);
                    v133 = objc_claimAutoreleasedReturnValue(v132);
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v158 = 138412546;
                      *(_QWORD *)v159 = v33;
                      *(_WORD *)&v159[8] = 2114;
                      *(_QWORD *)&v159[10] = v23;
                      _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "=scanning= MBNodeForPath() failed at %@: %{public}@", v158, 0x16u);
                      _MBLog(CFSTR("ERROR"), "=scanning= MBNodeForPath() failed at %@: %{public}@", v33, v23);
                    }

                    v134 = v23;
                    v84 = 1;
                    goto LABEL_94;
                  }
                  v127 = MBGetDefaultLog(v125, v126);
                  v128 = objc_claimAutoreleasedReturnValue(v127);
                  if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
                  {
                    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "absolutePath"));
                    v129 = objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "relativePath"));
                    *(_DWORD *)v158 = 138412802;
                    *(_QWORD *)v159 = v140;
                    *(_WORD *)&v159[8] = 2112;
                    *(_QWORD *)&v159[10] = v129;
                    v130 = (void *)v129;
                    v160 = 1024;
                    v161 = (int)v117;
                    _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "=scanning= Skipping SQLite file with lstat failure %@ (%@): %{errno}d", v158, 0x1Cu);

                    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "absolutePath"));
                    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "relativePath"));
                    _MBLog(CFSTR("INFO"), "=scanning= Skipping SQLite file with lstat failure %@ (%@): %{errno}d", v141, v131, v117);

                  }
                }
                v84 = 2;
LABEL_94:
                WeakRetained = v146;
                goto LABEL_95;
              }
              v71 = MBGetDefaultLog(v42, v43);
              v66 = objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v67 = v33;
                *(_QWORD *)&buf[4] = v33;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database isn't: %@", buf, 0xCu);
                v68 = "=scanning= Potential SQLite database isn't: %@";
                v26 = v143;
                goto LABEL_46;
              }
              v26 = v143;
            }
            else
            {
              v63 = +[MBError isError:withCode:](MBError, "isError:withCode:", v41, 4);
              if (!(_DWORD)v63)
              {
                v41 = v41;
                v56 = v41;
LABEL_42:

                v23 = v41;
                goto LABEL_43;
              }
              v65 = MBGetDefaultLog(v63, v64);
              v66 = objc_claimAutoreleasedReturnValue(v65);
              v26 = v143;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v67 = v33;
                *(_QWORD *)&buf[4] = v33;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", buf, 0xCu);
                v68 = "=scanning= Potential SQLite database not found: %@";
LABEL_46:
                v61 = v144;
                _MBLog(CFSTR("INFO"), v68, v67);
LABEL_58:

                goto LABEL_59;
              }
            }
            v61 = v144;
            goto LABEL_58;
          }
          v69 = MBGetDefaultLog(v38, v39);
          v62 = objc_claimAutoreleasedReturnValue(v69);
          if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v61 = v144;
            goto LABEL_48;
          }
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v70;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "=scanning= Backing up protected SQLite journal: %@", buf, 0xCu);

          v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
          _MBLog(CFSTR("INFO"), "=scanning= Backing up protected SQLite journal: %@", v60);
          v61 = v144;
        }

LABEL_48:
        v41 = (MBError *)v37;
LABEL_59:

        v23 = v41;
        WeakRetained = v146;
        goto LABEL_60;
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
    if (v17)
      continue;
    break;
  }
  v23 = 0;
  WeakRetained = v146;
LABEL_60:

LABEL_61:
  lastModifiedDateBySQLiteFileID = self->_lastModifiedDateBySQLiteFileID;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileID"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lastModifiedDateBySQLiteFileID, "objectForKeyedSubscript:", v86));

  if (v87)
  {
    v88 = objc_msgSend(v87, "timeIntervalSince1970");
    v90 = (uint64_t)v89;
    v92 = MBGetDefaultLog(v88, v91);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      v94 = objc_msgSend(v8, "lastModified");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v94;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v90;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v8;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "=scanning= Overriding last modified date of SQLite file (%lu) with WAL's (%lu): %@", buf, 0x20u);
      _MBLog(CFSTR("INFO"), "=scanning= Overriding last modified date of SQLite file (%lu) with WAL's (%lu): %@", objc_msgSend(v8, "lastModified"), v90, v8);
    }

    objc_msgSend(v8, "setLastModified:", v90);
  }
  v95 = +[MBFileSystemManager fileSystemCapacity](MBFileSystemManager, "fileSystemCapacity");
  v96 = objc_msgSend(v8, "size");
  if (v96 > v95)
  {
    v98 = MBGetDefaultLog(v96, v97);
    v99 = objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
    {
      v100 = objc_msgSend(v8, "size");
      v147 = WeakRetained;
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v95;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v101;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_FAULT, "=scanning= Found a file with unexpected size (%llu/%llu) at %{public}@", buf, 0x20u);

      v102 = objc_msgSend(v8, "size");
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
      _MBLog(CFSTR("FAULT"), "=scanning= Found a file with unexpected size (%llu/%llu) at %{public}@", v102, v95, v103);

      WeakRetained = v147;
    }

    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
    sub_10000F234(v104);

  }
LABEL_70:
  v105 = v23;
  v106 = objc_autoreleasePoolPush();
  v107 = ((uint64_t (*)(id, const char *, MBFileScanner *, id))self->_delegateImpOfFileScannerDidFindFile)(WeakRetained, "fileScanner:didFindFile:", self, v8);
  v23 = (MBError *)objc_claimAutoreleasedReturnValue(v107);

  objc_autoreleasePoolPop(v106);
  if (v23)
  {
    v108 = +[MBError isError:withCode:](MBError, "isError:withCode:", v23, 4);
    if ((_DWORD)v108)
    {
      v110 = MBGetDefaultLog(v108, v109);
      v111 = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v112;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "=scanning= Deleted while scanning: %@", buf, 0xCu);

        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absolutePath"));
        _MBLog(CFSTR("DEFAULT"), "=scanning= Deleted while scanning: %@", v113);

      }
      -[MBDebugContext setFlag:](self->_debugContext, "setFlag:", CFSTR("FileDeletedWhileScanning"));
      modifiedDomains = self->_modifiedDomains;
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      -[NSMutableSet addObject:](modifiedDomains, "addObject:", v115);

      goto LABEL_75;
    }
    v23 = v23;
    v56 = v23;
  }
  else
  {
LABEL_75:
    v56 = 0;
  }
LABEL_77:

  return v56;
}

- (void)_detectModifiedDomain:(id)a3 relativePath:(id)a4 lastModified:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int64_t startTime;
  uint64_t v27;
  NSObject *v28;
  int64_t v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;

  v8 = a3;
  v9 = a4;
  if (self->_startTime <= a5 && (uint64_t)-[MBDebugContext time](self->_debugContext, "time") >= a5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePathsNotToCheckIfModifiedDuringBackup"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v30 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathComponents"));
      v13 = objc_msgSend(v12, "count");
      v14 = 0;
      while (1)
      {
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", 0, v14));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePathsNotToCheckIfModifiedDuringBackup"));
        v19 = objc_msgSend(v18, "containsObject:", v17);

        if (v19)
          break;

        objc_autoreleasePoolPop(v15);
        if (++v14 > (unint64_t)v13)
        {
          v24 = MBGetDefaultLog(v22, v23);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          v9 = v30;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            startTime = self->_startTime;
            *(_DWORD *)buf = 138412802;
            v32 = v30;
            v33 = 2048;
            v34 = startTime;
            v35 = 2048;
            v36 = a5;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=scanning= Modified while scanning: %@ (startTime:%ld, lastModified:%ld)", buf, 0x20u);
            _MBLog(CFSTR("DEFAULT"), "=scanning= Modified while scanning: %@ (startTime:%ld, lastModified:%ld)", v30, self->_startTime, a5);
          }

          -[MBDebugContext setFlag:](self->_debugContext, "setFlag:", CFSTR("FileModifiedWhileScanning"));
          -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v8);
          goto LABEL_13;
        }
      }
      v27 = MBGetDefaultLog(v20, v21);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      v9 = v30;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->_startTime;
        *(_DWORD *)buf = 138412802;
        v32 = v30;
        v33 = 2048;
        v34 = v29;
        v35 = 2048;
        v36 = a5;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=scanning= Ignoring path modified while scanning: %@ (startTime:%ld, lastModified:%ld)", buf, 0x20u);
        _MBLog(CFSTR("DEFAULT"), "=scanning= Ignoring path modified while scanning: %@ (startTime:%ld, lastModified:%ld)", v30, self->_startTime, a5);
      }

      objc_autoreleasePoolPop(v15);
LABEL_13:

    }
  }

}

- (MBFileScannerDelegate)delegate
{
  return (MBFileScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastModifiedDateBySQLiteFileID, 0);
  objc_storeStrong((id *)&self->_modifiedDomains, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
}

@end
