@implementation PLCloudInMemoryTaskManager

- (PLCloudInMemoryTaskManager)init
{
  PLCloudInMemoryTaskManager *v2;
  PLCloudInMemoryTaskManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *resourceIDsToDownloadTasks;
  NSMutableDictionary *v6;
  NSMutableDictionary *taskIDsToDownloadTasks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLCloudInMemoryTaskManager;
  v2 = -[PLCloudInMemoryTaskManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resourceIDsToDownloadTasks = v3->_resourceIDsToDownloadTasks;
    v3->_resourceIDsToDownloadTasks = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskIDsToDownloadTasks = v3->_taskIDsToDownloadTasks;
    v3->_taskIDsToDownloadTasks = v6;

  }
  return v3;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary copy](self->_taskIDsToDownloadTasks, "copy");
  -[NSMutableDictionary removeAllObjects](self->_resourceIDsToDownloadTasks, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_taskIDsToDownloadTasks, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_94032);

}

- (BOOL)addClientHandlerAndCreateTaskIfNecessaryForResource:(id)a3 taskIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PLCloudInMemoryDownloadTask *v11;
  PLCloudInMemoryDownloadTask *v12;
  PLCloudInMemoryDownloadTask *v13;

  v8 = a5;
  v9 = a4;
  -[PLCloudInMemoryTaskManager _identifierForResource:](self, "_identifierForResource:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_resourceIDsToDownloadTasks, "objectForKeyedSubscript:", v10);
  v11 = (PLCloudInMemoryDownloadTask *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    -[PLCloudInMemoryDownloadTask addClientWithTaskID:completionHandler:](v11, "addClientWithTaskID:completionHandler:", v9, v8);
    v13 = v12;
  }
  else
  {
    v13 = -[PLCloudInMemoryDownloadTask initWithResourceID:taskID:completionHandler:]([PLCloudInMemoryDownloadTask alloc], "initWithResourceID:taskID:completionHandler:", v10, v9, v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resourceIDsToDownloadTasks, "setObject:forKeyedSubscript:", v13, v10);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taskIDsToDownloadTasks, "setObject:forKeyedSubscript:", v13, v9);

  os_unfair_lock_unlock(&self->_lock);
  return v12 == 0;
}

- (void)setTransferTask:(id)a3 forResource:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  -[PLCloudInMemoryTaskManager _identifierForResource:](self, "_identifierForResource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_resourceIDsToDownloadTasks, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v15 = CFSTR("resourceID");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, CFSTR("Attempting to set a transfer task for CPL download for a resource that is not tracked"), v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  objc_msgSend(v9, "setTransferTask:", v14);

}

- (void)cancelTaskWithTaskIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskIDsToDownloadTasks, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "cancelClientWithTaskID:", v5);

}

- (void)reportCompletionForResource:(id)a3 withData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PLCloudInMemoryTaskManager _identifierForResource:](self, "_identifierForResource:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_resourceIDsToDownloadTasks, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_resourceIDsToDownloadTasks, "removeObjectForKey:", v10);
  objc_msgSend(v11, "taskIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NSMutableDictionary removeObjectForKey:](self->_taskIDsToDownloadTasks, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v11, "reportCompletionWithData:error:", v8, v9);

}

- (id)_identifierForResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "itemScopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "resourceType");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%lu"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIDsToDownloadTasks, 0);
  objc_storeStrong((id *)&self->_resourceIDsToDownloadTasks, 0);
}

uint64_t __35__PLCloudInMemoryTaskManager_reset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancelClientWithTaskID:", a2);
}

@end
