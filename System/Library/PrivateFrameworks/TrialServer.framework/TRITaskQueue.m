@implementation TRITaskQueue

- (TRITaskQueue)initWithServerContext:(id)a3 operationQueue:(id)a4 operationGroup:(id)a5 asyncQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TRITaskQueue *v15;
  TRITaskQueue *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _PASLock *lock;
  uint64_t v28;
  TRIClient *client;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v13)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operationQueue"));

      if (v14)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operationGroup"));

  if (!v12)
    goto LABEL_10;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asyncQueue"));

LABEL_5:
  v35.receiver = self;
  v35.super_class = (Class)TRITaskQueue;
  v15 = -[TRITaskQueue init](&v35, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_serverContext, v11);
    objc_storeStrong((id *)&v16->_opQueue, a4);
    objc_storeStrong((id *)&v16->_opGroup, a5);
    objc_storeStrong((id *)&v16->_asyncQueue, a6);
    v17 = objc_opt_new();
    *(_BYTE *)(v17 + 8) = 0;
    objc_msgSend(v11, "taskDatabase");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(v17 + 16);
    *(_QWORD *)(v17 + 16) = v18;

    v20 = objc_opt_new();
    v21 = *(void **)(v17 + 24);
    *(_QWORD *)(v17 + 24) = v20;

    v22 = objc_opt_new();
    v23 = *(void **)(v17 + 48);
    *(_QWORD *)(v17 + 48) = v22;

    *(_QWORD *)(v17 + 40) = 0;
    v24 = objc_opt_new();
    v25 = *(void **)(v17 + 64);
    *(_QWORD *)(v17 + 64) = v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v17);
    lock = v16->_lock;
    v16->_lock = (_PASLock *)v26;

    objc_msgSend(v11, "client");
    v28 = objc_claimAutoreleasedReturnValue();
    client = v16->_client;
    v16->_client = (TRIClient *)v28;

  }
  return v16;
}

- (void)registerFinalizeBlock:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__TRITaskQueue_registerFinalizeBlock___block_invoke;
  v7[3] = &unk_1E9334270;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __38__TRITaskQueue_registerFinalizeBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 64);
  v3 = (id)MEMORY[0x1D8232C48](*(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)finishXPCActivitiesWithGuardedData:(id)a3
{
  id *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  uint8_t buf[16];

  v4 = (id *)a3;
  v5 = objc_msgSend(v4[3], "count");
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "handleQueueEmptyNotificationWithGuardedData called but queue not complete processing work", buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "task queue has completed", buf, 2u);
    }

    notify_post("com.apple.trial.TaskQueueComplete");
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Remove all finalizeBlocks", buf, 2u);
    }

    objc_msgSend(v4[8], "removeAllObjects");
    v9 = (id)-[TRIClient _refresh:](self->_client, "_refresh:", 0);
    v10 = v4[6];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke;
    v12[3] = &unk_1E9334298;
    v12[4] = self;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);
    v4[5] = 0;
    objc_msgSend(v4[6], "removeAllObjects");
    -[TRITaskQueue _scheduleFutureActivitiesWithGuardedData:](self, "_scheduleFutureActivitiesWithGuardedData:", v4);
  }

  return v5 == 0;
}

void __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = objc_msgSend(a3, "futureCompletionStatus");
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke_2;
  v9[3] = &unk_1E932FA70;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, v9);

}

void __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)_scheduleFutureActivitiesWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor](TRILaunchDaemonActivityDescriptor, "taskQueueDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v5;
  +[TRILaunchDaemonActivityDescriptor retryFailuresDescriptor](TRILaunchDaemonActivityDescriptor, "retryFailuresDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v13 = (void *)v4[2];
        v14 = objc_msgSend(v12, "supportedTaskCapabilities");
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dependencyFreeTasksForAllowedCapabilities:dateForRunnability:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = 0;
        v24 = 0;
        if (v16)
        {
          v17 = objc_msgSend(v12, "supportedTaskCapabilities");
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRITaskQueue _partitionTaskGroup:byRunnabilityGivenCapabilities:runnableAtDate:topoSortedCurrentlyRunnable:blocked:allowOnlyRootTasksRunnable:](self, "_partitionTaskGroup:byRunnabilityGivenCapabilities:runnableAtDate:topoSortedCurrentlyRunnable:blocked:allowOnlyRootTasksRunnable:", v16, v17, v18, &v24, &v23, 1);

          if (objc_msgSend(v24, "count"))
          {
            -[TRITaskQueue _earliestStartDateFromTaskList:](self, "_earliestStartDateFromTaskList:", v24);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor](TRILaunchDaemonActivityDescriptor, "taskQueueDescriptor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v12, "isEqualToLaunchDaemonActivityDescriptor:", v20);

            if (v21)
              -[TRITaskQueue _registerTaskQueueActivityForDate:](self, "_registerTaskQueueActivityForDate:", v19);
            else
              -[TRITaskQueue _registerRetryActivityForDate:](self, "_registerRetryActivityForDate:", v19);

          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

}

- (id)_earliestStartDateFromTaskList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (!v6
            || (objc_msgSend(v6, "timeIntervalSinceReferenceDate"),
                v11 = v10,
                objc_msgSend(v9, "timeIntervalSinceReferenceDate"),
                v11 > v12))
          {
            v13 = v9;

            v6 = v13;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_evaluateRunConditionsWithGuardedData:(id)a3 shouldContinueWork:(BOOL *)a4
{
  id *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t (**v13)(void);
  int v14;
  NSObject *v15;
  __CFString *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  BOOL *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  NSObject *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  if (!*((_BYTE *)v5 + 8))
  {
    v35 = a4;
    *a4 = 1;
    v6 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = v5[6];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v12, "shouldDefer");
          v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
          v14 = v13[2]();

          if (v14)
          {
            TRILogCategory_Server();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "name");
              v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v45 = v16;
              _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Deferral requested for activity %{public}@", buf, 0xCu);

            }
            objc_msgSend(v6, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      v17 = objc_msgSend(v6, "count");
      if (v17 == objc_msgSend(v5[6], "count"))
        *v35 = 0;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v5[6], "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "copyWithReplacementFutureCompletionStatus:", 0);
          objc_msgSend(v5[6], "setObject:forKeyedSubscript:", v25, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v20);
    }

    if (!*v35)
      goto LABEL_48;
    if (qword_1EFC742E0 != -1)
      dispatch_once(&qword_1EFC742E0, &__block_literal_global_21);
    v26 = (id)_MergedGlobals_40;
    objc_msgSend(v26, "objectForKey:", CFSTR("com.apple.triald.tests.taskQueueDeferralSequence"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!objc_msgSend(v27, "count"))
          goto LABEL_47;
        objc_msgSend(v27, "firstObject");
        v28 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = -[NSObject BOOLValue](v28, "BOOLValue");
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          if (v29)
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412546;
              v45 = CFSTR("com.apple.triald.tests.taskQueueDeferralSequence");
              v46 = 2112;
              v47 = v28;
              _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Requesting task queue deferral due to NSUserDefaults %@[0] ==> %@", buf, 0x16u);
            }

            *v35 = 0;
          }
          else
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412546;
              v45 = CFSTR("com.apple.triald.tests.taskQueueDeferralSequence");
              v46 = 2112;
              v47 = v28;
              _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Omitting task queue deferral due to NSUserDefaults %@[0] ==> %@", buf, 0x16u);
            }

          }
          if ((unint64_t)objc_msgSend(v27, "count") < 2)
          {
            objc_msgSend(v26, "removeObjectForKey:", CFSTR("com.apple.triald.tests.taskQueueDeferralSequence"));
          }
          else
          {
            v33 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v27, "subarrayWithRange:", 1, objc_msgSend(v27, "count") - 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKey:", v34, CFSTR("com.apple.triald.tests.taskQueueDeferralSequence"));

            objc_autoreleasePoolPop(v33);
          }
        }
        else
        {
          TRILogCategory_Server();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = CFSTR("com.apple.triald.tests.taskQueueDeferralSequence");
            _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Expected NSNumber inside NSArray under NSUserDefaults %@", buf, 0xCu);
          }

        }
      }
      else
      {
        TRILogCategory_Server();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = CFSTR("com.apple.triald.tests.taskQueueDeferralSequence");
          _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Expected NSArray<NSNumber*> under NSUserDefaults %@", buf, 0xCu);
        }
      }

    }
LABEL_47:

    if (*v35)
      goto LABEL_49;
LABEL_48:
    *((_BYTE *)v5 + 8) = 1;
    objc_msgSend(v5[3], "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_71);
    goto LABEL_49;
  }
  *a4 = 0;
LABEL_49:

}

void __73__TRITaskQueue__evaluateRunConditionsWithGuardedData_shouldContinueWork___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_40;
  _MergedGlobals_40 = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __73__TRITaskQueue__evaluateRunConditionsWithGuardedData_shouldContinueWork___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

- (void)resumeWithXPCActivityDescriptor:(id)a3 executeWhenSuspended:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke;
  v11[3] = &unk_1E9334388;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

void __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD);
  uint64_t v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  uint8_t v40[8];
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[5];
  _BYTE buf[12];
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_2;
  v44[3] = &unk_1E932F918;
  v44[4] = *(_QWORD *)(a1 + 32);
  v5 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v44);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  v7 = (void *)*((_QWORD *)v3 + 2);
  v8 = *((_QWORD *)v3 + 5);
  v9 = objc_msgSend(*(id *)(a1 + 40), "capabilities");
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "dependencyFreeTasksForAllowedCapabilities:dateForRunnability:", v9 | v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") || objc_msgSend(*((id *)v3 + 3), "count"))
  {
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_74);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v11, "count");
      v15 = *((_QWORD *)v3 + 5);
      v16 = objc_msgSend(*(id *)(a1 + 40), "capabilities");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v14;
      v46 = 2048;
      v47 = v16 | v15;
      v48 = 2112;
      v49 = v38;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu dependency-free tasks to consider resuming the task queue with for capability %llu: %@", buf, 0x20u);
    }

    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "resuming task queue with activity %{public}@", buf, 0xCu);

    }
    v19 = v4;
    v37 = *((_QWORD *)v3 + 5);
    v20 = objc_msgSend(*(id *)(a1 + 40), "capabilities");
    v21 = *((_QWORD *)v3 + 5) | v20;
    *((_QWORD *)v3 + 5) = v21;
    *(_QWORD *)buf = 0;
    v43 = 0;
    v22 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v24 = v11;
    else
      v24 = (void *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v22, "_partitionTaskGroup:byRunnabilityGivenCapabilities:runnableAtDate:topoSortedCurrentlyRunnable:blocked:allowOnlyRootTasksRunnable:", v24, v21, v23, buf, &v43, 0);

    v25 = *((id *)v3 + 3);
    v26 = *(void **)buf;
    v41[0] = v19;
    v41[1] = 3221225472;
    v41[2] = __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_78;
    v41[3] = &unk_1E9334360;
    v27 = v25;
    v42 = v27;
    objc_msgSend(v26, "_pas_filteredArrayWithTest:", v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count") || objc_msgSend(v27, "count"))
    {
      *((_BYTE *)v3 + 8) = 0;
      if (*(_QWORD *)(a1 + 40))
      {
        +[TRIXPCActivityState xPCActivityStateWithFutureCompletionStatus:capabilities:](TRIXPCActivityState, "xPCActivityStateWithFutureCompletionStatus:capabilities:", 1, v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v3 + 6), "setObject:forKeyedSubscript:", v29, *(_QWORD *)(a1 + 40));

      }
      if (objc_msgSend(v28, "count"))
      {
        v40[0] = 0;
        objc_msgSend(*(id *)(a1 + 32), "_startImmediateTasksIfNotAlreadyQueued:guardedData:didStartNewWork:", *(_QWORD *)buf, v3, v40);
        if (!v40[0] && !objc_msgSend(v27, "count"))
        {
          *((_QWORD *)v3 + 5) = v37;
          if (*(_QWORD *)(a1 + 40))
          {
            objc_msgSend(*((id *)v3 + 6), "objectForKeyedSubscript:");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "completion");
            v31 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v31[2](v31, objc_msgSend(v30, "futureCompletionStatus"));

            objc_msgSend(*((id *)v3 + 6), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
          }
        }
      }
    }
    else
    {
      TRILogCategory_Server();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "task queue has no new work or work pending", v40, 2u);
      }

      *((_QWORD *)v3 + 5) = v37;
      v35 = *(void **)(a1 + 40);
      if (v35)
      {
        objc_msgSend(v35, "completion");
        v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v36[2](v36, 1);

      }
      objc_msgSend(*(id *)(a1 + 32), "_scheduleFutureActivitiesWithGuardedData:", v3);
    }

  }
  else
  {
    TRILogCategory_Server();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEFAULT, "task queue has no prior or pending tasks to resume", buf, 2u);
    }

    v33 = *(void **)(a1 + 40);
    if (v33)
    {
      objc_msgSend(v33, "completion");
      v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39[2](v39, 1);

    }
  }

  if (v5)
    v5[2](v5);

}

void __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_2(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

id __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_72(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithFormat:", CFSTR("[tid:%@]"), v3);

  return v4;
}

BOOL __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_78(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "taskId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (void)_finalizeTask:(id)a3 withId:(id)a4 runResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  TRITaskQueue *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke;
  v15[3] = &unk_1E9334400;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);

}

void __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke(id *a1, void *a2)
{
  id *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id *v46;
  id v47;
  id v48;
  _QWORD v49[5];
  id *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  v5 = objc_msgSend(a1[4], "runStatus");
  objc_msgSend(a1[4], "nextTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 3)
  {
LABEL_20:
    objc_msgSend(v3[2], "tasksDependentOnTask:", a1[6]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_180;
    v49[3] = &unk_1E93343B0;
    v49[4] = a1[7];
    v50 = v3;
    v51 = a1[5];
    v52 = a1[6];
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v49);

    v5 = 3;
    goto LABEL_21;
  }
  if (v5 == 1)
  {
    if (objc_msgSend(a1[5], "conformsToProtocol:", &unk_1EFC7C128)
      && (int)objc_msgSend(a1[5], "retryCount") <= 2)
    {
      v7 = a1[5];
      objc_msgSend(v3[3], "setObject:forKeyedSubscript:", 0, a1[6]);
      objc_msgSend(v3[2], "tasksDependentOnTask:", a1[6]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v54 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(a1[7], "_cancelTaskWithId:guardedData:persistCancel:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i), v3, 0);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        }
        while (v10);
      }
      objc_msgSend(a1[4], "earliestRetryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 43200.0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v30 = v15;

      if (objc_msgSend(a1[5], "wasDeferred"))
      {
        TRILogCategory_Server();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = a1[6];
          *(_DWORD *)buf = 138412290;
          v59 = (uint64_t)v37;
          _os_log_impl(&dword_1D207F000, v36, OS_LOG_TYPE_DEFAULT, "Not incrementing retry count for task [tid:%@] since it was just deferred.", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(v7, "setRetryCount:", objc_msgSend(v7, "retryCount") + 1);
        objc_msgSend(v3[2], "updateTaskWithTaskId:capabilities:task:", a1[6], objc_msgSend(a1[5], "requiredCapabilities"), a1[5]);
      }
      objc_msgSend(v3[2], "updateTaskWithTaskId:startDate:task:", a1[6], v30, v7);
      objc_msgSend(a1[7], "_registerRetryActivityForDate:", v30);

      goto LABEL_34;
    }
    v16 = objc_msgSend(a1[5], "conformsToProtocol:", &unk_1EFC7C128);
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = a1[6];
        *(_DWORD *)buf = 138412290;
        v59 = (uint64_t)v19;
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "task [tid:%@] exceeded maximum retry count, failing", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v40 = a1[6];
      *(_DWORD *)buf = 138412290;
      v59 = (uint64_t)v40;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "task [tid:%@] finished with TRITaskRunStatus_RETRY but not retryable; failing instead",
        buf,
        0xCu);
    }

    goto LABEL_20;
  }
LABEL_21:
  v21 = objc_msgSend(a1[7], "_removeTaskWithId:guardedData:persistRemove:", a1[6], v3, 1);
  TRILogCategory_Server();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((v21 & 1) != 0)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v24 = a1[5];
      v25 = a1[6];
      *(_DWORD *)buf = 138543618;
      v59 = (uint64_t)v24;
      v60 = 2112;
      v61 = v25;
      _os_log_debug_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEBUG, "removing task from DB: %{public}@ [tid:%@]", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v38 = a1[5];
    v39 = a1[6];
    *(_DWORD *)buf = 138543618;
    v59 = (uint64_t)v38;
    v60 = 2112;
    v61 = v39;
    _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "failed to remove task from DB: %{public}@ [tid:%@]", buf, 0x16u);
  }

  if (v6 && objc_msgSend(v6, "count"))
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "count");
      v28 = a1[5];
      v29 = a1[6];
      *(_DWORD *)buf = 134218498;
      v59 = v27;
      v60 = 2114;
      v61 = v28;
      v62 = 2112;
      v63 = v29;
      _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "adding %lu follow-up tasks for %{public}@ [tid:%@]", buf, 0x20u);
    }

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_182;
    v45[3] = &unk_1E93343D8;
    v45[4] = a1[7];
    v46 = v3;
    v47 = a1[5];
    v48 = a1[6];
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v45);

  }
  if (v5 == 2)
    objc_msgSend(a1[7], "_startRunnableTasksIfNecessaryWithGuardedData:", v3);
  v30 = 0;
LABEL_34:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = v3[8];
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v31);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v33);
  }

}

void __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_180(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_cancelTaskWithId:guardedData:persistCancel:", v3, *(_QWORD *)(a1 + 40), 1);
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v11 = 138543874;
      v12 = v3;
      v13 = 2114;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "removed downstream task %{public}@ of task %{public}@ [tid:%@]", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138543874;
    v12 = v3;
    v13 = 2114;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to remove downstream task %{public}@ of task %{public}@ [tid:%@]", (uint8_t *)&v11, 0x20u);
  }

}

void __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  TRITaskQueuingOptions *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[TRITaskQueuingOptions initWithDuplicateTaskResolution:]([TRITaskQueuingOptions alloc], "initWithDuplicateTaskResolution:", 1);

    v4 = v5;
  }
  v12 = 0;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_addTask:options:guardedData:taskId:tryRunningEligibleTasksImmediately:", v3, v4, *(_QWORD *)(a1 + 40), &v12, 1);
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 48);
      v10 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "failed to add follow-up task for %{public}@ [tid:%@]", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v14 = v3;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "enqueued follow-up task %{public}@ [tid:%@] after execution of [tid:%@]", buf, 0x20u);
  }

}

- (id)_runTask:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
  objc_msgSend(v4, "runUsingContext:withTaskQueue:", WeakRetained, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createOperationWithTask:(id)a3 withId:(id)a4 dependencies:(id)a5 taskMap:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  TRITaskQueue *v29;
  id v30;
  id location;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v24 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTask:", v9);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 481, CFSTR("Creating operation for task %@ with unknown dependency id %@"), v9, v17);

        }
        objc_msgSend(v12, "addDependency:", v18);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }

  objc_initWeak(&location, v12);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__TRITaskQueue__createOperationWithTask_withId_dependencies_taskMap___block_invoke;
  v26[3] = &unk_1E9334428;
  objc_copyWeak(&v30, &location);
  v20 = v9;
  v27 = v20;
  v21 = v24;
  v28 = v21;
  v29 = self;
  objc_msgSend(v12, "addExecutionBlock:", v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v12;
}

void __69__TRITaskQueue__createOperationWithTask_withId_dependencies_taskMap___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_msgSend(WeakRetained, "isCancelled");
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v43 = v7;
      v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [tid:%@] was cancelled", buf, 0x16u);
    }

    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, MEMORY[0x1E0C9AA60], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v10, "tags");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = &stru_1E9336E60;
      *(_DWORD *)buf = 138543874;
      if (v13)
        v15 = (const __CFString *)v13;
      v43 = v10;
      v44 = 2112;
      v45 = v11;
      v46 = 2114;
      v47 = v15;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ [tid:%@] with tags {%{public}@}", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setStateProvider:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "_runTask:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "reportResultToServer") & 1) == 0)
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v43 = v39;
        v44 = 2112;
        v45 = v9;
        _os_log_debug_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEBUG, "Asked not to report telemetry for task %@ with result %@", buf, 0x16u);
      }

    }
    if (objc_msgSend(v9, "reportResultToServer")
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "shouldLogAtLevel:", 20))
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("task_status"), (int)objc_msgSend(v9, "runStatus"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EFC7C128))
      {
        if (objc_msgSend(v9, "runStatus") != 1)
        {
          v20 = objc_msgSend(*(id *)(a1 + 32), "retryCount");
          if (v20 >= 1)
          {
            objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("retry_count"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v21);

          }
        }
      }
      v22 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "taskName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTrialdTaskName:", v23);

      v40 = v2;
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "shouldLogAtLevel:withPrivacyRadar:", 20, 54260918)&& objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EFC7B928))
      {
        objc_msgSend(*(id *)(a1 + 32), "dimensions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "metrics");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v19, "addObjectsFromArray:", v25);
        objc_msgSend(*(id *)(a1 + 32), "trialSystemTelemetry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v22, "mergeFrom:", v26);
        v27 = v22;
        v28 = v19;

      }
      else
      {
        v27 = v22;
        v28 = v19;
        v24 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "logger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "trackingId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0DC0F80];
      v32 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 16));
      objc_msgSend(v31, "fullSystemDimensions:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logWithTrackingId:metrics:dimensions:systemDimensions:trialSystemTelemetry:", v30, v28, v24, v33, v27);

      v2 = v40;
    }
    TRILogCategory_Server();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(a1 + 32);
      v35 = *(void **)(a1 + 40);
      v37 = objc_msgSend(v9, "runStatus");
      if (v37 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v37);
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = off_1E9334858[(int)v37];
      }
      *(_DWORD *)buf = 138543874;
      v43 = v36;
      v44 = 2112;
      v45 = v35;
      v46 = 2112;
      v47 = v38;
      _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ [tid:%@] finished with status %@", buf, 0x20u);

    }
    if (objc_msgSend(v9, "runStatus") != 2)
      objc_msgSend(WeakRetained, "cancel");
  }
  objc_msgSend(*(id *)(a1 + 48), "_finalizeTask:withId:runResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v9);

}

- (void)_startImmediateTasksIfNotAlreadyQueued:(id)a3 guardedData:(id)a4 didStartNewWork:(BOOL *)a5
{
  id v7;
  _QWORD *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *opGroup;
  NSObject *opQueue;
  void (**v48)(_QWORD);
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v54;
  uint64_t v55;
  id obj;
  TRITaskQueue *v57;
  void *v58;
  _QWORD v59[5];
  _QWORD *v60;
  _QWORD block[4];
  id v62;
  TRITaskQueue *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  buf[0] = 0;
  v57 = self;
  -[TRITaskQueue _evaluateRunConditionsWithGuardedData:shouldContinueWork:](self, "_evaluateRunConditionsWithGuardedData:shouldContinueWork:", v8, buf);
  if (buf[0])
  {
    v51 = (void *)os_transaction_create();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v10 = v9;
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v52 = v7;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v70;
      v54 = *(_QWORD *)v70;
      do
      {
        v14 = 0;
        v55 = v12;
        do
        {
          if (*(_QWORD *)v70 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1D8232A5C]();
          v17 = (void *)v8[3];
          objc_msgSend(v15, "taskId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v15, "taskId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setObject:forKeyedSubscript:", v19, v20);
          }
          else
          {
            v20 = (void *)objc_msgSend(v15, "copy");
            objc_msgSend(v15, "startDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21)
            {
              objc_msgSend(v21, "timeIntervalSinceReferenceDate");
              if (v23 > v10)
              {
                TRILogCategory_Server();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v15, "taskId");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v75 = v29;
                  v76 = 2112;
                  v77 = v22;
                  _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "asked to start task [tid:%@] with future start date %@", buf, 0x16u);

                }
              }
            }
            objc_msgSend(v20, "task");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "taskId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dependencies");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRITaskQueue _createOperationWithTask:withId:dependencies:taskMap:](v57, "_createOperationWithTask:withId:dependencies:taskMap:", v25, v26, v27, v58);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "taskId");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setObject:forKeyedSubscript:", v19, v28);

            v13 = v54;
            v12 = v55;
          }

          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v12);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v30 = obj;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v66 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v36 = (void *)v8[3];
          objc_msgSend(v35, "taskId");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
          {
            objc_msgSend(v35, "taskId");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              if (a5)
                *a5 = 1;
              v41 = (void *)v8[3];
              objc_msgSend(v35, "taskId");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, v42);

              TRILogCategory_Server();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v35, "task");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "taskId");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v75 = v44;
                v76 = 2112;
                v77 = v45;
                _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "Enqueueing eligible task %{public}@ [tid:%@]", buf, 0x16u);

              }
              opQueue = v57->_opQueue;
              opGroup = v57->_opGroup;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke;
              block[3] = &unk_1E9330548;
              v62 = v40;
              v63 = v57;
              v64 = v35;
              dispatch_group_async(opGroup, opQueue, block);
              if (!v8[7])
              {
                v59[0] = MEMORY[0x1E0C809B0];
                v59[1] = 3221225472;
                v59[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_3;
                v59[3] = &unk_1E932F8C8;
                v59[4] = v57;
                v60 = v8;
                v48 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v59);
                v49 = objc_msgSend(v48, "copy");
                v50 = (void *)v8[7];
                v8[7] = v49;

                v48[2](v48);
              }

            }
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v32);
    }

    v7 = v52;
  }

}

uint64_t __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_2;
    v5[3] = &unk_1E9334450;
    v5[4] = v2;
    return objc_msgSend(v3, "runWithLockAcquired:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setInProgress:", 1);
    objc_msgSend(*(id *)(a1 + 32), "main");
    return objc_msgSend(*(id *)(a1 + 32), "setInProgress:", 0);
  }
}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 24);
  objc_msgSend(*(id *)(a1 + 32), "taskId");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);

}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "setting up task queue completion block", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 32);
  v6 = *(NSObject **)(v3 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_206;
  v7[3] = &unk_1E932F8C8;
  v7[4] = v3;
  v8 = v4;
  dispatch_group_notify(v5, v6, v7);

}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_206(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "task queue completion block called", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_207;
  v6[3] = &unk_1E9334478;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "runWithLockAcquired:", v6);

}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_207(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(*(id *)(a1 + 32), "finishXPCActivitiesWithGuardedData:", a2))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "task queue not complete yet", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) + 16))();
  }
}

- (BOOL)_removeTaskWithId:(id)a3 guardedData:(id)a4 persistRemove:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id *v9;
  NSObject *v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  TRITaskQueue *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (id *)a4;
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "removing task with [tid:%@]", buf, 0xCu);
  }

  objc_msgSend(v9[3], "setObject:forKeyedSubscript:", 0, v8);
  if (v5)
  {
    v11 = v9[2];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__TRITaskQueue__removeTaskWithId_guardedData_persistRemove___block_invoke;
    v14[3] = &unk_1E93344A0;
    v15 = v8;
    v16 = self;
    v12 = objc_msgSend(v11, "removeTaskWithId:cleanupBlock:", v15, v14);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

void __60__TRITaskQueue__removeTaskWithId_guardedData_persistRemove___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEBUG, "Running dequeue handler for %@ [tid:%@]", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v3, "runDequeueHandlerUsingContext:", WeakRetained);

}

- ($A5A652246548B43F8BC05201A1C72A70)addTask:(id)a3 options:(id)a4
{
  return ($A5A652246548B43F8BC05201A1C72A70)-[TRITaskQueue addTask:options:taskId:](self, "addTask:options:taskId:", a3, a4, 0);
}

- ($A5A652246548B43F8BC05201A1C72A70)addTask:(id)a3 options:(id)a4 taskId:(id *)a5
{
  return ($A5A652246548B43F8BC05201A1C72A70)-[TRITaskQueue _addTask:options:taskId:tryRunningEligibleTasksImmediately:](self, "_addTask:options:taskId:tryRunningEligibleTasksImmediately:", a3, a4, a5, 1);
}

- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 taskId:(id *)a5 tryRunningEligibleTasksImmediately:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  _PASLock *lock;
  id v14;
  id v15;
  $A5A652246548B43F8BC05201A1C72A70 v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  id *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  const char *v27;
  char v28;

  v10 = a3;
  v11 = a4;
  v12 = (void *)os_transaction_create();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2810000000;
  v27 = "";
  v28 = 2;
  lock = self->_lock;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__TRITaskQueue__addTask_options_taskId_tryRunningEligibleTasksImmediately___block_invoke;
  v18[3] = &unk_1E93344C8;
  v21 = &v24;
  v18[4] = self;
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v20 = v15;
  v22 = a5;
  v23 = a6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v18);
  v16.var0 = *((_BYTE *)v25 + 32);

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __75__TRITaskQueue__addTask_options_taskId_tryRunningEligibleTasksImmediately___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_addTask:options:guardedData:taskId:tryRunningEligibleTasksImmediately:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = result;
  return result;
}

- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 guardedData:(id)a5 taskId:(id *)a6 tryRunningEligibleTasksImmediately:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  $A5A652246548B43F8BC05201A1C72A70 v17;
  id obj;

  v7 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)os_transaction_create();
  v16 = (void *)objc_opt_new();
  obj = 0;
  v17.var0 = -[TRITaskQueue _addTask:options:guardedData:taskIdOut:accumulatedNewTaskRecords:](self, "_addTask:options:guardedData:taskIdOut:accumulatedNewTaskRecords:", v14, v13, v12, &obj, v16);

  if (v17.var0 != 2 && objc_msgSend(v16, "count") && v7)
    -[TRITaskQueue _startRunnableTasksIfNecessaryWithGuardedData:](self, "_startRunnableTasksIfNecessaryWithGuardedData:", v12);
  if (a6)
    objc_storeStrong(a6, obj);

  return v17;
}

- (void)_startRunnableTasksIfNecessaryWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BYTE buf[12];
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)v4[2];
  v6 = v4[5];
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "dependencyFreeTasksForAllowedCapabilities:dateForRunnability:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_211);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v8, "count");
    v13 = v4[5];
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v12;
    v18 = 2048;
    v19 = v13;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Found %lu dependency-free tasks to consider starting for capability %llu: %@", buf, 0x20u);
  }

  if (v8)
  {
    v16 = 0;
    *(_QWORD *)buf = 0;
    v14 = v4[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITaskQueue _partitionTaskGroup:byRunnabilityGivenCapabilities:runnableAtDate:topoSortedCurrentlyRunnable:blocked:allowOnlyRootTasksRunnable:](self, "_partitionTaskGroup:byRunnabilityGivenCapabilities:runnableAtDate:topoSortedCurrentlyRunnable:blocked:allowOnlyRootTasksRunnable:", v8, v14, v15, buf, &v16, 1);

    -[TRITaskQueue _startImmediateTasksIfNotAlreadyQueued:guardedData:didStartNewWork:](self, "_startImmediateTasksIfNotAlreadyQueued:guardedData:didStartNewWork:", *(_QWORD *)buf, v4, 0);
  }

}

id __62__TRITaskQueue__startRunnableTasksIfNecessaryWithGuardedData___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithFormat:", CFSTR("[tid:%@]"), v3);

  return v4;
}

- (BOOL)_isTaskWithId:(id)a3 inTaskGroup:(id)a4 runnableGivenCapabilities:(unint64_t)a5 atDate:(id)a6 cachedRunnability:(id)a7 visitedPath:(id)a8 topoSortedRunnable:(id)a9 allowOnlyRootTasksRunnable:(BOOL)a10
{
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  unint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v63 = a4;
  v18 = v17;
  v61 = a6;
  v19 = a7;
  v20 = a8;
  v62 = a9;
  v21 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v19, "objectForKeyedSubscript:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {
    if (objc_msgSend(v20, "containsObject:", v17))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 746, CFSTR("Dependency graph contains a cycle"));

    }
    objc_msgSend(v20, "setByAddingObject:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v18;
    objc_msgSend(v63, "objectForKeyedSubscript:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 750, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v60 = v26;
    objc_msgSend(v26, "dependencies");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v65;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v65 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          LOBYTE(v58) = a10;
          if (!-[TRITaskQueue _isTaskWithId:inTaskGroup:runnableGivenCapabilities:atDate:cachedRunnability:visitedPath:topoSortedRunnable:allowOnlyRootTasksRunnable:](self, "_isTaskWithId:inTaskGroup:runnableGivenCapabilities:atDate:cachedRunnability:visitedPath:topoSortedRunnable:allowOnlyRootTasksRunnable:", v32, v63, a5, v61, v19, v25, v62, v58))
          {
            TRILogCategory_Server();
            v40 = objc_claimAutoreleasedReturnValue();
            v33 = v60;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v60, "task");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v69 = v41;
              v70 = 2112;
              v71 = (uint64_t)v32;
              _os_log_impl(&dword_1D207F000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, dependency with [tid:%@] is not runnable", buf, 0x16u);

            }
            v18 = v59;
            objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v59);

            goto LABEL_23;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        if (v29)
          continue;
        break;
      }
    }

    v33 = v60;
    if (a10)
    {
      objc_msgSend(v60, "dependencies");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        TRILogCategory_Server();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v60, "task");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "dependencies");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");
          *(_DWORD *)buf = 138543618;
          v69 = v37;
          v70 = 2048;
          v71 = v39;
          _os_log_impl(&dword_1D207F000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, waiting on %tu dependency/dependencies", buf, 0x16u);

        }
        v18 = v59;
        objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v59);
LABEL_23:
        v24 = 0;
        goto LABEL_24;
      }
    }
    objc_msgSend(v60, "task");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "requiredCapabilities");

    if (+[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", v44, a5))
    {
      objc_msgSend(v60, "startDate");
      v45 = objc_claimAutoreleasedReturnValue();
      v18 = v59;
      if (!v45)
        goto LABEL_34;
      v46 = (void *)v45;
      objc_msgSend(v60, "startDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "timeIntervalSinceReferenceDate");
      v49 = v48;
      objc_msgSend(v61, "timeIntervalSinceReferenceDate");
      v51 = v50;

      if (v49 <= v51)
      {
LABEL_34:
        objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v59);
        objc_msgSend(v62, "addObject:", v60);
        v24 = 1;
        goto LABEL_24;
      }
      TRILogCategory_Server();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v60, "task");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "startDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v53;
        v70 = 2112;
        v71 = (uint64_t)v54;
        _os_log_impl(&dword_1D207F000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, start date %@ in the future", buf, 0x16u);

      }
    }
    else
    {
      TRILogCategory_Server();
      v52 = objc_claimAutoreleasedReturnValue();
      v18 = v59;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v60, "task");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v69 = v55;
        v70 = 2048;
        v71 = v44;
        v72 = 2048;
        v73 = a5;
        _os_log_impl(&dword_1D207F000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, capabilities required: %llu, supported: %llu", buf, 0x20u);

      }
    }

    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v18);
    v24 = 0;
LABEL_24:

    v23 = 0;
    goto LABEL_25;
  }
  v24 = objc_msgSend(v22, "BOOLValue");
  v25 = v20;
LABEL_25:

  objc_autoreleasePoolPop(v21);
  return v24;
}

- (void)_partitionTaskGroup:(id)a3 byRunnabilityGivenCapabilities:(unint64_t)a4 runnableAtDate:(id)a5 topoSortedCurrentlyRunnable:(id *)a6 blocked:(id *)a7 allowOnlyRootTasksRunnable:(BOOL)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *context;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  BOOL v46;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  context = (void *)MEMORY[0x1D8232A5C]();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  TRILogCategory_Server();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = a4;
    _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Partitioning task group into runnable/blocked for capabilities %llu", buf, 0xCu);
  }

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke;
  v38[3] = &unk_1E9334510;
  v38[4] = self;
  v19 = v12;
  v39 = v19;
  v45 = a4;
  v20 = v13;
  v40 = v20;
  v41 = v14;
  v42 = v17;
  v21 = v15;
  v43 = v21;
  v46 = a8;
  v22 = v16;
  v44 = v22;
  v23 = v17;
  v24 = v14;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v38);
  objc_msgSend(v21, "_pas_mappedArrayWithTransform:", &__block_literal_global_220);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_221);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134218242;
    v48 = v28;
    v49 = 2114;
    v50 = v25;
    _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Found %lu runnable tasks: %{public}@", buf, 0x16u);
  }

  TRILogCategory_Server();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 134218242;
    v48 = v30;
    v49 = 2114;
    v50 = v26;
    _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Found %lu blocked tasks: %{public}@", buf, 0x16u);
  }

  v31 = *a6;
  *a6 = v21;
  v32 = v21;

  v33 = *a7;
  *a7 = v22;
  v34 = v22;

  objc_autoreleasePoolPop(context);
}

void __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  LOBYTE(v5) = *(_BYTE *)(a1 + 96);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isTaskWithId:inTaskGroup:runnableGivenCapabilities:atDate:cachedRunnability:visitedPath:topoSortedRunnable:allowOnlyRootTasksRunnable:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v5) & 1) == 0)objc_msgSend(*(id *)(a1 + 80), "addObject:", v6);

}

id __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[tid:%@]"), v5);
  return v6;
}

id __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[tid:%@]"), v5);
  return v6;
}

- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 guardedData:(id)a5 taskIdOut:(id *)a6 accumulatedNewTaskRecords:(id)a7
{
  id v12;
  id v13;
  id *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  $A5A652246548B43F8BC05201A1C72A70 v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  TRITaskRecord *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  TRITaskRecord *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  id v48;
  _QWORD v49[4];
  id v50;
  TRITaskQueue *v51;
  id *v52;
  _QWORD v53[5];
  NSObject *v54;
  id *v55;
  id v56;
  id v57;
  id v58;
  _BYTE *v59;
  SEL v60;
  uint8_t v61[4];
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE buf[24];
  char v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (id *)a5;
  v48 = a7;
  objc_msgSend(v14[2], "idForTask:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_17;
  v16 = objc_msgSend(v13, "duplicateTaskResolution");
  if (v16 == 1)
  {
    objc_msgSend(v14[3], "objectForKeyedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && objc_msgSend(v18, "inProgress"))
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "task with [tid:%@] is already running. Not replacing it with: %@", buf, 0x16u);
      }

      goto LABEL_12;
    }
    TRILogCategory_Server();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "replacing existing task with [tid:%@]: %@", buf, 0x16u);
    }

    -[TRITaskQueue _cancelDependenciesAndTaskWithId:guardedData:](self, "_cancelDependenciesAndTaskWithId:guardedData:", v15, v14);
LABEL_17:
    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "adding task to task queue: %@", buf, 0xCu);
    }

    objc_msgSend(v12, "dependencies");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = (void *)MEMORY[0x1E0C9AA60];
    if (v25)
      v27 = (void *)v25;
    v28 = v27;

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v28, "count"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v66 = 1;
    if (objc_msgSend(v28, "count"))
    {
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v61 = 138412290;
        v62 = (uint64_t)v12;
        _os_log_debug_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEBUG, "checking dependencies for task: %@", v61, 0xCu);
      }

      +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke;
      v53[3] = &unk_1E9334598;
      v53[4] = self;
      v32 = v31;
      v54 = v32;
      v55 = v14;
      v56 = v48;
      v60 = a2;
      v57 = v29;
      v59 = buf;
      v58 = v12;
      objc_msgSend(v28, "enumerateObjectsUsingBlock:", v53);

    }
    else
    {
      TRILogCategory_Server();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v61 = 138412290;
        v62 = (uint64_t)v12;
        _os_log_debug_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEBUG, "task %@ has no dependencies", v61, 0xCu);
      }
    }

    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      TRILogCategory_Server();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend(v29, "count");
        *(_DWORD *)v61 = 134218242;
        v62 = v34;
        v63 = 2112;
        v64 = v12;
        _os_log_impl(&dword_1D207F000, v33, OS_LOG_TYPE_DEFAULT, "adding task with %tu dependencies to task queue: %@", v61, 0x16u);
      }

      -[TRITaskQueue _addTask:withDependencies:guardedData:](self, "_addTask:withDependencies:guardedData:", v12, v29, v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = [TRITaskRecord alloc];
        objc_msgSend(v12, "startTime");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v12, "requiredCapabilities");
        objc_msgSend(v12, "tags");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        if (v39)
          v41 = v39;
        else
          v41 = MEMORY[0x1E0C9AA60];
        v42 = -[TRITaskRecord initWithTaskId:task:startDate:dependencies:capabilities:tags:](v36, "initWithTaskId:task:startDate:dependencies:capabilities:tags:", v35, v12, v37, v29, v38, v41);

        objc_msgSend(v48, "addObject:", v42);
        v21.var0 = 0;
      }
      else
      {
        v21.var0 = 2;
      }
      v15 = v35;
      v45 = *a6;
      *a6 = v15;
    }
    else
    {
      if (!objc_msgSend(v29, "count"))
      {
        v21.var0 = 2;
        goto LABEL_42;
      }
      TRILogCategory_Server();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_msgSend(v29, "count");
        *(_DWORD *)v61 = 134218242;
        v62 = v44;
        v63 = 2112;
        v64 = v12;
        _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "cancelling %tu dependencies of task: %@", v61, 0x16u);
      }

      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke_226;
      v49[3] = &unk_1E93340E8;
      v50 = v12;
      v51 = self;
      v52 = v14;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v49);

      v21.var0 = 2;
      v45 = v50;
    }

LABEL_42:
    _Block_object_dispose(buf, 8);

    goto LABEL_43;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskQueue.m"), 865, CFSTR("failed to handle duplicate task resolution: %u"), objc_msgSend(v13, "duplicateTaskResolution"));

    goto LABEL_17;
  }
  TRILogCategory_Server();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "task already exists with id [tid:%@]: %@", buf, 0x16u);
  }

  objc_storeStrong(a6, v15);
LABEL_12:
  v21.var0 = 1;
LABEL_43:

  return v21;
}

void __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v10 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "_addTask:options:guardedData:taskIdOut:accumulatedNewTaskRecords:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v10, *(_QWORD *)(a1 + 56)) == 2)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "failed to add dependency %@ for task: %@", buf, 0x16u);
    }

  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("TRITaskQueue.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("depTaskId != nil"));

    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:");
  }

}

void __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke_226(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "cancelling dependency task [tid:%@] of task %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_cancelTaskWithId:guardedData:persistCancel:", v3, *(_QWORD *)(a1 + 48), 1);
}

- (id)_addTask:(id)a3 withDependencies:(id)a4 guardedData:(id)a5
{
  id v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id WeakRetained;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "tags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v9[2];

  v20 = 0;
  objc_msgSend(v13, "addTask:startTime:tags:dependencies:error:", v8, v12, v11, v10, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v20;
  if (!v14)
    goto LABEL_5;
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = v14;
    _os_log_debug_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEBUG, "Running enqueue handler for %@ [tid:%@]", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
  objc_msgSend(v8, "runEnqueueHandlerUsingContext:", WeakRetained);

  if (v15)
  {
LABEL_5:
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v8;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v15;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "failed to add %@ with start time %@: %@", buf, 0x20u);
    }

    v14 = 0;
  }

  return v14;
}

- (BOOL)_cancelTaskWithId:(id)a3 guardedData:(id)a4 persistCancel:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id WeakRetained;
  BOOL v16;
  int v18;
  id v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (id *)a4;
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v8;
    _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "canceling task with [tid:%@]", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v9[3], "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "task");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v11, "task");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
    objc_msgSend(v14, "willBeCancelledByTaskQueue:withContext:", self, WeakRetained);

  }
  if (v11)
    objc_msgSend(v11, "cancel");
  v16 = -[TRITaskQueue _removeTaskWithId:guardedData:persistRemove:](self, "_removeTaskWithId:guardedData:persistRemove:", v8, v9, v5);

  return v16;
}

- (BOOL)cancelTask:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __27__TRITaskQueue_cancelTask___block_invoke;
  v8[3] = &unk_1E93345E8;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __27__TRITaskQueue_cancelTask___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelTask:guardedData:", *(_QWORD *)(a1 + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_cancelDependenciesAndTaskWithId:(id)a3 guardedData:(id)a4
{
  id v6;
  id *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  objc_msgSend(v7[2], "tasksDependentOnTask:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "cannot cancel task with [tid:%@] since other tasks depend on it: %@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7[2], "directDependenciesOfTaskWithId:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[TRITaskQueue _cancelTaskWithId:guardedData:persistCancel:](self, "_cancelTaskWithId:guardedData:persistCancel:", v6, v7, 1);
    if (v10)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = v10;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v10);
            -[TRITaskQueue _cancelDependenciesAndTaskWithId:guardedData:](self, "_cancelDependenciesAndTaskWithId:guardedData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v7, (_QWORD)v17);
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }

  return v11;
}

- (BOOL)_cancelTask:(id)a3 guardedData:(id)a4
{
  id v6;
  id *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  BOOL v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  objc_msgSend(v7[2], "idForTask:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "cannot cancel task since it is not queued: %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_7;
  }
  v9 = -[TRITaskQueue _cancelDependenciesAndTaskWithId:guardedData:](self, "_cancelDependenciesAndTaskWithId:guardedData:", v8, v7);
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "cancelled task with [tid:%@]: %@", (uint8_t *)&v14, 0x16u);
    }
LABEL_7:
    v12 = 1;
    goto LABEL_11;
  }
  if (v11)
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "could not cancel task with [tid:%@]: %@", (uint8_t *)&v14, 0x16u);
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)cancelTasksWithTag:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  TRITaskQueue *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__TRITaskQueue_cancelTasksWithTag___block_invoke;
  v8[3] = &unk_1E93345E8;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __35__TRITaskQueue_cancelTasksWithTag___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  uint64_t v4;
  id *v5;
  id v6;
  _QWORD v7[5];
  id *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3[2], "taskIdsWithTag:", a1[4]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__TRITaskQueue_cancelTasksWithTag___block_invoke_2;
  v7[3] = &unk_1E93345C0;
  v4 = a1[6];
  v7[4] = a1[5];
  v8 = v3;
  v9 = v4;
  v5 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __35__TRITaskQueue_cancelTasksWithTag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelTaskWithId:guardedData:persistCancel:", a2, *(_QWORD *)(a1 + 40), 1);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = result;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

- (BOOL)cancelTasksWithTag:(id)a3 excludingTasks:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _PASLock *lock;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  TRITaskQueue *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_231);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_2;
  v14[3] = &unk_1E9334678;
  v11 = v6;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = self;
  v18 = &v19;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  LOBYTE(self) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

uint64_t __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

void __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = (void *)v3[2];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_3;
  v16[3] = &unk_1E9334650;
  v17 = *(id *)(a1 + 40);
  v18 = v4;
  v10 = v4;
  objc_msgSend(v5, "enumerateTasksWithTagsIntersectingTagSet:block:", v8, v16);

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_4;
  v13[3] = &unk_1E93345C0;
  v11 = *(_QWORD *)(a1 + 56);
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v3;
  v15 = v11;
  v12 = v3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

void __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    objc_msgSend(v3, "lastTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = v5,
          v7 = *(void **)(a1 + 32),
          objc_msgSend(v5, "serialize"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v7) = objc_msgSend(v7, "containsObject:", v8),
          v8,
          v6,
          (v7 & 1) == 0))
    {
LABEL_5:
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v11, "taskId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

uint64_t __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelTaskWithId:guardedData:persistCancel:", a2, *(_QWORD *)(a1 + 40), 1);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = result;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

- (BOOL)enumerateTasksWithTagsIntersectingTagSet:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _PASLock *lock;
  id v13;
  id v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[5];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke;
  v27[3] = &unk_1E9334650;
  v27[4] = self;
  v10 = v8;
  v28 = v10;
  v11 = (void *)MEMORY[0x1D8232C48](v27);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  lock = self->_lock;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_2;
  v19[3] = &unk_1E93346C8;
  v22 = &v23;
  v13 = v6;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v19);
  if (*((_BYTE *)v24 + 24))
  {
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_3;
    v17[3] = &unk_1E93346F0;
    v18 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

    v15 = *((_BYTE *)v24 + 24) != 0;
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__33;
  v17 = __Block_byref_object_dispose__33;
  v18 = 0;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_234;
  v10 = &unk_1E93346A0;
  v12 = &v13;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "runWithLockAcquired:", &v7);
  if (v14[5])
  {
    v6 = objc_msgSend(v5, "copyWithReplacementTask:", v7, v8, v9, v10);

    v5 = (id)v6;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

void __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_234(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a2 + 24);
  objc_msgSend(*(id *)(a1 + 32), "taskId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "task");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 16), "enumerateTasksWithTagsIntersectingTagSet:block:", a1[4], a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)count
{
  _PASLock *lock;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__TRITaskQueue_count__block_invoke;
  v5[3] = &unk_1E9334718;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__TRITaskQueue_count__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)updateActivity:(id)a3 withStartDate:(id)a4
{
  id v5;
  _xpc_activity_s *v6;
  xpc_object_t v7;
  void *v8;
  double v9;
  double v10;
  int64_t v11;
  xpc_activity_state_t state;
  NSObject *v13;
  int v15;
  int64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  xpc_activity_state_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (_xpc_activity_s *)a3;
  v7 = xpc_activity_copy_criteria(v6);
  if (!v7)
    v7 = xpc_dictionary_create(0, 0, 0);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if ((uint64_t)v10 <= 10)
    v11 = 10;
  else
    v11 = (uint64_t)v10;
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E0C80760], v11);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E0C80790], 1800);
  xpc_activity_set_criteria(v6, v7);
  state = xpc_activity_get_state(v6);

  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v16 = v11;
    v17 = 2048;
    v18 = 1800;
    v19 = 2048;
    v20 = state;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "set activity delay %lld [+%lld] (state %ld)", (uint8_t *)&v15, 0x20u);
  }

  return 1;
}

- (void)_registerRetryActivityForDate:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *asyncQueue;
  id v18;
  _QWORD v19[4];
  id v20;
  TRITaskQueue *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "no date specified to retry, defaulting to 24 hours", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
  objc_msgSend(WeakRetained, "keyValueStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  +[TRISetupAssistantFetchUtils getValueInKeyValueStore:key:error:](TRISetupAssistantFetchUtils, "getValueInKeyValueStore:key:error:", v7, CFSTR("post-upgrade-activity-in-progress"), &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  objc_msgSend(WeakRetained, "keyValueStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  +[TRISetupAssistantFetchUtils getValueInKeyValueStore:key:error:](TRISetupAssistantFetchUtils, "getValueInKeyValueStore:key:error:", v10, CFSTR("post-upgrade-require-inexpensive-networking-activity-in-progress"), &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;

  if ((objc_msgSend(v8, "isEqualToNumber:", &unk_1E9363EB8) & 1) != 0
    || objc_msgSend(v11, "isEqualToNumber:", &unk_1E9363EB8))
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v13 > 7200.0)
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v4;
        v26 = 2048;
        v27 = 7200;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "One of the tasks enqueued during post upgrade resulted in a retry. The original retry date is set to: %@. Modifying it to be %lld seconds from now", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 7200.0);
      v15 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v15;
    }
  }
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "registering retry activity for date: %@", buf, 0xCu);
  }

  asyncQueue = self->_asyncQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__TRITaskQueue__registerRetryActivityForDate___block_invoke;
  v19[3] = &unk_1E932F8C8;
  v20 = v4;
  v21 = self;
  v18 = v4;
  dispatch_async(asyncQueue, v19);

}

void __46__TRITaskQueue__registerRetryActivityForDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  +[TRILaunchDaemonActivityDescriptor retryFailuresDescriptor](TRILaunchDaemonActivityDescriptor, "retryFailuresDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_2;
  v5[3] = &unk_1E932F7F8;
  v6 = *(id *)(a1 + 32);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_3;
  v4[3] = &unk_1E932F820;
  v4[4] = *(_QWORD *)(a1 + 40);
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v2, v5, v4);

}

void __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_2(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  int64_t v8;
  xpc_object_t v9;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_activity_copy_criteria(v3);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = (uint64_t)v6;

  v8 = v7 + 5;
  if (xdict && xpc_dictionary_get_count(xdict))
  {
    xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80760], v8);
  }
  else
  {
    v9 = xpc_dictionary_create(0, 0, 0);

    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C80738], 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C808B8], 1);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C808C8], 1);
    xpc_dictionary_set_string(v9, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E0C80790], 1800);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E0C80760], v8);
    xdict = v9;
  }
  xpc_activity_set_criteria(v3, xdict);

}

void __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.trial.Server.test.retries-networking"), "cStringUsingEncoding:", 4));
  objc_msgSend(*(id *)(a1 + 32), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v3, 0);

}

- (void)_registerTaskQueueActivityForDate:(id)a3
{
  id v4;
  NSObject *asyncQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  TRITaskQueue *v9;

  v4 = a3;
  asyncQueue = self->_asyncQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke;
  v7[3] = &unk_1E932F8C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(asyncQueue, v7);

}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "registering TaskQueue activity for date: %@", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_241;
  v8[3] = &unk_1E9334478;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v5, "runWithLockAcquired:", v8);

}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_241(int8x16_t *a1, void *a2)
{
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  int8x16_t v12;

  v3 = a2;
  v4 = v3;
  v5 = (void *)a1[2].i64[0];
  if (v5)
  {
    if (!v3[4])
    {
LABEL_5:
      objc_storeStrong(v4 + 4, v5);
      +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor](TRILaunchDaemonActivityDescriptor, "taskQueueDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_2;
      v11[3] = &unk_1E9334740;
      v9 = a1[2];
      v8 = (id)v9.i64[0];
      v12 = vextq_s8(v9, v9, 8uLL);
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_242;
      v10[3] = &unk_1E932F820;
      v10[4] = a1[2].i64[1];
      +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v6, v11, v10);

      goto LABEL_6;
    }
    if (objc_msgSend((id)a1[2].i64[0], "compare:") != 1)
    {
      v5 = (void *)a1[2].i64[0];
      goto LABEL_5;
    }
  }
LABEL_6:

}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "TaskQueue checking in", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateActivity:withStartDate:", v3, *(_QWORD *)(a1 + 40));
}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_242(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "TaskQueue running activity", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v3, 0);
}

- (void)registerFinalizeBlockToRetryWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, int, uint64_t, void *);
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __54__TRITaskQueue_registerFinalizeBlockToRetryWithBlock___block_invoke;
  v10 = &unk_1E9334768;
  v12 = v13;
  v5 = v4;
  v11 = v5;
  v6 = (void *)MEMORY[0x1D8232C48](&v7);
  -[TRITaskQueue registerFinalizeBlock:](self, "registerFinalizeBlock:", v6, v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
}

void __54__TRITaskQueue_registerFinalizeBlockToRetryWithBlock___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  __n128 v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a2;
  v9 = a5;
  if (a3 == 1
    && objc_msgSend(v8, "conformsToProtocol:", &unk_1EFC7C128)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if ((int)objc_msgSend(v8, "retryCount") > 2)
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "finalizeBlock: exceeded the number of retry counts. Not doing anything", v12, 2u);
      }

    }
    else
    {
      if (v9)
        objc_msgSend(v9, "timeIntervalSinceNow");
      else
        v10.n128_u64[0] = 0;
      (*(void (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(v10);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (id)debugDescription
{
  _PASLock *lock;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33;
  v12 = __Block_byref_object_dispose__33;
  v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__TRITaskQueue_debugDescription__block_invoke;
  v7[3] = &unk_1E9334718;
  v7[4] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  objc_msgSend((id)v9[5], "_pas_mappedArrayWithTransform:", &__block_literal_global_246);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TaskQueue with %lu tasks:\n%@"), objc_msgSend((id)v9[5], "count"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __32__TRITaskQueue_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a2 + 16), "allTasks");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_taskId);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __32__TRITaskQueue_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "dependencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_247);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "taskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");
  objc_msgSend(v2, "task");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%5d|%@ : %@"), v8, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __32__TRITaskQueue_debugDescription__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (id)activeActivityGrantingCapability:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[TRITaskQueue activeActivityDescriptorGrantingCapability:](self, "activeActivityDescriptorGrantingCapability:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeActivityDescriptorGrantingCapability:(unint64_t)a3
{
  _PASLock *lock;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__33;
  v14 = __Block_byref_object_dispose__33;
  v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke;
  v9[3] = &unk_1E93347F8;
  v9[4] = &v10;
  v9[5] = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  if (v11[5])
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v11[5], "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v17 = a3;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Found Active XPC activity with capability %llu: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "No active XPC activity with capability %llu", buf, 0xCu);
    }
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3[6], "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Looking for XPC activity granting capability %llu. Currently active activities: %{public}@", buf, 0x16u);

  }
  v7 = v3[6];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke_254;
  v9[3] = &unk_1E93347D0;
  v8 = *(_QWORD *)(a1 + 40);
  v9[5] = *(_QWORD *)(a1 + 32);
  v9[6] = v8;
  v9[4] = v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);
  _Block_object_dispose(v10, 8);

}

void __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke_254(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  id v10;

  v10 = a2;
  if (+[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", a1[6], objc_msgSend(a3, "capabilities")))
  {
    objc_msgSend(v10, "activity");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(v10, "generationCount");
      v9 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);

      if (v8 >= v9)
      {
        *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v10, "generationCount");
        objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      }
    }
  }

}

- (void)waitForAsyncQueue
{
  dispatch_sync((dispatch_queue_t)self->_asyncQueue, &__block_literal_global_255);
  dispatch_sync((dispatch_queue_t)self->_asyncQueue, &__block_literal_global_256);
}

- (BOOL)ifNotPresentAddTask:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[TRITaskQueue _addTask:options:taskId:tryRunningEligibleTasksImmediately:](self, "_addTask:options:taskId:tryRunningEligibleTasksImmediately:", v4, v5, 0, 0);

  return (_DWORD)self != 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_opGroup, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_destroyWeak((id *)&self->_serverContext);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
