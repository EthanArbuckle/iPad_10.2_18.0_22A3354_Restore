@implementation PLSearchIndexingAccessManager

- (PLSearchIndexingAccessManager)initWithQueue:(id)a3 openBlock:(id)a4 closeBlock:(id)a5 deferCloseSeconds:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PLSearchIndexingAccessManager *v14;
  PLSearchIndexingAccessManager *v15;
  uint64_t v16;
  id openBlock;
  uint64_t v18;
  id closeBlock;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLSearchIndexingAccessManager;
  v14 = -[PLSearchIndexingAccessManager init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    v16 = objc_msgSend(v12, "copy");
    openBlock = v15->_openBlock;
    v15->_openBlock = (id)v16;

    v18 = objc_msgSend(v13, "copy");
    closeBlock = v15->_closeBlock;
    v15->_closeBlock = (id)v18;

    v15->_deferCloseSeconds = a6;
    objc_storeStrong((id *)&v15->_queue, a3);
  }

  return v15;
}

- (void)addUser
{
  PLRunWithUnfairLock();
}

- (void)removeUser
{
  uint64_t v3;
  void *v4;
  int v5;
  dispatch_time_t v6;
  NSObject *queue;
  _QWORD block[4];
  id v9;
  id location[6];

  v3 = MEMORY[0x1E0C809B0];
  location[1] = (id)MEMORY[0x1E0C809B0];
  location[2] = (id)3221225472;
  location[3] = __43__PLSearchIndexingAccessManager_removeUser__block_invoke;
  location[4] = &unk_1E3670AD8;
  location[5] = self;
  PLResultWithUnfairLock();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_initWeak(location, self);
    v6 = dispatch_time(0, 1000000000 * self->_deferCloseSeconds);
    queue = self->_queue;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43__PLSearchIndexingAccessManager_removeUser__block_invoke_2;
    block[3] = &unk_1E3677D48;
    objc_copyWeak(&v9, location);
    dispatch_after(v6, queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
}

- (void)reset
{
  PLRunWithUnfairLock();
}

- (void)_closeIfZeroUsers
{
  PLRunWithUnfairLock();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closeBlock, 0);
  objc_storeStrong(&self->_openBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __50__PLSearchIndexingAccessManager__closeIfZeroUsers__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 40))
  {
    if (*(_BYTE *)(v1 + 56))
    {
      *(_BYTE *)(v1 + 56) = 0;
      return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 16))();
    }
  }
  return result;
}

void __38__PLSearchIndexingAccessManager_reset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[16];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Access manager reset user count to 0", v4, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 56))
  {
    *(_BYTE *)(v3 + 56) = 0;
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
  }
}

id __43__PLSearchIndexingAccessManager_removeUser__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  if (v2)
  {
    *(_QWORD *)(v1 + 40) = v2 - 1;
    PLSearchBackendIndexingEngineGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v9 = 134217984;
      v10 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Access manager removed user, current user count: %lu", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSearchBackendIndexingEngineGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Access manager unable to remove user, user count already at 0", (uint8_t *)&v9, 2u);
    }

    v6 = (void *)MEMORY[0x1E0C9AAA0];
  }
  return v6;
}

void __43__PLSearchIndexingAccessManager_removeUser__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_closeIfZeroUsers");

}

void __40__PLSearchIndexingAccessManager_addUser__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Access manager added user, current user count: %lu", (uint8_t *)&v5, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 40) == 1 && !*(_BYTE *)(v4 + 56))
  {
    *(_BYTE *)(v4 + 56) = 1;
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  }
}

@end
