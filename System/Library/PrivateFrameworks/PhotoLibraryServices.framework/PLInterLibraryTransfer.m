@implementation PLInterLibraryTransfer

- (PLInterLibraryTransfer)initWithSourceBundle:(id)a3 destinationBundle:(id)a4 options:(id)a5
{
  id v10;
  id v11;
  id v12;
  PLInterLibraryTransfer *v13;
  PLInterLibraryTransfer *v14;
  NSObject *v15;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "skipContextSave"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.skipContextSave == NO"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PLInterLibraryTransfer;
  v13 = -[PLInterLibraryTransfer init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceBundle, a3);
    objc_storeStrong((id *)&v14->_destinationBundle, a4);
    objc_storeStrong((id *)&v14->_options, a5);
    PLInterLibraryTransferGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Initialized inter-library transfer with sourceBundle %@ destinationBundle %@", buf, 0x16u);
    }

  }
  return v14;
}

- (PLInterLibraryTransfer)initWithSourceLibrary:(id)a3 destinationLibrary:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLInterLibraryTransfer *v12;
  PLInterLibraryTransfer *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLInterLibraryTransfer;
  v12 = -[PLInterLibraryTransfer init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceLibrary, a3);
    objc_storeStrong((id *)&v13->_destinationLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    PLInterLibraryTransferGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Initialized inter-library transfer with sourceLibrary %@ destinationLibrary %@", buf, 0x16u);
    }

  }
  return v13;
}

- (BOOL)_loadLibrariesWithError:(id *)a3
{
  BOOL v5;
  PLPhotoLibrary *v6;
  id v7;
  PLPhotoLibrary *sourceLibrary;
  PLPhotoLibrary *v9;
  id v10;
  PLPhotoLibrary *destinationLibrary;
  PLPhotoLibrary **p_destinationLibrary;
  id v14;
  id v15;

  if (self->_sourceLibrary && self->_destinationLibrary)
    return 1;
  v15 = 0;
  -[PLInterLibraryTransfer _loadSourceLibraryWithError:](self, "_loadSourceLibraryWithError:", &v15);
  v6 = (PLPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  sourceLibrary = self->_sourceLibrary;
  self->_sourceLibrary = v6;

  if (self->_sourceLibrary)
  {
    v14 = v7;
    -[PLInterLibraryTransfer _loadDestinationLibraryWithError:](self, "_loadDestinationLibraryWithError:", &v14);
    v9 = (PLPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    p_destinationLibrary = &self->_destinationLibrary;
    destinationLibrary = self->_destinationLibrary;
    self->_destinationLibrary = v9;
    v7 = v10;
  }
  else
  {
    p_destinationLibrary = &self->_destinationLibrary;
    destinationLibrary = self->_destinationLibrary;
    self->_destinationLibrary = 0;
  }

  if (self->_sourceLibrary && *p_destinationLibrary)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v5;
}

- (void)_initFileManager
{
  NSFileManager *v3;
  NSFileManager *fileManager;

  if (!self->_fileManager)
  {
    v3 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fileManager = self->_fileManager;
    self->_fileManager = v3;

  }
}

- (BOOL)transferAssetWithUuid:(id)a3 error:(id *)a4
{
  BOOL v6;
  PLPhotoLibrary *sourceLibrary;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  PLPhotoLibrary *destinationLibrary;
  NSObject *v22;
  PLPhotoLibrary *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  NSFileManager *fileManager;
  BOOL v32;
  id v33;
  NSObject *v34;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  uint64_t *v50;
  _QWORD v51[4];
  id v52;
  PLInterLibraryTransfer *v53;
  id v54;
  id v55;
  id v56;
  uint8_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  SEL v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  id v67;
  id obj;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint8_t v79[128];
  uint8_t v80[4];
  id v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__69055;
  v73 = __Block_byref_object_dispose__69056;
  v74 = 0;
  obj = 0;
  v6 = -[PLInterLibraryTransfer _loadLibrariesWithError:](self, "_loadLibrariesWithError:", &obj);
  objc_storeStrong(&v74, obj);
  if (v6)
  {
    -[PLInterLibraryTransfer _initFileManager](self, "_initFileManager");
    sourceLibrary = self->_sourceLibrary;
    v8 = (id *)(v70 + 5);
    v67 = (id)v70[5];
    -[PLInterLibraryTransfer _loadAssetWithUuid:fromLibrary:error:](self, "_loadAssetWithUuid:fromLibrary:error:", v42, sourceLibrary, &v67);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v67);
    if (v40)
    {
      *(_QWORD *)buf = 0;
      v62 = buf;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__69055;
      v65 = __Block_byref_object_dispose__69056;
      -[PLInterLibraryTransfer _loadAssetWithUuid:fromLibrary:error:](self, "_loadAssetWithUuid:fromLibrary:error:", v42, self->_destinationLibrary, 0);
      v66 = (id)objc_claimAutoreleasedReturnValue();
      v9 = *((_QWORD *)v62 + 5);
      if (!v9)
      {
        -[PLInterLibraryTransfer _dedupedDestinationAssetWithSourceAsset:destinationLibrary:](self, "_dedupedDestinationAssetWithSourceAsset:destinationLibrary:", v40, self->_destinationLibrary);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)*((_QWORD *)v62 + 5);
        *((_QWORD *)v62 + 5) = v10;

        v9 = *((_QWORD *)v62 + 5);
      }
      if (-[PLInterLibraryTransfer _shouldSkipTransferWithSourceAsset:destinationAsset:](self, "_shouldSkipTransferWithSourceAsset:destinationAsset:", v40, v9))
      {
        v12 = 1;
      }
      else
      {
        PLInterLibraryTransferGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v80 = 138543362;
          v81 = v42;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "transferAssetWithUuid:%{public}@ begin", v80, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x1E0C809B0];
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke;
        v51[3] = &unk_1E3670170;
        v18 = v42;
        v52 = v18;
        v53 = self;
        v57 = buf;
        v54 = v40;
        v36 = v15;
        v55 = v36;
        v58 = &v75;
        v59 = &v69;
        v60 = a2;
        v38 = v16;
        v56 = v38;
        v39 = (void *)MEMORY[0x19AEC174C](v51);
        -[PLInterLibraryTransfer options](self, "options");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "skipContextSave");

        destinationLibrary = self->_destinationLibrary;
        if (v20)
          -[PLPhotoLibrary performBlockAndWait:](destinationLibrary, "performBlockAndWait:", v39, v36);
        else
          -[PLPhotoLibrary performTransactionAndWait:](destinationLibrary, "performTransactionAndWait:", v39, v36);
        if (!*((_BYTE *)v76 + 24))
          goto LABEL_25;
        PLInterLibraryTransferGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v80 = 138543362;
          v81 = v18;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Verifying asset transfer for uuid %{public}@", v80, 0xCu);
        }

        v23 = self->_destinationLibrary;
        v48[0] = v17;
        v48[1] = 3221225472;
        v48[2] = __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke_34;
        v48[3] = &unk_1E3676EA0;
        v50 = &v75;
        v48[4] = self;
        v49 = v18;
        -[PLPhotoLibrary performBlockAndWait:](v23, "performBlockAndWait:", v48);

        if (*((_BYTE *)v76 + 24))
        {
          v12 = 1;
        }
        else
        {
LABEL_25:
          PLInterLibraryTransferGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = objc_msgSend(v38, "count");
            *(_DWORD *)v80 = 138543618;
            v81 = v18;
            v82 = 2048;
            v83 = v25;
            _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "transferAssetWithUuid:%{public}@ failed, removing %tu copied files", v80, 0x16u);
          }

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v26 = v38;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v79, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v45 != v28)
                  objc_enumerationMutation(v26);
                v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
                fileManager = self->_fileManager;
                v43 = 0;
                v32 = -[NSFileManager removeItemAtURL:error:](fileManager, "removeItemAtURL:error:", v30, &v43);
                v33 = v43;
                if (!v32)
                {
                  PLInterLibraryTransferGetLog();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v80 = 138412290;
                    v81 = v33;
                    _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Remove file failed with error %@", v80, 0xCu);
                  }

                }
              }
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v79, 16);
            }
            while (v27);
          }

          if (a4)
            *a4 = objc_retainAutorelease((id)v70[5]);
          v12 = *((_BYTE *)v76 + 24) != 0;
        }

      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      PLInterLibraryTransferGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Load source asset failed", buf, 2u);
      }

      if (a4)
        *a4 = objc_retainAutorelease((id)v70[5]);
      v12 = *((_BYTE *)v76 + 24) != 0;
    }

  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v70[5]);
    v12 = *((_BYTE *)v76 + 24) != 0;
  }
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
  return v12;
}

- (BOOL)transferPersonWithUuid:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  PLPhotoLibrary *sourceLibrary;
  id *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  PLPhotoLibrary *destinationLibrary;
  int v20;
  NSObject *v21;
  uint64_t *v22;
  NSObject *v23;
  PLPhotoLibrary *v24;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  PLInterLibraryTransfer *v31;
  id v32;
  id v33;
  uint8_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint8_t v37[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__69055;
  v49 = __Block_byref_object_dispose__69056;
  v50 = 0;
  obj = 0;
  v7 = -[PLInterLibraryTransfer _loadLibrariesWithError:](self, "_loadLibrariesWithError:", &obj);
  objc_storeStrong(&v50, obj);
  if (v7)
  {
    sourceLibrary = self->_sourceLibrary;
    v9 = (id *)(v46 + 5);
    v43 = (id)v46[5];
    -[PLInterLibraryTransfer _loadPersonWithUuid:fromLibrary:error:](self, "_loadPersonWithUuid:fromLibrary:error:", v6, sourceLibrary, &v43);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v43);
    if (v10)
    {
      *(_QWORD *)v37 = 0;
      v38 = v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__69055;
      v41 = __Block_byref_object_dispose__69056;
      -[PLInterLibraryTransfer _loadPersonWithUuid:fromLibrary:error:](self, "_loadPersonWithUuid:fromLibrary:error:", v6, self->_destinationLibrary, 0);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      PLInterLibraryTransferGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v6;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "transferPersonWithUuid:%{public}@ begin", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke;
      v29[3] = &unk_1E3670198;
      v14 = v6;
      v30 = v14;
      v31 = self;
      v34 = v37;
      v32 = v10;
      v15 = v12;
      v33 = v15;
      v35 = &v51;
      v36 = &v45;
      v16 = (void *)MEMORY[0x19AEC174C](v29);
      -[PLInterLibraryTransfer options](self, "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "skipContextSave");

      destinationLibrary = self->_destinationLibrary;
      if (v18)
        -[PLPhotoLibrary performBlockAndWait:](destinationLibrary, "performBlockAndWait:", v16);
      else
        -[PLPhotoLibrary performTransactionAndWait:](destinationLibrary, "performTransactionAndWait:", v16);
      v22 = v52;
      if (!*((_BYTE *)v52 + 24))
        goto LABEL_21;
      PLInterLibraryTransferGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v14;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Verifying person transfer for uuid %{public}@", buf, 0xCu);
      }

      v24 = self->_destinationLibrary;
      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_38;
      v26[3] = &unk_1E3676EA0;
      v28 = &v51;
      v26[4] = self;
      v27 = v14;
      -[PLPhotoLibrary performBlockAndWait:](v24, "performBlockAndWait:", v26);

      v22 = v52;
      if (*((_BYTE *)v52 + 24))
      {
        v20 = 1;
      }
      else
      {
LABEL_21:
        if (a4)
        {
          *a4 = objc_retainAutorelease((id)v46[5]);
          v22 = v52;
        }
        v20 = *((unsigned __int8 *)v22 + 24);
      }

      _Block_object_dispose(v37, 8);
    }
    else
    {
      PLInterLibraryTransferGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Load source person failed", v37, 2u);
      }

      if (a4)
        *a4 = objc_retainAutorelease((id)v46[5]);
      v20 = *((unsigned __int8 *)v52 + 24);
    }

  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v46[5]);
    v20 = *((unsigned __int8 *)v52 + 24);
  }
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v20 != 0;
}

- (BOOL)transferFaceCropWithUuid:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  PLPhotoLibrary *sourceLibrary;
  id *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  PLPhotoLibrary *destinationLibrary;
  NSObject *v21;
  PLPhotoLibrary *v22;
  int v23;
  id v24;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  PLInterLibraryTransfer *v31;
  id v32;
  NSObject *v33;
  uint8_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint8_t v37[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__69055;
  v49 = __Block_byref_object_dispose__69056;
  v50 = 0;
  obj = 0;
  v7 = -[PLInterLibraryTransfer _loadLibrariesWithError:](self, "_loadLibrariesWithError:", &obj);
  objc_storeStrong(&v50, obj);
  if (v7)
  {
    sourceLibrary = self->_sourceLibrary;
    v9 = (id *)(v46 + 5);
    v43 = (id)v46[5];
    -[PLInterLibraryTransfer _loadFaceCropWithUuid:fromLibrary:error:](self, "_loadFaceCropWithUuid:fromLibrary:error:", v6, sourceLibrary, &v43);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v43);
    if (!v10)
    {
      PLInterLibraryTransferGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Load source face crop failed", v37, 2u);
      }

      if (a4)
        *a4 = objc_retainAutorelease((id)v46[5]);
      v12 = *((_BYTE *)v52 + 24) != 0;
      goto LABEL_29;
    }
    *(_QWORD *)v37 = 0;
    v38 = v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__69055;
    v41 = __Block_byref_object_dispose__69056;
    -[PLInterLibraryTransfer _loadFaceCropWithUuid:fromLibrary:error:](self, "_loadFaceCropWithUuid:fromLibrary:error:", v6, self->_destinationLibrary, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)v38 + 5))
    {
      PLInterLibraryTransferGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = 1;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v6;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Skipping transfer of face crop %{public}@ because destination already exists", buf, 0xCu);
      }
      goto LABEL_28;
    }
    PLInterLibraryTransferGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v56 = v6;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "transferFaceCropWithUuid:%{public}@ begin", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke;
    v29[3] = &unk_1E3670198;
    v16 = v6;
    v30 = v16;
    v31 = self;
    v34 = v37;
    v32 = v10;
    v11 = v15;
    v33 = v11;
    v35 = &v51;
    v36 = &v45;
    v17 = (void *)MEMORY[0x19AEC174C](v29);
    -[PLInterLibraryTransfer options](self, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "skipContextSave");

    destinationLibrary = self->_destinationLibrary;
    if (v19)
      -[PLPhotoLibrary performBlockAndWait:](destinationLibrary, "performBlockAndWait:", v17);
    else
      -[PLPhotoLibrary performTransactionAndWait:](destinationLibrary, "performTransactionAndWait:", v17);
    if (*((_BYTE *)v52 + 24))
    {
      PLInterLibraryTransferGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v16;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Verifying face crop transfer for uuid %{public}@", buf, 0xCu);
      }

      v22 = self->_destinationLibrary;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_47;
      v26[3] = &unk_1E3676EA0;
      v28 = &v51;
      v26[4] = self;
      v27 = v16;
      -[PLPhotoLibrary performBlockAndWait:](v22, "performBlockAndWait:", v26);

      v23 = *((unsigned __int8 *)v52 + 24);
      v24 = (id)v46[5];
      if (v23 || !a4)
        goto LABEL_27;
    }
    else
    {
      v24 = (id)v46[5];
      if (!a4)
      {
LABEL_27:

        v12 = *((_BYTE *)v52 + 24) != 0;
LABEL_28:

        _Block_object_dispose(v37, 8);
LABEL_29:

        goto LABEL_30;
      }
    }
    v24 = objc_retainAutorelease(v24);
    *a4 = v24;
    goto LABEL_27;
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v46[5]);
  v12 = *((_BYTE *)v52 + 24) != 0;
LABEL_30:
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v12;
}

- (id)_loadSourceLibraryWithError:(id *)a3
{
  PLPhotoLibraryOptions *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setAutomaticallyMergesContext:](v5, "setAutomaticallyMergesContext:", 0);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v5, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setRequiredState:](v5, "setRequiredState:", 7);
  PLInterLibraryTransferGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[PLInterLibraryTransfer sourceBundle](self, "sourceBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Loading source library from bundle %@", buf, 0xCu);

  }
  -[PLInterLibraryTransfer sourceBundle](self, "sourceBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLInterLibraryTransfer _loadSourceLibraryWithError:]", v8, v5, &v13);
  v10 = v13;

  if (!v9)
  {
    PLInterLibraryTransferGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Inter-library transfer failed. Unable to load source library: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (id)_loadDestinationLibraryWithError:(id *)a3
{
  PLPhotoLibraryOptions *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setAutomaticallyMergesContext:](v5, "setAutomaticallyMergesContext:", 0);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v5, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setRequiredState:](v5, "setRequiredState:", 7);
  PLInterLibraryTransferGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[PLInterLibraryTransfer destinationBundle](self, "destinationBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Loading destination library from bundle %@", buf, 0xCu);

  }
  -[PLInterLibraryTransfer destinationBundle](self, "destinationBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLInterLibraryTransfer _loadDestinationLibraryWithError:]", v8, v5, &v13);
  v10 = v13;

  if (!v9)
  {
    PLInterLibraryTransferGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Inter-library transfer failed. Unable to load destination library: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (id)_loadFaceCropWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInterLibraryTransfer _loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:](self, "_loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:", v10, v11, v12, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_loadPersonWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  +[PLPerson entityName](PLPerson, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInterLibraryTransfer _loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:](self, "_loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:", v10, v11, v12, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_loadAssetWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInterLibraryTransfer _loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:](self, "_loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:", v10, v11, v12, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_loadObjectWithEntityName:(id)a3 withValues:(id)a4 forKeyPaths:(id)a5 fromLibrary:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__69055;
  v41 = __Block_byref_object_dispose__69056;
  v42 = 0;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke;
  v31 = &unk_1E3677970;
  v15 = v12;
  v32 = v15;
  v16 = v11;
  v33 = v16;
  v17 = v13;
  v34 = v17;
  v18 = v14;
  v35 = v18;
  v36 = &v37;
  objc_msgSend(v18, "performBlockAndWait:", &v28);
  v19 = (void *)v38[5];
  if (a7 && !v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load %@ with %@ %@"), v16, v17, v15, v28, v29, v30, v31, v32, v33, v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2938];
    v46[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_retainAutorelease(v23);
    *a7 = v24;
    PLInterLibraryTransferGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v24;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v19 = (void *)v38[5];
  }
  v26 = v19;

  _Block_object_dispose(&v37, 8);
  return v26;
}

- (BOOL)_deleteAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset.photoLibrary"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__PLInterLibraryTransfer__deleteAsset___block_invoke;
  v12[3] = &unk_1E3676EA0;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performTransactionAndWait:", v12);

  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_dedupedDestinationAssetWithSourceAsset:(id)a3 destinationLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v26;
  PLInterLibraryTransfer *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = self;
  -[PLInterLibraryTransfer options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keysForDeDupe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v6, "photoLibrary", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __85__PLInterLibraryTransfer__dedupedDestinationAssetWithSourceAsset_destinationLibrary___block_invoke;
        v29[3] = &unk_1E3677530;
        v30 = v6;
        v31 = v14;
        v32 = v28;
        objc_msgSend(v15, "performBlockAndWait:", v29);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v10);
  }

  v16 = v26;
  if (objc_msgSend(v28, "count"))
  {
    v17 = 0;
    while (1)
    {
      v18 = v17;
      +[PLManagedAsset entityName](PLManagedAsset, "entityName", v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInterLibraryTransfer options](v27, "options");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "keysForDeDupe");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInterLibraryTransfer _loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:](v27, "_loadObjectWithEntityName:withValues:forKeyPaths:fromLibrary:error:", v19, v28, v21, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        break;
      PLInterLibraryTransferGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        -[PLInterLibraryTransfer options](v27, "options");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "keysForDeDupe");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v24;
        v39 = 2114;
        v40 = v28;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Found existing asset with %{public}@ %{public}@ but different uuid", buf, 0x16u);

      }
      if (!-[PLInterLibraryTransfer _deleteAsset:](v27, "_deleteAsset:", v17))
      {

        break;
      }
    }
  }

  return 0;
}

- (BOOL)_shouldSkipTransferWithSourceAsset:(id)a3 destinationAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v21;
  uint64_t v22;
  int v23;
  int v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[4];
  id v33;
  _BYTE *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  __int16 v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint8_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  __int16 v59;
  uint8_t v60[8];
  uint8_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t v66[4];
  uint64_t v67;
  __int16 v68;
  _BYTE v69[10];
  uint64_t v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6
    || (-[PLInterLibraryTransfer options](self, "options"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "updateExistingObjects"),
        v7,
        (v8 & 1) != 0))
  {
    *(_QWORD *)v60 = 0;
    v61 = v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__69055;
    v64 = __Block_byref_object_dispose__69056;
    v65 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__69055;
    v54 = __Block_byref_object_dispose__69056;
    v55 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke;
    v40[3] = &unk_1E3675CA8;
    v42 = &v50;
    v41 = v5;
    v43 = v60;
    v44 = &v56;
    v45 = &v46;
    objc_msgSend(v9, "performBlockAndWait:", v40);

    if (*((_WORD *)v47 + 12) != 3)
    {
      PLInterLibraryTransferGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = v51[5];
        v16 = *((unsigned __int16 *)v47 + 12);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v16;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = 3;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_FAULT, "Skipping sync of asset %{public}@ because bundleScope=%hu but only %hu is supported.", buf, 0x18u);
      }

      goto LABEL_13;
    }
    if (!v6)
    {
LABEL_19:
      v17 = 0;
      goto LABEL_20;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__69055;
    v73 = __Block_byref_object_dispose__69056;
    v74 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    objc_msgSend(v6, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    v32[1] = 3221225472;
    v32[2] = __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke_72;
    v32[3] = &unk_1E3677830;
    v34 = buf;
    v33 = v6;
    v35 = &v36;
    objc_msgSend(v11, "performBlockAndWait:", v32);

    v12 = (void *)*((_QWORD *)v61 + 5);
    if (v12 && *(_QWORD *)(*(_QWORD *)&buf[8] + 40) && objc_msgSend(v12, "compare:") != 1)
    {
      PLInterLibraryTransferGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_27:

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(buf, 8);

LABEL_13:
        v17 = 1;
LABEL_20:

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(v60, 8);

        goto LABEL_21;
      }
      v28 = v51[5];
      v29 = *((_QWORD *)v61 + 5);
      v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v66 = 138543874;
      v67 = v28;
      v68 = 2114;
      *(_QWORD *)v69 = v29;
      *(_WORD *)&v69[8] = 2114;
      v70 = v30;
      v25 = "Skipping sync of asset %{public}@ because sourceModDate=%{public}@ and destModDate=%{public}@";
      v26 = v21;
      v27 = 32;
    }
    else
    {
      -[PLInterLibraryTransfer options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "allowSavedAssetTypeChanges") & 1) != 0)
      {

LABEL_18:
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_19;
      }
      v19 = *((unsigned __int16 *)v57 + 12) == *((unsigned __int16 *)v37 + 12);

      if (v19)
        goto LABEL_18;
      PLInterLibraryTransferGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        goto LABEL_27;
      v22 = v51[5];
      v23 = *((__int16 *)v57 + 12);
      v24 = *((__int16 *)v37 + 12);
      *(_DWORD *)v66 = 138543874;
      v67 = v22;
      v68 = 1024;
      *(_DWORD *)v69 = v23;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v24;
      v25 = "Skipping sync of asset %{public}@ because sourceSavedAssetType=%hd and destSavedAssetType=%hd";
      v26 = v21;
      v27 = 24;
    }
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, v25, v66, v27);
    goto LABEL_27;
  }
  PLInterLibraryTransferGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v60 = 0;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "updateExistingObjects is NO and destination asset already exists", v60, 2u);
  }

  v17 = 1;
LABEL_21:

  return v17;
}

- (id)_sourceAttributesFromObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PLInterLibraryTransfer *v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke;
  v12[3] = &unk_1E3677530;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v12);

  v9 = v15;
  v10 = v7;

  return v10;
}

- (id)_copyObject:(id)a3 toDestinationObject:(id)a4 toLibrary:(id)a5 objectMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  PLInterLibraryTransferGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v15;
    v37 = 2114;
    v38 = v16;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "BEGIN copying source obj %{public}@ to dest %{public}@", buf, 0x16u);

  }
  -[PLInterLibraryTransfer _sourceAttributesFromObject:](self, "_sourceAttributesFromObject:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C97B20];
  objc_msgSend(v10, "entity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entityForName:inManagedObjectContext:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLInterLibraryTransfer _setAttributes:onObject:](self, "_setAttributes:onObject:", v17, v11);
LABEL_6:
    objc_msgSend(v13, "setObject:forKey:", v11, v10);
    objc_msgSend(v10, "entity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "relationshipsByName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __78__PLInterLibraryTransfer__copyObject_toDestinationObject_toLibrary_objectMap___block_invoke;
    v30[3] = &unk_1E3670210;
    v30[4] = self;
    v31 = v10;
    v25 = v11;
    v32 = v25;
    v33 = v12;
    v34 = v13;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v30);

    goto LABEL_7;
  }
  -[PLInterLibraryTransfer _createNewObjectWithEntity:attributes:inLibrary:](self, "_createNewObjectWithEntity:attributes:inLibrary:", v22, v17, v12);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_6;
  v25 = 0;
LABEL_7:
  PLInterLibraryTransferGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v27;
    v37 = 2114;
    v38 = v28;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "DONE  copying source obj %{public}@ to dest %{public}@", buf, 0x16u);

  }
  return v25;
}

- (id)_createNewObjectWithEntity:(id)a3 attributes:(id)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  PLInterLibraryTransferGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "BEGIN creating new object with entity name %{public}@", (uint8_t *)&v19, 0xCu);

  }
  v13 = objc_alloc(MEMORY[0x1E0C97B80]);
  objc_msgSend(v9, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v13, "initWithEntity:insertIntoManagedObjectContext:", v8, v14);
  -[PLInterLibraryTransfer _setAttributes:onObject:](self, "_setAttributes:onObject:", v10, v15);

  PLInterLibraryTransferGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v17;
    v21 = 2048;
    v22 = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "DONE  creating new object with entity name %{public}@: %p", (uint8_t *)&v19, 0x16u);

  }
  return v15;
}

- (BOOL)_shouldSkipRelationship:(id)a3
{
  void *v3;
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(v5, "isToMany");
  if (v6)
  {
    objc_msgSend(v5, "inverseRelationship");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isToMany") & 1) != 0)
    {
      v7 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[PLInterLibraryTransfer options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "excludedEntityNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "containsObject:", v11);

  if (v6)
    goto LABEL_5;
LABEL_6:

  return v7;
}

- (void)_copyRelationship:(id)a3 fromObject:(id)a4 toObject:(id)a5 inLibrary:(id)a6 objectMap:(id)a7
{
  id v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  id v47;
  void *v48;
  id v49;
  const __CFString *obj;
  id obja;
  id objb;
  id v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  _BYTE *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t v72[128];
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  _BYTE v75[20];
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v47 = a4;
  v13 = a5;
  v49 = a6;
  v53 = a7;
  v48 = v12;
  v14 = -[PLInterLibraryTransfer _shouldSkipRelationship:](self, "_shouldSkipRelationship:", v12);
  PLInterLibraryTransferGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("BEGIN");
    if (v14)
      v16 = CFSTR(" SKIP");
    obj = v16;
    objc_msgSend(v12, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "inverseRelationship");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isToMany"))
      v19 = CFSTR("many");
    else
      v19 = CFSTR("1");
    v46 = (uint64_t (*)(uint64_t, uint64_t))v19;
    if (objc_msgSend(v48, "isToMany"))
      v20 = CFSTR("many");
    else
      v20 = CFSTR("1");
    v45 = v20;
    objc_msgSend(v48, "destinationEntity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v47);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(_QWORD *)&buf[4] = obj;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2114;
    v74 = v46;
    *(_WORD *)v75 = 2114;
    *(_QWORD *)&v75[2] = v45;
    *(_WORD *)&v75[10] = 2114;
    *(_QWORD *)&v75[12] = v44;
    v76 = 2112;
    v77 = v22;
    v78 = 2112;
    v79 = v23;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ copying relationship %{public}@ (%{public}@:%{public}@ %{public}@) from source %@ to dest %@", buf, 0x48u);

  }
  if (!v14)
  {
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__69055;
    v70 = __Block_byref_object_dispose__69056;
    v71 = 0;
    objc_msgSend(v47, "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke;
    v62[3] = &unk_1E3676EA0;
    v25 = v47;
    v63 = v25;
    v26 = v48;
    v64 = v26;
    v65 = &v66;
    objc_msgSend(v24, "performBlockAndWait:", v62);

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obja = (id)v67[5];
    v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v59 != v28)
            objc_enumerationMutation(obja);
          v30 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v74 = __Block_byref_object_copy__69055;
          *(_QWORD *)v75 = __Block_byref_object_dispose__69056;
          *(_QWORD *)&v75[8] = 0;
          objc_msgSend(v25, "managedObjectContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke_89;
          v54[3] = &unk_1E3676EA0;
          v57 = buf;
          v55 = v25;
          v56 = v30;
          objc_msgSend(v31, "performBlockAndWait:", v54);

          objc_msgSend(v53, "objectForKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (v32)
            goto LABEL_22;
          if ((objc_msgSend(v26, "isToMany") & 1) != 0)
          {
            v33 = 0;
          }
          else
          {
            objc_msgSend(v26, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "valueForKey:", v34);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v32 = -[PLInterLibraryTransfer _copyObject:toDestinationObject:toLibrary:objectMap:](self, "_copyObject:toDestinationObject:toLibrary:objectMap:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v33, v49, v53);

          if (v32)
          {
LABEL_22:
            -[PLInterLibraryTransfer _setRelationship:origin:target:](self, "_setRelationship:origin:target:", v26, v13, v32);
            objc_msgSend(v26, "inverseRelationship");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLInterLibraryTransfer _setRelationship:origin:target:](self, "_setRelationship:origin:target:", v35, v32, v13);

          }
          _Block_object_dispose(buf, 8);

        }
        v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v27);
    }

    PLInterLibraryTransferGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v26, "name");
      objb = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "inverseRelationship");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("many");
      if (objc_msgSend(v37, "isToMany"))
        v39 = CFSTR("many");
      else
        v39 = CFSTR("1");
      if (!objc_msgSend(v26, "isToMany"))
        v38 = CFSTR("1");
      objc_msgSend(v26, "destinationEntity");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v25);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v13);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = objb;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2114;
      v74 = (uint64_t (*)(uint64_t, uint64_t))v38;
      *(_WORD *)v75 = 2114;
      *(_QWORD *)&v75[2] = v41;
      *(_WORD *)&v75[10] = 2112;
      *(_QWORD *)&v75[12] = v42;
      v76 = 2112;
      v77 = v43;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEBUG, "DONE  copying relationship %{public}@ (%{public}@:%{public}@ %{public}@) from source %@ to dest %@", buf, 0x3Eu);

    }
    _Block_object_dispose(&v66, 8);

  }
}

- (void)_setRelationship:(id)a3 origin:(id)a4 target:(id)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v13, "isToMany");
  objc_msgSend(v13, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "valueForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "addObject:", v8);
      v10 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v10, v12);

    }
  }
  else
  {
    objc_msgSend(v7, "setValue:forKey:", v8, v10);
  }

}

- (void)_setAttributes:(id)a3 onObject:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "setValue:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)_copyFilesFromSourceAsset:(id)a3 toDestinationAsset:(id)a4 objectMap:(id)a5 filesCopied:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  uint32_t v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  int HasDomainAndCode;
  NSObject *v38;
  uint64_t v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  BOOL v45;
  NSObject *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  uint64_t v56;
  id v58;
  id v59;
  id v61;
  id v62;
  id obj;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  NSObject *v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  NSObject *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v61 = a4;
  v12 = a5;
  v62 = a6;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__69055;
  v80 = __Block_byref_object_dispose__69056;
  v81 = 0;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __99__PLInterLibraryTransfer__copyFilesFromSourceAsset_toDestinationAsset_objectMap_filesCopied_error___block_invoke;
  v71[3] = &unk_1E3676EC8;
  v75 = &v76;
  v59 = v11;
  v72 = v59;
  v58 = v12;
  v73 = v58;
  v64 = v13;
  v74 = v64;
  objc_msgSend(v14, "performBlockAndWait:", v71);

  objc_msgSend(v61, "modernResources");
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v90, 16);
  if (!v15)
    goto LABEL_31;
  v16 = *(_QWORD *)v68;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v68 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
      objc_msgSend(v64, "objectForKey:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileURL");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19)
        v22 = v20 == 0;
      else
        v22 = 1;
      if (v22)
      {
        if (!(v19 | v20))
        {
          PLInterLibraryTransferGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            goto LABEL_29;
          *(_DWORD *)buf = 138412290;
          v85 = (uint64_t)v18;
          v27 = v25;
          v28 = OS_LOG_TYPE_DEBUG;
          v29 = "skipping resource: both source and dest file URLs are nil for %@";
          v30 = 12;
          goto LABEL_22;
        }
        if (!v20
          || (-[PLInterLibraryTransfer options](self, "options"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v23, "ignoreMissingSourceFileURLs"),
              v23,
              !v24))
        {
          PLInterLibraryTransferGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v47 = v77[5];
            *(_DWORD *)buf = 138543874;
            v85 = v47;
            v86 = 2112;
            v87 = v19;
            v88 = 2112;
            v89 = v21;
            _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "copy file URL missing for asset %{public}@: source %@ dest %@", buf, 0x20u);
          }

          v48 = CFSTR("destination");
          if (!v19)
            v48 = CFSTR("source");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ file URL missing for asset %@"), v48, v77[5], v58);
          v25 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)MEMORY[0x1E0CB35C8];
          v82 = *MEMORY[0x1E0CB2938];
          v83 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 70002, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (a7)
            *a7 = objc_retainAutorelease(v51);

          goto LABEL_49;
        }
        PLInterLibraryTransferGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = v77[5];
          *(_DWORD *)buf = 138543618;
          v85 = v26;
          v86 = 2112;
          v87 = (uint64_t)v21;
          v27 = v25;
          v28 = OS_LOG_TYPE_ERROR;
          v29 = "ignoring sourceFileURL missing for asset %{public}@, dest %@";
          v30 = 22;
LABEL_22:
          _os_log_impl(&dword_199541000, v27, v28, v29, buf, v30);
        }
      }
      else
      {
        v66 = 0;
        v31 = -[PLInterLibraryTransfer _copyFileFrom:to:error:](self, "_copyFileFrom:to:error:", v19, v20, &v66);
        v32 = v66;
        v25 = v32;
        if (v31)
        {
          objc_msgSend(v62, "addObject:", v21);
          if ((objc_msgSend(v18, "copyPurgeabilityFromFileURL:", v19) & 1) != 0)
            goto LABEL_29;
          PLInterLibraryTransferGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "fileURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v85 = (uint64_t)v35;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Failed to update purgeability of resource at %@", buf, 0xCu);

          }
        }
        else
        {
          -[PLInterLibraryTransfer options](self, "options");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v36, "ignoreMissingSourceFiles"))
          {

LABEL_45:
            PLInterLibraryTransferGetLog();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v85 = v19;
              v86 = 2112;
              v87 = (uint64_t)v21;
              v88 = 2112;
              v89 = v25;
              _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "copy file from %@ to %@ failed: %@", buf, 0x20u);
            }

            if (a7)
              *a7 = objc_retainAutorelease(v25);
LABEL_49:

            goto LABEL_50;
          }
          HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();

          if (!HasDomainAndCode)
            goto LABEL_45;
          PLInterLibraryTransferGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = v77[5];
            *(_DWORD *)buf = 138543618;
            v85 = v39;
            v86 = 2112;
            v87 = v19;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_INFO, "      skipped missing source file for asset %{public}@ URL: %@", buf, 0x16u);
          }

          v33 = v25;
          v25 = 0;
        }

      }
LABEL_29:

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v90, 16);
    if (v15)
      continue;
    break;
  }
LABEL_31:

  v65 = 0;
  v40 = -[PLInterLibraryTransfer _copyMasterThumbnailFrom:toDestinationAsset:filesCopied:error:](self, "_copyMasterThumbnailFrom:toDestinationAsset:filesCopied:error:", v59, v61, v62, &v65);
  v41 = v65;
  v42 = v41;
  if (a7)
    *a7 = objc_retainAutorelease(v41);

  if (v40)
  {
    objc_msgSend(v61, "persistMetadataToFilesystem");
    PLInterLibraryTransferGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v44 = v77[5];
      *(_DWORD *)buf = 138543362;
      v85 = v44;
      _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "DONE  copying files from source asset %{public}@", buf, 0xCu);
    }
    v45 = 1;
  }
  else
  {
LABEL_50:
    PLInterLibraryTransferGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    v55 = a7;
    if (v54)
    {
      v56 = v77[5];
      if (a7)
        v55 = *a7;
      *(_DWORD *)buf = 138543618;
      v85 = v56;
      v86 = 2112;
      v87 = (uint64_t)v55;
      _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "ERROR copying files from source asset %{public}@ %@", buf, 0x16u);
    }
    v45 = 0;
  }

  _Block_object_dispose(&v76, 8);
  return v45;
}

- (BOOL)_copyMasterThumbnailFrom:(id)a3 toDestinationAsset:(id)a4 filesCopied:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__69055;
  v42 = __Block_byref_object_dispose__69056;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__69055;
  v36 = __Block_byref_object_dispose__69056;
  v37 = 0;
  objc_msgSend(v10, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__PLInterLibraryTransfer__copyMasterThumbnailFrom_toDestinationAsset_filesCopied_error___block_invoke;
  v28[3] = &unk_1E3677830;
  v30 = &v32;
  v14 = v10;
  v29 = v14;
  v31 = &v38;
  objc_msgSend(v13, "performBlockAndWait:", v28);

  if (v39[5])
  {
    objc_msgSend(v11, "masterThumbnailFileURLIfLocal");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v39[5];
    v27 = 0;
    v17 = -[PLInterLibraryTransfer _copyFileFrom:to:error:](self, "_copyFileFrom:to:error:", v16, v15, &v27);
    v18 = v27;
    if (v17)
    {
      objc_msgSend(v12, "addObject:", v15);
      v19 = 1;
      goto LABEL_10;
    }
    PLInterLibraryTransferGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = v39[5];
      *(_DWORD *)buf = 138412802;
      v47 = v25;
      v48 = 2112;
      v49 = v15;
      v50 = 2112;
      v51 = v18;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "ERROR copy master thumbnail file from %@ to %@ failed: %@", buf, 0x20u);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Master thumbnail file URL missing for asset %@"), v33[5]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 70002, v22);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    PLInterLibraryTransferGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = v33[5];
      *(_DWORD *)buf = 138543362;
      v47 = v23;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "ERROR missing master thumbnail URL from source asset %{public}@", buf, 0xCu);
    }
  }
  v19 = 0;
LABEL_10:

  if (a6)
    *a6 = objc_retainAutorelease(v18);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19;
}

- (BOOL)_copyFileFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSFileManager *fileManager;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  NSFileManager *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSFileManager *v37;
  _BOOL4 v38;
  id v39;
  NSFileManager *v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLInterLibraryTransferGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v11;
    v54 = 2112;
    v55 = v12;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "BEGIN copying file from %@ to %@", buf, 0x16u);

  }
  fileManager = self->_fileManager;
  objc_msgSend(v9, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByDeletingLastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v16 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](fileManager, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v51);
  v17 = v51;

  if (!v16)
  {
    PLInterLibraryTransferGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v17;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "ERROR creating intermediate directories: %@", buf, 0xCu);
    }

    if (a5)
    {
      v20 = 0;
      v32 = 0;
      *a5 = objc_retainAutorelease(v17);
      goto LABEL_33;
    }
    v20 = 0;
    goto LABEL_21;
  }
  v18 = self->_fileManager;
  v50 = 0;
  v19 = -[NSFileManager copyItemAtURL:toURL:error:](v18, "copyItemAtURL:toURL:error:", v8, v9, &v50);
  v20 = v50;
  if (!v19)
  {
    if (PLErrorOrUnderlyingErrorHasDomainAndCode())
    {
      v59[0] = *MEMORY[0x1E0C99998];
      v21 = v59[0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resourceValuesForKeys:error:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resourceValuesForKeys:error:", v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v26) = objc_msgSend(v24, "isEqualToNumber:", v27);
      PLInterLibraryTransferGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if ((_DWORD)v26)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v30;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "File already exists at destination path %@", buf, 0xCu);

        }
        goto LABEL_30;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v53 = v27;
        v54 = 2114;
        v55 = v24;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_INFO, "File sizes don't match source=%{public}@ dest=%{public}@. Will overwrite.", buf, 0x16u);
      }

      v37 = self->_fileManager;
      v49 = 0;
      v38 = -[NSFileManager removeItemAtURL:error:](v37, "removeItemAtURL:error:", v9, &v49);
      v39 = v49;
      if (v38)
      {

        v40 = self->_fileManager;
        v48 = 0;
        v41 = -[NSFileManager copyItemAtURL:toURL:error:](v40, "copyItemAtURL:toURL:error:", v8, v9, &v48);
        v20 = v48;
      }
      else
      {
        PLInterLibraryTransferGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "path");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v53 = v43;
          v54 = 2112;
          v55 = v39;
          _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Unable to remove file for overwrite at path %@ error %@", buf, 0x16u);

        }
        v41 = 0;
      }

      v33 = v41;
      if (v41)
        goto LABEL_30;
    }
    else
    {
      v33 = 0;
    }
    PLInterLibraryTransferGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = v35;
      v54 = 2112;
      v55 = v36;
      v56 = 2112;
      v57 = v20;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "ERROR copying file from %@ to %@: %@", buf, 0x20u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v20);
    if (v33)
      goto LABEL_30;
LABEL_21:
    v32 = 0;
    goto LABEL_33;
  }
LABEL_30:
  PLInterLibraryTransferGetLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v45;
    v54 = 2112;
    v55 = v46;
    _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEBUG, "DONE  copying file from %@ to %@", buf, 0x16u);

  }
  v32 = 1;
LABEL_33:

  return v32;
}

- (void)_transferThumbnailsForSourceAsset:(id)a3 toDestinationAsset:(id)a4 filesCopied:(id)a5
{
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  PLTableThumbnailMigrator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;
  __CFString *v24;
  int v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  v8 = objc_msgSend(v6, "hasMasterThumb");
  v9 = objc_msgSend(v6, "hasTableThumbs");
  v10 = objc_msgSend(v7, "count");

  objc_msgSend(v6, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLInterLibraryTransferGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v25 = 138544386;
    v26 = v11;
    v27 = 1024;
    v28 = v8;
    v29 = 1024;
    v30 = v9;
    v31 = 2048;
    v32 = objc_msgSend(v6, "effectiveThumbnailIndex");
    v33 = 1024;
    v34 = v10 == 1;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Asset %{public}@ hasMasterThumb:%d, hasTableThumbs:%d effectiveThumbnailIndex:%tu hasSourceMasterThumbOnly:%d", (uint8_t *)&v25, 0x28u);
  }

  if ((v9 | v8) == 1)
  {
    if (v9)
      objc_msgSend(v6, "setEffectiveThumbnailIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if (v10 == 1)
    {
      PLInterLibraryTransferGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v25 = 138543362;
        v26 = v11;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Building table thumbs for asset %{public}@", (uint8_t *)&v25, 0xCu);
      }

      v14 = objc_alloc_init(PLTableThumbnailMigrator);
      v15 = (void *)MEMORY[0x1E0D732F8];
      objc_msgSend(v6, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pathManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tableThumbnailFormatsForConfigPhase:withPathManager:", 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLTableThumbnailMigrator rebuildTableThumbForAsset:inLibrary:toTableFormats:](v14, "rebuildTableThumbForAsset:inLibrary:toTableFormats:", v6, v19, v18);

    }
    else
    {
      objc_msgSend(v6, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
    }
    PLInterLibraryTransferGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v6, "hasMasterThumb");
      v22 = objc_msgSend(v6, "hasTableThumbs");
      v23 = objc_msgSend(v6, "effectiveThumbnailIndex");
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = CFSTR("NSNotFound");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "effectiveThumbnailIndex"));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v25 = 138544130;
      v26 = v11;
      v27 = 1024;
      v28 = v21;
      v29 = 1024;
      v30 = v22;
      v31 = 2114;
      v32 = (uint64_t)v24;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "DONE  rebuilding thumbnails for asset %{public}@: hasMasterThumb:%d hasTableThumbs:%d effectiveThumbnailIndex:%{public}@", (uint8_t *)&v25, 0x22u);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)

    }
  }

}

- (void)_validateSourceAsset:(id)a3 destinationAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAsset"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 889, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationAsset"));

LABEL_3:
  objc_msgSend(v9, "mainFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__69055;
    v33 = __Block_byref_object_dispose__69056;
    v34 = 0;
    objc_msgSend(v7, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __64__PLInterLibraryTransfer__validateSourceAsset_destinationAsset___block_invoke;
    v26 = &unk_1E3677C68;
    v28 = &v29;
    v27 = v7;
    objc_msgSend(v11, "performBlockAndWait:", &v23);

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "directory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Destination objectID: %@, UUID: %@, directory: %@, filename: %@"), v13, v14, v15, v16, v23, v24, v25, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLInterLibraryTransferGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19 = v30[5];
      *(_DWORD *)buf = 138543618;
      v36 = v19;
      v37 = 2114;
      v38 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_FAULT, "Unexpected nil destination mainFileURL when transferring assets. %{public}@ %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected nil destination mainFileURL when transferring assets. %@ %@"), v30[5], v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: Unexpected nil destination mainFileURL when transferring assets"), v20);

    _Block_object_dispose(&v29, 8);
  }

}

- (void)_validateSourcePerson:(id)a3 destinationPerson:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 912, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourcePerson"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 913, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationPerson"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:

}

- (void)_validateSourceFaceCrop:(id)a3 destinationFaceCrop:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 918, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceFaceCrop"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInterLibraryTransfer.m"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationFaceCrop"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:

}

- (PLPhotoLibraryBundle)sourceBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PLPhotoLibraryBundle)destinationBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestinationBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLPhotoLibrary)sourceLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourceLibrary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PLPhotoLibrary)destinationLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDestinationLibrary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLInterLibraryTransferOptions)options
{
  return (PLInterLibraryTransferOptions *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationLibrary, 0);
  objc_storeStrong((id *)&self->_sourceLibrary, 0);
  objc_storeStrong((id *)&self->_destinationBundle, 0);
  objc_storeStrong((id *)&self->_sourceBundle, 0);
}

void __64__PLInterLibraryTransfer__validateSourceAsset_destinationAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "directory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Source objectID: %@, UUID: %@, directory: %@, filename: %@, isDeleted: isDeleted %@"), v11, v3, v4, v5, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __88__PLInterLibraryTransfer__copyMasterThumbnailFrom_toDestinationAsset_filesCopied_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "masterThumbnailFileURLIfLocal");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __99__PLInterLibraryTransfer__copyFilesFromSourceAsset_toDestinationAsset_objectMap_filesCopied_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  PLInterLibraryTransferGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "BEGIN copying files from source asset %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "modernResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v13, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

void __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "isToMany"))
  {
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

LABEL_6:
  PLInterLibraryTransferGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "destinationEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v13 = 138543618;
    v14 = v11;
    v15 = 2048;
    v16 = v12;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "        %{public}@: %tu", (uint8_t *)&v13, 0x16u);

  }
}

void __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke_89(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectWithID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __78__PLInterLibraryTransfer__copyObject_toDestinationObject_toLibrary_objectMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copyRelationship:fromObject:toObject:inLibrary:objectMap:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke_2;
  v5[3] = &unk_1E36701E8;
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "excludedAttributeNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "valueForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
}

uint64_t __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "savedAssetType");
  result = objc_msgSend(*(id *)(a1 + 32), "bundleScope");
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke_72(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "savedAssetType");
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __85__PLInterLibraryTransfer__dedupedDestinationAssetWithSourceAsset_destinationLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v5 = (id)v2;
  if (v2)
  {
    objc_msgSend(v3, "addObject:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __39__PLInterLibraryTransfer__deleteAsset___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowDeleteOfSavedAssetTypes");
  objc_msgSend(*(id *)(a1 + 40), "savedAssetType");
  v3 = PLValidatedSavedAssetTypeApplies();

  if (v3)
  {
    PLInterLibraryTransferGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Deleting asset %{public}@ from %@", (uint8_t *)&v9, 0x16u);

    }
    v7 = *(void **)(a1 + 40);
    +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("InterLibraryTransfer: Delete existing duplicate asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteWithReason:", v8);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke_2;
    v15[3] = &unk_1E36701C0;
    v16 = *(id *)(a1 + 32);
    v6 = v4;
    v17 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v7);
    objc_msgSend(v3, "setFetchLimit:", 1);
    objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v3, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    objc_autoreleasePoolPop(v2);
  }
}

void __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

void __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  __int128 *p_buf;
  uint64_t v46;
  void *v47;
  uint8_t v48[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  PLInterLibraryTransferGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Starting copyObject phase for face crop %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:](PLMomentGenerationDataManager, "setManagedObjectContextMomentarilyBlessed:", v4);

  v5 = objc_msgSend(*(id *)(a1 + 40), "_copyObject:toDestinationObject:toLibrary:objectMap:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 56));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0CB2938];
    v58[0] = CFSTR("_copyObject failed for face crop");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 70001, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  PLInterLibraryTransferGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Finished copyObject phase for face crop %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__69055;
  v55 = __Block_byref_object_dispose__69056;
  v56 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[2] = __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_41;
  v43[3] = &unk_1E3677C68;
  v15 = *(void **)(a1 + 48);
  v16 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v43[1] = 3221225472;
  v44 = v15;
  p_buf = &buf;
  objc_msgSend(v16, "performBlockAndWait:", v43);
  v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    PLInterLibraryTransferGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v19, "personUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v48 = 138543618;
      v49 = v21;
      v50 = 2114;
      v51 = v22;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "transferFaceCropWithUuid:%{public}@ associating with person %{public}@", v48, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPerson:", v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "excludedEntityNames");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDetectedFace entityName](PLDetectedFace, "entityName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "containsObject:", v24);

    if (v25)
    {
      PLInterLibraryTransferGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v48 = 138543362;
        v49 = v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "transferFaceCropWithUuid:%{public}@ marking face crop dirty", v48, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setState:", 0);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    PLInterLibraryTransferGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v48 = 138543618;
      v49 = v29;
      v50 = 2114;
      v51 = v30;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "transferFaceCropWithUuid:%{public}@ no destPerson found with uuid %{public}@", v48, 0x16u);
    }

    v31 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no destPerson found with uuid %@"), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

  }
  v37 = *(void **)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(v37, "_validateSourceFaceCrop:destinationFaceCrop:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    objc_msgSend(v37, "options");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "skipContextSave");

    if ((v39 & 1) == 0)
    {
      PLInterLibraryTransferGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v48 = 138543362;
        v49 = v41;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "transferFaceCropWithUuid:%{public}@ failed, rolling back destination library", v48, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "rollback");

    }
  }

  _Block_object_dispose(&buf, 8);
}

void __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_47(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  v4 = v2[4];
  v8 = 0;
  objc_msgSend(v2, "_loadFaceCropWithUuid:fromLibrary:error:", v3, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    PLInterLibraryTransferGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Transfer verification failed with error: %@", buf, 0xCu);
    }

  }
}

void __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_41(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "person");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personUUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  __int128 *p_buf;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t v46[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int128 buf;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  PLInterLibraryTransferGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Starting copyObject phase for person %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:](PLMomentGenerationDataManager, "setManagedObjectContextMomentarilyBlessed:", v4);

  v5 = objc_msgSend(*(id *)(a1 + 40), "_copyObject:toDestinationObject:toLibrary:objectMap:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 56));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2938];
    v56[0] = CFSTR("_copyObject failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 70001, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  PLInterLibraryTransferGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Finished copyObject phase for person %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "verifiedType") == -2)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__69055;
    v53 = __Block_byref_object_dispose__69056;
    v54 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__69055;
    v42 = __Block_byref_object_dispose__69056;
    v43 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[2] = __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_35;
    v34[3] = &unk_1E3677830;
    v15 = *(void **)(a1 + 48);
    v16 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v34[1] = 3221225472;
    p_buf = &buf;
    v35 = v15;
    v37 = &v38;
    objc_msgSend(v16, "performBlockAndWait:", v34);
    PLInterLibraryTransferGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = v39[5];
      *(_DWORD *)v46 = 138543618;
      v47 = v18;
      v48 = 2114;
      v49 = v19;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Person %{public}@ is a tombstone. Will copy merge target person %{public}@", v46, 0x16u);
    }

    v20 = v39[5];
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "_loadPersonWithUuid:fromLibrary:error:", v20, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(*(id *)(a1 + 40), "_copyObject:toDestinationObject:toLibrary:objectMap:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v21, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 56));

      if (v22)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setMergeTargetPerson:", v22);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2938];
        v45 = CFSTR("_copyObject failed for merge target person");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 70001, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

      }
    }

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&buf, 8);

  }
  v28 = *(void **)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(v28, "_validateSourcePerson:destinationPerson:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    objc_msgSend(v28, "options");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "skipContextSave");

    if ((v30 & 1) == 0)
    {
      PLInterLibraryTransferGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = *(_QWORD *)(a1 + 32);
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v32;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "transferPersonWithUuid:%{public}@ failed, rolling back destination library asset", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "rollback");

    }
  }
}

void __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_38(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  v4 = v2[4];
  v8 = 0;
  objc_msgSend(v2, "_loadPersonWithUuid:fromLibrary:error:", v3, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    PLInterLibraryTransferGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Transfer verification failed with error: %@", buf, 0xCu);
    }

  }
}

void __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "mergeTargetPerson");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "personUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  PLInterLibraryTransferGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v37 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Starting copyObject phase for asset %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:](PLMomentGenerationDataManager, "setManagedObjectContextMomentarilyBlessed:", v4);

  v5 = objc_msgSend(*(id *)(a1 + 40), "_copyObject:toDestinationObject:toLibrary:objectMap:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 56));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D74498];
    v34 = *MEMORY[0x1E0CB2938];
    v35 = CFSTR("_copyObject failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 70001, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  PLInterLibraryTransferGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v37 = v15;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Finished copyObject phase for asset %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "pathManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "shouldUseFileIdentifierForBundleScope:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "bundleScope")) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldUseFileIdentifierForBundleScope:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "bundleScope"));

  if ((v18 & 1) == 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), CFSTR("PLInterLibraryTransfer.m"), 138, CFSTR("Can only perform inter library transfer for asset that is located in a UBF based bundle scope in both source and destination library"));

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    goto LABEL_15;
  v20 = *(void **)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 48);
  v22 = *(_QWORD *)(a1 + 64);
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v24 = *(_QWORD *)(a1 + 56);
  v33 = 0;
  v25 = objc_msgSend(v20, "_copyFilesFromSourceAsset:toDestinationAsset:objectMap:filesCopied:error:", v21, v23, v24, v22, &v33);
  v26 = v33;
  v27 = v33;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v25;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v26);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_validateSourceAsset:destinationAsset:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 40), "_transferThumbnailsForSourceAsset:toDestinationAsset:filesCopied:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 64));
  }
  else
  {
LABEL_15:
    objc_msgSend(*(id *)(a1 + 40), "options");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "skipContextSave");

    if ((v29 & 1) == 0)
    {
      PLInterLibraryTransferGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v37 = v31;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "transferAssetWithUuid:%{public}@ failed, rolling back destination library asset", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "managedObjectContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "rollback");

    }
  }
}

void __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke_34(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  v4 = v2[4];
  v8 = 0;
  objc_msgSend(v2, "_loadAssetWithUuid:fromLibrary:error:", v3, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    PLInterLibraryTransferGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Transfer verification failed with error: %@", buf, 0xCu);
    }

  }
}

@end
