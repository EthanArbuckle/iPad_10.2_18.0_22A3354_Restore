@implementation PBFPosterExtensionDataStoreMigrator

- (PBFPosterExtensionDataStoreMigrator)initWithBaseURL:(id)a3
{
  id v4;
  PBFPosterExtensionDataStoreMigrator *v5;
  void *v6;
  uint64_t v7;
  NSURL *baseURL;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBFPosterExtensionDataStoreMigrator;
  v5 = -[PBFPosterExtensionDataStoreMigrator init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "standardizedURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v7;

    v5->_shouldCleanupAfterMigration = 0;
  }

  return v5;
}

- (BOOL)validateDataStoreIntegrity:(id *)a3
{
  unint64_t v5;
  void *v6;

  v5 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v6, v5, a3);

  return (char)a3;
}

- (BOOL)isDataStoreUpToDateForCurrentVersion
{
  unint64_t v3;
  void *v4;
  void *v5;
  PBFPosterExtensionDataStoreSQLiteDatabase *v6;
  BOOL v7;

  v3 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v4, v3, 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:]([PBFPosterExtensionDataStoreSQLiteDatabase alloc], "initWithURL:options:error:", v5, 4, 0);
    v7 = -[PBFPosterExtensionDataStoreSQLiteDatabase version](v6, "version") == 2;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)migrateDataStoreToCurrentVersion:(id *)a3
{
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  char v25;
  NSObject *v26;
  int64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  if (!-[PBFPosterExtensionDataStoreMigrator isDataStoreUpToDateForCurrentVersion](self, "isDataStoreUpToDateForCurrentVersion"))
  {
    v6 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
    v7 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
    -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreVersionContainingURLForBaseURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v11, 0);

    if (!v12)
    {
LABEL_6:
      if (-[PBFPosterExtensionDataStoreMigrator isDataStoreUpToDateForCurrentVersion](self, "isDataStoreUpToDateForCurrentVersion"))
      {
        v5 = 2;
LABEL_30:

        return v5;
      }
      v20 = -[PBFPosterExtensionDataStoreMigrator _mostUpToDateValidDataStoreToMigrateFrom](self, "_mostUpToDateValidDataStoreToMigrateFrom");
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v21 = v6;
      else
        v21 = v20;
      v22 = (void *)MEMORY[0x1D17A3580]();
      v29 = 0;
      v23 = +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:](PBFPosterExtensionDataStoreMigrator, "migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:", v8, v21, v7, -[PBFPosterExtensionDataStoreMigrator shouldCleanupAfterMigration](self, "shouldCleanupAfterMigration"), &v29);
      v19 = v29;
      objc_autoreleasePoolPop(v22);
      if (v23)
      {
        v5 = 4;
      }
      else
      {
        v5 = 0;
        if (a3 && v19)
        {
          v5 = 0;
          *a3 = objc_retainAutorelease(v19);
        }
      }
LABEL_29:

      goto LABEL_30;
    }
    v28 = v7;
    v13 = *MEMORY[0x1E0C99940];
    v14 = *MEMORY[0x1E0C99A10];
    v35[0] = *MEMORY[0x1E0C99938];
    v35[1] = v14;
    v36[0] = v13;
    v36[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = 0;
    v16 = objc_msgSend(v9, "pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues:URLsNotConformingToAttributes:error:", v15, &v32, &v31);
    v17 = v32;
    v18 = v31;
    v19 = v18;
    if ((v16 & 1) != 0)
    {
LABEL_5:

      v7 = v28;
      goto LABEL_6;
    }
    if (v18)
    {
      PBFLogMigration();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStoreMigrator migrateDataStoreToCurrentVersion:].cold.2();
    }
    else
    {
      v30 = 0;
      v25 = objc_msgSend(v8, "pbf_recursivelyUpdateResourceValues:error:", v15, &v30);
      v19 = v30;
      PBFLogMigration();
      v26 = objc_claimAutoreleasedReturnValue();
      v24 = v26;
      if ((v25 & 1) != 0)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v8;
          _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_INFO, "Success updating file attributes for URL '%{public}@'", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[PBFPosterExtensionDataStoreMigrator migrateDataStoreToCurrentVersion:].cold.1();
      }
    }

    if (a3 && v19)
    {
      *a3 = objc_retainAutorelease(v19);
    }
    else if (!v19)
    {
      goto LABEL_5;
    }

    v5 = 1;
    goto LABEL_29;
  }
  return 3;
}

- (unint64_t)_mostUpToDateValidDataStoreToMigrateFrom
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
  v4 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
  if (v4 < v3)
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = v4;
    while ((_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v2, v5, 0) & 1) == 0)
    {
      if (--v5 < v3)
        goto LABEL_5;
    }
  }

  return v5;
}

- (NSIndexSet)availableDataStoreVersions
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_opt_new();
  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
  v6 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
  if (v6 >= v5)
  {
    v7 = v6;
    do
    {
      if (_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v4, v7, 0))
        objc_msgSend(v3, "addIndex:", v7);
      --v7;
    }
    while (v7 >= v5);
  }

  return (NSIndexSet *)v3;
}

- (void)removeDataStoresBeforeCurrentDataStoreVersion
{
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled"))
  {
    PBFLogMigration();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "Keynote mode; not cleaning up old data stores.", buf, 2u);
    }

  }
  else
  {
    v6 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
    v7 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion")
       - 1;
    if (v7 >= v6)
    {
      *(_QWORD *)&v8 = 138543618;
      v14 = v8;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v4, v7, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
        {
          v15 = 0;
          v10 = objc_msgSend(v3, "removeItemAtURL:error:", v9, &v15);
          v11 = v15;
          PBFLogMigration();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v10)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v17 = v9;
              _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "Cleaned up abandoned data store url '%{public}@'", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v17 = v9;
            v18 = 2114;
            v19 = v11;
            _os_log_error_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_ERROR, "Error cleaning up abandoned data store url %{public}@, error:%{public}@", buf, 0x16u);
          }
        }
        else
        {
          PBFLogMigration();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v17 = v9;
            _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "No data store @ '%{public}@'", buf, 0xCu);
          }
          v11 = 0;
        }

        --v7;
      }
      while (v7 >= v6);
    }
  }

}

- (void)archiveDataStoresBeforeCurrentDataStoreVersion
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  PBFDataStoreArchiveAdjudicator *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  __int128 v19;
  id v20;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled");
  PBFLogMigration();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "Keynote mode; not archiving old data stores.", buf, 2u);
    }
    goto LABEL_17;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "Archived data store directory is ready...", buf, 2u);
  }

  v6 = [PBFDataStoreArchiveAdjudicator alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:](v6, "initWithDataStoreBaseURL:archiveBaseURL:", v2, v7);

  v8 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
  v9 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion")
     - 1;
  if (v9 >= v8)
  {
    *(_QWORD *)&v10 = 134218242;
    v19 = v10;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v2, v9, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0))
        break;
LABEL_16:

      if (--v9 < v8)
        goto LABEL_17;
    }
    v20 = 0;
    -[NSObject archiveDataStoreVersion:name:options:removeAfterSuccess:error:](v4, "archiveDataStoreVersion:name:options:removeAfterSuccess:error:", v9, CFSTR("ArchiveDataStoresBeforeCurrentDataStoreVersion"), 0, 1, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;

    PBFLogMigration();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 134217984;
        v22 = v9;
        v16 = v14;
        v17 = "Successfully archived data store %lu";
        v18 = 12;
LABEL_14:
        _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = v19;
      v22 = v9;
      v23 = 2114;
      v24 = v13;
      v16 = v14;
      v17 = "Failed to archive data store %lu: %{public}@";
      v18 = 22;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
LABEL_17:

}

- (void)markDataStoreArchivesAsPurgable
{
  NSObject *v3;
  void *v4;
  PBFDataStoreArchiveAdjudicator *v5;
  void *v6;
  PBFDataStoreArchiveAdjudicator *v7;
  uint8_t v8[16];

  PBFLogMigration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "marking archives as purgable", v8, 2u);
  }

  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PBFDataStoreArchiveAdjudicator alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:](v5, "initWithDataStoreBaseURL:archiveBaseURL:", v4, v6);

  -[PBFDataStoreArchiveAdjudicator markArchivesAsPurgable:](v7, "markArchivesAsPurgable:", 0);
}

- (void)removeArchivedDataStores
{
  NSObject *v3;
  void *v4;
  PBFDataStoreArchiveAdjudicator *v5;
  void *v6;
  PBFDataStoreArchiveAdjudicator *v7;
  uint8_t v8[16];

  PBFLogMigration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "purging archived data stores", v8, 2u);
  }

  -[PBFPosterExtensionDataStoreMigrator baseURL](self, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PBFDataStoreArchiveAdjudicator alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:](v5, "initWithDataStoreBaseURL:archiveBaseURL:", v4, v6);

  -[PBFDataStoreArchiveAdjudicator markArchivesAsPurgable:](v7, "markArchivesAsPurgable:", 0);
}

+ (BOOL)migrateDataStoreAtBaseURL:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5 cleanupAfterMigrationSucceeds:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  PBFPosterExtensionDataStoreSQLiteDatabase *v12;
  BOOL v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  _BYTE *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id *v36;
  char v37;
  void *v38;
  char v39;
  NSObject *v40;
  PBFPosterExtensionDataStoreSQLiteDatabase *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  PBFPosterExtensionDataStoreSQLiteDatabase *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  int v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  NSObject *v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void *v76;
  char v77;
  char v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t n;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  NSObject *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t ii;
  uint64_t v113;
  NSObject *v114;
  NSObject *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t j;
  uint64_t v131;
  NSObject *v132;
  NSObject *v133;
  const char *v134;
  NSObject *v135;
  uint32_t v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t k;
  uint64_t v141;
  NSObject *v142;
  char v143;
  id v144;
  NSObject *v145;
  void *v146;
  __int128 v148;
  void *v149;
  void *v150;
  void *v151;
  _BOOL4 v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  unint64_t v157;
  unint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  unint64_t v166;
  uint64_t m;
  void *v168;
  PBFPosterExtensionDataStoreSQLiteDatabase *v169;
  unint64_t v170;
  uint64_t (*v171)(uint64_t, uint64_t);
  void *v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  id v182;
  _QWORD v183[4];
  id v184;
  id v185;
  id v186;
  uint64_t *v187;
  _QWORD v188[4];
  id v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _QWORD v194[4];
  id v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  id v204;
  id v205;
  _QWORD v206[4];
  PBFPosterExtensionDataStoreSQLiteDatabase *v207;
  id v208;
  id v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  uint64_t *v211;
  _BYTE *v212;
  unint64_t v213;
  uint64_t v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  _QWORD v219[4];
  id v220;
  id v221;
  id obj;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  char v230;
  uint64_t v231;
  _QWORD v232[4];
  id v233;
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  uint8_t v238[128];
  _BYTE buf[24];
  uint64_t (*v240)(uint64_t, uint64_t);
  void (*v241)(uint64_t);
  id v242;
  _BYTE v243[128];
  _BYTE v244[128];
  _QWORD v245[3];
  _QWORD v246[3];
  _QWORD v247[6];

  v7 = a6;
  v247[3] = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v157 = +[PBFPosterExtensionDataStore minimumDataStoreVersion](PBFPosterExtensionDataStore, "minimumDataStoreVersion");
  v159 = +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion");
  v161 = a4;
  v171 = v10;
  if (a4 == a5 && a5 >= 0x3D)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:]([PBFPosterExtensionDataStoreSQLiteDatabase alloc], "initWithURL:options:error:", v11, 8, a7);
    v13 = v12 != 0;
    -[PBFPosterExtensionDataStoreSQLiteDatabase invalidate](v12, "invalidate");

    goto LABEL_209;
  }
  v170 = a5;
  if (v157 <= a4 && v159 >= a5)
  {
    v152 = v7;
    v231 = 0;
    v232[0] = &v231;
    v232[1] = 0x3032000000;
    v232[2] = __Block_byref_object_copy__4;
    v232[3] = __Block_byref_object_dispose__4;
    v233 = 0;
    v227 = 0;
    v228 = &v227;
    v229 = 0x2020000000;
    v230 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = (void *)objc_opt_new();
    v154 = (void *)objc_opt_new();
    if (a4 > a5)
      goto LABEL_168;
    *(_QWORD *)&v20 = 134217984;
    v148 = v20;
    v21 = a4;
    while (1)
    {
      PBFLogMigration();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "Beginning migration to Version %lu (%@)", buf, 0x16u);
      }
      v166 = v21;

      v23 = v21;
      v24 = v21 - 1;
      v25 = v171;
      objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v171, v24);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v171, v23);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 != v159)
        objc_msgSend(v153, "addObject:", v165);
      if (v23 != v161)
        objc_msgSend(v154, "addObject:", v165);
      if (_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v171, v23, 0))
      {
        v26 = v228 + 3;
        goto LABEL_65;
      }
      if (objc_msgSend(v163, "checkResourceIsReachableAndReturnError:", 0))
      {
        objc_msgSend(v172, "removeItemAtURL:error:", v165, 0);
        if ((objc_msgSend(v172, "copyItemAtURL:toURL:error:", v163, v165, a7) & 1) == 0)
          goto LABEL_167;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v171, v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_galleryCacheURLForBaseURL:version:", v171, v23);
        v28 = objc_claimAutoreleasedReturnValue();
        v245[0] = v165;
        v245[1] = v27;
        v168 = (void *)v28;
        v245[2] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v245, 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v225 = 0u;
        v226 = 0u;
        v223 = 0u;
        v224 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v223, v244, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v224;
LABEL_25:
          v33 = 0;
          while (1)
          {
            if (*(_QWORD *)v224 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * v33);
            if ((objc_msgSend(v34, "checkResourceIsReachableAndReturnError:", 0, v148) & 1) == 0)
            {
              PFFileProtectionNoneAttributes();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (id *)(v232[0] + 40);
              obj = *(id *)(v232[0] + 40);
              v37 = objc_msgSend(v172, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 1, v35, &obj);
              objc_storeStrong(v36, obj);

              if ((v37 & 1) == 0)
                break;
            }
            PFPosterPathURLResourceValues();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "pbf_recursivelyUpdateResourceValues:error:", v38, 0);

            if (v31 == ++v33)
            {
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v223, v244, 16);
              if (v31)
                goto LABEL_25;
              break;
            }
          }
        }

        v39 = _PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v171, v166, 0);
        *((_BYTE *)v228 + 24) = v39;

        v25 = v171;
        v23 = v166;
      }
      if (v23 == 60)
        break;
      if (v23 == 61)
      {
        PBFLogMigration();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEFAULT, "Kicking off 61 migration", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v171, 61);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = [PBFPosterExtensionDataStoreSQLiteDatabase alloc];
        v42 = v232[0];
        v221 = 0;
        v169 = -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:](v41, "initWithURL:options:error:", v155, 9, &v221);
        objc_storeStrong((id *)(v42 + 40), v221);
        if (v169 && !*(_QWORD *)(v232[0] + 40))
        {
          v43 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v171, 61);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v44, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v219[0] = MEMORY[0x1E0C809B0];
          v219[1] = 3221225472;
          v219[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke;
          v219[3] = &unk_1E86F4F48;
          v47 = v46;
          v220 = v47;
          objc_msgSend(v45, "enumerateObjectsUsingBlock:", v219);
          v217 = 0u;
          v218 = 0u;
          v215 = 0u;
          v216 = 0u;
          v48 = v45;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v215, v243, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v216;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v216 != v50)
                  objc_enumerationMutation(v48);
                v52 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * i);
                objc_msgSend(v52, "enumerateDescriptorStoreCoordinators:", &__block_literal_global_33, v148);
                objc_msgSend(v52, "enumerateConfigurationStoreCoordinators:", &__block_literal_global_34);
                PBFLogMigration();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CB9FA000, v53, OS_LOG_TYPE_DEFAULT, "Begin attribute migration", buf, 2u);
                }

                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                v240 = __Block_byref_object_copy__4;
                v241 = __Block_byref_object_dispose__4;
                v242 = 0;
                v206[0] = MEMORY[0x1E0C809B0];
                v206[1] = 3221225472;
                v206[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35;
                v206[3] = &unk_1E86F5018;
                v207 = v169;
                v208 = v43;
                v209 = v47;
                v213 = v170;
                v214 = 61;
                v210 = v171;
                v211 = &v227;
                v212 = buf;
                objc_msgSend(v52, "enumerateConfigurationStoreCoordinators:", v206);
                v54 = *(void **)(*(_QWORD *)&buf[8] + 40);
                if (v54)
                {
                  objc_storeStrong((id *)(v232[0] + 40), v54);
                  PBFLogMigration();
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                    +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:].cold.2();

                }
                _Block_object_dispose(buf, 8);

              }
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v215, v243, 16);
            }
            while (v49);
          }

LABEL_61:
LABEL_62:

          v25 = v171;
          v23 = v166;
          goto LABEL_63;
        }
LABEL_60:
        *((_BYTE *)v228 + 24) = 0;
        goto LABEL_61;
      }
LABEL_63:
      if (*(_QWORD *)(v232[0] + 40) || (v26 = v228 + 3, !*((_BYTE *)v228 + 24)))
      {
        PBFLogMigration();
        v125 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v170;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          v240 = v25;
          _os_log_impl(&dword_1CB9FA000, v125, OS_LOG_TYPE_DEFAULT, "Failed to migrate to Version %lu from %lu (%@)", buf, 0x20u);
        }

        *((_BYTE *)v228 + 24) = 0;
LABEL_167:

        v10 = v171;
LABEL_168:
        if (*(_QWORD *)(v232[0] + 40))
        {
          PBFLogMigration();
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:].cold.1((uint64_t)v10, (uint64_t)v232, v126);
        }
        else
        {
          PBFLogMigration();
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v10;
            _os_log_impl(&dword_1CB9FA000, v126, OS_LOG_TYPE_DEFAULT, "Successfuly setup data store @ baseURL '%@'", buf, 0xCu);
          }
        }

        if (*(_QWORD *)(v232[0] + 40))
        {
          v180 = 0u;
          v181 = 0u;
          v178 = 0u;
          v179 = 0u;
          v127 = v154;
          v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v178, v235, 16);
          if (v128)
          {
            v129 = *(_QWORD *)v179;
            do
            {
              for (j = 0; j != v128; ++j)
              {
                if (*(_QWORD *)v179 != v129)
                  objc_enumerationMutation(v127);
                v131 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * j);
                PBFLogMigration();
                v132 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v131;
                  _os_log_impl(&dword_1CB9FA000, v132, OS_LOG_TYPE_DEFAULT, "Cleaning up failed data store URL '%@'", buf, 0xCu);
                }

                objc_msgSend(v172, "removeItemAtURL:error:", v131, 0);
              }
              v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v178, v235, 16);
            }
            while (v128);
          }

          PBFLogMigration();
          v133 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v171;
            v134 = "Cleaned up failed data store URL '%@'";
            v135 = v133;
            v136 = 12;
            goto LABEL_204;
          }
        }
        else if (v152)
        {
          PBFLogMigration();
          v137 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v171;
            _os_log_impl(&dword_1CB9FA000, v137, OS_LOG_TYPE_DEFAULT, "Cleaned up after successful data store migration '%@'", buf, 0xCu);
          }

          v176 = 0u;
          v177 = 0u;
          v174 = 0u;
          v175 = 0u;
          v133 = v153;
          v138 = -[NSObject countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v174, v234, 16);
          if (v138)
          {
            v139 = *(_QWORD *)v175;
            do
            {
              for (k = 0; k != v138; ++k)
              {
                if (*(_QWORD *)v175 != v139)
                  objc_enumerationMutation(v133);
                v141 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * k);
                PBFLogMigration();
                v142 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v141;
                  _os_log_impl(&dword_1CB9FA000, v142, OS_LOG_TYPE_DEFAULT, "Cleaning up successful data store URL '%@'", buf, 0xCu);
                }

                v173 = 0;
                v143 = objc_msgSend(v172, "removeItemAtURL:error:", v141, &v173);
                v144 = v173;
                if ((v143 & 1) == 0)
                {
                  PBFLogMigration();
                  v145 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v141;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v144;
                    _os_log_error_impl(&dword_1CB9FA000, v145, OS_LOG_TYPE_ERROR, "Failed to cleanup after '%@': %@", buf, 0x16u);
                  }

                }
              }
              v138 = -[NSObject countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v174, v234, 16);
            }
            while (v138);
          }
        }
        else
        {
          PBFLogMigration();
          v133 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v134 = "Not cleaning up after successful data store migration.";
            v135 = v133;
            v136 = 2;
LABEL_204:
            _os_log_impl(&dword_1CB9FA000, v135, OS_LOG_TYPE_DEFAULT, v134, buf, v136);
          }
        }

        if (a7)
        {
          v146 = *(void **)(v232[0] + 40);
          if (v146)
            *a7 = objc_retainAutorelease(v146);
        }
        v13 = *((_BYTE *)v228 + 24) != 0;

        _Block_object_dispose(&v227, 8);
        _Block_object_dispose(&v231, 8);

LABEL_209:
        v10 = v171;
        goto LABEL_210;
      }
LABEL_65:
      *v26 = 1;

      v21 = v166 + 1;
      v10 = v171;
      if (v166 + 1 > v170)
        goto LABEL_168;
    }
    PBFLogMigration();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v56, OS_LOG_TYPE_DEFAULT, "Kicking off 60 migration", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v171, 60);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = [PBFPosterExtensionDataStoreSQLiteDatabase alloc];
    v58 = v232[0];
    v205 = 0;
    v169 = -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:](v57, "initWithURL:options:error:", v155, 10, &v205);
    objc_storeStrong((id *)(v58 + 40), v205);
    if (!v169 || *(_QWORD *)(v232[0] + 40))
    {
      PBFLogMigration();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:].cold.3();

      goto LABEL_60;
    }
    PBFLogMigration();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v60, OS_LOG_TYPE_DEFAULT, "Setting up poster configurations for lock screen role", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_switcherConfigurationOrderingURLForBaseURL:version:", v171, 60);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v150, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      PBFLogMigration();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v61, OS_LOG_TYPE_DEFAULT, "going w/ existing poster uuid ordering file", buf, 2u);
      }
    }
    else
    {
      if (v157 > 0x3B)
      {
LABEL_84:
        v67 = (void *)MEMORY[0x1E0C99E40];
        objc_msgSend(v150, "pf_loadFromPlistWithError:", 0, v148);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_opt_class();
        v70 = v68;
        if (v69)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v71 = v70;
          else
            v71 = 0;
        }
        else
        {
          v71 = 0;
        }
        v72 = v71;

        if (v72)
          v73 = v72;
        else
          v73 = (id)MEMORY[0x1E0C9AA60];
        objc_msgSend(v67, "orderedSetWithArray:", v73);
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        PBFLogMigration();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v164;
          _os_log_impl(&dword_1CB9FA000, v74, OS_LOG_TYPE_DEFAULT, "posterUUIDOrdering: %{public}@", buf, 0xCu);
        }

        v75 = v171;
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_switcherSelectedConfigurationURLForBaseURL:version:", v171, 60);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "checkResourceIsReachableAndReturnError:", 0);
        v151 = v76;
        if (v24 < v157)
          v78 = 1;
        else
          v78 = v77;
        if ((v78 & 1) == 0)
        {
          while (1)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "pbf_switcherSelectedConfigurationURLForBaseURL:version:", v75, v24);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v79, "checkResourceIsReachableAndReturnError:", 0))
              break;

            --v24;
            v75 = v171;
            if (v24 < v157)
              goto LABEL_107;
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "copyItemAtURL:toURL:error:", v79, v76, 0);

          if (v81)
          {
            PBFLogMigration();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v148;
              *(_QWORD *)&buf[4] = v24;
              _os_log_impl(&dword_1CB9FA000, v82, OS_LOG_TYPE_DEFAULT, "restored selected poster uuid ordering from %lu", buf, 0xCu);
            }
          }
          else
          {
            PBFLogMigration();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = 0;
              _os_log_error_impl(&dword_1CB9FA000, v82, OS_LOG_TYPE_ERROR, "FAILED restored selected poster uuid from %lu: %{public}@", buf, 0x16u);
            }
          }

        }
LABEL_107:
        objc_msgSend(v151, "pf_loadFromPlistWithError:", 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_opt_class();
        v85 = v83;
        if (v84)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v86 = v85;
          else
            v86 = 0;
        }
        else
        {
          v86 = 0;
        }
        v87 = v86;

        objc_msgSend(v87, "objectForKey:", CFSTR("selectedConfigurationIdentifier"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();

        PBFLogMigration();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v149;
          _os_log_impl(&dword_1CB9FA000, v88, OS_LOG_TYPE_DEFAULT, "selected poster uuid: %{public}@", buf, 0xCu);
        }

        v89 = objc_msgSend(v164, "count");
        v90 = v171;
        if (!v89)
        {
          PBFLogMigration();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v91, OS_LOG_TYPE_DEFAULT, "posterUUIDOrdering is empty; building a new one from the date added of each CSC",
              buf,
              2u);
          }

          v92 = (void *)objc_opt_new();
          v93 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v171, 60);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v94, 0);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          v202 = 0u;
          v203 = 0u;
          v200 = 0u;
          v201 = 0u;
          v156 = v95;
          v162 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v200, v238, 16);
          if (v162)
          {
            v160 = *(_QWORD *)v201;
            do
            {
              for (m = 0; m != v162; ++m)
              {
                if (*(_QWORD *)v201 != v160)
                  objc_enumerationMutation(v156);
                v96 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * m);
                v196 = 0u;
                v197 = 0u;
                v198 = 0u;
                v199 = 0u;
                objc_msgSend(v96, "configurationStoreCoordinatorsWithError:", 0);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v196, v237, 16);
                if (v98)
                {
                  v99 = *(_QWORD *)v197;
                  do
                  {
                    for (n = 0; n != v98; ++n)
                    {
                      if (*(_QWORD *)v197 != v99)
                        objc_enumerationMutation(v97);
                      v101 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * n);
                      objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("kConfigurationAssociatedPosterUUIDKey"));
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v102)
                      {
                        objc_msgSend(v101, "posterUUID");
                        v103 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v103, "UUIDString");
                        v104 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v104)
                        {
                          objc_msgSend(v93, "addObject:", v104);
                          objc_msgSend(v92, "setObject:forKey:", v101, v104);
                        }

                      }
                    }
                    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v196, v237, 16);
                  }
                  while (v98);
                }

              }
              v162 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v200, v238, 16);
            }
            while (v162);
          }

          v194[0] = MEMORY[0x1E0C809B0];
          v194[1] = 3221225472;
          v194[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_47;
          v194[3] = &unk_1E86F5040;
          v105 = v92;
          v195 = v105;
          objc_msgSend(v93, "sortUsingComparator:", v194);
          if (objc_msgSend(v93, "count"))
          {
            v106 = (void *)objc_msgSend(v164, "mutableCopy");
            v107 = v106;
            if (v106)
            {
              v108 = v106;
            }
            else
            {
              v108 = (id)objc_opt_new();

            }
            v192 = 0u;
            v193 = 0u;
            v190 = 0u;
            v191 = 0u;
            v109 = v93;
            v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v190, v236, 16);
            if (v110)
            {
              v111 = *(_QWORD *)v191;
              do
              {
                for (ii = 0; ii != v110; ++ii)
                {
                  if (*(_QWORD *)v191 != v111)
                    objc_enumerationMutation(v109);
                  v113 = *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * ii);
                  if ((objc_msgSend(v164, "containsObject:", v113) & 1) == 0)
                  {
                    PBFLogMigration();
                    v114 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)&buf[4] = v113;
                      _os_log_impl(&dword_1CB9FA000, v114, OS_LOG_TYPE_DEFAULT, "Recovering posterUUID %{public}@", buf, 0xCu);
                    }

                    -[NSObject addObject:](v108, "addObject:", v113);
                  }
                }
                v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v190, v236, 16);
              }
              while (v110);
            }

            v188[0] = MEMORY[0x1E0C809B0];
            v188[1] = 3221225472;
            v188[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_49;
            v188[3] = &unk_1E86F5040;
            v189 = v105;
            -[NSObject sortUsingComparator:](v108, "sortUsingComparator:", v188);
            PBFLogMigration();
            v115 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v108;
              _os_log_impl(&dword_1CB9FA000, v115, OS_LOG_TYPE_DEFAULT, "posterUUIDOrdering replaced with new %{public}@", buf, 0xCu);
            }

            v116 = -[NSObject copy](v108, "copy");
            v164 = (void *)v116;
          }
          else
          {
            PBFLogMigration();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CB9FA000, v108, OS_LOG_TYPE_DEFAULT, "no posters to restore; maybe not upgrading",
                buf,
                2u);
            }
          }

          v90 = v171;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v90, 60);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        _PBFProvidersForPosterUUIDFromDataStoreExtensionContainerURL(v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        v183[0] = MEMORY[0x1E0C809B0];
        v183[1] = 3221225472;
        v183[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_50;
        v183[3] = &unk_1E86F5068;
        v119 = v164;
        v184 = v119;
        v120 = v118;
        v185 = v120;
        v187 = &v231;
        v121 = v149;
        v186 = v121;
        v182 = 0;
        -[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:](v169, "performChanges:error:", v183, &v182);
        v122 = v182;
        v123 = v182;
        if (v123 && !*(_QWORD *)(v232[0] + 40))
        {
          objc_storeStrong((id *)(v232[0] + 40), v122);
        }
        else
        {
          PBFLogMigration();
          v124 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v124, OS_LOG_TYPE_INFO, "cleaning up poster configuration ordering url / poster selected configuration identifier plist url", buf, 2u);
          }

          objc_msgSend(v172, "removeItemAtURL:error:", v150, 0);
          objc_msgSend(v172, "removeItemAtURL:error:", v151, 0);
        }
        -[PBFPosterExtensionDataStoreSQLiteDatabase invalidate](v169, "invalidate");

        goto LABEL_62;
      }
      v62 = 59;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "pbf_switcherConfigurationOrderingURLForBaseURL:version:", v171, v62, v148);
        v61 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject checkResourceIsReachableAndReturnError:](v61, "checkResourceIsReachableAndReturnError:", 0))break;

        if (--v62 < v157)
          goto LABEL_84;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 0;
      v64 = objc_msgSend(v63, "copyItemAtURL:toURL:error:", v61, v150, &v204);
      v65 = v204;

      if (v64)
      {
        PBFLogMigration();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v148;
          *(_QWORD *)&buf[4] = v62;
          _os_log_impl(&dword_1CB9FA000, v66, OS_LOG_TYPE_DEFAULT, "restored poster uuid ordering from %lu", buf, 0xCu);
        }
      }
      else
      {
        PBFLogMigration();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v62;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v65;
          _os_log_error_impl(&dword_1CB9FA000, v66, OS_LOG_TYPE_ERROR, "FAILED restored poster uuid ordering from %lu: %{public}@", buf, 0x16u);
        }
      }

    }
    goto LABEL_84;
  }
  if (a7)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v247[0] = CFSTR("fromVersion < minimumDataStoreVersion || toVersion > currentDataStoreVersion");
    v246[0] = v16;
    v246[1] = CFSTR("fromVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v247[1] = v17;
    v246[2] = CFSTR("toVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v247[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v247, v246, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 1, v19);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_209;
  }
  v13 = 0;
LABEL_210:

  return v13;
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_2;
  v3[3] = &unk_1E86F4F20;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateConfigurationStoreCoordinators:", v3);

}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kConfigurationAssociatedPosterUUIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);

}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "reapEverythingExceptLatestVersion");
  objc_msgSend(v2, "reapSnapshots");

}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "reapEverythingExceptLatestVersion");
  objc_msgSend(v2, "reapSnapshots");

}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  char v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _BYTE *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (void *)MEMORY[0x1D17A3580]();
  objc_msgSend(v4, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathOfLatestVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kConfigurationAssociatedPosterUUIDKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v9, "checkIfPosterUUIDs:belongToRole:error:", v10, *MEMORY[0x1E0D7FC58], 0);

      if ((_DWORD)v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v6);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v11 = objc_alloc(MEMORY[0x1E0D7F9E8]);
          objc_msgSend(v55, "posterUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "extensionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v11, "initWithChildPosterUUID:dateCreated:providerIdentifier:", v12, v13, v14);

          v16 = *(void **)(a1 + 40);
          objc_msgSend(v15, "encodeJSON");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "attributeType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, v18);

          PBFLogMigration();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v55, "posterUUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = 0;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v20;
            _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "Setup child poster attribute for parent %{public}@ -> child %{public}@", buf, 0x16u);

          }
        }
        v66 = 0;
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadFocusConfigurationForPath:error:", v7, &v66);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v66;
        if (v53 || !v21)
        {
          PBFLogMigration();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_4();
        }
        else
        {
          objc_msgSend(v21, "encodeJSON");
          v22 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v22, "length"))
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D7FC28]);
          PBFLogMigration();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEFAULT, "ported focus configuration to attribute", buf, 2u);
          }

        }
        v65 = 0;
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadSuggestionMetadataForPath:error:", v7, &v65);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v65;
        if (v52 || !v56)
        {
          PBFLogMigration();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_3();
        }
        else
        {
          objc_msgSend(v56, "encodeJSON");
          v24 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v24, "length"))
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D7FC40]);
          PBFLogMigration();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "ported suggestion metadata to attribute", buf, 2u);
          }

        }
        v26 = (void *)objc_opt_new();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kConfigurationLastUseDateKey"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          objc_msgSend(v26, "usageMetadataForUpdatedLastActivatedDate:");
          v27 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v27;
        }
        objc_msgSend(v56, "lastModifiedDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v56, "lastModifiedDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "usageMetadataForUpdatedLastModifiedDate:", v29);
          v30 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v30;
        }
        v31 = *(void **)(a1 + 40);
        objc_msgSend(v26, "encodeJSON");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "attributeType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v32, v33);

        v64 = 0;
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadOtherMetadataForPath:error:", v7, &v64);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v64;
        if (v51 || !v34)
        {
          PBFLogMigration();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_2();
        }
        else
        {
          objc_msgSend(v34, "encodeJSON");
          v35 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v35, "length"))
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D7FC38]);
          PBFLogMigration();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v36, OS_LOG_TYPE_DEFAULT, "ported other metadata to attribute", buf, 2u);
          }

        }
        v63 = 0;
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadHomeScreenConfigurationForPath:error:", v7, &v63);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v63;
        if (v50 || !v37)
        {
          PBFLogMigration();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_1();
        }
        else
        {
          objc_msgSend(v37, "encodeJSON");
          v38 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v38, "length"))
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D7FC30]);
          PBFLogMigration();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB9FA000, v39, OS_LOG_TYPE_DEFAULT, "ported home screen config to attribute", buf, 2u);
          }

        }
        if (objc_msgSend(*(id *)(a1 + 40), "count"))
        {
          PBFLogMigration();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v6;
            _os_log_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEFAULT, "updating attributes for poster %{public}@", buf, 0xCu);
          }

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v68 = __Block_byref_object_copy__4;
          v69 = __Block_byref_object_dispose__4;
          v70 = 0;
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_41;
          v59[3] = &unk_1E86F4FF0;
          v41 = *(void **)(a1 + 32);
          v60 = *(id *)(a1 + 40);
          v61 = v6;
          v62 = buf;
          v58 = 0;
          v42 = objc_msgSend(v41, "performChanges:error:", v59, &v58);
          v43 = v58;
          v44 = (unint64_t)v43;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v42;
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
            || v43
            || *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v45 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v47 = *(_QWORD *)(v45 + 40);
            v46 = (id *)(v45 + 40);
            if (!v47)
            {
              v48 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              if (v44 | v48)
              {
                if (v48)
                  v49 = *(void **)(*(_QWORD *)&buf[8] + 40);
                else
                  v49 = (void *)v44;
                objc_storeStrong(v46, v49);
              }
            }
            *a3 = 1;

            _Block_object_dispose(buf, 8);
          }
          else
          {

            _Block_object_dispose(buf, 8);
          }
        }

      }
    }

  }
  objc_autoreleasePoolPop(v5);

}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x1E0D7FC58];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        v13 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        obj = 0;
        LODWORD(v10) = objc_msgSend(v3, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v12, v8, v10, v11, &obj);
        objc_storeStrong(v13, obj);
        if (!(_DWORD)v10 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {

          v14 = 0;
          goto LABEL_13;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v14 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_13:

  return v14;
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifierURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pbf_creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifierURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pbf_creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "compare:", v12);
  return v13;
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifierURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pbf_creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifierURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pbf_creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "compare:", v12);
  return v13;
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  void **v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  NSObject *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  v6 = (uint64_t *)MEMORY[0x1E0D7FC58];
  v47 = v5;
  if (!v5)
    goto LABEL_23;
  v7 = *(_QWORD *)v52;
  v8 = *MEMORY[0x1E0D7FC58];
  v46 = v4;
  while (2)
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v52 != v7)
        objc_enumerationMutation(v4);
      v10 = *(NSObject **)(*((_QWORD *)&v51 + 1) + 8 * v9);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      if (!v11)
      {
        PBFLogMigration();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v10;
          _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "Unable to create UUID from posterUUIDString: %{public}@; not-fatal; continuing.",
            buf,
            0xCu);
        }
        goto LABEL_48;
      }
      v12 = v11;
      objc_msgSend(v3, "sortedPosterUUIDsForRole:error:", v8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v12);

      if (!v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          PBFLogMigration();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v10;
            _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "Unable to find provider for posterUUID: %{public}@; not-fatal; continuing.",
              buf,
              0xCu);
          }
LABEL_20:

          goto LABEL_21;
        }
        v50 = 0;
        v16 = objc_msgSend(v3, "addPosterUUID:provider:error:", v12, v15, &v50);
        v17 = v50;
        v18 = v17;
        if ((v16 & 1) != 0)
        {
          PBFLogMigration();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v12;
            _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_INFO, "poster uuid %{public}@  added", buf, 0xCu);
          }

          v49 = 0;
          v20 = objc_msgSend(v3, "assignPosterUUID:toRole:error:", v12, v8, &v49);
          v21 = v49;

          if ((v20 & 1) == 0)
          {
            v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v41 = *(NSObject **)(v40 + 40);
            v38 = (void **)(v40 + 40);
            v37 = v41;
            if (!v41)
              v37 = v21;
            v18 = v21;
            v4 = v46;
            goto LABEL_47;
          }
          PBFLogMigration();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v12;
            _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_INFO, "poster uuid %{public}@ assigned to lock screen", buf, 0xCu);
          }

          v4 = v46;
          goto LABEL_20;
        }
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v39 = *(NSObject **)(v36 + 40);
        v38 = (void **)(v36 + 40);
        v37 = v39;
        if (!v39)
          v37 = v17;
LABEL_47:
        v42 = v37;
        v43 = *v38;
        *v38 = v42;

LABEL_48:
        v44 = 0;
        goto LABEL_54;
      }
      PBFLogMigration();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v12;
        _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "poster uuid %{public}@ already added; continuing",
          buf,
          0xCu);
      }
LABEL_21:

      ++v9;
    }
    while (v47 != v9);
    v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    v6 = (uint64_t *)MEMORY[0x1E0D7FC58];
    v47 = v23;
    if (v23)
      continue;
    break;
  }
LABEL_23:

  if (*(_QWORD *)(a1 + 48))
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 48));
  else
    v24 = 0;
  v25 = *v6;
  objc_msgSend(v3, "sortedPosterUUIDsForRole:error:", *v6, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v24 && (objc_msgSend(v26, "containsObject:", v24) & 1) != 0)
  {
    v12 = v24;
    goto LABEL_36;
  }
  PBFLogMigration();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v56 = v24;
    v57 = 2114;
    v58 = v27;
    _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "selected posterUUID not valid (%{public}@); current posters: %{public}@",
      buf,
      0x16u);
  }

  objc_msgSend(v27, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();

  PBFLogMigration();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v12;
    _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_INFO, "replacing selected posterUUID w/ first poster uuid %{public}@", buf, 0xCu);
  }

  if (v12)
  {
LABEL_36:
    v48 = 0;
    v30 = objc_msgSend(v3, "markPosterUUIDAsSelected:roleId:error:", v12, v25, &v48);
    v4 = v48;
    if ((v30 & 1) == 0)
    {
      PBFLogMigration();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_50_cold_1();

      PBFLogMigration();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v33 = "Migration will continue.";
        v34 = v32;
        v35 = 2;
        goto LABEL_52;
      }
      goto LABEL_53;
    }
  }
  else
  {
    v4 = 0;
  }
  PBFLogMigration();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v12;
    v33 = "successfully selected posterUUID %{public}@";
    v34 = v32;
    v35 = 12;
LABEL_52:
    _os_log_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_INFO, v33, buf, v35);
  }
LABEL_53:

  v44 = 1;
LABEL_54:

  return v44;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (BOOL)shouldCleanupAfterMigration
{
  return self->_shouldCleanupAfterMigration;
}

- (void)setShouldCleanupAfterMigration:(BOOL)a3
{
  self->_shouldCleanupAfterMigration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)migrateDataStoreToCurrentVersion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Error updating file attributes for URL '%{public}@': %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)migrateDataStoreToCurrentVersion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Error validating file attributes for URL '%{public}@': %{public}@");
  OUTLINED_FUNCTION_7();
}

+ (void)migrateDataStoreAtBaseURL:(NSObject *)a3 fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, a2, a3, "Cleaning up failed data store @ baseURL '%@': %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7();
}

+ (void)migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:.cold.2()
{
  _DWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_8_0();
  *v0 = 138543362;
  *v1 = v2;
  OUTLINED_FUNCTION_6_2(&dword_1CB9FA000, "error updating to 61: %{public}@", v3, v4);
}

+ (void)migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:.cold.3()
{
  _DWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_8_0();
  *v0 = 138543362;
  *v1 = v2;
  OUTLINED_FUNCTION_6_2(&dword_1CB9FA000, "no database? %{public}@", v3, v4);
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1CB9FA000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterHomeScreenConfiguration conversion to attributedProperties f"
    "ailed with error: %{public}@");
  OUTLINED_FUNCTION_5_3();
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1CB9FA000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterMetadata conversion to attributedProperties failed with error: %{public}@");
  OUTLINED_FUNCTION_5_3();
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1CB9FA000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterSuggestionMetadata conversion to attributedProperties failed"
    " with error: %{public}@");
  OUTLINED_FUNCTION_5_3();
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_35_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1CB9FA000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterFocusConfiguration conversion to attributedProperties failed"
    " with error: %{public}@");
  OUTLINED_FUNCTION_5_3();
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_50_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Unable to mark poster '%{public}@' as selected: %{public}@");
  OUTLINED_FUNCTION_7();
}

@end
