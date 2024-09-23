@implementation MTCoalescableWorkController

+ (id)controllerWithQosClass:(unsigned int)a3 identifier:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;

  v6 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "_uniqueGenericIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v9, v10);

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWorkQueue:identifier:", v11, v8);
  return v12;
}

- (MTCoalescableWorkController)initWithWorkQueue:(id)a3 identifier:(id)a4
{
  dispatch_queue_t v6;
  id v7;
  MTCoalescableWorkController *v8;
  MTCoalescableWorkController *v9;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  objc_super v14;

  v6 = (dispatch_queue_t)a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_uniqueGenericIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
    if (v6)
      goto LABEL_3;
  }
  v12 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(v12, v13);

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)MTCoalescableWorkController;
  v8 = -[MTCoalescableWorkController init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, v7);
    objc_storeStrong((id *)&v9->_workQueue, v6);
  }

  return v9;
}

uint64_t __71__MTCoalescableWorkController__syncScheduleStartActiveWork_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkQueuePerformActiveWorkBlock");
}

- (void)schedule:(id)a3 completion:(id)a4
{
  id v6;
  MTCoalescableWorkController *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[MTCoalescableWorkController activeWorkManifest](v7, "activeWorkManifest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[MTCoalescableWorkController _syncScheduleUpdatePendingWork:completion:](v7, "_syncScheduleUpdatePendingWork:completion:", v9, v6);
    else
      -[MTCoalescableWorkController _syncScheduleStartActiveWork:completion:](v7, "_syncScheduleStartActiveWork:completion:", v9, v6);
    objc_sync_exit(v7);

  }
}

- (void)_syncScheduleStartActiveWork:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MTCoalescableWorkManifest *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  MTCoalescableWorkController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (-[MTCoalescableWorkController verboseDebugLoggingEnabled](self, "verboseDebugLoggingEnabled"))
  {
    _MTLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] schedule; setting active manifest; will run block. [ctl=%@]",
        buf,
        0xCu);
    }

  }
  v9 = -[MTCoalescableWorkManifest initWithWorkBlock:completion:]([MTCoalescableWorkManifest alloc], "initWithWorkBlock:completion:", v7, v6);

  -[MTCoalescableWorkController setActiveWorkManifest:](self, "setActiveWorkManifest:", v9);
  -[MTCoalescableWorkController workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MTCoalescableWorkController__syncScheduleStartActiveWork_completion___block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)_onWorkQueuePerformActiveWorkBlock
{
  MTCoalescableWorkController *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void (**v6)(void);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MTCoalescableWorkController *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  MTCoalescableWorkController *v16;
  NSObject *v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  MTCoalescableWorkController *v24;
  __int16 v25;
  MTCoalescableWorkController *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[MTCoalescableWorkController activeWorkManifest](v2, "activeWorkManifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (v3)
  {
    v4 = (void *)MEMORY[0x1AF4138F4]();
    if (-[MTCoalescableWorkController verboseDebugLoggingEnabled](v2, "verboseDebugLoggingEnabled"))
    {
      _MTLogCategoryDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v2;
        _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] performing work. [ctl=%@]", buf, 0xCu);
      }

    }
    objc_msgSend(v3, "workBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    if (-[MTCoalescableWorkController verboseDebugLoggingEnabled](v2, "verboseDebugLoggingEnabled"))
    {
      _MTLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v2;
        _os_log_impl(&dword_1A904E000, v7, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] firing completions. [ctl=%@]", buf, 0xCu);
      }

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "completions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11++) + 16))();
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v9);
    }

    objc_autoreleasePoolPop(v4);
    v12 = v2;
    objc_sync_enter(v12);
    -[MTCoalescableWorkController pendingWorkManifest](v12, "pendingWorkManifest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoalescableWorkController setActiveWorkManifest:](v12, "setActiveWorkManifest:", v13);

    -[MTCoalescableWorkController setPendingWorkManifest:](v12, "setPendingWorkManifest:", 0);
    -[MTCoalescableWorkController activeWorkManifest](v12, "activeWorkManifest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MTCoalescableWorkController verboseDebugLoggingEnabled](v12, "verboseDebugLoggingEnabled"))
    {
      _MTLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[MTCoalescableWorkController activeWorkManifest](v12, "activeWorkManifest");
        v16 = (MTCoalescableWorkController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v16;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1A904E000, v15, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] clearing active manifest, newActive = %@. [ctl=%@]", buf, 0x16u);

      }
    }
    objc_sync_exit(v12);

    if (v14)
    {
      -[MTCoalescableWorkController workQueue](v12, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__MTCoalescableWorkController__onWorkQueuePerformActiveWorkBlock__block_invoke;
      block[3] = &unk_1E54D0DE0;
      block[4] = v12;
      dispatch_async(v17, block);

    }
  }

}

- (BOOL)verboseDebugLoggingEnabled
{
  return self->_verboseDebugLoggingEnabled;
}

- (MTCoalescableWorkManifest)activeWorkManifest
{
  return self->_activeWorkManifest;
}

- (void)setActiveWorkManifest:(id)a3
{
  objc_storeStrong((id *)&self->_activeWorkManifest, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setPendingWorkManifest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingWorkManifest, a3);
}

- (MTCoalescableWorkManifest)pendingWorkManifest
{
  return self->_pendingWorkManifest;
}

- (void)schedule:(id)a3
{
  -[MTCoalescableWorkController schedule:completion:](self, "schedule:completion:", a3, &__block_literal_global_0);
}

- (id)description
{
  MTCoalescableWorkController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = v2;
  v10.super_class = (Class)MTCoalescableWorkController;
  -[MTCoalescableWorkController description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoalescableWorkController identifier](v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoalescableWorkController activeWorkManifest](v2, "activeWorkManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoalescableWorkController pendingWorkManifest](v2, "pendingWorkManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: id = %@, active = %@, pending = %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v8;
}

+ (id)_uniqueGenericIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_syncScheduleUpdatePendingWork:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  MTCoalescableWorkController *v12;
  MTCoalescableWorkManifest *v13;
  NSObject *v14;
  MTCoalescableWorkManifest *v15;
  int v16;
  MTCoalescableWorkController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[MTCoalescableWorkController pendingWorkManifest](self, "pendingWorkManifest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTCoalescableWorkController verboseDebugLoggingEnabled](self, "verboseDebugLoggingEnabled");
  if (v8)
  {
    if (v9)
    {
      _MTLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] schedule; replacing pending manifest. [ctl=%@]",
          (uint8_t *)&v16,
          0xCu);
      }

    }
    _MTLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MTCoalescableWorkController identifier](self, "identifier");
      v12 = (MTCoalescableWorkController *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWorkController] %@ dropped and replaced work-block with newer item", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(v8, "manifestByReplacingWorkBlock:appendingCompletion:", v7, v6);
    v13 = (MTCoalescableWorkManifest *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      _MTLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_1A904E000, v14, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] schedule; creating pending manifest. [ctl=%@]",
          (uint8_t *)&v16,
          0xCu);
      }

    }
    v13 = -[MTCoalescableWorkManifest initWithWorkBlock:completion:]([MTCoalescableWorkManifest alloc], "initWithWorkBlock:completion:", v7, v6);
  }
  v15 = v13;

  -[MTCoalescableWorkController setPendingWorkManifest:](self, "setPendingWorkManifest:", v15);
}

uint64_t __65__MTCoalescableWorkController__onWorkQueuePerformActiveWorkBlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkQueuePerformActiveWorkBlock");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setVerboseDebugLoggingEnabled:(BOOL)a3
{
  self->_verboseDebugLoggingEnabled = a3;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWorkManifest, 0);
  objc_storeStrong((id *)&self->_activeWorkManifest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
