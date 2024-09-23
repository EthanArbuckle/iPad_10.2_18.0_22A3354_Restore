@implementation PLSubmissionFileSP

- (PLSubmissionFileSP)initWithConfig:(id)a3
{
  PLSubmissionFileSP *v3;
  PLSubmissionFileSP *v4;
  PLSubmissionFileSP *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLSubmissionFileSP;
  v3 = -[PLSubmissionFile initWithConfig:](&v7, sel_initWithConfig_, a3);
  v4 = v3;
  if (v3 && !-[PLSubmissionFileSP copyAndPrepareLog](v3, "copyAndPrepareLog"))
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (id)fileType
{
  return CFSTR("Signpost");
}

- (BOOL)copyAndPrepareLog
{
  PLSubmissionFileSP *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  SignpostReaderHelper *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  SignpostReaderHelper *v45;
  void *v46;
  void *v47;
  void *v48;
  PLSubmissionFileSP *v50;
  NSObject *v51;
  _QWORD block[5];
  uint8_t buf[4];
  void *v54;
  _QWORD v55[2];
  _QWORD v56[3];

  v2 = self;
  v56[2] = *MEMORY[0x1E0C80C00];
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "signpostDisable"))
  {
    if (!+[PLPlatform internalBuild](PLPlatform, "internalBuild")
      || !+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("SignpostReaderDisable"), 0))
    {
      objc_msgSend(v3, "signpostAllowlist");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = v11;
      else
        v12 = &unk_1E6AF6D28;
      if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
      {
        v13 = -[NSObject mutableCopy](v12, "mutableCopy");
        -[NSObject setObject:forKey:](v13, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("com.apple.metrickit.log"));
        -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &unk_1E6AF5E40, CFSTR("com.apple.signpost_emitter"));

        v12 = v13;
      }
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v3, "tagUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("TagUUID"));

      objc_msgSend(v3, "builds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("Build"));

      objc_msgSend(v3, "deviceModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("Model"));

      if (objc_msgSend(v3, "internal"))
        v19 = CFSTR("true");
      else
        v19 = CFSTR("false");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("Internal"));
      if (objc_msgSend(v3, "seed"))
        v20 = CFSTR("true");
      else
        v20 = CFSTR("false");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("Beta"));
      objc_msgSend(v3, "getSubmitReasonTypeToReasonLog");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("Reason"));

      objc_msgSend(v3, "getDateMarkerLegacy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("Date"));

      v55[0] = CFSTR("CollectDate");
      objc_msgSend(v3, "getDateMarker");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = CFSTR("SignpostStartDate");
      v56[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSubmissionConfig getDateMarkerFromSystemDate:](PLSubmissionConfig, "getDateMarkerFromSystemDate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, CFSTR("ExtendedAttributes"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "submittedFilesMask"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("SubmittedFilesMask"));

      v28 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExtendedAttributes"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "serializedJSONString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("ExtendedAttributes"));

      objc_msgSend(v3, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "convertFromMonotonicToSystem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "convertFromMonotonicToSystem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_alloc_init(SignpostReaderHelper);
      -[PLSubmissionFile taskingConfig](v2, "taskingConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v12;
      -[SignpostReaderHelper generateSignpostSubmissionWithTagConfig:withAllowlist:withStartDate:withEndDate:includeSPFile:](v35, "generateSignpostSubmissionWithTagConfig:withAllowlist:withStartDate:withEndDate:includeSPFile:", v28, v12, v32, v34, objc_msgSend(v36, "submitSP"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogSubmission();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("tarballPath"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v39;
        _os_log_impl(&dword_1B6AB6000, v38, OS_LOG_TYPE_DEFAULT, "PerfPowerServicesSignpostreader tarball path: %@", buf, 0xCu);

      }
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("tarballPath"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSubmissionFile taskingConfig](v2, "taskingConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFilePath:", v40);

      -[PLSubmissionFile taskingConfig](v2, "taskingConfig");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setCkTagConfig:", v14);

      if (v37)
      {
        objc_opt_class();
        v43 = 3;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("success"));
          v50 = v2;
          v44 = v28;
          v45 = v35;
          v46 = v34;
          v47 = v32;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v48, "BOOLValue");

          v32 = v47;
          v34 = v46;
          v35 = v45;
          v28 = v44;
          v2 = v50;
          if (v10)
            v43 = 0;
          else
            v43 = 3;
        }
        else
        {
          LOBYTE(v10) = 0;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
        v43 = 3;
      }
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:](v2, "logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:", v43, CFSTR("signpost"), 0);

      v5 = v51;
      goto LABEL_36;
    }
    PLLogSubmission();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "signpost collection disabled", buf, 2u);
    }
LABEL_13:
    LOBYTE(v10) = 0;
LABEL_36:

    goto LABEL_37;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLSubmissionFileSP_copyAndPrepareLog__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (copyAndPrepareLog_defaultOnce != -1)
      dispatch_once(&copyAndPrepareLog_defaultOnce, block);
    if (copyAndPrepareLog_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("copyAndPrepareLog: Signpost submission disabled"));
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFileSP.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFileSP copyAndPrepareLog]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 53);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFileSP copyAndPrepareLog].cold.1((uint64_t)v5, v9);

      goto LABEL_13;
    }
  }
  LOBYTE(v10) = 0;
LABEL_37:

  return v10;
}

BOOL __39__PLSubmissionFileSP_copyAndPrepareLog__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  copyAndPrepareLog_classDebugEnabled = result;
  return result;
}

- (void)copyAndPrepareLog
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end
