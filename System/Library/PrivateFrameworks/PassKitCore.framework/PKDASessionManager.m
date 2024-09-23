@implementation PKDASessionManager

- (PKDASessionManager)initWithQueue:(id)a3 sessionCreationBlock:(id)a4
{
  id v7;
  id v8;
  PKDASessionManager *v9;
  dispatch_group_t v10;
  OS_dispatch_group *dispatchGroup;
  NSMutableArray *v12;
  NSMutableArray *workItems;
  void *v14;
  id sessionCreationBlock;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKDASessionManager;
  v9 = -[PKDASessionManager init](&v17, sel_init);
  if (v9)
  {
    v10 = dispatch_group_create();
    dispatchGroup = v9->_dispatchGroup;
    v9->_dispatchGroup = (OS_dispatch_group *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    workItems = v9->_workItems;
    v9->_workItems = v12;

    v14 = _Block_copy(v8);
    sessionCreationBlock = v9->_sessionCreationBlock;
    v9->_sessionCreationBlock = v14;

  }
  return v9;
}

- (void)performBlockWithSession:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PKDASessionManager_performBlockWithSession___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__PKDASessionManager_performBlockWithSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if ((v2 || (objc_msgSend(*(id *)(a1 + 32), "createSession"), (v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24)) != 0))
    && objc_msgSend(v2, "state") != 2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v4 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v3, "addObject:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __46__PKDASessionManager_performBlockWithSession___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)createSession
{
  PKDASession *v3;
  PKDASession *session;
  PKDASession *v5;
  NSObject *v6;
  NSObject *dispatchGroup;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  PKDASession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  (*((void (**)(void))self->_sessionCreationBlock + 2))();
  v3 = (PKDASession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v3;

  v5 = self->_session;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Starting session: %@", buf, 0xCu);
    }

    dispatchGroup = self->_dispatchGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PKDASessionManager_createSession__block_invoke;
    block[3] = &unk_1E2ABE120;
    block[4] = self;
    dispatch_group_notify(dispatchGroup, queue, block);
  }
}

uint64_t __35__PKDASessionManager_createSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Ending session: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "endSession");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p; session: %@ >"),
                       objc_opt_class(),
                       self,
                       self->_session);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  PKDASessionManager *v11;
  unint64_t v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKDASessionManager_session_didChangeState___block_invoke;
  block[3] = &unk_1E2AC5810;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __45__PKDASessionManager_session_didChangeState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Session state changed: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "state");
  if (v4 == result)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6 == 3)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 24);
      *(_QWORD *)(v12 + 24) = 0;

      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count");
      if (result)
      {
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Restarting credential management session", buf, 2u);
        }

        return objc_msgSend(*(id *)(a1 + 40), "createSession");
      }
    }
    else if (v6 == 2)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))();
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeAllObjects");
    }
  }
  return result;
}

void __45__PKDASessionManager_session_didChangeState___block_invoke_11(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_sessionCreationBlock, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end
