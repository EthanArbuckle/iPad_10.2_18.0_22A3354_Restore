@implementation TRIRunningXPCActivityDescriptor

- (TRIRunningXPCActivityDescriptor)initWithActivity:(id)a3 capabilities:(unint64_t)a4 name:(id)a5
{
  id v10;
  id v11;
  void *v12;
  TRIRunningXPCActivityDescriptor *v13;
  TRIRunningXPCActivityDescriptor *v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id shouldDefer;
  id v21;
  uint64_t v22;
  id completion;
  uint64_t v24;
  OS_os_transaction *txn;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  objc_super v36;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCActivitySupport.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activity"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCActivitySupport.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)TRIRunningXPCActivityDescriptor;
  v13 = -[TRIRunningXPCActivityDescriptor init](&v36, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_activity, a3);
    objc_storeStrong((id *)&v14->_name, a5);
    v14->_capabilities = a4;
    do
      v15 = __ldaxr((unsigned int *)&nextActivityGenerationCount);
    while (__stlxr(v15 + 1, (unsigned int *)&nextActivityGenerationCount));
    v14->_generationCount = v15;
    v16 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke;
    v33[3] = &unk_1E9336070;
    v17 = v10;
    v34 = v17;
    v18 = v12;
    v35 = v18;
    v19 = MEMORY[0x1D8232C48](v33);
    shouldDefer = v14->_shouldDefer;
    v14->_shouldDefer = (id)v19;

    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke_12;
    v30[3] = &unk_1E9330940;
    v31 = v17;
    v21 = v18;
    v32 = v21;
    v22 = MEMORY[0x1D8232C48](v30);
    completion = v14->_completion;
    v14->_completion = (id)v22;

    if (!objc_msgSend(objc_retainAutorelease(v21), "UTF8String"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("TRIXPCActivitySupport.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("txnName"));

    }
    v24 = os_transaction_create();
    txn = v14->_txn;
    v14->_txn = (OS_os_transaction *)v24;

  }
  return v14;
}

BOOL __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke(uint64_t a1)
{
  _BOOL8 should_defer;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer)
  {
    TRILogCategory_Server();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "Deferral requested for activity %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  return should_defer;
}

void __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke_12(uint64_t a1, uint64_t a2)
{
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (a2)
    v5 = 5;
  else
    v5 = 3;
  v6 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), v5);
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      +[TRIXPCActivitySupport nameForActivityState:](TRIXPCActivitySupport, "nameForActivityState:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "XPC activity %{public}@ completion with state %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 40);
    +[TRIXPCActivitySupport nameForActivityState:](TRIXPCActivitySupport, "nameForActivityState:", state);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIXPCActivitySupport nameForActivityState:](TRIXPCActivitySupport, "nameForActivityState:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    v18 = 2114;
    v19 = v13;
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "XPC activity %{public}@ completion: unable to transition state %{public}@ --> %{public}@", (uint8_t *)&v14, 0x20u);

  }
}

- (id)initForImmediateWorkWithCapabilities:(unint64_t)a3
{
  TRIRunningXPCActivityDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  OS_xpc_object *activity;
  id shouldDefer;
  id completion;
  uint64_t v14;
  OS_os_transaction *txn;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TRIRunningXPCActivityDescriptor;
  v5 = -[TRIRunningXPCActivityDescriptor init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.triald.immediate.%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    activity = v5->_activity;
    v5->_activity = 0;

    shouldDefer = v5->_shouldDefer;
    v5->_shouldDefer = &__block_literal_global_30;

    completion = v5->_completion;
    v5->_completion = &__block_literal_global_21;

    v5->_capabilities = a3;
    if (!-[NSString UTF8String](v5->_name, "UTF8String"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("TRIXPCActivitySupport.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("txnName"));

    }
    v14 = os_transaction_create();
    txn = v5->_txn;
    v5->_txn = (OS_os_transaction *)v14;

  }
  return v5;
}

uint64_t __72__TRIRunningXPCActivityDescriptor_initForImmediateWorkWithCapabilities___block_invoke()
{
  return 0;
}

void __72__TRIRunningXPCActivityDescriptor_initForImmediateWorkWithCapabilities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "internal testing activity completing with status %tu", (uint8_t *)&v4, 0xCu);
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@, %llu>"), objc_opt_class(), self->_name, self->_capabilities);
}

- (NSString)name
{
  return self->_name;
}

- (id)shouldDefer
{
  return self->_shouldDefer;
}

- (void)setShouldDefer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (unsigned)generationCount
{
  return self->_generationCount;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_shouldDefer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_txn, 0);
}

@end
