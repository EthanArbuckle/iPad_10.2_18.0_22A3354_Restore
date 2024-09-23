@implementation PLFileSystemPersistence

- (PLFileSystemPersistence)init
{
  PLFileSystemPersistence *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *writerQueue;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLFileSystemPersistence;
  v2 = -[PLFileSystemPersistence init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.assetsd.PLFileSystemPersistence.writer", 0);
    writerQueue = v2->_writerQueue;
    v2->_writerQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_writerQueue;
    dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

  }
  return v2;
}

- (void)_backgroundWriteData:(id)a3 toFileAtURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__PLFileSystemPersistence__backgroundWriteData_toFileAtURL___block_invoke;
  v10[3] = &unk_1E376C718;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PLFileSystemPersistence _performOnWriterQueueWithIdentifier:block:](self, "_performOnWriterQueueWithIdentifier:block:", "-[PLFileSystemPersistence _backgroundWriteData:toFileAtURL:]", v10);

}

- (void)_performOnWriterQueueWithIdentifier:(const char *)a3 block:(id)a4
{
  id v6;
  void *v7;
  NSObject *writerQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  +[PLXPCTransaction transaction:](PLXPCTransaction, "transaction:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  writerQueue = self->_writerQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PLFileSystemPersistence__performOnWriterQueueWithIdentifier_block___block_invoke;
  v11[3] = &unk_1E376C7A8;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  pl_dispatch_async(writerQueue, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writerQueue, 0);
}

uint64_t __69__PLFileSystemPersistence__performOnWriterQueueWithIdentifier_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __60__PLFileSystemPersistence__backgroundWriteData_toFileAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "writeToURL:options:error:", v3, 1073741825, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Failed to persist to \"%@\": %@", buf, 0x16u);

    }
  }

}

+ (id)persistenceKeyTypes
{
  _QWORD v3[44];
  _QWORD v4[45];

  v4[44] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.assetsd.UUID");
  v3[1] = CFSTR("com.apple.assetsd.assetType");
  v4[0] = &unk_1E378F800;
  v4[1] = &unk_1E378F818;
  v3[2] = CFSTR("com.apple.assetsd.avalanche.UUID");
  v3[3] = CFSTR("com.apple.assetsd.avalanche.type");
  v4[2] = &unk_1E378F800;
  v4[3] = &unk_1E378F818;
  v3[4] = CFSTR("com.apple.assetsd.hidden");
  v3[5] = CFSTR("com.apple.assetsd.favorite");
  v4[4] = &unk_1E378F818;
  v4[5] = &unk_1E378F818;
  v3[6] = CFSTR("com.apple.assetsd.trashed");
  v3[7] = CFSTR("com.apple.assetsd.deferredProcessing");
  v4[6] = &unk_1E378F818;
  v4[7] = &unk_1E378F818;
  v3[8] = CFSTR("com.apple.assetsd.customCreationDate");
  v3[9] = CFSTR("com.apple.assetsd.customLocation");
  v4[8] = &unk_1E378F830;
  v4[9] = &unk_1E378F848;
  v3[10] = CFSTR("com.apple.assetsd.addedDate");
  v3[11] = CFSTR("com.apple.assetsd.cloudAsset.UUID");
  v4[10] = &unk_1E378F830;
  v4[11] = &unk_1E378F860;
  v3[12] = CFSTR("com.apple.assetsd.creatorBundleID");
  v3[13] = CFSTR("com.apple.assetsd.originalAssetUUID");
  v4[12] = &unk_1E378F860;
  v4[13] = &unk_1E378F800;
  v3[14] = CFSTR("com.apple.assetsd.publicGlobalUUID");
  v3[15] = CFSTR("com.apple.assetsd.title");
  v4[14] = &unk_1E378F860;
  v4[15] = &unk_1E378F860;
  v3[16] = CFSTR("com.apple.assetsd.accessibilityDescription");
  v3[17] = CFSTR("com.apple.assetsd.timeZoneName");
  v4[16] = &unk_1E378F860;
  v4[17] = &unk_1E378F860;
  v3[18] = CFSTR("com.apple.assetsd.timeZoneOffset");
  v3[19] = CFSTR("com.apple.assetsd.description");
  v4[18] = &unk_1E378F878;
  v4[19] = &unk_1E378F860;
  v3[20] = CFSTR("com.apple.assetsd.originalFilename");
  v3[21] = CFSTR("com.apple.assetsd.placeAnnotationData");
  v4[20] = &unk_1E378F860;
  v4[21] = &unk_1E378F830;
  v3[22] = CFSTR("com.apple.assetsd.importedBy");
  v3[23] = CFSTR("com.apple.assetsd.sceneAnalysisIsFromPreivew");
  v4[22] = &unk_1E378F818;
  v4[23] = &unk_1E378F818;
  v3[24] = CFSTR("com.apple.assetsd.viewPresentation");
  v3[25] = CFSTR("com.apple.assetsd.mediaGroupUUID");
  v4[24] = &unk_1E378F818;
  v4[25] = &unk_1E378F860;
  v3[26] = CFSTR("com.apple.assetsd.socGroupIdentifier");
  v3[27] = CFSTR("com.apple.assetsd.extraDurationData");
  v4[26] = &unk_1E378F860;
  v4[27] = &unk_1E378F848;
  v3[28] = CFSTR("com.apple.assetsd.videoComplementVisibility");
  v3[29] = CFSTR("com.apple.assetsd.syndicationIdentifier");
  v4[28] = &unk_1E378F818;
  v4[29] = &unk_1E378F860;
  v3[30] = CFSTR("com.apple.assetsd.syndicationHistory");
  v3[31] = CFSTR("com.apple.assetsd.libraryScopeShareState");
  v4[30] = &unk_1E378F818;
  v4[31] = &unk_1E378F890;
  v3[32] = CFSTR("com.apple.assetsd.libraryScopeAssetContributorsToUpdate");
  v3[33] = CFSTR("com.apple.assetsd.currentSleetCast");
  v4[32] = &unk_1E378F848;
  v4[33] = &unk_1E378F818;
  v3[34] = CFSTR("com.apple.assetsd.dbRebuildUuid");
  v3[35] = CFSTR("com.apple.assetsd.dbRebuildInProgress");
  v4[34] = &unk_1E378F860;
  v4[35] = &unk_1E378F818;
  v3[36] = CFSTR("com.apple.assetsd.inProgress.publishable");
  v3[37] = CFSTR("com.apple.assetsd.inProgress.destinationPath");
  v4[36] = &unk_1E378F818;
  v4[37] = &unk_1E378F860;
  v3[38] = CFSTR("com.apple.assetsd.inProgress.cameraAdjustmentsData");
  v3[39] = CFSTR("com.apple.assetsd.inProgress.filteredPreviewImagePath");
  v4[38] = &unk_1E378F860;
  v4[39] = &unk_1E378F860;
  v3[40] = CFSTR("com.apple.assetsd.inProgress.semanticDevelopment");
  v3[41] = CFSTR("com.apple.assetsd.cloudJobRecoveryCount");
  v4[40] = &unk_1E378F878;
  v4[41] = &unk_1E378F818;
  v3[42] = CFSTR("com.apple.assetsd.resourceType");
  v3[43] = CFSTR("com.apple.assetsd.cloudAsset.placeholderKind");
  v4[42] = &unk_1E378F818;
  v4[43] = &unk_1E378F818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 44);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedInstance
{
  pl_dispatch_once(&sharedInstance_onceToken_7681, &__block_literal_global_7682);
  return (id)sharedInstance_myInstance;
}

+ (id)filesystemPersistenceBatchItemForFileAtURL:(id)a3
{
  id v3;
  PLFileSystemPersistenceBatchItem *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[PLFileSystemPersistenceBatchItem initWithFileURL:]([PLFileSystemPersistenceBatchItem alloc], "initWithFileURL:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)persistData:(id)a3 forKey:(id)a4 fileURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  PLFileSystemPersistenceBatchItem *v10;

  if (a5)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    v10 = -[PLFileSystemPersistenceBatchItem initWithFileURL:]([PLFileSystemPersistenceBatchItem alloc], "initWithFileURL:", v7);

    -[PLFileSystemPersistenceBatchItem setData:forKey:](v10, "setData:forKey:", v9, v8);
    -[PLFileSystemPersistenceBatchItem persist](v10, "persist");

  }
}

+ (id)persistedAttributesForFileAtURL:(id)a3
{
  return (id)objc_msgSend(a1, "persistedAttributesForFileAtURL:exists:includeUnknownAttributes:", a3, 0, 0);
}

+ (id)persistedAttributesForFileAtURL:(id)a3 exists:(BOOL *)a4 includeUnknownAttributes:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  int v11;
  int v12;
  ssize_t v13;
  ssize_t v14;
  id v15;
  __int128 v16;
  NSObject *v17;
  char *v18;
  int *v19;
  char *v20;
  NSObject *v21;
  char *v22;
  int *v23;
  char *v24;
  PLFileSystemPersistenceAttributes *v25;
  ssize_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  const char *v31;
  size_t v32;
  size_t v33;
  int v34;
  void *v35;
  ssize_t v36;
  ssize_t v37;
  NSObject *v38;
  void *v39;
  int *v40;
  char *v41;
  __int128 v42;
  const char *v43;
  void *context;
  id v45;
  void *v46;
  void *v47;
  ssize_t v48;
  int v49;
  id v50;
  _BOOL4 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  char *v57;
  uint64_t v58;

  v5 = a5;
  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x19AEC2E4C]();
  if (!v7)
  {
LABEL_13:
    if (a4)
      *a4 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v7, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

  v11 = open(v10, 0x200000);
  if (v11 < 0)
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      v19 = __error();
      v20 = strerror(*v19);
      *(_DWORD *)buf = 138412546;
      v53 = v18;
      v54 = 2080;
      v55 = v20;
      _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, "Unable to open file '%@' to retrieve extended attributes (%s).", buf, 0x16u);

    }
    goto LABEL_13;
  }
  v12 = v11;
  if (a4)
    *a4 = 1;
  v13 = flistxattr(v11, 0, 0, 0);
  if (v13 < 0)
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)buf = 138412546;
      v53 = v22;
      v54 = 2080;
      v55 = v24;
      _os_log_impl(&dword_199DF7000, v21, OS_LOG_TYPE_ERROR, "Unable to get xattr for '%@' (%s).", buf, 0x16u);

    }
    goto LABEL_18;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_18:
    close(v12);
LABEL_20:
    objc_autoreleasePoolPop(v8);
    v25 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v13);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (flistxattr(v12, (char *)objc_msgSend(v15, "mutableBytes"), objc_msgSend(v15, "length"), 0) != v14)
  {
    close(v12);

    goto LABEL_20;
  }
  v50 = v15;
  v49 = v12;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  context = v8;
  v45 = v7;
  v43 = v10;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = 0;
  }
  v27 = 0;
  *(_QWORD *)&v16 = 136315650;
  v42 = v16;
  v28 = v15;
  v51 = v5;
  v48 = v14;
  do
  {
    v29 = objc_retainAutorelease(v28);
    v30 = objc_msgSend(v29, "bytes");
    v31 = (const char *)(v30 + v27);
    v32 = strnlen((const char *)(v30 + v27), v14 - v27);
    if (!v32)
      break;
    v33 = v32;
    v34 = strncmp(v31, "com.apple.assetsd", 0x11uLL);
    if (!v34 || v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31, v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = fgetxattr(v12, v31, 0, 0, 0, 0);
        if (v36 < 0)
        {
          PLBackendGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v40 = __error();
            v41 = strerror(*v40);
            *(_DWORD *)buf = v42;
            v53 = v43;
            v54 = 2080;
            v55 = (void *)v31;
            v56 = 2080;
            v57 = v41;
            _os_log_impl(&dword_199DF7000, v38, OS_LOG_TYPE_DEFAULT, "unexpected issue getting xttr length for %s %s: %s", buf, 0x20u);
          }
        }
        else
        {
          v37 = v36;
          objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v36);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (v37 == fgetxattr(v12, v31, (void *)-[NSObject mutableBytes](v38, "mutableBytes"), -[NSObject length](v38, "length"), 0, 0))
          {
            if (v34)
              v39 = v46;
            else
              v39 = v47;
            objc_msgSend(v39, "setObject:forKey:", v38, v35);
          }
          v12 = v49;
          v14 = v48;
        }
        v28 = v50;

      }
      v5 = v51;
    }
    v27 += v33 + 1;
  }
  while (v27 < v14);
  v25 = -[PLFileSystemPersistenceAttributes initWithAttributes:unknownAttributes:]([PLFileSystemPersistenceAttributes alloc], "initWithAttributes:unknownAttributes:", v47, v46);
  close(v12);

  objc_autoreleasePoolPop(context);
  v7 = v45;
LABEL_21:

  return v25;
}

+ (void)clearAllAttributesForFileAtUrl:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  int v7;
  int v8;
  ssize_t v9;
  ssize_t v10;
  id v11;
  ssize_t v12;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  NSObject *v17;
  char *v18;
  int *v19;
  char *v20;
  NSObject *v21;
  char *v22;
  int *v23;
  char *v24;
  NSObject *v25;
  char *v26;
  int *v27;
  char *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x19AEC2E4C]();
  if (!v3)
    goto LABEL_22;
  objc_msgSend(v3, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");

  v7 = open(v6, 0x200000);
  if ((v7 & 0x80000000) == 0)
  {
    v8 = v7;
    v9 = flistxattr(v7, 0, 0, 0);
    if (v9 < 0)
    {
      PLBackendGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "path");
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        v27 = __error();
        v28 = strerror(*v27);
        *(_DWORD *)buf = 138412546;
        v30 = v26;
        v31 = 2080;
        v32 = v28;
        _os_log_impl(&dword_199DF7000, v25, OS_LOG_TYPE_ERROR, "Unable to get xattr for '%@' (%s).", buf, 0x16u);

      }
    }
    else
    {
      v10 = v9;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (flistxattr(v8, (char *)objc_msgSend(v11, "mutableBytes"), objc_msgSend(v11, "length"), 0) == v10)
        {
          v12 = 0;
          do
          {
            v13 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
            v14 = (const char *)(v13 + v12);
            v15 = strnlen((const char *)(v13 + v12), v10 - v12);
            if (!v15)
              break;
            v16 = v15;
            if (!strncmp(v14, "com.apple.assetsd", 0x11uLL) && fremovexattr(v8, v14, 0) < 0)
            {
              PLBackendGetLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v3, "path");
                v18 = (char *)objc_claimAutoreleasedReturnValue();
                v19 = __error();
                v20 = strerror(*v19);
                *(_DWORD *)buf = 136315650;
                v30 = v14;
                v31 = 2112;
                v32 = v18;
                v33 = 2080;
                v34 = v20;
                _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, "Unable to remove xattr %s for '%@' (%s).", buf, 0x20u);

              }
            }
            v12 += v16 + 1;
          }
          while (v12 < v10);
        }
        close(v8);

        goto LABEL_22;
      }
    }
    close(v8);
    goto LABEL_22;
  }
  PLBackendGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "path");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    v23 = __error();
    v24 = strerror(*v23);
    *(_DWORD *)buf = 138412546;
    v30 = v22;
    v31 = 2080;
    v32 = v24;
    _os_log_impl(&dword_199DF7000, v21, OS_LOG_TYPE_ERROR, "Unable to open file '%@' to retrieve extended attributes (%s).", buf, 0x16u);

  }
LABEL_22:
  objc_autoreleasePoolPop(v4);

}

+ (void)persistUUIDString:(id)a3 forKey:(id)a4 fileURL:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  PLUUIDDataFromString(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistData:forKey:fileURL:", v10, v9, v8);

}

+ (void)persistUInt16:(unsigned __int16)a3 forKey:(id)a4 fileURL:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int16 v11;

  v11 = a3;
  v7 = (void *)MEMORY[0x1E0C99D50];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "dataWithBytes:length:", &v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistData:forKey:fileURL:", v10, v9, v8);

}

+ (void)persistString:(id)a3 forKey:(id)a4 fileURL:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistData:forKey:fileURL:", v10, v9, v8);

}

+ (void)persistMetadata:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd
    || (__PLIsAssetsdProxyService & 1) != 0
    || (pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_45_3377),
        PLIsInternalTool_isInternalTool))
  {
    objc_msgSend(a1, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject _backgroundWriteData:toFileAtURL:](v8, "_backgroundWriteData:toFileAtURL:", v6, v7);
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Unsupported client call to persistMetadata:fileURL: with path %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

}

+ (void)performBlockOnWriterQueue:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd
    || (__PLIsAssetsdProxyService & 1) != 0
    || (pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_45_3377),
        PLIsInternalTool_isInternalTool))
  {
    objc_msgSend(a1, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject _performOnWriterQueueWithIdentifier:block:](v5, "_performOnWriterQueueWithIdentifier:block:", "+[PLFileSystemPersistence performBlockOnWriterQueue:]", v4);
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "Unsupported client call to performBlockOnWriterQueue:", v6, 2u);
    }
  }

}

void __41__PLFileSystemPersistence_sharedInstance__block_invoke()
{
  PLFileSystemPersistence *v0;
  void *v1;

  v0 = objc_alloc_init(PLFileSystemPersistence);
  v1 = (void *)sharedInstance_myInstance;
  sharedInstance_myInstance = (uint64_t)v0;

}

@end
