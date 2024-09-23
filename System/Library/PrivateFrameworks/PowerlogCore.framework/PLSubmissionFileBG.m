@implementation PLSubmissionFileBG

- (PLSubmissionFileBG)initWithConfig:(id)a3
{
  id v4;
  PLSubmissionFileBG *v5;
  PLSubmissionFileBG *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "submitBG")
    && ((v8.receiver = self,
         v8.super_class = (Class)PLSubmissionFileBG,
         v5 = -[PLSubmissionFile initWithConfig:](&v8, sel_initWithConfig_, v4),
         (self = v5) == 0)
     || -[PLSubmissionFileBG copyAndPrepareLog](v5, "copyAndPrepareLog")))
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
  return CFSTR("BackgroundProcessing");
}

- (id)fileExtension
{
  return CFSTR(".bg.anon");
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
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  const __CFString *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  -[PLSubmissionFile filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".bg.anon"), &stru_1E6A56538);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v62);
    v7 = v62;

    if ((v10 & 1) == 0)
    {
      PLLogSubmission();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      v8 = 0;
      goto LABEL_34;
    }
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "blockingFlushCachesWithReason:", CFSTR("BackgroundProcessing"));

    -[PLSubmissionFileBG getBGSQLFile](self, "getBGSQLFile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    -[NSObject stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR(".gz"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "BGSQLConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:", v14, 0, 0, 0, 0);

    if (v18)
    {
      if (+[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v14, v15, 4))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeItemAtPath:error:", v14, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("-wal"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeItemAtPath:error:", v21, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("-shm"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeItemAtPath:error:", v23, 0);

        objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tag.json"));
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        v63 = CFSTR("LogFiles");
        v64[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v24))
        {
          PLLogSubmission();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[PLSubmissionFileBG copyAndPrepareLog].cold.5();

        }
        v28 = (void *)MEMORY[0x1E0D1D1F8];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "archiveDirectoryAt:deleteOriginal:", v29, 1);
        v30 = objc_claimAutoreleasedReturnValue();

        v31 = (void *)v30;
        if (v30)
        {
          v57 = v15;
          v58 = v25;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v31;
          objc_msgSend(v31, "path");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSubmissionFile filePath](self, "filePath");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v7;
          v35 = objc_msgSend(v32, "moveItemAtPath:toPath:error:", v33, v34, &v61);
          v59 = v61;

          if ((v35 & 1) != 0)
          {
            -[PLSubmissionFile decorateFile](self, "decorateFile");
            PLLogSubmission();
            v36 = objc_claimAutoreleasedReturnValue();
            v25 = v58;
            v31 = v56;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              -[PLSubmissionFileBG copyAndPrepareLog].cold.3();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "path");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject removeItemAtPath:error:](v37, "removeItemAtPath:error:", v38, 0);

            v8 = 1;
            v15 = v57;
          }
          else
          {
            PLLogSubmission();
            v37 = objc_claimAutoreleasedReturnValue();
            v25 = v58;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[PLSubmissionFileBG copyAndPrepareLog].cold.4(v37, v48, v49, v50, v51, v52, v53, v54);
            v8 = 0;
            v31 = v56;
            v15 = v57;
          }
          v47 = (void *)v60;
          v46 = v59;
        }
        else
        {
          PLLogSubmission();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[PLSubmissionFileBG copyAndPrepareLog].cold.2(v37, v39, v40, v41, v42, v43, v44, v45);
          v8 = 0;
          v46 = v7;
          v47 = (void *)v60;
        }

        v7 = v46;
        goto LABEL_33;
      }
      PLLogSubmission();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.6();
    }
    else
    {
      PLLogSubmission();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.7();
    }
    v8 = 0;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[PLSubmissionFileBG copyAndPrepareLog].cold.1();
  v8 = 0;
LABEL_35:

  return v8;
}

- (id)getBGSQLFile
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bgprocessing_%@.BGSQL"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileBG getBGSQLFile].cold.1();

  return v12;
}

- (void)submit
{
  if (-[PLSubmissionFile iCloudUploadEnabled](self, "iCloudUploadEnabled"))
    -[PLSubmissionFile submitLogToiCloudWithCompress:](self, "submitLogToiCloudWithCompress:", 0);
}

- (void)copyAndPrepareLog
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Directory %@ creation failed:%@");
  OUTLINED_FUNCTION_1_0();
}

- (void)getBGSQLFile
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEBUG, "Requested BackgroundProcessing DB file: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
