@implementation PLSubmissionFileBDC

- (PLSubmissionFileBDC)initWithConfig:(id)a3
{
  id v4;
  PLSubmissionFileBDC *v5;
  PLSubmissionFileBDC *v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "submitBDC")
    || +[PLPlatform isTVOS](PLPlatform, "isTVOS")
    || (v8.receiver = self,
        v8.super_class = (Class)PLSubmissionFileBDC,
        v5 = -[PLSubmissionFile initWithConfig:](&v8, sel_initWithConfig_, v4),
        (self = v5) != 0)
    && !-[PLSubmissionFileBDC copyAndPrepareLog](v5, "copyAndPrepareLog"))
  {
    v6 = 0;
  }
  else
  {
    self = self;
    v6 = self;
  }

  return v6;
}

- (void)submit
{
  if (-[PLSubmissionFile iCloudUploadEnabled](self, "iCloudUploadEnabled"))
    -[PLSubmissionFile submitLogToiCloudWithCompress:](self, "submitLogToiCloudWithCompress:", 0);
}

- (id)fileType
{
  return CFSTR("BDC_logs");
}

- (id)fileExtension
{
  return CFSTR(".bdc.anon");
}

- (BOOL)copyAndPrepareLog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  char v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  PLSubmissionFileBDC *v63;
  void *v64;
  id obj;
  id obja;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  const __CFString *v75;
  void *v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  NSObject *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  -[PLSubmissionFileBDC getListOfRequiredBDCFiles](self, "getListOfRequiredBDCFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[PLSubmissionFile filePath](self, "filePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".bdc.anon"), &stru_1E6A56538);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if (v7)
    {
      PLLogSubmission();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.1();
      v9 = 0;
      goto LABEL_54;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v74);
    v8 = v74;

    if ((v11 & 1) == 0)
    {
      PLLogSubmission();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      v9 = 0;
      goto LABEL_53;
    }
    v61 = v3;
    v63 = self;
    v12 = v5;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v3;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v71;
      do
      {
        v16 = 0;
        v17 = v8;
        do
        {
          if (*(_QWORD *)v71 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v16);
          objc_msgSend(CFSTR("/var/db/Battery/BDC"), "stringByAppendingPathComponent:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v17;
          v22 = objc_msgSend(v21, "copyItemAtPath:toPath:error:", v19, v20, &v69);
          v8 = v69;

          if ((v22 & 1) == 0)
          {
            PLLogSubmission();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v78 = v19;
              v79 = 2112;
              v80 = v20;
              v81 = 2112;
              v82 = v8;
              _os_log_error_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_ERROR, "Error trying to copy bdc file from %@ to %@, %@", buf, 0x20u);
            }

          }
          ++v16;
          v17 = v8;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      }
      while (v14);
    }

    -[PLSubmissionFileBDC getEPSQLFile](v63, "getEPSQLFile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    objc_msgSend(v12, "stringByAppendingPathComponent:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    -[NSObject stringByAppendingFormat:](v25, "stringByAppendingFormat:", CFSTR(".gz"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "EPSQLConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v28;
    if (objc_msgSend(v28, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:", v25, 0, 0, 0, 0))
    {
      if (!+[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v25, v26, 4))
      {
        PLLogSubmission();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileBG copyAndPrepareLog].cold.6();

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeItemAtPath:error:", v25, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v31 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("-shm"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeItemAtPath:error:](v31, "removeItemAtPath:error:", v32, 0);

    }
    else
    {
      PLLogSubmission();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileCE copyAndPrepareLog].cold.7();
    }
    v3 = v61;

    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("tag.json"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", obj);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPathComponent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v35);

    v75 = CFSTR("LogFiles");
    v76 = v34;
    v60 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](v63, "createTagFileWithPath:withInfo:", v33))
    {
      PLLogSubmission();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBG copyAndPrepareLog].cold.5();

    }
    obja = v26;
    -[PLSubmissionFileBDC getBDCPlistFile](v63, "getBDCPlistFile");
    v37 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v33;
    v58 = (void *)v37;
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.powerd.bdc.plist"));
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v8;
      v41 = objc_msgSend(v38, "writeToURL:error:", v40, &v68);
      v42 = v68;

      if ((v41 & 1) == 0)
      {
        PLLogSubmission();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileBDC copyAndPrepareLog].cold.5();

      }
    }
    else
    {
      PLLogSubmission();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBDC copyAndPrepareLog].cold.4();
      v42 = v8;
    }

    v44 = (void *)MEMORY[0x1E0D1D1F8];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "archiveDirectoryAt:deleteOriginal:", v45, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "path");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSubmissionFile filePath](v63, "filePath");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v42;
      v50 = objc_msgSend(v47, "moveItemAtPath:toPath:error:", v48, v49, &v67);
      v8 = v67;

      if (v50)
      {
        -[PLSubmissionFile decorateFile](v63, "decorateFile");
        v9 = 1;
        v51 = v58;
        v52 = obja;
LABEL_52:

LABEL_53:
LABEL_54:

        goto LABEL_55;
      }
      PLLogSubmission();
      v53 = objc_claimAutoreleasedReturnValue();
      v51 = v58;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileBDC copyAndPrepareLog].cold.3();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "path");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "removeItemAtPath:error:", v55, 0);

    }
    else
    {
      v8 = v42;
      v51 = v58;
    }
    PLLogSubmission();
    v56 = objc_claimAutoreleasedReturnValue();
    v52 = obja;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileBDC copyAndPrepareLog].cold.2();

    v9 = 0;
    goto LABEL_52;
  }
  v9 = 0;
LABEL_55:

  return v9;
}

- (id)getListOfRequiredBDCFiles
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", CFSTR("/var/db/Battery/BDC"), &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PLLogSubmission();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileBDC getListOfRequiredBDCFiles].cold.3((uint64_t)v4, v6);
LABEL_4:

    v7 = 0;
    goto LABEL_16;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++), (_QWORD)v16);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  v13 = objc_msgSend(v5, "count");
  PLLogSubmission();
  v14 = objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileBDC getListOfRequiredBDCFiles].cold.1();
    goto LABEL_4;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileBDC getListOfRequiredBDCFiles].cold.2();

  v7 = v5;
LABEL_16:

  return v7;
}

- (id)getEPSQLFile
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("log_%@.EPSQL"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileBDC getEPSQLFile].cold.1();

  return v12;
}

- (id)getBDCPlistFile
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  PLTimer *v7;
  void *v8;
  void *v9;
  _xpc_connection_s *v10;
  PLTimer *v11;
  xpc_object_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _QWORD v23[4];
  _xpc_connection_s *v24;

  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E0C80D38], 0);
  v3 = mach_service;
  if (mach_service)
  {
    v4 = (void *)MEMORY[0x1E0C80D38];
    xpc_connection_set_target_queue(mach_service, MEMORY[0x1E0C80D38]);

    xpc_connection_set_event_handler(v3, &__block_literal_global_31);
    xpc_connection_resume(v3);
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_BOOL(v5, "BDCXPCCopyDefaults", 1);
      v7 = [PLTimer alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_38;
      v23[3] = &unk_1E6A535C0;
      v10 = v3;
      v24 = v10;
      v11 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v7, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v8, 0, 0, v9, v23, 0.0, 0.0);

      v12 = xpc_connection_send_message_with_reply_sync(v10, v6);
      -[PLTimer invalidate](v11, "invalidate");
      if (v12)
      {
        if (MEMORY[0x1BCC9F134](v12) == MEMORY[0x1E0C812F8])
        {
          v18 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          PLLogSubmission();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFileBDC getBDCPlistFile].cold.5();

          xpc_connection_cancel(v10);
          if (v18)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("returnCode"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "intValue");

            if (!v21)
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BDCXPCCopyDefaults"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_20;
            }
            PLLogSubmission();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[PLSubmissionFileBDC getBDCPlistFile].cold.4(v21, v22);

          }
LABEL_19:
          v16 = 0;
LABEL_20:

          goto LABEL_21;
        }
        if (MEMORY[0x1BCC9F134](v12) != MEMORY[0x1E0C81310])
        {
LABEL_18:
          xpc_connection_cancel(v10);
          goto LABEL_19;
        }
        PLLogSubmission();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileBDC getBDCPlistFile].cold.6();
      }
      else
      {
        PLLogSubmission();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileBDC getBDCPlistFile].cold.3();
      }

      goto LABEL_18;
    }
    PLLogSubmission();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileBDC getBDCPlistFile].cold.2();

    xpc_connection_cancel(v3);
  }
  else
  {
    PLLogSubmission();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileBDC getBDCPlistFile].cold.1();

  }
  v16 = 0;
LABEL_21:

  return v16;
}

void __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_38(uint64_t a1)
{
  NSObject *v2;

  PLLogSubmission();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_38_cold_1();

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

- (void)copyAndPrepareLog
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to copy BDC plist to %@, %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)getListOfRequiredBDCFiles
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("/var/db/Battery/BDC");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Error accessing BDC dir: %@, %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getEPSQLFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Requested BDC EPSQL file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getBDCPlistFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Failed to receive response from powerd via XPC, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "[ERROR] Timeout occured while trying to retrieve BDC plist from powerd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
