@implementation RCOperation

- (BOOL)isExecuting
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_executing);
  return v2 & 1;
}

- (void)finishedPerformingOperationWithError:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RCOperation timedOutTest](self, "timedOutTest");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4 || ((*(uint64_t (**)(uint64_t))(v4 + 16))(v4) & 1) == 0)
    -[RCOperation _finishedPerformingOperationWithError:](self, "_finishedPerformingOperationWithError:", v6);

}

- (id)timedOutTest
{
  return self->_timedOutTest;
}

- (void)_finishedPerformingOperationWithError:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  double v11;

  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "rc_isOperationThrottledError") & 1) != 0)
    goto LABEL_10;
  v11 = 0.0;
  if (-[RCOperation shouldStartThrottlingWithError:retryAfter:](self, "shouldStartThrottlingWithError:retryAfter:", v5, &v11))
  {
    -[RCOperation _handleThrottlingFromError:delay:](self, "_handleThrottlingFromError:delay:", v5, v11);
LABEL_10:
    -[RCOperation _finishOperationWithError:](self, "_finishOperationWithError:", v5);
    goto LABEL_11;
  }
  if ((-[RCOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_10;
  v6 = -[RCOperation maxRetries](self, "maxRetries");
  if (-[RCOperation retryCount](self, "retryCount") >= v6)
    goto LABEL_10;
  v10 = 0;
  v7 = -[RCOperation canRetryWithError:retryAfter:](self, "canRetryWithError:retryAfter:", v5, &v10);
  v8 = v10;
  v9 = v8;
  if (!v7)
  {

    goto LABEL_10;
  }
  -[RCOperation _handleRetryFromError:signal:](self, "_handleRetryFromError:signal:", v5, v8);

LABEL_11:
}

- (void)associateChildOperation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RCOperation childOperationsLock](self, "childOperationsLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__RCOperation_associateChildOperation___block_invoke;
    v6[3] = &unk_1E470DE50;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performWithLockSync:", v6);

  }
}

- (void)setQualityOfService:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCOperation;
  if (-[RCOperation qualityOfService](&v8, sel_qualityOfService) != (id)a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)RCOperation;
    -[RCOperation setQualityOfService:](&v7, sel_setQualityOfService_, a3);
    if ((-[RCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 1) != 0)
    {
      -[RCOperation childOperationsLock](self, "childOperationsLock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __35__RCOperation_setQualityOfService___block_invoke;
      v6[3] = &unk_1E470DF58;
      v6[4] = self;
      v6[5] = a3;
      objc_msgSend(v5, "performWithLockSync:", v6);

    }
  }
}

- (void)_finishOperationWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[RCOperation isFinished](self, "isFinished") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCOperation _finishOperationWithError:].cold.1();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[RCOperation setOperationEndTime:](self, "setOperationEndTime:");
  if (!-[RCOperation isCancelled](self, "isCancelled"))
  {
    RCSharedLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v4)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = (unint64_t)v4;
      v7 = "%{public}@ failed with error: %{public}@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCOperation operationEndTime](self, "operationEndTime");
      v13 = v12;
      -[RCOperation operationStartTime](self, "operationStartTime");
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2048;
      v21 = RCSecondsToMilliseconds(v13 - v14);
      v7 = "%{public}@ finished with total time: %llums";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
    }
    v10 = 22;
    goto LABEL_13;
  }
  RCSharedLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    v7 = "%{public}@ cancelled";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
LABEL_13:
    _os_log_impl(&dword_1A1FB5000, v8, v9, v7, buf, v10);

  }
LABEL_14:

  -[RCOperation operationWillFinishWithError:](self, "operationWillFinishWithError:", v4);
  -[RCOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  atomic_store(0, (unsigned __int8 *)&self->_executing);
  -[RCOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[RCOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  atomic_store(1u, (unsigned __int8 *)&self->_finished);
  -[RCOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[RCOperation finishedGroup](self, "finishedGroup");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v15);

  -[RCOperation childOperationsLock](self, "childOperationsLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__RCOperation__finishOperationWithError___block_invoke;
  v17[3] = &unk_1E470DFF0;
  v17[4] = self;
  objc_msgSend(v16, "performWithLockSync:", v17);

  -[RCOperation operationDidFinishWithError:](self, "operationDidFinishWithError:", v4);
}

- (BOOL)isFinished
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

uint64_t __41__RCOperation__finishOperationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChildOperations:", 0);
}

uint64_t __39__RCOperation_associateChildOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_associateChildOperation:", *(_QWORD *)(a1 + 40));
}

void __35__RCOperation_setRelativePriority___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "childOperations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        RCProtocolCast((uint64_t)&unk_1EE659C28, *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRelativePriority:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __35__RCOperation_setQualityOfService___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "childOperations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = objc_opt_class();
        RCDynamicCast(v8, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setQualityOfService:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)setOperationEndTime:(double)a3
{
  self->_operationEndTime = a3;
}

- (void)setChildOperations:(id)a3
{
  objc_storeStrong((id *)&self->_childOperations, a3);
}

- (double)operationStartTime
{
  return self->_operationStartTime;
}

- (double)operationEndTime
{
  return self->_operationEndTime;
}

- (OS_dispatch_group)finishedGroup
{
  return self->_finishedGroup;
}

- (BOOL)_startIfNeeded
{
  void *v3;
  int v4;
  RCOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  double v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[RCOperation startOnce](self, "startOnce");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "trigger");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[RCOperation setOperationStartTime:](self, "setOperationStartTime:");
    v5 = self;
    v16 = 0.0;
    if (-[RCOperation _shouldThrottleOperationWithRetryAfter:](v5, "_shouldThrottleOperationWithRetryAfter:", &v16))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCOperation _errorUserInfo](v5, "_errorUserInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v7);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("RCErrorRetryAfter"));

      objc_msgSend(MEMORY[0x1E0CB35C8], "rc_errorWithCode:description:additionalUserInfo:", 8, CFSTR("The operation was throttled."), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCOperation _finishOperationWithError:](v5, "_finishOperationWithError:", v9);

    }
    else if (-[RCOperation validateOperation](v5, "validateOperation"))
    {
      if (!-[RCOperation isCancelled](v5, "isCancelled"))
      {
        -[RCOperation willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("isExecuting"));
        atomic_store(1u, (unsigned __int8 *)&v5->_executing);
        -[RCOperation didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("isExecuting"));
        RCSharedLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[RCOperation longOperationDescription](v5, "longOperationDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v15;
          _os_log_impl(&dword_1A1FB5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);

        }
        -[RCOperation prepareOperation](v5, "prepareOperation");
        -[RCOperation performOperation](v5, "performOperation");
        goto LABEL_9;
      }
      -[RCOperation finishFromEarlyCancellation](v5, "finishFromEarlyCancellation");
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      -[RCOperation _errorUserInfo](v5, "_errorUserInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rc_errorWithCode:description:additionalUserInfo:", 6, CFSTR("The operation failed validation."), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCOperation _finishOperationWithError:](v5, "_finishOperationWithError:", v12);

    }
    if (v5)
LABEL_9:

  }
  return v4;
}

- (RCOnce)startOnce
{
  return self->_startOnce;
}

- (void)setOperationStartTime:(double)a3
{
  self->_operationStartTime = a3;
}

- (BOOL)_shouldThrottleOperationWithRetryAfter:(double *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;

  -[RCOperation throttleGroup](self, "throttleGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCOperation _userDefaultsKeyForThrottleEndDate](self, "_userDefaultsKeyForThrottleEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v8, "timeIntervalSinceNow"), v9 > 0.0))
  {
    *a3 = ceil(v9) + 1.0;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)throttleGroup
{
  return 0;
}

- (void)_associateChildOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    RCProtocolCast((uint64_t)&unk_1EE659B98, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    RCSharedLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        objc_msgSend(v5, "shortOperationDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCOperation shortOperationDescription](self, "shortOperationDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v8;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1A1FB5000, v6, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v18, 0x16u);

      }
    }
    else if (v7)
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1A1FB5000, v6, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v18, 0x16u);

    }
    if (-[RCOperation childOperationsCancelled](self, "childOperationsCancelled")
      || (-[RCOperation childOperations](self, "childOperations"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      objc_msgSend(v4, "cancel");
    }
    else
    {
      -[RCOperation childOperations](self, "childOperations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v4);

      if ((-[RCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 2) != 0)
      {
        RCProtocolCast((uint64_t)&unk_1EE659C28, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setRelativePriority:", -[RCOperation relativePriority](self, "relativePriority"));

      }
      if ((-[RCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 1) != 0)
      {
        v16 = objc_opt_class();
        RCDynamicCast(v16, (uint64_t)v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setQualityOfService:", -[RCOperation qualityOfService](self, "qualityOfService"));

      }
    }

  }
}

- (unint64_t)propertiesInheritedByChildOperations
{
  return 3;
}

- (NSMutableArray)childOperations
{
  return self->_childOperations;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (id)longOperationDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  RCStringFromQualityOfService(-[RCOperation qualityOfService](self, "qualityOfService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RCStringFromQueuePriority(-[RCOperation queuePriority](self, "queuePriority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[RCOperation operationID](self, "operationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, qos=%@, priority=%@>"), v6, v7, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shortOperationDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCOperation operationID](self, "operationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (BOOL)childOperationsCancelled
{
  return self->_childOperationsCancelled;
}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  if (self->_relativePriority != a3)
  {
    self->_relativePriority = a3;
    -[RCOperation setQueuePriority:](self, "setQueuePriority:", RCQueuePriorityFromRelativePriority(a3));
    if ((-[RCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 2) != 0)
    {
      -[RCOperation childOperationsLock](self, "childOperationsLock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __35__RCOperation_setRelativePriority___block_invoke;
      v6[3] = &unk_1E470DF58;
      v6[4] = self;
      v6[5] = a3;
      objc_msgSend(v5, "performWithLockSync:", v6);

    }
  }
}

- (RCUnfairLock)childOperationsLock
{
  return self->_childOperationsLock;
}

- (void)start
{
  id v2;
  void *v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "shortOperationDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@ has already been started"), v3);
  *(_DWORD *)buf = 136315906;
  v6 = "-[RCOperation start]";
  v7 = 2080;
  v8 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperation.m";
  v9 = 1024;
  v10 = 173;
  v11 = 2114;
  v12 = v4;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

}

- (RCOperation)init
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  RCUnfairLock *v7;
  void *v8;
  RCOnce *v9;
  void *v10;
  dispatch_group_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)RCOperation;
  v2 = -[RCOperation init](&v16, sel_init);
  if (v2)
  {
    RCGenerateOperationID();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 34);
    *((_QWORD *)v2 + 34) = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)*((_QWORD *)v2 + 38);
    *((_QWORD *)v2 + 38) = v5;

    v7 = objc_alloc_init(RCUnfairLock);
    v8 = (void *)*((_QWORD *)v2 + 39);
    *((_QWORD *)v2 + 39) = v7;

    v9 = -[RCOnce initWithOptions:]([RCOnce alloc], "initWithOptions:", 1);
    v10 = (void *)*((_QWORD *)v2 + 40);
    *((_QWORD *)v2 + 40) = v9;

    *((_QWORD *)v2 + 32) = 0;
    v11 = dispatch_group_create();
    v12 = (void *)*((_QWORD *)v2 + 41);
    *((_QWORD *)v2 + 41) = v11;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 41));
    RCSharedLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "shortOperationDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1A1FB5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created", buf, 0xCu);

    }
  }
  return (RCOperation *)v2;
}

- (void)dealloc
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("an operation should never be deallocated while it is still executing"));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedGroup, 0);
  objc_storeStrong((id *)&self->_startOnce, 0);
  objc_storeStrong((id *)&self->_childOperationsLock, 0);
  objc_storeStrong((id *)&self->_childOperations, 0);
  objc_storeStrong(&self->_timedOutTest, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCOperation;
  -[RCOperation cancel](&v3, sel_cancel);
  -[RCOperation cancelChildOperations](self, "cancelChildOperations");
}

- (BOOL)validateOperation
{
  return 1;
}

- (void)performOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_handleThrottlingFromError:(id)a3 delay:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_handleThrottlingFromError_delay__onceToken != -1)
    dispatch_once(&_handleThrottlingFromError_delay__onceToken, &__block_literal_global_80);
  -[RCOperation throttleGroup](self, "throttleGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCOperation _handleThrottlingFromError:delay:].cold.1();
  RCSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCOperation throttleGroup](self, "throttleGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2048;
    v17 = a4;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start throttling requests from group %@ for %.2f seconds due to error %{public}@", buf, 0x2Au);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__RCOperation__handleThrottlingFromError_delay___block_invoke_84;
  v11[3] = &unk_1E470DF58;
  v11[4] = self;
  *(double *)&v11[5] = a4;
  objc_msgSend((id)_handleThrottlingFromError_delay__s_throttleLock, "performWithLockSync:", v11);

}

void __48__RCOperation__handleThrottlingFromError_delay___block_invoke()
{
  RCMutexLock *v0;
  void *v1;

  v0 = objc_alloc_init(RCMutexLock);
  v1 = (void *)_handleThrottlingFromError_delay__s_throttleLock;
  _handleThrottlingFromError_delay__s_throttleLock = (uint64_t)v0;

}

void __48__RCOperation__handleThrottlingFromError_delay___block_invoke_84(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_userDefaultsKeyForThrottleEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || objc_msgSend(v4, "rc_isLaterThan:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_userDefaultsKeyForThrottleEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

  }
}

- (void)_handleRetryFromError:(id)a3 signal:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[RCOperation setRetryCount:](self, "setRetryCount:", -[RCOperation retryCount](self, "retryCount") + 1);
  RCSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v17 = v9;
    v18 = 2048;
    v19 = -[RCOperation retryCount](self, "retryCount");
    v20 = 2048;
    v21 = -[RCOperation maxRetries](self, "maxRetries");
    v22 = 2114;
    v23 = v7;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform retry %lu of %lu after %{public}@ due to error: %{public}@", buf, 0x34u);

  }
  RCDispatchQueueForQualityOfService(-[RCOperation qualityOfService](self, "qualityOfService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__RCOperation__handleRetryFromError_signal___block_invoke;
  v13[3] = &unk_1E470DFA0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v11, "onQueue:signal:", v10, v13);

}

uint64_t __44__RCOperation__handleRetryFromError_signal___block_invoke(uint64_t a1, int a2)
{
  if (!a2 || (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_finishOperationWithError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "resetForRetry");
  return objc_msgSend(*(id *)(a1 + 32), "performOperation");
}

- (void)finishFromEarlyCancellation
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  -[RCOperation _errorUserInfo](self, "_errorUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_errorWithCode:description:additionalUserInfo:", 1, CFSTR("The operation was cancelled."), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCOperation _finishOperationWithError:](self, "_finishOperationWithError:", v4);

}

- (void)associateChildOperations:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  RCOperation *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[RCOperation childOperationsLock](self, "childOperationsLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__RCOperation_associateChildOperations___block_invoke;
    v6[3] = &unk_1E470DE50;
    v7 = v4;
    v8 = self;
    objc_msgSend(v5, "performWithLockSync:", v6);

  }
}

void __40__RCOperation_associateChildOperations___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_associateChildOperation:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)cancelChildOperations
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  -[RCOperation childOperationsLock](self, "childOperationsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__RCOperation_cancelChildOperations__block_invoke;
  v4[3] = &unk_1E470DFC8;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(v3, "performWithLockSync:", v4);

  objc_msgSend((id)v6[5], "makeObjectsPerformSelector:", sel_cancel);
  _Block_object_dispose(&v5, 8);

}

void __36__RCOperation_cancelChildOperations__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "childOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "setChildOperationsCancelled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "childOperations");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (unint64_t)maxRetries
{
  return 0;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  return 0;
}

- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4
{
  return 0;
}

- (id)_userDefaultsKeyForThrottleEndDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[RCOperation throttleGroup](self, "throttleGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RCOperationThrottling:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *group;

  if (a3)
  {
    v4 = a3;
    -[RCOperation finishedGroup](self, "finishedGroup");
    group = objc_claimAutoreleasedReturnValue();
    RCDispatchQueueForQualityOfService(-[RCOperation qualityOfService](self, "qualityOfService"));
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(group, v5, v4);

  }
}

- (BOOL)hasOperationStarted
{
  void *v2;
  char v3;

  -[RCOperation startOnce](self, "startOnce");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBeenTriggered");

  return v3;
}

- (id)_errorUserInfo
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("RCErrorOperationClassNameKey");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = CFSTR("RCErrorOperationIDKey");
  -[RCOperation operationID](self, "operationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setTimedOutTest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setChildOperationsCancelled:(BOOL)a3
{
  self->_childOperationsCancelled = a3;
}

- (void)setChildOperationsLock:(id)a3
{
  objc_storeStrong((id *)&self->_childOperationsLock, a3);
}

- (void)setStartOnce:(id)a3
{
  objc_storeStrong((id *)&self->_startOnce, a3);
}

- (void)setFinishedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_finishedGroup, a3);
}

- (void)_handleThrottlingFromError:delay:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("a throttled operation must be part of a throttle group"));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_finishOperationWithError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("operation must only be finished once"));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

@end
