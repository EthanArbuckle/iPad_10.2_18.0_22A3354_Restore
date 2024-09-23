@implementation UIKeyboardTaskQueue

- (BOOL)isMainThreadExecutingTask
{
  return self->_executingOnMainThread;
}

- (UIKeyboardTaskQueue)init
{
  UIKeyboardTaskQueue *v2;
  uint64_t v3;
  NSConditionLock *lock;
  NSMutableArray *v5;
  NSMutableArray *tasks;
  NSMutableArray *v7;
  NSMutableArray *deferredTasks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardTaskQueue;
  v2 = -[UIKeyboardTaskQueue init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    lock = v2->_lock;
    v2->_lock = (NSConditionLock *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tasks = v2->_tasks;
    v2->_tasks = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredTasks = v2->_deferredTasks;
    v2->_deferredTasks = v7;

  }
  return v2;
}

- (void)waitUntilAllTasksAreFinished
{
  void *v4;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 608, CFSTR("%s may only be called from the main thread."), "-[UIKeyboardTaskQueue waitUntilAllTasksAreFinished]");

  }
  while (1)
  {
    -[UIKeyboardTaskQueue lockWhenReadyForMainThread](self, "lockWhenReadyForMainThread");
    if (!self->_executionContext
      && !-[NSMutableArray count](self->_tasks, "count")
      && !-[NSMutableArray count](self->_deferredTasks, "count"))
    {
      break;
    }
    if (!-[NSMutableArray count](self->_tasks, "count"))
      -[UIKeyboardTaskQueue promoteDeferredTaskIfIdle](self, "promoteDeferredTaskIfIdle");
    -[UIKeyboardTaskQueue unlock](self, "unlock");
    -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");
  }
  -[UIKeyboardTaskQueue unlock](self, "unlock");
}

- (void)lockWhenReadyForMainThread
{
  NSConditionLock *lock;
  double v4;
  void *v5;
  char v6;
  const char *v7;
  int *v8;
  const char *v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const char *v16;
  int *v17;
  const char *v18;
  id v19;
  void (*v20)(uint64_t, uint64_t, id);
  NSConditionLock *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  __int128 buf;
  void *(*v32)(_QWORD *);
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  lock = self->_lock;
  v4 = 0.05;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.05);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(lock) = -[NSConditionLock lockWhenCondition:beforeDate:](lock, "lockWhenCondition:beforeDate:", 0, v5);

  if ((lock & 1) == 0)
  {
    v6 = 0;
    v7 = "-[UIKeyboardTaskQueue lockWhenReadyForMainThread]";
    v8 = &dword_185066000;
    v9 = "%s execute pending completion block";
    do
    {
      -[UIKeyboardTaskExecutionContext takeOwnershipOfPendingCompletionBlock](self->_executionContext, "takeOwnershipOfPendingCompletionBlock");
      v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        _UIKeyboardTaskQueueLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v7;
          _os_log_impl(v8, v11, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&buf, 0xCu);
        }

        v10[2](v10);
      }
      else if (v4 >= 1.0)
      {
        if ((v6 & 1) == 0)
        {
          _UIKeyboardTaskQueueLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 136315138;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_error_impl(v8, v12, OS_LOG_TYPE_ERROR, "%s timeout waiting for task on queue", (uint8_t *)&buf, 0xCu);
          }

          v13 = getpid();
          -[UIKeyboardTaskQueue activeOriginator](self, "activeOriginator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[UIKeyboardTaskQueue activeOriginator](self, "activeOriginator");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "description");
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v15 = v25;
          }
          else
          {
            v15 = CFSTR("No stack!");
          }
          objc_msgSend(CFSTR("Keyboard queue task timeout detected\n\nLast Exception Backtrace:\n"), "stringByAppendingString:", v15);
          v16 = v9;
          v17 = v8;
          v18 = v7;
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v20 = (void (*)(uint64_t, uint64_t, id))_MergedGlobals_1136;
          v30 = _MergedGlobals_1136;
          if (!_MergedGlobals_1136)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v32 = __getSimulateCrashSymbolLoc_block_invoke_1;
            v33 = &unk_1E16B14C0;
            v34 = &v27;
            __getSimulateCrashSymbolLoc_block_invoke_1(&buf);
            v20 = (void (*)(uint64_t, uint64_t, id))v28[3];
          }
          _Block_object_dispose(&v27, 8);
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL callSimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UIKeyboardTaskQueue.m"), 32, CFSTR("%s"), dlerror());

            __break(1u);
          }
          v20(v13, 256, v19);
          v7 = v18;
          v8 = v17;
          v9 = v16;

          if (v14)
          {

          }
        }
        v6 = 1;
      }
      else
      {
        v4 = 1.0;
      }

      v21 = self->_lock;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = -[NSConditionLock lockWhenCondition:beforeDate:](v21, "lockWhenCondition:beforeDate:", 0, v22);

    }
    while (!(_DWORD)v21);
  }
}

- (id)scheduleTask:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  UIKeyboardScheduledTask *v10;
  void *v12;

  v5 = a5;
  v9 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 695, CFSTR("%s may only be called from the main thread."), "-[UIKeyboardTaskQueue(UIKeyboardScheduledTask) scheduleTask:timeInterval:repeats:]");

  }
  v10 = -[UIKeyboardScheduledTask initWithTaskQueue:timeInterval:repeats:task:]([UIKeyboardScheduledTask alloc], "initWithTaskQueue:timeInterval:repeats:task:", self, v5, v9, a4);

  return v10;
}

- (void)performTaskOnMainThread:(id)a3 waitUntilDone:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  UIKeyboardTaskEntry *v8;
  UIKeyboardTaskEntry *mainThreadContinuation;
  UIKeyboardTaskExecutionContext *executionContext;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a4;
  v7 = a3;
  -[UIKeyboardTaskQueue lock](self, "lock");
  if (!self->_executionContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 494, CFSTR("Received request for main thread, but there is no current keyboard task executing."));

  }
  if (self->_mainThreadContinuation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 495, CFSTR("Received more than one main-thread continuation for the current keyboard task."));

  }
  v8 = -[UIKeyboardTaskEntry initWithTask:]([UIKeyboardTaskEntry alloc], "initWithTask:", v7);
  mainThreadContinuation = self->_mainThreadContinuation;
  self->_mainThreadContinuation = v8;

  -[UIKeyboardTaskQueue unlock](self, "unlock");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  if (v4)
  {
    executionContext = self->_executionContext;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__UIKeyboardTaskQueue_performTaskOnMainThread_waitUntilDone___block_invoke;
    v14[3] = &unk_1E16BB8E0;
    v14[4] = &v15;
    v11 = -[UIKeyboardTaskExecutionContext childWithContinuation:](executionContext, "childWithContinuation:", v14);
  }
  -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");
  if (v4)
  {
    while (*((_BYTE *)v16 + 24))
    {
      -[UIKeyboardTaskQueue lockWhenReadyForMainThread](self, "lockWhenReadyForMainThread");
      -[UIKeyboardTaskQueue unlock](self, "unlock");
      -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");
    }
  }
  _Block_object_dispose(&v15, 8);

}

- (UIKeyboardTaskExecutionContext)executionContext
{
  return self->_executionContext;
}

- (void)addTask:(id)a3
{
  id v4;
  UIKeyboardTaskEntry *v5;

  v4 = a3;
  -[UIKeyboardTaskQueue lock](self, "lock");
  v5 = -[UIKeyboardTaskEntry initWithTask:]([UIKeyboardTaskEntry alloc], "initWithTask:", v4);

  -[NSMutableArray addObject:](self->_tasks, "addObject:", v5);
  -[UIKeyboardTaskQueue unlock](self, "unlock");
  -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");

}

- (void)finishExecution
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKeyboardTaskQueue lock](self, "lock");
  if (!self->_executionContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 467, CFSTR("Received keyboard task completion but there is no current keyboard task."));

  }
  if (self->_mainThreadContinuation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 468, CFSTR("Received keyboard task completion before the task's continuation executed."));

  }
  -[UIKeyboardTaskQueue setExecutionContext:](self, "setExecutionContext:", 0);
  -[UIKeyboardTaskQueue setActiveOriginator:](self, "setActiveOriginator:", 0);
  if (-[NSMutableArray count](self->_tasks, "count"))
  {
    -[UIKeyboardTaskQueue unlock](self, "unlock");
LABEL_8:
    -[UIKeyboardTaskQueue performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_continueExecutionOnMainThread, 0, 0);
    return;
  }
  v4 = -[NSMutableArray count](self->_deferredTasks, "count");
  -[UIKeyboardTaskQueue unlock](self, "unlock");
  if (v4)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("UIKeyboardTaskQueueIsEmptyNotification"), self);

}

- (void)lock
{
  -[NSConditionLock lock](self->_lock, "lock");
}

- (void)continueExecutionOnMainThread
{
  UIKeyboardTaskEntry *mainThreadContinuation;
  UIKeyboardTaskEntry *v4;
  UIKeyboardTaskEntry *v5;
  UIKeyboardTaskExecutionContext *v6;
  void *v7;
  UIKeyboardTaskEntry *v8;
  BOOL executingOnMainThread;
  UIKeyboardTaskExecutionContext *executionContext;
  uint64_t v11;
  UIKeyboardTaskEntry *v12;
  UIKeyboardTaskEntry *v13;

  if (pthread_main_np() != 1)
  {
    -[UIKeyboardTaskQueue performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_continueExecutionOnMainThread, 0, 0);
    return;
  }
  if (-[UIKeyboardTaskQueue tryLockWhenReadyForMainThread](self, "tryLockWhenReadyForMainThread"))
  {
    if (self->_executionContext)
    {
      mainThreadContinuation = self->_mainThreadContinuation;
      if (!mainThreadContinuation)
      {
        v5 = 0;
LABEL_12:
        v13 = v5;
        -[UIKeyboardTaskEntry originatingStack](v5, "originatingStack");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardTaskQueue setActiveOriginator:](self, "setActiveOriginator:", v7);

        -[UIKeyboardTaskQueue unlock](self, "unlock");
        v8 = v13;
        executingOnMainThread = self->_executingOnMainThread;
        self->_executingOnMainThread = 1;
        executionContext = self->_executionContext;
        if (v13)
        {
          -[UIKeyboardTaskEntry execute:](v13, "execute:", executionContext);
        }
        else
        {
          if (executionContext)
            goto LABEL_16;
          v11 = -[NSMutableArray count](self->_deferredTasks, "count");
          v8 = 0;
          if (!v11)
            goto LABEL_16;
          -[UIKeyboardTaskQueue performDeferredTaskIfIdle](self, "performDeferredTaskIfIdle");
        }
        v8 = v13;
LABEL_16:
        self->_executingOnMainThread = executingOnMainThread;

        return;
      }
      v12 = mainThreadContinuation;
      v4 = self->_mainThreadContinuation;
      self->_mainThreadContinuation = 0;

    }
    else
    {
      v5 = (UIKeyboardTaskEntry *)-[NSMutableArray count](self->_tasks, "count");
      if (!v5)
        goto LABEL_12;
      v6 = -[UIKeyboardTaskExecutionContext initWithExecutionQueue:]([UIKeyboardTaskExecutionContext alloc], "initWithExecutionQueue:", self);
      -[UIKeyboardTaskQueue setExecutionContext:](self, "setExecutionContext:", v6);

      -[NSMutableArray objectAtIndex:](self->_tasks, "objectAtIndex:", 0);
      v12 = (UIKeyboardTaskEntry *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_tasks, "removeObjectAtIndex:", 0);
    }
    v5 = v12;
    goto LABEL_12;
  }
}

- (void)unlock
{
  _BOOL8 v2;

  if (self->_executionContext)
    v2 = self->_mainThreadContinuation == 0;
  else
    v2 = 0;
  -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", v2);
}

- (void)setExecutionContext:(id)a3
{
  objc_storeStrong((id *)&self->_executionContext, a3);
}

- (void)setActiveOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_activeOriginator, a3);
}

- (BOOL)tryLockWhenReadyForMainThread
{
  return -[NSConditionLock tryLockWhenCondition:](self->_lock, "tryLockWhenCondition:", 0);
}

- (void)promoteDeferredTaskIfIdle
{
  id v3;

  if (!self->_executionContext)
  {
    if (-[NSMutableArray count](self->_deferredTasks, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_deferredTasks, "objectAtIndex:", 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_tasks, "addObject:", v3);
      -[NSMutableArray removeObjectAtIndex:](self->_deferredTasks, "removeObjectAtIndex:", 0);

    }
  }
}

- (void)addDeferredTask:(id)a3
{
  id v4;
  UIKeyboardTaskEntry *v5;

  v4 = a3;
  -[UIKeyboardTaskQueue lock](self, "lock");
  v5 = -[UIKeyboardTaskEntry initWithTask:]([UIKeyboardTaskEntry alloc], "initWithTask:", v4);

  -[NSMutableArray addObject:](self->_deferredTasks, "addObject:", v5);
  -[UIKeyboardTaskQueue unlock](self, "unlock");
  -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");

}

uint64_t __61__UIKeyboardTaskQueue_performTaskOnMainThread_waitUntilDone___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (void)performDeferredTaskIfIdle
{
  -[UIKeyboardTaskQueue lock](self, "lock");
  -[UIKeyboardTaskQueue promoteDeferredTaskIfIdle](self, "promoteDeferredTaskIfIdle");
  -[UIKeyboardTaskQueue unlock](self, "unlock");
  -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");
}

- (id)addAndReturnTask:(id)a3
{
  id v4;
  UIKeyboardTaskEntry *v5;

  v4 = a3;
  -[UIKeyboardTaskQueue lock](self, "lock");
  v5 = -[UIKeyboardTaskEntry initWithTask:]([UIKeyboardTaskEntry alloc], "initWithTask:", v4);

  -[NSMutableArray addObject:](self->_tasks, "addObject:", v5);
  -[UIKeyboardTaskQueue unlock](self, "unlock");
  -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");
  return v5;
}

- (BOOL)isEmpty
{
  BOOL v3;

  -[UIKeyboardTaskQueue lock](self, "lock");
  v3 = !-[NSMutableArray count](self->_tasks, "count")
    && !-[NSMutableArray count](self->_deferredTasks, "count")
    && self->_executionContext == 0;
  -[UIKeyboardTaskQueue unlock](self, "unlock");
  return v3;
}

- (void)performTask:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 640, CFSTR("%s may only be called from the main thread."), "-[UIKeyboardTaskQueue performTask:]");

  }
  if (-[UIKeyboardTaskQueue isMainThreadExecutingTask](self, "isMainThreadExecutingTask"))
  {
    -[UIKeyboardTaskQueue performTaskOnMainThread:waitUntilDone:](self, "performTaskOnMainThread:waitUntilDone:", v6, 1);
  }
  else
  {
    -[UIKeyboardTaskQueue addTask:](self, "addTask:", v6);
    -[UIKeyboardTaskQueue waitUntilAllTasksAreFinished](self, "waitUntilAllTasksAreFinished");
  }

}

- (void)waitUntilTaskIsFinished:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 654, CFSTR("%s may only be called from the main thread."), "-[UIKeyboardTaskQueue waitUntilTaskIsFinished:]");

  }
  while (1)
  {
    -[UIKeyboardTaskQueue lockWhenReadyForMainThread](self, "lockWhenReadyForMainThread");
    if (!self->_executionContext
      && !-[NSMutableArray containsObject:](self->_tasks, "containsObject:", v6))
    {
      break;
    }
    -[UIKeyboardTaskQueue unlock](self, "unlock");
    -[UIKeyboardTaskQueue continueExecutionOnMainThread](self, "continueExecutionOnMainThread");
  }
  -[UIKeyboardTaskQueue unlock](self, "unlock");

}

- (void)performSingleTask:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 671, CFSTR("%s may only be called from the main thread."), "-[UIKeyboardTaskQueue performSingleTask:]");

  }
  if (-[UIKeyboardTaskQueue isMainThreadExecutingTask](self, "isMainThreadExecutingTask"))
  {
    -[UIKeyboardTaskQueue performTaskOnMainThread:waitUntilDone:](self, "performTaskOnMainThread:waitUntilDone:", v7, 1);
  }
  else
  {
    v5 = -[UIKeyboardTaskQueue addAndReturnTask:](self, "addAndReturnTask:", v7);
    -[UIKeyboardTaskQueue waitUntilTaskIsFinished:](self, "waitUntilTaskIsFinished:", v5);

  }
}

- (NSArray)activeOriginator
{
  return self->_activeOriginator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOriginator, 0);
  objc_storeStrong((id *)&self->_mainThreadContinuation, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_deferredTasks, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
