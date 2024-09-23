@implementation PPDKStorage

- (unsigned)readBatchSize
{
  return 50;
}

- (unsigned)topicWriteBatchSize
{
  return 15;
}

- (double)topicWriteBatchInterval
{
  return 30.0;
}

- (unsigned)namedEntityWriteBatchSize
{
  return 25;
}

- (double)namedEntityWriteBatchInterval
{
  return 30.0;
}

- (id)entityStream
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__PPDKStorage_entityStream__block_invoke;
  v3[3] = &unk_1E7E1DAD0;
  v3[4] = self;
  v3[5] = a2;
  if (entityStream__pasOnceToken3 != -1)
    dispatch_once(&entityStream__pasOnceToken3, v3);
  return (id)entityStream__pasExprOnceResult;
}

- (id)topicStream
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__PPDKStorage_topicStream__block_invoke;
  v3[3] = &unk_1E7E1DAD0;
  v3[4] = self;
  v3[5] = a2;
  if (topicStream__pasOnceToken4 != -1)
    dispatch_once(&topicStream__pasOnceToken4, v3);
  return (id)topicStream__pasExprOnceResult;
}

- (id)tombstoneStream
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__PPDKStorage_tombstoneStream__block_invoke;
  v3[3] = &unk_1E7E1DAD0;
  v3[4] = self;
  v3[5] = a2;
  if (tombstoneStream__pasOnceToken5 != -1)
    dispatch_once(&tombstoneStream__pasOnceToken5, v3);
  return (id)tombstoneStream__pasExprOnceResult;
}

- (double)topicStreamCooldownTimeRemaining
{
  _PASLock *topicLock;
  id v4;
  double v5;
  double v6;
  double v7;
  double result;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5901;
  v14 = __Block_byref_object_dispose__5902;
  v15 = 0;
  topicLock = self->_topicLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PPDKStorage_topicStreamCooldownTimeRemaining__block_invoke;
  v9[3] = &unk_1E7E17850;
  v9[4] = &v10;
  -[_PASLock runWithLockAcquired:](topicLock, "runWithLockAcquired:", v9);
  v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  -[PPDKStorage topicWriteBatchInterval](self, "topicWriteBatchInterval");
  result = v6 + v7;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)entityStreamCooldownTimeRemaining
{
  _PASLock *entityLock;
  id v4;
  double v5;
  double v6;
  double v7;
  double result;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5901;
  v14 = __Block_byref_object_dispose__5902;
  v15 = 0;
  entityLock = self->_entityLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PPDKStorage_entityStreamCooldownTimeRemaining__block_invoke;
  v9[3] = &unk_1E7E17850;
  v9[4] = &v10;
  -[_PASLock runWithLockAcquired:](entityLock, "runWithLockAcquired:", v9);
  v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  -[PPDKStorage namedEntityWriteBatchInterval](self, "namedEntityWriteBatchInterval");
  result = v6 + v7;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (BOOL)iterEventBatchesMatchingPredicate:(id)a3 streams:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 error:(id *)a7 block:(id)a8
{
  return -[PPDKStorage iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:readMetaData:remoteOnly:error:block:](self, "iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:readMetaData:remoteOnly:error:block:", a3, a4, a5, a6, 1, 0, a7, a8);
}

- (BOOL)iterEventBatchesMatchingPredicate:(id)a3 streams:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 readMetaData:(BOOL)a7 remoteOnly:(BOOL)a8 error:(id *)a9 block:(id)a10
{
  void (**v13)(id, void *, _BYTE *);
  void *v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  SEL v31;
  char v32;
  _BOOL4 v33;
  id v36;
  id v37;
  id v38;
  char v39;
  id v40;

  v33 = a7;
  v31 = a2;
  v38 = a3;
  v37 = a4;
  v36 = a5;
  v13 = (void (**)(id, void *, _BYTE *))a10;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  if (a6 <= 1)
    v17 = 1;
  else
    v17 = a6;
  v18 = 0x1E0D15000uLL;
  while (1)
  {
    if (v16)
    {
      v32 = 1;
      v25 = v14;
      goto LABEL_22;
    }
    v19 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(*(id *)(v18 + 2568), "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v38, v37, v15, v17, v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setReadMetadata:", v33);
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("PPDKStorage.m"), 238, CFSTR("unexpectedly nil query"));

    }
    v21 = *(void **)(v18 + 2568);
    if (a8)
      objc_msgSend(v21, "onlyRemoteDevice");
    else
      objc_msgSend(v21, "allDevices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDeviceIDs:", v22, v31);

    -[PPDKStorage _readWriteKnowledgeStore](self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v14;
    objc_msgSend(v23, "executeQuery:error:", v20, &v40);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v40;

    if (!v24)
      break;
    objc_msgSend(v24, "_pas_filteredArrayWithTest:", &__block_literal_global_75);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    v13[2](v13, v26, &v39);
    if (!v39)
    {
      v15 += objc_msgSend(v26, "count");
      v28 = 0;
      v16 = objc_msgSend(v26, "count") < v17;
      goto LABEL_18;
    }
    v16 = 0;
    v32 = 1;
LABEL_16:
    v28 = 1;
LABEL_18:

    objc_autoreleasePoolPop(v19);
    v14 = v25;
    v18 = 0x1E0D15000;
    if (v28)
      goto LABEL_22;
  }
  if (a9)
  {
    v27 = v25;
    v32 = 0;
    v16 = 0;
    v26 = *a9;
    *a9 = v27;
    goto LABEL_16;
  }

  objc_autoreleasePoolPop(v19);
  v32 = 0;
LABEL_22:

  return v32 & 1;
}

- (BOOL)saveEvents:(id)a3 stream:(id)a4 maxRetries:(int64_t)a5 retryInterval:(double)a6 shouldContinueBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  unsigned int (**v18)(_QWORD);
  int64_t v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  int v32;
  int64_t v33;
  double v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint32_t v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void (*v45)(uint64_t, char, void *);
  uint64_t v46;
  NSObject *v47;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  __int128 buf;
  void (*v55)(uint64_t, char, void *);
  void *v56;
  NSObject *v57;
  PPDKStorage *v58;
  uint8_t v59[4];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (!objc_msgSend(v12, "count"))
  {
    v30 = 1;
    goto LABEL_55;
  }
  -[PPDKStorage entityStream](self, "entityStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqual:", v15);

  if (v16)
  {
    v17 = v12;
    v18 = (unsigned int (**)(_QWORD))v14;
    if (self)
    {
      v51 = v14;
      v52 = v13;
      v53 = v12;
      if (a6 <= 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__saveEntityEvents_maxRetries_retryInterval_shouldContinueBlock_, self, CFSTR("PPDKStorage.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("retryInterval > 1.0"));

      }
      v19 = 0;
      if ((a5 & 0x8000000000000000) == 0)
      {
LABEL_7:
        if (v19 < a5)
        {
          ++v19;
          goto LABEL_9;
        }
LABEL_41:
        v30 = 0;
        goto LABEL_52;
      }
      while (1)
      {
LABEL_9:
        v20 = v17;
        -[PPDKStorage entityStreamCooldownTimeRemaining](self, "entityStreamCooldownTimeRemaining");
        if (v21 <= 0.0)
        {
          v27 = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_entityWriteSem, 0.0);
          pp_default_log_handle();
          v28 = objc_claimAutoreleasedReturnValue();
          v22 = v28;
          if (!v27)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v43 = -[NSObject count](v20, "count");
              *(_DWORD *)v59 = 134217984;
              v60 = v43;
              _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_INFO, "PPDKStorage sending %tu events to named entity stream.", v59, 0xCu);
            }

            -[PPDKStorage _readWriteKnowledgeStore](self);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v45 = __33__PPDKStorage__saveEntityEvents___block_invoke;
            goto LABEL_51;
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v59 = 0;
            v24 = v22;
            v25 = "PPDKStorage: writing to the named entity stream failed because another write already in progress.";
            v26 = 2;
            goto LABEL_20;
          }
        }
        else
        {
          pp_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            -[PPDKStorage entityStreamCooldownTimeRemaining](self, "entityStreamCooldownTimeRemaining");
            *(_DWORD *)v59 = 134217984;
            v60 = v23;
            v24 = v22;
            v25 = "PPDKStorage: rate limit blocked write to the named entity stream. %f seconds remaining.";
            v26 = 12;
LABEL_20:
            _os_log_debug_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEBUG, v25, v59, v26);
          }
        }

        if (!v18[2](v18))
          goto LABEL_41;
        pp_default_log_handle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = a6;
          _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_INFO, "PPDKStorage: duet write sleeping to stay within rate limits. Retrying in %f seconds.", (uint8_t *)&buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", a6);
        if ((a5 & 0x8000000000000000) == 0)
          goto LABEL_7;
      }
    }
LABEL_56:
    v30 = 0;
    goto LABEL_53;
  }
  -[PPDKStorage topicStream](self, "topicStream");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v13, "isEqual:", v31);

  if (!v32)
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_fault_impl(&dword_1C392E000, v17, OS_LOG_TYPE_FAULT, "PPDKStorage: attempted save to unknown stream: %@", (uint8_t *)&buf, 0xCu);
    }
    v30 = 0;
    goto LABEL_54;
  }
  v17 = v12;
  v18 = (unsigned int (**)(_QWORD))v14;
  if (!self)
    goto LABEL_56;
  v51 = v14;
  v52 = v13;
  v53 = v12;
  if (a6 <= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", sel__saveTopicEvents_maxRetries_retryInterval_shouldContinueBlock_, self, CFSTR("PPDKStorage.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("retryInterval > 1.0"));

  }
  v33 = 0;
  if ((a5 & 0x8000000000000000) == 0)
  {
LABEL_27:
    if (v33 < a5)
    {
      ++v33;
      goto LABEL_29;
    }
    goto LABEL_41;
  }
  while (1)
  {
LABEL_29:
    v20 = v17;
    -[PPDKStorage topicStreamCooldownTimeRemaining](self, "topicStreamCooldownTimeRemaining");
    if (v34 > 0.0)
    {
      pp_default_log_handle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        -[PPDKStorage topicStreamCooldownTimeRemaining](self, "topicStreamCooldownTimeRemaining");
        *(_DWORD *)v59 = 134217984;
        v60 = v36;
        v37 = v35;
        v38 = "PPDKStorage: rate limit blocked write to the topic stream. %f seconds remaining.";
        v39 = 12;
LABEL_40:
        _os_log_debug_impl(&dword_1C392E000, v37, OS_LOG_TYPE_DEBUG, v38, v59, v39);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
    v40 = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_topicWriteSem, 0.0);
    pp_default_log_handle();
    v41 = objc_claimAutoreleasedReturnValue();
    v35 = v41;
    if (!v40)
      break;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v59 = 0;
      v37 = v35;
      v38 = "PPDKStorage: writing to the topic stream failed because another write is already in progress.";
      v39 = 2;
      goto LABEL_40;
    }
LABEL_34:

    if (!v18[2](v18))
      goto LABEL_41;
    pp_default_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = a6;
      _os_log_impl(&dword_1C392E000, v42, OS_LOG_TYPE_INFO, "PPDKStorage: duet write sleeping to stay within rate limits. Retrying in %f seconds.", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", a6);
    if ((a5 & 0x8000000000000000) == 0)
      goto LABEL_27;
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v46 = -[NSObject count](v20, "count");
    *(_DWORD *)v59 = 134217984;
    v60 = v46;
    _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_INFO, "PPDKStorage sending %tu events to topic stream", v59, 0xCu);
  }

  -[PPDKStorage _readWriteKnowledgeStore](self);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v45 = __32__PPDKStorage__saveTopicEvents___block_invoke;
LABEL_51:
  v55 = v45;
  v56 = &unk_1E7E17918;
  v47 = v20;
  v57 = v47;
  v58 = self;
  objc_msgSend(v44, "saveObjects:responseQueue:withCompletion:", v47, 0, &buf);

  v30 = 1;
LABEL_52:
  v13 = v52;
  v12 = v53;
  v14 = v51;
LABEL_53:

LABEL_54:
LABEL_55:

  return v30;
}

- (BOOL)deleteEvents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PPDKStorage _readWriteKnowledgeStore](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "deleteObjects:error:", v6, a4);

  return (char)a4;
}

- (BOOL)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PPDKStorage _readWriteKnowledgeStore](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "deleteAllEventsInEventStream:error:", v6, &v12);

  v9 = v12;
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  pp_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v8;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPDKStorage deleteAllEventsInEventStream delete %lu items", buf, 0xCu);
  }

  return v9 == 0;
}

- (BOOL)deleteAllEventsInEventStream:(id)a3 matchingPredicate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(a3, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForEventsWithStreamName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v11;
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = 0;
  -[PPDKStorage _readWriteKnowledgeStore](self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v16 = objc_msgSend(v15, "deleteAllEventsMatchingPredicate:error:", v14, &v20);
  v17 = v20;

  pp_default_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v16;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPDKStorage deleteAllEventsInEventStream:matchingPredicate delete %lu items", buf, 0xCu);
  }

  return v17 == 0;
}

- (id)namedEntityRecordFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  if (!v6 || !v8)
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v82 = v6;
      v83 = 2112;
      v84 = v8;
      v16 = "Warning: PPDKStorage failed to create topic record from _DKEvent with missing source field(s). bundleID: %@ documentID: %@";
      v17 = v15;
      v18 = 22;
LABEL_15:
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v4, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v6;
      v16 = "Warning: PPDKStorage failed to create named entity record from _DKEvent with metadata==nil. Source: %@";
LABEL_14:
      v17 = v15;
      v18 = 12;
      goto LABEL_15;
    }
LABEL_16:
    v14 = 0;
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v4, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || fabs(v11) == INFINITY)
  {

    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v6;
      v16 = "Warning: PPDKStorage failed to create named entity record from _DKEvent with invalid start date. Source: %@";
      goto LABEL_14;
    }
    goto LABEL_16;
  }

  if (!-[PPDKStorage _isFutureCompatibilityVersionAttachedToEvent:]((uint64_t)self, v4))
  {
    objc_msgSend(v4, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "bestLanguage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v80 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "score");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "decayRate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "algorithm");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "sentimentScore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v79 = (void *)v26;
    if (v35)
    {
      v75 = v35;
    }
    else
    {
      objc_msgSend(v4, "metadata");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("sentimentScore"));
      v75 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "osBuild");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "assetVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v42);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("sourceLanguage"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("sourceRelevanceDate"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_msgSend(v32, "unsignedIntegerValue");
    v47 = v79;
    v46 = (void *)v80;
    v74 = v29;
    if (v15 && v80 && v32 && v79 && v29)
    {
      v70 = v45;
      objc_msgSend(v79, "doubleValue");
      if (v48 <= 2.0)
        v49 = v48;
      else
        v49 = 1.0;
      objc_msgSend(v29, "doubleValue");
      v51 = v50;
      objc_msgSend(v75, "doubleValue");
      v53 = v52;
      v71 = v40;
      v73 = v32;
      if (v76)
      {
        v54 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v76, "doubleValue");
        v55 = objc_msgSend(v54, "initWithTimeIntervalSince1970:");
      }
      else
      {
        v55 = 0;
      }
      objc_msgSend(v4, "value");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "integerValue");

      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v15, v61, v80);
      v63 = objc_alloc(MEMORY[0x1E0D70C78]);
      objc_msgSend(v4, "source");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "groupID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)v55;
      v67 = (void *)objc_msgSend(v63, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v6, v65, v8, v66, v55, 0, v77, 0);

      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setEntity:", v62);
      objc_msgSend(v14, "setSource:", v67);
      objc_msgSend(v14, "setAlgorithm:", v70);
      objc_msgSend(v14, "setInitialScore:", v49);
      objc_msgSend(v14, "setDecayRate:", v51);
      objc_msgSend(v14, "setSentimentScore:", v53);
      v40 = v71;
      objc_msgSend(v14, "setExtractionOsBuild:", v71);
      if (v78)
        v68 = objc_msgSend(v78, "unsignedLongValue");
      else
        v68 = 0xFFFFFFFFLL;
      v59 = v74;
      objc_msgSend(v14, "setExtractionAssetVersion:", v68);

      v47 = v79;
      v46 = (void *)v80;
      v32 = v73;
    }
    else
    {
      v56 = v45;
      pp_default_log_handle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", v56);
        v72 = v40;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v82 = v6;
        v83 = 2112;
        v84 = v58;
        _os_log_impl(&dword_1C392E000, v57, OS_LOG_TYPE_DEFAULT, "Warning: PPDKStorage failed to create named entity record from _DKEvent with missing metadata field(s). Source: %@ (%@)", buf, 0x16u);

        v40 = v72;
      }

      v14 = 0;
      v59 = v74;
    }

    goto LABEL_17;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)eventForNamedEntityRecord:(id)a3 sourceDeviceID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15920], "compatibilityVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7E59300, v8);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7E59300, CFSTR("compatVersion"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "decayRate");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "decayRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);

  objc_msgSend(v5, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "algorithm"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "algorithm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

  objc_msgSend(v5, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bestLanguage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "bestLanguage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "initialScore");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "score");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v22);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sentimentScore");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "sentimentScore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v25);

  objc_msgSend(v5, "extractionOsBuild");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v5, "extractionOsBuild");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158A0], "osBuild");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v28);

  }
  objc_msgSend(v5, "extractionAssetVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "extractionAssetVersion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158A0], "assetVersion");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, v30);

  objc_msgSend(v5, "source");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "relevanceDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "source");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "relevanceDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSince1970");
    objc_msgSend(v33, "numberWithDouble:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("sourceRelevanceDate"));

  }
  objc_msgSend(v5, "source");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "language");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v5, "source");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "language");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("sourceLanguage"));

  }
  v41 = objc_alloc(MEMORY[0x1E0D15AF0]);
  objc_msgSend(v5, "source");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bundleId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "documentId");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "groupId");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v41, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", CFSTR("portrait"), v43, v45, v47, v6, 0);

  v49 = (void *)MEMORY[0x1E0D159F8];
  -[PPDKStorage entityStream](self, "entityStream");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "date");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "eventWithStream:source:startDate:endDate:categoryIntegerValue:confidence:metadata:", v50, v48, v52, v54, objc_msgSend(v55, "category"), v7, 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (id)topicRecordFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  if (!v6 || !v8)
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v81 = v6;
      v82 = 2112;
      v83 = v8;
      v18 = "Warning: PPDKStorage failed to create topic record from _DKEvent with missing source field(s). bundleID: %@ documentID: %@";
      v19 = v17;
      v20 = 22;
LABEL_19:
      _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  objc_msgSend(v4, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || fabs(v13) == INFINITY)
  {

    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = v6;
      v18 = "Warning: PPDKStorage failed to create topic record from _DKEvent with invalid start date. Source: %@";
LABEL_18:
      v19 = v17;
      v20 = 12;
      goto LABEL_19;
    }
LABEL_20:
    v16 = 0;
LABEL_21:

    goto LABEL_22;
  }

  objc_msgSend(v4, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = v6;
      v18 = "Warning: PPDKStorage failed to create named entity record from _DKEvent with metadata==nil. Source: %@";
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  if (!v10 || (objc_msgSend(v10, "hasPrefix:", CFSTR("Q")) & 1) == 0)
  {
    pp_private_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v81 = v10;
      v82 = 2112;
      v83 = v6;
      _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "Warning: PPDKStorage failed to create topic record from _DKEvent due to invalid topic identifier %@. Source: %@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (!-[PPDKStorage _isFutureCompatibilityVersionAttachedToEvent:]((uint64_t)self, v4))
  {
    objc_msgSend(v4, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "algorithm");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "score");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "decayRate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "sentimentScore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v78 = v32;
    }
    else
    {
      objc_msgSend(v4, "metadata");
      v71 = v29;
      v34 = v26;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sentimentScore"));
      v78 = (id)objc_claimAutoreleasedReturnValue();

      v26 = v34;
      v29 = v71;
    }

    objc_msgSend(v4, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "osBuild");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", v37);
    v74 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "assetVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", v39);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("exactMatchInSourceText"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("sourceLanguage"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("sourceRelevanceDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = -[NSObject unsignedIntegerValue](v17, "unsignedIntegerValue");
    v45 = v44;
    v75 = v43;
    v76 = v26;
    if (v17 && v26 && v29)
    {
      v68 = v44;
      objc_msgSend(v26, "doubleValue");
      if (v46 <= 2.0)
        v47 = v46;
      else
        v47 = 1.0;
      objc_msgSend(v29, "doubleValue");
      v49 = v48;
      objc_msgSend(v78, "doubleValue");
      v51 = v50;
      v72 = v29;
      if (v43)
      {
        v52 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v43, "doubleValue");
        v53 = objc_msgSend(v52, "initWithTimeIntervalSince1970:");
      }
      else
      {
        v53 = 0;
      }
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v10);
      v58 = objc_alloc(MEMORY[0x1E0D70C78]);
      objc_msgSend(v4, "source");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "groupID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)v53;
      v62 = objc_msgSend(v58, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v6, v60, v8, v61, v53, 0, v79, 0);

      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setTopic:", v70);
      v67 = (void *)v62;
      objc_msgSend(v16, "setSource:", v62);
      objc_msgSend(v16, "setAlgorithm:", v68);
      objc_msgSend(v16, "setInitialScore:", v47);
      objc_msgSend(v16, "setDecayRate:", v49);
      objc_msgSend(v16, "setSentimentScore:", v51);
      objc_msgSend(v4, "source");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "deviceID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsLocal:", v64 == 0);

      v56 = (void *)v74;
      objc_msgSend(v16, "setExtractionOsBuild:", v74);
      if (v77)
        v65 = objc_msgSend(v77, "unsignedLongValue");
      else
        v65 = 0xFFFFFFFFLL;
      v29 = v72;
      objc_msgSend(v16, "setExtractionAssetVersion:", v65);
      v57 = v73;
      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CC0]), "initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:", 1, 1, 0, 0, objc_msgSend(v73, "BOOLValue"));
      objc_msgSend(v16, "setMetadata:", v66);

    }
    else
    {
      pp_default_log_handle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", v45);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v81 = v6;
        v82 = 2112;
        v83 = v55;
        _os_log_impl(&dword_1C392E000, v54, OS_LOG_TYPE_DEFAULT, "Warning: PPDKStorage failed to create topic record from _DKEvent with missing metadata field(s). Source: %@ (%@)", buf, 0x16u);

      }
      v16 = 0;
      v57 = v73;
      v56 = (void *)v74;
    }

    goto LABEL_21;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (id)eventForTopicRecord:(id)a3 sourceDeviceID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  id v55;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15920], "compatibilityVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7E59300, v8);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7E59300, CFSTR("compatVersion"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "decayRate");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15950], "decayRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "algorithm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15950], "algorithm");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "initialScore");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15950], "score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

  objc_msgSend(v5, "extractionOsBuild");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "extractionOsBuild");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15950], "osBuild");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

  }
  objc_msgSend(v5, "extractionAssetVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "extractionAssetVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15950], "assetVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v21);

  objc_msgSend(v5, "metadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v22, "exactMatchInSourceText");

  if ((_DWORD)v21)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "exactMatchInSourceText"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("exactMatchInSourceText"));

  }
  objc_msgSend(v5, "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "relevanceDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "source");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "relevanceDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSince1970");
    objc_msgSend(v28, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("sourceRelevanceDate"));

  }
  objc_msgSend(v5, "source");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "language");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v5, "source");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "language");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("sourceLanguage"));

  }
  v36 = objc_alloc(MEMORY[0x1E0D15AF0]);
  objc_msgSend(v5, "source");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bundleId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v53 = v7;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "documentId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "groupId");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v36, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", CFSTR("portrait"), v38, v40, v42, v6, 0);

  v44 = (void *)MEMORY[0x1E0D159F8];
  -[PPDKStorage topicStream](self, "topicStream");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "date");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "date");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topic");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topicIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v45, v43, v47, v49, v51, v53);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)registerForNamedEntitiesRemoteAdditionWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPDKStorage entityStream](self, "entityStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *MEMORY[0x1E0D15B88];
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v8, v9, 0, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing entity stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)registerForNamedEntitiesRemoteDeletionWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPDKStorage entityStream](self, "entityStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *MEMORY[0x1E0D15B90];
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v8, v9, 0, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing entity stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)registerForTopicsRemoteAdditionWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPDKStorage topicStream](self, "topicStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *MEMORY[0x1E0D15B88];
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v8, v9, 0, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing topic stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)registerForTopicsRemoteDeletionWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPDKStorage topicStream](self, "topicStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *MEMORY[0x1E0D15B90];
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v8, v9, 0, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing topic stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)removeObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB35B0];
    v4 = a3;
    objc_msgSend(v3, "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicWriteSem, 0);
  objc_storeStrong((id *)&self->_entityWriteSem, 0);
  objc_storeStrong((id *)&self->_topicLock, 0);
  objc_storeStrong((id *)&self->_entityLock, 0);
}

- (BOOL)_isFutureCompatibilityVersionAttachedToEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _BOOL8 v14;
  NSObject *v15;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15920], "compatibilityVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D15920], "compatibilityVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("compatVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v11 = &unk_1E7E592E8;
      goto LABEL_7;
    }
    objc_msgSend(v4, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("compatVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  v13 = objc_msgSend(v11, "unsignedIntValue");
  v14 = v13 > 2;
  if (v13 >= 3)
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17[0] = 67109120;
      v17[1] = objc_msgSend(v11, "unsignedIntValue");
      _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "Rejecting _DKEvent with compatibility version %u from THE MYSTERIOUS FUTURE.", (uint8_t *)v17, 8u);
    }

  }
LABEL_12:

  return v14;
}

- (id)_readWriteKnowledgeStore
{
  if (a1)
  {
    if (_readWriteKnowledgeStore__pasOnceToken8 != -1)
      dispatch_once(&_readWriteKnowledgeStore__pasOnceToken8, &__block_literal_global_69);
    a1 = (id)_readWriteKnowledgeStore__pasExprOnceResult;
  }
  return a1;
}

void __39__PPDKStorage__readWriteKnowledgeStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D15A50], "userKnowledgeStore");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_readWriteKnowledgeStore__pasExprOnceResult;
  _readWriteKnowledgeStore__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __32__PPDKStorage__saveTopicEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 134217984;
    v10 = v7;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "_DKKnowledgeStore finished writing %tu events to the topic stream", (uint8_t *)&v9, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = (uint64_t)v5;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "_DKKnowledgeStore failed to save topic events with error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "runWithLockAcquired:", &__block_literal_global_86);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 32));

}

void __32__PPDKStorage__saveTopicEvents___block_invoke_85(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (id)v2[1];
  v2[1] = v3;

}

void __33__PPDKStorage__saveEntityEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 134217984;
    v10 = v7;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "_DKKnowledgeStore finished writing %tu events to the named entity stream.", (uint8_t *)&v9, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = (uint64_t)v5;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "_DKKnowledgeStore failed to save named entity events with error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "runWithLockAcquired:", &__block_literal_global_91);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 24));

}

void __33__PPDKStorage__saveEntityEvents___block_invoke_90(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (id)v2[1];
  v2[1] = v3;

}

uint64_t __119__PPDKStorage_iterEventBatchesMatchingPredicate_streams_sortDescriptors_batchSize_readMetaData_remoteOnly_error_block___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "bundleIdentifierIsEnabledForDonation:", v5);

  return v6;
}

void __48__PPDKStorage_entityStreamCooldownTimeRemaining__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __47__PPDKStorage_topicStreamCooldownTimeRemaining__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __30__PPDKStorage_tombstoneStream__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D15AF8], "tombstoneStream");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPDKStorage.m"), 177, CFSTR("Unable to resolve _DKEventStream /event/tombstone"));

  }
  v4 = (void *)tombstoneStream__pasExprOnceResult;
  tombstoneStream__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __26__PPDKStorage_topicStream__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D15928], "topicStream");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPDKStorage.m"), 168, CFSTR("Unable to resolve _DKEventStream /portrait/topic"));

  }
  v4 = (void *)topicStream__pasExprOnceResult;
  topicStream__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __27__PPDKStorage_entityStream__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D15928], "entityStream");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPDKStorage.m"), 159, CFSTR("Unable to resolve _DKEventStream /portrait/entity"));

  }
  v4 = (void *)entityStream__pasExprOnceResult;
  entityStream__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

+ (PPDKStorage)sharedInstance
{
  if (sharedInstance__pasOnceToken2_5912 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_5912, &__block_literal_global_5913);
  return (PPDKStorage *)(id)sharedInstance__pasExprOnceResult_5914;
}

void __29__PPDKStorage_sharedInstance__block_invoke()
{
  void *v0;
  PPDKStorage *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  objc_super v23;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = [PPDKStorage alloc];
  if (v1
    && (v23.receiver = v1,
        v23.super_class = (Class)PPDKStorage,
        (v2 = objc_msgSendSuper2(&v23, sel_init)) != 0))
  {
    v3 = v2;
    v4 = (_QWORD *)objc_opt_new();
    v5 = objc_opt_new();
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v4);
    v8 = (void *)v3[1];
    v3[1] = v7;

    v9 = (_QWORD *)objc_opt_new();
    v10 = objc_opt_new();
    v11 = (void *)v9[1];
    v9[1] = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v9);
    v13 = (void *)v3[2];
    v3[2] = v12;

    v14 = dispatch_semaphore_create(1);
    v15 = (void *)v3[3];
    v3[3] = v14;

    v16 = dispatch_semaphore_create(1);
    v17 = (void *)v3[4];
    v3[4] = v16;

    v18 = (id)objc_msgSend(v3, "registerForNamedEntitiesRemoteAdditionWithBlock:", &__block_literal_global_116);
    v19 = (id)objc_msgSend(v3, "registerForNamedEntitiesRemoteDeletionWithBlock:", &__block_literal_global_118);
    v20 = (id)objc_msgSend(v3, "registerForTopicsRemoteAdditionWithBlock:", &__block_literal_global_119);
    v21 = (id)objc_msgSend(v3, "registerForTopicsRemoteDeletionWithBlock:", &__block_literal_global_121);
  }
  else
  {
    v3 = 0;
  }
  v22 = (void *)sharedInstance__pasExprOnceResult_5914;
  sharedInstance__pasExprOnceResult_5914 = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke_4()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke_3()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsDidChangeMeaningfully");
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke_2()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated");
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated");
}

@end
