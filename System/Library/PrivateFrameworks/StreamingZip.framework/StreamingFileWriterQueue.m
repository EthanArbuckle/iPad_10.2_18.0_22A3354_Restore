@implementation StreamingFileWriterQueue

- (StreamingFileWriterQueue)init
{
  StreamingFileWriterQueue *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *fileWriterQueue;
  uint64_t v6;
  NSMutableArray *pendingOperations;
  uint64_t v8;
  NSMutableDictionary *pendingOperationPathsByGroupPointer;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)StreamingFileWriterQueue;
  v2 = -[StreamingFileWriterQueue init](&v26, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.StreamingZip.StreamingFileWriterQueue", v3);
    fileWriterQueue = v2->_fileWriterQueue;
    v2->_fileWriterQueue = (OS_dispatch_queue *)v4;

    v2->_pendingOperationSize = 0;
    v2->_runningOperationCount = 0;
    v6 = objc_opt_new();
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    pendingOperationPathsByGroupPointer = v2->_pendingOperationPathsByGroupPointer;
    v2->_pendingOperationPathsByGroupPointer = (NSMutableDictionary *)v8;

    v2->_pendingStateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerForKey:", CFSTR("MaxAsyncOperationSize"));

    SZGetLoggingHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 < 1)
    {
      if (!v13)
      {
        v11 = 10485760;
LABEL_9:

        v2->_maxPendingOperationSize = v11;
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerForKey:", CFSTR("MaxAsyncItemSize"));

        SZGetLoggingHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16 < 1)
        {
          if (!v18)
          {
            v16 = 0x200000;
LABEL_16:

            v2->_maxPendingItemSize = v16;
            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "integerForKey:", CFSTR("MaxConcurrency"));

            SZGetLoggingHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v21 < 1)
            {
              if (!v23)
              {
                v21 = 4;
                goto LABEL_23;
              }
              *(_DWORD *)buf = 134217984;
              v21 = 4;
              v28 = 4;
              v24 = "Max concurrency is %lu";
            }
            else
            {
              if (!v23)
              {
LABEL_23:

                v2->_maxConcurrency = v21;
                return v2;
              }
              *(_DWORD *)buf = 134217984;
              v28 = v21;
              v24 = "Overriding max concurrency to %lu";
            }
            _os_log_impl(&dword_1D4E55000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
            goto LABEL_23;
          }
          *(_DWORD *)buf = 134217984;
          v16 = 0x200000;
          v28 = 0x200000;
          v19 = "Max async item size limit is %lld";
        }
        else
        {
          if (!v18)
            goto LABEL_16;
          *(_DWORD *)buf = 134217984;
          v28 = v16;
          v19 = "Overriding max async item size limit to %lld";
        }
        _os_log_impl(&dword_1D4E55000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134217984;
      v11 = 10485760;
      v28 = 10485760;
      v14 = "Max async operation size limit is %lld";
    }
    else
    {
      if (!v13)
        goto LABEL_9;
      *(_DWORD *)buf = 134217984;
      v28 = v11;
      v14 = "Overriding max async operation size limit to %lld";
    }
    _os_log_impl(&dword_1D4E55000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_9;
  }
  return v2;
}

- (id)reserveAsyncOperationForFileSize:(int64_t)a3 path:(id)a4 group:(id)a5 operationPendingForPath:(BOOL *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v17;
  int v18;
  StreamingFileWriterQueueReservation *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (-[StreamingFileWriterQueue maxPendingItemSize](self, "maxPendingItemSize") >= a3)
  {
    v12 = a3 >= 0;
  }
  else
  {
    SZGetTraceHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v9;
      v27 = 2048;
      v28 = a3;
      _os_signpost_emit_with_name_impl(&dword_1D4E55000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FILE_TOO_BIG", "Too large for async: %@ size %lld", buf, 0x16u);
    }

    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_pendingStateLock);
  -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer](self, "pendingOperationPathsByGroupPointer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_msgSend(v15, "containsObject:", v9);
    if (!v12)
    {
LABEL_11:

      os_unfair_lock_unlock(&self->_pendingStateLock);
      v18 = 0;
      v19 = 0;
      if (!v16)
        goto LABEL_19;
      goto LABEL_16;
    }
  }
  else
  {
    v16 = 0;
    if (!v12)
      goto LABEL_11;
  }
  v17 = -[StreamingFileWriterQueue pendingOperationSize](self, "pendingOperationSize") + a3;
  if (v17 > -[StreamingFileWriterQueue maxPendingOperationSize](self, "maxPendingOperationSize"))
    goto LABEL_11;
  -[StreamingFileWriterQueue setPendingOperationSize:](self, "setPendingOperationSize:", v17);

  os_unfair_lock_unlock(&self->_pendingStateLock);
  SZGetTraceHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v9;
    v27 = 2048;
    v28 = a3;
    v29 = 2048;
    v30 = v17;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_FILE_RESERVED", "Async op reserved for %@ size %lld (cur total: %lld)", buf, 0x20u);
  }

  v19 = -[StreamingFileWriterQueueReservation initWithReservationSize:]([StreamingFileWriterQueueReservation alloc], "initWithReservationSize:", a3);
  v18 = 1;
  if (v16)
  {
LABEL_16:
    SZGetTraceHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D4E55000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_OP_EXISTS", "Async op exists for %@", buf, 0xCu);
    }

  }
LABEL_19:
  if (((v18 | !v12) & 1) == 0)
  {
    SZGetTraceHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v9;
      v27 = 2048;
      v28 = a3;
      _os_signpost_emit_with_name_impl(&dword_1D4E55000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_FILE_QUEUE_FULL", "Insufficient buffer avilable for %@ size %lld", buf, 0x16u);
    }

  }
  *a6 = v16;

  return v19;
}

- (void)_runOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "reservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "reservedSize");

  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackingGroup");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeAsyncOperation");

  dispatch_group_leave(v8);
  os_unfair_lock_lock(&self->_pendingStateLock);
  -[StreamingFileWriterQueue setPendingOperationSize:](self, "setPendingOperationSize:", -[StreamingFileWriterQueue pendingOperationSize](self, "pendingOperationSize") - v6);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer](self, "pendingOperationPathsByGroupPointer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "removeObject:", v7);
    if (!objc_msgSend(v12, "count"))
      objc_msgSend(v10, "removeObjectForKey:", v9);
  }
  else
  {
    SZGetLoggingHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = v7;
      _os_log_fault_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_FAULT, "No pending operation paths found for group %@ when trying to remove path %@", buf, 0x16u);
    }

  }
  -[StreamingFileWriterQueue pendingOperations](self, "pendingOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", 0);
  }
  else
  {
    -[StreamingFileWriterQueue setRunningOperationCount:](self, "setRunningOperationCount:", -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount") - 1);
    v15 = 0;
  }

  os_unfair_lock_unlock(&self->_pendingStateLock);
  if (v15)
  {
    objc_msgSend(v15, "trackingGroup");
    v16 = objc_claimAutoreleasedReturnValue();
    -[StreamingFileWriterQueue fileWriterQueue](self, "fileWriterQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__StreamingFileWriterQueue__runOperation___block_invoke;
    v18[3] = &unk_1E98B11B0;
    v18[4] = self;
    v19 = v15;
    dispatch_group_async(v16, v17, v18);

  }
}

- (BOOL)insertAsyncFileOperation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v24;
  char v25;
  void *v26;
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "reservation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isValid");
  if ((v8 & 1) != 0)
  {
    v9 = objc_msgSend(v7, "reservedSize");
    objc_msgSend(v7, "setValid:", 0);
    objc_msgSend(v6, "trackingGroup");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);
    objc_msgSend(v6, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_pendingStateLock);
    v11 = -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount");
    v12 = -[StreamingFileWriterQueue maxConcurrency](self, "maxConcurrency");
    v25 = v8;
    if (v11 >= v12)
    {
      v24 = v9;
      -[StreamingFileWriterQueue pendingOperations](self, "pendingOperations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v6);
      SZGetTraceHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134218240;
        v30 = v24;
        v31 = 2048;
        v32 = objc_msgSend(v17, "count");
        _os_signpost_emit_with_name_impl(&dword_1D4E55000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CONCURRENCY_LIMIT", "Added async operation for size %lld; queue count: %lu",
          buf,
          0x16u);
      }

    }
    else
    {
      -[StreamingFileWriterQueue setRunningOperationCount:](self, "setRunningOperationCount:", -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount") + 1);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer](self, "pendingOperationPathsByGroupPointer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v19);
    }
    objc_msgSend(v21, "addObject:", v26);

    os_unfair_lock_unlock(&self->_pendingStateLock);
    if (v11 < v12)
    {
      -[StreamingFileWriterQueue fileWriterQueue](self, "fileWriterQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__StreamingFileWriterQueue_insertAsyncFileOperation_error___block_invoke;
      block[3] = &unk_1E98B11B0;
      block[4] = self;
      v28 = v6;
      dispatch_group_async(v10, v22, block);

    }
    v8 = v25;
  }
  else
  {
    SZGetLoggingHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v7, "reservedSize");
      _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "Rejecting insert of file operation because the reservation for size %llu was not valid", buf, 0xCu);
    }

    v14 = objc_msgSend(v7, "reservedSize");
    _CreateError((uint64_t)"-[StreamingFileWriterQueue insertAsyncFileOperation:error:]", 237, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Rejecting insert of file operation because the reservation for size %llu was not valid"), v15, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v10 = v16;
    if (a4)
    {
      v10 = objc_retainAutorelease(v16);
      *a4 = v10;
    }
  }

  return v8;
}

- (OS_dispatch_queue)fileWriterQueue
{
  return self->_fileWriterQueue;
}

- (int64_t)maxPendingOperationSize
{
  return self->_maxPendingOperationSize;
}

- (int64_t)maxPendingItemSize
{
  return self->_maxPendingItemSize;
}

- (unint64_t)maxConcurrency
{
  return self->_maxConcurrency;
}

- (int64_t)pendingOperationSize
{
  return self->_pendingOperationSize;
}

- (void)setPendingOperationSize:(int64_t)a3
{
  self->_pendingOperationSize = a3;
}

- (unint64_t)runningOperationCount
{
  return self->_runningOperationCount;
}

- (void)setRunningOperationCount:(unint64_t)a3
{
  self->_runningOperationCount = a3;
}

- (NSMutableArray)pendingOperations
{
  return self->_pendingOperations;
}

- (NSMutableDictionary)pendingOperationPathsByGroupPointer
{
  return self->_pendingOperationPathsByGroupPointer;
}

- (os_unfair_lock_s)pendingStateLock
{
  return self->_pendingStateLock;
}

- (void)setPendingStateLock:(os_unfair_lock_s)a3
{
  self->_pendingStateLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingOperationPathsByGroupPointer, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_fileWriterQueue, 0);
}

uint64_t __59__StreamingFileWriterQueue_insertAsyncFileOperation_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runOperation:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__StreamingFileWriterQueue__runOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runOperation:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance_sharedInstance)
  {
    v3 = objc_alloc_init((Class)v2);
    v4 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sharedInstance_sharedInstance;
}

@end
