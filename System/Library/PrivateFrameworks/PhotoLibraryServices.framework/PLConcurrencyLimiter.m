@implementation PLConcurrencyLimiter

+ (void)configureListTrackingForDispatchQueue:(id)a3
{
  _DWORD *v3;
  void *v4;
  void *v5;
  NSObject *queue;

  queue = a3;
  if (!queue)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLConcurrencyLimiter(Statistics) configureListTrackingForDispatchQueue:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PLConcurrencyLimiter+Statistics.m"), 51, CFSTR("queue required."));

  }
  v3 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040EDCEB4C7uLL);
  v3[4] = 0;
  dispatch_queue_set_specific(queue, (const void *)PLConcurrencyLimiterTrackingStatsKey, v3, _PLConcurrencyLimiterQueueTrackingStatsDestructor);

}

+ (void)reportBlockEnqueued:(id)a3 isNotifyBlock:(BOOL)a4 onQueue:(id)a5 forLibrary:(id)a6
{
  NSObject *v9;
  id v10;
  char *specific;
  void *v12;
  os_unfair_lock_s *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;

  v21 = a3;
  v9 = a5;
  v10 = a6;
  specific = (char *)dispatch_queue_get_specific(v9, (const void *)PLConcurrencyLimiterTrackingStatsKey);
  if (!specific)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLConcurrencyLimiter(Statistics) reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PLConcurrencyLimiter+Statistics.m"), 61, CFSTR("no stat struct."));

  }
  v12 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040E2C296BEuLL);
  *(_QWORD *)v12 = v21[2];
  *((_QWORD *)v12 + 2) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  *((_DWORD *)v12 + 6) = qos_class_self();
  *((_BYTE *)v12 + 28) = a4;
  if (v10)
    objc_storeStrong((id *)v12 + 4, a6);
  v13 = (os_unfair_lock_s *)(specific + 16);
  os_unfair_lock_lock((os_unfair_lock_t)specific + 4);
  if (*(_QWORD *)specific)
  {
    v16 = *((_QWORD *)specific + 1);
    v14 = specific + 8;
    v15 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLConcurrencyLimiter(Statistics) reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PLConcurrencyLimiter+Statistics.m"), 82, CFSTR("no tail"));

    }
    *(_QWORD *)(v15 + 8) = v12;
  }
  else
  {
    *(_QWORD *)specific = v12;
    v14 = specific + 8;
  }
  *v14 = v12;
  os_unfair_lock_unlock(v13);

}

+ (void)reportBlockDequeuedOnQueue:(id)a3
{
  os_unfair_lock_s *specific;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  specific = (os_unfair_lock_s *)dispatch_queue_get_specific((dispatch_queue_t)a3, (const void *)PLConcurrencyLimiterTrackingStatsKey);
  os_unfair_lock_lock(specific + 4);
  v4 = *(_QWORD **)&specific->_os_unfair_lock_opaque;
  v5 = *(_QWORD *)&specific->_os_unfair_lock_opaque;
  if (!*(_QWORD *)&specific->_os_unfair_lock_opaque)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLConcurrencyLimiter(Statistics) reportBlockDequeuedOnQueue:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PLConcurrencyLimiter+Statistics.m"), 98, CFSTR("no head"));

    v5 = *(_QWORD *)&specific->_os_unfair_lock_opaque;
  }
  if (v5 == *(_QWORD *)&specific[2]._os_unfair_lock_opaque)
  {
    *(_QWORD *)&specific->_os_unfair_lock_opaque = 0;
    *(_QWORD *)&specific[2]._os_unfair_lock_opaque = 0;
  }
  else
  {
    v6 = v4[1];
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLConcurrencyLimiter(Statistics) reportBlockDequeuedOnQueue:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PLConcurrencyLimiter+Statistics.m"), 108, CFSTR("head with no next"));

    }
    *(_QWORD *)&specific->_os_unfair_lock_opaque = v6;
  }
  v7 = (void *)v4[4];
  v4[4] = 0;

  free(v4);
  os_unfair_lock_unlock(specific + 4);
}

+ (id)debugDescriptionOfEnqueuedBlocksOnQueue:(id)a3
{
  NSObject *v3;
  os_unfair_lock_s *specific;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  char **v15;
  char **v16;
  os_unfair_lock_s *lock;
  NSObject *v20;

  v3 = a3;
  specific = (os_unfair_lock_s *)dispatch_queue_get_specific(v3, (const void *)PLConcurrencyLimiterTrackingStatsKey);
  v20 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("queue: %@, scheduled blocks (max: %d) with wait times:\n"), v3, 20);
  lock = specific + 4;
  os_unfair_lock_lock(specific + 4);
  v6 = *(_QWORD *)&specific->_os_unfair_lock_opaque;
  if (*(_QWORD *)&specific->_os_unfair_lock_opaque)
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v5, "appendString:", CFSTR("{\n\t"));
      if (!v7)
        objc_msgSend(v5, "appendString:", CFSTR("[head] "));
      v8 = *(_DWORD *)(v6 + 24);
      if (v8 > 20)
      {
        switch(v8)
        {
          case 21:
            v9 = CFSTR("[DEF] ");
            goto LABEL_18;
          case 33:
            v9 = CFSTR("[UI] ");
            goto LABEL_18;
          case 25:
            v9 = CFSTR("[IN] ");
            goto LABEL_18;
        }
      }
      else
      {
        switch(v8)
        {
          case 0:
            v9 = CFSTR("[UNSPEC] ");
            goto LABEL_18;
          case 9:
            v9 = CFSTR("[BG] ");
            goto LABEL_18;
          case 17:
            v9 = CFSTR("[UT] ");
LABEL_18:
            objc_msgSend(v5, "appendString:", v9);
            break;
        }
      }
      if (*(_BYTE *)(v6 + 28))
        objc_msgSend(v5, "appendString:", CFSTR("[NOTIFY] "));
      else
        objc_msgSend(v5, "appendFormat:", CFSTR("[waiting %g s] "), (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(_QWORD *)(v6 + 16)) / 1000000000.0);
      v10 = *(void **)(v6 + 32);
      if (v10)
      {
        objc_msgSend(v10, "managedObjectContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v13 = v12;
          objc_msgSend(v11, "lastResetTimestamp");
          objc_msgSend(v5, "appendFormat:", CFSTR("(Moc age: %g sec) %@\n"), v13 - v14, v11, lock);
        }

      }
      v15 = backtrace_symbols((void *const *)v6, 1);
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v5, "appendFormat:", CFSTR("\t%s\n"), *v15);
        free(v16);
      }
      objc_msgSend(v5, "appendString:", CFSTR("}\n"));
      v6 = *(_QWORD *)(v6 + 8);
      if (v6)
      {
        if (v7++ < 0x13)
          continue;
      }
      break;
    }
  }
  os_unfair_lock_unlock(lock);

  return v5;
}

- (void)_callOutForQoS:(unsigned int)a3 fromQueue:(id)a4
{
  OS_dispatch_queue *v6;
  uint64_t (*v7)(uint64_t);
  unsigned int v8;
  unint64_t v9;

  v6 = (OS_dispatch_queue *)a4;
  if (self->_highQOSAssetIngestQueue == v6 && qos_class_self() == QOS_CLASS_USER_INITIATED)
  {
    v7 = __PLQUEUE_DISPATCH_IS_CALLING_OUT_TO_HIGH_QOS_INGEST_BLOCK__;
  }
  else if (self->_exclusiveMomentsQueue == v6)
  {
    v7 = __PLQUEUE_DISPATCH_IS_CALLING_OUT_TO_MOMENTS_BLOCK__;
  }
  else
  {
    HIDWORD(v9) = a3 - 9;
    LODWORD(v9) = a3 - 9;
    v8 = v9 >> 2;
    if (v8 > 6)
      v7 = __PLQUEUE_DISPATCH_IS_CALLING_OUT_TO_UN_BLOCK__;
    else
      v7 = (uint64_t (*)(uint64_t))off_1E36715F8[v8];
  }

  return v7;
}

- (id)_nextQueueForQoS:(unsigned int)a3 libraryRole:(unint64_t)a4
{
  uint64_t v4;
  PLConcurrencyLimiter *v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;

  v4 = *(_QWORD *)&a3;
  v5 = self;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      v6 = 32;
      goto LABEL_10;
    case 2uLL:
      if (qos_class_self() == QOS_CLASS_USER_INITIATED)
      {
        v6 = 24;
LABEL_10:
        self = (PLConcurrencyLimiter *)*(id *)((char *)&v5->super.isa + v6);
        return self;
      }
LABEL_6:
      HIDWORD(v8) = v4 - 9;
      LODWORD(v8) = v4 - 9;
      v7 = v8 >> 3;
      if (v7 >= 4)
      {
        -[PLConcurrencyLimiter _handleUnexpectedQoSClass:](v5, "_handleUnexpectedQoSClass:", v4);
        v6 = 16;
      }
      else
      {
        v6 = qword_199B9F7E0[v7];
      }
      goto LABEL_10;
  }
  return self;
}

- (id)_queuesTrackingBlocks
{
  OS_dispatch_queue *userInitiatedQueueA;
  __int128 v4;
  OS_dispatch_queue *exclusiveMomentsQueue;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  userInitiatedQueueA = self->_userInitiatedQueueA;
  v4 = *(_OWORD *)&self->_backgroundAndUtilityQueue;
  exclusiveMomentsQueue = self->_exclusiveMomentsQueue;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &userInitiatedQueueA, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_syncPerformBlockNotOnAnyQueue:(id)a3
{
  id v4;
  void (*v5)(_QWORD);
  char *v6;

  v4 = a3;
  v5 = -[PLConcurrencyLimiter _callOutForQoS:fromQueue:](self, "_callOutForQoS:fromQueue:", qos_class_self(), 0);
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  v6 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  pthread_setspecific(_limiterDepthThreadKey_s_key, v6 + 1);
  v5(v4);

  _limiterDepthPop();
}

- (void)_sync:(id)a3 identifyingBlock:(id)a4 libraryRole:(unint64_t)a5 libraryForTelemetry:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (*v15)(_QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = qos_class_self();
  if ((objc_msgSend((id)objc_opt_class(), "isRunningUnderLimiter") & 1) != 0)
  {
    -[PLConcurrencyLimiter _syncPerformBlockNotOnAnyQueue:](self, "_syncPerformBlockNotOnAnyQueue:", v10);
  }
  else
  {
    -[PLConcurrencyLimiter _nextQueueForQoS:libraryRole:](self, "_nextQueueForQoS:libraryRole:", v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = (id)MEMORY[0x19AEC174C](v10);
    objc_msgSend((id)objc_opt_class(), "reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:", v11, 0, v14, v12);
    v15 = -[PLConcurrencyLimiter _callOutForQoS:fromQueue:](self, "_callOutForQoS:fromQueue:", v13, v14);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __79__PLConcurrencyLimiter__sync_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke;
    v20 = &unk_1E3675C58;
    v21 = v14;
    v22 = v10;
    v16 = v14;
    v15(&v17);
    objc_msgSend((id)objc_opt_class(), "reportBlockDequeuedOnQueue:", v16, v17, v18, v19, v20);

  }
}

- (void)_async:(id)a3 identifyingBlock:(id)a4 libraryRole:(unint64_t)a5 libraryForTelemetry:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = qos_class_self();
  -[PLConcurrencyLimiter _nextQueueForQoS:libraryRole:](self, "_nextQueueForQoS:libraryRole:", v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    v11 = (id)MEMORY[0x19AEC174C](v10);
  v15 = -[PLConcurrencyLimiter _callOutForQoS:fromQueue:](self, "_callOutForQoS:fromQueue:", v13, v14);
  objc_msgSend((id)objc_opt_class(), "reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:", v11, 0, v14, v12);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__PLConcurrencyLimiter__async_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke;
  v18[3] = &unk_1E3674E68;
  v20 = v10;
  v21 = v15;
  v18[4] = self;
  v19 = v14;
  v16 = v14;
  v17 = v10;
  dispatch_async(v16, v18);

}

- (PLConcurrencyLimiter)init
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_workloop_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PLConcurrencyLimiter;
  v2 = -[PLConcurrencyLimiter init](&v26, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_msgSend((id)objc_opt_class(), "configureListTrackingForDispatchQueue:", *((_QWORD *)v2 + 1));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    objc_msgSend((id)objc_opt_class(), "configureListTrackingForDispatchQueue:", *((_QWORD *)v2 + 2));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v10;

    objc_msgSend((id)objc_opt_class(), "configureListTrackingForDispatchQueue:", *((_QWORD *)v2 + 3));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v13;

    objc_msgSend((id)objc_opt_class(), "configureListTrackingForDispatchQueue:", *((_QWORD *)v2 + 4));
    v15 = dispatch_workloop_create("PLConcurrencyLimiter auxillary workloop");
    v16 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create_with_target_V2("PLConcurrencyLimiter auxillary UT", v18, *((dispatch_queue_t *)v2 + 7));
    v20 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = dispatch_queue_create_with_target_V2("PLConcurrencyLimiter auxillary BG", v22, *((dispatch_queue_t *)v2 + 7));
    v24 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v23;

  }
  return (PLConcurrencyLimiter *)v2;
}

- (id)sharedUtilityQueue
{
  return self->_sharedUtilityQueue;
}

- (id)sharedBackgroundQueue
{
  return self->_sharedBackgroundQueue;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  PLConcurrencyLimiter *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("PLConcurrencyLimiter: \n"));
  -[PLConcurrencyLimiter _queuesTrackingBlocks](self, "_queuesTrackingBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PLConcurrencyLimiter_debugDescription__block_invoke;
  v8[3] = &unk_1E3671570;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v8);

  v6 = v5;
  return v6;
}

- (int64_t)maxConcurrency
{
  void *v2;
  int64_t v3;

  -[PLConcurrencyLimiter _queuesTrackingBlocks](self, "_queuesTrackingBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)asyncPerformOnContext:(id)a3 identifyingBlock:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v14 = MEMORY[0x1E0C809B0];
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v11, "photoLibrary", v14, 3221225472, __69__PLConcurrencyLimiter_asyncPerformOnContext_identifyingBlock_block___block_invoke, &unk_1E3675C58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLConcurrencyLimiter _async:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_async:identifyingBlock:libraryRole:libraryForTelemetry:", &v14, v12, objc_msgSend(v13, "role"), 0);

}

- (void)dispatchAsync:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PLConcurrencyLimiter_dispatchAsync_block___block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PLConcurrencyLimiter _async:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_async:identifyingBlock:libraryRole:libraryForTelemetry:", v10, 0, 0, 0);

}

- (void)dispatchAfterTime:(unint64_t)a3 library:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void *v19;

  v8 = a5;
  v9 = a4;
  v10 = qos_class_self();
  objc_msgSend(v9, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLConcurrencyLimiter _nextQueueForQoS:libraryRole:](self, "_nextQueueForQoS:libraryRole:", v10, objc_msgSend(v11, "libraryRole"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PLConcurrencyLimiter _callOutForQoS:fromQueue:](self, "_callOutForQoS:fromQueue:", v10, v12);
  objc_msgSend((id)objc_opt_class(), "reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:", v8, 0, v12, v9);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PLConcurrencyLimiter_dispatchAfterTime_library_block___block_invoke;
  v16[3] = &unk_1E3674E68;
  v18 = v8;
  v19 = v13;
  v16[4] = self;
  v17 = v12;
  v14 = v12;
  v15 = v8;
  dispatch_after(a3, v14, v16);

}

- (void)groupNotify:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  PLConcurrencyLimiter *v19;
  id v20;
  id v21;
  void *v22;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = qos_class_self();
  -[PLConcurrencyLimiter _nextQueueForQoS:libraryRole:](self, "_nextQueueForQoS:libraryRole:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLConcurrencyLimiter _callOutForQoS:fromQueue:](self, "_callOutForQoS:fromQueue:", v11, v12);
  objc_msgSend((id)objc_opt_class(), "reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:", v9, 1, v12, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke;
  block[3] = &unk_1E3674F58;
  v21 = v9;
  v22 = v13;
  v18 = v8;
  v19 = self;
  v20 = v12;
  v14 = v12;
  v15 = v9;
  v16 = v8;
  dispatch_group_notify(v10, v14, block);

}

- (void)sync:(id)a3 identifyingBlock:(id)a4 library:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLConcurrencyLimiter _sync:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_sync:identifyingBlock:libraryRole:libraryForTelemetry:", v10, v9, objc_msgSend(v8, "role"), v8);

}

- (void)async:(id)a3 identifyingBlock:(id)a4 library:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLConcurrencyLimiter _async:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_async:identifyingBlock:libraryRole:libraryForTelemetry:", v10, v9, objc_msgSend(v8, "role"), v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWorkloop, 0);
  objc_storeStrong((id *)&self->_sharedBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_sharedUtilityQueue, 0);
  objc_storeStrong((id *)&self->_exclusiveMomentsQueue, 0);
  objc_storeStrong((id *)&self->_highQOSAssetIngestQueue, 0);
  objc_storeStrong((id *)&self->_backgroundAndUtilityQueue, 0);
  objc_storeStrong((id *)&self->_userInitiatedQueueA, 0);
}

void __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke(uint64_t a1)
{
  char *v2;
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7[2];

  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke_2;
  block[3] = &unk_1E36715B8;
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  *(_OWORD *)v7 = v5;
  dispatch_sync(v3, block);
  _limiterDepthPop();
  objc_msgSend((id)objc_opt_class(), "reportBlockDequeuedOnQueue:", *(_QWORD *)(a1 + 48));

}

uint64_t __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 40))(*(_QWORD *)(a1 + 32));
}

uint64_t __56__PLConcurrencyLimiter_dispatchAfterTime_library_block___block_invoke(uint64_t a1)
{
  char *v2;

  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  (*(void (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
  _limiterDepthPop();
  return objc_msgSend((id)objc_opt_class(), "reportBlockDequeuedOnQueue:", *(_QWORD *)(a1 + 40));
}

void __44__PLConcurrencyLimiter_dispatchAsync_block___block_invoke(uint64_t a1)
{
  dispatch_sync(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

uint64_t __69__PLConcurrencyLimiter_asyncPerformOnContext_identifyingBlock_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBlockAndWait:", *(_QWORD *)(a1 + 40));
}

void __40__PLConcurrencyLimiter_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "debugDescriptionOfEnqueuedBlocksOnQueue:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendString:", v4);
}

uint64_t __80__PLConcurrencyLimiter__async_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke(uint64_t a1)
{
  char *v2;

  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  (*(void (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
  _limiterDepthPop();
  return objc_msgSend((id)objc_opt_class(), "reportBlockDequeuedOnQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __79__PLConcurrencyLimiter__sync_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke(uint64_t a1)
{
  char *v2;

  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  dispatch_sync(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  return _limiterDepthPop();
}

+ (id)sharedLimiter
{
  if (sharedLimiter_onceToken != -1)
    dispatch_once(&sharedLimiter_onceToken, &__block_literal_global_77608);
  return (id)sharedLimiter_queueManager;
}

+ (BOOL)isRunningUnderLimiter
{
  if (_limiterDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_73_77583);
  return (uint64_t)pthread_getspecific(_limiterDepthThreadKey_s_key) > 0;
}

void __37__PLConcurrencyLimiter_sharedLimiter__block_invoke()
{
  PLConcurrencyLimiter *v0;
  void *v1;

  v0 = objc_alloc_init(PLConcurrencyLimiter);
  v1 = (void *)sharedLimiter_queueManager;
  sharedLimiter_queueManager = (uint64_t)v0;

}

@end
