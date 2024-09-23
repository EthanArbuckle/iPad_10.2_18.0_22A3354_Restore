@implementation RPFileTransferResumeState

- (RPFileTransferResumeState)init
{
  RPFileTransferResumeState *v2;
  RPFileTransferResumeState *v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  NSMutableDictionary *stateInfo;
  RPFileTransferResumeState *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RPFileTransferResumeState;
  v2 = -[RPFileTransferResumeState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RPFileTransferResumeState setIsPlaceholder:](v2, "setIsPlaceholder:", 0);
    -[RPFileTransferResumeState setDispatchQueue:](v3, "setDispatchQueue:", 0);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", CFSTR("1.0"), CFSTR("version"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, CFSTR("fileInfo"));
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("activeFiles"));
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("finishedFiles"));
    stateInfo = v3->_stateInfo;
    v3->_stateInfo = v4;

    v9 = v3;
  }

  return v3;
}

- (RPFileTransferResumeState)initWithDispatchQueue:(id)a3
{
  id v4;
  RPFileTransferResumeState *v5;
  RPFileTransferResumeState *v6;
  RPFileTransferResumeState *v7;

  v4 = a3;
  v5 = -[RPFileTransferResumeState init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[RPFileTransferResumeState setDispatchQueue:](v5, "setDispatchQueue:", v4);
    v7 = v6;
  }

  return v6;
}

- (RPFileTransferResumeState)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  RPFileTransferResumeState *v7;
  RPFileTransferResumeState *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *stateInfo;
  RPFileTransferResumeState *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RPFileTransferResumeState;
  v7 = -[RPFileTransferResumeState init](&v18, sel_init);
  v8 = v7;
  if (!v7)
  {
    v16 = 0;
    goto LABEL_9;
  }
  -[RPFileTransferResumeState setIsPlaceholder:](v7, "setIsPlaceholder:", 0);
  -[RPFileTransferResumeState setDispatchQueue:](v8, "setDispatchQueue:", 0);
  objc_msgSend(v6, "objectForKey:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("fileInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("activeFiles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("finishedFiles"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v9)
  {
    if (a4)
      goto LABEL_17;
    goto LABEL_18;
  }
  if (!v10)
  {
    if (a4)
      goto LABEL_17;
    goto LABEL_18;
  }
  if (!v11)
  {
    if (a4)
      goto LABEL_17;
    goto LABEL_18;
  }
  if (!v12)
  {
    if (a4)
    {
LABEL_17:
      RPErrorF();
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_7;
  }
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);
  stateInfo = v8->_stateInfo;
  v8->_stateInfo = (NSMutableDictionary *)v14;

  v16 = v8;
LABEL_7:

LABEL_9:
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[RPFileTransferResumeState invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RPFileTransferResumeState;
  -[RPFileTransferResumeState dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  NSMutableDictionary *stateInfo;

  if (-[RPFileTransferResumeState needsFlushing](self, "needsFlushing"))
    -[RPFileTransferResumeState flushStateFile](self, "flushStateFile");
  -[RPFileTransferResumeState flushTimer](self, "flushTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[RPFileTransferResumeState setFlushTimer:](self, "setFlushTimer:", 0);
  }
  -[RPFileTransferResumeState setDispatchQueue:](self, "setDispatchQueue:", 0);
  stateInfo = self->_stateInfo;
  self->_stateInfo = 0;

}

- (id)version
{
  return (id)-[NSMutableDictionary objectForKey:](self->_stateInfo, "objectForKey:", CFSTR("version"));
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_stateInfo);
}

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  BOOL v5;

  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !objc_msgSend(v3, "count") && !objc_msgSend(v4, "count");

  return v5;
}

- (id)activeFiles
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_stateInfo, "objectForKey:", CFSTR("fileInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("activeFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)finishedFiles
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_stateInfo, "objectForKey:", CFSTR("fileInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("finishedFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeFileWithFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RPFileTransferResumeStateItem *v7;

  v4 = a3;
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[RPFileTransferResumeStateItem initWithStateDict:]([RPFileTransferResumeStateItem alloc], "initWithStateDict:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)addActiveFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
    objc_msgSend(v5, "setValue:forKey:", v8, v6);

  return v7 == 0;
}

- (BOOL)removeActiveFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setValue:forKey:", 0, v6);

  return v7 != 0;
}

- (id)finishedFileWithFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RPFileTransferResumeStateItem *v7;

  v4 = a3;
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[RPFileTransferResumeStateItem initWithStateDict:]([RPFileTransferResumeStateItem alloc], "initWithStateDict:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)addFinishedFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("fileOffset"));
  objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("bytesWritten"));
  objc_msgSend(v5, "setValue:forKey:", v8, v6);

  return v7 == 0;
}

- (BOOL)removeFinishedFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setValue:forKey:", 0, v6);

  return v7 != 0;
}

- (BOOL)scheduleStateFileFlush
{
  BOOL v3;
  void *v4;
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD handler[5];

  v3 = -[RPFileTransferResumeState needsFlushing](self, "needsFlushing");
  -[RPFileTransferResumeState setNeedsFlushing:](self, "setNeedsFlushing:", 1);
  -[RPFileTransferResumeState flushTimer](self, "flushTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[RPFileTransferResumeState dispatchQueue](self, "dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
    -[RPFileTransferResumeState setFlushTimer:](self, "setFlushTimer:", v6);

    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __51__RPFileTransferResumeState_scheduleStateFileFlush__block_invoke;
    handler[3] = &unk_1E5F4EC60;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferResumeState flushInterval](self, "flushInterval");
    -[RPFileTransferResumeState flushInterval](self, "flushInterval");
    CUDispatchTimerSet();

    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v9);

  }
  return !v3;
}

uint64_t __51__RPFileTransferResumeState_scheduleStateFileFlush__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  NSObject *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "needsFlushing");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "flushStateFile");
  objc_msgSend(v3, "flushTimer");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v5);

  return objc_msgSend(*(id *)(a1 + 32), "setFlushTimer:", 0);
}

- (BOOL)flushStateFile
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[RPFileTransferResumeState needsFlushing](self, "needsFlushing");
  if (v3)
  {
    -[RPFileTransferResumeState dictionaryRepresentation](self, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferResumeState stateFilePath](self, "stateFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "writeToFile:atomically:", v5, 1);

    -[RPFileTransferResumeState setNeedsFlushing:](self, "setNeedsFlushing:", 0);
    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)loadStateFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *stateInfo;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[RPFileTransferResumeState stateFilePath](self, "stateFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    if (v9)
    {
      v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v9);
      stateInfo = self->_stateInfo;
      self->_stateInfo = v11;

      if (-[RPFileTransferResumeState removeUnusableOutputFileItems](self, "removeUnusableOutputFileItems"))
        -[RPFileTransferResumeState scheduleStateFileFlush](self, "scheduleStateFileFlush");
    }
    else if (*(int *)-[RPFileTransferResumeState ucat](self, "ucat") <= 30
           && (*(_DWORD *)-[RPFileTransferResumeState ucat](self, "ucat") != -1
            || (-[RPFileTransferResumeState ucat](self, "ucat"), _LogCategory_Initialize())))
    {
      -[RPFileTransferResumeState ucat](self, "ucat");
      objc_msgSend(v5, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[RPFileTransferResumeState removeAllActiveAndFinishedFileItems](self, "removeAllActiveAndFinishedFileItems", v15, v10);
    }
    else
    {
      -[RPFileTransferResumeState removeAllActiveAndFinishedFileItems](self, "removeAllActiveAndFinishedFileItems", v14, v16);
    }

  }
  return 0;
}

- (BOOL)removeStateFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  id v13;
  void *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[RPFileTransferResumeState stateFilePath](self, "stateFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RPFileTransferResumeState flushTimer](self, "flushTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[RPFileTransferResumeState setFlushTimer:](self, "setFlushTimer:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v11, "removeItemAtURL:error:", v5, &v16);
    v13 = v16;

    if ((v12 & 1) == 0 && *(int *)-[RPFileTransferResumeState ucat](self, "ucat") <= 30)
    {
      if (*(_DWORD *)-[RPFileTransferResumeState ucat](self, "ucat") != -1
        || (-[RPFileTransferResumeState ucat](self, "ucat"), _LogCategory_Initialize()))
      {
        -[RPFileTransferResumeState ucat](self, "ucat");
        objc_msgSend(v5, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)removeUnusableSourceFileItems
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  RPFileTransferResumeStateItem *v11;
  void *v12;
  void *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[RPFileTransferResumeStateItem initWithStateDict:]([RPFileTransferResumeStateItem alloc], "initWithStateDict:", v10);
        -[RPFileTransferResumeStateItem itemURL](v11, "itemURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && !-[RPFileTransferResumeStateItem sourceFileItemUsable:](v11, "sourceFileItemUsable:", v13))
        {
          -[RPFileTransferResumeState removeActiveFile:](self, "removeActiveFile:", v11);
          v7 = 1;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)removeUnusableOutputFileItems
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  RPFileTransferResumeStateItem *v11;
  void *v12;
  BOOL v13;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v15 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[RPFileTransferResumeStateItem initWithStateDict:]([RPFileTransferResumeStateItem alloc], "initWithStateDict:", v10);
        -[RPFileTransferResumeState outputPath](self, "outputPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[RPFileTransferResumeStateItem outputFileItemUsable:](v11, "outputFileItemUsable:", v12);

        if (!v13)
        {
          -[RPFileTransferResumeState removeActiveFile:](self, "removeActiveFile:", v11);
          v15 = 1;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v15 = 0;
  }

  return v15 & 1;
}

- (BOOL)removeAllActiveAndFinishedFileItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_stateInfo, "objectForKey:", CFSTR("fileInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("activeFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = v4 != 0;
  if (v4)
    objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v2, "objectForKey:", CFSTR("finishedFiles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "removeAllObjects");
    v5 = 1;
  }

  return v5;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (LogCategory)ucat
{
  return self->_ucat;
}

- (void)setUcat:(LogCategory *)a3
{
  self->_ucat = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
  objc_storeStrong((id *)&self->_outputPath, a3);
}

- (NSString)stateFilePath
{
  return self->_stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_stateFilePath, a3);
}

- (OS_dispatch_source)flushTimer
{
  return self->_flushTimer;
}

- (void)setFlushTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flushTimer, a3);
}

- (double)flushInterval
{
  return self->_flushInterval;
}

- (void)setFlushInterval:(double)a3
{
  self->_flushInterval = a3;
}

- (BOOL)needsFlushing
{
  return self->_needsFlushing;
}

- (void)setNeedsFlushing:(BOOL)a3
{
  self->_needsFlushing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_stateFilePath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_stateInfo, 0);
}

@end
