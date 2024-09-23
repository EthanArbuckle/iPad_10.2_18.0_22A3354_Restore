@implementation PETEventTracker2

void __34__PETEventTracker2_sharedInstance__block_invoke()
{
  void *v0;
  PETEventTracker2 *v1;
  void *v2;

  v0 = (void *)MEMORY[0x19400723C]();
  v1 = -[PETEventTracker2 initWithAsyncEnabled:]([PETEventTracker2 alloc], "initWithAsyncEnabled:", 1);
  v2 = (void *)sharedInstance_instance_1488;
  sharedInstance_instance_1488 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (PETEventTracker2)initWithAsyncEnabled:(BOOL)a3
{
  _BOOL4 v3;
  PETEventTracker2 *v4;
  PETEventTracker2 *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *loggingQueue;
  NSObject *v10;
  PETEventTracker2 *v11;
  __int16 v13;
  _QWORD block[4];
  PETEventTracker2 *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PETEventTracker2;
  v4 = -[PETEventTracker2 init](&v16, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  v4->_isAsyncEnabled = v3;
  if (v3)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("PETEventTracker2", v7);
    loggingQueue = v5->_loggingQueue;
    v5->_loggingQueue = (OS_dispatch_queue *)v8;

    v5->_loggingQueueSize = 0;
    pthread_mutex_init(&v5->_loggingQueueLock, 0);
    v10 = v5->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PETEventTracker2_initWithAsyncEnabled___block_invoke;
    block[3] = &unk_1E2A413D8;
    v15 = v5;
    dispatch_async(v10, block);

LABEL_5:
    v11 = v5;
    goto LABEL_6;
  }
  -[PETEventTracker2 _init](v4, "_init");
  if (v5->_inited)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 0;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2.", (uint8_t *)&v13, 2u);
  }
  v11 = 0;
LABEL_6:

  return v11;
}

uint64_t __46__PETEventTracker2__runBlockWithRBSAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint8_t v7[16];

  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 128));
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v2 + 120))
    {
      v3 = *(void **)(v2 + 112);
      if (v3)
        break;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 128));
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 1.0);
  }
  objc_msgSend(v3, "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = 0;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Runningboard assertion has been invalidated", v7, 2u);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t __53__PETEventTracker2__dispatchAsyncForLogging_txnName___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_runBlockWithRBSAssertion:", *(_QWORD *)(a1 + 48));
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 32));
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_runBlockWithRBSAssertion:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  RBSAssertion *rbsAssertion;
  void *v7;
  id v8;
  RBSTarget *rbsTarget;
  void *v10;
  RBSAssertion *v11;
  RBSAssertion *v12;
  RBSAssertion *v13;
  id v14;
  dispatch_time_t v15;
  NSObject *v16;
  RBSAssertion *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_inited)
  {
    if (self->_isProcessManagedByRBS)
    {
      pthread_mutex_lock(&self->_rbsAssertionLock);
      rbsAssertion = self->_rbsAssertion;
      if (rbsAssertion)
        goto LABEL_14;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Requesting Runningboard assertion", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0D87C98]);
      rbsTarget = self->_rbsTarget;
      v22[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (RBSAssertion *)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("ProactiveEventTracker"), rbsTarget, v10);
      v12 = self->_rbsAssertion;
      self->_rbsAssertion = v11;

      v13 = self->_rbsAssertion;
      v19 = 0;
      LODWORD(rbsTarget) = -[RBSAssertion acquireWithError:](v13, "acquireWithError:", &v19);
      v14 = v19;
      if ((_DWORD)rbsTarget)
      {
        self->_rbsShouldInvalidate = 0;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Runningboard assertion has been acquired", buf, 2u);
        }
        v15 = dispatch_time(0, 1000000000);
        v16 = dispatch_queue_create("com.apple.proactive.eventtracker.rbsAssertionCheck", 0);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __46__PETEventTracker2__runBlockWithRBSAssertion___block_invoke;
        v18[3] = &unk_1E2A413D8;
        v18[4] = self;
        dispatch_after(v15, v16, v18);

      }
      else
      {
        v17 = self->_rbsAssertion;
        self->_rbsAssertion = 0;

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to acquire the RunningBoard assertion: %@", buf, 0xCu);
        }
      }

      rbsAssertion = self->_rbsAssertion;
      if (rbsAssertion)
      {
LABEL_14:
        -[RBSAssertion addObserver:](rbsAssertion, "addObserver:", self);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Running logging block", buf, 2u);
        }
        v5[2](v5);
        if (!self->_rbsShouldInvalidate)
        {
          self->_rbsShouldInvalidate = 1;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Setting Runningboard assertion to be invalidated", buf, 2u);
          }
        }
      }
      else
      {
        AnalyticsSendEvent();
      }
      pthread_mutex_unlock(&self->_rbsAssertionLock);
    }
    else
    {
      v4[2](v4);
    }
  }

}

- (void)_trackScalarForMessage:(id)a3 count:(int)a4 overwrite:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  if (self->_inited)
  {
    v5 = a5;
    v8 = a3;
    v21 = (id)objc_opt_new();
    objc_msgSend(v21, "setType:", 1);
    objc_msgSend(v21, "setDatestamp:", _getDatestamp());
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();

    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PETEventTracker2 _writeMessage:objCClassName:](PETEventTracker2, "_writeMessage:objCClassName:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRawMessage:", v12);

    objc_msgSend(v21, "rawMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v21;
    if (v13)
    {
      objc_msgSend(v21, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETEventTracker2 aggregateState](self, "aggregateState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (double)a4;
      v18 = objc_retainAutorelease(v15);
      v19 = objc_msgSend(v18, "bytes");
      v20 = (unsigned __int16)objc_msgSend(v18, "length");
      if (v5)
        objc_msgSend(v16, "updateCounterTo:forKey:keyLength:", v19, v20, v17);
      else
        objc_msgSend(v16, "incrementCounterBy:forKey:keyLength:", v19, v20, v17);

      v14 = v21;
    }

  }
}

- (PETAggregateState)aggregateState
{
  return self->_aggregateState;
}

+ (id)_writeMessage:(id)a3 objCClassName:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = +[PETEventTracker2 typeIdForMessageName:](PETEventTracker2, "typeIdForMessageName:", v6);
  if ((unint64_t)objc_msgSend(v5, "length") <= 0x100000)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setTypeId:", v7);
    objc_msgSend(v10, "setRawBytes:", v5);
    objc_msgSend(v10, "setName:", v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2048;
      v17 = objc_msgSend(v5, "length");
      v18 = 1024;
      v19 = 0x100000;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dropping large message %@ with length %lu. max length: %ul", buf, 0x1Cu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "length", CFSTR("name"), CFSTR("size"), v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v10 = 0;
  }

  return v10;
}

+ (unsigned)typeIdForMessageName:(id)a3
{
  const char *v3;
  CC_LONG v4;
  unsigned __int8 md[4];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  return bswap32(*(unsigned int *)md);
}

uint64_t __48__PETEventTracker2_trackScalarForMessage_count___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackScalarForMessage:count:overwrite:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0);
}

uint64_t __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackDistributionForMessage:value:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_trackDistributionForMessage:(id)a3 value:(double)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  if (self->_inited)
  {
    v6 = a3;
    v27 = (id)objc_opt_new();
    objc_msgSend(v27, "setType:", 2);
    objc_msgSend(v27, "setDatestamp:", _getDatestamp());
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();

    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PETEventTracker2 _writeMessage:objCClassName:](PETEventTracker2, "_writeMessage:objCClassName:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRawMessage:", v12);

    objc_msgSend(v27, "rawMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v27, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETEventTracker2 aggregateState](self, "aggregateState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_retainAutorelease(v14);
      objc_msgSend(v15, "updateDistributionWithValue:forKey:keyLength:maxSampleSize:", objc_msgSend(v16, "bytes"), (unsigned __int16)objc_msgSend(v16, "length"), 1, a4);

      -[PETEventTracker2 config](self, "config");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bucketsForMessageName:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v27, "setType:", 3);
        objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, objc_msgSend(v19, "count"), 1280, &__block_literal_global_320);

        if (v21 >= objc_msgSend(v19, "count"))
        {
          v24 = INFINITY;
        }
        else
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23;

        }
        objc_msgSend(v27, "setBucket:", v24);
        objc_msgSend(v27, "data");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[PETEventTracker2 aggregateState](self, "aggregateState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_retainAutorelease(v25);
        objc_msgSend(v26, "incrementCounterBy:forKey:keyLength:", objc_msgSend(v16, "bytes"), (unsigned __int16)objc_msgSend(v16, "length"), 1.0);

      }
    }

  }
}

- (PETConfig)config
{
  return (PETConfig *)objc_getProperty(self, a2, 216, 1);
}

- (void)trackDistributionForMessage:(id)a3 value:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  double v11;
  _QWORD v12[5];
  id v13;
  double v14;

  v6 = a3;
  v7 = v6;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke;
    v12[3] = &unk_1E2A41450;
    v12[4] = self;
    v13 = v6;
    v14 = a4;
    -[PETEventTracker2 _dispatchAsyncForLogging:txnName:](self, "_dispatchAsyncForLogging:txnName:", v12, "com.apple.proactive.eventtracker.trackDistribution");

  }
  else
  {
    v8 = (void *)MEMORY[0x19400723C]();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke_2;
    v9[3] = &unk_1E2A41450;
    v9[4] = self;
    v10 = v7;
    v11 = a4;
    -[PETEventTracker2 _runBlockWithRBSAssertion:](self, "_runBlockWithRBSAssertion:", v9);

    objc_autoreleasePoolPop(v8);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1486 != -1)
    dispatch_once(&sharedInstance_onceToken_1486, &__block_literal_global_1487);
  return (id)sharedInstance_instance_1488;
}

- (void)trackScalarForMessage:(id)a3 count:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int v11;
  _QWORD v12[5];
  id v13;
  int v14;

  v6 = a3;
  v7 = v6;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__PETEventTracker2_trackScalarForMessage_count___block_invoke;
    v12[3] = &unk_1E2A41428;
    v12[4] = self;
    v13 = v6;
    v14 = a4;
    -[PETEventTracker2 _dispatchAsyncForLogging:txnName:](self, "_dispatchAsyncForLogging:txnName:", v12, "com.apple.proactive.eventtracker.trackScalar");

  }
  else
  {
    v8 = (void *)MEMORY[0x19400723C]();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__PETEventTracker2_trackScalarForMessage_count___block_invoke_2;
    v9[3] = &unk_1E2A41428;
    v9[4] = self;
    v10 = v7;
    v11 = a4;
    -[PETEventTracker2 _runBlockWithRBSAssertion:](self, "_runBlockWithRBSAssertion:", v9);

    objc_autoreleasePoolPop(v8);
  }

}

- (void)_dispatchAsyncForLogging:(id)a3 txnName:(const char *)a4
{
  id v5;
  int loggingQueueSize;
  void *v7;
  NSObject *loggingQueue;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v5 = a3;
  pthread_mutex_lock(&self->_loggingQueueLock);
  loggingQueueSize = self->_loggingQueueSize;
  if (loggingQueueSize < 1024)
  {
    self->_loggingQueueSize = loggingQueueSize + 1;
    pthread_mutex_unlock(&self->_loggingQueueLock);
    v7 = (void *)os_transaction_create();
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PETEventTracker2__dispatchAsyncForLogging_txnName___block_invoke;
    block[3] = &unk_1E2A41400;
    block[4] = self;
    v11 = v7;
    v12 = v5;
    v9 = v7;
    dispatch_async(loggingQueue, block);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dropping message due to exceeding the logging queue limit", buf, 2u);
    }
    AnalyticsSendEvent();
    pthread_mutex_unlock(&self->_loggingQueueLock);
  }

}

void __41__PETEventTracker2_initWithAsyncEnabled___block_invoke(uint64_t a1)
{
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "_init");
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2.", v2, 2u);
  }
}

- (void)_init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PETConfig *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  self->_isTesting = 0;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.proactive.eventtracker"), 0) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("pet_config"), CFSTR("bin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[PETConfig initWithFile:]([PETConfig alloc], "initWithFile:", v6);
      if (v7)
      {
        +[PETEventTracker2 defaultRootDir](PETEventTracker2, "defaultRootDir");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v9 = 138412290;
            v10 = v8;
            _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Initializing PETEventTracker2 with root dir: %@", (uint8_t *)&v9, 0xCu);
          }
          -[PETEventTracker2 _initWithRootDir:config:](self, "_initWithRootDir:config:", v8, v7);
        }
        else
        {
          AnalyticsSendEvent();
        }

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v9) = 0;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2 due to corrupted config", (uint8_t *)&v9, 2u);
        }
        AnalyticsSendEvent();
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2 due to missing config", (uint8_t *)&v9, 2u);
      }
      AnalyticsSendEvent();
      v6 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The process calling PET2 doesn't have the correct entitlement (com.apple.proactive.eventtracker)", (uint8_t *)&v9, 2u);
    }
    v11[0] = CFSTR("reason");
    v11[1] = CFSTR("process");
    v12[0] = &unk_1E2A49B40;
    v12[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();
  }

}

- (id)initForTestingWithRootDir:(id)a3
{
  id v4;
  PETConfig *v5;
  PETEventTracker2 *v6;

  v4 = a3;
  v5 = -[PETConfig initWithDictionary:]([PETConfig alloc], "initWithDictionary:", &unk_1E2A49E50);
  if (v5)
  {
    self = -[PETEventTracker2 initWithRootDir:config:](self, "initWithRootDir:config:", v4, v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PETEventTracker2)initWithRootDir:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  PETEventTracker2 *v8;
  PETEventTracker2 *v9;
  PETEventTracker2 *v10;
  uint8_t v12[16];
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PETEventTracker2;
  v8 = -[PETEventTracker2 init](&v13, sel_init);
  v9 = v8;
  if (v8
    && (v8->_isAsyncEnabled = 0,
        -[PETEventTracker2 _initWithRootDir:config:](v8, "_initWithRootDir:config:", v6, v7),
        !v9->_inited))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2.", v12, 2u);
    }
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (void)_initWithRootDir:(id)a3 config:(id)a4
{
  id v5;
  id v7;
  id v8;
  NSString *v9;
  NSString *logStoresDir;
  NSMutableDictionary *v11;
  NSMutableDictionary *storeCache;
  void *v13;
  NSString *rootDir;
  __CFString *v15;
  void *v16;
  PETAggregateState *v17;
  PETAggregateState *aggregateState;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSString *v23;
  char v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  RBSTarget *v28;
  RBSTarget *rbsTarget;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  const __CFString *v42;
  uint64_t v43;

  v5 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_rootDir, v5);
  objc_storeStrong((id *)&self->_config, a4);
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("log_stores"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  logStoresDir = self->_logStoresDir;
  self->_logStoresDir = v9;

  v11 = (NSMutableDictionary *)objc_opt_new();
  storeCache = self->_storeCache;
  self->_storeCache = v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  rootDir = self->_rootDir;
  v36 = 0;
  LOBYTE(v5) = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", rootDir, 1, 0, &v36);
  v15 = (__CFString *)v36;

  if ((v5 & 1) != 0)
  {
    -[NSString stringByAppendingPathComponent:](self->_rootDir, "stringByAppendingPathComponent:", CFSTR("aggr_state"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PETAggregateState initWithPath:]([PETAggregateState alloc], "initWithPath:", v16);
    aggregateState = self->_aggregateState;
    self->_aggregateState = v17;

    if (self->_aggregateState)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributesOfItemAtPath:error:", v16, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "fileSize");

      if (v21 > 0xA00000)
      {
        -[PETAggregateState reset](self->_aggregateState, "reset");
        AnalyticsSendEvent();
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self->_logStoresDir;
      v35 = v15;
      v24 = objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, &v35);
      v25 = v35;

      if ((v24 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "processIdentifier");

        objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v27);
        v28 = (RBSTarget *)objc_claimAutoreleasedReturnValue();
        rbsTarget = self->_rbsTarget;
        self->_rbsTarget = v28;

        pthread_mutex_init(&self->_rbsAssertionLock, 0);
        objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isProcessManagedByRBS = objc_msgSend(v30, "isManaged");

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          if (self->_isProcessManagedByRBS)
            v31 = CFSTR("YES");
          else
            v31 = CFSTR("NO");
          *(_DWORD *)buf = 138412290;
          v42 = v31;
          _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_isProcessManagedByRBS: %@", buf, 0xCu);
        }
        self->_inited = 1;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v25;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create log stores dir: %@", buf, 0xCu);
        }
        v37[0] = CFSTR("reason");
        v37[1] = CFSTR("code");
        v38[0] = &unk_1E2A49BA0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[__CFString code](v25, "code"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

      }
      v15 = v25;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create store for aggregate state", buf, 2u);
      }
      AnalyticsSendEvent();
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create root dir: %@", buf, 0xCu);
    }
    v39[0] = CFSTR("reason");
    v39[1] = CFSTR("code");
    v40[0] = &unk_1E2A49BA0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[__CFString code](v15, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Runningboard assertion (%@) was invalidated unexpectedly with error %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code", CFSTR("error_code")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Runningboard assertion (%@) will be invalidated soon. Force unlocking all store files...", buf, 0xCu);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_storeCache, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "unlock");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)trackScalarForMessage:(id)a3
{
  -[PETEventTracker2 trackScalarForMessage:count:](self, "trackScalarForMessage:count:", a3, 1);
}

- (void)trackScalarForMessage:(id)a3 updateCount:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int v11;
  _QWORD v12[5];
  id v13;
  int v14;

  v6 = a3;
  v7 = v6;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke;
    v12[3] = &unk_1E2A41428;
    v12[4] = self;
    v13 = v6;
    v14 = a4;
    -[PETEventTracker2 _dispatchAsyncForLogging:txnName:](self, "_dispatchAsyncForLogging:txnName:", v12, "com.apple.proactive.eventtracker.trackScalar");

  }
  else
  {
    v8 = (void *)MEMORY[0x19400723C]();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke_2;
    v9[3] = &unk_1E2A41428;
    v9[4] = self;
    v10 = v7;
    v11 = a4;
    -[PETEventTracker2 _runBlockWithRBSAssertion:](self, "_runBlockWithRBSAssertion:", v9);

    objc_autoreleasePoolPop(v8);
  }

}

- (void)logMessage:(id)a3
{
  -[PETEventTracker2 logMessage:subGroup:](self, "logMessage:subGroup:", a3, 0);
}

- (void)logMessage:(id)a3 subGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__PETEventTracker2_logMessage_subGroup___block_invoke;
    v12[3] = &unk_1E2A41478;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    -[PETEventTracker2 _dispatchAsyncForLogging:txnName:](self, "_dispatchAsyncForLogging:txnName:", v12, "com.apple.proactive.eventtracker.logMessage");

  }
  else
  {
    v8 = (void *)MEMORY[0x19400723C]();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__PETEventTracker2_logMessage_subGroup___block_invoke_2;
    v9[3] = &unk_1E2A41478;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[PETEventTracker2 _runBlockWithRBSAssertion:](self, "_runBlockWithRBSAssertion:", v9);

    objc_autoreleasePoolPop(v8);
  }

}

- (void)logMessageData:(id)a3 objcClassName:(id)a4 subGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isAsyncEnabled)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke;
    v16[3] = &unk_1E2A414A0;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    -[PETEventTracker2 _dispatchAsyncForLogging:txnName:](self, "_dispatchAsyncForLogging:txnName:", v16, "com.apple.proactive.eventtracker.logMessageData");

  }
  else
  {
    v11 = (void *)MEMORY[0x19400723C]();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke_2;
    v12[3] = &unk_1E2A414A0;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    -[PETEventTracker2 _runBlockWithRBSAssertion:](self, "_runBlockWithRBSAssertion:", v12);

    objc_autoreleasePoolPop(v11);
  }

}

- (id)_getLogStore:(id)a3
{
  id v4;
  void *v5;
  PETReservoirSamplingLog *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PETReservoirSamplingLog *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_storeCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[NSString stringByAppendingPathComponent:](self->_logStoresDir, "stringByAppendingPathComponent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETEventTracker2 config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "samplingLimitForMessageGroup:", v4);

    v10 = -[PETReservoirSamplingLog initWithPath:limit:]([PETReservoirSamplingLog alloc], "initWithPath:limit:", v7, v9);
    if (v10)
    {
      -[NSMutableDictionary setValue:forKey:](self->_storeCache, "setValue:forKey:", v10, v4);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributesOfItemAtPath:error:", v7, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileSize");

      if (v13 > 0xA00000)
      {
        -[PETReservoirSamplingLog clear](v10, "clear");
        v16[0] = CFSTR("type");
        v16[1] = CFSTR("msg_group");
        v17[0] = &unk_1E2A49BA0;
        v17[1] = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create store for unaggregated message group: %@", buf, 0xCu);
      }
      v18[0] = CFSTR("reason");
      v18[1] = CFSTR("msg_group");
      v19[0] = CFSTR("init_log_store");
      v19[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();
    }

    v6 = v10;
  }

  return v6;
}

- (void)_logMessageData:(id)a3 objcClassName:(id)a4 subGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (self->_inited)
  {
    -[PETEventTracker2 config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupForMessageName:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x19400723C]();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v11, v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    objc_autoreleasePoolPop(v12);
    -[PETEventTracker2 _getLogStore:](self, "_getLogStore:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[PETEventTracker2 _writeMessage:objCClassName:](PETEventTracker2, "_writeMessage:objCClassName:", v18, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "log:", v17);

      }
    }

  }
}

- (void)_logMessage:(id)a3 subGroup:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PETEventTracker2 _logMessageData:objcClassName:subGroup:](self, "_logMessageData:objcClassName:subGroup:", v9, v10, v6);
}

- (void)enumerateMessageGroups:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSString *logStoresDir;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (self->_inited)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    logStoresDir = self->_logStoresDir;
    v19 = 0;
    objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", logStoresDir, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v7)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v11);
      }
    }
    else
    {
      v21 = CFSTR("code");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v22[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

    }
  }

}

- (void)enumerateMessagesWithBlock:(id)a3 clearStore:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v7 = v6;
  if (self->_inited)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke;
    v8[3] = &unk_1E2A414F0;
    v8[4] = self;
    v9 = v6;
    v10 = a4;
    -[PETEventTracker2 enumerateMessageGroups:](self, "enumerateMessageGroups:", v8);

  }
}

- (void)enumerateMessagesWithBlock:(id)a3 messageGroup:(id)a4 clearStore:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a5;
  v8 = a3;
  if (self->_inited)
  {
    -[PETEventTracker2 _getLogStore:](self, "_getLogStore:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v5)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke;
        v13[3] = &unk_1E2A41518;
        v10 = &v14;
        v14 = v8;
        objc_msgSend(v9, "enumerateAndClearItemsWithBlock:", v13);
      }
      else
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke_2;
        v11[3] = &unk_1E2A41518;
        v10 = &v12;
        v12 = v8;
        objc_msgSend(v9, "enumerateItemsWithBlock:", v11);
      }

    }
  }

}

- (double)_roundToSigFigs:(double)a3 forRawMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double result;

  v6 = a4;
  -[PETEventTracker2 config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "sigFigsForMessageName:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  objc_msgSend((id)objc_opt_class(), "roundToSigFigs:sigFigs:", v9, a3);
  return result;
}

- (void)enumerateAggregatedMessagesWithBlock:(id)a3 clearStore:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, unsigned int, double, double, double, double, uint64_t, unsigned int);
  void *v17;
  PETEventTracker2 *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_inited)
  {
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke;
    v20[3] = &unk_1E2A41540;
    v20[4] = self;
    v9 = v6;
    v21 = v9;
    v10 = (void *)MEMORY[0x194007398](v20);
    v14 = v8;
    v15 = 3221225472;
    v16 = __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke_129;
    v17 = &unk_1E2A41568;
    v18 = self;
    v19 = v9;
    v11 = (void *)MEMORY[0x194007398](&v14);
    -[PETEventTracker2 aggregateState](self, "aggregateState", v14, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4)
      objc_msgSend(v12, "enumerateAndResetCounters:distributions:", v10, v11);
    else
      objc_msgSend(v12, "enumerateCounters:distributions:", v10, v11);

  }
}

- (void)setTestingEnvironment
{
  -[PETEventTracker2 setIsTesting:](self, "setIsTesting:", 1);
}

- (void)clearLogStores
{
  _QWORD v2[5];

  if (self->_inited)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __34__PETEventTracker2_clearLogStores__block_invoke;
    v2[3] = &unk_1E2A41590;
    v2[4] = self;
    -[PETEventTracker2 enumerateMessageGroups:](self, "enumerateMessageGroups:", v2);
  }
}

- (BOOL)isTesting
{
  return self->_isTesting;
}

- (void)setIsTesting:(BOOL)a3
{
  self->_isTesting = a3;
}

- (BOOL)isAsyncEnabled
{
  return self->_isAsyncEnabled;
}

- (void)setIsAsyncEnabled:(BOOL)a3
{
  self->_isAsyncEnabled = a3;
}

- (NSString)rootDir
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRootDir:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)logStoresDir
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLogStoresDir:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableDictionary)storeCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setStoreCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCache, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_logStoresDir, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
  objc_storeStrong((id *)&self->_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_rbsTarget, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_aggregateState, 0);
}

void __34__PETEventTracker2_clearLogStores__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getLogStore:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

void __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, double a4)
{
  void *v8;
  void *v9;
  void *v10;
  PETAggregationKey *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  int v17;
  PETAggregationKey *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x19400723C]();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
  v11 = -[PETAggregationKey initWithData:]([PETAggregationKey alloc], "initWithData:", v10);
  -[PETAggregationKey rawMessage](v11, "rawMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "setKey:", v11);
    v14 = *(void **)(a1 + 32);
    -[PETAggregationKey rawMessage](v11, "rawMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_roundToSigFigs:forRawMessage:", v15, a4);
    objc_msgSend(v9, "setCount:", v16);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v11;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Message name is nil in raw message: %@", (uint8_t *)&v17, 0xCu);
    }
    AnalyticsSendEvent();
  }

  objc_autoreleasePoolPop(v8);
}

void __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke_129(uint64_t a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6, double a7, uint64_t a8, unsigned int a9)
{
  void *v17;
  void *v18;
  void *v19;
  PETAggregationKey *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  PETAggregationKey *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v17 = (void *)MEMORY[0x19400723C]();
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
  v20 = -[PETAggregationKey initWithData:]([PETAggregationKey alloc], "initWithData:", v19);
  -[PETAggregationKey rawMessage](v20, "rawMessage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v18, "setKey:", v20);
    v23 = *(void **)(a1 + 32);
    v24 = (double)a9;
    -[PETAggregationKey rawMessage](v20, "rawMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_roundToSigFigs:forRawMessage:", v25, v24);
    objc_msgSend(v18, "setCount:", v26);

    v27 = (void *)objc_opt_new();
    v28 = *(void **)(a1 + 32);
    -[PETAggregationKey rawMessage](v20, "rawMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_roundToSigFigs:forRawMessage:", v29, a6);
    objc_msgSend(v27, "setMin:");

    v30 = *(void **)(a1 + 32);
    -[PETAggregationKey rawMessage](v20, "rawMessage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_roundToSigFigs:forRawMessage:", v31, a7);
    objc_msgSend(v27, "setMax:");

    v32 = *(void **)(a1 + 32);
    -[PETAggregationKey rawMessage](v20, "rawMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_roundToSigFigs:forRawMessage:", v33, a4);
    objc_msgSend(v27, "setMean:");

    v34 = *(void **)(a1 + 32);
    -[PETAggregationKey rawMessage](v20, "rawMessage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_roundToSigFigs:forRawMessage:", v35, a5);
    objc_msgSend(v27, "setVariance:");

    objc_msgSend(v18, "setDistribution:", v27);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = 138412290;
      v37 = v20;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Message name is nil in raw message: %@", (uint8_t *)&v36, 0xCu);
    }
    AnalyticsSendEvent();
  }

  objc_autoreleasePoolPop(v17);
}

void __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PETRawMessage *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x19400723C]();
  v4 = -[PETRawMessage initWithData:]([PETRawMessage alloc], "initWithData:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_autoreleasePoolPop(v3);
}

void __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  PETRawMessage *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x19400723C]();
  v4 = -[PETRawMessage initWithData:]([PETRawMessage alloc], "initWithData:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_autoreleasePoolPop(v3);
}

void __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke_2;
  v8[3] = &unk_1E2A414C8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v4, "enumerateMessagesWithBlock:messageGroup:clearStore:", v8, v7, v6);

}

uint64_t __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logMessageData:objcClassName:subGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logMessageData:objcClassName:subGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __40__PETEventTracker2_logMessage_subGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logMessage:subGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __40__PETEventTracker2_logMessage_subGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logMessage:subGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackDistributionForMessage:value:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackScalarForMessage:count:overwrite:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 1);
}

uint64_t __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackScalarForMessage:count:overwrite:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 1);
}

uint64_t __48__PETEventTracker2_trackScalarForMessage_count___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackScalarForMessage:count:overwrite:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0);
}

+ (id)defaultRootDir
{
  uid_t v2;
  passwd *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  int v9;
  int *v10;
  char *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  _DWORD v16[2];
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *__error() = 0;
  v2 = getuid();
  v3 = getpwuid(v2);
  if (!v3 || !v3->pw_dir)
  {
    v7 = *__error();
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v8)
      {
        v9 = *__error();
        v10 = __error();
        v11 = strerror(*v10);
        v16[0] = 67109378;
        v16[1] = v9;
        v17 = 2080;
        v18 = v11;
        v12 = MEMORY[0x1E0C81028];
        v13 = "Failed to get user passwd entry: [%i] %s";
        v14 = 18;
LABEL_11:
        _os_log_error_impl(&dword_18FAB0000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v16, v14);
      }
    }
    else if (v8)
    {
      LOWORD(v16[0]) = 0;
      v12 = MEMORY[0x1E0C81028];
      v13 = "User passwd entry or home directory is not found";
      v14 = 2;
      goto LABEL_11;
    }
    v6 = 0;
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.proactive.eventtracker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (double)roundToSigFigs:(double)a3 sigFigs:(unint64_t)a4
{
  double v4;
  BOOL v5;
  int v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = a3 < 0.0;
  if (a3 != 0.0)
  {
    v6 = a4;
    v7 = -a3;
    if (!v5)
      v7 = v4;
    v8 = log10(v7);
    v9 = __exp10((double)(int)(v6 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)round(v9 * v4) / v9;
  }
  return v4;
}

+ (id)formattedTextForAggregatedMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  PETProtobufRawDecodedMessage *v29;
  void *v30;
  void *v31;
  void *v32;
  PETProtobufRawDecodedMessage *v33;
  void *v34;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "datestamp");
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)(86400 * v6));
  objc_msgSend(v7, "setTimeZone:", v8);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(v7, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("UTC Date: %@\n"), v10);
  objc_msgSend(v3, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rawMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Message Name: %@\n"), v13);

  objc_msgSend(v3, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rawMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Message Type: %08x\n"), objc_msgSend(v15, "typeId"));

  objc_msgSend(v3, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "type");

  objc_msgSend(v3, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "typeAsString:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Aggregation Type: %@\n"), v19);

  objc_msgSend(v4, "appendFormat:", CFSTR("Count: %u\n"), objc_msgSend(v3, "count"));
  if ((_DWORD)v17 == 3)
  {
    objc_msgSend(v3, "key");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bucket");
    objc_msgSend(v4, "appendFormat:", CFSTR("Bucket: %f\n"), v28);
    goto LABEL_5;
  }
  if ((_DWORD)v17 == 2)
  {
    objc_msgSend(v3, "distribution");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "min");
    objc_msgSend(v4, "appendFormat:", CFSTR("Min: %f\n"), v21);

    objc_msgSend(v3, "distribution");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "max");
    objc_msgSend(v4, "appendFormat:", CFSTR("Max: %f\n"), v23);

    objc_msgSend(v3, "distribution");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mean");
    objc_msgSend(v4, "appendFormat:", CFSTR("Mean: %f\n"), v25);

    objc_msgSend(v3, "distribution");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "variance");
    objc_msgSend(v4, "appendFormat:", CFSTR("Variance: %f\n"), v27);
LABEL_5:

  }
  v29 = [PETProtobufRawDecodedMessage alloc];
  objc_msgSend(v3, "key");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rawMessage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rawBytes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PETProtobufRawDecodedMessage initWithData:](v29, "initWithData:", v32);

  objc_msgSend(v4, "appendFormat:", CFSTR("Message Body:\n"));
  -[PETProtobufRawDecodedMessage formattedText](v33, "formattedText");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v34);

  return v4;
}

+ (id)formattedTextForUnaggregatedMessage:(id)a3 messageGroup:(id)a4 config:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PETProtobufRawDecodedMessage *v14;
  void *v15;
  PETProtobufRawDecodedMessage *v16;
  void *v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "appendFormat:", CFSTR("Message Group: %@\n"), v8);

  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("Message Name: %@\n"), v11);

  objc_msgSend(v10, "appendFormat:", CFSTR("Message Type: %08x\n"), objc_msgSend(v9, "typeId"));
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nestedFieldsForMessageName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PETProtobufRawDecodedMessage alloc];
  objc_msgSend(v9, "rawBytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PETProtobufRawDecodedMessage initWithData:nestedFields:](v14, "initWithData:nestedFields:", v15, v13);
  objc_msgSend(v10, "appendFormat:", CFSTR("Message Body:\n"));
  -[PETProtobufRawDecodedMessage formattedText](v16, "formattedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v17);

  return v10;
}

@end
