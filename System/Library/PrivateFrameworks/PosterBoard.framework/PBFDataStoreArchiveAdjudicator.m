@implementation PBFDataStoreArchiveAdjudicator

- (PBFDataStoreArchiveAdjudicator)initWithDataStoreBaseURL:(id)a3 archiveBaseURL:(id)a4
{
  id v6;
  id v7;
  PBFDataStoreArchiveAdjudicator *v8;
  uint64_t v9;
  NSURL *dataStoreBaseURL;
  uint64_t v11;
  NSURL *archiveBaseURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PBFDataStoreArchiveAdjudicator;
  v8 = -[PBFDataStoreArchiveAdjudicator init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dataStoreBaseURL = v8->_dataStoreBaseURL;
    v8->_dataStoreBaseURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    archiveBaseURL = v8->_archiveBaseURL;
    v8->_archiveBaseURL = (NSURL *)v11;

  }
  return v8;
}

- (NSArray)archives
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_archiveBaseURL, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

uint64_t __42__PBFDataStoreArchiveAdjudicator_archives__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isFileURL"))
  {
    objc_msgSend(v2, "pathExtension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("pbds"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PBFDataStoreArchiveMetadata *__42__PBFDataStoreArchiveAdjudicator_archives__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PBFDataStoreArchiveMetadata *v3;

  v2 = a2;
  v3 = -[PBFDataStoreArchiveMetadata initWithURL:]([PBFDataStoreArchiveMetadata alloc], "initWithURL:", v2);

  return v3;
}

uint64_t __42__PBFDataStoreArchiveAdjudicator_archives__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSArray)archiveNames
{
  void *v2;
  void *v3;

  -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __46__PBFDataStoreArchiveAdjudicator_archiveNames__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "archiveURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)archiveForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PBFDataStoreArchiveAdjudicator_archiveForName___block_invoke;
  v9[3] = &unk_1E86F5A98;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__PBFDataStoreArchiveAdjudicator_archiveForName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "archiveURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (id)archiveDataStoreVersion:(unint64_t)a3 toURL:(id)a4 options:(id)a5 removeAfterSuccess:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PBFDataStoreArchiveMetadata *v15;
  PBFDataStoreArchiver *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v7 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", self->_dataStoreBaseURL, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", 0))
  {
    v16 = -[PBFDataStoreArchiver initWithDataStoreAtURL:]([PBFDataStoreArchiver alloc], "initWithDataStoreAtURL:", v14);
    -[PBFDataStoreArchiver setOptions:](v16, "setOptions:", v12);
    v22 = 0;
    v17 = -[PBFDataStoreArchiver archiveToFileAtURL:error:](v16, "archiveToFileAtURL:error:", v11, &v22);
    v18 = v22;
    PBFLogMigration();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v24 = a3;
        v25 = 2114;
        v26 = v11;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "Archived data store version %lu to %{public}@", buf, 0x16u);
      }

      if (v7)
        objc_msgSend(v13, "removeItemAtURL:error:", v14, 0);
      v15 = -[PBFDataStoreArchiveMetadata initWithURL:]([PBFDataStoreArchiveMetadata alloc], "initWithURL:", v11);
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[PBFDataStoreArchiveAdjudicator archiveDataStoreVersion:toURL:options:removeAfterSuccess:error:].cold.1((uint64_t)v18, a3, v20);

      v15 = 0;
    }

  }
  return v15;
}

- (id)archiveDataStoreVersion:(unint64_t)a3 name:(id)a4 options:(id)a5 removeAfterSuccess:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  NSURL *archiveBaseURL;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a6;
  archiveBaseURL = self->_archiveBaseURL;
  v13 = (void *)MEMORY[0x1E0C99D68];
  v14 = a5;
  v15 = a4;
  objc_msgSend(v13, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _PBFArchiveBuildNewFileName(v15, a3, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL URLByAppendingPathComponent:](archiveBaseURL, "URLByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFDataStoreArchiveAdjudicator archiveDataStoreVersion:toURL:options:removeAfterSuccess:error:](self, "archiveDataStoreVersion:toURL:options:removeAfterSuccess:error:", a3, v19, v14, v8, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)deleteArchive:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "archiveURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", a4);

  if (!v8)
    goto LABEL_6;
  -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if ((v10 & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v17[0] = CFSTR("no idea what this data store is");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "archiveURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v11, "removeItemAtURL:error:", v12, a4);

LABEL_7:
  return (char)a4;
}

- (BOOL)restoreArchive:(id)a3 backupExistingDataStoreIfPossible:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PBFDataStoreUnarchiver *v23;
  BOOL v24;
  void *v25;
  void *v26;
  const __CFString **v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "archiveURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", a5);

    if (v11)
    {
      -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v9);

      if ((v13 & 1) != 0)
      {
        v14 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
        v15 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
        v16 = objc_msgSend(v9, "version");
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", self->_dataStoreBaseURL, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFDataStoreArchiveAdjudicator archiveDataStoreVersion:name:options:removeAfterSuccess:error:](self, "archiveDataStoreVersion:name:options:removeAfterSuccess:error:", v15, CFSTR("BackupExistingDataStore"), 0, 1, a5);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
        {
          if (v16 >= v14 && v16 <= v15)
          {
            v32 = (void *)v18;
            do
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", self->_dataStoreBaseURL, v14);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "removeItemAtURL:error:", v20, 0);

              ++v14;
            }
            while (v14 <= v15);
            objc_msgSend(v9, "archiveURL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[PBFDataStoreUnarchiver initWithArchivedDataStoreURL:]([PBFDataStoreUnarchiver alloc], "initWithArchivedDataStoreURL:", v22);
            -[PBFDataStoreUnarchiver setRemapFocusConfigurations:](v23, "setRemapFocusConfigurations:", 1);
            if (-[PBFDataStoreUnarchiver unarchiveToDirectoryAtURL:error:](v23, "unarchiveToDirectoryAtURL:error:", v17, a5))
            {

              v19 = v32;
              if (!a4)
                -[PBFDataStoreArchiveAdjudicator deleteArchive:error:](self, "deleteArchive:error:", v32, 0);
              v24 = 1;
              goto LABEL_23;
            }
            v19 = v32;
            -[PBFDataStoreArchiveAdjudicator restoreArchive:backupExistingDataStoreIfPossible:error:](self, "restoreArchive:backupExistingDataStoreIfPossible:error:", v32, 0, 0);

          }
          if (!*a5)
          {
            v29 = (void *)MEMORY[0x1E0CB35C8];
            v33 = *MEMORY[0x1E0CB2D68];
            v34 = CFSTR("unknown error unarchiving data store");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "pbf_generalErrorWithCode:userInfo:", 1, v30);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        v24 = 0;
LABEL_23:

        goto LABEL_24;
      }
      if (a5)
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D68];
        v36 = CFSTR("no idea what this data store is");
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v36;
        v28 = &v35;
        goto LABEL_17;
      }
    }
  }
  else if (a5)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D68];
    v38[0] = CFSTR("No archive was specified.");
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = (const __CFString **)v38;
    v28 = &v37;
LABEL_17:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pbf_generalErrorWithCode:userInfo:", 1, v17);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  v24 = 0;
LABEL_25:

  return v24;
}

- (BOOL)markArchivesAsPurgable:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "archiveURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v10, "pbf_setPurgable:error:", 1, &v22);
        v11 = v22;
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
          PBFLogMigration();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v10;
            v31 = 2114;
            v32 = v11;
            _os_log_error_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_ERROR, "*FAILED* to mark archived data store @ %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          PBFLogMigration();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "Marked archived data store @ %{public}@ as purgable", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "count");
  v14 = v13;
  if (a3 && v13)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v28[0] = CFSTR("unknown error unarchiving data store");
    v17 = *MEMORY[0x1E0CB2F70];
    v27[0] = v16;
    v27[1] = v17;
    v18 = (void *)objc_msgSend(v4, "copy");
    v28[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 1, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14 == 0;
}

- (BOOL)removeArchives:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PBFDataStoreArchiveAdjudicator archives](self, "archives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "archiveURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v11, "removeItemAtURL:error:", v10, &v22);
        v12 = v22;

        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
          PBFLogMigration();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v10;
            v31 = 2114;
            v32 = v12;
            _os_log_error_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_ERROR, "*FAILED* to remove archived data store @ %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          PBFLogMigration();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "Deleted archived data store @ %{public}@ ", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }

  v14 = objc_msgSend(v4, "count");
  if (a3 && v14)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v28[0] = CFSTR("unknown error removing archived data data stores");
    v17 = *MEMORY[0x1E0CB2F70];
    v27[0] = v16;
    v27[1] = v17;
    v18 = (void *)objc_msgSend(v4, "copy");
    v28[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 1, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

- (NSURL)dataStoreBaseURL
{
  return self->_dataStoreBaseURL;
}

- (NSURL)archiveBaseURL
{
  return self->_archiveBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveBaseURL, 0);
  objc_storeStrong((id *)&self->_dataStoreBaseURL, 0);
}

- (void)archiveDataStoreVersion:(os_log_t)log toURL:options:removeAfterSuccess:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "Unable to archive data store version %lu: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
