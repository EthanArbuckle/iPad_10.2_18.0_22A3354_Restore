@implementation _PBFGalleryEnqueuedPushToProactiveRequest

- (_PBFGalleryEnqueuedPushToProactiveRequest)initWithUpdatedDescriptors:(id)a3 reason:(id)a4 sessionId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PBFGalleryEnqueuedPushToProactiveRequest *v11;
  uint64_t v12;
  NSUUID *sessionId;
  uint64_t v14;
  NSDictionary *updatedDescriptors;
  uint64_t v16;
  NSString *reason;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PBFGalleryEnqueuedPushToProactiveRequest;
  v11 = -[_PBFGalleryEnqueuedPushToProactiveRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    sessionId = v11->_sessionId;
    v11->_sessionId = (NSUUID *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v8, 1);
    updatedDescriptors = v11->_updatedDescriptors;
    v11->_updatedDescriptors = (NSDictionary *)v14;

    v16 = objc_msgSend(v9, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v16;

  }
  return v11;
}

- (void)addCompletionHandlersFromEnqueuedPushToProactive:(id)a3
{
  _PBFGalleryEnqueuedPushToProactiveRequest *v5;
  _PBFGalleryEnqueuedPushToProactiveRequest *v6;
  id *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (_PBFGalleryEnqueuedPushToProactiveRequest *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("enqueuedPush"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFGalleryEnqueuedPushToProactiveRequest addCompletionHandlersFromEnqueuedPushToProactive:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBADC780);
  }
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7[1];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          -[_PBFGalleryEnqueuedPushToProactiveRequest addCompletionHandler:](self, "addCompletionHandler:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }

}

- (void)addCompletionHandler:(id)a3
{
  void (**v4)(id, BOOL, NSError *);
  _PBFGalleryEnqueuedPushToProactiveRequest *v5;
  NSMutableArray *completionHandlers;
  uint64_t v7;
  NSMutableArray *v8;
  void *v9;
  void (**v10)(id, BOOL, NSError *);

  v4 = (void (**)(id, BOOL, NSError *))a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (v5->_finalized)
    {
      v10[2](v10, v5->_finalizedResult, v5->_finalizedError);
    }
    else
    {
      completionHandlers = v5->_completionHandlers;
      if (!completionHandlers)
      {
        v7 = objc_opt_new();
        v8 = v5->_completionHandlers;
        v5->_completionHandlers = (NSMutableArray *)v7;

        completionHandlers = v5->_completionHandlers;
      }
      v9 = (void *)objc_msgSend(v10, "copy");
      -[NSMutableArray addObject:](completionHandlers, "addObject:", v9);

    }
    objc_sync_exit(v5);

    v4 = v10;
  }

}

- (void)fireCompletionHandlersWithError:(id)a3 didUpdate:(BOOL)a4
{
  _BOOL8 v4;
  _PBFGalleryEnqueuedPushToProactiveRequest *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v4 = a4;
  v11 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_finalized)
  {
    v7->_finalizedResult = v4;
    objc_storeStrong((id *)&v7->_finalizedError, a3);
    v8 = (void *)-[NSMutableArray mutableCopy](v7->_completionHandlers, "mutableCopy");
    -[NSMutableArray removeAllObjects](v7->_completionHandlers, "removeAllObjects");
    while (objc_msgSend(v8, "count"))
    {
      v9 = (void *)MEMORY[0x1D17A3580]();
      objc_msgSend(v8, "firstObject");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _BOOL8, id))v10)[2](v10, v4, v11);
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

      objc_autoreleasePoolPop(v9);
    }
    v7->_finalized = 1;

  }
  objc_sync_exit(v7);

}

- (NSDictionary)updatedDescriptors
{
  return self->_updatedDescriptors;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_updatedDescriptors, 0);
  objc_storeStrong((id *)&self->_finalizedError, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

- (void)addCompletionHandlersFromEnqueuedPushToProactive:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
