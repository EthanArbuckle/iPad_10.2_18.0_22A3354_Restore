@implementation TRICKQueryLog

- (TRICKQueryLog)initWithPaths:(id)a3
{
  id v5;
  TRICKQueryLog *v6;
  TRICKQueryLog *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TRICKQueryLog;
  v6 = -[TRICKQueryLog init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.triald.ck-query-log", 17);
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v12;

  }
  return v7;
}

- (void)logQueryWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke;
  v15[3] = &unk_1E93316F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0DC0E08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "unsignedIntValue") == 4)
  {

  }
  else
  {
    v4 = objc_msgSend(v3, "unsignedIntValue");

    if (v4 != 5)
      return;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(v5 + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke_2;
  v8[3] = &unk_1E93316D0;
  v8[4] = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v7, "runWithLockAcquired:", v8);

}

uint64_t __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logQueryWithRecordType:predicate:sortDescriptors:guardedData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

- (void)_logQueryWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 guardedData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)a6;
  v14 = (void *)MEMORY[0x1D8232A5C]();
  -[TRICKQueryLog _openFileIfNeededWithGuardedData:](self, "_openFileIfNeededWithGuardedData:", v13);
  if (!*((_BYTE *)v13 + 8) && v13[3])
  {
    if (v12)
    {
      objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = &stru_1E9336E60;
    }
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "triLogDesc");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("recordType:%@ | predicate:%@ | sortDescriptors:[%@]"), v10, v18, v16);

    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E9336E60);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13[2], "containsObject:", v20) & 1) == 0)
    {
      objc_msgSend(v13[2], "addObject:", v20);
      objc_msgSend(v20, "stringByAppendingString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "dataUsingEncoding:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = v13[3];
        v27 = 0;
        v24 = objc_msgSend(v23, "writeData:error:", v22, &v27);
        v25 = v27;
        if (v24)
        {
          objc_msgSend(v13[3], "synchronizeAndReturnError:", 0);
        }
        else
        {
          TRILogCategory_Server();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v25;
            _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Failed to log CKQuery: %@", buf, 0xCu);
          }

        }
      }

      v20 = v21;
    }

  }
  objc_autoreleasePoolPop(v14);

}

uint64_t __79__TRICKQueryLog__logQueryWithRecordType_predicate_sortDescriptors_guardedData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (void)_openFileIfNeededWithGuardedData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  void *v39;
  int *v40;
  char *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  char *v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  if (!*((_BYTE *)v4 + 8) && !*((_QWORD *)v4 + 3))
  {
    -[TRIPaths logDir](self->_paths, "logDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("CKQueryLogs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

    v9 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    objc_msgSend(v9, "setFormatOptions:", 19);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v9, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("CKQueryLog-%@.log"), v13);

    objc_msgSend(v7, "stringByAppendingPathComponent:", v14);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v15;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Logging CK queries: %{public}@", buf, 0xCu);
    }

    v17 = objc_retainAutorelease(v15);
    v18 = open((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 514, 420);
    if ((v18 & 0x80000000) != 0)
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v40 = __error();
        v41 = strerror(*v40);
        v42 = *__error();
        *(_DWORD *)buf = 136315394;
        v54 = v41;
        v55 = 1024;
        v56 = v42;
        _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Failed to open CKQueryLog: %s (%d)", buf, 0x12u);
      }

      *((_BYTE *)v4 + 8) = 1;
    }
    else
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v18, 1);
      v20 = (void *)*((_QWORD *)v4 + 3);
      *((_QWORD *)v4 + 3) = v19;

      v21 = (void *)*((_QWORD *)v4 + 3);
      v51 = 0;
      objc_msgSend(v21, "readDataUpToLength:error:", 0x20000, &v51);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v51;
      if (v22)
      {
        if ((unint64_t)objc_msgSend(v22, "length") < 0x20000)
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v22, 4);
          if (v29)
          {
            v44 = v14;
            v45 = v7;
            v30 = objc_opt_new();
            v31 = (void *)*((_QWORD *)v4 + 2);
            *((_QWORD *)v4 + 2) = v30;

            v43 = v29;
            objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("\n"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v48 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                  if (objc_msgSend(v37, "length"))
                    objc_msgSend(*((id *)v4 + 2), "addObject:", v37);
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
              }
              while (v34);
            }

            v14 = v44;
            v7 = v45;
            v25 = v46;
            v29 = v43;
          }
          else
          {
            TRILogCategory_Server();
            v38 = objc_claimAutoreleasedReturnValue();
            v25 = v46;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "CKQueryLog is not UTF-8.", buf, 2u);
            }

            v39 = (void *)*((_QWORD *)v4 + 3);
            *((_QWORD *)v4 + 3) = 0;

            *((_BYTE *)v4 + 8) = 1;
          }

        }
        else
        {
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "CKQueryLog is full.", buf, 2u);
          }

          v24 = (void *)*((_QWORD *)v4 + 3);
          *((_QWORD *)v4 + 3) = 0;

          *((_BYTE *)v4 + 8) = 1;
          v25 = v46;
        }
      }
      else
      {
        TRILogCategory_Server();
        v27 = objc_claimAutoreleasedReturnValue();
        v25 = v46;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v54 = (char *)v46;
          _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Failed to load CKQueryLog: %{public}@", buf, 0xCu);
        }

        v28 = (void *)*((_QWORD *)v4 + 3);
        *((_QWORD *)v4 + 3) = 0;

        *((_BYTE *)v4 + 8) = 1;
      }

    }
  }
  objc_autoreleasePoolPop(v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
