@implementation RTInvocationDispatcher

- (RTInvocationDispatcher)initWithQueue:(id)a3
{
  id v5;
  NSObject *v6;
  RTInvocationDispatcher *v7;
  RTInvocationDispatcher *v8;
  uint64_t v9;
  NSMutableArray *pendingInvocations;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTInvocationDispatcher initWithQueue:]";
      v15 = 1024;
      v16 = 89;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)RTInvocationDispatcher;
  v7 = -[RTInvocationDispatcher init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v8->_valid = 1;
    v9 = objc_opt_new();
    pendingInvocations = v8->_pendingInvocations;
    v8->_pendingInvocations = (NSMutableArray *)v9;

  }
  return v8;
}

- (RTInvocationDispatcher)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_);
}

- (void)shutdown
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  _QWORD block[6];
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  v16 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  -[RTInvocationDispatcher queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__RTInvocationDispatcher_shutdown__block_invoke;
  block[3] = &unk_1E92977E0;
  block[4] = self;
  block[5] = v15;
  dispatch_async(v10, block);

  _Block_object_dispose(v15, 8);
}

void __34__RTInvocationDispatcher_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setValid:", 0);
  objc_msgSend(*(id *)(a1 + 32), "dispatchPendingInvocations");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)enqueueBlock:(id)a3 description:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v10);

  -[RTInvocationDispatcher _enqueueBlock:failureBlock:description:](self, "_enqueueBlock:failureBlock:description:", v8, 0, v9);
}

- (void)enqueueBlock:(id)a3 failureBlock:(id)a4 description:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v13);

  -[RTInvocationDispatcher _enqueueBlock:failureBlock:description:](self, "_enqueueBlock:failureBlock:description:", v11, v10, v12);
}

- (void)_enqueueBlock:(id)a3 failureBlock:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  RTInvocationRecord *v10;
  BOOL v11;
  NSObject *v12;
  _BOOL4 v13;
  RTInvocationRecord *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (RTInvocationRecord *)a4;
  v11 = -[RTInvocationDispatcher valid](self, "valid");
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (!v10 || v11)
  {
    if (v13)
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "Enqueuing invocation, description, %@", (uint8_t *)&v16, 0xCu);
    }

    v14 = -[RTInvocationRecord initWithBlock:failureBlock:description:]([RTInvocationRecord alloc], "initWithBlock:failureBlock:description:", v8, v10, v9);
    -[RTInvocationDispatcher pendingInvocations](self, "pendingInvocations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

    v10 = v14;
  }
  else
  {
    if (v13)
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "Dispatcher invalid, invoking failure block, description, %@", (uint8_t *)&v16, 0xCu);
    }

    ((void (*)(RTInvocationRecord *))v10->_failureBlock)(v10);
  }

}

- (BOOL)dispatchPendingInvocations
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[RTInvocationDispatcher pendingInvocations](self, "pendingInvocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v25 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "Dispatching %lu pending invocations.", buf, 0xCu);
  }

  -[RTInvocationDispatcher removeAllPendingInvocations](self, "removeAllPendingInvocations");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v8 = v7;
    v19 = 0;
    v9 = *(_QWORD *)v21;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = -[RTInvocationDispatcher valid](self, "valid");
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v15)
          {
            objc_msgSend(v12, "invocationDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = v19 + i + 1;
            v26 = 2112;
            v27 = v16;
            _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "Invocation %lu, action, invoke, description, %@", buf, 0x16u);

          }
          objc_msgSend(v12, "invoke");
        }
        else
        {
          if (v15)
          {
            objc_msgSend(v12, "invocationDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = v19 + i + 1;
            v26 = 2112;
            v27 = v17;
            _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "Invocation %lu, action, failure, description, %@", buf, 0x16u);

          }
          objc_msgSend(v12, "invokeFailure");
          v10 = 0;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v19 += i;
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  return v10 & 1;
}

- (void)removeAllPendingInvocations
{
  id v2;

  -[RTInvocationDispatcher pendingInvocations](self, "pendingInvocations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (unint64_t)countOfPendingInvocations
{
  void *v2;
  unint64_t v3;

  -[RTInvocationDispatcher pendingInvocations](self, "pendingInvocations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)invocationsPending
{
  NSObject *v3;
  void *v4;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[RTInvocationDispatcher pendingInvocations](self, "pendingInvocations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134217984;
    v8 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "Pending invocation count, %lu", (uint8_t *)&v7, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[RTInvocationDispatcher pendingInvocations](self, "pendingInvocations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_3);

  }
  return -[RTInvocationDispatcher countOfPendingInvocations](self, "countOfPendingInvocations") != 0;
}

void __44__RTInvocationDispatcher_invocationsPending__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a3 + 1;
    objc_msgSend(v4, "invocationDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "Invocation %lu, %@", (uint8_t *)&v8, 0x16u);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)pendingInvocations
{
  return self->_pendingInvocations;
}

- (void)setPendingInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInvocations, a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvocations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
