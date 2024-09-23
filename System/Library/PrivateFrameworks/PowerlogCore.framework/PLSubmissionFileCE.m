@implementation PLSubmissionFileCE

- (PLSubmissionFileCE)initWithConfig:(id)a3
{
  id v4;
  PLSubmissionFileCE *v5;
  PLSubmissionFileCE *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "submitCE")
    && ((v8.receiver = self,
         v8.super_class = (Class)PLSubmissionFileCE,
         v5 = -[PLSubmissionFile initWithConfig:](&v8, sel_initWithConfig_, v4),
         (self = v5) == 0)
     || -[PLSubmissionFileCE copyAndPrepareLog](v5, "copyAndPrepareLog")))
  {
    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fileType
{
  return CFSTR("CleanEnergyLogs");
}

- (id)fileExtension
{
  return CFSTR(".ce.anon");
}

- (BOOL)copyAndPrepareLog
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  -[PLSubmissionFile filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".ce.anon"), &stru_1E6A56538);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v47);
    v7 = v47;

    if ((v10 & 1) == 0)
    {
      PLLogSubmission();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileCE copyAndPrepareLog].cold.8();
      v8 = 0;
      goto LABEL_36;
    }
    -[PLSubmissionFileCE getCESQLFile](self, "getCESQLFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(".gz"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CESQLConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v15;
    if (objc_msgSend(v15, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:", v12, 0, 0, 0, 0))
    {
      if (_os_feature_enabled_impl()
        && !-[PLSubmissionFileCE performCopyTablesToDB:](self, "performCopyTablesToDB:", v12))
      {
        PLLogSubmission();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileCE copyAndPrepareLog].cold.6();

      }
      if (!+[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v12, v13, 4))
      {
        PLLogSubmission();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileBG copyAndPrepareLog].cold.6();

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeItemAtPath:error:", v12, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("-wal"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeItemAtPath:error:", v20, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("-shm"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeItemAtPath:error:](v21, "removeItemAtPath:error:", v22, 0);

    }
    else
    {
      PLLogSubmission();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileCE copyAndPrepareLog].cold.7();
    }

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tag.json"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v25);

    v48 = CFSTR("LogFiles");
    v49[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v23))
    {
      PLLogSubmission();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.5();

    }
    v44 = (void *)v23;
    v27 = (void *)MEMORY[0x1E0D1D1F8];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "archiveDirectoryAt:deleteOriginal:", v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v41 = v24;
      v42 = v13;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSubmissionFile filePath](self, "filePath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v7;
      v33 = objc_msgSend(v30, "moveItemAtPath:toPath:error:", v31, v32, &v46);
      v34 = v46;

      if (v33)
      {
        -[PLSubmissionFile decorateFile](self, "decorateFile");
        v8 = 1;
        v35 = v44;
        v7 = v34;
        v24 = v41;
        v13 = v42;
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      PLLogSubmission();
      v36 = objc_claimAutoreleasedReturnValue();
      v7 = v34;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileCE copyAndPrepareLog].cold.3();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeItemAtPath:error:", v38, 0);

      v24 = v41;
      v13 = v42;
    }
    PLLogSubmission();
    v39 = objc_claimAutoreleasedReturnValue();
    v35 = v44;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileCE copyAndPrepareLog].cold.2(v39);

    v8 = 0;
    goto LABEL_35;
  }
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[PLSubmissionFileBG copyAndPrepareLog].cold.1();
  v8 = 0;
LABEL_37:

  return v8;
}

- (id)getCESQLFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;

  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertFromMonotonicToSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromMonotonicToSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "filenameDateStringWithStartDate:endDate:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagUUID");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cleanenergy_%@.CESQL"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileCE getCESQLFile].cold.1();

  return v12;
}

- (id)tablesToMigrateForCE
{
  return &unk_1E6AF5F00;
}

- (BOOL)performCopyTablesToDB:(id)a3
{
  id v4;
  void *v5;
  PLSQLiteConnection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  PLSQLiteConnection *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  PLSubmissionFileCE *v27;
  NSObject *v28;
  PLSQLiteConnection *v29;
  id v30;

  v4 = a3;
  -[PLSubmissionFileCE tablesToMigrateForCE](self, "tablesToMigrateForCE");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLSQLiteConnection initWithFilePath:]([PLSQLiteConnection alloc], "initWithFilePath:", v4);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "filePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "filePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLSQLiteConnection attachDB:withName:](v6, "attachDB:withName:", v13, v12);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogSubmission();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFileCE performCopyTablesToDB:].cold.3();

    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __44__PLSubmissionFileCE_performCopyTablesToDB___block_invoke;
    v26 = &unk_1E6A53E08;
    v27 = self;
    v18 = v16;
    v28 = v18;
    v19 = v6;
    v29 = v19;
    v30 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v23);
    PLLogSubmission();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFileCE performCopyTablesToDB:].cold.2();

    if (!-[PLSQLiteConnection detachDB:](v19, "detachDB:", v12, v23, v24, v25, v26, v27))
    {
      PLLogSubmission();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileCE performCopyTablesToDB:].cold.1();

    }
    -[PLSQLiteConnection closeConnection](v19, "closeConnection");

  }
  else
  {
    PLLogSubmission();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileCE performCopyTablesToDB:].cold.4(v9, (uint64_t)v12, v18);
  }

  return v14;
}

void __44__PLSubmissionFileCE_performCopyTablesToDB___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  double v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1BCC9E9B4]();
  +[PLEntryDefinition configsForEntryKey:](PLEntryDefinition, "configsForEntryKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "taskingConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "taskingConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrimConditionsTemplate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", &unk_1E6ABAD90);

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrimConditionsTemplateArg"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v8, "dateByAddingTimeInterval:", -v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogSubmission();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v31 = v3;
      v32 = 2048;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_INFO, "'%@' has %f seconds to live, modified range: [%@, %@]", buf, 0x2Au);
    }

  }
  else
  {
    v14 = v6;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "timeIntervalSince1970");
  v19 = v18;
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("timestamp BETWEEN %f AND %f"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("WHERE"));

  if (+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("PLDebugService_Enabled"), 0))
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("uuid"));
  }
  v24 = *(void **)(a1 + 48);
  v23 = *(void **)(a1 + 56);
  objc_msgSend(v23, "filePath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByDeletingPathExtension");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "copyTable:fromConnection:withDBName:withProperties:andAttach:", v3, v23, v27, v16, 0);

  objc_autoreleasePoolPop(context);
}

- (void)submit
{
  if (-[PLSubmissionFile iCloudUploadEnabled](self, "iCloudUploadEnabled"))
    -[PLSubmissionFile submitLogToiCloudWithCompress:](self, "submitLogToiCloudWithCompress:", 0);
}

- (void)copyAndPrepareLog
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, v0, (uint64_t)v0, "Directory %@ creation failed:%@", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)getCESQLFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Requested CleanEnergy DB file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)performCopyTablesToDB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Failed to detach DB at '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)performCopyTablesToDB:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "ending 'copyTables' with UUID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)performCopyTablesToDB:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "starting 'copyTables' with UUID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)performCopyTablesToDB:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, a3, v6, "Failed to attach DB at '%@' as '%@'", (uint8_t *)&v7);

}

@end
