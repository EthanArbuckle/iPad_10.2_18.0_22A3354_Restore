@implementation _PASDatabaseJournal

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ in %@>"), v5, self->_directoryPath);

  return v6;
}

- (id)_getCurrentFile
{
  _PASDatabaseJournalFile *currentFile;

  currentFile = self->_currentFile;
  if (!currentFile)
  {
    -[_PASDatabaseJournal _addCurrentFileToLog](self, "_addCurrentFileToLog");
    currentFile = self->_currentFile;
  }
  return currentFile;
}

- (void)_clearCurrentFile
{
  -[_PASDatabaseJournalFile clear](self->_currentFile, "clear");
}

- (void)_addCurrentFileToLog
{
  _PASDatabaseJournalFile *currentFile;
  void *v4;
  unint64_t serialNumber;
  NSString *directoryPath;
  void *v7;
  _PASDatabaseJournalFile *v8;
  _PASDatabaseJournalFile *v9;
  id v10;

  currentFile = self->_currentFile;
  if (!currentFile
    || !-[_PASDatabaseJournalFile isAlive](currentFile, "isAlive")
    || -[_PASDatabaseJournalFile length](self->_currentFile, "length") >= 0x100000)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    directoryPath = self->_directoryPath;
    serialNumber = self->_serialNumber;
    self->_serialNumber = serialNumber + 1;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("J-%20llu.%@.dbJournal"), serialNumber, self->_uuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](directoryPath, "stringByAppendingPathComponent:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[_PASDatabaseJournalFile initWithPath:]([_PASDatabaseJournalFile alloc], "initWithPath:", v10);
    v9 = self->_currentFile;
    self->_currentFile = v8;

  }
}

- (void)_closeCurrentFile
{
  _PASDatabaseJournalFile *currentFile;

  -[_PASDatabaseJournalFile destroyAndUnlinkIfEmpty](self->_currentFile, "destroyAndUnlinkIfEmpty");
  currentFile = self->_currentFile;
  self->_currentFile = 0;

}

- (void)runQuery:(id)a3 values:(id)a4 onDb:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id *v11;
  NSObject *queue;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _PASDatabaseJournal *v19;
  id v20;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (self->_inMemory)
  {
    +[_PASDatabaseJournal _binderForDictionary:](_PASDatabaseJournal, "_binderForDictionary:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_27;
    v14[3] = &unk_1E4430A80;
    v11 = &v15;
    v15 = v13;
    objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v15, v10, 0, v14);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke;
    block[3] = &unk_1E442FD28;
    v11 = &v17;
    v17 = v13;
    v18 = v8;
    v19 = self;
    v20 = v9;
    dispatch_sync(queue, block);

    v10 = v18;
  }

}

- (BOOL)_executeNextRecordFromFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5 deleteFile:(BOOL *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  BOOL v25;
  _QWORD v27[4];
  id v28;
  BOOL *v29;
  BOOL *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(v9, "read");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_autoreleasePoolPop(v11);
    goto LABEL_6;
  }
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v18, v13, &v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v31;

  objc_autoreleasePoolPop(v11);
  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v9;
      v34 = 2112;
      v35 = v20;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got nil after trying to unarchive a db journal at %@: %@", buf, 0x16u);
    }

    goto LABEL_13;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("__query"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No __query key set in journal file: %@", buf, 0xCu);
    }

LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("__query"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PASDatabaseJournal _binderForDictionary:](_PASDatabaseJournal, "_binderForDictionary:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __79___PASDatabaseJournal__executeNextRecordFromFile_onDb_becameLocked_deleteFile___block_invoke;
  v27[3] = &unk_1E442FD50;
  v28 = v19;
  v29 = a6;
  v30 = a5;
  v24 = v19;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v22, v23, 0, v27);

LABEL_6:
  v25 = 1;
LABEL_14:

  return v25;
}

- (BOOL)_executeFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5
{
  id v9;
  id v10;
  void *v11;
  _PASDatabaseJournalFile *i;
  void *v13;
  id v14;
  BOOL v15;
  void *v17;
  id v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (self->_inMemory)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseJournal.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_inMemory"));

  }
  v19 = 1;
  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "executing journal file: %@", buf, 0xCu);
  }
  for (i = -[_PASDatabaseJournalFile initWithPath:]([_PASDatabaseJournalFile alloc], "initWithPath:", v11);
        !-[_PASDatabaseJournalFile isFullyRead](i, "isFullyRead");
        -[_PASDatabaseJournal _executeNextRecordFromFile:onDb:becameLocked:deleteFile:](self, "_executeNextRecordFromFile:onDb:becameLocked:deleteFile:", i, v10, a5, &v19))
  {
    ;
  }
  if (!v19)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v13, "removeItemAtPath:error:", v11, &v18);
  v14 = v18;

  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASDatabaseJournal deleted journal file: %@", buf, 0xCu);
    }
LABEL_15:
    v14 = 0;
    v15 = 1;
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v14;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to delete journal file: %@: %@", buf, 0x16u);
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (BOOL)executeQueriesOnDatabase:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  NSObject *queue;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = v5;
  v7 = 1;
  if (!self->_inMemory)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke;
    v10[3] = &unk_1E442FDA0;
    v10[4] = self;
    v12 = &v14;
    v13 = a2;
    v11 = v5;
    dispatch_sync(queue, v10);
    v7 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (BOOL)deleteAllJournaledQueries
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48___PASDatabaseJournal_deleteAllJournaledQueries__block_invoke;
  v5[3] = &unk_1E44307E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)startJournaling
{
  BOOL v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (self->_inMemory)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___PASDatabaseJournal_startJournaling__block_invoke;
  v5[3] = &unk_1E44307E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v2 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)stopJournaling
{
  BOOL v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (self->_inMemory)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___PASDatabaseJournal_stopJournaling__block_invoke;
  v5[3] = &unk_1E44307E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v2 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (id)directoryPath
{
  return self->_directoryPath;
}

- (BOOL)journaling
{
  return self->_journaling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)_journalPathForDbPath:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR(".journal"));
}

+ (id)journalWithDbPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  id v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_mutex_lock(&journalWithDbPath__lock);
  if (!journalWithDbPath__instances)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 1);
    v6 = (void *)journalWithDbPath__instances;
    journalWithDbPath__instances = v5;

  }
  objc_msgSend(a1, "_journalPathForDbPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)journalWithDbPath__instances, "objectForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_opt_new();
    objc_msgSend(CFSTR("com.apple.proactive.databasejournal."), "stringByAppendingString:", v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    v13 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v12;

    objc_storeStrong((id *)(v10 + 16), v7);
    *(_QWORD *)(v10 + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v15;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(v10 + 16);
    v22 = 0;
    v19 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v22);
    v20 = v22;

    if ((v19 & 1) != 0)
    {
      objc_msgSend((id)journalWithDbPath__instances, "setObject:forKey:", v10, v9);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to create directory for storing journals: %@", buf, 0xCu);
      }

      v10 = 0;
    }

  }
  pthread_mutex_unlock(&journalWithDbPath__lock);

  return (id)v10;
}

+ (id)journalForInMemoryDb
{
  uint64_t v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_opt_new();
  v3 = dispatch_queue_create("com.apple.proactive.databasejournal.inmemory", 0);
  v4 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = v3;

  v5 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  *(_QWORD *)(v2 + 24) = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v7;

  *(_BYTE *)(v2 + 41) = 1;
  return (id)v2;
}

+ (id)_binderForDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___PASDatabaseJournal__binderForDictionary___block_invoke;
  v7[3] = &unk_1E4430A30;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A1AFDE78](v7);

  return v5;
}

@end
