@implementation PLSubmissionFileXC

- (PLSubmissionFileXC)initWithConfig:(id)a3
{

  return 0;
}

- (id)fileType
{
  return CFSTR("XcodeOrganizer");
}

- (id)fileExtension
{
  return CFSTR(".xc.anon");
}

- (BOOL)copyDatabaseToPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  PLSQLiteConnection *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1BCC9E9B4]();
  +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "XCSQLConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyDatabaseToPath:", v3);

  if (v7)
  {
    v8 = -[PLSQLiteConnection initWithFilePath:]([PLSQLiteConnection alloc], "initWithFilePath:", v3);
    -[PLSQLiteConnection setJournalMode:](v8, "setJournalMode:", 9);
    -[PLSQLiteConnection closeConnection](v8, "closeConnection");

  }
  objc_autoreleasePoolPop(v4);

  return v7;
}

- (BOOL)copyAndPrepareLog
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  PLSQLiteConnection *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  unsigned int v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  id v80;
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[6];
  _QWORD v84[8];

  v84[6] = *MEMORY[0x1E0C80C00];
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "submitReasonType") == 1)
  {
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conditionCheckForXcodeUserActions");

    if (!v5)
      return 0;
  }
  else
  {

  }
  -[PLSubmissionFile filePath](self, "filePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".xc.anon"), &stru_1E6A56538);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
  {
    PLLogSubmission();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileBG copyAndPrepareLog].cold.1();
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v80);
    v11 = v80;

    if ((v13 & 1) != 0)
    {
      -[PLSubmissionFile taskingConfig](self, "taskingConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "submitReasonType");

      if (v15 != 1)
      {
        +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "storage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("XcodeOrganizer"));

      }
      -[PLSubmissionFileXC getXCSQLFile](self, "getXCSQLFile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      -[NSObject stringByAppendingFormat:](v19, "stringByAppendingFormat:", CFSTR(".gz"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PLSubmissionFileXC copyDatabaseToPath:](self, "copyDatabaseToPath:", v19))
      {
        v65 = v11;
        v21 = -[PLSQLiteConnection initWithFilePath:]([PLSQLiteConnection alloc], "initWithFilePath:", v19);
        -[PLSubmissionFileXC randomizedBaseOffset](self, "randomizedBaseOffset");
        v23 = v22;
        -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:](self, "obfuscateTimestampsForTable:connection:withOffset:", CFSTR("XcodeMetrics_TimeOffset_365_4"), v21);
        -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:](self, "obfuscateTimestampsForTable:connection:withOffset:", CFSTR("XcodeMetrics_UserAction_365_4"), v21, v23);
        -[PLSQLiteConnection fullVacuum](v21, "fullVacuum");
        v24 = -[PLSubmissionFileXC userActionCountForConnection:](self, "userActionCountForConnection:", v21);
        v83[0] = CFSTR("has_user_actions");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (int)v24 > 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = v76;
        v84[1] = &unk_1E6ABECF0;
        v83[1] = CFSTR("preparation_stage");
        v83[2] = CFSTR("user_action_row_count");
        v64 = v24;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v84[2] = v75;
        v83[3] = CFSTR("xcsql_size");
        v25 = (void *)MEMORY[0x1E0CB37E8];
        +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "XCSQLConnection");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "filePath");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v71));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v84[3] = v70;
        v83[4] = CFSTR("shm_size");
        v26 = (void *)MEMORY[0x1E0CB37E8];
        v77 = v19;
        +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "XCSQLConnection");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "filePath");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringByAppendingString:", CFSTR("-shm"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v66));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v84[4] = v27;
        v83[5] = CFSTR("wal_size");
        v28 = (void *)MEMORY[0x1E0CB37E8];
        v78 = v20;
        +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "XCSQLConnection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "filePath");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringByAppendingString:", CFSTR("-wal"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v32));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v84[5] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        v20 = v78;
        v19 = v77;

        -[PLSQLiteConnection closeConnection](v21, "closeConnection");
        if (+[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v77, v78, 4))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "removeItemAtPath:error:", v77, 0);

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringByAppendingString:](v77, "stringByAppendingString:", CFSTR("-wal"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removeItemAtPath:error:", v37, 0);

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringByAppendingString:](v77, "stringByAppendingString:", CFSTR("-shm"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "removeItemAtPath:error:", v39, 0);

          objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("tag.json"));
          v21 = (PLSQLiteConnection *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "lastPathComponent");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v41);

          v74 = v40;
          v82[0] = v40;
          v81[0] = CFSTR("LogFiles");
          v81[1] = CFSTR("XcodeVersion");
          v42 = (void *)MEMORY[0x1E0CB37E8];
          -[PLSubmissionFileXC xcodeVersionFromUserActions](self, "xcodeVersionFromUserActions");
          objc_msgSend(v42, "numberWithDouble:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v82[1] = v43;
          v81[2] = CFSTR("UserActionCount_System");
          v44 = (void *)MEMORY[0x1E0CB37E8];
          +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "XCSQLConnection");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "numberWithInt:", -[PLSubmissionFileXC userActionCountForConnection:](self, "userActionCountForConnection:", v46));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v82[2] = v47;
          v81[3] = CFSTR("UserActionCount_Upload");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v82[3] = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v21, v49))
          {
            PLLogSubmission();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              -[PLSubmissionFileBG copyAndPrepareLog].cold.5();

          }
          v51 = (void *)MEMORY[0x1E0D1D1F8];
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "archiveDirectoryAt:deleteOriginal:", v52, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "path");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLSubmissionFile filePath](self, "filePath");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = v65;
            v57 = objc_msgSend(v54, "moveItemAtPath:toPath:error:", v55, v56, &v79);
            v58 = v79;

            if ((v57 & 1) != 0)
            {
              -[PLSubmissionFile decorateFile](self, "decorateFile");
              PLLogSubmission();
              v59 = objc_claimAutoreleasedReturnValue();
              v20 = v78;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                -[PLSubmissionFileXC copyAndPrepareLog].cold.3();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v60 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "path");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject removeItemAtPath:error:](v60, "removeItemAtPath:error:", v61, 0);

              v6 = 1;
            }
            else
            {
              PLLogSubmission();
              v60 = objc_claimAutoreleasedReturnValue();
              v20 = v78;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                -[PLSubmissionFileXC copyAndPrepareLog].cold.4();
              v6 = 0;
            }
            v19 = v77;
          }
          else
          {
            PLLogSubmission();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              -[PLSubmissionFileXC copyAndPrepareLog].cold.2();
            v6 = 0;
            v58 = v65;
            v20 = v78;
          }

          v11 = v58;
        }
        else
        {
          PLLogSubmission();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[PLSubmissionFileBG copyAndPrepareLog].cold.6();

          v6 = 0;
          v11 = v65;
        }
      }
      else
      {
        PLLogSubmission();
        v21 = (PLSQLiteConnection *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileXC copyAndPrepareLog].cold.7();
        v6 = 0;
      }

    }
    else
    {
      PLLogSubmission();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      v6 = 0;
    }

  }
  return v6;
}

- (id)getXCSQLFile
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xcode_%@.XCSQL"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileXC getXCSQLFile].cold.1();

  return v12;
}

- (void)obfuscateTimestampsForTable:(id)a3 connection:(id)a4 withOffset:(double)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v7 = a3;
  v8 = a4;
  PLLogSubmission();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:].cold.2((uint64_t)v7, v10, a5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET timestamp = timestamp - %f;"),
      v7,
      *(_QWORD *)&a5);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginTransaction");
    v11 = (id)objc_msgSend(v8, "performQuery:", v10);
    objc_msgSend(v8, "endTransaction");
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:].cold.1();
  }

}

- (double)randomizedBaseOffset
{
  double v2;
  NSObject *v3;

  v2 = (double)arc4random() / 4294967300.0 * 86400.0 + 86400.0;
  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileXC randomizedBaseOffset].cold.1(v3, v2);

  return v2;
}

- (int)userActionCountForConnection:(id)a3
{
  return objc_msgSend(a3, "rowCountForTableName:", CFSTR("XcodeMetrics_UserAction_365_4"));
}

- (double)xcodeVersionFromUserActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@ ORDER BY timestamp DESC limit 1"), CFSTR("XcodeVersion"), CFSTR("XcodeMetrics_UserAction_365_4"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "XCSQLConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entriesForKey:withQuery:", CFSTR("XcodeMetrics_UserAction_365_4"), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("XcodeVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    PLLogSubmission();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFileXC xcodeVersionFromUserActions].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    PLLogSubmission();
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = -1.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFileXC xcodeVersionFromUserActions].cold.1();
  }

  return v9;
}

- (void)submit
{
  if (-[PLSubmissionFile iCloudUploadEnabled](self, "iCloudUploadEnabled"))
    -[PLSubmissionFile submitLogToiCloudWithCompress:](self, "submitLogToiCloudWithCompress:", 0);
}

- (void)copyAndPrepareLog
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Failed to copy xcsql file to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getXCSQLFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Requested Xcode DB file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)obfuscateTimestampsForTable:connection:withOffset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Failed to connect to copied XCSQL for timestamp obfuscation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)obfuscateTimestampsForTable:(uint64_t)a1 connection:(NSObject *)a2 withOffset:(double)a3 .cold.2(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "Performing timestamp obfuscation for %@ with base timestamp '%f'", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)randomizedBaseOffset
{
  int v2;
  double v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 134218496;
  v3 = a2;
  v4 = 2048;
  v5 = 0x40F5180000000000;
  v6 = 2048;
  v7 = 0x4105180000000000;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "Computed randomized offset '%f' with randomization interval ['%f', '%f']", (uint8_t *)&v2, 0x20u);
}

- (void)xcodeVersionFromUserActions
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a1, a3, "Xcode Version = %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
