@implementation PLCloudInMemoryDownloadTask

- (PLCloudInMemoryDownloadTask)initWithResourceID:(id)a3 taskID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLCloudInMemoryDownloadTask *v11;
  uint64_t v12;
  NSString *resourceID;
  uint64_t v14;
  NSMapTable *taskIDsToCompletionHandlers;
  NSMapTable *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PLCloudInMemoryDownloadTask;
  v11 = -[PLCloudInMemoryDownloadTask init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    resourceID = v11->_resourceID;
    v11->_resourceID = (NSString *)v12;

    v11->_lock._os_unfair_lock_opaque = 0;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 0x10000, 4);
    taskIDsToCompletionHandlers = v11->_taskIDsToCompletionHandlers;
    v11->_taskIDsToCompletionHandlers = (NSMapTable *)v14;

    v16 = v11->_taskIDsToCompletionHandlers;
    v17 = (void *)MEMORY[0x19AEC174C](v10);
    -[NSMapTable setObject:forKey:](v16, "setObject:forKey:", v17, v9);

  }
  return v11;
}

- (BOOL)isCompleted
{
  PLCloudInMemoryDownloadTask *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_completed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setTransferTask:(id)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 completed;
  void *v7;
  uint64_t v8;
  NSString *resourceID;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_transferTask)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    resourceID = self->_resourceID;
    v13 = CFSTR("resourceID");
    v14[0] = resourceID;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, CFSTR("An in memory download task should only ever be assigned 1 transfer task"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_storeStrong((id *)&self->_transferTask, a3);
  completed = self->_completed;
  os_unfair_lock_unlock(p_lock);
  if (completed)
    objc_msgSend(v12, "cancelTask");

}

- (CPLResourceTransferTask)transferTask
{
  os_unfair_lock_s *p_lock;
  CPLResourceTransferTask *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_transferTask;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addClientWithTaskID:(id)a3 completionHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  NSMapTable *taskIDsToCompletionHandlers;
  void *v10;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  taskIDsToCompletionHandlers = self->_taskIDsToCompletionHandlers;
  v10 = (void *)MEMORY[0x19AEC174C](v7);

  -[NSMapTable setObject:forKey:](taskIDsToCompletionHandlers, "setObject:forKey:", v10, v8);
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelClientWithTaskID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSUInteger v6;
  CPLResourceTransferTask *v7;
  void *v8;
  void (**v9)(id, id, _QWORD, void *);

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_taskIDsToCompletionHandlers, "objectForKey:", v5);
  v9 = (void (**)(id, id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_taskIDsToCompletionHandlers, "removeObjectForKey:", v5);
  v6 = -[NSMapTable count](self->_taskIDsToCompletionHandlers, "count");
  self->_completed = v6 == 0;
  v7 = self->_transferTask;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0D11370], "operationCancelledError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v5, 0, v8);

  if (!v6)
    -[CPLResourceTransferTask cancelTask](v7, "cancelTask");

}

- (NSArray)taskIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSAllMapTableKeys(self->_taskIDsToCompletionHandlers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)reportCompletionWithData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)-[NSMapTable copy](self->_taskIDsToCompletionHandlers, "copy");
  self->_completed = 1;
  os_unfair_lock_unlock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v8, "keyEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v14);
        v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, id, id))v15)[2](v15, v14, v6, v7);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_transferTask, 0);
  objc_storeStrong((id *)&self->_taskIDsToCompletionHandlers, 0);
}

@end
