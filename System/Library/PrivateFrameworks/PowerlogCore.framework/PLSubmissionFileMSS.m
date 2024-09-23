@implementation PLSubmissionFileMSS

- (PLSubmissionFileMSS)initWithConfig:(id)a3
{
  id v4;
  PLSubmissionFileMSS *v5;
  PLSubmissionFileMSS *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "submitMSS")
    && ((v8.receiver = self,
         v8.super_class = (Class)PLSubmissionFileMSS,
         v5 = -[PLSubmissionFile initWithConfig:](&v8, sel_initWithConfig_, v4),
         (self = v5) == 0)
     || -[PLSubmissionFileMSS copyAndPrepareLog](v5, "copyAndPrepareLog")))
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
  return CFSTR("Microstackshots");
}

- (id)fileExtension
{
  return CFSTR(".mss.anon");
}

- (id)mssTextFilePath
{
  void *v2;
  void *v3;

  -[PLSubmissionFile filePath](self, "filePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mss.anon"), CFSTR(".msstext.anon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)copyAndPrepareLog
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = -[PLSubmissionFileMSS flushMicrostackshots](self, "flushMicrostackshots");
  PLLogSubmission();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      -[PLSubmissionFileMSS copyAndPrepareLog].cold.3();
  }
  else if (v5)
  {
    -[PLSubmissionFileMSS copyAndPrepareLog].cold.4();
  }

  -[PLSubmissionFile directory](self, "directory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLSubmissionFile directory](self, "directory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", v7);

  }
  v8 = -[PLSubmissionFileMSS collectMSS](self, "collectMSS");
  PLLogSubmission();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFileMSS copyAndPrepareLog].cold.2();
    goto LABEL_18;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Successfully collected binary MSS", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    -[PLSubmissionFile taskingConfig](self, "taskingConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "submitReasonType");

    if (v12 != 2)
    {
      v13 = -[PLSubmissionFileMSS generateMSS](self, "generateMSS");
      PLLogSubmission();
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Successfully generated text MSS", v16, 2u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[PLSubmissionFileMSS copyAndPrepareLog].cold.1();
      }
LABEL_18:

    }
  }
  return v8;
}

- (BOOL)collectMSS
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
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  xpc_object_t empty;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t buf[16];
  _QWORD v33[4];
  id v34;
  uint8_t *v35;
  uint8_t v36[8];
  uint8_t *v37;
  uint64_t v38;
  char v39;
  id v40;

  -[PLSubmissionFile filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mss.anon"), &stru_1E6A56538);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v40);
    v7 = v40;

    if ((v10 & 1) != 0)
    {
      -[PLSubmissionFileMSS getFileList](self, "getFileList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "mutableCopy");

      if (v12 && -[NSObject count](v12, "count"))
      {
        *(_QWORD *)v36 = 0;
        v37 = v36;
        v38 = 0x2020000000;
        v39 = 0;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __33__PLSubmissionFileMSS_collectMSS__block_invoke;
        v33[3] = &unk_1E6A56080;
        v13 = v4;
        v34 = v13;
        v35 = v36;
        -[NSObject enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v33);
        if (v37[24])
        {
          PLLogSubmission();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFileMSS collectMSS].cold.5();

          v15 = objc_alloc(MEMORY[0x1E0C99E98]);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/microstackshots"), v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "initFileURLWithPath:", v16);

          -[NSObject path](v17, "path");
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = open((const char *)objc_msgSend(v18, "UTF8String"), 3585, 432);

          if (v19 != -1)
          {
            -[PLSubmissionFile taskingConfig](self, "taskingConfig");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "startDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "convertFromMonotonicToSystem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            empty = xpc_dictionary_create_empty();
            objc_msgSend(v22, "timeIntervalSince1970");
            xpc_dictionary_set_uint64(empty, "time", (unint64_t)v24);
            if (!systemstats_copy_microstackshots_to_file())
            {
              -[NSObject lastPathComponent](v17, "lastPathComponent");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v12, "addObject:", v25);

            }
            close(v19);

          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, CFSTR("LogFiles"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], CFSTR("DscsymFiles"));
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v13, CFSTR("tag.json"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v27, v26))
          {
            -[PLSubmissionFile filePath](self, "filePath");
            v28 = objc_claimAutoreleasedReturnValue();
            v8 = -[PLSubmissionFileMSS packageDirectory:to:](self, "packageDirectory:to:", v13, v28);
            if (v8)
            {
              PLLogSubmission();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6AB6000, v29, OS_LOG_TYPE_DEFAULT, "Packaged binary MSS", buf, 2u);
              }
            }
            else
            {
              PLLogSubmission();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[PLSubmissionFileMSS collectMSS].cold.3();
            }

          }
          else
          {
            PLLogSubmission();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFileMSS collectMSS].cold.4();
            v8 = 0;
          }

        }
        else
        {
          PLLogSubmission();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFileMSS collectMSS].cold.2();
          v8 = 0;
        }

        _Block_object_dispose(v36, 8);
        goto LABEL_25;
      }
      PLLogSubmission();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1B6AB6000, v30, OS_LOG_TYPE_INFO, "No MSS files found", v36, 2u);
      }

    }
    else
    {
      PLLogSubmission();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileMSS collectMSS].cold.6();
    }
    v8 = 0;
LABEL_25:

    goto LABEL_26;
  }
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFileMSS collectMSS].cold.1();
  v8 = 0;
LABEL_26:

  return v8;
}

void __33__PLSubmissionFileMSS_collectMSS__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/db/systemstats"), v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), *(_QWORD *)(a1 + 32), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyItemAtPath:toPath:error:", v8, v5, 0);

  if (v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

- (BOOL)generateMSS
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  SignpostReaderHelper *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  void *v39;
  uint8_t buf[16];
  uint64_t v41;
  uint64_t v42;
  id (*v43)(uint64_t);
  void *v44;
  NSObject *v45;
  id v46;

  -[PLSubmissionFile filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mss.anon"), CFSTR("-text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    PLLogSubmission();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFileMSS collectMSS].cold.1();
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v46);
    v7 = v46;

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("text-microstackshots.txt"));
      v11 = objc_claimAutoreleasedReturnValue();
      -[PLSubmissionFile taskingConfig](self, "taskingConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertFromMonotonicToSystem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLSubmissionFile taskingConfig](self, "taskingConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertFromMonotonicToSystem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogSubmission();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFileMSS generateMSS].cold.5();

      v19 = objc_alloc_init(SignpostReaderHelper);
      -[SignpostReaderHelper generateTaskingMSSWithStartDate:endDate:atPath:](v19, "generateTaskingMSSWithStartDate:endDate:atPath:", v14, v17, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v38 = v17;
        v39 = v14;
        v41 = MEMORY[0x1E0C809B0];
        v42 = 3221225472;
        v43 = __34__PLSubmissionFileMSS_generateMSS__block_invoke;
        v44 = &unk_1E6A536F0;
        v45 = v20;
        AnalyticsSendEventLazy();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB37E8];
        +[PLUtilities getLastSystemTimeOffset](PLUtilities, "getLastSystemTimeOffset");
        objc_msgSend(v23, "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("LastSystemOffset"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v4, CFSTR("tag.json"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v25, v22))
        {
          -[PLSubmissionFileMSS mssTextFilePath](self, "mssTextFilePath");
          v26 = objc_claimAutoreleasedReturnValue();
          v8 = -[PLSubmissionFileMSS packageDirectory:to:](self, "packageDirectory:to:", v4, v26);
          PLLogSubmission();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v8)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEFAULT, "Packaged text MSS", buf, 2u);
            }
          }
          else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            -[PLSubmissionFileMSS generateMSS].cold.3();
          }

        }
        else
        {
          PLLogSubmission();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFileMSS collectMSS].cold.4();
          v8 = 0;
        }

        v29 = v45;
        v17 = v38;
        v14 = v39;
      }
      else
      {
        PLLogSubmission();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[PLSubmissionFileMSS generateMSS].cold.2(v29, v30, v31, v32, v33, v34, v35, v36);
        v8 = 0;
      }

    }
    else
    {
      PLLogSubmission();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PLSubmissionFileMSS collectMSS].cold.6();
      v8 = 0;
    }

  }
  return v8;
}

id __34__PLSubmissionFileMSS_generateMSS__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("sample_count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("time_printing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("time_processing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("time_reading"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_1E6ABEDC8;
  if (v4)
    v8 = v4;
  else
    v8 = &unk_1E6ABEDC8;
  v13[0] = CFSTR("ProcessingTime");
  v13[1] = CFSTR("PrintingTime");
  if (v3)
    v9 = v3;
  else
    v9 = &unk_1E6ABEDC8;
  v14[0] = v8;
  v14[1] = v9;
  v13[2] = CFSTR("ReadingTime");
  v13[3] = CFSTR("SampleCount");
  if (v5)
    v10 = (void *)v5;
  else
    v10 = &unk_1E6ABEDC8;
  if (v2)
    v7 = v2;
  v14[2] = v10;
  v14[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)packageDirectory:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLLogSubmission();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_INFO, "Packaging directory %@", (uint8_t *)&v19, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0D1D1F8];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "archiveDirectoryAt:deleteOriginal:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "moveItemAtPath:toPath:error:", v13, v7, 0);

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeItemAtPath:error:", v17, 0);

LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  -[PLSubmissionFile decorateFile](self, "decorateFile");
  v15 = 1;
LABEL_8:

  return v15;
}

- (BOOL)flushMicrostackshots
{
  NSObject *v2;
  dispatch_time_t v3;
  BOOL v4;

  v2 = dispatch_semaphore_create(0);
  v4 = 0;
  if (systemstats_microstackshot_checkpoint_async())
  {
    v3 = dispatch_time(0, 10000000000);
    if (!dispatch_semaphore_wait(v2, v3))
      v4 = 1;
  }

  return v4;
}

intptr_t __43__PLSubmissionFileMSS_flushMicrostackshots__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getFileList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertFromMonotonicToSystem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertFromMonotonicToSystem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", CFSTR("/var/db/systemstats"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    if (v8)
    {
      v9 = v8;
      v33 = v6;
      v34 = v2;
      v36 = 0;
      v38 = 0;
      obj = v7;
      v42 = *(_QWORD *)v44;
      v10 = *MEMORY[0x1E0CB2A88];
      v37 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v42)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("/var/db/systemstats"), v12);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "attributesOfItemAtPath:error:", v13, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogSubmission();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v13;
            v49 = 2112;
            v50 = v16;
            _os_log_debug_impl(&dword_1B6AB6000, v17, OS_LOG_TYPE_DEBUG, "Logfile %@ creation time is %@.\n", buf, 0x16u);
          }

          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count") == 4)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("microstackshots"));

            if (v20)
            {
              if (objc_msgSend(v39, "compare:", v16) != -1 || objc_msgSend(v40, "compare:", v16) == -1)
              {
                if (objc_msgSend(v40, "compare:", v16) == -1 && (!v38 || objc_msgSend(v38, "compare:", v16) == 1))
                {
                  v21 = v16;

                  v22 = v12;
                  v36 = v22;
                  v38 = v21;
                }
              }
              else
              {
                PLLogSubmission();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v48 = v13;
                  _os_log_debug_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_DEBUG, "LogFile %@ within requested interval.\n", buf, 0xCu);
                }

                objc_msgSend(v35, "addObject:", v12);
                v37 &= objc_msgSend(v40, "compare:", v16) != 0;
              }
            }
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
      }
      while (v9);

      v24 = v36;
      if ((v37 & (v36 != 0)) == 1)
      {
        PLLogSubmission();
        v25 = objc_claimAutoreleasedReturnValue();
        v6 = v33;
        v2 = v34;
        v26 = v38;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFileMSS getFileList].cold.1();

        objc_msgSend(v35, "addObject:", v36);
      }
      else
      {
        v6 = v33;
        v2 = v34;
        v26 = v38;
      }
    }
    else
    {

      v26 = 0;
      v24 = 0;
    }
    PLLogSubmission();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "endDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 138413570;
      v48 = v39;
      v49 = 2112;
      v50 = v30;
      v51 = 2112;
      v52 = v40;
      v53 = 2112;
      v54 = v31;
      v55 = 1024;
      v56 = v32;
      v57 = 2112;
      v58 = v35;
      _os_log_debug_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEBUG, "Microstackshots files from %@(%@) to %@(%@): %d files found (%@)\n", buf, 0x3Au);

    }
    v27 = v35;

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)submit
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1B6AB6000, a2, v4, "submit FileMSS:submit = %@", v5);

  OUTLINED_FUNCTION_2_1();
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Flushing microstackshots timed out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)collectMSS
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Directory %@ creation failed: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)generateMSS
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  _os_log_debug_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEBUG, "Generating MSS with start date %@ and end date %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getFileList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Add last file %@ to the list\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
