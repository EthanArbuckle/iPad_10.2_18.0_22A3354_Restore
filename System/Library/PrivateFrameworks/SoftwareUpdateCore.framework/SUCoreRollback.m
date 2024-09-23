@implementation SUCoreRollback

- (SUCoreRollback)init
{
  SUCoreRollback *v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *stateQueue;
  SUCoreRollbackDescriptor *v7;
  SUCoreRollbackDescriptor *rollback;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUCoreRollback;
  v2 = -[SUCoreRollback init](&v10, sel_init);
  if (v2)
  {
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.su.core.rollback.statequeue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create(v3, v4);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(SUCoreRollbackDescriptor);
    rollback = v2->_rollback;
    v2->_rollback = v7;

    -[SUCoreRollback loadPersistedStateFile](v2, "loadPersistedStateFile");
  }
  return v2;
}

- (SUCoreRollbackDescriptor)eligibleRollback
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SUCoreRollback_eligibleRollback__block_invoke;
  v6[3] = &unk_1EA877ED0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCoreRollbackDescriptor *)v4;
}

void __34__SUCoreRollback_eligibleRollback__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "rollbackEligible"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)loadPersistedStateFile
{
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, a1, a3, "Failed to create filePath. Creating filePath with filename set to bundleIdentifier", a5, a6, a7, a8, 0);
}

void __40__SUCoreRollback_loadPersistedStateFile__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadPersistedState") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "oslog");
    v2 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __40__SUCoreRollback_loadPersistedStateFile__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (id)previousRollback
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SUCoreRollback_previousRollback__block_invoke;
  v6[3] = &unk_1EA877F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__SUCoreRollback_previousRollback__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureCodedObjectForKey:ofClass:encodeClasses:", CFSTR("previousRollback"), v3, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)rollbackCompleted
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SUCoreRollback_rollbackCompleted__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __35__SUCoreRollback_rollbackCompleted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("previousRollback"), 1);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreRollback rollback](self, "rollback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("rollback:%@"), v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRollback)initWithCoder:(id)a3
{
  id v4;
  SUCoreRollback *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SUCoreRollback);

  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rollback"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollback setRollback:](v5, "setRollback:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreRollback rollback](self, "rollback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rollback"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SUCoreRollback *v4;
  void *v5;

  v4 = -[SUCoreRollback init](+[SUCoreRollback allocWithZone:](SUCoreRollback, "allocWithZone:", a3), "init");
  -[SUCoreRollback rollback](self, "rollback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRollback setRollback:](v4, "setRollback:", v5);

  return v4;
}

- (SUCoreRollbackDescriptor)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
  objc_storeStrong((id *)&self->_rollback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

void __40__SUCoreRollback_loadPersistedStateFile__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, a1, a3, "Failed loading persisted state", a5, a6, a7, a8, 0);
}

@end
