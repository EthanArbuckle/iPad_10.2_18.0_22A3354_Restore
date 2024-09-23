@implementation PLCloudPendingResourceTask

- (PLCloudPendingResourceTask)initWithProgressBlock:(id)a3 completionHandler:(id)a4 forTaskIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLCloudPendingResourceTask *v11;
  PLCloudPendingResourceTask *v12;
  uint64_t v13;
  NSDate *lastUpdated;
  NSMutableDictionary *v15;
  NSMutableDictionary *taskIdentifierToProgressBlock;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *taskIdentifierToCompletionHandler;
  NSMutableDictionary *v21;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PLCloudPendingResourceTask;
  v11 = -[PLCloudPendingResourceTask init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_completed = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v12->_lastUpdated;
    v12->_lastUpdated = (NSDate *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskIdentifierToProgressBlock = v12->_taskIdentifierToProgressBlock;
    v12->_taskIdentifierToProgressBlock = v15;

    if (v8)
    {
      v17 = v12->_taskIdentifierToProgressBlock;
      v18 = (void *)MEMORY[0x19AEC174C](v8);
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, v10);

    }
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskIdentifierToCompletionHandler = v12->_taskIdentifierToCompletionHandler;
    v12->_taskIdentifierToCompletionHandler = v19;

    if (v9)
    {
      v21 = v12->_taskIdentifierToCompletionHandler;
      v22 = (void *)MEMORY[0x19AEC174C](v9);
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v22, v10);

    }
  }

  return v12;
}

- (void)setTransferTask:(id)a3
{
  objc_storeStrong((id *)&self->_transferTask, a3);
  -[PLCloudPendingResourceTask keepAlive](self, "keepAlive");
}

- (void)keepAlive
{
  NSDate *v3;
  NSDate *lastUpdated;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v3;

}

- (void)addProgressBlock:(id)a3 completionHandler:(id)a4 withTaskIdentifier:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *taskIdentifierToProgressBlock;
  void *v11;
  NSMutableDictionary *taskIdentifierToCompletionHandler;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (v14)
  {
    taskIdentifierToProgressBlock = self->_taskIdentifierToProgressBlock;
    v11 = (void *)MEMORY[0x19AEC174C](v14);
    -[NSMutableDictionary setObject:forKey:](taskIdentifierToProgressBlock, "setObject:forKey:", v11, v9);

  }
  if (v8)
  {
    taskIdentifierToCompletionHandler = self->_taskIdentifierToCompletionHandler;
    v13 = (void *)MEMORY[0x19AEC174C](v8);
    -[NSMutableDictionary setObject:forKey:](taskIdentifierToCompletionHandler, "setObject:forKey:", v13, v9);

  }
}

- (void)reportProgress:(float)a3
{
  NSObject *v5;
  CPLResourceTransferTask *transferTask;
  NSMutableDictionary *taskIdentifierToProgressBlock;
  _QWORD v8[4];
  float v9;
  uint8_t buf[4];
  double v11;
  __int16 v12;
  CPLResourceTransferTask *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      transferTask = self->_transferTask;
      *(_DWORD *)buf = 134218242;
      v11 = a3;
      v12 = 2112;
      v13 = transferTask;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Reporting progress %f for task %@", buf, 0x16u);
    }

  }
  taskIdentifierToProgressBlock = self->_taskIdentifierToProgressBlock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PLCloudPendingResourceTask_reportProgress___block_invoke;
  v8[3] = &__block_descriptor_36_e43_v32__0__NSString_8___v____NSString_f_16_B24l;
  v9 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](taskIdentifierToProgressBlock, "enumerateKeysAndObjectsUsingBlock:", v8);
  -[PLCloudPendingResourceTask keepAlive](self, "keepAlive");
}

- (void)reportCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  CPLResourceTransferTask *transferTask;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *taskIdentifierToCompletionHandler;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  CPLResourceTransferTask *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      transferTask = self->_transferTask;
      *(_DWORD *)buf = 138412290;
      v19 = transferTask;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Task %@ completed", buf, 0xCu);
    }

  }
  if (!self->_completed)
  {
    -[CPLResourceTransferTask resource](self->_transferTask, "resource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "resourceType");

    -[CPLResourceTransferTask resource](self->_transferTask, "resource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    taskIdentifierToCompletionHandler = self->_taskIdentifierToCompletionHandler;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__PLCloudPendingResourceTask_reportCompletionWithError___block_invoke;
    v14[3] = &unk_1E3668008;
    v17 = v8;
    v15 = v11;
    v16 = v4;
    v13 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](taskIdentifierToCompletionHandler, "enumerateKeysAndObjectsUsingBlock:", v14);
    -[NSMutableDictionary removeAllObjects](self->_taskIdentifierToCompletionHandler, "removeAllObjects");
    self->_completed = 1;

  }
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  CPLResourceTransferTask *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CPLResourceTransferTask *transferTask;
  NSObject *v12;
  CPLResourceTransferTask *v13;
  NSObject *v14;
  int v15;
  CPLResourceTransferTask *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (CPLResourceTransferTask *)a3;
  -[NSMutableDictionary objectForKey:](self->_taskIdentifierToCompletionHandler, "objectForKey:", v4);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v5)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Canceling task with taskIdentifier %@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[CPLResourceTransferTask resource](self->_transferTask, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "resourceType");

    objc_msgSend(MEMORY[0x1E0D11370], "operationCancelledError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CPLResourceTransferTask *, uint64_t, _QWORD, void *))v5)[2](v5, v4, v9, 0, v10);

    -[NSMutableDictionary removeObjectForKey:](self->_taskIdentifierToCompletionHandler, "removeObjectForKey:", v4);
  }
  if (!-[NSMutableDictionary count](self->_taskIdentifierToCompletionHandler, "count"))
  {
    transferTask = self->_transferTask;
    if (transferTask)
    {
      if (!*v6)
      {
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = self->_transferTask;
          v15 = 138412290;
          v16 = v13;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Canceling task %@", (uint8_t *)&v15, 0xCu);
        }

        transferTask = self->_transferTask;
      }
      -[CPLResourceTransferTask cancelTask](transferTask, "cancelTask");
      -[PLCloudPendingResourceTask setTransferTask:](self, "setTransferTask:", 0);
      self->_transferTaskRemoved = 1;
    }
    else if (!*v6)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Transfer task not found for %@. Nothing is canceled", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  -[PLCloudPendingResourceTask keepAlive](self, "keepAlive");

}

- (id)taskIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_taskIdentifierToCompletionHandler, "allKeys");
}

- (id)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifierToCompletionHandler, 0);
  objc_storeStrong((id *)&self->_taskIdentifierToProgressBlock, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_transferTask, 0);
}

uint64_t __56__PLCloudPendingResourceTask_reportCompletionWithError___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(a3 + 16))(a3, a2, a1[6], a1[4], a1[5]);
}

uint64_t __45__PLCloudPendingResourceTask_reportProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, float))(a3 + 16))(a3, *(float *)(a1 + 32));
}

@end
