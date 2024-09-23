@implementation PLTimedDispatchGroup

- (PLTimedDispatchGroup)initWithQueue:(id)a3 name:(id)a4
{
  return -[PLTimedDispatchGroup initWithQueue:name:defaultTimeout:](self, "initWithQueue:name:defaultTimeout:", a3, a4, 0.0);
}

- (PLTimedDispatchGroup)initWithQueue:(id)a3 name:(id)a4 defaultTimeout:(double)a5
{
  id v9;
  id v10;
  PLTimedDispatchGroup *v11;
  dispatch_group_t v12;
  OS_dispatch_group *group;
  NSMutableArray *v14;
  NSMutableArray *lock_sessions;
  uint64_t v16;
  NSString *name;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PLTimedDispatchGroup;
  v11 = -[PLTimedDispatchGroup init](&v19, sel_init);
  if (v11)
  {
    v12 = dispatch_group_create();
    group = v11->_group;
    v11->_group = (OS_dispatch_group *)v12;

    objc_storeStrong((id *)&v11->_queue, a3);
    v11->_lock._os_unfair_lock_opaque = 0;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lock_sessions = v11->_lock_sessions;
    v11->_lock_sessions = v14;

    v16 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v16;

    v11->_defaultTimeout = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)enterWithName:(id)a3
{
  return -[PLTimedDispatchGroup enterWithTimeout:name:](self, "enterWithTimeout:name:", a3, self->_defaultTimeout);
}

- (id)enterWithTimeout:(double)a3 name:(id)a4
{
  id v6;
  PLTimedDispatchGroupEnterSession *v7;
  PLTimedDispatchGroupEnterSession *v8;
  PLTimedDispatchGroupEnterSession *v10;

  v6 = a4;
  v7 = -[PLTimedDispatchGroupEnterSession initWithGroup:queue:timeout:name:]([PLTimedDispatchGroupEnterSession alloc], "initWithGroup:queue:timeout:name:", self->_group, self->_queue, v6, a3);

  -[PLTimedDispatchGroupEnterSession enter](v7, "enter");
  v10 = v7;
  PLSafeRunWithUnfairLock();
  v8 = v10;

  return v8;
}

- (id)defaultPreferredResult
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  PLTimedDispatchGroup *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __46__PLTimedDispatchGroup_defaultPreferredResult__block_invoke;
  v25 = &unk_1E3670AD8;
  v26 = self;
  PLSafeResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (!v3)
    goto LABEL_20;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v9, "didTimeout"))
      {
        if (!v6)
        {
          objc_msgSend(v9, "result");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v9, "result");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isFailure");

        if (v11)
          v12 = v5 == 0;
        else
          v12 = 0;
        if (v12)
        {
          objc_msgSend(v9, "result");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  }
  while (v4);
  v13 = v5;
  if (v5 || (v13 = v6) != 0)
  {
    v14 = v13;
  }
  else
  {
LABEL_20:
    v15 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "successWithResult:", v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v6 = 0;
  }

  return v14;
}

- (void)notify:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupNotify:queue:block:", self->_group, self->_queue, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock_sessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

id __46__PLTimedDispatchGroup_defaultPreferredResult__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __46__PLTimedDispatchGroup_enterWithTimeout_name___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

@end
