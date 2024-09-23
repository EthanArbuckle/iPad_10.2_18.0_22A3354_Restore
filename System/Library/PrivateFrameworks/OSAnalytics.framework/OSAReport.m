@implementation OSAReport

+ (id)findBundleAtPath:(id)a3 withKeys:(id)a4 bundleURL:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  v31 = (id)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)MEMORY[0x1A85A7FC8]();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (findBundleAtPath_withKeys_bundleURL__onceToken != -1)
    dispatch_once(&findBundleAtPath_withKeys_bundleURL__onceToken, &__block_literal_global_116);
  if (v21[5])
  {
    v11 = findBundleAtPath_withKeys_bundleURL__bundle_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2;
    block[3] = &unk_1E4DEE378;
    v18 = &v20;
    v17 = v8;
    v19 = &v26;
    dispatch_sync(v11, block);
    objc_msgSend((id)v21[5], "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setString:", v12);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v33 = v7;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no URL for '%{private}@'", buf, 0xCu);
  }
  _Block_object_dispose(&v20, 8);

  objc_autoreleasePoolPop(v10);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend((id)v27[5], "count"))
    v13 = (void *)v27[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v26, 8);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldLogFile, 0);
  objc_storeStrong((id *)&self->_etlKey, 0);
  objc_storeStrong((id *)&self->_logfile, 0);
  objc_storeStrong((id *)&self->_logWritingOptions, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
}

- (id)incidentID
{
  NSString *incidentID;
  const __CFAllocator *v4;
  const __CFUUID *v5;
  __CFString *v6;
  NSString *v7;
  __CFString *v8;

  incidentID = self->_incidentID;
  if (!incidentID)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v6 = (__CFString *)CFUUIDCreateString(v4, v5);
    v7 = self->_incidentID;
    self->_incidentID = &v6->isa;

    CFRelease(v5);
    incidentID = self->_incidentID;
  }
  if (incidentID)
    v8 = (__CFString *)incidentID;
  else
    v8 = CFSTR("<incident x>");
  return v8;
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a2;
  if (v3 && !*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    v26 = __Block_byref_object_dispose__5;
    v27 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", &unk_1E4DFDB28);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLValue");

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88;
      v15[3] = &unk_1E4DEE308;
      v16 = *(id *)(a1 + 32);
      v7 = v4;
      v8 = *(_QWORD *)(a1 + 56);
      v17 = v7;
      v18 = v8;
      v19 = &v22;
      v20 = v6;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);
      v9 = v17;
      v10 = v7;

      v11 = v10;
    }
    else
    {
      v12 = (id *)(v23 + 5);
      obj = (id)v23[5];
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, &obj);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v12, obj);
      objc_msgSend(v10, "subdataWithRange:", 0, objc_msgSend(v10, "length") - 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "section_push:", CFSTR("\n}\n"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "count") != 0;
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v13, v14);
    _Block_object_dispose(&v22, 8);

  }
}

uint64_t __29__OSAReport_saveWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "writeData:", a2);
  return 0;
}

- (BOOL)saveWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *logWritingOptions;
  void *v9;
  id v10;
  BOOL v11;
  BOOL v12;
  NSString *v13;
  NSString *logfile;
  NSString *v15;
  NSString *oldLogFile;
  void *v17;
  _BOOL4 v18;
  void *v19;
  double capture_time;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t i;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  _BYTE v38[128];
  _QWORD v39[2];
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[OSAReport isActionable](self, "isActionable"))
  {
    if (-[NSMutableArray count](self->_notes, "count"))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = self->_notes;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v33;
        v28 = MEMORY[0x1E0C81028];
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v33 != v27)
              objc_enumerationMutation(v25);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v30 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              *(_DWORD *)buf = 138412290;
              v41 = v30;
              _os_log_impl(&dword_1A4D21000, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
            }
          }
          v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v26);
      }

    }
    else
    {
      v12 = 0;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "report not saved because it is non-actionable (ie: extension hangs or internal-only)", buf, 2u);
    }
    v12 = 0;
    goto LABEL_27;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](self->_logWritingOptions, "addEntriesFromDictionary:", v4);
  -[OSAReport reportNamePrefix](self, "reportNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_logWritingOptions, "setObject:forKeyedSubscript:", v5, CFSTR("override-filePrefix"));

  -[OSAReport problemType](self, "problemType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSAReport additionalIPSMetadata](self, "additionalIPSMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  logWritingOptions = self->_logWritingOptions;
  v36[4] = self;
  v37 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __29__OSAReport_saveWithOptions___block_invoke;
  v36[3] = &unk_1E4DEE2E0;
  +[OSALog createForSubmission:metadata:options:error:writing:](OSALog, "createForSubmission:metadata:options:error:writing:", v6, v7, logWritingOptions, &v37, v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v37;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v9, "filepath");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  logfile = self->_logfile;
  self->_logfile = v13;

  objc_msgSend(v9, "oldFilePath");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  oldLogFile = self->_oldLogFile;
  self->_oldLogFile = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("override-filePath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    -[OSAReport appleCareDetails](self, "appleCareDetails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      capture_time = self->_capture_time;
      -[OSAReport problemType](self, "problemType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v21;
      -[OSAReport incidentID](self, "incidentID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      logForAppleCare(v24, capture_time);

    }
  }

LABEL_27:
  return v12;
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2(uint64_t a1)
{
  __CFBundle *v2;
  __CFBundle *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
  if (v2)
  {
    v3 = v2;
    v4 = CFBundleCopyBundleURL(v2);
    if (v4 && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqual:", v4) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v42 = v5;
        v43 = 2112;
        v44 = v4;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "CFBundle URL refined %@ to %@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          v11 = *(const __CFString **)(*((_QWORD *)&v35 + 1) + 8 * i);
          CFBundleGetValueForInfoDictionaryKey(v3, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);
    }

    CFRelease(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "*** found alternate bundle", buf, 2u);
      }
      objc_msgSend(v4, "bundleURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqual:", v13) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v42 = v14;
          v43 = 2112;
          v44 = v13;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "NSBundle URL refined %@ to %@", buf, 0x16u);
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v13);
      }
      objc_msgSend(v4, "infoDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v16 = *(id *)(a1 + 32);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v32 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v15, "objectForKeyedSubscript:", v21, (_QWORD)v31);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v22, v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v18);
      }

    }
    else
    {
      v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v23)
        __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }

}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.osanalytics.bundlereader.serialqueue", 0);
  v1 = (void *)findBundleAtPath_withKeys_bundleURL__bundle_queue;
  findBundleAtPath_withKeys_bundleURL__bundle_queue = (uint64_t)v0;

}

void __29__OSAReport_saveWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__OSAReport_saveWithOptions___block_invoke_2;
  v6[3] = &unk_1E4DEE2B8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "streamContentAtLevel:withBlock:", 1, v6);

}

- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v4 = a3;
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __44__OSAReport_streamContentAtLevel_withBlock___block_invoke;
  v18 = &unk_1E4DEE330;
  v21 = &v25;
  v8 = v7;
  v19 = v8;
  v22 = v23;
  v9 = v6;
  v20 = v9;
  -[OSAReport generateLogAtLevel:withBlock:](self, "generateLogAtLevel:withBlock:", v4, &v15);
  v10 = *((_DWORD *)v26 + 6);
  if (!v10)
  {
    if (objc_msgSend(v8, "count", v15, v16, v17, v18, v19) != 1)
      __assert_rtn("-[OSAReport streamContentAtLevel:withBlock:]", "OSAReport.m", 499, "[section_stack count] == 1");
    objc_msgSend(v8, "section_pop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (*((uint64_t (**)(id, void *))v9 + 2))(v9, v12);
    *((_DWORD *)v26 + 6) = v13;

    v10 = *((_DWORD *)v26 + 6);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

- (OSAReport)init
{
  OSAReport *v2;
  uint64_t v3;
  NSMutableArray *notes;
  uint64_t v5;
  NSMutableDictionary *logWritingOptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSAReport;
  v2 = -[OSAReport init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    logWritingOptions = v2->_logWritingOptions;
    v2->_logWritingOptions = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)kernelVersionDescription
{
  uint64_t v2;
  size_t v4;
  _BYTE v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(v5, 0x400uLL);
  v4 = 1023;
  v2 = sysctlbyname("kern.version", v5, &v4, 0, 0);
  if ((_DWORD)v2)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown (error %d)>"), v2);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)codeSigningMonitor
{
  size_t v3;
  unsigned int v4;

  v4 = 0;
  v3 = 4;
  if (!sysctlbyname("security.codesigning.monitor", &v4, &v3, 0, 0))
    return v4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[OSAReport codeSigningMonitor].cold.1();
  return -1;
}

+ (id)bootArgs
{
  int v2;
  void *v3;
  size_t v5;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 1023;
  v2 = sysctlbyname("kern.bootargs", v6, &v5, 0, 0);
  v3 = 0;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)problemType
{
  __assert_rtn("-[OSAReport problemType]", "OSAReport.m", 71, "0");
}

- (id)getSyslogForPids:(id)a3 andOptionalSenders:(id)a4 additionalPredicates:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  double Current;
  NSObject *v41;
  dispatch_time_t v42;
  double v43;
  NSObject *v44;
  id v45;
  void *context;
  void *v48;
  void *v49;
  id v51;
  id v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[3];
  int v64;
  id location;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[5];
  uint8_t buf[8];
  uint8_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint8_t v84[32];
  _BYTE v85[128];
  _BYTE v86[128];
  _QWORD v87[5];
  _QWORD v88[7];

  v88[5] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v51 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "appleInternal"))
  {

  }
  else
  {
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "carrierInstall");

    if (!v11)
      goto LABEL_45;
  }
  if (getSyslogForPids_andOptionalSenders_additionalPredicates__onceToken != -1)
    dispatch_once(&getSyslogForPids_andOptionalSenders_additionalPredicates__onceToken, &__block_literal_global_5);
  if (getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj
    && getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj)
  {
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore, 0))
    {
      context = (void *)MEMORY[0x1A85A7FC8]();
      v87[0] = &unk_1E4DFDAB0;
      v87[1] = &unk_1E4DFDAC8;
      v88[0] = CFSTR("default");
      v88[1] = CFSTR("   info");
      v87[2] = &unk_1E4DFDAE0;
      v87[3] = &unk_1E4DFDAF8;
      v88[2] = CFSTR("  debug");
      v88[3] = CFSTR("  error");
      v87[4] = &unk_1E4DFDB10;
      v88[4] = CFSTR("  fault");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 5);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj, "localStore");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v79 = buf;
      v80 = 0x3032000000;
      v81 = __Block_byref_object_copy__5;
      v82 = __Block_byref_object_dispose__5;
      v83 = 0;
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_26;
      v77[3] = &unk_1E4DEE218;
      v77[4] = buf;
      objc_msgSend(v49, "prepareWithCompletionHandler:", v77);
      v12 = (void *)*((_QWORD *)v79 + 5);
      if (v12)
      {
        objc_msgSend(v12, "setFlags:", 13);
        v13 = MEMORY[0x1E0C80D38];
        v14 = MEMORY[0x1E0C80D38];
        objc_msgSend(*((id *)v79 + 5), "setTarget:", v13);

        v74 = 0;
        v75[0] = &v74;
        v75[1] = 0x3032000000;
        v75[2] = __Block_byref_object_copy__5;
        v75[3] = __Block_byref_object_dispose__5;
        v76 = 0;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v16 = v52;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v71 != v18)
                objc_enumerationMutation(v16);
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("processID == %@"), *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v20);

            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
          }
          while (v17);
        }

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v21 = v51;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v67;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v67 != v23)
                objc_enumerationMutation(v21);
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("senderImagePath CONTAINS[cd] %@"), *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v25);

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
          }
          while (v22);
        }

        if (v7)
          objc_msgSend(v15, "addObjectsFromArray:", v7);
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v15);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v79 + 5), "setFilterPredicate:", v26);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.4((uint64_t)v26);

        }
        else
        {
          v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
          if (v27)
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_capture_time + 0.5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dateByAddingTimeInterval:", -300.0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, *((id *)v79 + 5));
        v63[0] = 0;
        v63[1] = v63;
        v63[2] = 0x2020000000;
        v64 = 0;
        v61[0] = 0;
        v61[1] = v61;
        v61[2] = 0x3032000000;
        v61[3] = __Block_byref_object_copy__5;
        v61[4] = __Block_byref_object_dispose__5;
        v62 = 0;
        v37 = (void *)*((_QWORD *)v79 + 5);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_35;
        v54[3] = &unk_1E4DEE240;
        v58 = v61;
        v59 = v63;
        v38 = v36;
        v55 = v38;
        v56 = v48;
        v8 = v8;
        v57 = v8;
        objc_copyWeak(&v60, &location);
        objc_msgSend(v37, "setEventHandler:", v54);
        v39 = (void *)*((_QWORD *)v79 + 5);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_2;
        v53[3] = &unk_1E4DEE268;
        v53[4] = &v74;
        objc_msgSend(v39, "setInvalidationHandler:", v53);
        Current = CFAbsoluteTimeGetCurrent();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.2((uint64_t)v38, (uint64_t)v35);
        objc_msgSend(*((id *)v79 + 5), "activateStreamFromDate:", v35);
        v41 = getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
        v42 = dispatch_time(0, 120000000000);
        if (dispatch_semaphore_wait(v41, v42))
        {

          v8 = 0;
        }
        else
        {
          v43 = CFAbsoluteTimeGetCurrent();
          v44 = MEMORY[0x1E0C81028];
          v45 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.1((uint64_t)v75, v84, objc_msgSend(v8, "count"), v43 - Current);

          if (objc_msgSend(v8, "count"))
            objc_msgSend(v8, "addObject:", CFSTR("Timestamp                         Type Thread  Act Process[pid] (Sender)"));
          dispatch_semaphore_signal((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore);
        }
        objc_msgSend(*((id *)v79 + 5), "invalidate");
        objc_destroyWeak(&v60);

        _Block_object_dispose(v61, 8);
        _Block_object_dispose(v63, 8);
        objc_destroyWeak(&location);

        _Block_object_dispose(&v74, 8);
      }
      _Block_object_dispose(buf, 8);

      objc_autoreleasePoolPop(context);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "OSLogEvent unsupported in this environment", buf, 2u);
  }
LABEL_45:

  return v8;
}

Class __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  Class result;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
  getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore = (uint64_t)v0;

  getSyslogForPids_andOptionalSenders_additionalPredicates__loggingSupport_dylib = (uint64_t)dlopen("/System/Library/PrivateFrameworks/LoggingSupport.framework/LoggingSupport", 4);
  getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj = (uint64_t)objc_getClass("OSLogEventStore");
  result = objc_getClass("OSLogEventStream");
  getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj = (uint64_t)result;
  return result;
}

void __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_26(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!a3)
  {
    v4 = (objc_class *)getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj;
    v5 = a2;
    v6 = objc_msgSend([v4 alloc], "initWithSource:", v5);

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_35(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *WeakRetained;
  void *v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;

  v35 = a2;
  v3 = objc_msgSend(v35, "type") == 1024;
  v4 = v35;
  if (v3)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(v35, "bootUUID");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(_DWORD *)(v8 + 24);
    *(_DWORD *)(v8 + 24) = v9 + 1;
    if (v9 <= 126)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v35, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "compare:", v11) == -1)
      {
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(v35, "bootUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "isEqual:", v13);

        if ((_DWORD)v12)
        {
          v14 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "logType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v15);
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "composedMessage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v17, "length");
          if (v34 < 1025)
            goto LABEL_15;
          objc_msgSend(v17, "substringToIndex:", 1024);
          for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
          {
            v19 = (void *)i;

            v17 = v19;
LABEL_15:
            v20 = objc_msgSend(v17, "rangeOfString:", CFSTR("\n"));
            if (v20)
              break;
            objc_msgSend(v17, "substringFromIndex:", 1);
          }
          v21 = v20;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v17, "substringToIndex:", v20);
            v22 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v22;
          }
          v33 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v35, "date", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          OSANSDateFormat(2u, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v35, "threadIdentifier");
          v26 = objc_msgSend(v35, "activityIdentifier");
          objc_msgSend(v35, "process");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v35, "processIdentifier");
          objc_msgSend(v35, "sender");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v17, "length");
          v31 = CFSTR("...");
          if (v30 == v34)
            v31 = &stru_1E4DEECB8;
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ %@ 0x%05llx 0x%llx %@[%d] (%@): %@%@"), v24, WeakRetained, v25, v26, v27, v28, v29, v17, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v32, "length"))
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v32);

          goto LABEL_12;
        }
      }
      else
      {

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "invalidate");
LABEL_12:

    v4 = v35;
  }

}

intptr_t __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%lu>"), a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  switch(a2)
  {
    case 3:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      v9 = CFSTR("invalid position");
      break;
    case 2:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      v9 = CFSTR("backlog");
      break;
    case 1:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      v9 = CFSTR("disconnected");
      break;
    default:
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;
      goto LABEL_9;
  }
  *(_QWORD *)(v7 + 40) = v9;
LABEL_9:

  return dispatch_semaphore_signal((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore);
}

+ (unsigned)executeWithTimeout:(unsigned int)a3 Code:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v12;

  v5 = a4;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__OSAReport_executeWithTimeout_Code___block_invoke;
  block[3] = &unk_1E4DEE290;
  v12 = v5;
  v8 = v5;
  dispatch_group_async(v7, v6, block);
  v9 = dispatch_time(0, 1000000 * a3);
  LOBYTE(a3) = dispatch_group_wait(v7, v9) != 0;

  return a3;
}

uint64_t __37__OSAReport_executeWithTimeout_Code___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isAppleTV
{
  _BOOL4 v2;
  BOOL result;
  uint8_t v5[16];
  size_t v6;
  _DWORD v7[32];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 128;
  if (!sysctlbyname("hw.machine", v7, &v6, 0, 0))
    return v7[0] == 1819308097 && *(_DWORD *)((char *)v7 + 3) == 1448371564;
  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v2)
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to run sysctl hw.machine", v5, 2u);
    return 0;
  }
  return result;
}

- (double)captureTime
{
  return self->_capture_time;
}

+ (id)systemIDWithDescription:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  CFTypeID v8;
  __CFString *v9;
  const __CFString *v10;

  v3 = a3;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "appleInternal");

  if (v5)
  {
    v6 = (const __CFString *)MGCopyAnswer();
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      if (v8 != CFStringGetTypeID())
      {
        CFRelease(v7);
        v7 = CFSTR("ERROR UDID was not a string");
      }
    }
    else
    {
      v7 = CFSTR("UDID was null");
    }
    if (v3)
      v10 = CFSTR("UDID:                %@\n");
    else
      v10 = CFSTR("%@");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }
  else
  {
    v9 = &stru_1E4DEECB8;
  }
  return v9;
}

+ (id)bootSessionUUID
{
  int v2;
  void *v3;
  size_t v5;
  _BYTE v6[37];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  v5 = 37;
  v2 = sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0);
  v3 = 0;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)appleCareDetails
{
  __assert_rtn("-[OSAReport appleCareDetails]", "OSAReport.m", 334, "0");
}

- (id)reportNamePrefix
{
  __assert_rtn("-[OSAReport reportNamePrefix]", "OSAReport.m", 339, "0");
}

- (BOOL)isActionable
{
  return 1;
}

- (id)additionalIPSMetadata
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("incident_id");
  -[OSAReport incidentID](self, "incidentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  id v4;

  v4 = a4;
  __assert_rtn("-[OSAReport generateLogAtLevel:withBlock:]", "OSAReport.m", 355, "0");
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqual:", &unk_1E4DFDB40))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_1();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(*(id *)(a1 + 32), "count") - 1, CFSTR(" "), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
    objc_msgSend(v8, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v10);

    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "section_pop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", v13);

    v14 = a1 + 48;
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isEqual:", &unk_1E4DFDB28) & 1) == 0)
  {
    v14 = a1 + 48;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", ",", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendData:", v16);

    }
    v17 = *(void **)(a1 + 40);
    objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", (2 * objc_msgSend(*(id *)(a1 + 32), "count")) | 1, CFSTR(" "), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendData:", v19);

    if (objc_msgSend(v5, "isEqual:", &unk_1E4DFDB58))
    {
      v20 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" : {"), v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dataUsingEncoding:allowLossyConversion:", 4, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendData:", v22);

      v23 = *(void **)(a1 + 32);
      v24 = CFSTR("}");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqual:", &unk_1E4DFDB70))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_2();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = *(void **)(a1 + 40);
          v29 = (void *)MEMORY[0x1E0CB3940];
          v30 = v6;
          if (v30)
          {
            v31 = (void *)MEMORY[0x1A85A7FC8]();
            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v30, 4, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v32, 4);
              objc_msgSend(v33, "substringWithRange:", 1, objc_msgSend(v33, "length") - 2);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v34 = 0;
            }

            objc_autoreleasePoolPop(v31);
          }
          else
          {
            v34 = 0;
          }

          objc_msgSend(v29, "stringWithFormat:", CFSTR("\"%@\" : \"%@\"), v5, v34);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 1;
          objc_msgSend(v45, "dataUsingEncoding:allowLossyConversion:", 4, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "appendData:", v46);

        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v36 = *(void **)(a1 + 40);
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" : %@"), v5, v6);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = 1;
            objc_msgSend(v37, "dataUsingEncoding:allowLossyConversion:", 4, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "appendData:", v38);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" : "), v5);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = 1;
            objc_msgSend(v39, "dataUsingEncoding:allowLossyConversion:", 4, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "appendData:", v40);

            v41 = *(void **)(a1 + 40);
            v42 = *(_QWORD *)(a1 + 64);
            v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            obj = *(id *)(v43 + 40);
            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, v42, &obj);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)(v43 + 40), obj);
            objc_msgSend(v41, "appendData:", v44);

          }
        }
        goto LABEL_12;
      }
      v25 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" : ["), v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dataUsingEncoding:allowLossyConversion:", 4, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appendData:", v27);

      v23 = *(void **)(a1 + 32);
      v24 = CFSTR("]");
    }
    objc_msgSend(v23, "section_push:", v24);
    v9 = 0;
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v14 + 8) + 24) = v9;
  }

}

+ (id)reduceToTwoSigFigures:(unint64_t)a3
{
  unint64_t v3;
  unsigned int v4;
  double v5;

  v3 = a3;
  if (a3)
  {
    v4 = log10((double)a3);
    if (v4 + 1 >= 3)
    {
      v5 = __exp10((double)(v4 - 1));
      v3 = v3 / (unint64_t)v5 * (unint64_t)v5;
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
}

- (double)capture_time
{
  return self->_capture_time;
}

- (NSArray)notes
{
  return &self->_notes->super;
}

- (NSString)logfile
{
  return self->_logfile;
}

- (NSString)etlKey
{
  return self->_etlKey;
}

- (void)setEtlKey:(id)a3
{
  objc_storeStrong((id *)&self->_etlKey, a3);
}

- (NSString)oldLogFile
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)getSyslogForPids:(uint64_t)a3 andOptionalSenders:(double)a4 additionalPredicates:.cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, double a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_DWORD *)buf = 134218498;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = v4;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "OSLogEventStream found %lu lines after %.1f secs (invalidation: %@)", buf, 0x20u);
}

- (void)getSyslogForPids:(uint64_t)a1 andOptionalSenders:(uint64_t)a2 additionalPredicates:.cold.2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "OSLogEventStream enumerate from %@ to %@", (uint8_t *)&v2, 0x16u);
}

- (void)getSyslogForPids:(uint64_t)a3 andOptionalSenders:(uint64_t)a4 additionalPredicates:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "OSLogEventStream query ALL", a5, a6, a7, a8, 0);
}

- (void)getSyslogForPids:(uint64_t)a1 andOptionalSenders:additionalPredicates:.cold.4(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "OSLogEventStream query '%@'", (uint8_t *)&v1, 0xCu);
}

+ (void)codeSigningMonitor
{
  int v0;
  int *v1;
  char *v2;
  _DWORD v3[2];
  __int16 v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1 = __error();
  v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  v4 = 2082;
  v5 = v2;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error getting security.codesigning.monitor: %d %{public}s", (uint8_t *)v3, 0x12u);
}

- (void)saveWithOptions:(void *)a1 .cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error while writing report payload: %{public}@", buf, 0xCu);

}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_1()
{
  __assert_rtn("-[OSAReport streamContentAtLevel:withBlock:]_block_invoke", "OSAReport.m", 455, "[section_stack count]");
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_2()
{
  __assert_rtn("-[OSAReport streamContentAtLevel:withBlock:]_block_invoke", "OSAReport.m", 488, "0");
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "no bundle found", a5, a6, a7, a8, 0);
}

@end
