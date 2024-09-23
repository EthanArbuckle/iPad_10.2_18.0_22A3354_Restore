@implementation PLCloudSharingJob

- (PLCloudSharingJob)initWithAssetsdClient:(id)a3
{
  PLCloudSharingJob *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharingJob;
  result = -[PLDaemonJob initWithAssetsdClient:](&v4, sel_initWithAssetsdClient_, a3);
  if (result)
    result->_shouldPrioritize = 0;
  return result;
}

- (PLPhotoLibrary)transientPhotoLibrary
{
  PLPhotoLibraryOptions *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v3, "setRequiredState:", 6);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v3, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v3, "setAutomaticallyPinToFirstFetch:", 0);
  -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLCloudSharingJob transientPhotoLibrary]", v5, v3, &v10);
  v7 = v10;

  if (!v6)
  {
    PLBackendSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error creating context: %@", buf, 0xCu);
    }

  }
  return (PLPhotoLibrary *)v6;
}

- (void)archiveXPCToDisk:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  double Current;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  PLCloudSharingJob *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  PLCloudSharingJob *v28;
  void *v29;
  void *v30;
  void *v31;
  CFAbsoluteTime v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint32_t v36;
  id v37;
  PLCloudSharingJob *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  PLCloudSharingJob *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  double v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  do
  {
    v6 = __ldaxr(&archiveXPCToDisk__archiveCounter);
    v7 = v6 + 1;
  }
  while (__stlxr(v6 + 1, &archiveXPCToDisk__archiveCounter));
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f.%lld.job"), *(_QWORD *)&Current, v7);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v4, "PLCloudSharingJob_archiveFilename", (const char *)objc_msgSend(v9, "UTF8String"));
  xpc_dictionary_set_BOOL(v4, "PLCloudSharingJob_shouldPrioritize", self->_shouldPrioritize);
  v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v47;
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cloudSharingArchiveDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingPathComponent:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_8;
  if ((objc_msgSend(v11, "writeToFile:options:error:", v15, 1073741825, 0) & 1) != 0)
    goto LABEL_6;
  v16 = (void *)objc_opt_new();
  v46 = v12;
  objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v46);
  v17 = v46;
  v18 = v12;
  v19 = v9;
  v20 = self;
  v21 = v10;
  v22 = v5;
  v23 = v17;

  v24 = objc_msgSend(v11, "writeToFile:options:error:", v15, 1073741825, 0);
  v25 = v23;
  v5 = v22;
  v10 = v21;
  self = v20;
  v9 = v19;
  v12 = v25;
  if ((v24 & 1) != 0)
  {
LABEL_6:
    PLPhotoSharingGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v44 = v12;
      v27 = v9;
      v28 = self;
      v29 = v10;
      v30 = v5;
      v31 = (void *)objc_opt_class();
      v43 = v31;
      v32 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218754;
      v49 = v28;
      v9 = v27;
      v12 = v44;
      v50 = 2112;
      v51 = v31;
      v5 = v30;
      v10 = v29;
      v52 = 2112;
      v53 = v15;
      v54 = 2048;
      v55 = v32 - Current;
      v33 = "Archived <%p>%@ to %@ in %f";
      v34 = v26;
      v35 = OS_LOG_TYPE_DEBUG;
      v36 = 42;
LABEL_10:
      _os_log_impl(&dword_199541000, v34, v35, v33, buf, v36);

    }
  }
  else
  {
LABEL_8:
    PLPhotoSharingGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v45 = v12;
      v37 = v9;
      v38 = self;
      v39 = v10;
      v40 = v5;
      v41 = (void *)objc_opt_class();
      v43 = v41;
      v42 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 134219266;
      v49 = v38;
      v9 = v37;
      v12 = v45;
      v50 = 2112;
      v51 = v41;
      v5 = v40;
      v10 = v39;
      v52 = 2048;
      v53 = v39;
      v54 = 2048;
      v55 = *(double *)&v42;
      v56 = 2112;
      v57 = v15;
      v58 = 2112;
      v59 = v45;
      v33 = "ERROR: archiving <%p>%@ (plist %p data %lu) to %@: %@";
      v34 = v26;
      v35 = OS_LOG_TYPE_ERROR;
      v36 = 62;
      goto LABEL_10;
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 1;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLCloudSharingJob;
  v7 = -[PLDaemonJob initFromXPCObject:libraryServicesManager:](&v11, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLStringFromXPCDictionary();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[8];
    v7[8] = v8;

    *((_BYTE *)v7 + 72) = xpc_dictionary_get_BOOL(v6, "PLCloudSharingJob_shouldPrioritize");
  }
  +[PLPhotoSharingHelper initializeMSPlatform](PLPhotoSharingHelper, "initializeMSPlatform");

  return v7;
}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_archiveFilename)
  {
    -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modelMigrator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudSharingArchiveDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", self->_archiveFilename);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);

    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Deleted archive %@", buf, 0xCu);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)PLCloudSharingJob;
  -[PLDaemonJob runDaemonSide](&v10, sel_runDaemonSide);
}

- (void)runAndWaitForMessageToBeSent
{
  double Current;
  double v4;
  void *v5;
  NSObject *v6;
  int v7;
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  -[PLDaemonJob sendToAssetsd](self, "sendToAssetsd");
  v4 = CFAbsoluteTimeGetCurrent();
  -[PLDaemonJob assetsdClient](self, "assetsdClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waitUntilConnectionSendsAllMessages");

  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = v4 - Current;
    v9 = 2048;
    v10 = CFAbsoluteTimeGetCurrent() - v4;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "runAndWaitForMessageToBeSent sendToAssetsd time %f waitUntilConnectionSendsAllMessages time %f", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)shouldPrioritize
{
  return self->_shouldPrioritize;
}

- (void)setShouldPrioritize:(BOOL)a3
{
  self->_shouldPrioritize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveFilename, 0);
}

+ (id)lowPriorityOperationQueue
{
  pl_dispatch_once();
  return (id)lowPriorityOperationQueue_serialOperationQueue;
}

+ (id)highPriorityOperationQueue
{
  pl_dispatch_once();
  return (id)highPriorityOperationQueue_serialOperationQueue;
}

+ (id)recoveredEventsWithPathManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = v3;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudSharingArchiveDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    v33 = *MEMORY[0x1E0D73ED8];
    v28 = v4;
    v29 = v7;
    v32 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19AEC1554]();
        if (objc_msgSend(v12, "hasSuffix:", CFSTR(".job")))
        {
          objc_msgSend(v4, "stringByAppendingPathComponent:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0;
          objc_msgSend(v16, "getUInt16:forKey:", &v34, v33);
          if (v34 > 2u)
            goto LABEL_12;
          objc_msgSend(MEMORY[0x1E0D73200], "persistUInt16:forKey:fileURL:", (unsigned __int16)(v34 + 1), v33, v15);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v14, 1, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            v18 = objc_retainAutorelease(v17);
            objc_msgSend(v18, "bytes");
            objc_msgSend(v18, "length");
            v19 = xpc_create_from_plist();
            if (v19)
            {
              v20 = (void *)v19;
              objc_msgSend(v27, "addObject:", v19);

              v4 = v28;
              v7 = v29;
              v9 = v30;
LABEL_16:

              v10 = v32;
              goto LABEL_17;
            }
          }

          v4 = v28;
          v7 = v29;
          v9 = v30;
          if (v34 >= 3u)
          {
LABEL_12:
            v21 = v7;
            v22 = v4;
            PLPhotoSharingGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v12;
              _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Deleting recovered event %@ because of too many recovery attempts", buf, 0xCu);
            }

            v4 = v22;
            v7 = v21;
          }
          objc_msgSend(v31, "removeItemAtPath:error:", v14, 0);
          goto LABEL_16;
        }
LABEL_17:
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v9);
  }

  PLPhotoSharingGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v27;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "recoveredEvents %@", buf, 0xCu);
  }

  return v27;
}

+ (void)deleteAllRecoveryEventsWithPathManager:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Deleting all recovery events!", buf, 2u);
  }

  objc_msgSend(v3, "cloudSharingArchiveDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v27 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  if (v7)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v8;
      v20 = v7;
      v21 = v3;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v12;
          v16 = objc_msgSend(v6, "removeItemAtPath:error:", v15, &v22);
          v17 = v22;

          if ((v16 & 1) != 0)
          {
            v12 = v17;
          }
          else
          {
            PLPhotoSharingGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v15;
              v31 = 2112;
              v32 = v17;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unable to delete recovery event file %@: %@", buf, 0x16u);
            }

            v12 = 0;
          }

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);

      v7 = v20;
      v3 = v21;
      v8 = v19;
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v5;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to find recovery events file under %@: %@", buf, 0x16u);
    }
  }

}

uint64_t __47__PLCloudSharingJob_highPriorityOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)highPriorityOperationQueue_serialOperationQueue;
  highPriorityOperationQueue_serialOperationQueue = (uint64_t)v0;

  objc_msgSend((id)highPriorityOperationQueue_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)highPriorityOperationQueue_serialOperationQueue, "setQualityOfService:", 25);
}

uint64_t __46__PLCloudSharingJob_lowPriorityOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)lowPriorityOperationQueue_serialOperationQueue;
  lowPriorityOperationQueue_serialOperationQueue = (uint64_t)v0;

  objc_msgSend((id)lowPriorityOperationQueue_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)lowPriorityOperationQueue_serialOperationQueue, "setQualityOfService:", 9);
}

@end
