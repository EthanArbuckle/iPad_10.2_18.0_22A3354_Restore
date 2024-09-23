@implementation PLFetchRecorder

+ (BOOL)isCurrentProcessEnabledForRecordingBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (MEMORY[0x19AEC04BC]()
    && ((PLIsAssetsd() & 1) != 0
     || (PLIsPTPD() & 1) != 0
     || (PLIsPhotosAppAnyPlatform() & 1) != 0
     || (PLIsInternalTool() & 1) != 0
     || (PLIsPhotoPicker() & 1) != 0
     || (PLIsPhotosMessagesApp() & 1) != 0
     || (PLIsMediaanalysisd() & 1) != 0
     || PLIsPhotoanalysisd())
    && objc_msgSend(v3, "isSystemPhotoLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:inDomain:", CFSTR("com.apple.photos.lofr.enabled"), *MEMORY[0x1E0CB2B58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
    }
    else
    {
      if (isCurrentProcessEnabledForRecordingBundle__onceToken != -1)
        dispatch_once(&isCurrentProcessEnabledForRecordingBundle__onceToken, &__block_literal_global_101196);
      v6 = isCurrentProcessEnabledForRecordingBundle__launchedForTesting == 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_stopRecording
{
  os_unfair_lock_s *p_stateLock;
  NSObject *v4;
  PLFetchRecording *recording;
  uint8_t v6[16];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_recording)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "LOFR Stopping recording...", v6, 2u);
    }

    -[PLFetchRecorder _stopWatchingRecordingFile](self, "_stopWatchingRecordingFile");
    recording = self->_recording;
    self->_recording = 0;

  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)_startWatchingRecordingFile
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_source *fileWatcherSource;
  void *v8;
  uint8_t v9[16];
  _QWORD handler[4];
  id v11;
  id location;

  if (self->_fileWatcherSource)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchRecorder.m"), 227, CFSTR("Cannot start watching when watcher already set."));

  }
  v3 = -[PLFetchRecording fd](self->_recording, "fd");
  v4 = dispatch_source_create(MEMORY[0x1E0C80DE8], v3, 1uLL, (dispatch_queue_t)self->_fileWatcherQueue);
  objc_initWeak(&location, self);
  if (v4)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__PLFetchRecorder__startWatchingRecordingFile__block_invoke;
    handler[3] = &unk_1E3677D48;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v4, handler);
    dispatch_activate(v4);
    objc_destroyWeak(&v11);
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "LOFR Cannot create file watcher for fetch recorder.", v9, 2u);
    }

  }
  fileWatcherSource = self->_fileWatcherSource;
  self->_fileWatcherSource = (OS_dispatch_source *)v4;

  objc_destroyWeak(&location);
}

- (void)_stopWatchingRecordingFile
{
  NSObject *fileWatcherSource;

  fileWatcherSource = self->_fileWatcherSource;
  if (fileWatcherSource)
  {
    dispatch_source_cancel(fileWatcherSource);
    fileWatcherSource = self->_fileWatcherSource;
  }
  self->_fileWatcherSource = 0;

}

- (void)_startRecording
{
  os_unfair_lock_s *p_stateLock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLFetchRecording *v14;
  PLFetchRecording *recording;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_recording)
  {
LABEL_12:
    os_unfair_lock_unlock(p_stateLock);
    return;
  }
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "LOFR Starting recording...", buf, 2u);
  }

  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("lofr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) != 0)
  {
LABEL_7:
    +[PLFetchRecording suggestedFilenameForCurrentProcess](PLFetchRecording, "suggestedFilenameForCurrentProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLFetchRecording initWithMode:atFileURL:size:]([PLFetchRecording alloc], "initWithMode:atFileURL:size:", 1, v13, 3145728);
    recording = self->_recording;
    self->_recording = v14;

    if (self->_recording)
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "LOFR Started recording to path: %@", buf, 0xCu);
      }

      -[PLFetchRecorder _startWatchingRecordingFile](self, "_startWatchingRecordingFile");
    }

    goto LABEL_12;
  }
  v18 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v18);
  v9 = v18;
  v10 = v9;
  if ((v8 & 1) != 0)
  {

    goto LABEL_7;
  }
  PLBackendGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "LOFR Can't create dir: %@, error: %@", buf, 0x16u);
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)managedObjectContext:(id)a3 willExecuteFetchRequest:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "databaseStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("lofr_preStats"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("lofr_statementStartTime"));
}

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  os_unfair_lock_s *p_stateLock;
  PLFetchRecording *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double Current;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v37 = a7;
  v38 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v38, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lofr_preStats"));
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("lofr_statementStartTime"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v17;
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v38, "databaseStatistics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v15;
  objc_msgSend(v20, "databaseStatisticsBySubtracting:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __100__PLFetchRecorder_managedObjectContext_didExecuteFetchRequest_withSQLString_bindVariables_rowCount___block_invoke;
  v39[3] = &unk_1E3677D70;
  v23 = v22;
  v40 = v23;
  v24 = v13;
  v41 = v24;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v39);
  if (objc_msgSend(v11, "fetchLimit"))
  {
    if (objc_msgSend(v23, "length"))
      objc_msgSend(v23, "appendString:", CFSTR(", "));
    objc_msgSend(v23, "appendFormat:", CFSTR("%lu"), objc_msgSend(v11, "fetchLimit"));
  }
  v36 = v12;
  v25 = (void *)objc_msgSend((id)objc_opt_class(), "generalizedSQLFromSQL:bindVariables:fromFetchRequest:", v12, v24, v11);
  v27 = v26;
  -[PLFetchRecorder _startRecording](self, "_startRecording");
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v29 = self->_recording;
  os_unfair_lock_unlock(p_stateLock);
  objc_msgSend(v38, "description");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v21, "cacheHitPages");
  v32 = objc_msgSend(v21, "cacheMissPages");
  Current = CFAbsoluteTimeGetCurrent();
  -[PLFetchRecording recordStatementWithNormalizedSQL:bindVariablesAsString:multiInCounts:contextName:pagesHit:pagesMissed:rowCount:duration:QOS:](v29, "recordStatementWithNormalizedSQL:bindVariablesAsString:multiInCounts:contextName:pagesHit:pagesMissed:rowCount:duration:QOS:", v25, v23, v27, v30, v31, v32, Current - v19, __PAIR64__(qos_class_self(), v37));

}

- (PLFetchRecorder)init
{
  PLFetchRecorder *v2;
  PLFetchRecorder *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *fileWatcherQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLFetchRecorder;
  v2 = -[PLFetchRecorder init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.photos.lofr.filewatcher", v5);
    fileWatcherQueue = v3->_fileWatcherQueue;
    v3->_fileWatcherQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileWatcherSource, 0);
  objc_storeStrong((id *)&self->_fileWatcherQueue, 0);
  objc_storeStrong((id *)&self->_recording, 0);
}

void __100__PLFetchRecorder_managedObjectContext_didExecuteFetchRequest_withSQLString_bindVariables_rowCount___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%f"), v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@"), v6);
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 2
    && objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  }

}

void __46__PLFetchRecorder__startWatchingRecordingFile__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopRecording");
    objc_msgSend(v2, "_startRecording");
    WeakRetained = v2;
  }

}

+ (id)_generalizedStringByFactoringOutLimitClauseFrom:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v4 = objc_msgSend(CFSTR("LIMIT "), "length");
  v5 = objc_msgSend(v3, "length") + ~v4;
  if (v5 <= 100)
    v5 = 100;
  v6 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("LIMIT "), 4, v5 - 100, objc_msgSend(v3, "length") - (v5 - 100));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    v8 = objc_msgSend(v3, "length");
    if (v8 != 0x8000000000000000)
    {
      v9 = v8 - v7;
      objc_msgSend(v3, "substringWithRange:", v7, v8 - v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v10, CFSTR("LIMIT N"), 0, v7, v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v11;
    }
  }
  return v3;
}

+ (PLFetchRecorderSQLGeneralizationResult)_generalizedStringByFactoringOutInClausesFromSQL:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PLFetchRecorderSQLGeneralizationResult result;

  v3 = a3;
  v4 = objc_msgSend(CFSTR("IN  (?,?"), "length");
  v5 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v7 = objc_msgSend(v3, "length");
    v8 = (~v4 - v5 + v7) & ~((~v4 - v5 + v7) >> 63);
    v9 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("IN  (?,?"), 4, v8, objc_msgSend(v3, "length") - v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v10 = v9;
    v11 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR(")"), 0, v10, objc_msgSend(v3, "length") - v10);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v12 = v11 - v10 + 1;
    objc_msgSend(v3, "substringWithRange:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("?"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") - 1;

    if (v15 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertObject:atIndex:", v16, 0);

      objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v13, CFSTR("IN (*)"), 0, v10, v12);
      v17 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v17;
    }

  }
  v18 = v3;
  v19 = v6;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

+ (id)_paramStringFromBindVariableComponent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BYTE dcm[24];

  v3 = a3;
  memset(dcm, 0, 20);
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "decimalValue");
  else
    memset(dcm, 0, 20);

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("e")) & 1) != 0 || !objc_msgSend(v6, "scanDecimal:", dcm))
  {
    v7 = 0;
  }
  else
  {
    NSDecimalString((const NSDecimal *)dcm, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "length");
  if (v8 == objc_msgSend(v3, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7, *(_QWORD *)dcm, *(_QWORD *)&dcm[8], *(_QWORD *)&dcm[16]);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v3, *(_QWORD *)dcm, *(_QWORD *)&dcm[8], *(_QWORD *)&dcm[16]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)_isRecordingFileFromURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("lofr"));

  if (v5)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("lofr"));

    }
  }

  return v5;
}

+ (id)_findRecordingsWithinURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x19AEC1554]();
  v7 = objc_alloc(MEMORY[0x1E0D73210]);
  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFilePath:", v8);

  objc_msgSend(v9, "setContinueAfterError:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__PLFetchRecorder__findRecordingsWithinURL___block_invoke;
  v12[3] = &unk_1E3677D20;
  v14 = a1;
  v10 = v5;
  v13 = v10;
  objc_msgSend(v9, "visitURLsLoadingPropertiesForKeys:withBlock:", MEMORY[0x1E0C9AA60], v12);

  objc_autoreleasePoolPop(v6);
  return v10;
}

+ (id)fileURLsToExistingRecordings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_findRecordingsWithinURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionOrderedSet:", v7);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/Containers/Data/PluginKitPlugin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_findRecordingsWithinURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionOrderedSet:", v9);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/tmp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_findRecordingsWithinURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionOrderedSet:", v11);

  objc_msgSend(v3, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (PLFetchRecorderSQLGeneralizationResult)generalizedSQLFromSQL:(id)a3 bindVariables:(id)a4 fromFetchRequest:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  PLFetchRecorderPredicateVisitor *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLFetchRecorderSQLGeneralizationResult result;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  v11 = v10;
  if (objc_msgSend(v9, "fetchLimit"))
  {
    objc_msgSend((id)objc_opt_class(), "_generalizedStringByFactoringOutLimitClauseFrom:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    goto LABEL_8;
  v12 = objc_alloc_init(PLFetchRecorderPredicateVisitor);
  objc_msgSend(v9, "predicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFetchRecorderPredicateVisitor examinePredicate:](v12, "examinePredicate:", v13);

  if (!-[PLFetchRecorderPredicateVisitor foundOperatorIN](v12, "foundOperatorIN"))
  {

LABEL_8:
    v16 = 0;
LABEL_9:
    v14 = v11;
    goto LABEL_10;
  }
  v14 = (id)objc_msgSend((id)objc_opt_class(), "_generalizedStringByFactoringOutInClausesFromSQL:", v11);
  v16 = v15;

  if (!v14)
    goto LABEL_9;
LABEL_10:
  if (objc_msgSend(v14, "isEqualToString:", v10) && (unint64_t)objc_msgSend(v8, "count") >= 0x33)
  {

    v14 = 0;
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  v17 = v14;
  v18 = v16;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

+ (id)sqlFromGeneralizedSQL:(id)a3 bindVars:(id)a4 multiInCounts:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  id *v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__PLFetchRecorder_sqlFromGeneralizedSQL_bindVars_multiInCounts_error___block_invoke;
  v24[3] = &unk_1E3677DB8;
  v29 = v34;
  v17 = v14;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v31 = a1;
  v19 = v12;
  v27 = v19;
  v30 = v33;
  v32 = a6;
  v20 = v16;
  v28 = v20;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v24);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);

  return v22;
}

void __70__PLFetchRecorder_sqlFromGeneralizedSQL_bindVars_multiInCounts_error___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  int v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  v33 = a2;
  v5 = objc_msgSend(v33, "hasPrefix:", CFSTR("?"));
  v6 = v33;
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = v33;
    if (v7 < v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 80), "_paramStringFromBindVariableComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", v11);

      objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), &stru_1E36789C0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
        objc_msgSend(*(id *)(a1 + 40), "appendString:", v12);
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(" "));
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

      goto LABEL_28;
    }
  }
  if (!objc_msgSend(v6, "hasPrefix:", CFSTR("(?)"))
    || (v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v13 >= objc_msgSend(*(id *)(a1 + 32), "count")))
  {
    if (objc_msgSend(v33, "hasPrefix:", CFSTR("(*)")))
    {
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("("));
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v17 >= 1)
      {
        for (i = 0; v17 != i; ++i)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          if (v19 >= objc_msgSend(*(id *)(a1 + 32), "count"))
            break;
          v20 = i + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          if (v20 >= objc_msgSend(*(id *)(a1 + 32), "count"))
          {
            v24 = *(_QWORD **)(a1 + 88);
            if (!v24 || *v24)
              continue;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LOFR index out of bounds: %ld, item count: %ld"), v20, objc_msgSend(*(id *)(a1 + 32), "count"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = PLErrorCreate();
            v26 = *(void ***)(a1 + 88);
            v27 = *v26;
            *v26 = (void *)v25;

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 80), "_paramStringFromBindVariableComponent:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "appendString:", v23);

            if (v17 - 1 > i)
              objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(", "));
          }

        }
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v17;
      v28 = *(void **)(a1 + 40);
      v29 = CFSTR(") ");
    }
    else
    {
      if (objc_msgSend(v33, "isEqualToString:", CFSTR("N")))
      {
        v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        if (v30 < objc_msgSend(*(id *)(a1 + 32), "count"))
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v9, "integerValue");
          if (v31)
            v32 = v31;
          else
            v32 = -1;
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%ld"), v32);
          goto LABEL_28;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v33);
      if (objc_msgSend(*(id *)(a1 + 56), "count") - 1 <= a3)
        goto LABEL_32;
      v28 = *(void **)(a1 + 40);
      v29 = CFSTR(" ");
    }
    objc_msgSend(v28, "appendString:", v29);
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 80), "_paramStringFromBindVariableComponent:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendFormat:", CFSTR("(%@)"), v15);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
LABEL_28:

LABEL_32:
}

void __61__PLFetchRecorder_isCurrentProcessEnabledForRecordingBundle___block_invoke()
{
  id v0;

  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isCurrentProcessEnabledForRecordingBundle__launchedForTesting = objc_msgSend(v0, "launchedToTest");

}

uint64_t __44__PLFetchRecorder__findRecordingsWithinURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 40), "_isRecordingFileFromURL:", v3))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

@end
