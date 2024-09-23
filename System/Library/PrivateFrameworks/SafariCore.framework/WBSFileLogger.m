@implementation WBSFileLogger

- (void)_removeOldLogs
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSUInteger v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -self->_maximumLogAgeInDays;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, v4, v5, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v25 = v3;
  objc_msgSend(v7, "setCalendar:", v3);
  v29 = v7;
  objc_msgSend(v7, "setDateFormat:", CFSTR("_yyyy-MM-dd"));
  v8 = -[NSString length](self->_logName, "length");
  v9 = objc_msgSend(CFSTR("_yyyy-MM-dd"), "length");
  v10 = objc_msgSend(CFSTR(".log"), "length");
  v28 = -[NSString length](self->_logName, "length");
  v27 = objc_msgSend(CFSTR("_yyyy-MM-dd"), "length");
  v23 = v6;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_directoryURL, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v9 + v10 + v8;
    v15 = *(_QWORD *)v31;
    v16 = CFSTR(".log");
    v26 = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length") == v14
          && objc_msgSend(v19, "hasPrefix:", self->_logName)
          && objc_msgSend(v19, "hasSuffix:", v16))
        {
          v20 = v16;
          objc_msgSend(v19, "substringWithRange:", v28, v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "dateFromString:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 && objc_msgSend(v25, "compareDate:toDate:toUnitGranularity:", v22, v24, 16) == -1)
            objc_msgSend(v23, "removeItemAtURL:error:", v18, 0);

          v16 = v20;
          v11 = v26;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

}

uint64_t __60__WBSFileLogger_initWithDirectoryURL_logName_maximumLogAge___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_removeOldLogs");
}

- (WBSFileLogger)initWithDirectoryURL:(id)a3 logName:(id)a4 maximumLogAge:(unint64_t)a5
{
  id v9;
  id v10;
  WBSFileLogger *v11;
  uint64_t v12;
  NSString *logName;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *logQueue;
  NSObject *v17;
  WBSFileLogger *v18;
  WBSFileLogger *v19;
  _QWORD block[4];
  WBSFileLogger *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WBSFileLogger;
  v11 = -[WBSFileLogger init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    logName = v11->_logName;
    v11->_logName = (NSString *)v12;

    v11->_maximumLogAgeInDays = a5;
    objc_storeStrong((id *)&v11->_directoryURL, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.SafariShared.Logger", v14);
    logQueue = v11->_logQueue;
    v11->_logQueue = (OS_dispatch_queue *)v15;

    v17 = v11->_logQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WBSFileLogger_initWithDirectoryURL_logName_maximumLogAge___block_invoke;
    block[3] = &unk_1E649B768;
    v18 = v11;
    v22 = v18;
    dispatch_async(v17, block);
    v19 = v18;

  }
  return v11;
}

- (void)dealloc
{
  id WeakRetained;
  NSOutputStream *outputStream;
  NSOutputStream *v5;
  NSObject *logQueue;
  NSOutputStream *v7;
  objc_super v8;
  _QWORD block[4];
  NSOutputStream *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_closeStreamTimer);
  objc_msgSend(WeakRetained, "invalidate");

  outputStream = self->_outputStream;
  if (outputStream)
  {
    v5 = outputStream;
    logQueue = self->_logQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__WBSFileLogger_dealloc__block_invoke;
    block[3] = &unk_1E649B768;
    v10 = v5;
    v7 = v5;
    dispatch_async(logQueue, block);

  }
  v8.receiver = self;
  v8.super_class = (Class)WBSFileLogger;
  -[WBSFileLogger dealloc](&v8, sel_dealloc);
}

uint64_t __24__WBSFileLogger_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (void)tearDown
{
  NSObject *logQueue;
  _QWORD block[5];

  if (self->_outputStream)
  {
    logQueue = self->_logQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__WBSFileLogger_tearDown__block_invoke;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_sync(logQueue, block);
  }
}

uint64_t __25__WBSFileLogger_tearDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "close");
}

- (void)logFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[WBSFileLogger logMessage:](self, "logMessage:", v6);
}

- (void)logMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *logQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copy");

  logQueue = self->_logQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__WBSFileLogger_logMessage___block_invoke;
  block[3] = &unk_1E649C7E0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(logQueue, block);

}

uint64_t __28__WBSFileLogger_logMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logMessage:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_logMessage:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSDate *v10;
  NSDate *logStartDate;
  id v12;
  void *v13;
  NSString *logName;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSOutputStream *v19;
  NSOutputStream *outputStream;
  void *v21;
  void *v22;
  NSOutputStream *v23;
  id v24;
  NSTimer **p_closeStreamTimer;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!self->_logStartDate || (objc_msgSend(v8, "isDate:inSameDayAsDate:", v7) & 1) == 0)
  {
    -[WBSFileLogger _closeStream](self, "_closeStream");
    -[WBSFileLogger _removeOldLogs](self, "_removeOldLogs");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    logStartDate = self->_logStartDate;
    self->_logStartDate = v10;

  }
  if (!self->_outputStream)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v12, "setCalendar:", v9);
    objc_msgSend(v12, "setDateFormat:", CFSTR("_yyyy-MM-dd"));
    v13 = (void *)MEMORY[0x1E0CB3940];
    logName = self->_logName;
    objc_msgSend(v12, "stringFromDate:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@%@"), logName, v15, CFSTR(".log"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0C99E48];
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->_directoryURL, "URLByAppendingPathComponent:isDirectory:", v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "outputStreamWithURL:append:", v18, 1);
    v19 = (NSOutputStream *)objc_claimAutoreleasedReturnValue();
    outputStream = self->_outputStream;
    self->_outputStream = v19;

    -[NSOutputStream open](self->_outputStream, "open");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@\n"), v7, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_outputStream;
  v24 = objc_retainAutorelease(v22);
  -[NSOutputStream write:maxLength:](v23, "write:maxLength:", objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));
  p_closeStreamTimer = &self->_closeStreamTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_closeStreamTimer);
  objc_msgSend(WeakRetained, "invalidate");

  v27 = (void *)MEMORY[0x1E0C99E88];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __34__WBSFileLogger__logMessage_date___block_invoke;
  v30[3] = &unk_1E649C808;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v27, "timerWithTimeInterval:repeats:block:", 0, v30, 5.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)p_closeStreamTimer, v28);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addTimer:forMode:", v28, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __34__WBSFileLogger__logMessage_date___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__WBSFileLogger__logMessage_date___block_invoke_2;
    block[3] = &unk_1E649B768;
    block[4] = v2;
    dispatch_async(v3, block);
  }

}

uint64_t __34__WBSFileLogger__logMessage_date___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeStream");
}

- (void)_closeStream
{
  NSTimer **p_closeStreamTimer;
  id WeakRetained;
  NSOutputStream *outputStream;

  p_closeStreamTimer = &self->_closeStreamTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_closeStreamTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)p_closeStreamTimer, 0);
  -[NSOutputStream close](self->_outputStream, "close");
  outputStream = self->_outputStream;
  self->_outputStream = 0;

}

+ (BOOL)collectLogsInDirectory:(id)a3 withName:(id)a4 intoFile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 0, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_msgSend(v10, "length");
    v15 = objc_msgSend(CFSTR("_yyyy-MM-dd"), "length") + v14;
    v16 = objc_msgSend(CFSTR(".log"), "length");
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64__WBSFileLogger_collectLogsInDirectory_withName_intoFile_error___block_invoke;
    v34[3] = &unk_1E649C830;
    v36 = v15 + v16;
    v35 = v10;
    objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v34);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v19 = v18 != 0;
    if (v18)
    {
      v28 = v12;
      v29 = v9;
      objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v11, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "open");
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v17 = v20;
      v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v17);
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v21, "write:maxLength:", objc_msgSend(v26, "bytes"), objc_msgSend(v26, "length"));

          }
          v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        }
        while (v23);
      }

      objc_msgSend(v21, "close");
      v9 = v29;
      v12 = v28;
    }
    else if (a6)
    {
      *a6 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __64__WBSFileLogger_collectLogsInDirectory_withName_intoFile_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") == *(_QWORD *)(a1 + 40)
    && objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".log"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __64__WBSFileLogger_collectLogsInDirectory_withName_intoFile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logName, 0);
  objc_destroyWeak((id *)&self->_closeStreamTimer);
  objc_storeStrong((id *)&self->_logStartDate, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
