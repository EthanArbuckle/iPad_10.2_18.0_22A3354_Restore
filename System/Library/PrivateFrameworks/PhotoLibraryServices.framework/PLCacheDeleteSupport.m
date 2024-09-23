@implementation PLCacheDeleteSupport

- (PLCacheDeleteSupport)initWithLibraryServicesManager:(id)a3 cplStatus:(id)a4
{
  id v7;
  id v8;
  PLCacheDeleteSupport *v9;
  PLCacheDeleteSupport *v10;
  PLLibraryServicesManager *lsm;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *exitDeleteTime;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  PLCacheDeleteSupport *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PLCacheDeleteSupport;
  v9 = -[PLCacheDeleteSupport init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lsm, a3);
    lsm = v10->_lsm;
    if (!lsm)
    {
      PLResourceCachingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "libraryServicesManager passed to PLCacheDeleteSupport is nil", buf, 2u);
      }

      lsm = v10->_lsm;
    }
    -[PLLibraryServicesManager pathManager](lsm, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "libraryURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10->_fsid = (fsid)objc_msgSend((id)objc_opt_class(), "fsidForURL:", v14);
    objc_msgSend(v8, "exitDeleteTime");
    v15 = objc_claimAutoreleasedReturnValue();
    exitDeleteTime = v10->_exitDeleteTime;
    v10->_exitDeleteTime = (NSDate *)v15;

    objc_msgSend(v7, "cacheDeleteRegistration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerCacheDeleteSupport:withLibraryServicesManager:", v10, v7);

  }
  PLPhotosObjectLifecycleGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v23 = v19;
    v24 = 2048;
    v25 = v10;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryServicesManager:%@", buf, 0x20u);
  }

  return v10;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  PLCacheDeleteSupport *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate", (uint8_t *)&v5, 0x16u);
  }

  -[PLLibraryServicesManager cacheDeleteRegistration](self->_lsm, "cacheDeleteRegistration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterCacheDeleteSupport:withLibraryServicesManager:", self, self->_lsm);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLCacheDeleteSupport *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLCacheDeleteSupport;
  -[PLCacheDeleteSupport dealloc](&v4, sel_dealloc);
}

- (id)_newShortLivedPhotoLibrary
{
  void *v2;
  void *v3;

  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCacheDeleteSupport _newShortLivedPhotoLibrary]");

  return v3;
}

- (BOOL)markResourceAsPurgeable:(id)a3 withUrgency:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSDate *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  NSDate *exitDeleteTime;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  NSDate *v30;
  __int16 v31;
  NSDate *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCentralizedCacheDeleteCapable");

  if (v9)
  {
    -[PLLibraryServicesManager cplSettings](self->_lsm, "cplSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isKeepOriginalsEnabled");

    if (v11
      && (+[PLInternalResource originalCPLResourceTypes](PLInternalResource, "originalCPLResourceTypes"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "cplType")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v12, "containsObject:", v13),
          v13,
          v12,
          v14))
    {
      PLResourceCachingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "singleLineDescription");
        v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        v17 = "Download & Keep Originals mode, skip marking original resource %@ as purgeable";
        v18 = v15;
        v19 = 12;
LABEL_10:
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);

      }
    }
    else
    {
      if (!self->_exitDeleteTime)
      {
        objc_msgSend(v6, "fileURL");
        v15 = objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v27 = 0;
        v20 = objc_msgSend((id)objc_opt_class(), "markPurgeableForFileAtURL:withUrgency:outInode:error:", v15, a4, &v28, &v27);
        v22 = v27;
        if (v20)
        {
          if (v28)
          {
            v23 = objc_msgSend(v6, "fileID");
            if (v23 != v28)
              objc_msgSend(v6, "setFileID:");
          }
          else
          {
            PLResourceCachingGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = (NSDate *)v15;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Unexpected inode value of 0 for %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected inode value of 0 for %@"), v15);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            PLSimulateCrash();

          }
        }
        else if (PLIsErrorEqualToCode())
        {
          objc_msgSend(v6, "markAsNotLocallyAvailable");
        }

        goto LABEL_22;
      }
      PLResourceCachingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        exitDeleteTime = self->_exitDeleteTime;
        objc_msgSend(v6, "singleLineDescription");
        v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = exitDeleteTime;
        v31 = 2112;
        v32 = v16;
        v17 = "In exit mode (%@), skip marking resource %@ as purgeable";
        v18 = v15;
        v19 = 22;
        goto LABEL_10;
      }
    }
    LOBYTE(v20) = 0;
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v20) = 0;
LABEL_23:

  return v20;
}

- (BOOL)clearPurgeableFlagsForAllResources
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  PLLibraryServicesManager *lsm;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  PLLibraryServicesManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 != 0;
  if (v4)
  {
    if (!objc_msgSend((id)objc_opt_class(), "clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:", v4))
    {
      v5 = 0;
      goto LABEL_10;
    }
    PLResourceCachingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Resetting fileID for all resources", buf, 2u);
    }

    v7 = -[PLCacheDeleteSupport _newShortLivedPhotoLibrary](self, "_newShortLivedPhotoLibrary");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PLCacheDeleteSupport_clearPurgeableFlagsForAllResources__block_invoke;
    v11[3] = &unk_1E3677AA0;
    v12 = v7;
    v8 = v7;
    -[NSObject performTransactionAndWait:](v8, "performTransactionAndWait:", v11);

  }
  else
  {
    PLResourceCachingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      lsm = self->_lsm;
      *(_DWORD *)buf = 138412290;
      v14 = lsm;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "No photoLibraryURL from library services manager %@", buf, 0xCu);
    }
  }

LABEL_10:
  return v5;
}

- (id)purgeableDirectories
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_purgeableResourceDirectoriesForPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)rescanResourcesFromFileSystem
{
  id v3;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[PLCacheDeleteSupport _newShortLivedPhotoLibrary](self, "_newShortLivedPhotoLibrary");
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__79592;
  v23 = __Block_byref_object_dispose__79593;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PLCacheDeleteSupport_rescanResourcesFromFileSystem__block_invoke;
  v11[3] = &unk_1E3676348;
  v13 = &v15;
  v11[4] = self;
  v4 = v3;
  v12 = v4;
  v14 = &v19;
  objc_msgSend(v4, "performTransactionAndWait:", v11);
  if (*((_BYTE *)v16 + 24))
  {
    PLResourceCachingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Successfully updated resource local availability";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_199541000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    PLResourceCachingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = v20[5];
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      v6 = "Failed to update resource local availability: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
      goto LABEL_6;
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

- (BOOL)isFilePurgedForFileID:(id)a3 purgedPath:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "longLongValue") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid fileID %@ for purgedPath %@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLSimulateCrash();

    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend(v5, "unsignedLongLongValue");
    v7 = openbyid_np();
    LODWORD(v8) = v7 >> 31;
    if ((v7 & 0x80000000) == 0)
    {
      v9 = v7;
      PLResourceCachingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Received purging notification for fileID %@ purgedPath %@ that still exists", buf, 0x16u);
      }

      close(v9);
    }
  }

  return (char)v8;
}

- (void)markAsNotLocallyAvailableForResourcesWithFileIDsToPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  PLCacheDeleteSupport *v12;
  id v13;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v4 = -[PLCacheDeleteSupport _newShortLivedPhotoLibrary](self, "_newShortLivedPhotoLibrary");
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke;
    v10[3] = &unk_1E3677530;
    v11 = v7;
    v12 = self;
    v13 = v4;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke_51;
    v8[3] = &unk_1E3677AA0;
    v9 = v13;
    v6 = v13;
    objc_msgSend(v6, "performTransactionAndWait:completionHandler:", v10, v8);

  }
}

- (void)_markAsNotLocallyAvailableForResourcesWithFileIDsToPath:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v40 = v5;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("fileID"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v6, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v10, &v45);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v45;
  if (!v13)
  {
    PLResourceCachingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_DWORD *)buf = 138412546;
    v47 = (uint64_t)v7;
    v48 = 2112;
    v49 = v14;
    v30 = "Failed to fetch resources with fileIDs %@: %@";
    v31 = v15;
    v32 = OS_LOG_TYPE_ERROR;
    v33 = 22;
LABEL_22:
    _os_log_impl(&dword_199541000, v31, v32, v30, buf, v33);
    goto LABEL_23;
  }
  if (!objc_msgSend(v13, "count"))
  {
    PLResourceCachingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    *(_DWORD *)buf = 138412290;
    v47 = (uint64_t)v7;
    v30 = "Do not find any resources matching fileIDs: %@";
    v31 = v15;
    v32 = OS_LOG_TYPE_INFO;
    v33 = 12;
    goto LABEL_22;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = v13;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v16)
  {
    v17 = v16;
    v34 = v13;
    v35 = v12;
    v36 = v11;
    v37 = v10;
    v38 = v7;
    v39 = v6;
    v18 = *(_QWORD *)v42;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v20, "cplFileURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v20, "fileID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "length") && objc_msgSend(v25, "containsString:", v22))
        {
          PLResourceCachingGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            goto LABEL_15;
          *(_DWORD *)buf = 134218242;
          v47 = v23;
          v48 = 2112;
          v49 = v25;
          v27 = v26;
          v28 = OS_LOG_TYPE_INFO;
          v29 = "Marked resource as not locally available for fileID %lld path %@";
        }
        else
        {
          PLResourceCachingGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            goto LABEL_15;
          *(_DWORD *)buf = 138412546;
          v47 = (uint64_t)v22;
          v48 = 2112;
          v49 = v25;
          v27 = v26;
          v28 = OS_LOG_TYPE_ERROR;
          v29 = "Mismatch between resource file path %@ and purged path %@";
        }
        _os_log_impl(&dword_199541000, v27, v28, v29, buf, 0x16u);
LABEL_15:

        objc_msgSend(v20, "markAsNotLocallyAvailableAfterPurge");
      }
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (!v17)
      {
        v7 = v38;
        v6 = v39;
        v11 = v36;
        v10 = v37;
        v13 = v34;
        v12 = v35;
        break;
      }
    }
  }
LABEL_23:

}

- (NSDate)exitDeleteTime
{
  return self->_exitDeleteTime;
}

- (void)setExitDeleteTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitDeleteTime, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

uint64_t __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "libraryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "Marking %ld resources as not locally available for libraryURL: %@", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_markAsNotLocallyAvailableForResourcesWithFileIDsToPath:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke_51(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "libraryBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "touch");

}

void __53__PLCacheDeleteSupport_rescanResourcesFromFileSystem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:countPresent:countMissing:countUnableToVerify:error:", v3, 0, 0, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v2;

}

void __58__PLCacheDeleteSupport_clearPurgeableFlagsForAllResources__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL4 v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v2 = +[PLInternalResource batchResetFileIDInManagedObjectContext:error:](PLInternalResource, "batchResetFileIDInManagedObjectContext:error:", v1, &v10);
  v3 = v10;

  PLResourceCachingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Successfully reset internal resource fileIDs";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_199541000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    v6 = "Failed to reset internal resource fileID: %@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
    goto LABEL_6;
  }

}

+ (BOOL)markPurgeableForFileAtURL:(id)a3 withUrgency:(int64_t)a4 outInode:(unint64_t *)a5
{
  return objc_msgSend(a1, "markPurgeableForFileAtURL:withUrgency:outInode:error:", a3, a4, a5, 0);
}

+ (BOOL)markPurgeableForFileAtURL:(id)a3 withUrgency:(int64_t)a4 outInode:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  BOOL v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  char *v40;
  __darwin_ino64_t st_ino;
  NSObject *v42;
  id *v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  _BYTE v50[20];
  __int16 v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  stat v57;
  uint64_t v58;
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (!v9)
  {
    PLResourceCachingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v57.st_dev = 138412290;
      *(_QWORD *)&v57.st_mode = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Missing fileURL to mark purgeable for %@", (uint8_t *)&v57, 0xCu);
    }

    goto LABEL_21;
  }
  v11 = objc_retainAutorelease(v9);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  if (v12 < 0)
  {
    v16 = *__error();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2FE0];
    v58 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v16, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    PLResourceCachingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v57.st_dev = 138412802;
      *(_QWORD *)&v57.st_mode = v11;
      WORD2(v57.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v57.st_ino + 6) = (__darwin_ino64_t)strerror(v16);
      HIWORD(v57.st_gid) = 1024;
      v57.st_rdev = v16;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Missing file to mark purgeable for %@ (%{public}s [%d])", (uint8_t *)&v57, 0x1Cu);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v21);

    goto LABEL_21;
  }
  v13 = v12;
  memset(&v57, 0, sizeof(v57));
  if (fstat(v12, &v57) == -1)
  {
    v23 = *__error();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2FE0];
    v55 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v23));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v23, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    PLResourceCachingGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v11;
      v49 = 2082;
      *(_QWORD *)v50 = strerror(v23);
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)&v50[10] = v23;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Failed to get inode from %@ (%{public}s [%d]), skip marking it as purgeable", buf, 0x1Cu);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v28);
    close(v13);

LABEL_21:
    v30 = 0;
    goto LABEL_36;
  }
  v46 = 65537;
  switch(a4)
  {
    case 2:
      v14 = 67585;
      goto LABEL_24;
    case 1:
      v14 = 66561;
      goto LABEL_24;
    case 0:
      v14 = 66049;
LABEL_24:
      v46 = v14;
      break;
  }
  v45 = v11;
  v31 = ffsctl(v13, 0xC0084A44uLL, &v46, 0);
  v30 = v31 == 0;
  if (v31)
  {
    v32 = v31;
    v44 = a6;
    v33 = *__error();
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2FE0];
    v53 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v33));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, v33, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    PLResourceCachingGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = strerror(v33);
      *(_DWORD *)buf = 138413314;
      v48 = v45;
      v49 = 1024;
      *(_DWORD *)v50 = v32;
      *(_WORD *)&v50[4] = 2082;
      *(_QWORD *)&v50[6] = v40;
      *(_WORD *)&v50[14] = 1024;
      *(_DWORD *)&v50[16] = v33;
      v51 = 2048;
      v52 = v46;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Failed to mark %@ as purgeable %d (%{public}s [%d]) (flags 0x%llx)", buf, 0x2Cu);
    }

    if (v44)
      *v44 = objc_retainAutorelease(v38);

  }
  else
  {
    st_ino = v57.st_ino;
    PLResourceCachingGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v45;
      v49 = 2048;
      *(_QWORD *)v50 = st_ino;
      *(_WORD *)&v50[8] = 2048;
      *(_QWORD *)&v50[10] = v46;
      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_INFO, "Marked %@ as purgeable with fileID %lld flags 0x%llx", buf, 0x20u);
    }

    if (a5)
      *a5 = st_ino;
  }
  close(v13);
LABEL_36:

  return v30;
}

+ (BOOL)clearPurgeableFlagForResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  __darwin_ino64_t st_ino;
  NSObject *v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  int *v18;
  char *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int *v23;
  char *v24;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  __darwin_ino64_t v30;
  __int16 v31;
  _QWORD v32[3];
  stat v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCentralizedCacheDeleteCapable");

  if (v6)
  {
    objc_msgSend(v3, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_retainAutorelease(v7);
      v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0);
      if (v10 < 0)
      {
        PLResourceCachingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v33.st_dev = 138412546;
          *(_QWORD *)&v33.st_mode = v9;
          WORD2(v33.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v33.st_ino + 6) = (__darwin_ino64_t)v3;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Missing file %@ to clear purgeable flag for %@, marking as not locally available", (uint8_t *)&v33, 0x16u);
        }

        objc_msgSend(v3, "markAsNotLocallyAvailable");
      }
      else
      {
        v11 = v10;
        memset(&v33, 0, sizeof(v33));
        if (fstat(v10, &v33) != -1)
        {
          st_ino = v33.st_ino;
          if (objc_msgSend(v3, "fileID") != st_ino)
          {
            PLResourceCachingGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218498;
              v28 = objc_msgSend(v3, "fileID");
              v29 = 2048;
              v30 = st_ino;
              v31 = 2112;
              v32[0] = v9;
              _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Mismatch fileID between model %lld and file system %lld for file %@", buf, 0x20u);
            }

          }
          v26 = 0;
          v14 = ffsctl(v11, 0xC0084A44uLL, &v26, 0);
          v15 = v14 == 0;
          PLResourceCachingGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v18 = __error();
              v19 = strerror(*v18);
              *(_DWORD *)buf = 138413058;
              v28 = (uint64_t)v9;
              v29 = 2048;
              v30 = st_ino;
              v31 = 1024;
              LODWORD(v32[0]) = v14;
              WORD2(v32[0]) = 2080;
              *(_QWORD *)((char *)v32 + 6) = v19;
              _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to clear purgeable flag for %@ (%lld): %d (%s", buf, 0x26u);
            }

          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v28 = (uint64_t)v9;
              v29 = 2048;
              v30 = st_ino;
              _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Cleared purgeable flag for %@ (%lld)", buf, 0x16u);
            }

            objc_msgSend(v3, "setFileID:", -1);
          }
          close(v11);
          goto LABEL_28;
        }
        PLResourceCachingGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 138412546;
          v28 = (uint64_t)v9;
          v29 = 2080;
          v30 = (__darwin_ino64_t)v24;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to get inode from %@ (%s), skip marking it as purgeable", buf, 0x16u);
        }

        close(v11);
      }
    }
    else
    {
      PLResourceCachingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v33.st_dev = 138412290;
        *(_QWORD *)&v33.st_mode = v3;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Missing fileURL to clear purgeable flag for %@", (uint8_t *)&v33, 0xCu);
      }

    }
    v15 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v15 = 0;
LABEL_29:

  return v15;
}

+ (BOOL)clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  int *v19;
  char *v20;
  void *v21;
  int *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[4];
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  char *v35;
  _BYTE v36[128];
  __int128 buf;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLResourceCachingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Clearing purgeable flags for all resources in %@.", (uint8_t *)&buf, 0xCu);
  }

  v25 = v3;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", v3);
  objc_msgSend((id)objc_opt_class(), "_clearablePurgeableResourceDirectoriesForPathManager:", v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = 0;
  buf = 0x100000002uLL;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v9 = 1;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i));
        v12 = fsctl((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0xC0204A49uLL, &buf, 0);
        if (!(_DWORD)v12)
        {
          PLResourceCachingGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_18;
          *(_DWORD *)v30 = 138412290;
          v31 = v11;
          v17 = v16;
          v18 = "Cleared purgeable flags under %@";
          goto LABEL_14;
        }
        v13 = v12;
        v14 = *__error();
        PLResourceCachingGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14 == 2)
        {
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            goto LABEL_18;
          *(_DWORD *)v30 = 138412290;
          v31 = v11;
          v17 = v16;
          v18 = "%@ does not exist, skip clearing the purgeable flags";
LABEL_14:
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, v18, v30, 0xCu);
          goto LABEL_18;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v19 = __error();
          v20 = strerror(*v19);
          *(_DWORD *)v30 = 138412802;
          v31 = v11;
          v32 = 1024;
          v33 = v13;
          v34 = 2080;
          v35 = v20;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to clear purgeable flag for %@ %d (%s)", v30, 0x1Cu);
        }

        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = __error();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Failed to clear purgeable flag for %@ %d (%s)"), v11, v13, strerror(*v22));
        v16 = objc_claimAutoreleasedReturnValue();
        PLSimulateCrash();
        v9 = 0;
LABEL_18:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (!v7)
        goto LABEL_22;
    }
  }
  v9 = 1;
LABEL_22:

  return v9 & 1;
}

+ (BOOL)isPurgeableFile:(id)a3 outIsPhotoType:(BOOL *)a4 outUrgencyLevel:(int64_t *)a5 error:(id *)a6
{
  id v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  BOOL v20;
  __int16 v21;
  int64_t v22;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v9 = objc_retainAutorelease(a3);
  v10 = fsctl((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0x40084A47uLL, &v24, 0);
  if (v10)
  {
    v11 = v10;
    v12 = *__error();
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v31 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLResourceCachingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = strerror(v12);
      *(_DWORD *)buf = 138412802;
      v26 = v9;
      v27 = 1024;
      v28 = v11;
      v29 = 2080;
      v30 = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unable to check purgeable flag for %@ %d (%s)", buf, 0x1Cu);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v17);

  }
  else
  {
    v21 = v24;
    if (v24)
    {
      if (a4)
        *a4 = v24 & 1;
      if (a5)
      {
        if ((v21 & 0x200) != 0)
        {
          *a5 = 0;
        }
        else
        {
          if ((v21 & 0x400) != 0)
          {
            v20 = 1;
            *a5 = 1;
            goto LABEL_21;
          }
          if ((v21 & 0x800) != 0)
            v22 = 2;
          else
            v22 = -1;
          *a5 = v22;
        }
      }
      v20 = 1;
      goto LABEL_21;
    }
  }
  v20 = 0;
LABEL_21:

  return v20;
}

+ (id)purgeableStateDescriptionForFile:(id)a3
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v8;
  char v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v9 = 0;
    v8 = -1;
    if (!+[PLCacheDeleteSupport isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:](PLCacheDeleteSupport, "isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:", v3, &v9, &v8, 0))goto LABEL_7;
    if (!v9)
    {
      v6 = CFSTR("[N]");
      goto LABEL_9;
    }
    if ((unint64_t)(v8 + 1) <= 3)
      v6 = off_1E36720B8[v8 + 1];
    else
LABEL_7:
      v6 = &stru_1E36789C0;
  }
  else
  {
    v6 = CFSTR("[E]");
  }
LABEL_9:

  return (id)v6;
}

+ (id)_clearablePurgeableResourceDirectoriesForPathManager:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "photoDirectoryWithType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(v4, "photoDirectoryWithType:", 29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(v4, "photoDirectoryWithType:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(v4, "photoDirectoryWithType:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithArray:", v10);

  if (objc_msgSend(v4, "isDCIM"))
    objc_msgSend(v4, "privateDirectoryWithSubType:", 7);
  else
    objc_msgSend(v4, "photoDirectoryWithType:", 25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObject:", v12);
  return v11;
}

+ (id)_unclearablePurgeableResourceDirectoriesForPathManager:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "photoDirectoryWithType:", 26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(v3, "photoDirectoryWithType:", 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithArray:", v7);

  if (objc_msgSend(v3, "isDCIM"))
  {
    objc_msgSend(v3, "photoDirectoryWithType:", 30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  return v8;
}

+ (id)_purgeableResourceDirectoriesForPathManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_clearablePurgeableResourceDirectoriesForPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_unclearablePurgeableResourceDirectoriesForPathManager:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (fsid)fsidForURL:(id)a3
{
  const char *v3;
  NSObject *v4;
  stat v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(&v6, 0, sizeof(v6));
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (stat(v3, &v6))
  {
    PLResourceCachingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v8 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "could not get device ID for %s", buf, 0xCu);
    }

    return (fsid)0;
  }
  else
  {
    return (fsid)v6.st_dev;
  }
}

+ (BOOL)verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:(id)a3 countPresent:(int64_t *)a4 countMissing:(int64_t *)a5 countUnableToVerify:(int64_t *)a6 error:(id *)a7
{
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  char *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  void *v58;
  _QWORD v59[4];
  fsid v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  id obj;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  _BYTE v92[128];
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 1;
  +[PLInternalResource fetchRequest](PLInternalResource, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lld AND %K >= %d"), CFSTR("fileID"), -1, CFSTR("localAvailability"), 1);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setFetchBatchSize:", 100);
  v93[0] = CFSTR("fileID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v12);
  v40 = (void *)v11;
  v43 = v10;

  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__79592;
  v78 = __Block_byref_object_dispose__79593;
  v79 = 0;
  obj = 0;
  objc_msgSend(v45, "executeFetchRequest:error:", v10, &obj);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v79, obj);
  if (v44)
  {
    PLResourceCachingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v44, "count");
      *(_DWORD *)buf = 134217984;
      v85 = (const char *)v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Verifying localAvailability for %ld resources presumed to be local...", buf, 0xCu);
    }

    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    v15 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    objc_msgSend(v45, "pathManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "libraryURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2810000000;
    v59[3] = &unk_199CADF31;
    v60 = 0;
    v60 = +[PLCacheDeleteSupport fsidForURL:](PLCacheDeleteSupport, "fsidForURL:", v39);
    v17 = malloc_type_calloc(1uLL, 0x400uLL, 0x13E05E6AuLL);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __158__PLCacheDeleteSupport_verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext_countPresent_countMissing_countUnableToVerify_error___block_invoke;
    v50[3] = &unk_1E3672070;
    v52 = v59;
    v53 = &v69;
    v58 = v17;
    v54 = &v61;
    v41 = v15;
    v51 = v41;
    v55 = &v80;
    v56 = &v74;
    v57 = &v65;
    objc_msgSend(v45, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v44, 0, v50);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v75[5];
    v75[5] = v18;

    free(v17);
    if (a4)
      *a4 = v66[3];
    if (a5)
      *a5 = v70[3];
    if (a6)
      *a6 = v62[3];
    if (objc_msgSend(v41, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v21 = v41;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v92, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v47 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            v26 = strerror(objc_msgSend(v25, "intValue"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "countForObject:", v25));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendFormat:", CFSTR("[error: %@/%s, count: %@] "), v25, v26, v27);

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v92, 16);
        }
        while (v22);
      }

      PLResourceCachingGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:c"
              "ountPresent:countMissing:countUnableToVerify:error:]";
        v86 = 2114;
        v87 = v20;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "%s: Encountered errors while verifying local availbility: %{public}@", buf, 0x16u);
      }

    }
    if (v75[5])
    {
      *((_BYTE *)v81 + 24) = 0;
      PLResourceCachingGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)v75[5];
        *(_DWORD *)buf = 136315394;
        v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:c"
              "ountPresent:countMissing:countUnableToVerify:error:]";
        v86 = 2112;
        v87 = v30;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%s: Error updating resource local availability: %@", buf, 0x16u);
      }

    }
    PLResourceCachingGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)v70[3];
      v33 = v66[3];
      v34 = v62[3];
      *(_DWORD *)buf = 136315906;
      v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]";
      v86 = 2048;
      v87 = v32;
      v88 = 2048;
      v89 = v33;
      v90 = 2048;
      v91 = v34;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "%s: Count missing: %ld, Count present: %ld, Count unable to verify: %ld", buf, 0x2Au);
    }

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v69, 8);
  }
  else
  {
    *((_BYTE *)v81 + 24) = 0;
    PLResourceCachingGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)v75[5];
      *(_DWORD *)buf = 136315394;
      v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]";
      v86 = 2112;
      v87 = v36;
      _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "%s: Error fetching resources: %@", buf, 0x16u);
    }

  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v75[5]);
  v37 = *((_BYTE *)v81 + 24) != 0;

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

  return v37;
}

+ (BOOL)setClearPurgeableIsCloneStateOnPurgeableResourcesOnceWithPathManager:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0D73158];
  objc_msgSend(a3, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appPrivateDataForLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v7, "setValue:forKey:error:", MEMORY[0x1E0C9AAB0], CFSTR("CacheDeleteSupport.clearPurgeableIsCloneStateOnPurgeableResourcesOnce"), a4);
  return (char)a4;
}

+ (void)clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext:(id)a3 pathManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  uint64_t v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t v34[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D73158];
  objc_msgSend(v6, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appPrivateDataForLibraryURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKey:", CFSTR("CacheDeleteSupport.clearPurgeableIsCloneStateOnPurgeableResourcesOnce"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (!v11)
    goto LABEL_15;
  PLResourceCachingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Calling APFSIOC_GET_CLONE_INFO on all purgeable resources to clear is-clone flag", buf, 2u);
  }

  v13 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lld"), CFSTR("fileID"), -1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);

  v33 = 0;
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x2020000000;
  v32 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __120__PLCacheDeleteSupport_clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext_pathManager___block_invoke;
  v28[3] = &unk_1E3672098;
  v28[4] = buf;
  objc_msgSend(v5, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v15, &v33, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    PLResourceCachingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = v17;
      v19 = "Failed to fetch purgeable resources for APFSIOC_GET_CLONE_INFO: %@";
      v20 = v18;
      v21 = OS_LOG_TYPE_ERROR;
      v22 = 12;
LABEL_9:
      _os_log_impl(&dword_199541000, v20, v21, v19, v34, v22);
    }
  }
  else
  {
    PLResourceCachingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *((_QWORD *)v30 + 3);
      *(_DWORD *)v34 = 134218240;
      v35 = v33;
      v36 = 2048;
      v37 = v23;
      v19 = "Called APFSIOC_GET_CLONE_INFO on %lu purgeable resources (%lu failed)";
      v20 = v18;
      v21 = OS_LOG_TYPE_DEFAULT;
      v22 = 22;
      goto LABEL_9;
    }
  }

  v27 = 0;
  v24 = objc_msgSend(v9, "setValue:forKey:error:", 0, CFSTR("CacheDeleteSupport.clearPurgeableIsCloneStateOnPurgeableResourcesOnce"), &v27);
  v25 = v27;
  if ((v24 & 1) == 0)
  {
    PLResourceCachingGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = v25;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Failed to unset PLCacheDeleteSupportClearPurgeableIsCloneStateOnPurgeableResourcesOnceKey: %@", v34, 0xCu);
    }

  }
  _Block_object_dispose(buf, 8);

LABEL_15:
}

void __120__PLCacheDeleteSupport_clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext_pathManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  NSObject *v5;
  int *v6;
  char *v7;
  _QWORD v8[2];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fileURL");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (v4)
  {
    v8[0] = 0;
    v8[1] = 0;
    if (fsctl(v4, 0x40104A0EuLL, v8, 0) == -1)
    {
      PLResourceCachingGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = __error();
        v7 = strerror(*v6);
        *(_DWORD *)buf = 136315394;
        v10 = v4;
        v11 = 2080;
        v12 = v7;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to get APFSIOC_GET_CLONE_INFO on resource at path %s: %s", buf, 0x16u);
      }

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
}

void __158__PLCacheDeleteSupport_verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext_countPresent_countMissing_countUnableToVerify_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "fileID");
  if (fsgetpath(*(char **)(a1 + 88), 0x400uLL, (fsid_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v4) != -1)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    goto LABEL_17;
  }
  if (*__error() == 2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (v6 > 49)
    {
LABEL_16:
      *(_QWORD *)(v5 + 24) = v6 + 1;
      objc_msgSend(v3, "markAsNotLocallyAvailable");
      goto LABEL_17;
    }
    objc_msgSend(v3, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PLResourceCachingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        objc_msgSend(v3, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "fileID");
        objc_msgSend(v3, "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 136315906;
        v25 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:c"
              "ountPresent:countMissing:countUnableToVerify:error:]_block_invoke";
        v26 = 2114;
        v27 = (uint64_t)v11;
        v28 = 2048;
        v29 = v12;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%s: Fixing broken localAvailability for resource: %{public}@, with fileID: %lld, expected at url: %@", (uint8_t *)&v24, 0x2Au);
LABEL_14:

      }
    }
    else if (v10)
    {
      objc_msgSend(v3, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v3, "fileID");
      objc_msgSend(v3, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136316162;
      v25 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]_block_invoke";
      v26 = 2114;
      v27 = (uint64_t)v11;
      v28 = 2048;
      v29 = v21;
      v30 = 2048;
      v31 = v13;
      v32 = 2114;
      v33 = v23;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%s: Fixing broken localAvailability for resource: %{public}@, with fileID: %lld, asset %p uuid %{public}@", (uint8_t *)&v24, 0x34u);

      goto LABEL_14;
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    goto LABEL_16;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    PLResourceCachingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *__error();
      v24 = 136315650;
      v25 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]_block_invoke";
      v26 = 2048;
      v27 = v4;
      v28 = 1024;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "%s: Error getting path from inode: %llu, errno: %d", (uint8_t *)&v24, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47014, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
LABEL_17:

}

@end
