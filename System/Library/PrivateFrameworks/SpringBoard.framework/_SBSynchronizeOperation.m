@implementation _SBSynchronizeOperation

- (_SBSynchronizeOperation)init
{
  _SBSynchronizeOperation *v2;
  dispatch_group_t v3;
  OS_dispatch_group *operationGroup;
  NSMutableArray *v5;
  NSMutableArray *tasks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SBSynchronizeOperation;
  v2 = -[_SBSynchronizeOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    operationGroup = v2->_operationGroup;
    v2->_operationGroup = (OS_dispatch_group *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tasks = v2->_tasks;
    v2->_tasks = v5;

  }
  return v2;
}

- (void)addTask:(id)a3
{
  NSMutableArray *tasks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[_SBSynchronizeOperation isFinished](self, "isFinished") & 1) != 0
    || -[_SBSynchronizeOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBSynchronizeOperation.m"), 34, CFSTR("Cannot add a task to a synchronize operation that has already completed or is currently executing."));

  }
  tasks = self->_tasks;
  v6 = (void *)MEMORY[0x1D17E5550](v8);
  -[NSMutableArray addObject:](tasks, "addObject:", v6);

}

- (void)main
{
  NSObject *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  BSContinuousMachTimeNow();
  v5 = v4;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_SBSynchronizeOperation name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SynchronizeCloudCriticalData - operation started: %{public}@", buf, 0xCu);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_tasks;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  BSContinuousMachTimeNow();
  v14 = v13;
  SBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[_SBSynchronizeOperation name](self, "name", (_QWORD)v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2048;
    v24 = v14 - v5;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "SynchronizeCloudCriticalData - operation ended: %{public}@ (duration: %fs)", buf, 0x16u);

  }
}

- (NSString)humanReadableDescription
{
  return self->_humanReadableDescription;
}

- (void)setHumanReadableDescription:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_humanReadableDescription, 0);
}

@end
