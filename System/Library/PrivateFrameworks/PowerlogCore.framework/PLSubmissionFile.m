@implementation PLSubmissionFile

- (PLSubmissionFile)initWithConfig:(id)a3
{
  id v5;
  PLSubmissionFile *v6;
  PLSubmissionFile *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  NSString *directory;
  NSString *fileName;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = a3;
  v6 = -[PLSubmissionFile init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_taskingConfig, a3);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "tagUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tagUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v12 = CFSTR("/");
    if (!v11)
      v12 = &stru_1E6A56538;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("/tmp/powerlog/"), v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    directory = v7->_directory;
    v7->_directory = (NSString *)v13;

    fileName = v7->_fileName;
    v7->_fileName = 0;

    v7->_iCloudUploadEnabled = 1;
    objc_msgSend(v5, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertFromMonotonicToSystem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertFromMonotonicToSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "filenameDateStringWithStartDate:endDate:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "length"))
    {
      objc_msgSend(v5, "tagUUID");
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    objc_msgSend(v5, "getSubmitReasonTypeToStorageEventOTAType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionFile setFileNameWithSubmissionType:withID:](v7, "setFileNameWithSubmissionType:withID:", v22, v20);

  }
  return v7;
}

- (void)setFileNameWithSubmissionType:(id)a3 withID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  NSString *fileName;
  id v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  -[PLSubmissionFile fileType](self, "fileType");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile fileExtension](self, "fileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@OTA%@Submission_%@%@"), v12, v8, v7, v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  fileName = self->_fileName;
  self->_fileName = v10;

}

- (id)filePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLSubmissionFile directory](self, "directory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fileType
{
  return &stru_1E6A56538;
}

- (id)fileExtension
{
  return &stru_1E6A56538;
}

- (int)submitLogToDAWithBugType:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSubmissionFile filePath](self, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v5);

  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  if (v6 <= v9)
  {
    v39 = CFSTR("override-fileName");
    -[PLSubmissionFile fileName](self, "fileName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v14;
    v13 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E98];
    -[PLSubmissionFile filePath](self, "filePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = PLOSAMoveFileForSubmissions(v4, v15, v18);

    if (v19)
    {
      -[PLSubmissionFile filePath](self, "filePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v22, 32);

      v13 = 0;
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionFile filePath](self, "filePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtPath:error:", v11, 0);

    v12 = 0;
    v13 = 2;
  }
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "submitReasonType");

  if (v24 == 3)
  {
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "request");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[PLSubmissionFile taskingConfig](self, "taskingConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "request");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = CFSTR("request nil");
    }

    +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = CFSTR("Type");
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "getSubmitReasonTypeToStorageEventOTAType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v31;
    v38[1] = v28;
    v37[1] = CFSTR("Name");
    v37[2] = CFSTR("Success");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logOTAStatus:", v33);

  }
  else
  {
    +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35[0] = CFSTR("Type");
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "getSubmitReasonTypeToStorageEventOTAType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v30;
    v35[1] = CFSTR("Success");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString logOTAStatus:](v28, "logOTAStatus:", v32);
  }

  return v13;
}

- (void)logSubmissionResultToCAWithErrorType:(int)a3 withFileType:(id)a4 withOverrideKeys:(id)a5
{
  uint64_t v6;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  _QWORD block[5];

  v6 = *(_QWORD *)&a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "count") != 4)
  {
    switch((int)v6)
    {
      case 0:
        v16 = (void *)MEMORY[0x1E0CB3940];
        -[PLSubmissionFile taskingConfig](self, "taskingConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "getSubmitReasonTypeToCAFieldValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v19;
        v15 = CFSTR("noError");
        v14 = v13;
        if (v13)
          goto LABEL_15;
        goto LABEL_21;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("submissionFail.OSA"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("submissionFail");
        v15 = CFSTR("OSA");
        if (!v13)
          goto LABEL_21;
        goto LABEL_15;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("submissionFail.fileOverLimit"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("submissionFail");
        v15 = CFSTR("fileOverLimit");
        if (v13)
          goto LABEL_15;
        goto LABEL_21;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("submissionFail.noFile"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("submissionFail");
        v15 = CFSTR("noFile");
        if (!v13)
          goto LABEL_21;
LABEL_15:
        v20 = &stru_1E6A56538;
        if (v8)
          v20 = v8;
        v21 = ".";
        if (!v8)
          v21 = "";
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.powerlog.%@%s%@"), v20, v21, v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      default:
        v15 = 0;
        v14 = 0;
LABEL_21:
        v11 = 0;
        goto LABEL_24;
    }
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v6 || (unint64_t)-[__CFString count](v13, "count") < 4)
  {
    if ((unint64_t)-[__CFString count](v13, "count") < 5)
    {
      v15 = 0;
      v14 = 0;
    }
    else
    {
      -[__CFString objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 4);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[__CFString objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 3);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("noError");
  }
LABEL_23:

LABEL_24:
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PLSubmissionFile_logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__defaultOnce != -1)
      dispatch_once(&logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__defaultOnce, block);
    if (logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Set aggdKey = %@ for OTA submission result: error = %d, filetype = %@, overrideKeys = %@ (%d == %d)"), v11, v6, v8, v10, objc_msgSend(v10, "count"), 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v24, v25, 172);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (v14)
  {
    v27 = v14;
    v28 = v15;
    v29 = v8;
    AnalyticsSendEventLazy();

  }
  if (v11)
    PLADClientAddValueForScalarKey(v11, 1);

}

BOOL __87__PLSubmissionFile_logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__classDebugEnabled = result;
  return result;
}

id __87__PLSubmissionFile_logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys___block_invoke_63(_QWORD *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("source");
  v4[1] = CFSTR("reason");
  v1 = (const __CFString *)a1[5];
  if (!v1)
    v1 = &stru_1E6A56538;
  v5[0] = a1[4];
  v5[1] = v1;
  v4[2] = CFSTR("fileType");
  v2 = (const __CFString *)a1[6];
  if (!v2)
    v2 = &stru_1E6A56538;
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)decorateFile
{
  id v3;

  -[PLSubmissionFile filePath](self, "filePath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile decorateFileAtPath:](self, "decorateFileAtPath:", v3);

}

- (void)decorateFileAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  id v10;
  const void *v11;
  size_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  const void *v26;
  size_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  const char *v60;
  id v61;
  const void *v62;
  id v63;
  size_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  int *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  const char *v78;
  id v79;
  const void *v80;
  id v81;
  size_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  int *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  id v92;
  const char *v93;
  id v94;
  const void *v95;
  id v96;
  size_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  int *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  id v109;
  const char *v110;
  id v111;
  const void *v112;
  id v113;
  size_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  int *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  id v124;
  id v125;
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[5];
  _QWORD v130[5];
  unsigned __int8 v131;
  _QWORD v132[5];
  unsigned __int8 value;
  _QWORD v134[5];
  _QWORD block[6];

  v4 = a3;
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSubmissionConfig getDateMarkerFromSystemDate:](PLSubmissionConfig, "getDateMarkerFromSystemDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = objc_retainAutorelease(v7);
  v11 = (const void *)objc_msgSend(v10, "UTF8String");
  v125 = objc_retainAutorelease(v10);
  v12 = strlen((const char *)objc_msgSend(v125, "UTF8String"));
  if (setxattr(v9, "com.apple.powerlog.handoverDate", v11, v12, 0, 0)
    && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v13 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v13;
    if (decorateFileAtPath__defaultOnce != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce, block);
    if (decorateFileAtPath__classDebugEnabled)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = *__error();
      v16 = __error();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%@\" failed %d(%s)\n"), v8, "com.apple.powerlog.handoverDate", v125, v15, strerror(*v16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 198);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(v5, "getDateMarker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_retainAutorelease(v8);
  v24 = (const char *)objc_msgSend(v23, "UTF8String");
  v25 = objc_retainAutorelease(v22);
  v26 = (const void *)objc_msgSend(v25, "UTF8String");
  v124 = objc_retainAutorelease(v25);
  v27 = strlen((const char *)objc_msgSend(v124, "UTF8String"));
  if (setxattr(v24, "com.apple.powerlog.collectDate", v26, v27, 0, 0)
    && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v28 = objc_opt_class();
    v134[0] = MEMORY[0x1E0C809B0];
    v134[1] = 3221225472;
    v134[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_78;
    v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v134[4] = v28;
    if (decorateFileAtPath__defaultOnce_76 != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce_76, v134);
    if (decorateFileAtPath__classDebugEnabled_77)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = *__error();
      v31 = __error();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%@\" failed %d(%s)\n"), v23, "com.apple.powerlog.collectDate", v124, v30, strerror(*v31));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v34, v35, 202);

      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  value = objc_msgSend(v5, "internal");
  v37 = objc_retainAutorelease(v23);
  if (setxattr((const char *)objc_msgSend(v37, "UTF8String"), "com.apple.powerlog.internal", &value, 1uLL, 0, 0)
    && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v38 = objc_opt_class();
    v132[0] = MEMORY[0x1E0C809B0];
    v132[1] = 3221225472;
    v132[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_82;
    v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v132[4] = v38;
    if (decorateFileAtPath__defaultOnce_80 != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce_80, v132);
    if (decorateFileAtPath__classDebugEnabled_81)
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = value;
      v41 = *__error();
      v42 = __error();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%d\" failed %d(%s)\n"), v37, "com.apple.powerlog.internal", v40, v41, strerror(*v42));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "lastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v45, v46, 206);

      PLLogCommon();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v131 = objc_msgSend(v5, "seed");
  v48 = objc_retainAutorelease(v37);
  if (setxattr((const char *)objc_msgSend(v48, "UTF8String"), "com.apple.powerlog.beta", &v131, 1uLL, 0, 0)
    && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v49 = objc_opt_class();
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_88;
    v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v130[4] = v49;
    if (decorateFileAtPath__defaultOnce_86 != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce_86, v130);
    if (decorateFileAtPath__classDebugEnabled_87)
    {
      v50 = (void *)MEMORY[0x1E0CB3940];
      v51 = v131;
      v52 = *__error();
      v53 = __error();
      objc_msgSend(v50, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%d\" failed %d(%s)\n"), v48, "com.apple.powerlog.beta", v51, v52, strerror(*v53));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lastPathComponent");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v56, v57, 210);

      PLLogCommon();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v59 = objc_retainAutorelease(v48);
  v60 = (const char *)objc_msgSend(v59, "UTF8String");
  objc_msgSend(v5, "deviceModel");
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v62 = (const void *)objc_msgSend(v61, "UTF8String");
  objc_msgSend(v5, "deviceModel");
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v64 = strlen((const char *)objc_msgSend(v63, "UTF8String"));
  LODWORD(v60) = setxattr(v60, "com.apple.powerlog.deviceModel", v62, v64, 0, 0);

  if ((_DWORD)v60 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v65 = objc_opt_class();
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_92;
    v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v129[4] = v65;
    if (decorateFileAtPath__defaultOnce_90 != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce_90, v129);
    if (decorateFileAtPath__classDebugEnabled_91)
    {
      v66 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "deviceModel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = *__error();
      v69 = __error();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%@\" failed %d(%s)\n"), v59, "com.apple.powerlog.deviceModel", v67, v68, strerror(*v69));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "lastPathComponent");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v70, v72, v73, 213);

      PLLogCommon();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(v5, "builds");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "lastObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v77 = objc_retainAutorelease(v59);
    v78 = (const char *)objc_msgSend(v77, "UTF8String");
    v79 = objc_retainAutorelease(v76);
    v80 = (const void *)objc_msgSend(v79, "UTF8String");
    v81 = objc_retainAutorelease(v79);
    v82 = strlen((const char *)objc_msgSend(v81, "UTF8String"));
    if (setxattr(v78, "com.apple.powerlog.build", v80, v82, 0, 0))
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v83 = objc_opt_class();
        v128[0] = MEMORY[0x1E0C809B0];
        v128[1] = 3221225472;
        v128[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_96;
        v128[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v128[4] = v83;
        if (decorateFileAtPath__defaultOnce_94 != -1)
          dispatch_once(&decorateFileAtPath__defaultOnce_94, v128);
        if (decorateFileAtPath__classDebugEnabled_95)
        {
          v84 = (void *)MEMORY[0x1E0CB3940];
          v85 = *__error();
          v86 = __error();
          objc_msgSend(v84, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%@\" failed %d(%s)\n"), v77, "com.apple.powerlog.build", v81, v85, strerror(*v86));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "lastPathComponent");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v87, v89, v90, 218);

          PLLogCommon();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
    }
  }
  v92 = objc_retainAutorelease(v59);
  v93 = (const char *)objc_msgSend(v92, "UTF8String");
  objc_msgSend(v5, "tagUUID");
  v94 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v95 = (const void *)objc_msgSend(v94, "UTF8String");
  objc_msgSend(v5, "tagUUID");
  v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v97 = strlen((const char *)objc_msgSend(v96, "UTF8String"));
  LODWORD(v93) = setxattr(v93, "com.apple.powerlog.TagUUID", v95, v97, 0, 0);

  if ((_DWORD)v93 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v98 = objc_opt_class();
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_100;
    v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v127[4] = v98;
    if (decorateFileAtPath__defaultOnce_98 != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce_98, v127);
    if (decorateFileAtPath__classDebugEnabled_99)
    {
      v99 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "tagUUID");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = *__error();
      v102 = __error();
      objc_msgSend(v99, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%@\" failed %d(%s)\n"), v92, "com.apple.powerlog.TagUUID", v100, v101, strerror(*v102));
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "lastPathComponent");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v103, v105, v106, 222);

      PLLogCommon();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(v5, "getSubmitReasonTypeToReasonLog");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_retainAutorelease(v92);
  v110 = (const char *)objc_msgSend(v109, "UTF8String");
  v111 = objc_retainAutorelease(v108);
  v112 = (const void *)objc_msgSend(v111, "UTF8String");
  v113 = objc_retainAutorelease(v111);
  v114 = strlen((const char *)objc_msgSend(v113, "UTF8String"));
  if (setxattr(v110, "com.apple.powerlog.reason", v112, v114, 0, 0)
    && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v115 = objc_opt_class();
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_104;
    v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v126[4] = v115;
    if (decorateFileAtPath__defaultOnce_102 != -1)
      dispatch_once(&decorateFileAtPath__defaultOnce_102, v126);
    if (decorateFileAtPath__classDebugEnabled_103)
    {
      v116 = (void *)MEMORY[0x1E0CB3940];
      v117 = *__error();
      v118 = __error();
      objc_msgSend(v116, "stringWithFormat:", CFSTR("Add decoration to %@ \"%s:%@\" failed %d(%s)\n"), v109, "com.apple.powerlog.reason", v113, v117, strerror(*v118));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "lastPathComponent");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile decorateFileAtPath:]");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v119, v121, v122, 226);

      PLLogCommon();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_78(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_77 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_82(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_81 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_88(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_87 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_92(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_91 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_96(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_95 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_100(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_99 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_104(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decorateFileAtPath__classDebugEnabled_103 = result;
  return result;
}

- (BOOL)createTagFileWithPath:(id)a3
{
  return -[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", a3, 0);
}

- (BOOL)createTagFileWithPath:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  char v20;

  v6 = a3;
  v7 = a4;
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tagUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tagUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("TagUUID"));

    objc_msgSend(v8, "getDateMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("Date"));

    objc_msgSend(v8, "builds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("Build"));

    objc_msgSend(v8, "deviceModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("Model"));

    if (objc_msgSend(v8, "internal"))
      v16 = CFSTR("true");
    else
      v16 = CFSTR("false");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("Internal"));
    if (objc_msgSend(v8, "seed"))
      v17 = CFSTR("true");
    else
      v17 = CFSTR("false");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("Beta"));
    if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v10))
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v18, 4);
      v20 = objc_msgSend(v19, "writeToFile:atomically:encoding:error:", v6, 0, 4, 0);

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)submit
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PLSubmissionFile_submit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (submit_defaultOnce != -1)
      dispatch_once(&submit_defaultOnce, block);
    if (submit_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSubmissionFile: submit\n"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile submit]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 266);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __26__PLSubmissionFile_submit__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submit_classDebugEnabled = result;
  return result;
}

- (void)submitLogToiCloud:(id)a3 WithCompress:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  id v48;
  _QWORD block[5];
  _QWORD v50[6];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tagUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "fileExistsAtPath:", v6);

      if ((v10 & 1) == 0)
      {
        PLLogSubmission();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFile submitLogToiCloud:WithCompress:].cold.5();
        goto LABEL_41;
      }
      +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", CFSTR("/tmp/powerlog/cloud/"));
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[PLSubmissionFile taskingConfig](self, "taskingConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tagUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@Powerlog_%@/"), CFSTR("/tmp/powerlog/cloud/"), v13);
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
        +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", v14);
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v18 = +[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v6, v17, 4);
        v19 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
        if (v18)
        {
          if (v19)
          {
            v20 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke_133;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v20;
            if (submitLogToiCloud_WithCompress__defaultOnce_131 != -1)
              dispatch_once(&submitLogToiCloud_WithCompress__defaultOnce_131, block);
            if (submitLogToiCloud_WithCompress__classDebugEnabled_132)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSubmissionFile: copied %@ to %@ for upload with compression.\n"), v6, v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "lastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile submitLogToiCloud:WithCompress:]");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v23, v24, 295);

              PLLogCommon();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

            }
          }
          -[PLSubmissionFile decorateFileAtPath:](self, "decorateFileAtPath:", v17);
        }
        else if (v19)
        {
          v36 = objc_opt_class();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke;
          v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v50[4] = v36;
          if (submitLogToiCloud_WithCompress__defaultOnce != -1)
            dispatch_once(&submitLogToiCloud_WithCompress__defaultOnce, v50);
          if (submitLogToiCloud_WithCompress__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSubmissionFile: cannot compress from %@ to %@ for upload.\n"), v6, v17);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "lastPathComponent");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile submitLogToiCloud:WithCompress:]");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v39, v40, 293);

            PLLogCommon();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v27 = objc_msgSend(v26, "copyItemAtPath:toPath:error:", v6, v17, &v48);
      v28 = v48;

      v29 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
      if (v27)
      {
        if (!v29)
          goto LABEL_39;
        v30 = objc_opt_class();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke_138;
        v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v47[4] = v30;
        if (submitLogToiCloud_WithCompress__defaultOnce_136 != -1)
          dispatch_once(&submitLogToiCloud_WithCompress__defaultOnce_136, v47);
        if (!submitLogToiCloud_WithCompress__classDebugEnabled_137)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSubmissionFile: copied %@ to %@ for upload.\n"), v6, v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile submitLogToiCloud:WithCompress:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v33, v34, 301);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      }
      else
      {
        if (!v29)
          goto LABEL_39;
        v42 = objc_opt_class();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke_143;
        v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v46[4] = v42;
        if (submitLogToiCloud_WithCompress__defaultOnce_141 != -1)
          dispatch_once(&submitLogToiCloud_WithCompress__defaultOnce_141, v46);
        if (!submitLogToiCloud_WithCompress__classDebugEnabled_142)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSubmissionFile: cannot copy %@ to %@ for upload. (%@)\n"), v6, v17, v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "lastPathComponent");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile submitLogToiCloud:WithCompress:]");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v44, v45, 303);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      }

LABEL_39:
LABEL_40:

LABEL_41:
    }
  }

}

BOOL __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitLogToiCloud_WithCompress__classDebugEnabled = result;
  return result;
}

BOOL __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke_133(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitLogToiCloud_WithCompress__classDebugEnabled_132 = result;
  return result;
}

BOOL __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke_138(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitLogToiCloud_WithCompress__classDebugEnabled_137 = result;
  return result;
}

BOOL __51__PLSubmissionFile_submitLogToiCloud_WithCompress___block_invoke_143(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitLogToiCloud_WithCompress__classDebugEnabled_142 = result;
  return result;
}

- (void)submitLogToiCloudWithCompress:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PLSubmissionFile filePath](self, "filePath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile submitLogToiCloud:WithCompress:](self, "submitLogToiCloud:WithCompress:", v5, v3);

}

- (void)cleanupTmpDirectory
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile directory](self, "directory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionFile directory](self, "directory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v7, &v22);
    v8 = v22;

    v9 = (void *)MEMORY[0x1E0CB3940];
    -[PLSubmissionFile directory](self, "directory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionFile fileName](self, "fileName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Cleanup remove directory %@, file %@, %@"), v10, v11, v8);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile cleanupTmpDirectory]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 321);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[PLSubmissionFile directory](self, "directory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Cleanup directory %@ does not exist, skipping removal"), v18);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFile cleanupTmpDirectory]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v20, v21, 314);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }

}

- (PLSubmissionConfig)taskingConfig
{
  return (PLSubmissionConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskingConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)iCloudUploadEnabled
{
  return self->_iCloudUploadEnabled;
}

- (void)setICloudUploadEnabled:(BOOL)a3
{
  self->_iCloudUploadEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_taskingConfig, 0);
}

- (void)logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)submitLogToiCloud:WithCompress:.cold.5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_ERROR, "PLSubmissionFile: file %@ does not exist, cannot submit", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
